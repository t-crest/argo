# first step - route all direct connections
set unrouted {}
set dist 3.2
set routes {} 
   
foreach dbCell [dbGet -p top.insts.name noc_tile*] {
    set step_stack {}

    set pins_n [dbGet -p $dbCell.instTerms.name *north*]
    set pins_w [dbGet -p $dbCell.instTerms.name *west*]
    set pins_e [dbGet -p $dbCell.instTerms.name *east*]
    set pins_s [dbGet -p $dbCell.instTerms.name *south*]

    set pins_n [concat  [dbGet -p $dbCell.instTerms.name *north_out_b*] [dbGet -p $dbCell.instTerms.name *north_out_f*] [dbGet -p $dbCell.instTerms.name *north_in_b*] [dbGet -p $dbCell.instTerms.name *north_in_f*]]

    #set pins_e [lreverse [concat [dbGet -p $dbCell.instTerms.name *east_out_f*] [dbGet -p $dbCell.instTerms.name *east_out_b*] [dbGet -p $dbCell.instTerms.name *east_in_f*] [dbGet -p $dbCell.instTerms.name *east_in_b*]]]

    #set pins_s [lreverse [concat  [dbGet -p $dbCell.instTerms.name *south_out_b*] [dbGet -p $dbCell.instTerms.name *south_out_f*] [dbGet -p $dbCell.instTerms.name *south_in_b*] [dbGet -p $dbCell.instTerms.name *south_in_f*]]]

    set pins_w  [concat [dbGet -p $dbCell.instTerms.name *west_out_b*] [dbGet -p $dbCell.instTerms.name *west_out_f*] [dbGet -p $dbCell.instTerms.name *west_in_b*] [dbGet -p $dbCell.instTerms.name *west_in_f*] ]
    
    foreach pin_dir {n w} {
	set pins [eval "lrange \$pins_$pin_dir 0 end"]

	set start [lindex [dbget $pins .isOutput] 0]
	set end [dbGet $start.net.instTerms {.isInput}]

	set t1_x [lindex [dbGet $start.pt] {0 0}]
	set t2_x [lindex [dbGet $end.pt] {0 0}]
	set t1_y [lindex [dbGet $start.pt] {0 1}]
	set t2_y [lindex [dbGet $end.pt] {0 1}]

	set p_o [dbGet $dbCell.orient]
	
	

	if {[lsearch {MX R180 R270 MY90} $p_o] > -1} {
	    set init_dir_ew UP
	} else {
	    set init_dir_ew DOWN
	}

	if {$t1_x > $t2_x} {
	    set follow_dir_ew LEFT	
	} else {
	    set follow_dir_ew RIGHT
	}

	if {[lsearch {R0 MX MX90 R270} $p_o] > -1} {
	    set init_dir_sn LEFT
	} else {
	    set init_dir_sn RIGHT
	}

	if {$t1_y > $t2_y} {
	    set follow_dir_sn DOWN
	} else {
	    set follow_dir_sn UP
	}

	set route_steps {}
	
	if {$pin_dir eq "e" || $pin_dir eq "w"} {
	    lappend route_steps "$init_dir_ew $dist RELATIVE"
	    lappend route_steps "$follow_dir_ew *"
	} else {
	    lappend route_steps "$init_dir_sn $dist RELATIVE"
	    lappend route_steps "$follow_dir_sn *"
	}
	# simple route possible exactly when one coordinate of the pins lines up
	if {($t1_y==$t2_y) || ($t1_x == $t2_x)} {
	    puts $route_steps
	    lappend routes [step_plan_route $pins $route_steps]
	}

    }
    
}

step_route_stack [join $routes]
