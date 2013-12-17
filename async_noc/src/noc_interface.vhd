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


--------------------------------------------------------------------------------
-- Definitions package
--
-- Author: Evangelia Kasapaki
-- Author: Rasmus Bo Soerensen
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.config.all;
use work.ocp.all;
use work.noc_defs.all;

package noc_interface is

  type ocp_core_m_a is array((N*M)-1 downto 0) of ocp_core_m;
  type ocp_core_s_a is array((N*M)-1 downto 0) of ocp_core_s;

  type ocp_io_m_a is array((N*M)-1 downto 0) of ocp_io_m;
  type ocp_io_s_a is array((N*M)-1 downto 0) of ocp_io_s;

  type ocp_master is record
    MCmd	: std_logic_vector(OCP_CMD_WIDTH-1 downto 0);
    MAddr	: std_logic_vector(OCP_ADDR_WIDTH-1 downto 0);
    MData	: std_logic_vector(OCP_DATA_WIDTH-1 downto 0);
    MByteEn	: std_logic_vector(OCP_BYTE_WIDTH-1 downto 0);
    MRespAccept : std_logic;
  end record;

  constant OCP_MASTER_WIDTH : integer := OCP_CMD_WIDTH + OCP_ADDR_WIDTH + OCP_DATA_WIDTH + OCP_BYTE_WIDTH + 1;  -- width of the flattened ocp master
  
  function ocp_master_to_std_logic_vector (
    ocp_in : ocp_master)
    return std_logic_vector;

  function std_logic_vector_to_ocp_master (
    slv_in : std_logic_vector(OCP_MASTER_WIDTH - 1 downto 0))
    return ocp_master;

  type ocp_slave is record
    SCmdAccept : std_logic;
    SResp      : std_logic_vector(1 downto 0);
    SData      : std_logic_vector(OCP_DATA_WIDTH-1 downto 0);
  end record;

  constant OCP_SLAVE_WIDTH : integer := OCP_DATA_WIDTH + 3;  -- width of the
							     -- flattened ocp slave
  function ocp_slave_to_std_logic_vector (
    ocp_in : ocp_slave)
    return std_logic_vector;

  function std_logic_vector_to_ocp_slave (
    slv_in : std_logic_vector(OCP_SLAVE_WIDTH - 1 downto 0))
    return ocp_slave;
  
  type spm_master is record
    MCmd  : std_logic_vector(SPM_CMD_WIDTH-1 downto 0);
    MAddr : std_logic_vector(SPM_ADDR_WIDTH-1 downto 0);
    MData : std_logic_vector(SPM_DATA_WIDTH-1 downto 0);
  end record;

  constant SPM_MASTER_WIDTH : integer := SPM_CMD_WIDTH + SPM_ADDR_WIDTH + SPM_DATA_WIDTH;  -- width of the flattened SPM master
  
  function spm_master_to_std_logic_vector (
    spm_in : spm_master)
    return std_logic_vector;

  function std_logic_vector_to_spm_master (
    slv_in : std_logic_vector(SPM_MASTER_WIDTH - 1 downto 0))
    return spm_master;
  

  type spm_slave is record
    --SCmdAccept	: std_logic;
    --SResp	    : std_logic;
    SData : std_logic_vector(SPM_DATA_WIDTH-1 downto 0);
  end record;

  constant SPM_SLAVE_WIDTH : integer := SPM_DATA_WIDTH;

  function spm_slave_to_std_logic_vector (
    spm_in : spm_slave)
    return std_logic_vector;

  function std_logic_vector_to_spm_slave (
    slv_in : std_logic_vector(SPM_SLAVE_WIDTH - 1 downto 0))
    return spm_slave;
  
  type spm_masters is array((N*M)-1 downto 0) of spm_master;
  type spm_slaves is array((N*M)-1 downto 0) of spm_slave;

  --arrays
  type proc_m is array(N-1 downto 0) of ocp_master;
  type proc_s is array(N-1 downto 0) of ocp_slave;
  type procMasters is array(N-1 downto 0) of proc_m;
  type procSlaves is array(N-1 downto 0) of proc_s;

  type spm_m is array(N-1 downto 0) of spm_master;
  type spm_s is array(N-1 downto 0) of spm_slave;
  type spmMasters is array(N-1 downto 0) of spm_m;
  type spmSlaves is array(N-1 downto 0) of spm_s;

  
end noc_interface;  -- noc_interface

package body noc_interface is
  -----------------------------------------------------------------------------
  -- conversion functions for flattening / unflattening of the defined data
  -- structures - used to simulate a synthesized netlist
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  -- ocp master
  function ocp_master_to_std_logic_vector (
    ocp_in : ocp_master)
    return std_logic_vector is
  begin
    return ocp_in.MCmd & ocp_in.MAddr & ocp_in.MData & ocp_in.MByteEn & ocp_in.MRespAccept;
  end;

  function std_logic_vector_to_ocp_master (
    slv_in : std_logic_vector(OCP_MASTER_WIDTH - 1 downto 0))
    return ocp_master is
    variable i, j : integer := 1;
    variable ocp_out : ocp_master;
  begin
    ocp_out.MRespAccept := slv_in(0);
    i := i + OCP_BYTE_WIDTH;
    ocp_out.MByteEn := slv_in(i - 1 downto j);
    j := i;
    i := i + OCP_DATA_WIDTH;
    ocp_out.MData := slv_in(i - 1 downto j);
    j := i;
    i := i + OCP_ADDR_WIDTH;
    ocp_out.MAddr := slv_in(i - 1 downto j);
    j := i;
    i := i + OCP_CMD_WIDTH;
    ocp_out.MCmd := slv_in(i - 1 downto j);
    return ocp_out;
  end;

  -----------------------------------------------------------------------------
  -- ocp slave
  function ocp_slave_to_std_logic_vector (
    ocp_in : ocp_slave)
    return std_logic_vector is
  begin
    return ocp_in.SCmdAccept & ocp_in.SResp & ocp_in.SData;
  end;

  function std_logic_vector_to_ocp_slave (
    slv_in : std_logic_vector(OCP_SLAVE_WIDTH - 1 downto 0))
    return ocp_slave is
    variable ocp_out : ocp_slave;
  begin
    ocp_out.SCmdAccept := slv_in(slv_in'high);
    ocp_out.SResp := slv_in(slv_in'high - 1 downto slv_in'high - 2);
    ocp_out.SData := slv_in(slv_in'high - 3 downto 0);
    return ocp_out;
  end;

  
  -----------------------------------------------------------------------------
  -- spm master
  function spm_master_to_std_logic_vector (
    spm_in : spm_master)
    return std_logic_vector is
  begin
    return spm_in.MCmd & spm_in.MAddr & spm_in.MData;
  end;

  function std_logic_vector_to_spm_master (
    slv_in : std_logic_vector(SPM_MASTER_WIDTH - 1 downto 0))
    return spm_master is
    variable i, j : integer := 0;
    variable spm_out : spm_master;
  begin
    i := i + SPM_DATA_WIDTH;
    spm_out.MData := slv_in(i - 1 downto j);
    j := i;
    i := i + SPM_ADDR_WIDTH;
    spm_out.MAddr := slv_in(i - 1 downto j);
    j := i;
    i := i + SPM_CMD_WIDTH;
    spm_out.MCmd := slv_in(i - 1 downto j);
    return spm_out;
  end;

  -----------------------------------------------------------------------------
  -- spm slave
  function spm_slave_to_std_logic_vector (
    spm_in : spm_slave)
    return std_logic_vector is
  begin
    return spm_in.SData;
  end;

  function std_logic_vector_to_spm_slave (
    slv_in : std_logic_vector(SPM_SLAVE_WIDTH - 1 downto 0))
    return spm_slave is
    variable spm_out : spm_slave;
  begin
    spm_out.SData := slv_in;
    return spm_out;
  end;

  

end noc_interface;
