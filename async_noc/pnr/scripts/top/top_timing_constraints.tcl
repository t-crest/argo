set c1_g {}
set c2_g {}

set_interactive_constraint_modes TT

for {set curN 0} {$curN < $gridN} {incr curN} {
    for {set curM 0} {$curM < $gridM} {incr curM} {

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

	# enable signal, alternating assignment to provide the tool a two phase 
	# non overlapping clock equivalent for time constraining
	set phi_1_en [concat $router_stage1_controller_en $router_stage3_controller_en $router_stage1_controller_Rout $router_stage3_controller_Rout]
	set phi_2_en  [concat $router_stage2_controller_en $router_stage2_controller_Rout]

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
	set i 0
	foreach input_fifo $input_fifo_controller_Rout {
	    if {[expr $i % 2] == 0} { lappend phi_2_en $input_fifo } else { lappend phi_1_en $input_fifo }
	    incr i
	}
	set i 0
	foreach output_fifo [lreverse $output_fifo_controller_Rout] {
	    if {[expr $i % 2] == 0} { lappend phi_2_en $output_fifo } else { lappend phi_1_en $output_fifo }
	    incr i
	}



	if {[expr ($curN + $curM) % 2] == 0} {
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
	set_false_path -through [get_pins -hierarchical r_next_reg/G]
	set_false_path -through [get_pins -hierarchical r_next_reg/D] 

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
    -comment "phi1: twophase clock to constraint the combinatorics between the controllers"

