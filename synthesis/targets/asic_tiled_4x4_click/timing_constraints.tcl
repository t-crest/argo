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

proc assign_delay {cell min max comment} {
    set net [get_net $cell/internal]
    set from [get_pins -of_objects [get_cells -of_objects [get_pins -of_objects $net -filter pin_direction==out]] -filter pin_direction==in]
    set to [get_pins -of_objects [get_cells -of_objects [get_pins -of_objects $net -filter pin_direction==in]] -filter pin_direction==out]
    set_min_delay -from $from -to $to $min -comment $comment
    set_max_delay -from $from -to $to $max -comment $comment
    puts "Matched Delay: $min < delay($cell) < $max: $comment "
}

# List of signals to be clocked by either phase 1 or phase two
set c {}

# controllers
foreach controller [get_object_name [get_cells -hierarchical controller]] {
    # store click pin to assign a clock for later constraining
    lappend c "$controller/click"
    #set reset_reg [get_cells -of_objects [get_net $controller/click] -filter "is_hierarchical==false && is_sequential==false"]

    set reset_logic [get_cells -of_objects [get_net $controller/reset] -filter "is_hierarchical==false && is_sequential==false"]
    set_min_delay -from $controller/reset -to [get_pins -of_objects $reset_logic -filter pin_direction==out] 0.1 \
	-comment "ensure that the reset on the logic is held until it is leavered at the flop"
    set_max_delay -from $controller/reset -to $controller/req_reg/preset 0 \
	-comment "ensure that the reset on the logic is held until it is leavered at the flop"

    set reg_clock_in [get_pins $controller/req_reg/clocked_on]
    set_disable_timing [get_pins -of_objects $reset_logic -filter pin_direction==out] 
    #-to [get_pins $controller/req_reg/clocked_on]
	#-comment "break timing loop from the data to the clock pin of the register"

    set_disable_timing [get_pins $controller/req_o] 
    # -comment "disable timing to next stage"
}

# matched delay for the fifos
foreach cell [get_object_name [get_cell noc_tile*/*_fifo/click_stage*/delay_req_element*]] {
    assign_delay $cell .15 .15 "matched delay for input"
}

# matched delay for input (to match the gating)
foreach cell [get_object_name [get_cell noc_tile*/r/in_s*/delay_req_element*]] {
    assign_delay $cell .15 .15 "matched delay for input"
}

# matched delay for xbar
foreach cell [get_object_name [get_cell noc_tile*/r/out_s*/delay_req_element*]] {
    assign_delay $cell .5 .55 "matched delay for xbar"
}

# matched delay for the hpu comb.
foreach cell [get_object_name [get_cell noc_tile*/r/hpu_s*/delay_req_element*]] {
    assign_delay $cell .39 .49 "matched delay for hpu"
}

# break the arc through the packet interface to break the 
# relation between the na clock and the clocks used to constrain
# the latches within the router - skew here is captured by the 
# asynchronous NOC
set_disable_timing [get_pins -hierarchical na/pkt_in*]
set_disable_timing [get_pins -hierarchical na/pkt_out*]
set_disable_timing [get_pins -hierarchical controller/req_i*]
set_max_delay -from ni_clk -to [get_pins -hierarchical na/pkt_* -filter pin_direction==out] 0.3

# we have our constraint clock, so we do not want this relation to ni_clk to propagate
set_disable_timing [get_pins -hierarchical half_clk_reg/Q]

# Make sure pathes through preset are surpressed
set_disable_timing [get_pins -hierarchical controller/reset]
set_disable_timing [get_pins -hierarchical controller/reset]
set_disable_timing [get_pins -hierarchical req_reg/D] 

# A single clock, assigned to all click elements
create_clock -name constraint_clk -period 1.2 [join $c] \
    -comment "clock to constraint the combinatorics between the controllers"

# Ni clock
create_clock -name ni_clk -period 2 -waveform {0 1} [get_ports n_clk] -comment "clock constraint for the network interface"

