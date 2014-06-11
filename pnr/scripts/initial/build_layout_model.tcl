# This file builds up the data model used to derive the layout from
# Since this model is also used during synthesis, all commands used 
# have to be compatible to TCL 8.4 used in design compiler
 
source $PNR_DIR/scripts/sizes.tcl

# compatibility for tcl 8.4 in design compiler
if {[info command lreverse] == ""} {
    proc lreverse list {
        set res {}
        set i [llength $list]
        while {$i} {
            lappend res [lindex $list [incr i -1]]
        }
        set res
    } ;# RS
}

# set up the grid
set horiz {}
set verti {}

set htype {}
set vtype {}

set tracks {}
set track_num 3
set pin_width 0.8
# set the track width to the next larger integer number of distance_unit
#set factor $cell_height
set factor $distance_unit
set trackwidth [expr 2*ceil(36*$pin_width/$factor)*$factor]
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

# get all paths
set paths [::layout_utils::get_node_paths $grid]
# create a routing for the paths
set routes [::layout_utils::route_node_paths $paths]
grid::svg_dump $grid layout_path_route.svg null
# map pipelinestages to the routed paths
set pipeline_stages [::layout_utils::map_pipeline_stages $routes]
grid::svg_dump $grid layout_placed_pipeline_stages.svg null

