#freeDesign

# load design config
source scripts/load_design.tcl
source scripts/timing_constraints.tcl
source ../../../scripts/pnr_settings.tcl

# floorplanning
source scripts/floorplan.tcl
fit
redraw
# pad distance setup
#source scripts/place_pads.tcl

# power domain setup
source scripts/power_domains.tcl
fit
redraw

source scripts/power_planning.tcl
fit
redraw
# create output buffers
#source scripts/output_buffers.tcl

saveDesign post_power.enc
fit
redraw
# special routing for vdd/gnd connections
source scripts/sroute.tcl
fit
redraw
# place the IO pins & create sdp groups for the input & output latches
#source scripts/place_pins.tcl
fit
redraw

#setObjFPlanBox RplGroup sdp_south 24.62 31.562 35.42 109.162
#setObjFPlanBox RplGroup sdp_north 24.787 132.016 33.787 219.616
#setObjFPlanBox RplGroup sdp_west 25.586 21.158 100.586 28.958
#setObjFPlanBox RplGroup sdp_east 178.281 21.158 254.881 28.958

set output_nets [dbGet [dbGet top.terms .isOutput].net.name]

foreach net $output_nets {
    addBufferForFeedthrough -powerDomain PD_noc_switch -net $net -suffix "WIRE_DRIVER" -cell $ARGO_PNR_NOC_WIRE_BUF
}

# place
source scripts/place.tcl
fit
redraw
# level shifter sroute
#source scripts/sroute_ls.tcl

saveDesign post_place.enc

# clock tree synthesis
source scripts/clock_tree.tcl
saveDesign post_cts.enc

# route
#source scripts/route.tcl

routeDesign

# delete the keepout zones
# selectRouteBlk defLayerBlkName
# deleteSelectedFromFPlan
# selectRouteBlk defLayerBlkName
# deleteSelectedFromFPlan
# selectRouteBlk defLayerBlkName
# deleteSelectedFromFPlan
# selectRouteBlk defLayerBlkName
# deleteSelectedFromFPlan
# selectRouteBlk defLayerBlkName
# deleteSelectedFromFPlan

saveDesign tile.enc
fit
redraw
