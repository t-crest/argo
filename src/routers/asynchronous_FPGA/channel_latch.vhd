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
-- A parameterized latch stage of the asynchronous noc.
--
-- Authors: Evangelia Kasapaki
--	    Rasmus Bo Sorensen
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.config_types.all;
use work.noc_defs.all;
-- IK
USE IEEE.std_logic_arith.ALL;


entity channel_latch is
  generic (
    -- disables the clock gating
    -- default: gating enabled
    constant GATING_ENABLED : integer := 0;

    -- for some cases a delayed request is needed
    -- default: request delay disabled
    constant GENERATE_REQUEST_DELAY : natural := 0;

    -- to fix hold violations: delay the acknowledge
    constant GENERATE_ACKNOWLEDGE_DELAY : natural := 6;

    -- initial state to implement
    constant init_token : latch_state := EMPTY_BUBBLE;

    -- initial data
    constant init_data : phit_t := (others => 'X')  -- Forced unknown
    );
  port (
    preset    : in  std_logic;
    left_in   : in  channel_forward;
    left_out  : out channel_backward;
    right_out : out channel_forward;
    right_in  : in  channel_backward;
    lt_enable : out std_logic
    );
end channel_latch;


architecture struct of channel_latch is
  signal lt_en	  : std_logic;		-- Latch enable
  signal data	  : phit_t;
  signal type_in  : std_logic;
  signal type_out : std_logic;
  signal lt_gated : std_logic;

  signal out_req_0, out_req_1, out_req_2 : std_logic;
  signal out_ack : std_logic;
begin
  type_in   <= left_in.data(PHIT_WIDTH);
  --lt_gated <= lt_en or (not type_out) after delay;
  lt_enable <= lt_en;

  right_out.data <= type_out & data;

  controller : entity work.latch_controller(mousetrap)
    generic map(
      init_token => init_token
      )
    port map(
      preset => preset,
      Rin    => left_in.req,
      Ain    => out_ack, --left_out.ack,

      Rout => out_req_0,
      Aout => right_in.ack,

      lt_en => lt_en
      );

   
  -- Delay line at the output request
  REQUEST_DELAY: if GENERATE_REQUEST_DELAY > 0 generate
    -- synthesis generates two inverters, ensure the
    -- generation of an actually reasonable delay by the
    -- definition of a synthesis constraint at synthesis
    -- these buffer just provide "handles" for the delay
    -- definition
    -- out_req_2 <= not out_req_1 after 1 ns;
    -- out_req_1 <= not out_req_0 after 1 ns;
    
    -- IK
    --out_req_2 <= inject_delay_line(out_req_0) after 1 ns;
    req_delay : entity work.AS_Delay
    		-- IK set delay size to 1
		generic map(size => GENERATE_REQUEST_DELAY)
		port map(d => out_req_0,
			     z => out_req_2);
    
  end generate REQUEST_DELAY;

  -- No delay line
  NO_REQUEST_DELAY: if GENERATE_REQUEST_DELAY = 0 generate
    out_req_2 <= out_req_0;
  end generate NO_REQUEST_DELAY;

  ACKNOWLEDGE_DELAY: if GENERATE_ACKNOWLEDGE_DELAY > 0 generate
    -- IK
    --left_out.ack <= inject_delay_line(out_ack);
    ack_delay : entity work.AS_Delay
    		-- IK set delay size to 1
		generic map(size => GENERATE_ACKNOWLEDGE_DELAY)
		port map(d => out_ack,
			     z => left_out.ack);
    
  end generate ACKNOWLEDGE_DELAY;
  right_out.req <= out_req_2;

  NO_ACKNOWLEDGE_DELAY: if GENERATE_ACKNOWLEDGE_DELAY = 0 generate
    left_out.ack <= out_ack;
  end generate NO_ACKNOWLEDGE_DELAY;

  
  GATING : if GATING_ENABLED = 1 generate
    -- generate gated enable signal
    lt_gated <= lt_en or (not type_out) after delay;

    -- Normal transparent latch, cf. figure 6.21 in S&F
    -- IK & DRH
    type_latch : entity work.AS_bd_2p_Latch_ud
		generic map(reset_value  => "0")
		port map(dat_in(0)  => type_in,
			     reset   => preset,
			     dat_out(0) => type_out,
			     lt_en => lt_en);
    --type_latch : process(type_in, lt_en, preset)
    --begin
    --  if (lt_en = '1') then
	-- type_out <= transport type_in after delay;
      --end if;

      --if (preset = '1') then
	--type_out <= '0';
      --end if;
    --end process type_latch;

    -- IK & DRH
    data_latch : entity work.AS_bd_2p_Latch_ud
		generic map( reset_value  => init_data)
		port map(dat_in  => left_in.data(PHIT_WIDTH-1 downto 0),
			     reset   => preset,
			     dat_out => data,
			     lt_en => lt_gated);
			     
    --data_latch : process(left_in, lt_gated, preset)
    --begin
      --if (lt_gated = '1') then
	--data <= transport left_in.data(PHIT_WIDTH-1 downto 0) after delay;  -- Transparent
      --end if;

      --if (preset = '1') then
	--data <= init_data;		-- Preset overrides the above
      --end if;
    --end process data_latch;
  end generate GATING;

  NO_GATING : if GATING_ENABLED = 0 generate
    -- generate enable signal
    -- IK consider delay
    lt_gated <= lt_en after delay;
    
    -- Normal transparent latch, cf. figure 6.21 in S&F
    -- IK
    type_latch : entity work.AS_bd_2p_Latch_ud
		generic map(reset_value  => '0' & init_data)
		port map(dat_in(PHIT_WIDTH)  => type_in,
			     dat_in(PHIT_WIDTH-1 downto 0) => left_in.data(PHIT_WIDTH-1 downto 0),
			     reset   => preset,
			     dat_out (PHIT_WIDTH) => type_out,
			     dat_out (PHIT_WIDTH-1 downto 0) => data,
			     lt_en => lt_en);
			     
    --type_latch : process(type_in, lt_en, preset)
    --begin
      --if (lt_en = '1') then
	--type_out <= transport type_in			after delay;
	--data	 <= transport left_in.data(33 downto 0) after delay;
      --end if;

      --if (preset = '1') then
	--type_out <= '0';
	--data	 <= init_data;		-- Preset overrides the above

      --end if;
    --end process type_latch;
  end generate NO_GATING;




  --data_latch: process(left_in, lt_gated, preset)
  --begin
  --  if (lt_gated = '1') then
  --	data <= transport left_in.data(PHIT_WIDTH-1 downto 0) after delay; -- Transparent
  --  end if;

  --  if (preset = '1') then
  --	data <= init_data;	-- Preset overrides the above
  --  end if;

  --end process data_latch;

end struct;

