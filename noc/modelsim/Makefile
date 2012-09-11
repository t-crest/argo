#
#	Makefile for ModelSim simulation
#


NOCDIR=../src
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


all: clean base
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/test0_noc2x2.vhd
	$(WINE) vsim -do sim.do test0_noc2x2

test0: clean base
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/test0_noc2x2.vhd
	$(WINE) vsim -do sim0.do test0_noc2x2

test1: clean base
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/test1_noc2x2.vhd
	$(WINE) vsim -do sim1.do test1_noc2x2

test2: clean base
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/test2_noc2x2.vhd
	$(WINE) vsim -do sim2.do test2_noc2x2

base:
	$(WINE) vlib work
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/defs.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/bram.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/bram_tdp.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/counter.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/dma.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/nAdapter.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/hpu.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/xbar.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/router.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/noc_node.vhd
	$(WINE) vcom $(OPTIONS) $(NOCDIR)/noc_n.vhd



clean:
	-rm -f transcript
	-rm -f *.wlf
	-rm -rf work
