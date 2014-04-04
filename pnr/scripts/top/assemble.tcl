# freeDesign
source ../../../scripts/sizes.tcl
set init_design_uniquify {1}
# restore the design
assembleDesign -topDir . -blockDir ../tile/tile.enc.dat -fe

saveNetlist $env(NETLIST_DIR)/tiled_noc_pnr.v
write_sdf $env(NETLIST_DIR)/tiled_noc_pnr.sdf
