# load size definitions
source ../scripts/sizes.tcl

# layout the floorplan 
#floorPlan -site CORE -d [expr $fp_left + $fp_width] [expr $fp_bottom + $fp_height] $fp_left $fp_bottom $fp_right $fp_top


setResizeFPlanMode -snapToTrack false

# create the data model used to place and route the design
source scripts/build_layout_model.tcl

# grid build, lets set the floorplan to size
floorPlan -site CORE -d [grid::get_fplan $grid]

# no rows here, we create them later within the partitions 
# (prevents unwanted realignment of the tiles to the row grid)
cutRow -area [join [dbGet top.fPlan.box]] 

# place tiles
foreach tile [join [grid::get_tile_grid $grid]] {
    set M [tile::get_tileM $tile]
    set N [tile::get_tileN $tile]
    set t [get_object_name [get_cell noc_tile_*_$M\_$N]]
    setObjFPlanBoxList Module $t [grid_element::get_box $tile]
}

# place pipeline stages
set cell_type_list {}
foreach stage [join $pipeline_stages] {
    set name_forward [pipeline_stage::get_name_forward $stage]
    set name_backward [pipeline_stage::get_name_backward $stage]
    setObjFPlanBoxList Module $name_forward [pipeline_stage::get_box_forward $stage]
    setObjFPlanBoxList Module $name_backward [pipeline_stage::get_box_backward $stage]
    lappend cell_type_list "[dbGet [dbGet top.hinst.hInsts.name $name_forward -p].cell.name] $name_forward"
    lappend cell_type_list "[dbGet [dbGet top.hinst.hInsts.name $name_backward -p].cell.name] $name_backward"
}
# get a tuple of an instance and a cell type for each pipeline stage
set cell_type_list [lsort -unique -index 0 $cell_type_list]


# partition design
definePartition -hinst noc_tile_no_flip_center_1_1 -coreSpacing 0.0 0.0 0.0 0.0 -railWidth 0.0 -minPitchLeft 2 -minPitchRight 2 -minPitchTop 2 -minPitchBottom 2 -reservedLayer { 1 2 3 4 5 6 7 8} -pinLayerTop { 6 } -pinLayerLeft { 7} -pinLayerBottom { 6 } -pinLayerRight { 7} -placementHalo 0 0 0 0 -routingHalo 0.0 -routingHaloTopLayer 5 -routingHaloBottomLayer 1

foreach ct $cell_type_list {
    set instance [lindex $ct end]
    definePartition -hinst $instance -coreSpacing 0.0 0.0 0.0 0.0 -railWidth 0.0 -minPitchLeft 2 -minPitchRight 2 -minPitchTop 2 -minPitchBottom 2 -reservedLayer { 1 2 3 4 5 6 7 8} -pinLayerTop { 6 } -pinLayerLeft { 7} -pinLayerBottom { 6 } -pinLayerRight { 7} -placementHalo 0 0 0 0 -routingHalo 0.0 -routingHaloTopLayer 5 -routingHaloBottomLayer 1
}


partition


foreach tile [join [grid::get_tile_grid $grid]] {
    set name [tile::get_tile_name $tile]
    set orient [tile::orientation $tile]
    if {$orient eq "MX" || $orient eq "MY"} {
	flipOrRotateObject -flip $orient -name $name
    } elseif {$orient eq "R180"} {
	flipOrRotateObject -rotate $orient -name $name
    }
    #dbSet [dbGet top.insts.name $name -p].orient [tile::orientation $tile]
}



# place pins
foreach ct $cell_type_list {
    set cell_type [lindex $ct 0]
    set db_cell [dbGet top.insts.cell.name $cell_type -p -i 1]
    set left_pins [lreverse [dbGet $db_cell.terms.name *left*]]
    set right_pins [lreverse [dbGet $db_cell.terms.name *right*]]
    set s [expr $trackwidth/2]
    if {[regexp {link_pipeline_1_.*} $cell_type]} {
	editPin -cell $cell_type -pinWidth 0.4 -pinDepth 1.415 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Left -layer 7 -spreadType start -spacing 0.8 -start 0 0 -pin $left_pins
	editPin -cell $cell_type -pinWidth 0.4 -pinDepth 1.415 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 7 -spreadType start -spacing 0.8 -start 0 0 -pin $right_pins
    } else {
	editPin -cell $cell_type -pinWidth 0.4 -pinDepth 1.415 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 7 -spreadType start -spacing 0.8 -start 0.8 $s -pin $left_pins
	editPin -cell $cell_type -pinWidth 0.4 -pinDepth 1.415 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Bottom -layer 7 -spreadType start -spacing 0.8 -start 0.8 $s -pin $right_pins
    }
}

#breakhere


source scripts/place_pins.tcl

foreach stage [join $pipeline_stages] {
    set name [::pipeline_stage::get_swap_name $stage]
    set type_string [grid_element::get_type [::pipeline_stage::get_parent $stage]]
    if {$type_string eq "track_h"} {
	flipOrRotateObject -flip MY -name $name
    } else {
	flipOrRotateObject -flip MX -name $name
    }
}

source scripts/hand_route_util.tcl
set pipeline_stage_routes {}
foreach path $pipeline_stages {
    set p_routes {} 
    foreach stage $path {
	lappend p_routes [pipeline_stage::get_route_to $stage]
    }
    lappend p_routes [pipeline_stage::get_route_from $stage]
    lappend pipeline_stage_routes $p_routes
} 


set routing_steps {}
foreach path $pipeline_stage_routes {
    set path_directions {}
    foreach route $path {
	set directions {}
	set prev [lindex $route 0]
	
	foreach node [lrange $route 1 end] {
	    if {[classof $prev] eq [classof $node] && [classof $node] eq "::pipeline_stage" } {
		if {[pipeline_stage::get_left $prev] < [pipeline_stage::get_left $node]} {
		    lappend directions RIGHT
		} elseif { [pipeline_stage::get_left $prev] > [pipeline_stage::get_left $node]} {
		    lappend directions LEFT
		} elseif { [pipeline_stage::get_bottom $prev] < [pipeline_stage::get_bottom $node]} {
		    lappend directions UP
		} elseif { [pipeline_stage::get_bottom $prev] > [pipeline_stage::get_bottom $node]} {
		    lappend directions DOWN
		}
	    } else {
		if {[classof $prev] eq "::pipeline_stage"} {
		    set prev [pipeline_stage::get_parent $prev]
		}	 
		if {[classof $node] eq "::pipeline_stage"} {
		    set node [pipeline_stage::get_parent $node]
		} 

		if {[grid_element::get_south $node] eq $prev || [grid_element::get_north $prev] eq $node } {
		    lappend directions UP
		} elseif { [grid_element::get_north $node] eq $prev || [grid_element::get_south $prev] eq $node  } {
		    lappend directions DOWN
		} elseif { [grid_element::get_east $node] eq $prev  || [grid_element::get_west $prev] eq $node } {
		    lappend directions LEFT
		} elseif { [grid_element::get_west $node] eq $prev  || [grid_element::get_east $prev] eq $node } {
		    lappend directions RIGHT
		} 
	    }
	    set prev $node
	}
	lappend path_directions $directions
    }
    lappend routing_steps $path_directions
}

set inst {}
set foo {}
foreach path $pipeline_stage_routes path_directions $routing_steps {
    set path_router_instruction {}
    foreach route $path route_directions $path_directions {
	set router_instructions {}
	set start [lindex $route 0]
	set end [lindex $route end]
        
	set i 0

	set simplified_route {}
	set simplified_instr {}
	set direction [lindex $route_directions 0]
	set prev_direction null
	set prev_node $start
	foreach node [lrange $route 1 end] direction [lrange $route_directions 0 end] {
	    if {$i > 0} {
		if {$direction ne $prev_direction} {
		    lappend simplified_route $prev_node
		    lappend simplified_instr $prev_direction
		}
	    }
	    set prev_node $node
	    set prev_direction $direction
	    #puts $node
	    #puts $direction
	    incr i
	}
	lappend simplified_route $prev_node
	lappend simplified_instr $prev_direction

	lappend foo $simplified_instr

	    if {[llength $simplified_route] == 1} {
		lappend router_instructions "DIRECT"
	    } elseif {[llength $simplified_route] == 2} {
		lappend router_instructions "[lindex $simplified_instr 0] *"
	    } else {
		foreach node [lrange $simplified_route 0 end-2] instr [lrange $simplified_instr 0 end-2] {
		    if {$instr eq "RIGHT"} {
			set dist [lindex [grid_element::get_box $node] 0]
		    } elseif {$instr eq "LEFT"} {
			set dist [lindex [grid_element::get_box $node] 2]
		    } elseif {$instr eq "UP"} {
			set dist [lindex [grid_element::get_box $node] 1]
		    } elseif {$instr eq "DOWN"} {
			set dist [lindex [grid_element::get_box $node] 3]
		    }
		    lappend router_instructions "$instr $dist ABSOLUTE"
		}
		lappend router_instructions "[lindex $simplified_instr end-1] *"
	    }

	lappend path_router_instruction $router_instructions
    }
    lappend inst $path_router_instruction
}

foreach path $pipeline_stage_routes path_instruction $inst {
    foreach route $path route_instruction $path_instruction {
	set start [lindex $route 0]
	set next [lindex $route 1]
	if {[classof $start] eq "::tile"} {
	    set tile [dbGet -p top.insts.name [tile::get_tile_name $start]]
	    if {[tile::get_tile_port_east $start] eq $next} {
		set direction east
	    } elseif {[tile::get_tile_port_west $start] eq $next} {
		set direction west
	    } elseif {[tile::get_tile_port_north $start] eq $next} {
		set direction north
	    } else {
		set direction south
	    }

	    set pins [dbGet $tile.instTerms.name *$direction\* -p]

	    step_route_stack [step_plan_route $pins $route_instruction]
	} else {
	    set pins [join [pipeline_stage::get_forward_pins $start]]
	    step_route_stack [step_plan_route $pins $route_instruction DEBUG]
	}
    }
}


breakhere
