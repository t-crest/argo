-- 
-- Copyright Technical University of Denmark. All rights reserved.
-- This file is part of the T-CREST project.
-- 
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
-- 
--    1. Redistributions of source code must retain the above copyright notice,
--	 this list of conditions and the following disclaimer.
-- 
--    2. Redistributions in binary form must reproduce the above copyright
--	 notice, this list of conditions and the following disclaimer in the
--	 documentation and/or other materials provided with the distribution.
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
-- A package for the click based design
--
-- Authors: Christoph Müller
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package click_package is

  -- this function checks the init phase of the neighbors and decides
  -- wether a reset triggered click gating is needed to prevent deadlocks
  function resolve_neighbor_phases (
    left_phase	: std_logic;		-- init phase of the left neighbor
    phase	: std_logic;		-- init phase of this controller
    right_phase : std_logic)		-- init phase of the right neighbor
    return boolean;
  
end package click_package;

package body click_package is

  -- this function checks the init phase of the neighbors and decides
  -- wether a reset triggered click gating is needed to prevent deadlocks
  function resolve_neighbor_phases (
    left_phase	: std_logic;		-- init phase of the left neighbor
    phase	: std_logic;		-- init phase of this controller
    right_phase : std_logic)		-- init phase of the right neighbor
    return boolean is
  begin
    -- simple case: nothing is known about the neighbors (phases initialized to
    -- 'X') - just inject the gating to be on the safe side.
    if left_phase = 'X' and right_phase = 'X' then return true; end if;
    -- would deadlock if phase equals right phase and left is phase inverted
    if left_phase = 'X' and phase = right_phase then return true; end if;
    -- would deadlock if phase unequal left phase and right equal
    if right_phase = 'X' and phase /= left_phase then return true; end if;
    -- we have knowledge about all neighbors: mimic the actual and-or gate combination
    return (left_phase = '1' and phase ='0' and right_phase = '0') or (left_phase = '0' and phase = '1' and right_phase = '1');
  end;
  

end package body click_package;
