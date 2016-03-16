--------------------------------------------------------------------------------
-- License: MIT License - Copyright (c) 2016 Mathias Herlev
--------------------------------------------------------------------------------
-- Title   	: OCPIO Clock Crossing Interface
-- Type		: Entity
-- Developers  : Mathias Herlev (Creator Lead)
-- Description :
-- TODO	:
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;
USE work.OCPInterface.all;
USE work.OCPIOCCI_types.all;
USE work.ocp.all;
ENTITY OCPIOCCI IS
	PORT(   input   : IN	OCPIOCCIIn_r;
		output  : OUT   OCPIOCCIOut_r
	);

END ENTITY OCPIOCCI;

ARCHITECTURE rtl OF OCPIOCCI IS

	COMPONENT OCPIOCCI_A IS
	    PORT(   clk         : IN    std_logic;
	            rst         : IN    std_logic;
	            syncIn      : IN    ocp_io_m;
	            syncOut     : OUT   ocp_io_s;
	            asyncOut    : OUT   asyncIO_A_r;
	            asyncIn     : IN    asyncIO_B_r
	    );
	END COMPONENT OCPIOCCI_A;

	COMPONENT OCPIOCCI_B IS
	    PORT(   clk         : IN    std_logic;
	            rst         : IN    std_logic;
	            syncIn      : IN    ocp_io_s;
	            syncOut     : OUT   ocp_io_m;
	            asyncOut    : OUT   asyncIO_B_r;
	            asyncIn     : IN    asyncIO_A_r
	    );
	END COMPONENT OCPIOCCI_B;

	SIGNAL async_A  : asyncIO_A_r;
	SIGNAL asyncSlave   : asyncIO_B_r;

BEGIN


	CCI_A  : entity work.OCPIOCCI_A(Buffered)
	PORT MAP(input.clk_A,
	input.rst_A,
	input.ocpio_A,
	output.ocpio_A,
	async_A,
	asyncSlave);

	CCI_B   : entity work.OCPIOCCI_B(Buffered)
	PORT MAP(input.clk_B,
	input.rst_B,
	input.ocpio_B,
	output.OCPIO_B,
	asyncSlave,
	async_A);

END ARCHITECTURE rtl;
