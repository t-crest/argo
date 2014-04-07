#
#	Makefile for ModelSim simulation
#

# Project Root
ARGO_PROJECT_DIR=..

# VHDL source dir
SRCDIR=$(ARGO_PROJECT_DIR)/src

# Test cases & test bench
TESTDIR=$(ARGO_PROJECT_DIR)/test

export TESTDIR

#OPTIONS=-93 -quiet -check_synthesis -lint -pedanticerrors
OPTIONS=-93 -quiet

ifeq ($(WINDIR),)
	S=:
else
	S=\;
endif

# mainly for OS X: try to use wine if modelsim is not in path...
VCOM_AVAILABLE := $(shell which vcom 2> /dev/null; echo $$?)
ifeq ($(VCOM_AVAILABLE), 1)
	PREFIX=wine
else
	PREFIX=
endif

####################################################################
# default rule:

all: help


####################################################################
# Test cases now reside in their own subdirectory each with a make 
# config.mk file which is included here. For adding new test cases
# add a new directory there create a config.mk file defining test 
# targets for this testcase. Every target created MUST start wit the
# name of the test case which MUST be the directory name to prevent
# collisions with other test cases.


# TESTCASES to include
TESTCASES=$(shell find $(TESTDIR)/testcases/*/config.mk)
include $(TESTCASES)

help: help_prefix $(TESTCASE_DESCRIPTIONS)

help_prefix:
	@echo "####################################################################"
	@echo " ARGO noc simulation and testcases "
	@echo "####################################################################"
	@echo 
	@echo "The following testcases are available:"



####################################################################
# VHDL Compilation

.PHONY: ocp noc_defs utils mem ni_common ni_sync ni_async router_sync router_async noc_sync noc_async tile noc_tiled noc_tiled_swap traffic_generators work autotest clean

# structured groups, ordered to fulfil the dependencies in the vhdl code base 


ocp:
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/ocp/ocp_config.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/ocp/ocp.vhd

noc_defs: utils ocp work/config/_primary.dat
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc_defs.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc_interface.vhd

utils:
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/util/txt_util.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/util/math_util.vhd

mem: noc_defs
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/mem/bram.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/mem/bram_tdp.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/mem/single_spm.vhd

ni_common: noc_defs mem
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/ni/counter.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/ni/dma.vhd

ni_sync: ni_common mem
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/ni/synchronous/nAdapter.vhd

ni_async: ni_common mem
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/ni/asynchronous/nAdapter.vhd

router_sync: ni_sync
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/synchronous/hpu.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/synchronous/xbar.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/synchronous/router.vhd

router_async: ni_async
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/sr_latch.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/c_gate_generic.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/latch_controller.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/channel_latch.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/fifo.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/hpu_latch.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/hpu_comb.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/hpu.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/crossbar.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/crossbar_stage.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/router.vhd

noc_sync: router_sync
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/synchronous/noc_node.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/synchronous/noc_n.vhd

noc_async: router_async
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/asynchronous/noc_node.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/asynchronous/noc_n.vhd


tile: router_async traffic_generators
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/tiled/tile.vhd

noc_tiled: tile
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/tiled/tiled_noc_noswap.vhd

noc_tiled_swap: tile
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/tiled/tiled_noc_swap.vhd

traffic_generators:
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/tiled/tile_package.vhd
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/util/cmd_util.vhd
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/util/traffic_generator_package.vhd
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/util/traffic_generator.vhd

work:
	rm -rf work
	$(PREFIX) vlib work

####################################################################
$(AUTO_TEST): clean

autotest: $(AUTO_TEST)

####################################################################
# generate schedule from xml
all_to_all.sched: bitorus2x2.xml
	../../../local/bin/poseidon -p $< -m GREEDY -s sched.xml
	../../../local/bin/poseidon-conv sched.xml $@ Source-Phase-text 2

####################################################################
# cleanup
clean:
	-rm -f transcript
	-rm -rf work

-include config.mk
