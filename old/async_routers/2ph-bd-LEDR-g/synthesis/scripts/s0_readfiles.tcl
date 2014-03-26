analyze -library WORK -format vhdl {/home/piraten/eit-eik/r2p/src/defs.vhd /home/piraten/eit-eik/r2p/src/sr_latch.vhd /home/piraten/eit-eik/r2p/src/c_gate.vhd /home/piraten/eit-eik/r2p/src/c_gate_generic.vhd /home/piraten/eit-eik/r2p/src/select_element.vhd /home/piraten/eit-eik/r2p/src/latch_controller.vhd /home/piraten/eit-eik/r2p/src/channel_latch.vhd /home/piraten/eit-eik/r2p/src/bundled2LEDR.vhd /home/piraten/eit-eik/r2p/src/hpu_comb.vhd /home/piraten/eit-eik/r2p/src/crossbar.vhd /home/piraten/eit-eik/r2p/src/hpu.vhd /home/piraten/eit-eik/r2p/src/crossbar_stage.vhd /home/piraten/eit-eik/r2p/src/LEDR2bundled.vhd /home/piraten/eit-eik/r2p/src/noc_switch.vhd}

elaborate NOC_SWITCH -architecture STRUCT -library WORK -parameters "x =0 , y =0 " -update

#uniquify

#write -hierarchy -format ddc -output /home/piraten/eit-eik/r2p/synopsys/db/unmapped_unconstrained.ddc


