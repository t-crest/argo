# class reprecenting a rectangle within the layout grid
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
	set ($this,type) null
	set ($this,type) [grid_element::get_type $this]
	set ($this,color) "#ffffff"
	set ($this,blocked_n) 0
	set ($this,blocked_e) 0
	set ($this,blocked_s) 0
	set ($this,blocked_w) 0

	if {$($this,type) eq "track_v"} {
	    set ($this,blocked_e) 1
	    set ($this,blocked_w) 1
	} 

	if {$($this,type) eq "track_h"} {
	    set ($this,blocked_s) 1
	    set ($this,blocked_n) 1
	} 

	#set ($this,sucessor) null
	#puts "$row $col - ($width $height)"
    }

    # mutually mark the path between the nodes as blocked
    proc mark_blocked {this neighbor} {
	grid_element::set_blocked $this $neighbor
	grid_element::set_blocked $neighbor $this
    }

    # mutually check whether the path is blocked
    proc check_blocked {this neighbor} {
	if {[grid_element::get_blocked $this $neighbor] eq 1 || [grid_element::get_blocked $neighbor $this] eq 1} {
	    return 1
	}
	return 0
    }

    # set the path from this to neighbor as blocked
    proc set_blocked {this neighbor} {
	if {[grid_element::get_north $this] eq $neighbor} {
	    set ($this,blocked_n) 1
	} 
	if {[grid_element::get_east $this] eq $neighbor} {
	    set ($this,blocked_e) 1
	} 
	if {[grid_element::get_west $this] eq $neighbor} {
	    set ($this,blocked_w) 1
	} 
	if {[grid_element::get_south $this] eq $neighbor} {
	    set ($this,blocked_s) 1
	} 
    }

    # get whether the path from this node to the neighbor is blocked
    proc get_blocked {this neighbor} {
	if {[grid_element::get_north $this] eq $neighbor} {
	    return $($this,blocked_n)
	} 
	if {[grid_element::get_east $this] eq $neighbor} {
	    return $($this,blocked_e)
	} 
	if {[grid_element::get_west $this] eq $neighbor} {
	    return $($this,blocked_w)
	} 
	if {[grid_element::get_south $this] eq $neighbor} {
	    return $($this,blocked_s)
	} 
	return 0
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
    
    proc get_grid {this} {return $($this,grid)}
    
    # get the neighbors
    proc get_north {this} {return $($this,north)}
    proc get_south {this} {return $($this,south)}
    proc get_east {this} {return $($this,east)}
    proc get_west {this} {return $($this,west)}

    # returns the fist tile found beside this grid element, otherwise null
    proc get_neighbor_tile {this} {
	foreach neighbor "$($this,north) $($this,south) $($this,east) $($this,west)" {
	    if {[grid_element::get_type $neighbor] eq "tile"} {	return $neighbor }
	}
	return null
    }

    # set the neighbors manually
    proc set_north {this elem} {set ($this,north) $elem}
    proc set_south {this elem} {set ($this,south) $elem}
    proc set_east {this elem} {set ($this,east) $elem}
    proc set_west {this elem} {set ($this,west) $elem}

    # color
    proc set_color {this elem} {set ($this,color) $elem}
    proc get_color {this} {return $($this,color)}
    
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
    
    # are we allowed to take the path between $from and this?
    proc valid_path {this from} {
	# no routing through tiles
	if {$($this,type) eq "tile"} { return 0 }
	# check whether the path is already blocked
	if {[grid_element::check_blocked $this $from] eq 1} { return 0}
	# path is valid
	return 1
    }

    proc valid_placement {this} {
	if {$($this,type) eq "track_h" || $($this,type) eq "track_v"} { return 1 }
	return 0
    }
    # the center of this grid element
    proc get_center {this} {
	set c {}
	lappend c [expr $($this,width) / 2 + [grid_element::get_left $this]]
	lappend c [expr $($this,height) / 2 + [grid_element::get_bottom $this]]
	return $c
    }

    # distance to a point (manhattan norm)
    proc distance_to {this vector} {
	set vector2 [grid_element::get_center $this]
	set a1 [lindex $vector 0]
	set a2 [lindex $vector2 0]
	set b1 [lindex $vector end]
	set b2 [lindex $vector2 end]
	return [expr abs($a1 - $a2) + abs($b1 - $b2)]
    }

    # distance to a point (euclidian norm / air distance)
    proc distance_to_euclid {this vector} {
	set vector2 [grid_element::get_center $this]
	set a1 [lindex $vector 0]
	set a2 [lindex $vector2 0]
	set b1 [lindex $vector end]
	set b2 [lindex $vector2 end]
	return [expr sqrt(($a1 - $a2)**2 + ($b1 - $b2)**2)]
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
	if {$position eq "bottom"} { lappend element_list $this }

	foreach element_height $height_vector {
	    set h [expr $h + $element_height]
	    # create new elements
	    lappend element_list [new grid_element $($this,grid) $($this,row) $($this,col) $element_height $($this,width) "track" "track"]
	    # add it to the extra element list of our grid
	    grid::append $($this,grid) [lindex $element_list end]
	}
	
	# reduce the height
	set ($this,height) [expr $($this,height) - $h]

	# append this grid element to the bottom of the list...
	if {$position ne "bottom"} { lappend element_list $this }

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
	    lappend element_list [new grid_element $($this,grid) $($this,row) $($this,col) $($this,height) $element_width "track" "track"]
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
	if {$($this,type) ne "null"} {
	    return $($this,type)
	} elseif {$($this,htype) eq "tile" && $($this,wtype) eq "tile"} {
	    return "tile"
	} elseif {$($this,htype) eq "track" && $($this,wtype) eq "track"} {
	    return "crosstrack"
	} elseif {$($this,htype) eq "track"} {
	    return "track_v"
	} elseif {$($this,wtype) eq "track"} {
	    return "track_h"
	} else {
	    return "null"
	}
    }

    proc set_type {this type} {set ($this,type) $type}
    #destructor
    proc ~grid_element {this} { }
}

# pipeline stage class, used to represent the actual position of a pipeline stage.
# each pipeline stage object actually represents two stages - one in forward direction,
# the other one in backward direction
class pipeline_stage {
    proc pipeline_stage {this mapping name_forward name_backward route index} grid_element { 
	[grid_element::get_grid [lindex $mapping 0]] \
	    [grid_element::get_row [lindex $mapping 0]] \
	    [grid_element::get_col [lindex $mapping 0]] \
	    [grid_element::get_height [lindex $mapping 0]] \
	    [grid_element::get_width [lindex $mapping 0]] \
	    "pipeline_stage" "pipeline_stage"
    } {
	set parent [lindex $mapping 0]
	set relative_distance [lindex $mapping 1]
	set ($this,relative_distance) $relative_distance
	puts "PS: $name_forward $mapping"
	set ($this,parent) $parent
	set ($this,forward) $name_forward
	set ($this,backward) $name_backward
	set ($this,route) $route
        grid_element::set_north $this [grid_element::get_north $parent]
	grid_element::set_west $this [grid_element::get_west $parent]
        grid_element::set_east $this [grid_element::get_east $parent]
	grid_element::set_south $this [grid_element::get_south $parent]

        grid_element::set_type $this pipeline_stage
	grid::append [grid_element::get_grid $parent] $this
	grid_element::set_color $this #FF0000

	set route_pos [lsearch $route $($this,parent)]
	set prev_route [lindex $route [expr $route_pos - 1]]
	
	# calculates the position of the pipeline stage based on the location
	# of the previous element in the route
	set left 0
	set bottom 0
	# distance to edge to not place a stage
	set keepout 0
	if {[grid_element::get_south $parent] eq $prev_route} {
	    set width [grid_element::get_width $parent]
	    set height $::pipeline_stage_length
	    set pos [expr [grid_element::get_height $parent] * $relative_distance]
	    set bottom [expr $pos - $::pipeline_stage_length]
	    if { $bottom > [expr [grid_element::get_height $parent] - $::pipeline_stage_length + $keepout]} {
		set bottom [expr [grid_element::get_height $parent] - $::pipeline_stage_length + $keepout]
	    } elseif {$bottom < $keepout} { set bottom $keepout }
	    set direction 1
	} elseif {[grid_element::get_north $parent] eq $prev_route} {
	    set width [grid_element::get_width $parent]
	    set height $::pipeline_stage_length
	    set pos [expr [grid_element::get_height $parent] * (1 - $relative_distance)]
	    set bottom [expr $pos - $::pipeline_stage_length]
	    if { $bottom > [expr [grid_element::get_height $parent] - $::pipeline_stage_length + $keepout]} {
		set bottom [expr [grid_element::get_height $parent] - $::pipeline_stage_length + $keepout]
	    } elseif {$bottom < $keepout} { set bottom $keepout }
	    set direction -1
	} elseif {[grid_element::get_west $parent] eq $prev_route} {
	    set width $::pipeline_stage_length
	    set height [grid_element::get_height $parent]
	    set pos [expr [grid_element::get_width $parent] * $relative_distance]
	    set left [expr $pos - $::pipeline_stage_length]
	    if { $left > [expr [grid_element::get_width $parent] - $::pipeline_stage_length + $keepout]} {
		set left [expr [grid_element::get_width $parent] - $::pipeline_stage_length + $keepout]
	    } elseif {$left < $keepout} { set left $keepout }
	    set direction -1
	} else {
	    set width $::pipeline_stage_length
	    set height [grid_element::get_height $parent]
	    set pos [expr [grid_element::get_width $parent] * (1 - $relative_distance)]
	    set left [expr $pos - $::pipeline_stage_length]
	    if { $left > [expr [grid_element::get_width $parent] - $::pipeline_stage_length + $keepout]} {
		set left [expr [grid_element::get_width $parent] - $::pipeline_stage_length + $keepout]
	    } elseif {$left < $keepout} { set left $keepout }
	    set direction 1
	}
	set ($this,left) [expr [grid_element::get_left $parent] + $left]
	set ($this,bottom) [expr [grid_element::get_bottom $parent] + $bottom]
	set ($this,width) $width
	set ($this,height) $height
	if {[grid_element::get_south $parent] eq $prev_route || [grid_element::get_north $parent] eq $prev_route} {
	    set box1 "$($this,left) $($this,bottom) [expr $($this,left) + $width/2] [expr $($this,bottom) + $height]"
	    set box2 "[expr $($this,left) + $width/2] $($this,bottom) [expr $($this,left) + $width] [expr $($this,bottom) + $height]"
	} else {
	    set box1 "$($this,left) $($this,bottom) [expr $($this,left) + $width] [expr $($this,bottom) + $height/2]"
	    set box2 "$($this,left) [expr $($this,bottom) + $height/2] [expr $($this,left) + $width] [expr $($this,bottom) + $height]"
	}

	set ($this,direction) $direction
	set ($this,box_forward) $box2
	set ($this,box_backward) $box1
	
    }
    
    proc ~pipeline_stage {this} {}

    # method to set up neighbors
    proc set_next {this stage} {set ($this,next) $stage } 
    proc get_next {this} {return $($this,next)}

    proc set_prev {this stage} {set ($this,prev) $stage } 
    proc get_prev {this} {return $($this,prev)}

    proc get_left {this} {return $($this,left)}
    proc get_bottom {this} {return $($this,bottom)}
    proc get_width {this} {return $($this,width)}
    proc get_height {this} {return $($this,height)}

    proc get_box_backward {this} { return $($this,box_backward)}
    proc get_box_forward {this} { return $($this,box_forward)}
    
    proc get_name_backward {this} { return $($this,backward)}
    proc get_name_forward {this} { return $($this,forward)}
    proc get_parent {this} {return $($this,parent)}

    proc get_relative_distance {this} {return $($this,relative_distance)}
    proc get_direction {this} {return $($this,direction)}
    proc get_swap_name {this} {
	if {$($this,direction) == 1} {
	    return $($this,forward)
	} else {
	    return $($this,backward)
	}
    }

    proc get_forward_pins {this} {
	set pins {}
	lappend pins [dbGet [dbGet -p top.insts.name  $($this,forward)].instTerms.name *right* -p]
	lappend pins [dbGet [dbGet -p top.insts.name  $($this,backward)].instTerms.name *left* -p]
	return $pins
    }
 
    proc get_route_to {this} {
	set pos [lsearch $($this,route) $($this,parent)]
	# previous is tile
	if {[classof $($this,prev)] eq "::tile"} {
	    return [concat $($this,prev) [lrange $($this,route) 0 [expr $pos - 1]] $this]
	}

	set prev_parent [pipeline_stage::get_parent $($this,prev)]
	set pos_prev [lsearch $($this,route) $prev_parent]

	# same parent
	if {$($this,parent) eq $prev_parent } {
	    return "$($this,prev) $this"
	} 
	
	# different parents
	return [concat $($this,prev) [lrange $($this,route) [expr $pos_prev + 1] [expr $pos - 1]] $this]
       
    }

    proc get_route_from {this} {
	# next is tile
	set pos [lsearch $($this,route) $($this,parent)]
	if {[classof $($this,next)] eq "::tile"} {
	    return [concat $this [lrange $($this,route) [expr $pos + 1] end] $($this,next)]
	}
	# get route to next
	return [pipeline_stage::get_route_to $($this,next)]
    }
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

	set ($this,name)  [get_object_name [get_cell noc_tile_*_$tileM\_$tileN]]

	puts "$($this,name): $tile_col $tile_row mapped to $tileN $tileM"
    }
    
    proc get_tile_name {this} {return $($this,name)} 
    
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
    
    proc print {this} {
	puts "Tile: $($this,tile_col) $($this,tile_row) maps to $($this,tileM) $($this,tileN)"
	puts [grid_element::get_box $this]
	puts "Orientation: [tile::orientation $this]"
	grid_element::print $this
    }

    # splits up the neighbor track and sets up the neighbors
    proc split_router_port_tracks {this} {
        set distance 150
	set vector "$distance $distance"
	set c_west "#FF8500"
	set c_east "#FFB600"
	set c_north "#162EAE"
	set c_south "#0776A0"
	#http://colorschemedesigner.com/#0B41Tw0w0w0w0
	if {[tile::orientation $this] eq "MY"} {
	    grid_element::split_vertical [grid_element::get_east $this] $vector "bottom"
	    grid_element::split_vertical [grid_element::get_east [grid_element::get_east $this]] $vector "bottom"
	    set a [grid_element::get_south [grid_element::get_east $this]]
	    set b [grid_element::get_south $a]
	    set e [grid_element::get_south [grid_element::get_east [grid_element::get_east $this]]]
	    set f [grid_element::get_south $e]
	    grid_element::set_east $a $e
	    grid_element::set_west $e $a
	    grid_element::set_east $b $f
	    grid_element::set_west $f $b

	    grid_element::split_horizontal [grid_element::get_south $this] $vector "right"
	    grid_element::split_horizontal [grid_element::get_south [grid_element::get_south $this]] $vector "right"
	    set c [grid_element::get_east [grid_element::get_south $this]]
	    set d [grid_element::get_east $c]
	    set g [grid_element::get_east [grid_element::get_south [grid_element::get_south $this]]]
	    set h [grid_element::get_east $g]
	    grid_element::set_south $c $g
	    grid_element::set_north $g $c
	    grid_element::set_south $d $h
	    grid_element::set_north $h $d
	} elseif {[tile::orientation $this] eq "MX"} {
	    grid_element::split_vertical [grid_element::get_west $this] $vector "top"
	    grid_element::split_vertical [grid_element::get_west [grid_element::get_west $this]] $vector "top"
	    set a [grid_element::get_north [grid_element::get_west $this]]
	    set b [grid_element::get_north $a]
	    set e [grid_element::get_north [grid_element::get_west [grid_element::get_west $this]]]
	    set f [grid_element::get_north $e]
	    grid_element::set_west $a $e
	    grid_element::set_east $e $a
	    grid_element::set_west $b $f
	    grid_element::set_east $f $b
	    grid_element::split_horizontal [grid_element::get_north $this] $vector "left"
	    grid_element::split_horizontal [grid_element::get_north [grid_element::get_north $this]] $vector "left"
	    set c [grid_element::get_west [grid_element::get_north $this]]
	    set d [grid_element::get_west $c]
	    set g [grid_element::get_west [grid_element::get_north [grid_element::get_north $this]]]
	    set h [grid_element::get_west $g]
	    grid_element::set_north $c $g
	    grid_element::set_south $g $c
	    grid_element::set_north $d $h
	    grid_element::set_south $h $d
	} elseif {[tile::orientation $this] eq "R180"} {
	    grid_element::split_vertical [grid_element::get_east $this] $vector "top"
	    grid_element::split_vertical [grid_element::get_east [grid_element::get_east $this]] $vector "top"
	    set a [grid_element::get_north [grid_element::get_east $this]]
	    set b [grid_element::get_north $a]
	    set e [grid_element::get_north [grid_element::get_east [grid_element::get_east $this]]]
	    set f [grid_element::get_north $e]
	    grid_element::set_east $a $e
	    grid_element::set_west $e $a
	    grid_element::set_east $b $f
	    grid_element::set_west $f $b
	    grid_element::split_horizontal [grid_element::get_north $this] $vector "right"
	    grid_element::split_horizontal [grid_element::get_north [grid_element::get_north $this]] $vector "right"
	    set c [grid_element::get_east [grid_element::get_north $this]]
	    set d [grid_element::get_east $c]
	    set g [grid_element::get_east [grid_element::get_north [grid_element::get_north $this]]]
	    set h [grid_element::get_east $g]
	    grid_element::set_north $c $g
	    grid_element::set_south $g $c
	    grid_element::set_north $d $h
	    grid_element::set_south $h $d
	} else {
	    grid_element::split_vertical [grid_element::get_west $this] $vector "bottom"
	    grid_element::split_vertical [grid_element::get_west [grid_element::get_west $this]] $vector "bottom"
	    set a [grid_element::get_south [grid_element::get_west $this]]
	    set b [grid_element::get_south $a]
	    set e [grid_element::get_south [grid_element::get_west [grid_element::get_west $this]]]
	    set f [grid_element::get_south $e]
	    grid_element::set_west $a $e
	    grid_element::set_east $e $a
	    grid_element::set_west $b $f
	    grid_element::set_east $f $b

	    grid_element::split_horizontal [grid_element::get_south $this] $vector "left"
	    grid_element::split_horizontal [grid_element::get_south [grid_element::get_south $this]] $vector "left"
	    set c [grid_element::get_west [grid_element::get_south $this]]
	    set d [grid_element::get_west $c]
	    set g [grid_element::get_west [grid_element::get_south [grid_element::get_south $this]]]
	    set h [grid_element::get_west $g]
	    grid_element::set_south $c $g
	    grid_element::set_north $g $c
	    grid_element::set_south $d $h
	    grid_element::set_north $h $d
	}

	tile::set_tile_port_south $this $b
	tile::set_tile_port_north $this $a
	tile::set_tile_port_west $this $d
	tile::set_tile_port_east $this $c

	grid_element::set_color $a $c_north
	grid_element::set_color $b $c_south
	grid_element::set_color $c $c_east
	grid_element::set_color $d $c_west

	foreach t "$a $b $c $d" {
	    grid_element::set_type $t port
	}

	foreach t "$e $f $g $h" {
	    grid_element::set_type $t crosstrack_port
	}	

	# ensure there is no routing over the ports
	grid_element::mark_blocked $a $b
	grid_element::mark_blocked $b $a
	grid_element::mark_blocked $c $d
	grid_element::mark_blocked $d $c


	set g [grid_element::get_grid $this]

	set ($this,neighbor_north) [grid::get_tile_by_name $g [lindex [layout_utils::trace_to_next_tile $($this,name) north] end]]
	set ($this,neighbor_south) [grid::get_tile_by_name $g [lindex [layout_utils::trace_to_next_tile $($this,name) south] end]]
	set ($this,neighbor_east) [grid::get_tile_by_name $g [lindex [layout_utils::trace_to_next_tile $($this,name) east] end]]
	set ($this,neighbor_west) [grid::get_tile_by_name $g [lindex [layout_utils::trace_to_next_tile $($this,name) west] end]]
    }

    proc get_neighbor_north {this} { return $($this,neighbor_north) }
    proc get_neighbor_south {this} { return $($this,neighbor_south) }
    proc get_neighbor_west {this} { return $($this,neighbor_west) }
    proc get_neighbor_east {this} { return $($this,neighbor_east) }

    proc get_neighbor_tile_port {this neighbor_tile} {
	if {[tile::get_neighbor_north $neighbor_tile] eq $this} {
	    return [tile::get_tile_port_north $neighbor_tile]
	}
	if {[tile::get_neighbor_south $neighbor_tile] eq $this} {
	    return [tile::get_tile_port_south $neighbor_tile]
	}
	if {[tile::get_neighbor_west $neighbor_tile] eq $this} {
	    return [tile::get_tile_port_west $neighbor_tile]
	}
	if {[tile::get_neighbor_east $neighbor_tile] eq $this} {
	    return [tile::get_tile_port_east $neighbor_tile]
	}
    }

    proc get_tile_port_north {this} {return $($this,t_north)}
    proc get_tile_port_south {this} {return $($this,t_south)}
    proc get_tile_port_west {this} {return $($this,t_west)}
    proc get_tile_port_east {this} {return $($this,t_east)}
    proc set_tile_port_north {this g} {set ($this,t_north) $g}
    proc set_tile_port_south {this g} {set ($this,t_south) $g}
    proc set_tile_port_west {this g} {set ($this,t_west) $g}
    proc set_tile_port_east {this g} {set ($this,t_east) $g}

    proc get_tile_port_east_target {this} {
	return [tile::get_neighbor_tile_port $this [tile::get_neighbor_east $this]]
    }
    proc get_tile_port_west_target {this} {
	return [tile::get_neighbor_tile_port $this [tile::get_neighbor_west $this]]
    }
    proc get_tile_port_north_target {this} {
	return [tile::get_neighbor_tile_port $this [tile::get_neighbor_north $this]]
    }
    proc get_tile_port_south_target {this} {
	return [tile::get_neighbor_tile_port $this [tile::get_neighbor_south $this]]
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

    proc get_fplan {this} {
	set co {}
	lappend co [grid_element::get_right [lindex $($this,g) end end]]
	lappend co [grid_element::get_top [lindex $($this,g) end end]]
	lappend co 0
	lappend co 0
	lappend co 0
	lappend co 0
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

    proc get_tile_by_name {this name} {
	foreach tile [join $($this,tile_g)] {
	    if {[tile::get_tile_name $tile] eq $name} {return $tile}
	} 
	return null
    }
    
    proc ~grid {this} {
	# deconstruct all grid elements
	foreach a $($this,g) {
	    foreach b $a {
		grid_element::~grid_element $b
	    }
	}
    }
    
    proc svg_dump {this filename elements} { svg_dump_extra $this $filename $elements ""} 

    proc svg_dump_polylines {this filename polylines} {
	svg_dump_extra $this $filename [join [::grid::get_tile_grid $this]] $polylines
    }

    proc svg_dump_extra {this filename elements extra} {
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
		>\	
               <defs>\
                <style type=\"text/css\"><!\[CDATA\[ \
                 .wire { \
                  fill: none; stroke-width: 0.4} \
                  /* EXTRA_CSS_MARKER */ \
                  \
                \]\]></style> \
               </defs> "
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
	    
	    set color [grid_element::get_color $elem]
	    
	    #puts [classof $elem]
	    if {[classof $elem] eq "::tile"} {
		set c [tile::get_tileM $elem]
		set r [tile::get_tileN $elem]	
		set o [tile::orientation $elem]
		set tb [expr $b + [grid_element::get_height $elem]/2] 
		puts $f "<rect width=\"$w\" height=\"$h\" x=\"$l\" y=\"$b\" style=\"fill:#cccccc;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />"
		puts $f "<text x=\"$l\" y=\"$tb\" style=\"font-size:13px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans\">$c,$r $o</text>"
	    } elseif {[classof $elem] eq "::pipeline_stage"} {
		set w [pipeline_stage::get_width $elem]
		set h [pipeline_stage::get_height $elem]
		set l [pipeline_stage::get_left $elem]
		set b [pipeline_stage::get_bottom $elem]
		set tb [expr $b + [grid_element::get_height $elem]/2] 
		puts $f "<rect width=\"$w\" height=\"$h\" x=\"$l\" y=\"$b\" style=\"fill:$color\;stroke:#999999;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />"
		puts $f "<text x=\"$l\" y=\"$tb\" style=\"font-size:13px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans\">$elem</text>"
	    } else {
		puts $f "<rect width=\"$w\" height=\"$h\" x=\"$l\" y=\"$b\" style=\"fill:$color\;stroke:#999999;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />"
	    }
	}

	puts $f $extra

	puts $f "</svg>"
	close $f
    }
}
