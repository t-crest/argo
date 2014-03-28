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
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.noc_defs.all;


entity hpu_comb is
  generic (
    constant is_ni		      : boolean			     := false;
    constant this_port		      : std_logic_vector(1 downto 0) := "01";
    constant USE_REGISTER_FOR_SEL     : boolean			     :=true;
    constant USE_CLK_GATING_SEL_LATCH : boolean			     :=false
    );
  port (
    data_valid : in std_logic;
    data_in    : in link_t;
    preset     : in std_logic;

    data_out : out link_t;
    sel	     : out onehot_sel
    );
end hpu_comb;


architecture struct of hpu_comb is
  signal sel_internal, sel_current, sel_next : onehot_sel;
  signal SOP				     : std_logic;
  signal EOP				     : std_logic;
  signal VLD				     : std_logic;
begin

  -- VLD bit shows type of the phit (phit or void)
  -- SOP high on start of packet, EOP high on end of packet
  VLD <= data_in(LINK_WIDTH-1);
  SOP <= data_in(LINK_WIDTH-2);
  EOP <= data_in(LINK_WIDTH-3);


  one_hot_decoder : block
    signal dest_port : std_logic_vector(1 downto 0);
  begin
    dest_port <= data_in(1 downto 0);

    gen_not_ni : if is_ni = false generate
      sel_internal <= "10000" when dest_port = this_port else  -- 4: NI
		      "00001" when dest_port = "00" else       -- 0: North
		      "00010" when dest_port = "01" else       -- 1: East
		      "00100" when dest_port = "10" else       -- 2: South
		      "01000";	-- when dest_port = "11" else		 -- 3: West
    end generate gen_not_ni;

    gen_is_ni : if is_ni = true generate
      sel_internal <= "00001" when dest_port = "00" else  -- 0: North
		      "00010" when dest_port = "01" else  -- 1: East
		      "00100" when dest_port = "10" else  -- 2: South
		      "01000";	-- when dest_port = "11" else		 -- 3: West
    end generate gen_is_ni;
  end block one_hot_decoder;

  SEL_AS_LATCH : if not USE_REGISTER_FOR_SEL generate
    NO_CLK_GATING_CELL : if not USE_CLK_GATING_SEL_LATCH generate
      sel_latch : process (data_valid, VLD, sel_internal, SOP) is
      begin
	if preset = '1' then
	  sel <= (others => '0');
	  -- We must only open the latch when data are valid.
	elsif (data_valid = '1') then
	  if (VLD = '1' and SOP = '1') then
	    sel <= sel_internal;
	  elsif (VLD = '0') then	--  and EOP = '0'
	    -- This is an empty space, but other incoming phits may not be.
	    sel <= (others => '0');
	  end if;
	end if;
      end process sel_latch;
    end generate NO_CLK_GATING_CELL;

    CLK_GATING_CELL : if USE_CLK_GATING_SEL_LATCH generate
      c_gated_implementation : block is
	signal lt_en_gate, lt_en_gated : std_logic;
	signal sel_valid	       : onehot_sel;
      begin  -- block c_gated_implementation
	-- clock gate latch
	ck_gate_latch : process(data_valid, SOP, VLD, EOP) is
	begin
	  if (data_valid = '0') then
	    
	    if (EOP = '1') or (VLD = '0') then	    
	      lt_en_gate <= '1';
	    else
	      lt_en_gate <= '0';
	    end if;
	  end if;
	end process ck_gate_latch;
	lt_en_gated <= lt_en_gate and data_valid;

	-- Only set for valid
	valid_sel : for i in sel_internal'range generate
	  sel_valid(i) <= sel_internal(i) and VLD;
	end generate valid_sel;

	-- Latch 
	sel_latch : process (lt_en_gated, sel_valid, preset) is
	begin  -- process sel_latch
	  if preset = '1' then
	    sel <= (others => '0');
	  elsif (lt_en_gated = '1') then
	    sel <= sel_valid;
	  end if;
	end process sel_latch;
      end block c_gated_implementation;
    end generate CLK_GATING_CELL;
  end generate SEL_AS_LATCH;

  SEL_AS_REG : if USE_REGISTER_FOR_SEL generate
    sel_reg : process (data_valid, sel_next) is
    begin
      if preset = '1' then
	sel_current <= (others => '0');
	-- We must only open the latch when data are valid.
      elsif (data_valid'event and data_valid = '0') then
	sel_current <= sel_next;
      end if;
    end process sel_reg;

    sel_comb : process (VLD, sel_internal, SOP) is
    begin  -- process sel_transition
      -- default value
      sel_next <= sel_current;
      if (VLD = '1' and SOP = '1') then
	sel_next <= sel_internal;
      elsif (VLD = '0') then		--  and EOP = '0'
	-- This is an empty space, but other incoming phits may not be.
	sel_next <= (others => '0');
      end if;
    end process sel_comb;

    sel <= sel_current;
  end generate SEL_AS_REG;

  shift : process (data_in, VLD, SOP) is
  begin
    if (VLD = '1' and SOP = '1') then
      -- This is the header phit, so we shift the addr so the next switch knows where to route the packet.
      -- This allows one-hot decoding logic to always be driven by bottom 2 LSb's.
      data_out		     <= (others => '0');
      data_out(31 downto 16) <= data_in(31 downto 16);
      data_out(13 downto 0)  <= data_in(15 downto 2);  -- right shift by 2 bits
      data_out(PHIT_WIDTH)   <= VLD;
      data_out(PHIT_WIDTH-1) <= SOP;
      data_out(PHIT_WIDTH-2) <= EOP;
    else
      -- Not header. Must be one of {body, end-body, empty space}
      data_out <= data_in;		-- Pass through unaltered
    end if;
  end process shift;


end architecture struct;





