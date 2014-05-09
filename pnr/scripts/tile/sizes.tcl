#########################################################################
# Design Settings
#########################################################################

set design_name tile

#########################################################################
# Dimensions
#########################################################################

# no of columns & rows
set N 1
set M 1

# process dependent: height of cell
set cell_height 2.6

# size of the tiles
set tile_width [expr 520 * $cell_height]
set tile_height [expr 520 * $cell_height]

set router_width [expr 90 * $cell_height]
set router_height [expr 70 * $cell_height]

set na_width [expr 30 * $cell_height]
set na_height [expr 70 * $cell_height]

# distance between the tiles
set distance [expr $cell_height * 10]

# floorplan distances (outer margin)
set fp_left 88.6
set fp_bottom 88.6
set fp_right 88.6
set fp_top 88.6

# calculate the widths & height
set fp_width [expr $fp_left + $N * $tile_width + ($N - 1) * $distance]
set fp_height [expr $fp_bottom + $M * $tile_height +($M - 1) * $distance]

# Network channels ###################################

# pin position (distance to left) for north & south
set pin_pos_north_south 1.4
# pin position (distance to bottom) for east & west
set pin_pos_east_west 1.4

# pin distance
set pin_dist 0.8
# pin width
set pin_width 0.1

# ring outer distance
set ring_outer_distance 15.5

