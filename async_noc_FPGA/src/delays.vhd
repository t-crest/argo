library ieee;
use ieee.std_logic_1164.all;

package delays is
	constant inp_req_delay : natural := 1;
	constant inp_ack_delay : natural := 0;
	constant link_req_delay : natural := 1;
	constant link_ack_delay : natural := 5;
	constant hpu_req_delay : natural := 4;
	constant hpu_ack_delay : natural := 6;
	constant crossbar_sync_req_delay : natural := 4;
	constant crossbar_sync_ack_delay : natural := 0;
end package delays;
