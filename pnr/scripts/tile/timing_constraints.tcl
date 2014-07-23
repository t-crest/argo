set_interactive_constraint_modes TT

# values seen in previous runs...
set min_load 0.68
set max_load 1.37
set data_load_margin 0.1

if {[lsearch [get_object_name [get_clocks]] constraint_clk] < 0} {
    # MOUSETRAP based design ####################################################################
    #############################################################################################
    puts "constraining for MOUSETRAP"
    set output_latch_enables [dbGet [dbGet top.terms.net.instTerms .isOutput].inst.instTerms.name *G]
    set output_latch_output [dbGet [dbGet top.terms.net.instTerms .isOutput].name]

    # values seen in previous runs...
    set min_load 0.68
    set max_load 1.37
    set data_load_margin 0.1

    # Set the wire load to the load data seen in previous runs + a margin to 
    # ensure stronger drivers on the data lines to ensure the request to 
    # propagate slower than the data.
    set_load [expr $min_load + $data_load_margin] [all_outputs] -wire_load -min
    set_load [expr $max_load + $data_load_margin] [all_outputs] -wire_load -max

    # Rise & Fall time for the Outputs
    set_max_transition 0.6 [all_outputs]

    # reduce the load on the request outputs
    set req_outputs [get_object_name [get_ports *_out_f\[35\]]]
    set_load $min_load $req_outputs -wire_load -min
    set_load $max_load $req_outputs -wire_load -max

    #
    set_output_delay 0.2 [all_outputs] -clock twophase_clk1
    set_input_delay 0 [all_inputs -no_clocks] -clock twophase_clk1

    # break the arc through the packet interface to break the 
    # relation between the na clock and the clocks used to constrain
    # the latches within the router
    set_false_path -through [get_pins na/pkt_in]
    set_false_path -through [get_pins na/pkt_out]
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

} else {
    # Click element based design ################################################################
    #############################################################################################
    puts "constraining for Click Elements"

    # Set the wire load to the load data seen in previous runs + a margin to 
    # ensure stronger drivers on the data lines to ensure the request to 
    # propagate slower than the data.
    set_load [expr $min_load + $data_load_margin] [all_outputs] -wire_load -min
    set_load [expr $max_load + $data_load_margin] [all_outputs] -wire_load -max

    # Rise & Fall time for the Outputs
    set_max_transition 0.5 [all_outputs]

    # reduce the load on the request outputs
    #set req_outputs [get_object_name [get_ports *_out_f\[35\]]]
    #set_load $min_load $req_outputs -wire_load -min
    #set_load $max_load $req_outputs -wire_load -max

    #
    set_output_delay 0.2 [all_outputs] -clock constraint_clk
    set_input_delay 0 [all_inputs -no_clocks] -clock constraint_clk

    # break the arc through the packet interface to break the 
    # relation between the na clock and the clocks used to constrain
    # the latches within the router - skew here is captured by the 
    # asynchronous NOC
    #set_false_path -through [get_pins -hierarchical na/pkt*]
    #set_false_path -through [get_pins -hierarchical controller/req_i*]
    #set_max_delay -from ni_clk -to [get_pins -hierarchical na/pkt_* -filter pin_direction==out] 0.2

    # Make sure pathes through preset are surpressed
    #set_disable_timing [get_pins -hierarchical controller/reset]
    #set_false_path -through [get_pins -hierarchical controller/reset]
    #set_false_path -through [get_pins -hierarchical req_reg/D] 

}
