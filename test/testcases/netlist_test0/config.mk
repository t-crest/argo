# test case for netlist simulation of the asynchronous noc set up as a 2x2 configuration

netlist_test0: clean netlist_test0_setup noc_netlist traffic_generators
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/noc_tb.vhd
	$(PREFIX) vsim -t 10ps -voptargs=+acc -do $(TESTDIR)/testcases/netlist_test0/sim0.do noc_tb

netlist_test0_setup: work
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/testcases/netlist_test0/config.vhd 

netlist_test0_description:
	@echo "netlist_test0"
	@echo "     post synthesis netlist simulation for the 2x2 asynchronous noc, communication to two cores"

# append this testcase to the list of active testcases
#TESTCASE_LIST += netlist_test0
#TESTCASE_DESCRIPTIONS += netlist_test0_description
