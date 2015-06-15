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
-- Argo 2.0 RX pipeline IRQ unit
--
-- Author: Luca Pezzarossa (lpez@dtu.dk)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.argo_types.all;
use work.ocp.all;

entity irq_unit is
	port(
		clk                 : in  std_logic;
		reset               : in  std_logic;
		irq_fifo_data       : out std_logic_vector(HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH - 1 downto 0);
		irq_fifo_data_valid : out std_logic;
		pkt_in              : in  link_t
	);
end irq_unit;

architecture rtl of irq_unit is

begin

	--The signal irq_fifo_data_valid is high when a new irq packet is incoming in the pkt_in port
	irq_fifo_data_valid <= pkt_in(LINK_WIDTH - 1) and pkt_in(LINK_WIDTH - 2) and pkt_in(LINK_WIDTH - 3) and pkt_in(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 1) and pkt_in(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 2);

	--General assignments
	irq_fifo_data <= pkt_in(HEADER_ROUTE_WIDTH + HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH - 1 downto HEADER_ROUTE_WIDTH);

end rtl;















