# some variables
set NETLIST_DIR ../netlists
set LINK_PIPELINE_STAGES 0 
set target targets/asic_tiled_4x4_click

set gridN 4
set gridM 4

# cleaner output: yes, we know that we have unresolved references 
# (the fake processor and spm, both simulated in RTL later.)
suppress_message UID-341

# asssume even distribution between the stages...
set WIRE_LOAD [expr 1.4/(1 + $LINK_PIPELINE_STAGES)]

# cleanup
remove_design -designs

# load the vhdl files to use
source $target/synthesis_vhdl_files.tcl

# read the vhdl files
analyze -library WORK -format vhdl $vhdl_files

# elaborate the top design
elaborate TILED_NOC -architecture STRUCT -library WORK 

# store the initial state before application of the constraints
write -hierarchy -format ddc -output unmapped_unconstrained.ddc

# store the top name for later
set top_design [get_object_name [current_design]]

# we need the layout data model for later place and route to flip 
# some of the pipeline stages before writing out the netlist

set PNR_DIR ../pnr
set dir $PNR_DIR/scripts/libs/stooop
source $PNR_DIR/scripts/libs/stooop/pkgIndex.tcl

package require stooop
namespace import stooop::*

source $PNR_DIR/scripts/initial/grid_classes.tcl
source $PNR_DIR/scripts/initial/a_star.tcl
source $PNR_DIR/scripts/initial/layout_utils.tcl

# flip the pipeline stages if nedded by the layout
source $PNR_DIR/scripts/initial/build_layout_model.tcl
source $target/flip_cells.tcl

# apply timing constraints 
source $target/timing_constraints.tcl

# flatten the busses
define_name_rules flat_busses -flatten_multi_dimension_busses
change_names -hierarchy -rules flat_busses

# characterize the environment of a tile...
characterize noc_tile_*_0_0

# flatten the dma table in the NA 
current_design nAdapter
ungroup -flatten dma_table

# just work within a single tile for now...
current_design tile

# set output wire load
set_load -wire_load $WIRE_LOAD [all_outputs]

# run the compiler
compile -exact_map

# in case we need it, netlist, sdf and sdc only for the tile...
write -hierarchy -format verilog -output $NETLIST_DIR/tile_netlist.v
write_sdf $NETLIST_DIR/tile_netlist.sdf
write_sdc $NETLIST_DIR/tile_netlist.sdc
exec perl fix_pipe_sdf.pl $NETLIST_DIR/tile_netlist

# switch back to the top design
current_design $top_design

# tile done, keep your fingers away from now on...
set_dont_touch noc_tile*

# link pipeline stages...
foreach link_pipeline_design [get_object_name [get_designs link_pipeline*]] {
    
    # characterize the first instance of the design we have...
    characterize [lindex [get_object_name [get_cells -filter ref_name==$link_pipeline_design]] 0]
    # switch to freshly characterized design
    current_design $link_pipeline_design
    # add some wire load
    set_load -wire_load $WIRE_LOAD [all_outputs]
    # compile the current 
    compile -exact_map
    # switch back to the top design for dont_touch & next characterization
    current_design $top_design
    # link pipeline done, none shall pass...
    set_dont_touch [get_object_name [get_cells -filter ref_name==$link_pipeline_design]]
}

current_design $top_design

# compile the top design
compile -exact_map

# just in case, make sure now verilog keywords are used as names somewhere...
change_names -rules verilog

# netlist, sdc, sdf, ...
write -hierarchy -format verilog -output $NETLIST_DIR/$top_design\_netlist.v
write_sdf $NETLIST_DIR/$top_design\_netlist.sdf
write_sdc $NETLIST_DIR/$top_design\_netlist.sdc
write -hierarchy -format ddc -output post_synthesis.ddc

exec perl fix_pipe_sdf.pl $NETLIST_DIR/$top_design\_netlist
#exec perl fix_pipe_sdf.pl $NETLIST_DIR/$top_design\_tile_bbox_netlist

set interconnections {}
foreach tile [get_object_name [get_cells noc_tile*]] {
    foreach direction {north south east west} {
	lappend interconnections [layout_utils::trace_to_next_tile_extended $tile $direction]
    }
}
echo "set interconnections $interconnections" > interconnections.tcl
exit

