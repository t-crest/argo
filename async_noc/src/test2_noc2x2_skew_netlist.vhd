-- 
-- Copyright Technical University of Denmark. All rights reserved.
-- This file is part of the T-CREST project.
-- 
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
-- 
--    1. Redistributions of source code must retain the above copyright notice,
--	 this list of conditions and the following disclaimer.
-- 
--    2. Redistributions in binary form must reproduce the above copyright
--	 notice, this list of conditions and the following disclaimer in the
--	 documentation and/or other materials provided with the distribution.
-- 
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER ``AS IS'' AND ANY EXPRESS
-- OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
-- OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN
-- NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY
-- DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
-- LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
-- THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-- 
-- The views and conclusions contained in the software and documentation are
-- those of the authors and should not be interpreted as representing official
-- policies, either expressed or implied, of the copyright holder.
-- 


--------------------------------------------------------------------------------
-- Testbench for a 2x2 TDM NoC, with 8 slot period and 4 DMAs,
-- with the following configuration:
-- all-to-all communication
-- all nodes
-- DMA0:  Channel1: north
-- DMA1:  Channel2: east
-- DMA2:  Channel3: east -> north
--
-- SCHEDULE
-- 0:DMA0
-- 1:DMA1
-- 2:DMA2
-- 3:invalid
-- 4:DMA0
-- 5:DMA1
-- 6:DMA2
-- 7:invalid
--
-- Author: Evangelia Kasapaki
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use std.textio.all;
use work.txt_util.all;
use work.cmd_util.all;
use work.config.all;
use work.noc_defs.all;
use work.ocp.all;
use work.noc_interface.all;


entity test2_noc2x2 is
end test2_noc2x2;


architecture behav of test2_noc2x2 is

-----------------------component declarations------------------------------
  component noc is
    port (
      --p_clk		: in std_logic;
      n_clk_0	 : in std_logic;
      n_clk_skd	 : in std_logic;
      reset	 : in std_logic;
      reset_sk_e : in std_logic;
      reset_sk_l : in std_logic;

      p_ports_in  : in	procMasters;
      p_ports_out : out procSlaves;

      spm_ports_in  : in  spmSlaves;
      spm_ports_out : out spmMasters

      );
  end component;


  component bram_tdp is

    generic (
      DATA : integer := 32;
      ADDR : integer := 14
      );

    port (
-- Port A
      a_clk  : in  std_logic;
      a_wr   : in  std_logic;
      a_addr : in  std_logic_vector(ADDR-1 downto 0);
      a_din  : in  std_logic_vector(DATA-1 downto 0);
      a_dout : out std_logic_vector(DATA-1 downto 0);

-- Port B
      b_clk  : in  std_logic;
      b_wr   : in  std_logic;
      b_addr : in  std_logic_vector(ADDR-1 downto 0);
      b_din  : in  std_logic_vector(DATA-1 downto 0);
      b_dout : out std_logic_vector(DATA-1 downto 0)
      );
  end component;

-------------------------signal declarations-------------------------------
  type skew_route is record
    p_clock : std_logic;
    n_clock : std_logic;
    reset   : std_logic;
  end record;
  type skew_route_a is array (N-1 downto 0) of skew_route;
  type skew_route_nodes is array (N-1 downto 0) of skew_route_a;

  signal skew_early, no_skew, skew_late : skew_route;
  signal skew_nodes			: skew_route_nodes;

  signal n_clk			       : std_logic := '1';
  signal p_clk			       : std_logic := '1';
  signal n_clk_sk_e		       : std_logic := '1';
  signal n_clk_sk_l		       : std_logic := '1';
  signal p_clk_sk_e		       : std_logic := '1';
  signal p_clk_sk_l		       : std_logic := '1';
  signal reset, reset_sk_e, reset_sk_l : std_logic := '1';

  signal p_masters     : procMasters;
  signal p_slaves      : procSlaves;
  signal p_spm_masters : spmMasters;
  signal P_spm_slaves  : spmSlaves;
  signal n_spm_masters : spmMasters;
  signal n_spm_slaves  : spmSlaves;

  signal p_masters_flat	    : std_logic_vector(N*N*OCP_MASTER_WIDTH - 1 downto 0);
  signal p_slaves_flat	    : std_logic_vector(N*N*OCP_SLAVE_WIDTH - 1 downto 0);
  signal n_spm_slaves_flat  : std_logic_vector(N*N*SPM_SLAVE_WIDTH - 1 downto 0);
  signal n_spm_masters_flat : std_logic_vector(N*N*SPM_MASTER_WIDTH - 1 downto 0);

  constant SCHED_FILE : string (23 downto 1) := "../sim/all_to_all.sched";
  file schedule0      : text open read_mode is SCHED_FILE;
  file schedule1      : text open read_mode is SCHED_FILE;
  file schedule2      : text open read_mode is SCHED_FILE;
  file schedule3      : text open read_mode is SCHED_FILE;

  constant SPM_INIT_SIZE : integer := 4;

begin

  -----------------------------------------------------------------------------
  -- configure skew mapping here
  -----------------------------------------------------------------------------

  skew_nodes(0)(0) <= skew_early;
  skew_nodes(0)(1) <= skew_late;
  skew_nodes(1)(0) <= no_skew;
  skew_nodes(1)(1) <= no_skew;

  spm_m : for i in N-1 downto 0 generate
    spm_n : for j in N-1 downto 0 generate
      spm_h : bram_tdp
	generic map (DATA => DATA_WIDTH, ADDR => SPM_ADDR_WIDTH)
	port map (a_clk	 => skew_nodes(i)(j).p_clock,
		  a_wr	 => p_spm_masters(i)(j).MCmd(0),
		  a_addr => p_spm_masters(i)(j).MAddr(SPM_ADDR_WIDTH-1 downto 0),
		  a_din	 => p_spm_masters(i)(j).MData(63 downto 32),
		  a_dout => p_spm_slaves(i)(j).SData(63 downto 32),
		  b_clk	 => skew_nodes(i)(j).n_clock,
		  b_wr	 => n_spm_masters(i)(j).MCmd(0),
		  b_addr => n_spm_masters(i)(j).MAddr(SPM_ADDR_WIDTH-1 downto 0),
		  b_din	 => n_spm_masters(i)(j).MData(63 downto 32),
		  b_dout => n_spm_slaves(i)(j).SData(63 downto 32));

      -- Low SPM instance
      spm_l : bram_tdp
	generic map (DATA => DATA_WIDTH, ADDR => SPM_ADDR_WIDTH)
	port map (a_clk	 => skew_nodes(i)(j).p_clock,
		  a_wr	 => p_spm_masters(i)(j).MCmd(0),
		  a_addr => p_spm_masters(i)(j).MAddr(SPM_ADDR_WIDTH-1 downto 0),
		  a_din	 => p_spm_masters(i)(j).MData(31 downto 0),
		  a_dout => p_spm_slaves(i)(j).SData(31 downto 0),
		  b_clk	 => skew_nodes(i)(j).n_clock,
		  b_wr	 => n_spm_masters(i)(j).MCmd(0),
		  b_addr => n_spm_masters(i)(j).MAddr(SPM_ADDR_WIDTH-1 downto 0),
		  b_din	 => n_spm_masters(i)(j).MData(31 downto 0),
		  b_dout => n_spm_slaves(i)(j).SData(31 downto 0));
    end generate spm_n;
  end generate spm_m;

  flat_m : for i in N-1 downto 0 generate
    flat_n : for j in N-1 downto 0 generate
      -- flatten
      p_masters_flat((i * N + j + 1) * OCP_MASTER_WIDTH - 1 downto (i * N + j) * OCP_MASTER_WIDTH)  <= ocp_master_to_std_logic_vector(p_masters(i)(j));
      n_spm_slaves_flat((i * N + j + 1) * SPM_SLAVE_WIDTH - 1 downto (i * N + j) * SPM_SLAVE_WIDTH) <= spm_slave_to_std_logic_vector(n_spm_slaves(i)(j));

      -- unflatten
      p_slaves(i)(j)	  <= std_logic_vector_to_ocp_slave(p_slaves_flat((i * N + j + 1) * OCP_SLAVE_WIDTH - 1 downto (i * N + j) * OCP_SLAVE_WIDTH));
      n_spm_masters(i)(j) <= std_logic_vector_to_spm_master(n_spm_masters_flat((i * N + j + 1) * SPM_MASTER_WIDTH - 1 downto (i * N + j) * SPM_MASTER_WIDTH));
    end generate flat_n;
  end generate flat_m;

  noc2x2 : entity work.noc (MODULE)
    port map (
      n_clk_0 => skew_nodes(0)(0).n_clock,
      n_clk_1 => skew_nodes(0)(1).n_clock,
      n_clk_2 => skew_nodes(1)(0).n_clock,
      n_clk_3 => skew_nodes(1)(1).n_clock,

      reset_0 => skew_nodes(0)(0).reset,
      reset_1 => skew_nodes(0)(1).reset,
      reset_2 => skew_nodes(1)(0).reset,
      reset_3 => skew_nodes(1)(1).reset,

      p_ports_in  => p_masters_flat,
      p_ports_out => p_slaves_flat,

      spm_ports_in  => n_spm_slaves_flat,
      spm_ports_out => n_spm_masters_flat
      );



--na clock 
  na_clk_generate_e : process
  begin
    -- negative SKEW
    while true loop
      wait for (NA_HPERIOD);
      n_clk_sk_e <= not n_clk_sk_e;
    end loop;
  end process;

--na clock 
  na_clk_generate : process
  begin
    wait for SKEW;
    while true loop
      wait for (NA_HPERIOD);
      n_clk <= not n_clk;
    end loop;
  end process;



--na clock 
  na_clk_generate_l : process
  begin
    wait for 2*SKEW;
    while true loop
      wait for (NA_HPERIOD);
      n_clk_sk_l <= not n_clk_sk_l;
    end loop;
  end process;


--proc clock 
  proc_clk_generate_e : process
  begin
    while true loop
      wait for (P_HPERIOD);
      p_clk_sk_e <= not p_clk_sk_e;
    end loop;
  end process;

--proc clock 
  proc_clk_generate : process
  begin
    wait for SKEW;
    while true loop
      wait for (P_HPERIOD);
      p_clk <= not p_clk;
    end loop;
  end process;

--proc clock 
  proc_clk_generate_l : process
  begin
    wait for 2*SKEW;
    while true loop
      wait for (P_HPERIOD);
      p_clk_sk_l <= not p_clk_sk_l;
    end loop;
  end process;

--reset
  rst_generate : process
  begin
    wait for 4*NA_HPERIOD;
    wait for delay;
    reset_sk_e <= '0';
    reset      <= '0' after SKEW;
    reset_sk_l <= '0' after 2*SKEW;
    wait;
  end process;

  skew_early.n_clock <= n_clk_sk_e;
  no_skew.n_clock    <= n_clk;
  skew_late.n_clock  <= n_clk_sk_l;

  skew_early.p_clock <= p_clk_sk_e;
  no_skew.p_clock    <= p_clk;
  skew_late.p_clock  <= p_clk_sk_l;

  skew_early.reset <= reset_sk_e;
  no_skew.reset	   <= reset;
  skew_late.reset  <= reset_sk_l;

  spm_initilize : process

    variable count : natural := 0;

  begin

    for i in 0 to N-1 loop
      for j in 0 to N-1 loop
	p_spm_masters(i)(j).MCmd  <= (others => '0');
	p_spm_masters(i)(j).MAddr <= (others => '0');
	p_spm_masters(i)(j).MData <= (others => '0');
      end loop;
    end loop;


    wait until falling_edge(reset);

    while(count < SPM_INIT_SIZE) loop

      wait until rising_edge(n_clk);
      wait for delay;

      p_spm_masters(0)(0).MCmd	<= "1";
      p_spm_masters(0)(0).MAddr <= std_logic_vector(to_unsigned(count, 16));  --x"00000000";
      p_spm_masters(0)(0).MData <= x"0000000011111111";
      p_spm_masters(0)(1).MCmd	<= "1";
      p_spm_masters(0)(1).MAddr <= std_logic_vector(to_unsigned(count+SPM_INIT_SIZE, 16));  --x"00000002";
      p_spm_masters(0)(1).MData <= x"2222222233333333";
      p_spm_masters(1)(0).MCmd	<= "1";
      p_spm_masters(1)(0).MAddr <= std_logic_vector(to_unsigned(count+2*SPM_INIT_SIZE, 16));  --x"00000004";
      p_spm_masters(1)(0).MData <= x"4444444455555555";
      p_spm_masters(1)(1).MCmd	<= "1";
      p_spm_masters(1)(1).MAddr <= std_logic_vector(to_unsigned(count+3*SPM_INIT_SIZE, 16));  --x"00000006";
      p_spm_masters(1)(1).MData <= x"6666666677777777";

      count := count + 1;

    end loop;

    wait until rising_edge(n_clk);
    --wait until rising_edge(n_clk);
    wait for delay;

    p_spm_masters(0)(0).MCmd  <= "0";
    p_spm_masters(0)(0).MAddr <= (others => '0');
    p_spm_masters(0)(0).MData <= (others => '0');
    p_spm_masters(0)(1).MCmd  <= "0";
    p_spm_masters(0)(1).MAddr <= (others => '0');
    p_spm_masters(0)(1).MData <= (others => '0');
    p_spm_masters(1)(0).MCmd  <= "0";
    p_spm_masters(1)(0).MAddr <= (others => '0');
    p_spm_masters(1)(0).MData <= (others => '0');
    p_spm_masters(1)(1).MCmd  <= "0";
    p_spm_masters(1)(1).MAddr <= (others => '0');
    p_spm_masters(1)(1).MData <= (others => '0');


    wait for 1900 ns;

    wait until rising_edge(n_clk);

    count := 0;
    while(count < 4*SPM_INIT_SIZE) loop

      wait until rising_edge(n_clk);
      wait for delay;

      p_spm_masters(0)(0).MCmd	<= "0";
      p_spm_masters(0)(0).MAddr <= std_logic_vector(to_unsigned(count, 16));  --x"00000000";
      p_spm_masters(0)(1).MCmd	<= "0";
      p_spm_masters(0)(1).MAddr <= std_logic_vector(to_unsigned(count, 16));  --x"00000002";
      p_spm_masters(1)(0).MCmd	<= "0";
      p_spm_masters(1)(0).MAddr <= std_logic_vector(to_unsigned(count, 16));  --x"00000004";
      p_spm_masters(1)(1).MCmd	<= "0";
      p_spm_masters(1)(1).MAddr <= std_logic_vector(to_unsigned(count, 16));  --x"00000006";

      count := count + 1;

    end loop;

    wait;


  end process;


  init_ni0 : process

    variable word    : string (100 downto 1);  --std_logic_vector(15 downto 0) := (others => '0');
    variable cnt     : integer := 0;
    variable slt_num : integer;
    variable l	     : line;
    variable slt     : std_logic_vector(4 downto 0);
    variable route   : std_logic_vector(15 downto 0);

  begin

    p_masters(0)(0).MCmd	<= (others => '0');
    p_masters(0)(0).MAddr	<= (others => '0');
    p_masters(0)(0).MData	<= (others => '0');
    p_masters(0)(0).MByteEn	<= (others => '0');
    p_masters(0)(0).MRespAccept <= '0';


    wait until falling_edge(skew_nodes(0)(0).reset);
    wait for 6*NA_HPERIOD;
    wait for PDELAY;

    if not endfile(schedule0) then

      loop
	str_read(schedule0, word);
	exit when word(100 downto 96) = "# NI0" or endfile(schedule0);
      end loop;

      report "NI==========>" & word(100 downto 96) severity note;

      loop
	str_read(schedule0, word);
	exit when word(100 downto 89) = "# SLOT_TABLE" or endfile(schedule0);
      end loop;

      report "ST==========>" & word(100 downto 89) severity note;

      readline(schedule0, l);
      read(l, slt_num);
      cnt := 0;
      loop
	readline(schedule0, l);
	read(l, slt);
	--st_write
	--print str(slt);
	st_write(p_masters(0)(0),
		 p_slaves(0)(0),
		 std_logic_vector(to_unsigned(cnt*4, OCP_ADDR_WIDTH-ADDR_MASK_W)),
		 slt, skew_nodes(0)(0).p_clock);
	cnt := cnt + 1;
	exit when cnt = slt_num or endfile(schedule0);
      end loop;

      loop
	str_read(schedule0, word);
	exit when word(100 downto 88) = "# ROUTE_TABLE" or endfile(schedule0);
      end loop;
      report "RT==========>" & word(100 downto 88) severity note;

      cnt := 0;
      loop
	readline(schedule0, l);
	read(l, route);
	--rt_write
	--report str(route);
	route_write (p_masters(0)(0),
		     p_slaves(0)(0),
		     std_logic_vector(to_unsigned(cnt*4, OCP_ADDR_WIDTH-ADDR_MASK_W)),
		     route, skew_nodes(0)(0).p_clock);
	cnt := cnt + 1;
	exit when cnt = N*N or endfile(schedule0);
      end loop;

      --DMA 1
      dma_write (p_masters(0)(0), p_slaves(0)(0),
		 x"00000c", x"00000000",  skew_nodes(0)(0).p_clock);
      --DMA 2
      dma_write (p_masters(0)(0), p_slaves(0)(0),
		 x"000014", x"00000000",  skew_nodes(0)(0).p_clock);
      --DMA 3
      dma_write (p_masters(0)(0), p_slaves(0)(0),
		 x"00001c", x"00000000",  skew_nodes(0)(0).p_clock);

      --enable and start
      --DMA 1
      dma_write (p_masters(0)(0), p_slaves(0)(0),
		 x"000008", x"00008004",  skew_nodes(0)(0).p_clock);
      --DMA 2
      dma_write (p_masters(0)(0), p_slaves(0)(0),
		 x"000010", x"00008004",  skew_nodes(0)(0).p_clock);
      --DMA 3
      dma_write (p_masters(0)(0), p_slaves(0)(0),
		 x"000018", x"00008004",  skew_nodes(0)(0).p_clock);

      -- DMA 1 read for testing
      dma_read (p_masters(0)(0), p_slaves(0)(0),
		x"000008",  skew_nodes(0)(0).p_clock);
    end if;
    
  end process;


  init_ni1 : process

    variable word    : string (100 downto 1);  --std_logic_vector(15 downto 0) := (others => '0');
    variable cnt     : integer := 0;
    variable slt_num : integer;
    variable l	     : line;
    variable slt     : std_logic_vector(4 downto 0);
    variable route   : std_logic_vector(15 downto 0);

  begin

    p_masters(0)(1).MCmd	<= (others => '0');
    p_masters(0)(1).MAddr	<= (others => '0');
    p_masters(0)(1).MData	<= (others => '0');
    p_masters(0)(1).MByteEn	<= (others => '0');
    p_masters(0)(1).MRespAccept <= '0';

    wait until falling_edge( skew_nodes(0)(1).reset);
    wait for 6*NA_HPERIOD;
    wait for 3 ns;

    if not endfile(schedule1) then

      loop
	str_read(schedule1, word);
	exit when word(100 downto 96) = "# NI1" or endfile(schedule1);
      end loop;

      report "NI==========>" & word(100 downto 96) severity note;

      loop
	str_read(schedule1, word);
	exit when word(100 downto 89) = "# SLOT_TABLE" or endfile(schedule1);
      end loop;


      report "ST==========>" & word(100 downto 89) severity note;

      readline(schedule1, l);
      read(l, slt_num);
      cnt := 0;
      loop
	readline(schedule1, l);
	read(l, slt);
	--st_write
	--print str(slt);
	st_write(p_masters(0)(1),
		 p_slaves(0)(1),
		 std_logic_vector(to_unsigned(cnt*4, OCP_ADDR_WIDTH-ADDR_MASK_W)),
		 slt,  skew_nodes(0)(1).p_clock);
	cnt := cnt + 1;
	exit when cnt = slt_num or endfile(schedule1);
      end loop;

      loop
	str_read(schedule1, word);
	exit when word(100 downto 88) = "# ROUTE_TABLE" or endfile(schedule0);
      end loop;
      report "RT==========>" & word(100 downto 88) severity note;

      cnt := 0;
      loop
	readline(schedule1, l);
	read(l, route);
	--rt_write
	--print str(route);
	route_write (p_masters(0)(1),
		     p_slaves(0)(1),
		     std_logic_vector(to_unsigned(cnt*4, OCP_ADDR_WIDTH-ADDR_MASK_W)),
		     route,  skew_nodes(0)(1).p_clock);
	cnt := cnt + 1;
	exit when cnt = N*N or endfile(schedule1);
      end loop;

      --DMA 0
      dma_write (p_masters(0)(1), p_slaves(0)(1),
		 x"000004", x"00040004",  skew_nodes(0)(1).p_clock);
      --DMA 2
      dma_write (p_masters(0)(1), p_slaves(0)(1),
		 x"000014", x"00040004",  skew_nodes(0)(1).p_clock);
      --DMA 3
      dma_write (p_masters(0)(1), p_slaves(0)(1),
		 x"00001c", x"00040004",  skew_nodes(0)(1).p_clock);

      --enable and start
      --DMA 0
      dma_write (p_masters(0)(1), p_slaves(0)(1),
		 x"000000", x"00008004",  skew_nodes(0)(1).p_clock);
      --DMA 2
      dma_write (p_masters(0)(1), p_slaves(0)(1),
		 x"000010", x"00008004",  skew_nodes(0)(1).p_clock);
      --DMA 3
      dma_write (p_masters(0)(1), p_slaves(0)(1),
		 x"000018", x"00008004",  skew_nodes(0)(1).p_clock);		
    end if;
    
  end process;




  init_ni2 : process

    variable word    : string (100 downto 1);  --std_logic_vector(15 downto 0) := (others => '0');
    variable cnt     : integer := 0;
    variable slt_num : integer;
    variable l	     : line;
    variable slt     : std_logic_vector(4 downto 0);
    variable route   : std_logic_vector(15 downto 0);

  begin

    p_masters(1)(0).MCmd	<= (others => '0');
    p_masters(1)(0).MAddr	<= (others => '0');
    p_masters(1)(0).MData	<= (others => '0');
    p_masters(1)(0).MByteEn	<= (others => '0');
    p_masters(1)(0).MRespAccept <= '0';

    wait until falling_edge( skew_nodes(1)(0).reset);
    wait for 6*NA_HPERIOD;
    wait for 3 ns;

    if not endfile(schedule2) then

      loop
	str_read(schedule2, word);
	exit when word(100 downto 96) = "# NI2" or endfile(schedule2);
      end loop;

      report "NI==========>" & word(100 downto 96) severity note;

      loop
	str_read(schedule2, word);
	exit when word(100 downto 89) = "# SLOT_TABLE" or endfile(schedule2);
      end loop;


      report "ST==========>" & word(100 downto 89) severity note;

      readline(schedule2, l);
      read(l, slt_num);
      cnt := 0;
      loop
	readline(schedule2, l);
	read(l, slt);
	--st_write
	--print str(slt);
	st_write(p_masters(1)(0),
		 p_slaves(1)(0),
		 std_logic_vector(to_unsigned(cnt*4, OCP_ADDR_WIDTH-ADDR_MASK_W)),
		 slt,  skew_nodes(1)(0).p_clock);
	cnt := cnt + 1;
	exit when cnt = slt_num or endfile(schedule2);
      end loop;

      loop
	str_read(schedule2, word);
	exit when word(100 downto 88) = "# ROUTE_TABLE" or endfile(schedule0);
      end loop;
      report "RT==========>" & word(100 downto 88) severity note;

      cnt := 0;
      loop
	readline(schedule2, l);
	read(l, route);
	--rt_write
	--print str(route);
	route_write (p_masters(1)(0),
		     p_slaves(1)(0),
		     std_logic_vector(to_unsigned(cnt*4, OCP_ADDR_WIDTH-ADDR_MASK_W)),
		     route,  skew_nodes(1)(0).p_clock);
	cnt := cnt + 1;
	exit when cnt = N*N or endfile(schedule2);
      end loop;

      --DMA 0
      dma_write (p_masters(1)(0), p_slaves(1)(0),
		 x"000004", x"00080008",  skew_nodes(1)(0).p_clock);
      --DMA 1
      dma_write (p_masters(1)(0), p_slaves(1)(0),
		 x"00000c", x"00080008",  skew_nodes(1)(0).p_clock);
      --DMA 3
      dma_write (p_masters(1)(0), p_slaves(1)(0),
		 x"00001c", x"00080008",  skew_nodes(1)(0).p_clock);

      --enable and start
      --DMA 0
      dma_write (p_masters(1)(0), p_slaves(1)(0),
		 x"000000", x"00008004",  skew_nodes(1)(0).p_clock);
      --DMA 1
      dma_write (p_masters(1)(0), p_slaves(1)(0),
		 x"000008", x"00008004",  skew_nodes(1)(0).p_clock);
      --DMA 3
      dma_write (p_masters(1)(0), p_slaves(1)(0),
		 x"000018", x"00008004",  skew_nodes(1)(0).p_clock);

    end if;
    
  end process;




  init_ni3 : process

    variable word    : string (100 downto 1);  --std_logic_vector(15 downto 0) := (others => '0');
    variable cnt     : integer := 0;
    variable l	     : line;
    variable slt_num : integer;
    variable slt     : std_logic_vector(4 downto 0);
    variable route   : std_logic_vector(15 downto 0);

  begin
    p_masters(1)(1).MCmd	<= (others => '0');
    p_masters(1)(1).MAddr	<= (others => '0');
    p_masters(1)(1).MData	<= (others => '0');
    p_masters(1)(1).MByteEn	<= (others => '0');
    p_masters(1)(1).MRespAccept <= '0';

    wait until falling_edge( skew_nodes(1)(1).reset);
    wait for 6*NA_HPERIOD;
    wait for 3 ns;

    if not endfile(schedule3) then

      loop
	str_read(schedule3, word);
	exit when word(100 downto 96) = "# NI3" or endfile(schedule3);
      end loop;

      report "NI==========>" & word(100 downto 96) severity note;

      loop
	str_read(schedule3, word);
	exit when word(100 downto 89) = "# SLOT_TABLE" or endfile(schedule3);
      end loop;


      report "ST==========>" & word(100 downto 89) severity note;

      readline(schedule3, l);
      read(l, slt_num);
      cnt := 0;
      loop
	readline(schedule3, l);
	read(l, slt);
	--st_write
	--print str(slt);
	st_write(p_masters(1)(1),
		 p_slaves(1)(1),
		 std_logic_vector(to_unsigned(cnt*4, OCP_ADDR_WIDTH-ADDR_MASK_W)),
		 slt,  skew_nodes(1)(1).p_clock);
	cnt := cnt + 1;
	exit when cnt = slt_num or endfile(schedule3);
      end loop;

      loop
	str_read(schedule3, word);
	exit when word(100 downto 88) = "# ROUTE_TABLE" or endfile(schedule0);
      end loop;
      report "RT==========>" & word(100 downto 88) severity note;

      cnt := 0;
      loop
	readline(schedule3, l);
	read(l, route);
	--rt_write
	--print str(route);
	route_write (p_masters(1)(1),
		     p_slaves(1)(1),
		     std_logic_vector(to_unsigned(cnt*4, OCP_ADDR_WIDTH-ADDR_MASK_W)),
		     route,  skew_nodes(1)(1).p_clock);
	cnt := cnt + 1;
	exit when cnt = N*N or endfile(schedule3);
      end loop;

      --DMA 0
      dma_write (p_masters(1)(1), p_slaves(1)(1),
		 x"000004", x"000c000c",  skew_nodes(1)(1).p_clock);
      --DMA 1
      dma_write (p_masters(1)(1), p_slaves(1)(1),
		 x"00000c", x"000c000c",  skew_nodes(1)(1).p_clock);
      --DMA 2
      dma_write (p_masters(1)(1), p_slaves(1)(1),
		 x"000014", x"000c000c",  skew_nodes(1)(1).p_clock);

      --enable and start
      --DMA 0
      dma_write (p_masters(1)(1), p_slaves(1)(1),
		 x"000000", x"00008004",  skew_nodes(1)(1).p_clock);
      --DMA 1
      dma_write (p_masters(1)(1), p_slaves(1)(1),
		 x"000008", x"00008004",  skew_nodes(1)(1).p_clock);
      --DMA 2
      dma_write (p_masters(1)(1), p_slaves(1)(1),
		 x"000010", x"00008004",  skew_nodes(1)(1).p_clock);

    end if;
  end process;



end behav;
