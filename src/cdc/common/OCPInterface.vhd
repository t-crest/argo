--------------------------------------------------------------------------------
-- Copyright (c) 2016, Mathias Herlev
-- All rights reserved.
-- 
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
-- 
-- 1. Redistributions of source code must retain the above copyright notice, 
-- this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above copyright notice,
-- this list of conditions and the following disclaimer in the documentation
-- and/or other materials provided with the distribution.
-- 
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-- IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
-- ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
-- POSSIBILITY OF SUCH DAMAGE.
--------------------------------------------------------------------------------
-- Title		: OCPBurst Interface Types
-- Type		 	: Type Package
-- Description  : Idle constants
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
