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
-- Argo 2.0 Network Interface: The packet manager component of the NI
--
-- Author: Rasmus Bo Soerensen (rasmus@rbscloud.dk)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.argo_types.all;

entity packet_manager is
  port (
    clk   : in std_logic;
    reset   : in std_logic;
    config : in conf_if_master;
    sel   : in std_logic;
    config_slv : out conf_if_slave;
    --config_dword : in std_logic;
    spm   : out mem_if_master;
    spm_slv : in mem_if_slave;
    dma_num : in dma_idx_t;
    dma_en : in std_logic;
    route : in route_t;
    mc : in std_logic;
    mc_idx : in mctbl_idx_t;
    mc_p : in unsigned(1 downto 0);
    pkt_len : in stbl_pkt_len_t;
    pkt_out : out link_t
  );
end packet_manager;

architecture rtl of packet_manager is
--------------------------------------------------------------------------------
-- Fields of DMA table (All fields are writable only)
-- Bits     | Name
--------------------------------------------------------------------------------
--  1       | Active
-- 14       | Count
-- 14       | Read ptr
-- 16       | Header field
--------------------------------------------------------------------------------
-- The active bit is implemented in registers such that the active bit can be
-- reset in case of an interrupt slot (1 clock cycle)
--------------------------------------------------------------------------------
type state_type is (IDLE, SEND1, SEND2, MODE_CHANGE1, MODE_CHANGE2);
signal state, next_state : state_type;

constant DMATBL_DATA_WIDTH : natural := ACTIVE_BIT + DMATBL_COUNT_WIDTH
                                  + DMATBL_READ_PTR_WIDTH + HEADER_FIELD_WIDTH;

signal dmatbl_data : unsigned(DMATBL_DATA_WIDTH-1 downto 0);

alias header : unsigned(HEADER_FIELD_WIDTH-1 downto 0) is
                                   dmatbl_data(HEADER_FIELD_WIDTH-1 downto 0);

alias read_ptr : unsigned(DMATBL_READ_PTR_WIDTH-1 downto 0) is
 dmatbl_data(DMATBL_DATA_WIDTH-ACTIVE_BIT-DMATBL_COUNT_WIDTH-1 downto HEADER_FIELD_WIDTH);

alias count : unsigned(DMATBL_COUNT_WIDTH-1 downto 0) is
  dmatbl_data(DMATBL_DATA_WIDTH-ACTIVE_BIT-1 downto DMATBL_READ_PTR_WIDTH+HEADER_FIELD_WIDTH);

signal count_reg, count_next : unsigned(DMATBL_COUNT_WIDTH-1 downto 0);

alias active : std_logic is dmatbl_data(DMATBL_DATA_WIDTH-1);

alias dma_pkt_type : unsigned(1 downto 0)
            is header(HEADER_FIELD_WIDTH-1 downto HEADER_FIELD_WIDTH-2);

signal pkt_type : unsigned(1 downto 0);

signal dma_en_reg : std_logic;

signal read_ptr_reg, read_ptr_next : unsigned(DMATBL_READ_PTR_WIDTH-1 downto 0);

signal hi_lo_next : std_logic;
signal hi_lo_reg : std_logic;

signal port_b_wr : std_logic;
signal port_b_addr  : unsigned(DMATBL_IDX_WIDTH-1 downto 0);
signal port_b_din   : unsigned(DMATBL_DATA_WIDTH-1 downto 0);
signal port_b_dout  : unsigned(DMATBL_DATA_WIDTH-1 downto 0);

signal dma_num_reg : unsigned(DMATBL_IDX_WIDTH-1 downto 0);
signal dma_update_en : std_logic;
signal dma_update_addr  : unsigned(DMATBL_IDX_WIDTH-1 downto 0);
signal dma_update_data  : unsigned(DMATBL_DATA_WIDTH-1 downto 0);

alias update_header : unsigned(HEADER_FIELD_WIDTH-1 downto 0) is
                                   dma_update_data(HEADER_FIELD_WIDTH-1 downto 0);

alias update_read_ptr : unsigned(DMATBL_READ_PTR_WIDTH-1 downto 0) is
 dma_update_data(DMATBL_DATA_WIDTH-ACTIVE_BIT-DMATBL_COUNT_WIDTH-1 downto HEADER_FIELD_WIDTH);

alias update_count : unsigned(DMATBL_COUNT_WIDTH-1 downto 0) is
  dma_update_data(DMATBL_DATA_WIDTH-ACTIVE_BIT-1 downto DMATBL_READ_PTR_WIDTH+HEADER_FIELD_WIDTH);

alias update_active : std_logic is dma_update_data(DMATBL_DATA_WIDTH-1);

signal port_a_wr_hi : std_logic;
signal port_a_wr_lo : std_logic;
signal port_a_addr  : unsigned(DMATBL_IDX_WIDTH-1 downto 0);
signal port_a_din   : unsigned(DMATBL_DATA_WIDTH-1 downto 0);
signal port_a_dout  : unsigned(DMATBL_DATA_WIDTH-1 downto 0);

signal config_slv_error_next : std_logic;

signal pkt_len_reg, pkt_len_next : stbl_pkt_len_t;

signal route_reg : route_t;

constant VALID_SOP : unsigned(2 downto 0) := "110";
constant VALID     : unsigned(2 downto 0) := "100";
constant VALID_EOP : unsigned(2 downto 0) := "101";

signal payload_data, payload_data_next : unsigned(WORD_WIDTH-1 downto 0);

begin

  spm.wdata <= (others => '0');
  spm.wr <= '0';

fsm : process(dma_en, dma_en_reg, dma_num_reg, dmatbl_data, mc, mc_idx, mc_p, payload_data, pkt_len, pkt_len_reg, pkt_type, read_ptr_next, read_ptr_reg, route_reg, spm_slv.rdata, state, count_reg)
begin
  dma_update_data <= dmatbl_data;
  dma_update_en <= '0';
  dma_update_addr <= dma_num_reg;
  update_active <= '0';
  next_state <= state;
  spm.en <= "00";
  pkt_out <= (others => '0');
  pkt_len_next <= pkt_len_reg;
  read_ptr_next <= read_ptr_reg;--Latch removal
  spm.addr <= read_ptr;--Latch removal
  count_next <= count_reg;
  if dma_en = '1' then
    pkt_len_next <= pkt_len;
  end if ;
  pkt_type <= dma_pkt_type;
  --payload_data_next <= spm_slv.rdata(WORD_WIDTH-1 downto 0);
  payload_data_next <= (others => '0');

  case( state ) is  
    when IDLE =>
      if dma_en_reg = '1' then
        if mc = '1' then
          next_state <= MODE_CHANGE1;
          if pkt_len_reg >= 1 then
            pkt_type <= "01";
          end if ;
          pkt_out <= std_logic_vector(VALID_SOP & pkt_type & MC_BANK & to_unsigned(0,CPKT_ADDR_WIDTH) & route_reg);
          payload_data_next(WORD_WIDTH/2+1 downto WORD_WIDTH/2) <= mc_p;
			    payload_data_next(MCTBL_IDX_WIDTH-1 downto 0) <= mc_idx;
        elsif active = '1' then
          next_state <= SEND1;
          spm.en <= "11";
          spm.addr <= read_ptr;
          read_ptr_next <= read_ptr;
          dma_update_en <= '1';
          count_next <= count-1;
          if count > pkt_len_reg then
            if dma_pkt_type = "10" then
              pkt_type <= "00";
            end if ;
            update_active <= '1';
          end if ;
          update_header(update_header'high-2 downto 0) <=
                                    header(header'high-2 downto 0) + pkt_len_reg;
          update_read_ptr <= read_ptr + pkt_len_reg;
          update_count <= count - pkt_len_reg;
          if dma_pkt_type = "01" then
            -- Make sure that the Bank ID is not incremented if we sent a configuration packet.
            update_header(update_header'high-2 downto update_header'high-5) <=
                                    header(header'high-2 downto header'high-5);
          end if ;
          pkt_len_next <= pkt_len_reg - 1;
          pkt_out <= std_logic_vector(VALID_SOP & pkt_type & header(header'high-2 downto 0) & route_reg);
        end if ;
      end if;
      
    when SEND1 =>
      payload_data_next <= spm_slv.rdata(WORD_WIDTH-1 downto 0);
      pkt_len_next <= pkt_len_reg - 1;
      count_next <= count_reg - 1;
      if pkt_len_reg > 0 and count_reg > 0 then
        next_state <= SEND2;
        pkt_out <= std_logic_vector(VALID & spm_slv.rdata((2*WORD_WIDTH)-1 downto WORD_WIDTH));
        read_ptr_next <= read_ptr_reg + 1;
      else
        next_state <= IDLE;
        pkt_out <= std_logic_vector(VALID_EOP & spm_slv.rdata((2*WORD_WIDTH)-1 downto WORD_WIDTH));
      end if ;

    when SEND2 =>
      pkt_len_next <= pkt_len_reg - 1;
      count_next <= count_reg - 1;
      if pkt_len_reg > 0 and count_reg > 0 then
        next_state <= SEND1;
        pkt_out <= std_logic_vector(VALID & payload_data);
        spm.en <= "11";
        read_ptr_next <= read_ptr_reg + 1;
	spm.addr <= read_ptr_next;
--        spm.addr <= read_ptr_reg + 1;
--        --spm.addr <= read_ptr_next;
      else
        next_state <= IDLE;
        pkt_out <= std_logic_vector(VALID_EOP & payload_data);
      end if ;

    when MODE_CHANGE1 =>
      next_state <= MODE_CHANGE2;
      pkt_out <= std_logic_vector(VALID & payload_data );
      
    when MODE_CHANGE2 =>
      next_state <= IDLE;
      pkt_out <= std_logic_vector(VALID_EOP & payload_data);
  end case ;
end process ; -- fsm


port_a_input_mux : process( config.wdata, config.addr, config.wr, hi_lo_reg, port_a_dout, sel  )
begin
  port_a_wr_hi <= '0';
  port_a_wr_lo <= '0';
  port_a_addr <= config.addr(DMATBL_IDX_WIDTH downto 1);
  config_slv.rdata <= (others => '0');
  -- Active 
    port_a_din(DMATBL_DATA_WIDTH-1) <= config.wdata(WORD_WIDTH-1);
    -- Count value and Read pointer
    port_a_din(DMATBL_DATA_WIDTH-ACTIVE_BIT-1 downto HEADER_FIELD_WIDTH)
          <= config.wdata(DMATBL_COUNT_WIDTH+DMATBL_READ_PTR_WIDTH-1 downto 0);
	 port_a_din(HEADER_FIELD_WIDTH-1 downto 0)
                                <= config.wdata(HEADER_FIELD_WIDTH-1 downto 0);
	
  if config.addr(0) = '1' then
    -- Active 
    --port_a_din(DMATBL_DATA_WIDTH-1) <= config.wdata(WORD_WIDTH-1);
    -- Count value and Read pointer
    --port_a_din(DMATBL_DATA_WIDTH-ACTIVE_BIT-1 downto HEADER_FIELD_WIDTH)
    --      <= config.wdata(DMATBL_COUNT_WIDTH+DMATBL_READ_PTR_WIDTH-1 downto 0);
    port_a_wr_hi <= config.wr and sel;
  elsif config.addr(0) = '0' then
    -- Header field
    --port_a_din(HEADER_FIELD_WIDTH-1 downto 0)
    --                            <= config.wdata(HEADER_FIELD_WIDTH-1 downto 0);
    port_a_wr_lo <= config.wr and sel;
  end if ;
  
  hi_lo_next <= config.addr(0);
  if hi_lo_reg = '1' then
    config_slv.rdata(WORD_WIDTH-1) <= port_a_dout(port_a_dout'high);
    config_slv.rdata(DMATBL_COUNT_WIDTH+DMATBL_READ_PTR_WIDTH-1 downto 0)
                 <= port_a_dout(DMATBL_DATA_WIDTH-ACTIVE_BIT-1 downto HEADER_FIELD_WIDTH);
  else
    config_slv.rdata(HEADER_FIELD_WIDTH-1 downto 0) 
                                 <= port_a_dout(HEADER_FIELD_WIDTH-1 downto 0);
  end if ;
  
  
end process ; -- port_a_input_mux

port_b_input_mux : process( dma_en, dma_update_addr, dma_update_data, dma_update_en, dma_num, port_b_dout )
begin
  dmatbl_data <= port_b_dout;
  port_b_din <= dma_update_data;
  if dma_en = '1' then
    port_b_wr <= '0';
    port_b_addr <= dma_num;
  else
    port_b_wr <= dma_update_en;
    port_b_addr <= dma_update_addr;
  end if ;
end process ; -- port_b_input_mux


-- Table storing count and read_ptr
dmatbl1 : entity work.tdp_ram
  generic map(
    DATA  =>  ACTIVE_BIT + DMATBL_COUNT_WIDTH + DMATBL_READ_PTR_WIDTH,
    ADDR  =>  DMATBL_IDX_WIDTH
  )
  port map(
    a_clk   => clk,
    a_wr    => port_a_wr_hi,
    a_addr  => port_a_addr,
    a_din   => port_a_din(DMATBL_DATA_WIDTH-1 downto HEADER_FIELD_WIDTH),
    a_dout  => port_a_dout(DMATBL_DATA_WIDTH-1 downto HEADER_FIELD_WIDTH),
    b_clk   => clk,
    b_wr    => port_b_wr,
    b_addr  => port_b_addr,
    b_din   => port_b_din(DMATBL_DATA_WIDTH-1 downto HEADER_FIELD_WIDTH),
    b_dout  => port_b_dout(DMATBL_DATA_WIDTH-1 downto HEADER_FIELD_WIDTH)
  );

  -- Table storing Header field
  dmatbl2 : entity work.tdp_ram
  generic map(
    DATA  =>  HEADER_FIELD_WIDTH,
    ADDR  =>  DMATBL_IDX_WIDTH
  )
  port map(
    a_clk   => clk,
    a_wr    => port_a_wr_lo,
    a_addr  => port_a_addr,
    a_din   => port_a_din(HEADER_FIELD_WIDTH-1 downto 0),
    a_dout  => port_a_dout(HEADER_FIELD_WIDTH-1 downto 0),
    b_clk   => clk,
    b_wr    => port_b_wr,
    b_addr  => port_b_addr,
    b_din   => port_b_din(HEADER_FIELD_WIDTH-1 downto 0),
    b_dout  => port_b_dout(HEADER_FIELD_WIDTH-1 downto 0)
  );

error_handler_proc : process( config.addr, sel )
begin
  config_slv_error_next <= '0';
  if sel = '1' and config.addr(CPKT_ADDR_WIDTH-1 downto DMATBL_IDX_WIDTH+1) /= 0  then --TODO: CORRECT to config.addr(HEADER_FIELD_WIDTH - CPKT_BANK_WIDTH-1 downto DMATBL_IDX_WIDTH+1)
    config_slv_error_next <= '1';
  end if ;
end process ; -- error_handler_proc


dma_en_reg_proc : process( clk )
begin
  if rising_edge(clk) then
    if reset = '1' then
      dma_en_reg <= '0';
    else
      dma_en_reg <= dma_en;
    end if;
  end if ;
end process ; -- dma_en_reg

hi_lo_reg_proc : process( clk )
begin
  if rising_edge(clk) then
    if reset = '1' then
      hi_lo_reg <= '0';
    else
      hi_lo_reg <= hi_lo_next;
    end if ;
  end if ;
end process ; -- hi_lo_reg_proc

config_slv_error_reg_proc : process( clk )
begin
  if rising_edge(clk) then
    if reset = '1' then
      config_slv.error <= '0';
    else
      config_slv.error <= config_slv_error_next;
    end if;
  end if ;
end process ; -- config_slv_error_reg_proc

state_reg_proc : process( clk )
begin
  if rising_edge(clk) then
    if reset = '1' then
      state <= IDLE;
    else
      state <= next_state;
    end if ;
  end if ;
  
end process ; -- state_reg_proc

data_reg_proc : process( clk )
begin
  if rising_edge(clk) then
    pkt_len_reg <= pkt_len_next;
    route_reg <= route;
    payload_data <= payload_data_next;
    read_ptr_reg <= read_ptr_next;
    dma_num_reg <= dma_num;
    count_reg <= count_next;
  end if ;
end process ; -- data_reg_proc

end rtl;
