# test case of the asynchronous noc set up as a 2x2 configuration

test_tiled_2x2: clean test_tiled_2x2_setup noc_tiled
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/tiled_noc_tb.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/tiled/fake_entities/processor_traffic_generator.vhd
	$(PREFIX) vsim -t 10ps -voptargs=+acc -do rtl/tile_netlist_rtl.do tiled_noc_tb

test_tiled_2x2_setup: work
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/testcases/test_tiled_2x2/config.vhd 
