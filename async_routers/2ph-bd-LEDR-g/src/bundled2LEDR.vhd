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
-- Last stage of router icluding converter from bundled-data protocol
-- to LEDR encoding.
--
-- Author: Evangelia Kasapaki
-- 	   Rasmus Bo Sorensen
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.defs.all;

entity bundled2LEDR is
	port( 
		preset			: in std_logic;
		
		bundled_ch_f	: in channel_forward;
		bundled_ch_b	: out channel_backward;
		
		LEDR_link_f		: out link_forward;
		LEDR_link_b		: in link_backward
	);
end entity bundled2LEDR;

architecture RTL of bundled2LEDR is
	signal type_in : std_logic;		-- Internal type signal, going to input of flip-flop 
	signal type_out : std_logic;	-- Internal type signal, output of flip-flop
	signal clk : std_logic;			-- Clock signal for clocking the flip-flops
	signal enabled_clk : std_logic;	-- Clock signal for clocking the flip-flops, enabled by the type signal
	signal data_phase : std_logic;	-- The phase of the data channel of the link
	signal data_parity : std_logic_vector(PHIT_SIZE-1 downto 0); -- The parity bits of the data channel 
	signal ack : std_logic;			-- Internal Acknowledgement signal
begin
	-- The single gates for the control signals
	type_in <= bundled_ch_f.data(33);
	clk <= transport LEDR_link_b.ack xor ack;-- after delay;
	enabled_clk <= clk and type_out;
	bundled_ch_b.ack <= ack;	 
	
	-- The type flip-flops for the two type bits
	type_flipflops :process (clk, preset)is
	begin
		if preset = '1' then 
			LEDR_link_f.token_t <= '0';
			type_out <= '0';
			LEDR_link_f.token_parity <= '0';
		else
			if rising_edge(clk) then
				LEDR_link_f.token_t <= type_in;
				type_out <= type_in;
				LEDR_link_f.token_parity <= type_in xor bundled_ch_f.req; -- The parity bit of the type channel of the link
			end if;
		end if;
	end process type_flipflops;
	
	-- Xor gate array
	data_parity_xor: for i in PHIT_SIZE-1 downto 0 generate
		data_parity(i) <= bundled_ch_f.data(i) xor data_phase;
	end generate data_parity_xor;
	
	-- Flip-flops for the data and parity bits
	data_channel_flipflop : process (enabled_clk, preset) is
	begin
		if preset = '1' then
			LEDR_link_f.phit <= (others => '0');
			LEDR_link_f.phit_parity <= (others => '0');
			data_phase <= '1';
		else
			if rising_edge(enabled_clk) then
				data_phase <= not data_phase;
				LEDR_link_f.phit <= bundled_ch_f.data(32 downto 0);
				LEDR_link_f.phit_parity <= data_parity;
			end if;
		end if;
	end process data_channel_flipflop;
	
	-- Latch /Latchcontroller
	latch:process (bundled_ch_f, clk, preset) is
	begin
		if clk = '0' then 
			ack <= transport bundled_ch_f.req after delay;
		end if;
		
		if preset = '1' then
			ack <= '0';
		end if;
	end process latch;
	
end architecture RTL;
