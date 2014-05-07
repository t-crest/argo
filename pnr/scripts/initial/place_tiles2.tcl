source scripts/placement_util.tcl

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

# Place the tiles
for {set i 0} {$i < $gridN} {incr i} {
    for {set j 0} {$j < $gridM} {incr j} {
	place_tile $i $j
    }
}   

definePartition -hinst noc_tile_no_flip_center_1_1 -coreSpacing 0.0 0.0 0.0 0.0 -railWidth 0.0 -minPitchLeft 2 -minPitchRight 2 -minPitchTop 2 -minPitchBottom 2 -reservedLayer { 1 2 3 4 5 6 7 8} -pinLayerTop { 6 } -pinLayerLeft { 7} -pinLayerBottom { 6 } -pinLayerRight { 7} -placementHalo 0 0 0 0 -routingHalo 0.0 -routingHaloTopLayer 5 -routingHaloBottomLayer 1

definePartition -hinst pipeline_latch_north_1_1_0 -coreSpacing 0.0 0.0 0.0 0.0 -railWidth 0.0 -minPitchLeft 2 -minPitchRight 2 -minPitchTop 2 -minPitchBottom 2 -reservedLayer { 1 2 3 4 5 6 7 8} -pinLayerTop { 6 } -pinLayerLeft { 7} -pinLayerBottom { 6 } -pinLayerRight { 7} -placementHalo 0 0 0 0 -routingHalo 0.0 -routingHaloTopLayer 5 -routingHaloBottomLayer 1

definePartition -hinst pipeline_latch_east_1_1_0 -coreSpacing 0.0 0.0 0.0 0.0 -railWidth 0.0 -minPitchLeft 2 -minPitchRight 2 -minPitchTop 2 -minPitchBottom 2 -reservedLayer { 1 2 3 4 5 6 7 8} -pinLayerTop { 6 } -pinLayerLeft { 7} -pinLayerBottom { 6 } -pinLayerRight { 7} -placementHalo 0 0 0 0 -routingHalo 0.0 -routingHaloTopLayer 5 -routingHaloBottomLayer 1
source scripts/place_pins.tcl

partition


# Place the power domains
for {set iN 0} {$iN < $gridN} {incr iN} {
    for {set jM 0} {$jM < $gridM} {incr jM} {
        set curM [lindex $cols $jM]
	set curN [lindex $rows $iN]
	set tile [get_object_name [get_cell noc_tile_*_$curM\_$curN]]

	set transform ""

	if {[expr $iN % 2] == 0} {
	    flipOrRotateObject -name $tile -flip MX
	    set transform "MX "
	}

	if {[expr $jM%2] == 1 } {
	   flipOrRotateObject -name $tile -flip MY
	    set transform "$transform MY "
	}
	puts "$tile ($iN , $jM): $transform [expr $iN % 2] [expr $jM % 2]" 
    }
}   


