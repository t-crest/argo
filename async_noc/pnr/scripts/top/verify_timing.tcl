file mkdir report
set f [open report/overview_report.txt w]
set node [get_object_name [get_cells noc_tile_*0_0]]
set l {}

foreach dir {north east south west resource} {
    # get input latch > hpu latch
    set input_latch [get_object_name [get_cells $node/r/$dir\_in_latch/*_reg*]]
    set input_latch_req [get_object_name [get_pins $node/r/$dir\_in_latch/controller/r_next_reg/G]]
    set il "Input_Latch:$dir"
    lappend il $input_latch
    lappend il $input_latch_req
    lappend l $il
}

foreach dir {north east south west resource} {
    # get hpu latch > xbar latch
    set token_latch [get_object_name [get_cells $node/r/$dir\_hpu_inst/token_latch/*_reg*]]
    set token_latch_req [get_object_name [get_pins $node/r/$dir\_hpu_inst/token_latch/controller/r_next_reg/G]]
    set tl "HPU_Latch:$dir" 
    lappend tl $token_latch 
    lappend tl $token_latch_req
    lappend l $tl
}

# get global links
foreach node [get_object_name [get_cells noc_tile*]] {
    foreach ch_latch {ch_latch_0 ch_latch_1 ch_latch_2 ch_latch_3} {
	set latch [get_object_name [get_cells $node/r/xbar_with_latches/$ch_latch/*_reg*]]
	set latch_req [get_object_name [get_pins $node/r/xbar_with_latches/$ch_latch/controller/r_next_reg/G]]
	set t "$node:$ch_latch"
	lappend t $latch 
	lappend t $latch_req	
        lappend l $t
    }
}

foreach startpoint $l {
    set str [lindex $startpoint 0]
    set latch [lindex $startpoint 1]
    set req [lindex $startpoint 2]
    set dels {}
    set max 0
    set min 10000000
    set max_cell_start ""
    set min_cell_start ""
    set max_cell_stop ""
    set min_cell_stop ""

    report_timing -from $req -unconstrained -nworst 1 > report/$str\_raw.txt
    set del_req [join [lindex [report_timing -from $req -unconstrained -nworst 1 -tcl_list] end end end end end end end]]
    report_timing -from $latch -nworst 1000 >> report/$str\_raw.txt

    foreach path [lrange [report_timing -from $latch -nworst 1000 -tcl_list] 1 end] {
	set arr {}
	set cel {}

	foreach row [lrange [lindex $path end end end] 1 end] {
	    lappend arr [lindex $row 1 end-1]
	    lappend cel [lindex $row 1 0]
	}

	set del [expr [lindex $arr end] - [lindex $arr 0]]

	set start [lindex $cel 0]
	set stop [lindex $cel end]

	if {$del > $max} { 
	    set max $del
	    set max_cell_start $start
	    set max_cell_stop $stop 
	}
	if {$del < $min} { 
	    set min $del
	    set min_cell_start $start
	    set min_cell_stop $stop
	}
    }
    
    puts $f "Start: $str"
    puts $f "Min: $min ($min_cell_start -> $min_cell_stop)"
    puts $f "Max: $max ($max_cell_start -> $max_cell_stop)"
    if {$del_req < $max} {
	puts $f "Req: $del_req < $max (VIOLATED)"
    } else {
	puts $f "Req: $del_req (MET)"
    }
}

close $f
