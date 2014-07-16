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

-------------------------------------------------------------------------------
-- traffic generator package
--
-- shared stuff for the traffic generators
-- Author: Christoph Mueller
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ocp.all;
use work.noc_defs.all;


package traffic_generator_package is

  constant TG_DMA_WIDTH : integer := OCP_ADDR_WIDTH-ADDR_MASK_W;

  constant TG_DMA_BASE_ADDRESS  : unsigned(TG_DMA_WIDTH - 1 downto 0) := x"000000";
  constant TG_DMA_DISTANCE      : unsigned(TG_DMA_WIDTH - 1 downto 0) := x"000008";
  constant TG_DMA_ENABLE        : unsigned(TG_DMA_WIDTH - 1 downto 0) := x"000000";
  constant TG_DMA_ADDRESS_FIELD : unsigned(TG_DMA_WIDTH - 1 downto 0) := x"000004";

  -- global synchronisation signals - driven to weak high when ready, low otherwise;
  signal TG_SYNC_NI         : std_logic := '0';
  signal TG_SYNC_DMA        : std_logic := '0';
  signal TG_SYNC_SPM        : std_logic := '0';
  signal TG_TRANSFER_DONE   : std_logic := '0';
  signal TG_SIMULATION_DONE : std_logic := '0';  -- stop the simulation

  type phit_vector_t is array (integer range <>) of phit_t;
  
  function tg_dma_setup_addr (
    dma_id : integer)
    return std_logic_vector;
  function tg_dma_enable_addr (
    dma_id : integer)
    return std_logic_vector;
  -- register a TG;

end traffic_generator_package;

package body traffic_generator_package is

  function tg_dma_setup_addr (
    dma_id : integer) return std_logic_vector is
    variable outp : std_logic_vector(TG_DMA_WIDTH - 1 downto 0);
  begin
    outp := std_logic_vector(to_unsigned(to_integer(TG_DMA_BASE_ADDRESS + dma_id * TG_DMA_DISTANCE + TG_DMA_ADDRESS_FIELD), TG_DMA_WIDTH));
    return outp;
  end;

  function tg_dma_enable_addr (
    dma_id : integer)
    return std_logic_vector is
    variable outp : std_logic_vector(TG_DMA_WIDTH - 1 downto 0);
  begin
    outp := std_logic_vector(to_unsigned(to_integer(TG_DMA_BASE_ADDRESS + dma_id * TG_DMA_DISTANCE + TG_DMA_ENABLE), TG_DMA_WIDTH));
    return outp;
  end;

  

  

end package body traffic_generator_package;
