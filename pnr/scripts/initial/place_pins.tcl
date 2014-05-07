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


editPin -cell link_pipeline_1_0_0_0_0_000000000 -fixOverlap 1 -spreadDirection clockwise -side Left -layer 6 -spreadType side -pin {{left_in[0]} {left_in[1]} {left_in[2]} {left_in[3]} {left_in[4]} {left_in[5]} {left_in[6]} {left_in[7]} {left_in[8]} {left_in[9]} {left_in[10]} {left_in[11]} {left_in[12]} {left_in[13]} {left_in[14]} {left_in[15]} {left_in[16]} {left_in[17]} {left_in[18]} {left_in[19]} {left_in[20]} {left_in[21]} {left_in[22]} {left_in[23]} {left_in[24]} {left_in[25]} {left_in[26]} {left_in[27]} {left_in[28]} {left_in[29]} {left_in[30]} {left_in[31]} {left_in[32]} {left_in[33]} {left_in[34]} {left_in[35]} left_out}

editPin -cell link_pipeline_1_0_0_0_0_000000000 -fixOverlap 1 -spreadDirection counterclockwise -side Right -layer 6 -spreadType side -pin {{right_out[0]} {right_out[1]} {right_out[2]} {right_out[3]} {right_out[4]} {right_out[5]} {right_out[6]} {right_out[7]} {right_out[8]} {right_out[9]} {right_out[10]} {right_out[11]} {right_out[12]} {right_out[13]} {right_out[14]} {right_out[15]} {right_out[16]} {right_out[17]} {right_out[18]} {right_out[19]} {right_out[20]} {right_out[21]} {right_out[22]} {right_out[23]} {right_out[24]} {right_out[25]} {right_out[26]} {right_out[27]} {right_out[28]} {right_out[29]} {right_out[30]} {right_out[31]} {right_out[32]} {right_out[33]} {right_out[34]} {right_out[35]} right_in}

editPin -cell link_pipeline_1_0_0_0_0_000000000 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Top -layer 1 -spreadType center -spacing 0.2 -pin preset


editPin -cell link_pipeline_0_0_0_0_0_000000000 -fixOverlap 1 -spreadDirection clockwise -side Top -layer 6 -spreadType side -pin {{left_in[0]} {left_in[1]} {left_in[2]} {left_in[3]} {left_in[4]} {left_in[5]} {left_in[6]} {left_in[7]} {left_in[8]} {left_in[9]} {left_in[10]} {left_in[11]} {left_in[12]} {left_in[13]} {left_in[14]} {left_in[15]} {left_in[16]} {left_in[17]} {left_in[18]} {left_in[19]} {left_in[20]} {left_in[21]} {left_in[22]} {left_in[23]} {left_in[24]} {left_in[25]} {left_in[26]} {left_in[27]} {left_in[28]} {left_in[29]} {left_in[30]} {left_in[31]} {left_in[32]} {left_in[33]} {left_in[34]} {left_in[35]} left_out}

editPin -cell link_pipeline_0_0_0_0_0_000000000 -fixOverlap 1 -spreadDirection counterclockwise -side Bottom -layer 6 -spreadType side -pin {{right_out[0]} {right_out[1]} {right_out[2]} {right_out[3]} {right_out[4]} {right_out[5]} {right_out[6]} {right_out[7]} {right_out[8]} {right_out[9]} {right_out[10]} {right_out[11]} {right_out[12]} {right_out[13]} {right_out[14]} {right_out[15]} {right_out[16]} {right_out[17]} {right_out[18]} {right_out[19]} {right_out[20]} {right_out[21]} {right_out[22]} {right_out[23]} {right_out[24]} {right_out[25]} {right_out[26]} {right_out[27]} {right_out[28]} {right_out[29]} {right_out[30]} {right_out[31]} {right_out[32]} {right_out[33]} {right_out[34]} {right_out[35]} right_in}

editPin -cell link_pipeline_0_0_0_0_0_000000000 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Left -layer 1 -spreadType center -spacing 0.2 -pin preset

