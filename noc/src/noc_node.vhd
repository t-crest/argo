library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.defs.all;


entity noc_node is
port (
	p_clk		: std_logic;
	n_clk		: std_logic;
	reset		: std_logic;

	proc_in		: in ocp_master;
	proc_out	: out ocp_slave;

	spm_in		: in ocp_master_spm;
	spm_out		: out ocp_slave_spm;

	inNorth		: in network_link;
	inSouth		: in network_link;
	inEast		: in network_link;
	inWest		: in network_link;

	outNorth	: out network_link;
	outSouth	: out network_link;
	outEast		: out network_link;
	outWest		: out network_link

);

end noc_node;

architecture struct of noc_node is

------------------------------component declarations----------------------------
--2 spms
component bram_tdp is

generic (
    DATA    : integer := 32;
    ADDR    : integer := 14
);

port (
-- Port A
    a_clk   : in  std_logic;
    a_wr    : in  std_logic;
    a_addr  : in  std_logic_vector(ADDR-1 downto 0);
    a_din   : in  std_logic_vector(DATA-1 downto 0);
    a_dout  : out std_logic_vector(DATA-1 downto 0);
     
-- Port B
    b_clk   : in  std_logic;
    b_wr    : in  std_logic;
    b_addr  : in  std_logic_vector(ADDR-1 downto 0);
    b_din   : in  std_logic_vector(DATA-1 downto 0);
    b_dout  : out std_logic_vector(DATA-1 downto 0)
);
end component;

--1 na
component nAdapter is


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

--1 router
component router is
	port (	
		clk	: in std_logic;
		reset	: in std_logic;
		inPort	: in routerPort;
		outPort	: out routerPort
	);
end component;

------------------------------signal declarations----------------------------

signal ip_to_net	: network_link;
signal net_to_ip	: network_link;

signal spm_to_net	: ocp_slave_spm;
signal net_to_spm	: ocp_master_spm;

begin


-- High SPM instance
spm_h : bram_tdp
generic map (DATA=>DATA_WIDTH, ADDR => SPM_ADDR_WIDTH)
port map (a_clk => p_clk, 
	a_wr => spm_in.MCmd(0), 
	a_addr => spm_in.MAddr(SPM_ADDR_WIDTH-1 downto 0), 
	a_din => spm_in.MData(63 downto 32), 
	a_dout => spm_out.SData(63 downto 32), 
	b_clk => n_clk,
	b_wr => net_to_spm.MCmd(0), 
	b_addr => net_to_spm.MAddr(SPM_ADDR_WIDTH-1 downto 0), 
	b_din => net_to_spm.MData(63 downto 32), 
	b_dout => spm_to_net.SData(63 downto 32));

-- Low SPM instance
spm_l : bram_tdp
generic map (DATA => DATA_WIDTH, ADDR => SPM_ADDR_WIDTH)
port map (a_clk => p_clk, 
	a_wr => spm_in.MCmd(0), 
	a_addr => spm_in.MAddr(SPM_ADDR_WIDTH-1 downto 0), 
	a_din => spm_in.MData(31 downto 0), 
	a_dout => spm_out.SData(31 downto 0), 
	b_clk => n_clk,
	b_wr => net_to_spm.MCmd(0), 
	b_addr => net_to_spm.MAddr(SPM_ADDR_WIDTH-1 downto 0), 
	b_din => net_to_spm.MData(31 downto 0), 
	b_dout => spm_to_net.SData(31 downto 0));

-- NA instance
na : nAdapter
port map(
	-- General
	na_clk=>n_clk, 
	na_reset=>reset,

	-- Processor Ports
	-- DMA Configuration Port - OCP
	proc_in=>proc_in,
	proc_out=>proc_out,
	     
	-- SPM Data Port - OCP?
	spm_in=>spm_to_net,
	spm_out=>net_to_spm,

	-- Network Ports
	-- Incoming Port
	pkt_in=>net_to_ip,

	-- Outgoing Port
	pkt_out=>ip_to_net
);

-- router instance
r : router
port map (
	clk => n_clk,
	reset => reset,
	inPort(0) => inSouth,
	inPort(1) => inWest,
	inPort(2) => inNorth,
	inPort(3) => inEast,
	inPort(4) => ip_to_net,
	outPort(0) => outSouth,
	outPort(1) => outWest,
	outPort(2) => outNorth,
	outPort(3) => outEast,
	outPort(4) => net_to_ip
);

end struct;
