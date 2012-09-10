-- hpu.vhd
-- A. Bentzon, 2012. BSc thesis, 'Mesochronous TDM-based Network-on-Chip'.

-- Header parsing unit for the NoC router. See [thesis, Fig. 3.4].

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.defs.all;
	
entity HPU is
	port(
		clk: 	in std_logic;
		reset:	in std_logic;
		inLine: in network_link;
		outLine: out network_link;
		sel:	out std_logic_vector(3 downto 0)
	);
end HPU;

architecture struct of HPU is
	signal SOP	: std_logic;
	signal MOP	: std_logic;
	signal EOP	: std_logic;
	signal dest	: std_logic_vector(1 downto 0);
	
	signal selInt, selIntNext	: std_logic_vector(3 downto 0);
	signal decodedSel		: std_logic_vector(3 downto 0);
	signal outInt			: network_link;
begin
	SOP <= inLine(PHIT_WIDTH-1);
	MOP <= inLine(PHIT_WIDTH-2);
	EOP <= inLine(PHIT_WIDTH-3);
	dest <= inLine(1 downto 0);
	outLine <= outInt;
	
	-- binary decoder, dest field into a one-hot signal
	decodedSel(0) <= '1' when dest = "00" else '0';
	decodedSel(1) <= '1' when dest = "01" else '0';
	decodedSel(2) <= '1' when dest = "10" else '0';
	decodedSel(3) <= '1' when dest = "11" else '0';
	
	selIntNext <= decodedSel when SOP = '1' else (selInt and (selInt'range=>(MOP or EOP)));
	sel <= selInt when (EOP='1' or MOP='1') else selIntNext;
	outInt <= "100" & inLine(31 downto 16) & "00" & inLine(15 downto 2) when (SOP='1' and MOP='0' and EOP='0') else inLine;

	process (reset,clk)
	begin
		if reset = '1' then
			selInt <= (others => '0');
		elsif clk'event and clk = '1' then
			selInt <= selIntNext;
		end if;
	end process;

end struct;
