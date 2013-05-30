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
--------------------------------------------------------------------------------

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

	spm_in		: in ocp_slave_spm;
	spm_out		: out ocp_master_spm;

        -- router ports
       	north_in_f     : in channel_forward;  	north_in_b     : out channel_backward;
	east_in_f      : in channel_forward;  	east_in_b      : out channel_backward;
	south_in_f     : in channel_forward;  	south_in_b     : out channel_backward;
	west_in_f      : in channel_forward;  	west_in_b      : out channel_backward;

	north_out_f    : out channel_forward;  north_out_b    : in channel_backward;
	east_out_f     : out channel_forward; 	east_out_b     : in channel_backward;
	south_out_f    : out channel_forward; 	south_out_b    : in channel_backward;
	west_out_f     : out channel_forward; 	west_out_b     : in channel_backward

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
	proc_in		: in ocp_master;
	proc_out	: out ocp_slave;
	     
-- SPM Data Port - OCP?
	spm_in		: in ocp_slave_spm;
	spm_out		: out ocp_master_spm;

-- Network Ports
-- Incoming Port
	pkt_in		: in  link_t;

-- Outgoing Port
	pkt_out		: out link_t

);
end component;


------------------------------signal declarations----------------------------

signal ip_to_net_f	: channel_forward;
signal ip_to_net_b	: channel_backward;
signal net_to_ip_f	: channel_forward;
signal net_to_ip_b	: channel_backward;

signal ip_to_net	: link_t;
signal net_to_ip        : link_t;

--signal spm_to_net	: ocp_slave_spm;
--signal net_to_spm	: ocp_master_spm;

signal half_clk         : std_logic := '0';
signal del_half_clk0    : std_logic;
--signal del_half_clk1    : std_logic;

--signal net_spm_address      : std_logic_vector(SPM_ADDR_WIDTH-1 downto 0);

begin


-- NA instance
na : entity work.nAdapter
port map(
	-- General
	na_clk=>n_clk, 
	na_reset=>reset,

	-- Processor Ports
	-- DMA Configuration Port - OCP
	proc_in=>proc_in,
	proc_out=>proc_out,
	     
	-- SPM Data Port - OCP?
	spm_in=>spm_in,
	spm_out=>spm_out,

	-- Network Ports
	-- Incoming Port
	pkt_in=>net_to_ip,

	-- Outgoing Port
	pkt_out=>ip_to_net
);


-- generate 
half_clk_gen: process (n_clk, reset)
begin
        if reset='1' then
          half_clk <= '0';
        elsif rising_edge(n_clk) then
              half_clk <= not half_clk;
        end if;
end process half_clk_gen;

del_half_clk0 <= not half_clk;
--del_half_clk1 <= not del_half_clk0;
ip_to_net_f.req <= not del_half_clk0 after 2 ns;
ip_to_net_f.data <= ip_to_net;
-- <= ip_to_net_b.ack;
-- <= net_to_ip_f.req;
net_to_ip <= net_to_ip_f.data;
net_to_ip_b.ack <= not del_half_clk0 after 2 ns;

	-- NoC switch instance
	r : entity work.noc_switch(struct)
	port map (
		preset         => reset,
		-- Input ports
		north_in_f     => north_in_f,
		north_in_b     => north_in_b,
		east_in_f      => east_in_f,
		east_in_b      => east_in_b,
		south_in_f     => south_in_f,
		south_in_b     => south_in_b,
		west_in_f      => west_in_f,
		west_in_b      => west_in_b,
		resource_in_f  => ip_to_net_f,
		resource_in_b  => ip_to_net_b,
		-- Output ports
		north_out_f    => north_out_f,
		north_out_b    => north_out_b,
		east_out_f     => east_out_f,
		east_out_b     => east_out_b,
		south_out_f    => south_out_f,
		south_out_b    => south_out_b,
		west_out_f     => west_out_f,
		west_out_b     => west_out_b,
		resource_out_f => net_to_ip_f,
		resource_out_b => net_to_ip_b
	);

end struct;
