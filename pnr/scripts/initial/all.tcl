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

# tile placement 
#source scripts/place_tiles2.tcl

# hand route tile interconnection
setPtnPinStatus * * fixed


# partitioning
savePartition -lib -dir ./partitions -def -pt
