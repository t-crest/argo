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
-- A simulated consumer block.
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

entity eager_consumer is
	generic (
		constant TEST_VECTORS_FILE: string
	);
	port (
		left_f : in channel_forward;
		left_b : out channel_backward
	);
end entity eager_consumer;

architecture behavioral of eager_consumer is
	signal ack : std_logic := '0';
        signal req : std_logic := '0';
	
	signal sop : std_logic := '0';
	signal eop : std_logic := '0';	
	signal data : std_logic_vector(31 downto 0) := (others => '0');

	file test_vectors: text open READ_MODE is TEST_VECTORS_FILE;
begin

	sop <= left_f.data(33);
	eop <= left_f.data(32);

	-- Data
	data <= left_f.data(31 downto 0);


	-- ACK after receiving data
        req <= transport left_f.req after DELAY;
	left_b.ack <= req;

        reporting: process (req)
          variable flit : word_t := (others => '0');
          variable l    : line;
	  variable count : natural := 0;

        begin  -- process reporting

          if rising_edge(req) then
          
			readline(test_vectors, l);
			read(l, flit);
			
			count := count + 1;
			report "INFO@eager_consumer(" & TEST_VECTORS_FILE
					& "): " & integer'IMAGE(count) & " Flit received..."
				 severity note;
				 
			assert (to_integer(unsigned(left_f.data(33 downto 17))) = to_integer(unsigned(flit(33 downto 17)))) and
			       (to_integer(unsigned(left_f.data(16 downto 0))) = to_integer(unsigned(flit(16 downto 0))))
             report "ERROR@eager_consumer(" & TEST_VECTORS_FILE
					& "): Received = " & integer'IMAGE(to_integer(unsigned(left_f.data(33 downto 32)))) 
					& ", " & integer'IMAGE(to_integer(unsigned(left_f.data(31 downto 0))))
					& ", Expected = " & integer'IMAGE(to_integer(unsigned(flit(33 downto 32)))) 
					& ", " & integer'IMAGE(to_integer(unsigned(flit(31 downto 0))))
					& "."
				 severity error;
          end if;
        end process reporting;

end architecture behavioral;



