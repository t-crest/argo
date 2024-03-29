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
-- Argo 2.0 Network Interface: The configuration bus arbitrating access from the
-- OCP interface and the config unit and connecting to the memories
--
-- Author: Rasmus Bo Soerensen (rasmus@rbscloud.dk)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.argo_types.all;
--use work.noc_defs.all;
--use work.noc_interface.all;
use work.ocp.all;

entity config_bus is
  port (
    clk   : in std_logic;
    reset   : in std_logic;
    ocp_config_m : in ocp_io_m;
    ocp_config_s : out ocp_io_s;
    supervisor : in std_logic;
    config_unit : in conf_if_master;
    config : out conf_if_master;
    TDM_ctrl : in conf_if_slave;
    TDM_ctrl_sel : out std_logic;
    sched_tbl : in conf_if_slave;
    sched_tbl_sel : out std_logic;
    DMA_tbl : in conf_if_slave;
    DMA_tbl_sel : out std_logic;
    MC_ctrl : in conf_if_slave;
    MC_ctrl_sel : out std_logic;
    irq_unit_fifo : in conf_if_slave;
    irq_unit_fifo_sel : out std_logic
  );
end config_bus;

architecture rtl of config_bus is
--------------------------------------------------------------------------------
-- Signals for config bus
--
--      OCP interface              Config unit
--                  \             /
--                  _\|         |/_
--                   -------------
--                   |  Arbiter  |
--                   -------------
--                  /   |     |   \
--                 /    |     |    \
--                /     |     |     \
--               /      |     |      \
--              /       |     |       \
--            |/_      \|/   \|/      _\|
--
--     TDM ctrl   Sched tbl   DMA tbl   IRQ FIFO
--------------------------------------------------------------------------------
signal next_ocp_resp, ocp_resp_reg : std_logic_vector(OCP_RESP_WIDTH-1 downto 0);
signal bank_id, prev_bank_id : config_bank_t;
--signal config_addr : config_addr_t;


begin
  
  -- Arbitrates access to the configuration ports on the memories.
  -- Priority is given to the config unit, if no request from the config unit
  -- the OCP port gets access.
  -- Starvation cannot happen since the config unit can only write twice in
  -- three clock cycles
  config_arbiter : process(ocp_resp_reg, DMA_tbl, MC_ctrl, TDM_ctrl, bank_id, config_unit, irq_unit_fifo, ocp_config_m, prev_bank_id, sched_tbl, supervisor)
  begin
  -- Default values of signals
  -- The config unit is served as default
  ocp_config_s.SResp <= ocp_resp_reg;
  ocp_config_s.SData <= std_logic_vector(DMA_tbl.rdata(WORD_WIDTH-1 downto 0));
  ocp_config_s.SCmdAccept <= '0';

  bank_id <= config_unit.addr(HEADER_FIELD_WIDTH-HEADER_CTRL_WIDTH-1 downto
                          HEADER_FIELD_WIDTH-HEADER_CTRL_WIDTH-CPKT_BANK_WIDTH);
  config.addr <= config_unit.addr;
  config.en <= config_unit.en;
  config.wr <= config_unit.wr;
  config.wdata <= config_unit.wdata;

  -- keep the value of the response register
  next_ocp_resp <= ocp_resp_reg;

  
  -- If no request from the config unit and a request from the OCP port
  if config_unit.en = '0' and ocp_config_m.MCmd /= OCP_CMD_IDLE then
    -- OCP transaction is completed in the next clock cycle
    next_ocp_resp <= OCP_RESP_DVA;
    ocp_config_s.SCmdAccept <= '1';
    config.wdata(WORD_WIDTH-1 downto 0) <= unsigned(ocp_config_m.MData);

    bank_id <= unsigned(ocp_config_m.MAddr(HEADER_FIELD_WIDTH-
                                  HEADER_CTRL_WIDTH+2-1 downto HEADER_FIELD_WIDTH-
                                            HEADER_CTRL_WIDTH-CPKT_BANK_WIDTH+2));
    config.addr <= unsigned(ocp_config_m.MAddr(HEADER_FIELD_WIDTH-
                                                HEADER_CTRL_WIDTH+2-1 downto 2));
    config.en <= '1';
    config.wr <= '0';
    -- If OCP request is a write and the processor is in supervisor mode
    if ocp_config_m.MCmd /= OCP_CMD_IDLE and supervisor = '1' then
      if ocp_config_m.MCmd = OCP_CMD_WR then
--    if ocp_config_m.MCmd = OCP_CMD_WR then
--      if supervisor = '0' then
--        next_ocp_resp <= OCP_RESP_ERR;
--      else
        config.wr <= '1';
      end if ;
    else
      --PUT THIS BACK next_ocp_resp <= OCP_RESP_ERR;
      next_ocp_resp <= OCP_RESP_DVA;
    end if;
--    end if ;
--    --if supervisor = '1' then
--    --  if ocp_config_m.MCmd = OCP_CMD_WR then
--    --    config.wr <= '1';
--    --  end if ;
--    --else
--    --  --PUT THIS BACK next_ocp_resp <= OCP_RESP_ERR;
--    --  next_ocp_resp <= OCP_RESP_DVA;
--    --end if;
    
  end if ;

  -- Hold the OCP response signal valid until the response accept from the
  -- master
  -- TODO: Hold the read data as well
  if (ocp_resp_reg /= OCP_RESP_NULL) and (ocp_config_m.MRespAccept = '1') then
    next_ocp_resp <= OCP_RESP_NULL;
  end if;

  if (TDM_ctrl.error or sched_tbl.error or DMA_tbl.error or irq_unit_fifo.error) = '1' then
    --PUT THIS BACK ocp_config_s.SResp <= OCP_RESP_ERR;
  end if ;

  -- Default select no bank
  TDM_ctrl_sel <= '0';
  MC_ctrl_sel <= '0';
  sched_tbl_sel <= '0';
  DMA_tbl_sel <= '0';
  irq_unit_fifo_sel <= '0';
  -- Based on the current bank_id we select which bank to activate
  case( bank_id ) is  
    when DMA_BANK =>
      DMA_tbl_sel <= '1';
    when SCHED_BANK =>
      sched_tbl_sel <= '1';
    when TDM_BANK =>
      TDM_ctrl_sel <= '1';
    when MC_BANK =>
      MC_ctrl_sel <= '1';
    when IRQ_BANK =>
      irq_unit_fifo_sel <= '1';
    when PERF_BANK =>
    when others =>
  end case ;


  case( prev_bank_id ) is 
    when DMA_BANK =>
      ocp_config_s.SData <= std_logic_vector(DMA_tbl.rdata(WORD_WIDTH-1 downto 0));
    when SCHED_BANK =>
      ocp_config_s.SData <= std_logic_vector(sched_tbl.rdata(WORD_WIDTH-1 downto 0));
    when TDM_BANK =>
      ocp_config_s.SData <= std_logic_vector(TDM_ctrl.rdata(WORD_WIDTH-1 downto 0));
    when MC_BANK =>
      ocp_config_s.SData <= std_logic_vector(MC_ctrl.rdata(WORD_WIDTH-1 downto 0));
    when IRQ_BANK =>
      ocp_config_s.SData <= std_logic_vector(irq_unit_fifo.rdata(WORD_WIDTH-1 downto 0));
    when PERF_BANK =>
    when others =>
	 
  end case ;

  end process;



  config_arbiter_reg : process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        ocp_resp_reg <= OCP_RESP_NULL;
        prev_bank_id <= (others=>'0');
      else
        ocp_resp_reg <= next_ocp_resp;
        prev_bank_id <= bank_id;
      end if ;
    end if;
  end process;

end rtl;
