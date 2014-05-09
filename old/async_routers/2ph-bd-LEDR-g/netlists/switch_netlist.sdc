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
set_max_delay 0.42  -from [list [get_pins {north_in_latch/LEDR_link_f[PHIT_PARITY][2]}] [get_pins \
{north_in_latch/LEDR_link_f[PHIT_PARITY][3]}] [get_pins                        \
{north_in_latch/LEDR_link_f[PHIT_PARITY][4]}] [get_pins                        \
{north_in_latch/LEDR_link_f[PHIT_PARITY][5]}] [get_pins                        \
{north_in_latch/LEDR_link_f[PHIT_PARITY][6]}] [get_pins                        \
{north_in_latch/LEDR_link_f[PHIT_PARITY][7]}] [get_pins                        \
{north_in_latch/LEDR_link_f[PHIT_PARITY][8]}] [get_pins                        \
{north_in_latch/LEDR_link_f[PHIT_PARITY][9]}] [get_pins                        \
{north_in_latch/LEDR_link_f[PHIT_PARITY][10]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][11]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][12]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][13]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][14]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][15]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][16]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][17]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][18]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][19]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][20]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][21]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][22]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][23]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][24]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][25]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][26]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][27]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][28]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][29]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][30]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][31]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT_PARITY][32]}] [get_pins                       \
{north_in_latch/LEDR_link_f[PHIT][0]}] [get_pins                               \
{north_in_latch/LEDR_link_f[PHIT][1]}] [get_pins                               \
{north_in_latch/LEDR_link_f[PHIT][2]}] [get_pins                               \
{north_in_latch/LEDR_link_f[PHIT][3]}] [get_pins                               \
{north_in_latch/LEDR_link_f[PHIT][4]}] [get_pins                               \
{north_in_latch/LEDR_link_f[PHIT][5]}] [get_pins                               \
{north_in_latch/LEDR_link_f[PHIT][6]}] [get_pins                               \
{north_in_latch/LEDR_link_f[PHIT][7]}] [get_pins                               \
{north_in_latch/LEDR_link_f[PHIT][8]}] [get_pins                               \
{north_in_latch/LEDR_link_f[PHIT][9]}] [get_pins                               \
{north_in_latch/LEDR_link_f[PHIT][10]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][11]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][12]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][13]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][14]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][15]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][16]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][17]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][18]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][19]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][20]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][21]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][22]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][23]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][24]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][25]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][26]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][27]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][28]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][29]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][30]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][31]}] [get_pins                              \
{north_in_latch/LEDR_link_f[PHIT][32]}]]  -to [get_pins north_in_latch/latch_controller/Rin]
set_max_delay 0.42  -from [list [get_pins {south_in_latch/LEDR_link_f[PHIT_PARITY][2]}] [get_pins \
{south_in_latch/LEDR_link_f[PHIT_PARITY][3]}] [get_pins                        \
{south_in_latch/LEDR_link_f[PHIT_PARITY][4]}] [get_pins                        \
{south_in_latch/LEDR_link_f[PHIT_PARITY][5]}] [get_pins                        \
{south_in_latch/LEDR_link_f[PHIT_PARITY][6]}] [get_pins                        \
{south_in_latch/LEDR_link_f[PHIT_PARITY][7]}] [get_pins                        \
{south_in_latch/LEDR_link_f[PHIT_PARITY][8]}] [get_pins                        \
{south_in_latch/LEDR_link_f[PHIT_PARITY][9]}] [get_pins                        \
{south_in_latch/LEDR_link_f[PHIT_PARITY][10]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][11]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][12]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][13]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][14]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][15]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][16]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][17]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][18]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][19]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][20]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][21]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][22]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][23]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][24]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][25]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][26]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][27]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][28]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][29]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][30]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][31]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT_PARITY][32]}] [get_pins                       \
{south_in_latch/LEDR_link_f[PHIT][0]}] [get_pins                               \
{south_in_latch/LEDR_link_f[PHIT][1]}] [get_pins                               \
{south_in_latch/LEDR_link_f[PHIT][2]}] [get_pins                               \
{south_in_latch/LEDR_link_f[PHIT][3]}] [get_pins                               \
{south_in_latch/LEDR_link_f[PHIT][4]}] [get_pins                               \
{south_in_latch/LEDR_link_f[PHIT][5]}] [get_pins                               \
{south_in_latch/LEDR_link_f[PHIT][6]}] [get_pins                               \
{south_in_latch/LEDR_link_f[PHIT][7]}] [get_pins                               \
{south_in_latch/LEDR_link_f[PHIT][8]}] [get_pins                               \
{south_in_latch/LEDR_link_f[PHIT][9]}] [get_pins                               \
{south_in_latch/LEDR_link_f[PHIT][10]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][11]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][12]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][13]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][14]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][15]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][16]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][17]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][18]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][19]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][20]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][21]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][22]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][23]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][24]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][25]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][26]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][27]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][28]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][29]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][30]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][31]}] [get_pins                              \
{south_in_latch/LEDR_link_f[PHIT][32]}]]  -to [get_pins south_in_latch/latch_controller/Rin]
set_max_delay 0.42  -from [list [get_pins {east_in_latch/LEDR_link_f[PHIT_PARITY][2]}] [get_pins  \
{east_in_latch/LEDR_link_f[PHIT_PARITY][3]}] [get_pins                         \
{east_in_latch/LEDR_link_f[PHIT_PARITY][4]}] [get_pins                         \
{east_in_latch/LEDR_link_f[PHIT_PARITY][5]}] [get_pins                         \
{east_in_latch/LEDR_link_f[PHIT_PARITY][6]}] [get_pins                         \
{east_in_latch/LEDR_link_f[PHIT_PARITY][7]}] [get_pins                         \
{east_in_latch/LEDR_link_f[PHIT_PARITY][8]}] [get_pins                         \
{east_in_latch/LEDR_link_f[PHIT_PARITY][9]}] [get_pins                         \
{east_in_latch/LEDR_link_f[PHIT_PARITY][10]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][11]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][12]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][13]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][14]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][15]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][16]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][17]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][18]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][19]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][20]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][21]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][22]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][23]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][24]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][25]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][26]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][27]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][28]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][29]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][30]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][31]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT_PARITY][32]}] [get_pins                        \
{east_in_latch/LEDR_link_f[PHIT][0]}] [get_pins                                \
{east_in_latch/LEDR_link_f[PHIT][1]}] [get_pins                                \
{east_in_latch/LEDR_link_f[PHIT][2]}] [get_pins                                \
{east_in_latch/LEDR_link_f[PHIT][3]}] [get_pins                                \
{east_in_latch/LEDR_link_f[PHIT][4]}] [get_pins                                \
{east_in_latch/LEDR_link_f[PHIT][5]}] [get_pins                                \
{east_in_latch/LEDR_link_f[PHIT][6]}] [get_pins                                \
{east_in_latch/LEDR_link_f[PHIT][7]}] [get_pins                                \
{east_in_latch/LEDR_link_f[PHIT][8]}] [get_pins                                \
{east_in_latch/LEDR_link_f[PHIT][9]}] [get_pins                                \
{east_in_latch/LEDR_link_f[PHIT][10]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][11]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][12]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][13]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][14]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][15]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][16]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][17]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][18]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][19]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][20]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][21]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][22]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][23]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][24]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][25]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][26]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][27]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][28]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][29]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][30]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][31]}] [get_pins                               \
{east_in_latch/LEDR_link_f[PHIT][32]}]]  -to [get_pins east_in_latch/latch_controller/Rin]
set_max_delay 0.42  -from [list [get_pins {west_in_latch/LEDR_link_f[PHIT_PARITY][2]}] [get_pins  \
{west_in_latch/LEDR_link_f[PHIT_PARITY][3]}] [get_pins                         \
{west_in_latch/LEDR_link_f[PHIT_PARITY][4]}] [get_pins                         \
{west_in_latch/LEDR_link_f[PHIT_PARITY][5]}] [get_pins                         \
{west_in_latch/LEDR_link_f[PHIT_PARITY][6]}] [get_pins                         \
{west_in_latch/LEDR_link_f[PHIT_PARITY][7]}] [get_pins                         \
{west_in_latch/LEDR_link_f[PHIT_PARITY][8]}] [get_pins                         \
{west_in_latch/LEDR_link_f[PHIT_PARITY][9]}] [get_pins                         \
{west_in_latch/LEDR_link_f[PHIT_PARITY][10]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][11]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][12]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][13]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][14]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][15]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][16]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][17]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][18]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][19]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][20]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][21]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][22]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][23]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][24]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][25]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][26]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][27]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][28]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][29]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][30]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][31]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT_PARITY][32]}] [get_pins                        \
{west_in_latch/LEDR_link_f[PHIT][0]}] [get_pins                                \
{west_in_latch/LEDR_link_f[PHIT][1]}] [get_pins                                \
{west_in_latch/LEDR_link_f[PHIT][2]}] [get_pins                                \
{west_in_latch/LEDR_link_f[PHIT][3]}] [get_pins                                \
{west_in_latch/LEDR_link_f[PHIT][4]}] [get_pins                                \
{west_in_latch/LEDR_link_f[PHIT][5]}] [get_pins                                \
{west_in_latch/LEDR_link_f[PHIT][6]}] [get_pins                                \
{west_in_latch/LEDR_link_f[PHIT][7]}] [get_pins                                \
{west_in_latch/LEDR_link_f[PHIT][8]}] [get_pins                                \
{west_in_latch/LEDR_link_f[PHIT][9]}] [get_pins                                \
{west_in_latch/LEDR_link_f[PHIT][10]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][11]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][12]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][13]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][14]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][15]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][16]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][17]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][18]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][19]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][20]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][21]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][22]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][23]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][24]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][25]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][26]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][27]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][28]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][29]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][30]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][31]}] [get_pins                               \
{west_in_latch/LEDR_link_f[PHIT][32]}]]  -to [get_pins west_in_latch/latch_controller/Rin]
set_max_delay 0.42  -from [list [get_pins {resource_in_latch/LEDR_link_f[PHIT_PARITY][2]}]        \
[get_pins {resource_in_latch/LEDR_link_f[PHIT_PARITY][3]}] [get_pins           \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][4]}] [get_pins                     \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][5]}] [get_pins                     \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][6]}] [get_pins                     \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][7]}] [get_pins                     \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][8]}] [get_pins                     \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][9]}] [get_pins                     \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][10]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][11]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][12]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][13]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][14]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][15]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][16]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][17]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][18]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][19]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][20]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][21]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][22]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][23]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][24]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][25]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][26]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][27]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][28]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][29]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][30]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][31]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT_PARITY][32]}] [get_pins                    \
{resource_in_latch/LEDR_link_f[PHIT][0]}] [get_pins                            \
{resource_in_latch/LEDR_link_f[PHIT][1]}] [get_pins                            \
{resource_in_latch/LEDR_link_f[PHIT][2]}] [get_pins                            \
{resource_in_latch/LEDR_link_f[PHIT][3]}] [get_pins                            \
{resource_in_latch/LEDR_link_f[PHIT][4]}] [get_pins                            \
{resource_in_latch/LEDR_link_f[PHIT][5]}] [get_pins                            \
{resource_in_latch/LEDR_link_f[PHIT][6]}] [get_pins                            \
{resource_in_latch/LEDR_link_f[PHIT][7]}] [get_pins                            \
{resource_in_latch/LEDR_link_f[PHIT][8]}] [get_pins                            \
{resource_in_latch/LEDR_link_f[PHIT][9]}] [get_pins                            \
{resource_in_latch/LEDR_link_f[PHIT][10]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][11]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][12]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][13]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][14]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][15]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][16]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][17]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][18]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][19]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][20]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][21]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][22]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][23]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][24]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][25]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][26]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][27]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][28]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][29]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][30]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][31]}] [get_pins                           \
{resource_in_latch/LEDR_link_f[PHIT][32]}]]  -to [get_pins resource_in_latch/latch_controller/Rin]
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
