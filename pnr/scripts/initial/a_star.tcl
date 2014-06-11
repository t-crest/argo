# Autorouter based on the A* algorithm - finds the shortest path 
# between two nodes through a grid implemented with the grid classes

# priority queue class
class as_pqueue {
    proc as_pqueue {this} {
	set ($this,queue) {}
	set ($this,unsorted) 0
    }
    proc ~as_pqueue {this} {}

    # adds an object to the queue
    proc put {this object} {
	# if the 
	if {[llength  $($this,queue)] == 0} {
	    set end $object
	} else {
	    set end [lindex $($this,queue) end]
	}
	if {[a_star_node::get_f $end] > [a_star_node::get_f $object]} {set ($this,unsorted) 1}
	lappend ($this,queue) $object

	a_star_node::set_queue $object $this
    }
    # compares two elements within the queue, used by sort to determine the prioritized order
    proc compare {node1 node2} {
	set w1 [a_star_node::get_f $node1] 
	set w2 [a_star_node::get_f $node2]
	if {$w1 > $w2} { return 1 } elseif {$w1 < $w2} {return -1} else {return 0}
    }

    # sorts the list if marked as unsorted
    proc sort {this} {
	# sort only if new values added
	if {$($this,unsorted)} {
	    #puts "sorting.. $($this,queue) " 
	    set ($this,queue) [lsort -command as_pqueue::compare $($this,queue)]
	    set ($this,unsorted) 0
	}
    }
    # returns the element with the least f value from the list and removes it from the list
    proc pop {this} {
	as_pqueue::sort $this
	set r [lindex $($this,queue) 0]
	set ($this,queue) [lrange $($this,queue) 1 end]	
	return $r
    }    
    # returns the element without removing
    proc top {this} {
	puts [as_pqueue::print $this]
	as_pqueue::sort $this
        return [lindex $($this,queue) 0]
    }
    # checks whether the list is empty
    proc empty {this} {
	if {[llength $($this,queue)] == 0} {return 1}
	return 0
    }
    # checks whether an object is part of the list
    proc contains {this object} {
	foreach node $($this,queue) {
	    set o [a_star_node::get_object $node]
	    if {$object == $o} {return $node}
	}
	return null
    }
    # forces the list to an unsorted status, to be used when the f value of an
    # object has been modified from the outside
    proc update {this} {
	set ($this,unsorted) 1
    }
    # Helper method to print the list
    proc print {this} {
	set l {}
	foreach node $($this,queue) {
	    lappend l [a_star_node::get_f $node]
	}
	puts $l
    }

}

# node class for the a_star algorithm, containing information needed for the routing
class a_star_node {
    proc a_star_node {this object target_coordinates} {
	set ($this,f) 0
	set ($this,g) 0
	set ($this,h) [grid_element::distance_to $object $target_coordinates]
	set ($this,predecessor) null
	set ($this,predecessor_d) null
	set ($this,object) $object
	set ($this,queue) null
    } 
    proc ~a_star_node {this} {}

    proc get_f {this} {return $($this,f)}
    proc get_g {this} {return $($this,g)}
    proc get_h {this} {return $($this,h)}

    proc get_predecessor {this} {return $($this,predecessor)}
    proc get_predecessor_direction {this} {return $($this,predecessor_d)}

    proc get_object {this} {return $($this,object)}

    proc set_f {this f} {set ($this,f) $f}
    proc set_g {this g} {set ($this,g) $g}
    proc set_predecessor {this s d} {
	set ($this,predecessor) $s
	set ($this,predecessor_d) $d
    }


    proc set_queue {this object} {
	set ($this,queue) $object
    }
}

# namespace with the a_star functions
namespace eval a_star {
    # main function, returns a route from $to_grid_element to $from_grid_element
    proc a_star {from_grid_element to_grid_element} {
	set openlist [new as_pqueue]
	set start_node [new a_star_node $from_grid_element [grid_element::get_center $to_grid_element]]
	as_pqueue::put $openlist $start_node
	set closedlist {}
	set closednodelist {}
	
	while {1} {
	    # take a node
	    set currentNode [as_pqueue::pop $openlist]
	    set current_grid_element [a_star_node::get_object $currentNode]
	    
	    # have we reached the target?
	    if { $current_grid_element == $to_grid_element} {
		# return list
		set path [a_star::traceback $start_node $currentNode]
		# cleanup
		foreach n $openlist { delete $n }
		foreach n $closednodelist { delete $n }
		return $path
	    }
	    
	    # mark this object as evaluated
	    lappend closedlist $current_grid_element
	    lappend closednodelist $currentNode
	    
	    a_star::expand_node $currentNode $openlist $closedlist $to_grid_element
	    # 
	    if {[as_pqueue::empty $openlist]} { break }
	}
	# no path found
	return null
    }

    # helper function, finding neighbor nodes
    proc expand_node {currentNode openlist closedlist to_grid_element} {
	# get current grid element
	set grid_element [a_star_node::get_object $currentNode]
	
	# fetch all possible successors
	set successor_list {}
	lappend successor_list [grid_element::get_north $grid_element]
	lappend successor_list [grid_element::get_south $grid_element]
	lappend successor_list [grid_element::get_east $grid_element]
	lappend successor_list [grid_element::get_west $grid_element]

	# filter 
	set filtered_successor_list {}
	set filtered_successor_direction {}
	foreach s $successor_list d {north south east west} {
	    if {$s eq "null"} { continue	}
	    if {[grid_element::valid_path $s $grid_element]} {
		lappend filtered_successor_list $s
		lappend filtered_successor_direction $d
	    }
	}

	foreach s $filtered_successor_list d $filtered_successor_direction {
	    set malus 0
	    # enforce less direction changes by adding a slight malus
	    if {$d ne [a_star_node::get_predecessor_direction $currentNode]} { incr malus 1}

	    # using less track crossing positions is better
	    #if {[grid_element::get_type $s] eq "crosstrack"} { incr malus 1}
	    
	    # wasting crosstracks beside ports is worse
	    #if {[grid_element::get_type $s] eq "crosstrack_port"} { incr malus 2}
	    
	    if {[grid_element::get_type $s] eq "track_v" || [grid_element::get_type $s] eq "track_h"} { incr malus 1 }

	    
	    # only enter ports if needed (start/target) - heavy malus to prevent to route over port
	    if {[grid_element::get_type $s] eq "port"} { incr malus 10 }

	    if {[lsearch $closedlist $s] >= 0} { continue }
	    # get center of neighbor
	    set center [grid_element::get_center $s]

	    # calculate the distance from the start node to the center of the neighbor
	    set tentative_g [expr [a_star_node::get_g $currentNode] + [grid_element::distance_to $grid_element $center] * (100 + $malus)/100]

	    # 
	    set successor_node [as_pqueue::contains $openlist $s]
	    if {$successor_node ne "null"} {
		if {$tentative_g >= [a_star_node::get_g $successor_node] } {
		    # new path is not better, leave it as it is
		    continue
		}
	    } else {
		set successor_node [new a_star_node $s [grid_element::get_center $to_grid_element]]
		as_pqueue::put $openlist $successor_node 
	    }
	    
	    a_star_node::set_predecessor $successor_node $currentNode $d
	    set f [expr $tentative_g + [a_star_node::get_h $successor_node]]
	    a_star_node::set_f $successor_node $f
	    a_star_node::set_g $successor_node $tentative_g
	}

    }

    # function to convert the linked sucessors to a list of nodes
    proc traceback {start_node final_node} {
	set node $final_node
	set node_list {}
	while {$node ne $start_node} {
	    #if {$node eq $final_node} {
	    #	set node_object [a_star_node::get_object $node]
	    #} else {
	    #	set last_node_object $node_object
	    #	set node_object [a_star_node::get_object $node]
	    #	grid_element::mark_blocked $node_object $last_node_object
	    #}
	    set node_object [a_star_node::get_object $node]
	    #puts "traceback: $node_object"
	    lappend node_list $node_object
	    set node [a_star_node::get_predecessor $node]
	}
	# add start node
	lappend node_list [a_star_node::get_object $node]
	return $node_list
    }

    # mark a route a blocked if the path is accepted
    proc mark_route_blocked {node_list} {
	set last_node_object [lindex $node_list 0]
	foreach node_object [lrange $node_list 1 end] {
	    grid_element::mark_blocked $node_object $last_node_object
	}
    }
}
