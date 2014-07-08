# freeDesign
source ../../../scripts/sizes.tcl

set init_mmmc_file "$env(ARGO_PNR_DIR)/scripts/initial/noc.view"

set init_design_uniquify {1}
# restore the design

source stage_partitions.tcl 

loadCPF scripts/power_domains.cpf  
commitCPF

set options " -topDir . -blockDir ../tile/tile.enc.dat [join $stage_partitions] -fe -mmmcFile $init_mmmc_file"
eval "assembleDesign $options"


saveNetlist $env(NETLIST_DIR)/tiled_noc_pnr.v
write_sdf $env(NETLIST_DIR)/tiled_noc_pnr.sdf
rcOut -spef tiled_noc.spef -rc_corner TT

source scripts/timing_data.tcl
trace_noc_timing
