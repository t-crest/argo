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

	    -- router ports
    north_in_f       : in channel_forward;
    north_in_b       : out channel_backward;
    east_in_f        : in channel_forward;
    east_in_b        : out channel_backward;
    south_in_f       : in channel_forward;
    south_in_b       : out channel_backward;
    west_in_f        : in channel_forward;
    west_in_b        : out channel_backward;

    -- Output ports
    north_out_f      : out channel_forward;
    north_out_b      : in channel_backward;
    east_out_f       : out channel_forward;
    east_out_b       : in channel_backward;
    south_out_f      : out channel_forward;
    south_out_b      : in channel_backward;
    west_out_f       : out channel_forward;
    west_out_b       : in channel_backward

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
	pkt_in		: in  link_t;

-- Outgoing Port
	pkt_out		: out link_t

);
end component;

--1 router
component router is
	port (
		clk	: in std_logic;
		reset	: in std_logic;
		inPort_f	: in router_port_f;
		inPort_b	: out router_port_b;
		outPort_f	: out router_port_f;
		outPort_b	: in router_port_b
	);
end component;

------------------------------signal declarations----------------------------

signal ip_to_net	: link_t;
signal net_to_ip	: link_t;
signal req, ack : std_logic;

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
	inPort_f(0) => south_in_f,
	inPort_f(1) => west_in_f,
	inPort_f(2) => north_in_f,
	inPort_f(3) => east_in_f,
	inPort_f(4).data => ip_to_net,
	inPort_f(4).req => '0',
	outPort_f(0) => south_out_f,
	outPort_f(1) => west_out_f,
	outPort_f(2) => north_out_f,
	outPort_f(3) => east_out_f,
	outPort_f(4).data => net_to_ip,
	outPort_f(4).req => req,

	inPort_b(0) => south_in_b,
	inPort_b(1) => west_in_b,
	inPort_b(2) => north_in_b,
	inPort_b(3) => east_in_b,
	inPort_b(4).ack => ack,
	outPort_b(0) => south_out_b,
	outPort_b(1) => west_out_b,
	outPort_b(2) => north_out_b,
	outPort_b(3) => east_out_b,
	outPort_b(4).ack => '0'
);


end struct;
