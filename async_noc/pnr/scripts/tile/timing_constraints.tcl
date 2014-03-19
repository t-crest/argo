set_interactive_constraint_modes TT

set output_latch_enables [dbGet [dbGet top.terms.net.instTerms .isOutput].inst.instTerms.name *G]
set output_latch_output [dbGet [dbGet top.terms.net.instTerms .isOutput].name]


#create_clock -name clk1 -period 4 -waveform {2 3.8} $output_latch_enables

#set_min_fanout 50 $output_latch_output
set_load -wire_load 1.4 [all_outputs]
#set_fanout_load 1.4 [all_outputs]
set_output_delay 1 [all_outputs] -clock clk2
