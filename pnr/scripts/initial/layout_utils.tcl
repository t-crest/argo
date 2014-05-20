package require stooop
namespace import stooop::*

namespace eval layout_utils {
    proc trace_to_next_tile {tile port} {
	set trace_list1 $tile
	
	# forward tracing
	set pin [get_pins $tile/$port\_out_b]
	set next_pin [get_pins -of_objects [get_nets -of_objects $pin] -filter pin_direction==out]
	set next_cell [get_object_name [get_cells -of_objects $next_pin]]
	
	lappend trace_list1 $next_cell

	while {[regexp {pipeline_latch_.*} $next_cell]} {
	    puts $next_cell
	    set pin [get_pins $next_cell/right_in]
	    set next_pin [get_pins -of_objects [get_nets -of_objects $pin] -filter pin_direction==out]
	    set next_cell [get_object_name [get_cells -of_objects $next_pin]]
	    lappend trace_list1 $next_cell
	}
	return $trace_list1
    }

    proc compare_pairs {pair1 pair2} {
	set a1 [lindex $pair1 0]
	set a2 [lindex $pair2 0]
	set b1 [lindex $pair1 end]
	set b2 [lindex $pair2 end]
	if {(($a1 == $b1) && ($a2 == $b2)) || (($a1 == $b2) && ($a2 == $b1)) } { return 0 } elseif {[grid_element::distance_to $a1 [grid_element::get_center $b1]] > [grid_element::distance_to $a2 [grid_element::get_center $b2]] } { return 1 } else {return -1}
    }

    proc get_path_length {node_list} {
	return [expr [join [extract_length $node_list] +]]
    }

    # function to find a placement for the pipeline stages:
    # takes a route (list of grid_elements) and the number of pipeline 
    # stages to add and returns a list of mappings, consisting out of 
    # the grid element where the stage is mapped to, a relative position within
    # the grid element and the offset of this position from the optimal point.

    proc find_valid_placement {node_list num_elements} {
	# get the total length of the path
	set total_length [get_path_length $node_list]
	# calculate the length of the path segments
	set target_length [expr $total_length / ($num_elements + 1)]
	
	# trace through the path 
	set length 0
	set i 1
	set mapping {}

	# mapping
	foreach node $node_list node_length [extract_length $node_list] {
	    while {1} {
		set k [expr $i*$target_length] 
		if {[grid_element::valid_placement $node]} {
		    if {$length <= $k && $k <= [expr $length + $node_length]} {
			# simple case: optimal position is within this grid element && we are allowed to place here
			set ratio [expr ($k-$length)/$node_length]
			lappend mapping "$node $ratio 0"
			incr i
		    } elseif {$k < $length} {
			# path is longer than optimum, place either at the begining of this grid element or at the 
			# last known valid position 
			puts "else $k < $length"
			# last valid position is better
			if {[expr abs($last_valid_length - $k)] < [expr abs($length - $k)]} {
			    lappend mapping [concat $last_valid [expr abs($last_valid_length - $k)]]
			    incr i
			    # this position is better
			} else {
			    lappend mapping "$node 0 [expr abs($length - $k)]"
			    incr i
			}
		    } else {
			# k is larger than this node, check next node
			break
		    }		
		    # the end of this node might be a valid placement, keep it for later
		    set last_valid "$node 1"
		    set last_valid_length [expr $length + $node_length]
		} else {
		    # not a valid placement, skip this node
		    break
		}	
	    }	
	    set length [expr $length + $node_length]
	}
	return $mapping
    }

    proc extract_length {path} {
	set length_list {}
	set prev_node [grid_element::get_neighbor_tile [lindex $path 0]]
	foreach node $path {
	    if {$node eq [lindex $path end]} {
		set next_node  [grid_element::get_neighbor_tile [lindex $path end]]
	    } else {
		set next_node  [lindex $path [expr 1 + [lsearch $path $node]]]
	    }

	    set length 0

	    if {[grid_element::get_north $node] eq $prev_node || [grid_element::get_south $node] eq $prev_node} {
		set length [expr [grid_element::get_height $node]/2 + $length]
	    } else {
		set length [expr [grid_element::get_width $node]/2 + $length]
	    }

	    if {[grid_element::get_north $node] eq $next_node || [grid_element::get_south $node] eq $next_node} {
		set length [expr [grid_element::get_height $node]/2 + $length]
	    } else {
		set length [expr [grid_element::get_width $node]/2 + $length]
	    }
	    
	    lappend length_list $length
	    set prev_node $node
	}
	
	return $length_list
    }
}
