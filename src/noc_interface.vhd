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
-- Definitions package
--
-- Author: Evangelia Kasapaki
-- Author: Rasmus Bo Soerensen
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.config.all;
use work.ocp.all;
use work.noc_defs.all;

package noc_interface is

    type ocp_core_m_a is array((N*M)-1 downto 0) of ocp_core_m;
    type ocp_core_s_a is array((N*M)-1 downto 0) of ocp_core_s;

    type ocp_io_m_a is array((N*M)-1 downto 0) of ocp_io_m;
    type ocp_io_s_a is array((N*M)-1 downto 0) of ocp_io_s;

    type ocp_burst_m_a is array((N*M)-1 downto 0) of ocp_burst_m;
    type ocp_burst_s_a is array((N*M)-1 downto 0) of ocp_burst_s;

    type spm_master is record
        MCmd        : std_logic_vector(SPM_CMD_WIDTH-1 downto 0);
        MAddr       : std_logic_vector(SPM_ADDR_WIDTH-1 downto 0);
        MData       : std_logic_vector(SPM_DATA_WIDTH-1 downto 0);
    end record;

    type spm_slave is record
        SData       : std_logic_vector(SPM_DATA_WIDTH-1 downto 0);
    end record;


    --arrays
    type spm_masters is array(0 to (N*M)-1) of spm_master;
    type spm_slaves is array(0 to (N*M)-1) of spm_slave;


    type link_n_f is array(0 to (N - 1)) of channel_forward;
    type link_m_f is array(0 to (M - 1)) of link_n_f;

    type link_n_b is array(0 to (N - 1)) of channel_backward;
    type link_m_b is array(0 to (M - 1)) of link_n_b;

    type    router_port_f is array(ARITY-1 downto 0) of channel_forward;
    type    router_port_b is array(ARITY-1 downto 0) of channel_backward;


    procedure reset_router_port_f(
        signal router_port : out router_port_f
        );

    procedure reset_router_port_b(
        signal router_port : out router_port_b
        );

end package ; -- noc_interface


package body noc_interface is
    procedure reset_router_port_f(signal router_port : out router_port_f) is
    begin
    res : for i in 0 to ARITY-1 loop
        router_port(i).data <= (others => '0');
        router_port(i).req <= '0';
    end loop ; -- res

    end reset_router_port_f;

    procedure reset_router_port_b(signal router_port : out router_port_b) is
    begin
    res : for i in 0 to ARITY-1 loop
        router_port(i).ack <= '0';
    end loop ; -- res

    end reset_router_port_b;
end noc_interface ;
