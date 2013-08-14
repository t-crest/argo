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
-- The latch stage of the crossbar of the asynchronous router.
--
-- Author: Evangelia Kasapaki
--	   Rasmus Bo Sorensen
--------------------------------------------------------------------------------

library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;
library work;
use work.defs.all;

entity crossbar_stage is
	generic(
		--sim : boolean := true;
		x : natural := 0;
		y : natural := 0
	);
	port(
		preset        : in std_logic;
		switch_sel    : in switch_sel_t;
		chs_in_f      : in chs_f;
		chs_in_b      : out chs_b;
		latches_out_f : out chs_f;
		latches_out_b : in chs_b
		
		-- Ports for simulation
		--sim_time	  : in integer
	);
end entity crossbar_stage;

architecture struct of crossbar_stage is
	signal latches_in_f : chs_f;
	signal latches_in_b : chs_b;


begin
	-- Crossbar
	crossbar: entity work.crossbar(structural)
	generic map (
		--sim				=> sim,
		x	=> x,
		y	=> y 
	)
	port map (
		preset     => preset,
		switch_sel => switch_sel,
		chs_in_f   => chs_in_f,
		chs_in_b   => chs_in_b,
		chs_out_f  => latches_in_f,
		chs_out_b  => latches_in_b
		--sim_time   => sim_time
	);

	-- Putput lathces	
 	latches: for i in ARITY-1 downto 0 generate
 		latch: block
 			signal left_in : channel_forward;
 			signal left_out : channel_backward;
 			signal right_out : channel_forward;
 			signal right_in : channel_backward;
 		begin
 			left_in          <= latches_in_f(i);
 			latches_in_b(i)  <= left_out;
 			right_in         <= latches_out_b(i);
 			latches_out_f(i) <= right_out; 
 			
 			ch_latch : entity work.channel_latch(struct)
 			generic map (
 				init_token => VALID_TOKEN,
 				init_data => (others => '0')
			)
			port map (
 				preset    => preset,
 				left_in   => left_in,
 				left_out  => left_out,
 				right_out => right_out,
 				right_in  => right_in
				);
 		end block latch;		
	end generate latches;
	
		

end architecture struct;
