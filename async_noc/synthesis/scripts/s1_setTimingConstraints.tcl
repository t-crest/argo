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
set_disable_timing node_*_*/r/xbar_with_latches/crossbar/c_sync_req/latch/C9/B

set_disable_timing node_*_*/r/xbar_with_latches/crossbar/c_sync_ack/latch/C9/B

# controller latches loops
set_disable_timing node_*_*/r/*_in_latch/controller/r_next_reg/enable
set_disable_timing node_*_*/r/*_hpu/token_latch/controller/r_next_reg/enable
set_disable_timing node_*_*/r/xbar_with_latches/ch_latch_*/controller/r_next_reg/enable

# Delay Elements -matching HPU combinational logic

foreach node [get_object_name [get_cells node_*_*]] {
    set_max_delay -from $node/r/north_hpu/I_0/A -to $node/r/north_hpu/I_1/Z 0.27
    set_max_delay -from $node/r/south_hpu/I_0/A -to $node/r/south_hpu/I_1/Z 0.27
    set_max_delay -from $node/r/east_hpu/I_0/A -to $node/r/east_hpu/I_1/Z 0.27
    set_max_delay -from $node/r/west_hpu/I_0/A -to $node/r/west_hpu/I_1/Z 0.27
    set_max_delay -from $node/r/resource_hpu/I_0/A -to $node/r/resource_hpu/I_1/Z 0.27

    set_min_delay -from $node/r/north_hpu/I_0/A -to $node/r/north_hpu/I_1/Z 0.22
    set_min_delay -from $node/r/south_hpu/I_0/A -to $node/r/south_hpu/I_1/Z 0.22
    set_min_delay -from $node/r/east_hpu/I_0/A -to $node/r/east_hpu/I_1/Z 0.22
    set_min_delay -from $node/r/west_hpu/I_0/A -to $node/r/west_hpu/I_1/Z 0.22
    set_min_delay -from $node/r/resource_hpu/I_0/A -to $node/r/resource_hpu/I_1/Z 0.22
}


# Delay Element -matching CROSSBAR combinational logic
set_max_delay -from node_0_0/r/xbar_with_latches/crossbar/I_0/A -to node_0_0/r/xbar_with_latches/crossbar/I_1/Z 0.18
set_min_delay -from node_0_0/r/xbar_with_latches/crossbar/I_0/A -to node_0_0/r/xbar_with_latches/crossbar/I_1/Z 0.12

set_max_delay -from node_0_1/r/xbar_with_latches/crossbar/I_0/A -to node_0_1/r/xbar_with_latches/crossbar/I_1/Z 0.18
set_min_delay -from node_0_1/r/xbar_with_latches/crossbar/I_0/A -to node_0_1/r/xbar_with_latches/crossbar/I_1/Z 0.12

set_max_delay -from node_1_0/r/xbar_with_latches/crossbar/I_0/A -to node_1_0/r/xbar_with_latches/crossbar/I_1/Z 0.18
set_min_delay -from node_1_0/r/xbar_with_latches/crossbar/I_0/A -to node_1_0/r/xbar_with_latches/crossbar/I_1/Z 0.12

set_max_delay -from node_1_1/r/xbar_with_latches/crossbar/I_0/A -to node_1_1/r/xbar_with_latches/crossbar/I_1/Z 0.18
set_min_delay -from node_1_1/r/xbar_with_latches/crossbar/I_0/A -to node_1_1/r/xbar_with_latches/crossbar/I_1/Z 0.12

##########################################checked


create_clock -name "clkNI" -period 2 -waveform {0.0 1.0} [get_ports {n_clk n_clk_sk_e n_clk_sk_l}]

#create_clock -name "clkP" -period 2 -waveform {0.0 1.0} [get_ports p_clk]



create_clock -name "clkM" -period 0.8 -waveform {0 0.4} [get_pins { node_0_0/r/*_in_latch/controller/I_0/Z \
									node_0_0/r/*_in_latch/C171/Z \
									node_0_0/r/xbar_with_latches/ch_latch_*/controller/I_0/Z \
									node_0_0/r/xbar_with_latches/ch_latch_*/C172/Z \
									node_0_1/r/*_hpu/token_latch/controller/I_0/Z \
									node_0_1/r/*_hpu/token_latch/C171/Z \
									node_1_0/r/*_hpu/token_latch/controller/I_0/Z \
									node_1_0/r/*_hpu/token_latch/C171/Z \
									node_1_1/r/*_in_latch/controller/I_0/Z \
									node_1_1/r/*_in_latch/C171/Z \
									node_1_1/r/xbar_with_latches/ch_latch_*/controller/I_0/Z \
									node_1_1/r/xbar_with_latches/ch_latch_*/C172/Z \
 									# node_0_0/r/xbar_with_latches/ch_latch_*/C157/Z \
 									# node_1_1/r/xbar_with_latches/ch_latch_*/C157/Z \
								    } ]

# create_clock -name "clkM" -period 0.8 -waveform {0 0.4} [get_pins { node_0_0/r/*_in_latch/controller/I_0/Z \
# 									node_0_0/r/xbar_with_latches/ch_latch_*/controller/I_0/Z \
# 									node_0_0/r/xbar_with_latches/ch_latch_*/C157/Z \
# 									node_0_1/r/*_hpu/token_latch/controller/I_0/Z \
# 									node_1_0/r/*_hpu/token_latch/controller/I_0/Z \
# 									node_1_1/r/*_in_latch/controller/I_0/Z \
# 									node_1_1/r/xbar_with_latches/ch_latch_*/controller/I_0/Z \
# 									node_1_1/r/xbar_with_latches/ch_latch_*/C157/Z \
# 								    } ]




create_clock -name "clkS" -period 0.8 -waveform {0.4 0.8} [get_pins {node_0_0/r/*_hpu/token_latch/controller/I_0/Z \
									 node_0_0/r/*_hpu/token_latch/C171/Z \
									 node_0_1/r/*_in_latch/controller/I_0/Z\
									 node_0_1/r/*_in_latch/C171/Z\
									 node_0_1/r/xbar_with_latches/ch_latch_*/controller/I_0/Z\
									 node_0_1/r/xbar_with_latches/ch_latch_*/C172/Z\
									 node_1_0/r/*_in_latch/controller/I_0/Z\
									 node_1_0/r/*_in_latch/C171/Z\
									 node_1_0/r/xbar_with_latches/ch_latch_*/controller/I_0/Z\
									 node_1_0/r/xbar_with_latches/ch_latch_*/C172/Z\
									 node_1_1/r/*_hpu/token_latch/controller/I_0/Z \
									 node_1_1/r/*_hpu/token_latch/C171/Z \
 									 # node_1_0/r/xbar_with_latches/ch_latch_*/C157/Z\
 									 # node_0_1/r/xbar_with_latches/ch_latch_*/C157/Z\
 } ]

# create_clock -name "clkS" -period 0.8 -waveform {0.4 0.8} [get_pins {node_0_0/r/*_hpu/token_latch/controller/I_0/Z \
# 									 node_0_1/r/*_in_latch/controller/I_0/Z\
# 									 node_0_1/r/xbar_with_latches/ch_latch_*/controller/I_0/Z\
# 									 node_0_1/r/xbar_with_latches/ch_latch_*/C157/Z\
# 									 node_1_0/r/*_in_latch/controller/I_0/Z\
# 									 node_1_0/r/xbar_with_latches/ch_latch_*/controller/I_0/Z\
# 									 node_1_0/r/xbar_with_latches/ch_latch_*/C157/Z\
# 									 node_1_1/r/*_hpu/token_latch/controller/I_0/Z \
# } ]

set_ideal_network -no_propagate {node_*_*/r/*_in_latch/controller/I_0/Z}
set_ideal_network -no_propagate {node_*_*/r/*_hpu/token_latch/controller/I_0/Z}
set_ideal_network -no_propagate {node_*_*/r/xbar_with_latches/ch_latch_*/controller/I_0/Z}


set_ideal_network -no_propagate {node_*_*/r/*_in_latch/C171/Z_0}
set_ideal_network -no_propagate {node_*_*/r/*_hpu/token_latch/C171/Z_0}
set_ideal_network -no_propagate {node_*_*/r/xbar_with_latches/ch_latch_*/C171/Z_0}

# was: C172
set_ideal_network -no_propagate {node_*_*/r/*_in_latch/C172/Z_0}
set_ideal_network -no_propagate {node_*_*/r/*_hpu/token_latch/C172/Z_0}
set_ideal_network -no_propagate {node_*_*/r/xbar_with_latches/ch_latch_*/C172/Z_0}

set_ideal_network -no_propagate {node_*_*/r/*_in_latch/C159/Z_0}
set_ideal_network -no_propagate {node_*_*/r/*_hpu/token_latch/C159/Z_0}
set_ideal_network -no_propagate {node_*_*/r/xbar_with_latches/ch_latch_*/C159/Z_0}

#get_pins -of_objects [get_cells -hierarchical data_reg* -filter is_sequential] -filter pin_name==enable

####################################################### for network only

# Delay elements from NI to routers
# set_min_delay -from node_1_1/I_1/A -to node_1_1/I_2/Z 0.45
# set_min_delay -from node_1_0/I_1/A -to node_1_0/I_2/Z 0.45
# set_min_delay -from node_0_1/I_1/A -to node_0_1/I_2/Z 0.45
# set_min_delay -from node_0_0/I_1/A -to node_0_0/I_2/Z 0.45

foreach node [get_object_name [get_cells node_*_*]] {
    #get the input and output pins of the delay line buffers
    set inv_in [get_cells -of_objects [get_pins -of_objects [get_nets "$node/del_half_clk0"] -filter pin_direction==out]]
    set inv_out [get_cells -of_objects [get_pins -of_objects [get_nets "$node/ip_to_net_f\[REQ\]"] -filter pin_direction==out]]
    set_min_delay -from [get_pins -of_objects $inv_in -filter pin_direction==in] -to [get_pins -of_objects $inv_out -filter pin_direction==out] 0.3
}


#for {set i 0}{$i<32} {$i=$i+2} {
#puts $i
#set_min_delay -from I_$i/A -to I_($i+1)/Z 0.2
#}

# Delay Elements between routers
set_min_delay -from I_0/A -to I_1/Z 0.3
set_min_delay -from I_2/A -to I_3/Z 0.3
set_min_delay -from I_4/A -to I_5/Z 0.3
set_min_delay -from I_6/A -to I_7/Z 0.3
set_min_delay -from I_8/A -to I_9/Z 0.3
set_min_delay -from I_10/A -to I_11/Z 0.3
set_min_delay -from I_12/A -to I_13/Z 0.3
set_min_delay -from I_14/A -to I_15/Z 0.3
set_min_delay -from I_16/A -to I_17/Z 0.3
set_min_delay -from I_18/A -to I_19/Z 0.3
set_min_delay -from I_20/A -to I_21/Z 0.3
set_min_delay -from I_22/A -to I_23/Z 0.3
set_min_delay -from I_24/A -to I_25/Z 0.3
set_min_delay -from I_26/A -to I_27/Z 0.3
set_min_delay -from I_28/A -to I_29/Z 0.3
set_min_delay -from I_30/A -to I_31/Z 0.3

set_min_delay -from I_32/A -to I_33/Z 0.3
set_min_delay -from I_34/A -to I_35/Z 0.3
set_min_delay -from I_36/A -to I_37/Z 0.3
set_min_delay -from I_38/A -to I_39/Z 0.3
set_min_delay -from I_40/A -to I_41/Z 0.3
set_min_delay -from I_42/A -to I_43/Z 0.3
set_min_delay -from I_44/A -to I_45/Z 0.3
set_min_delay -from I_46/A -to I_47/Z 0.3
set_min_delay -from I_48/A -to I_49/Z 0.3
set_min_delay -from I_50/A -to I_51/Z 0.3
set_min_delay -from I_52/A -to I_53/Z 0.3
set_min_delay -from I_54/A -to I_55/Z 0.3
set_min_delay -from I_56/A -to I_57/Z 0.3
set_min_delay -from I_58/A -to I_59/Z 0.3
set_min_delay -from I_60/A -to I_61/Z 0.3
set_min_delay -from I_62/A -to I_63/Z 0.3



#set_wire_load_model -name area_6Kto7K
write -hierarchy -format ddc -output unmapped_constrained.ddc


