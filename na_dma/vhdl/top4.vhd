-- Testbench4
-- 2 NA back-to-back

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.defs.all;


entity top4 is
end top4;

architecture behav of top4 is
	
--component declarations
component bram_tdp
generic (
    DATA    : integer := 32;
    ADDR    : integer := 14
);
port (
	-- Port A - to proc
	a_clk   : in  std_logic;
	a_wr    : in  std_logic;
	a_addr  : in  std_logic_vector(ADDR-1 downto 0);
	a_din   : in  std_logic_vector(DATA-1 downto 0);
	a_dout  : out std_logic_vector(DATA-1 downto 0);
    
	-- Port B to network
	b_clk   : in  std_logic;
	b_wr    : in  std_logic;
	b_addr  : in  std_logic_vector(ADDR-1 downto 0);
	b_din   : in  std_logic_vector(DATA-1 downto 0);
	b_dout  : out std_logic_vector(DATA-1 downto 0)
);
end component;

component nAdapter
port (
	-- General
	na_clk		: in  std_logic;
	na_reset	: in  std_logic;

	-- Processor Ports
	-- DMA Configuration Port - OCP
	proc_in		: in ocp_master;
	proc_out	: out ocp_slave;
	     
	-- SPM Data Port - OCP?
	spm_in		: in ocp_slave_spm;
	spm_out		: out ocp_master_spm;

	-- Network Ports
	-- Incoming Port
	pkt_in		: in  network_link;

	-- Outgoing Port
	pkt_out		: out network_link
);
end component;

--signal declarations
signal na_clk			: std_logic := '1';
signal p_clk			: std_logic := '1';
signal reset			: std_logic := '1';

--signal p_ocp_; ocp interface na with the proc
-- auta prepei na ta paragw
signal p_ocp_master0		: ocp_master;
signal p_ocp_master1		: ocp_master;

--auta ta pairnw eisodo
signal p_ocp_slave0		: ocp_slave;
signal p_ocp_slave1		: ocp_slave;

--signal m_ocp_ ocp interface na with SPM
--ta syndew mono
signal spm_ocp_master0		: ocp_master_spm;
signal spm_ocp_master1		: ocp_master_spm;

signal spm_ocp_slave0		: ocp_slave_spm;
signal spm_ocp_slave1		: ocp_slave_spm;

--signal pm_ocp_ ocp interface proc with SPM
-- for now simple ram interface
--signal p_spm_master		: ocp_master;
signal p0_wr			: std_logic;
signal p0_addr			: std_logic_vector(SPM_ADDR_WIDTH-1 downto 0);
signal p0_din			: std_logic_vector(SPM_DATA_WIDTH-1 downto 0);
signal p0_dout			: std_logic_vector(SPM_DATA_WIDTH-1 downto 0);

signal p1_wr			: std_logic;
signal p1_addr			: std_logic_vector(SPM_ADDR_WIDTH-1 downto 0);
signal p1_din			: std_logic_vector(SPM_DATA_WIDTH-1 downto 0);
signal p1_dout			: std_logic_vector(SPM_DATA_WIDTH-1 downto 0);

--network ports
signal pkt_na0			: network_link;
signal pkt_na1			: network_link;

--signal val			: std_logic_vector(PHIT_WIDTH-1 downto 0);



begin


-- NA0 ---------------------------------------------------------------- NA0
-- High SPM instance
spm_h0 : bram_tdp
generic map (DATA=>DATA_WIDTH, ADDR => SPM_ADDR_WIDTH)
port map (a_clk => p_clk, 
	a_wr => p0_wr, 
	a_addr => p0_addr, 
	a_din => p0_din(63 downto 32), 
	a_dout => p0_dout(63 downto 32), 
	b_clk => na_clk, 
	b_wr => spm_ocp_master0.MCmd(0), 
	b_addr => spm_ocp_master0.MAddr(SPM_ADDR_WIDTH-1 downto 0), 
	b_din => spm_ocp_master0.MData(63 downto 32), 
	b_dout => spm_ocp_slave0.SData(63 downto 32));

-- Low SPM instance
spm_l0 : bram_tdp
generic map (DATA => DATA_WIDTH, ADDR => SPM_ADDR_WIDTH)
port map (a_clk => p_clk, 
	a_wr =>  p0_wr, 
	a_addr => p0_addr, 
	a_din => p0_din(31 downto 0), 
	a_dout => p0_dout(31 downto 0), 
	b_clk => na_clk, 
	b_wr => spm_ocp_master0.MCmd(0), 
	b_addr =>spm_ocp_master0.MAddr(SPM_ADDR_WIDTH-1 downto 0), 
	b_din => spm_ocp_master0.MData(31 downto 0), 
	b_dout => spm_ocp_slave0.SData(31 downto 0));

-- NA instance
na0 : nAdapter
port map(
	-- General
	na_clk=>na_clk, na_reset=>reset,

	-- Processor Ports
	-- DMA Configuration Port - OCP
	proc_in=>p_ocp_master0,
	proc_out=>p_ocp_slave0,
	     
	-- SPM Data Port - OCP?
	spm_in=>spm_ocp_slave0,
	
	spm_out=>spm_ocp_master0,

	-- Network Ports
	-- Incoming Port
	pkt_in=>pkt_na1,
	-- Outgoing Port
	pkt_out=>pkt_na0
);

-- NA1 ---------------------------------------------------------------- NA1
-- High SPM instance
spm_h1 : bram_tdp
generic map (DATA=>DATA_WIDTH, ADDR => SPM_ADDR_WIDTH)
port map (a_clk => p_clk, 
	a_wr => p1_wr, 
	a_addr => p1_addr, 
	a_din => p1_din(63 downto 32), 
	a_dout => p1_dout(63 downto 32), 
	b_clk => na_clk, 
	b_wr => spm_ocp_master1.MCmd(0), 
	b_addr => spm_ocp_master1.MAddr(SPM_ADDR_WIDTH-1 downto 0), 
	b_din => spm_ocp_master1.MData(63 downto 32), 
	b_dout => spm_ocp_slave1.SData(63 downto 32));

-- Low SPM instance
spm_l1 : bram_tdp
generic map (DATA => DATA_WIDTH, ADDR => SPM_ADDR_WIDTH)
port map (a_clk => p_clk, 
	a_wr =>  p1_wr, 
	a_addr => p1_addr, 
	a_din => p1_din(31 downto 0), 
	a_dout => p1_dout(31 downto 0), 
	b_clk => na_clk, 
	b_wr => spm_ocp_master1.MCmd(0), 
	b_addr =>spm_ocp_master1.MAddr(SPM_ADDR_WIDTH-1 downto 0), 
	b_din => spm_ocp_master1.MData(31 downto 0), 
	b_dout => spm_ocp_slave1.SData(31 downto 0));

-- NA instance
na1 : nAdapter
port map(
	-- General
	na_clk=>na_clk, na_reset=>reset,

	-- Processor Ports
	-- DMA Configuration Port - OCP
	proc_in=>p_ocp_master1,
	proc_out=>p_ocp_slave1,
	     
	-- SPM Data Port - OCP?
	spm_in=>spm_ocp_slave1,
	
	spm_out=>spm_ocp_master1,

	-- Network Ports
	-- Incoming Port
	pkt_in=>pkt_na0,
	-- Outgoing Port
	pkt_out=>pkt_na1
);
-----------------------------------------------------------------------------------------
--na clock 
process
begin
	wait for NA_HPERIOD;
	na_clk <= not na_clk;
end process;

--proc clock 
process
begin
	wait for P_HPERIOD;
	p_clk <= not p_clk;
end process;

--reset
process
begin
	wait for 13 ns;
	reset <= '0';
	wait;
end process;


--sim
process
begin
--edw prepei na paragw ta shmata

	-- proc0
	p0_wr <= '0';
	p0_addr <= (others=>'0');
	p0_din <= (others=>'0');

	p_ocp_master0.MCmd <= (others=>'0');
	p_ocp_master0.MAddr <= (others=>'0');
	p_ocp_master0.MData <= (others=>'0');

	-- proc1
	p1_wr <= '0';
	p1_addr <= (others=>'0');
	p1_din <= (others=>'0');

	p_ocp_master1.MCmd <= (others=>'0');
	p_ocp_master1.MAddr <= (others=>'0');
	p_ocp_master1.MData <= (others=>'0');

--initialize spm
--initialize slot table
	wait for 43 ns; --1
	p_ocp_master0.MCmd <="11";
	p_ocp_master0.MAddr <= ST_MASK & x"000000";
	p_ocp_master0.MData <= x"00000000";

	p0_wr <= '1';
	p0_addr <= (others=>'0');
	p0_din <= x"0001000200030004";

	wait for 10 ns; --2
	p_ocp_master0.MAddr <= ST_MASK & x"000001";
	p_ocp_master0.MData <= x"00000001";

	p0_wr <= '1';
	p0_addr <= x"0001";
	p0_din <= x"0005000600070008";

	wait for 10 ns; --3
	p_ocp_master0.MAddr <= ST_MASK & x"000002";
	p_ocp_master0.MData <= x"00000002";

	p0_wr <= '1';
	p0_addr <= x"0002";
	p0_din <= x"0009000a000b000c";

	wait for 10 ns; --1
	p_ocp_master0.MAddr <= ST_MASK & x"000003";
	p_ocp_master0.MData <= x"00000000";

	p0_wr <= '1';
	p0_addr <= x"0003";
	p0_din <= x"000d000e000f0010";

	wait for 10 ns; --2
	p_ocp_master0.MAddr <= ST_MASK & x"000004";
	p_ocp_master0.MData <= x"00000001";

	p0_wr <= '1';
	p0_addr <= x"0004";
	p0_din <= x"0011001200130014";

	wait for 10 ns; --3
	p_ocp_master0.MAddr <= ST_MASK & x"000005";
	p_ocp_master0.MData <= x"00000000";

	p0_wr <= '1';
	p0_addr <= x"0005";
	p0_din <= x"0015001600170018";

	wait for 10 ns; --1
	p_ocp_master0.MAddr <= ST_MASK & x"000006";
	p_ocp_master0.MData <= x"00000001";

	p0_wr <= '1';
	p0_addr <= x"0006";
	p0_din <= x"0019001a001b001c";

	wait for 10 ns; --2
	p_ocp_master0.MAddr <= ST_MASK & x"000007";
	p_ocp_master0.MData <= x"00000000";

	p0_wr <= '1';
	p0_addr <= x"0007";
	p0_din <= x"001d001e001f0020";

	wait for 10 ns; --3
	p_ocp_master0.MCmd <= (others=>'0');
	p_ocp_master0.MAddr <= ST_MASK & x"000006";

	p0_wr <= '0';
	p0_addr <= (others=>'0');
	p0_din <= (others=>'0');

--initialize routes
	wait for 10 ns; --1
	p_ocp_master0.MCmd <="11";
	p_ocp_master0.MAddr <= DMA_P_MASK & x"000000";
	p_ocp_master0.MData <= x"12345678";
	
	wait for 10 ns; --2
	p_ocp_master0.MAddr <= DMA_P_MASK & x"000001";
	p_ocp_master0.MData <= x"9abcdef1";


	wait for 10 ns; --3
	p_ocp_master0.MCmd <= (others=>'0');


--initialize DMAs
	wait for 10 ns; --1
	p_ocp_master0.MCmd <="11";
	p_ocp_master0.MAddr <= DMA_MASK & x"000001";
	p_ocp_master0.MData <= x"00000000";
	
	wait for 10 ns; --2
	p_ocp_master0.MAddr <= DMA_MASK & x"000000";
	p_ocp_master0.MData <= x"00008004";

	wait for 10 ns; --3
	p_ocp_master0.MCmd <= (others=>'0');

	wait for 10 ns; --1
	p_ocp_master0.MCmd <="11";
	p_ocp_master0.MAddr <= DMA_MASK & x"000003";
	p_ocp_master0.MData <= x"00020008";
	
	wait for 10 ns; --2
	p_ocp_master0.MAddr <= DMA_MASK & x"000002";
	p_ocp_master0.MData <= x"00008002";

	wait for 10 ns; --3
	p_ocp_master0.MCmd <= (others=>'0');
	p_ocp_master0.MAddr <= (others=>'0');
	
--sim
	wait for 300 ns;
	p1_addr <= x"0000";

	wait for 10 ns;
	p1_addr <= x"0001";
	
	wait for 10 ns;
	p1_addr <= x"0002";

	wait for 10 ns;
	p1_addr <= x"0003";

	wait for 10 ns;
	p1_addr <= x"0004";

	wait for 10 ns;
	p1_addr <= x"0005";

	wait for 10 ns;
	p1_addr <= x"0006";

	wait for 10 ns;
	p1_addr <= x"0007";

	wait for 10 ns;
	p1_addr <= x"0008";

	wait for 10 ns;
	p1_addr <= x"0009";

	wait for 10 ns;
	p1_addr <= x"000a";

	wait for 100 ns;

end process;


end behav;
