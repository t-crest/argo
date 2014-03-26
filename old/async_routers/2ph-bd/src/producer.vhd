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
-- A simulated producer block.
--
-- Authors: Evangelia Kasapaki
--	    Rasmus Bo Sorensen 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
library STD;
use STD.textio.all;
library work;
use work.defs.all;
use work.txt_util.all;



entity push_producer is
	generic (
		constant TEST_VECTORS_FILE: string
	);
	port (
		preset : in std_logic;
		right_f : out channel_forward;
		right_b  : in channel_backward
	);
end entity push_producer;


architecture behavioral of push_producer is
	file test_vectors: text open READ_MODE is TEST_VECTORS_FILE;
	
	signal req : std_logic := '0';
begin
	-- This produces started as a 4-phased bundled data producer and has been converted into a 2-phased bundled data producer
	-- Simulation-only construct. Synthesizable implemention would just be a NOT gate: right_out.req <= NOT right_in.ack
	stimulus_generate : process  is
		variable flit : word_t := (others => '0');
		variable l    : line;
		variable count : natural := 0;
	begin
		right_f.req  <= '0';
		right_f.data <= (others => '0');
		
		wait until preset = '0';
                wait for 1 ns;

		-- Due to initialization and loops, we start in the second half of the handshake cycle
		while not endfile(test_vectors) loop
			
			-- Second half of handshake
			--right_f.req <= transport '0' after DELAY;		-- Ro-: Tell consumer that we now know it has gotten the data
			--right_f.data <= (others => '-');				-- Data could be invalid now, and we are pessimistic
			--wait until right_b.ack = '0';					-- Ai-: Consumer ready for next datum

			-- Wait some arbitrary "computation" time for next datum
			req <= not req;
			wait for 0.35 ns;

			-- First half of handshake
			readline(test_vectors, l);
			read(l, flit);

			-- Make sure data is valid some time before raising req
			right_f.data <= flit;
			right_f.req <= transport req after 0.25 ns;					-- Ro+: Data are valid
			
			count := count + 1;
			report "INFO@push_producer(" & TEST_VECTORS_FILE & "): " &
				integer'IMAGE(count) & " Flit sent...(" &
				--integer'IMAGE(to_integer(unsigned(flit(31 downto 0)))) & ")"
				str(req) & ":" & str(flit(31 downto 0)) & ")"
				 severity note;

	        	wait until right_b.ack'event;								-- Ai+: Data latched in by consumer
		--report "INFO@push_producer, ack received."
		--		 severity note;
		end loop;
		
		wait for 1 ns;
		
	end process stimulus_generate;

end architecture behavioral;

