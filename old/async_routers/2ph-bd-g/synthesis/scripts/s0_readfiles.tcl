analyze -library WORK -format vhdl {/home/piraten/eit-eik/r2p-bd/src/defs.vhd /home/piraten/eit-eik/r2p-bd/src/sr_latch.vhd /home/piraten/eit-eik/r2p-bd/src/c_gate.vhd /home/piraten/eit-eik/r2p-bd/src/c_gate_generic.vhd /home/piraten/eit-eik/r2p-bd/src/latch_controller.vhd /home/piraten/eit-eik/r2p-bd/src/channel_latch.vhd /home/piraten/eit-eik/r2p-bd/src/hpu_comb.vhd /home/piraten/eit-eik/r2p-bd/src/crossbar.vhd /home/piraten/eit-eik/r2p-bd/src/hpu.vhd /home/piraten/eit-eik/r2p-bd/src/crossbar_stage.vhd /home/piraten/eit-eik/r2p-bd/src/noc_switch.vhd}

elaborate NOC_SWITCH -architecture STRUCT -library WORK -parameters "x =0 , y =0 " -update

#uniquify

write -hierarchy -format ddc -output /home/piraten/eit-eik/r2p-bd/synthesis/db/unmapped_unconstrained.ddc


