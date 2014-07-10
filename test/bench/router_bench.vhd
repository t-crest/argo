library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
use work.config_types.all;
use work.config.all;
use work.noc_defs.all;
use work.delays.all;

entity router_bench is

end entity router_bench;

architecture bench of router_bench is
  -----------------------------------------------------------------------------
  -- phase setup for the stages
  -----------------------------------------------------------------------------
  constant input_phase	    : std_logic := '0';
  constant output_phase	    : std_logic := '0';
  constant res_input_phase  : std_logic := '0';
  constant res_output_phase : std_logic := '0';
  constant router_in_phase  : std_logic := '1';
  constant router_hpu_phase : std_logic := '1';
  constant router_out_phase : std_logic := '0';

  -----------------------------------------------------------------------------
  -- Amount of router stages
  -----------------------------------------------------------------------------
  constant router_chain_length : integer := 2;

  -----------------------------------------------------------------------------
  -- bench configuration: strip has five producers on the input, five consumers
  -- on the output while ring interconnects north, south east and west in a
  -- ring fashion.
  -----------------------------------------------------------------------------
  type bench_config_type is (STRIP, RING, PASSIVE_RING);

  constant bench_configuration : bench_config_type :=
    --STRIP;
    RING;
    --PASSIVE_RING;
  component packet_generator is
    generic (
      packets	 : link_t_vector;
      init_phase : std_logic);
    port (
      forward  : out channel_forward;
      backward : in  channel_backward;
      reset    : in  std_logic);
  end component packet_generator;

  component router is
    generic (
      in_phase	: std_logic;
      hpu_phase : std_logic;
      out_phase : std_logic);
    port (
      preset	     : in  std_logic;
      north_in_f     : in  channel_forward;
      north_in_b     : out channel_backward;
      east_in_f	     : in  channel_forward;
      east_in_b	     : out channel_backward;
      south_in_f     : in  channel_forward;
      south_in_b     : out channel_backward;
      west_in_f	     : in  channel_forward;
      west_in_b	     : out channel_backward;
      resource_in_f  : in  channel_forward;
      resource_in_b  : out channel_backward;
      north_out_f    : out channel_forward;
      north_out_b    : in  channel_backward;
      east_out_f     : out channel_forward;
      east_out_b     : in  channel_backward;
      south_out_f    : out channel_forward;
      south_out_b    : in  channel_backward;
      west_out_f     : out channel_forward;
      west_out_b     : in  channel_backward;
      resource_out_f : out channel_forward;
      resource_out_b : in  channel_backward);
  end component router;

  signal res_forward, res_out_forward					 : channel_forward;
  signal res_backward, res_out_backward					 : channel_backward;
  signal n_forward, s_forward, e_forward, w_forward, res_forward_pl	 : channel_forward_vector(router_chain_length downto 0);
  signal n_backward, s_backward, e_backward, w_backward, res_backward_pl : channel_backward_vector(router_chain_length downto 0);
  signal res_forward_in, res_forward_out				 : channel_forward_vector(router_chain_length - 1 downto 0);
  signal res_backward_in, res_backward_out				 : channel_backward_vector(router_chain_length - 1 downto 0);

  --signal n_out_forward, s_out_forward, w_out_forward, e_out_forward, res_out_forward, res_out_forward_pl	 : channel_forward;
  --signal n_out_backward, s_out_backward, e_out_backward, w_out_backward, res_out_backward, res_out_backward_pl : channel_backward;

  signal reset : std_logic := '1';
  
begin  -- architecture bench

  reset <= '0' after 5.5 ns;

  strip_implementation : if bench_configuration = STRIP generate


    -----------------------------------------------------------------------------
    -- package generators
    -----------------------------------------------------------------------------
    north : entity work.packet_generator
      generic map (
	packets	   => (
--	 .-VLD
--	 |.-SOP
--	 ||.-EOP
--	 |||
--	 vvv
--	     3	       2	 1	   0
--	 43210987654321098765432109876543210"
	  "11000000000000000000000000000000000",
	  "10000000000000000000000000000000000",
	  "10100000000000000000000000000000000",
	  "00000000000000000000000000000000000",
	  "11000000000000000000000000000000001",
	  "10000000000000000000000000000000000",
	  "10100000000000000000000000000000000",
	  "00000000000000000000000000000000000",
	  "11000000000000000000000000000000010",
	  "10000000000000000000000000000000000",
	  "10100000000000000000000000000000000",
	  "00000000000000000000000000000000000",
	  "11000000000000000000000000000000011",
	  "10000000000000000000000000000000000",
	  "10100000000000000000000000000000000",
	  "00000000000000000000000000000000000"),
	init_phase => input_phase,
	slew	   => 100 ps)
      port map (
	forward	 => n_forward(0),
	backward => n_backward(0),
	reset	 => reset);
    south : entity work.packet_generator
      generic map (
	packets	   => (
--	 .-VLD
--	 |.-SOP
--	 ||.-EOP
--	 |||
--	 vvv
--	     3	       2	 1	   0
--	 43210987654321098765432109876543210"
	  "11000000000000000000000000000000001",
	  "10000000000000000000000000000000001",
	  "10100000000000000000000000000000001",
	  "00000000000000000000000000000000000",
	  "11000000000000000000000000000000010",
	  "10000000000000000000000000000000001",
	  "10100000000000000000000000000000001",
	  "00000000000000000000000000000000000",
	  "11000000000000000000000000000000011",
	  "10000000000000000000000000000000001",
	  "10100000000000000000000000000000001",
	  "00000000000000000000000000000000000",
	  "11000000000000000000000000000000000",
	  "10000000000000000000000000000000001",
	  "10100000000000000000000000000000001",
	  "00000000000000000000000000000000000"),
	init_phase => input_phase,
	slew	   => 200 ps)
      port map (
	forward	 => s_forward(0),
	backward => s_backward(0),
	reset	 => reset);
    east : entity work.packet_generator
      generic map (
	packets	   => (
--	 .-VLD
--	 |.-SOP
--	 ||.-EOP
--	 |||
--	 vvv
--	     3	       2	 1	   0
--	 43210987654321098765432109876543210"
	  "11000000000000000000000000000000010",
	  "10000000000000000000000000000000010",
	  "10100000000000000000000000000000010",
	  "00000000000000000000000000000000000",
	  "11000000000000000000000000000000011",
	  "10000000000000000000000000000000010",
	  "10100000000000000000000000000000010",
	  "00000000000000000000000000000000000",
	  "11000000000000000000000000000000000",
	  "10000000000000000000000000000000010",
	  "10100000000000000000000000000000010",
	  "00000000000000000000000000000000000",
	  "11000000000000000000000000000000001",
	  "10000000000000000000000000000000010",
	  "10100000000000000000000000000000010",
	  "00000000000000000000000000000000000"),
	init_phase => input_phase,
	slew	   => 300 ps)
      port map (
	forward	 => e_forward(0),
	backward => e_backward(0),
	reset	 => reset);
    west : entity work.packet_generator
      generic map (
	packets	   => (
--	 .-VLD
--	 |.-SOP
--	 ||.-EOP
--	 |||
--	 vvv
--	     3	       2	 1	   0
--	 43210987654321098765432109876543210"
	  "11000000000000000000000000000000011",
	  "10000000000000000000000000000000011",
	  "10100000000000000000000000000000011",
	  "00000000000000000000000000000000000",
	  "11000000000000000000000000000000000",
	  "10000000000000000000000000000000011",
	  "10100000000000000000000000000000011",
	  "00000000000000000000000000000000000",
	  "11000000000000000000000000000000001",
	  "10000000000000000000000000000000011",
	  "10100000000000000000000000000000011",
	  "00000000000000000000000000000000000",
	  "11000000000000000000000000000000010",
	  "10000000000000000000000000000000011",
	  "10100000000000000000000000000000011",
	  "00000000000000000000000000000000000"),
	init_phase => input_phase,
	slew	   => 400 ps)
      port map (
	forward	 => w_forward(0),
	backward => w_backward(0),
	reset	 => reset);
    res : entity work.packet_generator
      generic map (
	packets	   => (
--	 .-VLD
--	 |.-SOP
--	 ||.-EOP
--	 |||
--	 vvv
--	     3	       2	 1	   0
--	 43210987654321098765432109876543210"
	  "00000000000000000000000000000000000",
	  "00000000000000000000000000000000000",
	  "00000000000000000000000000000000000",
	  "00000000000000000000000000000000000",
	  "00000000000000000000000000000000000",
	  "00000000000000000000000000000000000",
	  "00000000000000000000000000000000000",
	  "00000000000000000000000000000000000",
	  "00000000000000000000000000000000000",
	  "00000000000000000000000000000000000",
	  "00000000000000000000000000000000000",
	  "00000000000000000000000000000000000",
	  "00000000000000000000000000000000000",
	  "00000000000000000000000000000000000",
	  "00000000000000000000000000000000000",
	  "00000000000000000000000000000000000"),
	init_phase => res_input_phase)
      port map (
	forward	 => res_forward,
	backward => res_backward,
	reset	 => reset);

    -----------------------------------------------------------------------------
    -- package consumers
    -----------------------------------------------------------------------------
    consumer_n : entity work.packet_consumer
      generic map (
	init_phase => output_phase)
      port map (
	forward	 => n_forward(router_chain_length),
	backward => n_backward(router_chain_length),
	reset	 => reset);
    consumer_s : entity work.packet_consumer
      generic map (
	init_phase => output_phase)
      port map (
	forward	 => s_forward(router_chain_length),
	backward => s_backward(router_chain_length),
	reset	 => reset);
    consumer_e : entity work.packet_consumer
      generic map (
	init_phase => output_phase)
      port map (
	forward	 => e_forward(router_chain_length),
	backward => e_backward(router_chain_length),
	reset	 => reset);
    consumer_w : entity work.packet_consumer
      generic map (
	init_phase => output_phase)
      port map (
	forward	 => w_forward(router_chain_length),
	backward => w_backward(router_chain_length),
	reset	 => reset);
    consumer_res : entity work.packet_consumer
      generic map (
	init_phase => res_output_phase)
      port map (
	forward	 => res_out_forward,
	backward => res_out_backward,
	reset	 => reset);

    -----------------------------------------------------------------------------
    -- i/o fifos
    -----------------------------------------------------------------------------
    input_fifo : entity work.fifo
      generic map (
	N	   => 0,
	init_phase => "110")
      port map (
	preset	  => reset,
	left_in	  => res_forward,
	left_out  => res_backward,
	right_out => res_forward_pl(0),
	right_in  => res_backward_pl(0));
    output_fifo : entity work.fifo
      generic map (
	N	   => 0,
	init_phase => "0")
      port map (
	preset	  => reset,
	left_in	  => res_forward_pl(router_chain_length),
	left_out  => res_backward_pl(router_chain_length),
	right_out => res_out_forward,
	right_in  => res_out_backward);
    ---------------------------------------------------------------------------
    -- interconnect the ressources
    ---------------------------------------------------------------------------
    ressource_interlink : for i in router_chain_length - 1 downto 0 generate
      res_forward_in(i)	  <= res_forward_pl(i);
      res_forward_pl(i+1) <= res_forward_out(i);
      res_backward_pl(i)  <= res_backward_in(i);
      res_backward_out(i) <= res_backward_pl(i+1);
    end generate ressource_interlink;
  end generate strip_implementation;

  ring_implementation : if bench_configuration = RING generate
    ---------------------------------------------------------------------------
    -- interconnect the ends of the ring
    ---------------------------------------------------------------------------
    n_forward(0)		    <= n_forward(router_chain_length);
    n_backward(router_chain_length) <= n_backward(0);
    s_forward(0)		    <= s_forward(router_chain_length);
    s_backward(router_chain_length) <= s_backward(0);
    e_forward(0)		    <= e_forward(router_chain_length);
    e_backward(router_chain_length) <= e_backward(0);
    w_forward(0)		    <= w_forward(router_chain_length);
    w_backward(router_chain_length) <= w_backward(0);
    ---------------------------------------------------------------------------
    -- instanciate consumers at the ressource outputs
    ---------------------------------------------------------------------------
    consumers_producers : for i in router_chain_length - 1 downto 0 generate
      consumer : entity work.packet_consumer
	generic map (
	  init_phase => res_output_phase)
	port map (
	  forward  => res_forward_out(i),
	  backward => res_backward_out(i),
	  reset	   => reset);

      ---------------------------------------------------------------------------
      -- instanciate producers at the resource inputs
      ---------------------------------------------------------------------------
      producer : entity work.packet_generator
	generic map (
	  packets    => (
--	 .-VLD
--	 |.-SOP
--	 ||.-EOP
--	 |||
--	 vvv
--	     3	       2	 1	   0
--	 43210987654321098765432109876543210"
	    "00000000000000000000000000000000000",
	    "00000000000000000000000000000000000"),
	  init_phase => res_input_phase)
	port map (
	  forward  => res_forward_in(i),
	  backward => res_backward_in(i),
	  reset	   => reset);

    end generate consumers_producers;
  end generate ring_implementation;

  passive_ring_implementation : if bench_configuration = PASSIVE_RING generate
    ---------------------------------------------------------------------------
    -- interconnect the ressources
    ---------------------------------------------------------------------------
    ressource_interlink : for i in router_chain_length - 1 downto 0 generate
      res_forward_in(i).req	  <= res_forward_out((i + 1) mod res_forward_out'length + res_forward_out'low).req;
      res_forward_in(i).data	  <= res_forward_out((i + 1) mod res_forward_out'length + res_forward_out'low).data;
      res_backward_out((i + 1) mod res_forward_out'length + res_forward_out'low).ack <= res_backward_in(i).ack;
    end generate ressource_interlink;

    ---------------------------------------------------------------------------
    -- close ring
    ---------------------------------------------------------------------------
    n_forward(0).req		    <= n_forward(router_chain_length).req;
    n_forward(0).data		    <= n_forward(router_chain_length).data;
    n_backward(router_chain_length).ack <= n_backward(0).ack;
    s_forward(0).req		    <= s_forward(router_chain_length).req;
    s_forward(0).data		    <= s_forward(router_chain_length).data;
    s_backward(router_chain_length).ack <= s_backward(0).ack;
    e_forward(0).req		    <= e_forward(router_chain_length).req;
    e_forward(0).data		    <= e_forward(router_chain_length).data;
    e_backward(router_chain_length).ack <= e_backward(0).ack;
    w_forward(0).req		    <= w_forward(router_chain_length).req;
    w_forward(0).data		    <= w_forward(router_chain_length).data;
    w_backward(router_chain_length).ack <= w_backward(0).ack;

  end generate passive_ring_implementation;
  -----------------------------------------------------------------------------
  -- router chain
  -----------------------------------------------------------------------------
  routers : for i in router_chain_length - 1 downto 0 generate
    router_1 : entity work.router
      generic map (
	in_phase  => router_in_phase,
	hpu_phase => router_hpu_phase,
	out_phase => router_out_phase)
      port map (
	preset	       => reset,
	north_in_f     => n_forward(i),
	north_in_b     => n_backward(i),
	east_in_f      => e_forward(i),
	east_in_b      => e_backward(i),
	south_in_f     => s_forward(i),
	south_in_b     => s_backward(i),
	west_in_f      => w_forward(i),
	west_in_b      => w_backward(i),
	resource_in_f  => res_forward_in(i),
	resource_in_b  => res_backward_in(i),
	north_out_f    => n_forward(i+1),
	north_out_b    => n_backward(i+1),
	east_out_f     => e_forward(i+1),
	east_out_b     => e_backward(i+1),
	south_out_f    => s_forward(i+1),
	south_out_b    => s_backward(i+1),
	west_out_f     => w_forward(i+1),
	west_out_b     => w_backward(i+1),
	resource_out_f => res_forward_out(i),
	resource_out_b => res_backward_out(i));
  end generate routers;

  


end architecture bench;
