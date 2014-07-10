-- 
-- Copyright Technical University of Denmark. All rights reserved.
-- This file is part of the T-CREST project.
-- 
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
-- 
-- 1. Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
-- 
-- 2. Redistributions in binary form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
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
-- Rasmus Bo Sorensen
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
use work.noc_defs.all;
use work.delays.all;


-- Index in channel signals for ARITY = 5 are
-- 0: North channel
-- 1: East channel
-- 2: South channel
-- 3: West channel
-- 4: Network Interface

entity crossbar is
  port(
    preset     : in  std_logic;
    switch_sel : in  switch_sel_t;
    left_in    : in  channel_forward_vector(ARITY - 1 downto 0);
    left_out   : out channel_backward_vector(ARITY - 1 downto 0);
    right_out  : out channel_forward_vector(ARITY - 1 downto 0);
    right_in   : in  channel_backward_vector(ARITY - 1 downto 0)
    );
end entity crossbar;

architecture structural of crossbar is
begin


-- The crossbar itself
  cross : process (left_in, switch_sel) is
    variable bars      : bars_t;
    type demux_out_t is array (ARITY-1 downto 0) of link_t;
    variable demux_out : demux_out_t;
  begin
-- Demux
    for i in ARITY-1 downto 0 loop
      for j in ARITY-1 downto 0 loop
        if switch_sel(i)(j) = '1' then
          bars(i, j) := left_in(i).data;
        else
          bars(i, j) := (others => '0');
        end if;
      end loop;
    end loop;

-- Merge
    for i in ARITY-1 downto 0 loop
      demux_out(i) := (others => '0');
      for j in ARITY-1 downto 0 loop
        demux_out(i) := demux_out(i) or bars(j, i);
      end loop;

      left_out(i).ack <= right_in(i).ack;
      right_out(i).data <= demux_out(i);
      right_out(i).req  <= left_in(i).req;  -- does not matter here, the reqs
                                            -- are wired outside
    end loop;

    
  end process cross;

end architecture structural;
