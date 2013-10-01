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
-- Crossbar for the NoC router.
--
-- Author: Anders Bentzon
-- Author: Evangelia Kasapaki
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.noc_defs.all;

entity Xbar is
	port(
			func	: in std_logic_vector(19 downto 0);
			inPort	: in routerPort;
			outPort	: out routerPort
	);
end Xbar;

-- Func format:
--	source port:  	   4    3    2    1    0
--	dest port:	3210 4210 3410 3240 3214

architecture structure of Xbar is
	signal sel0, sel1, sel2, sel3, sel4:	std_logic_vector(3 downto 0);
begin
	sel0 <= func(3 downto 0);
	sel1 <= func(7 downto 4);
	sel2 <= func(11 downto 8);
	sel3 <= func(15 downto 12);
	sel4 <= func(19 downto 16);

	outPort(0) <= (inPort(1) and (network_link'range=>sel1(0))) or
				  (inPort(2) and (network_link'range=>sel2(0))) or
				  (inPort(3) and (network_link'range=>sel3(0))) or
				  (inPort(4) and (network_link'range=>sel4(0)));
	outPort(1) <= (inPort(0) and (network_link'range=>sel0(1))) or
				  (inPort(2) and (network_link'range=>sel2(1))) or
				  (inPort(3) and (network_link'range=>sel3(1))) or
				  (inPort(4) and (network_link'range=>sel4(1)));
	outPort(2) <= (inPort(0) and (network_link'range=>sel0(2))) or
				  (inPort(1) and (network_link'range=>sel1(2))) or
				  (inPort(3) and (network_link'range=>sel3(2))) or
				  (inPort(4) and (network_link'range=>sel4(2)));
	outPort(3) <= (inPort(0) and (network_link'range=>sel0(3))) or
				  (inPort(1) and (network_link'range=>sel1(3))) or
				  (inPort(2) and (network_link'range=>sel2(3))) or
				  (inPort(4) and (network_link'range=>sel4(3)));
	outPort(4) <= (inPort(0) and (network_link'range=>sel0(0))) or
				  (inPort(1) and (network_link'range=>sel1(1))) or
				  (inPort(2) and (network_link'range=>sel2(2))) or
				  (inPort(3) and (network_link'range=>sel3(3)));

end structure;
