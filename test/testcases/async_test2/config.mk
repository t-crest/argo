# test case of the asynchronous noc set up as a 2x2 configuration

async_test2: clean async_test2_setup noc_async
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/util/cmd_util.vhd
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/test2_noc2x2_m.vhd
	$(PREFIX) vsim -t 10ps -voptargs=+acc -do rtl/sim2.do test2_noc2x2

async_test2_setup: work
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/testcases/async_test2/config.vhd 

async_test2_description:
	@echo "async_test2"
	@echo "     testcase for a tiled 2x2 noc"

# append this testcase to the list of active testcases
TESTCASE_LIST += async_test2
TESTCASE_DESCRIPTIONS += async_test2_description
