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
-- Joined SPM, SRAM implementation
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

architecture sram_implementation of spm is

  component ST_DPHD_160x64m4_bTL

--synopsys synthesis_off
    generic (
      Corruption_Read_Violation : boolean := true;
      ConfigFault		: boolean := false;
      max_faults		: natural := 20;
      Fault_file_name		: string  := "ST_DPHD_160x64m4_bTL_faults.txt";

      -- generics for Memory initialization
      MEM_INITIALIZE : boolean := false;
      BinaryInit     : integer := 0;
      InitFileNAME   : string  := "ST_DPHD_160x64m4_bTL.cde";

      InstancePath : string := "ST_DPHD_160x64m4_bTL";
      Debug_mode   : string := "ALL_WARNING_MODE"
      );
--synopsys synthesis_on

    
    port (
      Q1       : out std_logic_vector(63 downto 0);
      Q2       : out std_logic_vector(63 downto 0);
      RY1      : out std_logic;
      RY2      : out std_logic;
      CK1      : in  std_logic;
      CK2      : in  std_logic;
      CSN1     : in  std_logic;
      CSN2     : in  std_logic;
      MTCK1    : in  std_logic;
      MTCK2    : in  std_logic;
      SELCK    : in  std_logic;
      TBYPASS1 : in  std_logic;
      TBYPASS2 : in  std_logic;
      WEN1     : in  std_logic;
      WEN2     : in  std_logic;
      A1       : in  std_logic_vector(7 downto 0);
      A2       : in  std_logic_vector(7 downto 0);
      D1       : in  std_logic_vector(63 downto 0);
      D2       : in  std_logic_vector(63 downto 0);
      M1       : in  std_logic_vector(63 downto 0);
      M2       : in  std_logic_vector(63 downto 0);
      TP1      : in  std_logic;
      TP2      : in  std_logic
      ) ;

  end component;

signal a_wen, b_wen : std_logic;

begin  -- architecture two_bram_tdp

  a_wen <= not a_spm_master.MCmd(0);
  b_wen <= not b_spm_master.MCmd(0);
  
  ST_DPHD_160x64m4_bTL_1 : ST_DPHD_160x64m4_bTL
    port map (
      Q1       => a_spm_slave.SData,	-- output of port a...
      Q2       => b_spm_slave.SData,	-- ... and port b
      RY1      => open,  		-- handshake port
      RY2      => open,  		-- not used
      CK1      => a_clk,  		-- port a clock...
      CK2      => b_clk,  		-- and there is even one for port b
      CSN1     => '0',  		
      CSN2     => '0',  		
      MTCK1    => '0',			
      MTCK2    => '0',
      SELCK    => '0',
      TBYPASS1 => '0',
      TBYPASS2 => '0',
      WEN1     => a_wen,
      WEN2     => b_wen,
      A1       => a_spm_master.MAddr(ADDR-1 downto 0),
      A2       => b_spm_master.MAddr(ADDR-1 downto 0),
      D1       => a_spm_master.MData,
      D2       => b_spm_master.MData,
      M1       => (others => '0'),  	-- no mask
      M2       => (others => '0'),  	-- no mask
      TP1      => '0',			-- not used
      TP2      => '0');			--

end architecture sram_implementation;
