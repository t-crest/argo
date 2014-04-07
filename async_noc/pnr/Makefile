export ARGO_PNR_DIR := $(shell pwd)
export NETLIST_DIR := $(ARGO_PNR_DIR)/../netlists
export SYNTHESIS_DIR := $(ARGO_PNR_DIR)/../synthesis

all: assembly

$(NETLIST_DIR)/tiled_noc_netlist.v: 
	pushd $(SYNTHESIS_DIR); $(MAKE); popd

initial/partitions/tiled_noc/tiled_noc.globals: $(NETLIST_DIR)/tiled_noc_netlist.v
	ln -s -f -n $(ARGO_PNR_DIR)/scripts/initial initial/scripts
	pushd initial; encounter -init scripts/make.tcl; popd

initial: $(NETLIST_DIR)/tiled_noc_netlist.v
	ln -s -f -n $(ARGO_PNR_DIR)/scripts/initial initial/scripts
	pushd initial; encounter -win -init scripts/all.tcl; popd

initial/partitions/tile/tile.enc: initial/partitions/tiled_noc/tiled_noc.globals
	ln -s -f -n $(ARGO_PNR_DIR)/scripts/tile initial/partitions/tile/scripts
	pushd initial/partitions/tile; encounter -init scripts/make.tcl; popd

tile: initial/partitions/tiled_noc/tiled_noc.globals
	ln -s -f -n $(ARGO_PNR_DIR)/scripts/tile initial/partitions/tile/scripts
	pushd initial/partitions/tile; encounter -win; popd

assembly: initial/partitions/tile/tile.enc scripts/top/timing_analysis.tcl scripts/top/assemble.tcl
	pushd initial/partitions/tiled_noc; ln -s -f -n $(ARGO_PNR_DIR)/scripts/top scripts; ln -s -f -n $(NETLIST_DIR) netlists; encounter -win -init scripts/assemble.tcl; popd

clean:
	rm -rf $(NETLIST_DIR)/*.v
	rm -rf $(NETLIST_DIR)/*.sdc
	rm -rf $(NETLIST_DIR)/*.sdf
	rm -rf initial/*
	rm -rf $(SYNTHESIS_DIR)/*.ddc
	rm -rf $(SYNTHESIS_DIR)/WORK/*
	rm -rf $(SYNTHESIS_DIR)/synopsys_cache*
