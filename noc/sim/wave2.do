onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /test2_noc2x2/n_clk
add wave -noupdate -format Logic /test2_noc2x2/reset
add wave -noupdate -format Literal /test2_noc2x2/p_masters(0).MCmd
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/p_masters(0).MAddr
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/p_masters(0).MData
add wave -noupdate -divider NA_0_0
add wave -noupdate -format Literal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/na/state_cnt
add wave -noupdate -format Literal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/na/slt_index
add wave -noupdate -format Logic /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/na/vld_slt
add wave -noupdate -format Literal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/na/dma_index
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/na/dma_entry
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/ip_to_net
add wave -noupdate -divider Router_0_0
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/inport_f(0)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/inport_f(1)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/inport_f(2)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/inport_f(3)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/inport_f(4)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/outport_f(0)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/outport_f(1)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/outport_f(2)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/outport_f(3)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/r/outport_f(4)
add wave -noupdate -divider Router_0_1
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/inport_f(0)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/inport_f(1)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/inport_f(2)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/inport_f(3)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/inport_f(4)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/outport_f(0)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/outport_f(1)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/outport_f(2)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/outport_f(3)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/r/outport_f(4)
add wave -noupdate -divider Router_1_0
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/inport_f(0)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/inport_f(1)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/inport_f(2)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/inport_f(3)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/inport_f(4)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/outport_f(0)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/outport_f(1)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/outport_f(2)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/outport_f(3)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/r/outport_f(4)
add wave -noupdate -divider Router_1_1
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/inport_f(0)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/inport_f(1)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/inport_f(2)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/inport_f(3)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/inport_f(4)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/outport_f(0)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/outport_f(1)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/outport_f(2)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/outport_f(3)
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/r/outport_f(4)
add wave -noupdate -divider NA_0_0
add wave -noupdate -format Literal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/na/state_cnt
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(0)/node/na/pkt_in
add wave -noupdate -divider node_0_0
add wave -noupdate -format Literal /test2_noc2x2/noc2x2/spm_ports_m(0).MCmd
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/spm_ports_m(0).MAddr
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/spm_ports_s(0).SData
add wave -noupdate -divider NA_1_0
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(0)/node/na/pkt_in
add wave -noupdate -divider node_1_0
add wave -noupdate -format Literal /test2_noc2x2/noc2x2/spm_ports_m(2).MCmd
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/spm_ports_m(2).MAddr
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/spm_ports_s(2).SData
add wave -noupdate -divider NA_0_1
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(0)/nodes_n(1)/node/na/pkt_in
add wave -noupdate -divider node_0_1
add wave -noupdate -format Literal /test2_noc2x2/noc2x2/spm_ports_m(1).MCmd
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/spm_ports_m(1).MAddr
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/spm_ports_s(1).SData
add wave -noupdate -divider NA_1_1
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/nodes_m(1)/nodes_n(1)/node/na/pkt_in
add wave -noupdate -divider node_1_1
add wave -noupdate -format Literal /test2_noc2x2/noc2x2/spm_ports_m(3).MCmd
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/spm_ports_m(3).MAddr
add wave -noupdate -format Literal -radix hexadecimal /test2_noc2x2/noc2x2/spm_ports_s(3).SData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {640 ns} 0} {{Cursor 2} {520 ns} 0}
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
update
WaveRestoreZoom {554 ns} {618 ns}
