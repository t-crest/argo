# test case of the asynchronous noc set up as a 2x2 configuration

async_test2: clean async_test2_setup noc_async traffic_generators
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/noc_tb.vhd
	$(PREFIX) vsim -t 10ps -voptargs=+acc -do $(TESTDIR)/testcases/async_test2/sim2.do noc_tb

async_test2_setup: work
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/testcases/async_test2/config.vhd 

async_test2_description:
	@echo "async_test2"
	@echo "     <testcase description here>"

async_test2_auto: clean async_test2_setup noc_async traffic_generators
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/noc_tb.vhd
	$(PREFIX) vsim -c -t 10ps -voptargs=+acc -do $(TESTDIR)/testcases/async_test2/autosim.do noc_tb | grep NI |sort |grep read > output.filtered
	diff output.filtered ../test/testcases/async_test2/output.golden
	@echo async_test2 passed

# append this testcase to the list of active testcases
TESTCASE_LIST += async_test2
# add this testcase to the list of descriptions to show
TESTCASE_DESCRIPTIONS += async_test2_description
# this testcase can be tested & verified automatically
AUTO_TEST += async_test2_auto
