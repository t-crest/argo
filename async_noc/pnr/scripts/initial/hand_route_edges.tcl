# load the routing helper
source scripts/hand_route_util.tcl
set dist 3.2

set north_cells [get_object_name [get_cells noc_tile_*_center_[expr $gridN/2]_*]]
set east_cells [get_object_name [get_cells noc_tile_*_center_*_[expr $gridM/2]]]
set south_cells [get_object_name [get_cells noc_tile_*_center_0_*]]
set west_cells [get_object_name [get_cells noc_tile_*_center_*_0]]

set routes {}
set routesa {} 
foreach cell $south_cells {
    set dbCell [dbGet -p top.insts.name $cell]
    set box [dbGet $dbCell.box]
    set orient [dbGet $dbCell.orient]
    puts "$orient: $cell"
    
    set box_left_pos [expr [lindex $box {0 0}] - 3 * $pin_dist]
    set box_top_pos [expr [lindex $box {0 3}] + 3 * $pin_dist]
    set box_right_pos [expr [lindex $box {0 2}] + 3 * $pin_dist]
    set box_bottom_pos [expr [lindex $box {0 1}] - 3 * $pin_dist]
    
    if {$orient eq "MX"} {
	#set from [lreverse [dbGet -p $dbCell.instTerms.name *north*]]
	set from [lreverse [concat [dbGet -p $dbCell.instTerms.name *north_out_b*] [dbGet -p $dbCell.instTerms.name *north_out_f*] [dbGet -p $dbCell.instTerms.name *north_in_b*] [dbGet -p $dbCell.instTerms.name *north_in_f*]]]	

	set route_steps {}	
	lappend route_steps "LEFT [expr $box_left_pos - $distance / 3] ABSOLUTE"
	lappend route_steps "UP [expr $box_top_pos + $distance / 3] ABSOLUTE"
	lappend route_steps "RIGHT $box_right_pos ABSOLUTE"
	lappend route_steps "UP *"
	lappend routesa [step_plan_route $from $route_steps]

    } elseif {$orient eq "R0"} {
	set from [dbGet -p $dbCell.instTerms.name *south*]
	set route_steps {}
	lappend route_steps "LEFT $box_left_pos ABSOLUTE"
	lappend route_steps "DOWN [expr $box_bottom_pos - $distance / 3] ABSOLUTE"
	lappend route_steps "RIGHT $box_right_pos ABSOLUTE"
	lappend route_steps "UP *"
	lappend routesa [step_plan_route $from $route_steps]
    }
}

foreach cell $north_cells {
    set dbCell [dbGet -p top.insts.name $cell]
    set box [dbGet $dbCell.box]
    set orient [dbGet $dbCell.orient]   
    puts "$orient: $cell"

    set box_left_pos [expr [lindex $box {0 0}] - 3 * $pin_dist]
    set box_top_pos [expr [lindex $box {0 3}] + 3 * $pin_dist]
    set box_right_pos [expr [lindex $box {0 2}] + 3 * $pin_dist]
    set box_bottom_pos [expr [lindex $box {0 1}] - 3 * $pin_dist]    

    if {$orient eq "R0"} {
	set from [lreverse [concat [dbGet -p $dbCell.instTerms.name *north_out_b*] [dbGet -p $dbCell.instTerms.name *north_out_f*] [dbGet -p $dbCell.instTerms.name *north_in_b*] [dbGet -p $dbCell.instTerms.name *north_in_f*]]]

	set top_pos [expr [lindex [dbGet $from.pt -i 0] 1] + 2 * $pin_dist]
	set left_pos [expr [lindex $box {0 0}] - 2 * $pin_dist]
	set bottom_pos [expr [lindex $box {0 1}] - 2 * $pin_dist]
	
	set route_steps {}
	lappend route_steps "UP $top_pos ABSOLUTE"
	lappend route_steps "LEFT $left_pos ABSOLUTE"
	lappend route_steps "DOWN $bottom_pos ABSOLUTE"
	lappend route_steps "RIGHT *"
	#step_route $from $route_steps
	lappend routes [step_plan_route $from $route_steps]

    } elseif {$orient eq "MX" || $orient eq "R180"} {
	set from [dbGet -p $dbCell.instTerms.name *south*]

	set route_steps {}
	lappend route_steps "RIGHT $box_right_pos  ABSOLUTE"
	lappend route_steps "UP [expr $box_top_pos + $distance/3] ABSOLUTE"
	lappend route_steps "LEFT $box_left_pos ABSOLUTE"
	lappend route_steps "DOWN *"

	#step_route $from $route_steps 
	lappend routesa [step_plan_route $from $route_steps]
    } elseif {$orient eq "MY"} {
	set from [lreverse [concat [dbGet -p $dbCell.instTerms.name *north_out_b*] [dbGet -p $dbCell.instTerms.name *north_out_f*] [dbGet -p $dbCell.instTerms.name *north_in_b*] [dbGet -p $dbCell.instTerms.name *north_in_f*]]]

	set top_pos [expr [lindex [dbGet $from.pt -i 0] 1] + 2 * $pin_dist]
	set right_pos [expr [lindex $box {0 2}] + 2 * $pin_dist]
	set bottom_pos [expr [lindex $box {0 1}] - 2 * $pin_dist]
	
	set route_steps {}
	lappend route_steps "RIGHT [expr $box_right_pos + $distance / 3] ABSOLUTE"
	lappend route_steps "DOWN [expr $box_bottom_pos - $distance / 3] ABSOLUTE"
	lappend route_steps "LEFT $box_left_pos ABSOLUTE"
	lappend route_steps "DOWN *"
	#step_route $from $route_steps
	lappend routesa [step_plan_route $from $route_steps]
    }
}

foreach cell $west_cells {
    set dbCell [dbGet -p top.insts.name $cell]
    set box [dbGet $dbCell.box]
    set orient [dbGet $dbCell.orient]
    puts "$orient: $cell"

    set box_left_pos [expr [lindex $box {0 0}] - 3 * $pin_dist]
    set box_top_pos [expr [lindex $box {0 3}] + 3 * $pin_dist]
    set box_right_pos [expr [lindex $box {0 2}] + 3 * $pin_dist]
    set box_bottom_pos [expr [lindex $box {0 1}] - 3 * $pin_dist]
    
    if {$orient eq "R180"} {
	#set from [lreverse [dbGet -p $dbCell.instTerms.name *north*]]
	set from [lreverse [concat [dbGet -p $dbCell.instTerms.name *east_in_b*] [dbGet -p $dbCell.instTerms.name *east_in_f*] [dbGet -p $dbCell.instTerms.name *east_out_b*] [dbGet -p $dbCell.instTerms.name *east_out_f*] ]]
	set route_steps {}
	lappend route_steps "UP [expr $box_top_pos + $distance/3] ABSOLUTE"
	lappend route_steps "RIGHT [expr $box_right_pos + $distance/3] ABSOLUTE"
	lappend route_steps "DOWN $box_bottom_pos ABSOLUTE"
	lappend route_steps "RIGHT *"
	#step_route $from $route_steps
	lappend routesa [step_plan_route $from $route_steps]

    } elseif {$orient eq "MX"} {
	set from [dbGet -p $dbCell.instTerms.name *west*]
	
	set route_steps {}
 	lappend route_steps "UP $box_top_pos ABSOLUTE"
	lappend route_steps "LEFT [expr $box_left_pos - $distance/3] ABSOLUTE"
	lappend route_steps "DOWN $box_bottom_pos ABSOLUTE"
	lappend route_steps "RIGHT *"
	#step_route $from $route_steps 
	lappend routesa [step_plan_route $from $route_steps]

    }
}

foreach cell $east_cells {
    set dbCell [dbGet -p top.insts.name $cell]
    set box [dbGet $dbCell.box]
    set orient [dbGet $dbCell.orient]
    puts "$orient: $cell"

    set box_left_pos [expr [lindex $box {0 0}] - 3 * $pin_dist]
    set box_top_pos [expr [lindex $box {0 3}] + 3 * $pin_dist]
    set box_right_pos [expr [lindex $box {0 2}] + 3 * $pin_dist]
    set box_bottom_pos [expr [lindex $box {0 1}] - 3 * $pin_dist]
    
    if {$orient eq "MX"} {
	set from [lreverse [concat [dbGet -p $dbCell.instTerms.name *east_in_b*] [dbGet -p $dbCell.instTerms.name *east_in_f*] [dbGet -p $dbCell.instTerms.name *east_out_b*] [dbGet -p $dbCell.instTerms.name *east_out_f*] ]]
	#set from [dbGet -p $dbCell.instTerms.name *east*]
	]
	set route_steps {}
 	lappend route_steps "UP $box_top_pos ABSOLUTE"
	lappend route_steps "LEFT [expr $box_left_pos - $distance/3] ABSOLUTE"
	lappend route_steps "DOWN $box_bottom_pos ABSOLUTE"
	lappend route_steps "RIGHT *"
	#step_route $from $route_steps 
	lappend routesa [step_plan_route $from $route_steps]

    } elseif { $orient eq "R0" } {
	set from [lreverse [concat [dbGet -p $dbCell.instTerms.name *east_in_b*] [dbGet -p $dbCell.instTerms.name *east_in_f*] [dbGet -p $dbCell.instTerms.name *east_out_b*] [dbGet -p $dbCell.instTerms.name *east_out_f*] ]]
	#set from [dbGet -p $dbCell.instTerms.name *east*]

	set route_steps {}

	lappend route_steps "DOWN [expr $box_bottom_pos - $distance/3] ABSOLUTE"
	lappend route_steps "LEFT [expr $box_left_pos - $distance/3] ABSOLUTE"
	lappend route_steps "UP $box_top_pos ABSOLUTE"
	lappend route_steps "LEFT *"
	lappend routesa [step_plan_route $from $route_steps]
	
    } elseif {$orient eq "MY"} {
	set from [dbGet -p $dbCell.instTerms.name *west*]
	set right_pos [expr [lindex $box {0 2}] + 2 * $pin_dist]
	set route_steps {}
	lappend route_steps "DOWN $box_bottom_pos ABSOLUTE"
	lappend route_steps "RIGHT [expr $box_right_pos + $distance / 3] ABSOLUTE"
	lappend route_steps "UP $box_top_pos ABSOLUTE"
	lappend route_steps "LEFT *"
	lappend routesa [step_plan_route $from $route_steps]

    } elseif {$orient eq "R180"} {
	set from [dbGet -p $dbCell.instTerms.name *west*]
	set right_pos [expr [lindex $box {0 2}] + 2 * $pin_dist]
	set route_steps {}
	lappend route_steps "RIGHT $right_pos ABSOLUTE"
	lappend route_steps "DOWN *"
	lappend routes [step_plan_route $from $route_steps]

    }
}


set corner_sw [get_object_name [get_cells noc_tile_corner_0_0]]
set dbCell [dbGet -p top.insts.name $corner_sw]
set box [dbGet $dbCell.box]
set orient [dbGet $dbCell.orient]
puts "$orient: $corner_sw"

    set box_left_pos [expr [lindex $box {0 0}] - 3 * $pin_dist]
    set box_top_pos [expr [lindex $box {0 3}] + 3 * $pin_dist]
    set box_right_pos [expr [lindex $box {0 2}] + 3 * $pin_dist]
    set box_bottom_pos [expr [lindex $box {0 1}] - 3 * $pin_dist]

if {$orient eq "MX"} {
    set from [dbGet -p $dbCell.instTerms.name *north*]
    set route_steps {}
    lappend route_steps "LEFT $box_left_pos ABSOLUTE"
    lappend route_steps "DOWN $box_bottom_pos ABSOLUTE"
    lappend route_steps "RIGHT *"
    lappend routesa [step_plan_route $from $route_steps]


    set from [lreverse [concat [dbGet -p $dbCell.instTerms.name *west_in_b*] [dbGet -p $dbCell.instTerms.name *west_in_f*] [dbGet -p $dbCell.instTerms.name *west_out_b*] [dbGet -p $dbCell.instTerms.name *west_out_f*] ]]
    set left_pos [expr [lindex $box {0 0}] - 2 * $pin_dist]
    set top_pos [expr [lindex $box {0 3}] + 2 * $pin_dist]
    set route_steps {}
    lappend route_steps "UP [expr $box_top_pos + $distance/3] ABSOLUTE"
    lappend route_steps "RIGHT $box_right_pos ABSOLUTE"
    lappend route_steps "UP *"
    lappend routesa [step_plan_route $from $route_steps]

}

set corner_se [get_object_name [get_cells noc_tile_corner_0_[expr $gridM/2]]]
set dbCell [dbGet -p top.insts.name $corner_se]
set box [dbGet $dbCell.box]
set orient [dbGet $dbCell.orient]
puts "$orient: $corner_se"

    set box_left_pos [expr [lindex $box {0 0}] - 3 * $pin_dist]
    set box_top_pos [expr [lindex $box {0 3}] + 3 * $pin_dist]
    set box_right_pos [expr [lindex $box {0 2}] + 3 * $pin_dist]
    set box_bottom_pos [expr [lindex $box {0 1}] - 3 * $pin_dist]

if {$orient eq "R0"} {
    set from [dbGet -p $dbCell.instTerms.name *east*]
    set route_steps {}
    lappend route_steps "DOWN $box_bottom_pos ABSOLUTE"
    lappend route_steps "RIGHT $box_right_pos ABSOLUTE"
    lappend route_steps "UP *"
    lappend routesa [step_plan_route $from $route_steps]


    set from [lreverse [concat [dbGet -p $dbCell.instTerms.name *south_in_b*] [dbGet -p $dbCell.instTerms.name *south_in_f*] [dbGet -p $dbCell.instTerms.name *south_out_b*] [dbGet -p $dbCell.instTerms.name *south_out_f*] ]]

    set route_steps {}
    lappend route_steps "LEFT [expr $box_left_pos - $distance/3] ABSOLUTE"
    lappend route_steps "UP $box_top_pos ABSOLUTE"
    lappend route_steps "LEFT *"
    lappend routesa [step_plan_route $from $route_steps]

} else {
    set from [dbGet -p $dbCell.instTerms.name *east*]
    set route_steps "{RIGHT *}"
    lappend routes [step_plan_route $from $route_steps]

    set from [dbGet -p $dbCell.instTerms.name *north*]
    set route_steps "{DOWN *}"
    lappend routes [step_plan_route $from $route_steps]

}

set corner_nw [get_object_name [get_cells noc_tile_corner_[expr $gridN/2]_0]]
set dbCell [dbGet -p top.insts.name $corner_nw]
set box [dbGet $dbCell.box]
set orient [dbGet $dbCell.orient]
puts "$orient: $corner_nw"
    set box_left_pos [expr [lindex $box {0 0}] - 3 * $pin_dist]
    set box_top_pos [expr [lindex $box {0 3}] + 3 * $pin_dist]
    set box_right_pos [expr [lindex $box {0 2}] + 3 * $pin_dist]
    set box_bottom_pos [expr [lindex $box {0 1}] - 3 * $pin_dist]
if {$orient eq "R180"} {
    set from [dbGet -p $dbCell.instTerms.name *east*]
    set route_steps {}
    lappend route_steps "UP $box_top_pos ABSOLUTE"
    lappend route_steps "LEFT $box_left_pos ABSOLUTE"
    lappend route_steps "DOWN *"
    lappend routesa [step_plan_route $from $route_steps]


    set from [lreverse [concat [dbGet -p $dbCell.instTerms.name *south_in_b*] [dbGet -p $dbCell.instTerms.name *south_in_f*] [dbGet -p $dbCell.instTerms.name *south_out_b*] [dbGet -p $dbCell.instTerms.name *south_out_f*] ]]
    set right_pos [expr [lindex $box {0 2}] + 2 * $pin_dist]
    set top_pos [expr [lindex $box {0 3}] + 2 * $pin_dist]
    set route_steps {}
    lappend route_steps "RIGHT [expr $box_right_pos + $distance / 3] ABSOLUTE"
    lappend route_steps "DOWN $box_bottom_pos ABSOLUTE"
    lappend route_steps "RIGHT *"
    lappend routesa [step_plan_route $from $route_steps]

} else {
    set left_pos [expr [lindex $box {0 0}] - 2 * $pin_dist]
    set top_pos [expr [lindex $box {0 3}] + 2 * $pin_dist]
    set from [dbGet -p $dbCell.instTerms.name *south*]
    set route_steps "{UP $top_pos ABSOLUTE}"
    lappend route_steps "RIGHT *"
    lappend routes [step_plan_route $from $route_steps]

    set from [dbGet -p $dbCell.instTerms.name *west*]
    set route_steps "{LEFT $left_pos ABSOLUTE}"
    lappend route_steps "DOWN *"
    lappend routes [step_plan_route $from $route_steps]

}

set corner_ne [get_object_name [get_cells noc_tile_corner_[expr $gridN/2]_[expr $gridM/2]]]
set dbCell [dbGet -p top.insts.name $corner_ne]
set box [dbGet $dbCell.box]
set orient [dbGet $dbCell.orient]
    set box_left_pos [expr [lindex $box {0 0}] - 3 * $pin_dist]
    set box_top_pos [expr [lindex $box {0 3}] + 3 * $pin_dist]
    set box_right_pos [expr [lindex $box {0 2}] + 3 * $pin_dist]
    set box_bottom_pos [expr [lindex $box {0 1}] - 3 * $pin_dist]
puts "$orient: $corner_ne"
if {$orient eq "MY"} {
    set from [dbGet -p $dbCell.instTerms.name *north*]
    set route_steps {}
    lappend route_steps "RIGHT $box_right_pos ABSOLUTE"
    lappend route_steps "UP $box_top_pos ABSOLUTE"
    lappend route_steps "LEFT *"
    lappend routesa [step_plan_route $from $route_steps]


    set from [lreverse [concat [dbGet -p $dbCell.instTerms.name *west_in_b*] [dbGet -p $dbCell.instTerms.name *west_in_f*] [dbGet -p $dbCell.instTerms.name *west_out_b*] [dbGet -p $dbCell.instTerms.name *west_out_f*] ]]
    set right_pos [expr [lindex $box {0 2}] + 2 * $pin_dist]
    set bottom_pos [expr [lindex $box {0 1}] - 2 * $pin_dist]
    set route_steps {}
    lappend route_steps "DOWN [expr $box_bottom_pos - $distance / 3] ABSOLUTE"
    lappend route_steps "LEFT $box_left_pos ABSOLUTE"
    lappend route_steps "DOWN *"
    lappend routesa [step_plan_route $from $route_steps]

} elseif {$orient eq "MX"} {
    set from [dbGet -p $dbCell.instTerms.name *east*]
    set route_steps "{RIGHT *}"
    lappend routes [step_plan_route $from $route_steps]


    set from [lreverse [concat [dbGet -p $dbCell.instTerms.name *south_in_b*] [dbGet -p $dbCell.instTerms.name *south_in_f*] [dbGet -p $dbCell.instTerms.name *south_out_b*] [dbGet -p $dbCell.instTerms.name *south_out_f*] ]]
    set left_pos [expr [lindex $box {0 0}] - 2 * $pin_dist]
    set top_pos [expr [lindex $box {0 3}] + 2 * $pin_dist]
    set route_steps {}
    lappend route_steps "UP $top_pos ABSOLUTE"
    lappend route_steps "LEFT $left_pos ABSOLUTE"
    lappend route_steps "DOWN *"
    lappend routes [step_plan_route $from $route_steps]
} 

# do the actual routing
step_route_stack [join $routesa] 
