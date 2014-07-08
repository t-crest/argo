#freeDesign

# load design config
source scripts/load_design.tcl

set PNR_DIR ../
source $PNR_DIR/scripts/pnr_settings.tcl

set dir $PNR_DIR/scripts/libs/stooop
source $PNR_DIR/scripts/libs/stooop/pkgIndex.tcl

package require stooop
namespace import stooop::*

source scripts/grid_classes.tcl
source scripts/a_star.tcl
source scripts/layout_utils.tcl

source ../scripts/sizes.tcl

#show the pipeline links as well
setPreference MinFPModuleSize 10



# floorplanning
source scripts/floorplan.tcl
#saveDesign floorplanned.enc

# fix missing vias etc. while keeping the handrouting
ecoRoute -modifyOnlyLayers 3:7

# route clock & reset
deselectAll
selectNet reset
selectNet n_clk

setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
setNanoRouteMode -quiet -routeEcoOnlyInLayers 3:7
routeDesign -globalDetail

# tile placement 
#source scripts/place_tiles2.tcl

# hand route tile interconnection
setPtnPinStatus * * fixed


# partitioning
savePartition -lib -dir ./partitions -def -pt
