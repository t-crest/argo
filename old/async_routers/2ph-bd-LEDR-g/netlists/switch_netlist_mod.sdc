###################################################################

# Created by write_sdc on Mon Nov 19 21:28:48 2012

###################################################################
set sdc_version 1.9

set_units -time ns -resistance kOhm -capacitance pF -power mW -voltage V       \
-current mA
set_disable_timing [get_pins xbar_with_latches/crossbar/c_sync_ack/latch/C8/B]
set_disable_timing [get_pins xbar_with_latches/crossbar/c_sync_req/latch/C8/B]
set_disable_timing [get_pins                                                   \
resource_hpu/token_latch/controller/gate/latch/C8/B]
set_disable_timing [get_pins west_hpu/token_latch/controller/gate/latch/C8/B]
set_disable_timing [get_pins east_hpu/token_latch/controller/gate/latch/C8/B]
set_disable_timing [get_pins south_hpu/token_latch/controller/gate/latch/C8/B]
set_disable_timing [get_pins north_hpu/token_latch/controller/gate/latch/C8/B]
set_disable_timing [get_pins                                                   \
resource_in_latch/latch_controller/gate/latch/C8/B]
set_disable_timing [get_pins resource_in_latch/data_ch/latch/C8/B]
set_disable_timing [get_pins resource_in_latch/data_cd_c/latch/C8/B]
set_disable_timing [get_pins west_in_latch/latch_controller/gate/latch/C8/B]
set_disable_timing [get_pins west_in_latch/data_ch/latch/C8/B]
set_disable_timing [get_pins west_in_latch/data_cd_c/latch/C8/B]
set_disable_timing [get_pins east_in_latch/latch_controller/gate/latch/C8/B]
set_disable_timing [get_pins east_in_latch/data_ch/latch/C8/B]
set_disable_timing [get_pins east_in_latch/data_cd_c/latch/C8/B]
set_disable_timing [get_pins south_in_latch/latch_controller/gate/latch/C8/B]
set_disable_timing [get_pins south_in_latch/data_ch/latch/C8/B]
set_disable_timing [get_pins south_in_latch/data_cd_c/latch/C8/B]
set_disable_timing [get_pins north_in_latch/latch_controller/gate/latch/C8/B]
set_disable_timing [get_pins north_in_latch/data_ch/latch/C8/B]
set_disable_timing [get_pins north_in_latch/data_cd_c/latch/C8/B]
create_clock [list [get_pins north_in_latch/latch_controller/lt_en] [get_pins              \
south_in_latch/latch_controller/lt_en] [get_pins                               \
east_in_latch/latch_controller/lt_en] [get_pins                                \
west_in_latch/latch_controller/lt_en] [get_pins                                \
resource_in_latch/latch_controller/lt_en] [get_pins                            \
xbar_with_latches/ch_latch_4/C214/Z] [get_pins                                 \
xbar_with_latches/ch_latch_0/C214/Z] [get_pins                                 \
xbar_with_latches/ch_latch_1/C214/Z] [get_pins                                 \
xbar_with_latches/ch_latch_2/C214/Z] [get_pins                                 \
xbar_with_latches/ch_latch_3/C214/Z] [get_pins                                 \
xbar_with_latches/ch_latch_4/C215/Z] [get_pins                                 \
xbar_with_latches/ch_latch_0/C215/Z] [get_pins                                 \
xbar_with_latches/ch_latch_1/C215/Z] [get_pins                                 \
xbar_with_latches/ch_latch_2/C215/Z] [get_pins                                 \
xbar_with_latches/ch_latch_3/C215/Z]]  -name clkM  -period 2  -waveform {0 1}
create_clock [list [get_pins north_hpu/token_latch/controller/lt_en] [get_pins             \
south_hpu/token_latch/controller/lt_en] [get_pins                              \
east_hpu/token_latch/controller/lt_en] [get_pins                               \
west_hpu/token_latch/controller/lt_en] [get_pins                               \
resource_hpu/token_latch/controller/lt_en]]  -name clkS  -period 2  -waveform {1 2}

set_max_delay 0.42  -from [get_pins north_in_latch/LEDR_link_f]  -to [get_pins north_in_latch/latch_controller/Rin]
set_max_delay 0.42  -from [get_pins south_in_latch/LEDR_link_f]  -to [get_pins south_in_latch/latch_controller/Rin]
set_max_delay 0.42  -from [get_pins east_in_latch/LEDR_link_f]  -to [get_pins east_in_latch/latch_controller/Rin]
set_max_delay 0.42  -from [get_pins west_in_latch/LEDR_link_f]  -to [get_pins west_in_latch/latch_controller/Rin]
set_max_delay 0.42  -from [get_pins resource_in_latch/LEDR_link_f]  -to [get_pins resource_in_latch/latch_controller/Rin]

set_disable_timing west_hpu/token_latch/controller/gate/latch/C8/A
set_disable_timing north_hpu/token_latch/controller/gate/latch/C8/A
set_disable_timing east_hpu/token_latch/controller/gate/latch/C8/A
set_disable_timing south_hpu/token_latch/controller/gate/latch/C8/A
set_disable_timing resource_hpu/token_latch/controller/gate/latch/C8/A


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
set_max_delay 0.44  -from [get_pins xbar_with_latches/crossbar/I_0/A]  -to [get_pins xbar_with_latches/crossbar/I_1/Z]
set_min_delay 0.3  -from [get_pins xbar_with_latches/crossbar/I_0/A]  -to [get_pins xbar_with_latches/crossbar/I_1/Z]
set_max_delay 0.47  -from [get_pins north_hpu/token_latch/controller/gate/a]  -to [get_pins north_hpu/token_latch/controller/I_0/Z]
set_max_delay 0.47  -from [get_pins south_hpu/token_latch/controller/gate/a]  -to [get_pins south_hpu/token_latch/controller/I_0/Z]
set_max_delay 0.47  -from [get_pins east_hpu/token_latch/controller/gate/a]  -to [get_pins east_hpu/token_latch/controller/I_0/Z]
set_max_delay 0.47  -from [get_pins west_hpu/token_latch/controller/gate/a]  -to [get_pins west_hpu/token_latch/controller/I_0/Z]
set_max_delay 0.47  -from [get_pins resource_hpu/token_latch/controller/gate/a]  -to [get_pins resource_hpu/token_latch/controller/I_0/Z]
set_min_delay 0.15  -from [get_pins xbar_with_latches/ch_latch_0/ack_reg/Q]  -to [get_pins xbar_with_latches/ch_latch_0/C214/Z]
set_min_delay 0.15  -from [get_pins xbar_with_latches/ch_latch_1/ack_reg/Q]  -to [get_pins xbar_with_latches/ch_latch_1/C214/Z]
set_min_delay 0.15  -from [get_pins xbar_with_latches/ch_latch_2/ack_reg/Q]  -to [get_pins xbar_with_latches/ch_latch_2/C214/Z]
set_min_delay 0.15  -from [get_pins xbar_with_latches/ch_latch_3/ack_reg/Q]  -to [get_pins xbar_with_latches/ch_latch_3/C214/Z]
set_min_delay 0.15  -from [get_pins xbar_with_latches/ch_latch_4/ack_reg/Q]  -to [get_pins xbar_with_latches/ch_latch_4/C214/Z]
set_max_delay 0.4  -to [get_pins {north_hpu/hpu_combinatorial/sel_reg[4]/D}]
set_max_delay 0.4  -to [get_pins {north_hpu/hpu_combinatorial/sel_reg[3]/D}]
set_max_delay 0.4  -to [get_pins {north_hpu/hpu_combinatorial/sel_reg[2]/D}]
set_max_delay 0.4  -to [get_pins {north_hpu/hpu_combinatorial/sel_reg[1]/D}]
set_max_delay 0.4  -to [get_pins {north_hpu/hpu_combinatorial/sel_reg[0]/D}]
set_max_delay 0.4  -to [get_pins {south_hpu/hpu_combinatorial/sel_reg[4]/D}]
set_max_delay 0.4  -to [get_pins {south_hpu/hpu_combinatorial/sel_reg[3]/D}]
set_max_delay 0.4  -to [get_pins {south_hpu/hpu_combinatorial/sel_reg[2]/D}]
set_max_delay 0.4  -to [get_pins {south_hpu/hpu_combinatorial/sel_reg[1]/D}]
set_max_delay 0.4  -to [get_pins {south_hpu/hpu_combinatorial/sel_reg[0]/D}]
set_max_delay 0.4  -to [get_pins {east_hpu/hpu_combinatorial/sel_reg[4]/D}]
set_max_delay 0.4  -to [get_pins {east_hpu/hpu_combinatorial/sel_reg[3]/D}]
set_max_delay 0.4  -to [get_pins {east_hpu/hpu_combinatorial/sel_reg[2]/D}]
set_max_delay 0.4  -to [get_pins {east_hpu/hpu_combinatorial/sel_reg[1]/D}]
set_max_delay 0.4  -to [get_pins {east_hpu/hpu_combinatorial/sel_reg[0]/D}]
set_max_delay 0.4  -to [get_pins {west_hpu/hpu_combinatorial/sel_reg[4]/D}]
set_max_delay 0.4  -to [get_pins {west_hpu/hpu_combinatorial/sel_reg[3]/D}]
set_max_delay 0.4  -to [get_pins {west_hpu/hpu_combinatorial/sel_reg[2]/D}]
set_max_delay 0.4  -to [get_pins {west_hpu/hpu_combinatorial/sel_reg[1]/D}]
set_max_delay 0.4  -to [get_pins {west_hpu/hpu_combinatorial/sel_reg[0]/D}]
set_max_delay 0.4  -to [get_pins {resource_hpu/hpu_combinatorial/sel_reg[4]/D}]
set_max_delay 0.4  -to [get_pins {resource_hpu/hpu_combinatorial/sel_reg[3]/D}]
set_max_delay 0.4  -to [get_pins {resource_hpu/hpu_combinatorial/sel_reg[2]/D}]
set_max_delay 0.4  -to [get_pins {resource_hpu/hpu_combinatorial/sel_reg[1]/D}]
set_max_delay 0.4  -to [get_pins {resource_hpu/hpu_combinatorial/sel_reg[0]/D}]
set_min_delay 0.35  -from [get_pins north_in_latch/latch_controller/I_2/A]  -to [get_pins north_in_latch/latch_controller/I_1/Z]
set_min_delay 0.35  -from [get_pins east_in_latch/latch_controller/I_2/A]  -to [get_pins east_in_latch/latch_controller/I_1/Z]
set_min_delay 0.35  -from [get_pins south_in_latch/latch_controller/I_2/A]  -to [get_pins south_in_latch/latch_controller/I_1/Z]
set_min_delay 0.35  -from [get_pins west_in_latch/latch_controller/I_2/A]  -to [get_pins west_in_latch/latch_controller/I_1/Z]
set_min_delay 0.35  -from [get_pins resource_in_latch/latch_controller/I_2/A]  -to [get_pins resource_in_latch/latch_controller/I_1/Z]
set_min_delay 0.35  -from [get_pins north_hpu/token_latch/controller/I_2/A]  -to [get_pins north_hpu/token_latch/controller/I_1/Z]
set_min_delay 0.35  -from [get_pins south_hpu/token_latch/controller/I_2/A]  -to [get_pins south_hpu/token_latch/controller/I_1/Z]
set_min_delay 0.35  -from [get_pins east_hpu/token_latch/controller/I_2/A]  -to [get_pins east_hpu/token_latch/controller/I_1/Z]
set_min_delay 0.35  -from [get_pins west_hpu/token_latch/controller/I_2/A]  -to [get_pins west_hpu/token_latch/controller/I_1/Z]
set_min_delay 0.35  -from [get_pins resource_hpu/token_latch/controller/I_2/A]  -to [get_pins resource_hpu/token_latch/controller/I_1/Z]
set_min_delay 0.35  -from [get_pins north_in_latch/latch_controller/I_0/A]  -to [get_pins north_in_latch/latch_controller/gate/c]
set_min_delay 0.35  -from [get_pins east_in_latch/latch_controller/I_0/A]  -to [get_pins east_in_latch/latch_controller/gate/c]
set_min_delay 0.35  -from [get_pins south_in_latch/latch_controller/I_0/A]  -to [get_pins south_in_latch/latch_controller/gate/c]
set_min_delay 0.35  -from [get_pins west_in_latch/latch_controller/I_0/A]  -to [get_pins west_in_latch/latch_controller/gate/c]
set_min_delay 0.35  -from [get_pins resource_in_latch/latch_controller/I_0/A]  -to [get_pins resource_in_latch/latch_controller/gate/c]
