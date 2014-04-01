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
	n_clk		: in std_logic;
	reset		: in std_logic;

	proc_m		: in ocp_io_m;
	proc_s		: out ocp_io_s;

	spm_m		: out spm_master;
	spm_s		: in spm_slave;

    -- router ports
    north_in_f		 : in channel_forward;
	north_in_b		 : out channel_backward;
	east_in_f	     : in channel_forward;
	east_in_b	     : out channel_backward;
	south_in_f		 : in channel_forward;
	south_in_b		 : out channel_backward;
	west_in_f	     : in channel_forward;
	west_in_b	     : out channel_backward;

	-- Output ports
	north_out_f		 : out channel_forward;
	north_out_b		 : in channel_backward;
	east_out_f		 : out channel_forward;
	east_out_b		 : in channel_backward;
	south_out_f		 : out channel_forward;
	south_out_b		 : in channel_backward;
	west_out_f		 : out channel_forward;
	west_out_b		 : in channel_backward

);

end noc_node;

architecture struct of noc_node is

------------------------------component declarations----------------------------


------------------------------signal declarations----------------------------

signal ip_to_net_f	: channel_forward;
signal ip_to_net_b	: channel_backward;
signal net_to_ip_f	: channel_forward;
signal net_to_ip_b	: channel_backward;

signal ip_to_net_link	: link_t;
signal net_to_ip_link   : link_t;

signal fifo_to_net_f      : channel_forward;
signal fifo_to_net_b      : channel_backward;
signal net_to_fifo_f      : channel_forward;
signal net_to_fifo_b      : channel_backward;

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
	proc_in=>proc_m,
	proc_out=>proc_s,

	-- SPM Data Port - OCP?
	spm_in=>spm_s,
	spm_out=>spm_m,

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
ip_to_net_f.req <= not del_half_clk0 after 2 ns;
ip_to_net_f.data <= ip_to_net_link;


-- <= ip_to_net_b.ack;
-- <= net_to_ip_f.req;
net_to_ip_link <= net_to_ip_f.data;
net_to_ip_b.ack <= not del_half_clk0 after 2 ns;

-- NoC switch instance
   r : entity work.router
   port map (
		preset         => reset,
		-- Input ports
		north_in_f		 => north_in_f,
		north_in_b		 => north_in_b,
		east_in_f	     => east_in_f,
		east_in_b	     => east_in_b,
		south_in_f		 => south_in_f,
		south_in_b		 => south_in_b,
		west_in_f	     => west_in_f,
		west_in_b	     => west_in_b,
		resource_in_f	 => fifo_to_net_f,
		resource_in_b	 => fifo_to_net_b,

		-- Output ports
		north_out_f		 => north_out_f,
		north_out_b		 => north_out_b,
		east_out_f		 => east_out_f,
		east_out_b		 => east_out_b,
		south_out_f		 => south_out_f,
		south_out_b		 => south_out_b,
		west_out_f		 => west_out_f,
		west_out_b		 => west_out_b,
		resource_out_f	 => net_to_fifo_f,
		resource_out_b	 => net_to_fifo_b

   );


input_fifo : entity work.fifo(rtl)
  generic map (
    N => 0,  				-- 1
    TOKEN => EMPTY_BUBBLE,
    GENERATE_REQUEST_DELAY => 1,  	-- 1
    GENERATE_ACKNOWLEDGE_DELAY => 1,  	-- 1
    GATING_ENABLED => 0    
  )
  port map (
    preset    => reset,
    left_in   => ip_to_net_f,
    left_out  => ip_to_net_b,
    right_out => fifo_to_net_f,
    right_in  => fifo_to_net_b
  );

output_fifo : entity work.fifo(rtl)
  generic map (
    N => 0,  				-- 2
    TOKEN => VALID_TOKEN,
    GENERATE_REQUEST_DELAY => 1,  	-- 1
    GENERATE_ACKNOWLEDGE_DELAY => 1,  	-- 1
    GATING_ENABLED => 0
  )
  port map (
    preset    => reset,
    left_in   => net_to_fifo_f,
    left_out  => net_to_fifo_b,
    right_out => net_to_ip_f,
    right_in  => net_to_ip_b
  );

end struct;
