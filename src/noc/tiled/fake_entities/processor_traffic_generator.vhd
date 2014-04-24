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
use work.config_types.all;
use work.config.all;
use work.ocp.all;
use work.noc_interface.all;
use work.tile_package.all;
use work.traffic_generator_package.all;
use work.noc_defs.all;

entity processor is
  port (
    clk, reset	 : in  std_logic;
    p_spm_master : out spm_master;
    p_spm_slave	 : in  spm_slave;
    p_ocp_master : out ocp_io_m;
    p_ocp_slave	 : in  ocp_io_s;
    p_settings	 : in  tile_settings);
end entity processor;

architecture traffic_gnerator of processor is

begin  -- architecture traffic_gnerator

  traffic_generator_1 : entity work.traffic_generator
    port map (
      clk	 => clk,
      reset	 => reset,
      spm_master => p_spm_master,
      spm_slave	 => p_spm_slave,
      p_master	 => p_ocp_master,
      p_slave	 => p_ocp_slave,
      settings	 => p_settings);

end architecture traffic_gnerator;
