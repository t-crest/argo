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
-- The combinatorial part of the HPU of the asynchronous router.
--
-- Author: Evangelia Kasapaki
--         Rasmus Bo Sorensen
--         Christoph Mueller
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.config_types.all;
use work.config.all;
use work.noc_defs.all;
use work.delays.all;


entity hpu_c is
  generic (
    is_ni     : boolean                      := false;
    this_port : std_logic_vector(1 downto 0) := "01"
    );
  port (
    preset : in std_logic;

    left_in  : in  channel_forward;
    left_out : out channel_backward;

    right_out  : out channel_forward;
    right_in : in  channel_backward;

    xbar_conf : out onehot_sel;
    click: in std_logic
    );
end hpu_c;


architecture struct of hpu_c is
  signal sel, sel_next, sel_onehot, sel_internal : onehot_sel;

  -- VLD_TYPE bit shows type of the phit (phit or void)
  -- SOP high on start of packet, EOP high on end of packet
  alias VLD_TYPE : std_logic is left_in.data(LINK_WIDTH-1);
  alias SOP      : std_logic is left_in.data(LINK_WIDTH-2);
  alias EOP      : std_logic is left_in.data(LINK_WIDTH-3);

  -- route for this router
  alias DEST_PORT : std_logic_vector(1 downto 0) is left_in.data(1 downto 0);

  -- route to forward to the next router
  alias ROUTE_NEXT : std_logic_vector(13 downto 0) is left_in.data(15 downto 2);

  -- where the shifted route goes to...
  alias ROUTE_OUT : std_logic_vector(15 downto 0) is right_out.data(15 downto 0);

  -- handshake signals
  alias IN_REQ  : std_logic is left_in.req;
  alias IN_ACK  : std_logic is left_out.ack;
  alias OUT_REQ : std_logic is right_out.req;
  alias OUT_ACK : std_logic is right_in.ack;

  signal REQ_INT, OUT_REQ_INT : std_logic;

  signal sel_latch_en : std_logic;

  attribute max_fanout                  : string;
  attribute buffer_type                 : string;
  attribute max_fanout of sel_latch_en  : signal is "10";
  attribute buffer_type of sel_latch_en : signal is "none";

begin

  -- one hot decoder for the destination port
  one_hot_decoder : block
  begin
    gen_not_ni : if is_ni = false generate
      sel_onehot <= "10000" when DEST_PORT = this_port else  -- 4: NI
                    "00001" when DEST_PORT = "00" else       -- 0: North
                    "00010" when DEST_PORT = "01" else       -- 1: East
                    "00100" when DEST_PORT = "10" else       -- 2: South
                    "01000";  -- when DEST_PORT = "11" else            -- 3: West
    end generate gen_not_ni;

    gen_is_ni : if is_ni = true generate
      sel_onehot <= "00001" when DEST_PORT = "00" else  -- 0: North
                    "00010" when DEST_PORT = "01" else  -- 1: East
                    "00100" when DEST_PORT = "10" else  -- 2: South
                    "01000";  -- when DEST_PORT = "11" else            -- 3: West
    end generate gen_is_ni;
  end block one_hot_decoder;

  -- mux in the new route in case of SOP, else keep the old route
  sel_internal <= sel_onehot when SOP='1' else sel;
  -- disable route if not valid 
  and_zero : for i in sel_onehot'range generate
    sel_next(i) <= VLD_TYPE and sel_internal(i);
  end generate and_zero;
  -- register storing the selection
  sel_register: process (click, preset) is
  begin  -- process sel_register
    if preset = '1' then                -- asynchronous reset (active low)
      sel <= (others => '0');
    elsif click'event and click = '1' then  -- rising clock edge
      sel <= sel_next;
    end if;
  end process sel_register;
  -- route selection out
  xbar_conf <= sel;
  
  req_delay : entity work.matched_delay
    generic map(size => hpu_first_req_delay)
    port map(d => IN_REQ,
             z => OUT_REQ_INT);


  comb : process (left_in, right_in, VLD_TYPE, SOP, OUT_REQ_INT) is
  begin
    -- default case: forward everything
    left_out  <= right_in;
    right_out <= left_in;

    -- implement delays (overrides req in assotiation above!)
    OUT_REQ <= OUT_REQ_INT;

    -- This is the header phit, so we shift the addr so the next switch knows where to route the packet.
    -- This allows one-hot decoding logic to always be driven by bottom 2 LSb's.
    -- override default: shift route
    if (VLD_TYPE = '1' and SOP = '1') then
      ROUTE_OUT <= "00" & ROUTE_NEXT;
    end if;
  end process comb;


end architecture struct;





