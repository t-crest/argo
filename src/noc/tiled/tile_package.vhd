--
-- Copyright Technical University of Denmark. All rights reserved.
-- This file is part of the T-CREST project.
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
--    1. Redistributions of source code must retain the above copyright notice,
--	 this list of conditions and the following disclaimer.
--
--    2. Redistributions in binary form must reproduce the above copyright
--	 notice, this list of conditions and the following disclaimer in the
--	 documentation and/or other materials provided with the distribution.
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

-------------------------------------------------------------------------------
-- Types & Settings for the tile
-- Author: Christoph Mueller
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.config_types.all;
use work.config.all;

package tile_package is
-------------------------------------------------------------------------------
-- record of settings to push through layouted tile for the attatched traffic
-- generator
-------------------------------------------------------------------------------

  constant TILE_ADDRESS_WIDTH : integer := 8;

  type tile_settings is record		-- record of settings for a tile
    tile_id : unsigned(TILE_ADDRESS_WIDTH - 1 downto 0);
  end record;

  function generate_tile_settings (
    i : integer;			-- width
    j : integer)			-- height
    return tile_settings;
end tile_package;

package body tile_package is

  function generate_tile_settings (
    i : integer;			-- width
    j : integer)			-- height
    return tile_settings is
    variable settings : tile_settings;
  begin
    settings.tile_id := to_unsigned((i*N)+j, TILE_ADDRESS_WIDTH);
    --& to_unsigned(M, TILE_ADDRESS_WIDTH/2);
    return settings;
  end function generate_tile_settings;
  

end tile_package;
