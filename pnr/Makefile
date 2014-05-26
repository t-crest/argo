export ARGO_PNR_DIR := $(shell pwd)
export NETLIST_DIR := $(ARGO_PNR_DIR)/../netlists
export SYNTHESIS_DIR := $(ARGO_PNR_DIR)/../synthesis

all: assembly

.PHONY: all initial pipeline_stages tile assembly clean

$(NETLIST_DIR)/tiled_noc_netlist.v: 
	pushd $(SYNTHESIS_DIR); $(MAKE) asic_tiled_4x4; popd

initial/partitions/tiled_noc/tiled_noc.globals: $(NETLIST_DIR)/tiled_noc_netlist.v
	ln -s -f -n $(ARGO_PNR_DIR)/scripts/initial initial/scripts
	pushd initial; encounter -init scripts/make.tcl; popd

initial: $(NETLIST_DIR)/tiled_noc_netlist.v
	mkdir initial
	ln -s -f -n $(ARGO_PNR_DIR)/scripts/initial initial/scripts
	pushd initial; encounter -win -init scripts/all.tcl; popd

pipeline_stages: $(addsuffix /stage.enc, $(shell find initial/partitions/ -type d -name "link_pipe*"))

%/stage.enc: PIPELINE_STAGE=$(shell basename $(dir $@))
%/stage.enc:
	@echo building $(PIPELINE_STAGE)
	echo set stage $(PIPELINE_STAGE) > $(dir $@)/stage.tcl; 
	ln -s -f -n $(ARGO_PNR_DIR)/scripts/link_pipeline $(dir $@)/scripts
	pushd $(dir $@); encounter -win -init scripts/all.tcl; popd

initial/partitions/tile/tile.enc: initial/partitions/tiled_noc/tiled_noc.globals
	ln -s -f -n $(ARGO_PNR_DIR)/scripts/tile initial/partitions/tile/scripts
	pushd initial/partitions/tile; encounter -init scripts/make.tcl; popd

tile: initial/partitions/tiled_noc/tiled_noc.globals
	ln -s -f -n $(ARGO_PNR_DIR)/scripts/tile initial/partitions/tile/scripts
	pushd initial/partitions/tile; encounter -win; popd

assembly: PIPELINE_STAGE_PARTITIONS=$(shell find initial/partitions/ -type d -name "link_pipe*" -printf " -blockdir ../%f/stage.enc.dat")
assembly: initial/partitions/tile/tile.enc scripts/top/timing_analysis.tcl scripts/top/assemble.tcl
	echo set stage_partitions {$(PIPELINE_STAGE_PARTITIONS)} > initial/partitions/tiled_noc/stage_partitions.tcl;
	pushd initial/partitions/tiled_noc; ln -s -f -n $(ARGO_PNR_DIR)/scripts/top scripts; ln -s -f -n $(NETLIST_DIR) netlists; encounter -win -init scripts/assemble.tcl; popd

clean:
	rm -rf $(NETLIST_DIR)/*.v
	rm -rf $(NETLIST_DIR)/*.sdc
	rm -rf $(NETLIST_DIR)/*.sdf
	rm -rf initial/*
	rm -rf $(SYNTHESIS_DIR)/*.ddc
	rm -rf $(SYNTHESIS_DIR)/WORK/*
	rm -rf $(SYNTHESIS_DIR)/synopsys_cache*
