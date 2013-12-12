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
-- The asynchronous router.
--
-- Author: Evangelia Kasapaki
--	   Rasmus Bo Sorensen
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.noc_defs.all;

-- A switch has a total pin-count of 5*(34+1)*2 + 5*1*2 + 1 = 361

entity router is
	port (
		preset         : in std_logic;

		-- Input ports
		north_in		 : inout channel;
		east_in		     : inout channel;
		south_in		 : inout channel;
		west_in		     : inout channel;
		resource_in		 : inout channel;

		-- Output ports
		north_out		 : inout channel;
		east_out		 : inout channel;
		south_out		 : inout channel;
		west_out		 : inout channel;
		resource_out	 : inout channel

		--sim_time	   : in integer
	);
end entity router;


architecture struct of router is
	signal north_hpu   : channel;
	signal south_hpu   : channel;
	signal east_hpu    : channel;
	signal west_hpu    : channel;
	signal resource_hpu: channel;

	signal switch_sel : switch_sel_t;
	signal chs_in_f  : chs_f;
	signal chs_in_b  : chs_b;

	signal latches_out_f : chs_f;
	signal latches_out_b : chs_b;

begin

	-- Input latches, converting from 2-phased LEDR to 2-phased bundled data
	input_latches: block
	begin
		north_in_latch : entity work.channel_latch(struct)
		generic map (
			init_token => EMPTY_BUBBLE
		)
		port map (
			preset    => preset,
			left_in   => north_in.forward,
			left_out  => north_in.backward,
			right_out => north_hpu.forward,
			right_in  => north_hpu.backward,
                        lt_enable => open
		);

		south_in_latch : entity work.channel_latch(struct)
		generic map (
			init_token => EMPTY_BUBBLE
		)
		port map (
			preset    => preset,
			left_in   => south_in.forward,
			left_out  => south_in.backward,
			right_out => south_hpu.forward,
			right_in  => south_hpu.backward,
                        lt_enable => open
		);

		east_in_latch : entity work.channel_latch(struct)
		generic map (
			init_token => EMPTY_BUBBLE
		)
		port map (
			preset    => preset,
			left_in   => east_in.forward,
			left_out  => east_in.backward,
			right_out => east_hpu.forward,
			right_in  => east_hpu.backward,
                        lt_enable => open
		);

		west_in_latch : entity work.channel_latch(struct)
		generic map (
			init_token => EMPTY_BUBBLE
		)
		port map (
			preset    => preset,
			left_in   => west_in.forward,
			left_out  => west_in.backward,
			right_out => west_hpu.forward,
			right_in  => west_hpu.backward,
                        lt_enable => open
		);

		resource_in_latch : entity work.channel_latch(struct)
		generic map (
			init_token => EMPTY_BUBBLE
		)
		port map (
			preset    => preset,
			left_in   => resource_in.forward,
			left_out  => resource_in.backward,
			right_out => resource_hpu.forward,
			right_in  => resource_hpu.backward,
                        lt_enable => open
		);
	end block input_latches;


	-- The HPUs and a channel latch
	hpus: block
	begin
		north_hpu_inst : entity work.hpu(struct)
		generic map (
			IS_NI => FALSE,
			THIS_PORT => "00"
		)
		port map (
			preset     => preset,
			chan_in_f  => north_hpu.forward,
			chan_in_b  => north_hpu.backward,
			chan_out_f => chs_in_f(0),
			chan_out_b => chs_in_b(0),
			sel        => switch_sel(0)		-- North is index 0
		);

		south_hpu_inst : entity work.hpu(struct)
		generic map (
			IS_NI => FALSE,
			THIS_PORT => "10"
		)
		port map (
			preset     => preset,
			chan_in_f  => south_hpu.forward,
			chan_in_b  => south_hpu.backward,
			chan_out_f => chs_in_f(2),
			chan_out_b => chs_in_b(2),
			sel        => switch_sel(2)
		);

		east_hpu_inst : entity work.hpu(struct)
		generic map (
			IS_NI => FALSE,
			THIS_PORT => "01"
		)
		port map (
			preset     => preset,
			chan_in_f  => east_hpu.forward,
			chan_in_b  => east_hpu.backward,
			chan_out_f => chs_in_f(1),
			chan_out_b => chs_in_b(1),
			sel        => switch_sel(1)
		);

		west_hpu_inst : entity work.hpu(struct)
		generic map (
			IS_NI => FALSE,
			THIS_PORT => "11"
		)
		port map (
			preset     => preset,
			chan_in_f  => west_hpu.forward,
			chan_in_b  => west_hpu.backward,
			chan_out_f => chs_in_f(3),
			chan_out_b => chs_in_b(3),
			sel        => switch_sel(3)
		);

		resource_hpu_inst : entity work.hpu(struct)
		generic map (
			IS_NI => TRUE,
			THIS_PORT => "--"
		)
		port map (
			preset     => preset,
			chan_in_f  => resource_hpu.forward,
			chan_in_b  => resource_hpu.backward,
			chan_out_f => chs_in_f(4),
			chan_out_b => chs_in_b(4),
			sel        => switch_sel(4)
		);
	end block hpus;

	-- The crossbar
	xbar_with_latches : entity work.crossbar_stage(struct)
	port map (
		preset        => preset,
		switch_sel    => switch_sel,

		chs_in_f      => chs_in_f,
		chs_in_b      => chs_in_b,
		latches_out_f => latches_out_f,
		latches_out_b => latches_out_b

		--sim_time	  => sim_time
	);

	north_out.forward <= latches_out_f(0);
	latches_out_b(0) <= north_out.backward;

	south_out.forward <= latches_out_f(2);
	latches_out_b(2) <= south_out.backward;

	east_out.forward <= latches_out_f(1);
	latches_out_b(1) <= east_out.backward;

	west_out.forward <= latches_out_f(3);
	latches_out_b(3) <= west_out.backward;

	resource_out.forward <= latches_out_f(4);
	latches_out_b(4) <= resource_out.backward;

end architecture struct;
