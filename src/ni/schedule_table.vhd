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
-- Argo 2.0 Network Interface: The schedule table component of the NI
--
-- Author: Rasmus Bo Soerensen (rasmus@rbscloud.dk)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.argo_types.all;

entity schedule_table is
  port (
    -- Clock reset
    clk   : in std_logic;
    reset   : in std_logic;
    -- Read write interface from config bus
    config  : in conf_if_master;
    sel   : in std_logic;
    config_slv : out conf_if_slave;
    -- Interface to schedule table
    stbl_idx  : in stbl_idx_t;
    stbl_idx_en  : in std_logic;

    route : out route_t;
    pkt_len : out stbl_pkt_len_t;
    t2n : out stbl_t2n_t;
    dma_num : out dma_idx_t;
    dma_en : out std_logic
  );
end schedule_table;

architecture rtl of schedule_table is
--------------------------------------------------------------------------------
-- Fields of schedule table (All fields are writable only)
-- Bits     | Name
--------------------------------------------------------------------------------
-- 16       | Route
--  8       | DMA#
--  3       | Pkt len
--  5       | Time to next
--------------------------------------------------------------------------------

constant STBL_DATA_WIDTH : natural := HEADER_ROUTE_WIDTH + DMATBL_IDX_WIDTH +
                                      STBL_PKT_LEN_WIDTH + STBL_T2N_WIDTH;

signal stbl_data : unsigned(STBL_DATA_WIDTH-1 downto 0);

signal stbl_idx_en_reg : std_logic;

signal config_slv_error_next : std_logic;

signal dma_num_sig : dma_idx_t;

signal port_a_din, port_a_dout : unsigned(STBL_DATA_WIDTH-1 downto 0);

signal a_wr: std_logic;

begin
  a_wr <= config.wr AND sel;

stbl : entity work.tdp_ram
  generic map(
    DATA  =>  STBL_DATA_WIDTH,
    ADDR  =>  STBL_IDX_WIDTH
  )
  port map(
    a_clk   => clk,
    a_wr    => a_wr,
    a_addr  => config.addr(STBL_IDX_WIDTH-1 downto 0),
    a_din   => port_a_din,
    a_dout  => port_a_dout,
    b_clk   => clk,
    b_wr    => '0',
    b_addr  => stbl_idx,
    b_din   => (others => '0'),
    b_dout  => stbl_data
  );

  port_a : process( port_a_dout, config.wdata )
  begin
    -- Data out
    config_slv.rdata <= (others => '0');
    -- Route
    config_slv.rdata(HALF_WORD_WIDTH+HEADER_ROUTE_WIDTH-1 downto  HALF_WORD_WIDTH)
                  <= port_a_dout(STBL_DATA_WIDTH - 1 downto STBL_DATA_WIDTH -
                                                              HEADER_ROUTE_WIDTH);
    -- dma_num
    config_slv.rdata(QUAD_WORD_WIDTH+DMATBL_IDX_WIDTH-1 downto QUAD_WORD_WIDTH)
                  <= port_a_dout(STBL_DATA_WIDTH - HEADER_ROUTE_WIDTH - 1 downto
                      STBL_DATA_WIDTH - HEADER_ROUTE_WIDTH - DMATBL_IDX_WIDTH);
    -- packet length
    config_slv.rdata(STBL_PKT_LEN_WIDTH + STBL_T2N_WIDTH - 1 downto STBL_T2N_WIDTH)
                  <= port_a_dout(STBL_PKT_LEN_WIDTH + STBL_T2N_WIDTH - 1 downto
                                                              STBL_T2N_WIDTH);
    -- time 2 next
    config_slv.rdata(STBL_T2N_WIDTH - 1 downto 0)
                  <= port_a_dout(STBL_T2N_WIDTH - 1 downto 0);

    -- Data in
    port_a_din <= (others => '0');
    -- Route
    port_a_din(STBL_DATA_WIDTH - 1 downto STBL_DATA_WIDTH - HEADER_ROUTE_WIDTH)
                  <= config.wdata(HALF_WORD_WIDTH+HEADER_ROUTE_WIDTH-1 downto
                                                              HALF_WORD_WIDTH);
    -- dma_num
    port_a_din(STBL_DATA_WIDTH - HEADER_ROUTE_WIDTH - 1 downto
                      STBL_DATA_WIDTH - HEADER_ROUTE_WIDTH - DMATBL_IDX_WIDTH)
                  <= config.wdata(QUAD_WORD_WIDTH+DMATBL_IDX_WIDTH-1 downto QUAD_WORD_WIDTH);
    -- packet length
    port_a_din(STBL_PKT_LEN_WIDTH + STBL_T2N_WIDTH - 1 downto STBL_T2N_WIDTH)
                  <= config.wdata(STBL_PKT_LEN_WIDTH + STBL_T2N_WIDTH - 1 downto STBL_T2N_WIDTH);
    -- time 2 next
    port_a_din(STBL_T2N_WIDTH - 1 downto 0)
                  <= config.wdata(STBL_T2N_WIDTH - 1 downto 0);

  end process ; -- port_a

-- Address out of bound
error_handler_proc : process( config.addr, sel )
begin
  config_slv_error_next <= '0';
  if sel = '1' and config.addr(CPKT_ADDR_WIDTH-1 downto STBL_IDX_WIDTH) /= 0  then
    config_slv_error_next <= '1';
  end if ;
end process ; -- error_handler_proc

route   <= stbl_data(STBL_DATA_WIDTH - 1 downto STBL_DATA_WIDTH -
                                                            HEADER_ROUTE_WIDTH);
dma_num_sig <= unsigned(stbl_data(STBL_DATA_WIDTH - HEADER_ROUTE_WIDTH - 1 downto
                      STBL_DATA_WIDTH - HEADER_ROUTE_WIDTH - DMATBL_IDX_WIDTH));
dma_num <= dma_num_sig;
pkt_len <= unsigned(stbl_data(STBL_PKT_LEN_WIDTH + STBL_T2N_WIDTH - 1 downto
                                                              STBL_T2N_WIDTH));
t2n     <= unsigned(stbl_data(STBL_T2N_WIDTH - 1 downto 0));


stbl_idx_en_reg_proc : process( clk )
begin
  if rising_edge(clk) then
    if reset = '1' then
      stbl_idx_en_reg <= '0';
    else
      stbl_idx_en_reg <= stbl_idx_en;
    end if;
  end if ;
end process ; -- stbl_idx_en_reg

dma_en_proc : process( dma_num_sig, stbl_idx_en_reg )
begin
  dma_en <= stbl_idx_en_reg;
  if dma_num_sig = (dma_num_sig'range => '1') then
    dma_en <= '0';
  end if ;

end process ; -- dma_en_proc


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

end rtl;