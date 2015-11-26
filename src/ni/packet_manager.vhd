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
    config : in mem_if_master;
    sel   : in std_logic;
    config_slv : out mem_if_slave;
    config_dword : in std_logic;
    spm   : out mem_if_master;
    spm_slv : in mem_if_slave;
    dma_num : in dma_idx_t;
    dma_en : in std_logic;
    route : in route_t;
    md_chg : in std_logic;
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
type state_type is (IDLE, DATA1, DATA2, CONFIG1, CONFIG2);
signal state, next_state : state_type;

constant DMATBL_DATA_WIDTH : natural := DMATBL_COUNT_WIDTH + HEADER_FIELD_WIDTH
                                                        + DMATBL_READ_PTR_WIDTH;

signal dmatbl_data : unsigned(DMATBL_DATA_WIDTH-1 downto 0);

alias dmatbl_header : unsigned(HEADER_FIELD_WIDTH-1 downto 0)
                                 is dmatbl_data(HEADER_FIELD_WIDTH-1 downto 0);

alias dmatbl_count : unsigned(DMATBL_COUNT_WIDTH-1 downto 0) is
  dmatbl_data(DMATBL_DATA_WIDTH-1 downto DMATBL_DATA_WIDTH-DMATBL_COUNT_WIDTH);

alias dmatbl_read_ptr : unsigned(DMATBL_READ_PTR_WIDTH-1 downto 0) is
 dmatbl_data(DMATBL_DATA_WIDTH-DMATBL_COUNT_WIDTH-1 downto HEADER_FIELD_WIDTH);

alias pkt_type : unsigned(1 downto 0)
            is dmatbl_header(HEADER_FIELD_WIDTH-1 downto HEADER_FIELD_WIDTH-2);

signal dma_en_reg : std_logic;

type active_t is array ((2 ** DMATBL_IDX_WIDTH) -1 downto 0) of std_logic;

signal active_reg, active_next : active_t;

signal hi_lo_next : std_logic;
signal hi_lo_reg : std_logic;

signal port_b_wr : std_logic;
signal port_b_addr  : unsigned(DMATBL_IDX_WIDTH-1 downto 0);
signal port_b_din   : unsigned(DMATBL_DATA_WIDTH-1 downto 0);
signal port_b_dout  : unsigned(DMATBL_DATA_WIDTH-1 downto 0);

signal DMA_update_en : std_logic;
signal DMA_update_addr  : unsigned(DMATBL_IDX_WIDTH-1 downto 0);
signal DMA_update_data  : unsigned(DMATBL_DATA_WIDTH-1 downto 0);

signal port_a_wr_hi : std_logic;
signal port_a_wr_lo : std_logic;
signal port_a_addr  : unsigned(DMATBL_IDX_WIDTH-1 downto 0);
signal port_a_din   : unsigned(DMATBL_DATA_WIDTH-1 downto 0);
signal port_a_dout  : unsigned(DMATBL_DATA_WIDTH-1 downto 0);

signal config_slv_error_next : std_logic;

signal pkt_len_reg : stbl_pkt_len_t;

begin

fsm : process( state, pkt_type, pkt_len_reg )
begin
  case( state ) is
  
    when IDLE =>
      if pkt_type = "00" then
        next_state <= DATA1;
      elsif pkt_type = "10" then
        next_state <= CONFIG1;
      elsif pkt_type = "11" then
        next_state <= IDLE;
      end if ;
    
    when DATA1 =>
      next_state <= DATA2;

    when DATA2 =>
      if pkt_len_reg > 0 then
        next_state <= DATA1;
      elsif pkt_len_reg = 0 then
        next_state <= IDLE;
      end if ;

    when CONFIG1 =>
      next_state <= CONFIG2;

    when CONFIG2 =>
      next_state <= IDLE;

    when others =>
      next_state <= IDLE;
  end case ;
end process ; -- fsm

port_a_input_mux : process( config_dword, config.wdata, config.addr, config.wr, hi_lo_reg, port_a_dout, sel  )
begin
  port_a_wr_hi <= '0';
  port_a_wr_lo <= '0';
  port_a_addr <= config.addr(DMATBL_IDX_WIDTH downto 1);
  config_slv.rdata <= (others => '0');
  if config_dword = '1' then
    port_a_din(DMATBL_DATA_WIDTH-1 downto HEADER_FIELD_WIDTH)
          <= config.wdata(WORD_WIDTH+DMATBL_COUNT_WIDTH+DMATBL_READ_PTR_WIDTH-1
                                                            downto WORD_WIDTH);
    port_a_din(HEADER_FIELD_WIDTH-1 downto 0)
                                <= config.wdata(HEADER_FIELD_WIDTH-1 downto 0);
    port_a_wr_hi <= config.wr and sel;
    port_a_wr_lo <= config.wr and sel;
  elsif config.addr(0) = '1' then
    port_a_din(DMATBL_DATA_WIDTH-1 downto HEADER_FIELD_WIDTH)
          <= config.wdata(DMATBL_COUNT_WIDTH+DMATBL_READ_PTR_WIDTH-1 downto 0);
    port_a_wr_hi <= config.wr and sel;
  elsif config.addr(0) = '0' then
    port_a_din(HEADER_FIELD_WIDTH-1 downto 0)
                                <= config.wdata(HEADER_FIELD_WIDTH-1 downto 0);
    port_a_wr_lo <= config.wr and sel;
  end if ;
  
  hi_lo_next <= config.addr(0);
  if hi_lo_reg = '1' then
    config_slv.rdata(DMATBL_COUNT_WIDTH+DMATBL_READ_PTR_WIDTH-1 downto 0)
                 <= port_a_dout(DMATBL_DATA_WIDTH-1 downto HEADER_FIELD_WIDTH);
  else
    config_slv.rdata(HEADER_FIELD_WIDTH-1 downto 0) 
                                 <= port_a_dout(HEADER_FIELD_WIDTH-1 downto 0);
  end if ;
  
  
end process ; -- port_a_input_mux

port_b_input_mux : process( dma_en, DMA_update_addr, DMA_update_data, DMA_update_en, dma_num, port_b_dout )
begin
  dmatbl_data <= port_b_dout;
  port_b_din <= DMA_update_data;
  if dma_en = '1' then
    port_b_wr <= '0';
    port_b_addr <= dma_num;
  else
    port_b_wr <= DMA_update_en;
    port_b_addr <= DMA_update_addr;
  end if ;
end process ; -- port_b_input_mux


-- Table storing count and read_ptr
dmatbl1 : entity work.tdp_ram
  generic map(
    DATA  =>  DMATBL_COUNT_WIDTH + DMATBL_READ_PTR_WIDTH,
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
  if sel = '1' and config.addr(CPKT_ADDR_WIDTH-1 downto DMATBL_IDX_WIDTH+1) /= 0  then
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

active_reg_proc : process( clk )
begin
  if rising_edge(clk) then
    if reset = '1' then
      active_reg <= (others => '0');
    else
      active_reg <= active_next;
    end if ;
  end if ;
end process ; -- active_reg_proc


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

pkt_len_reg_proc : process( clk )
begin
  if rising_edge(clk) then
    if reset = '1' then
      pkt_len_reg <= (others => '0');
    else
      pkt_len_reg <= pkt_len;
    end if ;
  end if ;
end process ; -- pkt_len_reg_proc



end rtl;