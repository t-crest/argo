module tdp_ram_16_6
  (input  a_clk,
   input  a_wr,
   input  [5:0] a_addr,
   input  [15:0] a_din,
   input  b_clk,
   input  b_wr,
   input  [5:0] b_addr,
   input  [15:0] b_din,
   output [15:0] a_dout,
   output [15:0] b_dout);
  reg [15:0] n431_data; // mem_rd
  reg [15:0] n434_data; // mem_rd
  assign a_dout = n434_data;
  assign b_dout = n431_data;
  /* mem/tdp_ram.vhd:57:5  */
  reg [15:0] mem[63:0] ; // memory
  initial begin
    mem[63] = 16'b0000000000000000;
    mem[62] = 16'b0000000000000000;
    mem[61] = 16'b0000000000000000;
    mem[60] = 16'b0000000000000000;
    mem[59] = 16'b0000000000000000;
    mem[58] = 16'b0000000000000000;
    mem[57] = 16'b0000000000000000;
    mem[56] = 16'b0000000000000000;
    mem[55] = 16'b0000000000000000;
    mem[54] = 16'b0000000000000000;
    mem[53] = 16'b0000000000000000;
    mem[52] = 16'b0000000000000000;
    mem[51] = 16'b0000000000000000;
    mem[50] = 16'b0000000000000000;
    mem[49] = 16'b0000000000000000;
    mem[48] = 16'b0000000000000000;
    mem[47] = 16'b0000000000000000;
    mem[46] = 16'b0000000000000000;
    mem[45] = 16'b0000000000000000;
    mem[44] = 16'b0000000000000000;
    mem[43] = 16'b0000000000000000;
    mem[42] = 16'b0000000000000000;
    mem[41] = 16'b0000000000000000;
    mem[40] = 16'b0000000000000000;
    mem[39] = 16'b0000000000000000;
    mem[38] = 16'b0000000000000000;
    mem[37] = 16'b0000000000000000;
    mem[36] = 16'b0000000000000000;
    mem[35] = 16'b0000000000000000;
    mem[34] = 16'b0000000000000000;
    mem[33] = 16'b0000000000000000;
    mem[32] = 16'b0000000000000000;
    mem[31] = 16'b0000000000000000;
    mem[30] = 16'b0000000000000000;
    mem[29] = 16'b0000000000000000;
    mem[28] = 16'b0000000000000000;
    mem[27] = 16'b0000000000000000;
    mem[26] = 16'b0000000000000000;
    mem[25] = 16'b0000000000000000;
    mem[24] = 16'b0000000000000000;
    mem[23] = 16'b0000000000000000;
    mem[22] = 16'b0000000000000000;
    mem[21] = 16'b0000000000000000;
    mem[20] = 16'b0000000000000000;
    mem[19] = 16'b0000000000000000;
    mem[18] = 16'b0000000000000000;
    mem[17] = 16'b0000000000000000;
    mem[16] = 16'b0000000000000000;
    mem[15] = 16'b0000000000000000;
    mem[14] = 16'b0000000000000000;
    mem[13] = 16'b0000000000000000;
    mem[12] = 16'b0000000000000000;
    mem[11] = 16'b0000000000000000;
    mem[10] = 16'b0000000000000000;
    mem[9] = 16'b0000000000000000;
    mem[8] = 16'b0000000000000000;
    mem[7] = 16'b0000000000000000;
    mem[6] = 16'b0000000000000000;
    mem[5] = 16'b0000000000000000;
    mem[4] = 16'b0000000000000000;
    mem[3] = 16'b0000000000000000;
    mem[2] = 16'b0000000000000000;
    mem[1] = 16'b0000000000000000;
    mem[0] = 16'b0000000000000000;
    end
  always @(posedge b_clk)
    if (b_wr)
      mem[b_addr] <= b_din;
  always @(posedge b_clk)
    if (1'b1)
      n431_data <= mem[b_addr];
  always @(posedge a_clk)
    if (a_wr)
      mem[a_addr] <= a_din;
  always @(posedge a_clk)
    if (1'b1)
      n434_data <= mem[a_addr];
  /* mem/tdp_ram.vhd:104:17  */
  /* mem/tdp_ram.vhd:88:17  */
  /* mem/tdp_ram.vhd:103:9  */
endmodule

module tdp_ram_29_6
  (input  a_clk,
   input  a_wr,
   input  [5:0] a_addr,
   input  [28:0] a_din,
   input  b_clk,
   input  b_wr,
   input  [5:0] b_addr,
   input  [28:0] b_din,
   output [28:0] a_dout,
   output [28:0] b_dout);
  reg [28:0] n392_data; // mem_rd
  reg [28:0] n395_data; // mem_rd
  assign a_dout = n395_data;
  assign b_dout = n392_data;
  /* mem/tdp_ram.vhd:57:5  */
  reg [28:0] mem[63:0] ; // memory
  initial begin
    mem[63] = 29'b00000000000000000000000000000;
    mem[62] = 29'b00000000000000000000000000000;
    mem[61] = 29'b00000000000000000000000000000;
    mem[60] = 29'b00000000000000000000000000000;
    mem[59] = 29'b00000000000000000000000000000;
    mem[58] = 29'b00000000000000000000000000000;
    mem[57] = 29'b00000000000000000000000000000;
    mem[56] = 29'b00000000000000000000000000000;
    mem[55] = 29'b00000000000000000000000000000;
    mem[54] = 29'b00000000000000000000000000000;
    mem[53] = 29'b00000000000000000000000000000;
    mem[52] = 29'b00000000000000000000000000000;
    mem[51] = 29'b00000000000000000000000000000;
    mem[50] = 29'b00000000000000000000000000000;
    mem[49] = 29'b00000000000000000000000000000;
    mem[48] = 29'b00000000000000000000000000000;
    mem[47] = 29'b00000000000000000000000000000;
    mem[46] = 29'b00000000000000000000000000000;
    mem[45] = 29'b00000000000000000000000000000;
    mem[44] = 29'b00000000000000000000000000000;
    mem[43] = 29'b00000000000000000000000000000;
    mem[42] = 29'b00000000000000000000000000000;
    mem[41] = 29'b00000000000000000000000000000;
    mem[40] = 29'b00000000000000000000000000000;
    mem[39] = 29'b00000000000000000000000000000;
    mem[38] = 29'b00000000000000000000000000000;
    mem[37] = 29'b00000000000000000000000000000;
    mem[36] = 29'b00000000000000000000000000000;
    mem[35] = 29'b00000000000000000000000000000;
    mem[34] = 29'b00000000000000000000000000000;
    mem[33] = 29'b00000000000000000000000000000;
    mem[32] = 29'b00000000000000000000000000000;
    mem[31] = 29'b00000000000000000000000000000;
    mem[30] = 29'b00000000000000000000000000000;
    mem[29] = 29'b00000000000000000000000000000;
    mem[28] = 29'b00000000000000000000000000000;
    mem[27] = 29'b00000000000000000000000000000;
    mem[26] = 29'b00000000000000000000000000000;
    mem[25] = 29'b00000000000000000000000000000;
    mem[24] = 29'b00000000000000000000000000000;
    mem[23] = 29'b00000000000000000000000000000;
    mem[22] = 29'b00000000000000000000000000000;
    mem[21] = 29'b00000000000000000000000000000;
    mem[20] = 29'b00000000000000000000000000000;
    mem[19] = 29'b00000000000000000000000000000;
    mem[18] = 29'b00000000000000000000000000000;
    mem[17] = 29'b00000000000000000000000000000;
    mem[16] = 29'b00000000000000000000000000000;
    mem[15] = 29'b00000000000000000000000000000;
    mem[14] = 29'b00000000000000000000000000000;
    mem[13] = 29'b00000000000000000000000000000;
    mem[12] = 29'b00000000000000000000000000000;
    mem[11] = 29'b00000000000000000000000000000;
    mem[10] = 29'b00000000000000000000000000000;
    mem[9] = 29'b00000000000000000000000000000;
    mem[8] = 29'b00000000000000000000000000000;
    mem[7] = 29'b00000000000000000000000000000;
    mem[6] = 29'b00000000000000000000000000000;
    mem[5] = 29'b00000000000000000000000000000;
    mem[4] = 29'b00000000000000000000000000000;
    mem[3] = 29'b00000000000000000000000000000;
    mem[2] = 29'b00000000000000000000000000000;
    mem[1] = 29'b00000000000000000000000000000;
    mem[0] = 29'b00000000000000000000000000000;
    end
  always @(posedge b_clk)
    if (b_wr)
      mem[b_addr] <= b_din;
  always @(posedge b_clk)
    if (1'b1)
      n392_data <= mem[b_addr];
  always @(posedge a_clk)
    if (a_wr)
      mem[a_addr] <= a_din;
  always @(posedge a_clk)
    if (1'b1)
      n395_data <= mem[a_addr];
  /* mem/tdp_ram.vhd:104:17  */
  /* mem/tdp_ram.vhd:88:17  */
  /* mem/tdp_ram.vhd:103:9  */
endmodule

module packet_manager
  (input  clk,
   input  reset,
   input  [13:0] config_addr,
   input  config_en,
   input  config_wr,
   input  [31:0] config_wdata,
   input  sel,
   input  [63:0] spm_slv_rdata,
   input  spm_slv_error,
   input  [5:0] dma_num,
   input  dma_en,
   input  [15:0] route,
   input  mc,
   input  [1:0] mc_idx,
   input  [1:0] mc_p,
   input  [3:0] pkt_len,
   output [31:0] config_slv_rdata,
   output config_slv_error,
   output [13:0] spm_addr,
   output [1:0] spm_en,
   output spm_wr,
   output [63:0] spm_wdata,
   output [34:0] pkt_out);
  wire [47:0] n0_o;
  wire [31:0] n2_o;
  wire n3_o;
  wire [13:0] n5_o;
  wire [1:0] n6_o;
  wire n7_o;
  wire [63:0] n8_o;
  wire [64:0] n9_o;
  wire [2:0] state;
  wire [2:0] next_state;
  wire [44:0] dmatbl_data;
  wire [13:0] count_reg;
  wire [13:0] count_next;
  wire [1:0] pkt_type;
  wire dma_en_reg;
  wire [13:0] read_ptr_reg;
  wire [13:0] read_ptr_next;
  wire hi_lo_next;
  wire hi_lo_reg;
  wire port_b_wr;
  wire [5:0] port_b_addr;
  wire [44:0] port_b_din;
  wire [44:0] port_b_dout;
  wire [5:0] dma_num_reg;
  wire dma_update_en;
  wire [5:0] dma_update_addr;
  wire [44:0] dma_update_data;
  wire port_a_wr_hi;
  wire port_a_wr_lo;
  wire [5:0] port_a_addr;
  wire [44:0] port_a_din;
  wire [44:0] port_a_dout;
  wire config_slv_error_next;
  wire [3:0] pkt_len_reg;
  wire [3:0] pkt_len_next;
  wire [15:0] route_reg;
  wire [31:0] payload_data;
  wire [31:0] payload_data_next;
  wire [13:0] n17_o;
  wire [3:0] n18_o;
  wire [1:0] n19_o;
  wire n21_o;
  wire [1:0] n23_o;
  wire [4:0] n25_o;
  wire [7:0] n27_o;
  wire [18:0] n29_o;
  wire [34:0] n30_o;
  wire n31_o;
  wire [13:0] n33_o;
  wire [13:0] n34_o;
  wire [13:0] n35_o;
  wire [13:0] n37_o;
  wire [13:0] n38_o;
  wire [13:0] n39_o;
  wire n40_o;
  wire [1:0] n41_o;
  wire n43_o;
  wire [1:0] n45_o;
  wire n47_o;
  wire n48_o;
  wire [13:0] n49_o;
  wire [13:0] n50_o;
  wire [13:0] n51_o;
  wire [13:0] n52_o;
  wire [13:0] n53_o;
  wire [13:0] n54_o;
  wire [13:0] n55_o;
  wire [13:0] n56_o;
  wire [13:0] n57_o;
  wire [1:0] n58_o;
  wire n60_o;
  wire [3:0] n61_o;
  wire [3:0] n62_o;
  wire [3:0] n63_o;
  wire [9:0] n64_o;
  wire [3:0] n66_o;
  wire [4:0] n68_o;
  wire [13:0] n69_o;
  wire [18:0] n70_o;
  wire [34:0] n71_o;
  wire [15:0] n72_o;
  wire [15:0] n73_o;
  wire [15:0] n74_o;
  wire [34:0] n76_o;
  wire [2:0] n78_o;
  wire [13:0] n79_o;
  wire n80_o;
  wire [13:0] n81_o;
  wire n84_o;
  wire [13:0] n85_o;
  wire [28:0] n86_o;
  wire [13:0] n87_o;
  wire [13:0] n88_o;
  wire [27:0] n89_o;
  wire [28:0] n90_o;
  wire [28:0] n91_o;
  wire [3:0] n92_o;
  wire [15:0] n93_o;
  wire [15:0] n94_o;
  wire [34:0] n95_o;
  wire [2:0] n97_o;
  wire [13:0] n98_o;
  wire [1:0] n99_o;
  wire [13:0] n100_o;
  wire n102_o;
  wire [13:0] n103_o;
  wire [13:0] n104_o;
  wire [27:0] n105_o;
  wire [28:0] n106_o;
  wire [28:0] n107_o;
  wire [3:0] n108_o;
  wire [1:0] n110_o;
  wire [1:0] n112_o;
  wire [15:0] n113_o;
  wire [15:0] n114_o;
  wire [34:0] n116_o;
  wire [2:0] n117_o;
  wire [13:0] n118_o;
  wire [1:0] n119_o;
  wire [13:0] n120_o;
  wire n122_o;
  wire [13:0] n123_o;
  wire [13:0] n124_o;
  wire [27:0] n125_o;
  wire [28:0] n126_o;
  wire [28:0] n127_o;
  wire [3:0] n128_o;
  wire [1:0] n130_o;
  wire [1:0] n132_o;
  wire n134_o;
  wire [31:0] n135_o;
  wire [3:0] n137_o;
  wire [13:0] n139_o;
  wire n141_o;
  wire n143_o;
  wire n144_o;
  wire [31:0] n145_o;
  wire [34:0] n147_o;
  wire [13:0] n149_o;
  wire [31:0] n150_o;
  wire [34:0] n152_o;
  wire [34:0] n153_o;
  wire [2:0] n156_o;
  wire [13:0] n157_o;
  wire n159_o;
  wire [3:0] n161_o;
  wire [13:0] n163_o;
  wire n165_o;
  wire n167_o;
  wire n168_o;
  wire [34:0] n170_o;
  wire [13:0] n173_o;
  wire [34:0] n175_o;
  wire [15:0] n176_o;
  wire [15:0] n177_o;
  wire [15:0] n178_o;
  wire [34:0] n179_o;
  wire [2:0] n182_o;
  wire [13:0] n183_o;
  wire n185_o;
  wire [34:0] n187_o;
  wire n189_o;
  wire [34:0] n191_o;
  wire n193_o;
  wire [4:0] n194_o;
  wire [15:0] n195_o;
  reg [15:0] n197_o;
  reg [34:0] n199_o;
  reg [2:0] n204_o;
  reg [13:0] n206_o;
  reg [1:0] n208_o;
  reg [13:0] n210_o;
  reg n213_o;
  wire [13:0] n215_o;
  reg [13:0] n217_o;
  wire [27:0] n218_o;
  wire [28:0] n219_o;
  reg [28:0] n221_o;
  wire [1:0] n223_o;
  reg [3:0] n225_o;
  wire [1:0] n226_o;
  reg [1:0] n229_o;
  wire [13:0] n230_o;
  reg [13:0] n233_o;
  wire [1:0] n234_o;
  reg [1:0] n237_o;
  wire [13:0] n238_o;
  reg [13:0] n241_o;
  wire [5:0] n248_o;
  localparam [31:0] n249_o = 32'b00000000000000000000000000000000;
  wire n250_o;
  wire [27:0] n251_o;
  wire [15:0] n252_o;
  wire n253_o;
  wire n254_o;
  wire n255_o;
  wire n256_o;
  wire n257_o;
  wire n258_o;
  wire n259_o;
  wire n261_o;
  wire n263_o;
  wire n266_o;
  wire n268_o;
  wire n269_o;
  wire [27:0] n270_o;
  wire [15:0] n271_o;
  wire [15:0] n272_o;
  wire [15:0] n273_o;
  wire [11:0] n274_o;
  wire [11:0] n275_o;
  wire [11:0] n276_o;
  wire n277_o;
  wire n278_o;
  wire [2:0] n281_o;
  wire n285_o;
  wire [5:0] n286_o;
  wire [28:0] dmatbl1_a_dout;
  wire [28:0] dmatbl1_b_dout;
  wire [28:0] n288_o;
  wire [28:0] n290_o;
  wire [15:0] dmatbl2_a_dout;
  wire [15:0] dmatbl2_b_dout;
  wire [15:0] n292_o;
  wire [15:0] n294_o;
  wire [3:0] n297_o;
  wire n299_o;
  wire n300_o;
  wire n303_o;
  wire n309_o;
  reg n312_q;
  wire n316_o;
  reg n319_q;
  wire n323_o;
  reg n327_q;
  wire [2:0] n331_o;
  reg [2:0] n334_q;
  reg [13:0] n344_q;
  reg [13:0] n345_q;
  reg [5:0] n346_q;
  reg [3:0] n347_q;
  reg [15:0] n348_q;
  reg [31:0] n349_q;
  wire [44:0] n350_o;
  wire [44:0] n351_o;
  wire [44:0] n352_o;
  wire [44:0] n353_o;
  wire [31:0] n354_o;
  wire [32:0] n355_o;
  wire [80:0] n356_o;
  assign config_slv_rdata = n2_o;
  assign config_slv_error = n3_o;
  assign spm_addr = n5_o;
  assign spm_en = n6_o;
  assign spm_wr = n7_o;
  assign spm_wdata = n8_o;
  assign pkt_out = n199_o;
  assign n0_o = {config_wdata, config_wr, config_en, config_addr};
  assign n2_o = n355_o[31:0];
  assign n3_o = n355_o[32];
  assign n5_o = n356_o[13:0];
  assign n6_o = n356_o[15:14];
  assign n7_o = n356_o[16];
  assign n8_o = n356_o[80:17];
  assign n9_o = {spm_slv_error, spm_slv_rdata};
  /* ni/packet_manager.vhd:78:8  */
  assign state = n334_q; // (signal)
  /* ni/packet_manager.vhd:78:15  */
  assign next_state = n204_o; // (signal)
  /* ni/packet_manager.vhd:83:8  */
  assign dmatbl_data = port_b_dout; // (signal)
  /* ni/packet_manager.vhd:94:8  */
  assign count_reg = n344_q; // (signal)
  /* ni/packet_manager.vhd:94:19  */
  assign count_next = n206_o; // (signal)
  /* ni/packet_manager.vhd:101:8  */
  assign pkt_type = n208_o; // (signal)
  /* ni/packet_manager.vhd:103:8  */
  assign dma_en_reg = n312_q; // (signal)
  /* ni/packet_manager.vhd:105:8  */
  assign read_ptr_reg = n345_q; // (signal)
  /* ni/packet_manager.vhd:105:22  */
  assign read_ptr_next = n210_o; // (signal)
  /* ni/packet_manager.vhd:107:8  */
  assign hi_lo_next = n268_o; // (signal)
  /* ni/packet_manager.vhd:108:8  */
  assign hi_lo_reg = n319_q; // (signal)
  /* ni/packet_manager.vhd:110:8  */
  assign port_b_wr = n285_o; // (signal)
  /* ni/packet_manager.vhd:111:8  */
  assign port_b_addr = n286_o; // (signal)
  /* ni/packet_manager.vhd:112:8  */
  assign port_b_din = dma_update_data; // (signal)
  /* ni/packet_manager.vhd:113:8  */
  assign port_b_dout = n350_o; // (signal)
  /* ni/packet_manager.vhd:115:8  */
  assign dma_num_reg = n346_q; // (signal)
  /* ni/packet_manager.vhd:116:8  */
  assign dma_update_en = n213_o; // (signal)
  /* ni/packet_manager.vhd:117:8  */
  assign dma_update_addr = dma_num_reg; // (signal)
  /* ni/packet_manager.vhd:118:8  */
  assign dma_update_data = n351_o; // (signal)
  /* ni/packet_manager.vhd:131:8  */
  assign port_a_wr_hi = n263_o; // (signal)
  /* ni/packet_manager.vhd:132:8  */
  assign port_a_wr_lo = n266_o; // (signal)
  /* ni/packet_manager.vhd:133:8  */
  assign port_a_addr = n248_o; // (signal)
  /* ni/packet_manager.vhd:134:8  */
  assign port_a_din = n352_o; // (signal)
  /* ni/packet_manager.vhd:135:8  */
  assign port_a_dout = n353_o; // (signal)
  /* ni/packet_manager.vhd:137:8  */
  assign config_slv_error_next = n303_o; // (signal)
  /* ni/packet_manager.vhd:139:8  */
  assign pkt_len_reg = n347_q; // (signal)
  /* ni/packet_manager.vhd:139:21  */
  assign pkt_len_next = n225_o; // (signal)
  /* ni/packet_manager.vhd:141:8  */
  assign route_reg = n348_q; // (signal)
  /* ni/packet_manager.vhd:147:8  */
  assign payload_data = n349_q; // (signal)
  /* ni/packet_manager.vhd:147:22  */
  assign payload_data_next = n354_o; // (signal)
  assign n17_o = dmatbl_data[29:16];
  /* ni/packet_manager.vhd:167:3  */
  assign n18_o = dma_en ? pkt_len : pkt_len_reg;
  assign n19_o = dmatbl_data[15:14];
  /* ni/packet_manager.vhd:179:26  */
  assign n21_o = $unsigned(pkt_len_reg) >= $unsigned(4'b0001);
  /* ni/packet_manager.vhd:179:11  */
  assign n23_o = n21_o ? 2'b01 : n19_o;
  /* ni/packet_manager.vhd:182:49  */
  assign n25_o = {3'b110, pkt_type};
  /* ni/packet_manager.vhd:182:60  */
  assign n27_o = {n25_o, 3'b011};
  /* ni/packet_manager.vhd:182:70  */
  assign n29_o = {n27_o, 11'b00000000000};
  /* ni/packet_manager.vhd:182:103  */
  assign n30_o = {n29_o, route_reg};
  assign n31_o = dmatbl_data[44];
  assign n33_o = dmatbl_data[29:16];
  assign n34_o = dmatbl_data[29:16];
  assign n35_o = dmatbl_data[43:30];
  /* ni/packet_manager.vhd:191:30  */
  assign n37_o = n35_o - 14'b00000000000001;
  assign n38_o = dmatbl_data[43:30];
  /* ni/packet_manager.vhd:192:20  */
  assign n39_o = {10'b0, pkt_len_reg};  //  uext
  /* ni/packet_manager.vhd:192:20  */
  assign n40_o = $unsigned(n38_o) > $unsigned(n39_o);
  assign n41_o = dmatbl_data[15:14];
  /* ni/packet_manager.vhd:193:29  */
  assign n43_o = n41_o == 2'b10;
  /* ni/packet_manager.vhd:185:9  */
  assign n45_o = n80_o ? 2'b00 : n19_o;
  /* ni/packet_manager.vhd:192:11  */
  assign n47_o = n40_o & n43_o;
  /* ni/packet_manager.vhd:192:11  */
  assign n48_o = n40_o ? 1'b1 : 1'b0;
  /* ni/packet_manager.vhd:199:43  */
  assign n49_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:199:68  */
  assign n50_o = {10'b0, pkt_len_reg};  //  uext
  /* ni/packet_manager.vhd:199:68  */
  assign n51_o = n49_o + n50_o;
  assign n52_o = dmatbl_data[29:16];
  /* ni/packet_manager.vhd:200:39  */
  assign n53_o = {10'b0, pkt_len_reg};  //  uext
  /* ni/packet_manager.vhd:200:39  */
  assign n54_o = n52_o + n53_o;
  assign n55_o = dmatbl_data[43:30];
  /* ni/packet_manager.vhd:201:33  */
  assign n56_o = {10'b0, pkt_len_reg};  //  uext
  /* ni/packet_manager.vhd:201:33  */
  assign n57_o = n55_o - n56_o;
  assign n58_o = dmatbl_data[15:14];
  /* ni/packet_manager.vhd:202:27  */
  assign n60_o = n58_o == 2'b01;
  /* ni/packet_manager.vhd:205:43  */
  assign n61_o = dmatbl_data[13:10];
  assign n62_o = n51_o[13:10];
  /* ni/packet_manager.vhd:202:11  */
  assign n63_o = n60_o ? n61_o : n62_o;
  assign n64_o = n51_o[9:0];
  /* ni/packet_manager.vhd:207:39  */
  assign n66_o = pkt_len_reg - 4'b0001;
  /* ni/packet_manager.vhd:208:49  */
  assign n68_o = {3'b110, pkt_type};
  /* ni/packet_manager.vhd:208:68  */
  assign n69_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:208:60  */
  assign n70_o = {n68_o, n69_o};
  /* ni/packet_manager.vhd:208:93  */
  assign n71_o = {n70_o, route_reg};
  assign n72_o = {2'b11, n33_o};
  assign n73_o = {2'b00, n17_o};
  /* ni/packet_manager.vhd:185:9  */
  assign n74_o = n31_o ? n72_o : n73_o;
  /* ni/packet_manager.vhd:185:9  */
  assign n76_o = n31_o ? n71_o : 35'b00000000000000000000000000000000000;
  /* ni/packet_manager.vhd:185:9  */
  assign n78_o = n31_o ? 3'b001 : state;
  /* ni/packet_manager.vhd:185:9  */
  assign n79_o = n31_o ? n37_o : count_reg;
  /* ni/packet_manager.vhd:185:9  */
  assign n80_o = n31_o & n47_o;
  /* ni/packet_manager.vhd:185:9  */
  assign n81_o = n31_o ? n34_o : read_ptr_reg;
  /* ni/packet_manager.vhd:185:9  */
  assign n84_o = n31_o ? 1'b1 : 1'b0;
  assign n85_o = {n63_o, n64_o};
  assign n86_o = {n48_o, n57_o, n54_o};
  assign n87_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:185:9  */
  assign n88_o = n31_o ? n85_o : n87_o;
  assign n89_o = dmatbl_data[43:16];
  assign n90_o = {1'b0, n89_o};
  /* ni/packet_manager.vhd:185:9  */
  assign n91_o = n31_o ? n86_o : n90_o;
  /* ni/packet_manager.vhd:185:9  */
  assign n92_o = n31_o ? n66_o : n18_o;
  assign n93_o = {2'b00, n17_o};
  /* ni/packet_manager.vhd:177:9  */
  assign n94_o = mc ? n93_o : n74_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n95_o = mc ? n30_o : n76_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n97_o = mc ? 3'b011 : n78_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n98_o = mc ? count_reg : n79_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n99_o = mc ? n23_o : n45_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n100_o = mc ? read_ptr_reg : n81_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n102_o = mc ? 1'b0 : n84_o;
  assign n103_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:177:9  */
  assign n104_o = mc ? n103_o : n88_o;
  assign n105_o = dmatbl_data[43:16];
  assign n106_o = {1'b0, n105_o};
  /* ni/packet_manager.vhd:177:9  */
  assign n107_o = mc ? n106_o : n91_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n108_o = mc ? n18_o : n92_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n110_o = mc ? mc_idx : 2'b00;
  /* ni/packet_manager.vhd:177:9  */
  assign n112_o = mc ? mc_p : 2'b00;
  assign n113_o = {2'b00, n17_o};
  /* ni/packet_manager.vhd:176:7  */
  assign n114_o = dma_en_reg ? n94_o : n113_o;
  /* ni/packet_manager.vhd:176:7  */
  assign n116_o = dma_en_reg ? n95_o : 35'b00000000000000000000000000000000000;
  /* ni/packet_manager.vhd:176:7  */
  assign n117_o = dma_en_reg ? n97_o : state;
  /* ni/packet_manager.vhd:176:7  */
  assign n118_o = dma_en_reg ? n98_o : count_reg;
  /* ni/packet_manager.vhd:176:7  */
  assign n119_o = dma_en_reg ? n99_o : n19_o;
  /* ni/packet_manager.vhd:176:7  */
  assign n120_o = dma_en_reg ? n100_o : read_ptr_reg;
  /* ni/packet_manager.vhd:176:7  */
  assign n122_o = dma_en_reg ? n102_o : 1'b0;
  assign n123_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:176:7  */
  assign n124_o = dma_en_reg ? n104_o : n123_o;
  assign n125_o = dmatbl_data[43:16];
  assign n126_o = {1'b0, n125_o};
  /* ni/packet_manager.vhd:176:7  */
  assign n127_o = dma_en_reg ? n107_o : n126_o;
  /* ni/packet_manager.vhd:176:7  */
  assign n128_o = dma_en_reg ? n108_o : n18_o;
  /* ni/packet_manager.vhd:176:7  */
  assign n130_o = dma_en_reg ? n110_o : 2'b00;
  /* ni/packet_manager.vhd:176:7  */
  assign n132_o = dma_en_reg ? n112_o : 2'b00;
  /* ni/packet_manager.vhd:175:5  */
  assign n134_o = state == 3'b000;
  /* ni/packet_manager.vhd:213:41  */
  assign n135_o = n9_o[31:0];
  /* ni/packet_manager.vhd:214:35  */
  assign n137_o = pkt_len_reg - 4'b0001;
  /* ni/packet_manager.vhd:215:31  */
  assign n139_o = count_reg - 14'b00000000000001;
  /* ni/packet_manager.vhd:216:22  */
  assign n141_o = $unsigned(pkt_len_reg) > $unsigned(4'b0000);
  /* ni/packet_manager.vhd:216:40  */
  assign n143_o = $unsigned(count_reg) > $unsigned(14'b00000000000000);
  /* ni/packet_manager.vhd:216:26  */
  assign n144_o = n141_o & n143_o;
  /* ni/packet_manager.vhd:218:58  */
  assign n145_o = n9_o[63:32];
  /* ni/packet_manager.vhd:218:43  */
  assign n147_o = {3'b100, n145_o};
  /* ni/packet_manager.vhd:219:39  */
  assign n149_o = read_ptr_reg + 14'b00000000000001;
  /* ni/packet_manager.vhd:222:62  */
  assign n150_o = n9_o[63:32];
  /* ni/packet_manager.vhd:222:47  */
  assign n152_o = {3'b101, n150_o};
  /* ni/packet_manager.vhd:216:7  */
  assign n153_o = n144_o ? n147_o : n152_o;
  /* ni/packet_manager.vhd:216:7  */
  assign n156_o = n144_o ? 3'b010 : 3'b000;
  /* ni/packet_manager.vhd:216:7  */
  assign n157_o = n144_o ? n149_o : read_ptr_reg;
  /* ni/packet_manager.vhd:212:5  */
  assign n159_o = state == 3'b001;
  /* ni/packet_manager.vhd:226:35  */
  assign n161_o = pkt_len_reg - 4'b0001;
  /* ni/packet_manager.vhd:227:31  */
  assign n163_o = count_reg - 14'b00000000000001;
  /* ni/packet_manager.vhd:228:22  */
  assign n165_o = $unsigned(pkt_len_reg) > $unsigned(4'b0000);
  /* ni/packet_manager.vhd:228:40  */
  assign n167_o = $unsigned(count_reg) > $unsigned(14'b00000000000000);
  /* ni/packet_manager.vhd:228:26  */
  assign n168_o = n165_o & n167_o;
  /* ni/packet_manager.vhd:230:43  */
  assign n170_o = {3'b100, payload_data};
  /* ni/packet_manager.vhd:232:39  */
  assign n173_o = read_ptr_reg + 14'b00000000000001;
  /* ni/packet_manager.vhd:238:47  */
  assign n175_o = {3'b101, payload_data};
  assign n176_o = {2'b11, read_ptr_next};
  assign n177_o = {2'b00, n17_o};
  /* ni/packet_manager.vhd:228:7  */
  assign n178_o = n168_o ? n176_o : n177_o;
  /* ni/packet_manager.vhd:228:7  */
  assign n179_o = n168_o ? n170_o : n175_o;
  /* ni/packet_manager.vhd:228:7  */
  assign n182_o = n168_o ? 3'b001 : 3'b000;
  /* ni/packet_manager.vhd:228:7  */
  assign n183_o = n168_o ? n173_o : read_ptr_reg;
  /* ni/packet_manager.vhd:225:5  */
  assign n185_o = state == 3'b010;
  /* ni/packet_manager.vhd:243:41  */
  assign n187_o = {3'b100, payload_data};
  /* ni/packet_manager.vhd:241:5  */
  assign n189_o = state == 3'b011;
  /* ni/packet_manager.vhd:247:45  */
  assign n191_o = {3'b101, payload_data};
  /* ni/packet_manager.vhd:245:5  */
  assign n193_o = state == 3'b100;
  assign n194_o = {n193_o, n189_o, n185_o, n159_o, n134_o};
  assign n195_o = {2'b00, n17_o};
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n194_o)
      5'b10000: n197_o <= n195_o;
      5'b01000: n197_o <= n195_o;
      5'b00100: n197_o <= n178_o;
      5'b00010: n197_o <= n195_o;
      5'b00001: n197_o <= n114_o;
      default: n197_o <= 16'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n194_o)
      5'b10000: n199_o <= n191_o;
      5'b01000: n199_o <= n187_o;
      5'b00100: n199_o <= n179_o;
      5'b00010: n199_o <= n153_o;
      5'b00001: n199_o <= n116_o;
      default: n199_o <= 35'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n194_o)
      5'b10000: n204_o <= 3'b000;
      5'b01000: n204_o <= 3'b100;
      5'b00100: n204_o <= n182_o;
      5'b00010: n204_o <= n156_o;
      5'b00001: n204_o <= n117_o;
      default: n204_o <= 3'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n194_o)
      5'b10000: n206_o <= count_reg;
      5'b01000: n206_o <= count_reg;
      5'b00100: n206_o <= n163_o;
      5'b00010: n206_o <= n139_o;
      5'b00001: n206_o <= n118_o;
      default: n206_o <= 14'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n194_o)
      5'b10000: n208_o <= n19_o;
      5'b01000: n208_o <= n19_o;
      5'b00100: n208_o <= n19_o;
      5'b00010: n208_o <= n19_o;
      5'b00001: n208_o <= n119_o;
      default: n208_o <= 2'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n194_o)
      5'b10000: n210_o <= read_ptr_reg;
      5'b01000: n210_o <= read_ptr_reg;
      5'b00100: n210_o <= n183_o;
      5'b00010: n210_o <= n157_o;
      5'b00001: n210_o <= n120_o;
      default: n210_o <= 14'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n194_o)
      5'b10000: n213_o <= 1'b0;
      5'b01000: n213_o <= 1'b0;
      5'b00100: n213_o <= 1'b0;
      5'b00010: n213_o <= 1'b0;
      5'b00001: n213_o <= n122_o;
      default: n213_o <= 1'bX;
    endcase
  assign n215_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n194_o)
      5'b10000: n217_o <= n215_o;
      5'b01000: n217_o <= n215_o;
      5'b00100: n217_o <= n215_o;
      5'b00010: n217_o <= n215_o;
      5'b00001: n217_o <= n124_o;
      default: n217_o <= 14'bX;
    endcase
  assign n218_o = dmatbl_data[43:16];
  assign n219_o = {1'b0, n218_o};
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n194_o)
      5'b10000: n221_o <= n219_o;
      5'b01000: n221_o <= n219_o;
      5'b00100: n221_o <= n219_o;
      5'b00010: n221_o <= n219_o;
      5'b00001: n221_o <= n127_o;
      default: n221_o <= 29'bX;
    endcase
  assign n223_o = dmatbl_data[15:14];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n194_o)
      5'b10000: n225_o <= n18_o;
      5'b01000: n225_o <= n18_o;
      5'b00100: n225_o <= n161_o;
      5'b00010: n225_o <= n137_o;
      5'b00001: n225_o <= n128_o;
      default: n225_o <= 4'bX;
    endcase
  assign n226_o = n135_o[1:0];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n194_o)
      5'b10000: n229_o <= 2'b00;
      5'b01000: n229_o <= 2'b00;
      5'b00100: n229_o <= 2'b00;
      5'b00010: n229_o <= n226_o;
      5'b00001: n229_o <= n130_o;
      default: n229_o <= 2'bX;
    endcase
  assign n230_o = n135_o[15:2];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n194_o)
      5'b10000: n233_o <= 14'b00000000000000;
      5'b01000: n233_o <= 14'b00000000000000;
      5'b00100: n233_o <= 14'b00000000000000;
      5'b00010: n233_o <= n230_o;
      5'b00001: n233_o <= 14'b00000000000000;
      default: n233_o <= 14'bX;
    endcase
  assign n234_o = n135_o[17:16];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n194_o)
      5'b10000: n237_o <= 2'b00;
      5'b01000: n237_o <= 2'b00;
      5'b00100: n237_o <= 2'b00;
      5'b00010: n237_o <= n234_o;
      5'b00001: n237_o <= n132_o;
      default: n237_o <= 2'bX;
    endcase
  assign n238_o = n135_o[31:18];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n194_o)
      5'b10000: n241_o <= 14'b00000000000000;
      5'b01000: n241_o <= 14'b00000000000000;
      5'b00100: n241_o <= 14'b00000000000000;
      5'b00010: n241_o <= n238_o;
      5'b00001: n241_o <= 14'b00000000000000;
      default: n241_o <= 14'bX;
    endcase
  /* ni/packet_manager.vhd:256:29  */
  assign n248_o = n0_o[6:1];
  /* ni/packet_manager.vhd:259:52  */
  assign n250_o = n0_o[47];
  /* ni/packet_manager.vhd:262:26  */
  assign n251_o = n0_o[43:16];
  /* ni/packet_manager.vhd:264:48  */
  assign n252_o = n0_o[31:16];
  /* ni/packet_manager.vhd:266:17  */
  assign n253_o = n0_o[0];
  /* ni/packet_manager.vhd:272:28  */
  assign n254_o = n0_o[15];
  /* ni/packet_manager.vhd:272:31  */
  assign n255_o = n254_o & sel;
  /* ni/packet_manager.vhd:273:20  */
  assign n256_o = n0_o[0];
  /* ni/packet_manager.vhd:273:24  */
  assign n257_o = ~n256_o;
  /* ni/packet_manager.vhd:277:28  */
  assign n258_o = n0_o[15];
  /* ni/packet_manager.vhd:277:31  */
  assign n259_o = n258_o & sel;
  /* ni/packet_manager.vhd:273:3  */
  assign n261_o = n257_o ? n259_o : 1'b0;
  /* ni/packet_manager.vhd:266:3  */
  assign n263_o = n253_o ? n255_o : 1'b0;
  /* ni/packet_manager.vhd:266:3  */
  assign n266_o = n253_o ? 1'b0 : n261_o;
  /* ni/packet_manager.vhd:280:28  */
  assign n268_o = n0_o[0];
  /* ni/packet_manager.vhd:282:50  */
  assign n269_o = port_a_dout[44];
  /* ni/packet_manager.vhd:284:32  */
  assign n270_o = port_a_dout[43:16];
  /* ni/packet_manager.vhd:287:48  */
  assign n271_o = port_a_dout[15:0];
  assign n272_o = n270_o[15:0];
  /* ni/packet_manager.vhd:281:3  */
  assign n273_o = hi_lo_reg ? n272_o : n271_o;
  assign n274_o = n270_o[27:16];
  assign n275_o = n249_o[27:16];
  /* ni/packet_manager.vhd:281:3  */
  assign n276_o = hi_lo_reg ? n274_o : n275_o;
  assign n277_o = n249_o[31];
  /* ni/packet_manager.vhd:281:3  */
  assign n278_o = hi_lo_reg ? n269_o : n277_o;
  assign n281_o = n249_o[30:28];
  /* ni/packet_manager.vhd:297:3  */
  assign n285_o = dma_en ? 1'b0 : dma_update_en;
  /* ni/packet_manager.vhd:297:3  */
  assign n286_o = dma_en ? dma_num : dma_update_addr;
  /* ni/packet_manager.vhd:308:1  */
  tdp_ram_29_6 dmatbl1 (
    .a_clk(clk),
    .a_wr(port_a_wr_hi),
    .a_addr(port_a_addr),
    .a_din(n288_o),
    .b_clk(clk),
    .b_wr(port_b_wr),
    .b_addr(port_b_addr),
    .b_din(n290_o),
    .a_dout(dmatbl1_a_dout),
    .b_dout(dmatbl1_b_dout));
  /* ni/packet_manager.vhd:317:26  */
  assign n288_o = port_a_din[44:16];
  /* ni/packet_manager.vhd:322:26  */
  assign n290_o = port_b_din[44:16];
  /* ni/packet_manager.vhd:327:3  */
  tdp_ram_16_6 dmatbl2 (
    .a_clk(clk),
    .a_wr(port_a_wr_lo),
    .a_addr(port_a_addr),
    .a_din(n292_o),
    .b_clk(clk),
    .b_wr(port_b_wr),
    .b_addr(port_b_addr),
    .b_din(n294_o),
    .a_dout(dmatbl2_a_dout),
    .b_dout(dmatbl2_b_dout));
  /* ni/packet_manager.vhd:336:26  */
  assign n292_o = port_a_din[15:0];
  /* ni/packet_manager.vhd:341:26  */
  assign n294_o = port_b_din[15:0];
  /* ni/packet_manager.vhd:348:31  */
  assign n297_o = n0_o[10:7];
  /* ni/packet_manager.vhd:348:77  */
  assign n299_o = n297_o != 4'b0000;
  /* ni/packet_manager.vhd:348:16  */
  assign n300_o = sel & n299_o;
  /* ni/packet_manager.vhd:348:3  */
  assign n303_o = n300_o ? 1'b1 : 1'b0;
  /* ni/packet_manager.vhd:357:5  */
  assign n309_o = reset ? 1'b0 : dma_en;
  /* ni/packet_manager.vhd:356:3  */
  always @(posedge clk)
    n312_q <= n309_o;
  /* ni/packet_manager.vhd:368:5  */
  assign n316_o = reset ? 1'b0 : hi_lo_next;
  /* ni/packet_manager.vhd:367:3  */
  always @(posedge clk)
    n319_q <= n316_o;
  /* ni/packet_manager.vhd:379:5  */
  assign n323_o = reset ? 1'b0 : config_slv_error_next;
  /* ni/packet_manager.vhd:378:3  */
  always @(posedge clk)
    n327_q <= n323_o;
  /* ni/packet_manager.vhd:390:5  */
  assign n331_o = reset ? 3'b000 : next_state;
  /* ni/packet_manager.vhd:389:3  */
  always @(posedge clk)
    n334_q <= n331_o;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n344_q <= count_next;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n345_q <= read_ptr_next;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n346_q <= dma_num;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n347_q <= pkt_len_next;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n348_q <= route;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n349_q <= payload_data_next;
  /* ni/packet_manager.vhd:401:3  */
  assign n350_o = {dmatbl1_b_dout, dmatbl2_b_dout};
  assign n351_o = {n221_o, n223_o, n217_o};
  assign n352_o = {n250_o, n251_o, n252_o};
  assign n353_o = {dmatbl1_a_dout, dmatbl2_a_dout};
  assign n354_o = {n241_o, n237_o, n233_o, n229_o};
  assign n355_o = {n327_q, n278_o, n281_o, n276_o, n273_o};
  assign n356_o = {64'b0000000000000000000000000000000000000000000000000000000000000000, 1'b0, n197_o};
endmodule

