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
		    lappend aline [new tile $this $h_ $w_ $h $w $tile_col $tile_row]
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
    
    proc svg_dump {this filename} {
	set f [open $filename "w"]
	
	set g_h [lindex [grid::get_box $this] end]
	puts $g_h
	puts $f "<svg><g transform=\"translate(0,$g_h)\"><g transform=\"scale(1,-1)\">"

	set vect [join [concat $($this,g) $($this,extra_g)]]
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
		
		puts $f "<rect width=\"$w\" height=\"$h\" x=\"$l\" y=\"$b\" style=\"fill:none;stroke:#ff0000;stroke-width:2;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />"
	    puts [classof $elem]
	    if {[classof $elem] eq "::tile"} {
		set c [tile::get_tileM $elem]
		set r [tile::get_tileN $elem]	
		set o [tile::orientation $elem]
		puts $f "<text x=\"$l\" y=\"$b\" style=\"font-size:13px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans\">$c,$r $o</text>"
	    }
	}
	puts $f "</g></g></svg>"
	close $f
    }
}

