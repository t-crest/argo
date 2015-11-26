delete wave *
restart -f


##########################################################
# Setup waves
##########################################################

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate irq_fifo/clk
add wave -noupdate irq_fifo/reset

add wave -noupdate irq_fifo/config
add wave -noupdate irq_fifo/sel
add wave -noupdate irq_fifo/config_slv

add wave -noupdate irq_fifo/irq_irq_sig
add wave -noupdate irq_fifo/irq_irq_fifo_data
add wave -noupdate irq_fifo/irq_irq_fifo_data_valid

add wave -noupdate irq_fifo/irq_data_sig
add wave -noupdate irq_fifo/irq_data_fifo_data
add wave -noupdate irq_fifo/irq_data_fifo_data_valid


wave refresh


##########################################################
# Force signals
##########################################################

force irq_fifo/clk 0 0ns , 1 5ns -repeat 10ns
force irq_fifo/reset 1 0ns , 0 40 ns




run 1000ns
