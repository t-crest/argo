// Quartus Prime Verilog Template
// True Dual Port RAM with dual clocks

module tdp_ram
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=8)
(
	input [(DATA_WIDTH-1):0] a_din, b_din,
	input [(ADDR_WIDTH-1):0] a_addr, b_addr,
	input a_we, b_we, a_clk, b_clk,
	output reg [(DATA_WIDTH-1):0] a_dout, b_dout
);

	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

	always @ (posedge a_clk)
	begin
		// Port A
		if (a_we)
		begin
			ram[a_addr] <= a_din;
			a_dout <= a_din;
		end
		else
		begin
			a_dout <= ram[a_addr];
		end
	end

	always @ (posedge b_clk)
	begin
		// Port B
		if (b_we)
		begin
			ram[b_addr] <= b_din;
			b_dout <= b_din;
		end
		else
		begin
			b_dout <= ram[b_addr];
		end
	end

endmodule
