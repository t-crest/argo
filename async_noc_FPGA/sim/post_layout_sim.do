vlib work
vmap work work
vmap simprim /home/lestat/Programs/Xilinx/14.7/ISE_DS/ISE/vhdl/mti_se/10.1b/lin64/simprim

vcom -work work -2002 -explicit -vopt ../../common/config.vhd
vcom -work work -2002 -explicit -vopt ../../common/math_util.vhd
vcom -work work -2002 -explicit -vopt ../src/noc_defs.vhd
vcom -work work -2002 -explicit -vopt ../../common/ocp_config.vhd
vcom -work work -2002 -explicit -vopt ../../common/ocp.vhd
vcom -work work -2002 -explicit -vopt ../../common/txt_util.vhd
vcom -work work -2002 -explicit -vopt ../../common/bram_tdp.vhd
vcom -work work -2002 -explicit -vopt ../../common/noc_interface.vhd
vcom -work work -2002 -explicit -vopt ../../common/cmd_util.vhd
vcom -work work -2002 -explicit -vopt ../xilinx/netgen/par/self_timed_noc_2x2_timesim.vhd
vcom -work work -2002 -explicit -vopt ../../common/counter.vhd
vcom -work work -2002 -explicit -vopt ../../common/bram.vhd
vcom -work work -2002 -explicit -vopt ../../common/dma.vhd
vcom -work work -2002 -explicit -vopt ../../async_noc/src/nAdapter.vhd
vcom -work work -2002 -explicit -vopt ../src/noc_n_m_POST.vhd
vcom -work work -2002 -explicit -vopt ../src/test2_noc2x2_m.vhd

vsim -sdftyp /test2_noc2x2/noc2x2/routers=../xilinx/netgen/par/self_timed_noc_2x2_timesim.sdf -t ps -novopt work.test2_noc2x2

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test2_noc2x2/reset
add wave -noupdate /test2_noc2x2/n_clk
add wave -noupdate /test2_noc2x2/n_clk_sk
add wave -noupdate -divider spm_interface
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(0).MCmd
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(0).MAddr
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(0).MData
add wave -noupdate -radix hexadecimal /test2_noc2x2/P_spm_slaves(0).SData
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(1).MCmd
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(1).MAddr
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(1).MData
add wave -noupdate -radix hexadecimal /test2_noc2x2/P_spm_slaves(1).SData
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(2).MCmd
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(2).MAddr
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(2).MData
add wave -noupdate -radix hexadecimal /test2_noc2x2/P_spm_slaves(2).SData
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(3).MCmd
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(3).MAddr
add wave -noupdate -radix hexadecimal /test2_noc2x2/p_spm_masters(3).MData
add wave -noupdate -radix hexadecimal /test2_noc2x2/P_spm_slaves(3).SData

run 6000 ns

WaveRestoreZoom {4700 ns} {5200 ns}

