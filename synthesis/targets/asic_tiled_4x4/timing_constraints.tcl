# backwards compatibility to tcl 8.4 - reeimplement lreverse...
if {[info command lreverse] == ""} {
    proc lreverse list {
        set res {}
        set i [llength $list]
        while {$i} {
            lappend res [lindex $list [incr i -1]]
        }
        set res
    } ;# RS
}

# List of signals to be clocked by either phase 1 or phase two
set c1_g {}
set c2_g {}

for {set curN 0} {$curN < $gridN} {incr curN} {
    for {set curM 0} {$curM < $gridM} {incr curM} {

	# get the current tile
	set nt [get_object_name [get_cells noc_tile_*_$curN\_$curM]]

	# input latch
	set router_stage1_controller [get_object_name [get_cells $nt/r/*_in_latch/controller]]
	set router_stage1_controller_en [get_object_name [get_pins $nt/r/*_in_latch/controller/lt_en]]
	set router_stage1_controller_Rin [get_object_name [get_pins $nt/r/*_in_latch/controller/Rin]]
	set router_stage1_controller_Rout [get_object_name [get_pins $nt/r/*_in_latch/controller/Rout]]
	# hpu latch
	set router_stage2_controller [get_object_name [get_cells $nt/r/*hpu_inst/token_latch/controller]]
	set router_stage2_controller_en [get_object_name [get_pins $nt/r/*hpu_inst/token_latch/controller/lt_en]]
	set router_stage2_controller_Rout [get_object_name [get_pins $nt/r/*hpu_inst/token_latch/controller/Rout]]

	# crossbar latch
	set router_stage3_controller [get_object_name [get_cells $nt/r/xbar_with_latches/ch_latch*/controller]]
	set router_stage3_controller_en [get_object_name [get_pins $nt/r/xbar_with_latches/ch_latch*/controller/lt_en]]
	set router_stage3_controller_Rout [get_object_name [get_pins $nt/r/xbar_with_latches/ch_latch*/controller/Rout]]

	# input_fifo
	set input_fifo_controller [get_object_name [get_cells $nt/input_fifo/latch_stage*/controller]]
	set input_fifo_controller_en [get_object_name [get_pins $nt/input_fifo/latch_stage*/controller/lt_en]]
	set input_fifo_controller_Rout [get_object_name [get_pins $nt/input_fifo/latch_stage*/controller/Rout]]

	# output_fifo
	set output_fifo_controller [get_object_name [get_cells $nt/output_fifo/latch_stage*/controller]]
	set output_fifo_controller_en [get_object_name [get_pins $nt/output_fifo/latch_stage*/controller/lt_en]]
	set output_fifo_controller_Rout [get_object_name [get_pins $nt/output_fifo/latch_stage*/controller/Rout]]

	# link pipeline controller
	set link_pipeline_ctrl {}

	# enable signal, alternating assignment to provide the tool a two phase 
	# non overlapping clock equivalent for time constraining
	set phi_1_en [concat $router_stage1_controller_en $router_stage3_controller_en]
	#  $router_stage1_controller_Rout $router_stage3_controller_Rout
	set phi_2_en  [concat $router_stage2_controller_en]
	#  $router_stage2_controller_Rout

	# alternate the input & output fifo stages
	set i 0
	foreach input_fifo $input_fifo_controller_en {
	    if {[expr $i % 2] == 0} { lappend phi_2_en $input_fifo } else { lappend phi_1_en $input_fifo }
	    incr i
	}
	set i 0
	foreach output_fifo [lreverse $output_fifo_controller_en] {
	    if {[expr $i % 2] == 0} { lappend phi_2_en $output_fifo } else { lappend phi_1_en $output_fifo }
	    incr i
	}	
	#set i 0
	#foreach input_fifo $input_fifo_controller_Rout {
	#    if {[expr $i % 2] == 0} { lappend phi_2_en $input_fifo } else { lappend phi_1_en $input_fifo }
	#    incr i
	#}
	#set i 0
	#foreach output_fifo [lreverse $output_fifo_controller_Rout] {
	#    if {[expr $i % 2] == 0} { lappend phi_2_en $output_fifo } else { lappend phi_1_en $output_fifo }
	#    incr i
	#}

	# constraint the pipeline latch stages
	for {set stage 0} {$stage < $LINK_PIPELINE_STAGES} {incr stage} {
	    
	    foreach latch [get_object_name [get_cells pipeline_latch_*_$curN\_$curM\_$stage]] {
		# append controller to list for later constraining
		lappend link_pipeline_ctrl $latch/stage/controller
		set latch_en [get_object_name [get_pins $latch/stage/controller/lt_en]]
		#set latch_req [get_object_name [get_pins $latch/stage/controller/Rout]]

		# stagewise alternating of the clocks 
		if {[expr $stage % 2] == 0} { 
		    lappend phi_2_en $latch_en 
		 #   lappend phi_2_en $latch_req 
		} else { 
		    lappend phi_1_en $latch_en 
		 #   lappend phi_1_en $latch_req
		}
	    }
	}

	# depending on where our tile is located either c1 or c2 is to be assigned
	if {[expr ($curN + $curM) % 2] == 0 || [expr $LINK_PIPELINE_STAGES % 2] == 1} {
	    lappend c1_g $phi_1_en
	    lappend c2_g $phi_2_en
	} else {
	    lappend c1_g $phi_2_en
	    lappend c2_g $phi_1_en
	}

	# break the arc through the packet interface to break the 
	# relation between the na clock and the clocks used to constrain
	# the latches within the router
	set_false_path -through [get_pins $nt/na/pkt_in]
	set_false_path -through [get_pins $nt/na/pkt_out]
	set_false_path -through [get_pins -hierarchical controller/Rin]

	# Make sure pathes through preset are surpressed
	set_disable_timing [get_pins -hierarchical controller/preset]
	set_false_path -through [get_pins -hierarchical controller/preset]
	set_false_path -through [get_pins -hierarchical c_sync_req/preset]
	set_false_path -through [get_pins -hierarchical c_sync_ack/preset]
	set_false_path -through [get_pins -hierarchical latch/s]
	set_false_path -through [get_pins -hierarchical latch/r]
	set_false_path -through [get_pins -hierarchical r_next_reg/enable]
	set_false_path -through [get_pins -hierarchical r_next_reg/data_in] 
	
	# set up a timing constraint for the combinatoric in & output of the ni
	set to [get_object_name \
	    [get_pins -of_objects \
		 [get_cells -of_objects \
		      [get_pins -of_object [get_net $nt/ip_to_net_f\[REQ\]] -filter pin_direction==out ] \
		 ] \
	     -filter pin_direction==in
	    ] \
       ]
	set from [get_object_name [get_pins -of_object [get_net $nt/del_half_clk0] -filter pin_direction==out]]
	set_min_delay -from $from -to $to .45 -comment "matched delay between ni & router"

	# matched delay for request between input latch and hpu latch
	
	set hpu_delay_net_A [get_object_name [get_net $nt/r/*hpu_inst/hpu_combinatorial/REQ_INT]]

	foreach net_o $hpu_delay_net_A {
	    # in a nutshell: we have the name of the output net, so find the driving cell and get the name of the net of its input.
	    set net [get_object_name [get_net -of_object [get_pins -of_object [get_cell -of_objects [get_pins -of_objects [get_net $net_o] -filter pin_direction==out]] -filter pin_direction==in]]]
	    set from [get_pins -of_objects [get_net $net] -filter pin_direction==out]
	    set to [get_pins -of_objects [get_net $net] -filter pin_direction==in]
	    set_max_delay -from $from -to $to .31 -comment "matched delay for hpu (d1)"
	    #0.27
	    set_min_delay -from $from -to $to .26 -comment "matched delay for hpu (d1)"
	    #0.22	    
	}

	set hpu_delay_net_B [get_object_name [get_net $nt/r/*hpu_inst/hpu_combinatorial/chan_out_f\[REQ\]]]
	foreach net_o $hpu_delay_net_B {
	    # in a nutshell: we have the name of the output net, so find the driving cell and get the name of the net of its input.
	    set net [get_object_name [get_net -of_object [get_pins -of_object [get_cell -of_objects [get_pins -of_objects [get_net $net_o] -filter pin_direction==out]] -filter pin_direction==in]]]
	    set from [get_pins -of_objects [get_net $net] -filter pin_direction==out]
	    set to [get_pins -of_objects [get_net $net] -filter pin_direction==in]
	    set_max_delay -from $from -to $to .18 -comment "matched delay for hpu (d2)"
	    #0.27
	    set_min_delay -from $from -to $to .13 -comment "matched delay for hpu (d2)"
	    #0.22	    
	}

	# compensate for the delayed gated latch enable at the sel lines by adding an
	# acknowledge delay to keep the input data stable until the data is stored.
	set hpu_latch_acknowledge_net [get_object_name [get_nets -of_objects [get_pins -of_objects [get_cells -of_objects [get_pins -of_object [get_net $nt/r/*hpu_inst/token_latch/out_ack] -filter pin_direction==in]] -filter pin_direction==out]]]
	foreach net $hpu_latch_acknowledge_net {
	    set from [get_pins -of_objects [get_net $net] -filter pin_direction==out]
	    set to [get_pins -of_objects [get_net $net] -filter pin_direction==in]
	    set_min_delay -from $from -to $to .1 -comment "compensate for clock gating delay in hpu"
	}

	# matched delay for request in xbar
	set router_delay_2_3_net [get_object_name [get_net $nt/r/xbar_with_latches/crossbar/del]]
	foreach net $router_delay_2_3_net {
	    set from [get_pins -of_objects [get_net $net] -filter pin_direction==out]
	    set to [get_pins -of_objects [get_net $net] -filter pin_direction==in]
	    set_max_delay -from $from -to $to .18 -comment "matched delay for xbar" 
	    #0.18
	    set_min_delay -from $from -to $to .12 -comment "matched delay for xbar"
	    #0.12
	}

	# break timing_loops
	
	# timing constraints for the controller
	foreach controller [concat $router_stage2_controller $link_pipeline_ctrl] {
	    set_max_delay -from $controller/preset -to $controller/r_next_reg/enable 0.04 -comment "ensure reset order"
	    set_max_delay -from $controller/Rin -to $controller/r_next_reg/data_in 0.04 -comment "ensure reset order"
	    set_min_delay -from $controller/preset -to $controller/r_next_reg/data_in 0.1 -comment "ensure reset order"
	}

	# C-Elements
	set_disable_timing $nt/r/xbar_with_latches/crossbar/c_sync_req/latch/C9/B
	set_disable_timing $nt/r/xbar_with_latches/crossbar/c_sync_ack/latch/C9/B

    }
}

# clock for the ni, processor, ...
create_clock -name ni_clk -period 3.6 -waveform {0 1.2} [get_ports n_clk] -comment "clock constraint for the network interface"

# two phase non overlapping clock definition for timing analysis between 
# the stages: these fake clocks are defined at the enable outputs of the
# controllers and are used to constraint the logic to provide starting & 
# end point in time for calculations. 
#                        _____         _____
# twophase_clk1 \_______/     \_______/    
#                
#                 _____         _____
# twophase_clk2 _/     \_______/     \______

create_clock -name twophase_clk1 -period 1.2 -waveform {.6 1.19} [join $c1_g] \
    -comment "phi1: twophase clock to constraint the combinatorics between the controllers"

create_clock -name twophase_clk2 -period 1.2 -waveform {0 .59} [join $c2_g] \
    -comment "phi2: twophase clock to constraint the combinatorics between the controllers"

# make sure that no time borrowing is used for path calculations:
# during handshaking the only guaranted timing is the one defined 
# by the injected delays, in particular no assumptions on the width
# of the enable signals can be made

# set_max_time_borrow 0 [all_registers -clock twophase_clk1]
# set_max_time_borrow 0 [all_registers -clock twophase_clk2]
set_max_time_borrow 0 {twophase_clk1 twophase_clk2 ni_clk}
