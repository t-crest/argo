# input latch
set router_stage1_controller [get_object_name [get_cells r/*_in_latch/controller]]
set router_stage1_controller_en [get_object_name [get_pins r/*_in_latch/controller/lt_en]]

# hpu latch
set router_stage2_controller [get_object_name [get_cells r/*hpu_inst/token_latch/controller]]
set router_stage2_controller_en [get_object_name [get_pins r/*hpu_inst/token_latch/controller/lt_en]]

# crossbar latch
set router_stage3_controller [get_object_name [get_cells r/xbar_with_latches/ch_latch*/controller]]
set router_stage3_controller_en [get_object_name [get_pins r/xbar_with_latches/ch_latch*/controller/lt_en]]

# matched delay between ni & router
set to [get_object_name \
	    [get_pins -of_objects \
		 [get_cells -of_objects \
		      [get_pins -of_object [get_net {ip_to_net_f[REQ]}] -filter pin_direction==out ] \
		 ] \
	     -filter pin_direction==in
	    ] \
       ]\

set from [get_object_name [get_pins -of_object [get_net del_half_clk0] -filter pin_direction==out]]
set_min_delay -from $from -to $to 0.45

# matched delay for request between input latch and hpu latch
set router_delay_1_2_net [get_object_name [get_net r/*hpu_inst/req_n]]
foreach net $router_delay_1_2_net {
    set from [get_pins -of_objects [get_net $net] -filter pin_direction==out]
    set to [get_pins -of_objects [get_net $net] -filter pin_direction==in]
    set_max_delay -from $from -to $to 0.27
    set_min_delay -from $from -to $to 0.22
}

# matched delay for request in xbar
set router_delay_2_3_net [get_object_name [get_net r/xbar_with_latches/crossbar/del]]
foreach net $router_delay_2_3_net {
    set from [get_pins -of_objects [get_net $net] -filter pin_direction==out]
    set to [get_pins -of_objects [get_net $net] -filter pin_direction==in]
    set_max_delay -from $from -to $to 0.18
    set_min_delay -from $from -to $to 0.12
}

# timing constraints for the controller
foreach controller $router_stage2_controller {
    set_max_delay -from $controller/preset -to $controller/r_next_reg/enable 0.04
    set_max_delay -from $controller/Rin -to $controller/r_next_reg/data_in 0.04
    set_min_delay -from $controller/preset -to $controller/r_next_reg/data_in 0.1
}

# break timing_loops

# C-Elements
set_disable_timing r/xbar_with_latches/crossbar/c_sync_req/latch/C9/B
set_disable_timing r/xbar_with_latches/crossbar/c_sync_ack/latch/C9/B

# controller
foreach controller [concat $router_stage1_controller $router_stage2_controller $router_stage3_controller] {
   set_disable_timing $controller/r_next_reg/enable
}

# two phase non overlapping clock definition for timing analysis between the stages
create_clock -name clk1 -period .8 -waveform {.01 .4} [concat $router_stage1_controller_en $router_stage3_controller_en]
create_clock -name clk2 -period .8 -waveform {.41 .8} $router_stage2_controller_en
