library IEEE, synopsys;
use IEEE.STD_LOGIC_1164.all;
use synopsys.attributes.all;
use work.config_types.all;
use work.noc_defs.all;

entity fifo is
  generic (
    N			       : integer;
    TOKEN		       : latch_state;
    GATING_ENABLED	       : integer := 0;
    GENERATE_REQUEST_DELAY     : integer := 0;
    GENERATE_ACKNOWLEDGE_DELAY : integer := 0
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


  fifo_latches : for i in N-1 downto 0 generate
    latch_stage : entity work.channel_latch(struct)
      generic map (
	init_token		   => TOKEN,
	GATING_ENABLED		   => GATING_ENABLED,
	GENERATE_REQUEST_DELAY	   => GENERATE_REQUEST_DELAY,
	GENERATE_ACKNOWLEDGE_DELAY => GENERATE_ACKNOWLEDGE_DELAY
	)
      port map (
	preset	  => preset,
	left_in	  => stage_link_f(i),
	left_out  => stage_link_b(i),
	right_out => stage_link_f(i+1),
	right_in  => stage_link_b(i+1),
	lt_enable => open
	);
  end generate fifo_latches;




  stage_link_f(0) <= left_in;
  left_out	  <= stage_link_b(0);
  right_out	  <= stage_link_f(N);
  stage_link_b(N) <= right_in;
  
end rtl;
