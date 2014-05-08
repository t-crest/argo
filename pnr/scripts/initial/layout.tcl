set dir ../scripts/libs/stooop
source ../scripts/libs/stooop/pkgIndex.tcl
package require stooop
namespace import stooop::*

class grid_element {
    #constructor
    proc grid_element {this grid row col height width} {
	set ($this,row) $row
	set ($this,col) $col
	set ($this,width) $width
	set ($this,height) $height
	set ($this,grid) $grid
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
	set n [lindex $grid_list $r+1 $c]
	set s [lindex $grid_list $r-1 $c]
	set e [lindex $grid_list $r $c+1]
	set w [lindex $grid_list $r $c-1]
	
	#puts "$this: $($this,row) $($this,col) -- n:$n s:$s e:$e w:$w "
	
	# store neighbors (if available)
	if {$n ne ""} { set ($this,north) $n} else {set ($this,north) null}
	if {$s ne ""} { set ($this,south) $s} else {set ($this,south) null}
	if {$e ne ""} { set ($this,east) $e} else {set ($this,east) null}
	if {$w ne ""} { set ($this,west) $w} else {set ($this,west) null}
    }
       
    # get the neighbors
    proc get_north {this} {
	return $($this,north)
    }
    
    proc get_south {this} {
	return $($this,south)
    }
    
    proc get_east {this} {
	return $($this,east)
    }
    
    proc get_west {this} {
	return $($this,west)
    }
    
    # dimensions
    proc get_width {this} {
	return $($this,width)
    }
    proc get_height {this} {
	return $($this,height)
    }
    
    # positions
    proc get_row {this} {
	return $($this,row)
    }
    proc get_col {this} {
	return $($this,col)
    }
    
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
    #destructor
    proc ~grid_element {this} {}
}

class grid {
    proc grid {this width_vector height_vector} {
	set agrid {}
	set aline {}
	set h_ 0
	set w_ 0
	
	# create grid elements
	foreach h $height_vector {
	    foreach w $width_vector {
		lappend aline [new grid_element $this $h_ $w_ $h $w]
		incr w_
	    }
	    lappend agrid $aline
	    set aline {}
	    set w_ 0
	    incr h_
	}
	
	
	set ($this,g) $agrid
	
	# link elements
	foreach row $agrid {
	    foreach col $row {
		grid_element::set_neighbors $col
	    }
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
    
    proc get_grid {this} {
	return $($this,g)
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
	puts $f "<svg>"
	set g_h [lindex [grid::get_box $this] end]
	puts $g_h
	foreach row $($this,g) {
	    foreach col $row {
		
		
		set w [grid_element::get_width $col]
		set h [grid_element::get_height $col]
		set l [grid_element::get_left $col]
		set b [grid_element::get_bottom $col]
		#set b [expr $g_h - [grid_element::get_bottom $col] - $h]
		
		set c [grid_element::get_col $col]
		set r [grid_element::get_row $col]		
		
		puts $f "<rect width=\"$w\" height=\"$h\" x=\"$l\" y=\"$b\" style=\"fill:none;stroke:#ff0000;stroke-width:2;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none\" />"
		puts $f "<text x=\"$l\" y=\"$b\" style=\"font-size:50px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans\">$c,$r</text>"
	    }
	}
	puts $f "</svg>"
	close $f
    }
}
