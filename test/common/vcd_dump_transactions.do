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

# skip signals while on reset
when {/tiled_noc_tb/reset == '0'} {
    vcd on noc_init.vcd.gz
    puts $fp "set reset_done \{$now\}"
}

# this signal is raised when all DMAs have been programmed
when {/traffic_generator_package/TG_SYNC_DMA == 'H'} {
     vcd off noc_init.vcd.gz
     vcd flush noc_init.vcd.gz
     vcd on noc_traffic.vcd.gz
    puts $fp "set init_done \{$now\}"
}

# this signal is rised when all DMAs are done sending Data over the noc
when {/traffic_generator_package/TG_TRANSFER_DONE == 'H'} {
     vcd off noc_traffic.vcd.gz
     vcd flush noc_traffic.vcd.gz
     vcd on noc_memdump.vcd.gz
    puts $fp "set transfer_done \{$now\}"
}

# this signal is rised when all the spm data has been dumped
when {/traffic_generator_package/TG_SIMULATION_DONE == 'H'} {
     vcd off noc_memdump.vcd.gz
     vcd flush noc_memdump.vcd.gz
    puts $fp "set simulation_done \{$now\}"
    close $fp
}
