--------------------------------------------------------------------------------
-- Title		: OCPIO Clock Crossing Interface Slave
-- Type			: Entity
-- Created		: 2014/05/26 14:30 UTC+2
-- Edited		: 2014/06/02 23:00 UTC+2 (Christian Poulsen)
-- Developers	: Mathias Herlev (Creator)(Lead)
--
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
USE work.OCPIOCCI_types.all;
USE work.ocp.all;

ENTITY OCPIOCCI_A IS
	GENERIC(IOSize : INTEGER := 1);
	PORT(   clk         : IN    std_logic;
			rst         : IN    std_logic;
			syncIn      : IN    ocp_io_m;
			syncOut     : OUT   ocp_io_s;
			asyncOut    : OUT   asyncIO_A_r;
			asyncIn     : IN    asyncIO_B_r
    );
END ENTITY OCPIOCCI_A;

ARCHITECTURE Buffered OF OCPIOCCI_A IS
    TYPE fsm_states_t IS	(IDLE_state, 
							ReadWord_state,
							WriteWord_state, WriteWordFinal_state);
    SIGNAL state, state_next    :    fsm_states_t;

    SIGNAL ack_prev, ack, ack_next	: std_logic := '0';
    SIGNAL req, req_next            : std_logic := '0';
    
    SIGNAL masterData, masterData_next  : ocp_io_m;
    SIGNAL writeEnable	: std_logic := '0';

BEGIN

	asyncOut.req <= req;
	asyncOut.data	<= masterData;
    FSM : PROCESS(state,syncIn,asyncIn,ack,ack_prev,req)
    BEGIN
        state_next		<= state;
        syncOut			<= OCPIOSlaveIdle_c;
		writeEnable		<= '0';
		req_next 		<= req;

		CASE state IS
            WHEN IDLE_state =>
				IF syncIn.MCmd /= OCP_CMD_IDLE THEN
					req_next <= NOT(req);
					state_next <= WriteWord_state;
					writeEnable <= '1';
				END IF;
			WHEN ReadWord_state =>
				IF ack = NOT (ack_prev) THEN
					syncOut <= asyncIn.data;
					syncOut.SCmdAccept <= '1';
					state_next <= IDLE_state;
				END IF;
			WHEN WriteWord_state =>
				IF ack = NOT (ack_prev) THEN
					state_next <= WriteWordFinal_state;
					syncOut <= asyncIn.data;
					syncOut.SCmdAccept <= '1';
					IF syncIn.MRespAccept = '1'THEN
						state_next <= IDLE_state;
					END IF;
				END IF;
			WHEN WriteWordFinal_state =>
				syncOut <= asyncIn.data;
				IF syncIn.MRespAccept = '1'THEN
					state_next <= IDLE_state;
				END IF;
			WHEN OTHERS =>
				state_next	<= IDLE_state;
      END CASE;
    END PROCESS FSM;

    DataRegMux : PROCESS(writeEnable,syncIn)
    BEGIN
        masterData_next <= masterData;
        IF writeEnable = '1' THEN
			masterData_next <= syncIn;
        END IF;
    END PROCESS DataRegMux;
    
    Registers : PROCESS(clk,rst)
    BEGIN
        IF rst = '1' THEN
            state 		<= IDLE_state;
			req         <= '0';
            ack_prev    <= '0';
            ack         <= '0';
            ack_next    <= '0';
            masterData  <= OCPIOmasteridle_c;

        ELSIF rising_edge(clk) THEN
            state       <= state_next;
            req         <= req_next;
            ack_prev    <= ack;
            ack         <= ack_next;
            ack_next    <= asyncIn.ack;
            masterData  <= masterData_next;
        END IF;
    END PROCESS Registers;
    
END ARCHITECTURE Buffered;

ARCHITECTURE NonBuffered OF OCPIOCCI_A IS
    TYPE fsm_states_t IS	(IDLE_state, AckWait_state, RespAcceptWait_state,
							HandshakeFinal_state);
    SIGNAL state, state_next    :    fsm_states_t;

    SIGNAL ack, ack_next	: std_logic := '0';
    SIGNAL req				: std_logic := '0';

BEGIN

    asyncOut.req		<= req;
	asyncOut.data <= syncIn;
    
	FSM : PROCESS(state,syncIn,asyncIn,ack)
    BEGIN
        state_next  <= state;
        syncOut     <= OCPIOSlaveIdle_c;
        CASE state IS
            WHEN IDLE_state =>
				req <= '0';
				IF ack = '0' THEN
					IF syncIn.MCmd /= OCP_CMD_IDLE THEN
						req <= '1';
						state_next <= AckWait_state;
					END IF;
				END IF;
			WHEN AckWait_state =>
				req <= '1';				
				IF ack = '1' THEN
					state_next <= RespAcceptWait_state;
					syncOut <= asyncIn.data;
					syncOut.SCmdAccept <= '1';
					IF syncIn.MRespAccept = '1' THEN
--						req <= '0';
						state_next <= Idle_state;
					END IF;
				END IF;
			WHEN RespAcceptWait_state =>
				req <= '1';
				syncOut <= asyncIn.data;
				syncOut.SCmdAccept <= '0';
				IF syncIn.MRespAccept = '1' THEN
					state_next <= Idle_state;
				END IF;
			WHEN HandshakeFinal_state =>
				req <= '0';				
				IF ack = '0' THEN
					state_next <= Idle_state;
				END IF;
			WHEN OTHERS =>
				state_next	<= IDLE_state;
      END CASE;
    END PROCESS FSM;


    Registers : PROCESS(clk,rst)
    BEGIN
        IF rst = '1' THEN
            state 		<= IDLE_state;
			ack         <= '0';
            ack_next    <= '0';
        ELSIF rising_edge(clk) THEN
            state       <= state_next;
            ack         <= ack_next;
            ack_next    <= asyncIn.ack;
        END IF;
    END PROCESS Registers;
    
END ARCHITECTURE NonBuffered;


