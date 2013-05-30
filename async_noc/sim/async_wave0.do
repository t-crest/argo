onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test0_noc2x2/n_clk
add wave -noupdate /test0_noc2x2/reset
add wave -noupdate /test0_noc2x2/p_masters(0)(0).MCmd
add wave -noupdate -radix hexadecimal /test0_noc2x2/p_masters(0)(0).MAddr
add wave -noupdate -radix hexadecimal /test0_noc2x2/p_masters(0)(0).MData
add wave -noupdate /test0_noc2x2/p_spm_masters(0)(1).MCmd
add wave -noupdate -radix hexadecimal /test0_noc2x2/p_spm_masters(0)(1).MAddr
add wave -noupdate -radix hexadecimal /test0_noc2x2/P_spm_slaves(0)(1).SData
add wave -noupdate /test0_noc2x2/p_spm_masters(1)(1).MCmd
add wave -noupdate -radix hexadecimal /test0_noc2x2/p_spm_masters(1)(1).MAddr
add wave -noupdate -radix hexadecimal /test0_noc2x2/P_spm_slaves(1)(1).SData
add wave -noupdate -divider NA_0_0
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/na/state_cnt
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/na/slt_index
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/na/vld_slt
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/na/slt_entry
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/na/dma_entry
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/na/pkt_in
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/na/pkt_out
add wave -noupdate -divider Router_0_0
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/half_clk
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/north_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/north_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/north_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/east_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/east_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/east_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/south_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/south_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/south_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/west_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/west_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/west_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/resource_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/resource_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/resource_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/north_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/north_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/north_out_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/east_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/east_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/east_out_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/south_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/south_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/south_out_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/west_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/west_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/west_out_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/resource_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/resource_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/resource_out_b.ack
add wave -noupdate -divider Router_1_0
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/north_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/north_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/north_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/east_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/east_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/east_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/south_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/south_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/south_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/west_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/west_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/west_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/resource_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/resource_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/resource_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/north_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/north_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/north_out_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/east_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/east_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/east_out_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/south_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/south_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/south_out_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/west_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/west_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/west_out_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/resource_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/resource_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/resource_out_b.ack
add wave -noupdate -divider Router_1_1
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/north_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/north_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/north_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/east_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/east_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/east_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/south_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/south_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/south_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/west_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/west_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/west_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/resource_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/resource_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/resource_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/north_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/north_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/north_out_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/east_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/east_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/east_out_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/south_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/south_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/south_out_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/west_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/west_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/west_out_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/resource_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/resource_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/resource_out_b.ack
add wave -noupdate -divider Router_0_1
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/north_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/north_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/north_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/east_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/east_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/east_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/south_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/south_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/south_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/west_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/west_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/west_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/resource_in_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/resource_in_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/resource_in_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/north_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/north_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/north_out_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/east_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/east_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/east_out_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/south_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/south_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/south_out_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/west_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/west_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/west_out_b.ack
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/resource_out_f.req
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/resource_out_f.data
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/resource_out_b.ack
add wave -noupdate -divider NA_1_1
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/na/na_clk
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/na/state_cnt
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/na/pkt_in
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/na/phitIn
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/na/flit_buf
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/na/spm_out.MCmd
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/na/spm_out.MAddr
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/na/spm_out.MData
add wave -noupdate -divider node_1_1
add wave -noupdate -radix binary /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/spm_out.MCmd
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/spm_out.MAddr
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/spm_in.SData
add wave -noupdate -divider node_0_1
add wave -noupdate /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/spm_out.MCmd
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/spm_out.MAddr
add wave -noupdate -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/spm_in.SData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1279682 ps} 0} {{Cursor 2} {440000 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 124
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
WaveRestoreZoom {1126468 ps} {1378358 ps}
