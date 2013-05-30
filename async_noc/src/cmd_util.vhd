library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use work.defs.all;


package cmd_util is

    constant SIMDELAY : time := 3 ns;

    --writes a 64bit value from a processor to spm
    procedure spm_write (signal core: out ocp_master_spm; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic);

    --reads a 64bit value from spm to processor
    procedure spm_read (signal core: out ocp_master_spm; addr: std_logic_vector; signal clk: in std_logic);

    --writes a Slot Table entry
    procedure st_write (signal core : out ocp_master; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic);

    --reads a Slot Table entry
    procedure st_read (signal core: out ocp_master; addr: std_logic_vector; signal clk: in std_logic);

    --write a DMA route
    procedure route_write (signal core: out ocp_master; signal slave: in ocp_slave; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic);

    --write a DMA controller
    procedure dma_write (signal core: out ocp_master; signal slave: in ocp_slave; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic);

    --generic processor write
    procedure proc_write (signal core: out ocp_master; signal slave: in ocp_slave; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic);

    --generic processor read
    procedure proc_read (signal core: out ocp_master; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic);


end cmd_util;



package body cmd_util is
  


  --writes a 64bit value from a processor to spm
  procedure spm_write (signal core: out ocp_master_spm; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic) is
  begin
    wait for SIMDELAY;
    core.MCmd <= "11";
    core.MAddr <= addr;
    core.MData <= data;
    wait until rising_edge(clk);
    wait for SIMDELAY;
    core.MCmd <= (others=>'0');
    core.MAddr <= (others=>'0');
    core.MData <= (others=>'0');
    --wait until rising_edge(clk);
    return;
  end spm_write;

  
  --reads a 64bit value from spm to processor
  procedure spm_read (signal core: out ocp_master_spm; addr: std_logic_vector; signal clk: in std_logic) is
  begin
    wait for SIMDELAY;
    core.MCmd <= "10";
    core.MAddr <= addr;
    wait until rising_edge(clk);
    wait for SIMDELAY;
    core.MCmd <= "00";
    core.MAddr <= (others=>'0');
    --wait until rising_edge(clk);
    return;
  end spm_read;

  --writes a Slot Table entry
  procedure st_write (signal core : out ocp_master; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic) is
  begin
    wait for SIMDELAY;
    core.MCmd <= "11";
    core.MAddr <= ST_MASK & addr;
    core.MData <= x"000000" & "000" & data;
    wait until rising_edge(clk);
    wait for SIMDELAY;
    core.MCmd <= (others=>'0');
    core.MAddr <= (others=>'0');
    core.MData <= (others=>'0');
    --wait until rising_edge(clk);
    return;
  end st_write;

  --reads a Slot Table entry
  procedure st_read (signal core: out ocp_master; addr: std_logic_vector; signal clk: in std_logic) is
  begin
    wait for SIMDELAY;
    core.MCmd <= "10";
    core.MAddr <= ST_MASK & addr;
    wait until rising_edge(clk);
    wait for SIMDELAY;
    core.MCmd <= (others=>'0');
    core.MAddr <= (others=>'0');
    --wait until rising_edge(clk);
    return;
  end st_read;

  --write a DMA route
  procedure route_write (signal core: out ocp_master; signal slave : in ocp_slave; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic) is
  begin
    wait for SIMDELAY;
    core.MCmd <= "11";
    core.MAddr <= DMA_P_MASK & addr;
    core.MData <= x"0000" & data;
    wait until rising_edge(clk) and slave.SResp='1';
    wait for SIMDELAY;
    core.MCmd <= (others=>'0');
    core.MAddr <= (others=>'0');
    core.MData <= (others=>'0');
    --wait until rising_edge(clk);
    return;
  end route_write;

  --write a DMA controller
  procedure dma_write (signal core: out ocp_master; signal slave : in ocp_slave; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic) is
  begin
    wait for SIMDELAY;
    core.MCmd <= "11";
    core.MAddr <= DMA_MASK & addr;
    core.MData <= data;
    wait until rising_edge(clk) and slave.SResp='1';
    wait for SIMDELAY;
    core.MCmd <= (others=>'0');
    core.MAddr <= (others=>'0');
    core.MData <= (others=>'0');
    --wait until rising_edge(clk);
    return;
  end dma_write;

  --generic processor write
  procedure proc_write (signal core: out ocp_master; signal slave : in ocp_slave; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic) is
  begin
    wait for SIMDELAY;
    core.MCmd <= "11";
    core.MAddr <= addr;
    core.MData <= data;
    wait until rising_edge(clk) and slave.SResp='1';
    wait for SIMDELAY;
    core.MCmd <= (others=>'0');
    core.MAddr <= (others=>'0');
    core.MData <= (others=>'0');    
    --wait until rising_edge(clk);
    return;
  end proc_write;

  --generic processor read
  procedure proc_read (signal core: out ocp_master; addr: std_logic_vector; data: std_logic_vector; signal clk: in std_logic) is
  begin
    wait for SIMDELAY;
    core.MCmd <= "00";
    core.MAddr <= addr;
    core.MData <= data;
    wait until rising_edge(clk);
    wait for SIMDELAY;
    core.MCmd <= (others=>'0');
    core.MAddr <= (others=>'0');
    core.MData <= (others=>'0');   
    --wait until rising_edge(clk);
    return;
  end proc_read;

  
end cmd_util;



