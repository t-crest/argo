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
-- Testbench for a single router netlist with producer and consumer blocks 
-- as interfaces
--
-- Author: Evangelia Kasapaki
--------------------------------------------------------------------------------

LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
LIBRARY STD;
use STD.TEXTIO.all;
LIBRARY WORK;
use WORK.defs.all;
use work.txt_util.all;

ENTITY tb_switch IS
	-- Nothing here
END tb_switch;


ARCHITECTURE testbench OF tb_switch IS
	SIGNAL preset : std_logic;
	TYPE ch_t IS ARRAY(0 to 4) OF channel;
	SIGNAL producer_ch : ch_t;
	SIGNAL consumer_ch : ch_t;
	TYPE link_t is ARRAY (0 to 4) OF link;
	SIGNAL producer_link : link_t;
	SIGNAL consumer_link : link_t;
	signal sim_time : integer;

	signal north_in_f_flat : std_logic_vector (67 downto 0);
	signal north_in_b_flat : std_logic;--_vector (0 downto 0);  
	signal east_in_f_flat : std_logic_vector (67 downto 0);  
	signal east_in_b_flat : std_logic;--_vector (0 downto 0);  
	signal south_in_f_flat : std_logic_vector (67 downto 0);  
        signal south_in_b_flat : std_logic;--_vector (0 downto 0);  
	signal west_in_f_flat : std_logic_vector (67 downto 0);  
	signal west_in_b_flat : std_logic;--_vector (0 downto 0);  
	signal resource_in_f_flat : std_logic_vector (67 downto 0);  
        signal resource_in_b_flat : std_logic;--_vector (0 downto 0);  
	signal north_out_f_flat : std_logic_vector (67 downto 0);  
	signal north_out_b_flat : std_logic;--_vector (0 downto 0);  
	signal east_out_f_flat : std_logic_vector (67 downto 0);  
        signal east_out_b_flat : std_logic;--_vector (0 downto 0);  
	signal south_out_f_flat : std_logic_vector (67 downto 0);  
	signal south_out_b_flat : std_logic;--_vector (0 downto 0);  
	signal west_out_f_flat : std_logic_vector (67 downto 0);  
        signal west_out_b_flat : std_logic;--_vector (0 downto 0);  
	signal resource_out_f_flat : std_logic_vector (67 downto 0);  
	signal resource_out_b_flat : std_logic;--_vector (0 downto 0);
	
	subtype SubString_t is string (19 downto 1);
	TYPE filename_t IS ARRAY(0 to 4) OF SubString_t;
	CONSTANT INPUT : filename_t := ("../vectors/n_i4.dat", "../vectors/e_i4.dat", "../vectors/s_i4.dat", "../vectors/w_i4.dat", "../vectors/r_i4.dat");
	CONSTANT OUTPUT : filename_t := ("../vectors/n_o4.dat", "../vectors/e_o4.dat", "../vectors/s_o4.dat", "../vectors/w_o4.dat", "../vectors/r_o4.dat");

	signal req 		: std_logic;

	--alias req is 
	--<<signal .tb_switch.switch.north_in_latch.req_in : std_logic>>;
BEGIN
	--req <= <<signal .tb_switch.switch.north_in_latch.req_in : std_logic>>;

	init : process is
	begin
		preset <= '1', '0' after 10 ns;
		wait for 500 ns;
		
		report ">>>>>>>>>>>>>>> Test bench finished... <<<<<<<<<<<<<<<" 
		severity failure;
	end process init;
	
-- 	monitor_in : process (resource_in_f_flat)
-- 	begin
-- 		report "data in" & str(north_in_f_flat) ;
-- 	end process monitor_in;

-- 	monitor_out : process (resource_in_b_flat)
-- 	begin
-- 		report "ack out" & str(north_in_b_flat) ;
-- 	end process monitor_out;

	--try spying
	--spy_process : process
	--begin
	--	init_signal_spy("/tb_switch/north_in_latch/req_in","/tb_switch/req",1,1);
	--	enable_signal_spy("/tb_switch/north_in_latch/req_in","/tb_switch/req",0);
	--	wait;
	--end process spy_process;

	-- Five instances of producers
	producers : for i in 0 to 4 generate 
		producer : entity work.LEDR_push_producer(behavioral)
		generic map (
			TEST_VECTORS_FILE => INPUT(i)
		)
		port map (
			preset => preset,
			right_f => producer_link(i).forward,
			right_b => producer_link(i).backward
			);
	end generate producers;

	-- Five instances of consumers
	consumers : for i in 0 to 4 generate
		consumer : entity work.LEDR_eager_consumer(behavioral)
		generic map (
			TEST_VECTORS_FILE => OUTPUT(i)
		)
		port map (
			left_f  => consumer_link(i).forward,
			left_b => consumer_link(i).backward
			);
	end generate consumers;
	
	-- flat interface translation
	north_in_f_flat		<= producer_link(0).forward.token_t & producer_link(0).forward.token_parity & producer_link(0).forward.phit & producer_link(0).forward.phit_parity;
	producer_link(0).backward.ack <= north_in_b_flat;  
	east_in_f_flat		<= producer_link(1).forward.token_t & producer_link(1).forward.token_parity & producer_link(1).forward.phit & producer_link(1).forward.phit_parity;  
	producer_link(1).backward.ack <= east_in_b_flat;  
	south_in_f_flat		<= producer_link(2).forward.token_t & producer_link(2).forward.token_parity & producer_link(2).forward.phit & producer_link(2).forward.phit_parity;
        producer_link(2).backward.ack <= south_in_b_flat;  
	west_in_f_flat		<= producer_link(3).forward.token_t & producer_link(3).forward.token_parity & producer_link(3).forward.phit & producer_link(3).forward.phit_parity;
	producer_link(3).backward.ack <= west_in_b_flat;  
	resource_in_f_flat	<= producer_link(4).forward.token_t & producer_link(4).forward.token_parity & producer_link(4).forward.phit & producer_link(4).forward.phit_parity;
        producer_link(4).backward.ack <= resource_in_b_flat;

        consumer_link(0).forward.token_t <= north_out_f_flat(67);
        consumer_link(0).forward.token_parity <= north_out_f_flat(66);
        consumer_link(0).forward.phit <= north_out_f_flat(65 downto 33);
        consumer_link(0).forward.phit_parity <= north_out_f_flat(32 downto 0);
      	north_out_b_flat	<= consumer_link(0).backward.ack;
        consumer_link(1).forward.token_t <= east_out_f_flat(67);
        consumer_link(1).forward.token_parity <= east_out_f_flat(66);
        consumer_link(1).forward.phit <= east_out_f_flat(65 downto 33);
        consumer_link(1).forward.phit_parity <= east_out_f_flat(32 downto 0);
        east_out_b_flat	<= consumer_link(1).backward.ack;
        consumer_link(2).forward.token_t <= south_out_f_flat(67);
        consumer_link(2).forward.token_parity <= south_out_f_flat(66);
        consumer_link(2).forward.phit <= south_out_f_flat(65 downto 33);
        consumer_link(2).forward.phit_parity <= south_out_f_flat(32 downto 0);
	south_out_b_flat	<= consumer_link(2).backward.ack;
        consumer_link(3).forward.token_t <= west_out_f_flat(67);
        consumer_link(3).forward.token_parity <= west_out_f_flat(66);
        consumer_link(3).forward.phit <= west_out_f_flat(65 downto 33);
        consumer_link(3).forward.phit_parity <= west_out_f_flat(32 downto 0);
        west_out_b_flat 	<= consumer_link(3).backward.ack;
        consumer_link(4).forward.token_t <= resource_out_f_flat(67);
        consumer_link(4).forward.token_parity <= resource_out_f_flat(66);
        consumer_link(4).forward.phit <= resource_out_f_flat(65 downto 33);
        consumer_link(4).forward.phit_parity <= resource_out_f_flat(32 downto 0);
	resource_out_b_flat	<= consumer_link(4).backward.ack;

	
	-- NoC switch instance
   	switch : entity work.noc_switch_x0_y0(MODULE)
	port map (
		preset         => preset,
		-- Input ports
		north_in_f     => north_in_f_flat,
		north_in_b_ACK     => north_in_b_flat,
		east_in_f      => east_in_f_flat,
		east_in_b_ACK      => east_in_b_flat,
		south_in_f     => south_in_f_flat,
		south_in_b_ACK     => south_in_b_flat,
		west_in_f      => west_in_f_flat,
		west_in_b_ACK     => west_in_b_flat,
		resource_in_f  => resource_in_f_flat,
		resource_in_b_ACK  => resource_in_b_flat,
		-- Output ports
		north_out_f    => north_out_f_flat,
		north_out_b_ACK    => north_out_b_flat,
		east_out_f     => east_out_f_flat,
		east_out_b_ACK     => east_out_b_flat,
		south_out_f    => south_out_f_flat,
		south_out_b_ACK    => south_out_b_flat,
		west_out_f     => west_out_f_flat,
		west_out_b_ACK     => west_out_b_flat,
		resource_out_f => resource_out_f_flat,
		resource_out_b_ACK => resource_out_b_flat
		--sim_time	   => sim_time
	);	
	
-- module noc_switch_x0_y0 ( preset, north_in_f, east_in_f, south_in_f, west_in_f, 
--         resource_in_f, north_out_f, east_out_f, south_out_f, west_out_f, 
--         resource_out_f, north_in_b_ACK_, east_in_b_ACK_, south_in_b_ACK_, 
--         west_in_b_ACK_, resource_in_b_ACK_, north_out_b_ACK_, east_out_b_ACK_, 
--         south_out_b_ACK_, west_out_b_ACK_, resource_out_b_ACK_ );


--  	global_time : entity work.global_timer(RTL)
--  	generic map (
--  		resolution => 1 ns
--  	)
--  	port map (
--  		preset => preset,
--  		time => sim_time
--  	);
	
END ARCHITECTURE testbench;
