# test case of the asynchronous noc set up as a 2x2 configuration

sync_test2: clean sync_test2_setup noc_sync traffic_generators
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/util/cmd_util.vhd
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/noc_tb.vhd
	$(PREFIX) vsim -t 10ps -voptargs=+acc -gSLT_WIDTH=3 -do $(TESTDIR)/testcases/sync_test2/sim2.do noc_tb

sync_test2_setup: work
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/testcases/sync_test2/config.vhd 

sync_test2_description: 
	@echo "sync_test2"
	@echo "     <testcase description here>"

sync_test2_auto: clean sync_test2_setup noc_sync traffic_generators
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/util/cmd_util.vhd
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/noc_tb.vhd
	$(PREFIX) vsim -c -t 10ps -voptargs=+acc -gSLT_WIDTH=3 -do $(TESTDIR)/testcases/sync_test2/autosim.do noc_tb | grep NI |sort |grep read > output.filtered
	diff output.filtered ../test/testcases/sync_test2/output.golden
	@echo sync_test2 passed

# append this testcase to the list of active testcases
TESTCASE_LIST += sync_test2
# add this testcase to the list of descriptions to show
TESTCASE_DESCRIPTIONS += sync_test2_description
# this testcase can be tested automatically
AUTO_TEST += sync_test2_auto
