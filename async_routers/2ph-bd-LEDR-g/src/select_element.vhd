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
-- Select element block for the converter from LEDR to bundled-data.
--
-- Authors: Evangelia Kasapaki
--	    Rasmus Bo Sorensen 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.defs.all;

entity select_element is
	port( 
		preset		: in std_logic;
		input		: in std_logic;
		true		: out std_logic;
		false		: out std_logic;
		sel			: in std_logic
	);
end entity select_element;

architecture struct of select_element is
	signal true_latch_in : std_logic;
	signal false_latch_in : std_logic;
	signal true_latch_out : std_logic;
	signal false_latch_out : std_logic;
begin
	-- Select element implemented as shown in Erik Brunvand's
	-- "A Cell Set for Self-Timed Design using Actel FPGAs"
	true_latch_in <=  transport false_latch_out xor input after delay;
	false_latch_in <=  transport true_latch_out xor input after delay;
	
	true_latch:process (false_latch_in, false_latch_out, preset, sel, true_latch_in, true_latch_out) is
	begin
		if preset = '1' then
			true_latch_out <= '0';
			false_latch_out <= '0';
		elsif sel = '1' then
			true_latch_out <= transport true_latch_in after delay;
		elsif sel = '0' then
			false_latch_out <=  transport false_latch_in after delay;
		end if;
		true <= true_latch_out;
		false <= false_latch_out;
	end process true_latch;
	
end architecture struct;
