library IEEE, synopsys;
use IEEE.STD_LOGIC_1164.all;
use synopsys.attributes.all;
use work.noc_defs.all;

entity fifo is
  generic (
    N	  : integer;
    TOKEN : latch_state;
    GATING_ENABLED : integer := 0;
    GENERATE_REQUEST_DELAY : integer := 0;
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
  type link_n is array (0 to N+1) of channel;

  signal stage_link : link_n;
  
begin


  fifo_latches : for i in N-1 downto 0 generate
    latch_stage : entity work.channel_latch(struct)
      generic map (
	init_token => TOKEN,
	GATING_ENABLED => GATING_ENABLED,
	GENERATE_REQUEST_DELAY => GENERATE_REQUEST_DELAY,
	GENERATE_ACKNOWLEDGE_DELAY => GENERATE_ACKNOWLEDGE_DELAY
	)
      port map (
	preset	  => preset,
	left_in	  => stage_link(i).forward,
	left_out  => stage_link(i).backward,
	right_out => stage_link(i+1).forward,
	right_in  => stage_link(i+1).backward,
	lt_enable => open
	);
  end generate fifo_latches;




  stage_link(0).forward	 <= left_in;
  left_out		 <= stage_link(0).backward;
  right_out		 <= stage_link(N).forward;
  stage_link(N).backward <= right_in;
  
end rtl;
