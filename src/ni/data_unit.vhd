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
-- Argo 2.0 RX pipeline Data unit
--
-- Author: Luca Pezzarossa (lpez@dtu.dk)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.argo_types.all;
use work.ocp.all;

entity data_unit is
	port(
		clk                 : in  std_logic;
		reset               : in  std_logic;
		spm                 : out mem_if_master;
		irq_fifo_data       : out std_logic_vector(HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH - 1 downto 0);
		irq_fifo_data_valid : out std_logic;
		pkt_in              : in  link_t
	);
end data_unit;

architecture rtl of data_unit is
	signal wdata_high_en, wdata_low_en, addr_load, addr_cnt_en, new_data_pkt, lst_pkt: std_logic;
	signal addr : unsigned(HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH - 1 downto 0);
	type state_type is (IDLE, W_LOW, W_HIGH, CONTINUE, DONE);
	signal state, next_state : state_type;

begin

	--The signal new_data_pkt is high when a new data packet is incoming in the pkt_in port
	new_data_pkt <= pkt_in(LINK_WIDTH - 1) and pkt_in(LINK_WIDTH - 2) and (not pkt_in(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 1));

	--General assignments
	irq_fifo_data_valid <= lst_pkt and pkt_in(LINK_WIDTH - 3);

	spm.addr      <= addr;
	irq_fifo_data <= std_logic_vector(addr);

	--Control Moore FSM		
	process(state, new_data_pkt, pkt_in(LINK_WIDTH - 3))
	begin
		next_state    <= state;
		addr_load     <= '0';
		wdata_low_en  <= '0';
		wdata_high_en <= '0';
		addr_cnt_en   <= '0';
		spm.en        <= '0';
		spm.wr        <= '0';
		case state is
			when IDLE =>
				addr_load <= '1';
				if (new_data_pkt = '1') then
					next_state <= W_HIGH;
				end if;
			when W_HIGH =>
				wdata_high_en <= '1';
				next_state    <= W_LOW;
			when W_LOW =>
				wdata_low_en <= '1';
				if (pkt_in(LINK_WIDTH - 3) = '0') then
					next_state <= CONTINUE;
				else
					next_state <= DONE;
				end if;
			when CONTINUE =>
				addr_cnt_en   <= '1';
				wdata_high_en <= '1';
				spm.en        <= '1';
				spm.wr        <= '1';
				next_state    <= W_LOW;
			when DONE =>
				addr_load     <= '1';
				spm.en        <= '1';
				spm.wr        <= '1';
				if (new_data_pkt = '1') then
					next_state <= W_HIGH;
				else
					next_state <= IDLE;
				end if;
		end case;
	end process;

	--UP Counter with load and count enable for the address + 1
	process(clk)
	begin
		if rising_edge(clk) then
			if (addr_load = '1') then
				addr <= unsigned(pkt_in(HEADER_ROUTE_WIDTH + HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH - 1 downto HEADER_ROUTE_WIDTH));
			elsif (addr_cnt_en = '1') then
				addr <= addr + 1;
			end if;
		end if;
	end process;

	-- Register with enable
	process(clk)
	begin
		if rising_edge(clk) then
			if (wdata_high_en = '1') then
				spm.wdata(2 * WORD_WIDTH - 1 downto WORD_WIDTH) <= unsigned(pkt_in(WORD_WIDTH - 1 downto 0));
			end if;
		end if;
	end process;

	-- Register with enable	
	process(clk)
	begin
		if rising_edge(clk) then
			if (wdata_low_en = '1') then
				spm.wdata(WORD_WIDTH - 1 downto 0) <= unsigned(pkt_in(WORD_WIDTH - 1 downto 0));
			end if;
		end if;

	end process;

	-- General pourpose registers
	process(clk)
	begin
		if rising_edge(clk) then
			if (reset = '1') then
				state <= IDLE;
			else
				state <= next_state;
			end if;
		end if;
	end process;

	-- DFF with synchronous set and reset that holds the info of the last packet	
	process(clk)
	begin
		if rising_edge(clk) then
			if ((reset = '1') or (((not (new_data_pkt and pkt_in(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 2))) and pkt_in(LINK_WIDTH - 3)) = '1')) then
				lst_pkt <= '0';         --reset
			elsif ((new_data_pkt and pkt_in(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 2)) = '1') then
				lst_pkt <= '1';         --set if it is an new data paket and if the last pkt bit is 1
			end if;
		end if;
	end process;

end rtl;