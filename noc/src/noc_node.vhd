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
-- NoC node for the TDM NoC, including SPMs, NI, router.
--
-- Author: Evangelia Kasapaki
-- Author: Rasmus Bo Soerensen (rasmus@rbscloud.dk)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.ocp.all;
use work.noc_defs.all;
use work.noc_interface.all;


entity noc_node is
port (
	p_clk		: std_logic;
	n_clk		: std_logic;
	reset		: std_logic;

	proc_m		: in ocp_io_m;
	proc_s      : out ocp_io_s;

	spm_m		: out spm_master;
	spm_s		: in spm_slave;

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

--1 na
component nAdapter is


port (
-- General
	na_clk		: in  std_logic;
	na_reset	: in  std_logic;

-- Processor Ports
-- DMA Configuration Port - OCP
	proc_in		: in ocp_io_m;
	proc_out	: out ocp_io_s;

-- SPM Data Port - OCP?
	spm_in		: in spm_slave;
	spm_out		: out spm_master;

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

begin

-- NA instance
na : nAdapter
port map(
	-- General
	na_clk=>n_clk,
	na_reset=>reset,

	-- Processor Ports
	-- DMA Configuration Port - OCP
	proc_in=>proc_m,
	proc_out=>proc_s,

	-- SPM Data Port - OCP?
	spm_in=>spm_s,
	spm_out=>spm_m,

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
