package require stooop
namespace import stooop::*

namespace eval layout_utils {
    # Function to trace through the netlist from one tile to the next one, finding all
    # pipeline stags inbetween
    # Takes the tile object and a port (north, south, east, west) as an argument and 
    # follows the path from there.
    # Returns a list of the names of the tiles and the names of the pipeline stages, 
    # in the order found.
    proc trace_to_next_tile {tile port} {
	set trace_list1 $tile
	
	# forward tracing
	set pin [get_pins $tile/$port\_out_b]
	set next_pin [get_pins -of_objects [get_nets -of_objects $pin] -filter pin_direction==out]
	set next_cell [get_object_name [get_cells -of_objects $next_pin]]
	
	lappend trace_list1 $next_cell

	while {[regexp {pipeline_latch_.*} $next_cell]} {
	    #puts $next_cell
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

    # Returns the actual length of a path
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

    # Method to calculate the actual length of a path: the length is calculated through the
    # center of the path
    # Returns a list of calculated lengths for each node of the path, the total length is 
    # the sum of all this values
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

    # To reduce congestion it is helpful to route simple connections 
    # (straight) first. This function gets all the pathes between the tiles,
    # uniquifies it to strip out the same pathes in the opposite direction
    # Returns a unique list of tupels of start and end ports, sorted by complexity 
    # (simple fist, than cornercase)
    proc get_node_paths {grid} {
	# find all paths - each one, starting from each tile
	set path_from_to {}
	foreach tile [join [grid::get_tile_grid $grid]] {
	    lappend path_from_to "[tile::get_tile_port_east $tile ] [tile::get_tile_port_east_target $tile]"
	    lappend path_from_to "[tile::get_tile_port_west $tile ] [tile::get_tile_port_west_target $tile]"
	    lappend path_from_to "[tile::get_tile_port_north $tile ] [tile::get_tile_port_north_target $tile]"
	    lappend path_from_to "[tile::get_tile_port_south $tile ] [tile::get_tile_port_south_target $tile]"
	}

	# the paths are biderectional, so we will find each one twice - sort all pairs...
	set path_from_to_sorted_tupels {}
	foreach tupel $path_from_to {lappend path_from_to_sorted_tupels [lsort $tupel]}

	# ... and get rid of the double ones
	set path_from_to_unique [lsort -unique -index 0 $path_from_to_sorted_tupels]

	# to minimize congestion we want to route the simple pathes first:
	# [row or column identical]
	set simple_paths {}
	set complex_paths {}
	foreach path $path_from_to_unique {
	    set a [lindex $path 0]
	    set b [lindex $path 1]
	    if {[grid_element::get_col $a] eq [grid_element::get_col $b] || [grid_element::get_row $a] eq [grid_element::get_row $b]} {
		lappend simple_paths $path 
	    } else {
		lappend complex_paths $path
	    }
	} 
	# return the pathes in sorted order
	return [concat $simple_paths $complex_paths]
    }

    # Function to determine an actual routing for the pathes, takes a list of 
    # tupels of start and end port and finds a path through the grid between 
    # those two using the A* algorithm.
    # Returns a list of routes (which are lists of nodes)
    proc route_node_paths {node_paths} {
	set i 0
	# route the path & use the color of the starting point as 
	set routed_paths {}
	foreach f $node_paths {
	    # inherit the color from the starting port
	    set c [grid_element::get_color [lindex $f 0]]
	    set path [a_star::a_star [lindex $f 0] [lindex $f 1]]
	    foreach setp $path {
		if {$setp eq [lindex $f 0] || $setp eq [lindex $f 1]} {continue}
		grid_element::set_color $setp $c
	    }
	    lappend routed_paths $path 
	    incr i
	}
	return $routed_paths
    }

    
    # maps pipeline stages to the routed paths and creates 
    # pipeline stage objects
    # returns a list of pipeline stages
    proc map_pipeline_stages {routes} {
	set pipeline_stages {}
	# place the pipeline stages 
	foreach route $routes {
	    set start [lindex $route 0]
	    set end [lindex $route end]
	    
	    set start_tile [::grid_element::get_neighbor_tile $start]
	    set end_tile [::grid_element::get_neighbor_tile $end]

	    set start_name [tile::get_tile_name $start_tile]
	    set end_name [tile::get_tile_name $end_tile] 

	    # get the pipelinestages from start to end & from end to start
	    set trace_forward null
	    set trace_backward null

	    foreach direction {north south east west} {
		set f [::layout_utils::trace_to_next_tile $start_name $direction]
		set b [::layout_utils::trace_to_next_tile $end_name $direction]
		if {[lindex $f end] eq $end_name} { set trace_forward $f }
		if {[lindex $b end] eq $start_name} { set trace_backward $b }
	    }

	    set pipeline_forward [lrange $trace_forward 1 end-1]
	    set pipeline_backward [lreverse [lrange $trace_backward 1 end-1]]

	    set mapping [layout_utils::find_valid_placement $route [llength $pipeline_forward]]

	    set ps {}
	    set i 0
	    
	    # create pipeline stage elements
	    set prev_stage $start_tile
	    foreach pf $pipeline_forward pb $pipeline_backward m $mapping {
		set stage [new pipeline_stage $m $pf $pb $route $i]
		pipeline_stage::set_prev $stage $prev_stage
		if {$prev_stage ne $start_tile} {
		    pipeline_stage::set_next $prev_stage $stage
		}
		lappend ps $stage 
		set prev_stage $stage
		incr i
	    }
	    pipeline_stage::set_next $stage $end_tile

	    lappend pipeline_stages $ps
	}
	return $pipeline_stages
    }
}
