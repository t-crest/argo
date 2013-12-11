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
-- Author: Rasmus Bo Soerensen (rasmus@rbscloud.dk)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.config.all;
use work.ocp.all;
use work.noc_defs.all;
use work.noc_interface.all;


entity noc is
port (
	clk			: in std_logic;
	reset		: in std_logic;

	ocp_io_ms	: in ocp_io_m_a;
	ocp_io_ss	: out ocp_io_s_a;

	spm_ports_m	: out spm_masters;
	spm_ports_s	: in spm_slaves

);

end noc;

architecture struct of noc is

------------------------------component declarations----------------------------

component noc_node is
port (
	p_clk		: in std_logic;
	n_clk		: in std_logic;
	reset		: in std_logic;

	proc_m		: in ocp_io_m;
	proc_s	    : out ocp_io_s;

	spm_m		: out spm_master;
	spm_s		: in spm_slave;

	inNorth		: in link_t;
	inSouth		: in link_t;
	inEast		: in link_t;
	inWest		: in link_t;

	outNorth	: out link_t;
	outSouth	: out link_t;
	outEast		: out link_t;
	outWest		: out link_t

);

end component;

------------------------------signal declarations----------------------------

type link_n is array(0 to (N - 1)) of link_t;
type link_m is array(0 to (M - 1)) of link_n;

signal north_in  : link_m;
signal east_in   : link_m;
signal south_in  : link_m;
signal west_in   : link_m;
signal north_out : link_m;
signal east_out  : link_m;
signal south_out : link_m;
signal west_out  : link_m;


begin

	nodes_m : for i in 0 to M-1 generate
		nodes_n : for j in 0 to N-1 generate
			node : noc_node
			port map (
				p_clk => clk,
				n_clk => clk,
				reset => reset,

				proc_m => ocp_io_ms((i*N)+j),
				proc_s => ocp_io_ss((i*N)+j),

				spm_m => spm_ports_m((i*N)+j),
				spm_s => spm_ports_s((i*N)+j),

				inNorth => north_in(i)(j),
				inSouth => south_in(i)(j),
				inEast => east_in(i)(j),
				inWest => west_in(i)(j),

				outNorth => north_out(i)(j),
				outSouth => south_out(i)(j),
				outEast => east_out(i)(j),
				outWest	=> west_out(i)(j)
			);

		end generate nodes_n;
	end generate nodes_m;

	links_m : for i in 0 to M-1 generate
		links_n : for j in 0 to N-1 generate
			top : if (i = 0) generate
				north_in(i)(j) <= south_out(M-1)(j);
				south_in(M-1)(j) <= north_out(i)(j);
      			end generate top;
			left : if (j = 0) generate
			        west_in(i)(j) <= east_out(i)(N-1);
			        east_in(i)(N-1) <= west_out(i)(j);
			end generate left;
			bottom : if (i = (M-1) and j < (N-1)) generate
        			east_in(i)(j) <= west_out(i)(j+1);
				west_in(i)(j+1) <= east_out(i)(j);
     			end generate bottom;
			right : if (i < (M-1) and j = (N-1)) generate
			        south_in(i)(j) <= north_out(i+1)(j);
			        north_in(i+1)(j) <= south_out(i)(j);
      			end generate right;
			center : if (i < (M-1) and j < (N-1)) generate
				north_in(i+1)(j) <= south_out(i)(j);
				south_in(i)(j) <= north_out(i+1)(j);
				west_in(i)(j+1) <= east_out(i)(j);
				east_in(i)(j) <= west_out(i)(j+1);
			end generate center;
		end generate links_n;
	end generate links_m;

end struct;
