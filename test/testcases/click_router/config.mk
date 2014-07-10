# test case of the asynchronous noc set up as a 2x2 configuration

click_router: clean click_router_setup router_click
#	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/util/wiretap_package.vhd
#	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/util/wiretap.vhd
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/packet_generator.vhd
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/packet_consumer.vhd
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/bench/router_bench.vhd
#	$(PREFIX) vsim -debugDB -do $(TESTDIR)/testcases/click_router/sim.do work.router_bench 
	$(PREFIX) vsim -novopt -do $(TESTDIR)/testcases/click_router/sim.do work.router_bench 

click_router_setup: work
	$(PREFIX) vcom $(OPTIONS) $(TESTDIR)/testcases/click_router/config.vhd 
	$(PREFIX) vcom $(OPTION) $(SRCDIR)/routers/asynchronous/rtl/matched_delay.vhd
	$(PREFIX) vcom $(OPTION) $(SRCDIR)/routers/asynchronous/delays.vhd

click_router_description:
	@echo "click_router"
	@echo "     testcase for a tiled 2x2 noc (with click elements, rather than mousetrap)"

# append this testcase to the list of active testcases
TESTCASE_LIST += click_router
TESTCASE_DESCRIPTIONS += click_router_description
