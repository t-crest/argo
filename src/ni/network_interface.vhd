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
-- Argo 2.0 Network Interface
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

entity network_interface is
generic (
	MASTER : boolean := false
	);
port (
	clk 		: in std_logic;
	reset 		: in std_logic;
	run 		: in std_logic;
	master_run	: out std_logic;
	supervisor	: in std_logic;
	ocp_config_m : in ocp_io_m;
	ocp_config_s : out ocp_io_s;
	data_irq	: out std_logic;
	config_irq	: out std_logic;
	spm_slv		: in mem_if_slave;
	spm			: out mem_if_master;
	pkt_in		: in  link_t;
	pkt_out		: out link_t
	);
end network_interface;

architecture struct of network_interface is
--------------------------------------------------------------------------------
-- Transmit pipeline components
--------------------------------------------------------------------------------
component TDM_controller is
	generic (
		MASTER : boolean := false
	);
	port (
		clk		: in std_logic;
		reset 	: in std_logic;
		run		: in std_logic;
		master_run : out std_logic;
		config  : in mem_if_master;
		sel 	: in std_logic;
		config_slv : out mem_if_slave;
		stbl_idx	: out stbl_idx_t;
		stbl_idx_en : out std_logic;
		t2n 	: in stbl_t2n_t;
		period_boundary : out std_logic;
		stbl_min : in unsigned(STBL_IDX_WIDTH-1 downto 0);
		stbl_maxp1 : in unsigned(STBL_IDX_WIDTH-1 downto 0)
	);
end component;

component MC_controller is
  generic (
	MAX_MODE_CHANGE : natural := 1;
	MASTER : boolean := true
  );
  port (
	clk   : in std_logic;
	reset   : in std_logic;
	run     : in std_logic;
	config  : in mem_if_master;
	sel   : in std_logic;
	config_slv : out mem_if_slave;
	period_boundary : in std_logic;
	stbl_min : out unsigned(STBL_IDX_WIDTH-1 downto 0);
	stbl_maxp1 : out unsigned(STBL_IDX_WIDTH-1 downto 0);
	md_chg : out std_logic
  );
end component;

component schedule_table is
	port (
		clk		: in std_logic;
		reset 	: in std_logic;
		config : in mem_if_master;
		sel 	: in std_logic;
		config_slv : out mem_if_slave;
		stbl_idx	: in stbl_idx_t;
		stbl_idx_en : in std_logic;
		route : out route_t;
		pkt_len : out stbl_pkt_len_t;
		t2n : out stbl_t2n_t;
		dma_num : out dma_idx_t;
		dma_en : out std_logic
		);
end component;

component packet_manager is
	port (
		clk		: in std_logic;
		reset 	: in std_logic;
		config : in mem_if_master;
		sel 	: in std_logic;
		config_slv : out mem_if_slave;
		config_dword : in std_logic;
		spm 	: out mem_if_master;
		spm_slv : in mem_if_slave;
		dma_num : in dma_idx_t;
		dma_en : in std_logic;
		route : in route_t;
		md_chg : in std_logic;
		pkt_len : in stbl_pkt_len_t;
		pkt_out : out link_t
	);
end component;

--------------------------------------------------------------------------------
-- Receive pipeline components
--------------------------------------------------------------------------------
component data_unit is
	port (
		clk		: in std_logic;
		reset 	: in std_logic;
		spm : out mem_if_master;
		irq_fifo_data : out irq_data_t;
		irq_fifo_data_valid : out std_logic;
		pkt_in : in link_t
	);
end component;

component config_unit is
	port (
		clk		: in std_logic;
		reset 	: in std_logic;
		config : out mem_if_master;
		pkt_in : in link_t
	);
end component;

component irq_unit is
	port (
		clk		: in std_logic;
		reset 	: in std_logic;
		irq_fifo_data : out irq_data_t;
		irq_fifo_data_valid : out std_logic;
		pkt_in : in link_t
	);
end component;

component irq_fifo is
	port(
		clk                      : in  std_logic;
		reset                    : in  std_logic;
		config                   : in  mem_if_master;
		sel                      : in  std_logic;
		config_slv               : out mem_if_slave;
		irq_irq_sig              : out std_logic;
		irq_irq_fifo_data        : in  irq_data_t;
		irq_irq_fifo_data_valid  : in  std_logic;
		irq_data_sig             : out std_logic;
		irq_data_fifo_data       : in  irq_data_t;
		irq_data_fifo_data_valid : in  std_logic
	);
end component;

--------------------------------------------------------------------------------
-- Components shared between transmit and receive pipeline
--------------------------------------------------------------------------------
component config_bus is
	port (
		clk		: in std_logic;
		reset 	: in std_logic;
		ocp_config_m : in ocp_io_m;
		ocp_config_s : out ocp_io_s;
		supervisor : in std_logic;
		config_unit : in mem_if_master;
		config : out mem_if_master;
		config_dword : out std_logic;
		TDM_ctrl : in mem_if_slave;
		TDM_ctrl_sel : out std_logic;
		sched_tbl : in mem_if_slave;
		sched_tbl_sel : out std_logic;
		DMA_tbl : in mem_if_slave;
		DMA_tbl_sel : out std_logic;
		MC_ctrl : in mem_if_slave;
		MC_ctrl_sel : out std_logic;
		irq_unit_fifo : in mem_if_slave;
		irq_unit_fifo_sel : out std_logic
	);
end component;

component spm_bus is
	port (
		clk		: in std_logic;
		reset 	: in std_logic;
		spm_slv : in mem_if_slave;
		spm : out mem_if_master;
		tx_spm_slv : out mem_if_slave;
		tx_spm : in mem_if_master;
		rx_spm : in mem_if_master
	);
end component;

signal config : mem_if_master;
signal config_dword : std_logic;
signal TDM_ctrl, sched_tbl, DMA_tbl, MC_ctrl : mem_if_slave;
signal TDM_ctrl_sel, sched_tbl_sel, DMA_tbl_sel, MC_ctrl_sel : std_logic;
signal stbl_idx : stbl_idx_t;
signal stbl_idx_en : std_logic;
signal t2n : stbl_t2n_t;

signal route : route_t;
signal pkt_len : stbl_pkt_len_t;
signal dma_num : dma_idx_t;
signal dma_en : std_logic;

signal md_chg, period_boundary : std_logic;
signal stbl_min : unsigned(STBL_IDX_WIDTH-1 downto 0);
signal stbl_maxp1 : unsigned(STBL_IDX_WIDTH-1 downto 0);

signal tx_spm, rx_spm : mem_if_master;
signal tx_spm_slv : mem_if_slave;

signal irq_data, irq_unit_data : irq_data_t;
signal irq_data_valid, irq_unit_data_valid : std_logic;

signal config_unit_master : mem_if_master;
signal irq_if_fifo : mem_if_slave;
signal irq_if_fifo_sel : std_logic;


begin

-- TX pipeline instantiations
	TDMctrl : TDM_controller
	generic map (
		MASTER => MASTER
	)
	port map(
		clk => clk,
		reset => reset,
		run => run,
		master_run => master_run,
		config => config,
		sel => TDM_ctrl_sel,
		config_slv => TDM_ctrl,
		stbl_idx => stbl_idx,
		stbl_idx_en => stbl_idx_en,
		t2n => t2n,
		period_boundary => period_boundary,
		stbl_min => stbl_min,
		stbl_maxp1 => stbl_maxp1
	);

	MCctrl : MC_controller
	generic map (
		MAX_MODE_CHANGE => 2,
		MASTER => MASTER
	)
	port map (
		clk => clk,
		reset => reset,
		run => run,
		config => config,
		sel => MC_ctrl_sel,
		config_slv => MC_ctrl,
		period_boundary => period_boundary,
		stbl_min => stbl_min,
		stbl_maxp1 => stbl_maxp1,
		md_chg => md_chg
	);


	schedtbl : schedule_table
	port map(
		clk => clk,
		reset => reset,
		config => config,
		sel => sched_tbl_sel,
		config_slv => sched_tbl,
		stbl_idx => stbl_idx,
		stbl_idx_en => stbl_idx_en,
		route => route,
		pkt_len => pkt_len,
		t2n => t2n,
		dma_num => dma_num,
		dma_en => dma_en
	);

	pktman : packet_manager
	port map (
		clk => clk,
		reset => reset,
		config => config,
		sel => DMA_tbl_sel,
		config_slv => DMA_tbl,
		config_dword => config_dword,
		spm => spm, 
		spm_slv => spm_slv, 
		dma_num => dma_num,
		dma_en => dma_en,
		route => route, 
		md_chg => md_chg, 
		pkt_len => pkt_len,
		pkt_out => pkt_out
	);

-- RX pipeline instantiations
	datunit : data_unit
	port map (
		clk => clk,
		reset => reset,
		spm => rx_spm,
		irq_fifo_data => irq_data,
		irq_fifo_data_valid => irq_data_valid,
		pkt_in => pkt_in
	);

	confunit : config_unit
	port  map (
		clk => clk,
		reset => reset,
		config => config_unit_master,
		pkt_in => pkt_in
	);

	irqunit : irq_unit
	port map (
		clk => clk,
		reset => reset,
		irq_fifo_data => irq_unit_data,
		irq_fifo_data_valid => irq_unit_data_valid,
		pkt_in => pkt_in
	);

	irqfifo : irq_fifo
	port map(
		clk => clk,
		reset => reset,
		config => config,
		sel => irq_if_fifo_sel,
		config_slv => irq_if_fifo,
		irq_irq_sig => config_irq,
		irq_irq_fifo_data  => irq_unit_data,
		irq_irq_fifo_data_valid => irq_unit_data_valid,
		irq_data_sig  => data_irq,
		irq_data_fifo_data  => irq_data,
		irq_data_fifo_data_valid => irq_data_valid
	);

-- Instantiations of common components
	spmbus : spm_bus
		port map (
			clk => clk,
			reset => reset,
			spm_slv => spm_slv,
			spm => spm,
			tx_spm_slv => tx_spm_slv,
			tx_spm => tx_spm,
			rx_spm => rx_spm
		);

	configbus : config_bus
		port map (
			clk => clk,
			reset => reset,
			ocp_config_m => ocp_config_m,
			ocp_config_s => ocp_config_s,
			supervisor => supervisor,
			config_unit => config_unit_master,
			config => config,
			config_dword => config_dword,
			TDM_ctrl => TDM_ctrl,
			TDM_ctrl_sel => TDM_ctrl_sel,
			sched_tbl => sched_tbl,
			sched_tbl_sel => sched_tbl_sel,
			DMA_tbl => DMA_tbl,
			DMA_tbl_sel => DMA_tbl_sel,
			MC_ctrl => MC_ctrl,
			MC_ctrl_sel => MC_ctrl_sel,
			irq_unit_fifo => irq_if_fifo,
			irq_unit_fifo_sel => irq_if_fifo_sel
			);

end struct;


