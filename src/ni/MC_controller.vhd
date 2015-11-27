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
-- Argo 2.0 Network Interface: The TDM controller of the NI
--
-- Author: Rasmus Bo Soerensen (rasmus@rbscloud.dk)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.argo_types.all;
use work.math_util.all;
--use work.noc_defs.all;
--use work.noc_interface.all;
use work.ocp.all;

entity MC_controller is
  generic (
    MASTER : boolean := true
  );
  port (
    -- Clock reset and run
    clk   : in std_logic;
    reset   : in std_logic;
    run     : in std_logic;
    -- Read write interface from config bus
    config  : in mem_if_master;
    sel   : in std_logic;
    config_slv : out mem_if_slave;
    -- Interface towards TDM controller
    period_boundary : in std_logic;
    mc_p_cnt : in unsigned(1 downto 0);
    stbl_min : out unsigned(STBL_IDX_WIDTH-1 downto 0);
    stbl_maxp1 : out unsigned(STBL_IDX_WIDTH-1 downto 0);
    -- Interface towards packet manager
    mc : out std_logic;
    mc_idx : out mctbl_idx_t
  );
end MC_controller;

architecture rtl of MC_controller is
--------------------------------------------------------------------------------
-- Addresses of readable/writable registers (Word based addresses inside the NI)
-- Address  | Access  | Name
--------------------------------------------------------------------------------
-- 0x04     | WR      | MODE_CHANGE_IDX
-- ...      |         | ...
-- 0x08     | WR      | MODE(1)
-- 0x09     | WR      | MODE(2)
-- 0x0A     | WR      | MODE(3)
-- ...      |         | ...
-- 0x20     | WR      | Master run
-- ...      |         | ...
--------------------------------------------------------------------------------
  type state_type is (IDLE, WAIT_MC, MODE_CHANGE1, MODE_CHANGE2);
  signal state, next_state : state_type;

  signal STBL_MIN_next, STBL_MAXP1_next : stbl_idx_t;
  signal MODE_CHANGE_IDX_reg, MODE_CHANGE_IDX_next : mctbl_idx_t;
  signal MODE_IDX_reg, MODE_IDX_next : mctbl_idx_t;
  
  signal MODE_reg, MODE_next : mode_array;

  signal global_mode_change_idx, local_mode_change_idx : std_logic;

  signal config_slv_error_next : std_logic;

  signal read_reg, read_next : word_t;

  signal mc_reg, mc_next : std_logic;
  signal stbl_min_reg : unsigned(STBL_IDX_WIDTH-1 downto 0);

  signal mc_tbl_addr : unsigned(CPKT_ADDR_WIDTH-1 downto 0);

begin

--------------------------------------------------------------------------------
-- Master/Slave run signals
--------------------------------------------------------------------------------
  master_config : if MASTER generate
    mc <= mc_reg;
    mc_idx <= MODE_CHANGE_IDX_reg;
    master : process( all )
    begin
      next_state <= IDLE;
      mc_next <= mc_reg;
      global_mode_change_idx <= '0';
      case( state ) is
      
        when IDLE =>
          if local_mode_change_idx = '1' then
            next_state <= WAIT_MC;
          end if;
        when WAIT_MC =>
          next_state <= WAIT_MC;
          if period_boundary = '1' then
            mc_next <= '1';
            next_state <= MODE_CHANGE1;
          end if;
        when MODE_CHANGE1 =>
          if period_boundary = '1' then
            mc_next <= '0';
            next_state <= MODE_CHANGE2;
          end if ;
        when MODE_CHANGE2 =>
          if period_boundary = '1' then
            global_mode_change_idx <= '1';
            next_state <= IDLE;
          end if ;
        when others =>
      
      end case ;
      
    end process ; -- master
  end generate ;

  slave_config : if not MASTER generate

  end generate ;

--------------------------------------------------------------------------------
-- Configuration access to the registers
--------------------------------------------------------------------------------

  
  process (all)
  begin
    config_slv.rdata <= (others=> '0');
    config_slv.rdata(WORD_WIDTH-1 downto 0) <= read_reg;
    config_slv_error_next <= '0';
    MODE_CHANGE_IDX_next <= MODE_CHANGE_IDX_reg;
    MODE_next <= MODE_reg;
    local_mode_change_idx <= '0';
    mc_tbl_addr <= config.addr(CPKT_ADDR_WIDTH-1 downto 0) - 8;
    if (sel = '1' and config.en = '1') then
      -- Read registers
      if config.wr = '0' then
        case( config.addr(CPKT_ADDR_WIDTH-1 downto 0) ) is
          when to_unsigned(0,CPKT_ADDR_WIDTH) =>
            
          when to_unsigned(1,CPKT_ADDR_WIDTH) =>
            
          when to_unsigned(2,CPKT_ADDR_WIDTH) =>
            
          when to_unsigned(3,CPKT_ADDR_WIDTH) =>
            
          when to_unsigned(4,CPKT_ADDR_WIDTH) =>
            read_next(MCTBL_IDX_WIDTH-1 downto 0) <= unsigned(MODE_CHANGE_IDX_reg);
          when others =>
            read_next <= (others => '0');
            config_slv_error_next <= '1';
        end case ;
        -- Read mode-change registers
        if mc_tbl_addr < (2**MCTBL_IDX_WIDTH) then
          read_next(STBL_IDX_WIDTH-1 downto 0) <= MODE_reg(to_integer(mc_tbl_addr)).min;
          read_next(STBL_IDX_WIDTH+HALF_WORD_WIDTH-1 downto HALF_WORD_WIDTH) <= MODE_reg(to_integer(mc_tbl_addr)).max;
          config_slv_error_next <= '0';
        end if ;
      
      else -- Write register
        case( config.addr(CPKT_ADDR_WIDTH-1 downto 0) ) is
          when to_unsigned(4,CPKT_ADDR_WIDTH) =>
            MODE_CHANGE_IDX_next <= unsigned(config.wdata(MCTBL_IDX_WIDTH-1 downto 0));
            local_mode_change_idx <= '1';
          when others =>
            config_slv_error_next <= '1';
        end case ;

        -- Write mode change registers
        if mc_tbl_addr < (2**MCTBL_IDX_WIDTH) then
          MODE_next(to_integer(mc_tbl_addr)).min <= unsigned(config.wdata(STBL_IDX_WIDTH-1 downto 0));
          MODE_next(to_integer(mc_tbl_addr)).max <= unsigned(config.wdata(STBL_IDX_WIDTH+HALF_WORD_WIDTH-1 downto HALF_WORD_WIDTH));
          config_slv_error_next <= '0';
        end if;
      end if ;
    end if ;
  end process;

--------------------------------------------------------------------------------
-- Mode change circuitry
--------------------------------------------------------------------------------
  STBL_MIN_next <= MODE_reg(to_integer(MODE_CHANGE_IDX_reg)).min;

  STBL_MAXP1_next <= MODE_reg(to_integer(MODE_CHANGE_IDX_reg)).max;

  mode_change_mux : process( all )
  begin
    if period_boundary = '1' then
      stbl_min <= STBL_MIN_next;
    else
      stbl_min <= stbl_min_reg;
    end if ;
  end process ; -- mode_change_mux

--------------------------------------------------------------------------------
-- Registers
--------------------------------------------------------------------------------

  regs : process( clk )
  begin
    if rising_edge(clk) then
      if reset = '1' then
        state <= IDLE;
        read_reg <= (others => '0');  
        MODE_reg <= (others => (others => (others =>'0')));
        mc_reg <= '0';
        config_slv.error <= '0';
      else
        state <= next_state;
        read_reg <= read_next;
        MODE_reg <= MODE_next;
        mc_reg <= mc_next;
        config_slv.error <= config_slv_error_next;
      end if ;
    end if ;
    
  end process ; -- regs


  -- The mode change index register
  mode_change_idx_PROC : process( clk )
  begin
    if rising_edge(clk) then
      if reset = '1' then
        MODE_CHANGE_IDX_reg <= (others => '0');
      else
        if global_mode_change_idx = '1' then
          MODE_CHANGE_IDX_reg <= MODE_CHANGE_IDX_next;  
        end if ;
      end if ;
    end if ;
  end process ; -- mode_change_idx_PROC

  -- The low index into the schedule table of the current mode change.
  -- Must only be changed on a period boundary
  STBL_MIN_reg_PROC : process( clk )
  begin
    if rising_edge(clk) then
      if reset = '1' then
        stbl_min_reg <= (others => '0');
      else
        if period_boundary = '1' then
          stbl_min_reg <= STBL_MIN_next;  
        end if ;
      end if ;
    end if ;
    
  end process ; -- STBL_MIN_reg_PROC

  -- The high index into the schedule table of the current mode change.
  -- Must only be changed on a period boundary
  -- The index must point to the table entry after the last
  -- entry in the schedule
  STBL_MAXP1_reg_PROC : process( clk )
  begin
    if rising_edge(clk) then
      if reset = '1' then
        stbl_maxp1 <= (others => '0');
      else
        if period_boundary = '1' then
          stbl_maxp1 <= STBL_MAXP1_next;  
        end if ;
      end if ;
    end if ;
    
  end process ; -- STBL_MAXP1_reg_PROC

end rtl;