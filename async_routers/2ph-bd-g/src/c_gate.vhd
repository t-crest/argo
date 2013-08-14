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
-- A two-input C-element gate.
--
-- Author: Evangelia Kasapaki
-- 	   Rasmus Bo Sorensen
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.defs.all;


entity c_gate is
	generic (
		constant c_initial : std_logic
	);
	port (
		preset : in std_logic;
		a : in std_logic;
		b : in std_logic;
		c : out std_logic
	);
end c_gate;


architecture latch_implementation of c_gate is
	signal set   : std_logic;
	signal reset : std_logic;	
begin

	process (a, b, preset) is
	begin	
		set   <= a and b;	--   Set when a=1 and b=1
	 	reset <= a nor b;	-- Reset when a=0 and b=0

		if (preset = '1') then
			if (c_initial = '1') then
				set <= '1';
				reset <= '0';
			else
				set <= '0';
				reset <= '1';
			end if;		
		end if;
	end process ;
	

	
	latch : entity work.sr_latch(struct)
	generic map(
		q_init => c_initial
	)
	port map(
		s => set,
		r => reset,
		q => c,
		qn => open	-- Not used
	);

end latch_implementation;
