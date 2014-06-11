#freeDesign

set PNR_DIR ../

set dir $PNR_DIR/scripts/libs/stooop
source $PNR_DIR/scripts/libs/stooop/pkgIndex.tcl

package require stooop
namespace import stooop::*

source $PNR_DIR/scripts/initial/grid_classes.tcl
source $PNR_DIR/scripts/initial/a_star.tcl
source $PNR_DIR/scripts/initial/layout_utils.tcl

source ../scripts/sizes.tcl

#show the pipeline links as well
setPreference MinFPModuleSize 10

# load design config
source scripts/load_design.tcl

# floorplanning
source scripts/floorplan.tcl
#saveDesign floorplanned.enc

# fix missing vias etc. while keeping the handrouting
ecoRoute -modifyOnlyLayers 6:7

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
setNanoRouteMode -quiet -routeEcoOnlyInLayers 4:7
routeDesign -globalDetail

# tile placement 
#source scripts/place_tiles2.tcl

# hand route tile interconnection
setPtnPinStatus * * fixed


# partitioning
savePartition -lib -dir ./partitions -def -pt
