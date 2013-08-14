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
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
LIBRARY STD;
USE STD.TEXTIO.ALL;
LIBRARY WORK;
USE WORK.defs.ALL;

ENTITY tb_switch IS
	-- Nothing here
END tb_switch;


ARCHITECTURE testbench OF tb_switch IS
	SIGNAL preset : std_logic;
	TYPE ch_t IS ARRAY(0 to 4) OF channel;
	SIGNAL producer_ch : ch_t;
	SIGNAL consumer_ch : ch_t;
	signal sim_time : integer;

        signal north_in_f_flat : std_logic_vector (34 downto 0);
	signal north_in_b_flat : std_logic;--_vector (0 downto 0);  
	signal east_in_f_flat : std_logic_vector (34 downto 0);  
	signal east_in_b_flat : std_logic;--_vector (0 downto 0);  
	signal south_in_f_flat : std_logic_vector (34 downto 0);  
        signal south_in_b_flat : std_logic;--_vector (0 downto 0);  
	signal west_in_f_flat : std_logic_vector (34 downto 0);  
	signal west_in_b_flat : std_logic;--_vector (0 downto 0);  
	signal resource_in_f_flat : std_logic_vector (34 downto 0);  
        signal resource_in_b_flat : std_logic;--_vector (0 downto 0);  
	signal north_out_f_flat : std_logic_vector (34 downto 0);  
	signal north_out_b_flat : std_logic;--_vector (0 downto 0);  
	signal east_out_f_flat : std_logic_vector (34 downto 0);  
        signal east_out_b_flat : std_logic;--_vector (0 downto 0);  
	signal south_out_f_flat : std_logic_vector (34 downto 0);  
	signal south_out_b_flat : std_logic;--_vector (0 downto 0);  
	signal west_out_f_flat : std_logic_vector (34 downto 0);  
        signal west_out_b_flat : std_logic;--_vector (0 downto 0);  
	signal resource_out_f_flat : std_logic_vector (34 downto 0);  
	signal resource_out_b_flat : std_logic;--_vector (0 downto 0);
        
	subtype SubString_t is string (19 downto 1);
	TYPE filename_t IS ARRAY(0 to 4) OF SubString_t;
	CONSTANT INPUT : filename_t := ("../vectors/n_i4.dat", "../vectors/e_i4.dat", "../vectors/s_i4.dat", "../vectors/w_i4.dat", "../vectors/r_i4.dat");
	CONSTANT OUTPUT : filename_t := ("../vectors/n_o4.dat", "../vectors/e_o4.dat", "../vectors/s_o4.dat", "../vectors/w_o4.dat", "../vectors/r_o4.dat");
BEGIN

	init : process is
	begin
		preset <= '1', '0' after 10 ns;
		wait for 200 ns;
		
		report ">>>>>>>>>>>>>>> Test bench finished... <<<<<<<<<<<<<<<" 
		severity failure;		
	end process init;
	

	-- Five instances of producers
	producers : for i in 0 to 4 generate 
		producer : entity work.push_producer(behavioral)
		generic map (
			TEST_VECTORS_FILE => INPUT(i)
		)
		port map (
			preset => preset,
			right_f => producer_ch(i).forward,
			right_b => producer_ch(i).backward
		);
	end generate producers;


	-- Five instances of consumers
	consumers : for i in 0 to 4 generate
		consumer : entity work.eager_consumer(behavioral)
		generic map (
			TEST_VECTORS_FILE => OUTPUT(i)
		)
		port map (
			left_f  => consumer_ch(i).forward,
			left_b => consumer_ch(i).backward
		);
	end generate consumers;
	
	-- flat interface translation
	north_in_f_flat		<= producer_ch(0).forward.req & producer_ch(0).forward.data;
	producer_ch(0).backward.ack <= north_in_b_flat;
	east_in_f_flat		<= producer_ch(1).forward.req & producer_ch(1).forward.data;  
	producer_ch(1).backward.ack <= east_in_b_flat;
	south_in_f_flat		<= producer_ch(2).forward.req & producer_ch(2).forward.data;
        producer_ch(2).backward.ack <= south_in_b_flat;
	west_in_f_flat		<= producer_ch(3).forward.req & producer_ch(3).forward.data;
	producer_ch(3).backward.ack <= west_in_b_flat;
	resource_in_f_flat	<= producer_ch(4).forward.req & producer_ch(4).forward.data;
        producer_ch(4).backward.ack <= resource_in_b_flat;

     consumer_ch(0).forward.req <= north_out_f_flat(34);
     consumer_ch(0).forward.data <= north_out_f_flat(33 downto 0);
	north_out_b_flat	<= consumer_ch(0).backward.ack;  
     consumer_ch(1).forward.req <= east_out_f_flat(34);
     consumer_ch(1).forward.data <= east_out_f_flat(33 downto 0);
        east_out_b_flat         <= consumer_ch(1).backward.ack;  
     consumer_ch(2).forward.req <= south_out_f_flat(34);
     consumer_ch(2).forward.data <= south_out_f_flat(33 downto 0);
	south_out_b_flat	<= consumer_ch(2).backward.ack;
     consumer_ch(3).forward.req <= west_out_f_flat(34);
     consumer_ch(3).forward.data <= west_out_f_flat(33 downto 0);
        west_out_b_flat 	<= consumer_ch(3).backward.ack;  
     consumer_ch(4).forward.req <= resource_out_f_flat(34);
     consumer_ch(4).forward.data <= resource_out_f_flat(33 downto 0);
	resource_out_b_flat	<= consumer_ch(4).backward.ack;

	
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
     

END ARCHITECTURE testbench;
