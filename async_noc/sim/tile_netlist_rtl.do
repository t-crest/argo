set NumericStdNoWarnings 1

# custom memory initialisation for debugging
mem load -filltype inc -fillradix hex -filldata 0F000000 /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(0)/noc_tile/spm_l/mem
mem load -filltype inc -fillradix hex -filldata 0D000000 /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(0)/noc_tile/spm_h/mem
mem load -filltype inc -fillradix hex -filldata 1F000000 /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(1)/noc_tile/spm_l/mem
mem load -filltype inc -fillradix hex -filldata 1D000000 /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(1)/noc_tile/spm_h/mem
mem load -filltype inc -fillradix hex -filldata 2F000000 /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(0)/noc_tile/spm_l/mem
mem load -filltype inc -fillradix hex -filldata 2D000000 /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(0)/noc_tile/spm_h/mem
mem load -filltype inc -fillradix hex -filldata 3F000000 /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(1)/noc_tile/spm_l/mem
mem load -filltype inc -fillradix hex -filldata 3D000000 /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(1)/noc_tile/spm_h/mem


view *
#view wave
do tile_netlist_wave.do
run 40 us
puts "Slot Tables"
mem display /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(0)/noc_tile/na/slt_table/mem
mem display /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(1)/noc_tile/na/slt_table/mem
mem display /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(0)/noc_tile/na/slt_table/mem
mem display /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(1)/noc_tile/na/slt_table/mem
puts "Route tables (dma)"
mem display /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(0)/noc_tile/na/dma_table/dma2/mem
mem display /tiled_noc_tb/DUT/nodes_m(0)/nodes_n(1)/noc_tile/na/dma_table/dma2/mem
mem display /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(0)/noc_tile/na/dma_table/dma2/mem
mem display /tiled_noc_tb/DUT/nodes_m(1)/nodes_n(1)/noc_tile/na/dma_table/dma2/mem