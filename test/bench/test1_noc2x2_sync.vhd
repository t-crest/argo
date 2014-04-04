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
-- DMA0:  Channel1: north
-- DMA1:  Channel2: east
-- DMA2:  Channel3: east -> north
--
-- SCHEDULE
-- 0:DMA0
-- 1:DMA1
-- 2:DMA2
-- 3:DMA0
-- 4:DMA1
-- 5:DMA2
-- 6:DMA0
-- 7:DMA1
--
-- Author: Evangelia Kasapaki
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.config.all;
use work.noc_defs.all;
use work.noc_interface.all;


entity test1_noc2x2 is
end test1_noc2x2;


architecture behav of test1_noc2x2 is

-----------------------component declarations------------------------------
component noc is
port (
	clk		: in std_logic;
	reset		: in std_logic;

	p_ports_in	: in ocp_io_m_a;
	p_ports_out	: out ocp_io_s_a;

	spm_ports_in	: in spm_masters;
	spm_ports_out	: out spm_slaves

);
end component;

-------------------------signal declarations-------------------------------
signal n_clk		: std_logic := '1';
signal p_clk		: std_logic := '1';
signal reset		: std_logic := '1';

signal p_masters	: ocp_io_m_a;
signal p_slaves		: ocp_io_s_a;
signal spm_masters	: spm_masters;
signal spm_slaves	: spm_slaves;

begin

noc2x2 : noc
port map (
	clk => p_clk,
	reset => reset,

	p_ports_in => p_masters,
	p_ports_out => p_slaves,

	spm_ports_in => spm_masters,
	spm_ports_out => spm_slaves
);


--na clock
process
begin
	wait for NA_HPERIOD;
	n_clk <= not n_clk;
end process;

--proc clock
process
begin
	wait for P_HPERIOD;
	p_clk <= not p_clk;
end process;

--reset
process
begin
	wait for 13 ns;
	reset <= '0';
	wait;
end process;

--sim
process begin

--initialization
	for i in 0 to M-1 loop
		for j in 0 to N-1 loop
			p_masters((i*N)+j).MCmd  <= (others=>'0');
			p_masters((i*N)+j).MAddr <= (others=>'0');
			p_masters((i*N)+j).MData <= (others=>'0');
			p_masters((i*N)+j).MRespAccept <= '0';


			spm_masters((i*N)+j).MCmd  <= (others=>'0');
			spm_masters((i*N)+j).MAddr <= (others=>'0');
			spm_masters((i*N)+j).MData <= (others=>'0');
		end loop;
	end loop;

--initialize spm
--initialize slot table
	wait for 43 ns; --1
	-- ST(0) <= valid DMA0
	p_masters(0).MCmd <="001";
	p_masters(0).MAddr <= ST_MASK & x"000000";
	p_masters(0).MData <= x"00000004";

	spm_masters(0).MCmd <="1";
	spm_masters(0).MAddr <= (others=>'0');
	spm_masters(0).MData <= x"0000000011111111";

	wait for 10 ns; --2
	-- ST(1) <= valid DMA1
	p_masters(0).MAddr <= ST_MASK & x"000004";
	p_masters(0).MData <= x"00000005";

	spm_masters(0).MAddr <= x"0001";
	spm_masters(0).MData <= x"2222222233333333";

	wait for 10 ns; --3
	-- ST(2) <= valid DMA2
	p_masters(0).MAddr <= ST_MASK & x"000008";
	p_masters(0).MData <= x"00000006";

	spm_masters(0).MAddr <= x"0002";
	spm_masters(0).MData <= x"4444444455555555";

	wait for 10 ns; --1
	-- ST(3) <= valid DMA0
	p_masters(0).MAddr <= ST_MASK & x"00000c";
	p_masters(0).MData <= x"00000004";

	spm_masters(0).MAddr <= x"0003";
	spm_masters(0).MData <= x"6666666677777777";

	wait for 10 ns; --2
	-- ST(4) <= valid DMA1
	p_masters(0).MAddr <= ST_MASK & x"000010";
	p_masters(0).MData <= x"00000005";

	spm_masters(0).MAddr <= x"0004";
	spm_masters(0).MData <= x"8888888899999999";

	wait for 10 ns; --3
	-- ST(5) <= valid DMA2
	p_masters(0).MAddr <= ST_MASK & x"000014";
	p_masters(0).MData <= x"00000006";

	spm_masters(0).MAddr <= x"0005";
	spm_masters(0).MData <= x"aaaaaaaabbbbbbbb";

	wait for 10 ns; --1
	-- ST(6) <= valid DMA0
	p_masters(0).MAddr <= ST_MASK & x"000018";
	p_masters(0).MData <= x"00000004";

	spm_masters(0).MAddr <= x"0006";
	spm_masters(0).MData <= x"ccccccccdddddddd";

	wait for 10 ns; --2
	-- ST(7) <= valid DMA1
	p_masters(0).MAddr <= ST_MASK & x"00001c";
	p_masters(0).MData <= x"00000005";

	spm_masters(0).MAddr <= x"0007";
	spm_masters(0).MData <= x"eeeeeeeeffffffff";

	wait for 10 ns; --3
	p_masters(0).MCmd <= (others=>'0');
	p_masters(0).MAddr <= ST_MASK & x"000000";

	spm_masters(0).MCmd <= (others=>'0');
	spm_masters(0).MAddr <= (others=>'0');

--initialize routes
	wait for 10 ns; --1
	p_masters(0).MCmd <="001";
	p_masters(0).MAddr <= DMA_P_MASK & x"000000";
	p_masters(0).MData <= x"00000002";

	wait for 10 ns; --2
	p_masters(0).MAddr <= DMA_P_MASK & x"000004";
	p_masters(0).MData <= x"00000007";

	wait for 10 ns; --3 --1 --2
	p_masters(0).MAddr <= DMA_P_MASK & x"000008";
	p_masters(0).MData <= x"0000000b";

	wait for 30 ns; --3
	p_masters(0).MCmd <= (others=>'0');
	p_masters(0).MAddr <= (others=>'0');

--initialize dmas
	wait for 10 ns; --1
	p_masters(0).MCmd <= "001";
	p_masters(0).MAddr <= DMA_MASK & x"000004";
	p_masters(0).MData <= x"00000000";

	wait for 10 ns; --2
	p_masters(0).MAddr <= DMA_MASK & x"000000";
	p_masters(0).MData <= x"00008003";

	wait for 10 ns; --3
	p_masters(0).MCmd <= (others=>'0');
	p_masters(0).MAddr <= (others=>'0');

	wait for 10 ns; --1
	p_masters(0).MCmd <= "001";
	p_masters(0).MAddr <= DMA_MASK & x"00000c";
	p_masters(0).MData <= x"00030003";

	wait for 10 ns; --2
	p_masters(0).MAddr <= DMA_MASK & x"000008";
	p_masters(0).MData <= x"00008003";

	wait for 10 ns; --3
	p_masters(0).MCmd <= (others=>'0');
	p_masters(0).MAddr <= (others=>'0');

	wait for 10 ns; --1
	p_masters(0).MCmd <= "001";
	p_masters(0).MAddr <= DMA_MASK & x"000014";
	p_masters(0).MData <= x"00060006";

	wait for 10 ns; --2
	p_masters(0).MAddr <= DMA_MASK & x"000010";
	p_masters(0).MData <= x"00008002";

	wait for 10 ns; --3
	p_masters(0).MCmd <= (others=>'0');
	p_masters(0).MAddr <= (others=>'0');

-- read transaction from proc in remote spm
	wait for 370 ns; --1
	spm_masters(2).MCmd <= "0";
	spm_masters(2).MAddr <= x"0000";

	spm_masters(1).MCmd <= "0";
	spm_masters(1).MAddr <= x"0003";

	spm_masters(3).MCmd <= "0";
	spm_masters(3).MAddr <= x"0006";

	wait for 10 ns; --2
	spm_masters(2).MAddr <= x"0001";
	spm_masters(1).MAddr <= x"0004";
	spm_masters(3).MAddr <= x"0007";

	wait for 10 ns; --3
	spm_masters(2).MAddr <= x"0002";
	spm_masters(1).MAddr <= x"0005";
	spm_masters(3).MAddr <= x"0008";

	wait for 10 ns; --1
	spm_masters(2).MAddr <= x"0003";
	spm_masters(1).MAddr <= x"0006";
	spm_masters(3).MAddr <= x"0009";

	spm_masters(1).MCmd <= (others=>'0');
	spm_masters(2).MCmd <= (others=>'0');
	spm_masters(3).MCmd <= (others=>'0');


	wait for 800 ns;


end process;

end behav;

