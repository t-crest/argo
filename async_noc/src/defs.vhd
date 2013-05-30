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

package defs is

        -----------------------------------------------------------------------
        -- Network Interface
        -----------------------------------------------------------------------
        -- SPM
	constant DATA_WIDTH	: integer := 32;
	constant SPM_DATA_WIDTH	: integer := 64;
	constant SPM_ADDR_WIDTH	: integer := 8;	-- 14 --> 64 kB address space -16->256kb
	constant BLK_CNT	: integer := 14;
        constant SPM_ADDR_WIDTH_MAX : integer := 16;

	-- OCP
	constant OCP_CMD_WIDTH	: integer := 2;		-- 8 possible cmds --> 2
	constant OCP_ADDR_WIDTH	: integer := 32;	--32
	constant OCP_DATA_WIDTH	: integer := DATA_WIDTH;

	-- scheduling Slot Table
	constant SLT_WIDTH	: integer := 3;
	constant PRD_LENGTH	: integer := 2**SLT_WIDTH;	-- 2^6 = 64 -- 2^3 = 8

	constant MAX_PERIOD	: integer := 5;
	
	-- DMA
	constant DMA_IND_WIDTH	: integer := 2;
	constant NODES		: integer := 2**DMA_IND_WIDTH;	-- 2^2 = 4 nodes
	constant DMA_WIDTH	: integer := 64;
	--DMA banks sizes
	constant BANK0_W	: integer := 16;
	constant BANK1_W	: integer := 32;
	constant BANK2_W	: integer := 16;

	-- simulation delays
	constant PDELAY		: time := 500 ps;
	constant NA_HPERIOD	: time := 10 ns;
	constant P_HPERIOD	: time := 10 ns;

	--addressing
	constant ADDR_MASK_W	: integer := 8;
	--starting address of DMA table (0,1) -unprotected 00100000 xxxx...
	constant DMA_MASK	: std_logic_vector(ADDR_MASK_W-1 downto 0) := "00100000";
	--starting address of DMA route table (2) -protected 00010000 xxx.....
	constant DMA_P_MASK	: std_logic_vector(ADDR_MASK_W-1 downto 0) := "00011000";
	--starting address of slot-table -protected 00011000 xxx.....
	constant ST_MASK	: std_logic_vector(ADDR_MASK_W-1 downto 0) := "00010000";	

        
	--configuration options
	constant CNULL		: std_logic_vector(3 downto 0) := "0000";
	constant ST_ACCESS	: std_logic_vector(3 downto 0) := "1000";
	constant DMA_R_ACCESS	: std_logic_vector(3 downto 0) := "0001";
	constant DMA_H_ACCESS	: std_logic_vector(3 downto 0) := "0100";
	constant DMA_L_ACCESS	: std_logic_vector(3 downto 0) := "0010";
        

	--for reconfigurable slot table
	type sltt_type is array (PRD_LENGTH-1 downto 0) of std_logic_vector (DMA_IND_WIDTH-1 downto 0);  

	type ocp_master is record
		MCmd		: std_logic_vector(OCP_CMD_WIDTH-1 downto 0);
	    	MAddr		: std_logic_vector(OCP_ADDR_WIDTH-1 downto 0);
		MData		: std_logic_vector(OCP_DATA_WIDTH-1 downto 0);
	end record;

	type ocp_slave is record
		SCmdAccept	: std_logic;
		SResp		: std_logic;
		SData		: std_logic_vector(OCP_DATA_WIDTH-1 downto 0);
	end record;

	type ocp_master_spm is record
		MCmd		: std_logic_vector(OCP_CMD_WIDTH-1 downto 0);
	    	MAddr		: std_logic_vector(OCP_ADDR_WIDTH-1 downto 0);
		MData		: std_logic_vector(SPM_DATA_WIDTH-1 downto 0);
	end record;

	type ocp_slave_spm is record
		SCmdAccept	: std_logic;
		SResp		: std_logic;
		SData		: std_logic_vector(SPM_DATA_WIDTH-1 downto 0);
	end record;

        -----------------------------------------------------------------------
        -- asynchronous network
        -----------------------------------------------------------------------
	-- network
	--constant PHIT_WIDTH	: integer := 35;	-- see packet format -->32 + 3 control bits

        --async terms
        constant LINK_WIDTH : integer := 35;	-- 32 bit data + 1 type bit 1
                                                -- SOP and 1 EOP
	constant PHIT_WIDTH : integer := 34;     -- phit without the type bit
        constant ARITY :integer := 5;
        
        -- types for network
        subtype link_t is std_logic_vector(LINK_WIDTH-1 downto 0);
	subtype type_t is std_logic;
	subtype phit_t is std_logic_vector(PHIT_WIDTH-1 downto 0);
	subtype onehot_sel is std_logic_vector(ARITY-1 downto 0);
        

 	-- Channels for bundled-data communication
	type channel_forward is record
		req : std_logic;
		data : link_t;
	end record channel_forward;
	
	type channel_backward is record
		ack : std_logic;
	end record channel_backward;
	
	type channel is record
		forward : channel_forward;
		backward : channel_backward;
	end record channel;

  	-- Types to make design generic
	type switch_sel_t is array (ARITY-1 downto 0) of onehot_sel;
	type chs_f is array (ARITY-1 downto 0) of channel_forward;
	type chs_b is array (ARITY-1 downto 0) of channel_backward;
	type bars_t is array (ARITY-1 downto 0, ARITY-1 downto 0) of link_t;
	
	type latch_state is (opaque, transparent);

 	-- Convenience constants, that add some semantics. Not type-safe!
	constant EMPTY_TOKEN  : latch_state := transparent;
	constant EMPTY_BUBBLE : latch_state := transparent;
	constant VALID_BUBBLE : latch_state := transparent;
	constant VALID_TOKEN  : latch_state := opaque;	-- Only valid-tokens are opaque latches
       
	constant delay : time := 0.6 ns;

        -- Function prototype
	function resolve_latch_state (arg : latch_state) return std_logic;

--------------------------------------------------router------------------------
	--subtype	network_link is std_logic_vector(LINK_WIDTH-1 downto 0);
	--type	routerPort is array(4 downto 0) of network_link;

	--constant LINE_ZERO: network_link := (others => '0');

        -----------------------------------------------------------------------
        -- NOC NxN
        -----------------------------------------------------------------------
        
	-- NOC dimension
	constant N		: integer := 2;
        constant NxN            : integer := 4;

        constant SPM_INIT_SIZE : integer := 4;

	--arrays
	type proc_m is array(N-1 downto 0) of ocp_master;
	type proc_s is array(N-1 downto 0) of ocp_slave;
	type procMasters is array(N-1 downto 0) of proc_m;
	type procSlaves is array(N-1 downto 0) of proc_s;

	type spm_m  is array(N-1 downto 0) of ocp_master_spm;
	type spm_s  is array(N-1 downto 0) of ocp_slave_spm;
	type spmMasters is array(N-1 downto 0) of spm_m;
	type spmSlaves is array(N-1 downto 0) of spm_s;


end package defs;


package body defs is
	function resolve_latch_state (arg : latch_state) return std_logic is
	begin
		case arg is
			when transparent => return '0';	-- valid-bubbles (and all empties - also empty tokens) are transparent latches
			when others =>		return '1';	-- Only valid-tokens are opaque latches
		end case;
	end function resolve_latch_state;
end package body defs;



