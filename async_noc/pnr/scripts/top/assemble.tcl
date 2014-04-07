# freeDesign
source ../../../scripts/sizes.tcl

set init_mmmc_file "$env(ARGO_PNR_DIR)/scripts/initial/noc.view"

set init_design_uniquify {1}
# restore the design
assembleDesign -topDir . -blockDir ../tile/tile.enc.dat -fe -mmmcFile $init_mmmc_file


saveNetlist $env(NETLIST_DIR)/tiled_noc_pnr.v
write_sdf $env(NETLIST_DIR)/tiled_noc_pnr.sdf
