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
-- The crossbar description for the asynchronous router.
--
-- Author: Evangelia Kasapaki
--	   Rasmus Bo Sorensen
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
use work.defs.all;


-- Index in channel signals for ARITY = 5 are
-- 0: North channel
-- 1: East channel
-- 2: South channel
-- 3: West channel
-- 4: Network Interface

entity crossbar is
	generic(
		--sim : boolean := true; -- If sim is true the crossbare will generate a logger for logging the events on the synchronizing signals inside the crossbar
		x : natural := 0;	-- The x postion of the router in the mesh network
		y : natural := 0	-- The y postion of the router in the mesh network
	);
	port(
		preset			: in std_logic;
		switch_sel		: in switch_sel_t;
		chs_in_f		: in chs_f;
		chs_in_b		: out chs_b;
		chs_out_f		: out chs_f;
		chs_out_b		: in chs_b
		
		-- ports for simulation
		--sim_time		: in integer
	);
end entity crossbar;

architecture structural of crossbar is
	signal sync_req : std_logic_vector(ARITY-1 downto 0);
	signal sync_ack : std_logic_vector(ARITY-1 downto 0);
	signal synced_req : std_logic;
	signal synced_ack : std_logic;
        signal del : std_logic;
        signal del_req : std_logic;
begin
	
	-- Logger for simulation only
--	logger:if sim = true generate
--		speed_logger : entity work.speed_logger(RTL)
--	generic map (
--		x => x,
--		y => y
--		)
--	port map (
--		preset => preset,
--		synced_req => synced_req,
--		synced_ack => synced_ack,
--		reqs => sync_req,
--		acks => sync_ack,
--		time => sim_time
--		);
--	end generate logger;
	
	
	-- A C-element for synchronizing the request signal in the router
	c_sync_req : entity work.c_gate_generic(sr_latch_impl)
	generic map (
		C_INIT => '1',
		WIDTH => ARITY
	)
	port map (
		preset => preset,
		input => sync_req,
		output => synced_req
	);

        --Delay Element for crossbar combinational delay
        del <= not synced_req;
        del_req <= not del;
	-- A C-element for synchronizing the acknowledge signal in the router
	c_sync_ack : entity work.c_gate_generic(sr_latch_impl)
	generic map (
		C_INIT => '1',
		WIDTH => ARITY
	)
	port map (
		preset => preset,
		input => sync_ack,
		output => synced_ack
	);

	-- The wires between the request and acknowledge signals and the C-elements
	wires: process (chs_in_f, chs_out_b, synced_ack) is
	begin
		for i in ARITY-1 downto 0 loop
			sync_req(i) <= chs_in_f(i).req;
			sync_ack(i) <= chs_out_b(i).ack;
			chs_in_b(i).ack <= synced_ack;
		end loop;
	end process wires;

	-- The crossbar itself
	cross : process (chs_in_f, switch_sel, del_req, synced_req) is
		variable bars : bars_t;
		type demux_out_t is array (ARITY-1 downto 0) of word_t;
		variable demux_out : demux_out_t;
	begin
		-- Demux
		for i in ARITY-1 downto 0 loop
			for j in ARITY-1 downto 0 loop
				if switch_sel(i)(j) = '1' then
					bars(i,j) := chs_in_f(i).data;
				else
					bars(i,j) := (others => '0');
				end if;
			end loop;
		end loop;

		-- Merge
		for i in ARITY-1 downto 0 loop
			demux_out(i) := (others => '0');
			for j in ARITY-1 downto 0 loop
				demux_out(i) := demux_out(i) or bars(j,i);
			end loop;

			chs_out_f(i).data <= demux_out(i);
			chs_out_f(i).req <= del_req;		-- XXX: Don't edit. This must NOT be moved up to the 'wires' process. This is propably a bug in ISim
		end loop;

	end process cross;

end architecture structural;
