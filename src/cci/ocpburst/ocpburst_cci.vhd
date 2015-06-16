--------------------------------------------------------------------------------
-- Title   	: OCPBurst Clock Crossing Interface
-- Type		: Entity
-- Created 	: 2014/05/25 (20:00 UTC+2)
-- Edited  	:
-- Developers  :
--
-- Description :
--
-- TODO	:
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;
USE work.OCPInterface.all;
USE work.OCPBurstCCI_types.all;

ENTITY OCPBurstCCI IS
	PORT(   input   : IN	OCPBurstCCIIn_r;
			output  : OUT   OCPBurstCCIOut_r
	);
END ENTITY OCPBurstCCI;

ARCHITECTURE rtl OF OCPBurstCCI IS

	COMPONENT OCPBurstCCIMaster IS
	    PORT(   clk         : IN    std_logic;
	            rst         : IN    std_logic;
	            syncIn      : IN    OCPBurstMaster_r;
	            syncOut     : OUT   OCPBurstSlave_r;
	            asyncOut    : OUT   AsyncBurstMaster_r;
	            asyncIn     : IN    AsyncBurstSlave_r
	    );
	END COMPONENT OCPBurstCCIMaster;

	COMPONENT OCPBurstCCISlave IS
	    PORT(   clk         : IN    std_logic;
	            rst         : IN    std_logic;
	            syncIn      : IN    OCPBurstSlave_r;
	            syncOut     : OUT   OCPBurstMaster_r;
	            asyncOut    : OUT   AsyncBurstSlave_r;
	            asyncIn     : IN    AsyncBurstMaster_r
	    );
	END COMPONENT OCPBurstCCISlave;

	SIGNAL asyncMaster  : AsyncBurstMaster_r;
	SIGNAL asyncSlave   : AsyncBurstSlave_r;

BEGIN

--	output.OCPBMaster   <= input.OCPBSlave;
--	output.OCPBSlave	<= input.OCPBMaster;


	Master  : OCPBurstCCIMaster
	PORT MAP(input.clkMaster,
	input.rstMaster,
	input.OCPBSlave,
	output.OCPBSlave,
	asyncMaster,
	asyncSlave);

	Slave   : OCPBurstCCISlave
	PORT MAP(input.clkSlave,
	input.rstSlave,
	input.OCPBMaster,
	output.OCPBMaster,
	asyncSlave,
	asyncMaster);

END ARCHITECTURE rtl;
