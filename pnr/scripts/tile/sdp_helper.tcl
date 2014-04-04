# filter a list of cells using a regular expression
# all matching cells are dropped, order of the list
# is kept
proc sdp_filter args {
    set cell_name_list [lindex $args 0]
    set filter_regexp [lindex $args 1]
    set output {}
    
    foreach cell $cell_name_list {
	if {[regexp $filter_regexp $cell] == 0} {
	    lappend output $cell
	}
    }

    return $output
}

# zipper-like merge of n lines
# {a1 a2 a3} {b1 b2 b3} => {a1 b1 a2 b2 a3 b3} 
proc sdp_merge_lines args {
    set result {}
    set length 0

    # determine length of longest line
    foreach line $args {
	if {[llength $line] > $length} {
	    set length [llength $line]
	}
    }

    # zipper-die-zip
    for {set pos 0} {$pos < $length} {incr pos} {
	foreach line $args {
	    lappend result [lindex $line $pos]
	}
    }

    return [join $result]
}

# splits a line into multiple lines
# the actual splitting takes the area into account
# to even out the length, thus the actual ordering
# higly depends on the cells within the input list
proc sdp_split_line args {
    # the line
    set line [lindex $args 0]
    # number of lines to spread over
    set num_lines [lindex $args 1] 
    # result 
    set result {}

    # prepare arrays to store the new lines
    array set result_lines {}
    array set line_area {}
    for {set n 0} {$n < $num_lines} {incr n} {
	set result_lines($n) {}
	set line_area($n) 0.0
    }

    # iterate over all the cells
    foreach cell $line {
	# get the cell
	set cell_obj [get_cells $cell]
	set area [get_property $cell_obj area]
	
	# find the line with the minimum area
	set sel_line 0
	set sel_line_area $line_area($sel_line)
	for {set n 0} {$n < $num_lines} {incr n} {
	    if {$sel_line_area > $line_area($n)} {
		set sel_line $n
	    }
	}

	# add the cell to the selected line
	lappend result_lines($sel_line) $cell
	set line_area($sel_line) [expr $line_area($sel_line) + 1]
    } 

    # add all created lists to a list of lines
    for {set n 0} {$n < $num_lines} {incr n} {
	lappend result $result_lines($n)
    }

    # return the lines
    return $result
}

# Creates well taps within the memory at a defined maximum distance
#
# <line> <well tap cell to use> <distance> <width of the cell>
# I tried hard to read out the cell width, but there is no easy way
# to get that property... - no lib files for filler cells, so the
# area is 0. Have not found a way to query for lef size data.
proc sdp_line_inject_well_taps args {
    set line [lindex $args 0]
    set tap_cell [lindex $args 1]
    set distance [lindex $args 2]
    set cell_width [lindex $args 3]
    set cell_height [lindex $args 4]
    set name [lindex $args 5]

    set result {}
    set i 0   

    # well tap at the beginning
    addInst -cell $tap_cell -inst $name\_$i -physical
    lappend result $name\_$i
    set length $cell_width
    set last_well_tap $length

    # iterate over all cells - if the distance to the last
    # well tap would exceed $distance place a well tap and 
    # then the cell, else just the cell.
    foreach elem $line {
	set area [get_attribute [get_cells $elem] area]
	set width [expr (1.0*$area) / (1.0*$cell_height)]
	if {[expr ($last_well_tap + $distance) < ($length + $width)]} {
	    incr i
	    addInst -cell $tap_cell -inst $name\_$i -physical
	    lappend result $name\_$i
	    set length [expr $length + $cell_width]
	    set last_well_tap $length
	}  
	lappend result $elem
	set length [expr $length + $width]
    }
    
    # well tap in the end (better safe than sorry...)
    incr i
    addInst -cell $tap_cell -inst $name\_$i -physical
    lappend result $name\_$i

    return $result
}

