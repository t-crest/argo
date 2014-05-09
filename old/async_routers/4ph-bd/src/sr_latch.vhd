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
-- An sr-latch used for the implementation of C-elements.
--
-- Author: Evangelia Kasapaki
--	   Rasmus Bo Sorensen
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.defs.all;


entity sr_latch is 
	generic (
		constant q_init : std_logic	-- The initial value of q
	);
	port(
		s  : in std_logic;		-- set, active high		
		r  : in std_logic;		-- reset, active high
		q  : out std_logic;		-- q
		qn : out std_logic		-- q inverted
	);
end sr_latch;


architecture struct of sr_latch is
	signal q_internal  : std_logic := q_init;
	signal qn_internal : std_logic := not q_init;
begin
	q  <= q_internal;
	qn <= qn_internal;

	-- Classic double NOR
	latch : process(r,s,q_internal,qn_internal) is
	begin
		q_internal  <= transport r nor qn_internal after delay;
		qn_internal <= transport s nor q_internal after delay;
	end process latch;
end struct;


-- architecture behav of sr_latch is
-- 	signal q_internal, qn_internal : std_logic;
-- begin
-- 	q  <= q_internal;
-- 	qn <= qn_internal;

-- 	-- This behavioral approach is easier for XST to recognize than a double NOR
-- 	-- However two separate latches will be inferred
-- 	latch : process (s, r) begin
-- 		if (r='1' and s='0') then		-- Reset
-- 			q_internal  <= '0';
-- 			qn_internal <= '1';
-- 		elsif (r='0' and s='1') then	-- Set
-- 			q_internal  <= '1';
-- 			qn_internal <= '0';
-- 		elsif (r='1' and s='1') then	-- Set & Reset => invalid
-- 			q_internal  <= 'X';
-- 			qn_internal <= 'X';
-- 		end if;
-- 	end process latch;
--end behav;

