--------------------------------------------------------------------------------
-- License: MIT License - Copyright (c) 2016 Mathias Herlev
--------------------------------------------------------------------------------
-- Title		: OCPBurst Interface Types
-- Type		 	: Type Package
-- Developers	: Mathias Herlev (Creator)
-- Description  : Idle constants
-- TODO	:
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;
USE work.ocp.all;


PACKAGE OCPInterface IS

	CONSTANT OCPBurstMasterIdle_c : ocp_burst_m := (OCP_CMD_IDLE,
												   (OTHERS => '0'),
												   (OTHERS => '0'),
												   (OTHERS => '0'),

	CONSTANT OCPBurstSlaveIdle_c : ocp_burst_s := (OCP_RESP_NULL,
												  (OTHERS => '0'),
												  '0',
												  '0');
END OCPInterface;
