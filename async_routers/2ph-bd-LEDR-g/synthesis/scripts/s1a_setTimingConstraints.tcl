# Create User-Defined Variables
set CLK_PERIOD 2.0
#set CLK_SKEW 0.14
#set WC_OP_CONDS typ_0_1.98
#set WIRELOAD_MODEL 10KGATES
#set DRIVE_CELL buf1a6
#set DRIVE_PIN {Y}
#set MAX_OUTPUT_LOAD [load_of ssc_core/buf1a2/A]
#set INPUT_DELAY 2.0
#set OUTPUT_DELAY 0.5
#set MAX_AREA 380000



# C - elements
set_disable_timing *_in_latch/data_ch/latch/C8/B

set_disable_timing *_in_latch/data_cd_c/latch/C8/B

set_disable_timing *_in_latch/latch_controller/gate/latch/C8/B

set_disable_timing *_hpu/token_latch/controller/gate/latch/C8/B

set_disable_timing xbar_with_latches/crossbar/c_sync_req/latch/C8/B

set_disable_timing xbar_with_latches/crossbar/c_sync_ack/latch/C8/B

#completion detection
set_max_delay -from {north_in_latch/LEDR_link_f[PHIT_PARITY][2] north_in_latch/LEDR_link_f[PHIT_PARITY][3] north_in_latch/LEDR_link_f[PHIT_PARITY][4] \
north_in_latch/LEDR_link_f[PHIT_PARITY][5] north_in_latch/LEDR_link_f[PHIT_PARITY][6] north_in_latch/LEDR_link_f[PHIT_PARITY][7] \
north_in_latch/LEDR_link_f[PHIT_PARITY][8] north_in_latch/LEDR_link_f[PHIT_PARITY][9] north_in_latch/LEDR_link_f[PHIT_PARITY][10] \
north_in_latch/LEDR_link_f[PHIT_PARITY][11] north_in_latch/LEDR_link_f[PHIT_PARITY][12] north_in_latch/LEDR_link_f[PHIT_PARITY][13] \
north_in_latch/LEDR_link_f[PHIT_PARITY][14] north_in_latch/LEDR_link_f[PHIT_PARITY][15] north_in_latch/LEDR_link_f[PHIT_PARITY][16] \
north_in_latch/LEDR_link_f[PHIT_PARITY][17] north_in_latch/LEDR_link_f[PHIT_PARITY][18] north_in_latch/LEDR_link_f[PHIT_PARITY][19] \
north_in_latch/LEDR_link_f[PHIT_PARITY][20] north_in_latch/LEDR_link_f[PHIT_PARITY][21] north_in_latch/LEDR_link_f[PHIT_PARITY][22] \
north_in_latch/LEDR_link_f[PHIT_PARITY][23] north_in_latch/LEDR_link_f[PHIT_PARITY][24] north_in_latch/LEDR_link_f[PHIT_PARITY][25] \
north_in_latch/LEDR_link_f[PHIT_PARITY][26] north_in_latch/LEDR_link_f[PHIT_PARITY][27] north_in_latch/LEDR_link_f[PHIT_PARITY][28] \
north_in_latch/LEDR_link_f[PHIT_PARITY][29] north_in_latch/LEDR_link_f[PHIT_PARITY][30] north_in_latch/LEDR_link_f[PHIT_PARITY][31] \
north_in_latch/LEDR_link_f[PHIT_PARITY][32] north_in_latch/LEDR_link_f[PHIT][0] north_in_latch/LEDR_link_f[PHIT][1] \
north_in_latch/LEDR_link_f[PHIT][2] north_in_latch/LEDR_link_f[PHIT][3] north_in_latch/LEDR_link_f[PHIT][4] \
north_in_latch/LEDR_link_f[PHIT][5] north_in_latch/LEDR_link_f[PHIT][6] north_in_latch/LEDR_link_f[PHIT][7] \
north_in_latch/LEDR_link_f[PHIT][8] north_in_latch/LEDR_link_f[PHIT][9] north_in_latch/LEDR_link_f[PHIT][10] \
north_in_latch/LEDR_link_f[PHIT][11] north_in_latch/LEDR_link_f[PHIT][12] north_in_latch/LEDR_link_f[PHIT][13] \
north_in_latch/LEDR_link_f[PHIT][14] north_in_latch/LEDR_link_f[PHIT][15] north_in_latch/LEDR_link_f[PHIT][16] \
north_in_latch/LEDR_link_f[PHIT][17] north_in_latch/LEDR_link_f[PHIT][18] north_in_latch/LEDR_link_f[PHIT][19] \
north_in_latch/LEDR_link_f[PHIT][20] north_in_latch/LEDR_link_f[PHIT][21] north_in_latch/LEDR_link_f[PHIT][22] \
north_in_latch/LEDR_link_f[PHIT][23] north_in_latch/LEDR_link_f[PHIT][24] north_in_latch/LEDR_link_f[PHIT][25] \
north_in_latch/LEDR_link_f[PHIT][26] north_in_latch/LEDR_link_f[PHIT][27] north_in_latch/LEDR_link_f[PHIT][28] \
north_in_latch/LEDR_link_f[PHIT][29] north_in_latch/LEDR_link_f[PHIT][30] north_in_latch/LEDR_link_f[PHIT][31] \
north_in_latch/LEDR_link_f[PHIT][32]} -to  north_in_latch/latch_controller/Rin 0.42

set_max_delay -from {south_in_latch/LEDR_link_f[PHIT_PARITY][2] south_in_latch/LEDR_link_f[PHIT_PARITY][3] south_in_latch/LEDR_link_f[PHIT_PARITY][4] \
south_in_latch/LEDR_link_f[PHIT_PARITY][5] south_in_latch/LEDR_link_f[PHIT_PARITY][6] south_in_latch/LEDR_link_f[PHIT_PARITY][7] \
south_in_latch/LEDR_link_f[PHIT_PARITY][8] south_in_latch/LEDR_link_f[PHIT_PARITY][9] south_in_latch/LEDR_link_f[PHIT_PARITY][10] \
south_in_latch/LEDR_link_f[PHIT_PARITY][11] south_in_latch/LEDR_link_f[PHIT_PARITY][12] south_in_latch/LEDR_link_f[PHIT_PARITY][13] \
south_in_latch/LEDR_link_f[PHIT_PARITY][14] south_in_latch/LEDR_link_f[PHIT_PARITY][15] south_in_latch/LEDR_link_f[PHIT_PARITY][16] \
south_in_latch/LEDR_link_f[PHIT_PARITY][17] south_in_latch/LEDR_link_f[PHIT_PARITY][18] south_in_latch/LEDR_link_f[PHIT_PARITY][19] \
south_in_latch/LEDR_link_f[PHIT_PARITY][20] south_in_latch/LEDR_link_f[PHIT_PARITY][21] south_in_latch/LEDR_link_f[PHIT_PARITY][22] \
south_in_latch/LEDR_link_f[PHIT_PARITY][23] south_in_latch/LEDR_link_f[PHIT_PARITY][24] south_in_latch/LEDR_link_f[PHIT_PARITY][25] \
south_in_latch/LEDR_link_f[PHIT_PARITY][26] south_in_latch/LEDR_link_f[PHIT_PARITY][27] south_in_latch/LEDR_link_f[PHIT_PARITY][28] \
south_in_latch/LEDR_link_f[PHIT_PARITY][29] south_in_latch/LEDR_link_f[PHIT_PARITY][30] south_in_latch/LEDR_link_f[PHIT_PARITY][31] \
south_in_latch/LEDR_link_f[PHIT_PARITY][32] south_in_latch/LEDR_link_f[PHIT][0] south_in_latch/LEDR_link_f[PHIT][1] \
south_in_latch/LEDR_link_f[PHIT][2] south_in_latch/LEDR_link_f[PHIT][3] south_in_latch/LEDR_link_f[PHIT][4] \
south_in_latch/LEDR_link_f[PHIT][5] south_in_latch/LEDR_link_f[PHIT][6] south_in_latch/LEDR_link_f[PHIT][7] \
south_in_latch/LEDR_link_f[PHIT][8] south_in_latch/LEDR_link_f[PHIT][9] south_in_latch/LEDR_link_f[PHIT][10] \
south_in_latch/LEDR_link_f[PHIT][11] south_in_latch/LEDR_link_f[PHIT][12] south_in_latch/LEDR_link_f[PHIT][13] \
south_in_latch/LEDR_link_f[PHIT][14] south_in_latch/LEDR_link_f[PHIT][15] south_in_latch/LEDR_link_f[PHIT][16] \
south_in_latch/LEDR_link_f[PHIT][17] south_in_latch/LEDR_link_f[PHIT][18] south_in_latch/LEDR_link_f[PHIT][19] \
south_in_latch/LEDR_link_f[PHIT][20] south_in_latch/LEDR_link_f[PHIT][21] south_in_latch/LEDR_link_f[PHIT][22] \
south_in_latch/LEDR_link_f[PHIT][23] south_in_latch/LEDR_link_f[PHIT][24] south_in_latch/LEDR_link_f[PHIT][25] \
south_in_latch/LEDR_link_f[PHIT][26] south_in_latch/LEDR_link_f[PHIT][27] south_in_latch/LEDR_link_f[PHIT][28] \
south_in_latch/LEDR_link_f[PHIT][29] south_in_latch/LEDR_link_f[PHIT][30] south_in_latch/LEDR_link_f[PHIT][31] \
south_in_latch/LEDR_link_f[PHIT][32]} -to south_in_latch/latch_controller/Rin 0.42


set_max_delay -from {east_in_latch/LEDR_link_f[PHIT_PARITY][2] east_in_latch/LEDR_link_f[PHIT_PARITY][3] east_in_latch/LEDR_link_f[PHIT_PARITY][4] \
east_in_latch/LEDR_link_f[PHIT_PARITY][5] east_in_latch/LEDR_link_f[PHIT_PARITY][6] east_in_latch/LEDR_link_f[PHIT_PARITY][7] \
east_in_latch/LEDR_link_f[PHIT_PARITY][8] east_in_latch/LEDR_link_f[PHIT_PARITY][9] east_in_latch/LEDR_link_f[PHIT_PARITY][10] \
east_in_latch/LEDR_link_f[PHIT_PARITY][11] east_in_latch/LEDR_link_f[PHIT_PARITY][12] east_in_latch/LEDR_link_f[PHIT_PARITY][13] \
east_in_latch/LEDR_link_f[PHIT_PARITY][14] east_in_latch/LEDR_link_f[PHIT_PARITY][15] east_in_latch/LEDR_link_f[PHIT_PARITY][16] \
east_in_latch/LEDR_link_f[PHIT_PARITY][17] east_in_latch/LEDR_link_f[PHIT_PARITY][18] east_in_latch/LEDR_link_f[PHIT_PARITY][19] \
east_in_latch/LEDR_link_f[PHIT_PARITY][20] east_in_latch/LEDR_link_f[PHIT_PARITY][21] east_in_latch/LEDR_link_f[PHIT_PARITY][22] \
east_in_latch/LEDR_link_f[PHIT_PARITY][23] east_in_latch/LEDR_link_f[PHIT_PARITY][24] east_in_latch/LEDR_link_f[PHIT_PARITY][25] \
east_in_latch/LEDR_link_f[PHIT_PARITY][26] east_in_latch/LEDR_link_f[PHIT_PARITY][27] east_in_latch/LEDR_link_f[PHIT_PARITY][28] \
east_in_latch/LEDR_link_f[PHIT_PARITY][29] east_in_latch/LEDR_link_f[PHIT_PARITY][30] east_in_latch/LEDR_link_f[PHIT_PARITY][31] \
east_in_latch/LEDR_link_f[PHIT_PARITY][32] east_in_latch/LEDR_link_f[PHIT][0] east_in_latch/LEDR_link_f[PHIT][1] \
east_in_latch/LEDR_link_f[PHIT][2] east_in_latch/LEDR_link_f[PHIT][3] east_in_latch/LEDR_link_f[PHIT][4] \
east_in_latch/LEDR_link_f[PHIT][5] east_in_latch/LEDR_link_f[PHIT][6] east_in_latch/LEDR_link_f[PHIT][7] \
east_in_latch/LEDR_link_f[PHIT][8] east_in_latch/LEDR_link_f[PHIT][9] east_in_latch/LEDR_link_f[PHIT][10] \
east_in_latch/LEDR_link_f[PHIT][11] east_in_latch/LEDR_link_f[PHIT][12] east_in_latch/LEDR_link_f[PHIT][13] \
east_in_latch/LEDR_link_f[PHIT][14] east_in_latch/LEDR_link_f[PHIT][15] east_in_latch/LEDR_link_f[PHIT][16] \
east_in_latch/LEDR_link_f[PHIT][17] east_in_latch/LEDR_link_f[PHIT][18] east_in_latch/LEDR_link_f[PHIT][19] \
east_in_latch/LEDR_link_f[PHIT][20] east_in_latch/LEDR_link_f[PHIT][21] east_in_latch/LEDR_link_f[PHIT][22] \
east_in_latch/LEDR_link_f[PHIT][23] east_in_latch/LEDR_link_f[PHIT][24] east_in_latch/LEDR_link_f[PHIT][25] \
east_in_latch/LEDR_link_f[PHIT][26] east_in_latch/LEDR_link_f[PHIT][27] east_in_latch/LEDR_link_f[PHIT][28] \
east_in_latch/LEDR_link_f[PHIT][29] east_in_latch/LEDR_link_f[PHIT][30] east_in_latch/LEDR_link_f[PHIT][31] \
east_in_latch/LEDR_link_f[PHIT][32]} -to  east_in_latch/latch_controller/Rin 0.42

set_max_delay -from {west_in_latch/LEDR_link_f[PHIT_PARITY][2] west_in_latch/LEDR_link_f[PHIT_PARITY][3] west_in_latch/LEDR_link_f[PHIT_PARITY][4] \
west_in_latch/LEDR_link_f[PHIT_PARITY][5] west_in_latch/LEDR_link_f[PHIT_PARITY][6] west_in_latch/LEDR_link_f[PHIT_PARITY][7] \
west_in_latch/LEDR_link_f[PHIT_PARITY][8] west_in_latch/LEDR_link_f[PHIT_PARITY][9] west_in_latch/LEDR_link_f[PHIT_PARITY][10] \
west_in_latch/LEDR_link_f[PHIT_PARITY][11] west_in_latch/LEDR_link_f[PHIT_PARITY][12] west_in_latch/LEDR_link_f[PHIT_PARITY][13] \
west_in_latch/LEDR_link_f[PHIT_PARITY][14] west_in_latch/LEDR_link_f[PHIT_PARITY][15] west_in_latch/LEDR_link_f[PHIT_PARITY][16] \
west_in_latch/LEDR_link_f[PHIT_PARITY][17] west_in_latch/LEDR_link_f[PHIT_PARITY][18] west_in_latch/LEDR_link_f[PHIT_PARITY][19] \
west_in_latch/LEDR_link_f[PHIT_PARITY][20] west_in_latch/LEDR_link_f[PHIT_PARITY][21] west_in_latch/LEDR_link_f[PHIT_PARITY][22] \
west_in_latch/LEDR_link_f[PHIT_PARITY][23] west_in_latch/LEDR_link_f[PHIT_PARITY][24] west_in_latch/LEDR_link_f[PHIT_PARITY][25] \
west_in_latch/LEDR_link_f[PHIT_PARITY][26] west_in_latch/LEDR_link_f[PHIT_PARITY][27] west_in_latch/LEDR_link_f[PHIT_PARITY][28] \
west_in_latch/LEDR_link_f[PHIT_PARITY][29] west_in_latch/LEDR_link_f[PHIT_PARITY][30] west_in_latch/LEDR_link_f[PHIT_PARITY][31] \
west_in_latch/LEDR_link_f[PHIT_PARITY][32] west_in_latch/LEDR_link_f[PHIT][0] west_in_latch/LEDR_link_f[PHIT][1] \
west_in_latch/LEDR_link_f[PHIT][2] west_in_latch/LEDR_link_f[PHIT][3] west_in_latch/LEDR_link_f[PHIT][4] \
west_in_latch/LEDR_link_f[PHIT][5] west_in_latch/LEDR_link_f[PHIT][6] west_in_latch/LEDR_link_f[PHIT][7] \
west_in_latch/LEDR_link_f[PHIT][8] west_in_latch/LEDR_link_f[PHIT][9] west_in_latch/LEDR_link_f[PHIT][10] \
west_in_latch/LEDR_link_f[PHIT][11] west_in_latch/LEDR_link_f[PHIT][12] west_in_latch/LEDR_link_f[PHIT][13] \
west_in_latch/LEDR_link_f[PHIT][14] west_in_latch/LEDR_link_f[PHIT][15] west_in_latch/LEDR_link_f[PHIT][16] \
west_in_latch/LEDR_link_f[PHIT][17] west_in_latch/LEDR_link_f[PHIT][18] west_in_latch/LEDR_link_f[PHIT][19] \
west_in_latch/LEDR_link_f[PHIT][20] west_in_latch/LEDR_link_f[PHIT][21] west_in_latch/LEDR_link_f[PHIT][22] \
west_in_latch/LEDR_link_f[PHIT][23] west_in_latch/LEDR_link_f[PHIT][24] west_in_latch/LEDR_link_f[PHIT][25] \
west_in_latch/LEDR_link_f[PHIT][26] west_in_latch/LEDR_link_f[PHIT][27] west_in_latch/LEDR_link_f[PHIT][28] \
west_in_latch/LEDR_link_f[PHIT][29] west_in_latch/LEDR_link_f[PHIT][30] west_in_latch/LEDR_link_f[PHIT][31] \
west_in_latch/LEDR_link_f[PHIT][32]} -to  west_in_latch/latch_controller/Rin 0.42

set_max_delay -from {resource_in_latch/LEDR_link_f[PHIT_PARITY][2] resource_in_latch/LEDR_link_f[PHIT_PARITY][3] resource_in_latch/LEDR_link_f[PHIT_PARITY][4] \
resource_in_latch/LEDR_link_f[PHIT_PARITY][5] resource_in_latch/LEDR_link_f[PHIT_PARITY][6] resource_in_latch/LEDR_link_f[PHIT_PARITY][7] \
resource_in_latch/LEDR_link_f[PHIT_PARITY][8] resource_in_latch/LEDR_link_f[PHIT_PARITY][9] resource_in_latch/LEDR_link_f[PHIT_PARITY][10] \
resource_in_latch/LEDR_link_f[PHIT_PARITY][11] resource_in_latch/LEDR_link_f[PHIT_PARITY][12] resource_in_latch/LEDR_link_f[PHIT_PARITY][13] \
resource_in_latch/LEDR_link_f[PHIT_PARITY][14] resource_in_latch/LEDR_link_f[PHIT_PARITY][15] resource_in_latch/LEDR_link_f[PHIT_PARITY][16] \
resource_in_latch/LEDR_link_f[PHIT_PARITY][17] resource_in_latch/LEDR_link_f[PHIT_PARITY][18] resource_in_latch/LEDR_link_f[PHIT_PARITY][19] \
resource_in_latch/LEDR_link_f[PHIT_PARITY][20] resource_in_latch/LEDR_link_f[PHIT_PARITY][21] resource_in_latch/LEDR_link_f[PHIT_PARITY][22] \
resource_in_latch/LEDR_link_f[PHIT_PARITY][23] resource_in_latch/LEDR_link_f[PHIT_PARITY][24] resource_in_latch/LEDR_link_f[PHIT_PARITY][25] \
resource_in_latch/LEDR_link_f[PHIT_PARITY][26] resource_in_latch/LEDR_link_f[PHIT_PARITY][27] resource_in_latch/LEDR_link_f[PHIT_PARITY][28] \
resource_in_latch/LEDR_link_f[PHIT_PARITY][29] resource_in_latch/LEDR_link_f[PHIT_PARITY][30] resource_in_latch/LEDR_link_f[PHIT_PARITY][31] \
resource_in_latch/LEDR_link_f[PHIT_PARITY][32] resource_in_latch/LEDR_link_f[PHIT][0] resource_in_latch/LEDR_link_f[PHIT][1] \
resource_in_latch/LEDR_link_f[PHIT][2] resource_in_latch/LEDR_link_f[PHIT][3] resource_in_latch/LEDR_link_f[PHIT][4] \
resource_in_latch/LEDR_link_f[PHIT][5] resource_in_latch/LEDR_link_f[PHIT][6] resource_in_latch/LEDR_link_f[PHIT][7] \
resource_in_latch/LEDR_link_f[PHIT][8] resource_in_latch/LEDR_link_f[PHIT][9] resource_in_latch/LEDR_link_f[PHIT][10] \
resource_in_latch/LEDR_link_f[PHIT][11] resource_in_latch/LEDR_link_f[PHIT][12] resource_in_latch/LEDR_link_f[PHIT][13] \
resource_in_latch/LEDR_link_f[PHIT][14] resource_in_latch/LEDR_link_f[PHIT][15] resource_in_latch/LEDR_link_f[PHIT][16] \
resource_in_latch/LEDR_link_f[PHIT][17] resource_in_latch/LEDR_link_f[PHIT][18] resource_in_latch/LEDR_link_f[PHIT][19] \
resource_in_latch/LEDR_link_f[PHIT][20] resource_in_latch/LEDR_link_f[PHIT][21] resource_in_latch/LEDR_link_f[PHIT][22] \
resource_in_latch/LEDR_link_f[PHIT][23] resource_in_latch/LEDR_link_f[PHIT][24] resource_in_latch/LEDR_link_f[PHIT][25] \
resource_in_latch/LEDR_link_f[PHIT][26] resource_in_latch/LEDR_link_f[PHIT][27] resource_in_latch/LEDR_link_f[PHIT][28] \
resource_in_latch/LEDR_link_f[PHIT][29] resource_in_latch/LEDR_link_f[PHIT][30] resource_in_latch/LEDR_link_f[PHIT][31] \
resource_in_latch/LEDR_link_f[PHIT][32]} -to resource_in_latch/latch_controller/Rin 0.42


# Delay Elements -matching HPU combinational logic
set_max_delay -from north_hpu/I_0/A -to north_hpu/I_1/Z 0.27
set_max_delay -from south_hpu/I_0/A -to south_hpu/I_1/Z 0.27
set_max_delay -from east_hpu/I_0/A -to east_hpu/I_1/Z 0.27
set_max_delay -from west_hpu/I_0/A -to west_hpu/I_1/Z 0.27
set_max_delay -from resource_hpu/I_0/A -to resource_hpu/I_1/Z 0.27

set_min_delay -from north_hpu/I_0/A -to north_hpu/I_1/Z 0.22
set_min_delay -from south_hpu/I_0/A -to south_hpu/I_1/Z 0.22
set_min_delay -from east_hpu/I_0/A -to east_hpu/I_1/Z 0.22
set_min_delay -from west_hpu/I_0/A -to west_hpu/I_1/Z 0.22
set_min_delay -from resource_hpu/I_0/A -to resource_hpu/I_1/Z 0.22

# Delay Element -matching CROSSBAR combinational logic
set_max_delay -from xbar_with_latches/crossbar/I_0/A -to xbar_with_latches/crossbar/I_1/Z 0.44
set_min_delay -from xbar_with_latches/crossbar/I_0/A -to xbar_with_latches/crossbar/I_1/Z 0.30

#break loop in CinA -checked
set_max_delay -from north_hpu/token_latch/controller/gate/a -to north_hpu/token_latch/controller/I_0/Z 0.47
set_max_delay -from south_hpu/token_latch/controller/gate/a -to south_hpu/token_latch/controller/I_0/Z 0.47
set_max_delay -from east_hpu/token_latch/controller/gate/a -to east_hpu/token_latch/controller/I_0/Z 0.47
set_max_delay -from west_hpu/token_latch/controller/gate/a -to west_hpu/token_latch/controller/I_0/Z 0.47
set_max_delay -from resource_hpu/token_latch/controller/gate/a -to resource_hpu/token_latch/controller/I_0/Z 0.47

set_min_delay -from xbar_with_latches/ch_latch_0/ack_reg/Q -to xbar_with_latches/ch_latch_0/C214/Z 0.15
set_min_delay -from xbar_with_latches/ch_latch_1/ack_reg/Q -to xbar_with_latches/ch_latch_1/C214/Z 0.15
set_min_delay -from xbar_with_latches/ch_latch_2/ack_reg/Q -to xbar_with_latches/ch_latch_2/C214/Z 0.15
set_min_delay -from xbar_with_latches/ch_latch_3/ack_reg/Q -to xbar_with_latches/ch_latch_3/C214/Z 0.15
set_min_delay -from xbar_with_latches/ch_latch_4/ack_reg/Q -to xbar_with_latches/ch_latch_4/C214/Z 0.15

set_max_delay -to {*_hpu/hpu_combinatorial/sel_reg[*]/data_in} 0.4

#delay in HPU controllers
#set_min_delay -from  north_hpu/token_latch/controller/I_1/A -to north_hpu/token_latch/controller/I_2/Z 0.3
#set_min_delay -from  east_hpu/token_latch/controller/I_1/A -to east_hpu/token_latch/controller/I_2/Z 0.3
#set_min_delay -from  south_hpu/token_latch/controller/I_1/A -to south_hpu/token_latch/controller/I_2/Z 0.3
#set_min_delay -from  west_hpu/token_latch/controller/I_1/A -to west_hpu/token_latch/controller/I_2/Z 0.3
#set_min_delay -from  resource_hpu/token_latch/controller/I_1/A -to resource_hpu/token_latch/controller/I_2/Z 0.3

set_min_delay -from north_in_latch/latch_controller/I_2/A -to north_in_latch/latch_controller/I_1/Z 0.35
set_min_delay -from east_in_latch/latch_controller/I_2/A -to east_in_latch/latch_controller/I_1/Z 0.35
set_min_delay -from south_in_latch/latch_controller/I_2/A -to south_in_latch/latch_controller/I_1/Z 0.35
set_min_delay -from west_in_latch/latch_controller/I_2/A -to west_in_latch/latch_controller/I_1/Z 0.35
set_min_delay -from resource_in_latch/latch_controller/I_2/A -to resource_in_latch/latch_controller/I_1/Z 0.35

set_min_delay -from north_hpu/token_latch/controller/I_2/A -to north_hpu/token_latch/controller/I_1/Z 0.35
set_min_delay -from south_hpu/token_latch/controller/I_2/A -to south_hpu/token_latch/controller/I_1/Z 0.35
set_min_delay -from east_hpu/token_latch/controller/I_2/A -to east_hpu/token_latch/controller/I_1/Z 0.35
set_min_delay -from west_hpu/token_latch/controller/I_2/A -to west_hpu/token_latch/controller/I_1/Z 0.35
set_min_delay -from resource_hpu/token_latch/controller/I_2/A -to resource_hpu/token_latch/controller/I_1/Z 0.35


#set_min_delay -from north_in_latch/I_3/A -to north_in_latch/I_2/Z 0.35
#set_min_delay -from east_in_latch/I_3/A -to east_in_latch/I_2/Z 0.35
#set_min_delay -from south_in_latch/I_3/A -to south_in_latch/I_2/Z 0.35
#set_min_delay -from west_in_latch/I_3/A -to west_in_latch/I_2/Z 0.35
#set_min_delay -from resource_in_latch/I_3/A -to resource_in_latch/I_2/Z 0.35


#delay in input latches controllers
set_min_delay -from north_in_latch/latch_controller/I_0/A -to north_in_latch/latch_controller/gate/c 0.35
set_min_delay -from east_in_latch/latch_controller/I_0/A -to east_in_latch/latch_controller/gate/c 0.35
set_min_delay -from south_in_latch/latch_controller/I_0/A -to south_in_latch/latch_controller/gate/c 0.35
set_min_delay -from west_in_latch/latch_controller/I_0/A -to west_in_latch/latch_controller/gate/c 0.35
set_min_delay -from resource_in_latch/latch_controller/I_0/A -to resource_in_latch/latch_controller/gate/c 0.35

#create_clocks
create_clock -name "clkM" -period $CLK_PERIOD -waveform {0 1.0} [get_pins { *_in_latch/latch_controller/lt_en \
xbar_with_latches/ch_latch_*/C215/Z \
xbar_with_latches/ch_latch_*/C214/Z } ]

create_clock -name "clkS" -period $CLK_PERIOD -waveform {1.0 2.0} [get_pins *_hpu/token_latch/controller/lt_en]

#create_clock -name "clkS" -period $CLK_PERIOD -waveform {1.0 2.0} [get_pins {*_hpu/token_latch/controller/lt_en \
#north_hpu/hpu_combinatorial/sel_reg[*]/enable} ]

#set_wire_load_model -name area_6Kto7K
#write -hierarchy -format ddc -output /home/evka/as2phase_router/synopsys/db/unmapped_constrained.ddc


