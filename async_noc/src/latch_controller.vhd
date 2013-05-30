library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.defs.all;

--				  ____________
--      Rin ---> | Latch      | ---> Rout
--      Ain <--- | controller | <--- Aout
--		         _____________
--								Modified figure 6.21 in S&F (Aout/Ain reversed)
entity latch_controller is
	generic (
		constant init_token : latch_state
	);
	port (
		preset : in std_logic;
		Rin  : in std_logic;
		Ain  : out std_logic;

		Rout : out std_logic;
		Aout : in std_logic;
		
		lt_en   : out std_logic	-- Latch enable
	);
end latch_controller;


-- Simple latch controller; cf. figure 2.9 in S&F
architecture mousetrap of latch_controller is
  signal r_next : std_logic;
  signal enable : std_logic;

begin

  Rout <= r_next;
  enable <= transport r_next xnor Aout after delay;
  Ain   <= r_next;
  lt_en <= enable;
  

	
  req_latch : process(Rin, enable, preset)
    begin
      if preset = '1' then
        r_next <= resolve_latch_state(init_token);
      elsif enable = '1' then
        r_next <= transport Rin after delay;
      end if;

    end process req_latch;
      
end mousetrap;
