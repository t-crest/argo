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
-- Generic test bench using traffic generators to stimulate the noc
-- Author: Evangelia Kasapaki
--         Christoph Mueller
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use std.textio.all;
use work.txt_util.all;
use work.cmd_util.all;
use work.config.all;
use work.noc_defs.all;
use work.ocp.all;
use work.noc_interface.all;
-- provides the type used by the traffic generators propagate the node id
use work.tile_package.all;
use work.traffic_generator_package.all;

entity noc_tb is
end noc_tb;


architecture behav of noc_tb is

-----------------------component declarations------------------------------
  component noc is
    port (
      p_clk       : in  std_logic;
      n_clk       : in  std_logic;
      reset       : in  std_logic;
      ocp_io_ms   : in  ocp_io_m_a;
      ocp_io_ss   : out ocp_io_s_a;
      spm_ports_m : out spm_masters;
      spm_ports_s : in  spm_slaves
      );
  end component;


  component bram_tdp is

    generic (
      DATA : integer := 32;
      ADDR : integer := 14
      );

    port (
-- Port A
      a_clk  : in  std_logic;
      a_wr   : in  std_logic;
      a_addr : in  std_logic_vector(ADDR-1 downto 0);
      a_din  : in  std_logic_vector(DATA-1 downto 0);
      a_dout : out std_logic_vector(DATA-1 downto 0);

-- Port B
      b_clk  : in  std_logic;
      b_wr   : in  std_logic;
      b_addr : in  std_logic_vector(ADDR-1 downto 0);
      b_din  : in  std_logic_vector(DATA-1 downto 0);
      b_dout : out std_logic_vector(DATA-1 downto 0)
      );
  end component;

  component traffic_generator is
    generic (
      SLT_WIDTH : natural := DMA_IND_WIDTH + 3
      );
    port (
      clk        : in  std_logic;
      reset      : in  std_logic;
      spm_master : out spm_master;
      spm_slave  : in  spm_slave;
      p_master   : out ocp_io_m;
      p_slave    : in  ocp_io_s;
      settings   : in  tile_settings);
  end component traffic_generator;

-------------------------signal declarations-------------------------------
  signal n_clk : std_logic := '1';
  signal p_clk : std_logic := '1';
  signal reset : std_logic := '1';

  signal p_masters     : ocp_io_m_a;
  signal p_slaves      : ocp_io_s_a;
  signal p_spm_masters : spm_masters;
  signal P_spm_slaves  : spm_slaves;
  signal n_spm_masters : spm_masters;
  signal n_spm_slaves  : spm_slaves;

begin


  --na clock
  na_clk_generate : process
  begin
    wait for NA_HPERIOD;
    n_clk <= not n_clk;

    -- stop clock at the end of the simulation
    if TG_SIMULATION_DONE = 'H' then
      wait;
    end if;
  end process;

  --proc clock
  proc_clk_generate : process
  begin
    wait for P_HPERIOD;
    p_clk <= not p_clk;

    -- stop clock at the end of the simulation
    if TG_SIMULATION_DONE = 'H' then
      wait;
    end if;
  end process;

  --reset
  rst_generate : process
  begin
    wait for 4*NA_HPERIOD;
    wait for delay;
    reset <= '0';
    wait;
  end process;

  -- SPM
  spm_m : for i in 0 to M-1 generate
    spm_n : for j in 0 to N-1 generate
      -- High SPM instance
      spm_h : bram_tdp
        generic map (DATA => DATA_WIDTH, ADDR => SPM_ADDR_WIDTH)
        port map (a_clk  => p_clk,
                  a_wr   => p_spm_masters((i*N)+j).MCmd(0),
                  a_addr => p_spm_masters((i*N)+j).MAddr(SPM_ADDR_WIDTH-1 downto 0),
                  a_din  => p_spm_masters((i*N)+j).MData(63 downto 32),
                  a_dout => p_spm_slaves((i*N)+j).SData(63 downto 32),
                  b_clk  => n_clk,
                  b_wr   => n_spm_masters((i*N)+j).MCmd(0),
                  b_addr => n_spm_masters((i*N)+j).MAddr(SPM_ADDR_WIDTH-1 downto 0),
                  b_din  => n_spm_masters((i*N)+j).MData(63 downto 32),
                  b_dout => n_spm_slaves((i*N)+j).SData(63 downto 32));

      -- Low SPM instance
      spm_l : bram_tdp
        generic map (DATA => DATA_WIDTH, ADDR => SPM_ADDR_WIDTH)
        port map (a_clk  => p_clk,
                  a_wr   => p_spm_masters((i*N)+j).MCmd(0),
                  a_addr => p_spm_masters((i*N)+j).MAddr(SPM_ADDR_WIDTH-1 downto 0),
                  a_din  => p_spm_masters((i*N)+j).MData(31 downto 0),
                  a_dout => p_spm_slaves((i*N)+j).SData(31 downto 0),
                  b_clk  => n_clk,
                  b_wr   => n_spm_masters((i*N)+j).MCmd(0),
                  b_addr => n_spm_masters((i*N)+j).MAddr(SPM_ADDR_WIDTH-1 downto 0),
                  b_din  => n_spm_masters((i*N)+j).MData(31 downto 0),
                  b_dout => n_spm_slaves((i*N)+j).SData(31 downto 0));
    end generate spm_n;
  end generate spm_m;

  -- Traffic Generators
  tg_m : for i in M-1 downto 0 generate
    tg_n : for j in N-1 downto 0 generate
      s : if TARGET_IMPLEMENTATION = SYNC generate
        tg : traffic_generator
          generic map (
            SLT_WIDTH => 3)
          port map (
            clk        => p_clk,
            reset      => reset,
            spm_master => p_spm_masters((i*N)+j),
            spm_slave  => p_spm_slaves((i*N)+j),
            p_master   => p_masters((i*N)+j),
            p_slave    => p_slaves((i*N)+j),
            settings   => generate_tile_settings(i, j));
      end generate s;
      as : if TARGET_IMPLEMENTATION = ASYNC generate
        tg : traffic_generator
          generic map (
            SLT_WIDTH => DMA_IND_WIDTH + 3)
          port map (
            clk        => p_clk,
            reset      => reset,
            spm_master => p_spm_masters((i*N)+j),
            spm_slave  => p_spm_slaves((i*N)+j),
            p_master   => p_masters((i*N)+j),
            p_slave    => p_slaves((i*N)+j),
            settings   => generate_tile_settings(i, j));
      end generate as;
    end generate tg_n;
  end generate tg_m;

  -- NOC
  noc2x2 : noc
    port map (
      p_clk => p_clk,
      n_clk => n_clk,
      --n_clk_skd => n_clk,
      reset => reset,

      ocp_io_ms => p_masters,
      ocp_io_ss => p_slaves,

      spm_ports_m => n_spm_masters,
      spm_ports_s => n_spm_slaves
      );

end behav;
