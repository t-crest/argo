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
use work.noc_defs.all;
use work.ocp.all;
use work.noc_interface.all;


entity noc_node is
port (
	--p_clk		: std_logic;
	n_clk		: std_logic;
	reset		: std_logic;

	proc_in		: in ocp_io_m;
	proc_out	: out ocp_io_s;

	spm_in		: in spm_slave;
	spm_out		: out spm_master;

    -- router ports
    north_in 	: inout channel;
	east_in 	: inout channel;
	south_in 	: inout channel;
	west_in 	: inout channel;

	north_out 	: inout channel;
	east_out 	: inout channel;
	south_out 	: inout channel;
	west_out 	: inout channel

);

end noc_node;

architecture struct of noc_node is

------------------------------component declarations----------------------------


------------------------------signal declarations----------------------------

signal ip_to_net	: channel;
signal net_to_ip	: channel;

signal ip_to_net_link	: link_t;
signal net_to_ip_link   : link_t;

signal fifo_to_net      : channel;
signal net_to_fifo      : channel;

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
	pkt_in=>net_to_ip_link,

	-- Outgoing Port
	pkt_out=>ip_to_net_link
);


-- generate
half_clk_gen: process (n_clk, reset)
begin
        if reset='1' then
          half_clk <= '0';
        elsif falling_edge(n_clk) then
              half_clk <= not half_clk;
        end if;
end process half_clk_gen;


del_half_clk0 <= not half_clk;
--del_half_clk1 <= not del_half_clk0;
ip_to_net.forward.req <= not del_half_clk0 after 2 ns;
ip_to_net.forward.data <= ip_to_net_link;


-- <= ip_to_net_b.ack;
-- <= net_to_ip_f.req;
net_to_ip_link <= net_to_ip.forward.data;
net_to_ip.backward.ack <= not del_half_clk0 after 2 ns;

-- NoC switch instance
   r : entity work.router
   port map (
		preset         => reset,
		-- Input ports
		north_in       => north_in,
		east_in        => east_in,
		south_in       => south_in,
		west_in        => west_in,
		resource_in    => ip_to_net,
		-- Output ports
		north_out      => north_out,
		east_out       => east_out,
		south_out      => south_out,
		west_out       => west_out,
		resource_out   => net_to_ip

   );



end struct;
