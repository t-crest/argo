-- 
-- Copyright Technical University of Denmark. All rights reserved.
-- This file is part of the T-CREST project.
-- 
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
-- 
--    1. Redistributions of source code must retain the above copyright notice,
--       this list of conditions and the following disclaimer.
-- 
--    2. Redistributions in binary form must reproduce the above copyright
--       notice, this list of conditions and the following disclaimer in the
--       documentation and/or other materials provided with the distribution.
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
-- node (0,0)
-- DMA0:  Channel1: south -> east
-- DMA1:  Channel2: west
--
-- SCHEDULE
-- 0:DMA0
-- 1:DMA1
-- 2:invalid
-- 3:DMA0
-- 4:DMA1
-- 5:DMA0
-- 6:DMA1
-- 7:DMA0
--
-- Author: Evangelia Kasapaki
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.defs.all;


entity test0_noc2x2 is
end test0_noc2x2;


architecture behav of test0_noc2x2 is

-----------------------component declarations------------------------------
component noc is
port (
	p_clk		: in std_logic;
	n_clk		: in std_logic;
	reset		: in std_logic;

	p_ports_in	: in procMasters;
	p_ports_out	: out procSlaves;

	spm_ports_in	: in spmSlaves;
	spm_ports_out	: out spmMasters

);
end component;


component bram_tdp is

generic (
    DATA    : integer := 32;
    ADDR    : integer := 14
);

port (
-- Port A
    a_clk   : in  std_logic;
    a_wr    : in  std_logic;
    a_addr  : in  std_logic_vector(ADDR-1 downto 0);
    a_din   : in  std_logic_vector(DATA-1 downto 0);
    a_dout  : out std_logic_vector(DATA-1 downto 0);
     
-- Port B
    b_clk   : in  std_logic;
    b_wr    : in  std_logic;
    b_addr  : in  std_logic_vector(ADDR-1 downto 0);
    b_din   : in  std_logic_vector(DATA-1 downto 0);
    b_dout  : out std_logic_vector(DATA-1 downto 0)
);
end component;
-------------------------signal declarations-------------------------------
signal n_clk		: std_logic := '1';
signal p_clk		: std_logic := '1';
signal reset		: std_logic := '1';

signal p_masters	: procMasters;
signal p_slaves		: procSlaves;
signal p_spm_masters	: spmMasters;
signal P_spm_slaves	: spmSlaves;
signal n_spm_masters	: spmMasters;
signal n_spm_slaves	: spmSlaves;



begin


	spm_m : for i in N-1 downto 0 generate
		spm_n : for j in N-1 downto 0 generate
			-- High SPM instance
                        spm_h : bram_tdp
                          generic map (DATA=>DATA_WIDTH, ADDR => SPM_ADDR_WIDTH)
                          port map (a_clk => p_clk, 
                                    a_wr => p_spm_masters(i)(j).MCmd(0), 
                                    a_addr => p_spm_masters(i)(j).MAddr(SPM_ADDR_WIDTH-1 downto 0), 
                                    a_din => p_spm_masters(i)(j).MData(63 downto 32), 
                                    a_dout => p_spm_slaves(i)(j).SData(63 downto 32), 
                                    b_clk => n_clk,
                                    b_wr => n_spm_masters(i)(j).MCmd(0), 
                                    b_addr => n_spm_masters(i)(j).MAddr(SPM_ADDR_WIDTH-1 downto 0), 
                                    b_din => n_spm_masters(i)(j).MData(63 downto 32), 
                                    b_dout => n_spm_slaves(i)(j).SData(63 downto 32));

                        -- Low SPM instance
                        spm_l : bram_tdp
                          generic map (DATA => DATA_WIDTH, ADDR => SPM_ADDR_WIDTH)
                          port map (a_clk => p_clk, 
                                    a_wr => p_spm_masters(i)(j).MCmd(0), 
                                    a_addr => p_spm_masters(i)(j).MAddr(SPM_ADDR_WIDTH-1 downto 0), 
                                    a_din => p_spm_masters(i)(j).MData(31 downto 0), 
                                    a_dout => p_spm_slaves(i)(j).SData(31 downto 0), 
                                    b_clk => n_clk,
                                    b_wr => n_spm_masters(i)(j).MCmd(0), 
                                    b_addr => n_spm_masters(i)(j).MAddr(SPM_ADDR_WIDTH-1 downto 0), 
                                    b_din => n_spm_masters(i)(j).MData(31 downto 0), 
                                    b_dout => n_spm_slaves(i)(j).SData(31 downto 0));
                          
                end generate spm_n;
        end generate spm_m;

        
  
noc2x2 : noc
port map (
	p_clk => p_clk,
	n_clk => n_clk,
	reset => reset,

	p_ports_in => p_masters,
	p_ports_out => p_slaves,

	spm_ports_in => n_spm_slaves,
	spm_ports_out => n_spm_masters
);


--na clock 
na_clk: process
begin
	wait for NA_HPERIOD;
	n_clk <= not n_clk;
end process;

--proc clock 
proc_clk: process
begin
	wait for P_HPERIOD;
	p_clk <= not p_clk;
end process;

--reset
rst: process
begin
	wait for 4*NA_HPERIOD;
        wait for delay;
	reset <= '0';
	wait;
end process;

--sim
sim: process
begin


          for i in 0 to N-1 loop
		for j in 0 to N-1 loop
                            p_masters(i)(j).MCmd  <= (others=>'0');
                            p_masters(i)(j).MAddr <= (others=>'0');
                            p_masters(i)(j).MData <= (others=>'0');

                            p_spm_masters(i)(j).MCmd  <= (others=>'0');
                            p_spm_masters(i)(j).MAddr <= (others=>'0');
                            p_spm_masters(i)(j).MData <= (others=>'0');

                end loop;
          end loop;


--initialize spm
--initialize slot table
	wait for 10*NA_HPERIOD; --1
        wait for 3 ns;
	-- ST(0) <= valid DMA0
	p_masters(0)(0).MCmd <="11";
	p_masters(0)(0).MAddr <= ST_MASK & x"000000";
	p_masters(0)(0).MData <= x"00000010";

	p_spm_masters(0)(0).MCmd <="11";
	p_spm_masters(0)(0).MAddr <= (others=>'0');
	p_spm_masters(0)(0).MData <= x"0001000200030004";

	wait for 2*NA_HPERIOD; --2
	-- ST(1) <= valid DMA1
	p_masters(0)(0).MAddr <= ST_MASK & x"000001";
	p_masters(0)(0).MData <= x"00000014";

	p_spm_masters(0)(0).MAddr <= x"00000001";
	p_spm_masters(0)(0).MData <= x"0005000600070008";

	wait for 2*NA_HPERIOD; --3
	-- ST(2) <= invalid
	p_masters(0)(0).MAddr <= ST_MASK & x"000002";
	p_masters(0)(0).MData <= x"00000000";

	p_spm_masters(0)(0).MAddr <= x"00000002";
	p_spm_masters(0)(0).MData <= x"0009000a000b000c";

	wait for 2*NA_HPERIOD; --1
	-- ST(3) <= valid DMA0
	p_masters(0)(0).MAddr <= ST_MASK & x"000003";
	p_masters(0)(0).MData <= x"00000010";

	p_spm_masters(0)(0).MAddr <= x"00000003";
	p_spm_masters(0)(0).MData <= x"000d000e000f0010";

	wait for 2*NA_HPERIOD; --2
	-- ST(4) <= valid DMA1
	p_masters(0)(0).MAddr <= ST_MASK & x"000004";
	p_masters(0)(0).MData <= x"00000014";

	p_spm_masters(0)(0).MAddr <= x"00000004";
	p_spm_masters(0)(0).MData <= x"0011001200130014";

	wait for 2*NA_HPERIOD; --3
	-- ST(5) <= valid DMA0
	p_masters(0)(0).MAddr <= ST_MASK & x"000005";
	p_masters(0)(0).MData <= x"00000010";

	p_spm_masters(0)(0).MAddr <= x"00000005";
	p_spm_masters(0)(0).MData <= x"0015001600170018";

	wait for 2*NA_HPERIOD; --1
	-- ST(6) <= valid DMA1
	p_masters(0)(0).MAddr <= ST_MASK & x"000006";
	p_masters(0)(0).MData <= x"00000014";

	p_spm_masters(0)(0).MAddr <= x"00000006";
	p_spm_masters(0)(0).MData <= x"0019001a001b001c";

	wait for 2*NA_HPERIOD; --2
	-- ST(7) <= valid DMA0
	p_masters(0)(0).MAddr <= ST_MASK & x"000007";
	p_masters(0)(0).MData <= x"00000010";

	p_spm_masters(0)(0).MAddr <= x"00000007";
	p_spm_masters(0)(0).MData <= x"001d001e001f0020";

	wait for 2*NA_HPERIOD; --3
	p_masters(0)(0).MCmd <= (others=>'0');
	p_masters(0)(0).MAddr <= ST_MASK & x"000000";

	p_spm_masters(0)(0).MCmd <= "00";
	p_spm_masters(0)(0).MAddr <= (others=>'0');

--initialize routes
	wait for 2*NA_HPERIOD; --1
	-- DMA0 s->e
	p_masters(0)(0).MCmd <="11";
	p_masters(0)(0).MAddr <= DMA_P_MASK & x"000000";
	p_masters(0)(0).MData <= x"00000036";--x"0000001c";
	
	wait for 2*NA_HPERIOD; --2
	--DMA1 w
	p_masters(0)(0).MAddr <= DMA_P_MASK & x"000001";
	p_masters(0)(0).MData <= x"00000007";--x"0000000d";


	wait for 2*NA_HPERIOD; --3
	p_masters(0)(0).MCmd <= (others=>'0');
	p_masters(0)(0).MAddr <= (others=>'0');

--initialize dmas
	wait for 2*NA_HPERIOD; --1
	--DMA0 rp:0, wp:0
	p_masters(0)(0).MCmd <= "11";
	p_masters(0)(0).MAddr <= DMA_MASK & x"000001";
	p_masters(0)(0).MData <= x"00000000";

	wait for 2*NA_HPERIOD; --2
	--DMA0 valid, cnt:8
	p_masters(0)(0).MAddr <= DMA_MASK & x"000000";
	p_masters(0)(0).MData <= x"00008008";

	wait for 2*NA_HPERIOD; --3
	--DMA
	p_masters(0)(0).MCmd <= (others=>'0');
	p_masters(0)(0).MAddr <= (others=>'0');

	wait for 2*NA_HPERIOD; --1
	--DMA1 rp: 0004, wp:16
	p_masters(0)(0).MCmd <= "11";
	p_masters(0)(0).MAddr <= DMA_MASK & x"000003";
	p_masters(0)(0).MData <= x"00040010";

	wait for 2*NA_HPERIOD; --2
	--DMA1 valid, cnt: 4
	p_masters(0)(0).MAddr <= DMA_MASK & x"000002";
	p_masters(0)(0).MData <= x"00008004";

	wait for 2*NA_HPERIOD; --3
	p_masters(0)(0).MCmd <= (others=>'0');
	p_masters(0)(0).MAddr <= (others=>'0');

	wait for 72*NA_HPERIOD;

-- read transaction from proc in remote spm	
	wait for 2*NA_HPERIOD; --1
	p_spm_masters(1)(1).MCmd <= "00";
	p_spm_masters(1)(1).MAddr <= x"00000000";
	p_spm_masters(0)(1).MAddr <= x"00000007";

	wait for 2*NA_HPERIOD; --2
       	p_spm_masters(0)(0).MAddr <= x"00000001";
	p_spm_masters(1)(1).MAddr <= x"00000001";
	p_spm_masters(0)(1).MAddr <= x"00000008";

	wait for 2*NA_HPERIOD; --3
       	p_spm_masters(0)(0).MAddr <= x"00000002";
	p_spm_masters(1)(1).MAddr <= x"00000002";
	p_spm_masters(0)(1).MAddr <= x"00000009";

	wait for 2*NA_HPERIOD; --1
       	p_spm_masters(0)(0).MAddr <= x"00000003";
	p_spm_masters(1)(1).MAddr <= x"00000003";
	p_spm_masters(0)(1).MAddr <= x"0000000a";

	wait for 2*NA_HPERIOD; --2
       	p_spm_masters(0)(0).MAddr <= x"00000004";
	p_spm_masters(1)(1).MAddr <= x"00000004";
	p_spm_masters(0)(1).MAddr <= x"00000000";




	wait;


end process;

end behav;

