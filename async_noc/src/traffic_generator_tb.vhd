-------------------------------------------------------------------------------
-- Title      : Testbench for design "traffic_generator"
-- Project    : Async noc
-------------------------------------------------------------------------------
-- File       : traffic_generator_tb.vhd
-- Author     : Christoph Müller  <eit-cpm@cas-07.eit.lth.se>
-- Company    : 
-- Created    : 2014-02-25
-- Last update: 2014-02-25
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-02-25  1.0      eit-cpm	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use ieee.math_real.all;
use std.textio.all;
use work.txt_util.all;
use work.cmd_util.all;
use work.config.all;
use work.ocp.all;
use work.noc_interface.all;
use work.tile_package.all;
use work.traffic_generator_package.all;
use work.noc_defs.all;

-------------------------------------------------------------------------------

entity traffic_generator_tb is

end entity traffic_generator_tb;

-------------------------------------------------------------------------------

architecture behav of traffic_generator_tb
 is

  -- component ports
  signal reset : std_logic := '1';
  signal spm_master : spm_master;
  signal spm_slave  : spm_slave;
  signal p_master   : ocp_io_m;
  signal p_slave    : ocp_io_s;
  signal settings   : tile_settings;

  -- clock
  signal clk : std_logic := '1';

begin  -- architecture dut

  -- component instantiation
  DUT: entity work.traffic_generator
    port map (
      clk	 => clk,
      reset	 => reset,
      spm_master => spm_master,
      spm_slave	 => spm_slave,
      p_master	 => p_master,
      p_slave	 => p_slave,
      settings	 => settings);

  -- clock generation
  clk <= not clk after 10 ns;

  reset <= '0' after 100 ns;

  settings.tile_id <= to_unsigned(2, settings.tile_id'length);
  -- waveform generation
  WaveGen_Proc: process
  begin
    -- insert signal assignments here

    wait until clk = '1';
  end process WaveGen_Proc;

  ST_write_fake_accept: process is
  begin  -- process ST_write_fake_accept    
    p_slave.SCmdAccept <= '0';
    p_slave.SResp <= OCP_RESP_NULL;
    p_slave.SData <= (others => '0');
    wait until p_master.MCmd = OCP_CMD_WR;
    wait until falling_edge(clk);
    p_slave.SCmdAccept <= '1';
    p_slave.SResp <= OCP_RESP_DVA;
    wait until falling_edge(clk);
  end process ST_write_fake_accept;

end architecture behav;

