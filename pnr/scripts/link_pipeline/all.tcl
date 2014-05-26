#freeDesign

source stage.tcl

source $stage.globals
#set init_mmmc_file {scripts/tile.view}
init_design
#set_interactive_constraint_modes TT
set_max_time_borrow 0 [get_clocks]
setPreference MinFPModuleSize 10

source ../../../scripts/pnr_settings.tcl
source ../../../scripts/sizes.tcl

loadFPlan $stage.fp.gz

set box [dbGet top.fPlan.box]
set width [lindex $box {0 2}]
set height [lindex $box {0 3}]
set pin_dist 5

if {[dbGet [dbGet -p top.terms.name right_out*].side -i 1] eq "South"} {
    set direction vertical
    cutRow -area 0 0 $width $pin_dist
    cutRow -area 0 [expr $height - $pin_dist] $width $height
    addRing -stacked_via_top_layer AP -around core -jog_distance 2.5 -threshold 2.5 -nets {VDD_DEFAULT GND } -stacked_via_bottom_layer M1 -layer {bottom M7 top M7 right M6 left M6} -width 1 -spacing 1 -offset 0 -skip_side {left right}

    addStripe -block_ring_top_layer_limit M7 -max_same_layer_jog_length 6 -padcore_ring_bottom_layer_limit M5 -set_to_set_distance 100 -stacked_via_top_layer AP -padcore_ring_top_layer_limit M7 -start_from right -spacing 1 -merge_stripes_value 2.5 -layer M6 -block_ring_bottom_layer_limit M5 -width 1 -nets {GND VDD_DEFAULT} -stacked_via_bottom_layer M1
    addStripe -block_ring_top_layer_limit M7 -max_same_layer_jog_length 6 -padcore_ring_bottom_layer_limit M5 -set_to_set_distance 100 -stacked_via_top_layer AP -padcore_ring_top_layer_limit M7 -spacing 1 -merge_stripes_value 2.5 -layer M6 -block_ring_bottom_layer_limit M5 -width 1 -nets {GND VDD_DEFAULT} -stacked_via_bottom_layer M1
} else {
    set direction horizontal
    cutRow -area 0 0 $pin_dist $height
    cutRow -area [expr $width -$pin_dist] 0 $width $height
    addRing -stacked_via_top_layer AP -around core -jog_distance 0 -threshold 2.5 -nets {VDD_DEFAULT GND } -stacked_via_bottom_layer M1 -layer {bottom M7 top M7 right M6 left M6} -width 1 -spacing 1 -offset 0  -skip_side {top bottom}
}







globalNetConnect VDD_DEFAULT -type pgpin -pin vdd -inst *
globalNetConnect VDD_DEFAULT -type tiehi -inst *
globalNetConnect GND -type pgpin -pin gnd -inst *
globalNetConnect GND -type tielo -inst *

sroute -nets { GND VDD_DEFAULT }

addWellTap -cell $ARGO_PNR_WELLTAP_CELL -cellInterval 25 -prefix WELLTAP

setPlaceMode -congEffort high
placeDesign
checkPlace

setOptMode -fixCap true -fixTran true -fixFanoutLoad false
#optDesign -preCTS

setNanoRouteMode -quiet -routeInsertAntennaDiode 0
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail

# post route optimization
setOptMode -fixCap true -fixTran true -fixFanoutLoad false
#optDesign -postRoute
#optDesign -postRoute -hold

addFiller -cell $ARGO_PNR_WELLTAP_CELL -prefix FILLER

saveDesign stage.enc
fit
redraw
