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
	port(
		clk        : in  std_logic;
		reset      : in  std_logic;
		spm_slv    : in  mem_if_slave;
		spm        : out mem_if_master;
		tx_spm_slv : out mem_if_slave;
		tx_spm     : in  mem_if_master;
		rx_spm     : in  mem_if_master
	);
end spm_bus;

architecture rtl of spm_bus is
	signal rx_spm_buff : mem_if_master;

begin
	tx_spm_slv <= spm_slv;

	process(tx_spm, rx_spm, rx_spm_buff)
	begin
		if (tx_spm.en = '1') then
			spm <= tx_spm;
		else
			if (rx_spm_buff.en = '1') then
				spm <= rx_spm_buff;
			else
				if (rx_spm.en = '1') then
					spm <= rx_spm;
				else
					spm <= tx_spm;
				end if;
			end if;
		end if;
	end process;

	-- Register with enable
	process(clk)
	begin
		if rising_edge(clk) then
			if (reset = '1') then
				rx_spm_buff.en <= '0';
			else
				rx_spm_buff.en    <= rx_spm.en and tx_spm.en;
				rx_spm_buff.wr    <= rx_spm.wr;
				rx_spm_buff.addr  <= rx_spm.addr;
				rx_spm_buff.wdata <= rx_spm.wdata;
			end if;
		end if;
	end process;

end rtl;
