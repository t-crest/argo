# test case of the asynchronous noc set up as a 2x2 configuration

async_test1: clean async_test1_setup async_rtl_asic noc_async traffic_generators
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/noc_tb.vhd
	$(PREFIX) vsim -t 10ps -voptargs=+acc -do $(TESTDIR)/testcases/async_test1/sim1.do noc_tb

async_test1_setup: work
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/testcases/async_test1/config.vhd 

async_test1_description:
	@echo "async_test1"
	@echo "     2x2 asynchronous noc, one to all communication"

# append this testcase to the list of active testcases
TESTCASE_LIST += async_test1
TESTCASE_DESCRIPTIONS += async_test1_description
