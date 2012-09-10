-- xbar.vhd
-- A. Bentzon, 2012. BSc thesis, 'Mesochronous TDM-based Network-on-Chip'.

-- Crossbar for the NoC router.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.defs.all;

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
