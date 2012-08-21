library ieee;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all;

library work;
use work.defs.all;

entity counter is
	generic (
		WIDTH	: integer :=8
	);
	port (
		clk 	: in std_logic ;
		reset 	: in std_logic ;
		enable	: in std_logic;
		cnt 	: out std_logic_vector(WIDTH-1 downto 0)
	);
end counter;

architecture rtl of counter is

	signal val , reg : unsigned(WIDTH-1 downto 0);

begin
	cnt <= std_logic_vector(reg);
	val <= reg+1;

	process(clk, reset)
	begin
		if reset ='1' then
			reg <= (others => '0') after PDELAY;
		elsif rising_edge(clk) then
			if enable = '1' then
				reg <= val after PDELAY;
			end if;
		end if ;
	end process;

end rtl ;

