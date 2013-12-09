-- 
-- Copyright Technical University of Denmark. All rights reserved.
-- This file is part of the T-CREST project.
-- 
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
-- 
--    1. Redistributions of source code must retain the above copyright notice,
--	 this list of conditions and the following disclaimer.
-- 
--    2. Redistributions in binary form must reproduce the above copyright
--	 notice, this list of conditions and the following disclaimer in the
--	 documentation and/or other materials provided with the distribution.
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
-- NxN bi-torus NoC.
--
-- Author: Evangelia Kasapaki
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.config.all;
use work.noc_defs.all;
use work.noc_interface.all;


entity noc is

  port (
    --p_clk		: in std_logic;
    n_clk_sk_e : in std_logic;
    n_clk      : in std_logic;
    n_clk_sk_l : in std_logic;

    reset, reset_sk_e, reset_sk_l : in std_logic;

    p_ports_in	: in  procMasters;
    p_ports_out : out procSlaves;

    spm_ports_in  : in	spmSlaves;
    spm_ports_out : out spmMasters

    );

end noc;

architecture struct of noc is

------------------------------component declarations----------------------------

  component noc_node is
    port (
      --p_clk		: in std_logic;
      n_clk : in std_logic;
      reset : in std_logic;

      proc_in  : in  ocp_master;
      proc_out : out ocp_slave;

      spm_in  : in  spm_slave;
      spm_out : out spm_master;


      north_in_f : in channel_forward; north_in_b : out channel_backward;
      east_in_f	 : in channel_forward; east_in_b : out channel_backward;
      south_in_f : in channel_forward; south_in_b : out channel_backward;
      west_in_f	 : in channel_forward; west_in_b : out channel_backward;

      -- Output ports
      north_out_f : out channel_forward; north_out_b : in channel_backward;
      east_out_f  : out channel_forward; east_out_b : in channel_backward;
      south_out_f : out channel_forward; south_out_b : in channel_backward;
      west_out_f  : out channel_forward; west_out_b : in channel_backward

      );

  end component;

------------------------------signal declarations----------------------------

  type link_n is array(0 to (N - 1)) of channel;
  type link_m is array(0 to (N - 1)) of link_n;

  signal north_in  : link_m;
  signal east_in   : link_m;
  signal south_in  : link_m;
  signal west_in   : link_m;
  signal north_out : link_m;
  signal east_out  : link_m;
  signal south_out : link_m;
  signal west_out  : link_m;

  type delay_n is array (0 to (N-1)) of std_logic;
  type delay_m is array (0 to (N-1)) of delay_n;

  signal north_out_req0 : delay_m;
  signal north_out_req1 : delay_m;
  signal east_out_req0	: delay_m;
  signal east_out_req1	: delay_m;
  signal south_out_req0 : delay_m;
  signal south_out_req1 : delay_m;
  signal west_out_req0	: delay_m;
  signal west_out_req1	: delay_m;

  signal north_in_ack0 : delay_m;
  signal north_in_ack1 : delay_m;
  signal east_in_ack0  : delay_m;
  signal east_in_ack1  : delay_m;
  signal south_in_ack0 : delay_m;
  signal south_in_ack1 : delay_m;
  signal west_in_ack0  : delay_m;
  signal west_in_ack1  : delay_m;

  constant req_delay : time := 2 ns;


begin

  nodes_m : for i in N-1 downto 0 generate
    nodes_n : for j in N-1 downto 0 generate
      skewed_early : if i = 0 and j = 0 generate
	
	node : noc_node
	  port map (
	    --p_clk => p_clk,
	    n_clk => n_clk_sk_e,
	    reset => reset_sk_e,

	    proc_in  => p_ports_in(i)(j),
	    proc_out => p_ports_out(i)(j),

	    spm_in  => spm_ports_in(i)(j),
	    spm_out => spm_ports_out(i)(j),

	    north_in_f => north_in(i)(j).forward,
	    north_in_b => north_in(i)(j).backward,
	    east_in_f  => east_in(i)(j).forward,
	    east_in_b  => east_in(i)(j).backward,
	    south_in_f => south_in(i)(j).forward,
	    south_in_b => south_in(i)(j).backward,
	    west_in_f  => west_in(i)(j).forward,
	    west_in_b  => west_in(i)(j).backward,

	    north_out_f => north_out(i)(j).forward,
	    north_out_b => north_out(i)(j).backward,
	    east_out_f	=> east_out(i)(j).forward,
	    east_out_b	=> east_out(i)(j).backward,
	    south_out_f => south_out(i)(j).forward,
	    south_out_b => south_out(i)(j).backward,
	    west_out_f	=> west_out(i)(j).forward,
	    west_out_b	=> west_out(i)(j).backward
	    );
      end generate skewed_early;

      skewed_late : if i = 1 and j = 0 generate
	
	node : noc_node
	  port map (
	    --p_clk => p_clk,
	    n_clk => n_clk_sk_l,
	    reset => reset_sk_l,

	    proc_in  => p_ports_in(i)(j),
	    proc_out => p_ports_out(i)(j),

	    spm_in  => spm_ports_in(i)(j),
	    spm_out => spm_ports_out(i)(j),

	    north_in_f => north_in(i)(j).forward,
	    north_in_b => north_in(i)(j).backward,
	    east_in_f  => east_in(i)(j).forward,
	    east_in_b  => east_in(i)(j).backward,
	    south_in_f => south_in(i)(j).forward,
	    south_in_b => south_in(i)(j).backward,
	    west_in_f  => west_in(i)(j).forward,
	    west_in_b  => west_in(i)(j).backward,

	    north_out_f => north_out(i)(j).forward,
	    north_out_b => north_out(i)(j).backward,
	    east_out_f	=> east_out(i)(j).forward,
	    east_out_b	=> east_out(i)(j).backward,
	    south_out_f => south_out(i)(j).forward,
	    south_out_b => south_out(i)(j).backward,
	    west_out_f	=> west_out(i)(j).forward,
	    west_out_b	=> west_out(i)(j).backward
	    );
      end generate skewed_late;



      not_skewed : if j = 1 generate

	node : noc_node
	  port map (
	    --p_clk => p_clk,
	    n_clk => n_clk,
	    reset => reset,

	    proc_in  => p_ports_in(i)(j),
	    proc_out => p_ports_out(i)(j),

	    spm_in  => spm_ports_in(i)(j),
	    spm_out => spm_ports_out(i)(j),

	    north_in_f => north_in(i)(j).forward,
	    north_in_b => north_in(i)(j).backward,
	    east_in_f  => east_in(i)(j).forward,
	    east_in_b  => east_in(i)(j).backward,
	    south_in_f => south_in(i)(j).forward,
	    south_in_b => south_in(i)(j).backward,
	    west_in_f  => west_in(i)(j).forward,
	    west_in_b  => west_in(i)(j).backward,

	    north_out_f => north_out(i)(j).forward,
	    north_out_b => north_out(i)(j).backward,
	    east_out_f	=> east_out(i)(j).forward,
	    east_out_b	=> east_out(i)(j).backward,
	    south_out_f => south_out(i)(j).forward,
	    south_out_b => south_out(i)(j).backward,
	    west_out_f	=> west_out(i)(j).forward,
	    west_out_b	=> west_out(i)(j).backward

	    );


      end generate not_skewed;


    end generate nodes_n;
  end generate nodes_m;

  delayed_reqs_m : for i in N-1 downto 0 generate
    delayed_reqs_n : for j in N-1 downto 0 generate
      north_out_req0(i)(j) <= not north_out(i)(j).forward.req;
      north_out_req1(i)(j) <= not north_out_req0(i)(j);
      east_out_req0(i)(j)  <= not east_out(i)(j).forward.req;
      east_out_req1(i)(j)  <= not east_out_req0(i)(j);
      south_out_req0(i)(j) <= not south_out(i)(j).forward.req;
      south_out_req1(i)(j) <= not south_out_req0(i)(j);
      west_out_req0(i)(j)  <= not west_out(i)(j).forward.req;
      west_out_req1(i)(j)  <= not west_out_req0(i)(j);

      north_in_ack0(i)(j) <= not north_in(i)(j).backward.ack;
      north_in_ack1(i)(j) <= not north_in_ack0(i)(j);
      east_in_ack0(i)(j)  <= not east_in(i)(j).backward.ack;
      east_in_ack1(i)(j)  <= not east_in_ack0(i)(j);
      south_in_ack0(i)(j) <= not south_in(i)(j).backward.ack;
      south_in_ack1(i)(j) <= not south_in_ack0(i)(j);
      west_in_ack0(i)(j)  <= not west_in(i)(j).backward.ack;
      west_in_ack1(i)(j)  <= not west_in_ack0(i)(j);      
    end generate delayed_reqs_n;
  end generate delayed_reqs_m;



  links_m : for i in 0 to N-1 generate
    links_n : for j in 0 to N-1 generate
      top : if (i = 0) generate
	north_in(i)(j).forward.req     <= south_out_req1(N-1)(j) after req_delay;
	north_in(i)(j).forward.data    <= south_out(N-1)(j).forward.data;
	south_out(N-1)(j).backward.ack <= north_in_ack1(i)(j);	  --b
	south_in(N-1)(j).forward.req   <= north_out_req1(i)(j)	 after req_delay;
	south_in(N-1)(j).forward.data  <= north_out(i)(j).forward.data;
	north_out(i)(j).backward.ack   <= south_in_ack1(N-1)(j);  --b
      end generate top;
      left : if (j = 0) generate
	west_in(i)(j).forward.req     <= east_out_req1(i)(N-1) after req_delay;
	west_in(i)(j).forward.data    <= east_out(i)(N-1).forward.data;
	east_out(i)(N-1).backward.ack <= west_in_ack1(i)(j);	  --b
	east_in(i)(N-1).forward.req   <= west_out_req1(i)(j)   after req_delay;
	east_in(i)(N-1).forward.data  <= west_out(i)(j).forward.data;
	west_out(i)(j).backward.ack   <= east_in_ack1(i)(N-1);	  --b
      end generate left;
      bottom : if (i = (N-1) and j < (N-1)) generate
	east_in(i)(j).forward.req     <= west_out_req1(i)(j+1) after req_delay;
	east_in(i)(j).forward.data    <= west_out(i)(j+1).forward.data;
	west_out(i)(j+1).backward.ack <= east_in_ack1(i)(j);	  --b
	west_in(i)(j+1).forward.req   <= east_out_req1(i)(j)   after req_delay;
	west_in(i)(j+1).forward.data  <= east_out(i)(j).forward.data;
	east_out(i)(j).backward.ack   <= west_in_ack1(i)(j+1);	  --b
      end generate bottom;
      right : if (i < (N-1) and j = (N-1)) generate
	south_in(i)(j).forward.req     <= north_out_req1(i+1)(j) after req_delay;
	south_in(i)(j).forward.data    <= north_out(i+1)(j).forward.data;
	north_out(i+1)(j).backward.ack <= south_in_ack1(i)(j);	  --b
	north_in(i+1)(j).forward.req   <= south_out_req1(i)(j)	 after req_delay;
	north_in(i+1)(j).forward.data  <= south_out(i)(j).forward.data;
	south_out(i)(j).backward.ack   <= north_in_ack1(i+1)(j);  --b
      end generate right;
      center : if (i < (N-1) and j < (N-1)) generate
	north_in(i+1)(j).forward.req   <= south_out_req1(i)(j)	 after req_delay;
	north_in(i+1)(j).forward.data  <= south_out(i)(j).forward.data;
	south_out(i)(j).backward.ack   <= north_in_ack1(i+1)(j);  --b
	south_in(i)(j).forward.req     <= north_out_req1(i+1)(j) after req_delay;
	south_in(i)(j).forward.data    <= north_out(i+1)(j).forward.data;
	north_out(i+1)(j).backward.ack <= south_in_ack1(i)(j);	  --b
	west_in(i)(j+1).forward.req    <= east_out_req1(i)(j)	 after req_delay;
	west_in(i)(j+1).forward.data   <= east_out(i)(j).forward.data;
	east_out(i)(j).backward.ack    <= west_in_ack1(i)(j+1);	  --b
	east_in(i)(j).forward.req      <= west_out_req1(i)(j+1)	 after req_delay;
	east_in(i)(j).forward.data     <= west_out(i)(j+1).forward.data;
	west_out(i)(j+1).backward.ack  <= east_in_ack1(i)(j);	  --b
      end generate center;
    end generate links_n;
  end generate links_m;

end struct;
