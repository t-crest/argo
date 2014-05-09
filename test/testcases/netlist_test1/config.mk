# test case of the asynchronous noc set up as a 2x2 configuration

netlist_test1: clean netlist_test1_setup async_rtl_asic noc_async traffic_generators
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/noc_tb.vhd
	$(PREFIX) vsim -t 10ps -voptargs=+acc -do $(TESTDIR)/testcases/netlist_test1/sim1.do noc_tb

netlist_test1_setup: work
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/testcases/netlist_test1/config.vhd 

netlist_test1_description:
	@echo "netlist_test1"
	@echo "     post synthesis simulation of the 2x2 asynchronous noc, "
	@echo "     one to all communication"

# append this testcase to the list of active testcases
#TESTCASE_LIST += netlist_test1
#TESTCASE_DESCRIPTIONS += netlist_test1_description
