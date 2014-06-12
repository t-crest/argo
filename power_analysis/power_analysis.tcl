set design tiled_noc
set netlist_dir ../netlists
set simulation_dir ../sim

set net_f $netlist_dir\/tiled_noc_pnr.v
set sdf_f $netlist_dir\/tiled_noc_pnr.sdf
set sdc_f $netlist_dir\/tiled_noc_netlist.sdc
set vcd_f $simulation_dir\/noc_traffic.vcd.gz
source  $simulation_dir\/noc_simulation_timestamps.tcl 

# read netlist
read_verilog $net_f

# link 
link_design $design

# read sdf
read_sdf $sdf_f

# read sdc
#read_sdc $sdc_f
create_clock -period 2 n_clk

set timerange [concat [expr [lindex $init_done 0]/1000] [expr [lindex $transfer_done 0] /1000]]
# read vcd

read_vcd $vcd_f -strip_path tiled_noc_tb/DUT -time $timerange

read_parasitics ../pnr/initial/partitions/tiled_noc/tiled_noc.spef -format spef

foreach node [get_object_name [get_cells noc_tile*]] {
    catch {create_power_group -name $node\_na [get_cells $node/na]}
    catch {create_power_group -name $node\_na_slt_table [get_cells $node/na/dma_table]}
    catch {create_power_group -name $node\_na_dma_table [get_cells $node/na/slt_table]}
    catch {create_power_group -name $node\_r [get_cells $node/r]}
    catch {create_power_group -name $node\_fifos [get_cells $node/*fifo]}
}

foreach pipeline_stage [get_object_name [get_cells pipeline*]] {
    catch {create_power_group -name $pipeline_stage [get_cells $pipeline_stage]}
}


report_power -verbose > power.report
