module tdp_ram_14_5
  (input  a_clk,
   input  a_wr,
   input  [4:0] a_addr,
   input  [13:0] a_din,
   input  b_clk,
   input  b_wr,
   input  [4:0] b_addr,
   input  [13:0] b_din,
   output [13:0] a_dout,
   output [13:0] b_dout);
  reg [13:0] n200_data; // mem_rd
  reg [13:0] n203_data; // mem_rd
  assign a_dout = n203_data;
  assign b_dout = n200_data;
  /* mem/tdp_ram.vhd:57:5  */
  reg [13:0] mem[31:0] ; // memory
  initial begin
    mem[31] = 14'b00000000000000;
    mem[30] = 14'b00000000000000;
    mem[29] = 14'b00000000000000;
    mem[28] = 14'b00000000000000;
    mem[27] = 14'b00000000000000;
    mem[26] = 14'b00000000000000;
    mem[25] = 14'b00000000000000;
    mem[24] = 14'b00000000000000;
    mem[23] = 14'b00000000000000;
    mem[22] = 14'b00000000000000;
    mem[21] = 14'b00000000000000;
    mem[20] = 14'b00000000000000;
    mem[19] = 14'b00000000000000;
    mem[18] = 14'b00000000000000;
    mem[17] = 14'b00000000000000;
    mem[16] = 14'b00000000000000;
    mem[15] = 14'b00000000000000;
    mem[14] = 14'b00000000000000;
    mem[13] = 14'b00000000000000;
    mem[12] = 14'b00000000000000;
    mem[11] = 14'b00000000000000;
    mem[10] = 14'b00000000000000;
    mem[9] = 14'b00000000000000;
    mem[8] = 14'b00000000000000;
    mem[7] = 14'b00000000000000;
    mem[6] = 14'b00000000000000;
    mem[5] = 14'b00000000000000;
    mem[4] = 14'b00000000000000;
    mem[3] = 14'b00000000000000;
    mem[2] = 14'b00000000000000;
    mem[1] = 14'b00000000000000;
    mem[0] = 14'b00000000000000;
    end
  always @(posedge b_clk)
    if (b_wr)
      mem[b_addr] <= b_din;
  always @(posedge b_clk)
    if (1'b1)
      n200_data <= mem[b_addr];
  always @(posedge a_clk)
    if (a_wr)
      mem[a_addr] <= a_din;
  always @(posedge a_clk)
    if (1'b1)
      n203_data <= mem[a_addr];
  /* mem/tdp_ram.vhd:104:17  */
  /* mem/tdp_ram.vhd:88:17  */
  /* mem/tdp_ram.vhd:103:9  */
endmodule

module irq_fifo
  (input  clk,
   input  reset,
   input  [13:0] config_addr,
   input  config_en,
   input  config_wr,
   input  [31:0] config_wdata,
   input  sel,
   input  irq_data_fifo_data_valid,
   input  irq_irq_fifo_data_valid,
   input  [13:0] irq_data_fifo_data,
   output [31:0] config_slv_rdata,
   output config_slv_error,
   output irq_irq_sig,
   output irq_data_sig);
  wire [47:0] n0_o;
  wire [31:0] n2_o;
  wire n3_o;
  wire irq_not_empty;
  wire data_not_empty;
  wire next_error;
  wire irq_read;
  wire data_read;
  wire irq_not_full;
  wire data_not_full;
  wire [4:0] data_w_ptr;
  wire [4:0] data_r_ptr;
  wire [4:0] irq_w_ptr;
  wire [4:0] irq_r_ptr;
  wire [4:0] w_ptr;
  wire [4:0] r_ptr;
  wire [13:0] w_data;
  wire n8_o;
  wire n9_o;
  wire n12_o;
  wire n13_o;
  wire [4:0] n17_o;
  wire n18_o;
  wire n20_o;
  wire n22_o;
  wire n23_o;
  wire n24_o;
  wire n25_o;
  wire [4:0] n29_o;
  wire n30_o;
  wire n32_o;
  wire n34_o;
  wire n35_o;
  wire n36_o;
  wire n37_o;
  wire n39_o;
  wire [4:0] n40_o;
  wire n43_o;
  wire n44_o;
  wire n45_o;
  wire n46_o;
  wire [10:0] n47_o;
  wire n49_o;
  wire n51_o;
  wire [1:0] n52_o;
  reg n55_o;
  reg n58_o;
  reg n61_o;
  reg [4:0] n62_o;
  wire n64_o;
  wire n66_o;
  wire n68_o;
  wire [4:0] n69_o;
  wire n71_o;
  wire n74_o;
  wire n77_o;
  wire n79_o;
  wire n81_o;
  wire n82_o;
  wire n83_o;
  localparam n85_o = 1'b0;
  localparam [13:0] n86_o = 14'b00000000000000;
  wire [13:0] tdpram_n87;
  wire [13:0] tdpram_a_dout;
  wire [13:0] tdpram_b_dout;
  wire n94_o;
  wire n96_o;
  wire [4:0] n98_o;
  wire [4:0] n100_o;
  wire [4:0] n101_o;
  wire [4:0] n103_o;
  reg [4:0] n106_q;
  wire n110_o;
  wire n112_o;
  wire [4:0] n114_o;
  wire [4:0] n116_o;
  wire [4:0] n117_o;
  wire [4:0] n119_o;
  reg [4:0] n122_q;
  wire n126_o;
  wire n128_o;
  wire [4:0] n130_o;
  wire [4:0] n132_o;
  wire [4:0] n133_o;
  wire [4:0] n135_o;
  reg [4:0] n138_q;
  wire n142_o;
  wire n144_o;
  wire [4:0] n146_o;
  wire [4:0] n148_o;
  wire [4:0] n149_o;
  wire [4:0] n151_o;
  reg [4:0] n154_q;
  wire n159_o;
  reg n163_q;
  wire [32:0] n164_o;
  assign config_slv_rdata = n2_o;
  assign config_slv_error = n3_o;
  assign irq_irq_sig = irq_not_empty;
  assign irq_data_sig = data_not_empty;
  assign n0_o = {config_wdata, config_wr, config_en, config_addr};
  assign n2_o = n164_o[31:0];
  assign n3_o = n164_o[32];
  /* ni/irq_fifo.vhd:94:16  */
  assign irq_not_empty = n9_o; // (signal)
  /* ni/irq_fifo.vhd:94:31  */
  assign data_not_empty = n13_o; // (signal)
  /* ni/irq_fifo.vhd:94:47  */
  assign next_error = n71_o; // (signal)
  /* ni/irq_fifo.vhd:94:59  */
  assign irq_read = n74_o; // (signal)
  /* ni/irq_fifo.vhd:94:69  */
  assign data_read = n77_o; // (signal)
  /* ni/irq_fifo.vhd:94:80  */
  assign irq_not_full = n25_o; // (signal)
  /* ni/irq_fifo.vhd:94:94  */
  assign data_not_full = n37_o; // (signal)
  /* ni/irq_fifo.vhd:95:16  */
  assign data_w_ptr = n122_q; // (signal)
  /* ni/irq_fifo.vhd:95:28  */
  assign data_r_ptr = n154_q; // (signal)
  /* ni/irq_fifo.vhd:95:40  */
  assign irq_w_ptr = n106_q; // (signal)
  /* ni/irq_fifo.vhd:95:51  */
  assign irq_r_ptr = n138_q; // (signal)
  /* ni/irq_fifo.vhd:95:62  */
  assign w_ptr = n40_o; // (signal)
  /* ni/irq_fifo.vhd:95:69  */
  assign r_ptr = n69_o; // (signal)
  /* ni/irq_fifo.vhd:96:16  */
  assign w_data = irq_data_fifo_data; // (signal)
  /* ni/irq_fifo.vhd:106:46  */
  assign n8_o = irq_w_ptr == irq_r_ptr;
  /* ni/irq_fifo.vhd:106:31  */
  assign n9_o = n8_o ? 1'b0 : 1'b1;
  /* ni/irq_fifo.vhd:107:47  */
  assign n12_o = data_w_ptr == data_r_ptr;
  /* ni/irq_fifo.vhd:107:31  */
  assign n13_o = n12_o ? 1'b0 : 1'b1;
  /* ni/irq_fifo.vhd:109:59  */
  assign n17_o = irq_r_ptr - 5'b00001;
  /* ni/irq_fifo.vhd:109:47  */
  assign n18_o = irq_w_ptr == n17_o;
  /* ni/irq_fifo.vhd:109:78  */
  assign n20_o = irq_w_ptr == 5'b01111;
  /* ni/irq_fifo.vhd:109:146  */
  assign n22_o = irq_r_ptr == 5'b00000;
  /* ni/irq_fifo.vhd:109:132  */
  assign n23_o = n20_o & n22_o;
  /* ni/irq_fifo.vhd:109:64  */
  assign n24_o = n18_o | n23_o;
  /* ni/irq_fifo.vhd:109:30  */
  assign n25_o = n24_o ? 1'b0 : 1'b1;
  /* ni/irq_fifo.vhd:110:61  */
  assign n29_o = data_r_ptr + 5'b00001;
  /* ni/irq_fifo.vhd:110:48  */
  assign n30_o = data_w_ptr == n29_o;
  /* ni/irq_fifo.vhd:110:81  */
  assign n32_o = data_w_ptr == 5'b10000;
  /* ni/irq_fifo.vhd:110:151  */
  assign n34_o = data_r_ptr == 5'b11111;
  /* ni/irq_fifo.vhd:110:136  */
  assign n35_o = n32_o & n34_o;
  /* ni/irq_fifo.vhd:110:66  */
  assign n36_o = n30_o | n35_o;
  /* ni/irq_fifo.vhd:110:30  */
  assign n37_o = n36_o ? 1'b0 : 1'b1;
  /* ni/irq_fifo.vhd:113:59  */
  assign n39_o = ~irq_data_fifo_data_valid;
  /* ni/irq_fifo.vhd:113:29  */
  assign n40_o = n39_o ? irq_w_ptr : data_w_ptr;
  /* ni/irq_fifo.vhd:123:42  */
  assign n43_o = n0_o[14];
  /* ni/irq_fifo.vhd:123:31  */
  assign n44_o = sel & n43_o;
  /* ni/irq_fifo.vhd:125:35  */
  assign n45_o = n0_o[15];
  /* ni/irq_fifo.vhd:125:38  */
  assign n46_o = ~n45_o;
  /* ni/irq_fifo.vhd:126:50  */
  assign n47_o = n0_o[10:0];
  /* ni/irq_fifo.vhd:128:11  */
  assign n49_o = n47_o == 11'b00000000000;
  /* ni/irq_fifo.vhd:132:11  */
  assign n51_o = n47_o == 11'b00000000001;
  assign n52_o = {n51_o, n49_o};
  /* ni/irq_fifo.vhd:126:33  */
  always @*
    case (n52_o)
      2'b10: n55_o <= 1'b0;
      2'b01: n55_o <= 1'b0;
      default: n55_o <= 1'b1;
    endcase
  /* ni/irq_fifo.vhd:126:33  */
  always @*
    case (n52_o)
      2'b10: n58_o <= 1'b0;
      2'b01: n58_o <= 1'b1;
      default: n58_o <= 1'b0;
    endcase
  /* ni/irq_fifo.vhd:126:33  */
  always @*
    case (n52_o)
      2'b10: n61_o <= 1'b1;
      2'b01: n61_o <= 1'b0;
      default: n61_o <= 1'b0;
    endcase
  /* ni/irq_fifo.vhd:126:33  */
  always @*
    case (n52_o)
      2'b10: n62_o <= data_r_ptr;
      2'b01: n62_o <= irq_r_ptr;
      default: n62_o <= data_r_ptr;
    endcase
  /* ni/irq_fifo.vhd:125:25  */
  assign n64_o = n46_o ? n55_o : 1'b1;
  /* ni/irq_fifo.vhd:125:25  */
  assign n66_o = n46_o ? n58_o : 1'b0;
  /* ni/irq_fifo.vhd:125:25  */
  assign n68_o = n46_o ? n61_o : 1'b0;
  /* ni/irq_fifo.vhd:123:17  */
  assign n69_o = n79_o ? n62_o : data_r_ptr;
  /* ni/irq_fifo.vhd:123:17  */
  assign n71_o = n44_o ? n64_o : 1'b0;
  /* ni/irq_fifo.vhd:123:17  */
  assign n74_o = n44_o ? n66_o : 1'b0;
  /* ni/irq_fifo.vhd:123:17  */
  assign n77_o = n44_o ? n68_o : 1'b0;
  /* ni/irq_fifo.vhd:123:17  */
  assign n79_o = n44_o & n46_o;
  /* ni/irq_fifo.vhd:154:60  */
  assign n81_o = irq_irq_fifo_data_valid & irq_not_full;
  /* ni/irq_fifo.vhd:154:108  */
  assign n82_o = irq_data_fifo_data_valid & data_not_full;
  /* ni/irq_fifo.vhd:154:79  */
  assign n83_o = n81_o | n82_o;
  /* ni/irq_fifo.vhd:164:35  */
  assign tdpram_n87 = tdpram_b_dout; // (signal)
  /* ni/irq_fifo.vhd:146:9  */
  tdp_ram_14_5 tdpram (
    .a_clk(clk),
    .a_wr(n83_o),
    .a_addr(w_ptr),
    .a_din(w_data),
    .b_clk(clk),
    .b_wr(n85_o),
    .b_addr(r_ptr),
    .b_din(n86_o),
    .a_dout(),
    .b_dout(tdpram_b_dout));
  /* ni/irq_fifo.vhd:173:57  */
  assign n94_o = irq_irq_fifo_data_valid & irq_not_full;
  /* ni/irq_fifo.vhd:174:47  */
  assign n96_o = irq_w_ptr == 5'b01111;
  /* ni/irq_fifo.vhd:177:64  */
  assign n98_o = irq_w_ptr + 5'b00001;
  /* ni/irq_fifo.vhd:174:33  */
  assign n100_o = n96_o ? 5'b00000 : n98_o;
  /* ni/irq_fifo.vhd:173:25  */
  assign n101_o = n94_o ? n100_o : irq_w_ptr;
  /* ni/irq_fifo.vhd:171:25  */
  assign n103_o = reset ? 5'b00000 : n101_o;
  /* ni/irq_fifo.vhd:170:17  */
  always @(posedge clk)
    n106_q <= n103_o;
  /* ni/irq_fifo.vhd:189:58  */
  assign n110_o = irq_data_fifo_data_valid & data_not_full;
  /* ni/irq_fifo.vhd:190:48  */
  assign n112_o = data_w_ptr == 5'b10000;
  /* ni/irq_fifo.vhd:193:66  */
  assign n114_o = data_w_ptr - 5'b00001;
  /* ni/irq_fifo.vhd:190:33  */
  assign n116_o = n112_o ? 5'b11111 : n114_o;
  /* ni/irq_fifo.vhd:189:25  */
  assign n117_o = n110_o ? n116_o : data_w_ptr;
  /* ni/irq_fifo.vhd:187:25  */
  assign n119_o = reset ? 5'b11111 : n117_o;
  /* ni/irq_fifo.vhd:186:17  */
  always @(posedge clk)
    n122_q <= n119_o;
  /* ni/irq_fifo.vhd:205:49  */
  assign n126_o = irq_read & irq_not_empty;
  /* ni/irq_fifo.vhd:206:47  */
  assign n128_o = irq_r_ptr == 5'b01111;
  /* ni/irq_fifo.vhd:209:64  */
  assign n130_o = irq_r_ptr + 5'b00001;
  /* ni/irq_fifo.vhd:206:33  */
  assign n132_o = n128_o ? 5'b00000 : n130_o;
  /* ni/irq_fifo.vhd:205:25  */
  assign n133_o = n126_o ? n132_o : irq_r_ptr;
  /* ni/irq_fifo.vhd:203:25  */
  assign n135_o = reset ? 5'b00000 : n133_o;
  /* ni/irq_fifo.vhd:202:17  */
  always @(posedge clk)
    n138_q <= n135_o;
  /* ni/irq_fifo.vhd:221:50  */
  assign n142_o = data_read & data_not_empty;
  /* ni/irq_fifo.vhd:222:48  */
  assign n144_o = data_r_ptr == 5'b10000;
  /* ni/irq_fifo.vhd:225:66  */
  assign n146_o = data_r_ptr - 5'b00001;
  /* ni/irq_fifo.vhd:222:33  */
  assign n148_o = n144_o ? 5'b11111 : n146_o;
  /* ni/irq_fifo.vhd:221:25  */
  assign n149_o = n142_o ? n148_o : data_r_ptr;
  /* ni/irq_fifo.vhd:219:25  */
  assign n151_o = reset ? 5'b11111 : n149_o;
  /* ni/irq_fifo.vhd:218:17  */
  always @(posedge clk)
    n154_q <= n151_o;
  /* ni/irq_fifo.vhd:234:25  */
  assign n159_o = reset ? 1'b0 : next_error;
  /* ni/irq_fifo.vhd:233:17  */
  always @(posedge clk)
    n163_q <= n159_o;
  /* ni/irq_fifo.vhd:233:17  */
  assign n164_o = {n163_q, 18'b000000000000000000, tdpram_n87};
endmodule

