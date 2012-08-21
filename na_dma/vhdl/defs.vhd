library ieee;
use ieee.std_logic_1164.all;

package defs is

	-- SPM
	constant DATA_WIDTH	: integer := 32;
	constant SPM_DATA_WIDTH	: integer := 64;
	constant SPM_ADDR_WIDTH	: integer := 16;	-- 14 --> 64 kB address space -16->256kb
	constant BLK_CNT	: integer := 14;

	-- OCP
	constant OCP_CMD_WIDTH	: integer := 2;		-- 8 possible cmds --> 2
	constant OCP_ADDR_WIDTH	: integer := 32;	--32
	constant OCP_DATA_WIDTH	: integer := DATA_WIDTH;

	-- network
	constant PHIT_WIDTH	: integer := 35;	-- see packet format -->32 + 3 control bits

	-- scheduling
	constant SLT_WIDTH	: integer := 6;
	constant PRD_LENGTH	: integer := 2**SLT_WIDTH;	-- 2^6 = 64 -- 2^3 = 8

	constant MAX_PERIOD	: integer :=128;
	
	-- DMA
	constant DMA_IND_WIDTH	: integer := 4;
	constant NODES		: integer := 2**DMA_IND_WIDTH;	-- 2^2 = 4 nodes
	constant DMA_WIDTH	: integer := 64;
	--DMA banks sizes
	constant BANK0_W	: integer := 16;
	constant BANK1_W	: integer := 32;
	constant BANK2_W	: integer := 16;

	--type state_type is (hdr, data1, data2);
	constant PDELAY		: time := 500 ps;
	constant NA_HPERIOD	: time := 5 ns;
	constant P_HPERIOD	: time := 5 ns;

	--addressing
	constant ADDR_MASK_W	: integer := 8;
	--starting address of DMA table (0,1) -unprotected 00100000 xxxx...
	constant DMA_MASK	: std_logic_vector(ADDR_MASK_W-1 downto 0) := "00100000";
	--starting address of DMA route table (2) -protected 00010000 xxx.....
	constant DMA_P_MASK	: std_logic_vector(ADDR_MASK_W-1 downto 0) := "00010000";
	--starting address of slot-table -protected 00011000 xxx.....
	constant ST_MASK	: std_logic_vector(ADDR_MASK_W-1 downto 0) := "00011000";	

	--configuration options
	constant CNULL		: std_logic_vector(3 downto 0) := "0000";
	constant ST_ACCESS	: std_logic_vector(3 downto 0) := "1000";
	constant DMA_R_ACCESS	: std_logic_vector(3 downto 0) := "0001";
	constant DMA_H_ACCESS	: std_logic_vector(3 downto 0) := "0100";
	constant DMA_L_ACCESS	: std_logic_vector(3 downto 0) := "0010";

	--for reconfigurable slot table needed
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

	type network_link is record
		phit		: std_logic_vector(PHIT_WIDTH-1 downto 0);
	end record;

	function vectorize(s: std_logic) return std_logic_vector;

end package defs;

package body defs is

function vectorize(s: std_logic) return std_logic_vector is
variable v: std_logic_vector(0 downto 0);
begin
	v(0) := s;
	return v;
end;

end package body defs;



