#freeDesign

# load design config
source scripts/load_design.tcl
source ../../../scripts/pnr_settings.tcl

# Set some extra timing constraints for the boundary interface
source scripts/timing_constraints.tcl

# Floorplanning
source scripts/floorplan.tcl

# power domain setup
source scripts/power_domains.tcl
fit
redraw

source scripts/power_planning.tcl
fit
redraw

saveDesign post_power.enc

# special routing for vdd/gnd connections
source scripts/sroute.tcl
fit
redraw

set output_nets [dbGet [dbGet top.terms .isOutput].net.name]

foreach net $output_nets {
    #addBufferForFeedthrough -powerDomain PD_noc_switch -net $net -suffix "WIRE_DRIVER" -cell $ARGO_PNR_NOC_WIRE_BUF
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
source scripts/route.tcl

#routeDesign

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
