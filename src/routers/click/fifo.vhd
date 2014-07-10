--library IEEE, synopsys;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use synopsys.attributes.all;
use work.config_types.all;
use work.noc_defs.all;

entity fifo is
  generic (
    N                          : integer;
    init_phase                 : std_logic_vector :="00";
    GENERATE_REQUEST_DELAY     : integer := 0;
    GENERATE_ACKNOWLEDGE_DELAY : integer := 0;
    init_data : phit_t := (others => '0')
    );
  port (
    preset    : in  std_logic;
    left_in   : in  channel_forward;
    left_out  : out channel_backward;
    right_out : out channel_forward;
    right_in  : in  channel_backward

    );
end fifo;


-- Simple fifo
architecture rtl of fifo is
  type link_n_f is array (0 to N+1) of channel_forward;
  type link_n_b is array (0 to N+1) of channel_backward;

  signal stage_link_f : link_n_f;
  signal stage_link_b : link_n_b;

begin

  fifo_stages : for i in N-1 downto 0 generate
    click_stage_1 : entity work.click_stage
      generic map (
        GENERATE_REQUEST_DELAY     => GENERATE_REQUEST_DELAY,
        GENERATE_ACKNOWLEDGE_DELAY => GENERATE_ACKNOWLEDGE_DELAY,
        init_phase                 => init_phase(i mod init_phase'length + init_phase'low),
        init_data                  => init_data,
        left_N                     => 1,
        right_N                    => 1)
      port map (
        reset        => preset,
        left_data    => stage_link_f(i).data,
        right_data   => stage_link_f(i+1).data,
        left_req(0)  => stage_link_f(i).req,
        right_req    => stage_link_f(i+1).req,
        left_ack     => stage_link_b(i).ack,
        right_ack(0) => stage_link_b(i+1).ack,
        click_out    => open);
  end generate fifo_stages;


  stage_link_f(0) <= left_in;
  left_out        <= stage_link_b(0);
  right_out       <= stage_link_f(N);
  stage_link_b(N) <= right_in;
  
end rtl;
