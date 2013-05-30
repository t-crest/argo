library ieee;
use ieee.std_logic_1164.all;
use work.defs.all;


entity hpu_comb is
	generic (
		constant is_ni : boolean := false;
		constant this_port : std_logic_vector(1 downto 0) := "01"
	);
	port (
		data_valid : in std_logic;
		data_in    : in link_t;
                preset     : in std_logic;

		data_out   : out link_t;		
		sel        : out onehot_sel
	);
end hpu_comb;


architecture struct of hpu_comb is
	signal sel_internal : onehot_sel;
	signal SOP : std_logic;
        signal EOP : std_logic;
	signal VLD : std_logic;	
begin
	-- Start of packet(SOP) and End of packet(EOP) are not very good names for the signals.
	-- SOP is high when ever there is a phit and EOP is high when the phit is the Start of a packet
  -- VLD bit shows type of the phit (phit or void)
  -- SOP high on start of packet, EOP high on end of packet
	VLD <= data_in(PHIT_WIDTH);
	SOP <= data_in(PHIT_WIDTH-1);
        EOP <= data_in(PHIT_WIDTH-2);


	one_hot_decoder: block
		signal dest_port : std_logic_vector(1 downto 0);
	begin
		dest_port <= data_in(1 downto 0);

		gen_not_ni: if is_ni = false generate
			sel_internal <= "10000"	when dest_port = this_port else		-- 4: NI
							"00001" when dest_port = "00" else			-- 0: North
							"00010" when dest_port = "01" else			-- 1: East
							"00100" when dest_port = "10" else			-- 2: South
							"01000"; -- when dest_port = "11" else		-- 3: West
		end generate gen_not_ni;

		gen_is_ni: if is_ni = true generate			
			sel_internal <= "00001" when dest_port = "00" else			-- 0: North
							"00010" when dest_port = "01" else			-- 1: East
							"00100" when dest_port = "10" else			-- 2: South
							"01000"; -- when dest_port = "11" else		-- 3: West
		end generate gen_is_ni;
	end block one_hot_decoder;
	
	
	sel_latch:process (data_valid, VLD, sel_internal, SOP) is
	begin
                if preset='1' then
                  sel <= (others=>'0');
		-- We must only open the latch when data are valid.
		elsif (data_valid = '1') then
			if (VLD = '1' and SOP = '1') then
				sel <= sel_internal;
			elsif (VLD = '0') then	--  and EOP = '0'
				-- This is an empty space, but other incoming phits may not be.
				sel <= (others => '0');	
			end if;
		end if;
	end process sel_latch;
	
	
	shift:process (data_in, VLD, SOP) is
	begin
		if (VLD = '1' and SOP = '1') then
			-- This is the header phit, so we shift the addr so the next switch knows where to route the packet.
			-- This allows one-hot decoding logic to always be driven by bottom 2 LSb's.
			data_out <= (others => '0');
                        data_out(31 downto 16) <= data_in(31 downto 16);
			data_out(13 downto 0) <= data_in(15 downto 2); -- right shift by 2 bits
			data_out(PHIT_WIDTH) <= VLD;
			data_out(PHIT_WIDTH-1) <= SOP;			
			data_out(PHIT_WIDTH-2) <= EOP;			
		else
			-- Not header. Must be one of {body, end-body, empty space}
			data_out <= data_in;	-- Pass through unaltered
		end if;		
	end process shift;
	
	
end architecture struct;





