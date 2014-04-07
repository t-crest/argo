# load size definitions
source ../../../scripts/sizes.tcl

loadFPlan tile.fp.gz

# shrink core rows
#set w [lindex [join [dbGet top.fPlan.box]] end-1]
#set h [lindex [join [dbGet top.fPlan.box]] end]

#floorPlan -site CORE -d $w $h $fp_left $fp_bottom $fp_right $fp_top


