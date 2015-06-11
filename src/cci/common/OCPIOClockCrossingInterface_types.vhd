--------------------------------------------------------------------------------
-- Title		: OCPBurst Interface Types
-- Type		 : Type Package
-- Created	  : 2014/05/17
-- Edited	   : 2014/05/17
-- Developers   : Mathias Herlev (Creator)
--
-- Description  :
--
-- TODO	:
--
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;
USE work.OCPInterface.all;
USE work.ocp.all;
PACKAGE OCPIOCCI_types IS

    TYPE OCPIOCCIIn_r IS
    RECORD
        clk_A	: std_logic;
        rst_A	: std_logic;
        clk_B	: std_logic;
        rst_B	: std_logic;
        ocpio_A	: ocp_io_s;
        ocpio_B	: ocp_io_m;
    END RECORD;

    TYPE OCPIOCCIOut_r IS
    RECORD
        ocpio_A	: ocp_io_m;
        ocpio_B	: ocp_io_s;
    END RECORD;

    TYPE asyncIO_A_r IS
    RECORD
        req		: std_logic;
        data	: ocp_io_m;
    END RECORD;

    TYPE asyncIO_B_r IS 
    RECORD
        ack		: std_logic;
        data	: ocp_io_s;
    END RECORD;


END OCPIOCCI_types;


--PACKAGE BODY PACKAGE_NAME IS
     -- DEFINITION OF PREVIOUSLY DECLARED
        -- CONSTANTS
        -- SUBPROGRAMS
     -- DECLARATION/DEFINITION OF ADDITIONAL
        -- TYPES AND SUBTYPES
        -- SUBPROGRAMS
        -- CONSTANTS, SIGNALS AND SHARED VARIABLES
--END PACKAGE_NAME;
