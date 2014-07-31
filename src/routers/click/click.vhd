-------------------------------------------------------------------------------
-- Title      : click element controller
-- Project    : 
-------------------------------------------------------------------------------
-- File       : click.vhd
-- Author     : Christoph Müller  <chm@AdoraBelle.local>
-- Company    : 
-- Created    : 2014-04-25
-- Last update: 2014-07-31
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Handshake controller based on the click element paper
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-04-25  1.0      chm	Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use work.config.all;
use work.config_types.all;
use work.click_package.all;

entity click is
  generic (
    -- reset value for the state register
    init_phase : std_logic := '1';
    -- reset gate the click
    reset_gate_click: boolean := true;
    -- number of acknowledge inputs
    ACK_N       : integer   := 1;
    -- number of request inputs
    REQ_N       : integer   := 1);

  port (
    req_i : in  std_logic_vector(REQ_N - 1 downto 0);
    ack_o : in  std_logic_vector(ACK_N - 1 downto 0);
    reset : in  std_logic;
    ack_i : out std_logic;
    req_o : out std_logic;
    click : out std_logic);
end entity click;

architecture behav of click is
  signal req, req_next : std_logic;
  signal click_int, click_pre_gating    : std_logic;
begin  -- architecture behav
  
  -- purpose: implement the combinatorical part of the controller
  -- type   : combinational
  -- inputs : req_i, ack_o, req
  -- outputs: click_int, req_next
  comb : process (req_i, ack_o, req , reset) is
    variable and1 : std_logic;
    variable and2 : std_logic;
  begin  -- process and1_or_and2
    and1 := req;
    and2 := not req;
    for i in req_i'range loop
      and1 := and1 and not req_i(i);
      and2 := and2 and req_i(i);
    end loop;  -- i
    for j in ack_o'range loop
      and1 := and1 and ack_o(j);
      and2 := and2 and not ack_o(j);
    end loop;  -- j
    click_pre_gating <= transport (and1 or and2) after delay;
    req_next  <= not req;
  end process comb;

  -- in case reset click gating is needed
  reset_gate: if reset_gate_click generate
    click_int <= (click_pre_gating and not reset);
  end generate reset_gate;
  
  not_reset_gate: if not reset_gate_click generate
    click_int <= click_pre_gating;
  end generate not_reset_gate;
    

  -- assign outputs
  ack_i <= transport req after delay;
  req_o <= transport req after 2*delay;
  click <= click_int ;

  -- purpose: click state register
  -- type   : sequential
  -- inputs : click_int, nRST
  -- outputs: 
  state_reg : process (click_int, reset) is
  begin  -- process state_reg
    if reset = '1' then                 -- asynchronous reset (active low)
      req <= init_phase;
    elsif click_int'event and click_int = '1' then  -- rising clock edge
      req <= req_next;
    end if;
  end process state_reg;
end architecture behav;
