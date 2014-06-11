# test case of the asynchronous noc set up as a 2x2 configuration

netlist_tiled_4x4_pipelined_synth: clean netlist_tiled_4x4_pipelined_setup noc_defs traffic_generators mem
	$(PREFIX) vlog $(OPTIONS) ../netlists/tiled_noc_netlist.v
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/mem/single_spm_flat.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/delays.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/tiled/fake_entities/processor_traffic_generator_flat.vhd
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/tiled_noc_tb.vhd
	$(PREFIX) vsim -t 10ps -voptargs=+acc -do $(TESTDIR)/testcases/netlist_tiled_4x4_pipelined/tile_netlist_rtl.do -L CORE65LPHVT -L CORE65LPSVT -sdftyp tiled_noc_tb/DUT=../netlists/tiled_noc_netlistFixed.sdf tiled_noc_tb

netlist_tiled_4x4_pipelined_pnr: clean netlist_tiled_4x4_pipelined_setup noc_defs traffic_generators mem
	$(PREFIX) vlog $(OPTIONS) ../netlists/tiled_noc_pnr.v
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/mem/single_spm_flat.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/routers/asynchronous/delays.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/tiled/fake_entities/processor_traffic_generator_flat.vhd
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/tiled_noc_tb.vhd
	$(PREFIX) vsim -t 10ps -voptargs=+acc -do $(TESTDIR)/testcases/netlist_tiled_4x4_pipelined/sim2.do -L CORE65LPHVT -L CORE65LPSVT -L CLOCK65LPHVT -L CLOCK65LPSVT -sdfmin tiled_noc_tb/DUT=../netlists/tiled_noc_pnr.sdf tiled_noc_tb

netlist_tiled_4x4_pipelined_setup: work
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/testcases/netlist_tiled_4x4_pipelined/config.vhd 


netlist_tiled_4x4_pipelined_description:
	@echo "netlist_tiled_4x4_pipelined_{pnr|synth}"
	@echo "     post synthesis simulation of the 4x4 noc,"
	@echo "     set up for all 2 all communication with pipelined links"

# append this testcase to the list of active testcases
TESTCASE_LIST += netlist_tiled_4x4_pipelined
TESTCASE_DESCRIPTIONS += netlist_tiled_4x4_pipelined_description
