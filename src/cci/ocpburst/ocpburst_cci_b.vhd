--------------------------------------------------------------------------------
-- License: MIT License - Copyright (c) 2016 Mathias Herlev
--------------------------------------------------------------------------------
-- Title		: OCPBurst Clock Crossing Interface Slave
-- Type			: Entity
-- Developers	: Mathias Herlev (Creator)(Lead)
--				: Christian Poulsen
-- Description	: Master Interface for the OCP clock crossing. Connects to a
--				: Slave
-- TODO			:
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
LIBRARY work;
USE work.ocp.all;
USE work.OCPInterface.all;
USE work.OCPBurstCCI_types.all;

ENTITY OCPBurstCCI_B IS
	GENERIC(burstSize : INTEGER := 4);
	PORT(	clk			: IN	std_logic;
			rst			: IN	std_logic;
			syncIn		: IN	ocp_burst_s;
			syncOut		: OUT	ocp_burst_m;
			asyncOut	: OUT	AsyncBurst_B_r;
			asyncIn		: IN	AsyncBurst_A_r
	);
END ENTITY OCPBurstCCI_B;

ARCHITECTURE behaviour OF OCPBurstCCI_B IS
	----------------------------------------------------------------------------
	-- FSM signals
	----------------------------------------------------------------------------
	TYPE fsm_states_t IS (	IDLE_state, ReadBlock, ReadBlockWait,
							WriteBlock, WriteBlockWait,WriteBlockFinal);
	SIGNAL state, state_next	:	 fsm_states_t;
	----------------------------------------------------------------------------
	-- Register signals
	----------------------------------------------------------------------------
	SIGNAL wordCnt, wordCnt_next	: unsigned(1 downto 0) := (others => '0');

	TYPE DataArray_t IS
		ARRAY (burstSize-1 downto 0) OF
		std_logic_vector(OCP_DATA_WIDTH-1 downto 0);
	TYPE RespArray_t IS 
		ARRAY (burstSize-1 downto 0) OF
		std_logic_vector(OCP_RESP_WIDTH-1 downto 0);

	SIGNAL data_arr : DataArray_t;
	SIGNAL resp_arr	: RespArray_t;

	SIGNAL loadEnable	: std_logic;
	----------------------------------------------------------------------------
	-- Async signals
	----------------------------------------------------------------------------

	SIGNAL req_prev, req, req_next	: std_logic := '0';
	SIGNAL ack, ack_next			: std_logic := '0';

BEGIN
	asyncOut.ack	<= ack;
	asyncOut.data.SResp <= resp_arr(to_integer(unsigned(asyncIn.DataInSel)));
	asyncOut.data.SData <= data_arr(to_integer(unsigned(asyncIn.DataInSel)));

	----------------------------------------------------------------------------
	-- FSM
	----------------------------------------------------------------------------
	FSM : PROCESS(state, syncIn, asyncIn, req, req_prev,wordCnt, ack)
	BEGIN
		state_next	<= state;
		loadEnable	<= '0';
		wordCnt_next <= wordCnt;
		syncOut.MCmd <= OCP_CMD_IDLE;
		syncOut.MAddr <= (others => '0');
		syncOut.MData <= (others => '0');
		syncOut.MDataByteEn <= (others => '0');
		asyncOut.DataInSel	<= (others => '0');
		syncOut.MDataValid <= '0';
		ack_next <= ack;
		CASE state IS
			WHEN IDLE_state =>
				--Wait for request
				IF req = NOT(req_prev) THEN
					--If read command
					IF asyncIn.data.MCmd = OCP_CMD_RD THEN
						--Relay command to OCP slave and either go to wait state
						--or commence buffering read data
						state_next		<= ReadBlockWait;
						syncOut.MCmd	<= OCP_CMD_RD;
						IF syncIn.SCmdAccept = '1' THEN
							state_next	<= ReadBlock;
						END IF;
					--If write command
					ElSIF asyncIn.data.MCmd = OCP_CMD_WR THEN
						state_next			<= WriteBlockWait;
						syncOut.MCmd		 <= OCP_CMD_WR;
						syncOut.MDataValid	 <= '1';
						syncOut.MDataByteEn	<= asyncIn.data.MDataByteEn;
						syncOut.MAddr		<= asyncIn.data.MAddr;
						syncOut.MData		<= asyncIn.data.MData;
						IF syncIn.SCmdAccept = '1' AND syncIn.SDataAccept = '1' 
						THEN
							wordCnt_next <= wordCnt + 
											to_unsigned(1,wordCnt'LENGTH);
							state_next	<= WriteBlock;
						END IF; 
					END IF;
				END IF;
			--------------------------------------------------------------------
			-- READ BLOCK
			--------------------------------------------------------------------
			WHEN ReadBlockWait =>
				syncOut.MCmd <= OCP_CMD_RD;
				IF syncIn.SCmdAccept = '1' THEN
					state_next <= ReadBlock;
				END IF;
			WHEN ReadBlock =>
				IF syncIn.SResp /= OCP_RESP_NULL THEN
					loadEnable <= '1';
					wordCnt_next <= wordCnt + to_unsigned(1, wordCnt'LENGTH);
					IF wordCnt = to_unsigned(burstSize-1,wordCnt'LENGTH) THEN
						state_next <= IDLE_state;
						ack_next <= NOT (ack);
					END IF;
				END IF;
			-- WRITE BLOCK
			WHEN WriteBlockWait => 
				syncOut.MCmd	   <= OCP_CMD_WR;
				syncOut.MDataValid <= '1';
				syncOut.MAddr		<= asyncIn.data.MAddr;
				syncOut.MDataByteEn	<= asyncIn.data.MDataByteEn;
				syncOut.MData		<= asyncIn.data.MData;
				asyncOut.DataInSel	<= std_logic_vector(wordCnt);
			
				IF syncIn.SCmdAccept = '1' AND syncIn.SDataAccept = '1' THEN
					wordCnt_next <= wordCnt + to_unsigned(1,wordCnt'LENGTH);
					state_next	 <= WriteBlock;
				END IF; 
			WHEN WriteBlock =>
				-- Sync Data Signals
				syncOut.MDataValid	<= '1';
				syncOut.MDataByteEn	<= asyncIn.data.MDataByteEn;
				syncOut.MAddr		<= asyncIn.data.MAddr;
				syncOut.MData		<= asyncIn.data.MData;
				wordCnt_next		<= wordCnt + to_unsigned(1,wordCnt'LENGTH);
				asyncOut.DataInSel	<= std_logic_vector(wordCnt);
				IF wordCnt = to_unsigned(burstSize-1, wordCnt'LENGTH) THEN
					state_next <= WriteBlockFinal;
					--ack_next <= NOT (ack);
				END IF;
			WHEN WriteBlockFinal =>
				IF syncIn.SResp /= OCP_RESP_NULL THEN
					ack_next <= NOT(ack);
					loadEnable <= '1';
					state_next <= IDLE_state;
				END IF;
			WHEN OTHERS =>
				state_next <= IDLE_state;
			END CASE;
	END PROCESS FSM;
	
	----------------------------------------------------------------------------
	-- Registers
	----------------------------------------------------------------------------
	Registers	 : PROCESS(clk,rst)
	BEGIN
		IF rst = '1' THEN
			state <= IDLE_state;
			req_prev	<= '0';
			req			<= '0';
			req_next	<= '0';
			ack			<= '0';
			wordCnt		<= (others=>'0');
		ELSIF rising_edge(clk) THEN
			state		<= state_next;
			req_prev	<= req;
			req			<= req_next;
			req_next	<= asyncIn.req;
			ack			<= ack_next;
			wordCnt		<= wordCnt_next;
		END IF;
	END PROCESS Registers;

	DataRam : PROCESS(clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF loadEnable = '1' THEN
				data_arr(to_integer(wordCnt)) <= syncIn.SData;
			END IF;
		END IF;
	END PROCESS DataRam;

	RespRam : PROCESS(clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF loadEnable = '1' THEN
				resp_arr(to_integer(wordCnt)) <= syncIn.SResp;
			END IF;
		END IF;
	END PROCESS RespRam;

END ARCHITECTURE behaviour;
