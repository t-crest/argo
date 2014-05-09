# test case of the asynchronous noc set up as a 2x2 configuration

test_tiled_2x2: clean test_tiled_2x2_setup async_rtl_asic noc_tiled
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/tiled_noc_tb.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/tiled/fake_entities/processor_traffic_generator.vhd
	$(PREFIX) vsim -t 10ps -voptargs=+acc -do $(TESTDIR)/testcases/netlist_tiled/tile_netlist_rtl.do tiled_noc_tb

test_tiled_2x2_setup: work
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/testcases/test_tiled_2x2/config.vhd 

test_tiled_2x2_description:
	@echo "test_tiled_2x2"
	@echo "     testcase for a tiled 2x2 noc"

# append this testcase to the list of active testcases
TESTCASE_LIST += test_tiled_2x2
TESTCASE_DESCRIPTIONS += test_tiled_2x2_description
