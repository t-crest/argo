# load size definitions
source ../scripts/sizes.tcl

# layout the floorplan 
#floorPlan -site CORE -d [expr $fp_left + $fp_width] [expr $fp_bottom + $fp_height] $fp_left $fp_bottom $fp_right $fp_top

floorPlan -site CORE -d $w $h $grid_left $grid_bottom $grid_right $grid_top

# no rows here, create them later within the partitions
cutRow -area [join [dbGet top.fPlan.box]] 
