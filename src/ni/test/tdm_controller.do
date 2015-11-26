delete wave *
restart -f


##########################################################
# Setup waves
##########################################################

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate tdm_controller/clk
add wave -noupdate tdm_controller/reset

add wave -noupdate tdm_controller/run
add wave -noupdate tdm_controller/master_run

add wave -noupdate -hexadecimal tdm_controller/stbl_idx
add wave -noupdate tdm_controller/stbl_idx_en

add wave -noupdate tdm_controller/config

add wave -noupdate -hexadecimal tdm_controller/time2next_reg

add wave -noupdate tdm_controller/MASTER_RUN_REG

wave refresh


##########################################################
# Force signals
##########################################################

force tdm_controller/clk 0 0ns , 1 5ns -repeat 10ns
force tdm_controller/reset 1 0ns , 0 40 ns

force tdm_controller/run 0 0ns
force tdm_controller/sel 0 0ns

force tdm_controller/t2n 10#5 0ns

force tdm_controller/config.addr 10#0 0ns
force tdm_controller/config.en 0 0ns
force tdm_controller/config.wr 0 0ns
force tdm_controller/config.wdata 10#0 0ns



run 1000ns
