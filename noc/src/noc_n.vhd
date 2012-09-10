-- bi-torus topology NxN

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.defs.all;


entity noc is

port (
	p_clk		: in std_logic;
	n_clk		: in std_logic;
	reset		: in std_logic;

	p_ports_in	: in procMasters;
	p_ports_out	: out procSlaves;

	spm_ports_in	: in spmMasters;
	spm_ports_out	: out spmSlaves

);

end noc;

architecture struct of noc is

------------------------------component declarations----------------------------

component noc_node is
port (
	p_clk		: in std_logic;
	n_clk		: in std_logic;
	reset		: in std_logic;

	proc_in		: in ocp_master;
	proc_out	: out ocp_slave;
 
	spm_in		: in ocp_master_spm;
	spm_out		: out ocp_slave_spm;

	inNorth		: in network_link;
	inSouth		: in network_link;
	inEast		: in network_link;
	inWest		: in network_link;

	outNorth	: out network_link;
	outSouth	: out network_link;
	outEast		: out network_link;
	outWest		: out network_link

);

end component;

------------------------------signal declarations----------------------------

type link_n is array(0 to (N - 1)) of network_link;
type link_m is array(0 to (N - 1)) of link_n;

signal north_in  : link_m;
signal east_in   : link_m;
signal south_in  : link_m;
signal west_in   : link_m;
signal north_out : link_m;
signal east_out  : link_m;
signal south_out : link_m;
signal west_out  : link_m;


begin

	nodes_m : for i in N-1 downto 0 generate
		nodes_n : for j in N-1 downto 0 generate
			node : noc_node
			port map (
				p_clk => p_clk,
				n_clk => n_clk,
				reset => reset,

				proc_in => p_ports_in(i)(j),
				proc_out => p_ports_out(i)(j),

				spm_in => spm_ports_in(i)(j),
				spm_out => spm_ports_out(i)(j),
				
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

	links_m : for i in 0 to N-1 generate
		links_n : for j in 0 to N-1 generate
			top : if (i = 0) generate
				north_in(i)(j) <= south_out(N-1)(j);
				south_in(N-1)(j) <= north_out(i)(j);
      			end generate top;
			left : if (j = 0) generate
			        west_in(i)(j) <= east_out(i)(N-1);
			        east_in(i)(N-1) <= west_out(i)(j);
			end generate left;
			bottom : if (i = (N-1) and j < (N-1)) generate
        			east_in(i)(j) <= west_out(i)(j+1);
				west_in(i)(j+1) <= east_out(i)(j);
     			end generate bottom;
			right : if (i < (N-1) and j = (N-1)) generate
			        south_in(i)(j) <= north_out(i+1)(j);
			        north_in(i+1)(j) <= south_out(i)(j);
      			end generate right;
			center : if (i < (N-1) and j < (N-1)) generate
				north_in(i+1)(j) <= south_out(i)(j);
				south_in(i)(j) <= north_out(i+1)(j);
				west_in(i)(j+1) <= east_out(i)(j);
				east_in(i)(j) <= west_out(i)(j+1);
			end generate center;
		end generate links_n;
	end generate links_m;

end struct;
