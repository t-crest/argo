library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.NUMERIC_STD.all;
use work.config_types.all;
use work.config.all;
use work.noc_defs.all;
use work.delays.all;

entity packet_generator is
  generic (
    packets : link_t_vector;
    init_phase: std_logic := '0';
    slew : time := 0 ns);

  port (
    forward  : out channel_forward;
    backward : in  channel_backward;
    reset    : in  std_logic);

end entity packet_generator;

architecture behav of packet_generator is
  signal phase	 : std_logic;
  signal counter : integer := 0;
begin  -- architecture behav

  handshake : process is
  begin	 -- process handshake
    while reset = '1' loop
      wait for 1 ps;
      --forward.req  <= backward.ack;
      --phase	   <= not backward.ack;
      --forward.data <= (others => '0');
      phase <= init_phase;
    end loop;
    wait for slew;
    counter <= 0;
    while true loop
      counter	   <= counter + 1;
      forward.req  <= phase;
      forward.data <= packets(counter mod packets'length + packets'low);
      wait until backward.ack'event;
      phase	   <= not phase;
      wait for 1 ns;
    end loop;
  end process handshake;

end architecture behav;
