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
		clk		: in std_logic;
		reset 	: in std_logic;
		ocp_config_m : in ocp_io_m;
		ocp_config_s : out ocp_io_s;
		config_unit : in conf_if_master;
		config : out conf_if_master;
		TDM_ctrl : in conf_if_slave;
		TDM_ctrl_sel : out std_logic;
		sched_tbl : in conf_if_slave;
		sched_tbl_sel : out std_logic;
		DMA_tbl : in conf_if_slave;
		DMA_tbl_sel : out std_logic;
		irq_data_fifo : in conf_if_slave;
		irq_data_fifo_sel : out std_logic;
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
signal config_addr : unsigned(CONFIG_ADDR_WIDTH-1 downto 0);
signal config_dword : std_logic;
signal config_en : std_logic;
signal config_wr : std_logic;
signal config_wdata : std_logic_vector(DATA_WIDTH-1 downto 0);
signal config_rdata : std_logic_vector(DATA_WIDTH-1 downto 0);


begin
	
	-- Arbitrates access to the configuration ports on the memories.
	-- Priority is given to the config unit, if no request from the config unit
	-- the OCP port gets access.
	-- Starvation cannot happen since the config unit can only write once in
	-- three clock cycles
	config_arbiter : process(all)
	begin
	-- keep the value of the response register
	next_ocp_resp <= ocp_resp_reg;

	-- The config unit is served as default
	config_addr <= config_unit_config_addr;
	config_dword <= '1';
	config_en <= config_unit_config_en;
	config_wr <= '1';
	config_wdata <= config_unit_config_wdata;
	-- If no request from the config unit and a request from the OCP port
	if config_unit_config_en = '0' and ocp_config_m.MCmd /= OCP_CMD_IDLE then
		config_dword <= '0';
		config_addr <= ocp_config_m.MAddr;
		config_en <= '1';
		-- If OCP request is a write and the processor is in supervisor mode
		if ocp_config_m.MCmd = OCP_CMD_WR and supervisor = '1' then
			config_wr <= '1';
		else
			config_wr <= '0';
		end if ;
		config_wdata <= ocp_config_m.MData;
		-- OCP transaction is completed in the next clock cycle
		next_ocp_resp <= OCP_RESP_DVA;
	end if ;

	-- Hold the OCP response signal valid until the response accept from the
	-- master
	-- TODO: Hold the read data as well
	if ocp_config_m.MRespAccept = '1' then
		next_ocp_resp <= OCP_RESP_NULL;
	end if;

	end process;

	config_arbiter_reg : process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				ocp_resp_reg <= OCP_RESP_NULL;
			else
				ocp_resp_reg <= next_ocp_resp;
			end if ;
		end if;
	end process;

end rtl;