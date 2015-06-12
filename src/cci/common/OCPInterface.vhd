--------------------------------------------------------------------------------
-- Title		: OCPBurst Interface Types
-- Type		 	: Type Package
-- Created	  	: 2014/05/17
-- Edited	   	: 2014/05/17
-- Developers	: Mathias Herlev (Creator)
--
-- Description  : Testbench for read operations
--
-- TODO	:
--
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;
USE work.ocp.all;


PACKAGE OCPInterface IS
   CONSTANT addrw : INTEGER := 32;
   CONSTANT dataw : INTEGER := 32;
	TYPE OCPCmd_t	 IS (Idle, ReadBlock, WriteBlock, ReadWord, WriteWord);
	TYPE OCPResp_t	IS (Idle, VDA1, VDA2, VDA3, VDA4);

	TYPE OCPBurstMaster_r IS
	RECORD
		cmd		 	:	OCPCmd_t;
		addr		:	std_logic_vector(addrw-1 downto 0);
		data		:	std_logic_vector(dataw-1 downto 0);
		dataByteEn  :	std_logic_vector(3 downto 0);
		dataValid   :	std_logic;
	END RECORD;
	CONSTANT OCPBurstMasterIdle_c : OCPBurstMaster_r :=	(Idle,(OTHERS => '0'),
														(OTHERS => '0'),
														(OTHERS => '0'),'0');

	TYPE OCPBurstSlave_r IS
	RECORD
		resp		:	OCPResp_t;
		data		:	std_logic_vector(dataw-1 downto 0);
		cmdAccept   :	std_logic;
		dataAccept  :	std_logic;
	END RECORD;
	CONSTANT OCPBurstSlaveIdle_c : OCPBurstSlave_r :=	(Idle,(OTHERS => '0'),
														'0','0');
	
--	TYPE OCPCoreMaster_r IS
--	RECORD
--		cmd		 	:	OCPCmd_t;
--		addr		:	std_logic_vector(addrw-1 downto 0);
--		data		:	std_logic_vector(dataw-1 downto 0);
--		dataByteEn  :	std_logic_vector(3 downto 0);
--	END RECORD;
--	CONSTANT OCPCoreMasterIdle_c : OCPCoreMaster_r :=	(Idle,(OTHERS => '0'),
--														(OTHERS => '0'),
--														(OTHERS => '0'));

--	TYPE OCPCoreSlave_r IS
--	RECORD
--		resp		:	OCPResp_t;
--		data		:	std_logic_vector(dataw-1 downto 0);
--	END RECORD;
--	CONSTANT OCPCoreSlaveIdle_c : OCPCoreSlave_r := (Idle,(OTHERS => '0'));

	
--	TYPE OCPIOMaster_r IS
--	RECORD
--		cmd		: OCPCmd_t;
--		addr		: std_logic_vector(addrw-1 downto 0);
--		data		: std_logic_vector(dataw-1 downto 0);
--		dataByteEn	: std_logic_vector(3 downto 0);
--		respAccept	: std_logic;
--	END RECORD;
	CONSTANT OCPIOMasterIdle_c : ocp_io_m :=	(OCP_CMD_IDLE,(OTHERS => '0'),
													(OTHERS => '0'),
													(OTHERS => '0'), '0');

--	TYPE OCPIOSlave_r IS
--	RECORD
--		resp		: OCPResp_t;
--		data		: std_logic_vector(dataw-1 downto 0);
--		cmdAccept	: std_logic;
--	END RECORD;
	CONSTANT OCPIOSlaveIdle_c : ocp_io_s := (OCP_RESP_NULL,(OTHERS => '0'), '0');


END OCPInterface;


--PACKAGE BODY PACKAGE_NAME IS
     -- DEFINITION OF PREVIOUSLY DECLARED
        -- CONSTANTS
        -- SUBPROGRAMS
     -- DECLARATION/DEFINITION OF ADDITIONAL
        -- TYPES AND SUBTYPES
        -- SUBPROGRAMS
        -- CONSTANTS, SIGNALS AND SHARED VARIABLES
--END PACKAGE_NAME;
