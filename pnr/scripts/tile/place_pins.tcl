set edge 0

foreach direction {west north east south} {
    
    # 
    if {[lsearch {east south} $direction] > -1} {
	set order {out in}
	set sd counterclockwise
    } else {
	set order {in out}
	set sd clockwise
    }	
    if {[lsearch {east west} $direction] > -1} {
	set layers {M7}
	#{M3 M5}
	set dir_row row
	set dir_col col
	set pin_pos $pin_pos_east_west
    } else {
	set layers {M6}
	# {M2 M4} 
	set dir_row col
	set dir_col row
	set pin_pos $pin_pos_north_south
    }
    
    set port_list {}
    set port_num 35
    foreach orientation $order {
	for {set i 0} {$i <= $port_num} {incr i} {
	    lappend port_list $direction\_$orientation\_f\[$i\]
	}
	lappend port_list $direction\_$orientation\_b
    }



    # place the pins

    # Custom placement inside
    set pos 0

    
    # Number of rows
    set num_rows 3
    
    # get all cells directly connected to one of the network wires
    set related_cells [get_object_name [get_cells -of_objects [get_nets -of_objects [get_ports $port_list]] -leaf ]]  

    # split them up
    set split_related_cells {}
    set tmp {}
    set i 1
    foreach cell $related_cells {
	lappend tmp $cell
	if {$i < $num_rows} {
	    incr i
	} else {
	    lappend split_related_cells $tmp
	    set tmp {}
	    set i 1
	}	
    }
    lappend split_related_cells $tmp

    # create SDP groups and place the cells within
    createSdpGroup -name sdp_$direction -type $dir_row     
    set row 0
    foreach cells $split_related_cells {
	createSdpGroup -name sdp_$direction\_$row -type $dir_col
	addSdpGroupMember -group sdp_$direction -object sdp_$direction\_$row
	foreach cell $cells {
	    addSdpGroupMember -group sdp_$direction\_$row -object $cell
	}
	incr row
    }
    
    # count up the edge
    incr edge
}

setPlaceMode -sdpPlace true
setPlaceMode -sdpAlignment true
placeSdpGroup

# createNetGroup northNetGroup -net [get_object_name [get_nets -of_objects [get_ports north*]]]
# createNetGroup southNetGroup -net [get_object_name [get_nets -of_objects [get_ports south*]]]
# createNetGroup westNetGroup -net [get_object_name [get_nets -of_objects [get_ports west*]]]
# createNetGroup eastNetGroup -net [get_object_name [get_nets -of_objects [get_ports east*]]]

# # east
# createBusGuide -centerLine [expr $fp_width + $fp_right] [expr $fp_bottom / 2] $router_width [expr $fp_bottom / 2] -netGroup eastNetGroup -layer M3:M5 -width $fp_bottom
# createBusGuide -centerLine [expr $router_width - 2*$fp_bottom] 0 [expr $router_width - 2*$fp_bottom] [expr 4 * $fp_bottom] -netGroup eastNetGroup -layer M1:M5 -width [expr 6 * $fp_bottom]

# define areas for the router to keep free for external connection
# createRouteBlk -layer {M1 M2 M3 M4 M5 M6 M7} -box 0 0 [lindex [join [dbGet [dbGet -p -i 1 top.terms.name west*].pt]] 0] [lindex [join [dbGet [dbGet -p -i 1 top.terms.name south*].pt]] 1]
# createRouteBlk -layer {M1 M2 M3 M4 M5 M6 M7} -box 0 [lindex [join [dbGet [dbGet -p -i 1 top.terms.name north*].pt]] 1] $fp_left [expr $tile_height + $fp_bottom + $fp_top]
# createRouteBlk -layer {M1 M2 M3 M4 M5 M6 M7} -box [lindex [join [dbGet [dbGet -p -i 1 top.terms.name east*].pt]] 0] 0 [expr $tile_width + $fp_right + $fp_left] $fp_bottom
# createRouteBlk -layer {M1 M2 M3 M4 M5 M6 M7} -box [expr $tile_width + $fp_right] 0 [expr $tile_width + $fp_right + $fp_left] [expr $tile_height + $fp_bottom + $fp_top]
# createRouteBlk -layer {M1 M2 M3 M4 M5 M6 M7} -box 0 [expr $tile_height + $fp_bottom] [expr $tile_width + $fp_right + $fp_left] [expr $tile_height + $fp_bottom + $fp_top]

