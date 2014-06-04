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
-- Debug helper to dump all traffic to a file. Also checks the validity of
-- packets on their way through the network and rises a warning if a
-- misformated packet is detected (most likeley a colission in the xbar)
--
-- Author: Christoph Mueller
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

package wiretap_package is

  file tap_file : text open write_mode is "noc_wiretap.txt";

  function wiretap_decode_route(slv : std_logic_vector; is_input: boolean; direction: string) return string;
  
end package wiretap_package;

package body wiretap_package is

  function wiretap_decode_route(slv : std_logic_vector; is_input: boolean; direction: string) return string is
    variable str : string(1 to slv'length/2);
    variable dir : std_logic_vector(1 downto 0);
    variable decoded_dir : string(1 to 1) := "X";
  begin
    if is_input then
      dir := slv(1 downto 0);
      case dir is
        when "00"   => decoded_dir := "n";
        when "01"   => decoded_dir := "e";
        when "10"   => decoded_dir := "s";
        when "11"   => decoded_dir := "w";
        when others => decoded_dir := "X";
      end case;
      if direction = decoded_dir then
        return "FINAL";
      end if;
    end if;
    for i in 0 to slv'length/2 - 1 loop
      dir := slv(2*i + 1 downto 2*i);
      case dir is
        when "00"   => str(slv'length/2 - i) := 'N';
        when "01"   => str(slv'length/2 - i) := 'E';
        when "10"   => str(slv'length/2 - i) := 'S';
        when "11"   => str(slv'length/2 - i) := 'W';
        when others => str(slv'length/2 - i) := 'X';
      end case;
    end loop;  -- i
    return str;
  end wiretap_decode_route;
  


end wiretap_package;
