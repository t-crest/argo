# cleanup
remove_design [get_designs]

analyze -library WORK -format vhdl {vhdl/ocp.vhd vhdl/noc_defs.vhd vhdl/config.vhd vhdl/noc_interface.vhd vhdl/sr_latch.vhd vhdl/c_gate_generic.vhd vhdl/latch_controller.vhd vhdl/channel_latch.vhd vhdl/hpu_comb.vhd vhdl/crossbar.vhd vhdl/hpu.vhd vhdl/crossbar_stage.vhd vhdl/noc_switch.vhd vhdl/bram.vhd  vhdl/counter.vhd vhdl/dma.vhd vhdl/fifo.vhd vhdl/noc_node_fifos.vhd  vhdl/noc_skew_beside.vhd }
#vhdl/nAdapter.vhd 
elaborate NOC -architecture STRUCT -library WORK -update

#uniquify

write -hierarchy -format ddc -output unmapped_unconstrained.ddc


