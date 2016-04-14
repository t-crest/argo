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
-- Title   	: OCPIO Clock Crossing Interface
-- Type		: Entity
-- Description : OCPio CDC wrapper
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;
USE work.OCPIOCDC_types.all;
USE work.ocp.all;
ENTITY OCPIOCDC IS
	PORT(   input   : IN	OCPIOCDCIn_r;
		output  : OUT   OCPIOCDCOut_r
	);

END ENTITY OCPIOCDC;

ARCHITECTURE rtl OF OCPIOCDC IS

	COMPONENT OCPIOCDC_A IS
	    PORT(   clk         : IN    std_logic;
	            rst         : IN    std_logic;
	            syncIn      : IN    ocp_io_m;
	            syncOut     : OUT   ocp_io_s;
	            asyncOut    : OUT   asyncIO_A_r;
	            asyncIn     : IN    asyncIO_B_r
	    );
	END COMPONENT OCPIOCDC_A;

	COMPONENT OCPIOCDC_B IS
	    PORT(   clk         : IN    std_logic;
	            rst         : IN    std_logic;
	            syncIn      : IN    ocp_io_s;
	            syncOut     : OUT   ocp_io_m;
	            asyncOut    : OUT   asyncIO_B_r;
	            asyncIn     : IN    asyncIO_A_r
	    );
	END COMPONENT OCPIOCDC_B;

	SIGNAL async_A  : asyncIO_A_r;
	SIGNAL asyncSlave   : asyncIO_B_r;

BEGIN


	CDC_A  : entity work.OCPIOCDC_A(Buffered)
	PORT MAP(input.clk_A,
	input.rst_A,
	input.ocpio_A,
	output.ocpio_A,
	async_A,
	asyncSlave);

	CDC_B   : entity work.OCPIOCDC_B(Buffered)
	PORT MAP(input.clk_B,
	input.rst_B,
	input.ocpio_B,
	output.OCPIO_B,
	asyncSlave,
	async_A);

END ARCHITECTURE rtl;
