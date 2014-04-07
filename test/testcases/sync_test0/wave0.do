onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /test0_noc2x2/n_clk
add wave -noupdate -format Logic /test0_noc2x2/reset
add wave -noupdate -format Literal /test0_noc2x2/p_masters(0)(0).mcmd
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/p_masters(0)(0).maddr
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/p_masters(0)(0).mdata
add wave -noupdate -format Literal /test0_noc2x2/p_masters(1)(1).mcmd
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/p_masters(1)(1).maddr
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/p_masters(1)(1).mdata
add wave -noupdate -divider NA_0_0
add wave -noupdate -format Literal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__0/node/na/state_cnt
add wave -noupdate -format Literal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__0/node/na/slt_index
add wave -noupdate -format Logic /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__0/node/na/vld_slt
add wave -noupdate -format Literal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__0/node/na/slt_entry
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__0/node/na/dma_entry
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__0/node/ip_to_net
add wave -noupdate -divider Router_0_0
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__0/node/r/inport(0)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__0/node/r/inport(1)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__0/node/r/inport(2)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__0/node/r/inport(3)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__0/node/r/inport(4)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__0/node/r/outport(0)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__0/node/r/outport(1)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__0/node/r/outport(2)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__0/node/r/outport(3)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__0/node/r/outport(4)
add wave -noupdate -divider Router_1_0
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__0/node/r/inport(0)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__0/node/r/inport(1)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__0/node/r/inport(2)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__0/node/r/inport(3)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__0/node/r/inport(4)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__0/node/r/outport(0)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__0/node/r/outport(1)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__0/node/r/outport(2)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__0/node/r/outport(3)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__0/node/r/outport(4)
add wave -noupdate -divider Router_1_1
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__1/node/r/inport(0)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__1/node/r/inport(1)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__1/node/r/inport(2)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__1/node/r/inport(3)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__1/node/r/inport(4)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__1/node/r/outport(0)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__1/node/r/outport(1)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__1/node/r/outport(2)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__1/node/r/outport(3)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__1/node/r/outport(4)
add wave -noupdate -divider Router_0_1
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__1/node/r/inport(0)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__1/node/r/inport(1)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__1/node/r/inport(2)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__1/node/r/inport(3)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__1/node/r/inport(4)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__1/node/r/outport(0)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__1/node/r/outport(1)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__1/node/r/outport(2)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__1/node/r/outport(3)
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__1/node/r/outport(4)
add wave -noupdate -divider NA_1_1
add wave -noupdate -format Literal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__1/node/na/state_cnt
add wave -noupdate -format Literal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__1/node/na/spm_out.mcmd
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__1/node/na/spm_out.maddr
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__1/node/na/spm_out.mdata
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__1/node/na/pkt_in
add wave -noupdate -divider node_1_1
add wave -noupdate -format Literal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__1/node/spm_in.mcmd
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__1/node/spm_in.maddr
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__1/nodes_n__1/node/spm_out.sdata
add wave -noupdate -divider node_0_1
add wave -noupdate -format Literal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__1/node/spm_in.mcmd
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__1/node/spm_in.maddr
add wave -noupdate -format Literal -radix hexadecimal /test0_noc2x2/noc2x2/nodes_m__0/nodes_n__1/node/spm_out.sdata
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {621 ns} 0} {{Cursor 2} {380 ns} 0}
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
WaveRestoreZoom {567 ns} {631 ns}
