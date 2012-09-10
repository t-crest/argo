library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.defs.all;


entity test_noc2x2 is
end test_noc2x2;


architecture behav of test_noc2x2 is

-----------------------component declarations------------------------------
component noc is
port (
	p_clk		: in std_logic;
	n_clk		: in std_logic;
	reset		: in std_logic;

	p_ports_in	: in procMasters;
	p_ports_out	: out procSlaves;

	spm_ports_in	: in spmMasters;
	spm_ports_out	: out spmSlaves

);
end component;

-------------------------signal declarations-------------------------------
signal n_clk		: std_logic := '1';
signal p_clk		: std_logic := '1';
signal reset		: std_logic := '1';

signal p_masters	: procMasters;
signal p_slaves		: procSlaves;
signal spm_masters	: spmMasters;
signal spm_slaves	: spmSlaves;

begin

noc2x2 : noc
port map (
	p_clk => p_clk,
	n_clk => n_clk,
	reset => reset,

	p_ports_in => p_masters,
	p_ports_out => p_slaves,

	spm_ports_in => spm_masters,
	spm_ports_out => spm_slaves
);


--na clock 
process
begin
	wait for NA_HPERIOD;
	n_clk <= not n_clk;
end process;

--proc clock 
process
begin
	wait for P_HPERIOD;
	p_clk <= not p_clk;
end process;

--reset
process
begin
	wait for 13 ns;
	reset <= '0';
	wait;
end process;

--sim
process begin

--initialization
	for i in 0 to N-1 loop
		for j in 0 to N-1 loop
			p_masters(i)(j).MCmd  <= (others=>'0');
			p_masters(i)(j).MAddr <= (others=>'0');
			p_masters(i)(j).MData <= (others=>'0');

			spm_masters(i)(j).MCmd  <= (others=>'0');
			spm_masters(i)(j).MAddr <= (others=>'0');
			spm_masters(i)(j).MData <= (others=>'0');
		end loop;
	end loop;

--initialize spm
--initialize slot table
	wait for 43 ns; --1
	-- ST(0) <= v0
	p_masters(0)(0).MCmd <="11";
	p_masters(0)(0).MAddr <= ST_MASK & x"000000";
	p_masters(0)(0).MData <= x"00000004";

	spm_masters(0)(0).MCmd <="11";
	spm_masters(0)(0).MAddr <= (others=>'0');
	spm_masters(0)(0).MData <= x"0001000200030004";

	wait for 10 ns; --2
	-- ST(1) <= v1
	p_masters(0)(0).MAddr <= ST_MASK & x"000001";
	p_masters(0)(0).MData <= x"00000005";

	spm_masters(0)(0).MAddr <= x"00000001";
	spm_masters(0)(0).MData <= x"0005000600070008";

	wait for 10 ns; --3
	-- ST(2) <= v2
	p_masters(0)(0).MAddr <= ST_MASK & x"000002";
	p_masters(0)(0).MData <= x"00000006";

	spm_masters(0)(0).MAddr <= x"00000002";
	spm_masters(0)(0).MData <= x"0009000a000b000c";

	wait for 10 ns; --1
	-- ST(3) <= v0
	p_masters(0)(0).MAddr <= ST_MASK & x"000003";
	p_masters(0)(0).MData <= x"00000004";

	spm_masters(0)(0).MAddr <= x"00000003";
	spm_masters(0)(0).MData <= x"000d000e000f0010";

	wait for 10 ns; --2
	-- ST(4) <= v1
	p_masters(0)(0).MAddr <= ST_MASK & x"000004";
	p_masters(0)(0).MData <= x"00000005";

	spm_masters(0)(0).MAddr <= x"00000004";
	spm_masters(0)(0).MData <= x"0011001200130014";

	wait for 10 ns; --3
	-- ST(5) <= v0
	p_masters(0)(0).MAddr <= ST_MASK & x"000005";
	p_masters(0)(0).MData <= x"00000004";

	spm_masters(0)(0).MAddr <= x"00000005";
	spm_masters(0)(0).MData <= x"0015001600170018";

	wait for 10 ns; --1
	-- ST(6) <= v1
	p_masters(0)(0).MAddr <= ST_MASK & x"000006";
	p_masters(0)(0).MData <= x"00000005";

	spm_masters(0)(0).MAddr <= x"00000006";
	spm_masters(0)(0).MData <= x"0019001a001b001c";

	wait for 10 ns; --2
	-- ST(7) <= v0
	p_masters(0)(0).MAddr <= ST_MASK & x"000007";
	p_masters(0)(0).MData <= x"00000004";

	spm_masters(0)(0).MAddr <= x"00000007";
	spm_masters(0)(0).MData <= x"001d001e001f0020";

	wait for 10 ns; --3
	p_masters(0)(0).MCmd <= (others=>'0');
	p_masters(0)(0).MAddr <= ST_MASK & x"000000";

	spm_masters(0)(0).MCmd <= "00";
	spm_masters(0)(0).MAddr <= (others=>'0');

--initialize routes
	wait for 10 ns; --1
	p_masters(0)(0).MCmd <="11";
	p_masters(0)(0).MAddr <= DMA_P_MASK & x"000000";
	p_masters(0)(0).MData <= x"0000001c";
	
	wait for 10 ns; --2
	p_masters(0)(0).MAddr <= DMA_P_MASK & x"000001";
	p_masters(0)(0).MData <= x"0000000d";


	wait for 10 ns; --3
	p_masters(0)(0).MCmd <= (others=>'0');
	p_masters(0)(0).MAddr <= (others=>'0');

--initialize dmas
	wait for 10 ns; --1
	p_masters(0)(0).MCmd <= "11";
	p_masters(0)(0).MAddr <= DMA_MASK & x"000001";
	p_masters(0)(0).MData <= x"00000000";

	wait for 10 ns; --2
	p_masters(0)(0).MAddr <= DMA_MASK & x"000000";
	p_masters(0)(0).MData <= x"00008004";

	wait for 10 ns; --3
	p_masters(0)(0).MCmd <= (others=>'0');
	p_masters(0)(0).MAddr <= (others=>'0');

	wait for 10 ns; --1
	p_masters(0)(0).MCmd <= "11";
	p_masters(0)(0).MAddr <= DMA_MASK & x"000003";
	p_masters(0)(0).MData <= x"00020008";

	wait for 10 ns; --2
	p_masters(0)(0).MAddr <= DMA_MASK & x"000002";
	p_masters(0)(0).MData <= x"00008002";

	wait for 10 ns; --3
	p_masters(0)(0).MCmd <= (others=>'0');
	p_masters(0)(0).MAddr <= (others=>'0');

-- read transaction from proc in remote spm	
	wait for 370 ns; --1
	spm_masters(1)(1).MCmd <= "00";
	spm_masters(1)(1).MAddr <= x"00000000";
	spm_masters(0)(1).MAddr <= x"00000007";

	wait for 10 ns; --2
	spm_masters(1)(1).MAddr <= x"00000001";
	spm_masters(0)(1).MAddr <= x"00000008";

	wait for 10 ns; --3
	spm_masters(1)(1).MAddr <= x"00000002";
	spm_masters(0)(1).MAddr <= x"00000009";

	wait for 10 ns; --1
	spm_masters(1)(1).MAddr <= x"00000003";
	spm_masters(0)(1).MAddr <= x"0000000a";

	wait for 10 ns; --2
	spm_masters(1)(1).MAddr <= x"00000004";
	spm_masters(0)(1).MAddr <= x"00000000";




	wait for 800 ns;


end process;

end behav;

