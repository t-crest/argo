-- A parameterized, inferable, simple dual-port, single-clock block RAM.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.defs.all;


entity bram is

generic (
	DATA    : integer := 32;
	ADDR    : integer := 14
);

port (
	clk 	: in std_logic ;
	rd_addr : in std_logic_vector(ADDR-1 downto 0);
	wr_addr : in std_logic_vector(ADDR-1 downto 0);
	wr_data : in std_logic_vector(DATA-1 downto 0);
	wr_ena 	: in std_logic ;
	rd_data : out std_logic_vector(DATA-1 downto 0)
);
end bram;


architecture rtl of bram is
	-- memory
    	type mem_type is array ( (2**ADDR)-1 downto 0 ) of std_logic_vector(DATA-1 downto 0);
	signal mem : mem_type := (others => (others => '0'));

begin

process(clk)
begin

    if rising_edge(clk) then

	if wr_ena='1' then
		mem(conv_integer(wr_addr)) <= wr_data;
        end if;
        rd_data <= mem(conv_integer(rd_addr));
    end if;

end process;
 
end rtl;

