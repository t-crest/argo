--------------------------------------------------------------------------------
-- Title		: OCPBurst Clock Crossing Interface Slave
-- Type			: Entity
-- Created		: 2014/05/26 14:30 UTC+2
-- Edited		: 2014/06/02 23:00 UTC+2 (Christian Poulsen)
-- Developers	: Mathias Herlev (Creator)(Lead)
--				: Christian Poulsen
--
-- Description	: Slave Interface for the OCP clock crossing. Connects to a
--				: master
--
-- TODO			:
--
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
    TYPE fsm_states_t IS (	IDLE_state, ReadBlock, ReadBlockWait,
							--WriteBlockLoadFirstWord, 
							WriteBlockLoad, WriteBlockWait);
    SIGNAL state, state_next    :    fsm_states_t;

    SIGNAL ack_prev, ack, ack_next	: std_logic := '0';
    SIGNAL req, req_next			: std_logic := '0';
    SIGNAL wordCnt, wordCnt_next	: unsigned(1 downto 0) := (others => '0');

--    TYPE MasterDataArray IS ARRAY (burstSize-1 downto 0) OF ocp_burst_m;
	TYPE DataArray_t	IS 
		ARRAY (burstSize-1 downto 0) OF
		std_logic_vector(OCP_DATA_WIDTH-1 downto 0);
	TYPE ByteEn_Array_t IS
		ARRAY (burstSize downto 0) OF
		std_logic_vector(OCP_BYTE_WIDTH-1 downto 0);


	SIGNAL cmd, cmd_next		: std_logic_vector(OCP_CMD_WIDTH-1 downto 0) := OCP_CMD_IDLE;
	SIGNAL addr, addr_next		: std_logic_vector(OCP_BURST_ADDR_WIDTH-1 downto 0) := (others => '0');
	SIGNAL data_arr	: DataArray_t;
    SIGNAL byteEn_arr	: ByteEn_Array_t;

--	SIGNAL masterData, masterData_next  : MasterDataArray;
    SIGNAL writeEnable					: std_logic := '0';
	
	ALIAS o_async IS asyncOut;
	ALIAS i_async IS asyncIn;
BEGIN

    asyncOut.req		<= req;
--    asyncOut.DataInSel	<= std_logic_vector(wordCnt);

    FSM : PROCESS(state,syncIn,asyncIn,ack,ack_prev,wordCnt, req, cmd, addr)
    BEGIN
        state_next		<= state;
        syncOut			<= OCPBurstSlaveIdle_c;
		writeEnable     <= '0';
		req_next <= req;
		cmd_next <= cmd;
		addr_next <= addr;
		wordCnt_next <= wordCnt;
		asyncOut.DataInSel	<= (others => '0');--std_logic_vector(wordCnt);
		asyncOut.data.MDataValid <= '0';
		syncOut.SCmdAccept <= '0';
		syncOut.SDataAccept <= '0';
		CASE state IS
            WHEN IDLE_state =>
				IF syncIn.Mcmd = OCP_CMD_RD THEN
                    cmd_next <= syncIn.MCmd;
					addr_next <= syncIn.MAddr;
--					asyncOut.data	<= syncIn;
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
	asyncOut.data.MCmd			<= cmd;	
	asyncOut.data.MData			<= 
--		masterData(to_integer(unsigned(i_async.DataInSel))).MData;
		data_arr(to_integer(unsigned(i_async.DataInSel)));
	asyncOut.data.MAddr			<=
--		masterData(to_integer(unsigned(i_async.DataInSel))).MAddr;
		addr;
	asyncOut.data.MDataByteEn	<= 
--		masterData(to_integer(unsigned(i_async.DataInSel))).MDataByteEn;
		byteEn_arr(to_integer(unsigned(i_async.DataInSel)));
	
--    DataRegMux : PROCESS(writeEnable,syncIn)
--      BEGIN
--          masterData_next <= masterData;
--          IF writeEnable = '1' THEN
--              masterData_next(to_integer(wordCnt)) <= syncIn;
--          END IF;
--      END PROCESS DataRegMux;
    
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
--            masterData  <= masterData_next;
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
