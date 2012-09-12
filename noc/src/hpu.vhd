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
-- Header parsing unit for the TDM NoC router.
--
-- Author: Anders Bentzon
-- Author: Evangelia Kasapaki
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.defs.all;
	
entity HPU is
	port(
		clk: 	in std_logic;
		reset:	in std_logic;
		inLine: in network_link;
		outLine: out network_link;
		sel:	out std_logic_vector(3 downto 0)
	);
end HPU;

architecture struct of HPU is
	signal SOP	: std_logic;
	signal MOP	: std_logic;
	signal EOP	: std_logic;
	signal dest	: std_logic_vector(1 downto 0);
	
	signal selInt, selIntNext	: std_logic_vector(3 downto 0);
	signal decodedSel		: std_logic_vector(3 downto 0);
	signal outInt			: network_link;
begin
	SOP <= inLine(PHIT_WIDTH-1);
	MOP <= inLine(PHIT_WIDTH-2);
	EOP <= inLine(PHIT_WIDTH-3);
	dest <= inLine(1 downto 0);
	outLine <= outInt;
	
	-- binary decoder, dest field into a one-hot signal
	decodedSel(0) <= '1' when dest = "00" else '0';
	decodedSel(1) <= '1' when dest = "01" else '0';
	decodedSel(2) <= '1' when dest = "10" else '0';
	decodedSel(3) <= '1' when dest = "11" else '0';
	
	selIntNext <= decodedSel when SOP = '1' else (selInt and (selInt'range=>(MOP or EOP)));
	sel <= selInt when (EOP='1' or MOP='1') else selIntNext;
	outInt <= "100" & inLine(31 downto 16) & "00" & inLine(15 downto 2) when (SOP='1' and MOP='0' and EOP='0') else inLine;

	process (reset,clk)
	begin
		if reset = '1' then
			selInt <= (others => '0');
		elsif rising_edge(clk) then
			selInt <= selIntNext;
		end if;
	end process;

end struct;
