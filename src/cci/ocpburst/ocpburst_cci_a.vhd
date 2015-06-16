--------------------------------------------------------------------------------
-- Title		: OCPBurst Clock Crossing Interface Slave
-- Type			: Entity
-- Created		: 2014/05/26 14:30 UTC+2
-- Edited		: 2014/06/02 23:00 UTC+2 (Christian Poulsen)
-- Developers	: Mathias Herlev (Creator)(Lead)
--				: Christian Poulsen
--
-- Description	: Slave Interface for the OCP clock crossing. Connects to a
-- 				: master
--
-- TODO			:
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
LIBRARY work;
USE work.ocp.all;
USE work.OCPInterface.all;
USE work.OCPBurstCCI_types.all;

ENTITY OCPBurstCCIMaster IS
    GENERIC(burstSize : INTEGER := 4);
    PORT(   clk         : IN    std_logic;
            rst         : IN    std_logic;
            syncIn      : IN    OCPBurstMaster_r;
            syncOut     : OUT   OCPBurstSlave_r;
            asyncOut    : OUT   AsyncBurstMaster_r;
            asyncIn     : IN    AsyncBurstSlave_r
    );
END ENTITY OCPBurstCCIMaster;

ARCHITECTURE behaviour OF OCPBurstCCIMaster IS
    TYPE fsm_states_t IS (	IDLE_state, ReadBlock, ReadBlockWait,
   							WriteBlockLoadFirstWord, WriteBlockLoad, WriteBlockWait);
    SIGNAL state, state_next    :    fsm_states_t;

    SIGNAL ack_prev, ack, ack_next	: std_logic := '0';
    SIGNAL req, req_next			: std_logic := '0';
    SIGNAL wordCnt, wordCnt_next	: unsigned(1 downto 0) := (others => '0');

    TYPE MasterDataArray IS ARRAY (burstSize-1 downto 0) OF OCPBurstMaster_r;
    
    SIGNAL masterData, masterData_next  : MasterDataArray;
    SIGNAL writeEnable              	: std_logic := '0';
BEGIN

    asyncOut.req		<= req;
    asyncOut.DataInSel	<= std_logic_vector(wordCnt);

    FSM : PROCESS(state,syncIn,asyncIn,ack,ack_prev,wordCnt)
    BEGIN
        state_next  					<= state;
        syncOut     					<= OCPBurstSlaveIdle_c;
		writeEnable         			<= '0';
        CASE state IS
            WHEN IDLE_state =>
				IF syncIn.cmd = ReadBlock THEN
                    asyncOut.data  <= syncIn;
                    req_next          <= NOT (req);
                    state_next        <= ReadBlockWait;
                ELSIF syncIn.cmd = WriteBlock AND syncIn.dataValid = '1' THEN
					syncOut.cmdAccept   <= '1';
					syncOut.dataAccept  <= '1';
					writeEnable         <= '1';
					wordCnt_next        <= wordCnt + to_unsigned(1,wordCnt'LENGTH);
					state_next          <= WriteBlockLoad;
                END IF;
			-- READ BLOCK
            WHEN ReadBlockWait =>
                asyncOut.data      <= syncIn;
                IF ack = NOT(ack_prev) THEN
                    state_next        <= ReadBlock;
                    syncOut.cmdAccept <= '1';
                END IF; 
            WHEN ReadBlock =>
                asyncOut.data	<= syncIn;
                syncOut			<= asyncIn.data;
                wordCnt_next	<= wordCnt + to_unsigned(1,wordCnt'LENGTH);
                IF wordCnt = to_unsigned(burstSize-1, wordCnt'LENGTH) THEN
					state_next 		<= IDLE_state;
                END IF;
			-- WRITE BLOCK
            WHEN WriteBlockLoad => 
                syncOut.dataAccept  <= '1';
                writeEnable         <= '1';
                wordCnt_next		<= wordCnt + to_unsigned(1,wordCnt'LENGTH);
                IF wordCnt = to_unsigned(burstSize-1, wordCnt'LENGTH) THEN
                    req_next				<= NOT (req);
                    asyncOut.data.cmd		<= WriteBlock;
                    asyncOut.data.dataValid	<= '1';
                    state_next				<= WriteBlockWait;
                END IF;
            WHEN WriteBlockWait =>
                asyncOut.data.data			<= masterData(to_integer(unsigned(asyncIn.DataInSel))).data;
				asyncOut.data.addr			<= masterData(to_integer(unsigned(asyncIn.DataInSel))).addr;
				asyncOut.data.dataByteEn	<= masterData(to_integer(unsigned(asyncIn.DataInSel))).dataByteEn;
                IF ack = NOT(ack_prev) THEN
                    syncOut.resp	<= asyncIn.data.resp;
                    state_next		<= IDLE_state;
                END IF;
            WHEN OTHERS =>
				state_next	<= IDLE_state;
        END CASE;
    END PROCESS FSM;

    DataRegMux : PROCESS(writeEnable,syncIn)
    BEGIN
        masterData_next <= masterData;
        IF writeEnable = '1' THEN
            masterData_next(to_integer(wordCnt)) <= syncIn;
        END IF;
    END PROCESS DataRegMux;
    
    Registers : PROCESS(clk,rst)
    BEGIN
        IF rst = '1' THEN
            state 		<= IDLE_state;
            req         <= '0';
            ack_prev    <= '0';
            ack			<= '0';
            ack_next	<= '0';
            wordCnt		<= (others=>'0');
	ELSIF rising_edge(clk) THEN
            state       <= state_next;
            req         <= req_next;
            ack_prev    <= ack;
            ack         <= ack_next;
            ack_next    <= asyncIn.ack;
            wordCnt      <= wordCnt_next;
            masterData  <= masterData_next;
        END IF;
    END PROCESS Registers;
    
END ARCHITECTURE behaviour;
