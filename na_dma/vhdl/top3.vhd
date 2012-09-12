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
-- Simple testbench of
--	reconfigurable schedule
--	processor ocp interface
--	DMA private or normal mode
--	DMA-network control
--
-- Author: Evangelia Kasapaki
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.defs.all;


entity top3 is
end top3;

architecture behav of top3 is
	
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
signal p_ocp_master		: ocp_master;
--signal p_ocp_MCmd		: std_logic_vector(OCP_CMD_WIDTH-1 downto 0);
--signal p_ocp_MAddr		: std_logic_vector(OCP_ADDR_WIDTH-1 downto 0);
--signal p_ocp_MData		: std_logic_vector(OCP_DATA_WIDTH-1 downto 0);

--auta ta pairnw eisodo
signal p_ocp_slave		: ocp_slave;
--signal p_ocp_SCmdAccept		: std_logic;
--signal p_ocp_SResp		: std_logic;
--signal p_ocp_SData		: std_logic_vector(OCP_DATA_WIDTH-1 downto 0);

--signal m_ocp_ ocp interface na with SPM
--ta syndew mono
signal spm_ocp_master		: ocp_master_spm;
--signal m_ocp_MCmd		: std_logic_vector(OCP_CMD_WIDTH-1 downto 0);
--signal m_ocp_MAddr		: std_logic_vector(OCP_ADDR_WIDTH-1 downto 0);
--signal m_ocp_MData		: std_logic_vector(SPM_DATA_WIDTH-1 downto 0);

signal spm_ocp_slave		: ocp_slave_spm;
--signal m_ocp_SCmdAccept		: std_logic;
--signal m_ocp_SResp		: std_logic;
--signal m_ocp_SData		: std_logic_vector(SPM_DATA_WIDTH-1 downto 0);

--signal pm_ocp_ ocp interface proc with SPM
-- for now simple ram interface
--signal p_spm_master		: ocp_master;
signal p_wr			: std_logic;
signal p_addr			: std_logic_vector(SPM_ADDR_WIDTH-1 downto 0);
signal p_din			: std_logic_vector(SPM_DATA_WIDTH-1 downto 0);
signal p_dout			: std_logic_vector(SPM_DATA_WIDTH-1 downto 0);

--network ports
signal pkt_to_noc		: network_link;
signal pkt_from_noc		: network_link;
signal val			: std_logic_vector(PHIT_WIDTH-1 downto 0);



begin

-- High SPM instance
spm_h : bram_tdp
generic map (DATA=>DATA_WIDTH, ADDR => SPM_ADDR_WIDTH)
port map (a_clk => p_clk, 
	a_wr => p_wr, 
	a_addr => p_addr, 
	a_din => p_din(63 downto 32), a_dout => p_dout(63 downto 32), 
	b_clk => na_clk, 
	b_wr => spm_ocp_master.MCmd(0), 
	b_addr => spm_ocp_master.MAddr(SPM_ADDR_WIDTH-1 downto 0), 
	b_din => spm_ocp_master.MData(63 downto 32), 
	b_dout => spm_ocp_slave.SData(63 downto 32));

-- Low SPM instance
spm_l : bram_tdp
generic map (DATA => DATA_WIDTH, ADDR => SPM_ADDR_WIDTH)
port map (a_clk => p_clk, 
	a_wr =>  p_wr, 
	a_addr => p_addr, 
	a_din => p_din(31 downto 0), 
	a_dout => p_dout(31 downto 0), 
	b_clk => na_clk, 
	b_wr => spm_ocp_master.MCmd(0), 
	b_addr =>spm_ocp_master.MAddr(SPM_ADDR_WIDTH-1 downto 0), 
	b_din => spm_ocp_master.MData(31 downto 0), 
	b_dout => spm_ocp_slave.SData(31 downto 0));

-- NA instance
na : nAdapter
port map(
	-- General
	na_clk=>na_clk, na_reset=>reset,

	-- Processor Ports
	-- DMA Configuration Port - OCP
	proc_in=>p_ocp_master,
	proc_out=>p_ocp_slave,
	     
	-- SPM Data Port - OCP?
	spm_in=>spm_ocp_slave,
	
	spm_out=>spm_ocp_master,

	-- Network Ports
	-- Incoming Port
	pkt_in=>pkt_from_noc,
	-- Outgoing Port
	pkt_out=>pkt_to_noc
);


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
--initialize spm

--pkt_from_noc -do nothing
	pkt_from_noc.phit <= (others=>'0');--"00000000000000000000000000000000000";
--proc -> spm
	p_wr <= '0';
	p_addr <= (others=>'0');
	p_din <= (others=>'0');

	p_ocp_master.MCmd <= (others=>'0');
	p_ocp_master.MAddr <= (others=>'0');
	p_ocp_master.MData <= (others=>'0');


	--initialize slot table
	wait for 43 ns; --1
	-- ST(0) <= v0
	p_ocp_master.MCmd <="11";
	p_ocp_master.MAddr <= ST_MASK & x"000000";
	p_ocp_master.MData <= x"00000004";

	pkt_from_noc.phit <= "100" & x"00000000";

	wait for 10 ns; --2
	-- ST(1) <= v1
	p_ocp_master.MAddr <= ST_MASK & x"000001";
	p_ocp_master.MData <= x"00000005";

	pkt_from_noc.phit <= "010" & x"00010002";

	wait for 10 ns; --3
	-- ST(2) <= v2
	p_ocp_master.MAddr <= ST_MASK & x"000002";
	p_ocp_master.MData <= x"00000006";

	pkt_from_noc.phit <= "001" & x"00030004";

	wait for 10 ns; --1
	-- ST(3) <= v0
	p_ocp_master.MAddr <= ST_MASK & x"000003";
	p_ocp_master.MData <= x"00000004";

	pkt_from_noc.phit <= "100" & x"00010000";

	wait for 10 ns; --2
	-- ST(4) <= v1
	p_ocp_master.MAddr <= ST_MASK & x"000004";
	p_ocp_master.MData <= x"00000005";

	pkt_from_noc.phit <= "010" & x"00050006";

	wait for 10 ns; --3
	-- ST(5) <= v0
	p_ocp_master.MAddr <= ST_MASK & x"000005";
	p_ocp_master.MData <= x"00000004";

	pkt_from_noc.phit <= "001" & x"00070008";

	wait for 10 ns; --1
	-- ST(6) <= v1
	p_ocp_master.MAddr <= ST_MASK & x"000006";
	p_ocp_master.MData <= x"00000001";

	pkt_from_noc.phit <= "100" & x"00020000";

	wait for 10 ns; --2
	-- ST(7) <= v0
	p_ocp_master.MAddr <= ST_MASK & x"000007";
	p_ocp_master.MData <= x"00000004";

	pkt_from_noc.phit <= "010" & x"0009000a";

	wait for 10 ns; --3
	p_ocp_master.MCmd <= (others=>'0');
	p_ocp_master.MAddr <= ST_MASK & x"000006";

	pkt_from_noc.phit <= "001" & x"000b000c";

	--initialize routes
	wait for 10 ns; --1
	p_ocp_master.MCmd <="11";
	p_ocp_master.MAddr <= DMA_P_MASK & x"000000";
	p_ocp_master.MData <= x"12345678";

	pkt_from_noc.phit <= "100" & x"00030000";
	
	wait for 10 ns; --2
	p_ocp_master.MAddr <= DMA_P_MASK & x"000001";
	p_ocp_master.MData <= x"9abcdef1";

	pkt_from_noc.phit <= "010" & x"000d000e";

	wait for 10 ns; --3
	p_ocp_master.MCmd <= (others=>'0');

	pkt_from_noc.phit <= "001" & x"000f0010";

	--initialize dmas
	wait for 10 ns; --1
	p_ocp_master.MCmd <="11";
	p_ocp_master.MAddr <= DMA_MASK & x"000001";
	p_ocp_master.MData <= x"00000000";
	
	wait for 10 ns; --2
	p_ocp_master.MAddr <= DMA_MASK & x"000000";
	p_ocp_master.MData <= x"00008004";

	wait for 10 ns; --3
	p_ocp_master.MCmd <= (others=>'0');

	wait for 10 ns; --1
	p_ocp_master.MCmd <="11";
	p_ocp_master.MAddr <= DMA_MASK & x"000003";
	p_ocp_master.MData <= x"00020008";
	
	wait for 10 ns; --2
	p_ocp_master.MAddr <= DMA_MASK & x"000002";
	p_ocp_master.MData <= x"00008002";

	wait for 10 ns; --3
	p_ocp_master.MCmd <= (others=>'0');
	p_ocp_master.MAddr <= (others=>'0');
	
	wait for 90 ns; --3
	p_ocp_master.MAddr <= DMA_MASK & x"000001";
--proc -> na-dma
--sim
	wait for 300 ns;
end process;


-- simple counter generating random incomin packets from network
--val <= pkt_from_noc + 1;
--process (na_clk) begin
--	if reset='1' then
--		pkt_from_noc <= (others=>'0');
--	elsif rising_edge(na_clk) then
--		pkt_from_noc <= val after PDELAY;
--	end if;
--end process;

end behav;
