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

# input latch
set router_stage1_controller [get_object_name [get_cells r/*_in_latch/controller]]
set router_stage1_controller_en [get_object_name [get_pins r/*_in_latch/controller/lt_en]]
set router_stage1_controller_Rin [get_object_name [get_pins r/*_in_latch/controller/Rin]]
# hpu latch
set router_stage2_controller [get_object_name [get_cells r/*hpu_inst/token_latch/controller]]
set router_stage2_controller_en [get_object_name [get_pins r/*hpu_inst/token_latch/controller/lt_en]]

# crossbar latch
set router_stage3_controller [get_object_name [get_cells r/xbar_with_latches/ch_latch*/controller]]
set router_stage3_controller_en [get_object_name [get_pins r/xbar_with_latches/ch_latch*/controller/lt_en]]

# input_fifo
set input_fifo_controller [get_object_name [get_cells input_fifo/latch_stage*/controller]]
set input_fifo_controller_en [get_object_name [get_pins input_fifo/latch_stage*/controller/lt_en]]

# output_fifo
set output_fifo_controller [get_object_name [get_cells output_fifo/latch_stage*/controller]]
set output_fifo_controller_en [get_object_name [get_pins output_fifo/latch_stage*/controller/lt_en]]

# enable signal, alternating assignment to provide the tool a two phase 
# non overlapping clock equivalent for time constraining
set phi_1_en [concat $router_stage1_controller_en $router_stage3_controller_en]
set phi_2_en $router_stage2_controller_en

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


# delay the input request
# set_min_delay -through $router_stage1_controller_Rin 1

# matched delay for request between input latch and hpu latch
set router_delay_1_2_net [get_object_name [get_net r/*hpu_inst/req_n]]
foreach net $router_delay_1_2_net {
    set from [get_pins -of_objects [get_net $net] -filter pin_direction==out]
    set to [get_pins -of_objects [get_net $net] -filter pin_direction==in]
    set_max_delay -from $from -to $to .28 -comment "matched delay for hpu"
    #0.27
    set_min_delay -from $from -to $to .23 -comment "matched delay for hpu"
    #0.22
    
}

# compensate for the delayed gated latch enable at the sel lines by adding an
# acknowledge delay to keep the input data stable until the data is stored.

set hpu_latch_acknowledge_net [get_object_name [get_nets -of_objects [get_pins -of_objects [get_cells -of_objects [get_pins -of_object [get_net r/*hpu_inst/token_latch/out_ack] -filter pin_direction==in]] -filter pin_direction==out]]]
foreach net $hpu_latch_acknowledge_net {
    set from [get_pins -of_objects [get_net $net] -filter pin_direction==out]
    set to [get_pins -of_objects [get_net $net] -filter pin_direction==in]
    set_min_delay -from $from -to $to .1 -comment "compensate for clock gating delay in hpu"
}


# matched delay for request in xbar
set router_delay_2_3_net [get_object_name [get_net r/xbar_with_latches/crossbar/del]]
foreach net $router_delay_2_3_net {
    set from [get_pins -of_objects [get_net $net] -filter pin_direction==out]
    set to [get_pins -of_objects [get_net $net] -filter pin_direction==in]
    set_max_delay -from $from -to $to .18 -comment "matched delay for xbar" 
    #0.18
    set_min_delay -from $from -to $to .12 -comment "matched delay for xbar"
    #0.12
}

# timing constraints for the controller
foreach controller $router_stage2_controller {
    set_max_delay -from $controller/preset -to $controller/r_next_reg/enable 0.04 -comment "ensure reset order"
    set_max_delay -from $controller/Rin -to $controller/r_next_reg/data_in 0.04 -comment "ensure reset order"
    set_min_delay -from $controller/preset -to $controller/r_next_reg/data_in 0.1 -comment "ensure reset order"
}

# break timing_loops

# C-Elements
set_disable_timing r/xbar_with_latches/crossbar/c_sync_req/latch/C9/B
set_disable_timing r/xbar_with_latches/crossbar/c_sync_ack/latch/C9/B

# controller
foreach controller [concat $router_stage1_controller $router_stage2_controller $router_stage3_controller $input_fifo_controller $output_fifo_controller] {
    set_disable_timing $controller/r_next_reg/enable
    # catch hold time violations (10 ps min)
    set_min_delay -through $controller/Ain 0.01
    #[get_pins -of_objects  [get_nets $controller/lt_en] -filter {pin_direction==out}]
    #get_net $controller/lt_en
}


# clock for the ni, processor, ...
create_clock -name ni_clk -period 3.6 -waveform {0 1.2} [get_ports clk] -comment "clock constraint for the network interface"

# two phase non overlapping clock definition for timing analysis between 
# the stages: these fake clocks are defined at the enable outputs of the
# controllers and are used to constraint the logic to provide starting & 
# end point in time for calculations. 
#                        _____         _____
# twophase_clk1 \_______/     \_______/    
#                
#                 _____         _____
# twophase_clk2 _/     \_______/     \______

create_clock -name twophase_clk1 -period 1.2 -waveform {.6 1.19} $phi_1_en \
-comment "phi1: twophase clock to constraint the combinatorics between the controllers"

create_clock -name twophase_clk2 -period 1.2 -waveform {0 .59} $phi_2_en \
-comment "phi1: twophase clock to constraint the combinatorics between the controllers"

# make sure that no time borrowing is used for path calculations:
# during handshaking the only guaranted timing is the one defined 
# by the injected delays, in particular no assumptions on the width
# of the enable signals can be made
 
set disable_auto_time_borrow true
set_max_time_borrow 0 {twophase_clk1 twophase_clk2 ni_clk}

# break up the timing relation between the handshake clocks and
# the clock of the ni
set_clock_groups -asynchronous {twophase_clk1 ni_clk}

# set up a timing constraint for the combinatoric in & output of the ni
set to [get_object_name \
	    [get_pins -of_objects \
		 [get_cells -of_objects \
		      [get_pins -of_object [get_net {ip_to_net_f[REQ]}] -filter pin_direction==out ] \
		 ] \
	     -filter pin_direction==in
	    ] \
       ]
set from [get_object_name [get_pins -of_object [get_net del_half_clk0] -filter pin_direction==out]]
set_min_delay -from $from -to $to .45 -comment "matched delay between ni & router"
#0.45

set_max_delay -from ni_clk -to na/pkt_out 0.4
set_max_delay -from na/pkt_in -to ni_clk 0.4
