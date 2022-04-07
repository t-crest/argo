analyze:
	ghdl -a --std=08 -fsynopsys ocp/ocp_config.vhd
	ghdl -a --std=08 -fsynopsys ocp/ocp.vhd
	ghdl -a --std=08 -fsynopsys util/math_util.vhd
	ghdl -a --std=08 -fsynopsys config_types.vhd
	ghdl -a --std=08 -fsynopsys config.vhd
	ghdl -a --std=08 -fsynopsys argo_types.vhd
	ghdl -a --std=08 -fsynopsys noc_interface.vhd
	ghdl -a --std=08 -fsynopsys -frelaxed mem/tdp_ram.vhd
	ghdl -a --std=08 -fsynopsys -frelaxed mem/tdp_bram.vhd
	ghdl -a --std=08 -fsynopsys ni/rx_unit.vhd
	ghdl -a --std=08 -fsynopsys ni/irq_fifo.vhd
	ghdl -a --std=08 -fsynopsys ni/config_bus.vhd
	ghdl -a --std=08 -fsynopsys ni/spm_bus.vhd
	ghdl -a --std=08 -fsynopsys ni/packet_manager.vhd
	ghdl -a --std=08 -fsynopsys ni/schedule_table.vhd
	ghdl -a --std=08 -fsynopsys ni/TDM_controller.vhd
	ghdl -a --std=08 -fsynopsys ni/MC_controller.vhd
	ghdl -a --std=08 -fsynopsys ni/network_interface.vhd
	ghdl -a --std=08 -fsynopsys routers/synchronous/xbar.vhd
	ghdl -a --std=08 -fsynopsys routers/synchronous/hpu.vhd
	ghdl -a --std=08 -fsynopsys routers/synchronous/router.vhd
	ghdl -a --std=08 -fsynopsys noc/synchronous/noc_node.vhd

synth:
	ghdl --synth -fsynopsys --std=08 -frelaxed --out=verilog rx_unit           > test/resources/rx_unit.v
	ghdl --synth -fsynopsys --std=08 -frelaxed --out=verilog irq_fifo          > test/resources/irq_fifo.v
	ghdl --synth -fsynopsys --std=08 -frelaxed --out=verilog config_bus        > test/resources/config_bus.v
	ghdl --synth -fsynopsys --std=08 -frelaxed --out=verilog spm_bus           > test/resources/spm_bus.v
	ghdl --synth -fsynopsys --std=08 -frelaxed --out=verilog packet_manager    > test/resources/packet_manager.v
	ghdl --synth -fsynopsys --std=08 -frelaxed --out=verilog schedule_table    > test/resources/schedule_table.v
	ghdl --synth -fsynopsys --std=08 -frelaxed --out=verilog TDM_controller    > test/resources/TDM_controller.v
	ghdl --synth -fsynopsys --std=08 -frelaxed --out=verilog MC_controller     > test/resources/MC_controller.v
	ghdl --synth -fsynopsys --std=08 -frelaxed --out=verilog network_interface > test/resources/network_interface.v
	ghdl --synth -fsynopsys --std=08 -frelaxed --out=verilog xbar              > test/resources/xbar.v
	ghdl --synth -fsynopsys --std=08 -frelaxed --out=verilog hpu               > test/resources/hpu.v
	ghdl --synth -fsynopsys --std=08 -frelaxed --out=verilog router            > test/resources/router.v
	ghdl --synth -fsynopsys --std=08 -frelaxed --out=verilog noc_node          > test/resources/noc_node.v