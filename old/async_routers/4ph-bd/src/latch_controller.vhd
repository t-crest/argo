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
-- The latch controller of the asynchronous router.
--
-- Author: Evangelia Kasapaki
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.defs.all;

--				  ____________
--      Rin ---> | Latch      | ---> Rout
--     Aout <--- | controller | <--- Ain
--		         _____________
--								Modified figure 6.21 in S&F (Aout/Ain reversed)
entity latch_controller is
	generic (
		constant init_token : latch_state
	);
	port (
		preset : in std_logic;
		Rin  : in std_logic;
		Aout : out std_logic;

		Rout : out std_logic;
		Ain  : in std_logic;
		
		lt_en: out latch_state	-- Latch enable
	);
end latch_controller;


-- Simple latch controller; cf. figure 2.9 in S&F
architecture simple of latch_controller is
	signal not_Ain   : std_logic;
	signal c         : std_logic;
begin
	not_Ain   <= transport not Ain after delay;
	Rout      <= c;
	Aout      <= c;
	lt_en     <= transparent when c = '0' else 	-- Data latch is opaque
				 opaque	when c = '1';		-- Data latch is transparent
	
	gate : entity work.c_gate(latch_implementation)
	generic map (
		c_initial => resolve_latch_state(init_token)
	)
	port map(
		preset => preset,
		a => not_Ain,
		b => Rin,
		c => c
	);

end simple;
