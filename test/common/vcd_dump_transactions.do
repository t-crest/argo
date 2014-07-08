set toggle_analysis 0

# setup: three vcd files for the three simulation steps
vcd files noc_init.vcd.gz
vcd files noc_traffic.vcd.gz 
vcd files noc_memdump.vcd.gz
set fp [open noc_simulation_timestamps.tcl w]

# save everything
vcd add -file noc_init.vcd.gz -r /tiled_noc_tb/DUT/*
vcd add -file noc_traffic.vcd.gz -r /tiled_noc_tb/DUT/*
vcd add -file noc_memdump.vcd.gz -r /tiled_noc_tb/DUT/*

# wait for the starting time 
vcd off noc_init.vcd.gz
vcd off noc_traffic.vcd.gz
vcd off noc_memdump.vcd.gz

set valid_count 0
set toggle_count 0

# skip signals while on reset
when {/tiled_noc_tb/reset == '0'} {
    vcd on noc_init.vcd.gz
    puts $fp "set reset_done \{$now\}"
    set valid_count 0
    set toggle_count 0
}

# this signal is raised when all DMAs have been programmed
when {/traffic_generator_package/TG_SYNC_DMA == 'H'} {
     vcd off noc_init.vcd.gz
     vcd flush noc_init.vcd.gz
     vcd on noc_traffic.vcd.gz
    puts $fp "set init_done \{$now\}"
    # reset toggle data
    set valid_count 0
    set toggle_count 0
    # count the total number of toggles on the request wires and the amount of toggles with set valid bit
    if {$toggle_analysis == 1} {
	foreach dir {north south east west} {
	    set i 0
	    for {set base 0} {$base < 16 * 36} {set base [expr $base + 36]} {
		set label $dir\_$i
		set request [expr $base + 35]
		set valid [expr $base + 34]
		set signal /tiled_noc_tb/DUT/$dir\_in_f_p\($request\)
		set valid_signal /tiled_noc_tb/DUT/$dir\_in_f_p\($valid\)
		when -label $label "$signal'event" { incr toggle_count }
		when -label $label\_vld "$signal'event and $valid_signal = 1" { incr valid_count }
		incr i
	    }
	}
    }
}



# this signal is rised when all DMAs are done sending Data over the noc
when {/traffic_generator_package/TG_TRANSFER_DONE == 'H'} {
     vcd off noc_traffic.vcd.gz
     vcd flush noc_traffic.vcd.gz
     vcd on noc_memdump.vcd.gz
    puts $fp "set transfer_done \{$now\}"
    puts $fp "set v_toggle $valid_count"
    puts $fp "set all_toggle $toggle_count"
}

# this signal is rised when all the spm data has been dumped
when {/traffic_generator_package/TG_SIMULATION_DONE == 'H'} {
     vcd off noc_memdump.vcd.gz
     vcd flush noc_memdump.vcd.gz
    puts $fp "set simulation_done \{$now\}"
    close $fp
}
