-- DMA with simple dual-ported, single-clock block RAM in VHDL.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.defs.all;


entity dma_sdp is
	generic (
		DATA		: integer := 64;
		ADDR		: integer := 2
	);
	port (
		clk		: in std_logic;
		reset		: in std_logic;

		ren		: in std_logic_vector(2 downto 0);
		wen	 	: in std_logic_vector(2 downto 0);
		waddr 		: in std_logic_vector(ADDR-1 downto 0);
		wdata	 	: in std_logic_vector(DATA-1 downto 0);
		raddr 		: in std_logic_vector(ADDR-1 downto 0);
		rdata		: out std_logic_vector(DATA-1 downto 0)
	);		

end dma_sdp;

architecture rtl of dma_sdp is

----------------------- component declarations ---------------------------------
component bram
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
end component;


----------------------- signal declarations ------------------------------------
signal rdata0		: std_logic_vector(BANK0_W-1 downto 0);
signal rdata1		: std_logic_vector(BANK1_W-1 downto 0);
signal rdata2		: std_logic_vector(BANK2_W-1 downto 0);

signal wdata0		: std_logic_vector(BANK0_W-1 downto 0);
signal wdata1		: std_logic_vector(BANK1_W-1 downto 0);
signal wdata2		: std_logic_vector(BANK2_W-1 downto 0);

signal sel_out		: std_logic_vector(2 downto 0);


begin

	--
	process( clk, reset ) begin
		if reset='1' then
			sel_out <= "000";
		elsif rising_edge (clk) then
			sel_out <= ren;
		end if;
	end process;

	process (sel_out, rdata0, rdata1, rdata2) begin
		case sel_out is
		when "111" =>
			rdata <= rdata0 & rdata1 & rdata2;
		when "100" =>
			rdata <= x"000000000000" & rdata0;
		when "010" =>
			rdata <= x"00000000" & rdata1;
		when "001" =>
			rdata <= x"000000000000" & rdata2;
		when others =>
			rdata <= (others => '0');
		end case;
	end process;


	wdata0 <= wdata(DATA-1 downto DATA-BANK0_W);
	-- holds control bits and word-count to be transfered
	dma0 : bram
	generic map (DATA=>BANK0_W, ADDR=>ADDR)
	port map (clk => clk,
		rd_addr => raddr,
		wr_addr => waddr,
		wr_data => wdata0,
		wr_ena => wen(2),
		rd_data => rdata0
	);

	wdata1 <= wdata(DATA-BANK0_W-1 downto DATA-BANK0_W-BANK1_W);
	-- holds read-pointer, write-pointer
	dma1 : bram
	generic map (DATA=>BANK1_W, ADDR=>ADDR)
	port map (clk => clk,
		rd_addr => raddr,
		wr_addr => waddr,
		wr_data => wdata1,
		wr_ena => wen(1),
		rd_data => rdata1
	);

	wdata2 <= wdata(BANK2_W-1 downto 0);
	-- holds route, accessed only in protected mode
	dma2 : bram
	generic map (DATA=>BANK2_W, ADDR=>ADDR)
	port map (clk => clk,
		rd_addr => raddr,
		wr_addr => waddr,
		wr_data => wdata2,
		wr_ena => wen(0),
		rd_data => rdata2
	);

end rtl;

