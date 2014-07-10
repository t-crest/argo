library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.NUMERIC_STD.all;
use work.config_types.all;
use work.config.all;
use work.noc_defs.all;
use work.delays.all;


entity packet_consumer is

  generic (
    init_phase : std_logic := '1');
  port (
    forward  : in  channel_forward;
    backward : out channel_backward;
    reset    : in  std_logic);

end entity packet_consumer;

architecture behav of packet_consumer is
  signal phase : std_logic;
  component wiretap is
    generic (
      name	   : string;
      N		   : natural;
      M		   : natural;
      direction	   : string;
      is_input	   : boolean;
      extra_string : string);
    port (
      wire_fw : in channel_forward;
      wire_bw : in channel_backward);
  end component wiretap;
begin  -- architecture behav

  handshake : process is
  begin	 -- process handshake
    while reset = '1' loop
      wait for 1 ps;
      --backward.ack <= forward.req;
      --phase	   <= not forward.req;
      phase <= init_phase;
    end loop;
    while true loop
      backward.ack <= phase;
      wait until forward.req'event;
      phase	   <= not phase;
      wait for 1 ns;
    end loop;
  end process handshake;

end architecture behav;
