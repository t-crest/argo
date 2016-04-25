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
-- Title		: OCPburst Clock Crossing Interface A Side
-- Type			: Entity
-- Description	: Slave Interface for the OCPburst clock crossing. Connects to a
--				: master
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
LIBRARY work;
USe work.ocp_config.all;
USE work.ocp.all;
USE work.OCPBurstCDC_types.all;

ENTITY OCPBurstCDC_A IS
    GENERIC(burstSize : INTEGER := 4);
    PORT(   clk         : IN    std_logic;
            rst         : IN    std_logic;
            syncIn      : IN    ocp_burst_m;
            syncOut     : OUT   ocp_burst_s;
            asyncOut    : OUT   AsyncBurst_A_r;
            asyncIn     : IN    AsyncBurst_B_r
    );
END ENTITY OCPBurstCDC_A;

ARCHITECTURE behaviour OF OCPBurstCDC_A IS
	----------------------------------------------------------------------------
	-- Constants
	----------------------------------------------------------------------------
CONSTANT OCPBurstSlaveIdle_c : ocp_burst_s := (OCP_RESP_NULL,
												  (OTHERS => '0'),
												  '0',
												  '0');
	----------------------------------------------------------------------------
	-- FSM Signal Declarations
	----------------------------------------------------------------------------
    TYPE fsm_states_t IS (	IDLE_state, ReadBlock, ReadBlockWait,              
							WriteBlockLoad, WriteBlockWait);                     
    SIGNAL state, state_next    :    fsm_states_t;                             
	----------------------------------------------------------------------------
	-- Data Registers
	----------------------------------------------------------------------------
	SIGNAL cmd, cmd_next	: std_logic_vector(OCP_CMD_WIDTH-1 downto 0)
		   					:= OCP_CMD_IDLE;
	SIGNAL addr, addr_next	: std_logic_vector(OCP_BURST_ADDR_WIDTH-1 downto 0)
							:= (others => '0');

	TYPE DataArray_t	IS 
		ARRAY (burstSize-1 downto 0) OF
		std_logic_vector(OCP_DATA_WIDTH-1 downto 0);
	SIGNAL data_arr	: DataArray_t;

	TYPE ByteEn_Array_t IS
		ARRAY (burstSize downto 0) OF
		std_logic_vector(OCP_BYTE_WIDTH-1 downto 0);
    SIGNAL byteEn_arr	: ByteEn_Array_t;

    SIGNAL writeEnable					: std_logic := '0';
	
    SIGNAL RegAddr, RegAddr_next	: unsigned(1 downto 0) := (others => '0');
	----------------------------------------------------------------------------
	-- Asynchronous signals
	----------------------------------------------------------------------------
	ALIAS o_async IS asyncOut;
	ALIAS i_async IS asyncIn;

    SIGNAL ack_prev, ack, ack_next	: std_logic := '0';
    SIGNAL req, req_next			: std_logic := '0';

BEGIN


    FSM : PROCESS(state,syncIn,asyncIn,ack,ack_prev,RegAddr, req, cmd, addr)
    BEGIN
		------------------------------------------------------------------------
		-- Default Assignments
		------------------------------------------------------------------------
        state_next		<= state;
        syncOut			<= OCPBurstSlaveIdle_c;
		writeEnable     <= '0';
		req_next <= req;
		cmd_next <= cmd;
		addr_next <= addr;
		RegAddr_next <= RegAddr;
		asyncOut.RegAddr	<= (others => '0');
		asyncOut.data.MDataValid <= '0';
		syncOut.SCmdAccept <= '0';
		syncOut.SDataAccept <= '0';

		CASE state IS
            WHEN IDLE_state =>
				--If command is read
				IF syncIn.Mcmd = OCP_CMD_RD THEN
					-- Register Command and addres (MData not valid)
					cmd_next <= syncIn.MCmd;                                  
					addr_next <= syncIn.MAddr;
					-- Assert a request
                    req_next		<= NOT (req);
                    -- And go to ReadBlockWait, to await an acknowledge
					state_next      <= ReadBlockWait;
				--If command is write
                ELSIF syncIn.Mcmd = OCP_CMD_WR AND syncIn.MDataValid = '1' THEN
					--Start buffering MData + MCmd + MAddr
					cmd_next <= syncIn.MCmd;
					addr_next <= syncIn.MAddr;
					syncOut.SCmdAccept	<= '1';
					syncOut.SDataAccept	<= '1';
					writeEnable		<= '1';
					RegAddr_next	<= RegAddr + to_unsigned(1,RegAddr'LENGTH);
					state_next      <= WriteBlockLoad;
                END IF;
			--------------------------------------------------------------------
			-- READ BLOCK
			--------------------------------------------------------------------
            WHEN ReadBlockWait =>
				-- Wait until acknowledge
                IF ack = NOT(ack_prev) THEN
                    state_next			<= ReadBlock;
                    syncOut.SCmdAccept	<= '1';
                END IF; 
            WHEN ReadBlock =>
				-- Write each word in buffer back to OCP Master
				asyncOut.RegAddr	<= std_logic_vector(RegAddr);
                syncOut			<= asyncIn.data;
                RegAddr_next	<= RegAddr + to_unsigned(1,RegAddr'LENGTH);
                IF RegAddr = to_unsigned(burstSize-1, RegAddr'LENGTH) THEN
					state_next		<= IDLE_state;
                END IF;
			--------------------------------------------------------------------
			-- WRITE BLOCK
			--------------------------------------------------------------------
            WHEN WriteBlockLoad => 
				-- Continue buffering MData
                syncOut.SDataAccept  <= '1';
                writeEnable         <= '1';
                RegAddr_next		<= RegAddr + to_unsigned(1,RegAddr'LENGTH);
                IF RegAddr = to_unsigned(burstSize-1, RegAddr'LENGTH) THEN
					-- And assert request once all words are buffered
                    req_next					<= NOT (req);
                    asyncOut.data.MDataValid	<= '1';
                    state_next					<= WriteBlockWait;
                END IF;
            WHEN WriteBlockWait =>
				-- Wait until B side has acknowledged finishing transaction
                IF ack = NOT(ack_prev) THEN
					--And relay response to OCP Master
                    syncOut.Sresp	<= asyncIn.data.Sresp;
                    state_next		<= IDLE_state;
					cmd_next <= OCP_CMD_IDLE;
					addr_next <= (others => '0');
                END IF;
            WHEN OTHERS =>
				state_next	<= IDLE_state;
        END CASE;
    END PROCESS FSM;

	----------------------------------------------------------------------------
	-- Output Map
	----------------------------------------------------------------------------
	asyncOut.data.MCmd	<= cmd;	
	asyncOut.data.MData	<= data_arr(to_integer(unsigned(i_async.RegAddr)));
	asyncOut.data.MAddr	<= addr;
	asyncOut.data.MDataByteEn <= 
						byteEn_arr(to_integer(unsigned(i_async.RegAddr)));
    asyncOut.req		<= req;

	----------------------------------------------------------------------------
	-- Register Processes
	----------------------------------------------------------------------------
    Registers : PROCESS(clk,rst)
    BEGIN
        IF rst = '1' THEN
            state		<= IDLE_state;
            req         <= '0';
            ack_prev	<= '0';
            ack			<= '0';
            ack_next	<= '0';
            RegAddr		<= (others=>'0');
			cmd			<= OCP_CMD_IDLE;
			addr		<= (others => '0');
	ELSIF rising_edge(clk) THEN
			state       <= state_next;
            req         <= req_next;
            ack_prev    <= ack;
            ack         <= ack_next;
            ack_next    <= asyncIn.ack;
            RegAddr     <= RegAddr_next;
			cmd			<= cmd_next;
			addr		<= addr_next;
        END IF;
    END PROCESS Registers;
    
	DataRam	: PROCESS(clk)
	BEGIN 
		IF rising_edge(clk) THEN
			IF writeEnable = '1' THEN
				data_arr(to_integer(RegAddr)) <= syncIn.MData;
			END IF;
		END IF;
	END PROCESS DataRam;

	ByteEnRam :	PROCESS(clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF writeEnable = '1' THEN
				byteEn_arr(to_integer(RegAddr)) <= syncIn.MDataByteEn;
			END IF;
		END IF;
	END PROCESS ByteEnRam;

END ARCHITECTURE behaviour;
