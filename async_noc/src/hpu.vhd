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
-- Header parsing unit for the TDM NoC router.
--
-- Author: Evangelia Kasapaki
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use work.noc_defs.all;


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
	signal data_in_valid    : std_logic;
	
	signal chan_internal_f  : channel_forward;
	signal chan_internal_b  : channel_backward;
	signal chan_int_out_f   : channel_forward;
	signal chan_int_out_b   : channel_backward;
	signal req_n            : std_logic;
        signal lt_en            : std_logic;
begin

	-- The data_in_valid signal is an xor between the request and the acknowledge signals.
	data_in_valid <= chan_internal_f.req xor chan_internal_b.ack after delay;	-- Assume early scheme (cf. Fig 7.2 in S&F)
	req_n <= transport not chan_in_f.req after 10*delay;
	chan_internal_f.req <= not req_n;	
	--chan_internal_f.req <= transport chan_in_f.req after 10*delay;
	chan_in_b <= chan_internal_b;
        chan_out_f <= chan_int_out_f;
        chan_int_out_b <= chan_out_b;


	hpu_combinatorial : entity work.hpu_comb(struct)
	generic map (
		is_ni     => is_ni,
		this_port => this_port
	)
	port map (
		data_valid => lt_en,
		data_in    => chan_in_f.data,
                preset     => preset,
		data_out   => chan_internal_f.data,
		sel        => sel
	);

	-- The pipeline lathes of the HPU stage
        resource_port: if is_ni=TRUE generate
          
	token_latch : entity work.channel_latch(struct)
	generic map (
		init_token => EMPTY_TOKEN
	)
	port map (
		preset    => preset,
		left_in   => chan_internal_f,
		left_out  => chan_internal_b,
		right_out => chan_int_out_f,
		right_in  => chan_int_out_b,
                lt_enable => lt_en
	);

        end generate resource_port;

        other_port: if is_ni=FALSE generate
          
 	token_latch : entity work.channel_latch(struct)
	generic map (
		init_token => VALID_TOKEN
	)
	port map (
		preset    => preset,
		left_in   => chan_internal_f,
		left_out  => chan_internal_b,
		right_out => chan_int_out_f,
		right_in  => chan_int_out_b,
                lt_enable => lt_en
	);

        end generate other_port;

	
end architecture struct;
