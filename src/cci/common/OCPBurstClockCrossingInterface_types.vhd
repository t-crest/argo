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
USE work.OCPInterface.all;
USE work.ocp.all;

PACKAGE OCPBurstCCI_types IS

    TYPE OCPBurstCCIIn_r IS
    RECORD
        clk_A		: std_logic;
        rst_A		: std_logic;
        clk_B		: std_logic;
        rst_B		: std_logic;
        OCPB_slave	: ocp_burst_s;
        OCPB_master	: ocp_burst_m;
    END RECORD;

    TYPE OCPBurstCCIOut_r IS
    RECORD
        OCPB_A	: ocp_burst_m;
        OCPB_B	: ocp_burst_s;
    END RECORD;

    TYPE AsyncBurst_A_r IS
    RECORD
        req         : std_logic;
        Data		: ocp_burst_m;
        DataInSel   : std_logic_vector(1 downto 0);
    END RECORD;

    TYPE AsyncBurst_B_r IS
    RECORD
        ack         : std_logic;
        Data		: ocp_burst_s;
        DataInSel   : std_logic_vector(1 downto 0);
    END RECORD;
END OCPBurstCCI_types;


--PACKAGE BODY PACKAGE_NAME IS
     -- DEFINITION OF PREVIOUSLY DECLARED
        -- CONSTANTS
        -- SUBPROGRAMS
     -- DECLARATION/DEFINITION OF ADDITIONAL
        -- TYPES AND SUBTYPES
        -- SUBPROGRAMS
        -- CONSTANTS, SIGNALS AND SHARED VARIABLES
--END PACKAGE_NAME;
