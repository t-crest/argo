--
-- Copyright Technical University of Denmark. All rights reserved.
-- This file is part of the T-CREST project.
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
--    1. Redistributions of source code must retain the above copyright notice,
--       this list of conditions and the following disclaimer.
--
--    2. Redistributions in binary form must reproduce the above copyright
--       notice, this list of conditions and the following disclaimer in the
--       documentation and/or other materials provided with the distribution.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER ``AS IS'' AND ANY EXPRESS
-- OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
-- OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN
-- NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY
-- DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
-- LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
-- THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--
-- The views and conclusions contained in the software and documentation are
-- those of the authors and should not be interpreted as representing official
-- policies, either expressed or implied, of the copyright holder.
--


--------------------------------------------------------------------------------
-- Argo 2.0 RX pipeline unit
--
-- Author: Luca Pezzarossa (lpez@dtu.dk)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.argo_types.all;
use work.ocp.all;

entity rx_unit is
	port(
		clk                 : in  std_logic;
		reset               : in  std_logic;
		-- To the SPM
		spm                 : out mem_if_master;
		-- To the internal MEM bus
		config 				: out conf_if_master;
		-- To the IRQ fifo
		irq_fifo_data       : out irq_data_t;
		irq_fifo_data_valid : out std_logic;
		irq_fifo_irq_valid : out std_logic;
		-- To the routers
		pkt_in              : in  link_t
	);
end rx_unit;

architecture rtl of rx_unit is
	signal new_pkt, new_data_pkt, new_config_pkt, new_irq_pkt: std_logic;
	signal wdata_high_en, wdata_low_en, addr_load, addr_cnt1_en, addr_cnt2_en,  lst_data_pkt : std_logic;
	signal addr : unsigned(HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH - 1 downto 0);

signal wdata_high : unsigned(WORD_WIDTH - 1 downto 0);


	type state_type is (IDLE, DATA_W_LOW, DATA_W_HIGH, CONFIG_W_LOW, CONFIG_W_HIGH, IRQ_W);
	signal state, next_state : state_type;

begin
	--The signal new_pkt is high when a new data packet is incoming in the pkt_in port
	new_pkt <= pkt_in(LINK_WIDTH - 1) and pkt_in(LINK_WIDTH - 2) and (not pkt_in(LINK_WIDTH - 3));

	--The signal new_data_pkt is high when a new data packet is incoming in the pkt_in port
	new_data_pkt <= new_pkt and (not pkt_in(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 2));

	--The signal new_config_pkt is high when a new configration packet is incoming in the pkt_in port
	new_config_pkt <= new_pkt and not(pkt_in(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 1)) and pkt_in(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 2);

	--The signal new_irq_pkt is high when a new irq packet is incoming in the pkt_in port
	new_irq_pkt <= new_pkt and pkt_in(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 1) and pkt_in(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 2);

	--SPM and config output assignments
 	spm.wdata(WORD_WIDTH - 1 downto 0) <= unsigned(pkt_in(WORD_WIDTH - 1 downto 0));
 	
 	config.wdata(WORD_WIDTH - 1 downto 0) <= unsigned(pkt_in(WORD_WIDTH - 1 downto 0));
 	
	spm.addr <= addr;
	config.addr <= addr;
	irq_fifo_data <= addr;

	--Signal irq_fifo_data_valid assignment, the IRQ FIFO push is delayed in order to happen with the last spm wr/en
	irq_fifo_data_valid <= lst_data_pkt and pkt_in(LINK_WIDTH - 3); 

	--Control Moore FSM		
	process(state, new_config_pkt, new_data_pkt, new_irq_pkt, pkt_in)
	begin
		spm.wdata(2 * WORD_WIDTH - 1 downto WORD_WIDTH) <= wdata_high;
		next_state    <= state;
		addr_load     <= '0';
		wdata_low_en  <= '0';
		wdata_high_en <= '0';
		addr_cnt1_en  <= '0';
		addr_cnt2_en  <= '0';
		spm.en        <= (others => '0');
		spm.wr        <= '0';
		config.en     <= '0';
		config.wr     <= '0';
		irq_fifo_irq_valid <= '0';
		case state is
			when IDLE =>
				addr_load <= '1';
				if (new_data_pkt = '1') then
					next_state <= DATA_W_HIGH;
				elsif(new_config_pkt = '1')then
					next_state <= CONFIG_W_HIGH;
				elsif(new_irq_pkt = '1')then
					next_state <= IRQ_W;
				end if;
		--Data pkt manager		
			when DATA_W_HIGH =>
				if (pkt_in(LINK_WIDTH - 3) = '0') then
					wdata_high_en <= '1';
					next_state    <= DATA_W_LOW;
				else	
					spm.en(0)     <= '1';
					spm.wr        <= '1';
					spm.wdata(2 * WORD_WIDTH - 1 downto WORD_WIDTH) <= unsigned(pkt_in(WORD_WIDTH - 1 downto 0));
					next_state <= IDLE;
				end if;

			when DATA_W_LOW =>
				spm.en        <= "11";
				spm.wr        <= '1';

				if (pkt_in(LINK_WIDTH - 3) = '0') then
					addr_cnt2_en   <= '1';
					next_state <= DATA_W_HIGH;
				else
					next_state <= IDLE;
				end if;
				
		   --Config pkt manager
			when CONFIG_W_HIGH =>
				config.en        <= '1';
				config.wr        <= '1';
				addr_cnt1_en   <= '1';
				next_state    <= CONFIG_W_LOW;
			
			when CONFIG_W_LOW =>
				config.en        <= '1';
				config.wr        <= '1';
				next_state    <= IDLE;

			--IRQ pkt manager
			when IRQ_W =>
				spm.en(0)     <= '1';
				spm.wr        <= '1';
				irq_fifo_irq_valid <= '1';
				spm.wdata(2 * WORD_WIDTH - 1 downto WORD_WIDTH) <= unsigned(pkt_in(WORD_WIDTH - 1 downto 0));
				next_state <= IDLE;
		
		end case;
	end process;

	--UP Counter with load and count enable for the address + 1
	process(clk)
	begin
		if rising_edge(clk) then
			if (addr_load = '1') then
				addr <= unsigned(pkt_in(HEADER_ROUTE_WIDTH + HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH - 1 downto HEADER_ROUTE_WIDTH));
			elsif (addr_cnt1_en = '1') then
				addr <= addr + 1;
			elsif (addr_cnt2_en = '1') then
				addr <= addr + 2;
			end if;
		end if;
	end process;

	-- Register with enable
	process(clk)
	begin
		if rising_edge(clk) then
			if (wdata_high_en = '1') then
				wdata_high <= unsigned(pkt_in(WORD_WIDTH - 1 downto 0));
			end if;
		end if;
	end process;

	-- General pourpose registers
	process(clk)
	begin
		if rising_edge(clk) then
			if (reset = '1') then
				state <= IDLE;
				--irq_fifo_data_valid <= '0';
			else
				state <= next_state;
				--irq_fifo_data_valid <= irq_fifo_data_valid_next;
			end if;
		end if;
	end process;

	-- DFF with synchronous set and reset that holds the info of the last packet	
	process(clk)
	begin
		if rising_edge(clk) then
			if ((reset = '1') or (((not (new_data_pkt and pkt_in(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 1))) and pkt_in(LINK_WIDTH - 3)) = '1')) then
				lst_data_pkt <= '0';         --reset
			elsif ((new_data_pkt and pkt_in(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 1)) = '1') then
				lst_data_pkt <= '1';         --set if it is an new data paket and if the last pkt bit is 1
			end if;
		end if;
	end process;

end rtl;
