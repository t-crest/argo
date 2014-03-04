
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
-- traffic generator intended as sub-hierarchical test bench
--
-- this code provides stimuli to the network during simulation and is supposed
-- to be instanciated from within the tile to be tested.
-- Author: Christoph Mueller
-- (partially copied from the old testbenches by Evangelia)
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use ieee.math_real.all;
use std.textio.all;
use work.txt_util.all;
use work.cmd_util.all;
use work.config.all;
use work.ocp.all;
use work.noc_interface.all;
use work.tile_package.all;
use work.traffic_generator_package.all;
use work.noc_defs.all;

entity traffic_generator is
  
  port (
    clk, reset : in  std_logic;	 -- clock & asynchronous high active reset
    spm_master : out spm_master;
    spm_slave  : in  spm_slave;
    p_master   : out ocp_io_m;
    p_slave    : in  ocp_io_s;
    settings   : in  tile_settings
    );

end traffic_generator;


architecture behav of traffic_generator is

  -- configuration files
  file schedule : text open read_mode is TG_SCHEDULE_FILE;
  file data	: text open read_mode is TG_SPM_INIT_FILE;
  file dma	: text open read_mode is TG_DMA_INIT_FILE;

  -- signals to synchronize the init processes
  signal SPM_INITIALIZED : std_logic := '0';
  signal NI_INITIALIZED	 : std_logic := '0';
  signal DMA_INITIALIZED : std_logic := '0';

  signal slt_length    : integer;
  signal SPM_INIT_SIZE : integer;

  
begin  -- behav

  -----------------------------------------------------------------------------
  -- process to initialize the route & slot table as well as the DMA
  -----------------------------------------------------------------------------
  init_ni : process

    variable word    : string (100 downto 1);  --std_logic_vector(15 downto 0) := (others => '0');
    variable cnt     : integer := 0;
    variable slt_num : integer;
    variable l	     : line;
    variable slt     : std_logic_vector(4 downto 0);
    variable route   : std_logic_vector(15 downto 0);

    variable node_id : integer;

    variable addr_field : std_logic_vector(31 downto 0);
    variable dma_id	: integer;
    variable dma_array : std_logic_vector(0 to 15) := (others => '0');
    
  begin
    
    p_master.MCmd	 <= (others => '0');
    p_master.MAddr	 <= (others => '0');
    p_master.MData	 <= (others => '0');
    p_master.MByteEn	 <= (others => '0');
    p_master.MRespAccept <= '0';

    wait until falling_edge(reset);

    node_id := to_integer(settings.tile_id);

    wait for 6*NA_HPERIOD;

    ---------------------------------------------------------------------------
    -- Program the schedule
    ---------------------------------------------------------------------------
    --report "NI[" & integer'image(node_id) & "]: Hello, your friendly traffic generator is here. " severity note;

    if not endfile(schedule) then
      
      loop
	str_read(schedule, word);

	exit when str_comp(word, ("# NI" & integer'image(node_id))) or endfile(schedule);
      end loop;

      report "NI[" & integer'image(node_id) & "]: Hello, your friendly traffic generator is here. " &
	"(" & traffic_generator'instance_name & ") " severity note;

      loop
	str_read(schedule, word);
	exit when str_comp(word, "# SLOT_TABLE") or endfile(schedule);
      end loop;

      report "NI[" & integer'image(node_id) & "]: ST" & word(100 downto 89) severity note;

      readline(schedule, l);
      read(l, slt_num);
      cnt	 := 0;
      slt_length <= slt_num;
      loop
	readline(schedule, l);
	read(l, slt);
	--st_write
	--print str(slt);
	report "ST write " & integer'image(node_id) & " " & integer'image(cnt) & "/" & integer'image(slt_num) severity note;
	st_write(p_master,
		 p_slave,
		 std_logic_vector(to_unsigned(cnt*4, OCP_ADDR_WIDTH-ADDR_MASK_W)),
		 slt, clk);
	cnt := cnt + 1;
	exit when cnt = slt_num or endfile(schedule);
      end loop;

      loop
	str_read(schedule, word);
	exit when str_comp(word, "# ROUTE_TABLE") or endfile(schedule);
      end loop;
      report "NI[" & integer'image(node_id) &"]: RT" & word(100 downto 88) severity note;

      cnt := 0;
      loop
	readline(schedule, l);
	read(l, route);
	--rt_write
	--report str(route);
	route_write (p_master,
		     p_slave,
		     std_logic_vector(to_unsigned(cnt*4, OCP_ADDR_WIDTH-ADDR_MASK_W)),
		     route, clk);
	cnt := cnt + 1;
	exit when cnt = N*N or endfile(schedule);
      end loop;

      
    end if;
    NI_INITIALIZED <= '1';
    -- make sure all data is copied to the SPM and that the NI is initialized
    wait until (SPM_INITIALIZED = '1');

    ---------------------------------------------------------------------------
    -- Initialize the DMA
    ---------------------------------------------------------------------------
    -- find section in dma file
    if not endfile(dma) then
      loop
	str_read(dma, word);
	exit when str_comp(word, ("# NI" & integer'image(node_id))) or endfile(dma);
      end loop;


      -- iterate over dma setting entries and program dma as needed
      while not endfile(dma) loop
	
	wait until rising_edge(clk);
	wait for delay;
	str_read(dma, word);
	exit when not (word(100) = '@') or endfile(dma);

	dma_id := to_integer(unsigned(strh(word(99 downto 99))));

	-- mark dma as used
	dma_array(dma_id) := '1';

	addr_field := strh(word(97 downto 94)) & strh(word(92 downto 89));

	report "NI[" & integer'image(node_id) & "]: DMA" & word(99) & "# " &
	  word(97 downto 94) & " -> " & word(92 downto 89) &
	  " [0x" & hstr(tg_dma_setup_addr(dma_id)) & ", 0x" & hstr(addr_field) & "]"
	  severity note;

	-- program address
	dma_write (p_master, p_slave, tg_dma_setup_addr(dma_id), addr_field, clk);

      end loop;
    end if;

    for i in dma_array'range loop
      if dma_array(i) = '1' then
	-- enable & start dma
	dma_write (p_master, p_slave, tg_dma_enable_addr(i), x"00008004", clk);
	report "NI[" & integer'image(node_id) & "]: DMA" & integer'image(i) & "# enable " & " [0x" & hstr(tg_dma_enable_addr(i)) & ", 0x00008004]" severity note;
      end if;
    end loop;  -- i



    -- everything done
    report "NI[" & integer'image(node_id) & "]: all set up!" severity note;
    DMA_INITIALIZED <= '1';

    -- lock
    wait;
  end process;


-----------------------------------------------------------------------------
-- process to initialize the SPM
-----------------------------------------------------------------------------
  init_spm : process

    variable count   : natural := 0;
    variable word    : string (100 downto 1);  --std_logic_vector(15 downto 0) := (others => '0');
    variable addr    : integer;
    variable node_id : integer;
    --variable SPM_INIT_SIZE : integer := 0;


  begin

    spm_master.MCmd  <= (others => '0');
    spm_master.MAddr <= (others => '0');
    spm_master.MData <= (others => '0');

    wait until falling_edge(reset);

    node_id := to_integer(settings.tile_id);

    wait until (NI_INITIALIZED = '1');

    -- search for data section
    if not endfile(data) then
      loop
	str_read(data, word);
	exit when str_comp(word, ("# NI" & integer'image(node_id))) or endfile(data);
      end loop;

      count := 0;
      -- program the memory
      while not endfile(data) loop
	wait until rising_edge(clk);
	wait for delay;
	str_read(data, word);
	-- only lines starting with an @ are considered
	exit when not (word(100) = '@') or endfile(data);

	addr := to_integer(unsigned(strh(word(99 downto 96))));

	-- write data
	spm_master.MCmd	 <= "1";
	spm_master.MAddr <= std_logic_vector(to_unsigned(addr, spm_master.MAddr'length));
	spm_master.MData <= strh(word(94 downto 79));

	report "NI[" & integer'image(node_id) & "]: SPM# write @" & hstr(std_logic_vector(to_unsigned(addr, spm_master.MAddr'length))) & ": " & word(94 downto 79) severity note;
	count := count + 1;
      end loop;

      SPM_INIT_SIZE <= count;
    end if;
    wait until rising_edge(clk);
    --wait until rising_edge(clk);
    wait for delay;

    -- disable writing
    spm_master.MCmd  <= "0";
    spm_master.MAddr <= (others => '0');
    spm_master.MData <= (others => '0');

    -- all done, hand over to the DMA setup...
    SPM_INITIALIZED <= '1';
    wait until (DMA_INITIALIZED = '1');

    -- simulate for some time
    count := 0;

    loop
      count := count + 1;
      wait until rising_edge(clk);
      exit when count >= slt_length * 100;  -- slt_length * 3 + 10
    end loop;

    -- read the data from the spm
    wait until rising_edge(clk);

    count := 0;
    wait until rising_edge(clk);
    while(count < (N*M) * SPM_INIT_SIZE) loop
--    while(count < SPM_INIT_SIZE) loop

      
      wait for delay;

      spm_master.MCmd  <= "0";
      spm_master.MAddr <= std_logic_vector(to_unsigned(count, spm_master.MAddr'length));  --x"00000000";
      wait until falling_edge(clk);
      wait for delay;
      report "NI[" & integer'image(node_id) & "]: SPM# read @" & hstr(std_logic_vector(to_unsigned(count, spm_master.MAddr'length))) & ": " & to_upper(hstr(spm_slave.SData)) severity note;
      count	       := count + 1;

    end loop;

    wait;
  end process;


end behav;
