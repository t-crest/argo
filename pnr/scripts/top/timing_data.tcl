source ../../../scripts/initial/layout_utils.tcl  

proc trace_connection_timing {from from_port to to_port} {
    set collection {}
    
    foreach_in_collection pin [get_pins $from/$from_port\_out*] {
	set data {}
	lappend data $from
	lappend data $from_port
	lappend data $to
	lappend data $to_port
	lappend data [get_object_name $pin]
	if {[regexp {.*(\[35\]|_b)} [get_object_name $pin]]} { 
	    set timing [report_timing  -from $pin -unconstrained -tcl_list -format {instance arc cell arrival delay}]
	    set t_vector [lrange [lindex $timing end end end end] 1 end]
	} else { 
	    set timing [report_timing  -from $pin -tcl_list -format {instance arc cell arrival delay}]
	    set t_vector [lrange [lindex $timing end end end end] 1 end]
	}
	#puts "$from\($from_port\) -> $to\($to_port\) [get_object_name $pin]"
	
	# get timing data
 
	set arrivals {}
	set instances {}
	set cells {}
	set delays {}
	set arcs {}

	foreach row $t_vector {
	    
	    lappend instances [lindex $row end 0]
	    lappend arcs [lindex $row end 1]
	    lappend cells [lindex $row end 2]
	    lappend delays [lindex $row end 4]
	    lappend arrivals [lindex $row end 3]
	}
	set start [lindex [join $arrivals] 0]
	set end [lindex [join $arrivals] end]
	set diff 0
	catch {set diff [expr $end - $start]}
	lappend data $diff
	lappend data "\{[join $arrivals ,]\}"
	lappend data "\{[join $cells ,]\}"
	lappend data "\{[join $instances ,]\}"
	lappend data "\{[join $delays ,]\}"
	lappend data "\{[join $arcs ,]\}"
	lappend collection $data
	#puts "$from\($from_port\) -> $to\($to_port\) [get_object_name $pin] $cells $arrivals"
    }
    return $collection
}

proc trace_connection_net {from from_port to to_port} {
    set collection {}
    foreach_in_collection pin [get_pins $from/$from_port\_out*] {
	set data {}
	lappend data $from
	lappend data $from_port
	lappend data $to
	lappend data $to_port
	
	set net [get_nets -of_object $pin]
	set net_ [get_object_name $net]

	lappend data $net_
	lappend data [get_object_name $pin]

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
	
	set layer_lengths "$M1 $M2 $M3 $M4 $M5 $M6 $M7 $M8"

	lappend data $cap
	lappend data $layer_lengths
	lappend data $t_length
	lappend data $via
	lappend collection $data
    }
    return $collection
}

proc trace_to_csv {collection filename} {
    set f [open $filename w]
    foreach line $collection {
	puts $f [join [join $line] ";"]
    }
    close $f
}

proc trace_noc_timing { } {
    set collection_nets {}
    set collection_timing {}
    foreach tile [get_object_name [get_cells noc_tile*]] {
	foreach direction {north south east west} {
	    set connections [::layout_utils::trace_to_next_tile_extended $tile $direction]
	    set nodes [lindex $connections 0]
	    set ports [lindex $connections end]
	    set first_node [lindex $nodes 0]
	    set first_port [lindex $ports 0]
	    foreach n [lrange $nodes 1 end] p [lrange $ports 1 end] {
		lappend collection_timing [trace_connection_timing $first_node $first_port $n $p]
		lappend collection_nets [trace_connection_net $first_node $first_port $n $p]
		set first_port $p
		if {[regexp {pipeline_stage} $first_port]} { set first_port right}
		set first_node $n
	    }
	}
    }
    trace_to_csv [join $collection_nets] net_properties.csv
    trace_to_csv [join $collection_timing] timing_data.csv
}
