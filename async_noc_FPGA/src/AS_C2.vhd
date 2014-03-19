--  Developer  :  Mikkel Stensgaard  -- mikkel@stensgaard.org
--                Student: s001434
--                DTU, Technical University of Denmark

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

LIBRARY UNISIM;
USE UNISIM.Vcomponents.all;

entity AS_C2 is
   Generic(reset_value : bit := '0');
   Port ( 
      in1:    in  std_logic;
      in2:    in  std_logic;
      reset:  in  std_logic;
      z:      out std_logic);
end entity;

-- ----------------------------------------------------------------------------
-- the logical equation defining the C element is:
-- out_MC = reset AND ((ina AND inb) OR (out_MC AND (in_a OR in_b)))

architecture LUT of AS_C2 is

-----------------------
-- XILINX COMPONENTS --
-----------------------
-- 4-Bit Look-Up-Table with Local Output 
component LUT4_L 
  generic (INIT : bit_vector(15 downto 0));
    port (
    I0 : in  std_ulogic;
    I1 : in  std_ulogic;
    I2 : in  std_ulogic;  
    I3 : in  std_ulogic;
    lO : out std_ulogic);
end component;

-- Constant using the generic "reset_value"
constant rv : bit := reset_value;
constant reset_vector : bit_vector(7 downto 0) := rv&rv&rv&rv&rv&rv&rv&rv;

signal s_out : std_logic;

begin

C_element: LUT4_L
  generic map (INIT => "11101000"&reset_vector) 
  port map (I0 => in1, I1 => in2, I2 => s_out, I3 => reset, LO => s_out);
  
--------------
-- Connect the outputs to the correct signals  
--------------
  z <= s_out;
end architecture; --LUT