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
-- Definitions package
--
-- Author: Evangelia Kasapaki
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.math_util.all;
use work.config_types.all;
use work.config.all;

package noc_defs is

  -- SPM
  constant DATA_WIDTH         : integer := 32;
  constant SPM_CMD_WIDTH      : integer := 1;  -- 8 possible cmds --> 2
  constant SPM_DATA_WIDTH     : integer := 64;
  constant BLK_CNT            : integer := 14;
  constant SPM_ADDR_WIDTH_MAX : integer := 16;  -- SPM addr width cannot be more than 16 bits -> 256kb

  -- async network
  --constant PHIT_WIDTH : integer := 35;        -- see packet format -->32 + 3 control bits
  constant LINK_WIDTH : integer := 35;            -- 32 bit data + 1 type bit 1
                                                  -- SOP and 1 EOP
  constant PHIT_WIDTH : integer := LINK_WIDTH-1;  -- phit without the type bit
  constant ARITY      : integer := 5;

  -- scheduling
  constant ADDR_SLT_WIDTH : integer := log2up(PRD_LENGTH-1);
  --constant PRD_LENGTH : integer := 2**ADDR_SLT_WIDTH; -- 2^6 = 64 -- 2^3 = 8

  constant MAX_PERIOD : integer := 256;

  -- DMA
  --constant DMA_IND_WIDTH : integer := log2up(NODES-1);
  constant DMA_IND_WIDTH : integer := 8;
  --constant NODES              : integer := 2**DMA_IND_WIDTH;  -- 2^2 = 4 nodes
  constant DMA_WIDTH     : integer := 64;
  --DMA banks sizes
  constant BANK0_W       : integer := 16;
  constant BANK1_W       : integer := 32;
  constant BANK2_W       : integer := 16;



  --addressing
  constant ADDR_MASK_W : integer                                  := 8;
  --starting address of DMA table (0,1) -unprotected 00100000 xxxx...
  constant DMA_MASK    : std_logic_vector(ADDR_MASK_W-1 downto 0) := x"E0";  --"11100000";
  --starting address of DMA route table (2) -protected 00010000 xxx.....
  constant DMA_P_MASK  : std_logic_vector(ADDR_MASK_W-1 downto 0) := x"E1";  --"11100001";
  --starting address of slot-table -protected 00011000 xxx.....
  constant ST_MASK     : std_logic_vector(ADDR_MASK_W-1 downto 0) := x"E2";  --"11100010";

  --configuration options
  constant CNULL        : std_logic_vector(3 downto 0) := "0000";
  constant ST_ACCESS    : std_logic_vector(3 downto 0) := "1000";
  constant DMA_R_ACCESS : std_logic_vector(3 downto 0) := "0001";
  constant DMA_H_ACCESS : std_logic_vector(3 downto 0) := "0100";
  constant DMA_L_ACCESS : std_logic_vector(3 downto 0) := "0010";

  --for reconfigurable slot table
  type sltt_type is array (PRD_LENGTH-1 downto 0) of std_logic_vector (DMA_IND_WIDTH-1 downto 0);

--------------------------------------------------router-----------------------

  -- types for network
  subtype link_t is std_logic_vector(LINK_WIDTH-1 downto 0);
  subtype type_t is std_logic;
  subtype phit_t is std_logic_vector(PHIT_WIDTH-1 downto 0);
  subtype onehot_sel is std_logic_vector(ARITY-1 downto 0);


  constant LINE_ZERO : link_t := (others => '0');


  -- Channels for bundled-data communication
  type channel_forward is record
    req  : std_logic;
    data : link_t;
  end record channel_forward;

  type channel_backward is record
    ack : std_logic;
  end record channel_backward;

--      type channel is record
--              forward : channel_forward;
--              backward : channel_backward;
--      end record channel;

  -- Types to make design generic
  type switch_sel_t is array (ARITY-1 downto 0) of onehot_sel;
  type chs_f is array (ARITY-1 downto 0) of channel_forward;
  type chs_b is array (ARITY-1 downto 0) of channel_backward;
  type bars_t is array (ARITY-1 downto 0, ARITY-1 downto 0) of link_t;

  --constant delay : time := 0.3 ns; -- Migrated to delays.vhd

  

end package noc_defs;





