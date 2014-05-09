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
-- The combinatorial part of the HPU of the asynchronous router.
--
-- Author: Evangelia Kasapaki
--	   Rasmus Bo Sorensen
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.defs.all;


entity hpu_comb is
	generic (
		constant is_ni : boolean;
		constant this_port : std_logic_vector(1 downto 0)
	);
	port (
		data_valid : in std_logic;
		data_in    : in word_t;

		data_out   : out word_t;		
		sel        : out onehot_sel
	);
end hpu_comb;


architecture struct of hpu_comb is
	signal sel_internal : onehot_sel;
	signal SOP : std_logic;
	signal EOP : std_logic;	
begin

	SOP <= data_in(33);
	EOP <= data_in(32);


	one_hot_decoder: block
		signal dest_port : std_logic_vector(1 downto 0);
	begin
		dest_port <= data_in(1 downto 0);

		gen_not_ni: if is_ni = false generate
			sel_internal <= "10000"	when dest_port = this_port else		-- 4: NI
							"00001" when dest_port = "00" else			-- 0: North
							"00010" when dest_port = "01" else			-- 1: East
							"00100" when dest_port = "10" else			-- 2: South
							"01000"; -- when dest_port = "11" else		-- 3: West
		end generate gen_not_ni;

		gen_is_ni: if is_ni = true generate			
			sel_internal <= "00001" when dest_port = "00" else			-- 0: North
							"00010" when dest_port = "01" else			-- 1: East
							"00100" when dest_port = "10" else			-- 2: South
							"01000"; -- when dest_port = "11" else		-- 3: West
		end generate gen_is_ni;
	end block one_hot_decoder;
	
	
	sel_latch:process (data_valid, EOP, sel_internal, SOP) is
	begin
		-- We must only open the latch when data are valid.
		if (data_valid = '1') then
			if (SOP = '1' and EOP = '0') then
				sel <= sel_internal;
			elsif (SOP = '0' and EOP = '0') then
				-- This is an empty space, but other incoming phits may not be.
				sel <= (others => '0');	
			end if;
		end if;
	end process sel_latch;
	
	
	shift:process (data_in, EOP, SOP) is
	begin
		if (SOP = '1' and EOP = '0') then
			-- This is the header phit, so we shift the addr so the next switch knows where to route the packet.
			-- This allows one-hot decoding logic to always be driven by bottom 2 LSb's.
			data_out <= (others => '0');	
			data_out(29 downto 0) <= data_in(31 downto 2); -- right shift by 2 bits
			data_out(33) <= SOP;
			data_out(32) <= EOP;			
		else
			-- Not header. Must be one of {body, end-body, empty space}
			data_out <= data_in;	-- Pass through unaltered
		end if;		
	end process shift;
	
	
end architecture struct;





