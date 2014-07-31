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
    GENERATE_REQUEST_DELAY     : integer   := 0;
    -- to fix hold violations: delay the acknowledge
    GENERATE_ACKNOWLEDGE_DELAY : integer   := 0;
    -- initial state to implement
    init_phase		       : std_logic := '0';
    -- reset gate the click
    reset_gate_click	       : boolean   := true;
    -- initial data
    init_data		       : phit_t	   := (others => 'X');	-- Forced unknown
    -- no. of left inputs
    left_N		       : natural   := 1;
    -- no. of right outputs
    right_N		       : natural   := 1
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
      init_phase       : std_logic;
      reset_gate_click : boolean;
      ACK_N	       : integer;
      REQ_N	       : integer);
    port (
      req_i : in  std_logic_vector(REQ_N - 1 downto 0);
      ack_o : in  std_logic_vector(ACK_N - 1 downto 0);
      reset : in  std_logic;
      ack_i : out std_logic;
      req_o : out std_logic;
      click : out std_logic);
  end component click;

  signal click_internal, click_gated : std_logic;
  signal data, data_next	     : link_t;
  signal left_req_delayed	     : std_logic_vector(left_N-1 downto 0);
begin  -- architecture behav

  -- delay on the request
  req_delays : for i in left_req'range generate
    delay_req_element : entity work.matched_delay
      generic map(size => GENERATE_REQUEST_DELAY)
      port map(d => left_req(i),
	       z => left_req_delayed(i));
  end generate req_delays;

  -- the controller
  controller : entity work.click
    generic map (
      init_phase       => init_phase,
      reset_gate_click => reset_gate_click,
      ACK_N	       => right_N,
      REQ_N	       => left_N)
    port map (
      req_i => left_req_delayed,
      ack_o => right_ack,
      reset => reset,
      ack_i => left_ack,
      req_o => right_req,
      click => click_internal);

  
  gating : if GATING_ENABLED = 1 generate
    click_gated <= click_internal and left_data(34);
    ---------------------------------------------------------------------------
    -- data bits are gated
    ---------------------------------------------------------------------------
    reg_gated : process (click_gated, reset) is
    begin  -- process reg_gated
      if reset = '1' then		-- asynchronous reset (active low)
	data(33 downto 0) <= (others => '0');
      elsif click_gated'event and click_gated = '1' then  -- rising clock edge
	data(33 downto 0) <= left_data(33 downto 0);
      end if;
    end process reg_gated;

    ---------------------------------------------------------------------------
    -- the valid bit is always forwarded
    ---------------------------------------------------------------------------
    reg_ungated : process (click_internal, reset) is
    begin  -- process reg_ungated
      if reset = '1' then		-- asynchronous reset (active low)
	data(34) <= '0';
      elsif click_internal'event and click_internal = '1' then	-- rising clock edge
	data(34) <= left_data(34);
      end if;
    end process reg_ungated;
  end generate gating;
  right_data <= data;
  click_out  <= click_internal;

  no_gating : if GATING_ENABLED = 0 generate
    ---------------------------------------------------------------------------
    -- simple implementation: just a register bank.
    ---------------------------------------------------------------------------
    reg_gated : process (click_internal, reset) is
    begin  -- process reg_gated
      if reset = '1' then		-- asynchronous reset (active low)
	data <= (others => '0');
      elsif click_internal'event and click_internal = '1' then	-- rising clock edge
	data <= left_data;
      end if;
    end process reg_gated;
  end generate no_gating;



end architecture behav;
