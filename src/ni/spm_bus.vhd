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
-- Argo 2.0 SPM Bus
--
-- Author: Luca Pezzarossa (lpez@dtu.dk)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.argo_types.all;
use work.ocp.all;

entity spm_bus is
	port (
		clk		: in std_logic;
		reset 	: in std_logic;
		spm_slv : in mem_if_slave;
		spm : out mem_if_master;
		tx_spm_slv : out mem_if_slave;
		tx_spm : in mem_if_master;
		rx_spm : in mem_if_master
	);
end spm_bus;

architecture rtl of spm_bus is
--	signal wdata_high_en, wdata_low_en, addr_load, addr_cnt_en, new_data_pkt, lst_pkt: std_logic;
--	signal addr : unsigned(HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH - 1 downto 0);
--	type state_type is (IDLE, W_LOW, W_HIGH, CONTINUE, DONE);
--	signal state, next_state : state_type;

signal rx_spm_buff : mem_if_master;

begin

tx_spm_slv <= spm_slv;

--
--	--The signal new_data_pkt is high when a new data packet is incoming in the pkt_in port
--	new_data_pkt <= pkt_in(LINK_WIDTH - 1) and pkt_in(LINK_WIDTH - 2) and (not pkt_in(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 1));
--
--	--General assignments
--	irq_fifo_data_valid <= lst_pkt and pkt_in(LINK_WIDTH - 3);
--
--	spm.addr      <= addr;
--	irq_fifo_data <= addr;

	--Control Moore FSM		
	process(tx_spm )
	begin
		spm <= tx_spm;
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

	-- Register with enable
	process(clk)
	begin
		if rising_edge(clk) then
			if (reset = '1') then
			else
				rx_spm_buff <= rx_spm;
				rx_addr <= rx_spm.addr;
				rx_wr <= rx_spm.wr;
				rx_en <= rx_spm.en and tx_spm.en;
			end if;
		end if;
	end process;

end rtl;