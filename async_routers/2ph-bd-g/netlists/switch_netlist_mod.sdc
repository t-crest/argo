###################################################################

# Created by write_sdc on Wed Mar 27 17:16:03 2013

###################################################################
set sdc_version 1.9

set_units -time ns -resistance kOhm -capacitance pF -power mW -voltage V       \
-current mA

set_disable_timing west_hpu/token_latch/controller/gate/latch/C8/A
set_disable_timing north_hpu/token_latch/controller/gate/latch/C8/A
set_disable_timing east_hpu/token_latch/controller/gate/latch/C8/A
set_disable_timing south_hpu/token_latch/controller/gate/latch/C8/A
set_disable_timing resource_hpu/token_latch/controller/gate/latch/C8/A

set_disable_timing [get_pins                                                   \
xbar_with_latches/ch_latch_0/controller/gate/latch/C8/B]
set_disable_timing [get_pins                                                   \
xbar_with_latches/ch_latch_1/controller/gate/latch/C8/B]
set_disable_timing [get_pins                                                   \
xbar_with_latches/ch_latch_2/controller/gate/latch/C8/B]
set_disable_timing [get_pins                                                   \
xbar_with_latches/ch_latch_3/controller/gate/latch/C8/B]
set_disable_timing [get_pins                                                   \
xbar_with_latches/ch_latch_4/controller/gate/latch/C8/B]
set_disable_timing [get_pins xbar_with_latches/crossbar/c_sync_ack/latch/C8/B]
set_disable_timing [get_pins xbar_with_latches/crossbar/c_sync_req/latch/C8/B]
set_disable_timing [get_pins                                                   \
resource_hpu/token_latch/controller/gate/latch/C8/B]
set_disable_timing [get_pins west_hpu/token_latch/controller/gate/latch/C8/B]
set_disable_timing [get_pins east_hpu/token_latch/controller/gate/latch/C8/B]
set_disable_timing [get_pins south_hpu/token_latch/controller/gate/latch/C8/B]
set_disable_timing [get_pins north_hpu/token_latch/controller/gate/latch/C8/B]
set_disable_timing [get_pins resource_in_latch/controller/gate/latch/C8/B]
set_disable_timing [get_pins west_in_latch/controller/gate/latch/C8/B]
set_disable_timing [get_pins east_in_latch/controller/gate/latch/C8/B]
set_disable_timing [get_pins south_in_latch/controller/gate/latch/C8/B]
set_disable_timing [get_pins north_in_latch/controller/gate/latch/C8/B]
set_ideal_network -no_propagate  [get_pins north_in_latch/U7/Z]
set_ideal_network -no_propagate  [get_pins xbar_with_latches/ch_latch_4/U8/Z]
set_ideal_network -no_propagate  [get_pins resource_hpu/token_latch/U7/Z]
set_ideal_network -no_propagate  [get_pins west_hpu/token_latch/U7/Z]
set_ideal_network -no_propagate  [get_pins east_hpu/token_latch/U7/Z]
set_ideal_network -no_propagate  [get_pins south_hpu/token_latch/U7/Z]
set_ideal_network -no_propagate  [get_pins north_hpu/token_latch/U7/Z]
set_ideal_network -no_propagate  [get_pins resource_in_latch/U7/Z]
set_ideal_network -no_propagate  [get_pins west_in_latch/U7/Z]
set_ideal_network -no_propagate  [get_pins east_in_latch/U7/Z]
set_ideal_network -no_propagate  [get_pins south_in_latch/U7/Z]
set_ideal_network -no_propagate  [get_pins xbar_with_latches/ch_latch_0/U8/Z]
set_ideal_network -no_propagate  [get_pins xbar_with_latches/ch_latch_1/U8/Z]
set_ideal_network -no_propagate  [get_pins xbar_with_latches/ch_latch_2/U8/Z]
set_ideal_network -no_propagate  [get_pins xbar_with_latches/ch_latch_3/U8/Z]
create_clock [list [get_pins north_in_latch/controller/lt_en] [get_pins                    \
south_in_latch/controller/lt_en] [get_pins east_in_latch/controller/lt_en]     \
[get_pins west_in_latch/controller/lt_en] [get_pins                            \
resource_in_latch/controller/lt_en] [get_pins                                  \
xbar_with_latches/ch_latch_4/controller/lt_en] [get_pins                       \
xbar_with_latches/ch_latch_3/controller/lt_en] [get_pins                       \
xbar_with_latches/ch_latch_2/controller/lt_en] [get_pins                       \
xbar_with_latches/ch_latch_1/controller/lt_en] [get_pins                       \
xbar_with_latches/ch_latch_0/controller/lt_en]]  -name clkM  -period 0.6  -waveform {0 0.3}
create_clock [list [get_pins north_hpu/token_latch/controller/lt_en] [get_pins             \
south_hpu/token_latch/controller/lt_en] [get_pins                              \
east_hpu/token_latch/controller/lt_en] [get_pins                               \
west_hpu/token_latch/controller/lt_en] [get_pins                               \
resource_hpu/token_latch/controller/lt_en]]  -name clkS  -period 0.6  -waveform {0.3 0.6}
set_max_delay 0.27  -from [get_pins north_hpu/I_0/A]  -to [get_pins north_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins north_hpu/I_0/A]  -to [get_pins north_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins south_hpu/I_0/A]  -to [get_pins south_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins south_hpu/I_0/A]  -to [get_pins south_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins east_hpu/I_0/A]  -to [get_pins east_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins east_hpu/I_0/A]  -to [get_pins east_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins west_hpu/I_0/A]  -to [get_pins west_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins west_hpu/I_0/A]  -to [get_pins west_hpu/I_1/Z]
set_max_delay 0.27  -from [get_pins resource_hpu/I_0/A]  -to [get_pins resource_hpu/I_1/Z]
set_min_delay 0.22  -from [get_pins resource_hpu/I_0/A]  -to [get_pins resource_hpu/I_1/Z]
set_min_delay 0.1  -from [get_pins north_in_latch/controller/I_0/A]  -to [get_pins north_in_latch/controller/gate/c]
set_min_delay 0.1  -from [get_pins east_in_latch/controller/I_0/A]  -to [get_pins east_in_latch/controller/gate/c]
set_min_delay 0.1  -from [get_pins south_in_latch/controller/I_0/A]  -to [get_pins south_in_latch/controller/gate/c]
set_min_delay 0.1  -from [get_pins west_in_latch/controller/I_0/A]  -to [get_pins west_in_latch/controller/gate/c]
set_min_delay 0.1  -from [get_pins resource_in_latch/controller/I_0/A]  -to [get_pins resource_in_latch/controller/gate/c]
set_min_delay 0.2  -from [get_pins north_hpu/token_latch/controller/I_0/A]  -to [get_pins north_hpu/token_latch/controller/gate/c]
set_min_delay 0.2  -from [get_pins east_hpu/token_latch/controller/I_0/A]  -to [get_pins east_hpu/token_latch/controller/gate/c]
set_min_delay 0.2  -from [get_pins south_hpu/token_latch/controller/I_0/A]  -to [get_pins south_hpu/token_latch/controller/gate/c]
set_min_delay 0.2  -from [get_pins west_hpu/token_latch/controller/I_0/A]  -to [get_pins west_hpu/token_latch/controller/gate/c]
set_min_delay 0.2  -from [get_pins resource_hpu/token_latch/controller/I_0/A]  -to [get_pins resource_hpu/token_latch/controller/gate/c]
