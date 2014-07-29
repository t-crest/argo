# test case of the asynchronous noc set up as a 2x2 configuration

click_tiled_2x2: clean click_tiled_2x2_setup async_rtl_asic noc_tiled_click
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/tiled_noc_tb.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/tiled/fake_entities/processor_traffic_generator.vhd
	$(PREFIX) vsim -t 10ps -voptargs=+acc -do $(TESTDIR)/testcases/netlist_tiled/tile_netlist_rtl.do tiled_noc_tb

click_tiled_2x2_setup: work
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/testcases/click_tiled_2x2/config.vhd 

click_tiled_2x2_auto: clean click_tiled_2x2_setup async_rtl_asic noc_tiled_click
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/tiled_noc_tb.vhd
	$(PREFIX) vcom $(OPTIONS) $(SRCDIR)/noc/tiled/fake_entities/processor_traffic_generator.vhd
	$(PREFIX) vsim -c -t 10ps -voptargs=+acc -do $(TESTDIR)/testcases/click_tiled_2x2/autosim.do tiled_noc_tb | grep NI |sort |grep read > output.filtered
	diff -w output.filtered ../test/testcases/click_tiled_2x2/output.golden
	@echo 2x2 click elements passed

click_tiled_2x2_description:
	@echo "click_tiled_2x2"
	@echo "     testcase for a tiled 2x2 noc (with click elements, rather than mousetrap)"

# append this testcase to the list of active testcases
TESTCASE_LIST += click_tiled_2x2
TESTCASE_DESCRIPTIONS += click_tiled_2x2_description
