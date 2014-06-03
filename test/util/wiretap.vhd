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
-- Debug helper to dump all traffic to a file. Also checks the validity of
-- packets on their way through the network and rises a warning if a
-- misformated packet is detected (most likeley a colission in the xbar)
--
-- Author: Christoph Mueller
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use work.config_types.all;
use work.config.all;
use work.noc_defs.all;
use work.txt_util.all;
use work.wiretap_package.all;


entity wiretap is
  
  generic (
    name         : string  := "Node";
    N            : natural := 0;
    M            : natural := 0;
    extra_string : string  := "");

  port (wire_fw : in channel_forward;
        wire_bw : in channel_backward);

end entity wiretap;

architecture echelon of wiretap is
  alias ROUTE    : std_logic_vector(15 downto 0) is wire_fw.data(15 downto 0);
  alias VLD_TYPE : std_logic is wire_fw.data(LINK_WIDTH-1);
  alias SOP      : std_logic is wire_fw.data(LINK_WIDTH-2);
  alias EOP      : std_logic is wire_fw.data(LINK_WIDTH-3);


  type PAKET_STATES is (S_SOP, S_VLD, S_EOP, S_IDLE, S_ERROR);
  signal state, state_next : PAKET_STATES := S_IDLE;
  signal pkt_timestamp     : time;
  signal header            : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal data_1, data_2    : std_logic_vector(DATA_WIDTH - 1 downto 0);

  constant complete_name : string := name & "_" & integer'image(N) & "_" & integer'image(M) & extra_string;
-- name of this wiretap instance
  
begin  -- architecture echelon
  -- purpose: observes data on wire_fw
  -- type   : combinational
  -- inputs : 
  -- outputs: 
  pkt_fsm : process is
  begin  -- process file_out
    
    while true loop
      wait until wire_fw.req /= wire_bw.ack;
      state <= state_next;
      wait for delay;
      case state is
        when S_IDLE =>
          if (VLD_TYPE = '1' and SOP = '1') then
            state_next         <= S_SOP;
            pkt_timestamp <= NOW;
            header        <= wire_fw.data(header'range);
          else
            if VLD_TYPE = '1' then
              state_next         <= S_ERROR;
              pkt_timestamp <= NOW;
            end if;
          end if;
        when S_EOP =>
          if (VLD_TYPE = '1' and SOP = '1') then
            state_next         <= S_SOP;
            pkt_timestamp <= NOW;
            header        <= wire_fw.data(header'range);
          else
            if VLD_TYPE = '1' then
              state_next         <= S_ERROR;
              pkt_timestamp <= NOW;
            else
              state_next         <= S_IDLE;
            end if;
          end if;
        when S_SOP =>
          if (VLD_TYPE = '1') then
            state_next  <= S_VLD;
            data_1 <= wire_fw.data(data_1'range);
          else
            state         <= S_ERROR;
            pkt_timestamp <= NOW;
          end if;
        when S_VLD =>
          if (VLD_TYPE = '1' and EOP = '1') then
            state_next  <= S_EOP;
            data_2 <= wire_fw.data(data_2'range);
          else
            state_next         <= S_ERROR;
            pkt_timestamp <= NOW;
          end if;
        when others =>
          if VLD_TYPE = '0' then
            state_next <= S_IDLE;
          else
            state_next         <= S_ERROR;
            pkt_timestamp <= NOW;
          end if;
      end case;

      wait for delay;
      assert state_next /= S_ERROR report "WTAP: broken packet at " & complete_name severity warning;
      if state_next = S_ERROR then
        wait until VLD_TYPE = '0';
        state_next <= S_IDLE;
      end if;
      end loop;
    
  end process pkt_fsm;

  file_out : process is
    
  begin  -- process file_out
    while true loop
      wait on state;
      if (state = S_EOP) then
        print(tap_file, time'image(pkt_timestamp) & " " & complete_name & ": " & hstr(header) & " " & hstr(data_1) & " " & hstr(data_2));
      end if;
      if state = S_ERROR then
        print(tap_file, time'image(pkt_timestamp) & " " & complete_name & ": broken packet");
      end if;
    end loop;
  end process file_out;
  

end architecture echelon;
