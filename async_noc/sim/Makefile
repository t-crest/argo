#
#	Makefile for ModelSim simulation
#


NOCDIR=../src
NETLISTDIR=../netlists
#OPTIONS=-93 -quiet -check_synthesis -lint -pedanticerrors
OPTIONS=-93 -quiet

ifeq ($(WINDIR),)
	S=:
else
	S=\;
endif

# Use Wine on OSX
# I would like to use a better way, but some shell variables
# are not set within make.... Don't know why...
ifeq ($(TERM_PROGRAM),Apple_Terminal)
	WINE=wine
else
	WINE=
endif


all: clean sim_base
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/noc_n.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/test2_noc2x2.vhd
	$(WINE) vsim -voptargs=+acc -do sim2.do test2_noc2x2

test0: clean sim_base
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/noc_n.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/test0_noc2x2.vhd
	$(WINE) vsim -voptargs=+acc -do sim0.do test0_noc2x2

test1: clean sim_base
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/noc_n.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/test1_noc2x2.vhd
	$(WINE) vsim -voptargs=+acc -do sim1.do test1_noc2x2

test2: clean sim_base
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/noc_n.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/test2_noc2x2.vhd
	$(WINE) vsim -voptargs=+acc -do sim2.do test2_noc2x2

test2_m: clean sim_base
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/noc_n_m.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/test2_noc2x2_m.vhd
	$(WINE) vsim -voptargs=+acc -do sim2_m.do test2_noc2x2

sim_base:
	$(WINE) vlib work
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/noc_defs.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/ocp.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/config.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/noc_interface.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/sr_latch.vhd 
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/c_gate_generic.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/latch_controller.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/channel_latch.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/hpu_comb.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/hpu.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/crossbar.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/crossbar_stage.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/noc_switch.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/bram.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/bram_tdp.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/counter.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/dma.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/nAdapter.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/noc_node.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/txt_util.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/cmd_util.vhd



netlist0: clean synth_base
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/test0_netlist.vhd
	$(WINE) vsim -L CORE65LPHVT -L CORE65LPSVT -sdftyp /test0_noc2x2/noc2x2=/home/piraten/eit-eik/noc/netlists/noc_netlist.sdf -voptargs=+acc -do sim0netlist.do work.test0_noc2x2

netlist1: clean synth_base
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/test1_netlist.vhd
	$(WINE) vsim -L CORE65LPHVT -L CORE65LPSVT -sdftyp /test1_noc2x2/noc2x2=/home/piraten/eit-eik/noc/netlists/noc_netlist.sdf -voptargs=+acc -do sim1netlist.do work.test1_noc2x2

netlist2: clean synth_base
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/bram.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/counter.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/dma.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/nAdapter_flat.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/test2_noc2x2_skew_netlist.vhd
	$(WINE) vsim -L CORE65LPHVT -L CORE65LPSVT -sdftyp /test2_noc2x2/noc2x2=../netlists/noc_netlistFixed.sdf -voptargs=+acc -do sim2netlist.do work.test2_noc2x2

netlist2_nogui: clean synth_base
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/bram.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/counter.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/dma.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/nAdapter_flat.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/test2_noc2x2_skew_netlist.vhd
	$(WINE) vsim -debugdb=debug.dbg -wlf debug.wlf -c -L CORE65LPHVT -L CORE65LPSVT -sdftyp /test2_noc2x2/noc2x2=../netlists/noc_netlistFixed.sdf -voptargs=+acc -do sim2netlist.do work.test2_noc2x2

synth_base:
	$(WINE) vlib work
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/config.vhd
	$(WINE) vcom $(OPTIONS) noc_defs.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/ocp.vhd     
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/noc_interface.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/txt_util.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/cmd_util.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/bram_tdp.vhd
	$(WINE) vlog $(OPTIONS) $(NETLISTDIR)/noc_netlist.v

clean:
	-rm -f transcript
	-rm -f vsim.wlf
	-rm -rf work
