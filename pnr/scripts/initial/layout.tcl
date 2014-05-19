set dir ../scripts/libs/stooop
source ../scripts/libs/stooop/pkgIndex.tcl
package require stooop
namespace import stooop::*

class grid_element {
    #constructor
    proc grid_element {this grid row col height width htype wtype} {
	set ($this,row) $row
	set ($this,col) $col
	set ($this,width) $width
	set ($this,height) $height
	set ($this,grid) $grid
	set ($this,wtype) $wtype
	set ($this,htype) $htype
	set ($this,type) [grid_element::get_type $this]
	
	set ($this,blocked_ns) 0
	set ($this,blocked_ew) 0

	if {$($this,type) eq "track_v"} {
	    set ($this,blocked_ns) 1
	} 

	if {$($this,type) eq "track_h"} {
	    set ($this,blocked_ns) 1
	} 

	#set ($this,sucessor) null
	#puts "$row $col - ($width $height)"
    }
    
    proc print {this} {
	puts "north: $($this,north)"
	puts "south: $($this,south)"
	puts "east: $($this,east)"
	puts "west: $($this,west)"
    }
    
    proc set_neighbors {this} {
	set grid_list [grid::get_grid $($this,grid)]
	set c $($this,col)
	set r $($this,row)
	
	# get neighbors
	set n [lindex $grid_list [expr $r+1] $c]
	set s [lindex $grid_list [expr $r-1] $c]
	set e [lindex $grid_list $r [expr $c+1]]
	set w [lindex $grid_list $r [expr $c-1]]
	
	#puts "$this: $($this,row) $($this,col) -- n:$n s:$s e:$e w:$w "
	
	# store neighbors (if available)
	if {$n ne ""} { set ($this,north) $n} else {set ($this,north) null}
	if {$s ne ""} { set ($this,south) $s} else {set ($this,south) null}
	if {$e ne ""} { set ($this,east) $e} else {set ($this,east) null}
	if {$w ne ""} { set ($this,west) $w} else {set ($this,west) null}
    }
    
    # get the neighbors
    proc get_north {this} {return $($this,north)}
    proc get_south {this} {return $($this,south)}
    proc get_east {this} {return $($this,east)}
    proc get_west {this} {return $($this,west)}

    # set the neighbors manually
    proc set_north {this elem} {set ($this,north) $elem}
    proc set_south {this elem} {set ($this,south) $elem}
    proc set_east {this elem} {set ($this,east) $elem}
    proc set_west {this elem} {set ($this,west) $elem}
    
    # dimensions
    proc get_width {this} {return $($this,width)}
    proc get_height {this} {return $($this,height)}
    
    # positions
    proc get_row {this} {return $($this,row)}
    proc get_col {this} {return $($this,col)}
    
    # get the coordinates
    proc get_box {this} {
	set co {}
	lappend co [grid_element::get_left $this]
	lappend co [grid_element::get_bottom $this]
	lappend co [grid_element::get_right $this]
	lappend co [grid_element::get_top $this]
	return $co
    }
    
    proc valid_path {this from} {
	if {$($this,type) eq "tile"} { return 0 }
	if {$($this,type) eq "track_v" && [grid_element::get_type $from] eq "track_v"} {return 0}
	if {$($this,type) eq "track_h" && [grid_element::get_type $from] eq "track_h"} {return 0}
	return 1
    }

    proc get_center {this} {
	set c {}
	lappend c [expr $($this,width) / 2 + [grid_element::get_left $this]]
	lappend c [expr $($this,height) / 2 + [grid_element::get_bottom $this]]
	return $c
    }

    proc distance_to {this vector} {
	set vector2 [grid_element::get_center $this]
	set a1 [lindex $vector 0]
	set a2 [lindex $vector2 0]
	set b1 [lindex $vector end]
	set b2 [lindex $vector2 end]
	# air distance
	#return [expr sqrt(($a1 - $a2)**2 + ($b1 - $b2)**2)]
	# 
	return [expr abs($a1 - $a2) + abs($b1 - $b2)]
    }

    proc get_left {this} {
	if {$($this,west) ne "null"} {
	    return [grid_element::get_right $($this,west)]
	} else {
	    return 0
	}
    }
    
    proc get_right {this} {
	if {$($this,west) ne "null"} {
	    return [expr [grid_element::get_right $($this,west)] + $($this,width)]
	} else {
	    return $($this,width)
	}
    }
    
    proc get_bottom {this} {
	if {$($this,south) ne "null"} {
	    return [grid_element::get_top $($this,south)]
	} else {
	    return 0
	}
    }
    
    proc get_top {this} {
	if {$($this,south) ne "null"} {
	    return [expr [grid_element::get_top $($this,south)] + $($this,height)]
	} else {
	    return $($this,height)
	}
    }
    
    # splits a grid element vertically into 2..n elements
    proc split_vertical {this height_vector position} {
	set h 0
	set element_list {}

	# append this grid element to the top of the list...
	if {$position eq "top"} { lappend element_list $this }

	foreach element_height $height_vector {
	    set h [expr $h + $element_height]
	    # create new elements
	    lappend element_list [new grid_element $($this,grid) $($this,row) $($this,col) $element_height $($this,width) $($this,htype) $($this,wtype)]
	    # add it to the extra element list of our grid
	    grid::append $($this,grid) [lindex $element_list end]
	}
	
	# reduce the height
	set ($this,height) [expr $($this,height) - $h]

	# append this grid element to the bottom of the list...
	if {$position ne "top"} { lappend element_list $this }

    	# store neighbors
	set north $($this,north) 
	set south $($this,south) 
	# link up the elements to each other
	foreach element $element_list {
	    grid_element::set_south $north $element
	    grid_element::set_north $element $north
	    grid_element::set_east $element $($this,east)
	    grid_element::set_west $element $($this,west)
	    set north $element
	}
	grid_element::set_south $north $south
	grid_element::set_north $south $north
	# return element_list for further processing
	return $element_list
    }
    
    proc split_horizontal {this width_vector position} {
	set w 0
	set element_list {}

	# append this grid element to the top of the list...
	if {$position eq "left"} { lappend element_list $this }

	foreach element_width $width_vector {
	    set w [expr $w + $element_width]
	    # create new elements
	    lappend element_list [new grid_element $($this,grid) $($this,row) $($this,col) $($this,height) $element_width $($this,htype) $($this,wtype)]
	    # add it to the extra element list of our grid
	    grid::append $($this,grid) [lindex $element_list end]
	}
	
	# reduce the width
	set ($this,width) [expr $($this,width) - $w]

	# append this grid element to the bottom of the list...
	if {$position ne "left"} { lappend element_list $this }

    	# store neighbors
	set east $($this,east) 
	set west $($this,west)
	
	# link up the elements to each other
	foreach element $element_list {
	    grid_element::set_west $east $element
	    grid_element::set_east $element $east
	    grid_element::set_south $element $($this,south)
	    grid_element::set_north $element $($this,north)
	    set east $element
	}
	grid_element::set_west $east $west
	grid_element::set_east $west $east
	# return element_list for further processing
	return $element_list
    }

    proc get_type {this} {
	if {$($this,htype) eq "tile" && $($this,wtype) eq "tile"} {
	    return "tile"
	} elseif {$($this,htype) eq "track" && $($this,wtype) eq "track"} {
	    return "crosstrack"
	} elseif {$($this,htype) eq "track"} {
	    return "track_v"
	} elseif {$($this,wtype) eq "track"} {
	    return "track_h"
	} else {
	    return "undef"
	}
    }
    #destructor
    proc ~grid_element {this} { }
}

class tile {
    proc tile {this grid row col height width tile_col tile_row} grid_element { $grid $row $col $height $width "tile" "tile" } {
	set ($this,tile_col) $tile_col
	set ($this,tile_row) $tile_row

	# mapp to folded bitorus
	set rows {}
	set cols {}
	for {set i 0} {$i < [expr ceil($::gridN/2.0)]} {incr i} {
	    set j [expr $::gridN - $i - 1]
	    lappend rows $i
	    if {$i < $j} { lappend rows $j }
	}
	for {set i 0} {$i < [expr ceil($::gridM/2.0)]} {incr i} {
	    set j [expr $::gridM - $i - 1]
	    lappend cols $i
	    if {$i < $j} { lappend cols $j }
	}

	set tileM [lindex $cols $tile_col]
	set tileN [lindex $rows $tile_row]

	set ($this,tileN) $tileN
	set ($this,tileM) $tileM

	puts "Tile: $tile_col $tile_row mapped to $tileN $tileM"
    }
    
    proc tile_north {this} {}
    proc tile_south {this} {}
    proc tile_west {this} {}
    proc tile_east {this} {}
    
    proc orientation {this} {
	if {[tile::my $this] && [tile::mx $this]} {
	    return "R180"
	} elseif {[tile::my $this]} {
	    return "MY"
	} elseif {[tile::mx $this]} {
	    return "MX"
	} else {
	    return "R0"
	}
	
    }
    
    proc mx {this} {
	if {[expr $($this,tile_row) % 2] == 0} { return 1 } else { return 0 }
    }

    proc my {this} {
	if {[expr $($this,tile_col) %2] == 1 } { return 1 } else { return 0 }
    }
    
    proc tile_noc_port_east {this} {}
    proc tile_noc_port_west {this} {}
    proc tile_noc_port_south {this} {}
    proc tile_noc_port_north {this} {}
    
    proc print {this} {
	puts "Tile: $($this,tile_col) $($this,tile_row) maps to $($this,tileM) $($this,tileN)"
	puts [grid_element::get_box $this]
	puts "Orientation: [tile::orientation $this]"
	grid_element::print $this
    }

    proc split_router_port_tracks {this} {
        set distance 10
	set vector "$distance $distance"
	if {[tile::orientation $this] eq "R0"} {
	    grid_element::split_vertical [grid_element::get_east $this] $vector "bottom"
	}
	if {[tile::orientation $this] eq "R180"} {
	    grid_element::split_vertical [grid_element::get_east $this] $vector "top"
	}
	if {[tile::orientation $this] eq "MX"} {
	    grid_element::split_vertical [grid_element::get_west $this] $vector "bottom"
	}
	if {[tile::orientation $this] eq "MY"} {
	    grid_element::split_vertical [grid_element::get_east $this] $vector "bottom"
	}
    }

    proc get_tile_col {this} {return  $($this,tile_col)}
    proc get_tile_row {this} {return  $($this,tile_row)}
    proc get_tileM {this} {return  $($this,tileM)}
    proc get_tileN {this} {return  $($this,tileN)}
}

class grid {
    proc grid {this width_vector height_vector w_type_vector h_type_vector} {
	# global grid
	set agrid {}
	set aline {}

	# tile grid
	set tgrid {}
	set tline {}

	set h_ 0
	set w_ 0
	set tile_row 0
	set tile_col 0
	# create grid elements
	# this populates two grids - first, a global grid including all tiles, and tracks
	# as well as a tile grid which only contains the tiles.
	foreach h $height_vector ht $h_type_vector {
	    foreach w $width_vector wt $w_type_vector {
		if {$wt eq "tile" && $ht eq "tile"} {
		    lappend aline [new tile $this $h_ $w_ $h $w $tile_row $tile_col]
		    lappend tline [lindex $aline end]

		    incr tile_col
		    if {$tile_col == $::gridM} {
			incr tile_row
			set tile_col 0
			lappend tgrid $tline
			set tline {}
		    }
		} else {
		    lappend aline [new grid_element $this $h_ $w_ $h $w $wt $ht]
		}
		incr w_
	    }
	    lappend agrid $aline
	    set aline {}
	    set w_ 0
	    incr h_
	}
	
	set ($this,g) $agrid
	set ($this,tile_g) $tgrid

	# link elements
	foreach elem [join $agrid] {
	    grid_element::set_neighbors $elem
	}

	set ($this,extra_g) {}	

	# split tracks beside the router to generate startpoints for the router ports
	foreach tile [join $tgrid] {
	    tile::split_router_port_tracks $tile
	}
    }

    proc get_box {this} {
	set co {}
	lappend co 0
	lappend co 0
	lappend co [grid_element::get_right [lindex $($this,g) end end]]
	lappend co [grid_element::get_top [lindex $($this,g) end end]]
	return $co
    }

    # add aditional elements to grid (outside grid structure)
    proc append {this element} {
	lappend ($this,extra_g) $element 
    }

    
    proc get_grid {this} {
	return $($this,g)
    }
    
    proc get_tile_grid {this} {
	return $($this,tile_g)
    }
    
    proc ~grid {this} {
	# deconstruct all grid elements
	foreach a $($this,g) {
	    foreach b $a {
		grid_element::~grid_element $b
	    }
	}
    }
    
    proc svg_dump {this filename elements} {
	set f [open $filename "w"]
	if {$elements eq "null"} {
	    set vect [join [concat $($this,g) $($this,extra_g)]]
	} else {
	    set vect $elements
	}
	set g_h [lindex [grid::get_box $this] end]
	#puts $g_h
	puts $f "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>"
	puts $f "<svg xmlns:dc=\"http://purl.org/dc/elements/1.1/\" \
		xmlns:cc=\"http://creativecommons.org/ns#\" \ 
		xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\" \
		xmlns:svg=\"http://www.w3.org/2000/svg\" \
		xmlns=\"http://www.w3.org/2000/svg\" \
		version=\"1.1\" \
		>"
	#<g transform=\"translate(0,$g_h)\"><g transform=\"scale(1,-1)\">"

	
	#puts $vect
	foreach elem $vect {
	    set w [grid_element::get_width $elem]
	    set h [grid_element::get_height $elem]
	    set l [grid_element::get_left $elem]
	    set b [grid_element::get_bottom $elem]
	    #set b [expr $g_h - [grid_element::get_bottom $elem] - $h]
	    
	    set c [grid_element::get_col $elem]
	    set r [grid_element::get_row $elem]		
	    
	    set type [grid_element::get_type $elem]
	    
	    
	    #puts [classof $elem]
	    if {[classof $elem] eq "::tile"} {
		set c [tile::get_tileM $elem]
		set r [tile::get_tileN $elem]	
		set o [tile::orientation $elem]
		set tb [expr $b + [grid_element::get_height $elem]/2] 
		puts $f "<rect width=\"$w\" height=\"$h\" x=\"$l\" y=\"$b\" style=\"fill:#cccccc;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />"
		puts $f "<text x=\"$l\" y=\"$tb\" style=\"font-size:13px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans\">$c,$r $o</text>"
		
	    } else {
		puts $f "<rect width=\"$w\" height=\"$h\" x=\"$l\" y=\"$b\" style=\"fill:none;stroke:#999999;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />"
	    }
	}
	puts $f "</svg>"
	close $f
    }
}

class as_pqueue {
    proc as_pqueue {this} {
	set ($this,queue) {}
	set ($this,unsorted) 0
    }
    proc ~as_pqueue {this} {}

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

    proc compare {node1 node2} {
	set w1 [a_star_node::get_f $node1] 
	set w2 [a_star_node::get_f $node2]
	if {$w1 > $w2} { return 1 } elseif {$w1 < $w2} {return -1} else {return 0}
    }
    proc sort {this} {
	# sort only if new values added
	if {$($this,unsorted)} {
	    #puts "sorting.. $($this,queue) " 
	    set ($this,queue) [lsort -command as_pqueue::compare $($this,queue)]
	    set ($this,unsorted) 0
	}
    }
    proc pop {this} {
	as_pqueue::sort $this
	set r [lindex $($this,queue) 0]
	set ($this,queue) [lrange $($this,queue) 1 end]	
	return $r
    }    
    proc top {this} {
	puts [as_pqueue::print $this]
	as_pqueue::sort $this
        return [lindex $($this,queue) 0]
    }
    proc empty {this} {
	if {[llength $($this,queue)] == 0} {return 1}
	return 0
    }

    proc contains {this object} {
	foreach node $($this,queue) {
	    set o [a_star_node::get_object $node]
	    if {$object == $o} {return $node}
	}
	return null
    }

    proc update {this} {
	set ($this,unsorted) 1
    }
    proc print {this} {
	set l {}
	foreach node $($this,queue) {
	    lappend l [a_star_node::get_f $node]
	}
	puts $l
    }

}

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
	    set path [a_star_traceback $start_node $currentNode]
	    # cleanup
	    foreach n $openlist { delete $n }
	    foreach n $closednodelist { delete $n }
	    return $path
	}
	
	# mark this object as evaluated
	lappend closedlist $current_grid_element
	lappend closednodelist $currentNode
	
	a_star_expand_node $currentNode $openlist $closedlist $to_grid_element
	# 
	if {[as_pqueue::empty $openlist]} { break }
    }
    # no path found
    return null
}

proc a_star_expand_node {currentNode openlist closedlist to_grid_element} {

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
	
	# enforce less direction changes by adding a slight malus
	if {$d eq [a_star_node::get_predecessor_direction $currentNode]} {
	    set direction_malus 0
	} else {
	    set direction_malus 1
	}

	if {[lsearch $closedlist $s] >= 0} { continue }
	# get center of neighbor
	set center [grid_element::get_center $s]

	# calculate the distance from the start node to the center of the neighbor
	set tentative_g [expr [a_star_node::get_g $currentNode] + [grid_element::distance_to $grid_element $center] + $direction_malus]

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

proc a_star_traceback {start_node final_node} {
    set node $final_node
    set node_list {}
    while {$node ne $start_node} {
	set node_object [a_star_node::get_object $node]
	#puts "traceback: $node_object"
	lappend node_list $node_object
	set node [a_star_node::get_predecessor $node]
    }
    # add start node
    lappend node_list [a_star_node::get_object $node]
    return $node_list
}

proc get_path_length {node_list} {
    set length 0
    set pos [lindex $node_list 0]
    set vector [grid_element::get_center $pos]
    foreach node $node_list {
	set length [expr [grid_element::distance_to $node $vector] + $length]
	set vector [grid_element::get_center $node]       
    }
    return $length
}

proc find_valid_placement {path num_elements} {
    # get the total length of the path
    set total_length [get_path_length $path]
    # calculate the length of the path segments
    set target_length [expr $total_length / ($num_elements + 1)]
    
    # trace through the path 
    set length 0
    set pos [lindex $node_list 0]
    set vector [grid_element::get_center $pos]
    set i 1
    set mapping {}

    # initial mapping
    foreach node $node_list {
	set length [expr [grid_element::distance_to $node $vector] + $length]
	set vector [grid_element::get_center $node]       
	# most simple mapping approach: mapp to the next valid node after length > tracklength * i
	if {$length >= [expr $target_length * $i] && [lsearch {track_h track_v} [grid_element::get_type $node]]} {
	    lappend mapping "$node $length [expr $target_length * $i]"
	    incr i
	} 
    }
}
