set_interactive_constraint_modes TT

# break timing loops
#foreach controller_reg [dbGet -p top.insts.name */controller/r_next_reg] {
#    set controller_reg_name [dbGet $controller_reg.name]
    # set controller_from_db [dbGet $controller_reg.instTerms.name */Q -p]
    # set controller_from [dbGet $controller_from_db.name]
    # set from_prefix [join [lrange [split [dbGet $controller_from_db.inst.name] /] 0 end-1] /]
    # set driven_cells [dbGet [dbGet $controller_from_db.net.instTerms .isInput].name]
    # foreach cell $driven_cells {
    # 	set to_prefix [join [lrange [split $cell /] 0 end-2] /]
    # 	if {$to_prefix eq $from_prefix} {
    # 	    set controller_to $cell
    # 	    break
    # 	}
    # }
    #set controller_to [dbGet $controller_reg.instTerms.name */G]
    #set_disable_timing -from Q -to D $controller_reg_name
#}

set_disable_timing -from Z -to B [dbGet top.insts.name *c_sync_ack/latch/U3]
set_disable_timing -from A -to Z [dbGet top.insts.name */controller/U4]


set output_latches [concat [dbGet -p top.insts.name noc_tile_*/noc_switch_1/xbar_with_latches/ch_latch_*/data_reg*] \
  			[dbGet -p top.insts.name noc_tile_*/noc_switch_1/xbar_with_latches/ch_latch_*/type_out_reg] \
 			[dbGet -p top.insts.name noc_tile_*/noc_switch_1/xbar_with_latches/ch_latch_*/controller/r_next_reg]]

#set output_latches [dbGet -p top.insts.name noc_tile_*/noc_switch_1/xbar_with_latches/ch_latch_*/controller/r_next_reg]
set output_latch_enables [dbGet $output_latches.instTerms.name *G]
set input_latches [concat [dbGet -p top.insts.name noc_tile_*/noc_switch_1/*_in_latch/data_reg*] [dbGet -p top.insts.name noc_tile_*/noc_switch_1/*_in_latch/type_out_reg] [dbGet -p top.insts.name noc_tile_*/noc_switch_1/*_in_latch/controller/r_next_reg]]
#set input_latches [dbGet -p top.insts.name noc_tile_*/noc_switch_1/*_in_latch/controller/r_next_reg]
set input_latch_enables [dbGet $input_latches.instTerms.name *G]


#create_clock -name clk1 -period 20 -waveform {0 9.8} $output_latch_enables
#create_clock -name clk2 -period 20 -waveform {10 19.8} $input_latch_enables



set f [open wire_delays.report.csv w]
puts $f "cell ; direction ; start_pin ; stop_pin ; net ; arrival ; net cap ; total length ; M1 ; M2 ; M3 ; M4 ; M5 ; M6 ; M7 ; M8 ; via ; PATH"
#puts $f "|------+----+-----+-------+---------+--------------+----+----+----+----+----+----+----+----+-----|"
foreach_in_collection cell [get_cells noc_tile*] {
    set cell_ [get_object_name $cell]
    foreach direction {east west north south} {   
	foreach_in_collection pin [get_pins $cell_/$direction\_out*] {
	    set net [get_nets -of_object $pin]
	    set net_ [get_object_name $net]
	    set dbnet [dbGet -p top.nets.name $net_]
	    set db_wire_layers [dbGet $dbnet.wires.layer.name] 
	    set db_wire_length [dbGet $dbnet.wires.length]
	    set l {}
	    set t_length 0
	    set M1 0
	    set M2 0
	    set M3 0
	    set M4 0
	    set M5 0
	    set M6 0
	    set M7 0
	    set M8 0
	    set via -1
	    foreach layer $db_wire_layers length $db_wire_length {
		incr via
		set $layer [expr $$layer + $length]
		lappend l "$layer=$length"
		set t_length [expr $length + $t_length] 
	    } 
	    set cap [lindex [report_net -net $net_ -tcl_list] {0 1 0 1 5 1}]
	    #set start_pin [get_pins -of_objects $net_ -filter {pin_direction==out}]
	    #set endpin [get_pins -of_objects $net_ -filter {pin_direction==in}]
	    set pin_ [get_object_name $pin] 
	    set start_pin_ [dbGet [dbGet $dbnet.instTerms {.isOutput}].name]
	    set start_cell [lindex [split $start_pin_ /] 0]
	    set end_pin_ {}
	    foreach end_pin [dbGet [dbGet $dbnet.instTerms {.isInput}].name] {
		set end_cell [lindex [split $end_pin /] 0]
		if {$start_cell ne $end_cell} {
		    set end_pin_ $end_pin
		    break
		}
	    }
	    
	    set path ""
	    #report_timing -from $start_pin_ -to $end_pin_ 
	    set delay [lindex [report_timing -from $start_pin_ -to $end_pin_ -format {arrival} -tcl_list] { 1 1 8}]
	    if {$delay eq ""} {
		set timing_list [report_timing -from $start_pin_ -to $end_pin -unconstrained -tcl_list]
		set delay [lindex $timing_list {1 1 0 1 1 1 3 } ]
		# was: {1 1 5 1 3 1 4}
		set rows [lrange [lindex $timing_list {1 1 5 1}] 1 end]
		set p {}
		foreach row $rows {
		    lappend p [join [lindex $row 1] ","]
		}
		set path [join $p ","]
	    }
	    puts $f "$cell_ ; $direction; $start_pin_ ; $end_pin_ ; $net_ ; $delay ; $cap ; $t_length ; $M1 ; $M2 ; $M3 ; $M4 ; $M5 ; $M6 ; $M7 ; $M8 ; $via ; $path" 
	}
    }
}
close $f
