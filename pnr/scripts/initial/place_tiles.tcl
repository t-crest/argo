
set rows {}
set cols {}

# Generate Positions to map the torus to a 2D surface
# (interleave forward & backwards)
for {set i 0} {$i < [expr ceil($gridN/2.0)]} {incr i} {
    set j [expr $gridN - $i - 1]
    lappend rows $i
    if {$i < $j} { lappend rows $j }
}
for {set i 0} {$i < [expr ceil($gridM/2.0)]} {incr i} {
    set j [expr $gridM - $i - 1]
    lappend cols $i
    if {$i < $j} { lappend cols $j }
}

# Place the tiles
for {set i 0} {$i < $gridN} {incr i} {
    for {set j 0} {$j < $gridM} {incr j} {
        set curM [lindex $cols $j]
	set curN [lindex $rows $i]
	set tile [get_object_name [get_cell noc_tile_*_$curM\_$curN]]

	set ll [expr $grid_left + $i*($tile_width + $distance + $fp_left + $fp_right)]
	set lb [expr $grid_bottom + $j*($tile_height + $distance + $fp_bottom + $fp_top)]
	set tr [expr $ll + $tile_width + $fp_left + $fp_right]
	set tt [expr $lb + $tile_height + $fp_bottom + $fp_top]
	#modifyPowerDomainAttr $PD -box $ll $lb $tr $tt -minGaps $distance $distance $distance $distance
	puts "$tile $ll $lb $tr $tt ([expr $tr-$ll] [expr $tt-$lb])"
	setObjFPlanBox Module $tile $ll $lb $tr $tt
    }
}   

definePartition -hinst noc_tile_no_flip_center_1_1 -coreSpacing 0.0 0.0 0.0 0.0 -railWidth 0.0 -minPitchLeft 2 -minPitchRight 2 -minPitchTop 2 -minPitchBottom 2 -reservedLayer { 1 2 3 4 5 6 7 8} -pinLayerTop { 6 } -pinLayerLeft { 7} -pinLayerBottom { 6 } -pinLayerRight { 7} -placementHalo 0 0 0 0 -routingHalo 0.0 -routingHaloTopLayer 5 -routingHaloBottomLayer 1

source scripts/place_pins.tcl

partition

# Place the power domains

for {set i 0} {$i < $gridN} {incr i} {
    for {set j 0} {$j < $gridM} {incr j} {
        set curM [lindex $cols $j]
	set curN [lindex $rows $i]
	set tile [get_object_name [get_cell noc_tile_*_$curM\_$curN]]

	if {[expr $i%2]} { } else {
	    flipOrRotateObject -name $tile -flip MX
	}

	if {[expr $j%2]} {
	    flipOrRotateObject -name $tile -flip MY
	}
    }
}   


