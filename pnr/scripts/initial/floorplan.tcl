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

# find all paths - each one, starting from each tile
set path_from_to {}
foreach tile [join [grid::get_tile_grid $grid]] {
    lappend path_from_to "[tile::get_tile_port_east $tile ] [tile::get_tile_port_east_target $tile]"
    lappend path_from_to "[tile::get_tile_port_west $tile ] [tile::get_tile_port_west_target $tile]"
    lappend path_from_to "[tile::get_tile_port_north $tile ] [tile::get_tile_port_north_target $tile]"
    lappend path_from_to "[tile::get_tile_port_south $tile ] [tile::get_tile_port_south_target $tile]"
}

# the path ar biderectional, so we will find each one twice - sort all pairs...
set path_from_to_sorted_tupels {}
foreach tupel $path_from_to {lappend path_from_to_sorted_tupels [lsort $tupel]}

# ... and get rid of the double ones
set path_from_to_unique [lsort -unique -index 0 $path_from_to_sorted_tupels]

# to minimize congestion we want to route the simple pathes first:
# [row or column identical]
set simple_pathes {}
set complex_pathes {}
foreach path $path_from_to_unique {
    set a [lindex $path 0]
    set b [lindex $path 1]
    if {[grid_element::get_col $a] eq [grid_element::get_col $b] || [grid_element::get_row $a] eq [grid_element::get_row $b]} {
	lappend simple_pathes $path 
    } else {
	lappend complex_pathes $path
    }
} 

set i 0

set routed_pathes {}
foreach f [concat $simple_pathes $complex_pathes] {
    # inherit the color from the starting port
    set c [grid_element::get_color [lindex $f 0]]
    set path [a_star::a_star [lindex $f 0] [lindex $f 1]]
    foreach setp $path {
	if {$setp eq [lindex $f 0] || $setp eq [lindex $f 1]} {continue}
	grid_element::set_color $setp $c
    }
    lappend routed_pathes $path 
    incr i
}

grid::svg_dump $grid layout_path_route.svg null

# partition design
breakhere
definePartition -hinst noc_tile_no_flip_center_1_1 -coreSpacing 0.0 0.0 0.0 0.0 -railWidth 0.0 -minPitchLeft 2 -minPitchRight 2 -minPitchTop 2 -minPitchBottom 2 -reservedLayer { 1 2 3 4 5 6 7 8} -pinLayerTop { 6 } -pinLayerLeft { 7} -pinLayerBottom { 6 } -pinLayerRight { 7} -placementHalo 0 0 0 0 -routingHalo 0.0 -routingHaloTopLayer 5 -routingHaloBottomLayer 1

partition

# place pins
#source scripts/place_pins.tcl
