# procedure to route a bus through a predefined set of directions and distances
proc step_plan_route args {
    set pin_dist 0.8
    # db pointer to the start pins
    set start_pins  [lindex $args 0]
    # routing steps
    set steps [lindex $args 1]   
    
    if {([llength $args] == 3) && ([lindex $args 2] eq "DEBUG")} {
	set debug 1
    } else { 
	set debug 0 
    } 

    set n 0

    set step_stack {}
    foreach f $start_pins {
	# configure route 
	#setEdit -nets [dbGet $f.net.name] -width_horizontal 0.4 -width_vertical 0.4 -layer_horizontal M7 -layer_vertical M6 -drc_on 0 -snap_to_pin 1
	set cell [dbGet $f.inst.name]
	set box  [dbGet $f.inst.box]
	set f_ [dbGet $f.name]
	set t [lsearch -not -inline [dbGet $f.net.instTerms] $f]
	set t_ [dbGet $t.name]
	# coordinates
	set f_pt [dbGet $f.pt]
	set t_pt [dbGet $t.pt]

	if {$debug == 1} {puts "$cell ($box) $f_pt -> $t_pt"}

	# start at pin
	set x [lindex $f_pt {0 0}] 
	set y [lindex $f_pt {0 1}]

	set routeStack {}

	lappend routeStack "$x $y"
	#editAddRoute $x $y

	set i 0
	foreach step $steps {
	    incr i
	    set direction [lindex $step 0]
	    set distance [lindex $step 1]

	    if {$direction eq "DIRECT"} {
		#lappend routeStack $t_pt
		break
	    }

	    if {[llength $step] == 3} {
		set mode [lindex $step 2]
	    } else {
		set mode "RELATIVE"
	    }
    	    

	    # ignore last distance and use the distance of the pin to finish at
	    if {$i == [llength $steps]} {
		if { ($direction eq "DOWN") || ($direction eq "UP") } {
		    set y [lindex $t_pt {0 1}]
		} else {
		    set x [lindex $t_pt {0 0}] 
		}
	    } elseif {$mode eq "RELATIVE"} {
		# calculate next relative position
		if {$direction eq "LEFT"} {
		    set x [expr $x - ($distance + $n * $pin_dist)]
		} elseif {$direction eq "RIGHT"} {
		    set x [expr $x + ($distance + $n * $pin_dist)]
		} elseif {$direction eq "UP"} {
		    set y [expr $y + ($distance + $n * $pin_dist)]
		} elseif {$direction eq "DOWN"} {
		    set y [expr $y - ($distance + $n * $pin_dist)]
		} 
	    } else {
		# calculate next absolute position
		if {$direction eq "LEFT"} {
		    set x [expr $distance - $n * $pin_dist]
		} elseif {$direction eq "RIGHT"} {
		    set x [expr $distance + $n * $pin_dist]
		} elseif {$direction eq "UP"} {
		    set y [expr $distance + $n * $pin_dist]
		} elseif {$direction eq "DOWN"} {
		    set y [expr $distance - $n * $pin_dist]
		} 
	    }

	    if {$debug == 1} {puts "$i $step $x $y"}
	    #editAddRoute $x $y
	    lappend routeStack "$x $y"

	} 

	# finish route
	#editCommitRoute
	lappend routeStack "[lindex $t_pt {0 0}] [lindex $t_pt {0 1}]"
	set l {}
	lappend l [dbGet $f.net.name]
	lappend l $routeStack
	lappend step_stack $l
	incr n
    }

    return $step_stack    
}

proc step_route_stack args {
    set stack [lindex $args 0]
    foreach route $stack {
	set net [lindex $route 0]
	set points [lindex $route 1]
	setEdit -nets $net -width_horizontal 0.4 -width_vertical 0.4 -layer_horizontal M7 -layer_vertical M6 -stop_at_drc 0 -snap_to_track 0 -snap_align_to center -allow_geom_drc 1 -extend_end_wires 1 -extend_start_wires 1
	foreach pointset [lrange $points 0 end-1] {
	    editAddRoute $pointset
	}

	set last [lindex $points end-1]
	set final [lindex $points end]

	# make the final step a bit longer to actually finish the nets
	set overshoot 0

	# set final_os {}
	# foreach a $last b $final { 
	#     if {$a != $b} {
	# 	#              point to go | sign (os-direction)  | amount of overshoot  
	# 	lappend final_os [expr $b - (($a - $b)/abs($a-$b)) * $overshoot ]
	#     } else {
	# 	lappend final_os $b
	#     }
	# }
	
	editCommitRoute $final
    }
}
