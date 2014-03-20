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
-- The mousetrap latch controller of the asynchronous router.
--
-- Author: Evangelia Kasapaki
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.noc_defs.all;

--		  ____________
--      Rin ---> | Latch      | ---> Rout
--      Ain <--- | controller | <--- Aout
--		  ____________
entity latch_controller is
	generic (
		constant init_token : latch_state
	);
	port (
		preset : in std_logic;
		Rin  : in std_logic;
		Ain  : out std_logic;

		Rout : out std_logic;
		Aout : in std_logic;

		lt_en   : out std_logic	-- Latch enable
	);
end latch_controller;


-- Simple latch controller; cf. figure 2.9 in S&F
architecture mousetrap of latch_controller is
  signal r_next : std_logic;
  signal enable : std_logic;
  signal preset_del    : std_logic;
  signal preset_del2    : std_logic;
 --signal reset  : std_logic;
  --signal r_prev : std_logic;
  --signal r_out : std_logic;

begin

  Rout <= r_next;
  Ain   <= r_next;
  enable <= transport r_next xnor Aout after delay;
  lt_en <= enable;

  --r_prev <= (not Rin) when resolve_latch_state(init_token)='1' else Rin;
  --r_out <= (not r_next) when resolve_latch_state(init_token)='1' else r_next;

  --set <= resolve_latch_state(init_token) and preset;
  --reset <= not(resolve_latch_state(init_token)) and preset;

  --req_latch: process (preset, enable, r_prev)
    --begin
      --if preset='1' then
        --r_next <= '0';
--      elsif enable='1' then
  --      r_next <= transport r_prev after delay;
    --  end if;
--  end process req_latch;

  --req_prev <= Rin when enable='1' else r_next;

  --r_next <= set or ((not reset) and req_prev);

  --set <= resolve_latch_state(init_token) and preset;
  --reset <= not(resolve_latch_state(init_token)) and preset;

  --preset_del <= not preset;
  --preset_del2 <= not preset_del;

  req_latch : process(Rin, enable, preset)
    begin
      --if set = '1' then
        --r_next <= '1';
      if preset='1' then
        r_next <= resolve_latch_state(init_token);
      elsif enable='1' then
        r_next <= transport Rin after delay;
      end if;

    end process req_latch;

end mousetrap;
