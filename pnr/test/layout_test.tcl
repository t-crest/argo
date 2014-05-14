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

set grid_width 50
set grid_height 50

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
set tg [grid::get_tile_grid $foo]
set node [lindex $g 6 0]


puts $tg

puts [grid_element::get_box $node]
puts [grid::get_box $foo]
puts "$w $h"
puts $horiz
puts $htype
puts $verti
puts $vtype

set node [lindex $g 6 3]
puts [grid_element::get_height $node ]
set el [grid_element::split_vertical $node {5 5} "top"]
puts [grid_element::get_height $node ]
puts $el
foreach e $el {
    puts "#$e"
    grid_element::print $e
}
set node [lindex $g 3 6]
puts [grid_element::get_width $node ]
set el [grid_element::split_horizontal $node {5 5} "left"]
puts [grid_element::get_width $node ]
puts $el
foreach e $el {
    puts "#$e"
    grid_element::print $e
}

foreach node [join [grid::get_tile_grid $foo]] {
  #tile::print $node  
}



grid::svg_dump $foo test3.svg null
grid::~grid $foo


set node1 [lindex $g 0 0]
set node2 [lindex $g end end]

set path [a_star $node1 $node2]

puts "Routing done ($node2 -> $node1)"
puts $path
grid::svg_dump $foo path.svg $path
