-- 
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
-- Joined SPM
-- Author: Christoph Mueller
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.noc_defs.all;
use work.noc_interface.all;

entity spm is
  
  generic (
    DATA : integer := 64;
    ADDR : integer := 8);

  port (
    a_spm_slave	 : out spm_slave;
    a_spm_master : in  spm_master;
    b_spm_slave	 : out spm_slave;
    b_spm_master : in  spm_master;
    a_clk	 : in  std_logic;
    b_clk	 : in  std_logic;
    reset	 : in  std_logic
    );

end entity spm;

architecture two_bram_tdp of spm is
  
  component bram_tdp is

    generic (
      DATA : integer := 64;
      ADDR : integer := 8
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

begin  -- architecture two_bram_tdp

  -- High SPM instance
  spm : bram_tdp
    generic map (DATA => DATA, ADDR => ADDR)
    port map (a_clk  => a_clk,
	      a_wr   => a_spm_master.MCmd(0),
	      a_addr => a_spm_master.MAddr(ADDR-1 downto 0),
	      a_din  => a_spm_master.MData,
	      a_dout => a_spm_slave.SData,
	      b_clk  => b_clk,
	      b_wr   => b_spm_master.MCmd(0),
	      b_addr => b_spm_master.MAddr(ADDR-1 downto 0),
	      b_din  => b_spm_master.MData,
	      b_dout => b_spm_slave.SData);
  

end architecture two_bram_tdp;
