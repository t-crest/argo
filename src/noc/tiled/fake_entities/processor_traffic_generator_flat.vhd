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
-------------------------------------------------------------------------------
-- traffic generator with flat interface for netlist simulation
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use ieee.math_real.all;
use std.textio.all;
use work.txt_util.all;
use work.math_util.all;
use work.cmd_util.all;
use work.config.all;
use work.ocp.all;
use work.noc_interface.all;
use work.tile_package.all;
use work.traffic_generator_package.all;
use work.noc_defs.all;

entity processor is
  port (
    clk, reset : in  std_logic;	 -- clock & asynchronous high active reset
    spm_master_slv : out std_logic_vector(SPM_CMD_WIDTH + SPM_ADDR_WIDTH + SPM_DATA_WIDTH - 1 downto 0);
    spm_slave_slv  : in  std_logic_vector(SPM_DATA_WIDTH - 1 downto 0);
    p_master_slv   : out std_logic_vector(OCP_CMD_WIDTH + OCP_ADDR_WIDTH + OCP_DATA_WIDTH + OCP_BYTE_WIDTH downto 0);
    p_slave_slv    : in  std_logic_vector(OCP_RESP_WIDTH + OCP_DATA_WIDTH downto 0);
    settings_slv   : in  std_logic_vector(TILE_ADDRESS_WIDTH - 1 downto 0)
    );
end entity processor;

architecture traffic_generator_flat of processor is

  signal spm_master : spm_master;
  signal spm_slave  : spm_slave;
  signal p_master   : ocp_io_m;
  signal p_slave    : ocp_io_s;
  signal settings   : tile_settings;

  component traffic_generator is
    port (
      clk, reset : in  std_logic;
      spm_master : out spm_master;
      spm_slave	 : in  spm_slave;
      p_master	 : out ocp_io_m;
      p_slave	 : in  ocp_io_s;
      settings	 : in  tile_settings);
  end component traffic_generator;
  
begin  -- behav

  -----------------------------------------------------------------------------
  -- (Un)flattening of in & output ports
  -----------------------------------------------------------------------------
  spm_master_slv <= spm_master.MCmd & spm_master.MAddr & spm_master.MData;
  p_master_slv <= p_master.MCmd & p_master.MAddr & p_master.MData & p_master.MByteEn & p_master.MRespAccept;
  
  spm_slave.SData <= spm_slave_slv;
  p_slave.SResp <= p_slave_slv(OCP_RESP_WIDTH + OCP_DATA_WIDTH downto OCP_DATA_WIDTH + 1);
  p_slave.SData <= p_slave_slv(OCP_DATA_WIDTH downto 1);
  p_slave.SCmdAccept <= p_slave_slv(0);
  settings.tile_id <= unsigned(settings_slv);

  -----------------------------------------------------------------------------
  -- traffic generator instance
  -----------------------------------------------------------------------------
  traffic_generator_1: entity work.traffic_generator
    port map (
      clk	 => clk,
      reset	 => reset,
      spm_master => spm_master,
      spm_slave	 => spm_slave,
      p_master	 => p_master,
      p_slave	 => p_slave,
      settings	 => settings);

  
end traffic_generator_flat;
