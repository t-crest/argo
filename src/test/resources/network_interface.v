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
  reg [13:0] n1722_data; // mem_rd
  reg [13:0] n1725_data; // mem_rd
  assign a_dout = n1725_data;
  assign b_dout = n1722_data;
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
      n1722_data <= mem[b_addr];
  always @(posedge a_clk)
    if (a_wr)
      mem[a_addr] <= a_din;
  always @(posedge a_clk)
    if (1'b1)
      n1725_data <= mem[a_addr];
  /* mem/tdp_ram.vhd:104:17  */
  /* mem/tdp_ram.vhd:88:17  */
  /* mem/tdp_ram.vhd:103:9  */
endmodule

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
  reg [15:0] n1683_data; // mem_rd
  reg [15:0] n1686_data; // mem_rd
  assign a_dout = n1686_data;
  assign b_dout = n1683_data;
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
      n1683_data <= mem[b_addr];
  always @(posedge a_clk)
    if (a_wr)
      mem[a_addr] <= a_din;
  always @(posedge a_clk)
    if (1'b1)
      n1686_data <= mem[a_addr];
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
  reg [28:0] n1644_data; // mem_rd
  reg [28:0] n1647_data; // mem_rd
  assign a_dout = n1647_data;
  assign b_dout = n1644_data;
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
      n1644_data <= mem[b_addr];
  always @(posedge a_clk)
    if (a_wr)
      mem[a_addr] <= a_din;
  always @(posedge a_clk)
    if (1'b1)
      n1647_data <= mem[a_addr];
  /* mem/tdp_ram.vhd:104:17  */
  /* mem/tdp_ram.vhd:88:17  */
  /* mem/tdp_ram.vhd:103:9  */
endmodule

module tdp_ram_30_8
  (input  a_clk,
   input  a_wr,
   input  [7:0] a_addr,
   input  [29:0] a_din,
   input  b_clk,
   input  b_wr,
   input  [7:0] b_addr,
   input  [29:0] b_din,
   output [29:0] a_dout,
   output [29:0] b_dout);
  reg [29:0] n1605_data; // mem_rd
  reg [29:0] n1608_data; // mem_rd
  assign a_dout = n1608_data;
  assign b_dout = n1605_data;
  /* mem/tdp_ram.vhd:57:5  */
  reg [29:0] mem[255:0] ; // memory
  initial begin
    mem[255] = 30'b000000000000000000000000000000;
    mem[254] = 30'b000000000000000000000000000000;
    mem[253] = 30'b000000000000000000000000000000;
    mem[252] = 30'b000000000000000000000000000000;
    mem[251] = 30'b000000000000000000000000000000;
    mem[250] = 30'b000000000000000000000000000000;
    mem[249] = 30'b000000000000000000000000000000;
    mem[248] = 30'b000000000000000000000000000000;
    mem[247] = 30'b000000000000000000000000000000;
    mem[246] = 30'b000000000000000000000000000000;
    mem[245] = 30'b000000000000000000000000000000;
    mem[244] = 30'b000000000000000000000000000000;
    mem[243] = 30'b000000000000000000000000000000;
    mem[242] = 30'b000000000000000000000000000000;
    mem[241] = 30'b000000000000000000000000000000;
    mem[240] = 30'b000000000000000000000000000000;
    mem[239] = 30'b000000000000000000000000000000;
    mem[238] = 30'b000000000000000000000000000000;
    mem[237] = 30'b000000000000000000000000000000;
    mem[236] = 30'b000000000000000000000000000000;
    mem[235] = 30'b000000000000000000000000000000;
    mem[234] = 30'b000000000000000000000000000000;
    mem[233] = 30'b000000000000000000000000000000;
    mem[232] = 30'b000000000000000000000000000000;
    mem[231] = 30'b000000000000000000000000000000;
    mem[230] = 30'b000000000000000000000000000000;
    mem[229] = 30'b000000000000000000000000000000;
    mem[228] = 30'b000000000000000000000000000000;
    mem[227] = 30'b000000000000000000000000000000;
    mem[226] = 30'b000000000000000000000000000000;
    mem[225] = 30'b000000000000000000000000000000;
    mem[224] = 30'b000000000000000000000000000000;
    mem[223] = 30'b000000000000000000000000000000;
    mem[222] = 30'b000000000000000000000000000000;
    mem[221] = 30'b000000000000000000000000000000;
    mem[220] = 30'b000000000000000000000000000000;
    mem[219] = 30'b000000000000000000000000000000;
    mem[218] = 30'b000000000000000000000000000000;
    mem[217] = 30'b000000000000000000000000000000;
    mem[216] = 30'b000000000000000000000000000000;
    mem[215] = 30'b000000000000000000000000000000;
    mem[214] = 30'b000000000000000000000000000000;
    mem[213] = 30'b000000000000000000000000000000;
    mem[212] = 30'b000000000000000000000000000000;
    mem[211] = 30'b000000000000000000000000000000;
    mem[210] = 30'b000000000000000000000000000000;
    mem[209] = 30'b000000000000000000000000000000;
    mem[208] = 30'b000000000000000000000000000000;
    mem[207] = 30'b000000000000000000000000000000;
    mem[206] = 30'b000000000000000000000000000000;
    mem[205] = 30'b000000000000000000000000000000;
    mem[204] = 30'b000000000000000000000000000000;
    mem[203] = 30'b000000000000000000000000000000;
    mem[202] = 30'b000000000000000000000000000000;
    mem[201] = 30'b000000000000000000000000000000;
    mem[200] = 30'b000000000000000000000000000000;
    mem[199] = 30'b000000000000000000000000000000;
    mem[198] = 30'b000000000000000000000000000000;
    mem[197] = 30'b000000000000000000000000000000;
    mem[196] = 30'b000000000000000000000000000000;
    mem[195] = 30'b000000000000000000000000000000;
    mem[194] = 30'b000000000000000000000000000000;
    mem[193] = 30'b000000000000000000000000000000;
    mem[192] = 30'b000000000000000000000000000000;
    mem[191] = 30'b000000000000000000000000000000;
    mem[190] = 30'b000000000000000000000000000000;
    mem[189] = 30'b000000000000000000000000000000;
    mem[188] = 30'b000000000000000000000000000000;
    mem[187] = 30'b000000000000000000000000000000;
    mem[186] = 30'b000000000000000000000000000000;
    mem[185] = 30'b000000000000000000000000000000;
    mem[184] = 30'b000000000000000000000000000000;
    mem[183] = 30'b000000000000000000000000000000;
    mem[182] = 30'b000000000000000000000000000000;
    mem[181] = 30'b000000000000000000000000000000;
    mem[180] = 30'b000000000000000000000000000000;
    mem[179] = 30'b000000000000000000000000000000;
    mem[178] = 30'b000000000000000000000000000000;
    mem[177] = 30'b000000000000000000000000000000;
    mem[176] = 30'b000000000000000000000000000000;
    mem[175] = 30'b000000000000000000000000000000;
    mem[174] = 30'b000000000000000000000000000000;
    mem[173] = 30'b000000000000000000000000000000;
    mem[172] = 30'b000000000000000000000000000000;
    mem[171] = 30'b000000000000000000000000000000;
    mem[170] = 30'b000000000000000000000000000000;
    mem[169] = 30'b000000000000000000000000000000;
    mem[168] = 30'b000000000000000000000000000000;
    mem[167] = 30'b000000000000000000000000000000;
    mem[166] = 30'b000000000000000000000000000000;
    mem[165] = 30'b000000000000000000000000000000;
    mem[164] = 30'b000000000000000000000000000000;
    mem[163] = 30'b000000000000000000000000000000;
    mem[162] = 30'b000000000000000000000000000000;
    mem[161] = 30'b000000000000000000000000000000;
    mem[160] = 30'b000000000000000000000000000000;
    mem[159] = 30'b000000000000000000000000000000;
    mem[158] = 30'b000000000000000000000000000000;
    mem[157] = 30'b000000000000000000000000000000;
    mem[156] = 30'b000000000000000000000000000000;
    mem[155] = 30'b000000000000000000000000000000;
    mem[154] = 30'b000000000000000000000000000000;
    mem[153] = 30'b000000000000000000000000000000;
    mem[152] = 30'b000000000000000000000000000000;
    mem[151] = 30'b000000000000000000000000000000;
    mem[150] = 30'b000000000000000000000000000000;
    mem[149] = 30'b000000000000000000000000000000;
    mem[148] = 30'b000000000000000000000000000000;
    mem[147] = 30'b000000000000000000000000000000;
    mem[146] = 30'b000000000000000000000000000000;
    mem[145] = 30'b000000000000000000000000000000;
    mem[144] = 30'b000000000000000000000000000000;
    mem[143] = 30'b000000000000000000000000000000;
    mem[142] = 30'b000000000000000000000000000000;
    mem[141] = 30'b000000000000000000000000000000;
    mem[140] = 30'b000000000000000000000000000000;
    mem[139] = 30'b000000000000000000000000000000;
    mem[138] = 30'b000000000000000000000000000000;
    mem[137] = 30'b000000000000000000000000000000;
    mem[136] = 30'b000000000000000000000000000000;
    mem[135] = 30'b000000000000000000000000000000;
    mem[134] = 30'b000000000000000000000000000000;
    mem[133] = 30'b000000000000000000000000000000;
    mem[132] = 30'b000000000000000000000000000000;
    mem[131] = 30'b000000000000000000000000000000;
    mem[130] = 30'b000000000000000000000000000000;
    mem[129] = 30'b000000000000000000000000000000;
    mem[128] = 30'b000000000000000000000000000000;
    mem[127] = 30'b000000000000000000000000000000;
    mem[126] = 30'b000000000000000000000000000000;
    mem[125] = 30'b000000000000000000000000000000;
    mem[124] = 30'b000000000000000000000000000000;
    mem[123] = 30'b000000000000000000000000000000;
    mem[122] = 30'b000000000000000000000000000000;
    mem[121] = 30'b000000000000000000000000000000;
    mem[120] = 30'b000000000000000000000000000000;
    mem[119] = 30'b000000000000000000000000000000;
    mem[118] = 30'b000000000000000000000000000000;
    mem[117] = 30'b000000000000000000000000000000;
    mem[116] = 30'b000000000000000000000000000000;
    mem[115] = 30'b000000000000000000000000000000;
    mem[114] = 30'b000000000000000000000000000000;
    mem[113] = 30'b000000000000000000000000000000;
    mem[112] = 30'b000000000000000000000000000000;
    mem[111] = 30'b000000000000000000000000000000;
    mem[110] = 30'b000000000000000000000000000000;
    mem[109] = 30'b000000000000000000000000000000;
    mem[108] = 30'b000000000000000000000000000000;
    mem[107] = 30'b000000000000000000000000000000;
    mem[106] = 30'b000000000000000000000000000000;
    mem[105] = 30'b000000000000000000000000000000;
    mem[104] = 30'b000000000000000000000000000000;
    mem[103] = 30'b000000000000000000000000000000;
    mem[102] = 30'b000000000000000000000000000000;
    mem[101] = 30'b000000000000000000000000000000;
    mem[100] = 30'b000000000000000000000000000000;
    mem[99] = 30'b000000000000000000000000000000;
    mem[98] = 30'b000000000000000000000000000000;
    mem[97] = 30'b000000000000000000000000000000;
    mem[96] = 30'b000000000000000000000000000000;
    mem[95] = 30'b000000000000000000000000000000;
    mem[94] = 30'b000000000000000000000000000000;
    mem[93] = 30'b000000000000000000000000000000;
    mem[92] = 30'b000000000000000000000000000000;
    mem[91] = 30'b000000000000000000000000000000;
    mem[90] = 30'b000000000000000000000000000000;
    mem[89] = 30'b000000000000000000000000000000;
    mem[88] = 30'b000000000000000000000000000000;
    mem[87] = 30'b000000000000000000000000000000;
    mem[86] = 30'b000000000000000000000000000000;
    mem[85] = 30'b000000000000000000000000000000;
    mem[84] = 30'b000000000000000000000000000000;
    mem[83] = 30'b000000000000000000000000000000;
    mem[82] = 30'b000000000000000000000000000000;
    mem[81] = 30'b000000000000000000000000000000;
    mem[80] = 30'b000000000000000000000000000000;
    mem[79] = 30'b000000000000000000000000000000;
    mem[78] = 30'b000000000000000000000000000000;
    mem[77] = 30'b000000000000000000000000000000;
    mem[76] = 30'b000000000000000000000000000000;
    mem[75] = 30'b000000000000000000000000000000;
    mem[74] = 30'b000000000000000000000000000000;
    mem[73] = 30'b000000000000000000000000000000;
    mem[72] = 30'b000000000000000000000000000000;
    mem[71] = 30'b000000000000000000000000000000;
    mem[70] = 30'b000000000000000000000000000000;
    mem[69] = 30'b000000000000000000000000000000;
    mem[68] = 30'b000000000000000000000000000000;
    mem[67] = 30'b000000000000000000000000000000;
    mem[66] = 30'b000000000000000000000000000000;
    mem[65] = 30'b000000000000000000000000000000;
    mem[64] = 30'b000000000000000000000000000000;
    mem[63] = 30'b000000000000000000000000000000;
    mem[62] = 30'b000000000000000000000000000000;
    mem[61] = 30'b000000000000000000000000000000;
    mem[60] = 30'b000000000000000000000000000000;
    mem[59] = 30'b000000000000000000000000000000;
    mem[58] = 30'b000000000000000000000000000000;
    mem[57] = 30'b000000000000000000000000000000;
    mem[56] = 30'b000000000000000000000000000000;
    mem[55] = 30'b000000000000000000000000000000;
    mem[54] = 30'b000000000000000000000000000000;
    mem[53] = 30'b000000000000000000000000000000;
    mem[52] = 30'b000000000000000000000000000000;
    mem[51] = 30'b000000000000000000000000000000;
    mem[50] = 30'b000000000000000000000000000000;
    mem[49] = 30'b000000000000000000000000000000;
    mem[48] = 30'b000000000000000000000000000000;
    mem[47] = 30'b000000000000000000000000000000;
    mem[46] = 30'b000000000000000000000000000000;
    mem[45] = 30'b000000000000000000000000000000;
    mem[44] = 30'b000000000000000000000000000000;
    mem[43] = 30'b000000000000000000000000000000;
    mem[42] = 30'b000000000000000000000000000000;
    mem[41] = 30'b000000000000000000000000000000;
    mem[40] = 30'b000000000000000000000000000000;
    mem[39] = 30'b000000000000000000000000000000;
    mem[38] = 30'b000000000000000000000000000000;
    mem[37] = 30'b000000000000000000000000000000;
    mem[36] = 30'b000000000000000000000000000000;
    mem[35] = 30'b000000000000000000000000000000;
    mem[34] = 30'b000000000000000000000000000000;
    mem[33] = 30'b000000000000000000000000000000;
    mem[32] = 30'b000000000000000000000000000000;
    mem[31] = 30'b000000000000000000000000000000;
    mem[30] = 30'b000000000000000000000000000000;
    mem[29] = 30'b000000000000000000000000000000;
    mem[28] = 30'b000000000000000000000000000000;
    mem[27] = 30'b000000000000000000000000000000;
    mem[26] = 30'b000000000000000000000000000000;
    mem[25] = 30'b000000000000000000000000000000;
    mem[24] = 30'b000000000000000000000000000000;
    mem[23] = 30'b000000000000000000000000000000;
    mem[22] = 30'b000000000000000000000000000000;
    mem[21] = 30'b000000000000000000000000000000;
    mem[20] = 30'b000000000000000000000000000000;
    mem[19] = 30'b000000000000000000000000000000;
    mem[18] = 30'b000000000000000000000000000000;
    mem[17] = 30'b000000000000000000000000000000;
    mem[16] = 30'b000000000000000000000000000000;
    mem[15] = 30'b000000000000000000000000000000;
    mem[14] = 30'b000000000000000000000000000000;
    mem[13] = 30'b000000000000000000000000000000;
    mem[12] = 30'b000000000000000000000000000000;
    mem[11] = 30'b000000000000000000000000000000;
    mem[10] = 30'b000000000000000000000000000000;
    mem[9] = 30'b000000000000000000000000000000;
    mem[8] = 30'b000000000000000000000000000000;
    mem[7] = 30'b000000000000000000000000000000;
    mem[6] = 30'b000000000000000000000000000000;
    mem[5] = 30'b000000000000000000000000000000;
    mem[4] = 30'b000000000000000000000000000000;
    mem[3] = 30'b000000000000000000000000000000;
    mem[2] = 30'b000000000000000000000000000000;
    mem[1] = 30'b000000000000000000000000000000;
    mem[0] = 30'b000000000000000000000000000000;
    end
  always @(posedge b_clk)
    if (b_wr)
      mem[b_addr] <= b_din;
  always @(posedge b_clk)
    if (1'b1)
      n1605_data <= mem[b_addr];
  always @(posedge a_clk)
    if (a_wr)
      mem[a_addr] <= a_din;
  always @(posedge a_clk)
    if (1'b1)
      n1608_data <= mem[a_addr];
  /* mem/tdp_ram.vhd:104:17  */
  /* mem/tdp_ram.vhd:88:17  */
  /* mem/tdp_ram.vhd:103:9  */
endmodule

module config_bus
  (input  clk,
   input  reset,
   input  [2:0] ocp_config_m_mcmd,
   input  [31:0] ocp_config_m_maddr,
   input  [31:0] ocp_config_m_mdata,
   input  [3:0] ocp_config_m_mbyteen,
   input  ocp_config_m_mrespaccept,
   input  supervisor,
   input  [13:0] config_unit_addr,
   input  config_unit_en,
   input  config_unit_wr,
   input  [31:0] config_unit_wdata,
   input  [31:0] tdm_ctrl_rdata,
   input  tdm_ctrl_error,
   input  [31:0] sched_tbl_rdata,
   input  sched_tbl_error,
   input  [31:0] dma_tbl_rdata,
   input  dma_tbl_error,
   input  [31:0] mc_ctrl_rdata,
   input  mc_ctrl_error,
   input  [31:0] irq_unit_fifo_rdata,
   input  irq_unit_fifo_error,
   output [1:0] ocp_config_s_sresp,
   output [31:0] ocp_config_s_sdata,
   output ocp_config_s_scmdaccept,
   output [13:0] config_addr,
   output config_en,
   output config_wr,
   output [31:0] config_wdata,
   output tdm_ctrl_sel,
   output sched_tbl_sel,
   output dma_tbl_sel,
   output mc_ctrl_sel,
   output irq_unit_fifo_sel);
  wire [71:0] n1434_o;
  wire [1:0] n1436_o;
  wire [31:0] n1437_o;
  wire n1438_o;
  wire [47:0] n1439_o;
  wire [13:0] n1441_o;
  wire n1442_o;
  wire n1443_o;
  wire [31:0] n1444_o;
  wire [32:0] n1445_o;
  wire [32:0] n1447_o;
  wire [32:0] n1449_o;
  wire [32:0] n1451_o;
  wire [32:0] n1453_o;
  wire [1:0] next_ocp_resp;
  wire [1:0] ocp_resp_reg;
  wire [2:0] bank_id;
  wire [2:0] prev_bank_id;
  wire [31:0] n1456_o;
  wire [2:0] n1458_o;
  wire [13:0] n1459_o;
  wire n1460_o;
  wire n1461_o;
  wire [31:0] n1462_o;
  wire n1463_o;
  wire n1464_o;
  wire [2:0] n1465_o;
  wire n1467_o;
  wire n1468_o;
  wire [31:0] n1470_o;
  wire [2:0] n1471_o;
  wire [13:0] n1472_o;
  wire [2:0] n1475_o;
  wire n1477_o;
  wire n1478_o;
  wire [2:0] n1479_o;
  wire n1481_o;
  wire n1483_o;
  wire n1484_o;
  wire n1485_o;
  wire [47:0] n1486_o;
  wire [47:0] n1487_o;
  wire [47:0] n1488_o;
  wire [1:0] n1490_o;
  wire [2:0] n1491_o;
  wire n1493_o;
  wire n1494_o;
  wire n1495_o;
  wire [1:0] n1497_o;
  wire n1506_o;
  wire n1508_o;
  wire n1510_o;
  wire n1512_o;
  wire n1514_o;
  wire n1516_o;
  wire [5:0] n1517_o;
  reg n1520_o;
  reg n1524_o;
  reg n1528_o;
  reg n1532_o;
  reg n1536_o;
  wire [31:0] n1538_o;
  wire n1540_o;
  wire [31:0] n1541_o;
  wire n1543_o;
  wire [31:0] n1544_o;
  wire n1546_o;
  wire [31:0] n1547_o;
  wire n1549_o;
  wire [31:0] n1550_o;
  wire n1552_o;
  wire n1554_o;
  wire [5:0] n1555_o;
  reg [31:0] n1556_o;
  wire [1:0] n1561_o;
  wire [2:0] n1563_o;
  reg [1:0] n1567_q;
  reg [2:0] n1568_q;
  wire [34:0] n1569_o;
  assign ocp_config_s_sresp = n1436_o;
  assign ocp_config_s_sdata = n1437_o;
  assign ocp_config_s_scmdaccept = n1438_o;
  assign config_addr = n1441_o;
  assign config_en = n1442_o;
  assign config_wr = n1443_o;
  assign config_wdata = n1444_o;
  assign tdm_ctrl_sel = n1520_o;
  assign sched_tbl_sel = n1524_o;
  assign dma_tbl_sel = n1528_o;
  assign mc_ctrl_sel = n1532_o;
  assign irq_unit_fifo_sel = n1536_o;
  /* ni/spm_bus.vhd:50:17  */
  assign n1434_o = {ocp_config_m_mrespaccept, ocp_config_m_mbyteen, ocp_config_m_mdata, ocp_config_m_maddr, ocp_config_m_mcmd};
  /* ni/spm_bus.vhd:81:9  */
  assign n1436_o = n1569_o[1:0];
  assign n1437_o = n1569_o[33:2];
  /* ni/spm_bus.vhd:63:9  */
  assign n1438_o = n1569_o[34];
  /* ni/spm_bus.vhd:83:17  */
  assign n1439_o = {config_unit_wdata, config_unit_wr, config_unit_en, config_unit_addr};
  assign n1441_o = n1488_o[13:0];
  assign n1442_o = n1488_o[14];
  assign n1443_o = n1488_o[15];
  assign n1444_o = n1488_o[47:16];
  assign n1445_o = {tdm_ctrl_error, tdm_ctrl_rdata};
  assign n1447_o = {sched_tbl_error, sched_tbl_rdata};
  assign n1449_o = {dma_tbl_error, dma_tbl_rdata};
  assign n1451_o = {mc_ctrl_error, mc_ctrl_rdata};
  assign n1453_o = {irq_unit_fifo_error, irq_unit_fifo_rdata};
  /* ni/config_bus.vhd:88:8  */
  assign next_ocp_resp = n1497_o; // (signal)
  /* ni/config_bus.vhd:88:23  */
  assign ocp_resp_reg = n1567_q; // (signal)
  /* ni/config_bus.vhd:89:8  */
  assign bank_id = n1491_o; // (signal)
  /* ni/config_bus.vhd:89:17  */
  assign prev_bank_id = n1568_q; // (signal)
  /* ni/config_bus.vhd:105:55  */
  assign n1456_o = n1449_o[31:0];
  /* ni/config_bus.vhd:108:30  */
  assign n1458_o = n1439_o[13:11];
  /* ni/config_bus.vhd:110:30  */
  assign n1459_o = n1439_o[13:0];
  /* ni/config_bus.vhd:111:28  */
  assign n1460_o = n1439_o[14];
  /* ni/config_bus.vhd:112:28  */
  assign n1461_o = n1439_o[15];
  /* ni/config_bus.vhd:113:31  */
  assign n1462_o = n1439_o[47:16];
  /* ni/config_bus.vhd:120:18  */
  assign n1463_o = n1439_o[14];
  /* ni/config_bus.vhd:120:21  */
  assign n1464_o = ~n1463_o;
  /* ni/config_bus.vhd:120:44  */
  assign n1465_o = n1434_o[2:0];
  /* ni/config_bus.vhd:120:49  */
  assign n1467_o = n1465_o != 3'b000;
  /* ni/config_bus.vhd:120:27  */
  assign n1468_o = n1464_o & n1467_o;
  /* ni/config_bus.vhd:124:66  */
  assign n1470_o = n1434_o[66:35];
  /* ni/config_bus.vhd:126:43  */
  assign n1471_o = n1434_o[18:16];
  /* ni/config_bus.vhd:129:47  */
  assign n1472_o = n1434_o[18:5];
  /* ni/config_bus.vhd:134:21  */
  assign n1475_o = n1434_o[2:0];
  /* ni/config_bus.vhd:134:26  */
  assign n1477_o = n1475_o != 3'b000;
  /* ni/config_bus.vhd:134:42  */
  assign n1478_o = n1477_o & supervisor;
  /* ni/config_bus.vhd:135:21  */
  assign n1479_o = n1434_o[2:0];
  /* ni/config_bus.vhd:135:26  */
  assign n1481_o = n1479_o == 3'b001;
  /* ni/config_bus.vhd:134:5  */
  assign n1483_o = n1484_o ? 1'b1 : 1'b0;
  /* ni/config_bus.vhd:134:5  */
  assign n1484_o = n1478_o & n1481_o;
  /* ni/config_bus.vhd:120:3  */
  assign n1485_o = n1468_o ? 1'b1 : 1'b0;
  assign n1486_o = {n1470_o, n1483_o, 1'b1, n1472_o};
  assign n1487_o = {n1462_o, n1461_o, n1460_o, n1459_o};
  /* ni/config_bus.vhd:120:3  */
  assign n1488_o = n1468_o ? n1486_o : n1487_o;
  /* ni/config_bus.vhd:120:3  */
  assign n1490_o = n1468_o ? 2'b01 : ocp_resp_reg;
  /* ni/config_bus.vhd:120:3  */
  assign n1491_o = n1468_o ? n1471_o : n1458_o;
  /* ni/config_bus.vhd:161:20  */
  assign n1493_o = ocp_resp_reg != 2'b00;
  /* ni/config_bus.vhd:161:56  */
  assign n1494_o = n1434_o[71];
  /* ni/config_bus.vhd:161:38  */
  assign n1495_o = n1493_o & n1494_o;
  /* ni/config_bus.vhd:161:3  */
  assign n1497_o = n1495_o ? 2'b00 : n1490_o;
  /* ni/config_bus.vhd:177:5  */
  assign n1506_o = bank_id == 3'b000;
  /* ni/config_bus.vhd:179:5  */
  assign n1508_o = bank_id == 3'b001;
  /* ni/config_bus.vhd:181:5  */
  assign n1510_o = bank_id == 3'b010;
  /* ni/config_bus.vhd:183:5  */
  assign n1512_o = bank_id == 3'b011;
  /* ni/config_bus.vhd:185:5  */
  assign n1514_o = bank_id == 3'b100;
  /* ni/config_bus.vhd:187:5  */
  assign n1516_o = bank_id == 3'b111;
  assign n1517_o = {n1516_o, n1514_o, n1512_o, n1510_o, n1508_o, n1506_o};
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n1517_o)
      6'b100000: n1520_o <= 1'b0;
      6'b010000: n1520_o <= 1'b0;
      6'b001000: n1520_o <= 1'b0;
      6'b000100: n1520_o <= 1'b1;
      6'b000010: n1520_o <= 1'b0;
      6'b000001: n1520_o <= 1'b0;
      default: n1520_o <= 1'b0;
    endcase
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n1517_o)
      6'b100000: n1524_o <= 1'b0;
      6'b010000: n1524_o <= 1'b0;
      6'b001000: n1524_o <= 1'b0;
      6'b000100: n1524_o <= 1'b0;
      6'b000010: n1524_o <= 1'b1;
      6'b000001: n1524_o <= 1'b0;
      default: n1524_o <= 1'b0;
    endcase
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n1517_o)
      6'b100000: n1528_o <= 1'b0;
      6'b010000: n1528_o <= 1'b0;
      6'b001000: n1528_o <= 1'b0;
      6'b000100: n1528_o <= 1'b0;
      6'b000010: n1528_o <= 1'b0;
      6'b000001: n1528_o <= 1'b1;
      default: n1528_o <= 1'b0;
    endcase
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n1517_o)
      6'b100000: n1532_o <= 1'b0;
      6'b010000: n1532_o <= 1'b0;
      6'b001000: n1532_o <= 1'b1;
      6'b000100: n1532_o <= 1'b0;
      6'b000010: n1532_o <= 1'b0;
      6'b000001: n1532_o <= 1'b0;
      default: n1532_o <= 1'b0;
    endcase
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n1517_o)
      6'b100000: n1536_o <= 1'b0;
      6'b010000: n1536_o <= 1'b1;
      6'b001000: n1536_o <= 1'b0;
      6'b000100: n1536_o <= 1'b0;
      6'b000010: n1536_o <= 1'b0;
      6'b000001: n1536_o <= 1'b0;
      default: n1536_o <= 1'b0;
    endcase
  /* ni/config_bus.vhd:194:59  */
  assign n1538_o = n1449_o[31:0];
  /* ni/config_bus.vhd:193:5  */
  assign n1540_o = prev_bank_id == 3'b000;
  /* ni/config_bus.vhd:196:61  */
  assign n1541_o = n1447_o[31:0];
  /* ni/config_bus.vhd:195:5  */
  assign n1543_o = prev_bank_id == 3'b001;
  /* ni/config_bus.vhd:198:60  */
  assign n1544_o = n1445_o[31:0];
  /* ni/config_bus.vhd:197:5  */
  assign n1546_o = prev_bank_id == 3'b010;
  /* ni/config_bus.vhd:200:59  */
  assign n1547_o = n1451_o[31:0];
  /* ni/config_bus.vhd:199:5  */
  assign n1549_o = prev_bank_id == 3'b011;
  /* ni/config_bus.vhd:202:65  */
  assign n1550_o = n1453_o[31:0];
  /* ni/config_bus.vhd:201:5  */
  assign n1552_o = prev_bank_id == 3'b100;
  /* ni/config_bus.vhd:203:5  */
  assign n1554_o = prev_bank_id == 3'b111;
  assign n1555_o = {n1554_o, n1552_o, n1549_o, n1546_o, n1543_o, n1540_o};
  /* ni/config_bus.vhd:192:3  */
  always @*
    case (n1555_o)
      6'b100000: n1556_o <= n1456_o;
      6'b010000: n1556_o <= n1550_o;
      6'b001000: n1556_o <= n1547_o;
      6'b000100: n1556_o <= n1544_o;
      6'b000010: n1556_o <= n1541_o;
      6'b000001: n1556_o <= n1538_o;
      default: n1556_o <= n1456_o;
    endcase
  /* ni/config_bus.vhd:215:7  */
  assign n1561_o = reset ? 2'b00 : next_ocp_resp;
  /* ni/config_bus.vhd:215:7  */
  assign n1563_o = reset ? 3'b000 : bank_id;
  /* ni/config_bus.vhd:214:5  */
  always @(posedge clk)
    n1567_q <= n1561_o;
  /* ni/config_bus.vhd:214:5  */
  always @(posedge clk)
    n1568_q <= n1563_o;
  /* ni/config_bus.vhd:214:5  */
  assign n1569_o = {n1485_o, n1556_o, ocp_resp_reg};
endmodule

module spm_bus
  (input  clk,
   input  reset,
   input  [63:0] spm_slv_rdata,
   input  spm_slv_error,
   input  [13:0] tx_spm_addr,
   input  [1:0] tx_spm_en,
   input  tx_spm_wr,
   input  [63:0] tx_spm_wdata,
   input  [13:0] rx_spm_addr,
   input  [1:0] rx_spm_en,
   input  rx_spm_wr,
   input  [63:0] rx_spm_wdata,
   output [13:0] spm_addr,
   output [1:0] spm_en,
   output spm_wr,
   output [63:0] spm_wdata,
   output [63:0] tx_spm_slv_rdata,
   output tx_spm_slv_error);
  wire [64:0] n1378_o;
  wire [13:0] n1380_o;
  wire [1:0] n1381_o;
  wire n1382_o;
  wire [63:0] n1383_o;
  wire [63:0] n1385_o;
  wire n1386_o;
  wire [80:0] n1387_o;
  wire [80:0] n1388_o;
  wire [80:0] rx_spm_buff;
  wire n1391_o;
  wire n1392_o;
  wire n1393_o;
  wire n1394_o;
  wire n1395_o;
  wire n1396_o;
  wire n1397_o;
  wire n1398_o;
  wire n1399_o;
  wire [80:0] n1400_o;
  wire [80:0] n1401_o;
  wire [80:0] n1402_o;
  wire n1408_o;
  wire n1409_o;
  wire n1410_o;
  wire n1411_o;
  wire n1412_o;
  wire n1413_o;
  wire n1414_o;
  wire n1415_o;
  wire n1416_o;
  wire n1417_o;
  wire n1418_o;
  wire [13:0] n1419_o;
  wire [63:0] n1420_o;
  wire [80:0] n1421_o;
  wire [13:0] n1422_o;
  wire [13:0] n1423_o;
  wire [13:0] n1424_o;
  wire [1:0] n1425_o;
  wire [1:0] n1426_o;
  wire [64:0] n1427_o;
  wire [64:0] n1428_o;
  wire [64:0] n1429_o;
  wire [80:0] n1430_o;
  reg [80:0] n1433_q;
  assign spm_addr = n1380_o;
  assign spm_en = n1381_o;
  assign spm_wr = n1382_o;
  assign spm_wdata = n1383_o;
  assign tx_spm_slv_rdata = n1385_o;
  assign tx_spm_slv_error = n1386_o;
  /* ni/irq_fifo.vhd:146:9  */
  assign n1378_o = {spm_slv_error, spm_slv_rdata};
  /* ni/irq_fifo.vhd:53:17  */
  assign n1380_o = n1402_o[13:0];
  /* ni/irq_fifo.vhd:51:17  */
  assign n1381_o = n1402_o[15:14];
  assign n1382_o = n1402_o[16];
  assign n1383_o = n1402_o[80:17];
  assign n1385_o = n1378_o[63:0];
  /* ni/irq_fifo.vhd:216:9  */
  assign n1386_o = n1378_o[64];
  assign n1387_o = {tx_spm_wdata, tx_spm_wr, tx_spm_en, tx_spm_addr};
  /* ni/irq_fifo.vhd:200:9  */
  assign n1388_o = {rx_spm_wdata, rx_spm_wr, rx_spm_en, rx_spm_addr};
  /* ni/spm_bus.vhd:58:16  */
  assign rx_spm_buff = n1433_q; // (signal)
  /* ni/spm_bus.vhd:65:31  */
  assign n1391_o = n1387_o[14];
  /* ni/spm_bus.vhd:65:55  */
  assign n1392_o = n1387_o[15];
  /* ni/spm_bus.vhd:65:42  */
  assign n1393_o = n1391_o | n1392_o;
  /* ni/spm_bus.vhd:68:44  */
  assign n1394_o = rx_spm_buff[14];
  /* ni/spm_bus.vhd:68:73  */
  assign n1395_o = rx_spm_buff[15];
  /* ni/spm_bus.vhd:68:55  */
  assign n1396_o = n1394_o | n1395_o;
  /* ni/spm_bus.vhd:71:47  */
  assign n1397_o = n1388_o[14];
  /* ni/spm_bus.vhd:71:71  */
  assign n1398_o = n1388_o[15];
  /* ni/spm_bus.vhd:71:58  */
  assign n1399_o = n1397_o | n1398_o;
  /* ni/spm_bus.vhd:71:33  */
  assign n1400_o = n1399_o ? n1388_o : n1387_o;
  /* ni/spm_bus.vhd:68:25  */
  assign n1401_o = n1396_o ? rx_spm_buff : n1400_o;
  /* ni/spm_bus.vhd:65:17  */
  assign n1402_o = n1393_o ? n1387_o : n1401_o;
  /* ni/spm_bus.vhd:87:63  */
  assign n1408_o = n1388_o[14];
  /* ni/spm_bus.vhd:87:81  */
  assign n1409_o = n1387_o[14];
  /* ni/spm_bus.vhd:87:97  */
  assign n1410_o = n1387_o[15];
  /* ni/spm_bus.vhd:87:85  */
  assign n1411_o = n1409_o | n1410_o;
  /* ni/spm_bus.vhd:87:67  */
  assign n1412_o = n1408_o & n1411_o;
  /* ni/spm_bus.vhd:88:63  */
  assign n1413_o = n1388_o[15];
  /* ni/spm_bus.vhd:88:81  */
  assign n1414_o = n1387_o[14];
  /* ni/spm_bus.vhd:88:97  */
  assign n1415_o = n1387_o[15];
  /* ni/spm_bus.vhd:88:85  */
  assign n1416_o = n1414_o | n1415_o;
  /* ni/spm_bus.vhd:88:67  */
  assign n1417_o = n1413_o & n1416_o;
  /* ni/spm_bus.vhd:89:61  */
  assign n1418_o = n1388_o[16];
  /* ni/spm_bus.vhd:90:61  */
  assign n1419_o = n1388_o[13:0];
  /* ni/spm_bus.vhd:91:61  */
  assign n1420_o = n1388_o[80:17];
  assign n1421_o = {n1420_o, n1418_o, n1417_o, n1412_o, n1419_o};
  assign n1422_o = n1421_o[13:0];
  assign n1423_o = rx_spm_buff[13:0];
  /* ni/spm_bus.vhd:84:25  */
  assign n1424_o = reset ? n1423_o : n1422_o;
  assign n1425_o = n1421_o[15:14];
  /* ni/spm_bus.vhd:84:25  */
  assign n1426_o = reset ? 2'b00 : n1425_o;
  assign n1427_o = n1421_o[80:16];
  assign n1428_o = rx_spm_buff[80:16];
  /* ni/spm_bus.vhd:84:25  */
  assign n1429_o = reset ? n1428_o : n1427_o;
  assign n1430_o = {n1429_o, n1426_o, n1424_o};
  /* ni/spm_bus.vhd:83:17  */
  always @(posedge clk)
    n1433_q <= n1430_o;
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
  wire [47:0] n1213_o;
  wire [31:0] n1215_o;
  wire n1216_o;
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
  wire n1221_o;
  wire n1222_o;
  wire n1225_o;
  wire n1226_o;
  wire [4:0] n1230_o;
  wire n1231_o;
  wire n1233_o;
  wire n1235_o;
  wire n1236_o;
  wire n1237_o;
  wire n1238_o;
  wire [4:0] n1242_o;
  wire n1243_o;
  wire n1245_o;
  wire n1247_o;
  wire n1248_o;
  wire n1249_o;
  wire n1250_o;
  wire n1252_o;
  wire [4:0] n1253_o;
  wire n1256_o;
  wire n1257_o;
  wire n1258_o;
  wire n1259_o;
  wire [10:0] n1260_o;
  wire n1262_o;
  wire n1264_o;
  wire [1:0] n1265_o;
  reg n1268_o;
  reg n1271_o;
  reg n1274_o;
  reg [4:0] n1275_o;
  wire n1277_o;
  wire n1279_o;
  wire n1281_o;
  wire [4:0] n1282_o;
  wire n1284_o;
  wire n1287_o;
  wire n1290_o;
  wire n1292_o;
  wire n1294_o;
  wire n1295_o;
  wire n1296_o;
  localparam n1298_o = 1'b0;
  localparam [13:0] n1299_o = 14'b00000000000000;
  wire [13:0] tdpram_n1300;
  wire [13:0] tdpram_a_dout;
  wire [13:0] tdpram_b_dout;
  wire n1307_o;
  wire n1309_o;
  wire [4:0] n1311_o;
  wire [4:0] n1313_o;
  wire [4:0] n1314_o;
  wire [4:0] n1316_o;
  reg [4:0] n1319_q;
  wire n1323_o;
  wire n1325_o;
  wire [4:0] n1327_o;
  wire [4:0] n1329_o;
  wire [4:0] n1330_o;
  wire [4:0] n1332_o;
  reg [4:0] n1335_q;
  wire n1339_o;
  wire n1341_o;
  wire [4:0] n1343_o;
  wire [4:0] n1345_o;
  wire [4:0] n1346_o;
  wire [4:0] n1348_o;
  reg [4:0] n1351_q;
  wire n1355_o;
  wire n1357_o;
  wire [4:0] n1359_o;
  wire [4:0] n1361_o;
  wire [4:0] n1362_o;
  wire [4:0] n1364_o;
  reg [4:0] n1367_q;
  wire n1372_o;
  reg n1376_q;
  wire [32:0] n1377_o;
  assign config_slv_rdata = n1215_o;
  assign config_slv_error = n1216_o;
  assign irq_irq_sig = irq_not_empty;
  assign irq_data_sig = data_not_empty;
  /* ni/rx_unit.vhd:55:17  */
  assign n1213_o = {config_wdata, config_wr, config_en, config_addr};
  /* ni/rx_unit.vhd:52:17  */
  assign n1215_o = n1377_o[31:0];
  /* ni/rx_unit.vhd:50:17  */
  assign n1216_o = n1377_o[32];
  /* ni/irq_fifo.vhd:94:16  */
  assign irq_not_empty = n1222_o; // (signal)
  /* ni/irq_fifo.vhd:94:31  */
  assign data_not_empty = n1226_o; // (signal)
  /* ni/irq_fifo.vhd:94:47  */
  assign next_error = n1284_o; // (signal)
  /* ni/irq_fifo.vhd:94:59  */
  assign irq_read = n1287_o; // (signal)
  /* ni/irq_fifo.vhd:94:69  */
  assign data_read = n1290_o; // (signal)
  /* ni/irq_fifo.vhd:94:80  */
  assign irq_not_full = n1238_o; // (signal)
  /* ni/irq_fifo.vhd:94:94  */
  assign data_not_full = n1250_o; // (signal)
  /* ni/irq_fifo.vhd:95:16  */
  assign data_w_ptr = n1335_q; // (signal)
  /* ni/irq_fifo.vhd:95:28  */
  assign data_r_ptr = n1367_q; // (signal)
  /* ni/irq_fifo.vhd:95:40  */
  assign irq_w_ptr = n1319_q; // (signal)
  /* ni/irq_fifo.vhd:95:51  */
  assign irq_r_ptr = n1351_q; // (signal)
  /* ni/irq_fifo.vhd:95:62  */
  assign w_ptr = n1253_o; // (signal)
  /* ni/irq_fifo.vhd:95:69  */
  assign r_ptr = n1282_o; // (signal)
  /* ni/irq_fifo.vhd:96:16  */
  assign w_data = irq_data_fifo_data; // (signal)
  /* ni/irq_fifo.vhd:106:46  */
  assign n1221_o = irq_w_ptr == irq_r_ptr;
  /* ni/irq_fifo.vhd:106:31  */
  assign n1222_o = n1221_o ? 1'b0 : 1'b1;
  /* ni/irq_fifo.vhd:107:47  */
  assign n1225_o = data_w_ptr == data_r_ptr;
  /* ni/irq_fifo.vhd:107:31  */
  assign n1226_o = n1225_o ? 1'b0 : 1'b1;
  /* ni/irq_fifo.vhd:109:59  */
  assign n1230_o = irq_r_ptr - 5'b00001;
  /* ni/irq_fifo.vhd:109:47  */
  assign n1231_o = irq_w_ptr == n1230_o;
  /* ni/irq_fifo.vhd:109:78  */
  assign n1233_o = irq_w_ptr == 5'b01111;
  /* ni/irq_fifo.vhd:109:146  */
  assign n1235_o = irq_r_ptr == 5'b00000;
  /* ni/irq_fifo.vhd:109:132  */
  assign n1236_o = n1233_o & n1235_o;
  /* ni/irq_fifo.vhd:109:64  */
  assign n1237_o = n1231_o | n1236_o;
  /* ni/irq_fifo.vhd:109:30  */
  assign n1238_o = n1237_o ? 1'b0 : 1'b1;
  /* ni/irq_fifo.vhd:110:61  */
  assign n1242_o = data_r_ptr + 5'b00001;
  /* ni/irq_fifo.vhd:110:48  */
  assign n1243_o = data_w_ptr == n1242_o;
  /* ni/irq_fifo.vhd:110:81  */
  assign n1245_o = data_w_ptr == 5'b10000;
  /* ni/irq_fifo.vhd:110:151  */
  assign n1247_o = data_r_ptr == 5'b11111;
  /* ni/irq_fifo.vhd:110:136  */
  assign n1248_o = n1245_o & n1247_o;
  /* ni/irq_fifo.vhd:110:66  */
  assign n1249_o = n1243_o | n1248_o;
  /* ni/irq_fifo.vhd:110:30  */
  assign n1250_o = n1249_o ? 1'b0 : 1'b1;
  /* ni/irq_fifo.vhd:113:59  */
  assign n1252_o = ~irq_data_fifo_data_valid;
  /* ni/irq_fifo.vhd:113:29  */
  assign n1253_o = n1252_o ? irq_w_ptr : data_w_ptr;
  /* ni/irq_fifo.vhd:123:42  */
  assign n1256_o = n1213_o[14];
  /* ni/irq_fifo.vhd:123:31  */
  assign n1257_o = sel & n1256_o;
  /* ni/irq_fifo.vhd:125:35  */
  assign n1258_o = n1213_o[15];
  /* ni/irq_fifo.vhd:125:38  */
  assign n1259_o = ~n1258_o;
  /* ni/irq_fifo.vhd:126:50  */
  assign n1260_o = n1213_o[10:0];
  /* ni/irq_fifo.vhd:128:11  */
  assign n1262_o = n1260_o == 11'b00000000000;
  /* ni/irq_fifo.vhd:132:11  */
  assign n1264_o = n1260_o == 11'b00000000001;
  assign n1265_o = {n1264_o, n1262_o};
  /* ni/irq_fifo.vhd:126:33  */
  always @*
    case (n1265_o)
      2'b10: n1268_o <= 1'b0;
      2'b01: n1268_o <= 1'b0;
      default: n1268_o <= 1'b1;
    endcase
  /* ni/irq_fifo.vhd:126:33  */
  always @*
    case (n1265_o)
      2'b10: n1271_o <= 1'b0;
      2'b01: n1271_o <= 1'b1;
      default: n1271_o <= 1'b0;
    endcase
  /* ni/irq_fifo.vhd:126:33  */
  always @*
    case (n1265_o)
      2'b10: n1274_o <= 1'b1;
      2'b01: n1274_o <= 1'b0;
      default: n1274_o <= 1'b0;
    endcase
  /* ni/irq_fifo.vhd:126:33  */
  always @*
    case (n1265_o)
      2'b10: n1275_o <= data_r_ptr;
      2'b01: n1275_o <= irq_r_ptr;
      default: n1275_o <= data_r_ptr;
    endcase
  /* ni/irq_fifo.vhd:125:25  */
  assign n1277_o = n1259_o ? n1268_o : 1'b1;
  /* ni/irq_fifo.vhd:125:25  */
  assign n1279_o = n1259_o ? n1271_o : 1'b0;
  /* ni/irq_fifo.vhd:125:25  */
  assign n1281_o = n1259_o ? n1274_o : 1'b0;
  /* ni/irq_fifo.vhd:123:17  */
  assign n1282_o = n1292_o ? n1275_o : data_r_ptr;
  /* ni/irq_fifo.vhd:123:17  */
  assign n1284_o = n1257_o ? n1277_o : 1'b0;
  /* ni/irq_fifo.vhd:123:17  */
  assign n1287_o = n1257_o ? n1279_o : 1'b0;
  /* ni/irq_fifo.vhd:123:17  */
  assign n1290_o = n1257_o ? n1281_o : 1'b0;
  /* ni/irq_fifo.vhd:123:17  */
  assign n1292_o = n1257_o & n1259_o;
  /* ni/irq_fifo.vhd:154:60  */
  assign n1294_o = irq_irq_fifo_data_valid & irq_not_full;
  /* ni/irq_fifo.vhd:154:108  */
  assign n1295_o = irq_data_fifo_data_valid & data_not_full;
  /* ni/irq_fifo.vhd:154:79  */
  assign n1296_o = n1294_o | n1295_o;
  /* ni/irq_fifo.vhd:164:35  */
  assign tdpram_n1300 = tdpram_b_dout; // (signal)
  /* ni/irq_fifo.vhd:146:9  */
  tdp_ram_14_5 tdpram (
    .a_clk(clk),
    .a_wr(n1296_o),
    .a_addr(w_ptr),
    .a_din(w_data),
    .b_clk(clk),
    .b_wr(n1298_o),
    .b_addr(r_ptr),
    .b_din(n1299_o),
    .a_dout(),
    .b_dout(tdpram_b_dout));
  /* ni/irq_fifo.vhd:173:57  */
  assign n1307_o = irq_irq_fifo_data_valid & irq_not_full;
  /* ni/irq_fifo.vhd:174:47  */
  assign n1309_o = irq_w_ptr == 5'b01111;
  /* ni/irq_fifo.vhd:177:64  */
  assign n1311_o = irq_w_ptr + 5'b00001;
  /* ni/irq_fifo.vhd:174:33  */
  assign n1313_o = n1309_o ? 5'b00000 : n1311_o;
  /* ni/irq_fifo.vhd:173:25  */
  assign n1314_o = n1307_o ? n1313_o : irq_w_ptr;
  /* ni/irq_fifo.vhd:171:25  */
  assign n1316_o = reset ? 5'b00000 : n1314_o;
  /* ni/irq_fifo.vhd:170:17  */
  always @(posedge clk)
    n1319_q <= n1316_o;
  /* ni/irq_fifo.vhd:189:58  */
  assign n1323_o = irq_data_fifo_data_valid & data_not_full;
  /* ni/irq_fifo.vhd:190:48  */
  assign n1325_o = data_w_ptr == 5'b10000;
  /* ni/irq_fifo.vhd:193:66  */
  assign n1327_o = data_w_ptr - 5'b00001;
  /* ni/irq_fifo.vhd:190:33  */
  assign n1329_o = n1325_o ? 5'b11111 : n1327_o;
  /* ni/irq_fifo.vhd:189:25  */
  assign n1330_o = n1323_o ? n1329_o : data_w_ptr;
  /* ni/irq_fifo.vhd:187:25  */
  assign n1332_o = reset ? 5'b11111 : n1330_o;
  /* ni/irq_fifo.vhd:186:17  */
  always @(posedge clk)
    n1335_q <= n1332_o;
  /* ni/irq_fifo.vhd:205:49  */
  assign n1339_o = irq_read & irq_not_empty;
  /* ni/irq_fifo.vhd:206:47  */
  assign n1341_o = irq_r_ptr == 5'b01111;
  /* ni/irq_fifo.vhd:209:64  */
  assign n1343_o = irq_r_ptr + 5'b00001;
  /* ni/irq_fifo.vhd:206:33  */
  assign n1345_o = n1341_o ? 5'b00000 : n1343_o;
  /* ni/irq_fifo.vhd:205:25  */
  assign n1346_o = n1339_o ? n1345_o : irq_r_ptr;
  /* ni/irq_fifo.vhd:203:25  */
  assign n1348_o = reset ? 5'b00000 : n1346_o;
  /* ni/irq_fifo.vhd:202:17  */
  always @(posedge clk)
    n1351_q <= n1348_o;
  /* ni/irq_fifo.vhd:221:50  */
  assign n1355_o = data_read & data_not_empty;
  /* ni/irq_fifo.vhd:222:48  */
  assign n1357_o = data_r_ptr == 5'b10000;
  /* ni/irq_fifo.vhd:225:66  */
  assign n1359_o = data_r_ptr - 5'b00001;
  /* ni/irq_fifo.vhd:222:33  */
  assign n1361_o = n1357_o ? 5'b11111 : n1359_o;
  /* ni/irq_fifo.vhd:221:25  */
  assign n1362_o = n1355_o ? n1361_o : data_r_ptr;
  /* ni/irq_fifo.vhd:219:25  */
  assign n1364_o = reset ? 5'b11111 : n1362_o;
  /* ni/irq_fifo.vhd:218:17  */
  always @(posedge clk)
    n1367_q <= n1364_o;
  /* ni/irq_fifo.vhd:234:25  */
  assign n1372_o = reset ? 1'b0 : next_error;
  /* ni/irq_fifo.vhd:233:17  */
  always @(posedge clk)
    n1376_q <= n1372_o;
  /* ni/irq_fifo.vhd:233:17  */
  assign n1377_o = {n1376_q, 18'b000000000000000000, tdpram_n1300};
endmodule

module rx_unit
  (input  clk,
   input  reset,
   input  [34:0] pkt_in,
   output [13:0] spm_addr,
   output [1:0] spm_en,
   output spm_wr,
   output [63:0] spm_wdata,
   output [13:0] config_addr,
   output config_en,
   output config_wr,
   output [31:0] config_wdata,
   output [13:0] irq_fifo_data,
   output irq_fifo_data_valid,
   output irq_fifo_irq_valid);
  wire [13:0] n1023_o;
  wire [1:0] n1024_o;
  wire n1025_o;
  wire [63:0] n1026_o;
  wire [13:0] n1028_o;
  wire n1029_o;
  wire n1030_o;
  wire [31:0] n1031_o;
  wire new_pkt;
  wire new_data_pkt;
  wire new_config_pkt;
  wire new_irq_pkt;
  wire wdata_high_en;
  wire addr_load;
  wire lst_data_pkt;
  wire [13:0] addr;
  wire [13:0] next_addr;
  wire [13:0] int_addr;
  wire [13:0] next_int_addr;
  wire [31:0] wdata_high;
  wire [2:0] state;
  wire [2:0] next_state;
  wire n1035_o;
  wire n1036_o;
  wire n1037_o;
  wire n1038_o;
  wire n1039_o;
  wire n1040_o;
  wire n1041_o;
  wire n1042_o;
  wire n1043_o;
  wire n1044_o;
  wire n1045_o;
  wire n1046_o;
  wire n1047_o;
  wire n1048_o;
  wire n1049_o;
  wire n1050_o;
  wire n1051_o;
  wire n1052_o;
  wire [31:0] n1053_o;
  wire [31:0] n1054_o;
  wire n1055_o;
  wire n1056_o;
  localparam [1:0] n1059_o = 2'b00;
  wire [13:0] n1064_o;
  wire [13:0] n1065_o;
  wire [2:0] n1067_o;
  wire [2:0] n1069_o;
  wire [2:0] n1071_o;
  wire n1073_o;
  wire [13:0] n1075_o;
  wire n1076_o;
  wire n1077_o;
  wire [31:0] n1080_o;
  wire n1081_o;
  wire n1082_o;
  wire n1083_o;
  wire [31:0] n1084_o;
  wire n1087_o;
  wire [2:0] n1090_o;
  wire n1092_o;
  localparam [1:0] n1093_o = 2'b11;
  wire n1095_o;
  wire n1096_o;
  wire [2:0] n1099_o;
  wire n1101_o;
  wire n1104_o;
  wire n1105_o;
  wire [2:0] n1108_o;
  wire n1110_o;
  wire n1114_o;
  wire [31:0] n1117_o;
  wire n1119_o;
  wire [5:0] n1120_o;
  wire n1121_o;
  wire n1122_o;
  reg n1124_o;
  wire n1125_o;
  wire n1126_o;
  reg n1128_o;
  reg n1130_o;
  reg [31:0] n1132_o;
  reg n1135_o;
  reg n1137_o;
  reg [13:0] n1139_o;
  reg n1143_o;
  reg n1147_o;
  reg n1152_o;
  reg [13:0] n1155_o;
  reg [13:0] n1157_o;
  reg [2:0] n1161_o;
  wire [13:0] n1167_o;
  wire [13:0] n1168_o;
  reg [13:0] n1171_q;
  wire [31:0] n1175_o;
  wire [31:0] n1179_o;
  reg [31:0] n1180_q;
  wire [13:0] n1185_o;
  wire [2:0] n1187_o;
  reg [13:0] n1191_q;
  reg [2:0] n1192_q;
  wire n1196_o;
  wire n1197_o;
  wire n1198_o;
  wire n1199_o;
  wire n1200_o;
  wire n1201_o;
  wire n1202_o;
  wire n1203_o;
  wire n1205_o;
  wire n1207_o;
  reg n1210_q;
  wire [80:0] n1211_o;
  wire [47:0] n1212_o;
  assign spm_addr = n1023_o;
  assign spm_en = n1024_o;
  assign spm_wr = n1025_o;
  assign spm_wdata = n1026_o;
  assign config_addr = n1028_o;
  assign config_en = n1029_o;
  assign config_wr = n1030_o;
  assign config_wdata = n1031_o;
  assign irq_fifo_data = n1139_o;
  assign irq_fifo_data_valid = n1056_o;
  assign irq_fifo_irq_valid = n1143_o;
  /* ni/packet_manager.vhd:323:16  */
  assign n1023_o = n1211_o[13:0];
  /* ni/packet_manager.vhd:318:16  */
  assign n1024_o = n1211_o[15:14];
  /* ni/packet_manager.vhd:60:5  */
  assign n1025_o = n1211_o[16];
  /* ni/packet_manager.vhd:51:5  */
  assign n1026_o = n1211_o[80:17];
  assign n1028_o = n1212_o[13:0];
  /* ni/packet_manager.vhd:399:1  */
  assign n1029_o = n1212_o[14];
  assign n1030_o = n1212_o[15];
  /* ni/packet_manager.vhd:387:1  */
  assign n1031_o = n1212_o[47:16];
  /* ni/rx_unit.vhd:63:16  */
  assign new_pkt = n1040_o; // (signal)
  /* ni/rx_unit.vhd:63:25  */
  assign new_data_pkt = n1043_o; // (signal)
  /* ni/rx_unit.vhd:63:39  */
  assign new_config_pkt = n1048_o; // (signal)
  /* ni/rx_unit.vhd:63:55  */
  assign new_irq_pkt = n1052_o; // (signal)
  /* ni/rx_unit.vhd:64:16  */
  assign wdata_high_en = n1147_o; // (signal)
  /* ni/rx_unit.vhd:64:45  */
  assign addr_load = n1152_o; // (signal)
  /* ni/rx_unit.vhd:64:56  */
  assign lst_data_pkt = n1210_q; // (signal)
  /* ni/rx_unit.vhd:65:16  */
  assign addr = n1171_q; // (signal)
  /* ni/rx_unit.vhd:65:22  */
  assign next_addr = n1155_o; // (signal)
  /* ni/rx_unit.vhd:65:33  */
  assign int_addr = n1191_q; // (signal)
  /* ni/rx_unit.vhd:65:43  */
  assign next_int_addr = n1157_o; // (signal)
  /* ni/rx_unit.vhd:67:8  */
  assign wdata_high = n1180_q; // (signal)
  /* ni/rx_unit.vhd:71:16  */
  assign state = n1192_q; // (signal)
  /* ni/rx_unit.vhd:71:23  */
  assign next_state = n1161_o; // (signal)
  /* ni/rx_unit.vhd:75:26  */
  assign n1035_o = pkt_in[34];
  /* ni/rx_unit.vhd:75:53  */
  assign n1036_o = pkt_in[33];
  /* ni/rx_unit.vhd:75:43  */
  assign n1037_o = n1035_o & n1036_o;
  /* ni/rx_unit.vhd:75:85  */
  assign n1038_o = pkt_in[32];
  /* ni/rx_unit.vhd:75:75  */
  assign n1039_o = ~n1038_o;
  /* ni/rx_unit.vhd:75:70  */
  assign n1040_o = n1037_o & n1039_o;
  /* ni/rx_unit.vhd:78:48  */
  assign n1041_o = pkt_in[30];
  /* ni/rx_unit.vhd:78:38  */
  assign n1042_o = ~n1041_o;
  /* ni/rx_unit.vhd:78:33  */
  assign n1043_o = new_pkt & n1042_o;
  /* ni/rx_unit.vhd:81:49  */
  assign n1044_o = pkt_in[31];
  /* ni/rx_unit.vhd:81:39  */
  assign n1045_o = ~n1044_o;
  /* ni/rx_unit.vhd:81:35  */
  assign n1046_o = new_pkt & n1045_o;
  /* ni/rx_unit.vhd:81:106  */
  assign n1047_o = pkt_in[30];
  /* ni/rx_unit.vhd:81:96  */
  assign n1048_o = n1046_o & n1047_o;
  /* ni/rx_unit.vhd:84:42  */
  assign n1049_o = pkt_in[31];
  /* ni/rx_unit.vhd:84:32  */
  assign n1050_o = new_pkt & n1049_o;
  /* ni/rx_unit.vhd:84:98  */
  assign n1051_o = pkt_in[30];
  /* ni/rx_unit.vhd:84:88  */
  assign n1052_o = n1050_o & n1051_o;
  /* ni/rx_unit.vhd:87:62  */
  assign n1053_o = pkt_in[31:0];
  /* ni/rx_unit.vhd:89:65  */
  assign n1054_o = pkt_in[31:0];
  /* ni/rx_unit.vhd:96:55  */
  assign n1055_o = pkt_in[32];
  /* ni/rx_unit.vhd:96:45  */
  assign n1056_o = lst_data_pkt & n1055_o;
  /* ni/rx_unit.vhd:113:43  */
  assign n1064_o = int_addr + 14'b00000000000001;
  /* ni/rx_unit.vhd:117:65  */
  assign n1065_o = pkt_in[29:16];
  /* ni/rx_unit.vhd:122:33  */
  assign n1067_o = new_irq_pkt ? 3'b101 : state;
  /* ni/rx_unit.vhd:120:33  */
  assign n1069_o = new_config_pkt ? 3'b100 : n1067_o;
  /* ni/rx_unit.vhd:118:33  */
  assign n1071_o = new_data_pkt ? 3'b010 : n1069_o;
  /* ni/rx_unit.vhd:115:25  */
  assign n1073_o = state == 3'b000;
  /* ni/rx_unit.vhd:127:55  */
  assign n1075_o = addr + 14'b00000000000001;
  /* ni/rx_unit.vhd:128:43  */
  assign n1076_o = pkt_in[32];
  /* ni/rx_unit.vhd:128:60  */
  assign n1077_o = ~n1076_o;
  /* ni/rx_unit.vhd:134:107  */
  assign n1080_o = pkt_in[31:0];
  assign n1081_o = n1059_o[0];
  /* ni/rx_unit.vhd:128:33  */
  assign n1082_o = n1077_o ? n1081_o : 1'b1;
  /* ni/rx_unit.vhd:128:33  */
  assign n1083_o = n1077_o ? 1'b0 : 1'b1;
  /* ni/rx_unit.vhd:128:33  */
  assign n1084_o = n1077_o ? wdata_high : n1080_o;
  /* ni/rx_unit.vhd:128:33  */
  assign n1087_o = n1077_o ? 1'b1 : 1'b0;
  /* ni/rx_unit.vhd:128:33  */
  assign n1090_o = n1077_o ? 3'b001 : 3'b000;
  /* ni/rx_unit.vhd:126:25  */
  assign n1092_o = state == 3'b010;
  /* ni/rx_unit.vhd:143:43  */
  assign n1095_o = pkt_in[32];
  /* ni/rx_unit.vhd:143:60  */
  assign n1096_o = ~n1095_o;
  /* ni/rx_unit.vhd:143:33  */
  assign n1099_o = n1096_o ? 3'b010 : 3'b000;
  /* ni/rx_unit.vhd:138:25  */
  assign n1101_o = state == 3'b001;
  /* ni/rx_unit.vhd:153:43  */
  assign n1104_o = pkt_in[32];
  /* ni/rx_unit.vhd:153:60  */
  assign n1105_o = ~n1104_o;
  /* ni/rx_unit.vhd:153:33  */
  assign n1108_o = n1105_o ? 3'b011 : 3'b000;
  /* ni/rx_unit.vhd:150:25  */
  assign n1110_o = state == 3'b100;
  /* ni/rx_unit.vhd:159:25  */
  assign n1114_o = state == 3'b011;
  /* ni/rx_unit.vhd:169:99  */
  assign n1117_o = pkt_in[31:0];
  /* ni/rx_unit.vhd:165:25  */
  assign n1119_o = state == 3'b101;
  assign n1120_o = {n1119_o, n1114_o, n1110_o, n1101_o, n1092_o, n1073_o};
  assign n1121_o = n1093_o[0];
  assign n1122_o = n1059_o[0];
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1120_o)
      6'b100000: n1124_o <= 1'b1;
      6'b010000: n1124_o <= n1122_o;
      6'b001000: n1124_o <= n1122_o;
      6'b000100: n1124_o <= n1121_o;
      6'b000010: n1124_o <= n1082_o;
      6'b000001: n1124_o <= n1122_o;
      default: n1124_o <= 1'bX;
    endcase
  assign n1125_o = n1093_o[1];
  assign n1126_o = n1059_o[1];
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1120_o)
      6'b100000: n1128_o <= n1126_o;
      6'b010000: n1128_o <= n1126_o;
      6'b001000: n1128_o <= n1126_o;
      6'b000100: n1128_o <= n1125_o;
      6'b000010: n1128_o <= n1126_o;
      6'b000001: n1128_o <= n1126_o;
      default: n1128_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1120_o)
      6'b100000: n1130_o <= 1'b1;
      6'b010000: n1130_o <= 1'b0;
      6'b001000: n1130_o <= 1'b0;
      6'b000100: n1130_o <= 1'b1;
      6'b000010: n1130_o <= n1083_o;
      6'b000001: n1130_o <= 1'b0;
      default: n1130_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1120_o)
      6'b100000: n1132_o <= n1117_o;
      6'b010000: n1132_o <= wdata_high;
      6'b001000: n1132_o <= wdata_high;
      6'b000100: n1132_o <= wdata_high;
      6'b000010: n1132_o <= n1084_o;
      6'b000001: n1132_o <= wdata_high;
      default: n1132_o <= 32'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1120_o)
      6'b100000: n1135_o <= 1'b0;
      6'b010000: n1135_o <= 1'b1;
      6'b001000: n1135_o <= 1'b1;
      6'b000100: n1135_o <= 1'b0;
      6'b000010: n1135_o <= 1'b0;
      6'b000001: n1135_o <= 1'b0;
      default: n1135_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1120_o)
      6'b100000: n1137_o <= 1'b0;
      6'b010000: n1137_o <= 1'b1;
      6'b001000: n1137_o <= 1'b1;
      6'b000100: n1137_o <= 1'b0;
      6'b000010: n1137_o <= 1'b0;
      6'b000001: n1137_o <= 1'b0;
      default: n1137_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1120_o)
      6'b100000: n1139_o <= addr;
      6'b010000: n1139_o <= addr;
      6'b001000: n1139_o <= addr;
      6'b000100: n1139_o <= int_addr;
      6'b000010: n1139_o <= addr;
      6'b000001: n1139_o <= addr;
      default: n1139_o <= 14'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1120_o)
      6'b100000: n1143_o <= 1'b1;
      6'b010000: n1143_o <= 1'b0;
      6'b001000: n1143_o <= 1'b0;
      6'b000100: n1143_o <= 1'b0;
      6'b000010: n1143_o <= 1'b0;
      6'b000001: n1143_o <= 1'b0;
      default: n1143_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1120_o)
      6'b100000: n1147_o <= 1'b0;
      6'b010000: n1147_o <= 1'b0;
      6'b001000: n1147_o <= 1'b0;
      6'b000100: n1147_o <= 1'b0;
      6'b000010: n1147_o <= n1087_o;
      6'b000001: n1147_o <= 1'b0;
      default: n1147_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1120_o)
      6'b100000: n1152_o <= 1'b0;
      6'b010000: n1152_o <= 1'b0;
      6'b001000: n1152_o <= 1'b0;
      6'b000100: n1152_o <= 1'b0;
      6'b000010: n1152_o <= 1'b0;
      6'b000001: n1152_o <= 1'b1;
      default: n1152_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1120_o)
      6'b100000: n1155_o <= addr;
      6'b010000: n1155_o <= addr;
      6'b001000: n1155_o <= addr;
      6'b000100: n1155_o <= next_int_addr;
      6'b000010: n1155_o <= addr;
      6'b000001: n1155_o <= addr;
      default: n1155_o <= 14'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1120_o)
      6'b100000: n1157_o <= n1064_o;
      6'b010000: n1157_o <= n1064_o;
      6'b001000: n1157_o <= n1064_o;
      6'b000100: n1157_o <= n1064_o;
      6'b000010: n1157_o <= n1075_o;
      6'b000001: n1157_o <= n1065_o;
      default: n1157_o <= 14'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1120_o)
      6'b100000: n1161_o <= 3'b000;
      6'b010000: n1161_o <= 3'b000;
      6'b001000: n1161_o <= n1108_o;
      6'b000100: n1161_o <= n1099_o;
      6'b000010: n1161_o <= n1090_o;
      6'b000001: n1161_o <= n1071_o;
      default: n1161_o <= 3'bX;
    endcase
  /* ni/rx_unit.vhd:180:56  */
  assign n1167_o = pkt_in[29:16];
  /* ni/rx_unit.vhd:179:25  */
  assign n1168_o = addr_load ? n1167_o : next_addr;
  /* ni/rx_unit.vhd:178:17  */
  always @(posedge clk)
    n1171_q <= n1168_o;
  /* ni/rx_unit.vhd:192:62  */
  assign n1175_o = pkt_in[31:0];
  /* ni/rx_unit.vhd:190:17  */
  assign n1179_o = wdata_high_en ? n1175_o : wdata_high;
  /* ni/rx_unit.vhd:190:17  */
  always @(posedge clk)
    n1180_q <= n1179_o;
  /* ni/rx_unit.vhd:201:25  */
  assign n1185_o = reset ? 14'b00000000000000 : next_int_addr;
  /* ni/rx_unit.vhd:201:25  */
  assign n1187_o = reset ? 3'b000 : next_state;
  /* ni/rx_unit.vhd:200:17  */
  always @(posedge clk)
    n1191_q <= n1185_o;
  /* ni/rx_unit.vhd:200:17  */
  always @(posedge clk)
    n1192_q <= n1187_o;
  /* ni/rx_unit.vhd:217:77  */
  assign n1196_o = pkt_in[31];
  /* ni/rx_unit.vhd:217:67  */
  assign n1197_o = new_data_pkt & n1196_o;
  /* ni/rx_unit.vhd:217:49  */
  assign n1198_o = ~n1197_o;
  /* ni/rx_unit.vhd:217:135  */
  assign n1199_o = pkt_in[32];
  /* ni/rx_unit.vhd:217:125  */
  assign n1200_o = n1198_o & n1199_o;
  /* ni/rx_unit.vhd:217:43  */
  assign n1201_o = reset | n1200_o;
  /* ni/rx_unit.vhd:219:56  */
  assign n1202_o = pkt_in[31];
  /* ni/rx_unit.vhd:219:46  */
  assign n1203_o = new_data_pkt & n1202_o;
  /* ni/rx_unit.vhd:219:25  */
  assign n1205_o = n1203_o ? 1'b1 : lst_data_pkt;
  /* ni/rx_unit.vhd:217:25  */
  assign n1207_o = n1201_o ? 1'b0 : n1205_o;
  /* ni/rx_unit.vhd:216:17  */
  always @(posedge clk)
    n1210_q <= n1207_o;
  /* ni/rx_unit.vhd:216:17  */
  assign n1211_o = {n1132_o, n1053_o, n1130_o, n1128_o, n1124_o, addr};
  assign n1212_o = {n1054_o, n1137_o, n1135_o, int_addr};
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
  wire [47:0] n665_o;
  wire [31:0] n667_o;
  wire n668_o;
  wire [13:0] n670_o;
  wire [1:0] n671_o;
  wire n672_o;
  wire [63:0] n673_o;
  wire [64:0] n674_o;
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
  wire [13:0] n682_o;
  wire [3:0] n683_o;
  wire [1:0] n684_o;
  wire n686_o;
  wire [1:0] n688_o;
  wire [4:0] n690_o;
  wire [7:0] n692_o;
  wire [18:0] n694_o;
  wire [34:0] n695_o;
  wire n696_o;
  wire [13:0] n698_o;
  wire [13:0] n699_o;
  wire [13:0] n700_o;
  wire [13:0] n702_o;
  wire [13:0] n703_o;
  wire [13:0] n704_o;
  wire n705_o;
  wire [1:0] n706_o;
  wire n708_o;
  wire [1:0] n710_o;
  wire n712_o;
  wire n713_o;
  wire [13:0] n714_o;
  wire [13:0] n715_o;
  wire [13:0] n716_o;
  wire [13:0] n717_o;
  wire [13:0] n718_o;
  wire [13:0] n719_o;
  wire [13:0] n720_o;
  wire [13:0] n721_o;
  wire [13:0] n722_o;
  wire [1:0] n723_o;
  wire n725_o;
  wire [3:0] n726_o;
  wire [3:0] n727_o;
  wire [3:0] n728_o;
  wire [9:0] n729_o;
  wire [3:0] n731_o;
  wire [4:0] n733_o;
  wire [13:0] n734_o;
  wire [18:0] n735_o;
  wire [34:0] n736_o;
  wire [15:0] n737_o;
  wire [15:0] n738_o;
  wire [15:0] n739_o;
  wire [34:0] n741_o;
  wire [2:0] n743_o;
  wire [13:0] n744_o;
  wire n745_o;
  wire [13:0] n746_o;
  wire n749_o;
  wire [13:0] n750_o;
  wire [28:0] n751_o;
  wire [13:0] n752_o;
  wire [13:0] n753_o;
  wire [27:0] n754_o;
  wire [28:0] n755_o;
  wire [28:0] n756_o;
  wire [3:0] n757_o;
  wire [15:0] n758_o;
  wire [15:0] n759_o;
  wire [34:0] n760_o;
  wire [2:0] n762_o;
  wire [13:0] n763_o;
  wire [1:0] n764_o;
  wire [13:0] n765_o;
  wire n767_o;
  wire [13:0] n768_o;
  wire [13:0] n769_o;
  wire [27:0] n770_o;
  wire [28:0] n771_o;
  wire [28:0] n772_o;
  wire [3:0] n773_o;
  wire [1:0] n775_o;
  wire [1:0] n777_o;
  wire [15:0] n778_o;
  wire [15:0] n779_o;
  wire [34:0] n781_o;
  wire [2:0] n782_o;
  wire [13:0] n783_o;
  wire [1:0] n784_o;
  wire [13:0] n785_o;
  wire n787_o;
  wire [13:0] n788_o;
  wire [13:0] n789_o;
  wire [27:0] n790_o;
  wire [28:0] n791_o;
  wire [28:0] n792_o;
  wire [3:0] n793_o;
  wire [1:0] n795_o;
  wire [1:0] n797_o;
  wire n799_o;
  wire [31:0] n800_o;
  wire [3:0] n802_o;
  wire [13:0] n804_o;
  wire n806_o;
  wire n808_o;
  wire n809_o;
  wire [31:0] n810_o;
  wire [34:0] n812_o;
  wire [13:0] n814_o;
  wire [31:0] n815_o;
  wire [34:0] n817_o;
  wire [34:0] n818_o;
  wire [2:0] n821_o;
  wire [13:0] n822_o;
  wire n824_o;
  wire [3:0] n826_o;
  wire [13:0] n828_o;
  wire n830_o;
  wire n832_o;
  wire n833_o;
  wire [34:0] n835_o;
  wire [13:0] n838_o;
  wire [34:0] n840_o;
  wire [15:0] n841_o;
  wire [15:0] n842_o;
  wire [15:0] n843_o;
  wire [34:0] n844_o;
  wire [2:0] n847_o;
  wire [13:0] n848_o;
  wire n850_o;
  wire [34:0] n852_o;
  wire n854_o;
  wire [34:0] n856_o;
  wire n858_o;
  wire [4:0] n859_o;
  wire [15:0] n860_o;
  reg [15:0] n862_o;
  reg [34:0] n864_o;
  reg [2:0] n869_o;
  reg [13:0] n871_o;
  reg [1:0] n873_o;
  reg [13:0] n875_o;
  reg n878_o;
  wire [13:0] n880_o;
  reg [13:0] n882_o;
  wire [27:0] n883_o;
  wire [28:0] n884_o;
  reg [28:0] n886_o;
  wire [1:0] n888_o;
  reg [3:0] n890_o;
  wire [1:0] n891_o;
  reg [1:0] n894_o;
  wire [13:0] n895_o;
  reg [13:0] n898_o;
  wire [1:0] n899_o;
  reg [1:0] n902_o;
  wire [13:0] n903_o;
  reg [13:0] n906_o;
  wire [5:0] n913_o;
  localparam [31:0] n914_o = 32'b00000000000000000000000000000000;
  wire n915_o;
  wire [27:0] n916_o;
  wire [15:0] n917_o;
  wire n918_o;
  wire n919_o;
  wire n920_o;
  wire n921_o;
  wire n922_o;
  wire n923_o;
  wire n924_o;
  wire n926_o;
  wire n928_o;
  wire n931_o;
  wire n933_o;
  wire n934_o;
  wire [27:0] n935_o;
  wire [15:0] n936_o;
  wire [15:0] n937_o;
  wire [15:0] n938_o;
  wire [11:0] n939_o;
  wire [11:0] n940_o;
  wire [11:0] n941_o;
  wire n942_o;
  wire n943_o;
  wire [2:0] n946_o;
  wire n950_o;
  wire [5:0] n951_o;
  wire [28:0] dmatbl1_a_dout;
  wire [28:0] dmatbl1_b_dout;
  wire [28:0] n953_o;
  wire [28:0] n955_o;
  wire [15:0] dmatbl2_a_dout;
  wire [15:0] dmatbl2_b_dout;
  wire [15:0] n957_o;
  wire [15:0] n959_o;
  wire [3:0] n962_o;
  wire n964_o;
  wire n965_o;
  wire n968_o;
  wire n974_o;
  reg n977_q;
  wire n981_o;
  reg n984_q;
  wire n988_o;
  reg n992_q;
  wire [2:0] n996_o;
  reg [2:0] n999_q;
  reg [13:0] n1009_q;
  reg [13:0] n1010_q;
  reg [5:0] n1011_q;
  reg [3:0] n1012_q;
  reg [15:0] n1013_q;
  reg [31:0] n1014_q;
  wire [44:0] n1015_o;
  wire [44:0] n1016_o;
  wire [44:0] n1017_o;
  wire [44:0] n1018_o;
  wire [31:0] n1019_o;
  wire [32:0] n1020_o;
  wire [80:0] n1021_o;
  assign config_slv_rdata = n667_o;
  assign config_slv_error = n668_o;
  assign spm_addr = n670_o;
  assign spm_en = n671_o;
  assign spm_wr = n672_o;
  assign spm_wdata = n673_o;
  assign pkt_out = n864_o;
  /* ni/schedule_table.vhd:103:16  */
  assign n665_o = {config_wdata, config_wr, config_en, config_addr};
  /* ni/schedule_table.vhd:59:5  */
  assign n667_o = n1020_o[31:0];
  /* ni/schedule_table.vhd:58:5  */
  assign n668_o = n1020_o[32];
  /* ni/schedule_table.vhd:56:5  */
  assign n670_o = n1021_o[13:0];
  /* ni/schedule_table.vhd:51:5  */
  assign n671_o = n1021_o[15:14];
  assign n672_o = n1021_o[16];
  assign n673_o = n1021_o[80:17];
  /* ni/schedule_table.vhd:190:1  */
  assign n674_o = {spm_slv_error, spm_slv_rdata};
  /* ni/packet_manager.vhd:78:8  */
  assign state = n999_q; // (signal)
  /* ni/packet_manager.vhd:78:15  */
  assign next_state = n869_o; // (signal)
  /* ni/packet_manager.vhd:83:8  */
  assign dmatbl_data = port_b_dout; // (signal)
  /* ni/packet_manager.vhd:94:8  */
  assign count_reg = n1009_q; // (signal)
  /* ni/packet_manager.vhd:94:19  */
  assign count_next = n871_o; // (signal)
  /* ni/packet_manager.vhd:101:8  */
  assign pkt_type = n873_o; // (signal)
  /* ni/packet_manager.vhd:103:8  */
  assign dma_en_reg = n977_q; // (signal)
  /* ni/packet_manager.vhd:105:8  */
  assign read_ptr_reg = n1010_q; // (signal)
  /* ni/packet_manager.vhd:105:22  */
  assign read_ptr_next = n875_o; // (signal)
  /* ni/packet_manager.vhd:107:8  */
  assign hi_lo_next = n933_o; // (signal)
  /* ni/packet_manager.vhd:108:8  */
  assign hi_lo_reg = n984_q; // (signal)
  /* ni/packet_manager.vhd:110:8  */
  assign port_b_wr = n950_o; // (signal)
  /* ni/packet_manager.vhd:111:8  */
  assign port_b_addr = n951_o; // (signal)
  /* ni/packet_manager.vhd:112:8  */
  assign port_b_din = dma_update_data; // (signal)
  /* ni/packet_manager.vhd:113:8  */
  assign port_b_dout = n1015_o; // (signal)
  /* ni/packet_manager.vhd:115:8  */
  assign dma_num_reg = n1011_q; // (signal)
  /* ni/packet_manager.vhd:116:8  */
  assign dma_update_en = n878_o; // (signal)
  /* ni/packet_manager.vhd:117:8  */
  assign dma_update_addr = dma_num_reg; // (signal)
  /* ni/packet_manager.vhd:118:8  */
  assign dma_update_data = n1016_o; // (signal)
  /* ni/packet_manager.vhd:131:8  */
  assign port_a_wr_hi = n928_o; // (signal)
  /* ni/packet_manager.vhd:132:8  */
  assign port_a_wr_lo = n931_o; // (signal)
  /* ni/packet_manager.vhd:133:8  */
  assign port_a_addr = n913_o; // (signal)
  /* ni/packet_manager.vhd:134:8  */
  assign port_a_din = n1017_o; // (signal)
  /* ni/packet_manager.vhd:135:8  */
  assign port_a_dout = n1018_o; // (signal)
  /* ni/packet_manager.vhd:137:8  */
  assign config_slv_error_next = n968_o; // (signal)
  /* ni/packet_manager.vhd:139:8  */
  assign pkt_len_reg = n1012_q; // (signal)
  /* ni/packet_manager.vhd:139:21  */
  assign pkt_len_next = n890_o; // (signal)
  /* ni/packet_manager.vhd:141:8  */
  assign route_reg = n1013_q; // (signal)
  /* ni/packet_manager.vhd:147:8  */
  assign payload_data = n1014_q; // (signal)
  /* ni/packet_manager.vhd:147:22  */
  assign payload_data_next = n1019_o; // (signal)
  assign n682_o = dmatbl_data[29:16];
  /* ni/packet_manager.vhd:167:3  */
  assign n683_o = dma_en ? pkt_len : pkt_len_reg;
  assign n684_o = dmatbl_data[15:14];
  /* ni/packet_manager.vhd:179:26  */
  assign n686_o = $unsigned(pkt_len_reg) >= $unsigned(4'b0001);
  /* ni/packet_manager.vhd:179:11  */
  assign n688_o = n686_o ? 2'b01 : n684_o;
  /* ni/packet_manager.vhd:182:49  */
  assign n690_o = {3'b110, pkt_type};
  /* ni/packet_manager.vhd:182:60  */
  assign n692_o = {n690_o, 3'b011};
  /* ni/packet_manager.vhd:182:70  */
  assign n694_o = {n692_o, 11'b00000000000};
  /* ni/packet_manager.vhd:182:103  */
  assign n695_o = {n694_o, route_reg};
  assign n696_o = dmatbl_data[44];
  assign n698_o = dmatbl_data[29:16];
  assign n699_o = dmatbl_data[29:16];
  assign n700_o = dmatbl_data[43:30];
  /* ni/packet_manager.vhd:191:30  */
  assign n702_o = n700_o - 14'b00000000000001;
  assign n703_o = dmatbl_data[43:30];
  /* ni/packet_manager.vhd:192:20  */
  assign n704_o = {10'b0, pkt_len_reg};  //  uext
  /* ni/packet_manager.vhd:192:20  */
  assign n705_o = $unsigned(n703_o) > $unsigned(n704_o);
  assign n706_o = dmatbl_data[15:14];
  /* ni/packet_manager.vhd:193:29  */
  assign n708_o = n706_o == 2'b10;
  /* ni/packet_manager.vhd:185:9  */
  assign n710_o = n745_o ? 2'b00 : n684_o;
  /* ni/packet_manager.vhd:192:11  */
  assign n712_o = n705_o & n708_o;
  /* ni/packet_manager.vhd:192:11  */
  assign n713_o = n705_o ? 1'b1 : 1'b0;
  /* ni/packet_manager.vhd:199:43  */
  assign n714_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:199:68  */
  assign n715_o = {10'b0, pkt_len_reg};  //  uext
  /* ni/packet_manager.vhd:199:68  */
  assign n716_o = n714_o + n715_o;
  assign n717_o = dmatbl_data[29:16];
  /* ni/packet_manager.vhd:200:39  */
  assign n718_o = {10'b0, pkt_len_reg};  //  uext
  /* ni/packet_manager.vhd:200:39  */
  assign n719_o = n717_o + n718_o;
  assign n720_o = dmatbl_data[43:30];
  /* ni/packet_manager.vhd:201:33  */
  assign n721_o = {10'b0, pkt_len_reg};  //  uext
  /* ni/packet_manager.vhd:201:33  */
  assign n722_o = n720_o - n721_o;
  assign n723_o = dmatbl_data[15:14];
  /* ni/packet_manager.vhd:202:27  */
  assign n725_o = n723_o == 2'b01;
  /* ni/packet_manager.vhd:205:43  */
  assign n726_o = dmatbl_data[13:10];
  assign n727_o = n716_o[13:10];
  /* ni/packet_manager.vhd:202:11  */
  assign n728_o = n725_o ? n726_o : n727_o;
  assign n729_o = n716_o[9:0];
  /* ni/packet_manager.vhd:207:39  */
  assign n731_o = pkt_len_reg - 4'b0001;
  /* ni/packet_manager.vhd:208:49  */
  assign n733_o = {3'b110, pkt_type};
  /* ni/packet_manager.vhd:208:68  */
  assign n734_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:208:60  */
  assign n735_o = {n733_o, n734_o};
  /* ni/packet_manager.vhd:208:93  */
  assign n736_o = {n735_o, route_reg};
  assign n737_o = {2'b11, n698_o};
  assign n738_o = {2'b00, n682_o};
  /* ni/packet_manager.vhd:185:9  */
  assign n739_o = n696_o ? n737_o : n738_o;
  /* ni/packet_manager.vhd:185:9  */
  assign n741_o = n696_o ? n736_o : 35'b00000000000000000000000000000000000;
  /* ni/packet_manager.vhd:185:9  */
  assign n743_o = n696_o ? 3'b001 : state;
  /* ni/packet_manager.vhd:185:9  */
  assign n744_o = n696_o ? n702_o : count_reg;
  /* ni/packet_manager.vhd:185:9  */
  assign n745_o = n696_o & n712_o;
  /* ni/packet_manager.vhd:185:9  */
  assign n746_o = n696_o ? n699_o : read_ptr_reg;
  /* ni/packet_manager.vhd:185:9  */
  assign n749_o = n696_o ? 1'b1 : 1'b0;
  assign n750_o = {n728_o, n729_o};
  assign n751_o = {n713_o, n722_o, n719_o};
  assign n752_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:185:9  */
  assign n753_o = n696_o ? n750_o : n752_o;
  assign n754_o = dmatbl_data[43:16];
  assign n755_o = {1'b0, n754_o};
  /* ni/packet_manager.vhd:185:9  */
  assign n756_o = n696_o ? n751_o : n755_o;
  /* ni/packet_manager.vhd:185:9  */
  assign n757_o = n696_o ? n731_o : n683_o;
  assign n758_o = {2'b00, n682_o};
  /* ni/packet_manager.vhd:177:9  */
  assign n759_o = mc ? n758_o : n739_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n760_o = mc ? n695_o : n741_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n762_o = mc ? 3'b011 : n743_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n763_o = mc ? count_reg : n744_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n764_o = mc ? n688_o : n710_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n765_o = mc ? read_ptr_reg : n746_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n767_o = mc ? 1'b0 : n749_o;
  assign n768_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:177:9  */
  assign n769_o = mc ? n768_o : n753_o;
  assign n770_o = dmatbl_data[43:16];
  assign n771_o = {1'b0, n770_o};
  /* ni/packet_manager.vhd:177:9  */
  assign n772_o = mc ? n771_o : n756_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n773_o = mc ? n683_o : n757_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n775_o = mc ? mc_idx : 2'b00;
  /* ni/packet_manager.vhd:177:9  */
  assign n777_o = mc ? mc_p : 2'b00;
  assign n778_o = {2'b00, n682_o};
  /* ni/packet_manager.vhd:176:7  */
  assign n779_o = dma_en_reg ? n759_o : n778_o;
  /* ni/packet_manager.vhd:176:7  */
  assign n781_o = dma_en_reg ? n760_o : 35'b00000000000000000000000000000000000;
  /* ni/packet_manager.vhd:176:7  */
  assign n782_o = dma_en_reg ? n762_o : state;
  /* ni/packet_manager.vhd:176:7  */
  assign n783_o = dma_en_reg ? n763_o : count_reg;
  /* ni/packet_manager.vhd:176:7  */
  assign n784_o = dma_en_reg ? n764_o : n684_o;
  /* ni/packet_manager.vhd:176:7  */
  assign n785_o = dma_en_reg ? n765_o : read_ptr_reg;
  /* ni/packet_manager.vhd:176:7  */
  assign n787_o = dma_en_reg ? n767_o : 1'b0;
  assign n788_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:176:7  */
  assign n789_o = dma_en_reg ? n769_o : n788_o;
  assign n790_o = dmatbl_data[43:16];
  assign n791_o = {1'b0, n790_o};
  /* ni/packet_manager.vhd:176:7  */
  assign n792_o = dma_en_reg ? n772_o : n791_o;
  /* ni/packet_manager.vhd:176:7  */
  assign n793_o = dma_en_reg ? n773_o : n683_o;
  /* ni/packet_manager.vhd:176:7  */
  assign n795_o = dma_en_reg ? n775_o : 2'b00;
  /* ni/packet_manager.vhd:176:7  */
  assign n797_o = dma_en_reg ? n777_o : 2'b00;
  /* ni/packet_manager.vhd:175:5  */
  assign n799_o = state == 3'b000;
  /* ni/packet_manager.vhd:213:41  */
  assign n800_o = n674_o[31:0];
  /* ni/packet_manager.vhd:214:35  */
  assign n802_o = pkt_len_reg - 4'b0001;
  /* ni/packet_manager.vhd:215:31  */
  assign n804_o = count_reg - 14'b00000000000001;
  /* ni/packet_manager.vhd:216:22  */
  assign n806_o = $unsigned(pkt_len_reg) > $unsigned(4'b0000);
  /* ni/packet_manager.vhd:216:40  */
  assign n808_o = $unsigned(count_reg) > $unsigned(14'b00000000000000);
  /* ni/packet_manager.vhd:216:26  */
  assign n809_o = n806_o & n808_o;
  /* ni/packet_manager.vhd:218:58  */
  assign n810_o = n674_o[63:32];
  /* ni/packet_manager.vhd:218:43  */
  assign n812_o = {3'b100, n810_o};
  /* ni/packet_manager.vhd:219:39  */
  assign n814_o = read_ptr_reg + 14'b00000000000001;
  /* ni/packet_manager.vhd:222:62  */
  assign n815_o = n674_o[63:32];
  /* ni/packet_manager.vhd:222:47  */
  assign n817_o = {3'b101, n815_o};
  /* ni/packet_manager.vhd:216:7  */
  assign n818_o = n809_o ? n812_o : n817_o;
  /* ni/packet_manager.vhd:216:7  */
  assign n821_o = n809_o ? 3'b010 : 3'b000;
  /* ni/packet_manager.vhd:216:7  */
  assign n822_o = n809_o ? n814_o : read_ptr_reg;
  /* ni/packet_manager.vhd:212:5  */
  assign n824_o = state == 3'b001;
  /* ni/packet_manager.vhd:226:35  */
  assign n826_o = pkt_len_reg - 4'b0001;
  /* ni/packet_manager.vhd:227:31  */
  assign n828_o = count_reg - 14'b00000000000001;
  /* ni/packet_manager.vhd:228:22  */
  assign n830_o = $unsigned(pkt_len_reg) > $unsigned(4'b0000);
  /* ni/packet_manager.vhd:228:40  */
  assign n832_o = $unsigned(count_reg) > $unsigned(14'b00000000000000);
  /* ni/packet_manager.vhd:228:26  */
  assign n833_o = n830_o & n832_o;
  /* ni/packet_manager.vhd:230:43  */
  assign n835_o = {3'b100, payload_data};
  /* ni/packet_manager.vhd:232:39  */
  assign n838_o = read_ptr_reg + 14'b00000000000001;
  /* ni/packet_manager.vhd:238:47  */
  assign n840_o = {3'b101, payload_data};
  assign n841_o = {2'b11, read_ptr_next};
  assign n842_o = {2'b00, n682_o};
  /* ni/packet_manager.vhd:228:7  */
  assign n843_o = n833_o ? n841_o : n842_o;
  /* ni/packet_manager.vhd:228:7  */
  assign n844_o = n833_o ? n835_o : n840_o;
  /* ni/packet_manager.vhd:228:7  */
  assign n847_o = n833_o ? 3'b001 : 3'b000;
  /* ni/packet_manager.vhd:228:7  */
  assign n848_o = n833_o ? n838_o : read_ptr_reg;
  /* ni/packet_manager.vhd:225:5  */
  assign n850_o = state == 3'b010;
  /* ni/packet_manager.vhd:243:41  */
  assign n852_o = {3'b100, payload_data};
  /* ni/packet_manager.vhd:241:5  */
  assign n854_o = state == 3'b011;
  /* ni/packet_manager.vhd:247:45  */
  assign n856_o = {3'b101, payload_data};
  /* ni/packet_manager.vhd:245:5  */
  assign n858_o = state == 3'b100;
  assign n859_o = {n858_o, n854_o, n850_o, n824_o, n799_o};
  assign n860_o = {2'b00, n682_o};
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n859_o)
      5'b10000: n862_o <= n860_o;
      5'b01000: n862_o <= n860_o;
      5'b00100: n862_o <= n843_o;
      5'b00010: n862_o <= n860_o;
      5'b00001: n862_o <= n779_o;
      default: n862_o <= 16'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n859_o)
      5'b10000: n864_o <= n856_o;
      5'b01000: n864_o <= n852_o;
      5'b00100: n864_o <= n844_o;
      5'b00010: n864_o <= n818_o;
      5'b00001: n864_o <= n781_o;
      default: n864_o <= 35'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n859_o)
      5'b10000: n869_o <= 3'b000;
      5'b01000: n869_o <= 3'b100;
      5'b00100: n869_o <= n847_o;
      5'b00010: n869_o <= n821_o;
      5'b00001: n869_o <= n782_o;
      default: n869_o <= 3'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n859_o)
      5'b10000: n871_o <= count_reg;
      5'b01000: n871_o <= count_reg;
      5'b00100: n871_o <= n828_o;
      5'b00010: n871_o <= n804_o;
      5'b00001: n871_o <= n783_o;
      default: n871_o <= 14'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n859_o)
      5'b10000: n873_o <= n684_o;
      5'b01000: n873_o <= n684_o;
      5'b00100: n873_o <= n684_o;
      5'b00010: n873_o <= n684_o;
      5'b00001: n873_o <= n784_o;
      default: n873_o <= 2'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n859_o)
      5'b10000: n875_o <= read_ptr_reg;
      5'b01000: n875_o <= read_ptr_reg;
      5'b00100: n875_o <= n848_o;
      5'b00010: n875_o <= n822_o;
      5'b00001: n875_o <= n785_o;
      default: n875_o <= 14'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n859_o)
      5'b10000: n878_o <= 1'b0;
      5'b01000: n878_o <= 1'b0;
      5'b00100: n878_o <= 1'b0;
      5'b00010: n878_o <= 1'b0;
      5'b00001: n878_o <= n787_o;
      default: n878_o <= 1'bX;
    endcase
  assign n880_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n859_o)
      5'b10000: n882_o <= n880_o;
      5'b01000: n882_o <= n880_o;
      5'b00100: n882_o <= n880_o;
      5'b00010: n882_o <= n880_o;
      5'b00001: n882_o <= n789_o;
      default: n882_o <= 14'bX;
    endcase
  assign n883_o = dmatbl_data[43:16];
  assign n884_o = {1'b0, n883_o};
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n859_o)
      5'b10000: n886_o <= n884_o;
      5'b01000: n886_o <= n884_o;
      5'b00100: n886_o <= n884_o;
      5'b00010: n886_o <= n884_o;
      5'b00001: n886_o <= n792_o;
      default: n886_o <= 29'bX;
    endcase
  assign n888_o = dmatbl_data[15:14];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n859_o)
      5'b10000: n890_o <= n683_o;
      5'b01000: n890_o <= n683_o;
      5'b00100: n890_o <= n826_o;
      5'b00010: n890_o <= n802_o;
      5'b00001: n890_o <= n793_o;
      default: n890_o <= 4'bX;
    endcase
  assign n891_o = n800_o[1:0];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n859_o)
      5'b10000: n894_o <= 2'b00;
      5'b01000: n894_o <= 2'b00;
      5'b00100: n894_o <= 2'b00;
      5'b00010: n894_o <= n891_o;
      5'b00001: n894_o <= n795_o;
      default: n894_o <= 2'bX;
    endcase
  assign n895_o = n800_o[15:2];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n859_o)
      5'b10000: n898_o <= 14'b00000000000000;
      5'b01000: n898_o <= 14'b00000000000000;
      5'b00100: n898_o <= 14'b00000000000000;
      5'b00010: n898_o <= n895_o;
      5'b00001: n898_o <= 14'b00000000000000;
      default: n898_o <= 14'bX;
    endcase
  assign n899_o = n800_o[17:16];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n859_o)
      5'b10000: n902_o <= 2'b00;
      5'b01000: n902_o <= 2'b00;
      5'b00100: n902_o <= 2'b00;
      5'b00010: n902_o <= n899_o;
      5'b00001: n902_o <= n797_o;
      default: n902_o <= 2'bX;
    endcase
  assign n903_o = n800_o[31:18];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n859_o)
      5'b10000: n906_o <= 14'b00000000000000;
      5'b01000: n906_o <= 14'b00000000000000;
      5'b00100: n906_o <= 14'b00000000000000;
      5'b00010: n906_o <= n903_o;
      5'b00001: n906_o <= 14'b00000000000000;
      default: n906_o <= 14'bX;
    endcase
  /* ni/packet_manager.vhd:256:29  */
  assign n913_o = n665_o[6:1];
  /* ni/packet_manager.vhd:259:52  */
  assign n915_o = n665_o[47];
  /* ni/packet_manager.vhd:262:26  */
  assign n916_o = n665_o[43:16];
  /* ni/packet_manager.vhd:264:48  */
  assign n917_o = n665_o[31:16];
  /* ni/packet_manager.vhd:266:17  */
  assign n918_o = n665_o[0];
  /* ni/packet_manager.vhd:272:28  */
  assign n919_o = n665_o[15];
  /* ni/packet_manager.vhd:272:31  */
  assign n920_o = n919_o & sel;
  /* ni/packet_manager.vhd:273:20  */
  assign n921_o = n665_o[0];
  /* ni/packet_manager.vhd:273:24  */
  assign n922_o = ~n921_o;
  /* ni/packet_manager.vhd:277:28  */
  assign n923_o = n665_o[15];
  /* ni/packet_manager.vhd:277:31  */
  assign n924_o = n923_o & sel;
  /* ni/packet_manager.vhd:273:3  */
  assign n926_o = n922_o ? n924_o : 1'b0;
  /* ni/packet_manager.vhd:266:3  */
  assign n928_o = n918_o ? n920_o : 1'b0;
  /* ni/packet_manager.vhd:266:3  */
  assign n931_o = n918_o ? 1'b0 : n926_o;
  /* ni/packet_manager.vhd:280:28  */
  assign n933_o = n665_o[0];
  /* ni/packet_manager.vhd:282:50  */
  assign n934_o = port_a_dout[44];
  /* ni/packet_manager.vhd:284:32  */
  assign n935_o = port_a_dout[43:16];
  /* ni/packet_manager.vhd:287:48  */
  assign n936_o = port_a_dout[15:0];
  assign n937_o = n935_o[15:0];
  /* ni/packet_manager.vhd:281:3  */
  assign n938_o = hi_lo_reg ? n937_o : n936_o;
  assign n939_o = n935_o[27:16];
  assign n940_o = n914_o[27:16];
  /* ni/packet_manager.vhd:281:3  */
  assign n941_o = hi_lo_reg ? n939_o : n940_o;
  assign n942_o = n914_o[31];
  /* ni/packet_manager.vhd:281:3  */
  assign n943_o = hi_lo_reg ? n934_o : n942_o;
  assign n946_o = n914_o[30:28];
  /* ni/packet_manager.vhd:297:3  */
  assign n950_o = dma_en ? 1'b0 : dma_update_en;
  /* ni/packet_manager.vhd:297:3  */
  assign n951_o = dma_en ? dma_num : dma_update_addr;
  /* ni/packet_manager.vhd:308:1  */
  tdp_ram_29_6 dmatbl1 (
    .a_clk(clk),
    .a_wr(port_a_wr_hi),
    .a_addr(port_a_addr),
    .a_din(n953_o),
    .b_clk(clk),
    .b_wr(port_b_wr),
    .b_addr(port_b_addr),
    .b_din(n955_o),
    .a_dout(dmatbl1_a_dout),
    .b_dout(dmatbl1_b_dout));
  /* ni/packet_manager.vhd:317:26  */
  assign n953_o = port_a_din[44:16];
  /* ni/packet_manager.vhd:322:26  */
  assign n955_o = port_b_din[44:16];
  /* ni/packet_manager.vhd:327:3  */
  tdp_ram_16_6 dmatbl2 (
    .a_clk(clk),
    .a_wr(port_a_wr_lo),
    .a_addr(port_a_addr),
    .a_din(n957_o),
    .b_clk(clk),
    .b_wr(port_b_wr),
    .b_addr(port_b_addr),
    .b_din(n959_o),
    .a_dout(dmatbl2_a_dout),
    .b_dout(dmatbl2_b_dout));
  /* ni/packet_manager.vhd:336:26  */
  assign n957_o = port_a_din[15:0];
  /* ni/packet_manager.vhd:341:26  */
  assign n959_o = port_b_din[15:0];
  /* ni/packet_manager.vhd:348:31  */
  assign n962_o = n665_o[10:7];
  /* ni/packet_manager.vhd:348:77  */
  assign n964_o = n962_o != 4'b0000;
  /* ni/packet_manager.vhd:348:16  */
  assign n965_o = sel & n964_o;
  /* ni/packet_manager.vhd:348:3  */
  assign n968_o = n965_o ? 1'b1 : 1'b0;
  /* ni/packet_manager.vhd:357:5  */
  assign n974_o = reset ? 1'b0 : dma_en;
  /* ni/packet_manager.vhd:356:3  */
  always @(posedge clk)
    n977_q <= n974_o;
  /* ni/packet_manager.vhd:368:5  */
  assign n981_o = reset ? 1'b0 : hi_lo_next;
  /* ni/packet_manager.vhd:367:3  */
  always @(posedge clk)
    n984_q <= n981_o;
  /* ni/packet_manager.vhd:379:5  */
  assign n988_o = reset ? 1'b0 : config_slv_error_next;
  /* ni/packet_manager.vhd:378:3  */
  always @(posedge clk)
    n992_q <= n988_o;
  /* ni/packet_manager.vhd:390:5  */
  assign n996_o = reset ? 3'b000 : next_state;
  /* ni/packet_manager.vhd:389:3  */
  always @(posedge clk)
    n999_q <= n996_o;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n1009_q <= count_next;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n1010_q <= read_ptr_next;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n1011_q <= dma_num;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n1012_q <= pkt_len_next;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n1013_q <= route;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n1014_q <= payload_data_next;
  /* ni/packet_manager.vhd:401:3  */
  assign n1015_o = {dmatbl1_b_dout, dmatbl2_b_dout};
  assign n1016_o = {n886_o, n888_o, n882_o};
  assign n1017_o = {n915_o, n916_o, n917_o};
  assign n1018_o = {dmatbl1_a_dout, dmatbl2_a_dout};
  assign n1019_o = {n906_o, n902_o, n898_o, n894_o};
  assign n1020_o = {n992_q, n943_o, n946_o, n941_o, n938_o};
  assign n1021_o = {64'b0000000000000000000000000000000000000000000000000000000000000000, 1'b0, n862_o};
endmodule

module schedule_table
  (input  clk,
   input  reset,
   input  [13:0] config_addr,
   input  config_en,
   input  config_wr,
   input  [31:0] config_wdata,
   input  sel,
   input  [7:0] stbl_idx,
   input  stbl_idx_en,
   output [31:0] config_slv_rdata,
   output config_slv_error,
   output [15:0] route,
   output [3:0] pkt_len,
   output [3:0] t2n,
   output [5:0] dma_num,
   output dma_en);
  wire [47:0] n593_o;
  wire [31:0] n595_o;
  wire n596_o;
  wire [29:0] stbl_data;
  wire stbl_idx_en_reg;
  wire config_slv_error_next;
  wire [5:0] dma_num_sig;
  wire [29:0] port_a_din;
  wire [29:0] port_a_dout;
  wire a_wr;
  wire n602_o;
  wire n603_o;
  wire [29:0] stbl_a_dout;
  wire [29:0] stbl_b_dout;
  wire [7:0] n604_o;
  localparam n606_o = 1'b0;
  localparam [29:0] n607_o = 30'b000000000000000000000000000000;
  localparam [31:0] n610_o = 32'b00000000000000000000000000000000;
  wire [15:0] n611_o;
  wire [5:0] n613_o;
  wire [1:0] n614_o;
  wire [3:0] n616_o;
  wire [3:0] n618_o;
  wire [15:0] n619_o;
  wire [5:0] n622_o;
  wire [3:0] n624_o;
  wire [3:0] n626_o;
  wire [2:0] n629_o;
  wire n631_o;
  wire n632_o;
  wire n635_o;
  wire [15:0] n638_o;
  wire [5:0] n639_o;
  wire [3:0] n640_o;
  wire [3:0] n641_o;
  wire n645_o;
  reg n648_q;
  wire n651_o;
  wire n653_o;
  wire n658_o;
  reg n662_q;
  wire [29:0] n663_o;
  wire [32:0] n664_o;
  assign config_slv_rdata = n595_o;
  assign config_slv_error = n596_o;
  assign route = n638_o;
  assign pkt_len = n640_o;
  assign t2n = n641_o;
  assign dma_num = dma_num_sig;
  assign dma_en = n653_o;
  /* ni/MC_controller.vhd:258:32  */
  assign n593_o = {config_wdata, config_wr, config_en, config_addr};
  /* ni/MC_controller.vhd:101:40  */
  assign n595_o = n664_o[31:0];
  /* ni/MC_controller.vhd:101:24  */
  assign n596_o = n664_o[32];
  /* ni/schedule_table.vhd:78:8  */
  assign stbl_data = stbl_b_dout; // (signal)
  /* ni/schedule_table.vhd:80:8  */
  assign stbl_idx_en_reg = n648_q; // (signal)
  /* ni/schedule_table.vhd:82:8  */
  assign config_slv_error_next = n635_o; // (signal)
  /* ni/schedule_table.vhd:84:8  */
  assign dma_num_sig = n639_o; // (signal)
  /* ni/schedule_table.vhd:86:8  */
  assign port_a_din = n663_o; // (signal)
  /* ni/schedule_table.vhd:86:20  */
  assign port_a_dout = stbl_a_dout; // (signal)
  /* ni/schedule_table.vhd:88:8  */
  assign a_wr = n603_o; // (signal)
  /* ni/schedule_table.vhd:91:18  */
  assign n602_o = n593_o[15];
  /* ni/schedule_table.vhd:91:21  */
  assign n603_o = n602_o & sel;
  /* ni/schedule_table.vhd:93:1  */
  tdp_ram_30_8 stbl (
    .a_clk(clk),
    .a_wr(a_wr),
    .a_addr(n604_o),
    .a_din(port_a_din),
    .b_clk(clk),
    .b_wr(n606_o),
    .b_addr(stbl_idx),
    .b_din(n607_o),
    .a_dout(stbl_a_dout),
    .b_dout(stbl_b_dout));
  /* ni/schedule_table.vhd:101:27  */
  assign n604_o = n593_o[7:0];
  /* ni/schedule_table.vhd:117:33  */
  assign n611_o = port_a_dout[29:14];
  /* ni/schedule_table.vhd:121:33  */
  assign n613_o = port_a_dout[13:8];
  assign n614_o = n610_o[15:14];
  /* ni/schedule_table.vhd:125:33  */
  assign n616_o = port_a_dout[7:4];
  /* ni/schedule_table.vhd:129:33  */
  assign n618_o = port_a_dout[3:0];
  /* ni/schedule_table.vhd:135:34  */
  assign n619_o = n593_o[47:32];
  /* ni/schedule_table.vhd:140:34  */
  assign n622_o = n593_o[29:24];
  /* ni/schedule_table.vhd:143:34  */
  assign n624_o = n593_o[23:20];
  /* ni/schedule_table.vhd:146:34  */
  assign n626_o = n593_o[19:16];
  /* ni/schedule_table.vhd:154:31  */
  assign n629_o = n593_o[10:8];
  /* ni/schedule_table.vhd:154:73  */
  assign n631_o = n629_o != 3'b000;
  /* ni/schedule_table.vhd:154:16  */
  assign n632_o = sel & n631_o;
  /* ni/schedule_table.vhd:154:3  */
  assign n635_o = n632_o ? 1'b1 : 1'b0;
  /* ni/schedule_table.vhd:159:21  */
  assign n638_o = stbl_data[29:14];
  /* ni/schedule_table.vhd:161:34  */
  assign n639_o = stbl_data[13:8];
  /* ni/schedule_table.vhd:164:30  */
  assign n640_o = stbl_data[7:4];
  /* ni/schedule_table.vhd:166:30  */
  assign n641_o = stbl_data[3:0];
  /* ni/schedule_table.vhd:172:5  */
  assign n645_o = reset ? 1'b0 : stbl_idx_en;
  /* ni/schedule_table.vhd:171:3  */
  always @(posedge clk)
    n648_q <= n645_o;
  /* ni/schedule_table.vhd:183:18  */
  assign n651_o = dma_num_sig == 6'b111111;
  /* ni/schedule_table.vhd:183:3  */
  assign n653_o = n651_o ? 1'b0 : stbl_idx_en_reg;
  /* ni/schedule_table.vhd:193:5  */
  assign n658_o = reset ? 1'b0 : config_slv_error_next;
  /* ni/schedule_table.vhd:192:3  */
  always @(posedge clk)
    n662_q <= n658_o;
  /* ni/schedule_table.vhd:192:3  */
  assign n663_o = {n619_o, n622_o, n624_o, n626_o};
  assign n664_o = {n662_q, n611_o, n614_o, n613_o, n616_o, n618_o};
endmodule

module mc_controller_5ba93c9db0cff93f52b521d7420e43f6eda2784f
  (input  clk,
   input  reset,
   input  run,
   input  [13:0] config_addr,
   input  config_en,
   input  config_wr,
   input  [31:0] config_wdata,
   input  sel,
   input  period_boundary,
   input  [1:0] mc_p_cnt,
   output [31:0] config_slv_rdata,
   output config_slv_error,
   output [7:0] stbl_min,
   output [7:0] stbl_maxp1,
   output mc,
   output [1:0] mc_idx,
   output [1:0] mc_p);
  wire [47:0] n354_o;
  wire [31:0] n356_o;
  wire n357_o;
  wire [7:0] stbl_min_next;
  wire [7:0] stbl_maxp1_next;
  wire [1:0] mode_change_idx_reg;
  wire [1:0] mode_change_idx_next;
  wire [1:0] mode_idx_reg;
  wire [1:0] mode_change_cnt_reg;
  wire [1:0] mode_change_cnt_next;
  wire [1:0] mode_change_cnt_int;
  wire [63:0] mode_reg;
  wire [63:0] mode_next;
  wire global_mode_change_idx;
  wire local_mode_change_idx;
  wire config_slv_error_next;
  wire [31:0] read_reg;
  wire [31:0] read_next;
  wire mode_changed_reg;
  wire [7:0] stbl_min_reg;
  wire [10:0] mc_tbl_addr;
  wire [10:0] n366_o;
  wire [10:0] n368_o;
  wire n369_o;
  wire n370_o;
  wire n371_o;
  wire n372_o;
  wire [10:0] n373_o;
  wire n375_o;
  reg n378_o;
  wire [1:0] n379_o;
  reg [1:0] n380_o;
  wire [10:0] n381_o;
  wire [1:0] n382_o;
  wire n384_o;
  wire n386_o;
  wire [1:0] n387_o;
  reg [1:0] n388_o;
  reg [1:0] n389_o;
  reg n392_o;
  reg n395_o;
  wire n397_o;
  wire [1:0] n399_o;
  wire [7:0] n401_o;
  wire [1:0] n404_o;
  wire [7:0] n406_o;
  wire [63:0] n408_o;
  wire n410_o;
  wire [1:0] n411_o;
  wire [1:0] n412_o;
  wire [63:0] n413_o;
  wire n415_o;
  wire n416_o;
  wire [1:0] n417_o;
  wire [1:0] n418_o;
  wire [1:0] n419_o;
  wire [1:0] n420_o;
  wire [63:0] n421_o;
  wire n423_o;
  wire n426_o;
  wire n429_o;
  wire [29:0] n430_o;
  localparam n432_o = 1'b0;
  localparam [1:0] n433_o = 2'b00;
  wire [1:0] n434_o;
  localparam [1:0] n435_o = 2'b00;
  wire n439_o;
  wire n441_o;
  wire n443_o;
  reg n446_q;
  wire n448_o;
  wire n451_o;
  wire n453_o;
  wire [7:0] n459_o;
  wire [7:0] n463_o;
  wire [7:0] n465_o;
  wire n470_o;
  wire [1:0] n474_o;
  wire [31:0] n476_o;
  reg n486_q;
  reg [1:0] n488_q;
  reg [31:0] n489_q;
  wire [63:0] n494_o;
  reg [63:0] n497_q;
  wire [1:0] n500_o;
  wire [1:0] n502_o;
  reg [1:0] n505_q;
  wire [1:0] n508_o;
  wire [1:0] n510_o;
  reg [1:0] n513_q;
  wire [7:0] n516_o;
  wire [7:0] n519_o;
  reg [7:0] n525_q;
  wire [7:0] n529_o;
  wire [7:0] n531_o;
  reg [7:0] n534_q;
  wire [31:0] n536_o;
  wire [32:0] n538_o;
  wire n539_o;
  wire n540_o;
  wire n541_o;
  wire n542_o;
  wire n543_o;
  wire n544_o;
  wire n545_o;
  wire n546_o;
  wire [7:0] n547_o;
  wire [7:0] n548_o;
  wire [7:0] n549_o;
  wire [7:0] n550_o;
  wire [7:0] n551_o;
  wire [7:0] n552_o;
  wire [7:0] n553_o;
  wire [7:0] n554_o;
  wire [7:0] n555_o;
  wire [7:0] n556_o;
  wire [7:0] n557_o;
  wire [7:0] n558_o;
  wire [63:0] n559_o;
  wire n560_o;
  wire n561_o;
  wire n562_o;
  wire n563_o;
  wire n564_o;
  wire n565_o;
  wire n566_o;
  wire n567_o;
  wire [7:0] n568_o;
  wire [7:0] n569_o;
  wire [7:0] n570_o;
  wire [7:0] n571_o;
  wire [7:0] n572_o;
  wire [7:0] n573_o;
  wire [7:0] n574_o;
  wire [7:0] n575_o;
  wire [7:0] n576_o;
  wire [7:0] n577_o;
  wire [7:0] n578_o;
  wire [7:0] n579_o;
  wire [63:0] n580_o;
  wire [15:0] n581_o;
  wire [15:0] n582_o;
  wire [15:0] n583_o;
  wire [15:0] n584_o;
  wire [1:0] n585_o;
  reg [15:0] n586_o;
  wire [15:0] n587_o;
  wire [15:0] n588_o;
  wire [15:0] n589_o;
  wire [15:0] n590_o;
  wire [1:0] n591_o;
  reg [15:0] n592_o;
  assign config_slv_rdata = n356_o;
  assign config_slv_error = n357_o;
  assign stbl_min = n465_o;
  assign stbl_maxp1 = n534_q;
  assign mc = n432_o;
  assign mc_idx = n433_o;
  assign mc_p = n435_o;
  /* ni/TDM_controller.vhd:64:5  */
  assign n354_o = {config_wdata, config_wr, config_en, config_addr};
  /* ni/TDM_controller.vhd:60:5  */
  assign n356_o = n538_o[31:0];
  /* ni/TDM_controller.vhd:58:5  */
  assign n357_o = n538_o[32];
  /* ni/MC_controller.vhd:86:10  */
  assign stbl_min_next = n459_o; // (signal)
  /* ni/MC_controller.vhd:86:25  */
  assign stbl_maxp1_next = n463_o; // (signal)
  /* ni/MC_controller.vhd:87:10  */
  assign mode_change_idx_reg = n505_q; // (signal)
  /* ni/MC_controller.vhd:87:31  */
  assign mode_change_idx_next = n419_o; // (signal)
  /* ni/MC_controller.vhd:88:10  */
  assign mode_idx_reg = n513_q; // (signal)
  /* ni/MC_controller.vhd:90:10  */
  assign mode_change_cnt_reg = n488_q; // (signal)
  /* ni/MC_controller.vhd:90:31  */
  assign mode_change_cnt_next = n420_o; // (signal)
  /* ni/MC_controller.vhd:90:53  */
  assign mode_change_cnt_int = n434_o; // (signal)
  /* ni/MC_controller.vhd:92:10  */
  assign mode_reg = n497_q; // (signal)
  /* ni/MC_controller.vhd:92:20  */
  assign mode_next = n421_o; // (signal)
  /* ni/MC_controller.vhd:94:10  */
  assign global_mode_change_idx = n453_o; // (signal)
  /* ni/MC_controller.vhd:94:34  */
  assign local_mode_change_idx = n423_o; // (signal)
  /* ni/MC_controller.vhd:96:10  */
  assign config_slv_error_next = n426_o; // (signal)
  /* ni/MC_controller.vhd:98:10  */
  assign read_reg = n489_q; // (signal)
  /* ni/MC_controller.vhd:98:20  */
  assign read_next = n536_o; // (signal)
  /* ni/MC_controller.vhd:100:27  */
  assign mode_changed_reg = n446_q; // (signal)
  /* ni/MC_controller.vhd:101:10  */
  assign stbl_min_reg = n525_q; // (signal)
  /* ni/MC_controller.vhd:103:10  */
  assign mc_tbl_addr = n368_o; // (signal)
  /* ni/MC_controller.vhd:124:31  */
  assign n366_o = n354_o[10:0];
  /* ni/MC_controller.vhd:124:60  */
  assign n368_o = n366_o - 11'b00000000010;
  /* ni/MC_controller.vhd:126:30  */
  assign n369_o = n354_o[14];
  /* ni/MC_controller.vhd:126:19  */
  assign n370_o = sel & n369_o;
  /* ni/MC_controller.vhd:128:17  */
  assign n371_o = n354_o[15];
  /* ni/MC_controller.vhd:128:20  */
  assign n372_o = ~n371_o;
  /* ni/MC_controller.vhd:129:26  */
  assign n373_o = n354_o[10:0];
  /* ni/MC_controller.vhd:131:11  */
  assign n375_o = n373_o == 11'b00000000000;
  /* ni/MC_controller.vhd:129:9  */
  always @*
    case (n375_o)
      1'b1: n378_o <= 1'b0;
      default: n378_o <= 1'b1;
    endcase
  assign n379_o = read_reg[1:0];
  /* ni/MC_controller.vhd:129:9  */
  always @*
    case (n375_o)
      1'b1: n380_o <= mode_idx_reg;
      default: n380_o <= n379_o;
    endcase
  /* ni/MC_controller.vhd:144:26  */
  assign n381_o = n354_o[10:0];
  /* ni/MC_controller.vhd:147:58  */
  assign n382_o = n354_o[17:16];
  /* ni/MC_controller.vhd:146:11  */
  assign n384_o = n381_o == 11'b00000000000;
  /* ni/MC_controller.vhd:151:8  */
  assign n386_o = n381_o == 11'b00000000001;
  assign n387_o = {n386_o, n384_o};
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n387_o)
      2'b10: n388_o <= mode_change_idx_reg;
      2'b01: n388_o <= n382_o;
      default: n388_o <= mode_change_idx_reg;
    endcase
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n387_o)
      2'b10: n389_o <= mode_change_cnt_reg;
      2'b01: n389_o <= mode_change_cnt_int;
      default: n389_o <= mode_change_cnt_reg;
    endcase
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n387_o)
      2'b10: n392_o <= 1'b0;
      2'b01: n392_o <= 1'b1;
      default: n392_o <= 1'b0;
    endcase
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n387_o)
      2'b10: n395_o <= 1'b0;
      2'b01: n395_o <= 1'b0;
      default: n395_o <= 1'b1;
    endcase
  /* ni/MC_controller.vhd:158:24  */
  assign n397_o = $unsigned(mc_tbl_addr) < $unsigned(11'b00000000100);
  /* ni/MC_controller.vhd:160:22  */
  assign n399_o = mc_tbl_addr[1:0];  // trunc
  /* ni/MC_controller.vhd:160:76  */
  assign n401_o = n354_o[23:16];
  /* ni/MC_controller.vhd:161:22  */
  assign n404_o = mc_tbl_addr[1:0];  // trunc
  /* ni/MC_controller.vhd:161:76  */
  assign n406_o = n354_o[39:32];
  /* ni/MC_controller.vhd:158:9  */
  assign n408_o = n397_o ? n580_o : mode_reg;
  /* ni/MC_controller.vhd:158:9  */
  assign n410_o = n397_o ? 1'b0 : n395_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n411_o = n372_o ? mode_change_idx_reg : n388_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n412_o = n372_o ? mode_change_cnt_reg : n389_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n413_o = n372_o ? mode_reg : n408_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n415_o = n372_o ? 1'b0 : n392_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n416_o = n372_o ? n378_o : n410_o;
  assign n417_o = read_reg[1:0];
  /* ni/MC_controller.vhd:126:5  */
  assign n418_o = n429_o ? n380_o : n417_o;
  /* ni/MC_controller.vhd:126:5  */
  assign n419_o = n370_o ? n411_o : mode_change_idx_reg;
  /* ni/MC_controller.vhd:126:5  */
  assign n420_o = n370_o ? n412_o : mode_change_cnt_reg;
  /* ni/MC_controller.vhd:126:5  */
  assign n421_o = n370_o ? n413_o : mode_reg;
  /* ni/MC_controller.vhd:126:5  */
  assign n423_o = n370_o ? n415_o : 1'b0;
  /* ni/MC_controller.vhd:126:5  */
  assign n426_o = n370_o ? n416_o : 1'b0;
  /* ni/MC_controller.vhd:126:5  */
  assign n429_o = n370_o & n372_o;
  assign n430_o = read_reg[31:2];
  /* ni/MC_controller.vhd:212:49  */
  assign n434_o = n354_o[33:32];
  /* ni/MC_controller.vhd:223:11  */
  assign n439_o = global_mode_change_idx ? 1'b0 : mode_changed_reg;
  /* ni/MC_controller.vhd:221:11  */
  assign n441_o = local_mode_change_idx ? 1'b1 : n439_o;
  /* ni/MC_controller.vhd:218:9  */
  assign n443_o = reset ? 1'b0 : n441_o;
  /* ni/MC_controller.vhd:217:7  */
  always @(posedge clk)
    n446_q <= n443_o;
  /* ni/MC_controller.vhd:235:32  */
  assign n448_o = mode_change_cnt_reg == mc_p_cnt;
  /* ni/MC_controller.vhd:235:9  */
  assign n451_o = n448_o ? 1'b1 : 1'b0;
  /* ni/MC_controller.vhd:234:7  */
  assign n453_o = mode_changed_reg ? n451_o : 1'b0;
  /* ni/MC_controller.vhd:257:57  */
  assign n459_o = n586_o[7:0];
  /* ni/MC_controller.vhd:258:59  */
  assign n463_o = n592_o[15:8];
  /* ni/MC_controller.vhd:268:5  */
  assign n465_o = period_boundary ? stbl_min_next : stbl_min_reg;
  /* ni/MC_controller.vhd:281:7  */
  assign n470_o = reset ? 1'b0 : config_slv_error_next;
  /* ni/MC_controller.vhd:281:7  */
  assign n474_o = reset ? 2'b00 : mode_change_cnt_next;
  /* ni/MC_controller.vhd:281:7  */
  assign n476_o = reset ? 32'b00000000000000000000000000000000 : read_next;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n486_q <= n470_o;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n488_q <= n474_o;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n489_q <= n476_o;
  /* ni/MC_controller.vhd:302:7  */
  assign n494_o = reset ? 64'b0000000000000000000000000000000000000000000000000000000000000000 : mode_next;
  /* ni/MC_controller.vhd:301:5  */
  always @(posedge clk)
    n497_q <= n494_o;
  /* ni/MC_controller.vhd:324:9  */
  assign n500_o = local_mode_change_idx ? mode_change_idx_next : mode_change_idx_reg;
  /* ni/MC_controller.vhd:321:7  */
  assign n502_o = reset ? 2'b00 : n500_o;
  /* ni/MC_controller.vhd:320:5  */
  always @(posedge clk)
    n505_q <= n502_o;
  /* ni/MC_controller.vhd:338:9  */
  assign n508_o = global_mode_change_idx ? mode_change_idx_reg : mode_idx_reg;
  /* ni/MC_controller.vhd:335:7  */
  assign n510_o = reset ? 2'b00 : n508_o;
  /* ni/MC_controller.vhd:334:5  */
  always @(posedge clk)
    n513_q <= n510_o;
  /* ni/MC_controller.vhd:354:9  */
  assign n516_o = period_boundary ? stbl_min_next : stbl_min_reg;
  /* ni/MC_controller.vhd:350:7  */
  assign n519_o = reset ? 8'b00000000 : n516_o;
  /* ni/MC_controller.vhd:349:5  */
  always @(posedge clk)
    n525_q <= n519_o;
  /* ni/MC_controller.vhd:373:9  */
  assign n529_o = period_boundary ? stbl_maxp1_next : n534_q;
  /* ni/MC_controller.vhd:370:7  */
  assign n531_o = reset ? 8'b00000000 : n529_o;
  /* ni/MC_controller.vhd:369:5  */
  always @(posedge clk)
    n534_q <= n531_o;
  assign n536_o = {n430_o, n418_o};
  assign n538_o = {n486_q, read_reg};
  /* ni/MC_controller.vhd:160:13  */
  assign n539_o = n399_o[1];
  /* ni/MC_controller.vhd:160:13  */
  assign n540_o = ~n539_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n541_o = n399_o[0];
  /* ni/MC_controller.vhd:160:13  */
  assign n542_o = ~n541_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n543_o = n540_o & n542_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n544_o = n540_o & n541_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n545_o = n539_o & n542_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n546_o = n539_o & n541_o;
  assign n547_o = mode_reg[7:0];
  /* ni/MC_controller.vhd:160:13  */
  assign n548_o = n543_o ? n401_o : n547_o;
  /* ni/MC_controller.vhd:349:5  */
  assign n549_o = mode_reg[15:8];
  assign n550_o = mode_reg[23:16];
  /* ni/MC_controller.vhd:160:13  */
  assign n551_o = n544_o ? n401_o : n550_o;
  assign n552_o = mode_reg[31:24];
  /* ni/MC_controller.vhd:354:9  */
  assign n553_o = mode_reg[39:32];
  /* ni/MC_controller.vhd:160:13  */
  assign n554_o = n545_o ? n401_o : n553_o;
  assign n555_o = mode_reg[47:40];
  /* ni/MC_controller.vhd:332:3  */
  assign n556_o = mode_reg[55:48];
  /* ni/MC_controller.vhd:160:13  */
  assign n557_o = n546_o ? n401_o : n556_o;
  /* ni/MC_controller.vhd:318:3  */
  assign n558_o = mode_reg[63:56];
  assign n559_o = {n558_o, n557_o, n555_o, n554_o, n552_o, n551_o, n549_o, n548_o};
  /* ni/MC_controller.vhd:161:13  */
  assign n560_o = n404_o[1];
  /* ni/MC_controller.vhd:161:13  */
  assign n561_o = ~n560_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n562_o = n404_o[0];
  /* ni/MC_controller.vhd:161:13  */
  assign n563_o = ~n562_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n564_o = n561_o & n563_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n565_o = n561_o & n562_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n566_o = n560_o & n563_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n567_o = n560_o & n562_o;
  assign n568_o = n559_o[7:0];
  /* ni/MC_controller.vhd:281:7  */
  assign n569_o = n559_o[15:8];
  /* ni/MC_controller.vhd:161:13  */
  assign n570_o = n564_o ? n406_o : n569_o;
  /* ni/MC_controller.vhd:278:3  */
  assign n571_o = n559_o[23:16];
  assign n572_o = n559_o[31:24];
  /* ni/MC_controller.vhd:161:13  */
  assign n573_o = n565_o ? n406_o : n572_o;
  /* ni/MC_controller.vhd:258:33  */
  assign n574_o = n559_o[39:32];
  /* ni/MC_controller.vhd:257:31  */
  assign n575_o = n559_o[47:40];
  /* ni/MC_controller.vhd:161:13  */
  assign n576_o = n566_o ? n406_o : n575_o;
  assign n577_o = n559_o[55:48];
  /* ni/MC_controller.vhd:231:5  */
  assign n578_o = n559_o[63:56];
  /* ni/MC_controller.vhd:161:13  */
  assign n579_o = n567_o ? n406_o : n578_o;
  /* ni/MC_controller.vhd:215:5  */
  assign n580_o = {n579_o, n577_o, n576_o, n574_o, n573_o, n571_o, n570_o, n568_o};
  /* ni/MC_controller.vhd:161:23  */
  assign n581_o = mode_reg[15:0];
  /* ni/MC_controller.vhd:161:13  */
  assign n582_o = mode_reg[31:16];
  assign n583_o = mode_reg[47:32];
  assign n584_o = mode_reg[63:48];
  /* ni/MC_controller.vhd:257:30  */
  assign n585_o = mode_idx_reg[1:0];
  /* ni/MC_controller.vhd:257:30  */
  always @*
    case (n585_o)
      2'b00: n586_o <= n581_o;
      2'b01: n586_o <= n582_o;
      2'b10: n586_o <= n583_o;
      2'b11: n586_o <= n584_o;
    endcase
  /* ni/MC_controller.vhd:257:31  */
  assign n587_o = mode_reg[15:0];
  /* ni/MC_controller.vhd:257:30  */
  assign n588_o = mode_reg[31:16];
  /* ni/MC_controller.vhd:161:23  */
  assign n589_o = mode_reg[47:32];
  /* ni/MC_controller.vhd:160:23  */
  assign n590_o = mode_reg[63:48];
  /* ni/MC_controller.vhd:258:32  */
  assign n591_o = mode_idx_reg[1:0];
  /* ni/MC_controller.vhd:258:32  */
  always @*
    case (n591_o)
      2'b00: n592_o <= n587_o;
      2'b01: n592_o <= n588_o;
      2'b10: n592_o <= n589_o;
      2'b11: n592_o <= n590_o;
    endcase
endmodule

module tdm_controller_5ba93c9db0cff93f52b521d7420e43f6eda2784f
  (input  clk,
   input  reset,
   input  run,
   input  [13:0] config_addr,
   input  config_en,
   input  config_wr,
   input  [31:0] config_wdata,
   input  sel,
   input  [3:0] t2n,
   input  [7:0] stbl_min,
   input  [7:0] stbl_maxp1,
   output master_run,
   output [31:0] config_slv_rdata,
   output config_slv_error,
   output [7:0] stbl_idx,
   output stbl_idx_en,
   output period_boundary,
   output [1:0] mc_p_cnt);
  wire [47:0] n193_o;
  wire [31:0] n195_o;
  wire n196_o;
  wire [9:0] tdm_s_cnt_reg;
  wire [31:0] tdm_p_cnt_reg;
  wire [7:0] stbl_idx_reg;
  wire [7:0] stbl_idx_next;
  wire [3:0] time2next_reg;
  wire [31:0] clock_cnt_lo_reg;
  wire [1:0] mc_p_cnt_reg;
  wire [31:0] read_reg;
  wire [31:0] read_next;
  wire [31:0] clock_delay_reg;
  wire period_boundary_sig;
  wire stbl_idx_reset;
  wire stbl_idx_en_sig;
  wire t2n_ld_reg;
  wire [7:0] stbl_idx_inc;
  wire config_slv_error_next;
  wire run_reg;
  localparam n201_o = 1'b0;
  wire n206_o;
  wire n207_o;
  wire n208_o;
  wire n209_o;
  wire [10:0] n210_o;
  wire [30:0] n211_o;
  wire n213_o;
  wire n215_o;
  wire n217_o;
  wire n219_o;
  localparam [31:0] n220_o = 32'b00000000000000000000000000000000;
  wire [30:0] n221_o;
  wire n223_o;
  wire [4:0] n224_o;
  wire n225_o;
  wire n226_o;
  wire n227_o;
  wire n228_o;
  wire n229_o;
  reg n230_o;
  wire [8:0] n231_o;
  wire [8:0] n232_o;
  wire [8:0] n233_o;
  wire [8:0] n234_o;
  wire [8:0] n235_o;
  wire [8:0] n236_o;
  reg [8:0] n237_o;
  wire [21:0] n238_o;
  wire [21:0] n239_o;
  wire [21:0] n240_o;
  wire [21:0] n241_o;
  wire [21:0] n242_o;
  reg [21:0] n243_o;
  reg n249_o;
  wire [10:0] n250_o;
  wire [30:0] n251_o;
  wire n253_o;
  reg n256_o;
  wire [31:0] n257_o;
  wire [31:0] n258_o;
  wire n261_o;
  wire n262_o;
  wire n267_o;
  wire [7:0] n271_o;
  wire n274_o;
  wire n276_o;
  wire [4:0] n277_o;
  wire n279_o;
  wire n280_o;
  wire n282_o;
  wire n283_o;
  wire n284_o;
  wire n285_o;
  wire n286_o;
  wire n287_o;
  wire n288_o;
  wire n291_o;
  wire n292_o;
  wire n293_o;
  wire n294_o;
  wire n295_o;
  wire n297_o;
  wire n298_o;
  wire [7:0] n299_o;
  wire n303_o;
  wire [31:0] n305_o;
  wire n307_o;
  wire n308_o;
  reg n315_q;
  reg [31:0] n316_q;
  reg n317_q;
  reg n318_q;
  wire [1:0] n327_o;
  wire [1:0] n328_o;
  wire [1:0] n330_o;
  reg [1:0] n333_q;
  wire [3:0] n337_o;
  wire [3:0] n338_o;
  wire [3:0] n340_o;
  reg [3:0] n343_q;
  wire [7:0] n346_o;
  wire [7:0] n348_o;
  reg [7:0] n351_q;
  wire [32:0] n353_o;
  assign master_run = n201_o;
  assign config_slv_rdata = n195_o;
  assign config_slv_error = n196_o;
  assign stbl_idx = stbl_idx_next;
  assign stbl_idx_en = stbl_idx_en_sig;
  assign period_boundary = period_boundary_sig;
  assign mc_p_cnt = mc_p_cnt_reg;
  /* ni/network_interface.vhd:398:40  */
  assign n193_o = {config_wdata, config_wr, config_en, config_addr};
  /* ni/network_interface.vhd:394:41  */
  assign n195_o = n353_o[31:0];
  /* ni/network_interface.vhd:392:35  */
  assign n196_o = n353_o[32];
  /* ni/TDM_controller.vhd:84:10  */
  assign tdm_s_cnt_reg = 10'b0000000000; // (signal)
  /* ni/TDM_controller.vhd:85:10  */
  assign tdm_p_cnt_reg = 32'b00000000000000000000000000000000; // (signal)
  /* ni/TDM_controller.vhd:87:10  */
  assign stbl_idx_reg = n351_q; // (signal)
  /* ni/TDM_controller.vhd:88:10  */
  assign stbl_idx_next = n299_o; // (signal)
  /* ni/TDM_controller.vhd:89:10  */
  assign time2next_reg = n343_q; // (signal)
  /* ni/TDM_controller.vhd:165:42  */
  assign clock_cnt_lo_reg = 32'b00000000000000000000000000000000; // (signal)
  /* ni/TDM_controller.vhd:95:10  */
  assign mc_p_cnt_reg = n333_q; // (signal)
  /* ni/TDM_controller.vhd:105:10  */
  assign read_reg = n316_q; // (signal)
  /* ni/TDM_controller.vhd:105:20  */
  assign read_next = n258_o; // (signal)
  /* ni/TDM_controller.vhd:106:10  */
  assign clock_delay_reg = 32'b00000000000000000000000000000000; // (signal)
  /* ni/TDM_controller.vhd:108:10  */
  assign period_boundary_sig = n297_o; // (signal)
  /* ni/TDM_controller.vhd:109:10  */
  assign stbl_idx_reset = n295_o; // (signal)
  /* ni/TDM_controller.vhd:109:26  */
  assign stbl_idx_en_sig = n288_o; // (signal)
  /* ni/TDM_controller.vhd:109:43  */
  assign t2n_ld_reg = n317_q; // (signal)
  /* ni/TDM_controller.vhd:110:10  */
  assign stbl_idx_inc = n271_o; // (signal)
  /* ni/TDM_controller.vhd:112:10  */
  assign config_slv_error_next = n267_o; // (signal)
  /* ni/TDM_controller.vhd:117:10  */
  assign run_reg = n318_q; // (signal)
  /* ni/TDM_controller.vhd:154:30  */
  assign n206_o = n193_o[14];
  /* ni/TDM_controller.vhd:154:19  */
  assign n207_o = sel & n206_o;
  /* ni/TDM_controller.vhd:156:17  */
  assign n208_o = n193_o[15];
  /* ni/TDM_controller.vhd:156:20  */
  assign n209_o = ~n208_o;
  /* ni/TDM_controller.vhd:157:37  */
  assign n210_o = n193_o[10:0];
  /* ni/TDM_controller.vhd:157:15  */
  assign n211_o = {20'b0, n210_o};  //  uext
  /* ni/TDM_controller.vhd:158:11  */
  assign n213_o = n211_o == 31'b0000000000000000000000000000000;
  /* ni/TDM_controller.vhd:160:11  */
  assign n215_o = n211_o == 31'b0000000000000000000000000000001;
  /* ni/TDM_controller.vhd:162:11  */
  assign n217_o = n211_o == 31'b0000000000000000000000000000010;
  /* ni/TDM_controller.vhd:164:11  */
  assign n219_o = n211_o == 31'b0000000000000000000000000000011;
  /* ni/network_interface.vhd:305:9  */
  assign n221_o = n220_o[31:1];
  /* ni/TDM_controller.vhd:167:11  */
  assign n223_o = n211_o == 31'b0000000000000000000000000000100;
  /* ni/network_interface.vhd:300:27  */
  assign n224_o = {n223_o, n219_o, n217_o, n215_o, n213_o};
  /* ni/network_interface.vhd:299:23  */
  assign n225_o = tdm_s_cnt_reg[0];
  /* ni/network_interface.vhd:298:31  */
  assign n226_o = tdm_p_cnt_reg[0];
  /* ni/network_interface.vhd:297:29  */
  assign n227_o = clock_delay_reg[0];
  /* ni/network_interface.vhd:294:31  */
  assign n228_o = clock_cnt_lo_reg[0];
  /* ni/network_interface.vhd:284:9  */
  assign n229_o = tdm_p_cnt_reg[0];
  /* ni/TDM_controller.vhd:157:9  */
  always @*
    case (n224_o)
      5'b10000: n230_o <= run;
      5'b01000: n230_o <= n228_o;
      5'b00100: n230_o <= n227_o;
      5'b00010: n230_o <= n226_o;
      5'b00001: n230_o <= n225_o;
      default: n230_o <= n229_o;
    endcase
  /* ni/network_interface.vhd:284:9  */
  assign n231_o = tdm_s_cnt_reg[9:1];
  /* ni/network_interface.vhd:284:9  */
  assign n232_o = tdm_p_cnt_reg[9:1];
  /* ni/network_interface.vhd:284:9  */
  assign n233_o = clock_delay_reg[9:1];
  /* ni/network_interface.vhd:284:9  */
  assign n234_o = clock_cnt_lo_reg[9:1];
  /* ni/network_interface.vhd:279:29  */
  assign n235_o = n221_o[8:0];
  /* ni/network_interface.vhd:278:36  */
  assign n236_o = tdm_p_cnt_reg[9:1];
  /* ni/TDM_controller.vhd:157:9  */
  always @*
    case (n224_o)
      5'b10000: n237_o <= n235_o;
      5'b01000: n237_o <= n234_o;
      5'b00100: n237_o <= n233_o;
      5'b00010: n237_o <= n232_o;
      5'b00001: n237_o <= n231_o;
      default: n237_o <= n236_o;
    endcase
  /* ni/network_interface.vhd:275:29  */
  assign n238_o = tdm_p_cnt_reg[31:10];
  /* ni/network_interface.vhd:274:31  */
  assign n239_o = clock_delay_reg[31:10];
  /* ni/network_interface.vhd:271:31  */
  assign n240_o = clock_cnt_lo_reg[31:10];
  /* ni/network_interface.vhd:263:9  */
  assign n241_o = n221_o[30:9];
  /* ni/network_interface.vhd:263:9  */
  assign n242_o = tdm_p_cnt_reg[31:10];
  /* ni/TDM_controller.vhd:157:9  */
  always @*
    case (n224_o)
      5'b10000: n243_o <= n241_o;
      5'b01000: n243_o <= n240_o;
      5'b00100: n243_o <= n239_o;
      5'b00010: n243_o <= n238_o;
      5'b00001: n243_o <= n242_o;
      default: n243_o <= n242_o;
    endcase
  /* ni/TDM_controller.vhd:157:9  */
  always @*
    case (n224_o)
      5'b10000: n249_o <= 1'b0;
      5'b01000: n249_o <= 1'b0;
      5'b00100: n249_o <= 1'b0;
      5'b00010: n249_o <= 1'b0;
      5'b00001: n249_o <= 1'b0;
      default: n249_o <= 1'b1;
    endcase
  /* ni/TDM_controller.vhd:174:37  */
  assign n250_o = n193_o[10:0];
  /* ni/TDM_controller.vhd:174:15  */
  assign n251_o = {20'b0, n250_o};  //  uext
  /* ni/TDM_controller.vhd:175:11  */
  assign n253_o = n251_o == 31'b0000000000000000000000000000100;
  /* ni/TDM_controller.vhd:174:9  */
  always @*
    case (n253_o)
      1'b1: n256_o <= 1'b0;
      default: n256_o <= 1'b1;
    endcase
  assign n257_o = {n243_o, n237_o, n230_o};
  /* ni/TDM_controller.vhd:154:5  */
  assign n258_o = n262_o ? n257_o : tdm_p_cnt_reg;
  /* ni/TDM_controller.vhd:156:7  */
  assign n261_o = n209_o ? n249_o : n256_o;
  /* ni/TDM_controller.vhd:154:5  */
  assign n262_o = n207_o & n209_o;
  /* ni/TDM_controller.vhd:154:5  */
  assign n267_o = n207_o ? n261_o : 1'b0;
  /* ni/TDM_controller.vhd:194:32  */
  assign n271_o = stbl_idx_reg + 8'b00000001;
  /* ni/TDM_controller.vhd:198:49  */
  assign n274_o = time2next_reg == 4'b0001;
  /* ni/TDM_controller.vhd:198:74  */
  assign n276_o = time2next_reg == 4'b0000;
  /* ni/TDM_controller.vhd:198:97  */
  assign n277_o = {1'b0, time2next_reg};  //  uext
  /* ni/TDM_controller.vhd:198:97  */
  assign n279_o = n277_o == 5'b11111;
  /* ni/TDM_controller.vhd:198:79  */
  assign n280_o = n276_o | n279_o;
  /* ni/TDM_controller.vhd:198:118  */
  assign n282_o = t2n == 4'b0000;
  /* ni/TDM_controller.vhd:198:109  */
  assign n283_o = n280_o & n282_o;
  /* ni/TDM_controller.vhd:198:54  */
  assign n284_o = n274_o | n283_o;
  /* ni/TDM_controller.vhd:198:134  */
  assign n285_o = run != run_reg;
  /* ni/TDM_controller.vhd:198:125  */
  assign n286_o = n284_o | n285_o;
  /* ni/TDM_controller.vhd:198:147  */
  assign n287_o = n286_o & run;
  /* ni/TDM_controller.vhd:198:26  */
  assign n288_o = n287_o ? 1'b1 : 1'b0;
  /* ni/TDM_controller.vhd:201:46  */
  assign n291_o = stbl_idx_inc == stbl_maxp1;
  /* ni/TDM_controller.vhd:201:69  */
  assign n292_o = run != run_reg;
  /* ni/TDM_controller.vhd:201:60  */
  assign n293_o = n291_o | n292_o;
  /* ni/TDM_controller.vhd:201:82  */
  assign n294_o = n293_o & run;
  /* ni/TDM_controller.vhd:201:25  */
  assign n295_o = n294_o ? 1'b1 : 1'b0;
  /* ni/TDM_controller.vhd:205:41  */
  assign n297_o = stbl_idx_reset & stbl_idx_en_sig;
  /* ni/TDM_controller.vhd:208:53  */
  assign n298_o = ~stbl_idx_reset;
  /* ni/TDM_controller.vhd:208:33  */
  assign n299_o = n298_o ? stbl_idx_inc : stbl_min;
  /* ni/TDM_controller.vhd:220:7  */
  assign n303_o = reset ? 1'b0 : config_slv_error_next;
  /* ni/TDM_controller.vhd:220:7  */
  assign n305_o = reset ? 32'b00000000000000000000000000000000 : read_next;
  /* ni/TDM_controller.vhd:220:7  */
  assign n307_o = reset ? 1'b1 : stbl_idx_en_sig;
  /* ni/TDM_controller.vhd:220:7  */
  assign n308_o = reset ? run_reg : run;
  /* ni/TDM_controller.vhd:219:5  */
  always @(posedge clk)
    n315_q <= n303_o;
  /* ni/TDM_controller.vhd:219:5  */
  always @(posedge clk)
    n316_q <= n305_o;
  /* ni/TDM_controller.vhd:219:5  */
  always @(posedge clk)
    n317_q <= n307_o;
  /* ni/TDM_controller.vhd:219:5  */
  always @(posedge clk)
    n318_q <= n308_o;
  /* ni/TDM_controller.vhd:336:40  */
  assign n327_o = mc_p_cnt_reg + 2'b01;
  /* ni/TDM_controller.vhd:335:9  */
  assign n328_o = period_boundary_sig ? n327_o : mc_p_cnt_reg;
  /* ni/TDM_controller.vhd:332:7  */
  assign n330_o = reset ? 2'b00 : n328_o;
  /* ni/TDM_controller.vhd:331:5  */
  always @(posedge clk)
    n333_q <= n330_o;
  /* ni/TDM_controller.vhd:354:42  */
  assign n337_o = time2next_reg - 4'b0001;
  /* ni/TDM_controller.vhd:351:9  */
  assign n338_o = t2n_ld_reg ? t2n : n337_o;
  /* ni/TDM_controller.vhd:348:7  */
  assign n340_o = reset ? 4'b0000 : n338_o;
  /* ni/TDM_controller.vhd:347:5  */
  always @(posedge clk)
    n343_q <= n340_o;
  /* ni/TDM_controller.vhd:369:9  */
  assign n346_o = stbl_idx_en_sig ? stbl_idx_next : stbl_idx_reg;
  /* ni/TDM_controller.vhd:365:7  */
  assign n348_o = reset ? 8'b00000000 : n346_o;
  /* ni/TDM_controller.vhd:364:5  */
  always @(posedge clk)
    n351_q <= n348_o;
  assign n353_o = {n315_q, read_reg};
endmodule

module network_interface
  (input  clk,
   input  reset,
   input  run,
   input  supervisor,
   input  [2:0] ocp_config_m_MCmd,
   input  [31:0] ocp_config_m_MAddr,
   input  [31:0] ocp_config_m_MData,
   input  [3:0] ocp_config_m_MByteEn,
   input  ocp_config_m_MRespAccept,
   input  [63:0] spm_slv_rdata,
   input  spm_slv_error,
   input  [34:0] pkt_in,
   output master_run,
   output [1:0] ocp_config_s_SResp,
   output [31:0] ocp_config_s_SData,
   output ocp_config_s_SCmdAccept,
   output data_irq,
   output config_irq,
   output [13:0] spm_addr,
   output [1:0] spm_en,
   output spm_wr,
   output [63:0] spm_wdata,
   output [34:0] pkt_out);
  wire [71:0] n1_o;
  wire [1:0] n3_o;
  wire [31:0] n4_o;
  wire n5_o;
  wire [64:0] n8_o;
  wire [13:0] n10_o;
  wire [1:0] n11_o;
  wire n12_o;
  wire [63:0] n13_o;
  wire [47:0] config;
  wire [32:0] tdm_ctrl;
  wire [32:0] sched_tbl;
  wire [32:0] dma_tbl;
  wire [32:0] mc_ctrl;
  wire tdm_ctrl_sel;
  wire sched_tbl_sel;
  wire dma_tbl_sel;
  wire mc_ctrl_sel;
  wire [7:0] stbl_idx;
  wire stbl_idx_en;
  wire [3:0] t2n;
  wire [15:0] route;
  wire [3:0] pkt_len;
  wire [5:0] dma_num;
  wire dma_en;
  wire period_boundary;
  wire [7:0] stbl_min;
  wire [7:0] stbl_maxp1;
  wire [80:0] tx_spm;
  wire [80:0] rx_spm;
  wire [64:0] tx_spm_slv;
  wire [13:0] irq_fifo_data;
  wire irq_fifo_data_valid;
  wire irq_fifo_irq_valid;
  wire [47:0] config_unit_master;
  wire [32:0] irq_if_fifo;
  wire irq_if_fifo_sel;
  wire mc;
  wire [1:0] mc_idx;
  wire [1:0] mc_p_cnt;
  wire [1:0] mc_p;
  wire tdmctrl_n15;
  wire [32:0] tdmctrl_n16;
  wire [7:0] tdmctrl_n17;
  wire tdmctrl_n18;
  wire tdmctrl_n19;
  wire [1:0] tdmctrl_n20;
  wire tdmctrl_master_run;
  wire [31:0] tdmctrl_config_slv_rdata;
  wire tdmctrl_config_slv_error;
  wire [7:0] tdmctrl_stbl_idx;
  wire tdmctrl_stbl_idx_en;
  wire tdmctrl_period_boundary;
  wire [1:0] tdmctrl_mc_p_cnt;
  wire [13:0] n22_o;
  wire n23_o;
  wire n24_o;
  wire [31:0] n25_o;
  wire [32:0] n26_o;
  wire [32:0] mcctrl_n38;
  wire [7:0] mcctrl_n39;
  wire [7:0] mcctrl_n40;
  wire mcctrl_n41;
  wire [1:0] mcctrl_n42;
  wire [1:0] mcctrl_n43;
  wire [31:0] mcctrl_config_slv_rdata;
  wire mcctrl_config_slv_error;
  wire [7:0] mcctrl_stbl_min;
  wire [7:0] mcctrl_stbl_maxp1;
  wire mcctrl_mc;
  wire [1:0] mcctrl_mc_idx;
  wire [1:0] mcctrl_mc_p;
  wire [13:0] n44_o;
  wire n45_o;
  wire n46_o;
  wire [31:0] n47_o;
  wire [32:0] n48_o;
  wire [32:0] schedtbl_n61;
  wire [15:0] schedtbl_n62;
  wire [3:0] schedtbl_n63;
  wire [3:0] schedtbl_n64;
  wire [5:0] schedtbl_n65;
  wire schedtbl_n66;
  wire [31:0] schedtbl_config_slv_rdata;
  wire schedtbl_config_slv_error;
  wire [15:0] schedtbl_route;
  wire [3:0] schedtbl_pkt_len;
  wire [3:0] schedtbl_t2n;
  wire [5:0] schedtbl_dma_num;
  wire schedtbl_dma_en;
  wire [13:0] n67_o;
  wire n68_o;
  wire n69_o;
  wire [31:0] n70_o;
  wire [32:0] n71_o;
  wire [32:0] pktman_n84;
  wire [80:0] pktman_n85;
  wire [34:0] pktman_n86;
  wire [31:0] pktman_config_slv_rdata;
  wire pktman_config_slv_error;
  wire [13:0] pktman_spm_addr;
  wire [1:0] pktman_spm_en;
  wire pktman_spm_wr;
  wire [63:0] pktman_spm_wdata;
  wire [34:0] pktman_pkt_out;
  wire [13:0] n87_o;
  wire n88_o;
  wire n89_o;
  wire [31:0] n90_o;
  wire [32:0] n91_o;
  wire [80:0] n93_o;
  wire [63:0] n95_o;
  wire n96_o;
  wire [80:0] rxunit_n101;
  wire [47:0] rxunit_n102;
  wire [13:0] rxunit_n103;
  wire rxunit_n104;
  wire rxunit_n105;
  wire [13:0] rxunit_spm_addr;
  wire [1:0] rxunit_spm_en;
  wire rxunit_spm_wr;
  wire [63:0] rxunit_spm_wdata;
  wire [13:0] rxunit_config_addr;
  wire rxunit_config_en;
  wire rxunit_config_wr;
  wire [31:0] rxunit_config_wdata;
  wire [13:0] rxunit_irq_fifo_data;
  wire rxunit_irq_fifo_data_valid;
  wire rxunit_irq_fifo_irq_valid;
  wire [80:0] n106_o;
  wire [47:0] n108_o;
  wire [32:0] irqfifo_n118;
  wire irqfifo_n119;
  wire irqfifo_n120;
  wire [31:0] irqfifo_config_slv_rdata;
  wire irqfifo_config_slv_error;
  wire irqfifo_irq_irq_sig;
  wire irqfifo_irq_data_sig;
  wire [13:0] n121_o;
  wire n122_o;
  wire n123_o;
  wire [31:0] n124_o;
  wire [32:0] n125_o;
  wire [80:0] spmbus_n132;
  wire [64:0] spmbus_n133;
  wire [13:0] spmbus_spm_addr;
  wire [1:0] spmbus_spm_en;
  wire spmbus_spm_wr;
  wire [63:0] spmbus_spm_wdata;
  wire [63:0] spmbus_tx_spm_slv_rdata;
  wire spmbus_tx_spm_slv_error;
  wire [63:0] n134_o;
  wire n135_o;
  wire [80:0] n136_o;
  wire [64:0] n138_o;
  wire [13:0] n140_o;
  wire [1:0] n141_o;
  wire n142_o;
  wire [63:0] n143_o;
  wire [13:0] n144_o;
  wire [1:0] n145_o;
  wire n146_o;
  wire [63:0] n147_o;
  wire [34:0] configbus_n150;
  wire [47:0] configbus_n151;
  wire configbus_n152;
  wire configbus_n153;
  wire configbus_n154;
  wire configbus_n155;
  wire configbus_n156;
  wire [1:0] configbus_ocp_config_s_sresp;
  wire [31:0] configbus_ocp_config_s_sdata;
  wire configbus_ocp_config_s_scmdaccept;
  wire [13:0] configbus_config_addr;
  wire configbus_config_en;
  wire configbus_config_wr;
  wire [31:0] configbus_config_wdata;
  wire configbus_tdm_ctrl_sel;
  wire configbus_sched_tbl_sel;
  wire configbus_dma_tbl_sel;
  wire configbus_mc_ctrl_sel;
  wire configbus_irq_unit_fifo_sel;
  wire [2:0] n157_o;
  wire [31:0] n158_o;
  wire [31:0] n159_o;
  wire [3:0] n160_o;
  wire n161_o;
  wire [34:0] n162_o;
  wire [13:0] n164_o;
  wire n165_o;
  wire n166_o;
  wire [31:0] n167_o;
  wire [47:0] n168_o;
  wire [31:0] n170_o;
  wire n171_o;
  wire [31:0] n173_o;
  wire n174_o;
  wire [31:0] n176_o;
  wire n177_o;
  wire [31:0] n179_o;
  wire n180_o;
  wire [31:0] n182_o;
  wire n183_o;
  assign master_run = tdmctrl_n15;
  assign ocp_config_s_SResp = n3_o;
  assign ocp_config_s_SData = n4_o;
  assign ocp_config_s_SCmdAccept = n5_o;
  assign data_irq = irqfifo_n120;
  assign config_irq = irqfifo_n119;
  assign spm_addr = n10_o;
  assign spm_en = n11_o;
  assign spm_wr = n12_o;
  assign spm_wdata = n13_o;
  assign pkt_out = pktman_n86;
  assign n1_o = {ocp_config_m_MRespAccept, ocp_config_m_MByteEn, ocp_config_m_MData, ocp_config_m_MAddr, ocp_config_m_MCmd};
  assign n3_o = configbus_n150[1:0];
  assign n4_o = configbus_n150[33:2];
  assign n5_o = configbus_n150[34];
  assign n8_o = {spm_slv_error, spm_slv_rdata};
  assign n10_o = spmbus_n132[13:0];
  assign n11_o = spmbus_n132[15:14];
  assign n12_o = spmbus_n132[16];
  assign n13_o = spmbus_n132[80:17];
  /* ni/network_interface.vhd:227:8  */
  assign config = configbus_n151; // (signal)
  /* ni/network_interface.vhd:229:8  */
  assign tdm_ctrl = tdmctrl_n16; // (signal)
  /* ni/network_interface.vhd:229:18  */
  assign sched_tbl = schedtbl_n61; // (signal)
  /* ni/network_interface.vhd:229:29  */
  assign dma_tbl = pktman_n84; // (signal)
  /* ni/network_interface.vhd:229:38  */
  assign mc_ctrl = mcctrl_n38; // (signal)
  /* ni/network_interface.vhd:230:8  */
  assign tdm_ctrl_sel = configbus_n152; // (signal)
  /* ni/network_interface.vhd:230:22  */
  assign sched_tbl_sel = configbus_n153; // (signal)
  /* ni/network_interface.vhd:230:37  */
  assign dma_tbl_sel = configbus_n154; // (signal)
  /* ni/network_interface.vhd:230:50  */
  assign mc_ctrl_sel = configbus_n155; // (signal)
  /* ni/network_interface.vhd:231:8  */
  assign stbl_idx = tdmctrl_n17; // (signal)
  /* ni/network_interface.vhd:232:8  */
  assign stbl_idx_en = tdmctrl_n18; // (signal)
  /* ni/network_interface.vhd:233:8  */
  assign t2n = schedtbl_n64; // (signal)
  /* ni/network_interface.vhd:235:8  */
  assign route = schedtbl_n62; // (signal)
  /* ni/network_interface.vhd:236:8  */
  assign pkt_len = schedtbl_n63; // (signal)
  /* ni/network_interface.vhd:237:8  */
  assign dma_num = schedtbl_n65; // (signal)
  /* ni/network_interface.vhd:238:8  */
  assign dma_en = schedtbl_n66; // (signal)
  /* ni/network_interface.vhd:240:8  */
  assign period_boundary = tdmctrl_n19; // (signal)
  /* ni/network_interface.vhd:241:8  */
  assign stbl_min = mcctrl_n39; // (signal)
  /* ni/network_interface.vhd:242:8  */
  assign stbl_maxp1 = mcctrl_n40; // (signal)
  /* ni/network_interface.vhd:244:8  */
  assign tx_spm = pktman_n85; // (signal)
  /* ni/network_interface.vhd:244:16  */
  assign rx_spm = rxunit_n101; // (signal)
  /* ni/network_interface.vhd:245:8  */
  assign tx_spm_slv = spmbus_n133; // (signal)
  /* ni/network_interface.vhd:247:8  */
  assign irq_fifo_data = rxunit_n103; // (signal)
  /* ni/network_interface.vhd:248:8  */
  assign irq_fifo_data_valid = rxunit_n104; // (signal)
  /* ni/network_interface.vhd:248:29  */
  assign irq_fifo_irq_valid = rxunit_n105; // (signal)
  /* ni/network_interface.vhd:250:8  */
  assign config_unit_master = rxunit_n102; // (signal)
  /* ni/network_interface.vhd:251:8  */
  assign irq_if_fifo = irqfifo_n118; // (signal)
  /* ni/network_interface.vhd:252:8  */
  assign irq_if_fifo_sel = configbus_n156; // (signal)
  /* ni/network_interface.vhd:254:8  */
  assign mc = mcctrl_n41; // (signal)
  /* ni/network_interface.vhd:255:8  */
  assign mc_idx = mcctrl_n42; // (signal)
  /* ni/network_interface.vhd:256:8  */
  assign mc_p_cnt = tdmctrl_n20; // (signal)
  /* ni/network_interface.vhd:257:8  */
  assign mc_p = mcctrl_n43; // (signal)
  /* ni/network_interface.vhd:271:31  */
  assign tdmctrl_n15 = tdmctrl_master_run; // (signal)
  /* ni/network_interface.vhd:274:31  */
  assign tdmctrl_n16 = n26_o; // (signal)
  /* ni/network_interface.vhd:275:29  */
  assign tdmctrl_n17 = tdmctrl_stbl_idx; // (signal)
  /* ni/network_interface.vhd:276:32  */
  assign tdmctrl_n18 = tdmctrl_stbl_idx_en; // (signal)
  /* ni/network_interface.vhd:278:36  */
  assign tdmctrl_n19 = tdmctrl_period_boundary; // (signal)
  /* ni/network_interface.vhd:279:29  */
  assign tdmctrl_n20 = tdmctrl_mc_p_cnt; // (signal)
  /* ni/network_interface.vhd:263:9  */
  tdm_controller_5ba93c9db0cff93f52b521d7420e43f6eda2784f tdmctrl (
    .clk(clk),
    .reset(reset),
    .run(run),
    .config_addr(n22_o),
    .config_en(n23_o),
    .config_wr(n24_o),
    .config_wdata(n25_o),
    .sel(tdm_ctrl_sel),
    .t2n(t2n),
    .stbl_min(stbl_min),
    .stbl_maxp1(stbl_maxp1),
    .master_run(tdmctrl_master_run),
    .config_slv_rdata(tdmctrl_config_slv_rdata),
    .config_slv_error(tdmctrl_config_slv_error),
    .stbl_idx(tdmctrl_stbl_idx),
    .stbl_idx_en(tdmctrl_stbl_idx_en),
    .period_boundary(tdmctrl_period_boundary),
    .mc_p_cnt(tdmctrl_mc_p_cnt));
  assign n22_o = config[13:0];
  assign n23_o = config[14];
  assign n24_o = config[15];
  assign n25_o = config[47:16];
  assign n26_o = {tdmctrl_config_slv_error, tdmctrl_config_slv_rdata};
  /* ni/network_interface.vhd:294:31  */
  assign mcctrl_n38 = n48_o; // (signal)
  /* ni/network_interface.vhd:297:29  */
  assign mcctrl_n39 = mcctrl_stbl_min; // (signal)
  /* ni/network_interface.vhd:298:31  */
  assign mcctrl_n40 = mcctrl_stbl_maxp1; // (signal)
  /* ni/network_interface.vhd:299:23  */
  assign mcctrl_n41 = mcctrl_mc; // (signal)
  /* ni/network_interface.vhd:300:27  */
  assign mcctrl_n42 = mcctrl_mc_idx; // (signal)
  /* ni/network_interface.vhd:301:25  */
  assign mcctrl_n43 = mcctrl_mc_p; // (signal)
  /* ni/network_interface.vhd:284:9  */
  mc_controller_5ba93c9db0cff93f52b521d7420e43f6eda2784f mcctrl (
    .clk(clk),
    .reset(reset),
    .run(run),
    .config_addr(n44_o),
    .config_en(n45_o),
    .config_wr(n46_o),
    .config_wdata(n47_o),
    .sel(mc_ctrl_sel),
    .period_boundary(period_boundary),
    .mc_p_cnt(mc_p_cnt),
    .config_slv_rdata(mcctrl_config_slv_rdata),
    .config_slv_error(mcctrl_config_slv_error),
    .stbl_min(mcctrl_stbl_min),
    .stbl_maxp1(mcctrl_stbl_maxp1),
    .mc(mcctrl_mc),
    .mc_idx(mcctrl_mc_idx),
    .mc_p(mcctrl_mc_p));
  assign n44_o = config[13:0];
  assign n45_o = config[14];
  assign n46_o = config[15];
  assign n47_o = config[47:16];
  assign n48_o = {mcctrl_config_slv_error, mcctrl_config_slv_rdata};
  /* ni/network_interface.vhd:311:31  */
  assign schedtbl_n61 = n71_o; // (signal)
  /* ni/network_interface.vhd:314:26  */
  assign schedtbl_n62 = schedtbl_route; // (signal)
  /* ni/network_interface.vhd:315:28  */
  assign schedtbl_n63 = schedtbl_pkt_len; // (signal)
  /* ni/network_interface.vhd:316:24  */
  assign schedtbl_n64 = schedtbl_t2n; // (signal)
  /* ni/network_interface.vhd:317:28  */
  assign schedtbl_n65 = schedtbl_dma_num; // (signal)
  /* ni/network_interface.vhd:318:27  */
  assign schedtbl_n66 = schedtbl_dma_en; // (signal)
  /* ni/network_interface.vhd:305:9  */
  schedule_table schedtbl (
    .clk(clk),
    .reset(reset),
    .config_addr(n67_o),
    .config_en(n68_o),
    .config_wr(n69_o),
    .config_wdata(n70_o),
    .sel(sched_tbl_sel),
    .stbl_idx(stbl_idx),
    .stbl_idx_en(stbl_idx_en),
    .config_slv_rdata(schedtbl_config_slv_rdata),
    .config_slv_error(schedtbl_config_slv_error),
    .route(schedtbl_route),
    .pkt_len(schedtbl_pkt_len),
    .t2n(schedtbl_t2n),
    .dma_num(schedtbl_dma_num),
    .dma_en(schedtbl_dma_en));
  assign n67_o = config[13:0];
  assign n68_o = config[14];
  assign n69_o = config[15];
  assign n70_o = config[47:16];
  assign n71_o = {schedtbl_config_slv_error, schedtbl_config_slv_rdata};
  /* ni/network_interface.vhd:327:31  */
  assign pktman_n84 = n91_o; // (signal)
  /* ni/network_interface.vhd:328:24  */
  assign pktman_n85 = n93_o; // (signal)
  /* ni/network_interface.vhd:337:28  */
  assign pktman_n86 = pktman_pkt_out; // (signal)
  /* ni/network_interface.vhd:321:9  */
  packet_manager pktman (
    .clk(clk),
    .reset(reset),
    .config_addr(n87_o),
    .config_en(n88_o),
    .config_wr(n89_o),
    .config_wdata(n90_o),
    .sel(dma_tbl_sel),
    .spm_slv_rdata(n95_o),
    .spm_slv_error(n96_o),
    .dma_num(dma_num),
    .dma_en(dma_en),
    .route(route),
    .mc(mc),
    .mc_idx(mc_idx),
    .mc_p(mc_p),
    .pkt_len(pkt_len),
    .config_slv_rdata(pktman_config_slv_rdata),
    .config_slv_error(pktman_config_slv_error),
    .spm_addr(pktman_spm_addr),
    .spm_en(pktman_spm_en),
    .spm_wr(pktman_spm_wr),
    .spm_wdata(pktman_spm_wdata),
    .pkt_out(pktman_pkt_out));
  assign n87_o = config[13:0];
  assign n88_o = config[14];
  assign n89_o = config[15];
  assign n90_o = config[47:16];
  assign n91_o = {pktman_config_slv_error, pktman_config_slv_rdata};
  assign n93_o = {pktman_spm_wdata, pktman_spm_wr, pktman_spm_en, pktman_spm_addr};
  assign n95_o = tx_spm_slv[63:0];
  assign n96_o = tx_spm_slv[64];
  /* ni/network_interface.vhd:345:24  */
  assign rxunit_n101 = n106_o; // (signal)
  /* ni/network_interface.vhd:346:27  */
  assign rxunit_n102 = n108_o; // (signal)
  /* ni/network_interface.vhd:347:34  */
  assign rxunit_n103 = rxunit_irq_fifo_data; // (signal)
  /* ni/network_interface.vhd:348:40  */
  assign rxunit_n104 = rxunit_irq_fifo_data_valid; // (signal)
  /* ni/network_interface.vhd:349:39  */
  assign rxunit_n105 = rxunit_irq_fifo_irq_valid; // (signal)
  /* ni/network_interface.vhd:341:9  */
  rx_unit rxunit (
    .clk(clk),
    .reset(reset),
    .pkt_in(pkt_in),
    .spm_addr(rxunit_spm_addr),
    .spm_en(rxunit_spm_en),
    .spm_wr(rxunit_spm_wr),
    .spm_wdata(rxunit_spm_wdata),
    .config_addr(rxunit_config_addr),
    .config_en(rxunit_config_en),
    .config_wr(rxunit_config_wr),
    .config_wdata(rxunit_config_wdata),
    .irq_fifo_data(rxunit_irq_fifo_data),
    .irq_fifo_data_valid(rxunit_irq_fifo_data_valid),
    .irq_fifo_irq_valid(rxunit_irq_fifo_irq_valid));
  assign n106_o = {rxunit_spm_wdata, rxunit_spm_wr, rxunit_spm_en, rxunit_spm_addr};
  assign n108_o = {rxunit_config_wdata, rxunit_config_wr, rxunit_config_en, rxunit_config_addr};
  /* ni/network_interface.vhd:360:31  */
  assign irqfifo_n118 = n125_o; // (signal)
  /* ni/network_interface.vhd:362:32  */
  assign irqfifo_n119 = irqfifo_irq_irq_sig; // (signal)
  /* ni/network_interface.vhd:363:34  */
  assign irqfifo_n120 = irqfifo_irq_data_sig; // (signal)
  /* ni/network_interface.vhd:354:9  */
  irq_fifo irqfifo (
    .clk(clk),
    .reset(reset),
    .config_addr(n121_o),
    .config_en(n122_o),
    .config_wr(n123_o),
    .config_wdata(n124_o),
    .sel(irq_if_fifo_sel),
    .irq_data_fifo_data_valid(irq_fifo_data_valid),
    .irq_irq_fifo_data_valid(irq_fifo_irq_valid),
    .irq_data_fifo_data(irq_fifo_data),
    .config_slv_rdata(irqfifo_config_slv_rdata),
    .config_slv_error(irqfifo_config_slv_error),
    .irq_irq_sig(irqfifo_irq_irq_sig),
    .irq_data_sig(irqfifo_irq_data_sig));
  assign n121_o = config[13:0];
  assign n122_o = config[14];
  assign n123_o = config[15];
  assign n124_o = config[47:16];
  assign n125_o = {irqfifo_config_slv_error, irqfifo_config_slv_rdata};
  /* ni/network_interface.vhd:378:32  */
  assign spmbus_n132 = n136_o; // (signal)
  /* ni/network_interface.vhd:379:39  */
  assign spmbus_n133 = n138_o; // (signal)
  /* ni/network_interface.vhd:373:9  */
  spm_bus spmbus (
    .clk(clk),
    .reset(reset),
    .spm_slv_rdata(n134_o),
    .spm_slv_error(n135_o),
    .tx_spm_addr(n140_o),
    .tx_spm_en(n141_o),
    .tx_spm_wr(n142_o),
    .tx_spm_wdata(n143_o),
    .rx_spm_addr(n144_o),
    .rx_spm_en(n145_o),
    .rx_spm_wr(n146_o),
    .rx_spm_wdata(n147_o),
    .spm_addr(spmbus_spm_addr),
    .spm_en(spmbus_spm_en),
    .spm_wr(spmbus_spm_wr),
    .spm_wdata(spmbus_spm_wdata),
    .tx_spm_slv_rdata(spmbus_tx_spm_slv_rdata),
    .tx_spm_slv_error(spmbus_tx_spm_slv_error));
  assign n134_o = n8_o[63:0];
  assign n135_o = n8_o[64];
  assign n136_o = {spmbus_spm_wdata, spmbus_spm_wr, spmbus_spm_en, spmbus_spm_addr};
  assign n138_o = {spmbus_tx_spm_slv_error, spmbus_tx_spm_slv_rdata};
  assign n140_o = tx_spm[13:0];
  assign n141_o = tx_spm[15:14];
  assign n142_o = tx_spm[16];
  assign n143_o = tx_spm[80:17];
  assign n144_o = rx_spm[13:0];
  assign n145_o = rx_spm[15:14];
  assign n146_o = rx_spm[16];
  assign n147_o = rx_spm[80:17];
  /* ni/network_interface.vhd:389:41  */
  assign configbus_n150 = n162_o; // (signal)
  /* ni/network_interface.vhd:392:35  */
  assign configbus_n151 = n168_o; // (signal)
  /* ni/network_interface.vhd:394:41  */
  assign configbus_n152 = configbus_tdm_ctrl_sel; // (signal)
  /* ni/network_interface.vhd:396:42  */
  assign configbus_n153 = configbus_sched_tbl_sel; // (signal)
  /* ni/network_interface.vhd:398:40  */
  assign configbus_n154 = configbus_dma_tbl_sel; // (signal)
  /* ni/network_interface.vhd:400:40  */
  assign configbus_n155 = configbus_mc_ctrl_sel; // (signal)
  /* ni/network_interface.vhd:402:46  */
  assign configbus_n156 = configbus_irq_unit_fifo_sel; // (signal)
  /* ni/network_interface.vhd:384:9  */
  config_bus configbus (
    .clk(clk),
    .reset(reset),
    .ocp_config_m_mcmd(n157_o),
    .ocp_config_m_maddr(n158_o),
    .ocp_config_m_mdata(n159_o),
    .ocp_config_m_mbyteen(n160_o),
    .ocp_config_m_mrespaccept(n161_o),
    .supervisor(supervisor),
    .config_unit_addr(n164_o),
    .config_unit_en(n165_o),
    .config_unit_wr(n166_o),
    .config_unit_wdata(n167_o),
    .tdm_ctrl_rdata(n170_o),
    .tdm_ctrl_error(n171_o),
    .sched_tbl_rdata(n173_o),
    .sched_tbl_error(n174_o),
    .dma_tbl_rdata(n176_o),
    .dma_tbl_error(n177_o),
    .mc_ctrl_rdata(n179_o),
    .mc_ctrl_error(n180_o),
    .irq_unit_fifo_rdata(n182_o),
    .irq_unit_fifo_error(n183_o),
    .ocp_config_s_sresp(configbus_ocp_config_s_sresp),
    .ocp_config_s_sdata(configbus_ocp_config_s_sdata),
    .ocp_config_s_scmdaccept(configbus_ocp_config_s_scmdaccept),
    .config_addr(configbus_config_addr),
    .config_en(configbus_config_en),
    .config_wr(configbus_config_wr),
    .config_wdata(configbus_config_wdata),
    .tdm_ctrl_sel(configbus_tdm_ctrl_sel),
    .sched_tbl_sel(configbus_sched_tbl_sel),
    .dma_tbl_sel(configbus_dma_tbl_sel),
    .mc_ctrl_sel(configbus_mc_ctrl_sel),
    .irq_unit_fifo_sel(configbus_irq_unit_fifo_sel));
  assign n157_o = n1_o[2:0];
  assign n158_o = n1_o[34:3];
  assign n159_o = n1_o[66:35];
  assign n160_o = n1_o[70:67];
  assign n161_o = n1_o[71];
  assign n162_o = {configbus_ocp_config_s_scmdaccept, configbus_ocp_config_s_sdata, configbus_ocp_config_s_sresp};
  assign n164_o = config_unit_master[13:0];
  assign n165_o = config_unit_master[14];
  assign n166_o = config_unit_master[15];
  assign n167_o = config_unit_master[47:16];
  assign n168_o = {configbus_config_wdata, configbus_config_wr, configbus_config_en, configbus_config_addr};
  assign n170_o = tdm_ctrl[31:0];
  assign n171_o = tdm_ctrl[32];
  assign n173_o = sched_tbl[31:0];
  assign n174_o = sched_tbl[32];
  assign n176_o = dma_tbl[31:0];
  assign n177_o = dma_tbl[32];
  assign n179_o = mc_ctrl[31:0];
  assign n180_o = mc_ctrl[32];
  assign n182_o = irq_if_fifo[31:0];
  assign n183_o = irq_if_fifo[32];
endmodule

