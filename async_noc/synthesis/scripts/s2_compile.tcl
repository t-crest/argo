compile -exact_map

change_names -rules verilog
write -hierarchy -format verilog -output netlists/noc_netlist.v
write_sdf netlists/noc_netlist.sdf
write_sdc netlists/noc_netlist.sdc
write -hierarchy -format ddc -output mapped_constrained.ddc
exec perl scripts/fix_pipe_sdf.pl netlists/noc_netlist
