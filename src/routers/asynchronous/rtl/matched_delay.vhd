library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.config.all;

entity matched_delay is
   Generic(size :integer := 10);
   Port ( 
      d : in std_logic;
      z : out std_logic);
end entity;

architecture RTL of matched_delay is

signal internal : std_logic;

begin
    internal <= not d;
    z <= transport (not internal) after delay*size;
end architecture RTL;
