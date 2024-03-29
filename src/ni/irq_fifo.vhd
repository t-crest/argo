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
-- Argo 2.0 IRQ FIFO
--
-- Author: Luca Pezzarossa (lpez@dtu.dk)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.argo_types.all;
use work.ocp.all;

entity irq_fifo is
	port(
		clk                      : in  std_logic;
		reset                    : in  std_logic;
		config                   : in  conf_if_master;
		sel                      : in  std_logic;
		config_slv               : out conf_if_slave;

		irq_irq_sig              : out std_logic;
		irq_data_sig             : out std_logic;

		irq_data_fifo_data_valid : in  std_logic;
		irq_irq_fifo_data_valid  : in  std_logic;
		irq_data_fifo_data       : in  irq_data_t
	);
end irq_fifo;

architecture rtl of irq_fifo is
	--------------------------------------------------------------------------------
	-- Addresses of readable/writable registers (Word based addresses inside the NI)
	-- Address  | Access  | Name
	--------------------------------------------------------------------------------
	-- 0x00     | R       | Top of the IRQ FIFO queue
	-- 0x01     | R       | Top of the Data FIFO queue
	--------------------------------------------------------------------------------

	component tdp_ram is
		generic(
			DATA : integer := 32;
			ADDR : integer := 14
		);

		port(
			-- Port A
			a_clk  : in  std_logic;
			a_wr   : in  std_logic;
			a_addr : in  unsigned(ADDR - 1 downto 0);
			a_din  : in  unsigned(DATA - 1 downto 0);
			a_dout : out unsigned(DATA - 1 downto 0);

			-- Port B
			b_clk  : in  std_logic;
			b_wr   : in  std_logic;
			b_addr : in  unsigned(ADDR - 1 downto 0);
			b_din  : in  unsigned(DATA - 1 downto 0);
			b_dout : out unsigned(DATA - 1 downto 0)
		);
	end component;

	signal irq_not_empty, data_not_empty, next_error, irq_read, data_read, irq_not_full, data_not_full: std_logic;
	signal data_w_ptr, data_r_ptr, irq_w_ptr, irq_r_ptr, w_ptr, r_ptr : unsigned(IRQ_FIFO_IDX_WIDTH - 1 downto 0);
	signal w_data : unsigned(HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH - 1 downto 0);

begin
	--General assignments
	irq_irq_sig  <= irq_not_empty;
	irq_data_sig <= data_not_empty;

	config_slv.rdata(WORD_WIDTH - 1 downto HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH) <= (others => '0');

	--Detectors for the state of the two FIFOs
	irq_not_empty  <= '0' when irq_w_ptr = irq_r_ptr else '1';
	data_not_empty <= '0' when data_w_ptr = data_r_ptr else '1';

	irq_not_full  <= '0' when ((irq_w_ptr = (irq_r_ptr-1)) or ((irq_w_ptr=(to_unsigned(IRQ_IRQ_FIFO_MAX, IRQ_FIFO_IDX_WIDTH))) and (irq_r_ptr=(to_unsigned(0, IRQ_FIFO_IDX_WIDTH))))) else '1';
	data_not_full <= '0' when ((data_w_ptr = (data_r_ptr+1)) or ((data_w_ptr=(to_unsigned(IRQ_DATA_FIFO_MIN, IRQ_FIFO_IDX_WIDTH))) and (data_r_ptr=(to_unsigned((2 ** IRQ_FIFO_IDX_WIDTH)-1, IRQ_FIFO_IDX_WIDTH))))) else '1';

	--Multiplexer to write into the FIFO
	w_ptr  <= irq_w_ptr when irq_data_fifo_data_valid = '0' else data_w_ptr;
	w_data <= irq_data_fifo_data;

	--Address decoding
	process(sel, config.en, config.wr, config.addr, data_r_ptr, irq_r_ptr)
	begin
		next_error       <= '0';
		r_ptr            <= data_r_ptr;
		irq_read         <= '0';
		data_read        <= '0';
		if (sel = '1' and config.en = '1') then
			-- Read registers
			if config.wr = '0' then
				case (config.addr(CPKT_ADDR_WIDTH - 1 downto 0)) is
					--when to_unsigned(0, CPKT_ADDR_WIDTH) =>
          when 11d"0" => --CPKT_ADDR_WIDTH=11
						r_ptr    <= irq_r_ptr;
						irq_read <= '1';
					--when to_unsigned(1, CPKT_ADDR_WIDTH) =>
          when 11d"1" => --CPKT_ADDR_WIDTH=11
						r_ptr     <= data_r_ptr;
						data_read <= '1';
					when others =>
						next_error <= '1';
				end case;
			else
				--Write registers gives error
						next_error <= '1';
			end if;
		end if;

	end process;

	tdpram : tdp_ram
		generic map(
			DATA => HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH,
			ADDR => IRQ_FIFO_IDX_WIDTH
		)
		port map(
			-- Port A (write only)
			a_clk  => clk,
			a_wr   => (irq_irq_fifo_data_valid and irq_not_full)  or (irq_data_fifo_data_valid and data_not_full),
			a_addr => w_ptr,
			a_din  => w_data,
			a_dout => open,

			-- Port B (read only)
			b_clk  => clk,
			b_wr   => '0',
			b_addr => r_ptr,
			b_din  => (others => '0'),
			b_dout => config_slv.rdata(HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH - 1 downto 0)
		);

	--UP Counter with load and count enable for the address + 1
	process(clk)
	begin
		if rising_edge(clk) then
			if (reset = '1') then
				irq_w_ptr <= (others => '0');
			elsif ((irq_irq_fifo_data_valid and irq_not_full) = '1') then
				if (irq_w_ptr = (to_unsigned(IRQ_IRQ_FIFO_MAX, IRQ_FIFO_IDX_WIDTH))) then
					irq_w_ptr <= (others => '0');
				else
					irq_w_ptr <= irq_w_ptr + 1;
				end if;
			end if;
		end if;
	end process;

	--DOWN Counter with load and count enable for the address + 1
	process(clk)
	begin
		if rising_edge(clk) then
			if (reset = '1') then
				data_w_ptr <= (others => '1');
			elsif ((irq_data_fifo_data_valid and data_not_full) = '1') then
				if (data_w_ptr = (to_unsigned(IRQ_DATA_FIFO_MIN, IRQ_FIFO_IDX_WIDTH))) then
					data_w_ptr <= (others => '1');
				else
					data_w_ptr <= data_w_ptr - 1;
				end if;
			end if;
		end if;
	end process;

	--UP Counter with load and count enable for the address + 1
	process(clk)
	begin
		if rising_edge(clk) then
			if (reset = '1') then
				irq_r_ptr <= (others => '0');
			elsif ((irq_read = '1') and (irq_not_empty = '1')) then
				if (irq_r_ptr = (to_unsigned(IRQ_IRQ_FIFO_MAX, IRQ_FIFO_IDX_WIDTH))) then
					irq_r_ptr <= (others => '0');
				else
					irq_r_ptr <= irq_r_ptr + 1;
				end if;
			end if;
		end if;
	end process;

	--DOWN Counter with load and count enable for the address + 1
	process(clk)
	begin
		if rising_edge(clk) then
			if (reset = '1') then
				data_r_ptr <= (others => '1');
			elsif ((data_read = '1') and (data_not_empty = '1')) then
				if (data_r_ptr = (to_unsigned(IRQ_DATA_FIFO_MIN, IRQ_FIFO_IDX_WIDTH))) then
					data_r_ptr <= (others => '1');
				else
					data_r_ptr <= data_r_ptr - 1;
				end if;
			end if;
		end if;
	end process;

	process(clk)
	begin
		if rising_edge(clk) then
			if ((reset = '1')) then
				config_slv.error <= '0';
			else
				config_slv.error <= next_error;
			end if;
		end if;
	end process;

end rtl;