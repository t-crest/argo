# some variables
set NETLIST_DIR ../netlists

# cleanup
remove_design -designs

# load the vhdl files to use
source 4x4.tcl

# analyze
analyze -library WORK -format vhdl $vhdl_files

elaborate TILED_NOC -architecture STRUCT_SWAP -library WORK 
#uniquify

write -hierarchy -format ddc -output unmapped_unconstrained.ddc

# store the top name for later
set top_design [get_object_name [current_design]]


# just work within a single tile for now...
current_design tile

# set tile timing constraints 
source tile_timing_constraints.tcl

# set output wire load
set_load -wire_load 1.4 [all_outputs]

# run the compiler
compile -exact_map
#set dclink_disable_ilm_write_filtering true

write -hierarchy -format verilog -output $NETLIST_DIR/tile_netlist.v
write_sdf $NETLIST_DIR/tile_netlist.sdf
write_sdc $NETLIST_DIR/tile_netlist.sdc
#set dclink_disable_ilm_write_filtering false

current_design $top_design

set_dont_touch noc_tile*

compile -exact_map

change_names -rules verilog
write -hierarchy -format verilog -output $NETLIST_DIR/$top_design\_netlist.v
write_sdf $NETLIST_DIR/$top_design\_netlist.sdf
write_sdc $NETLIST_DIR/$top_design\_netlist.sdc
write -hierarchy -format ddc -output mapped_constrained.ddc

#remove_design tile
#write -hierarchy -format verilog -output $NETLIST_DIR/$top_design\_tile_bbox_netlist.v
#write_sdf $NETLIST_DIR/$top_design\_tile_bbox_netlist.sdf
#write_sdc $NETLIST_DIR/$top_design\_tile_bbox_netlist.sdc

exec perl fix_pipe_sdf.pl $NETLIST_DIR/$top_design\_netlist
exec perl fix_pipe_sdf.pl $NETLIST_DIR/tile_netlist
#exec perl fix_pipe_sdf.pl $NETLIST_DIR/$top_design\_tile_bbox_netlist
exit

