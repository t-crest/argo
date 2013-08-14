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
-- Testbench for a single router with producer and consumer blocks 
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
	SIGNAL preset : std_logic := '1';
	TYPE ch_t IS ARRAY(0 to 4) OF channel;
	SIGNAL producer_ch : ch_t;
	SIGNAL consumer_ch : ch_t;
	TYPE link_t is ARRAY (0 to 4) OF link;
	SIGNAL producer_link : link_t;
	SIGNAL consumer_link : link_t;
	signal sim_time : integer;
	
	subtype SubString_t is string (18 downto 1);
	TYPE filename_t IS ARRAY(0 to 4) OF SubString_t;
	CONSTANT INPUT : filename_t := ("../vectors/n_i.dat", "../vectors/e_i.dat", "../vectors/s_i.dat", "../vectors/w_i.dat", "../vectors/r_i.dat");
	CONSTANT OUTPUT : filename_t := ("../vectors/n_o.dat", "../vectors/e_o.dat", "../vectors/s_o.dat", "../vectors/w_o.dat", "../vectors/r_o.dat");
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
		
		B2L_con : entity work.bundled2LEDR(RTL)
		port map (
			preset => preset,
			bundled_ch_f => producer_ch(i).forward,
			bundled_ch_b => producer_ch(i).backward,
			LEDR_link_f => producer_link(i).forward,
			LEDR_link_b => producer_link(i).backward
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
		
		L2B_con : entity work.LEDR2bundled(RTL)
		generic map (
			init_token => EMPTY_BUBBLE,
			init_data => (others => '0')
		)
		port map (
			preset => preset,
			LEDR_link_f => consumer_link(i).forward,
			LEDR_link_b => consumer_link(i).backward,
			bundled_ch_f => consumer_ch(i).forward, 
			bundled_ch_b => consumer_ch(i).backward
			);
	end generate consumers;
	
	
	-- NoC switch instance
	switch : entity work.noc_switch(struct)
	generic map (
		--sim => true,
		x => 0,
		y => 0
	)
	port map (
		preset         => preset,
		-- Input ports
		north_in_f     => producer_link(0).forward,
		north_in_b     => producer_link(0).backward,
		east_in_f      => producer_link(1).forward,
		east_in_b      => producer_link(1).backward,
		south_in_f     => producer_link(2).forward,
		south_in_b     => producer_link(2).backward,
		west_in_f      => producer_link(3).forward,
		west_in_b      => producer_link(3).backward,
		resource_in_f  => producer_link(4).forward,
		resource_in_b  => producer_link(4).backward,
		-- Output ports
		north_out_f    => consumer_link(0).forward,
		north_out_b    => consumer_link(0).backward,
		east_out_f     => consumer_link(1).forward,
		east_out_b     => consumer_link(1).backward,
		south_out_f    => consumer_link(2).forward,
		south_out_b    => consumer_link(2).backward,
		west_out_f     => consumer_link(3).forward,
		west_out_b     => consumer_link(3).backward,
		resource_out_f => consumer_link(4).forward,
		resource_out_b => consumer_link(4).backward
		--sim_time	   => sim_time
	);	
	
	--global_time : entity work.global_timer(RTL)
	--generic map (
	--	resolution => 1 ns
	--)
	--port map (
	--	preset => preset,
	--	time => sim_time
	--);
	
END ARCHITECTURE testbench;
