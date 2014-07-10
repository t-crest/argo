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
-- A click pipeline stage
--
-- Authors: Christoph Müller
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.config_types.all;
use work.config.all;
use work.noc_defs.all;

entity click_stage is
  generic (
    -- for some cases a delayed request is needed
    GENERATE_REQUEST_DELAY     : integer := 0;
    -- to fix hold violations: delay the acknowledge
    GENERATE_ACKNOWLEDGE_DELAY : integer := 0;
    -- initial state to implement
    init_phase  : std_logic := '0';
    -- initial data
    init_data   : phit_t      := (others => 'X');  -- Forced unknown
    -- no. of left inputs
    left_N      : natural     := 1;
    -- no. of right outputs
    right_N     : natural     := 1
    );

  
  port (
    reset      : in  std_logic;
    left_data  : in  link_t;
    right_data : out link_t;
    left_req   : in  std_logic_vector(left_N - 1 downto 0);
    right_req  : out std_logic;
    left_ack   : out std_logic;
    right_ack  : in  std_logic_vector(right_N - 1 downto 0);
    click_out  : out std_logic
    );
end entity click_stage;

architecture behav of click_stage is
  component click is
    generic (
      init_token : latch_state;
      ACK_N      : integer;
      REQ_N      : integer);
    port (
      req_i : in  std_logic_vector(REQ_N - 1 downto 0);
      ack_o : in  std_logic_vector(ACK_N - 1 downto 0);
      reset : in  std_logic;
      ack_i : out std_logic;
      req_o : out std_logic;
      click : out std_logic);
  end component click;

  signal click_s         : std_logic;
  signal data, data_next : link_t;
begin  -- architecture behav

  -- the controller
  click_controller : entity work.click
    generic map (
      init_phase => init_phase,
      ACK_N       => right_N,
      REQ_N       => left_N)
    port map (
      req_i => left_req,
      ack_o => right_ack,
      reset => reset,
      ack_i => left_ack,
      req_o => right_req,
      click => click_s);

  -- purpose: data assignment, gating implementation
  -- type   : combinational
  -- inputs : left_data, data
  -- outputs: data_next
  comb : process (left_data, data) is
  begin  -- process comb
    -- default assignment: keep data
    data_next               <= data;
    -- allways forward the status bits
    data_next(34 downto 32) <= left_data(34 downto 32);
    -- only forward data when valid
    if left_data(34) = '1' then
      data_next <= left_data;
    end if;
  end process comb;

  -- purpose: register transition
  -- type   : sequential
  -- inputs : click, reset, data_next
  -- outputs: data
  registers : process (click_s, reset) is
  begin  -- process registers
    if reset = '1' then                 -- asynchronous reset (active low)
      data <= (others => '0');
    elsif click_s'event and click_s = '1' then  -- rising clock edge
      data <= data_next;
    end if;
  end process registers;

  right_data <= data;
  click_out  <= click_s;
end architecture behav;
