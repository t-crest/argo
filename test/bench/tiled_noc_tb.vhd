-------------------------------------------------------------------------------
-- Title      : Testbench for design "tiled_noc"
-- Project    : Async noc
-------------------------------------------------------------------------------
-- File       : tiled_noc_tb.vhd
-- Author     : Christoph Müller  <eit-cpm@cas-07.eit.lth.se>
-- Company    : 
-- Created    : 2014-02-25
-- Last update: 2014-04-03
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-02-25  1.0      eit-cpm Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.config.all;
use work.delays.all;
use work.noc_defs.all;
use work.noc_interface.all;
use work.traffic_generator_package.all;

-------------------------------------------------------------------------------

entity tiled_noc_tb is

end entity tiled_noc_tb;

-------------------------------------------------------------------------------

architecture foo of tiled_noc_tb is

  -- component ports
  signal reset : std_logic := '1';

  -- clock
  signal clk : std_logic := '1';

begin  -- architecture foo

  -- component instantiation
  DUT : entity work.tiled_noc
    port map (
      n_clk => clk,
      reset => reset);

  -- clock generation

  reset <= '0'     after 4 * NA_HPERIOD + delay;
  --proc clock
  clk_generate : process
  begin
    wait for NA_HPERIOD;
    clk <= not clk;

    -- stop clock at the end of the simulation
    if TG_SIMULATION_DONE = 'H' then
      wait;
    end if;
  end process;
  


  

end architecture foo;

-------------------------------------------------------------------------------

configuration tiled_noc_tb_foo_cfg of tiled_noc_tb is
  for foo
  end for;
end tiled_noc_tb_foo_cfg;

-------------------------------------------------------------------------------
