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


--------------------------------------------------------------------------------
-- package defining types to be used for configuration
-- we can't use noc_defs for this since noc_defs depends
-- on the configuration package 
--
-- Author: Evangelia Kasapaki
-- Author: Rasmus Bo Soerensen
-- Author: Christoph Mueller
--------------------------------------------------------------------------------

package config_types is
  -- Architectures & Implementations to choose from 
  type ARCHITECTURES is (RTL, FPGA, ASIC);
  type IMPLEMENTATIONS is (SYNC, ASYNC);

  type latch_state is (opaque, transparent);
  type latch_state_vector is array (integer range <>) of latch_state;
	
  -- Convenience constants, that add some semantics. Not type-safe!
  constant EMPTY_TOKEN  : latch_state := transparent;
  constant EMPTY_BUBBLE : latch_state := transparent;
  constant VALID_BUBBLE : latch_state := transparent;
  constant VALID_TOKEN  : latch_state := opaque;	-- Only valid-tokens are opaque latches
end package config_types;
