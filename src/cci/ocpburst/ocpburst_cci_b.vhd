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
USE work.OCPInterface.all;
USE work.OCPBurstCCI_types.all;

ENTITY OCPBurstCCISlave IS
    GENERIC(burstSize : INTEGER := 4);
    PORT(   clk         : IN    std_logic;
            rst         : IN    std_logic;
            syncIn      : IN    OCPBurstSlave_r;
            syncOut     : OUT   OCPBurstMaster_r;
            asyncOut    : OUT   AsyncBurstSlave_r;
            asyncIn     : IN    AsyncBurstMaster_r
    );
END ENTITY OCPBurstCCISlave;

ARCHITECTURE behaviour OF OCPBurstCCISlave IS
    TYPE fsm_states_t IS (	IDLE_state, ReadBlock, ReadBlockWait,
							WriteBlock, WriteBlockWaiti,WriteBlockFinal);
    SIGNAL state, state_next    :    fsm_states_t;

    SIGNAL req_prev, req, req_next  : std_logic := '0';
    SIGNAL ack, ack_next            : std_logic := '0';
    SIGNAL wordCnt, wordCnt_next    : unsigned(1 downto 0) := (others => '0');

    TYPE SlaveDataArray IS ARRAY (burstSize-1 downto 0) OF OCPBurstSlave_r;

    SIGNAL slaveData, slaveData_next  : SlaveDataArray;
    SIGNAL loadEnable   : std_logic;

BEGIN
	-- Async Data Signals
	asyncOut.DataInSel	<= std_logic_vector(wordCnt);
    asyncOut.data	<= slaveData(to_integer(unsigned(asyncIn.DataInSel)));
    asyncOut.ack	<= ack;

    FSM : PROCESS(state, syncIn, asyncIn, req, req_prev)
    BEGIN
        state_next 	<= state;
        loadEnable 	<= '0';
		syncOut     <= OCPBurstMasterIdle_c;

        CASE state IS
            WHEN IDLE_state =>
                IF req = NOT(req_prev) THEN
                    IF asyncIn.data.cmd = ReadBlock THEN
                        state_next		<= ReadBlockWait;
                        syncOut.cmd		<= ReadBlock;
                        IF syncIn.cmdAccept = '1' THEN
                            state_next	<= ReadBlock;
                        END IF;
                    ElSIF asyncIn.data.cmd = WriteBlock AND asyncIn.data.dataValid = '1' THEN
                        state_next			<= WriteBlockWait;
						syncOut.cmd         <= WriteBlock;
						syncOut.dataValid   <= '1';
						IF syncIn.cmdAccept = '1' AND syncIn.dataAccept = '1' THEN
							syncOut.dataByteEn	<= asyncIn.data.dataByteEn;
							syncOut.addr 		<= asyncIn.data.addr;
							syncOut.data 		<= asyncIn.data.data;
							wordCnt_next		<= wordCnt + to_unsigned(1,wordCnt'LENGTH);
							state_next 			<= WriteBlock;
						END IF; 
                    END IF;
                END IF;
			-- READ BLOCK
            WHEN ReadBlockWait =>
                syncOut.cmd <= ReadBlock;
                IF syncIn.cmdAccept = '1' THEN
                    state_next <= ReadBlock;
                END IF;
            WHEN ReadBlock =>
				IF syncIn.resp /= Idle THEN
					loadEnable <= '1';
					wordCnt_next <= wordCnt + to_unsigned(1, wordCnt'LENGTH);
					IF wordCnt = to_unsigned(burstSize-1,wordCnt'LENGTH) THEN
						state_next <= IDLE_state;
						ack_next <= NOT (ack);
					END IF;
				END IF;
            -- WRITE BLOCK
            WHEN WriteBlockWait => 
                syncOut.cmd         	<= WriteBlock;
                syncOut.dataValid   	<= '1';
                IF syncIn.cmdAccept = '1' AND syncIn.dataAccept = '1' THEN
					syncOut.dataByteEn	<= asyncIn.data.dataByteEn;
					syncOut.addr 		<= asyncIn.data.addr;
					syncOut.data 		<= asyncIn.data.data;
					wordCnt_next		<= wordCnt + to_unsigned(1,wordCnt'LENGTH);
					state_next 			<= WriteBlock;
                END IF; 
            WHEN WriteBlock =>
                -- Sync Data Signals
				syncOut.dataValid	<= '1';
				syncOut.dataByteEn	<= asyncIn.data.dataByteEn;
				syncOut.addr		<= asyncIn.data.addr;
				syncOut.data		<= asyncIn.data.data;
                wordCnt_next		<= wordCnt + to_unsigned(1,wordCnt'LENGTH);
                IF wordCnt = to_unsigned(burstSize-1, wordCnt'LENGTH) THEN
					state_next <= WriteBlockFinal;
					--ack_next <= NOT (ack);
                END IF;
			WHEN WriteBlockFinal =>
				ack_next <= NOT(ack);
				loadEnable <= '1';
				state_next <= IDLE_state;
            WHEN OTHERS =>
				state_next <= IDLE_state;
            END CASE;
    END PROCESS FSM;


    DataRegMux    : PROCESS(loadEnable, syncIn)
    BEGIN
        slaveData_next <= slaveData;
        IF loadEnable = '1' THEN
            slaveData_next(to_integer(wordCnt)) <= syncIn;
        END IF;
    END PROCESS DataRegMux;


    Registers    : PROCESS(clk,rst)
    BEGIN
        IF rst = '1' THEN
            state <= IDLE_state;
			req_prev    <= '0';
            req         <= '0';
            req_next    <= '0';
            ack         <= '0';
            wordCnt     <= (others=>'0');
        ELSIF rising_edge(clk) THEN
            state       <= state_next;
            req_prev    <= req;
            req         <= req_next;
            req_next    <= asyncIn.req;
            ack         <= ack_next;
            wordCnt     <= wordCnt_next;
            slaveData   <= slaveData_next;
        END IF;
    END PROCESS Registers;

END ARCHITECTURE behaviour;
