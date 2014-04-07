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
-- Author: Rasmus Bo Soerensen
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.ocp_config.all;

package ocp is

       -- OCP
    constant OCP_CMD_WIDTH  : integer := 3;     -- 8 possible cmds --> 2
    constant OCP_ADDR_WIDTH : integer := 32;    --32
    constant OCP_BURST_ADDR_WIDTH : integer := BURST_ADDR_WIDTH;    --32
    constant OCP_DATA_WIDTH : integer := 32;
    constant OCP_BYTE_WIDTH : integer := OCP_DATA_WIDTH/8;
    constant OCP_RESP_WIDTH : integer := 2;

    constant OCP_CMD_IDLE : std_logic_vector(OCP_CMD_WIDTH-1 downto 0) := "000";
    constant OCP_CMD_WR   : std_logic_vector(OCP_CMD_WIDTH-1 downto 0) := "001";
    constant OCP_CMD_RD   : std_logic_vector(OCP_CMD_WIDTH-1 downto 0) := "010";
    --constant OCP_CMD_RDEX : std_logic_vector(OCP_CMD_WIDTH-1 downto 0) := "011";
    --constant OCP_CMD_RDL  : std_logic_vector(OCP_CMD_WIDTH-1 downto 0) := "100";
    --constant OCP_CMD_WRNP : std_logic_vector(OCP_CMD_WIDTH-1 downto 0) := "101";
    --constant OCP_CMD_WRC  : std_logic_vector(OCP_CMD_WIDTH-1 downto 0) := "110";
    --constant OCP_CMD_BCST : std_logic_vector(OCP_CMD_WIDTH-1 downto 0) := "111";

    constant OCP_RESP_NULL : std_logic_vector(OCP_RESP_WIDTH-1 downto 0) := "00";
    constant OCP_RESP_DVA  : std_logic_vector(OCP_RESP_WIDTH-1 downto 0) := "01";
    constant OCP_RESP_FAIL : std_logic_vector(OCP_RESP_WIDTH-1 downto 0) := "10";
    constant OCP_RESP_ERR  : std_logic_vector(OCP_RESP_WIDTH-1 downto 0) := "11";

    type ocp_core_m is record
        MCmd        : std_logic_vector(OCP_CMD_WIDTH-1 downto 0);
        MAddr       : std_logic_vector(OCP_ADDR_WIDTH-1 downto 0);
        MData       : std_logic_vector(OCP_DATA_WIDTH-1 downto 0);
        MByteEn     : std_logic_vector(OCP_BYTE_WIDTH-1 downto 0);
    end record;

    type ocp_core_s is record
        SResp       : std_logic_vector(OCP_RESP_WIDTH-1 downto 0);
        SData       : std_logic_vector(OCP_DATA_WIDTH-1 downto 0);
    end record;

    type ocp_io_m is record
        MCmd        : std_logic_vector(OCP_CMD_WIDTH-1 downto 0);
        MAddr       : std_logic_vector(OCP_ADDR_WIDTH-1 downto 0);
        MData       : std_logic_vector(OCP_DATA_WIDTH-1 downto 0);
        MByteEn     : std_logic_vector(OCP_BYTE_WIDTH-1 downto 0);
        MRespAccept : std_logic;
    end record;

    type ocp_io_s is record
        SResp       : std_logic_vector(OCP_RESP_WIDTH-1 downto 0);
        SData       : std_logic_vector(OCP_DATA_WIDTH-1 downto 0);
        SCmdAccept  : std_logic;
    end record;

    type ocp_burst_m is record
        MCmd        : std_logic_vector(OCP_CMD_WIDTH-1 downto 0);
        MAddr       : std_logic_vector(OCP_BURST_ADDR_WIDTH-1 downto 0);
        MData       : std_logic_vector(OCP_DATA_WIDTH-1 downto 0);
        MDataByteEn : std_logic_vector(OCP_BYTE_WIDTH-1 downto 0);
        MDataValid  : std_logic;
    end record;

    type ocp_burst_s is record
        SResp       : std_logic_vector(OCP_RESP_WIDTH-1 downto 0);
        SData       : std_logic_vector(OCP_DATA_WIDTH-1 downto 0);
        SCmdAccept  : std_logic;
        SDataAccept : std_logic;
    end record;

end package ; -- ocp
