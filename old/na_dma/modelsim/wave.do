onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /top3/na_clk
add wave -noupdate -format Literal /top3/na/state_cnt
add wave -noupdate -format Logic /top3/na/slt_en
add wave -noupdate -format Literal /top3/p_ocp_master.mcmd
add wave -noupdate -format Literal -radix hexadecimal /top3/p_ocp_master.maddr
add wave -noupdate -format Literal -radix hexadecimal /top3/p_ocp_master.mdata
add wave -noupdate -format Logic /top3/p_ocp_slave.scmdaccept
add wave -noupdate -format Logic /top3/p_ocp_slave.sresp
add wave -noupdate -format Literal -radix hexadecimal /top3/p_ocp_slave.sdata
add wave -noupdate -format Literal /top3/na/slt_index
add wave -noupdate -format Literal /top3/na/dma_index
add wave -noupdate -format Literal -radix hexadecimal /top3/na/dma_entry
add wave -noupdate -format Literal -radix hexadecimal /top3/na/dma_entry_updated
add wave -noupdate -divider -height 21 DMA
add wave -noupdate -format Literal /top3/na/dma_ren
add wave -noupdate -format Literal /top3/na/dma_raddr
add wave -noupdate -format Literal -radix hexadecimal /top3/na/dma_rdata
add wave -noupdate -format Literal /top3/na/dma_wen
add wave -noupdate -format Literal /top3/na/dma_waddr
add wave -noupdate -format Literal -radix hexadecimal /top3/na/dma_wdata
add wave -noupdate -format Literal /top3/na/dma_table/wen
add wave -noupdate -format Literal -radix hexadecimal /top3/na/dma_table/wdata0
add wave -noupdate -format Literal -radix hexadecimal /top3/na/dma_table/wdata1
add wave -noupdate -format Literal -radix hexadecimal /top3/na/dma_table/wdata2
add wave -noupdate -divider {Network Interface}
add wave -noupdate -format Literal -radix hexadecimal /top3/na/pkt_out
add wave -noupdate -format Literal -radix hexadecimal /top3/na/pkt_in
add wave -noupdate -divider SPM
add wave -noupdate -format Literal /top3/na/spm_out.mcmd
add wave -noupdate -format Literal -radix hexadecimal /top3/na/spm_out.maddr
add wave -noupdate -format Literal -radix hexadecimal /top3/na/spm_out.mdata
add wave -noupdate -format Literal -radix hexadecimal /top3/na/spm_in.sdata
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {90 ns} 0} {{Cursor 2} {110 ns} 0}
configure wave -namecolwidth 174
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
WaveRestoreZoom {635 ns} {703 ns}
