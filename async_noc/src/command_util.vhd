library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use work.defs.all;


package cmd_util is


    --writes a 64bit value from a processor to spm
    procedure spm_write(core: ocp_master_spm; addr: std_logic_vector; data: std_logic_vector);

    --reads a 64bit value from spm to processor
    procedure spm_read(core: ocp_master_spm; addr: std_logic_vector);
    
                    
end cmd_util;




package body cmd_util is


  procedure spm_write (core: ocp_master_spm; addr: std_logic_vector; data: std_logic_vector) is
    core.MCmd <= "11";
    core.MAddr <= addr;
    core.MData <= data;
    wait for 2*NA_HPERIOD;
    core.MCmd <= (others=>'0');
    core.MAddr <= (others=>'0');
    core.MData <= (others=>'0');
  end spm_write;


  procedure spm_read (core: ocp_master_spm; addr: std_logic_vector) is
    core.MCmd <= "00";
    core.MAddr <= addr;
    wait for 2*NA_HPERIOD;
    core.MAddr <= (others=>'0');
  end spm_write;



end cmd_util;



