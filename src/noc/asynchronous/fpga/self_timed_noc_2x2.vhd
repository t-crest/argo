--
-- Copyright Technical University of Denmark. All rights reserved.
-- This file is part of the T-CREST project.
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
--    1. Redistributions of source code must retain the above copyright notice,
--       this list of conditions and the following disclaimer.
--
--    2. Redistributions in binary form must reproduce the above copyright
--       notice, this list of conditions and the following disclaimer in the
--       documentation and/or other materials provided with the distribution.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER ``AS IS'' AND ANY EXPRESS
-- OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
-- OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN
-- NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY
-- DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
-- LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
-- THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--
-- The views and conclusions contained in the software and documentation are
-- those of the authors and should not be interpreted as representing official
-- policies, either expressed or implied, of the copyright holder.
--


--------------------------------------------------------------------------------
-- Self-timed NoC - Only routers
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.config_types.all;
use work.config.all;
use work.noc_defs.all;
use work.ocp.all;
use work.noc_interface.all;


entity self_timed_noc_2x2 is
port (
	reset		: in std_logic;

    -- router ports
   	n00_in_f		 : in channel_forward;
	n00_in_b		 : out channel_backward;
	n01_in_f	     : in channel_forward;
	n01_in_b	     : out channel_backward;
	n10_in_f		 : in channel_forward;
	n10_in_b		 : out channel_backward;
	n11_in_f	     : in channel_forward;
	n11_in_b	     : out channel_backward;

	-- Output ports
	n00_out_f		 : out channel_forward;
	n00_out_b		 : in channel_backward;
	n01_out_f		 : out channel_forward;
	n01_out_b		 : in channel_backward;
	n10_out_f		 : out channel_forward;
	n10_out_b		 : in channel_backward;
	n11_out_f		 : out channel_forward;
	n11_out_b		 : in channel_backward

);

end self_timed_noc_2x2;

architecture struct of self_timed_noc_2x2 is

------------------------------component declarations----------------------------
component fifo is
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
end component;

------------------------------signal declarations----------------------------
--#####################################################################
type link_n_f is array(0 to (N - 1)) of channel_forward;
type link_n_b is array(0 to (N - 1)) of channel_backward;
type link_m_f is array(0 to (M - 1)) of link_n_f;
type link_m_b is array(0 to (M - 1)) of link_n_b;

signal north_in_f  : link_m_f;
signal east_in_f   : link_m_f;
signal south_in_f  : link_m_f;
signal west_in_f   : link_m_f;
signal north_out_f : link_m_f;
signal east_out_f  : link_m_f;
signal south_out_f : link_m_f;
signal west_out_f  : link_m_f;

signal north_in_b  : link_m_b;
signal east_in_b   : link_m_b;
signal south_in_b  : link_m_b;
signal west_in_b   : link_m_b;
signal north_out_b : link_m_b;
signal east_out_b  : link_m_b;
signal south_out_b : link_m_b;
signal west_out_b  : link_m_b;


signal ip_to_net_f	: link_m_f;
signal ip_to_net_b	: link_m_b;
signal net_to_ip_f	: link_m_f;
signal net_to_ip_b	: link_m_b;


signal fifo_to_net_f      : link_m_f;
signal fifo_to_net_b      : link_m_b;
signal net_to_fifo_f      : link_m_f;
signal net_to_fifo_b      : link_m_b;


type delay_n is array (0 to (N-1)) of std_logic;
type delay_m is array (0 to (N-1)) of delay_n;

signal north_out_req0 : delay_m;
signal north_out_req1 : delay_m;
signal east_out_req0 : delay_m;
signal east_out_req1 : delay_m;
signal south_out_req0 : delay_m;
signal south_out_req1 : delay_m;
signal west_out_req0 : delay_m;
signal west_out_req1 : delay_m;

signal north_in_ack0 : delay_m;
signal north_in_ack1 : delay_m;
signal east_in_ack0 : delay_m;
signal east_in_ack1 : delay_m;
signal south_in_ack0 : delay_m;
signal south_in_ack1 : delay_m;
signal west_in_ack0 : delay_m;
signal west_in_ack1 : delay_m;

constant req_delay : time := 2 ns;

begin

	ip_to_net_f(0)(0) <= n00_in_f;
	n00_in_b <= ip_to_net_b(0)(0);
	ip_to_net_f(0)(1) <= n01_in_f;
	n01_in_b <= ip_to_net_b(0)(1);
	ip_to_net_f(1)(0) <= n10_in_f;
	n10_in_b <= ip_to_net_b(1)(0);
	ip_to_net_f(1)(1) <= n11_in_f;
	n11_in_b <= ip_to_net_b(1)(1);

	-- Output ports
	n00_out_f <= net_to_ip_f(0)(0);
	net_to_ip_b(0)(0) <= n00_out_b;
	n01_out_f <= net_to_ip_f(0)(1);
	net_to_ip_b(0)(1) <= n01_out_b;
	n10_out_f <= net_to_ip_f(1)(0);
	net_to_ip_b(1)(0) <= n10_out_b;
	n11_out_f <= net_to_ip_f(1)(1);
	net_to_ip_b(1)(1) <= n11_out_b;

	nodes_m : for i in 0 to M-1 generate
		nodes_n : for j in 0 to N-1 generate

			r : entity work.router
			port map (
				preset         => reset,
				-- Input ports
				north_in_f => north_in_f(i)(j),
                                north_in_b => north_in_b(i)(j),
                                east_in_f => east_in_f(i)(j),
                                east_in_b => east_in_b(i)(j),
                                south_in_f => south_in_f(i)(j),
                                south_in_b => south_in_b(i)(j),
                                west_in_f => west_in_f(i)(j),
                                west_in_b => west_in_b(i)(j),
				resource_in_f	 => fifo_to_net_f(i)(j),
				resource_in_b	 => fifo_to_net_b(i)(j),

				-- Output ports
				north_out_f => north_out_f(i)(j),
                                north_out_b => north_out_b(i)(j),
                                east_out_f => east_out_f(i)(j),
                                east_out_b => east_out_b(i)(j),
                                south_out_f => south_out_f(i)(j),
                                south_out_b => south_out_b(i)(j),
                                west_out_f => west_out_f(i)(j),
                                west_out_b => west_out_b(i)(j),
				resource_out_f	 => net_to_fifo_f(i)(j),
				resource_out_b	 => net_to_fifo_b(i)(j)
				
                                );
                                
               		input_fifo :fifo
			  generic map (
			    N => 0,  				-- 1
			    TOKEN => EMPTY_BUBBLE,
			    GENERATE_REQUEST_DELAY => 1,  	-- 1
			    GENERATE_ACKNOWLEDGE_DELAY => 1,  	-- 1
			    GATING_ENABLED => 0    
			  )
			  port map (
			    preset    => reset,
			    left_in   => ip_to_net_f(i)(j),
			    left_out  => ip_to_net_b(i)(j),
			    right_out => fifo_to_net_f(i)(j),
			    right_in  => fifo_to_net_b(i)(j)
			  );

			output_fifo : fifo
			  generic map (
			    N => 0,  				-- 2
			    TOKEN => VALID_TOKEN,
			    GENERATE_REQUEST_DELAY => 1,  	-- 1
			    GENERATE_ACKNOWLEDGE_DELAY => 1,  	-- 1
			    GATING_ENABLED => 0
			  )
			  port map (
			    preset    => reset,
			    left_in   => net_to_fifo_f(i)(j),
			    left_out  => net_to_fifo_b(i)(j),
			    right_out => net_to_ip_f(i)(j),
			    right_in  => net_to_ip_b(i)(j)
			  );
		end generate nodes_n;
	end generate nodes_m;
	
	delayed_reqs_m :  for i in M-1 downto 0 generate
                delayed_reqs_n : for j in N-1 downto 0 generate
                                north_out_req0(i)(j) <= not north_out_f(i)(j).req;
                                north_out_req1(i)(j) <= not north_out_req0(i)(j);
                                east_out_req0(i)(j) <= not east_out_f(i)(j).req;
                                east_out_req1(i)(j) <= not east_out_req0(i)(j);
                                south_out_req0(i)(j) <= not south_out_f(i)(j).req;
                                south_out_req1(i)(j) <= not south_out_req0(i)(j);
                                west_out_req0(i)(j) <= not west_out_f(i)(j).req;
                                west_out_req1(i)(j) <= not west_out_req0(i)(j);

                                north_in_ack0(i)(j) <= not north_in_b(i)(j).ack;
                                north_in_ack1(i)(j) <= not north_in_ack0(i)(j);
                                east_in_ack0(i)(j) <= not east_in_b(i)(j).ack;
                                east_in_ack1(i)(j) <= not east_in_ack0(i)(j);
                                south_in_ack0(i)(j) <= not south_in_b(i)(j).ack;
                                south_in_ack1(i)(j) <= not south_in_ack0(i)(j);
                                west_in_ack0(i)(j) <= not west_in_b(i)(j).ack;
                                west_in_ack1(i)(j) <= not west_in_ack0(i)(j);


                end generate delayed_reqs_n;
        end generate delayed_reqs_m;



	links_m : for i in 0 to M-1 generate
		links_n : for j in 0 to N-1 generate
			top : if (i = 0) generate
				north_in_f(i)(j).req <= south_out_req1(N-1)(j) after req_delay;
				north_in_f(i)(j).data <= south_out_f(N-1)(j).data;
                                south_out_b(N-1)(j).ack <= north_in_ack1(i)(j); --b
				south_in_f(N-1)(j).req <= north_out_req1(i)(j) after req_delay;
 				south_in_f(N-1)(j).data <= north_out_f(i)(j).data;
                                north_out_b(i)(j).ack <= south_in_ack1(N-1)(j); --b
      			end generate top;
			left : if (j = 0) generate
			        west_in_f(i)(j).req <= east_out_req1(i)(N-1) after req_delay;
			        west_in_f(i)(j).data <= east_out_f(i)(N-1).data;
                                east_out_b(i)(N-1).ack <= west_in_ack1(i)(j);  --b
			        east_in_f(i)(N-1).req <= west_out_req1(i)(j) after req_delay;
			        east_in_f(i)(N-1).data <= west_out_f(i)(j).data;
                                west_out_b(i)(j).ack <= east_in_ack1(i)(N-1);  --b
			end generate left;
			bottom : if (i = (N-1) and j < (N-1)) generate
        			east_in_f(i)(j).req <= west_out_req1(i)(j+1) after req_delay;
        			east_in_f(i)(j).data <= west_out_f(i)(j+1).data;
                                west_out_b(i)(j+1).ack <= east_in_ack1(i)(j);  --b
				west_in_f(i)(j+1).req <= east_out_req1(i)(j) after req_delay;
				west_in_f(i)(j+1).data <= east_out_f(i)(j).data;
                                east_out_b(i)(j).ack <= west_in_ack1(i)(j+1);  --b
     			end generate bottom;
			right : if (i < (N-1) and j = (N-1)) generate
			        south_in_f(i)(j).req <= north_out_req1(i+1)(j) after req_delay;
			        south_in_f(i)(j).data <= north_out_f(i+1)(j).data;
                                north_out_b(i+1)(j).ack <= south_in_ack1(i)(j);  --b
			        north_in_f(i+1)(j).req <= south_out_req1(i)(j) after req_delay;
			        north_in_f(i+1)(j).data <= south_out_f(i)(j).data;
                                south_out_b(i)(j).ack <= north_in_ack1(i+1)(j);  --b
      			end generate right;
			center : if (i < (M-1) and j < (N-1)) generate
				north_in_f(i+1)(j).req <= south_out_req1(i)(j) after req_delay;
				north_in_f(i+1)(j).data <= south_out_f(i)(j).data;
                                south_out_b(i)(j).ack  <= north_in_ack1(i+1)(j);  --b
				south_in_f(i)(j).req <= north_out_req1(i+1)(j) after req_delay;
				south_in_f(i)(j).data <= north_out_f(i+1)(j).data;
                                north_out_b(i+1)(j).ack <= south_in_ack1(i)(j);  --b
				west_in_f(i)(j+1).req <= east_out_req1(i)(j) after req_delay;
 				west_in_f(i)(j+1).data <= east_out_f(i)(j).data;
                                east_out_b(i)(j).ack  <= west_in_ack1(i)(j+1);  --b
				east_in_f(i)(j).req <= west_out_req1(i)(j+1) after req_delay;
				east_in_f(i)(j).data <= west_out_f(i)(j+1).data;
                                west_out_b(i)(j+1).ack <= east_in_ack1(i)(j);  --b
			end generate center;
		end generate links_n;
	end generate links_m;

end struct;
