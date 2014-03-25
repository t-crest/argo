-- -----------------------------------------------------------------------------
--  4-phase bundled-data latch
--             
--  Developer  :  Mikkel Stensgaard  -- mikkel@stensgaard.org
--                Student: s001434
--                DTU, Technical University of Denmark
--              
--  Initial:      Intitial work by
--                   Knud Hansen  -- s020922@student.dtu.dk
--                   Guillaume Saoutieff  -- s021368@student.dtu.dk
--
--  Notes      :  The latch is actually an edge-triggered flip-flop
--                for FPGA implementation, it does not consume more resources
--
--  Revision   :  1.0    18 June 2004     Initial version--             :
--	Updated: 23.11.2013 - DRH, made two phase
--	Updated: 23.01.2014 - IK, removed width, converted reset_value to std_logic_vector and used its length to define width
-- -----------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
use work.noc_defs.all;

use work.AS_FPGA.all;

entity AS_bd_2p_Latch_ud is
-- IK
  --generic (width        : positive := 8;
           --reset_value  : natural := 0);
  generic (reset_value  : std_logic_vector);
  port    (lt_en:  in  std_logic;
           dat_in:  in  std_logic_vector((reset_value'length-1) downto 0);
           reset:   in  std_logic;
           dat_out: out std_logic_vector((reset_value'length-1) downto 0));
end entity;

-- -----------------------------------------------------------------------------


ARCHITECTURE rtl OF AS_bd_2p_Latch_ud IS


begin

  
latching_process: process(dat_in, lt_en, reset)
begin
   if reset='1' then
      dat_out <= reset_value;
   elsif lt_en = '1' then
      dat_out <= transport dat_in after delay; 
   end if;
end process Latching_Process;
end rtl; --architecture
