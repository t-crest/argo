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
-- NxN bi-torus NoC.
--
-- Author: Evangelia Kasapaki
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


entity noc is

  port (
    p_clk : in std_logic;
    n_clk : in std_logic;
    reset : in std_logic;

    ocp_io_ms : in  ocp_io_m_a;
    ocp_io_ss : out ocp_io_s_a;

    spm_ports_m : out spm_masters;
    spm_ports_s : in  spm_slaves
    );

end noc;

architecture struct of noc is

------------------------------signal declarations----------------------------

--type link_n is array(0 to (N - 1)) of channel;
--type link_m is array(0 to (N - 1)) of link_n;

  signal north_in_f  : link_m_f;
  signal north_in_b  : link_m_b;
  signal east_in_f   : link_m_f;
  signal east_in_b   : link_m_b;
  signal south_in_f  : link_m_f;
  signal south_in_b  : link_m_b;
  signal west_in_f   : link_m_f;
  signal west_in_b   : link_m_b;
  signal north_out_f : link_m_f;
  signal north_out_b : link_m_b;
  signal east_out_f  : link_m_f;
  signal east_out_b  : link_m_b;
  signal south_out_f : link_m_f;
  signal south_out_b : link_m_b;
  signal west_out_f  : link_m_f;
  signal west_out_b  : link_m_b;

  type delay_n is array (0 to (N-1)) of std_logic;
  type delay_m is array (0 to (M-1)) of delay_n;

  signal north_out_req0 : delay_m;
  signal north_out_req1 : delay_m;
  signal east_out_req0  : delay_m;
  signal east_out_req1  : delay_m;
  signal south_out_req0 : delay_m;
  signal south_out_req1 : delay_m;
  signal west_out_req0  : delay_m;
  signal west_out_req1  : delay_m;

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

  nodes_m : for i in 0 to M-1 generate
    nodes_n : for j in 0 to N-1 generate
      node : entity work.noc_node
        port map (
          p_clk => p_clk,
          n_clk => n_clk,
          reset => reset,

          proc_m => ocp_io_ms((i*N)+j),
          proc_s => ocp_io_ss((i*N)+j),

          spm_s => spm_ports_s((i*N)+j),
          spm_m => spm_ports_m((i*N)+j),

          north_in_f => north_in_f(i)(j),
          north_in_b => north_in_b(i)(j),
          south_in_f => south_in_f(i)(j),
          south_in_b => south_in_b(i)(j),
          east_in_f  => east_in_f(i)(j),
          east_in_b  => east_in_b(i)(j),
          west_in_f  => west_in_f(i)(j),
          west_in_b  => west_in_b(i)(j),

          north_out_f => north_out_f(i)(j),
          north_out_b => north_out_b(i)(j),
          south_out_f => south_out_f(i)(j),
          south_out_b => south_out_b(i)(j),
          east_out_f  => east_out_f(i)(j),
          east_out_b  => east_out_b(i)(j),
          west_out_f  => west_out_f(i)(j),
          west_out_b  => west_out_b(i)(j)
          );

    end generate nodes_n;
  end generate nodes_m;

  delayed_reqs_m : for i in N-1 downto 0 generate
    delayed_reqs_n : for j in N-1 downto 0 generate
      north_out_req0(i)(j) <= not north_out_f(i)(j).req;
      north_out_req1(i)(j) <= not north_out_req0(i)(j);
      east_out_req0(i)(j)  <= not east_out_f(i)(j).req;
      east_out_req1(i)(j)  <= not east_out_req0(i)(j);
      south_out_req0(i)(j) <= not south_out_f(i)(j).req;
      south_out_req1(i)(j) <= not south_out_req0(i)(j);
      west_out_req0(i)(j)  <= not west_out_f(i)(j).req;
      west_out_req1(i)(j)  <= not west_out_req0(i)(j);

      north_in_ack0(i)(j) <= not north_in_b(i)(j).ack;
      north_in_ack1(i)(j) <= not north_in_ack0(i)(j);
      east_in_ack0(i)(j)  <= not east_in_b(i)(j).ack;
      east_in_ack1(i)(j)  <= not east_in_ack0(i)(j);
      south_in_ack0(i)(j) <= not south_in_b(i)(j).ack;
      south_in_ack1(i)(j) <= not south_in_ack0(i)(j);
      west_in_ack0(i)(j)  <= not west_in_b(i)(j).ack;
      west_in_ack1(i)(j)  <= not west_in_ack0(i)(j);


    end generate delayed_reqs_n;
  end generate delayed_reqs_m;



  links_m : for i in 0 to N-1 generate
    links_n : for j in 0 to N-1 generate
      top : if (i = 0) generate
        north_in_f(i)(j).req    <= south_out_req1(N-1)(j) after req_delay;
        north_in_f(i)(j).data   <= south_out_f(N-1)(j).data;
        south_out_b(N-1)(j).ack <= north_in_ack1(i)(j);    --b
        south_in_f(N-1)(j).req  <= north_out_req1(i)(j)   after req_delay;
        south_in_f(N-1)(j).data <= north_out_f(i)(j).data;
        north_out_b(i)(j).ack   <= south_in_ack1(N-1)(j);  --b
      end generate top;
      left : if (j = 0) generate
        west_in_f(i)(j).req    <= east_out_req1(i)(N-1) after req_delay;
        west_in_f(i)(j).data   <= east_out_f(i)(N-1).data;
        east_out_b(i)(N-1).ack <= west_in_ack1(i)(j);      --b
        east_in_f(i)(N-1).req  <= west_out_req1(i)(j)   after req_delay;
        east_in_f(i)(N-1).data <= west_out_f(i)(j).data;
        west_out_b(i)(j).ack   <= east_in_ack1(i)(N-1);    --b
      end generate left;
      bottom : if (i = (N-1) and j < (N-1)) generate
        east_in_f(i)(j).req    <= west_out_req1(i)(j+1) after req_delay;
        east_in_f(i)(j).data   <= west_out_f(i)(j+1).data;
        west_out_b(i)(j+1).ack <= east_in_ack1(i)(j);      --b
        west_in_f(i)(j+1).req  <= east_out_req1(i)(j)   after req_delay;
        west_in_f(i)(j+1).data <= east_out_f(i)(j).data;
        east_out_b(i)(j).ack   <= west_in_ack1(i)(j+1);    --b
      end generate bottom;
      right : if (i < (N-1) and j = (N-1)) generate
        south_in_f(i)(j).req    <= north_out_req1(i+1)(j) after req_delay;
        south_in_f(i)(j).data   <= north_out_f(i+1)(j).data;
        north_out_b(i+1)(j).ack <= south_in_ack1(i)(j);    --b
        north_in_f(i+1)(j).req  <= south_out_req1(i)(j)   after req_delay;
        north_in_f(i+1)(j).data <= south_out_f(i)(j).data;
        south_out_b(i)(j).ack   <= north_in_ack1(i+1)(j);  --b
      end generate right;
      center : if (i < (N-1) and j < (N-1)) generate
        north_in_f(i+1)(j).req  <= south_out_req1(i)(j)   after req_delay;
        north_in_f(i+1)(j).data <= south_out_f(i)(j).data;
        south_out_b(i)(j).ack   <= north_in_ack1(i+1)(j);  --b
        south_in_f(i)(j).req    <= north_out_req1(i+1)(j) after req_delay;
        south_in_f(i)(j).data   <= north_out_f(i+1)(j).data;
        north_out_b(i+1)(j).ack <= south_in_ack1(i)(j);    --b
        west_in_f(i)(j+1).req   <= east_out_req1(i)(j)    after req_delay;
        west_in_f(i)(j+1).data  <= east_out_f(i)(j).data;
        east_out_b(i)(j).ack    <= west_in_ack1(i)(j+1);   --b
        east_in_f(i)(j).req     <= west_out_req1(i)(j+1)  after req_delay;
        east_in_f(i)(j).data    <= west_out_f(i)(j+1).data;
        west_out_b(i)(j+1).ack  <= east_in_ack1(i)(j);     --b
      end generate center;
    end generate links_n;
  end generate links_m;

end struct;
