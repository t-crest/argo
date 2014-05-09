#########################################################################
# Design Settings
#########################################################################

set design_name tile

#########################################################################
# Dimensions
#########################################################################

# least common multiple of n*0.8 and m*2.6 with n,m natural 
# n = 13
# m = 4
set distance_unit 10.4 

# no of columns & rows
set gridN 4
set gridM 4

# process dependent: height of cell
set cell_height 2.6

# size of the tiles
set tile_width [expr 133 * $distance_unit]
set tile_height [expr 133 * $distance_unit]

set router_width [expr 27 * $distance_unit]
set router_height [expr 18 * $distance_unit]

set na_width [expr 9 * $distance_unit]
set na_height [expr 18 * $distance_unit]

# distance between the tiles
#set distance [expr $cell_height * 10]
set distance [expr $distance_unit * 18]

# floorplan distances (outer margin)
set fp_left [expr $distance_unit * 2]
set fp_bottom [expr $distance_unit * 2]
set fp_right [expr $distance_unit * 2]
set fp_top [expr $distance_unit * 2]
set fp_distance [expr $distance_unit * 2]

# calculate the widths & height
set fp_width [expr $fp_left + $tile_width + $fp_right]
set fp_height [expr $fp_bottom + $tile_height + $fp_left]

# Network channels ###################################

# pin position (distance to left) for north & south
set pin_pos_north_south $distance_unit
# pin position (distance to bottom) for east & west
set pin_pos_east_west $distance_unit

# pin distance
set pin_dist 0.8
# pin width
set pin_width 0.2

# ring outer distance
set ring_outer_distance 15.5

set grid_left 124
set grid_bottom 124

set grid_right 124
set grid_top 124

set grid_width [expr $tile_width + $fp_left + $fp_right]
set grid_height [expr $tile_height + $fp_top + $fp_bottom]

set w [expr $grid_left + $gridN * ($grid_width + $distance) - $distance + $grid_right]
set h [expr $grid_bottom + $gridM * ($grid_height + $distance) - $distance + $grid_top]
 
# link pipeline stages

set pl_height [expr 12 * $cell_height]
set pl_width $pl_height
#10
