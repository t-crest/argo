# Create User-Defined Variables
#set CLK_PERIOD 2.0
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
set_disable_timing *_in_latch/controller/gate/latch/C8/B

set_disable_timing *_hpu/token_latch/controller/gate/latch/C8/B

set_disable_timing xbar_with_latches/crossbar/c_sync_req/latch/C8/B

set_disable_timing xbar_with_latches/crossbar/c_sync_ack/latch/C8/B

set_disable_timing xbar_with_latches/ch_latch_*/controller/gate/latch/C8/B


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
#set_max_delay -from xbar_with_latches/crossbar/I_0/A -to xbar_with_latches/crossbar/I_1/Z 0.18
#set_min_delay -from xbar_with_latches/crossbar/I_0/A -to xbar_with_latches/crossbar/I_1/Z 0.12


#delay in HPU controllers #D2
#set_min_delay -from north_in_latch/controller/I_2/A -to north_in_latch/controller/I_1/Z 0.1
#set_min_delay -from east_in_latch/controller/I_2/A -to east_in_latch/controller/I_1/Z 0.1
#set_min_delay -from south_in_latch/controller/I_2/A -to south_in_latch/controller/I_1/Z 0.1
#set_min_delay -from west_in_latch/controller/I_2/A -to west_in_latch/controller/I_1/Z 0.1
#set_min_delay -from resource_in_latch/controller/I_2/A -to resource_in_latch/controller/I_1/Z 0.1

#set_min_delay -from north_hpu/token_latch/controller/I_2/A -to north_hpu/token_latch/controller/I_1/Z 0.35
#set_min_delay -from south_hpu/token_latch/controller/I_2/A -to south_hpu/token_latch/controller/I_1/Z 0.35
#set_min_delay -from east_hpu/token_latch/controller/I_2/A -to east_hpu/token_latch/controller/I_1/Z 0.35
#set_min_delay -from west_hpu/token_latch/controller/I_2/A -to west_hpu/token_latch/controller/I_1/Z 0.35
#set_min_delay -from resource_hpu/token_latch/controller/I_2/A -to resource_hpu/token_latch/controller/I_1/Z 0.35

#delay in input latches controllers #D1 + 
set_min_delay -from north_in_latch/controller/I_0/A -to north_in_latch/controller/gate/c 0.1
set_min_delay -from east_in_latch/controller/I_0/A -to east_in_latch/controller/gate/c 0.1
set_min_delay -from south_in_latch/controller/I_0/A -to south_in_latch/controller/gate/c 0.1
set_min_delay -from west_in_latch/controller/I_0/A -to west_in_latch/controller/gate/c 0.1
set_min_delay -from resource_in_latch/controller/I_0/A -to resource_in_latch/controller/gate/c 0.1

set_min_delay -from north_hpu/token_latch/controller/I_0/A -to north_hpu/token_latch/controller/gate/c 0.2
set_min_delay -from east_hpu/token_latch/controller/I_0/A -to east_hpu/token_latch/controller/gate/c 0.2
set_min_delay -from south_hpu/token_latch/controller/I_0/A -to south_hpu/token_latch/controller/gate/c 0.2
set_min_delay -from west_hpu/token_latch/controller/I_0/A -to west_hpu/token_latch/controller/gate/c 0.2
set_min_delay -from resource_hpu/token_latch/controller/I_0/A -to resource_hpu/token_latch/controller/gate/c 0.2

set_ideal_network -no_propagate {*_in_latch/C154/Z_0}
set_ideal_network -no_propagate {*_hpu/token_latch/C154/Z_0}
set_ideal_network -no_propagate {xbar_with_latches/ch_latch_*/C154/Z_0}

#set_ideal_network -no_propagate {*_in_latch/C168/Z_0}
#set_ideal_network -no_propagate {*_hpu/token_latch/C168/Z_0}
#set_ideal_network -no_propagate {xbar_with_latches/ch_latch_*/C168/Z_0}

##########################################checked


#set_max_delay -to {*_hpu/hpu_combinatorial/sel_reg[*]/data_in} 0.4

# Delay Element -matching CROSSBAR combinational logic
#set_max_delay -from xbar_with_latches/crossbar/I_0/A -to xbar_with_latches/crossbar/I_1/Z 0.44
#set_min_delay -from xbar_with_latches/crossbar/I_0/A -to xbar_with_latches/crossbar/I_1/Z 0.30


#create_clocks
create_clock -name "clkM" -period 0.6 -waveform {0 0.3} [get_pins { *_in_latch/controller/lt_en \
  xbar_with_latches/ch_latch_*/controller/lt_en } ]

create_clock -name "clkS" -period 0.6 -waveform {0.3 0.6} [get_pins {*_hpu/token_latch/controller/lt_en } ]


#create_clock -name "clkM" -period 0.6 -waveform {0 0.3} [get_pins { *_in_latch/controller/lt_en \
\#*_in_latch/C168/Z_0  xbar_with_latches/ch_latch_*/controller/lt_en xbar_with_latches/ch_latch_*/C168/Z_0} ]

#create_clock -name "clkS" -period 0.6 -waveform {0.3 0.6} [get_pins {*_hpu/token_latch/controller/lt_en \
										 *_hpu/token_latch/C168/Z_0 } ]

#set_wire_load_model -name area_6Kto7K
write -hierarchy -format ddc -output /home/piraten/eit-eik/r2p-bd/synthesis/db/unmapped_constrained.ddc


