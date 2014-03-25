--  Developer  :  Mikkel Stensgaard  -- mikkel@stensgaard.org
--                Student: s001434
--                DTU, Technical University of Denmark

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.noc_defs.all;

LIBRARY UNISIM;
USE UNISIM.Vcomponents.lut2;

entity AS_Delay is
   Generic(size :natural := 10);
   Port ( 
      d : in std_logic;
      z : out std_logic);
end entity;

architecture LUT of AS_Delay is

-----------------------
-- XILINX COMPONENTS --
-----------------------
-- 2-Bit Look-Up-Table with Global Output 
component LUT2
  generic (INIT : bit_vector(3 downto 0));
    port (
    I0 : in  std_ulogic;
    I1 : in  std_ulogic;
    O : out std_ulogic);
end component;

signal s_connect : std_logic_vector(size downto 0);

attribute KEEP: string;
attribute KEEP of s_connect : signal is "true";

begin

    lut_array: for index in 0 to (size-1) generate
    begin
        delay_lut: LUT2
            --generic map (INIT => "1000") --And
            --generic map (INIT => "0101") --Not (2-phase)
            --port map (I1 => d, I0 => s_connect(index), O => s_connect(index+1));
            generic map (INIT => "1000") --And
            port map (I1 => s_connect(index), I0 => s_connect(index), O => s_connect(index+1));
    end generate lut_array;

    -- Connect input and output of delay element
    s_connect(0) <= d;
    z <= transport s_connect(size) after delay*size;
end architecture;
