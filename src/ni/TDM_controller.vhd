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

entity TDM_controller is
  generic (
    MAX_MODE_CHANGE : natural := 1;
    MASTER : boolean := true
  );
  port (
    -- Clock reset and run
    clk   : in std_logic;
    reset   : in std_logic;
    run     : in std_logic;
    master_run : out std_logic;
    -- Read write interface from config bus
    config  : in mem_if_master;
    sel   : in std_logic;
    config_slv : out mem_if_slave;
    -- Interface to schedule table
    stbl_idx  : out stbl_idx_t;
    stbl_idx_en  : out std_logic;
    t2n   : in stbl_t2n_t
  );
end TDM_controller;

architecture rtl of TDM_controller is
--------------------------------------------------------------------------------
-- Addresses of readable/writable registers
-- Address  | Access  | Name
--------------------------------------------------------------------------------
-- 0x00     | R       | TDM_S_CNT
-- 0x04     | R       | TDM_P_CNT
-- 0x08     | R       | CLOCK_CNT_HIGH
-- 0x0C     | R       | CLOCK_CNT_LOW
-- 0x10     | WR      | MODE_CHANGE_IDX
-- ...      |         | ...
-- 0x20     | WR      | MODE_CHANGES(1)
-- 0x24     | WR      | MODE_CHANGES(2)
-- 0x28     | WR      | MODE_CHANGES(3)
-- ...      |         | ...
-- 0x80     | WR      | Master run
-- ...      |         | ...
--------------------------------------------------------------------------------
  
  signal TDM_S_CNT_reg, TDM_S_CNT_next : unsigned(TDM_S_CNT_WIDTH-1 downto 0);
  signal TDM_P_CNT_reg, TDM_P_CNT_next : word_t;
    
  signal STBL_MIN_reg, STBL_MAXP1_reg, STBL_IDX_reg : unsigned(STBL_IDX_WIDTH-1 downto 0);
  signal STBL_MIN_next, STBL_MAXP1_next, STBL_IDX_next : unsigned(STBL_IDX_WIDTH-1 downto 0);
  signal TIME2NEXT_reg : unsigned(STBL_T2N_WIDTH-1 downto 0);
  signal CLOCK_CNT_HI_reg : word_t;
  signal CLOCK_CNT_LO_reg : word_t;

  signal MASTER_RUN_REG, MASTER_RUN_NEXT : unsigned(0 downto 0);

  signal P_CNT_reg, P_CNT_next : unsigned(1 downto 0);

  signal MODE_CHANGE_IDX_reg, MODE_CHANGE_IDX_next : unsigned(log2up(MAX_MODE_CHANGE)-1 downto 0);
  type mode_change_t is record 
    min : unsigned(STBL_IDX_WIDTH-1 downto 0);
    max : unsigned(STBL_IDX_WIDTH-1 downto 0);
  end record;
  type mc_array is array (log2up(MAX_MODE_CHANGE)-1 downto 0) of mode_change_t;
  signal MODE_CHANGES_reg, MODE_CHANGES_next : mc_array;

  signal read_reg, read_next : word_t;
  signal clock_delay_reg : word_t;

  signal period_boundary, latch_hi_clock, mode_change_idx_changed : std_logic;
  signal STBL_IDX_RESET, STBL_IDX_EN_sig, T2N_ld_reg : std_logic;
  signal STBL_IDX_INC : unsigned(STBL_IDX_WIDTH-1 downto 0);

  constant RUN_LOAD_VAL : stbl_t2n_t := (others => '1');
  signal t2n_run : stbl_t2n_t;
begin

--------------------------------------------------------------------------------
-- Master/Slave run signals
--------------------------------------------------------------------------------
  master_config : if MASTER generate
    master_run <= std_logic(MASTER_RUN_REG(0));
  end generate ;

  slave_config : if not MASTER generate
    master_run <= '0';
    MASTER_RUN_NEXT(0) <= run;
  end generate ;

--------------------------------------------------------------------------------
-- Configuration access to the registers
--------------------------------------------------------------------------------

  
  process (all)
  begin
    config_slv.rdata <= (others=> '0');
    config_slv.rdata(WORD_WIDTH-1 downto 0) <= read_reg;
    read_next <= (others=> '0');
    latch_hi_clock <= '0';
    MODE_CHANGE_IDX_next <= MODE_CHANGE_IDX_reg;
    MODE_CHANGES_next <= MODE_CHANGES_reg;
    mode_change_idx_changed <= '0';
    MASTER_RUN_NEXT <= MASTER_RUN_REG;
    if config.en = '1' then
      -- Read registers
      if config.wr = '0' then
        case( config.addr(CPKT_ADDR_WIDTH-1 downto 2) ) is
          when to_unsigned(0,CPKT_ADDR_WIDTH-2) =>
            read_next(TDM_S_CNT_WIDTH-1 downto 0) <= TDM_S_CNT_reg;
          when to_unsigned(1,CPKT_ADDR_WIDTH-2) =>
            read_next <= TDM_P_CNT_reg;
          when to_unsigned(2,CPKT_ADDR_WIDTH-2) =>
            read_next <= clock_delay_reg;
          when to_unsigned(3,CPKT_ADDR_WIDTH-2) =>
            read_next <= CLOCK_CNT_LO_reg(WORD_WIDTH-1 downto 0);
            latch_hi_clock <= '1';
          when to_unsigned(4,CPKT_ADDR_WIDTH-2) =>
            read_next(log2up(MAX_MODE_CHANGE)-1 downto 0) <= unsigned(MODE_CHANGE_IDX_reg);
          when to_unsigned(128,CPKT_ADDR_WIDTH-2) =>
            read_next(0 downto 0) <= unsigned(MASTER_RUN_REG);
          when others =>
            read_next <= (others => '0');
        end case ;
        -- Read mode change registers
        for i in 0 to MAX_MODE_CHANGE-1 loop
          if config.addr(CPKT_ADDR_WIDTH-1 downto 2) = i + 8 then
            read_next((2*STBL_IDX_WIDTH)-1 downto 0) <=
              MODE_CHANGES_reg(i).max & MODE_CHANGES_reg(i).min;
          end if;
        end loop ;
      else -- Write register
        case( config.addr(CPKT_ADDR_WIDTH-1 downto 2) ) is
          when to_unsigned(4,CPKT_ADDR_WIDTH-2) =>
            MODE_CHANGE_IDX_next <= unsigned(config.wdata(log2up(MAX_MODE_CHANGE)-1 downto 0));
            mode_change_idx_changed <= '1';
          when to_unsigned(128,CPKT_ADDR_WIDTH-2) =>
            if MASTER then
              MASTER_RUN_NEXT <= config.wdata(0 downto 0);
            end if ;
          when others =>
        
        end case ;
        -- Write mode change registers
        for i in 0 to MAX_MODE_CHANGE-1 loop
          if config.addr(CPKT_ADDR_WIDTH-1 downto 2) = i + 8 then
            MODE_CHANGES_next(i).min <= unsigned(config.wdata(STBL_IDX_WIDTH-1 downto 0));
            MODE_CHANGES_next(i).max <= unsigned(config.wdata((2*STBL_IDX_WIDTH)-1 downto STBL_IDX_WIDTH));
          end if;
        end loop ;
      end if ;
    end if ;
  end process;

--------------------------------------------------------------------------------
-- Circuitry to control the index into the schedule table
--------------------------------------------------------------------------------
  -- In case the NI is in run state, load the t2n val from the schedule table
  -- otherwise load the defined constant RUN_LOAD_VAL
  t2n_run <= t2n when run = '1' else RUN_LOAD_VAL;
  -- The adder to increment the schedule table index  
  STBL_IDX_INC <= STBL_IDX_reg + 1;
  -- When index reaches the end of the schedule in the current mode
  -- reset the index
  STBL_IDX_RESET <= '1' when STBL_IDX_INC = STBL_MAXP1_reg else '0';
  -- The schedule table index registers shall be enabled,
  -- when time2next (read directly from the SBTL) is one or
  -- when time2next (decremented in the counter) becomes one
  STBL_IDX_EN_sig <= '1' when (TIME2NEXT_reg = 1) or (t2n_run = 0) else '0';
  -- Detect period boundary
  -- period_boundary is high in the last clock cycle of a TDM period
  -- This is when the STBL index wrapps around and the STBL index is enabled
  period_boundary <= STBL_IDX_RESET and STBL_IDX_EN_sig;
  -- Schedule table index increment
  STBL_IDX_next <= STBL_IDX_INC when STBL_IDX_RESET = '0' else 
                   STBL_MIN_reg;
  stbl_idx <= STBL_IDX_next;
  stbl_idx_en <= STBL_IDX_EN_sig;


--------------------------------------------------------------------------------
-- Mode change circuitry
--------------------------------------------------------------------------------
  STBL_MIN_next <= MODE_CHANGES_reg(to_integer(MODE_CHANGE_IDX_reg)).min;

  STBL_MAXP1_next <= MODE_CHANGES_reg(to_integer(MODE_CHANGE_IDX_reg)).max;


--------------------------------------------------------------------------------
-- Registers
--------------------------------------------------------------------------------

  regs : process( clk )
  begin
    if rising_edge(clk) then
      if reset = '1' then
        read_reg <= (others => '0');  
        MODE_CHANGES_reg <= (others => (others => (others =>'0')));
        --CLOCK_CNT_reg <= (others => '0');
        MASTER_RUN_REG <= (others => '0');
        -- T2N_ld_reg should be initialized such that the TIME2NEXT register
        -- will load a zero. Zero will give the longest time to STBL_IDX_EN\
        -- goes high.
        T2N_ld_reg <= '1';
      else
        read_reg <= read_next;
        MODE_CHANGES_reg <= MODE_CHANGES_next;
        T2N_ld_reg <= STBL_IDX_EN_sig;
        MASTER_RUN_REG <= MASTER_RUN_NEXT;
        -- Clock counter
        --CLOCK_CNT_reg <= CLOCK_CNT_reg + 1;
      end if ;
    end if ;
    
  end process ; -- regs


  -- TDM slot counter, incremented every clock cycle and
  -- reset on a period boundary
  CLOCK_CNT_reg_PROC : process( clk )
  begin
    if rising_edge(clk) then
      if reset = '1' then
        CLOCK_CNT_LO_reg <= (others => '0');
        CLOCK_CNT_HI_reg <= (others => '0');
      else
        CLOCK_CNT_LO_reg <= CLOCK_CNT_LO_reg + 1;
        if CLOCK_CNT_LO_reg = x"FFFFFFFF" then
          CLOCK_CNT_HI_reg <= CLOCK_CNT_HI_reg + 1;  
        end if ;
      end if ;
    end if ;
    
  end process ; -- CLOCK_CNT_reg_PROC

  -- TDM slot counter, incremented every clock cycle and
  -- reset on a period boundary
  TDM_S_CNT_reg_PROC : process( clk )
  begin
    if rising_edge(clk) then
      if reset = '1' then
        TDM_S_CNT_reg <= (others => '0');
      else
        -- TDM slot counter
        if period_boundary = '1' then
          TDM_S_CNT_reg <= (others => '0');
        else
          TDM_S_CNT_reg <= TDM_S_CNT_reg + 1;
        end if ;
      end if ;
    end if ;
    
  end process ; -- TDM_S_CNT_reg_PROC

  -- TDM period counter incremented on a period boundary
  TDM_P_CNT_reg_PROC : process( clk )
  begin
    if rising_edge(clk) then
      if reset = '1' then
        TDM_P_CNT_reg <= (others => '0');
      else -- TDM_period_counters
        if period_boundary = '1' then
          TDM_P_CNT_reg <= TDM_P_CNT_reg + 1;
        end if ;
      end if ;
    end if ;
  end process ; -- TDM_P_CNT_reg_PROC

  -- Period counter not accessible from the processor, only counts to 3
  -- Used for doing a mode change or synchronizing to a new schedule at boot up
  P_CNT_reg_PROC : process( clk )
  begin
    if rising_edge(clk) then
      if reset = '1' then
        P_CNT_reg <= (others => '0');
      else -- TDM_period_counters
        if period_boundary = '1' then
          P_CNT_reg <= P_CNT_reg + 1;
        end if ;
      end if ;
    end if ;
  end process ; -- P_CNT_reg_PROC

  -- The time until the next entry in the schedule table
  -- Is decremented in every clock cycle and loaded when it reaches 0
  TIME2NEXT_reg_PROC : process( clk )
  begin
    if rising_edge(clk) then
      if reset = '1' then
        TIME2NEXT_reg <= (others => '0');
      else -- TIME2NEXT counter
        if T2N_ld_reg = '1' then
          TIME2NEXT_reg <= t2n_run;
        else
          TIME2NEXT_reg <= TIME2NEXT_reg - 1; 
        end if ;
      end if ;
    end if ;
  end process ; -- TIME2NEXT_reg_PROC


  -- Register for storing the high word of the 64-bit clock counter.
  -- The register is loaded when the low word of the clock counter is accessed.
  CLOCK_DELAY_reg_PROC : process( clk )
  begin
    if rising_edge(clk) then
      if reset = '1' then
        clock_delay_reg <= (others => '0');
      else
        if latch_hi_clock = '1' then
          clock_delay_reg <= CLOCK_CNT_HI_reg;  
        end if ;
      end if ;
    end if ;
    
  end process ; -- CLOCK_DELAY_reg_PROC

  -- The mode change index register
  mode_change_idx_PROC : process( clk )
  begin
    if rising_edge(clk) then
      if reset = '1' then
        MODE_CHANGE_IDX_reg <= (others => '0');
      else
        if mode_change_idx_changed = '1' then
          MODE_CHANGE_IDX_reg <= MODE_CHANGE_IDX_next;  
        end if ;
      end if ;
    end if ;
  end process ; -- mode_change_idx_PROC

  -- The schedule table index register only loaded when time2next is 1
  STBL_IDX_reg_PROC : process( clk )
  begin
    if rising_edge(clk) then
      if reset = '1' then
        STBL_IDX_reg <= (others => '0');
      else
        -- Schedule table index
        if STBL_IDX_EN_sig = '1' then
          STBL_IDX_reg <= STBL_IDX_next;
        else
        end if ;
      end if ;
    end if ;
    
  end process ; -- STBL_IDX_reg_PROC

  -- The low index into the schedule table of the current mode change.
  -- Must only be changed on a period boundary
  STBL_MIN_reg_PROC : process( clk )
  begin
    if rising_edge(clk) then
      if reset = '1' then
        STBL_MIN_reg <= (others => '0');
      else
        if period_boundary = '1' then
          STBL_MIN_reg <= STBL_MIN_next;  
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
        STBL_MAXP1_reg <= (others => '0');
      else
        if period_boundary = '1' then
          STBL_MAXP1_reg <= STBL_MAXP1_next;  
        end if ;
      end if ;
    end if ;
    
  end process ; -- STBL_MAXP1_reg_PROC

end rtl;