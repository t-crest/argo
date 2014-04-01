# test case of the asynchronous noc set up as a 4x4 configuration

test_tiled_4x4: clean test_tiled_4x4_setup noc_tiled
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/tiled_noc_tb.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/tiled/fake_entities/processor_traffic_generator.vhd
	$(PREFIX) vsim -t 10ps -voptargs=+acc -do rtl/tile_netlist_rtl.do tiled_noc_tb

test_tiled_4x4_setup: work
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/testcases/test_tiled_4x4/config.vhd 

test_tiled_4x4_description:
	@echo "test_tiled_4x4"
	@echo "     testcase for a tiled 4x4 noc"

# append this testcase to the list of active testcases
TESTCASE_LIST += test_tiled_4x4
TESTCASE_DESCRIPTIONS += test_tiled_4x4_description
