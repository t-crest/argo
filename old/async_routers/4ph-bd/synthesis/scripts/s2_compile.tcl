compile -exact_map

#write -hierarchy -format vhdl -output /home/evka/as2phase_router/synopsys/db/switch_netlist.vhd
change_names -rules verilog
write -hierarchy -format verilog -output /home/piraten/eit-eik/r4p/netlists/switch_netlist.v
write_sdf /home/piraten/eit-eik/r4p/netlists/switch_netlist.sdf
write_sdc /home/piraten/eit-eik/r4p/netlists/switch_netlist.sdc
write -hierarchy -format ddc -output /home/piraten/eit-eik/r4p/synthesis/db/mapped_cosntrained.ddc
