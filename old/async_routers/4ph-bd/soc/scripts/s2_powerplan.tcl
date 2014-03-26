clearGlobalNets
globalNetConnect VDD -type pgpin -pin vdd -inst *
globalNetConnect VDD -type tiehi -pin vdd -inst *
globalNetConnect GND -type pgpin -pin gnd -inst *
globalNetConnect GND -type tielo -pin gnd -inst *
addRing -spacing_bottom 2 -width_left 3 -width_bottom 3 -width_top 3 -spacing_top 2 -layer_bottom M7 -stacked_via_top_layer AP -width_right 3 -around core -jog_distance 2.5 -offset_bottom 2.5 -layer_top M7 -threshold 2.5 -offset_left 2.5 -spacing_right 2 -spacing_left 2 -offset_right 2.5 -offset_top 2.5 -layer_right M6 -nets {GND VDD } -stacked_via_bottom_layer M1 -layer_left M6
addStripe -block_ring_top_layer_limit M7 -max_same_layer_jog_length 6 -padcore_ring_bottom_layer_limit M5 -set_to_set_distance 50 -stacked_via_top_layer AP -padcore_ring_top_layer_limit M7 -spacing 2 -xleft_offset 30 -xright_offset 30 -merge_stripes_value 2.5 -layer M6 -block_ring_bottom_layer_limit M5 -width 3 -nets {GND VDD } -stacked_via_bottom_layer M1
redraw
fit