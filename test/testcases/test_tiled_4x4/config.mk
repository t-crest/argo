# test case of the asynchronous noc set up as a 4x4 configuration

test_tiled_4x4: clean test_tiled_4x4_setup async_rtl_asic noc_tiled
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/tiled_noc_tb.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/tiled/fake_entities/processor_traffic_generator.vhd
	$(PREFIX) vsim -t 10ps -voptargs=+acc -do $(TESTDIR)/testcases/netlist_tiled/tile_netlist_rtl.do tiled_noc_tb

test_tiled_4x4_auto: clean test_tiled_4x4_setup async_rtl_asic noc_tiled
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/tiled_noc_tb.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/tiled/fake_entities/processor_traffic_generator.vhd
	$(PREFIX) vsim -c -t 10ps -voptargs=+acc -do $(TESTDIR)/testcases/test_tiled_4x4/autosim.do tiled_noc_tb | grep NI |sort |grep read > output.filtered
	diff -w output.filtered ../test/testcases/test_tiled_4x4/output.golden
	@echo test_tiled_4x4 passed

test_tiled_4x4_setup: work
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/testcases/test_tiled_4x4/config.vhd 

test_tiled_4x4_description:
	@echo "test_tiled_4x4"
	@echo "     testcase for a tiled 4x4 noc"

# append this testcase to the list of active testcases
TESTCASE_LIST += test_tiled_4x4
TESTCASE_DESCRIPTIONS += test_tiled_4x4_description
