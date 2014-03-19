--  Developer  :  Mikkel Stensgaard  -- mikkel@stensgaard.org
--                Student: s001434
--                DTU, Technical University of Denmark

library ieee;
use ieee.std_logic_1164.all;

package AS_FPGA is

component AS_Delay
generic(size : natural := 10);
port(
     d : in std_logic;
     z : out std_logic);
end component;

component AS_C2
generic(reset_value : bit := '0');
port( 
     in1:    in  std_logic;
     in2:    in  std_logic;
     reset:  in  std_logic;
     z:      out std_logic);
end component;

component AS_bd_4p_Demux
generic (width : positive := 8);
port(
     --in
     req_in: in  std_logic;
     ack_in: out std_logic;
     dat_in: in  std_logic_vector((width-1) downto 0);
     --out1
     req_out1: out std_logic;
     ack_out1: in  std_logic;
     dat_out1: out std_logic_vector((width-1) downto 0);
     --out2
     req_out2: out std_logic;
     ack_out2: in  std_logic;
     dat_out2: out std_logic_vector((width-1) downto 0);
     --ctl
     ctl:     in  std_logic;
     req_ctl: in  std_logic;
     ack_ctl: out std_logic;
     --reset
     reset:   in  std_logic);
end component;


component AS_bd_4p_Mux
generic(width : positive := 8);
port(
     --in1
     req_in1: in  std_logic;
     ack_in1: out std_logic;
     dat_in1: in  std_logic_vector((width-1) downto 0);
     --in2
     req_in2: in  std_logic;
     ack_in2: out std_logic;
     dat_in2: in  std_logic_vector((width-1) downto 0);
     --out
     req_out: out std_logic;
     ack_out: in  std_logic;
     dat_out: out std_logic_vector((width-1) downto 0);
     --ctl
     ctl:     in  std_logic;
     req_ctl: in  std_logic;
     ack_ctl: out std_logic;
     --reset
     reset:   in  std_logic);
end component;

component AS_bd_4p_Latch_ud
generic (width        : positive := 8;
        reset_status : bit := '0';
        reset_value  : natural := 0;
        delay        : natural := 0);
port(  
     ack_out:  in  std_logic;
     req_in:  in  std_logic;
     dat_in:  in  std_logic_vector((width-1) downto 0);
     reset:   in  std_logic;
     ack_in : out std_logic;
     req_out: out std_logic;
     dat_out: out std_logic_vector((width-1) downto 0));
end component;

component AS_bd_4p_Latch_sd
generic (width        : positive := 8;
        reset_status : bit := '0';
        reset_value  : natural := 0;
        delay        : natural := 0);
port(  
     ack_out:  in  std_logic;
     req_in:  in  std_logic;
     dat_in:  in  std_logic_vector((width-1) downto 0);
     reset:   in  std_logic;
     ack_in : out std_logic;
     req_out: out std_logic;
     dat_out: out std_logic_vector((width-1) downto 0));
end component;

component AS_bd_4p_Latch_fd
generic (width        : positive := 8;
        reset_status : bit := '0';
        reset_value  : natural := 0;
        delay        : natural := 0);
port(  
     ack_out:  in  std_logic;
     req_in:  in  std_logic;
     dat_in:  in  std_logic_vector((width-1) downto 0);
     reset:   in  std_logic;
     ack_in : out std_logic;
     req_out: out std_logic;
     dat_out: out std_logic_vector((width-1) downto 0));
end component;

component AS_bd_4p_Fork
generic(width : positive := 8);
port(
     reset : in  std_logic;
     x_req : in  std_logic;
     y_ack : in  std_logic;
     z_ack : in  std_logic;
     x     : in  std_logic_vector((width-1) downto 0);
     x_ack : out std_logic;
     y_req : out std_logic;
     z_req : out std_logic;
     y     : out std_logic_vector((width-1) downto 0);
     z     : out std_logic_vector((width-1)downto 0));
end component;

component AS_bd_4p_Merge
generic(width : positive := 8);
port(
     reset:  in  std_logic;
     x_req:  in  std_logic;
     y_req:  in  std_logic;
     z_ack:  in  std_logic;
     x    :  in  std_logic_vector((width-1) downto 0);
     y    :  in std_logic_vector((width-1) downto 0);
     x_ack: out std_logic;
     y_ack: out std_logic;
     z_req: out std_logic;
     z    : out std_logic_vector((width-1) downto 0));
end component;

end package AS_FPGA;