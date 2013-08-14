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
-- First stage of router icluding converter from LEDR encoding 
-- to bundled-data protocol.
--
-- Author: Evangelia Kasapaki
-- 	   Rasmus Bo Sorensen
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.defs.all;

entity LEDR2bundled is
	generic(
		constant init_token : latch_state;
		constant init_data : word_t := (others => 'X')	-- Forced unknown
	);
	port(
		preset			: in std_logic;
		
		LEDR_link_f		: in link_forward;
		LEDR_link_b		: out link_backward;
		
		bundled_ch_f	: out channel_forward;
		bundled_ch_b	: in channel_backward
		
	);
end entity LEDR2bundled;

architecture RTL of LEDR2bundled is
	signal token_phase : std_logic;
	signal data_cd : std_logic_vector(PHIT_SIZE-1 downto 0);
	signal data_phase : std_logic;
	signal data_cd_phase : std_logic;
	signal empty_phase : std_logic;
	signal full_phase : std_logic;
	
	
	signal req_in, req_out : std_logic;
	signal ack_in, ack_out : std_logic;
	signal latch_enable : std_logic;
	signal enabled_latch_enable : std_logic;

        signal delay : std_logic;
	
	
begin
	--- The code is divided in sections as shown in the article
	--- Type Detection
	
	token_phase <= LEDR_link_f.token_t xor LEDR_link_f.token_parity;
	
	select_element : entity work.select_element(struct)
	port map (
		preset => preset,
		input => token_phase,
		true => full_phase,
		false => empty_phase,
		sel => LEDR_link_f.token_t
		);
	
	
	--- Token Merge
	
	data_cd_c : entity work.c_gate(latch_implementation)
	generic map (
		c_initial => '0'
		)
	port map (
		preset => preset,
		a => full_phase,
		b => data_phase,
		c => data_cd_phase
		);
	
	req_in <= empty_phase xor data_cd_phase;
	
	--- Completion Detection
	
	data_completion: for i in PHIT_SIZE-1 downto 0 generate
		data_cd(i) <= LEDR_link_f.phit(i) xor LEDR_link_f.phit_parity(i);
	end generate data_completion;
	
	data_ch : entity work.c_gate_generic(sr_latch_impl)
	generic map (
		C_INIT => '0',
		WIDTH => PHIT_SIZE
		)
	port map (
		preset => preset,
		input => data_cd,
		output => data_phase
		);
	
	
	--- Data enabled Handshake Latch
	LEDR_link_b.ack <= ack_out;
        --delay <= not ack_out;
	bundled_ch_f.req <= req_out;
	ack_in <= bundled_ch_b.ack;
	enabled_latch_enable <= latch_enable or not LEDR_link_f.token_t;
	
	latch_controller : entity work.latch_controller(simple_2_phase)
	generic map (
		init_token => EMPTY_BUBBLE
		)
	port map (
		preset => preset,
		Rin => req_in,
		Aout => ack_out,
		Rout => req_out,
		Ain => ack_in,
		lt_en => latch_enable
		);
	
	latch :process (enabled_latch_enable,latch_enable,preset,LEDR_link_f) is
	begin
		if (latch_enable = '0') then
			bundled_ch_f.data(33) <= LEDR_link_f.token_t; 
		end if;
		if (enabled_latch_enable = '0') then
			bundled_ch_f.data(32 downto 0) <= LEDR_link_f.phit;
		end if;
		
		if (preset = '1') then
			bundled_ch_f.data <= (others => '0');
		end if;
	end process latch;

end architecture RTL;
