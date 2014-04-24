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
use ieee.VITAL_Timing.all;
use ieee.VITAL_Primitives.all;
use ieee.math_real.all;
use std.textio.all;
use work.txt_util.all;
use work.math_util.all;
use work.config_types.all;
use work.config.all;
use work.ocp.all;
use work.noc_defs.all;
use work.noc_interface.all;
use work.tile_package.all;
use work.traffic_generator_package.all;


entity processor is
  -- VITAL Delay generics to pacify questa at post-pnr simulation
  generic (
    tipd_clk	     : VitalDelayType01	     := (0 ns, 0 ns);
    tipd_reset	     : VitalDelayType01	     := (0 ns, 0 ns);
    tipd_p_spm_master : VitalDelayArrayType01(SPM_CMD_WIDTH + SPM_ADDR_WIDTH + SPM_DATA_WIDTH - 1 downto 0) := (others => (0 ns, 0 ns));
    tipd_p_spm_slave : VitalDelayArrayType01(SPM_DATA_WIDTH - 1 downto 0) := (others => (0 ns, 0 ns));
    tipd_p_ocp_master : VitalDelayArrayType01(OCP_CMD_WIDTH + OCP_ADDR_WIDTH + OCP_DATA_WIDTH + OCP_BYTE_WIDTH downto 0) := (others => (0 ns, 0 ns));
    tipd_p_ocp_slave : VitalDelayArrayType01(OCP_RESP_WIDTH + OCP_DATA_WIDTH downto 0) := (others => (0 ns, 0 ns));
    tipd_p_settings  : VitalDelayArrayType01(TILE_ADDRESS_WIDTH - 1 downto 0) := (others => (0 ns, 0 ns))
    );

  
  port (
    clk, reset	 : in  std_logic;  -- clock & asynchronous high active reset
    p_spm_master : out std_logic_vector(SPM_CMD_WIDTH + SPM_ADDR_WIDTH + SPM_DATA_WIDTH - 1 downto 0);
    p_spm_slave	 : in  std_logic_vector(SPM_DATA_WIDTH - 1 downto 0);
    p_ocp_master : out std_logic_vector(OCP_CMD_WIDTH + OCP_ADDR_WIDTH + OCP_DATA_WIDTH + OCP_BYTE_WIDTH downto 0);
    p_ocp_slave	 : in  std_logic_vector(OCP_RESP_WIDTH + OCP_DATA_WIDTH downto 0);
    p_settings	 : in  std_logic_vector(TILE_ADDRESS_WIDTH - 1 downto 0)
    );

end entity processor;

architecture traffic_generator_flat of processor is

  signal p_spm_master_sig : spm_master;
  signal p_spm_slave_sig  : spm_slave;
  signal p_ocp_master_sig : ocp_io_m;
  signal p_ocp_slave_sig  : ocp_io_s;
  signal p_settings_sig	  : tile_settings;

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
  p_spm_master <= p_spm_master_sig.MCmd & p_spm_master_sig.MAddr & p_spm_master_sig.MData;
  p_ocp_master <= p_ocp_master_sig.MCmd & p_ocp_master_sig.MAddr & p_ocp_master_sig.MData & p_ocp_master_sig.MByteEn & p_ocp_master_sig.MRespAccept;

  p_spm_slave_sig.SData	     <= p_spm_slave;
  p_ocp_slave_sig.SResp	     <= p_ocp_slave(OCP_RESP_WIDTH + OCP_DATA_WIDTH downto OCP_DATA_WIDTH + 1);
  p_ocp_slave_sig.SData	     <= p_ocp_slave(OCP_DATA_WIDTH downto 1);
  p_ocp_slave_sig.SCmdAccept <= p_ocp_slave(0);
  p_settings_sig.tile_id     <= unsigned(p_settings);

  -----------------------------------------------------------------------------
  -- traffic generator instance
  -----------------------------------------------------------------------------
  traffic_generator_1 : entity work.traffic_generator
    port map (
      clk	 => clk,
      reset	 => reset,
      spm_master => p_spm_master_sig,
      spm_slave	 => p_spm_slave_sig,
      p_master	 => p_ocp_master_sig,
      p_slave	 => p_ocp_slave_sig,
      settings	 => p_settings_sig);


end traffic_generator_flat;
