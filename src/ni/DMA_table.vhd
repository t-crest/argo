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
-- Argo 2.0 Network Interface: The DMA table component of the NI
--
-- Author: Rasmus Bo Soerensen (rasmus@rbscloud.dk)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.argo_types.all;

entity dma_table is
  generic (
    ENTRIES : natural
  );
  port (
    -- Clock reset and run
    clk   : in std_logic;
    reset   : in std_logic;
    -- Read write interface from config bus
    config  : in mem_if_master;
    sel   : in std_logic;
    config_slv : out mem_if_slave;
    config_dword : in std_logic;
    dma_num : in dma_idx_t;
    dma_en : in std_logic;
    pkt_en : out std_logic;
    pkt_data_addr : out dma_read_addr_t;
    pkt_header_field : out header_field_t
  );
end dma_table;

architecture rtl of dma_table is
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

constant DMATBL_DATA_WIDTH : natural := DMATBL_COUNT_WIDTH + HEADER_FIELD_WIDTH
                                                        + DMATBL_READ_PTR_WIDTH;

signal dmatbl_data : unsigned(DMATBL_COUNT_WIDTH + HEADER_FIELD_WIDTH +
                                              DMATBL_READ_PTR_WIDTH-1 downto 0);

signal dma_en_reg : std_logic;

signal config_wdata : dword_t;
signal config_rdata : dword_t;

type active_t is array (2 ** DMATBL_IDX_WIDTH downto 0) of std_logic;

signal active_reg, active_next : active_t;

begin


dword_config : process( config_dword, config.wdata, config.addr )
begin
  config_wdata <= config.wdata;
  if config_dword = '0' and config.addr(2) = '1' then
    config_wdata((2*WORD_WIDTH)-1 downto WORD_WIDTH) <= config.wdata(
                                                        WORD_WIDTH-1 downto 0);
  end if ;
end process ; -- dword_config


dmatbl1 : entity work.tdp_ram
  generic map(
    DATA  =>  DMATBL_COUNT_WIDTH,
    ADDR  =>  DMATBL_IDX_WIDTH
  )
  port map(
    a_clk   => clk,
    a_wr    => config.wr and sel,
    a_addr  => config.addr(DMATBL_IDX_WIDTH+2 downto 3),
    a_din   => config_wdata,
    a_dout  => config_rdata,
    b_clk   => clk,
    b_wr    => '0',
    b_addr  => dma_num,
    b_din   => (others => '0'),
    b_dout  => dmatbl_data(DMATBL_DATA_WIDTH-1 downto
                                          DMATBL_DATA_WIDTH-DMATBL_COUNT_WIDTH)
  );

  dmatbl2 : entity work.tdp_ram
  generic map(
    DATA  =>  HEADER_FIELD_WIDTH + DMATBL_READ_PTR_WIDTH,
    ADDR  =>  DMATBL_IDX_WIDTH
  )
  port map(
    a_clk   => clk,
    a_wr    => config.wr and sel,
    a_addr  => config.addr,
    a_din   => config_wdata,
    a_dout  => config_rdata,
    b_clk   => clk,
    b_wr    => '0',
    b_addr  => dma_num,
    b_din   => (others => '0'),
    b_dout  => dmatbl_data(DMATBL_DATA_WIDTH-DMATBL_COUNT_WIDTH-1 downto 0)
  );

config_slv.error <= '0';


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

pkt_en <= dma_en_reg;

end rtl;