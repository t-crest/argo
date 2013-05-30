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
-- Commands package for the configuration of the NI and the accessing of SPM.
--
-- Author: Evangelia Kasapaki
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use work.defs.all;


package cmd_util is

    constant SIMDELAY : time := 3 ns;

    --writes a 64bit value from a processor to spm
    procedure spm_write (signal core: out ocp_master_spm; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic);

    --reads a 64bit value from spm to processor
    procedure spm_read (signal core: out ocp_master_spm; addr: std_logic_vector; signal clk: in std_logic);

    --writes a Slot Table entry
    procedure st_write (signal core : out ocp_master; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic);

    --reads a Slot Table entry
    procedure st_read (signal core: out ocp_master; addr: std_logic_vector; signal clk: in std_logic);

    --write a DMA route
    procedure route_write (signal core: out ocp_master; signal slave: in ocp_slave; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic);

    --write a DMA controller
    procedure dma_write (signal core: out ocp_master; signal slave: in ocp_slave; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic);

    --generic processor write
    procedure proc_write (signal core: out ocp_master; signal slave: in ocp_slave; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic);

    --generic processor read
    procedure proc_read (signal core: out ocp_master; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic);


end cmd_util;



package body cmd_util is
  


  --writes a 64bit value from a processor to spm
  procedure spm_write (signal core: out ocp_master_spm; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic) is
  begin
    wait for SIMDELAY;
    core.MCmd <= "11";
    core.MAddr <= addr;
    core.MData <= data;
    wait until rising_edge(clk);
    wait for SIMDELAY;
    core.MCmd <= (others=>'0');
    core.MAddr <= (others=>'0');
    core.MData <= (others=>'0');
    --wait until rising_edge(clk);
    return;
  end spm_write;

  
  --reads a 64bit value from spm to processor
  procedure spm_read (signal core: out ocp_master_spm; addr: std_logic_vector; signal clk: in std_logic) is
  begin
    wait for SIMDELAY;
    core.MCmd <= "10";
    core.MAddr <= addr;
    wait until rising_edge(clk);
    wait for SIMDELAY;
    core.MCmd <= "00";
    core.MAddr <= (others=>'0');
    --wait until rising_edge(clk);
    return;
  end spm_read;

  --writes a Slot Table entry
  procedure st_write (signal core : out ocp_master; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic) is
  begin
    wait for SIMDELAY;
    core.MCmd <= "11";
    core.MAddr <= ST_MASK & addr;
    core.MData <= x"000000" & "000" & data;
    wait until rising_edge(clk);
    wait for SIMDELAY;
    core.MCmd <= (others=>'0');
    core.MAddr <= (others=>'0');
    core.MData <= (others=>'0');
    --wait until rising_edge(clk);
    return;
  end st_write;

  --reads a Slot Table entry
  procedure st_read (signal core: out ocp_master; addr: std_logic_vector; signal clk: in std_logic) is
  begin
    wait for SIMDELAY;
    core.MCmd <= "10";
    core.MAddr <= ST_MASK & addr;
    wait until rising_edge(clk);
    wait for SIMDELAY;
    core.MCmd <= (others=>'0');
    core.MAddr <= (others=>'0');
    --wait until rising_edge(clk);
    return;
  end st_read;

  --write a DMA route
  procedure route_write (signal core: out ocp_master; signal slave : in ocp_slave; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic) is
  begin
    wait for SIMDELAY;
    core.MCmd <= "11";
    core.MAddr <= DMA_P_MASK & addr;
    core.MData <= x"0000" & data;
    wait until rising_edge(clk) and slave.SResp='1';
    wait for SIMDELAY;
    core.MCmd <= (others=>'0');
    core.MAddr <= (others=>'0');
    core.MData <= (others=>'0');
    --wait until rising_edge(clk);
    return;
  end route_write;

  --write a DMA controller
  procedure dma_write (signal core: out ocp_master; signal slave : in ocp_slave; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic) is
  begin
    wait for SIMDELAY;
    core.MCmd <= "11";
    core.MAddr <= DMA_MASK & addr;
    core.MData <= data;
    wait until rising_edge(clk) and slave.SResp='1';
    wait for SIMDELAY;
    core.MCmd <= (others=>'0');
    core.MAddr <= (others=>'0');
    core.MData <= (others=>'0');
    --wait until rising_edge(clk);
    return;
  end dma_write;

  --generic processor write
  procedure proc_write (signal core: out ocp_master; signal slave : in ocp_slave; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic) is
  begin
    wait for SIMDELAY;
    core.MCmd <= "11";
    core.MAddr <= addr;
    core.MData <= data;
    wait until rising_edge(clk) and slave.SResp='1';
    wait for SIMDELAY;
    core.MCmd <= (others=>'0');
    core.MAddr <= (others=>'0');
    core.MData <= (others=>'0');    
    --wait until rising_edge(clk);
    return;
  end proc_write;

  --generic processor read
  procedure proc_read (signal core: out ocp_master; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic) is
  begin
    wait for SIMDELAY;
    core.MCmd <= "00";
    core.MAddr <= addr;
    core.MData <= data;
    wait until rising_edge(clk);
    wait for SIMDELAY;
    core.MCmd <= (others=>'0');
    core.MAddr <= (others=>'0');
    core.MData <= (others=>'0');   
    --wait until rising_edge(clk);
    return;
  end proc_read;

  
end cmd_util;



