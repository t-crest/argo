set edge 0

foreach direction {west north east south} {
    
    # 
    if {[lsearch {east south} $direction] > -1} {
	set order {out in}
	set sd clockwise
    } else {
	set order {in out}
	set sd counterclockwise
    }	
    if {[lsearch {east west} $direction] > -1} {
	set layers {M6}
	# {M2 M4} 
	set dir_row col
	set dir_col row
	set pin_pos $pin_pos_east_west
	set side Bottom
    } else {
	set layers {M7}
	#{M3 M5}
	set dir_row row
	set dir_col col
	set side Left
	set pin_pos $pin_pos_north_south
    }
    

    set start_x 0
    set start_y 0

    set port_list {}
    if {[string equal east $direction]} {
	set start_x [expr $fp_left + $router_width - $pin_pos]

	# placement of the other ports...
	lappend port_list clk
	lappend port_list reset
	lappend port_list {settings[0]}
	lappend port_list {settings[1]}
	lappend port_list {settings[2]}
	lappend port_list {settings[3]}
	lappend port_list {settings[4]}
	lappend port_list {settings[5]}
	lappend port_list {settings[6]}
	lappend port_list {settings[7]}

    } elseif {[string equal north $direction]} {
	set start_y [expr $fp_bottom + $router_height - $pin_pos]
    } elseif {[string equal west $direction]} {
	set start_x [expr $fp_left + $pin_pos]
    } else {
	set start_y [expr $fp_bottom + $pin_pos]
    }

   
    set port_num 35
    foreach orientation $order {
	for {set i 0} {$i <= $port_num} {incr i} {
	    lappend port_list $direction\_$orientation\_f\[$i\]
	}
	lappend port_list $direction\_$orientation\_b
    }

    set pin_pos_end [expr $pin_pos + $pin_dist * [llength $port_list]]
    puts "Pins: $direction"

    # place the pins

    # # Custom placement inside
    # set pos 0
    # foreach pin $port_list {
    # 	# calculate position
    # 	if {[string equal east $direction]} {
    # 	    set x [expr $router_width + $fp_left + $distance]
    # 	    set y [expr $pin_pos_east_west + $pos * $pin_dist]
    # 	} elseif {[string equal north $direction]} {
    # 	    set x [expr $pin_pos_north_south + $pos * $pin_dist]
    # 	    set y [expr $router_height + $fp_bottom + $distance]
    # 	} elseif {[string equal west $direction]} {
    # 	    set x [expr $fp_left]
    # 	    set y [expr $pin_pos_east_west + $pos * $pin_dist]
    # 	} else {
    # 	    set x [expr $pin_pos_north_south + $pos * $pin_dist]
    # 	    set y [expr $fp_bottom]
    # 	}
    # 	# interleave layer
    # 	set layer [lindex $layers [expr $pos%[llength $layers]]]
    # 	# place pin
    # 	editPin -snap TRACK -cell tile -assign $x $y -layer $layer -pin $pin
    # 	incr pos
    # }
    

    editPin -cell tile -fixOverlap 1 -unit MICRON -spreadDirection $sd -side $side -layer $layers -spreadType start -spacing 0.8 -start $start_x $start_y -pin $port_list

    # Ensure the pins are not moved arround
    foreach pin $port_list {
	setPtnPinStatus * $pin fixed
    }

    

    
    # Use the structured data path feature to place the input & output latches at 
    # a position suitible for connecting the network link with minimized congestion
    
    
    # count up the edge
    incr edge
}


