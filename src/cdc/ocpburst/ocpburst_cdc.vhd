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
-- Title   	: OCPBurst Clock Crossing Interface
-- Type		: Entity
-- Description : OCPburst CDC wrapper
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;
USE work.OCPBurstCDC_types.all;
USE work.ocp.all;
ENTITY OCPBurstCDC IS
	PORT(   input   : IN	OCPBurstCDCIn_r;
			output  : OUT   OCPBurstCDCOut_r
	);
END ENTITY OCPBurstCDC;

ARCHITECTURE rtl OF OCPBurstCDC IS

	COMPONENT OCPBurstCDC_A IS
	    PORT(   clk         : IN    std_logic;
	            rst         : IN    std_logic;
	            syncIn      : IN    ocp_burst_m;
	            syncOut     : OUT   ocp_burst_s;
	            asyncOut    : OUT   AsyncBurst_A_r;
	            asyncIn     : IN    AsyncBurst_B_r
	    );
	END COMPONENT OCPBurstCDC_A;

	COMPONENT OCPBurstCDC_B IS
	    PORT(   clk         : IN    std_logic;
	            rst         : IN    std_logic;
	   		 	syncIn      : IN    ocp_burst_s;
	            syncOut     : OUT   ocp_burst_m;
	            asyncOut    : OUT   AsyncBurst_B_r;
	            asyncIn     : IN    AsyncBurst_A_r
	     );
	END COMPONENT OCPBurstCDC_B;

	SIGNAL async_A : AsyncBurst_A_r;
	SIGNAL async_B : AsyncBurst_B_r;

BEGIN

	CDC_A  : OCPBurstCDC_A
	PORT MAP(input.clk_A,
	input.rst_A,
	input.OCPB_master,
	output.OCPB_A,
	async_A,
	async_B);

	CDC_B   : OCPBurstCDC_B
	PORT MAP(input.clk_B,
	input.rst_B,
	input.OCPB_slave,
	output.OCPB_B,
	async_B,
	async_A);

END ARCHITECTURE rtl;
