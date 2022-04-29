----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 04/29/2022 02:45:21 PM
-- Design Name:
-- Module Name: tb_router - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
--use work.noc_defs.all;
use work.argo_types.all;
use work.noc_interface.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_router is
  --  Port ( );
end tb_router;

architecture Behavioral of tb_router is

  signal clk, reset : std_logic;
  signal inPort_f, outPort_f : router_port_f;
  signal inPort_b, outPort_b : router_port_b;

  component router is
    port (
      clk : in std_logic;
      reset : in std_logic;
      inPort_f : in router_port_f;
      inPort_b : out router_port_b;
      outPort_f : out router_port_f;
      outPort_b : in router_port_b
    );
  end component router;
begin

  dut : router port map(
    clk => clk, reset => reset,
    inPort_f => inPort_f,
    outPort_f => outPort_f,
    inPort_b => inPort_b,
    outPort_b => outPort_b
  );
  reset <= '1' after 0 ns, '0' after 60 ns;

  process
  begin
    for i in 4 downto 0 loop

      inPort_f(i).data <= "11000111111111111111111111111111100";
      wait for 60 ns;
      inPort_f(i).data <= "10000111111111111111111111111111100";
      wait for 60 ns;
      inPort_f(i).data <= "10000111111111111111111111111110000";
      wait for 60 ns;
      inPort_f(i).data <= "10000111111111111111111111111000000";
      wait for 60 ns;
      inPort_f(i).data <= "10000111111111111111111111100000000";
      wait for 60 ns;
      inPort_f(i).data <= "10100111111111111111111110000000000";
      wait for 60 ns;
      inPort_f(i).data <= "00000000000000000000000000000000000";
      wait for 60 ns;

    end loop;

    for i in 0 to 4 loop
      inPort_f(i).data <= "11000111111111111111111111111111101";
      wait for 60 ns;
      inPort_f(i).data <= "10000111111111111111111111111111101";
      wait for 60 ns;
      inPort_f(i).data <= "10000111111111111111111111111110001";
      wait for 60 ns;
      inPort_f(i).data <= "10000111111111111111111111111000001";
      wait for 60 ns;
      inPort_f(i).data <= "10000111111111111111111111100000001";
      wait for 60 ns;
      inPort_f(i).data <= "10100111111111111111111110000000001";
      wait for 60 ns;
      inPort_f(i).data <= "00000000000000000000000000000000000";
      wait for 60 ns;

    end loop;

    for i in 0 to 4 loop

      inPort_f(i).data <= "11000111111111111111111111111111110";
      wait for 60 ns;
      inPort_f(i).data <= "10000111111111111111111111111111110";
      wait for 60 ns;
      inPort_f(i).data <= "10000111111111111111111111111110010";
      wait for 60 ns;
      inPort_f(i).data <= "10000111111111111111111111111000010";
      wait for 60 ns;
      inPort_f(i).data <= "10000111111111111111111111100000010";
      wait for 60 ns;
      inPort_f(i).data <= "10100111111111111111111110000000010";
      wait for 60 ns;
      inPort_f(i).data <= "00000000000000000000000000000000000";
      wait for 60 ns;

    end loop;

    for i in 0 to 4 loop

      inPort_f(i).data <= "11000111111111111111111111111111111";
      wait for 60 ns;
      inPort_f(i).data <= "10000111111111111111111111111111111";
      wait for 60 ns;
      inPort_f(i).data <= "10000111111111111111111111111110011";
      wait for 60 ns;
      inPort_f(i).data <= "10000111111111111111111111111000011";
      wait for 60 ns;
      inPort_f(i).data <= "10000111111111111111111111100000011";
      wait for 60 ns;
      inPort_f(i).data <= "10100111111111111111111110000000011";
      wait for 60 ns;
      inPort_f(i).data <= "00000000000000000000000000000000000";
      wait for 60 ns;

    end loop;

    for i in 0 to 4 loop

      inPort_f(i).data <= "11001111111111111111111111111111100";
      wait for 60 ns;
      inPort_f(i).data <= "10001111111111111111111111111111100";
      wait for 60 ns;
      inPort_f(i).data <= "10001111111111111111111111111110000";
      wait for 60 ns;
      inPort_f(i).data <= "10001111111111111111111111111000000";
      wait for 60 ns;
      inPort_f(i).data <= "10001111111111111111111111100000000";
      wait for 60 ns;
      inPort_f(i).data <= "10101111111111111111111110000000000";
      wait for 60 ns;
      inPort_f(i).data <= "00000000000000000000000000000000000";
      wait for 60 ns;

    end loop;

    for i in 0 to 4 loop

      inPort_f(i).data <= "11001111111111111111111111111111101";
      wait for 60 ns;
      inPort_f(i).data <= "10001111111111111111111111111111101";
      wait for 60 ns;
      inPort_f(i).data <= "10001111111111111111111111111110001";
      wait for 60 ns;
      inPort_f(i).data <= "10001111111111111111111111111000001";
      wait for 60 ns;
      inPort_f(i).data <= "10001111111111111111111111100000001";
      wait for 60 ns;
      inPort_f(i).data <= "10101111111111111111111110000000001";
      wait for 60 ns;
      inPort_f(i).data <= "00000000000000000000000000000000000";
      wait for 60 ns;

    end loop;

    for i in 0 to 4 loop

      inPort_f(i).data <= "11001111111111111111111111111111110";
      wait for 60 ns;
      inPort_f(i).data <= "10001111111111111111111111111111110";
      wait for 60 ns;
      inPort_f(i).data <= "10001111111111111111111111111110010";
      wait for 60 ns;
      inPort_f(i).data <= "10001111111111111111111111111000010";
      wait for 60 ns;
      inPort_f(i).data <= "10001111111111111111111111100000010";
      wait for 60 ns;
      inPort_f(i).data <= "10101111111111111111111110000000010";
      wait for 60 ns;
      inPort_f(i).data <= "00000000000000000000000000000000000";
      wait for 60 ns;

    end loop;

    for i in 0 to 4 loop

      inPort_f(i).data <= "11001111111111111111111111111111111";
      wait for 60 ns;
      inPort_f(i).data <= "10001111111111111111111111111111111";
      wait for 60 ns;
      inPort_f(i).data <= "10001111111111111111111111111110011";
      wait for 60 ns;
      inPort_f(i).data <= "10001111111111111111111111111000011";
      wait for 60 ns;
      inPort_f(i).data <= "10001111111111111111111111100000011";
      wait for 60 ns;
      inPort_f(i).data <= "10101111111111111111111110000000011";
      wait for 60 ns;
      inPort_f(i).data <= "00000000000000000000000000000000000";
      wait for 60 ns;

    end loop;

    for i in 0 to 4 loop

      inPort_f(i).data <= "11011111111111111111111111111111100";
      wait for 60 ns;
      inPort_f(i).data <= "10011111111111111111111111111111100";
      wait for 60 ns;
      inPort_f(i).data <= "10011111111111111111111111111110000";
      wait for 60 ns;
      inPort_f(i).data <= "10011111111111111111111111111000000";
      wait for 60 ns;
      inPort_f(i).data <= "10011111111111111111111111100000000";
      wait for 60 ns;
      inPort_f(i).data <= "10111111111111111111111110000000000";
      wait for 60 ns;
      inPort_f(i).data <= "00000000000000000000000000000000000";
      wait for 60 ns;

    end loop;

    for i in 0 to 4 loop

      inPort_f(i).data <= "11011111111111111111111111111111101";
      wait for 60 ns;
      inPort_f(i).data <= "10011111111111111111111111111111101";
      wait for 60 ns;
      inPort_f(i).data <= "10011111111111111111111111111110001";
      wait for 60 ns;
      inPort_f(i).data <= "10011111111111111111111111111000001";
      wait for 60 ns;
      inPort_f(i).data <= "10011111111111111111111111100000001";
      wait for 60 ns;
      inPort_f(i).data <= "10111111111111111111111110000000001";
      wait for 60 ns;
      inPort_f(i).data <= "00000000000000000000000000000000000";
      wait for 60 ns;

    end loop;

    for i in 0 to 4 loop

      inPort_f(i).data <= "11011111111111111111111111111111110";
      wait for 60 ns;
      inPort_f(i).data <= "10011111111111111111111111111111110";
      wait for 60 ns;
      inPort_f(i).data <= "10011111111111111111111111111110010";
      wait for 60 ns;
      inPort_f(i).data <= "10011111111111111111111111111000010";
      wait for 60 ns;
      inPort_f(i).data <= "10011111111111111111111111100000010";
      wait for 60 ns;
      inPort_f(i).data <= "10111111111111111111111110000000010";
      wait for 60 ns;
      inPort_f(i).data <= "00000000000000000000000000000000000";
      wait for 60 ns;

    end loop;

    for i in 0 to 4 loop

      inPort_f(i).data <= "11011111111111111111111111111111111";
      wait for 60 ns;
      inPort_f(i).data <= "10011111111111111111111111111111111";
      wait for 60 ns;
      inPort_f(i).data <= "10011111111111111111111111111110011";
      wait for 60 ns;
      inPort_f(i).data <= "10011111111111111111111111111000011";
      wait for 60 ns;
      inPort_f(i).data <= "10011111111111111111111111100000011";
      wait for 60 ns;
      inPort_f(i).data <= "10111111111111111111111110000000011";
      wait for 60 ns;
      inPort_f(i).data <= "00000000000000000000000000000000000";
      wait for 60 ns;

    end loop;
  end process;

  process
  begin
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
  end process;

end Behavioral;