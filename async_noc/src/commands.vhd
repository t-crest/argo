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
use ieee.numeric_std.all;
use std.textio.all;
use work.txt_util.all;
use work.defs.all;


entity test4_noc2x2 is
end test4_noc2x2;


architecture behav of test4_noc2x2 is

-----------------------component declarations------------------------------
component noc is
port (
	p_clk		: in std_logic;
	n_clk		: in std_logic;
	reset		: in std_logic;

	p_ports_in	: in procMasters;
	p_ports_out	: out procSlaves;

	spm_ports_in	: in spmMasters;
	spm_ports_out	: out spmSlaves

);
end component;

-------------------------signal declarations-------------------------------
signal n_clk		: std_logic := '1';
signal p_clk		: std_logic := '1';
signal reset		: std_logic := '1';

signal p_masters	: procMasters;
signal p_slaves		: procSlaves;
signal spm_masters	: spmMasters;
signal spm_slaves	: spmSlaves;

constant SCHED_FILE     : string (19 downto 1) := "../sim/schedule.txt";
file schedule0          : text open READ_MODE is SCHED_FILE;
file schedule1          : text open READ_MODE is SCHED_FILE;
file schedule2          : text open READ_MODE is SCHED_FILE;
file schedule3          : text open READ_MODE is SCHED_FILE;

begin

noc2x2 : noc
port map (
	p_clk => p_clk,
	n_clk => n_clk,
	reset => reset,

	p_ports_in => p_masters,
	p_ports_out => p_slaves,

	spm_ports_in => spm_masters,
	spm_ports_out => spm_slaves
);


--na clock 
na_clk_generate: process
begin
	wait for NA_HPERIOD;
	n_clk <= not n_clk;
end process;

--proc clock 
proc_clk_generate: process
begin
	wait for P_HPERIOD;
	p_clk <= not p_clk;
end process;

--reset
rst_generate: process
begin
	wait for 4*NA_HPERIOD;
        wait for delay;
	reset <= '0';
	wait;
end process;


spm_initilize: process

  variable count : natural := 0;

begin

  	for i in 0 to N-1 loop
		for j in 0 to N-1 loop
			--p_masters(i)(j).MCmd  <= (others=>'0');
			--p_masters(i)(j).MAddr <= (others=>'0');
			--p_masters(i)(j).MData <= (others=>'0');

			spm_masters(i)(j).MCmd  <= (others=>'0');
			spm_masters(i)(j).MAddr <= (others=>'0');
			spm_masters(i)(j).MData <= (others=>'0');
		end loop;
	end loop;
        
        wait until falling_edge(reset);

        while(count < SPM_INIT_SIZE) loop

                wait until rising_edge(n_clk);
                wait for delay;

                spm_masters(0)(0).MCmd <="11";
                spm_masters(0)(0).MAddr <= x"00000000";--std_logic_vector(to_unsigned(count,32));--x"00000000";
                spm_masters(0)(0).MData <= x"0000000011111111";
                spm_masters(0)(1).MCmd <="11";
                spm_masters(0)(1).MAddr <= std_logic_vector(to_unsigned(count+SPM_INIT_SIZE,32));--x"00000002";
                spm_masters(0)(1).MData <= x"2222222233333333";
                spm_masters(1)(0).MCmd <="11";
                spm_masters(1)(0).MAddr <= std_logic_vector(to_unsigned(count+2*SPM_INIT_SIZE,32));--x"00000004";
                spm_masters(1)(0).MData <= x"4444444455555555";
                spm_masters(1)(1).MCmd <="11";
                spm_masters(1)(1).MAddr <= std_logic_vector(to_unsigned(count+3*SPM_INIT_SIZE,32));--x"00000006";
                spm_masters(1)(1).MData <= x"6666666677777777";

                count := count + 1;

        end loop;

        wait until rising_edge(n_clk);
        
        spm_masters(0)(0).MCmd <="00";
        spm_masters(0)(0).MAddr <= (others=>'0');
        spm_masters(0)(0).MData <= (others=>'0');
        spm_masters(0)(1).MCmd <="00";
        spm_masters(0)(1).MAddr <= (others=>'0');
        spm_masters(0)(1).MData <= (others=>'0');
        spm_masters(1)(0).MCmd <="00";
        spm_masters(1)(0).MAddr <= (others=>'0');
        spm_masters(1)(0).MData <= (others=>'0');
        spm_masters(1)(1).MCmd <="00";
        spm_masters(1)(1).MAddr <= (others=>'0');
        spm_masters(1)(1).MData <= (others=>'0');


        wait;


end process;


init_ni0: process

variable word : string (100 downto 1);--std_logic_vector(15 downto 0) := (others => '0');
variable l    : line;

begin
        wait until falling_edge(reset);
      	wait for 6*NA_HPERIOD;

        while not endfile(schedule0) loop

                str_read(schedule0, word);
                while not (word(100 downto 96)="# NI0") and not endfile(schedule0) loop
                        str_read(schedule0, word);
                end loop;
                
                exit when endfile(schedule0);
                
                report "==========>" & word(100 downto 96) severity note;

        end loop;
          
end process;


init_ni1: process

variable word : string (100 downto 1);--std_logic_vector(15 downto 0) := (others => '0');
variable l    : line;

begin
        wait until falling_edge(reset);
      	wait for 6*NA_HPERIOD;

        while not endfile(schedule1) loop

                str_read(schedule1, word);
                while not (word(100 downto 96)="# NI1") and not endfile(schedule1) loop
                        str_read(schedule1, word);
                end loop;
                
                exit when endfile(schedule1);

                report "==========>" & word(100 downto 96) severity note;

        end loop;
          
end process;

init_ni2: process

variable word : string (100 downto 1);--std_logic_vector(15 downto 0) := (others => '0');
variable l    : line;

begin
        wait until falling_edge(reset);
      	wait for 6*NA_HPERIOD;

        while not endfile(schedule2) loop

                str_read(schedule2, word);
                while not (word(100 downto 96)="# NI2") and not endfile(schedule2) loop
                        str_read(schedule2, word);
                end loop;

                exit when endfile(schedule2);
                
                report "==========>" & word(100 downto 96) severity note;

        end loop;
          
end process;

init_ni3: process

variable word : string (100 downto 1);--std_logic_vector(15 downto 0) := (others => '0');
variable l    : line;

begin
        wait until falling_edge(reset);
      	wait for 6*NA_HPERIOD;

        while not endfile(schedule3) loop

                str_read(schedule3, word);
                while not (word(100 downto 96)="# NI3") and not endfile(schedule3) loop
                        str_read(schedule3, word);
                end loop;
                
                exit when endfile(schedule3);

                report "==========>" & word(100 downto 96) severity note;

        end loop;
          
end process;



end behav;
