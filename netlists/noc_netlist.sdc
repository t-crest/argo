###################################################################

# Created by write_sdc on Tue May 28 17:53:40 2013

###################################################################
set sdc_version 1.9

set_units -time ns -resistance kOhm -capacitance pF -power mW -voltage V       \
-current mA
set_disable_timing [get_pins                                                   \
node_0_0/r/xbar_with_latches/ch_latch_0/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_0/r/xbar_with_latches/ch_latch_1/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_0/r/xbar_with_latches/ch_latch_2/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_0/r/xbar_with_latches/ch_latch_3/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_0/r/xbar_with_latches/ch_latch_4/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_0/r/xbar_with_latches/crossbar/c_sync_ack/latch/C9/B]
set_disable_timing [get_pins                                                   \
node_0_0/r/xbar_with_latches/crossbar/c_sync_req/latch/C9/B]
set_disable_timing [get_pins                                                   \
node_0_0/r/resource_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_0/r/west_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_0/r/east_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_0/r/south_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_0/r/north_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_0/r/resource_in_latch/controller/r_next_reg/G]
set_disable_timing [get_pins node_0_0/r/west_in_latch/controller/r_next_reg/G]
set_disable_timing [get_pins node_0_0/r/east_in_latch/controller/r_next_reg/G]
set_disable_timing [get_pins node_0_0/r/south_in_latch/controller/r_next_reg/G]
set_disable_timing [get_pins node_0_0/r/north_in_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_1/r/xbar_with_latches/ch_latch_0/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_1/r/xbar_with_latches/ch_latch_1/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_1/r/xbar_with_latches/ch_latch_2/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_1/r/xbar_with_latches/ch_latch_3/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_1/r/xbar_with_latches/ch_latch_4/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_1/r/xbar_with_latches/crossbar/c_sync_ack/latch/C9/B]
set_disable_timing [get_pins                                                   \
node_0_1/r/xbar_with_latches/crossbar/c_sync_req/latch/C9/B]
set_disable_timing [get_pins                                                   \
node_0_1/r/resource_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_1/r/west_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_1/r/east_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_1/r/south_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_1/r/north_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_0_1/r/resource_in_latch/controller/r_next_reg/G]
set_disable_timing [get_pins node_0_1/r/west_in_latch/controller/r_next_reg/G]
set_disable_timing [get_pins node_0_1/r/east_in_latch/controller/r_next_reg/G]
set_disable_timing [get_pins node_0_1/r/south_in_latch/controller/r_next_reg/G]
set_disable_timing [get_pins node_0_1/r/north_in_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_0/r/xbar_with_latches/ch_latch_0/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_0/r/xbar_with_latches/ch_latch_1/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_0/r/xbar_with_latches/ch_latch_2/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_0/r/xbar_with_latches/ch_latch_3/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_0/r/xbar_with_latches/ch_latch_4/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_0/r/xbar_with_latches/crossbar/c_sync_ack/latch/C9/B]
set_disable_timing [get_pins                                                   \
node_1_0/r/xbar_with_latches/crossbar/c_sync_req/latch/C9/B]
set_disable_timing [get_pins                                                   \
node_1_0/r/resource_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_0/r/west_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_0/r/east_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_0/r/south_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_0/r/north_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_0/r/resource_in_latch/controller/r_next_reg/G]
set_disable_timing [get_pins node_1_0/r/west_in_latch/controller/r_next_reg/G]
set_disable_timing [get_pins node_1_0/r/east_in_latch/controller/r_next_reg/G]
set_disable_timing [get_pins node_1_0/r/south_in_latch/controller/r_next_reg/G]
set_disable_timing [get_pins node_1_0/r/north_in_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_1/r/xbar_with_latches/ch_latch_0/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_1/r/xbar_with_latches/ch_latch_1/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_1/r/xbar_with_latches/ch_latch_2/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_1/r/xbar_with_latches/ch_latch_3/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_1/r/xbar_with_latches/ch_latch_4/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_1/r/xbar_with_latches/crossbar/c_sync_ack/latch/C9/B]
set_disable_timing [get_pins                                                   \
node_1_1/r/xbar_with_latches/crossbar/c_sync_req/latch/C9/B]
set_disable_timing [get_pins                                                   \
node_1_1/r/resource_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_1/r/west_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_1/r/east_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_1/r/south_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_1/r/north_hpu/token_latch/controller/r_next_reg/G]
set_disable_timing [get_pins                                                   \
node_1_1/r/resource_in_latch/controller/r_next_reg/G]
set_disable_timing [get_pins node_1_1/r/west_in_latch/controller/r_next_reg/G]
set_disable_timing [get_pins node_1_1/r/east_in_latch/controller/r_next_reg/G]
set_disable_timing [get_pins node_1_1/r/south_in_latch/controller/r_next_reg/G]
set_disable_timing [get_pins node_1_1/r/north_in_latch/controller/r_next_reg/G]
set_ideal_network -no_propagate  [get_pins node_1_1/r/north_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/north_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/xbar_with_latches/ch_latch_4/U9/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/xbar_with_latches/ch_latch_4/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/resource_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/west_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/east_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/south_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/north_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/resource_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/west_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/east_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/south_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/north_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/resource_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/west_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/east_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/south_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/north_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/resource_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/west_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/east_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/south_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/north_hpu/token_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/resource_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/west_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/east_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/south_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/north_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/resource_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/west_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/east_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/south_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/north_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/resource_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/west_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/east_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/south_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/north_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/resource_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/west_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/east_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/south_in_latch/U8/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/resource_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/west_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/east_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/south_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/north_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/resource_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/west_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/east_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/south_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/north_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/resource_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/west_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/east_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/south_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/north_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/resource_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/west_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/east_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/south_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/north_hpu/token_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/resource_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/west_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/east_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/south_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/north_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/resource_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/west_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/east_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/south_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/north_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/resource_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/west_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/east_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/south_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/north_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/resource_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/west_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/east_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/south_in_latch/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/xbar_with_latches/ch_latch_0/U9/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/xbar_with_latches/ch_latch_1/U9/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/xbar_with_latches/ch_latch_2/U9/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/xbar_with_latches/ch_latch_3/U9/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/xbar_with_latches/ch_latch_4/U9/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/xbar_with_latches/ch_latch_0/U9/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/xbar_with_latches/ch_latch_1/U9/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/xbar_with_latches/ch_latch_2/U9/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/xbar_with_latches/ch_latch_3/U9/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/xbar_with_latches/ch_latch_4/U9/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/xbar_with_latches/ch_latch_0/U9/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/xbar_with_latches/ch_latch_1/U9/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/xbar_with_latches/ch_latch_2/U9/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/xbar_with_latches/ch_latch_3/U9/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/xbar_with_latches/ch_latch_4/U9/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/xbar_with_latches/ch_latch_0/U9/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/xbar_with_latches/ch_latch_1/U9/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/xbar_with_latches/ch_latch_2/U9/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/xbar_with_latches/ch_latch_3/U9/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/xbar_with_latches/ch_latch_0/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/xbar_with_latches/ch_latch_1/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/xbar_with_latches/ch_latch_2/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/xbar_with_latches/ch_latch_3/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_0/r/xbar_with_latches/ch_latch_4/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/xbar_with_latches/ch_latch_0/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/xbar_with_latches/ch_latch_1/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/xbar_with_latches/ch_latch_2/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/xbar_with_latches/ch_latch_3/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_0_1/r/xbar_with_latches/ch_latch_4/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/xbar_with_latches/ch_latch_0/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/xbar_with_latches/ch_latch_1/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/xbar_with_latches/ch_latch_2/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/xbar_with_latches/ch_latch_3/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_0/r/xbar_with_latches/ch_latch_4/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/xbar_with_latches/ch_latch_0/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/xbar_with_latches/ch_latch_1/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/xbar_with_latches/ch_latch_2/controller/I_0/Z]
set_ideal_network -no_propagate  [get_pins node_1_1/r/xbar_with_latches/ch_latch_3/controller/I_0/Z]
create_clock [get_ports n_clk]  -name clkNI  -period 2  -waveform {0 1}
create_clock [get_ports p_clk]  -name clkP  -period 2  -waveform {0 1}
create_clock [list [get_pins node_1_1/r/north_in_latch/controller/I_0/Z] [get_pins         \
node_1_1/r/xbar_with_latches/ch_latch_4/controller/I_0/Z] [get_pins            \
node_0_1/r/resource_hpu/token_latch/controller/I_0/Z] [get_pins                \
node_0_1/r/west_hpu/token_latch/controller/I_0/Z] [get_pins                    \
node_0_1/r/east_hpu/token_latch/controller/I_0/Z] [get_pins                    \
node_0_1/r/south_hpu/token_latch/controller/I_0/Z] [get_pins                   \
node_0_1/r/north_hpu/token_latch/controller/I_0/Z] [get_pins                   \
node_1_0/r/resource_hpu/token_latch/controller/I_0/Z] [get_pins                \
node_1_0/r/west_hpu/token_latch/controller/I_0/Z] [get_pins                    \
node_1_0/r/east_hpu/token_latch/controller/I_0/Z] [get_pins                    \
node_1_0/r/south_hpu/token_latch/controller/I_0/Z] [get_pins                   \
node_1_0/r/north_hpu/token_latch/controller/I_0/Z] [get_pins                   \
node_0_0/r/resource_in_latch/controller/I_0/Z] [get_pins                       \
node_0_0/r/west_in_latch/controller/I_0/Z] [get_pins                           \
node_0_0/r/east_in_latch/controller/I_0/Z] [get_pins                           \
node_0_0/r/south_in_latch/controller/I_0/Z] [get_pins                          \
node_0_0/r/north_in_latch/controller/I_0/Z] [get_pins                          \
node_1_1/r/resource_in_latch/controller/I_0/Z] [get_pins                       \
node_1_1/r/west_in_latch/controller/I_0/Z] [get_pins                           \
node_1_1/r/east_in_latch/controller/I_0/Z] [get_pins                           \
node_1_1/r/south_in_latch/controller/I_0/Z] [get_pins                          \
node_0_0/r/xbar_with_latches/ch_latch_0/controller/I_0/Z] [get_pins            \
node_0_0/r/xbar_with_latches/ch_latch_1/controller/I_0/Z] [get_pins            \
node_0_0/r/xbar_with_latches/ch_latch_2/controller/I_0/Z] [get_pins            \
node_0_0/r/xbar_with_latches/ch_latch_3/controller/I_0/Z] [get_pins            \
node_0_0/r/xbar_with_latches/ch_latch_4/controller/I_0/Z] [get_pins            \
node_1_1/r/xbar_with_latches/ch_latch_0/controller/I_0/Z] [get_pins            \
node_1_1/r/xbar_with_latches/ch_latch_1/controller/I_0/Z] [get_pins            \
node_1_1/r/xbar_with_latches/ch_latch_2/controller/I_0/Z] [get_pins            \
node_1_1/r/xbar_with_latches/ch_latch_3/controller/I_0/Z]]  -name clkM  -period 0.8  -waveform {0 0.4}
create_clock [list [get_pins node_1_1/r/north_hpu/token_latch/controller/I_0/Z] [get_pins  \
node_1_1/r/south_hpu/token_latch/controller/I_0/Z] [get_pins                   \
node_1_1/r/east_hpu/token_latch/controller/I_0/Z] [get_pins                    \
node_1_1/r/west_hpu/token_latch/controller/I_0/Z] [get_pins                    \
node_1_1/r/resource_hpu/token_latch/controller/I_0/Z] [get_pins                \
node_0_0/r/resource_hpu/token_latch/controller/I_0/Z] [get_pins                \
node_0_0/r/west_hpu/token_latch/controller/I_0/Z] [get_pins                    \
node_0_0/r/east_hpu/token_latch/controller/I_0/Z] [get_pins                    \
node_0_0/r/south_hpu/token_latch/controller/I_0/Z] [get_pins                   \
node_0_0/r/north_hpu/token_latch/controller/I_0/Z] [get_pins                   \
node_0_1/r/resource_in_latch/controller/I_0/Z] [get_pins                       \
node_0_1/r/west_in_latch/controller/I_0/Z] [get_pins                           \
node_0_1/r/east_in_latch/controller/I_0/Z] [get_pins                           \
node_0_1/r/south_in_latch/controller/I_0/Z] [get_pins                          \
node_0_1/r/north_in_latch/controller/I_0/Z] [get_pins                          \
node_1_0/r/resource_in_latch/controller/I_0/Z] [get_pins                       \
node_1_0/r/west_in_latch/controller/I_0/Z] [get_pins                           \
node_1_0/r/east_in_latch/controller/I_0/Z] [get_pins                           \
node_1_0/r/south_in_latch/controller/I_0/Z] [get_pins                          \
node_1_0/r/north_in_latch/controller/I_0/Z] [get_pins                          \
node_0_1/r/xbar_with_latches/ch_latch_0/controller/I_0/Z] [get_pins            \
node_0_1/r/xbar_with_latches/ch_latch_1/controller/I_0/Z] [get_pins            \
node_0_1/r/xbar_with_latches/ch_latch_2/controller/I_0/Z] [get_pins            \
node_0_1/r/xbar_with_latches/ch_latch_3/controller/I_0/Z] [get_pins            \
node_0_1/r/xbar_with_latches/ch_latch_4/controller/I_0/Z] [get_pins            \
node_1_0/r/xbar_with_latches/ch_latch_0/controller/I_0/Z] [get_pins            \
node_1_0/r/xbar_with_latches/ch_latch_1/controller/I_0/Z] [get_pins            \
node_1_0/r/xbar_with_latches/ch_latch_2/controller/I_0/Z] [get_pins            \
node_1_0/r/xbar_with_latches/ch_latch_3/controller/I_0/Z] [get_pins            \
node_1_0/r/xbar_with_latches/ch_latch_4/controller/I_0/Z]]  -name clkS  -period 0.8  -waveform {0.4 0.8}
set_max_delay 0.27  -from [get_pins node_0_0/r/north_hpu/I_0/A]  -to [get_pins node_0_0/r/north_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_0_0/r/north_hpu/I_0/A]  -to [get_pins node_0_0/r/north_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins node_0_0/r/south_hpu/I_0/A]  -to [get_pins node_0_0/r/south_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_0_0/r/south_hpu/I_0/A]  -to [get_pins node_0_0/r/south_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins node_0_0/r/east_hpu/I_0/A]  -to [get_pins node_0_0/r/east_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_0_0/r/east_hpu/I_0/A]  -to [get_pins node_0_0/r/east_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins node_0_0/r/west_hpu/I_0/A]  -to [get_pins node_0_0/r/west_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_0_0/r/west_hpu/I_0/A]  -to [get_pins node_0_0/r/west_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins node_0_0/r/resource_hpu/I_0/A]  -to [get_pins node_0_0/r/resource_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_0_0/r/resource_hpu/I_0/A]  -to [get_pins node_0_0/r/resource_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins node_0_1/r/north_hpu/I_0/A]  -to [get_pins node_0_1/r/north_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_0_1/r/north_hpu/I_0/A]  -to [get_pins node_0_1/r/north_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins node_0_1/r/south_hpu/I_0/A]  -to [get_pins node_0_1/r/south_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_0_1/r/south_hpu/I_0/A]  -to [get_pins node_0_1/r/south_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins node_0_1/r/east_hpu/I_0/A]  -to [get_pins node_0_1/r/east_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_0_1/r/east_hpu/I_0/A]  -to [get_pins node_0_1/r/east_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins node_0_1/r/west_hpu/I_0/A]  -to [get_pins node_0_1/r/west_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_0_1/r/west_hpu/I_0/A]  -to [get_pins node_0_1/r/west_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins node_0_1/r/resource_hpu/I_0/A]  -to [get_pins node_0_1/r/resource_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_0_1/r/resource_hpu/I_0/A]  -to [get_pins node_0_1/r/resource_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins node_1_0/r/north_hpu/I_0/A]  -to [get_pins node_1_0/r/north_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_1_0/r/north_hpu/I_0/A]  -to [get_pins node_1_0/r/north_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins node_1_0/r/south_hpu/I_0/A]  -to [get_pins node_1_0/r/south_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_1_0/r/south_hpu/I_0/A]  -to [get_pins node_1_0/r/south_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins node_1_0/r/east_hpu/I_0/A]  -to [get_pins node_1_0/r/east_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_1_0/r/east_hpu/I_0/A]  -to [get_pins node_1_0/r/east_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins node_1_0/r/west_hpu/I_0/A]  -to [get_pins node_1_0/r/west_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_1_0/r/west_hpu/I_0/A]  -to [get_pins node_1_0/r/west_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins node_1_0/r/resource_hpu/I_0/A]  -to [get_pins node_1_0/r/resource_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_1_0/r/resource_hpu/I_0/A]  -to [get_pins node_1_0/r/resource_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins node_1_1/r/north_hpu/I_0/A]  -to [get_pins node_1_1/r/north_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_1_1/r/north_hpu/I_0/A]  -to [get_pins node_1_1/r/north_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins node_1_1/r/south_hpu/I_0/A]  -to [get_pins node_1_1/r/south_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_1_1/r/south_hpu/I_0/A]  -to [get_pins node_1_1/r/south_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins node_1_1/r/east_hpu/I_0/A]  -to [get_pins node_1_1/r/east_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_1_1/r/east_hpu/I_0/A]  -to [get_pins node_1_1/r/east_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins node_1_1/r/west_hpu/I_0/A]  -to [get_pins node_1_1/r/west_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_1_1/r/west_hpu/I_0/A]  -to [get_pins node_1_1/r/west_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins node_1_1/r/resource_hpu/I_0/A]  -to [get_pins node_1_1/r/resource_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins node_1_1/r/resource_hpu/I_0/A]  -to [get_pins node_1_1/r/resource_hpu/I_1/Z]
set_max_delay 0.18  -from [get_pins node_0_0/r/xbar_with_latches/crossbar/I_0/A]  -to [get_pins node_0_0/r/xbar_with_latches/crossbar/I_1/Z]
set_min_delay 0.12  -from [get_pins node_0_0/r/xbar_with_latches/crossbar/I_0/A]  -to [get_pins node_0_0/r/xbar_with_latches/crossbar/I_1/Z]
set_max_delay 0.18  -from [get_pins node_0_1/r/xbar_with_latches/crossbar/I_0/A]  -to [get_pins node_0_1/r/xbar_with_latches/crossbar/I_1/Z]
set_min_delay 0.12  -from [get_pins node_0_1/r/xbar_with_latches/crossbar/I_0/A]  -to [get_pins node_0_1/r/xbar_with_latches/crossbar/I_1/Z]
set_max_delay 0.18  -from [get_pins node_1_0/r/xbar_with_latches/crossbar/I_0/A]  -to [get_pins node_1_0/r/xbar_with_latches/crossbar/I_1/Z]
set_min_delay 0.12  -from [get_pins node_1_0/r/xbar_with_latches/crossbar/I_0/A]  -to [get_pins node_1_0/r/xbar_with_latches/crossbar/I_1/Z]
set_max_delay 0.18  -from [get_pins node_1_1/r/xbar_with_latches/crossbar/I_0/A]  -to [get_pins node_1_1/r/xbar_with_latches/crossbar/I_1/Z]
set_min_delay 0.12  -from [get_pins node_1_1/r/xbar_with_latches/crossbar/I_0/A]  -to [get_pins node_1_1/r/xbar_with_latches/crossbar/I_1/Z]
set_min_delay 0.45  -from [get_pins node_1_1/I_1/A]  -to [get_pins node_1_1/I_2/Z]
set_min_delay 0.45  -from [get_pins node_1_0/I_1/A]  -to [get_pins node_1_0/I_2/Z]
set_min_delay 0.45  -from [get_pins node_0_1/I_1/A]  -to [get_pins node_0_1/I_2/Z]
set_min_delay 0.45  -from [get_pins node_0_0/I_1/A]  -to [get_pins node_0_0/I_2/Z]
set_min_delay 0.3  -from [get_pins I_0/A]  -to [get_pins I_1/Z]
set_min_delay 0.3  -from [get_pins I_2/A]  -to [get_pins I_3/Z]
set_min_delay 0.3  -from [get_pins I_4/A]  -to [get_pins I_5/Z]
set_min_delay 0.3  -from [get_pins I_6/A]  -to [get_pins I_7/Z]
set_min_delay 0.3  -from [get_pins I_8/A]  -to [get_pins I_9/Z]
set_min_delay 0.3  -from [get_pins I_10/A]  -to [get_pins I_11/Z]
set_min_delay 0.3  -from [get_pins I_12/A]  -to [get_pins I_13/Z]
set_min_delay 0.3  -from [get_pins I_14/A]  -to [get_pins I_15/Z]
set_min_delay 0.3  -from [get_pins I_16/A]  -to [get_pins I_17/Z]
set_min_delay 0.3  -from [get_pins I_18/A]  -to [get_pins I_19/Z]
set_min_delay 0.3  -from [get_pins I_20/A]  -to [get_pins I_21/Z]
set_min_delay 0.3  -from [get_pins I_22/A]  -to [get_pins I_23/Z]
set_min_delay 0.3  -from [get_pins I_24/A]  -to [get_pins I_25/Z]
set_min_delay 0.3  -from [get_pins I_26/A]  -to [get_pins I_27/Z]
set_min_delay 0.3  -from [get_pins I_28/A]  -to [get_pins I_29/Z]
set_min_delay 0.3  -from [get_pins I_30/A]  -to [get_pins I_31/Z]
set_min_delay 0.3  -from [get_pins I_32/A]  -to [get_pins I_33/Z]
set_min_delay 0.3  -from [get_pins I_34/A]  -to [get_pins I_35/Z]
set_min_delay 0.3  -from [get_pins I_36/A]  -to [get_pins I_37/Z]
set_min_delay 0.3  -from [get_pins I_38/A]  -to [get_pins I_39/Z]
set_min_delay 0.3  -from [get_pins I_40/A]  -to [get_pins I_41/Z]
set_min_delay 0.3  -from [get_pins I_42/A]  -to [get_pins I_43/Z]
set_min_delay 0.3  -from [get_pins I_44/A]  -to [get_pins I_45/Z]
set_min_delay 0.3  -from [get_pins I_46/A]  -to [get_pins I_47/Z]
set_min_delay 0.3  -from [get_pins I_48/A]  -to [get_pins I_49/Z]
set_min_delay 0.3  -from [get_pins I_50/A]  -to [get_pins I_51/Z]
set_min_delay 0.3  -from [get_pins I_52/A]  -to [get_pins I_53/Z]
set_min_delay 0.3  -from [get_pins I_54/A]  -to [get_pins I_55/Z]
set_min_delay 0.3  -from [get_pins I_56/A]  -to [get_pins I_57/Z]
set_min_delay 0.3  -from [get_pins I_58/A]  -to [get_pins I_59/Z]
set_min_delay 0.3  -from [get_pins I_60/A]  -to [get_pins I_61/Z]
set_min_delay 0.3  -from [get_pins I_62/A]  -to [get_pins I_63/Z]
