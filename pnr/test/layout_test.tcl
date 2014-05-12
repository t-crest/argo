#!/bin/sh
# -*- tcl -*-
# The next line is executed by /bin/sh, but not tcl \
exec tclsh "$0" ${1+"$@"}

source ../scripts/initial/layout.tcl
source ../scripts/sizes.tcl

set horiz {}
set verti {}

set htype {}
set vtype {}

set tracks {}
set track_num 6
set trackwidth [expr 35*$pin_width]
set track_t {}
for {set i 0} {$i < $track_num } {incr i} {
    lappend tracks $trackwidth
    lappend track_t track
}


lappend horiz $tracks
lappend verti $tracks

lappend htype $track_t
lappend vtype $track_t


for {set i 0} {$i < $gridN} {incr i} {
    lappend horiz $grid_width
    lappend htype tile
    if {$i < [expr $gridN - 1]} {
       lappend horiz $tracks
       lappend htype $track_t
    }
}

for {set i 0} {$i < $gridM} {incr i} {
    lappend verti $grid_height
    lappend vtype tile
    if {$i < [expr $gridM - 1]} {
       lappend verti $tracks
       lappend vtype $track_t
    }
}

lappend horiz $tracks
lappend verti $tracks

lappend htype $track_t
lappend vtype $track_t

set foo [new grid [join $horiz] [join $verti] [join $htype] [join $vtype]]
set g [grid::get_grid $foo]

set node [lindex $g end end]
grid_element::print $node 

puts [grid_element::get_box $node]
puts [grid::get_box $foo]
puts "$w $h"
puts $horiz
puts $htype
puts $verti
puts $vtype
grid::svg_dump $foo test3.svg
grid::~grid $foo