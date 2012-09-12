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
-- Synchronous NoC router. Consists of HPUs, crossbar and pipeline registers.
--
-- Author: Anders Bentzon
-- Author: Evangelia Kasapaki
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.defs.all;

entity router is
	port (	
		clk	: in std_logic;
		reset	: in std_logic;
		inPort	: in routerPort;
		outPort	: out routerPort
	);
end router;

architecture struct of router is

component Xbar is
port(	
	func	: in std_logic_vector(19 downto 0);
	inPort	: in routerPort;
	outPort	: out routerPort
);
end component;
	
component HPU is
port(
	clk: 	in std_logic;
	reset:	in std_logic;
	inLine: in network_link;
	outLine: out network_link;
	sel:	out std_logic_vector(3 downto 0)
);
end component;

signal sel0, sel1, sel2, sel3, sel4: std_logic_vector(3 downto 0);
	
-- pipeline registers
signal XbarSel, XbarSelNext	: std_logic_vector(19 downto 0);
signal XbarOut, XbarOutNext	: routerPort;
signal HPUout 			: routerPort;
signal HPUoutNext		: routerPort;
signal HPUin			: routerPort;

begin
	port0: HPU
		port map(clk=>clk, reset=>reset, inLine=>HPUin(0), outLine=>HPUoutNext(0), sel=>sel0);
	port1: HPU
		port map(clk=>clk, reset=>reset, inLine=>HPUin(1), outLine=>HPUoutNext(1), sel=>sel1);
	port2: HPU
		port map(clk=>clk, reset=>reset, inLine=>HPUin(2), outLine=>HPUoutNext(2), sel=>sel2);
	port3: HPU
		port map(clk=>clk, reset=>reset, inLine=>HPUin(3), outLine=>HPUoutNext(3), sel=>sel3);
	port4: HPU
		port map(clk=>clk, reset=>reset, inLine=>HPUin(4), outLine=>HPUoutNext(4), sel=>sel4);
	
	XbarSelNext <= sel4 & sel3 & sel2 & sel1 & sel0;
	
	xbarinst : Xbar
			port map(func=>XbarSel, inPort=>HPUout, outPort=>XbarOutNext);
			
	outPort <= XbarOut;
	
	process(clk, reset)
	begin
		if reset = '1' then
			XbarSel <= (others => '0');
			XbarOut <= (others => (others => '0' ));
			HPUout <= (others => (others => '0' ));
		elsif rising_edge(clk) then
			XbarSel <= XbarSelNext;
			XbarOut <= XbarOutNext;
			HPUin <= inPort;
			HPUout <= HPUoutNext;
		end if;
	end process;
end struct;
