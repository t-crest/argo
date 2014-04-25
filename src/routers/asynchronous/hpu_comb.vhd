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
-- The combinatorial part of the HPU of the asynchronous router.
--
-- Author: Evangelia Kasapaki
--	   Rasmus Bo Sorensen
--	   Christoph Mueller
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.config_types.all;
use work.noc_defs.all;


entity hpu_comb is
  generic (
    constant is_ni     : boolean		      := false;
    constant this_port : std_logic_vector(1 downto 0) := "01"
    );
  port (
    preset : in std_logic;

    chan_in_f : in  channel_forward;
    chan_in_b : out channel_backward;

    chan_out_f : out channel_forward;
    chan_out_b : in  channel_backward;

    sel : out onehot_sel
    );
end hpu_comb;


architecture struct of hpu_comb is
  signal sel_internal, sel_current, sel_next : onehot_sel;

  -- VLD_TYPE bit shows type of the phit (phit or void)
  -- SOP high on start of packet, EOP high on end of packet
  alias VLD_TYPE : std_logic is chan_in_f.data(LINK_WIDTH-1);
  alias SOP : std_logic is chan_in_f.data(LINK_WIDTH-2);
  alias EOP : std_logic is chan_in_f.data(LINK_WIDTH-3);

  -- route for this router
  alias DEST_PORT : std_logic_vector(1 downto 0) is chan_in_f.data(1 downto 0);

  -- route to forward to the next router
  alias ROUTE_NEXT : std_logic_vector(13 downto 0) is chan_in_f.data(15 downto 2);

  -- where the shifted route goes to...
  alias ROUTE_OUT : std_logic_vector(15 downto 0) is chan_out_f.data(15 downto 0);

  -- handshake signals
  alias IN_REQ	: std_logic is chan_in_f.req;
  alias IN_ACK	: std_logic is chan_in_b.ack;
  alias OUT_REQ : std_logic is chan_out_f.req;
  alias OUT_ACK : std_logic is chan_out_b.ack;

  signal REQ_INT : std_logic;

  signal sel_latch_en : std_logic;

begin

  one_hot_decoder : block
    signal sel_onehot : onehot_sel;
  begin
    gen_not_ni : if is_ni = false generate
      sel_onehot <= "10000" when DEST_PORT = this_port else  -- 4: NI
		    "00001" when DEST_PORT = "00" else	     -- 0: North
		    "00010" when DEST_PORT = "01" else	     -- 1: East
		    "00100" when DEST_PORT = "10" else	     -- 2: South
		    "01000";  -- when DEST_PORT = "11" else	       -- 3: West
    end generate gen_not_ni;

    gen_is_ni : if is_ni = true generate
      sel_onehot <= "00001" when DEST_PORT = "00" else	-- 0: North
		    "00010" when DEST_PORT = "01" else	-- 1: East
		    "00100" when DEST_PORT = "10" else	-- 2: South
		    "01000";  -- when DEST_PORT = "11" else	       -- 3: West
    end generate gen_is_ni;

    -- for empty phits and reset case: zero all select
    and_zero : for i in sel_onehot'range generate
      sel_internal(i) <= VLD_TYPE and sel_onehot(i);
    end generate and_zero;
  end block one_hot_decoder;

  sel_latch_en_generate: block is
    signal A, B, C: std_logic;
  begin  -- block sel_latch_en_generate
    A <= VLD_TYPE and SOP;
    B <= A or not VLD_TYPE;
    C <= REQ_INT xor OUT_ACK;
    sel_latch_en <= B and C;
  end block sel_latch_en_generate;

  sel_latch : process (sel_latch_en, preset, sel_internal) is
  begin
    if preset = '1' then
      sel <= (others => '0');
    elsif sel_latch_en = '1' then
      sel <= sel_internal;
    end if;
  end process sel_latch;

  comb : process (chan_in_f, chan_out_b, VLD_TYPE, SOP, REQ_INT) is
  begin
    -- default case: forward everything
    chan_in_b  <= chan_out_b;
    chan_out_f <= chan_in_f;

    -- implement delays (overrides req in assotiation above!)
    REQ_INT <= inject_delay_line(IN_REQ);
    OUT_REQ <= inject_delay_line(REQ_INT);

    -- This is the header phit, so we shift the addr so the next switch knows where to route the packet.
    -- This allows one-hot decoding logic to always be driven by bottom 2 LSb's.
    -- override default: shift route
    if (VLD_TYPE = '1' and SOP = '1') then
      ROUTE_OUT <= "00" & ROUTE_NEXT;
    end if;
  end process comb;


end architecture struct;





