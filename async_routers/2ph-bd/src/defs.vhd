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
-- Definitions package
--
-- Author: Evangelia Kasapaki
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package defs is
	
	constant LINKWIDTH : integer := 34;	-- 32 bit data + 2 bit EOP and SOP
	constant PHIT_SIZE : integer := 33;
	constant ARITY :integer := 5;
	subtype word_t is std_logic_vector(LINKWIDTH-1 downto 0);
	subtype type_t is std_logic;
	subtype phit_t is std_logic_vector(PHIT_SIZE-1 downto 0);
	subtype onehot_sel is std_logic_vector(ARITY-1 downto 0);
	
	-- Channels  are for bundled-data communication
	type channel_forward is record
		req : std_logic;
		data : word_t;
	end record channel_forward;
	
	type channel_backward is record
		ack : std_logic;
	end record channel_backward;
	
	type channel is record
		forward : channel_forward;
		backward : channel_backward;
	end record channel;
	
	-- Links are LEDR communication between routers
	type link_forward is record
		token_t : type_t;
		token_parity : type_t;
		phit : phit_t;
		phit_parity : phit_t;
	end record link_forward;
	
	type link_backward is record
		ack : std_logic;
	end record link_backward;
	
	type link is record
		forward : link_forward;
		backward : link_backward;
	end record link;
	
	
	constant delay : time := 0.6 ns;
               
	-- Types to make design generic
	type switch_sel_t is array (ARITY-1 downto 0) of onehot_sel;
	type chs_f is array (ARITY-1 downto 0) of channel_forward;
	type chs_b is array (ARITY-1 downto 0) of channel_backward;
	type links_f is array (ARITY-1 downto 0) of link_forward;
	type links_b is array (ARITY-1 downto 0) of link_backward;
	type bars_t is array (ARITY-1 downto 0, ARITY-1 downto 0) of word_t;
	
	type latch_state is (opaque, transparent);

	-- Convenience constants, that add some semantics. Not type-safe!
	constant EMPTY_TOKEN  : latch_state := transparent;
	constant EMPTY_BUBBLE : latch_state := transparent;
	constant VALID_BUBBLE : latch_state := transparent;
	constant VALID_TOKEN  : latch_state := opaque;	-- Only valid-tokens are opaque latches

	-- Function prototype
	function resolve_latch_state (arg : latch_state) return std_logic;
	function getDelay(T_start, T_stop, currentTime : integer; delay : time) return time;
	
end package defs;


package body defs is
	function resolve_latch_state (arg : latch_state) return std_logic is
	begin
		case arg is
			when transparent => return '0';	-- valid-bubbles (and all empties - also empty tokens) are transparent latches
			when others =>		return '1';	-- Only valid-tokens are opaque latches
		end case;
	end function resolve_latch_state;
	
	function getDelay(T_start, T_stop, currentTime : integer; delay : time) return time is
	begin
		if (T_start <= currentTime and currentTime <= T_stop) then
			return delay;
		else
			return 0 ns;
		end if;
	end function getDelay;
end package body defs;
