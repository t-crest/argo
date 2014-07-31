-- 
-- Copyright Technical University of Denmark. All rights reserved.
-- This file is part of the T-CREST project.
-- 
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
-- 
--    1. Redistributions of source code must retain the above copyright notice,
--	 this list of conditions and the following disclaimer.
-- 
--    2. Redistributions in binary form must reproduce the above copyright
--	 notice, this list of conditions and the following disclaimer in the
--	 documentation and/or other materials provided with the distribution.
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
-- A click router
--
-- Authors: Christoph Mueller
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--	Click	      Comb.		Click		Comb.	       Click
--	Stage	      Stagr		Stage	       Crossbar	       Stage
--    +--------+    +---------+	    +-----------+    +---------+    +---------+
-- -> | in_s_0 | -> | HPU_c_0 | --> |  HPU_s_0	| -> |	 XBar  | -> | out_0_s | ->
--    +--------+    +---------+ \   +-----------+    |	       |    +---------+
--				 -> | XbarConf0 | -> | \     / |
--				    +-----------+    |	\   /  |
--						     |	 \ /   |
--	  ...	       ...		 ...	     |	  X    |	...
--						     |	 / \   |
--    +--------+    +---------+	    +-----------+    |	/   \  |    +---------+
-- -> | in_s_4 | -> | HPU_c_4 | --> |  HPU_s_4	| -> | /     \ | -> | out_4_d | ->
--    +--------+    +---------+ \   +-----------+    |	       |    +---------+
--				 -> | XbarConf4 | -> |	       | 
--				    +-----------+    +---------+
--		 ^		 ^		  ^		 ^ 
--		 |		 |		  |		 |
--	  in_s_TO_hpu_c	 hpu_c_TO_hpu_s,  hpu_s_TO_xbar	  xbar_TO_out_s
--			 xbar_conf		   
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.NUMERIC_STD.all;
use work.config_types.all;
use work.config.all;
use work.noc_defs.all;
use work.delays.all;

entity router is
  generic (
    --						   local port            all other ports
    in_phase  : std_logic_vector(ARITY - 1 downto 0) := "1" & (ARITY - 2 downto 0 => '1');
    hpu_phase : std_logic_vector(ARITY - 1 downto 0) := "1" & (ARITY - 2 downto 0 => '0');
    out_phase : std_logic_vector(ARITY - 1 downto 0) := "1" & (ARITY - 2 downto 0 => '1'));
  port (
    preset	  : in	std_logic;
    -- Input ports
    north_in_f	  : in	channel_forward;
    north_in_b	  : out channel_backward;
    east_in_f	  : in	channel_forward;
    east_in_b	  : out channel_backward;
    south_in_f	  : in	channel_forward;
    south_in_b	  : out channel_backward;
    west_in_f	  : in	channel_forward;
    west_in_b	  : out channel_backward;
    resource_in_f : in	channel_forward;
    resource_in_b : out channel_backward;

    -- Output ports
    north_out_f	   : out channel_forward;
    north_out_b	   : in	 channel_backward;
    east_out_f	   : out channel_forward;
    east_out_b	   : in	 channel_backward;
    south_out_f	   : out channel_forward;
    south_out_b	   : in	 channel_backward;
    west_out_f	   : out channel_forward;
    west_out_b	   : in	 channel_backward;
    resource_out_f : out channel_forward;
    resource_out_b : in	 channel_backward
    );
end entity router;

architecture click_router of router is
  signal left_in, right_out		: channel_forward_vector(ARITY - 1 downto 0);
  signal left_out, right_in		: channel_backward_vector(ARITY - 1 downto 0);
  -- input click stage to hpu combinatorial
  signal in_s_TO_hpu_c_FW		: channel_forward_vector(ARITY - 1 downto 0);
  signal in_s_TO_hpu_c_BW		: channel_backward_vector(ARITY - 1 downto 0);
  -- hpu combinatorial to hpu click stage
  signal hpu_c_TO_hpu_s_FW		: channel_forward_vector(ARITY - 1 downto 0);
  signal hpu_c_TO_hpu_s_BW		: channel_backward_vector(ARITY - 1 downto 0);
  -- hpu click stage to crossbar
  signal hpu_s_TO_xbar_FW		: channel_forward_vector(ARITY - 1 downto 0);
  signal hpu_s_TO_xbar_BW		: channel_backward_vector(ARITY - 1 downto 0);
  -- crossbar to output click stage
  signal xbar_TO_out_s_FW		: channel_forward_vector(ARITY - 1 downto 0);
  signal xbar_TO_out_s_BW		: channel_backward_vector(ARITY - 1 downto 0);
  -- joined requests/acknowledgements used for synchronisation in the crossbar
  signal xbar_reqs			: std_logic_vector(ARITY - 1 downto 0);
  signal xbar_acks			: std_logic_vector(ARITY - 1 downto 0);
  -- click outputs of the stages
  signal click_in, click_hpu, click_out : std_logic_vector(ARITY-1 downto 0);
  -- crossbar configuration
  signal xbar_conf			: switch_sel_t;

  component click_stage is
    generic (
      GENERATE_REQUEST_DELAY	 : integer;
      GENERATE_ACKNOWLEDGE_DELAY : integer;
      RESET_STATE		 : std_logic;
      init_phase		 : std_logic;
      init_phase_left		 : std_logic;
      init_phase_right		 : std_logic;
      init_data			 : phit_t;
      left_N			 : natural;
      right_N			 : natural);
    port (
      reset	 : in  std_logic;
      left_data	 : in  link_t;
      right_data : out link_t;
      left_req	 : in  std_logic_vector(left_N - 1 downto 0);
      right_req	 : out std_logic;
      left_ack	 : out std_logic;
      right_ack	 : in  std_logic_vector(right_N - 1 downto 0);
      click_out	 : out std_logic);
  end component click_stage;

  component hpu_c is
    generic (
      is_ni	: boolean;
      this_port : std_logic_vector(1 downto 0));
    port (
      preset	: in  std_logic;
      left_in	: in  channel_forward;
      left_out	: out channel_backward;
      right_in	: in  channel_forward;
      right_out : out channel_backward;
      xbar_conf : out onehot_sel;
      click	: in  std_logic);
  end component hpu_c;

  component crossbar is
    port (
      preset	 : in  std_logic;
      switch_sel : in  switch_sel_t;
      left_in	 : in  channel_forward_vector(ARITY - 1 downto 0);
      left_out	 : out channel_backward_vector(ARITY - 1 downto 0);
      right_out	 : out channel_forward_vector(ARITY - 1 downto 0);
      right_in	 : in  channel_backward_vector(ARITY - 1 downto 0));
  end component crossbar;
  
begin  -- architecture click_router
  -- Assign pipeline inputs/outputs to entity inputs/outputs
  -- 0: North channel
  left_in(0)	 <= north_in_f;
  north_in_b	 <= left_out(0);
  north_out_f	 <= right_out(0);
  right_in(0)	 <= north_out_b;
  -- 1: East channel
  left_in(1)	 <= east_in_f;
  east_in_b	 <= left_out(1);
  east_out_f	 <= right_out(1);
  right_in(1)	 <= east_out_b;
  -- 2: South channel
  left_in(2)	 <= south_in_f;
  south_in_b	 <= left_out(2);
  south_out_f	 <= right_out(2);
  right_in(2)	 <= south_out_b;
  -- 3: West channel
  left_in(3)	 <= west_in_f;
  west_in_b	 <= left_out(3);
  west_out_f	 <= right_out(3);
  right_in(3)	 <= west_out_b;
  -- 4: Network Interface
  left_in(4)	 <= resource_in_f;
  resource_in_b	 <= left_out(4);
  resource_out_f <= right_out(4);
  right_in(4)	 <= resource_out_b;

  router_pipeline : for i in ARITY - 1 downto 0 generate
    constant is_ni : boolean := (i = ARITY - 1);
  begin
    ---------------------------------------------------------------------------
    -- Input stages
    ---------------------------------------------------------------------------
    in_s : entity work.click_stage
      generic map (
	GENERATE_REQUEST_DELAY => 1,
	init_phase	       => in_phase(i),
--	init_phase_left	       => out_phase,
--	init_phase_right       => hpu_phase,
	init_data	       => (others => '0'),
	left_N		       => 1,
	right_N		       => 1)
      port map (
	reset	     => preset,
	left_data    => left_in(i).data,
	right_data   => in_s_TO_hpu_c_FW(i).data,
	left_req(0)  => left_in(i).req,
	right_req    => in_s_TO_hpu_c_FW(i).req,
	left_ack     => left_out(i).ack,
	right_ack(0) => in_s_TO_hpu_c_BW(i).ack,
	click_out    => click_in(i));

    ----------------------------------------------------------------------------
    -- HPU combinational
    ----------------------------------------------------------------------------
    hpu_c : entity work.hpu_c
      generic map (
	is_ni	  => is_ni,
	this_port => std_logic_vector(to_unsigned(i, 2)))
      port map (
	preset	  => preset,
	left_in	  => in_s_TO_hpu_c_FW(i),
	left_out  => in_s_TO_hpu_c_BW(i),
	right_in  => hpu_c_TO_hpu_s_BW(i),
	right_out => hpu_c_TO_hpu_s_FW(i),
	xbar_conf => xbar_conf(i),
	click	  => click_hpu(i));

    ----------------------------------------------------------------------------
    -- HPU stages
    ----------------------------------------------------------------------------
    hpu_s : entity work.click_stage
      
      generic map (
	GENERATE_REQUEST_DELAY => 1,
	init_phase	       => hpu_phase(i),
--	init_phase_left	       => in_phase,
--	init_phase_right       => out_phase,
	init_data	       => (others => '0'),
	left_N		       => 1,
	right_N		       => ARITY)
      port map (
	reset	    => preset,
	left_data   => hpu_c_TO_hpu_s_FW(i).data,
	right_data  => hpu_s_TO_xbar_FW(i).data,
	left_req(0) => hpu_c_TO_hpu_s_FW(i).req,
	right_req   => hpu_s_TO_xbar_FW(i).req,
	left_ack    => hpu_c_TO_hpu_s_BW(i).ack,
	right_ack   => xbar_acks,
	click_out   => click_hpu(i));

    ----------------------------------------------------------------------------
    -- Crossbar related 
    ----------------------------------------------------------------------------

    -- Collect the requests & acknowledges for synchronisation, add delay
    -- elements to request
    --delay_req_element : entity work.matched_delay
    --	generic map(size => crossbar_sync_req_delay)
    --	port map(d => hpu_s_TO_xbar_FW(i).req,
    --	       z => xbar_reqs(i));
    xbar_reqs(i) <= hpu_s_TO_xbar_FW(i).req;
    xbar_acks(i) <= xbar_TO_out_s_BW(i).ack;
    --hpu_s_TO_xbar_BW(i).ack;

    -----------------------------------------------------------------------------
    -- The crossbar combinatorics
    -----------------------------------------------------------------------------
    -- only a single crossbar is needed, so only instanciate it once
    -- kept in this loop to keep the instanciations in order with the data
    -- flow through the pipeline
    xbar_instance : if is_ni generate
      xbar : entity work.crossbar
	port map (
	  preset     => preset,
	  switch_sel => xbar_conf,
	  left_in    => hpu_s_TO_xbar_FW,
	  left_out   => hpu_s_TO_xbar_BW,
	  right_out  => xbar_TO_out_s_FW,
	  right_in   => xbar_TO_out_s_BW);
    end generate xbar_instance;


    ----------------------------------------------------------------------------
    -- Output stages
    ----------------------------------------------------------------------------
    out_s : entity work.click_stage
      generic map (
	GENERATE_REQUEST_DELAY => 1,
	init_phase	       => out_phase(i),  
--	init_phase_left	       => hpu_phase,
--	init_phase_right       => in_phase,
	init_data	       => (others => '0'),
	left_N		       => ARITY,
	right_N		       => 1)
      port map (
	reset	     => preset,
	left_data    => xbar_TO_out_s_FW(i).data,
	right_data   => right_out(i).data,
	left_req     => xbar_reqs,
	right_req    => right_out(i).req,
	left_ack     => xbar_TO_out_s_BW(i).ack,
	right_ack(0) => right_in(i).ack,
	click_out    => click_out(i)); 
  end generate router_pipeline;
end architecture click_router;
