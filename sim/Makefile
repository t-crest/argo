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

#FPGA simulation libraries paths
# The xilinx environment variable is set after the xilinx tools
# have been initialized, so run 
# 	source <path to installation>/ISE_DS/settings64.sh
# before trying to simulate.
SECUREIPPATH=$(XILINX)/verilog/mti_se/10.1b/lin64
UNISIMPATH=$(XILINX)/vhdl/mti_se/10.1b/lin64
SIMPRIMPATH=$(XILINX)/vhdl/mti_se/10.1b/lin64


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

noc_defs: utils ocp
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc_defs.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc_interface.vhd
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/util/wiretap_package.vhd
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/util/wiretap.vhd

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
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/ni/nAdapter.vhd

ni_async: ni_common mem
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/ni/nAdapter.vhd

router_sync: ni_sync
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/synchronous/hpu.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/synchronous/xbar.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/synchronous/router.vhd

router_async: ni_async
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/latch_controller.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/channel_latch.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/fifo.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/hpu_latch.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/hpu_comb.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/hpu.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/crossbar.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/crossbar_stage.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/router.vhd

router_click: ni_async
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/click/click.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/click/click_stage.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/click/fifo.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/click/hpu_c.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/click/xbar_c.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/click/router.vhd

noc_sync: router_sync
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/synchronous/noc_node.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/synchronous/noc_n.vhd

noc_async: router_async
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/asynchronous/noc_node.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/asynchronous/noc_n.vhd

noc_async_selftimed: router_async
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/asynchronous/fpga/self_timed_noc_2x2.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/asynchronous/fpga/noc_n.vhd


tile: traffic_generators
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/tiled/tile.vhd

noc_tiled: router_async tile
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/tiled/link_pipeline.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/tiled/tiled_noc.vhd

noc_tiled_click: router_click tile
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/tiled/link_pipeline.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/tiled/tiled_noc.vhd

traffic_generators:
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/tiled/tile_package.vhd
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/util/cmd_util.vhd
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/util/traffic_generator_package.vhd
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/util/traffic_generator.vhd

async_rtl_asic:
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/delays.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/rtl/matched_delay.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/rtl/sr_latch.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/rtl/c_gate_generic.vhd
async_fpga:
	$(PREFIX) vmap secureip $(SECUREIPPATH)/secureip
	$(PREFIX) vmap unisim $(UNISIMPATH)/unisim
	$(PREFIX) vmap simprim $(SIMPRIMPATH)/simprim
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/delays.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/fpga/matched_delay.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/fpga/AS_C2.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/fpga/c_gate_generic.vhd

work:
	rm -rf work
	$(PREFIX) vlib work
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/config_types.vhd

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
