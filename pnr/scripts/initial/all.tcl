#freeDesign

source ../scripts/initial/layout.tcl
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
breakhere
# hand route tile interconnection
set routes {}
source scripts/hand_route_edges.tcl  
source scripts/hand_route_tiles.tcl

# partitioning
savePartition -lib -dir ./partitions -def -pt
