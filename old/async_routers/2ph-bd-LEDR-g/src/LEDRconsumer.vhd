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
-- A simulated LEDR consumer block.
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

entity LEDR_eager_consumer is
	generic (
		constant TEST_VECTORS_FILE: string
	);
	port (
		left_f : in link_forward;
		left_b : out link_backward
	);
end entity LEDR_eager_consumer;

architecture behavioral of LEDR_eager_consumer is
	signal ack : std_logic := '0';
	signal req : std_logic;
	
	signal sop : std_logic;
	signal eop : std_logic;	
	signal data : std_logic_vector(31 downto 0) := (others => '0');

	file test_vectors: text open READ_MODE is TEST_VECTORS_FILE;
begin

	sop <= left_f.token_t;
	eop <= left_f.phit(32);
	
	-- The xor of the token and the token_parity generates a 2-phased request signal, with
	-- the same phase as the request signal in the transmitting end og the link
	req <= left_f.token_t xor left_f.token_parity;

	-- Data
	data <= left_f.phit(31 downto 0);


	-- ACK after receiving data
	ack <= transport req after DELAY;
	left_b.ack <= ack;


	reporting : process is
		variable flit : word_t := (others => '0');
		variable l    : line;
		variable count : natural := 0;
	begin
		wait until req = '0';
		wait until req'event;
		
		while true loop
		
			wait until req'event;
			readline(test_vectors, l);
			read(l, flit);
			
			if (left_f.token_t = '0' and left_f.phit(32)= '0') then			-- Comparing the revieved result with the expected result	 
				assert ((left_f.token_t = std_logic(flit(33))) and (left_f.phit(32) = flit(32))) and
				       (to_integer(unsigned(left_f.phit(31 downto 0))) = to_integer(unsigned(flit(31 downto 0))))
	             report "ERROR@eager_consumer(" & TEST_VECTORS_FILE
						& "): Received = " & std_logic'image(left_f.phit(32)) --left_f.token_t &  
						& ", " & integer'IMAGE(to_integer(unsigned(left_f.phit(31 downto 0))))
						& ", Expected = " & integer'IMAGE(to_integer(unsigned(flit(33 downto 32)))) 
						& ", " & integer'IMAGE(to_integer(unsigned(flit(31 downto 0))))
						& "."
					 severity error;
			end if;
			--wait for 1 ns;
		end loop;
	end process reporting;

end architecture behavioral;



