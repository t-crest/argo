# test case of the asynchronous noc set up as a 2x2 configuration

netlist_test2: clean netlist_test2_setup noc_async traffic_generators
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/noc_tb.vhd
	$(PREFIX) vsim -t 10ps -voptargs=+acc -do $(TESTDIR)/testcases/netlist_test2/sim2.do noc_tb

netlist_test2_setup: work
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/testcases/netlist_test2/config.vhd 

netlist_test2_description:
	@echo "netlist_test2"
	@echo "     post synthesis simulation of the 2x2 noc,"
	@echo "     set up for all 2 all communication"

# append this testcase to the list of active testcases
TESTCASE_LIST += netlist_test2
TESTCASE_DESCRIPTIONS += netlist_test2_description
