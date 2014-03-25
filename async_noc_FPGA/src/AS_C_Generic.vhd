--  Developer  :  DRH: 23/11/2013
--                Student: s120971
--                DTU, Technical University of Denmark
-- Made to extend the c-element to n input

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.noc_defs.all;

entity AS_C_Generic is
	generic(
		constant C_INIT : std_logic;
		constant WIDTH  : integer := 3
	);
	port(
		preset : in  std_logic;
		input  : in  std_logic_vector(WIDTH - 1 downto 0);
		output : out std_logic
	);
end entity;

-- ----------------------------------------------------------------------------

architecture LUTs of AS_C_Generic is
	constant reset_value: std.STANDARD.BIT := to_bit(C_INIT);
	signal reset : std_logic;
	
	signal internal : std_logic_vector(WIDTH - 1 downto 0); -- the internal wires between the delay elements
begin

	reset <= not preset;

	internal(0) <= input(0); -- input 0 connected to the first element
	
	delays : for i in 0 to WIDTH - 2 generate
		delay : entity work.AS_C2
			generic map(reset_value => reset_value)
			port map(in1   => internal(i),
				     in2   => input(i + 1),
				     reset => reset,
				     z     => internal(i + 1));

	end generate delays;

	output <= transport internal(WIDTH - 1) after delay; -- Last delay element outputs result
	
end architecture LUTs;