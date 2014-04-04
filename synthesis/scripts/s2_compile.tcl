compile -exact_map

change_names -rules verilog
write -hierarchy -format verilog -output /home/piraten/eit-eik/noc/netlists/noc_netlist.v
write_sdf /home/piraten/eit-eik/noc/netlists/noc_netlist.sdf
write_sdc /home/piraten/eit-eik/noc/netlists/noc_netlist.sdc
write -hierarchy -format ddc -output /home/piraten/eit-eik/noc/synthesis/db/mapped_constrained.ddc