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
	port (
		clk		: in std_logic;
		reset 	: in std_logic;
		config : in mem_if_master;
		sel 	: in std_logic;
		config_slv : out mem_if_slave;
		
		irq_irq_sig : out std_logic;
		irq_irq_fifo_data : in std_logic_vector(HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH-1 downto 0);
		irq_irq_fifo_data_valid : in std_logic;
		
		irq_data_sig : out std_logic;
		irq_data_fifo_data : in std_logic_vector(HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH-1 downto 0);
		irq_data_fifo_data_valid : in std_logic
		
	);
end irq_fifo;

architecture rtl of irq_fifo is
--------------------------------------------------------------------------------
-- Addresses of readable/writable registers
-- Address  | Access  | Name
--------------------------------------------------------------------------------
-- 0x00     | R       | Top of the IRQ FIFO queue
-- 0x04     | R       | Top of the Data FIFO queue
-- 0x08     | W       | Size of the IRQ FIFO queue
-- 0x0C     | W       | Size of the Data FIFO queue
--------------------------------------------------------------------------------

component tdp_ram is

generic (
    DATA    : integer := 32;
    ADDR    : integer := 14
);

port (
-- Port A
    a_clk   : in  std_logic;
    a_wr    : in  std_logic;
    a_addr  : in  unsigned(ADDR-1 downto 0);
    a_din   : in  std_logic_vector(DATA-1 downto 0);
    a_dout  : out std_logic_vector(DATA-1 downto 0);

-- Port B
    b_clk   : in  std_logic;
    b_wr    : in  std_logic;
    b_addr  : in  unsigned(ADDR-1 downto 0);
    b_din   : in  std_logic_vector(DATA-1 downto 0);
    b_dout  : out std_logic_vector(DATA-1 downto 0)
);
end component;

signal irq_not_empty, data_not_empty, data_fifo_min_en, irq_fifo_max_en, next_error : std_logic;


--	signal addr : unsigned(HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH - 1 downto 0);
--	type state_type is (IDLE, W_LOW, W_HIGH, CONTINUE, DONE);
--	signal state, next_state : state_type;

	signal data_w_ptr, data_r_ptr, irq_w_ptr, irq_r_ptr, w_ptr, r_ptr, irq_fifo_max, data_fifo_min : unsigned(IRQ_FIFO_IDX_WIDTH - 1 downto 0);
	signal w_data : std_logic_vector(HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH -1 downto 0);


begin
--General assignments
irq_irq_sig  <= irq_not_empty;
irq_data_sig <= data_not_empty; 

config_slv.rdata((2*WORD_WIDTH) -1 downto HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH) <= (others  => '0');

--Detectors for the state of the two FIFOs
irq_not_empty <= '0' when irq_w_ptr = irq_r_ptr else '1';
data_not_empty <= '0' when data_w_ptr = data_r_ptr else '1';

--Multiplexer to write into the FIFO
w_ptr <= irq_w_ptr when irq_data_fifo_data_valid = '1' else data_w_ptr;
w_data <= irq_irq_fifo_data when irq_data_fifo_data_valid = '1' else irq_data_fifo_data;

--Multiplexer to read into the FIFO
r_ptr <= irq_r_ptr when (((sel and config.en and (not config.wr)) = '1') and (config.addr(CPKT_ADDR_WIDTH-1 downto 2)=to_unsigned(0,CPKT_ADDR_WIDTH-2))) else data_r_ptr;

process(sel, config.en, config.wr, config.addr)
	begin
if (sel = '1' and config.en = '1') then
      -- Read registers
      if config.wr = '0' then
        case( config.addr(CPKT_ADDR_WIDTH-1 downto 2) ) is
          when to_unsigned(0,CPKT_ADDR_WIDTH-2) =>
            --read_next(TDM_S_CNT_WIDTH-1 downto 0) <= TDM_S_CNT_reg;
          when to_unsigned(1,CPKT_ADDR_WIDTH-2) =>
            --read_next <= TDM_P_CNT_reg;
           when others =>
            next_error <= '1';
        end case ;
    else
    	--Write registers
        case( config.addr(CPKT_ADDR_WIDTH-1 downto 2) ) is
          when to_unsigned(2,CPKT_ADDR_WIDTH-2) =>
            irq_fifo_max_en <= '1';
          when to_unsigned(3,CPKT_ADDR_WIDTH-2) =>
            data_fifo_min_en <= '1';
          when others =>
            next_error <= '1';
    end case;
    end if;

end process;













tdpram : tdp_ram
generic map (
    DATA => HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH,
    ADDR => IRQ_FIFO_IDX_WIDTH
)
port map (
-- Port A (write only)
    a_clk =>  clk,
    a_wr => irq_irq_fifo_data_valid or irq_data_fifo_data_valid,
    a_addr => w_ptr,
    a_din => w_data,
    a_dout => open,

-- Port B (read only)
    b_clk =>  clk,
    b_wr => '0',
    b_addr => r_ptr,
    b_din =>  (others => '0'),
    b_dout => config_slv.rdata(HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH -1 downto 0)
);

----UP Counter with load and count enable for the address + 1
--	process(clk)
--	begin
--		if rising_edge(clk) then
--			if (reset = '1') then
--				irq_w_ptr <= (others  => '0');
--			else
--				
--				if (addr_load = '1') then
--					irq_w_pointer <= unsigned(pkt_in(HEADER_ROUTE_WIDTH + HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH - 1 downto HEADER_ROUTE_WIDTH));
--				elsif (increment_condition_true) then
--					irq_w_ptr <= irq_w_ptr + 1;
--				end if;
--			end if;
--		end if;
--	end process;

	-- Register with enable	
	process(clk)
	begin
		if rising_edge(clk) then
			if (reset = '1') then
				irq_fifo_max <= to_unsigned((2**(IRQ_FIFO_IDX_WIDTH-1))-1, IRQ_FIFO_IDX_WIDTH);
			elsif (irq_fifo_max_en = '1') then
				irq_fifo_max <= unsigned(config.wdata(IRQ_FIFO_IDX_WIDTH-1 downto 0));
			end if;
		end if;
	end process;
	
	-- Register with enable	
	process(clk)
	begin
		if rising_edge(clk) then
			if (reset = '1') then
				data_fifo_min <= to_unsigned((2**(IRQ_FIFO_IDX_WIDTH-1)), IRQ_FIFO_IDX_WIDTH);
			elsif (data_fifo_min_en = '1') then
				data_fifo_min <= unsigned(config.wdata(IRQ_FIFO_IDX_WIDTH-1 downto 0));
			end if;
		end if;
	end process;

--	-- General pourpose registers
--	process(clk)
--	begin
--		if rising_edge(clk) then
--			if (reset = '1') then
--				state <= IDLE;
--			else
--				state <= next_state;
--			end if;
--		end if;
--	end process;
--
--	-- DFF with synchronous set and reset that holds the info of the last packet	
--	process(clk)
--	begin
--		if rising_edge(clk) then
--			if ((reset = '1') or (((not (new_data_pkt and pkt_in(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 2))) and pkt_in(LINK_WIDTH - 3)) = '1')) then
--				lst_pkt <= '0';         --reset
--			elsif ((new_data_pkt and pkt_in(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 2)) = '1') then
--				lst_pkt <= '1';         --set if it is an new data paket and if the last pkt bit is 1
--			end if;
--		end if;
--	end process;

--	--The signal new_data_pkt is high when a new data packet is incoming in the pkt_in port
--	new_data_pkt <= pkt_in(LINK_WIDTH - 1) and pkt_in(LINK_WIDTH - 2) and (not pkt_in(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 1));
--
--	--General assignments
--	irq_fifo_data_valid <= lst_pkt and pkt_in(LINK_WIDTH - 3);
--
--	spm.addr      <= addr;
--	irq_fifo_data <= std_logic_vector(addr);
--
--	--Control Moore FSM		
--	process(state, new_data_pkt, pkt_in(LINK_WIDTH - 3))
--	begin
--		next_state    <= state;
--		addr_load     <= '0';
--		wdata_low_en  <= '0';
--		wdata_high_en <= '0';
--		addr_cnt_en   <= '0';
--		spm.en        <= '0';
--		spm.wr        <= '0';
--		case state is
--			when IDLE =>
--				addr_load <= '1';
--				if (new_data_pkt = '1') then
--					next_state <= W_HIGH;
--				end if;
--			when W_HIGH =>
--				wdata_high_en <= '1';
--				next_state    <= W_LOW;
--			when W_LOW =>
--				wdata_low_en <= '1';
--				if (pkt_in(LINK_WIDTH - 3) = '0') then
--					next_state <= CONTINUE;
--				else
--					next_state <= DONE;
--				end if;
--			when CONTINUE =>
--				addr_cnt_en   <= '1';
--				wdata_high_en <= '1';
--				spm.en        <= '1';
--				spm.wr        <= '1';
--				next_state    <= W_LOW;
--			when DONE =>
--				addr_load     <= '1';
--				spm.en        <= '1';
--				spm.wr        <= '1';
--				if (new_data_pkt = '1') then
--					next_state <= W_HIGH;
--				else
--					next_state <= IDLE;
--				end if;
--		end case;
--	end process;

end rtl;