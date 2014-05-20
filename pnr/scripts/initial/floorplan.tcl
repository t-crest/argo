# load size definitions
source ../scripts/sizes.tcl

# layout the floorplan 
#floorPlan -site CORE -d [expr $fp_left + $fp_width] [expr $fp_bottom + $fp_height] $fp_left $fp_bottom $fp_right $fp_top




# set up the grid
set horiz {}
set verti {}

set htype {}
set vtype {}

set tracks {}
set track_num 3
set pin_width 0.8
set trackwidth [expr 2*35*$pin_width]
set pipeline_stage_length [expr 0.5*$trackwidth]
set track_t {}

# inner tracks
for {set i 0} {$i < $track_num } {incr i} {
    lappend tracks $trackwidth
    lappend track_t track
}

# single outside tracks (left/bottom)
lappend horiz $tracks
lappend verti $tracks

lappend htype $track_t
lappend vtype $track_t

# create the tiles and place tracks inbetween (horizontal)
for {set i 0} {$i < $gridN} {incr i} {
    lappend horiz $grid_width
    lappend htype tile
    if {$i < [expr $gridN - 1]} {
       lappend horiz $tracks
       lappend htype $track_t
    }
}
# create the tiles and place tracks inbetween (vertical)
for {set i 0} {$i < $gridM} {incr i} {
    lappend verti $grid_height
    lappend vtype tile
    if {$i < [expr $gridM - 1]} {
       lappend verti $tracks
       lappend vtype $track_t
    }
}

# single outside tracks (right/top)
lappend horiz $tracks
lappend verti $tracks

lappend htype $track_t
lappend vtype $track_t

# build up grid
set grid [new grid [join $horiz] [join $verti] [join $htype] [join $vtype]]
grid::svg_dump $grid layout_initial.svg null

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

# get all paths
set paths [::layout_utils::get_node_paths $grid]
# create a routing for the paths
set routes [::layout_utils::route_node_paths $paths]
grid::svg_dump $grid layout_path_route.svg null
# map pipelinestages to the routed paths
set pipeline_stages [::layout_utils::map_pipeline_stages $routes]
grid::svg_dump $grid layout_placed_pipeline_stages.svg null

# place pipeline stages
foreach stage [join $pipeline_stages] {
    setObjFPlanBoxList Module [pipeline_stage::get_name_forward $stage] [pipeline_stage::get_box_forward $stage]
    setObjFPlanBoxList Module [pipeline_stage::get_name_backward $stage] [pipeline_stage::get_box_backward $stage]
}





# partition design
breakhere
definePartition -hinst noc_tile_no_flip_center_1_1 -coreSpacing 0.0 0.0 0.0 0.0 -railWidth 0.0 -minPitchLeft 2 -minPitchRight 2 -minPitchTop 2 -minPitchBottom 2 -reservedLayer { 1 2 3 4 5 6 7 8} -pinLayerTop { 6 } -pinLayerLeft { 7} -pinLayerBottom { 6 } -pinLayerRight { 7} -placementHalo 0 0 0 0 -routingHalo 0.0 -routingHaloTopLayer 5 -routingHaloBottomLayer 1

partition

# place pins
#source scripts/place_pins.tcl
