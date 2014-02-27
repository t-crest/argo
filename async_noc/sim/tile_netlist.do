# procedure to format controllers niceley
radix define controller_handshake {2'b00 "idle" -color {Gold}, 2'b11 "idle" -color {Gold}, 2'b01 "req" -color {Cyan}, 2'b10 "req" -color {Cyan}}
proc addControllerWave args {
    set path [lindex $args 0]
    set commands [lindex $args 1]
    
    if {[llength [find instance $path]] > 0} {
	virtual signal -env $path/controller {(concat_range (1 downto 0))(Rin & Ain)} input
	virtual signal -env $path/controller {(concat_range (1 downto 0))(Rout & Aout)} output
	eval "add wave -noupdate $commands -radix controller_handshake $path/controller/input"
	eval "add wave -noupdate $commands -radix controller_handshake $path/controller/output"
	eval "add wave -noupdate $commands -color {Gray90} $path/controller/lt_en"
    } else { 
	echo "Skipping $path - not found."
    }
}

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tiled_noc_tb/clk
add wave -noupdate /tiled_noc_tb/reset
add wave -noupdate -divider spm_interface
add wave -noupdate -group spm_p -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(0)/noc_tile/p_spm_master.MCmd
add wave -noupdate -group spm_p -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(0)/noc_tile/p_spm_master.MAddr
add wave -noupdate -group spm_p -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(0)/noc_tile/p_spm_master.MData
add wave -noupdate -group spm_p -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(0)/noc_tile/p_spm_slave.SData
add wave -noupdate -group spm_p -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(1)/noc_tile/p_spm_master.MCmd
add wave -noupdate -group spm_p -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(1)/noc_tile/p_spm_master.MAddr
add wave -noupdate -group spm_p -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(1)/noc_tile/p_spm_master.MData
add wave -noupdate -group spm_p -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(1)/noc_tile/p_spm_slave.SData
add wave -noupdate -group spm_p -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(0)/noc_tile/p_spm_master.MCmd
add wave -noupdate -group spm_p -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(0)/noc_tile/p_spm_master.MAddr
add wave -noupdate -group spm_p -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(0)/noc_tile/p_spm_master.MData
add wave -noupdate -group spm_p -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(0)/noc_tile/p_spm_slave.SData
add wave -noupdate -group spm_p -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(1)/noc_tile/p_spm_master.MCmd
add wave -noupdate -group spm_p -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(1)/noc_tile/p_spm_master.MAddr
add wave -noupdate -group spm_p -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(1)/noc_tile/p_spm_master.MData
add wave -noupdate -group spm_p -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(1)/noc_tile/p_spm_slave.SData
add wave -noupdate -divider n_spm_interface
add wave -noupdate -group spm_n -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(0)/noc_tile/n_spm_master.MCmd
add wave -noupdate -group spm_n -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(0)/noc_tile/n_spm_master.MAddr
add wave -noupdate -group spm_n -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(0)/noc_tile/n_spm_master.MData
add wave -noupdate -group spm_n -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(0)/noc_tile/n_spm_slave.SData
add wave -noupdate -group spm_n -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(1)/noc_tile/n_spm_master.MCmd
add wave -noupdate -group spm_n -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(1)/noc_tile/n_spm_master.MAddr
add wave -noupdate -group spm_n -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(1)/noc_tile/n_spm_master.MData
add wave -noupdate -group spm_n -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(1)/noc_tile/n_spm_slave.SData
add wave -noupdate -group spm_n -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(0)/noc_tile/n_spm_master.MCmd
add wave -noupdate -group spm_n -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(0)/noc_tile/n_spm_master.MAddr
add wave -noupdate -group spm_n -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(0)/noc_tile/n_spm_master.MData
add wave -noupdate -group spm_n -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(0)/noc_tile/n_spm_slave.SData
add wave -noupdate -group spm_n -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(1)/noc_tile/n_spm_master.MCmd
add wave -noupdate -group spm_n -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(1)/noc_tile/n_spm_master.MAddr
add wave -noupdate -group spm_n -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(1)/noc_tile/n_spm_master.MData
add wave -noupdate -group spm_n -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(1)/noc_tile/n_spm_slave.SData

add wave -noupdate -divider proc_interface
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(0)/noc_tile/p_master.MCmd
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(0)/noc_tile/p_master.MAddr
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(0)/noc_tile/p_master.MData
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(0)/noc_tile/p_slave.SData
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(0)/noc_tile/p_slave.SResp
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(1)/noc_tile/p_master.MCmd
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(1)/noc_tile/p_master.MAddr
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(1)/noc_tile/p_master.MData
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(1)/noc_tile/p_slave.SData
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(1)/noc_tile/p_slave.SResp
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(0)/noc_tile/p_master.MCmd
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(0)/noc_tile/p_master.MAddr
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(0)/noc_tile/p_master.MData
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(0)/noc_tile/p_slave.SData
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(0)/noc_tile/p_slave.SResp
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(1)/noc_tile/p_master.MCmd
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(1)/noc_tile/p_master.MAddr
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(1)/noc_tile/p_master.MData
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(1)/noc_tile/p_slave.SData
add wave -noupdate -group proc -radix hexadecimal /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(1)/noc_tile/p_slave.SResp

add wave -noupdate -divider nodes
set nodes {nodes_m(0)/nodes_n(0)/noc_tile nodes_m(0)/nodes_n(1)/noc_tile nodes_m(1)/nodes_n(0)/noc_tile nodes_m(1)/nodes_n(1)/noc_tile}
set pf /tiled_noc_tb/DUT/
foreach node $nodes {
    add wave -expand -group $node -expand -group "na" "$pf$node/na/na_clk" "$pf$node/na/state_cnt" "$pf$node/na/slt_entry" "$pf$node/na/flit_buf"
    add wave -expand -group $node -expand -group "na" -radix hexadecimal  "$pf$node/na/pkt_in" "$pf$node/na/pkt_out"

    foreach port {north east south west resource} {
	foreach direction { in out } {
	    foreach elem {.req .data(34) .data(33) .data(32) .data(0) } {
		add wave -group $node -expand -group "r" -expand -group $port -expand "$pf$node/r/$port\_$direction\_f$elem "
	    }
	}
    }
    
    add wave -group $node\_trace_hpu -noupdate $pf$node/na/na_clk
    add wave -group $node\_trace_hpu -noupdate -divider NA
    add wave -group $node\_trace_hpu -noupdate -label type $pf$node/na/pkt_out\[34\]
    add wave -group $node\_trace_hpu -noupdate -label sop $pf$node/na/pkt_out\[33\]
    add wave -group $node\_trace_hpu -noupdate -label eop $pf$node/na/pkt_out\[32\]
    add wave -group $node\_trace_hpu -noupdate -divider INPUT_FIFO

    if {[llength [find instance test2_noc2x2/noc2x2/$node/input_fifo/latch_stage_0]] > 0} {
	addControllerWave "test2_noc2x2/noc2x2/$node/input_fifo/latch_stage_0" "-group $node\_trace_hpu"
	add wave -group $node\_trace_hpu -noupdate -label type_in "$pf$node/input_fifo/left_in\[DATA\]\[34\] "
	add wave -group $node\_trace_hpu -noupdate -label sop_in "$pf$node/input_fifo/left_in\[DATA\]\[33\] "
	add wave -group $node\_trace_hpu -noupdate -label eop_in "$pf$node/input_fifo/left_in\[DATA\]\[32\] "
	add wave -group $node\_trace_hpu -noupdate -label type_out "$pf$node/input_fifo/right_out\[DATA\]\[34\] "
	add wave -group $node\_trace_hpu -noupdate -label sop_out "$pf$node/input_fifo/right_out\[DATA\]\[33\] "
	add wave -group $node\_trace_hpu -noupdate -label eop_out "$pf$node/input_fifo/right_out\[DATA\]\[32\] "
    }

    add wave -group $node\_trace_hpu -noupdate -divider RESOURCE_IN_LATCH
    addControllerWave "$pf$node/r/input_latches/resource_in_latch" "-group $node\_trace_hpu"
    add wave -group $node\_trace_hpu -noupdate -label type_out "$pf$node/r/input_latches/resource_in_latch/right_out.data(34) "
    add wave -group $node\_trace_hpu -noupdate -label sop_out "$pf$node/r/input_latches/resource_in_latch/right_out.data(33) "
    add wave -group $node\_trace_hpu -noupdate -label eop_out "$pf$node/r/input_latches/resource_in_latch/right_out.data(32) "
    add wave -group $node\_trace_hpu -noupdate -divider HPU
    add wave -group $node\_trace_hpu -noupdate -label type $pf$node/r/hpus/resource_hpu_inst/hpu_combinatorial/data_in(34)
    add wave -group $node\_trace_hpu -noupdate -label sop $pf$node/r/hpus/resource_hpu_inst/hpu_combinatorial/data_in(33)
    add wave -group $node\_trace_hpu -noupdate -label eop $pf$node/r/hpus/resource_hpu_inst/hpu_combinatorial/data_in(32)
    add wave -group $node\_trace_hpu -noupdate -label data_valid $pf$node/r/hpus/resource_hpu_inst/hpu_combinatorial/data_valid
    #add wave -group $node\_trace_hpu -noupdate -label latch_enable $pf$node/r/hpus/resource_hpu_inst/hpu_combinatorial/N19
    add wave -group $node\_trace_hpu -noupdate "$pf$node/r/hpus/resource_hpu_inst/hpu_combinatorial/data_in\[0\] "
    add wave -group $node\_trace_hpu -noupdate "$pf$node/r/hpus/resource_hpu_inst/hpu_combinatorial/data_in\[1\] "
    add wave -group $node\_trace_hpu -noupdate "$pf$node/r/hpus/resource_hpu_inst/hpu_combinatorial/sel\[0\] "
    add wave -group $node\_trace_hpu -noupdate "$pf$node/r/hpus/resource_hpu_inst/hpu_combinatorial/sel\[2\] "
    add wave -group $node\_trace_hpu -noupdate -divider TokenLatch
    addControllerWave "$pf$node/r/hpus/resource_hpu_inst/resource_port/token_latch" "-group $node\_trace_hpu"


}




TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {560447 ps} 0} {{Cursor 2} {1820364 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {2756800 ps} {3012800 ps}
