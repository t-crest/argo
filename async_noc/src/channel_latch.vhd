library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.defs.all;


entity channel_latch is
	generic (
		constant init_token : latch_state;
		constant init_data : phit_t := (others => 'X')	-- Forced unknown
	);
	port (
		preset    : in std_logic;
		left_in   : in channel_forward;
		left_out  : out channel_backward;
		right_out : out channel_forward;
		right_in  : in channel_backward;
                lt_enable : out std_logic
	);
end channel_latch;


architecture struct of channel_latch is
	signal lt_en : std_logic;		-- Latch enable
	signal data  : phit_t;
        signal type_in : std_logic;
        signal type_out : std_logic;
        signal lt_gated : std_logic;
begin
        type_in <= left_in.data(PHIT_WIDTH);
  	lt_gated <= lt_en or (not type_out) after delay;
        lt_enable <= lt_en;
                     
	right_out.data <= type_out & data;
	
	controller : entity work.latch_controller(mousetrap)
	generic map(
		init_token => init_token
	)
	port map(
		preset => preset,
		Rin  => left_in.req,
		Ain  => left_out.ack,
		
		Rout => right_out.req,
		Aout => right_in.ack,

		lt_en => lt_en
	);
	
	-- Normal transparent latch, cf. figure 6.21 in S&F
	type_latch: process(left_in, lt_en, preset)
	begin
		if (lt_en = '1') then
                  type_out <= transport type_in after delay;
                  --data <= transport left_in.data(33 downto 0) after delay;
		end if;

		if (preset = '1') then
                  type_out <= '0';
                  --data <= init_data;	-- Preset overrides the above

		end if;
	end process type_latch;

        
        data_latch: process(left_in, lt_gated, preset)
        begin
          if (lt_gated = '1') then
            data <= transport left_in.data(PHIT_WIDTH-1 downto 0) after delay; -- Transparent
          end if;
          
          if (preset = '1') then
            data <= init_data;	-- Preset overrides the above
          end if;

        end process data_latch;

end struct;

