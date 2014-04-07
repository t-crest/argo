onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /noc_tb/n_clk
add wave -noupdate /noc_tb/reset
add wave -noupdate -divider spm_interface
add wave -noupdate -radix hexadecimal /noc_tb/p_spm_masters(0)(0).MCmd
add wave -noupdate -radix hexadecimal /noc_tb/p_spm_masters(0)(0).MAddr
add wave -noupdate -radix hexadecimal /noc_tb/p_spm_masters(0)(0).MData
add wave -noupdate -radix hexadecimal /noc_tb/p_spm_slaves(0)(0).SData
add wave -noupdate -radix hexadecimal /noc_tb/p_spm_masters(0)(1).MCmd
add wave -noupdate -radix hexadecimal /noc_tb/p_spm_masters(0)(1).MAddr
add wave -noupdate -radix hexadecimal /noc_tb/p_spm_masters(0)(1).MData
add wave -noupdate -radix hexadecimal /noc_tb/p_spm_slaves(0)(1).SData
add wave -noupdate -radix hexadecimal /noc_tb/p_spm_masters(1)(0).MCmd
add wave -noupdate -radix hexadecimal /noc_tb/p_spm_masters(1)(0).MAddr
add wave -noupdate -radix hexadecimal /noc_tb/p_spm_masters(1)(0).MData
add wave -noupdate -radix hexadecimal /noc_tb/p_spm_slaves(1)(0).SData
add wave -noupdate -radix hexadecimal /noc_tb/p_spm_masters(1)(1).MCmd
add wave -noupdate -radix hexadecimal /noc_tb/p_spm_masters(1)(1).MAddr
add wave -noupdate -radix hexadecimal /noc_tb/p_spm_masters(1)(1).MData
add wave -noupdate -radix hexadecimal /noc_tb/p_spm_slaves(1)(1).SData
add wave -noupdate -divider proc_interface
add wave -noupdate /noc_tb/p_masters(0)(0).MCmd
add wave -noupdate -radix hexadecimal /noc_tb/p_masters(0)(0).MAddr
add wave -noupdate -radix hexadecimal /noc_tb/p_masters(0)(0).MData
add wave -noupdate /noc_tb/p_slaves(0)(0).SResp
add wave -noupdate -radix hexadecimal /noc_tb/p_slaves(0)(0).SData
add wave -noupdate /noc_tb/p_masters(0)(1).MCmd
add wave -noupdate -radix hexadecimal /noc_tb/p_masters(0)(1).MAddr
add wave -noupdate -radix hexadecimal /noc_tb/p_masters(0)(1).MData
add wave -noupdate /noc_tb/p_slaves(0)(1).SResp
add wave -noupdate -radix hexadecimal /noc_tb/p_slaves(0)(1).SData
add wave -noupdate /noc_tb/p_masters(1)(0).MCmd
add wave -noupdate -radix hexadecimal /noc_tb/p_masters(1)(0).MAddr
add wave -noupdate -radix hexadecimal /noc_tb/p_masters(1)(0).MData
add wave -noupdate /noc_tb/p_slaves(1)(0).SResp
add wave -noupdate -radix hexadecimal /noc_tb/p_slaves(1)(0).SData
add wave -noupdate /noc_tb/p_masters(1)(1).MCmd
add wave -noupdate -radix hexadecimal /noc_tb/p_masters(1)(1).MAddr
add wave -noupdate -radix hexadecimal /noc_tb/p_masters(1)(1).MData
add wave -noupdate /noc_tb/p_slaves(1)(1).SResp
add wave -noupdate -radix hexadecimal /noc_tb/p_slaves(1)(1).SData
add wave -noupdate -divider NI_00
add wave -noupdate /noc_tb/noc2x2/n_clk
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/na/state_cnt
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/na/slt_entry
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/na/dma_entry
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/na/pkt_out
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/na/pkt_in
add wave -noupdate -divider NI_01
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/na/state_cnt
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/na/dma_entry
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/na/pkt_out
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/na/pkt_in
add wave -noupdate -divider NI_10
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/na/state_cnt
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/na/dma_entry
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/na/pkt_out
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/na/pkt_in
add wave -noupdate -divider NI_11
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/na/state_cnt
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/na/dma_entry
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/na/pkt_out
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/na/pkt_in
add wave -noupdate -divider R_00
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/north_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/north_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/north_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/east_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/east_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/east_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/south_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/south_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/south_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/west_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/west_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/west_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/resource_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/resource_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/resource_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/north_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/north_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/north_out_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/east_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/east_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/east_out_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/south_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/south_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/south_out_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/west_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/west_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/west_out_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/resource_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/resource_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/r/resource_out_b.ack
add wave -noupdate -divider R_01
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/north_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/north_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/north_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/east_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/east_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/east_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/south_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/south_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/south_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/west_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/west_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/west_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/resource_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/resource_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/resource_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/north_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/north_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/north_out_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/east_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/east_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/east_out_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/south_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/south_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/south_out_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/west_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/west_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/west_out_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/resource_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/resource_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(1)/node/r/resource_out_b.ack
add wave -noupdate -divider R_10
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/north_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/north_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/north_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/east_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/east_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/east_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/south_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/south_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/south_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/west_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/west_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/west_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/resource_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/resource_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/resource_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/north_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/north_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/north_out_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/east_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/east_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/east_out_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/south_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/south_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/south_out_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/west_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/west_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/west_out_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/resource_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/resource_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(0)/node/r/resource_out_b.ack
add wave -noupdate -divider R_11
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/north_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/north_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/north_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/east_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/east_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/east_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/south_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/south_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/south_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/west_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/west_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/west_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/resource_in_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/resource_in_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/resource_in_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/north_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/north_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/north_out_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/east_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/east_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/east_out_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/south_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/south_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/south_out_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/west_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/west_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/west_out_b.ack
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/resource_out_f.req
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/resource_out_f.data
add wave -noupdate /noc_tb/noc2x2/nodes_m(1)/nodes_n(1)/node/r/resource_out_b.ack
add wave -noupdate -divider NI_0_0
add wave -noupdate /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/na/spm_out.MCmd
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/na/spm_out.MAddr
add wave -noupdate -radix hexadecimal /noc_tb/noc2x2/nodes_m(0)/nodes_n(0)/node/na/spm_out.MData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {580500 ps} 0}
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
WaveRestoreZoom {1138001 ps} {1394001 ps}
