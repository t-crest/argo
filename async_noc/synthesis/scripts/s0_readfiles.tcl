analyze -library WORK -format vhdl {/home/piraten/eit-eik/noc/src/defs.vhd /home/piraten/eit-eik/noc/src/sr_latch.vhd /home/piraten/eit-eik/noc/src/c_gate_generic.vhd /home/piraten/eit-eik/noc/src/latch_controller.vhd /home/piraten/eit-eik/noc/src/channel_latch.vhd /home/piraten/eit-eik/noc/src/hpu_comb.vhd /home/piraten/eit-eik/noc/src/crossbar.vhd /home/piraten/eit-eik/noc/src/hpu.vhd /home/piraten/eit-eik/noc/src/crossbar_stage.vhd /home/piraten/eit-eik/noc/src/noc_switch.vhd /home/piraten/eit-eik/noc/src/bram.vhd  /home/piraten/eit-eik/noc/src/counter.vhd /home/piraten/eit-eik/noc/src/dma.vhd /home/piraten/eit-eik/noc/src/nAdapter.vhd /home/piraten/eit-eik/noc/src/noc_node.vhd  /home/piraten/eit-eik/noc/src/noc_n.vhd }

elaborate NOC -architecture STRUCT -library WORK -update

#uniquify

write -hierarchy -format ddc -output /home/piraten/eit-eik/noc/synthesis/db/unmapped_unconstrained.ddc


