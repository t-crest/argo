--------------------------------------------------------------------------------
-- License: MIT License - Copyright (c) 2016 Mathias Herlev
--------------------------------------------------------------------------------
-- Title		: OCPburst Clock Crossing Interface Slave
-- Type			: Entity
-- Developer(s)	: Mathias Herlev (Lead) - s103060@student.dtu.dk
--				: Christian Poulsen     - s103050@student.dtu.dk
-- Description	: Slave Interface for the OCPburst clock crossing. Connects to a
--				: master
-- TODO			:
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
LIBRARY work;
USe work.ocp_config.all;
USE work.ocp.all;
USE work.OCPInterface.all;
USE work.OCPBurstCCI_types.all;

ENTITY OCPBurstCCI_A IS
    GENERIC(burstSize : INTEGER := 4);
    PORT(   clk         : IN    std_logic;
            rst         : IN    std_logic;
            syncIn      : IN    ocp_burst_m;
            syncOut     : OUT   ocp_burst_s;
            asyncOut    : OUT   AsyncBurst_A_r;
            asyncIn     : IN    AsyncBurst_B_r
    );
END ENTITY OCPBurstCCI_A;

ARCHITECTURE behaviour OF OCPBurstCCI_A IS
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
	
    SIGNAL wordCnt, wordCnt_next	: unsigned(1 downto 0) := (others => '0');
	----------------------------------------------------------------------------
	-- Asynchronous signals
	----------------------------------------------------------------------------
	ALIAS o_async IS asyncOut;
	ALIAS i_async IS asyncIn;

    SIGNAL ack_prev, ack, ack_next	: std_logic := '0';
    SIGNAL req, req_next			: std_logic := '0';

BEGIN


    FSM : PROCESS(state,syncIn,asyncIn,ack,ack_prev,wordCnt, req, cmd, addr)
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
		wordCnt_next <= wordCnt;
		asyncOut.DataInSel	<= (others => '0');
		asyncOut.data.MDataValid <= '0';
		syncOut.SCmdAccept <= '0';
		syncOut.SDataAccept <= '0';

		CASE state IS
            WHEN IDLE_state =>
				IF syncIn.Mcmd = OCP_CMD_RD THEN
					cmd_next <= syncIn.MCmd;                                  
					addr_next <= syncIn.MAddr;
                    req_next		<= NOT (req);
                    state_next      <= ReadBlockWait;
                ELSIF syncIn.Mcmd = OCP_CMD_WR AND syncIn.MDataValid = '1' THEN
					cmd_next <= syncIn.MCmd;
					addr_next <= syncIn.MAddr;
					syncOut.SCmdAccept	<= '1';
					syncOut.SDataAccept	<= '1';
					writeEnable		<= '1';
					wordCnt_next	<= wordCnt + to_unsigned(1,wordCnt'LENGTH);
					state_next      <= WriteBlockLoad;
                END IF;
			-- READ BLOCK
            WHEN ReadBlockWait =>
                IF ack = NOT(ack_prev) THEN
                    state_next			<= ReadBlock;
                    syncOut.SCmdAccept	<= '1';
                END IF; 
            WHEN ReadBlock =>
				asyncOut.DataInSel	<= std_logic_vector(wordCnt);
                syncOut			<= asyncIn.data;
                wordCnt_next	<= wordCnt + to_unsigned(1,wordCnt'LENGTH);
                IF wordCnt = to_unsigned(burstSize-1, wordCnt'LENGTH) THEN
					state_next		<= IDLE_state;
                END IF;
			-- WRITE BLOCK
            WHEN WriteBlockLoad => 
                syncOut.SDataAccept  <= '1';
                writeEnable         <= '1';
                wordCnt_next		<= wordCnt + to_unsigned(1,wordCnt'LENGTH);
                IF wordCnt = to_unsigned(burstSize-1, wordCnt'LENGTH) THEN
                    req_next					<= NOT (req);
                    asyncOut.data.MDataValid	<= '1';
                    state_next					<= WriteBlockWait;
                END IF;
            WHEN WriteBlockWait =>
               IF ack = NOT(ack_prev) THEN
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
	asyncOut.data.MData	<= data_arr(to_integer(unsigned(i_async.DataInSel)));
	asyncOut.data.MAddr	<= addr;
	asyncOut.data.MDataByteEn <= 
						byteEn_arr(to_integer(unsigned(i_async.DataInSel)));
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
            wordCnt		<= (others=>'0');
			cmd			<= OCP_CMD_IDLE;
			addr		<= (others => '0');
	ELSIF rising_edge(clk) THEN
			state       <= state_next;
            req         <= req_next;
            ack_prev    <= ack;
            ack         <= ack_next;
            ack_next    <= asyncIn.ack;
            wordCnt     <= wordCnt_next;
			cmd			<= cmd_next;
			addr		<= addr_next;
        END IF;
    END PROCESS Registers;
    
	DataRam	: PROCESS(clk)
	BEGIN 
		IF rising_edge(clk) THEN
			IF writeEnable = '1' THEN
				data_arr(to_integer(wordCnt)) <= syncIn.MData;
			END IF;
		END IF;
	END PROCESS DataRam;

	ByteEnRam :	PROCESS(clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF writeEnable = '1' THEN
				byteEn_arr(to_integer(wordCnt)) <= syncIn.MDataByteEn;
			END IF;
		END IF;
	END PROCESS ByteEnRam;

END ARCHITECTURE behaviour;
