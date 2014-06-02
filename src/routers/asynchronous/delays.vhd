library ieee;
use ieee.std_logic_1164.all;

package delays is
	constant inp_req_delay : natural := 1;
	-- D constant inp_ack_delay : natural := 2;
	constant link_req_delay : natural := 1;
	constant link_ack_delay : natural := 2; -- previous was 5
	constant hpu_ack_delay : natural := 3; -- 6
	constant hpu_first_req_delay : natural := 6; --4
	constant hpu_second_req_delay : natural := 4; --2
	constant crossbar_sync_req_delay : natural := 4;
	constant crossbar_sync_ack_delay : natural := 2;
	-- D constant input_fifo_req_delay : natural := 1;
	-- D constant input_fifo_ack_delay : natural := 0;-- Input Fifo size 1 and the ack is ignored by the NI
	-- D constant output_fifo_req_delay : natural := 1;
	-- D constant output_fifo_ack_delay : natural := 2; --no less than 2
end package delays;
