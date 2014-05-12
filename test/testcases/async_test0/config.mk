# test case of the asynchronous noc set up as a 2x2 configuration

async_test0: clean async_test0_setup async_rtl_asic noc_async traffic_generators
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/noc_tb.vhd
	$(PREFIX) vsim -t 10ps -voptargs=+acc -do $(TESTDIR)/testcases/async_test0/sim0.do noc_tb

async_test0_setup: work
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/testcases/async_test0/config.vhd 

async_test0_description:
	@echo "async_test0"
	@echo "     2x2 asynchronous noc, communication to two cores"

# append this testcase to the list of active testcases
#TESTCASE_LIST += async_test0
#TESTCASE_DESCRIPTIONS += async_test0_description
