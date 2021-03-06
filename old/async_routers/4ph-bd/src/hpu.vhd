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
-- The latch stage of the HPU of the asynchronous router.
--
-- Author: Evangelia Kasapaki
--	   Rasmus Bo Sorensen
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.defs.all;


entity hpu is
	generic (
		constant is_ni : boolean;
		constant this_port : std_logic_vector(1 downto 0)
	);
	port (
		preset     : in std_logic;

		chan_in_f  : in channel_forward;
		chan_in_b  : out channel_backward;
		
		chan_out_f : out channel_forward;
		chan_out_b : in channel_backward;
		
		sel        : out onehot_sel
	);
end hpu;


architecture struct of hpu is
	signal data_in_valid : std_logic;
	
	signal chan_internal_f : channel_forward;
	signal chan_internal_b : channel_backward;
	signal req_n : std_logic;
begin

	data_in_valid <= chan_in_f.req and (not chan_internal_b.ack);	-- Assume early scheme (cf. Fig 7.2 in S&F)
	--chan_internal_f.req <= transport chan_in_f.req after delay;
       	req_n <= transport not chan_in_f.req after delay;
	chan_internal_f.req <= not req_n;
	chan_in_b <= chan_internal_b;


	hpu_combinatorial : entity work.hpu_comb(struct)
	generic map (
		is_ni     => is_ni,
		this_port => this_port
	)
	port map (
		data_valid => data_in_valid,
		data_in    => chan_in_f.data,
		data_out   => chan_internal_f.data,
		sel        => sel
	);


	token_latch : entity work.channel_latch(struct)
	generic map (
		init_token => EMPTY_TOKEN
	)
	port map (
		preset    => preset,
		left_in   => chan_internal_f,
		left_out  => chan_internal_b,
		right_out => chan_out_f,
		right_in  => chan_out_b
	);
	
end architecture struct;
