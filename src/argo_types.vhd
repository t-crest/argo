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
-- Author: Rasmus Bo Soerensen (rasmus@rbscloud.dk)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ocp.all;

package argo_types is
    constant WORD_WIDTH : integer := 32;
    -- General header packet constants and types
    constant HEADER_ROUTE_WIDTH : integer := 16;
    constant HEADER_FIELD_WIDTH : integer := 16;
    constant HEADER_CTRL_WIDTH : integer := 2;
    subtype route_t is std_logic_vector(HEADER_ROUTE_WIDTH-1 downto 0);
    subtype header_field_t is std_logic_vector(HEADER_FIELD_WIDTH-1 downto 0);
    -- Data packet constants and types
    constant DPKT_WRITE_ADDR_WIDTH : integer := HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH;
    -- Configuration packet constants and types
    constant CPKT_BANK_WIDTH : integer := 3;
    constant CPKT_ADDR_WIDTH : integer := HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH - CPKT_BANK_WIDTH;
    subtype config_bank_t is unsigned(CPKT_BANK_WIDTH-1 downto 0);
    subtype config_addr_t is unsigned(CPKT_ADDR_WIDTH-1 downto 0);

    constant DMA_BANK       : unsigned(CPKT_BANK_WIDTH-1 downto 0) := "000";
    constant SCHED_BANK     : unsigned(CPKT_BANK_WIDTH-1 downto 0) := "001";
    constant TDM_BANK       : unsigned(CPKT_BANK_WIDTH-1 downto 0) := "010";
    constant CLOCK_BANK     : unsigned(CPKT_BANK_WIDTH-1 downto 0) := "011";
    constant IRQ_BANK       : unsigned(CPKT_BANK_WIDTH-1 downto 0) := "100";
    constant IRQ_DATA_BANK  : unsigned(CPKT_BANK_WIDTH-1 downto 0) := "101";
    constant ERROR_BANK     : unsigned(CPKT_BANK_WIDTH-1 downto 0) := "110";
    constant PERF_BANK      : unsigned(CPKT_BANK_WIDTH-1 downto 0) := "111";

    -- Interrupt packet constants and types
    constant IPKT_SRC_ID_WIDTH : integer := 6; -- TODO: calculate from maximum number of cores in the platform
    constant IPKT_IRQ_ID_WIDTH : integer := HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH - IPKT_SRC_ID_WIDTH;
    subtype src_id_t is unsigned(IPKT_SRC_ID_WIDTH-1 downto 0);
    subtype irq_id_t is unsigned(IPKT_IRQ_ID_WIDTH-1 downto 0);

    -- TDM controller constants and types
    constant TDM_S_CNT_WIDTH : integer := 10;

    -- Schedule table constants and types
    constant STBL_IDX_WIDTH : integer := 8; -- 2^8 = 256 schedule entries
    constant STBL_T2N_WIDTH : integer := 5;
    constant STBL_PKT_LEN_WIDTH : integer := 3;
    subtype stbl_idx_t is unsigned(STBL_IDX_WIDTH-1 downto 0);
    subtype stbl_t2n_t is unsigned(STBL_T2N_WIDTH-1 downto 0);
    subtype stbl_pkt_len_t is unsigned(STBL_PKT_LEN_WIDTH-1 downto 0);
    
    -- DMA table constants and types
    constant DMATBL_COUNT_WIDTH : integer := 14;
    constant DMATBL_READ_PTR_WIDTH : integer := 14;
    constant DMATBL_IDX_WIDTH : integer := 8; -- 2^8 = 256 DMA entries
    subtype dma_idx_t is unsigned(DMATBL_IDX_WIDTH-1 downto 0);
    subtype dma_read_addr_t is unsigned(DMATBL_READ_PTR_WIDTH-1 downto 0);

    -- Interrupt fifo constants and types
    constant IRQ_DATA_WIDTH : integer := HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH;
    subtype irq_data_t is std_logic_vector(IRQ_DATA_WIDTH-1 downto 0);

    -- Memory interface records
    type mem_if_master is record
        addr : unsigned(HEADER_FIELD_WIDTH-HEADER_CTRL_WIDTH-1 downto 0);
        en : std_logic;
        wr : std_logic;
        wdata : std_logic_vector((2*WORD_WIDTH)-1 downto 0);
    end record;

    type mem_if_slave is record
        rdata : std_logic_vector((2*WORD_WIDTH)-1 downto 0);
        error : std_logic;
    end record;

    -- Link constants
    constant LINK_DATA_WIDTH : integer := WORD_WIDTH;
    constant LINK_CTRL : integer := 3;
    constant LINK_WIDTH : integer := LINK_DATA_WIDTH + LINK_CTRL;

    subtype link_t is std_logic_vector(LINK_WIDTH-1 downto 0);

end package ; -- argo_types


package body argo_types is

end argo_types ;
