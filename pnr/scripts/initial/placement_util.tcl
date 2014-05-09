# 
proc place_tile args {

    # process arguments
    set argN [lindex $args 0]
    set argM [lindex $args 1]
    
    # Generate Positions to map the torus to a 2D surface
    # (interleave forward & backwards)
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

    set curM [lindex $cols $argM]
    set curN [lindex $rows $argN]
    set tile [get_object_name [get_cell noc_tile_*_$curM\_$curN]]    

    set ll [expr $::grid_left + $argN*($::tile_width + $::distance + $::fp_left + $::fp_right)]
    set lb [expr $::grid_bottom + $argM*($::tile_height + $::distance + $::fp_bottom + $::fp_top)]
    set tr [expr $ll + $::tile_width + $::fp_left + $::fp_right]
    set tt [expr $lb + $::tile_height + $::fp_bottom + $::fp_top]

    setObjFPlanBox Module $tile $ll $lb $tr $tt
    # 
    set north north
    set south south
    set east east
    set west west
    
    # increase for north
    set direction_leftright 1 

    # increase for east
    set direction_topdown 1

    set origin_bottom $lb
    set origin_left $ll

    if {[expr $argN%2] == 0} {
	# flip north south
	set north south
	set south north
	set direction_topdown -1

	# decrease for north
	set origin_bottom $tt
    }

    if {[expr $argM%2] == 1} {
	# flip east west
	set east west
	set west east
	# decrease for east
	set direction_leftright -1

	set origin_left $tr
    }

    puts "$tile: $origin_left $origin_bottom"
    # calculate the distance of the pipeline stages to the tile of origin.
    set t_width [expr ($::tile_width + $::distance + $::fp_left + $::fp_right)]
    set t_height [expr ($::tile_height + $::distance + $::fp_bottom + $::fp_top)]

    foreach dir "north south east west" leftright "0 0 -$direction_topdown $direction_topdown" topdown "-$direction_leftright $direction_leftright 0 0" {
	set pl [get_object_name [get_cell pipeline_latch_$dir\_$curM\_$curN\_*]]
	#puts "PL: $pl"
	
	# calculate the direction in which the pipeline stages are 
	# located relative to the origin of the tile where the stage is
	# coming from. (negative: left/down, positive: right/up)

	if {$topdown == 0} {
	    set topdown_dir [expr -$direction_topdown] 
	} else {
	    set topdown_dir [expr $topdown * -$direction_topdown]
	}
	if {$leftright == 0} {
	    set leftright_dir [expr -$direction_leftright]
	} else {
	    set leftright_dir [expr $leftright * -$direction_leftright]
	}

	# move the position of the pipeline stages a bit wider out 
	# for half of the directions to prevent overlapping
	puts "$pl : $dir"
	if {$dir eq "south" } {    
	    set topdown_distance 1
	    set leftright_distance 2
	} elseif {$dir eq "north"} {
	    set topdown_distance 0	    
	    set leftright_distance 1
	}
	if {$dir eq "east" } {
	    set leftright_distance 1
	    set topdown_distance 2
	} elseif {$dir eq "west"} {
	    set leftright_distance 0
	    set topdown_distance 1
	}

	# calculate the position of the pipeline stages for the default case
	set pl_lr1 [expr $origin_left + $leftright * $t_width + $leftright_distance * $leftright_dir * $::pl_width]
	set pl_td1 [expr $origin_bottom + $topdown * $t_height + $topdown_distance * $topdown_dir * $::pl_height]
	set pl_lr2 [expr $origin_left + $leftright * $t_width + ($leftright_distance - 1) * $leftright_dir * $::pl_width]
	set pl_td2 [expr $origin_bottom + $topdown * $t_height + ($topdown_distance - 1) * $topdown_dir * $::pl_height]

	set pl_lowleft [expr min($pl_lr1,$pl_lr2)]
	set pl_lowbottom [expr min($pl_td1, $pl_td2)]
	set pl_highright [expr max($pl_lr1,$pl_lr2)]
	set pl_hightop [expr max($pl_td1, $pl_td2)]

	# place pipeline stage...
	setObjFPlanBox Module $pl $pl_lowleft $pl_lowbottom $pl_highright $pl_hightop

    }
} 

proc pipeline_stage_keepout args {
    # process args
    set direction [lindex $args 0]
    set pl_lr1 [lindex $args 1]
    set pl_lr2 [lindex $args 2]
    set pl_td1 [lindex $args 3]
    set pl_td2 [lindex $args 4]

    # order coordinates
    set pl_lowleft [expr min($pl_lr1,$pl_lr2)]
    set pl_lowbottom [expr min($pl_td1, $pl_td2)]
    set pl_highright [expr max($pl_lr1,$pl_lr2)]
    set pl_hightop [expr max($pl_td1, $pl_td2)]

    set pl_w [expr $pl_highright - $pl_lowleft]
    set pl_h [expr $pl_hightop - $pl_lowbottom]

    # iterate over all possible crossing points
    for {set N 0} {$N <= $::gridN} {incr $N} {
	for {set M 0} {$M <= $::gridM} {incr $M} {
	    set tr [expr $::grid_left + $N*($::tile_width + $::distance + $::fp_left + $::fp_right) + $::tile_width + $::fp_left + $::fp_right]
	    set tt [expr $::grid_bottom + $M*($::tile_height + $::distance + $::fp_bottom + $::fp_top) + $::tile_height + $::fp_bottom + $::fp_top]
	    set ll [expr $tr - $::tile_width + $::fp_left + $::fp_right]
	    set lb [expr $tt - $::tile_height + $::fp_bottom + $::fp_top]

	    if {$pl_lowleft > $ll && $pl_lowleft < $tr} {set viol_left 1} else {set viol_left 0}
	    if {$pl_lowbottom > $lb && $pl_lowbottom < $tt} {set viol_bottom 1} else {set viol_bottom 0}
	    if {$pl_hightop > $lb && $pl_hightop < $tt} {set viol_top 1} else {set viol_top 0}
	    if {$pl_highright > $ll && $pl_highright < $tr} {set viol_right 1} else {set viol_right 0}

	    # it is only a violation when a corner is inside the keepout area:
	    set viol_tl [expr $viol_left * $viol_top]
	    set viol_tr [expr $viol_right * $viol_top]
	    set viol_ll [expr $viol_left * $viol_bottom]
	    set viol_lb [expr $viol_right * $viol_bottom]

	    # count the violations
	    set violations [expr $viol_tl + $viol_tr + $viol_lb + $viol_ll]
	}	
    }
}
