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
  reg [13:0] n1719_data; // mem_rd
  reg [13:0] n1722_data; // mem_rd
  assign a_dout = n1722_data;
  assign b_dout = n1719_data;
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
      n1719_data <= mem[b_addr];
  always @(posedge a_clk)
    if (a_wr)
      mem[a_addr] <= a_din;
  always @(posedge a_clk)
    if (1'b1)
      n1722_data <= mem[a_addr];
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
  reg [15:0] n1680_data; // mem_rd
  reg [15:0] n1683_data; // mem_rd
  assign a_dout = n1683_data;
  assign b_dout = n1680_data;
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
      n1680_data <= mem[b_addr];
  always @(posedge a_clk)
    if (a_wr)
      mem[a_addr] <= a_din;
  always @(posedge a_clk)
    if (1'b1)
      n1683_data <= mem[a_addr];
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
  reg [28:0] n1641_data; // mem_rd
  reg [28:0] n1644_data; // mem_rd
  assign a_dout = n1644_data;
  assign b_dout = n1641_data;
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
      n1641_data <= mem[b_addr];
  always @(posedge a_clk)
    if (a_wr)
      mem[a_addr] <= a_din;
  always @(posedge a_clk)
    if (1'b1)
      n1644_data <= mem[a_addr];
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
  reg [29:0] n1602_data; // mem_rd
  reg [29:0] n1605_data; // mem_rd
  assign a_dout = n1605_data;
  assign b_dout = n1602_data;
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
      n1602_data <= mem[b_addr];
  always @(posedge a_clk)
    if (a_wr)
      mem[a_addr] <= a_din;
  always @(posedge a_clk)
    if (1'b1)
      n1605_data <= mem[a_addr];
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
  wire [71:0] n1431_o;
  wire [1:0] n1433_o;
  wire [31:0] n1434_o;
  wire n1435_o;
  wire [47:0] n1436_o;
  wire [13:0] n1438_o;
  wire n1439_o;
  wire n1440_o;
  wire [31:0] n1441_o;
  wire [32:0] n1442_o;
  wire [32:0] n1444_o;
  wire [32:0] n1446_o;
  wire [32:0] n1448_o;
  wire [32:0] n1450_o;
  wire [1:0] next_ocp_resp;
  wire [1:0] ocp_resp_reg;
  wire [2:0] bank_id;
  wire [2:0] prev_bank_id;
  wire [31:0] n1453_o;
  wire [2:0] n1455_o;
  wire [13:0] n1456_o;
  wire n1457_o;
  wire n1458_o;
  wire [31:0] n1459_o;
  wire n1460_o;
  wire n1461_o;
  wire [2:0] n1462_o;
  wire n1464_o;
  wire n1465_o;
  wire [31:0] n1467_o;
  wire [2:0] n1468_o;
  wire [13:0] n1469_o;
  wire [2:0] n1472_o;
  wire n1474_o;
  wire n1475_o;
  wire [2:0] n1476_o;
  wire n1478_o;
  wire n1480_o;
  wire n1481_o;
  wire n1482_o;
  wire [47:0] n1483_o;
  wire [47:0] n1484_o;
  wire [47:0] n1485_o;
  wire [1:0] n1487_o;
  wire [2:0] n1488_o;
  wire n1490_o;
  wire n1491_o;
  wire n1492_o;
  wire [1:0] n1494_o;
  wire n1503_o;
  wire n1505_o;
  wire n1507_o;
  wire n1509_o;
  wire n1511_o;
  wire n1513_o;
  wire [5:0] n1514_o;
  reg n1517_o;
  reg n1521_o;
  reg n1525_o;
  reg n1529_o;
  reg n1533_o;
  wire [31:0] n1535_o;
  wire n1537_o;
  wire [31:0] n1538_o;
  wire n1540_o;
  wire [31:0] n1541_o;
  wire n1543_o;
  wire [31:0] n1544_o;
  wire n1546_o;
  wire [31:0] n1547_o;
  wire n1549_o;
  wire n1551_o;
  wire [5:0] n1552_o;
  reg [31:0] n1553_o;
  wire [1:0] n1558_o;
  wire [2:0] n1560_o;
  reg [1:0] n1564_q;
  reg [2:0] n1565_q;
  wire [34:0] n1566_o;
  assign ocp_config_s_sresp = n1433_o;
  assign ocp_config_s_sdata = n1434_o;
  assign ocp_config_s_scmdaccept = n1435_o;
  assign config_addr = n1438_o;
  assign config_en = n1439_o;
  assign config_wr = n1440_o;
  assign config_wdata = n1441_o;
  assign tdm_ctrl_sel = n1517_o;
  assign sched_tbl_sel = n1521_o;
  assign dma_tbl_sel = n1525_o;
  assign mc_ctrl_sel = n1529_o;
  assign irq_unit_fifo_sel = n1533_o;
  /* ni/spm_bus.vhd:50:17  */
  assign n1431_o = {ocp_config_m_mrespaccept, ocp_config_m_mbyteen, ocp_config_m_mdata, ocp_config_m_maddr, ocp_config_m_mcmd};
  /* ni/spm_bus.vhd:81:9  */
  assign n1433_o = n1566_o[1:0];
  assign n1434_o = n1566_o[33:2];
  /* ni/spm_bus.vhd:63:9  */
  assign n1435_o = n1566_o[34];
  /* ni/spm_bus.vhd:83:17  */
  assign n1436_o = {config_unit_wdata, config_unit_wr, config_unit_en, config_unit_addr};
  assign n1438_o = n1485_o[13:0];
  assign n1439_o = n1485_o[14];
  assign n1440_o = n1485_o[15];
  assign n1441_o = n1485_o[47:16];
  assign n1442_o = {tdm_ctrl_error, tdm_ctrl_rdata};
  assign n1444_o = {sched_tbl_error, sched_tbl_rdata};
  assign n1446_o = {dma_tbl_error, dma_tbl_rdata};
  assign n1448_o = {mc_ctrl_error, mc_ctrl_rdata};
  assign n1450_o = {irq_unit_fifo_error, irq_unit_fifo_rdata};
  /* ni/config_bus.vhd:88:8  */
  assign next_ocp_resp = n1494_o; // (signal)
  /* ni/config_bus.vhd:88:23  */
  assign ocp_resp_reg = n1564_q; // (signal)
  /* ni/config_bus.vhd:89:8  */
  assign bank_id = n1488_o; // (signal)
  /* ni/config_bus.vhd:89:17  */
  assign prev_bank_id = n1565_q; // (signal)
  /* ni/config_bus.vhd:105:55  */
  assign n1453_o = n1446_o[31:0];
  /* ni/config_bus.vhd:108:30  */
  assign n1455_o = n1436_o[13:11];
  /* ni/config_bus.vhd:110:30  */
  assign n1456_o = n1436_o[13:0];
  /* ni/config_bus.vhd:111:28  */
  assign n1457_o = n1436_o[14];
  /* ni/config_bus.vhd:112:28  */
  assign n1458_o = n1436_o[15];
  /* ni/config_bus.vhd:113:31  */
  assign n1459_o = n1436_o[47:16];
  /* ni/config_bus.vhd:120:18  */
  assign n1460_o = n1436_o[14];
  /* ni/config_bus.vhd:120:21  */
  assign n1461_o = ~n1460_o;
  /* ni/config_bus.vhd:120:44  */
  assign n1462_o = n1431_o[2:0];
  /* ni/config_bus.vhd:120:49  */
  assign n1464_o = n1462_o != 3'b000;
  /* ni/config_bus.vhd:120:27  */
  assign n1465_o = n1461_o & n1464_o;
  /* ni/config_bus.vhd:124:66  */
  assign n1467_o = n1431_o[66:35];
  /* ni/config_bus.vhd:126:43  */
  assign n1468_o = n1431_o[18:16];
  /* ni/config_bus.vhd:129:47  */
  assign n1469_o = n1431_o[18:5];
  /* ni/config_bus.vhd:134:21  */
  assign n1472_o = n1431_o[2:0];
  /* ni/config_bus.vhd:134:26  */
  assign n1474_o = n1472_o != 3'b000;
  /* ni/config_bus.vhd:134:42  */
  assign n1475_o = n1474_o & supervisor;
  /* ni/config_bus.vhd:135:23  */
  assign n1476_o = n1431_o[2:0];
  /* ni/config_bus.vhd:135:28  */
  assign n1478_o = n1476_o == 3'b001;
  /* ni/config_bus.vhd:134:5  */
  assign n1480_o = n1481_o ? 1'b1 : 1'b0;
  /* ni/config_bus.vhd:134:5  */
  assign n1481_o = n1475_o & n1478_o;
  /* ni/config_bus.vhd:120:3  */
  assign n1482_o = n1465_o ? 1'b1 : 1'b0;
  assign n1483_o = {n1467_o, n1480_o, 1'b1, n1469_o};
  assign n1484_o = {n1459_o, n1458_o, n1457_o, n1456_o};
  /* ni/config_bus.vhd:120:3  */
  assign n1485_o = n1465_o ? n1483_o : n1484_o;
  /* ni/config_bus.vhd:120:3  */
  assign n1487_o = n1465_o ? 2'b01 : ocp_resp_reg;
  /* ni/config_bus.vhd:120:3  */
  assign n1488_o = n1465_o ? n1468_o : n1455_o;
  /* ni/config_bus.vhd:161:20  */
  assign n1490_o = ocp_resp_reg != 2'b00;
  /* ni/config_bus.vhd:161:56  */
  assign n1491_o = n1431_o[71];
  /* ni/config_bus.vhd:161:38  */
  assign n1492_o = n1490_o & n1491_o;
  /* ni/config_bus.vhd:161:3  */
  assign n1494_o = n1492_o ? 2'b00 : n1487_o;
  /* ni/config_bus.vhd:177:5  */
  assign n1503_o = bank_id == 3'b000;
  /* ni/config_bus.vhd:179:5  */
  assign n1505_o = bank_id == 3'b001;
  /* ni/config_bus.vhd:181:5  */
  assign n1507_o = bank_id == 3'b010;
  /* ni/config_bus.vhd:183:5  */
  assign n1509_o = bank_id == 3'b011;
  /* ni/config_bus.vhd:185:5  */
  assign n1511_o = bank_id == 3'b100;
  /* ni/config_bus.vhd:187:5  */
  assign n1513_o = bank_id == 3'b111;
  assign n1514_o = {n1513_o, n1511_o, n1509_o, n1507_o, n1505_o, n1503_o};
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n1514_o)
      6'b100000: n1517_o <= 1'b0;
      6'b010000: n1517_o <= 1'b0;
      6'b001000: n1517_o <= 1'b0;
      6'b000100: n1517_o <= 1'b1;
      6'b000010: n1517_o <= 1'b0;
      6'b000001: n1517_o <= 1'b0;
      default: n1517_o <= 1'b0;
    endcase
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n1514_o)
      6'b100000: n1521_o <= 1'b0;
      6'b010000: n1521_o <= 1'b0;
      6'b001000: n1521_o <= 1'b0;
      6'b000100: n1521_o <= 1'b0;
      6'b000010: n1521_o <= 1'b1;
      6'b000001: n1521_o <= 1'b0;
      default: n1521_o <= 1'b0;
    endcase
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n1514_o)
      6'b100000: n1525_o <= 1'b0;
      6'b010000: n1525_o <= 1'b0;
      6'b001000: n1525_o <= 1'b0;
      6'b000100: n1525_o <= 1'b0;
      6'b000010: n1525_o <= 1'b0;
      6'b000001: n1525_o <= 1'b1;
      default: n1525_o <= 1'b0;
    endcase
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n1514_o)
      6'b100000: n1529_o <= 1'b0;
      6'b010000: n1529_o <= 1'b0;
      6'b001000: n1529_o <= 1'b1;
      6'b000100: n1529_o <= 1'b0;
      6'b000010: n1529_o <= 1'b0;
      6'b000001: n1529_o <= 1'b0;
      default: n1529_o <= 1'b0;
    endcase
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n1514_o)
      6'b100000: n1533_o <= 1'b0;
      6'b010000: n1533_o <= 1'b1;
      6'b001000: n1533_o <= 1'b0;
      6'b000100: n1533_o <= 1'b0;
      6'b000010: n1533_o <= 1'b0;
      6'b000001: n1533_o <= 1'b0;
      default: n1533_o <= 1'b0;
    endcase
  /* ni/config_bus.vhd:194:59  */
  assign n1535_o = n1446_o[31:0];
  /* ni/config_bus.vhd:193:5  */
  assign n1537_o = prev_bank_id == 3'b000;
  /* ni/config_bus.vhd:196:61  */
  assign n1538_o = n1444_o[31:0];
  /* ni/config_bus.vhd:195:5  */
  assign n1540_o = prev_bank_id == 3'b001;
  /* ni/config_bus.vhd:198:60  */
  assign n1541_o = n1442_o[31:0];
  /* ni/config_bus.vhd:197:5  */
  assign n1543_o = prev_bank_id == 3'b010;
  /* ni/config_bus.vhd:200:59  */
  assign n1544_o = n1448_o[31:0];
  /* ni/config_bus.vhd:199:5  */
  assign n1546_o = prev_bank_id == 3'b011;
  /* ni/config_bus.vhd:202:65  */
  assign n1547_o = n1450_o[31:0];
  /* ni/config_bus.vhd:201:5  */
  assign n1549_o = prev_bank_id == 3'b100;
  /* ni/config_bus.vhd:203:5  */
  assign n1551_o = prev_bank_id == 3'b111;
  assign n1552_o = {n1551_o, n1549_o, n1546_o, n1543_o, n1540_o, n1537_o};
  /* ni/config_bus.vhd:192:3  */
  always @*
    case (n1552_o)
      6'b100000: n1553_o <= n1453_o;
      6'b010000: n1553_o <= n1547_o;
      6'b001000: n1553_o <= n1544_o;
      6'b000100: n1553_o <= n1541_o;
      6'b000010: n1553_o <= n1538_o;
      6'b000001: n1553_o <= n1535_o;
      default: n1553_o <= n1453_o;
    endcase
  /* ni/config_bus.vhd:215:7  */
  assign n1558_o = reset ? 2'b00 : next_ocp_resp;
  /* ni/config_bus.vhd:215:7  */
  assign n1560_o = reset ? 3'b000 : bank_id;
  /* ni/config_bus.vhd:214:5  */
  always @(posedge clk)
    n1564_q <= n1558_o;
  /* ni/config_bus.vhd:214:5  */
  always @(posedge clk)
    n1565_q <= n1560_o;
  /* ni/config_bus.vhd:214:5  */
  assign n1566_o = {n1482_o, n1553_o, ocp_resp_reg};
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
  wire [64:0] n1375_o;
  wire [13:0] n1377_o;
  wire [1:0] n1378_o;
  wire n1379_o;
  wire [63:0] n1380_o;
  wire [63:0] n1382_o;
  wire n1383_o;
  wire [80:0] n1384_o;
  wire [80:0] n1385_o;
  wire [80:0] rx_spm_buff;
  wire n1388_o;
  wire n1389_o;
  wire n1390_o;
  wire n1391_o;
  wire n1392_o;
  wire n1393_o;
  wire n1394_o;
  wire n1395_o;
  wire n1396_o;
  wire [80:0] n1397_o;
  wire [80:0] n1398_o;
  wire [80:0] n1399_o;
  wire n1405_o;
  wire n1406_o;
  wire n1407_o;
  wire n1408_o;
  wire n1409_o;
  wire n1410_o;
  wire n1411_o;
  wire n1412_o;
  wire n1413_o;
  wire n1414_o;
  wire n1415_o;
  wire [13:0] n1416_o;
  wire [63:0] n1417_o;
  wire [80:0] n1418_o;
  wire [13:0] n1419_o;
  wire [13:0] n1420_o;
  wire [13:0] n1421_o;
  wire [1:0] n1422_o;
  wire [1:0] n1423_o;
  wire [64:0] n1424_o;
  wire [64:0] n1425_o;
  wire [64:0] n1426_o;
  wire [80:0] n1427_o;
  reg [80:0] n1430_q;
  assign spm_addr = n1377_o;
  assign spm_en = n1378_o;
  assign spm_wr = n1379_o;
  assign spm_wdata = n1380_o;
  assign tx_spm_slv_rdata = n1382_o;
  assign tx_spm_slv_error = n1383_o;
  /* ni/irq_fifo.vhd:146:9  */
  assign n1375_o = {spm_slv_error, spm_slv_rdata};
  /* ni/irq_fifo.vhd:53:17  */
  assign n1377_o = n1399_o[13:0];
  /* ni/irq_fifo.vhd:51:17  */
  assign n1378_o = n1399_o[15:14];
  assign n1379_o = n1399_o[16];
  assign n1380_o = n1399_o[80:17];
  assign n1382_o = n1375_o[63:0];
  /* ni/irq_fifo.vhd:216:9  */
  assign n1383_o = n1375_o[64];
  assign n1384_o = {tx_spm_wdata, tx_spm_wr, tx_spm_en, tx_spm_addr};
  /* ni/irq_fifo.vhd:200:9  */
  assign n1385_o = {rx_spm_wdata, rx_spm_wr, rx_spm_en, rx_spm_addr};
  /* ni/spm_bus.vhd:58:16  */
  assign rx_spm_buff = n1430_q; // (signal)
  /* ni/spm_bus.vhd:65:31  */
  assign n1388_o = n1384_o[14];
  /* ni/spm_bus.vhd:65:55  */
  assign n1389_o = n1384_o[15];
  /* ni/spm_bus.vhd:65:42  */
  assign n1390_o = n1388_o | n1389_o;
  /* ni/spm_bus.vhd:68:44  */
  assign n1391_o = rx_spm_buff[14];
  /* ni/spm_bus.vhd:68:73  */
  assign n1392_o = rx_spm_buff[15];
  /* ni/spm_bus.vhd:68:55  */
  assign n1393_o = n1391_o | n1392_o;
  /* ni/spm_bus.vhd:71:47  */
  assign n1394_o = n1385_o[14];
  /* ni/spm_bus.vhd:71:71  */
  assign n1395_o = n1385_o[15];
  /* ni/spm_bus.vhd:71:58  */
  assign n1396_o = n1394_o | n1395_o;
  /* ni/spm_bus.vhd:71:33  */
  assign n1397_o = n1396_o ? n1385_o : n1384_o;
  /* ni/spm_bus.vhd:68:25  */
  assign n1398_o = n1393_o ? rx_spm_buff : n1397_o;
  /* ni/spm_bus.vhd:65:17  */
  assign n1399_o = n1390_o ? n1384_o : n1398_o;
  /* ni/spm_bus.vhd:87:63  */
  assign n1405_o = n1385_o[14];
  /* ni/spm_bus.vhd:87:81  */
  assign n1406_o = n1384_o[14];
  /* ni/spm_bus.vhd:87:97  */
  assign n1407_o = n1384_o[15];
  /* ni/spm_bus.vhd:87:85  */
  assign n1408_o = n1406_o | n1407_o;
  /* ni/spm_bus.vhd:87:67  */
  assign n1409_o = n1405_o & n1408_o;
  /* ni/spm_bus.vhd:88:63  */
  assign n1410_o = n1385_o[15];
  /* ni/spm_bus.vhd:88:81  */
  assign n1411_o = n1384_o[14];
  /* ni/spm_bus.vhd:88:97  */
  assign n1412_o = n1384_o[15];
  /* ni/spm_bus.vhd:88:85  */
  assign n1413_o = n1411_o | n1412_o;
  /* ni/spm_bus.vhd:88:67  */
  assign n1414_o = n1410_o & n1413_o;
  /* ni/spm_bus.vhd:89:61  */
  assign n1415_o = n1385_o[16];
  /* ni/spm_bus.vhd:90:61  */
  assign n1416_o = n1385_o[13:0];
  /* ni/spm_bus.vhd:91:61  */
  assign n1417_o = n1385_o[80:17];
  assign n1418_o = {n1417_o, n1415_o, n1414_o, n1409_o, n1416_o};
  assign n1419_o = n1418_o[13:0];
  assign n1420_o = rx_spm_buff[13:0];
  /* ni/spm_bus.vhd:84:25  */
  assign n1421_o = reset ? n1420_o : n1419_o;
  assign n1422_o = n1418_o[15:14];
  /* ni/spm_bus.vhd:84:25  */
  assign n1423_o = reset ? 2'b00 : n1422_o;
  assign n1424_o = n1418_o[80:16];
  assign n1425_o = rx_spm_buff[80:16];
  /* ni/spm_bus.vhd:84:25  */
  assign n1426_o = reset ? n1425_o : n1424_o;
  assign n1427_o = {n1426_o, n1423_o, n1421_o};
  /* ni/spm_bus.vhd:83:17  */
  always @(posedge clk)
    n1430_q <= n1427_o;
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
  wire [47:0] n1210_o;
  wire [31:0] n1212_o;
  wire n1213_o;
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
  wire n1218_o;
  wire n1219_o;
  wire n1222_o;
  wire n1223_o;
  wire [4:0] n1227_o;
  wire n1228_o;
  wire n1230_o;
  wire n1232_o;
  wire n1233_o;
  wire n1234_o;
  wire n1235_o;
  wire [4:0] n1239_o;
  wire n1240_o;
  wire n1242_o;
  wire n1244_o;
  wire n1245_o;
  wire n1246_o;
  wire n1247_o;
  wire n1249_o;
  wire [4:0] n1250_o;
  wire n1253_o;
  wire n1254_o;
  wire n1255_o;
  wire n1256_o;
  wire [10:0] n1257_o;
  wire n1259_o;
  wire n1261_o;
  wire [1:0] n1262_o;
  reg n1265_o;
  reg n1268_o;
  reg n1271_o;
  reg [4:0] n1272_o;
  wire n1274_o;
  wire n1276_o;
  wire n1278_o;
  wire [4:0] n1279_o;
  wire n1281_o;
  wire n1284_o;
  wire n1287_o;
  wire n1289_o;
  wire n1291_o;
  wire n1292_o;
  wire n1293_o;
  localparam n1295_o = 1'b0;
  localparam [13:0] n1296_o = 14'b00000000000000;
  wire [13:0] tdpram_n1297;
  wire [13:0] tdpram_a_dout;
  wire [13:0] tdpram_b_dout;
  wire n1304_o;
  wire n1306_o;
  wire [4:0] n1308_o;
  wire [4:0] n1310_o;
  wire [4:0] n1311_o;
  wire [4:0] n1313_o;
  reg [4:0] n1316_q;
  wire n1320_o;
  wire n1322_o;
  wire [4:0] n1324_o;
  wire [4:0] n1326_o;
  wire [4:0] n1327_o;
  wire [4:0] n1329_o;
  reg [4:0] n1332_q;
  wire n1336_o;
  wire n1338_o;
  wire [4:0] n1340_o;
  wire [4:0] n1342_o;
  wire [4:0] n1343_o;
  wire [4:0] n1345_o;
  reg [4:0] n1348_q;
  wire n1352_o;
  wire n1354_o;
  wire [4:0] n1356_o;
  wire [4:0] n1358_o;
  wire [4:0] n1359_o;
  wire [4:0] n1361_o;
  reg [4:0] n1364_q;
  wire n1369_o;
  reg n1373_q;
  wire [32:0] n1374_o;
  assign config_slv_rdata = n1212_o;
  assign config_slv_error = n1213_o;
  assign irq_irq_sig = irq_not_empty;
  assign irq_data_sig = data_not_empty;
  /* ni/rx_unit.vhd:55:17  */
  assign n1210_o = {config_wdata, config_wr, config_en, config_addr};
  /* ni/rx_unit.vhd:52:17  */
  assign n1212_o = n1374_o[31:0];
  /* ni/rx_unit.vhd:50:17  */
  assign n1213_o = n1374_o[32];
  /* ni/irq_fifo.vhd:94:16  */
  assign irq_not_empty = n1219_o; // (signal)
  /* ni/irq_fifo.vhd:94:31  */
  assign data_not_empty = n1223_o; // (signal)
  /* ni/irq_fifo.vhd:94:47  */
  assign next_error = n1281_o; // (signal)
  /* ni/irq_fifo.vhd:94:59  */
  assign irq_read = n1284_o; // (signal)
  /* ni/irq_fifo.vhd:94:69  */
  assign data_read = n1287_o; // (signal)
  /* ni/irq_fifo.vhd:94:80  */
  assign irq_not_full = n1235_o; // (signal)
  /* ni/irq_fifo.vhd:94:94  */
  assign data_not_full = n1247_o; // (signal)
  /* ni/irq_fifo.vhd:95:16  */
  assign data_w_ptr = n1332_q; // (signal)
  /* ni/irq_fifo.vhd:95:28  */
  assign data_r_ptr = n1364_q; // (signal)
  /* ni/irq_fifo.vhd:95:40  */
  assign irq_w_ptr = n1316_q; // (signal)
  /* ni/irq_fifo.vhd:95:51  */
  assign irq_r_ptr = n1348_q; // (signal)
  /* ni/irq_fifo.vhd:95:62  */
  assign w_ptr = n1250_o; // (signal)
  /* ni/irq_fifo.vhd:95:69  */
  assign r_ptr = n1279_o; // (signal)
  /* ni/irq_fifo.vhd:96:16  */
  assign w_data = irq_data_fifo_data; // (signal)
  /* ni/irq_fifo.vhd:106:46  */
  assign n1218_o = irq_w_ptr == irq_r_ptr;
  /* ni/irq_fifo.vhd:106:31  */
  assign n1219_o = n1218_o ? 1'b0 : 1'b1;
  /* ni/irq_fifo.vhd:107:47  */
  assign n1222_o = data_w_ptr == data_r_ptr;
  /* ni/irq_fifo.vhd:107:31  */
  assign n1223_o = n1222_o ? 1'b0 : 1'b1;
  /* ni/irq_fifo.vhd:109:59  */
  assign n1227_o = irq_r_ptr - 5'b00001;
  /* ni/irq_fifo.vhd:109:47  */
  assign n1228_o = irq_w_ptr == n1227_o;
  /* ni/irq_fifo.vhd:109:78  */
  assign n1230_o = irq_w_ptr == 5'b01111;
  /* ni/irq_fifo.vhd:109:146  */
  assign n1232_o = irq_r_ptr == 5'b00000;
  /* ni/irq_fifo.vhd:109:132  */
  assign n1233_o = n1230_o & n1232_o;
  /* ni/irq_fifo.vhd:109:64  */
  assign n1234_o = n1228_o | n1233_o;
  /* ni/irq_fifo.vhd:109:30  */
  assign n1235_o = n1234_o ? 1'b0 : 1'b1;
  /* ni/irq_fifo.vhd:110:61  */
  assign n1239_o = data_r_ptr + 5'b00001;
  /* ni/irq_fifo.vhd:110:48  */
  assign n1240_o = data_w_ptr == n1239_o;
  /* ni/irq_fifo.vhd:110:81  */
  assign n1242_o = data_w_ptr == 5'b10000;
  /* ni/irq_fifo.vhd:110:151  */
  assign n1244_o = data_r_ptr == 5'b11111;
  /* ni/irq_fifo.vhd:110:136  */
  assign n1245_o = n1242_o & n1244_o;
  /* ni/irq_fifo.vhd:110:66  */
  assign n1246_o = n1240_o | n1245_o;
  /* ni/irq_fifo.vhd:110:30  */
  assign n1247_o = n1246_o ? 1'b0 : 1'b1;
  /* ni/irq_fifo.vhd:113:59  */
  assign n1249_o = ~irq_data_fifo_data_valid;
  /* ni/irq_fifo.vhd:113:29  */
  assign n1250_o = n1249_o ? irq_w_ptr : data_w_ptr;
  /* ni/irq_fifo.vhd:123:42  */
  assign n1253_o = n1210_o[14];
  /* ni/irq_fifo.vhd:123:31  */
  assign n1254_o = sel & n1253_o;
  /* ni/irq_fifo.vhd:125:35  */
  assign n1255_o = n1210_o[15];
  /* ni/irq_fifo.vhd:125:38  */
  assign n1256_o = ~n1255_o;
  /* ni/irq_fifo.vhd:126:50  */
  assign n1257_o = n1210_o[10:0];
  /* ni/irq_fifo.vhd:128:11  */
  assign n1259_o = n1257_o == 11'b00000000000;
  /* ni/irq_fifo.vhd:132:11  */
  assign n1261_o = n1257_o == 11'b00000000001;
  assign n1262_o = {n1261_o, n1259_o};
  /* ni/irq_fifo.vhd:126:33  */
  always @*
    case (n1262_o)
      2'b10: n1265_o <= 1'b0;
      2'b01: n1265_o <= 1'b0;
      default: n1265_o <= 1'b1;
    endcase
  /* ni/irq_fifo.vhd:126:33  */
  always @*
    case (n1262_o)
      2'b10: n1268_o <= 1'b0;
      2'b01: n1268_o <= 1'b1;
      default: n1268_o <= 1'b0;
    endcase
  /* ni/irq_fifo.vhd:126:33  */
  always @*
    case (n1262_o)
      2'b10: n1271_o <= 1'b1;
      2'b01: n1271_o <= 1'b0;
      default: n1271_o <= 1'b0;
    endcase
  /* ni/irq_fifo.vhd:126:33  */
  always @*
    case (n1262_o)
      2'b10: n1272_o <= data_r_ptr;
      2'b01: n1272_o <= irq_r_ptr;
      default: n1272_o <= data_r_ptr;
    endcase
  /* ni/irq_fifo.vhd:125:25  */
  assign n1274_o = n1256_o ? n1265_o : 1'b1;
  /* ni/irq_fifo.vhd:125:25  */
  assign n1276_o = n1256_o ? n1268_o : 1'b0;
  /* ni/irq_fifo.vhd:125:25  */
  assign n1278_o = n1256_o ? n1271_o : 1'b0;
  /* ni/irq_fifo.vhd:123:17  */
  assign n1279_o = n1289_o ? n1272_o : data_r_ptr;
  /* ni/irq_fifo.vhd:123:17  */
  assign n1281_o = n1254_o ? n1274_o : 1'b0;
  /* ni/irq_fifo.vhd:123:17  */
  assign n1284_o = n1254_o ? n1276_o : 1'b0;
  /* ni/irq_fifo.vhd:123:17  */
  assign n1287_o = n1254_o ? n1278_o : 1'b0;
  /* ni/irq_fifo.vhd:123:17  */
  assign n1289_o = n1254_o & n1256_o;
  /* ni/irq_fifo.vhd:154:60  */
  assign n1291_o = irq_irq_fifo_data_valid & irq_not_full;
  /* ni/irq_fifo.vhd:154:108  */
  assign n1292_o = irq_data_fifo_data_valid & data_not_full;
  /* ni/irq_fifo.vhd:154:79  */
  assign n1293_o = n1291_o | n1292_o;
  /* ni/irq_fifo.vhd:164:35  */
  assign tdpram_n1297 = tdpram_b_dout; // (signal)
  /* ni/irq_fifo.vhd:146:9  */
  tdp_ram_14_5 tdpram (
    .a_clk(clk),
    .a_wr(n1293_o),
    .a_addr(w_ptr),
    .a_din(w_data),
    .b_clk(clk),
    .b_wr(n1295_o),
    .b_addr(r_ptr),
    .b_din(n1296_o),
    .a_dout(),
    .b_dout(tdpram_b_dout));
  /* ni/irq_fifo.vhd:173:57  */
  assign n1304_o = irq_irq_fifo_data_valid & irq_not_full;
  /* ni/irq_fifo.vhd:174:47  */
  assign n1306_o = irq_w_ptr == 5'b01111;
  /* ni/irq_fifo.vhd:177:64  */
  assign n1308_o = irq_w_ptr + 5'b00001;
  /* ni/irq_fifo.vhd:174:33  */
  assign n1310_o = n1306_o ? 5'b00000 : n1308_o;
  /* ni/irq_fifo.vhd:173:25  */
  assign n1311_o = n1304_o ? n1310_o : irq_w_ptr;
  /* ni/irq_fifo.vhd:171:25  */
  assign n1313_o = reset ? 5'b00000 : n1311_o;
  /* ni/irq_fifo.vhd:170:17  */
  always @(posedge clk)
    n1316_q <= n1313_o;
  /* ni/irq_fifo.vhd:189:58  */
  assign n1320_o = irq_data_fifo_data_valid & data_not_full;
  /* ni/irq_fifo.vhd:190:48  */
  assign n1322_o = data_w_ptr == 5'b10000;
  /* ni/irq_fifo.vhd:193:66  */
  assign n1324_o = data_w_ptr - 5'b00001;
  /* ni/irq_fifo.vhd:190:33  */
  assign n1326_o = n1322_o ? 5'b11111 : n1324_o;
  /* ni/irq_fifo.vhd:189:25  */
  assign n1327_o = n1320_o ? n1326_o : data_w_ptr;
  /* ni/irq_fifo.vhd:187:25  */
  assign n1329_o = reset ? 5'b11111 : n1327_o;
  /* ni/irq_fifo.vhd:186:17  */
  always @(posedge clk)
    n1332_q <= n1329_o;
  /* ni/irq_fifo.vhd:205:49  */
  assign n1336_o = irq_read & irq_not_empty;
  /* ni/irq_fifo.vhd:206:47  */
  assign n1338_o = irq_r_ptr == 5'b01111;
  /* ni/irq_fifo.vhd:209:64  */
  assign n1340_o = irq_r_ptr + 5'b00001;
  /* ni/irq_fifo.vhd:206:33  */
  assign n1342_o = n1338_o ? 5'b00000 : n1340_o;
  /* ni/irq_fifo.vhd:205:25  */
  assign n1343_o = n1336_o ? n1342_o : irq_r_ptr;
  /* ni/irq_fifo.vhd:203:25  */
  assign n1345_o = reset ? 5'b00000 : n1343_o;
  /* ni/irq_fifo.vhd:202:17  */
  always @(posedge clk)
    n1348_q <= n1345_o;
  /* ni/irq_fifo.vhd:221:50  */
  assign n1352_o = data_read & data_not_empty;
  /* ni/irq_fifo.vhd:222:48  */
  assign n1354_o = data_r_ptr == 5'b10000;
  /* ni/irq_fifo.vhd:225:66  */
  assign n1356_o = data_r_ptr - 5'b00001;
  /* ni/irq_fifo.vhd:222:33  */
  assign n1358_o = n1354_o ? 5'b11111 : n1356_o;
  /* ni/irq_fifo.vhd:221:25  */
  assign n1359_o = n1352_o ? n1358_o : data_r_ptr;
  /* ni/irq_fifo.vhd:219:25  */
  assign n1361_o = reset ? 5'b11111 : n1359_o;
  /* ni/irq_fifo.vhd:218:17  */
  always @(posedge clk)
    n1364_q <= n1361_o;
  /* ni/irq_fifo.vhd:234:25  */
  assign n1369_o = reset ? 1'b0 : next_error;
  /* ni/irq_fifo.vhd:233:17  */
  always @(posedge clk)
    n1373_q <= n1369_o;
  /* ni/irq_fifo.vhd:233:17  */
  assign n1374_o = {n1373_q, 18'b000000000000000000, tdpram_n1297};
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
  wire [13:0] n1020_o;
  wire [1:0] n1021_o;
  wire n1022_o;
  wire [63:0] n1023_o;
  wire [13:0] n1025_o;
  wire n1026_o;
  wire n1027_o;
  wire [31:0] n1028_o;
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
  wire n1032_o;
  wire n1033_o;
  wire n1034_o;
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
  wire [31:0] n1050_o;
  wire [31:0] n1051_o;
  wire n1052_o;
  wire n1053_o;
  localparam [1:0] n1056_o = 2'b00;
  wire [13:0] n1061_o;
  wire [13:0] n1062_o;
  wire [2:0] n1064_o;
  wire [2:0] n1066_o;
  wire [2:0] n1068_o;
  wire n1070_o;
  wire [13:0] n1072_o;
  wire n1073_o;
  wire n1074_o;
  wire [31:0] n1077_o;
  wire n1078_o;
  wire n1079_o;
  wire n1080_o;
  wire [31:0] n1081_o;
  wire n1084_o;
  wire [2:0] n1087_o;
  wire n1089_o;
  localparam [1:0] n1090_o = 2'b11;
  wire n1092_o;
  wire n1093_o;
  wire [2:0] n1096_o;
  wire n1098_o;
  wire n1101_o;
  wire n1102_o;
  wire [2:0] n1105_o;
  wire n1107_o;
  wire n1111_o;
  wire [31:0] n1114_o;
  wire n1116_o;
  wire [5:0] n1117_o;
  wire n1118_o;
  wire n1119_o;
  reg n1121_o;
  wire n1122_o;
  wire n1123_o;
  reg n1125_o;
  reg n1127_o;
  reg [31:0] n1129_o;
  reg n1132_o;
  reg n1134_o;
  reg [13:0] n1136_o;
  reg n1140_o;
  reg n1144_o;
  reg n1149_o;
  reg [13:0] n1152_o;
  reg [13:0] n1154_o;
  reg [2:0] n1158_o;
  wire [13:0] n1164_o;
  wire [13:0] n1165_o;
  reg [13:0] n1168_q;
  wire [31:0] n1172_o;
  wire [31:0] n1176_o;
  reg [31:0] n1177_q;
  wire [13:0] n1182_o;
  wire [2:0] n1184_o;
  reg [13:0] n1188_q;
  reg [2:0] n1189_q;
  wire n1193_o;
  wire n1194_o;
  wire n1195_o;
  wire n1196_o;
  wire n1197_o;
  wire n1198_o;
  wire n1199_o;
  wire n1200_o;
  wire n1202_o;
  wire n1204_o;
  reg n1207_q;
  wire [80:0] n1208_o;
  wire [47:0] n1209_o;
  assign spm_addr = n1020_o;
  assign spm_en = n1021_o;
  assign spm_wr = n1022_o;
  assign spm_wdata = n1023_o;
  assign config_addr = n1025_o;
  assign config_en = n1026_o;
  assign config_wr = n1027_o;
  assign config_wdata = n1028_o;
  assign irq_fifo_data = n1136_o;
  assign irq_fifo_data_valid = n1053_o;
  assign irq_fifo_irq_valid = n1140_o;
  /* ni/packet_manager.vhd:323:16  */
  assign n1020_o = n1208_o[13:0];
  /* ni/packet_manager.vhd:318:16  */
  assign n1021_o = n1208_o[15:14];
  /* ni/packet_manager.vhd:60:5  */
  assign n1022_o = n1208_o[16];
  /* ni/packet_manager.vhd:51:5  */
  assign n1023_o = n1208_o[80:17];
  assign n1025_o = n1209_o[13:0];
  /* ni/packet_manager.vhd:399:1  */
  assign n1026_o = n1209_o[14];
  assign n1027_o = n1209_o[15];
  /* ni/packet_manager.vhd:387:1  */
  assign n1028_o = n1209_o[47:16];
  /* ni/rx_unit.vhd:63:16  */
  assign new_pkt = n1037_o; // (signal)
  /* ni/rx_unit.vhd:63:25  */
  assign new_data_pkt = n1040_o; // (signal)
  /* ni/rx_unit.vhd:63:39  */
  assign new_config_pkt = n1045_o; // (signal)
  /* ni/rx_unit.vhd:63:55  */
  assign new_irq_pkt = n1049_o; // (signal)
  /* ni/rx_unit.vhd:64:16  */
  assign wdata_high_en = n1144_o; // (signal)
  /* ni/rx_unit.vhd:64:45  */
  assign addr_load = n1149_o; // (signal)
  /* ni/rx_unit.vhd:64:56  */
  assign lst_data_pkt = n1207_q; // (signal)
  /* ni/rx_unit.vhd:65:16  */
  assign addr = n1168_q; // (signal)
  /* ni/rx_unit.vhd:65:22  */
  assign next_addr = n1152_o; // (signal)
  /* ni/rx_unit.vhd:65:33  */
  assign int_addr = n1188_q; // (signal)
  /* ni/rx_unit.vhd:65:43  */
  assign next_int_addr = n1154_o; // (signal)
  /* ni/rx_unit.vhd:67:8  */
  assign wdata_high = n1177_q; // (signal)
  /* ni/rx_unit.vhd:71:16  */
  assign state = n1189_q; // (signal)
  /* ni/rx_unit.vhd:71:23  */
  assign next_state = n1158_o; // (signal)
  /* ni/rx_unit.vhd:75:26  */
  assign n1032_o = pkt_in[34];
  /* ni/rx_unit.vhd:75:53  */
  assign n1033_o = pkt_in[33];
  /* ni/rx_unit.vhd:75:43  */
  assign n1034_o = n1032_o & n1033_o;
  /* ni/rx_unit.vhd:75:85  */
  assign n1035_o = pkt_in[32];
  /* ni/rx_unit.vhd:75:75  */
  assign n1036_o = ~n1035_o;
  /* ni/rx_unit.vhd:75:70  */
  assign n1037_o = n1034_o & n1036_o;
  /* ni/rx_unit.vhd:78:48  */
  assign n1038_o = pkt_in[30];
  /* ni/rx_unit.vhd:78:38  */
  assign n1039_o = ~n1038_o;
  /* ni/rx_unit.vhd:78:33  */
  assign n1040_o = new_pkt & n1039_o;
  /* ni/rx_unit.vhd:81:49  */
  assign n1041_o = pkt_in[31];
  /* ni/rx_unit.vhd:81:39  */
  assign n1042_o = ~n1041_o;
  /* ni/rx_unit.vhd:81:35  */
  assign n1043_o = new_pkt & n1042_o;
  /* ni/rx_unit.vhd:81:106  */
  assign n1044_o = pkt_in[30];
  /* ni/rx_unit.vhd:81:96  */
  assign n1045_o = n1043_o & n1044_o;
  /* ni/rx_unit.vhd:84:42  */
  assign n1046_o = pkt_in[31];
  /* ni/rx_unit.vhd:84:32  */
  assign n1047_o = new_pkt & n1046_o;
  /* ni/rx_unit.vhd:84:98  */
  assign n1048_o = pkt_in[30];
  /* ni/rx_unit.vhd:84:88  */
  assign n1049_o = n1047_o & n1048_o;
  /* ni/rx_unit.vhd:87:62  */
  assign n1050_o = pkt_in[31:0];
  /* ni/rx_unit.vhd:89:65  */
  assign n1051_o = pkt_in[31:0];
  /* ni/rx_unit.vhd:96:55  */
  assign n1052_o = pkt_in[32];
  /* ni/rx_unit.vhd:96:45  */
  assign n1053_o = lst_data_pkt & n1052_o;
  /* ni/rx_unit.vhd:113:43  */
  assign n1061_o = int_addr + 14'b00000000000001;
  /* ni/rx_unit.vhd:117:65  */
  assign n1062_o = pkt_in[29:16];
  /* ni/rx_unit.vhd:122:33  */
  assign n1064_o = new_irq_pkt ? 3'b101 : state;
  /* ni/rx_unit.vhd:120:33  */
  assign n1066_o = new_config_pkt ? 3'b100 : n1064_o;
  /* ni/rx_unit.vhd:118:33  */
  assign n1068_o = new_data_pkt ? 3'b010 : n1066_o;
  /* ni/rx_unit.vhd:115:25  */
  assign n1070_o = state == 3'b000;
  /* ni/rx_unit.vhd:127:55  */
  assign n1072_o = addr + 14'b00000000000001;
  /* ni/rx_unit.vhd:128:43  */
  assign n1073_o = pkt_in[32];
  /* ni/rx_unit.vhd:128:60  */
  assign n1074_o = ~n1073_o;
  /* ni/rx_unit.vhd:134:107  */
  assign n1077_o = pkt_in[31:0];
  assign n1078_o = n1056_o[0];
  /* ni/rx_unit.vhd:128:33  */
  assign n1079_o = n1074_o ? n1078_o : 1'b1;
  /* ni/rx_unit.vhd:128:33  */
  assign n1080_o = n1074_o ? 1'b0 : 1'b1;
  /* ni/rx_unit.vhd:128:33  */
  assign n1081_o = n1074_o ? wdata_high : n1077_o;
  /* ni/rx_unit.vhd:128:33  */
  assign n1084_o = n1074_o ? 1'b1 : 1'b0;
  /* ni/rx_unit.vhd:128:33  */
  assign n1087_o = n1074_o ? 3'b001 : 3'b000;
  /* ni/rx_unit.vhd:126:25  */
  assign n1089_o = state == 3'b010;
  /* ni/rx_unit.vhd:143:43  */
  assign n1092_o = pkt_in[32];
  /* ni/rx_unit.vhd:143:60  */
  assign n1093_o = ~n1092_o;
  /* ni/rx_unit.vhd:143:33  */
  assign n1096_o = n1093_o ? 3'b010 : 3'b000;
  /* ni/rx_unit.vhd:138:25  */
  assign n1098_o = state == 3'b001;
  /* ni/rx_unit.vhd:153:43  */
  assign n1101_o = pkt_in[32];
  /* ni/rx_unit.vhd:153:60  */
  assign n1102_o = ~n1101_o;
  /* ni/rx_unit.vhd:153:33  */
  assign n1105_o = n1102_o ? 3'b011 : 3'b000;
  /* ni/rx_unit.vhd:150:25  */
  assign n1107_o = state == 3'b100;
  /* ni/rx_unit.vhd:159:25  */
  assign n1111_o = state == 3'b011;
  /* ni/rx_unit.vhd:169:99  */
  assign n1114_o = pkt_in[31:0];
  /* ni/rx_unit.vhd:165:25  */
  assign n1116_o = state == 3'b101;
  assign n1117_o = {n1116_o, n1111_o, n1107_o, n1098_o, n1089_o, n1070_o};
  assign n1118_o = n1090_o[0];
  assign n1119_o = n1056_o[0];
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1117_o)
      6'b100000: n1121_o <= 1'b1;
      6'b010000: n1121_o <= n1119_o;
      6'b001000: n1121_o <= n1119_o;
      6'b000100: n1121_o <= n1118_o;
      6'b000010: n1121_o <= n1079_o;
      6'b000001: n1121_o <= n1119_o;
      default: n1121_o <= 1'bX;
    endcase
  assign n1122_o = n1090_o[1];
  assign n1123_o = n1056_o[1];
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1117_o)
      6'b100000: n1125_o <= n1123_o;
      6'b010000: n1125_o <= n1123_o;
      6'b001000: n1125_o <= n1123_o;
      6'b000100: n1125_o <= n1122_o;
      6'b000010: n1125_o <= n1123_o;
      6'b000001: n1125_o <= n1123_o;
      default: n1125_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1117_o)
      6'b100000: n1127_o <= 1'b1;
      6'b010000: n1127_o <= 1'b0;
      6'b001000: n1127_o <= 1'b0;
      6'b000100: n1127_o <= 1'b1;
      6'b000010: n1127_o <= n1080_o;
      6'b000001: n1127_o <= 1'b0;
      default: n1127_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1117_o)
      6'b100000: n1129_o <= n1114_o;
      6'b010000: n1129_o <= wdata_high;
      6'b001000: n1129_o <= wdata_high;
      6'b000100: n1129_o <= wdata_high;
      6'b000010: n1129_o <= n1081_o;
      6'b000001: n1129_o <= wdata_high;
      default: n1129_o <= 32'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1117_o)
      6'b100000: n1132_o <= 1'b0;
      6'b010000: n1132_o <= 1'b1;
      6'b001000: n1132_o <= 1'b1;
      6'b000100: n1132_o <= 1'b0;
      6'b000010: n1132_o <= 1'b0;
      6'b000001: n1132_o <= 1'b0;
      default: n1132_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1117_o)
      6'b100000: n1134_o <= 1'b0;
      6'b010000: n1134_o <= 1'b1;
      6'b001000: n1134_o <= 1'b1;
      6'b000100: n1134_o <= 1'b0;
      6'b000010: n1134_o <= 1'b0;
      6'b000001: n1134_o <= 1'b0;
      default: n1134_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1117_o)
      6'b100000: n1136_o <= addr;
      6'b010000: n1136_o <= addr;
      6'b001000: n1136_o <= addr;
      6'b000100: n1136_o <= int_addr;
      6'b000010: n1136_o <= addr;
      6'b000001: n1136_o <= addr;
      default: n1136_o <= 14'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1117_o)
      6'b100000: n1140_o <= 1'b1;
      6'b010000: n1140_o <= 1'b0;
      6'b001000: n1140_o <= 1'b0;
      6'b000100: n1140_o <= 1'b0;
      6'b000010: n1140_o <= 1'b0;
      6'b000001: n1140_o <= 1'b0;
      default: n1140_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1117_o)
      6'b100000: n1144_o <= 1'b0;
      6'b010000: n1144_o <= 1'b0;
      6'b001000: n1144_o <= 1'b0;
      6'b000100: n1144_o <= 1'b0;
      6'b000010: n1144_o <= n1084_o;
      6'b000001: n1144_o <= 1'b0;
      default: n1144_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1117_o)
      6'b100000: n1149_o <= 1'b0;
      6'b010000: n1149_o <= 1'b0;
      6'b001000: n1149_o <= 1'b0;
      6'b000100: n1149_o <= 1'b0;
      6'b000010: n1149_o <= 1'b0;
      6'b000001: n1149_o <= 1'b1;
      default: n1149_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1117_o)
      6'b100000: n1152_o <= addr;
      6'b010000: n1152_o <= addr;
      6'b001000: n1152_o <= addr;
      6'b000100: n1152_o <= next_int_addr;
      6'b000010: n1152_o <= addr;
      6'b000001: n1152_o <= addr;
      default: n1152_o <= 14'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1117_o)
      6'b100000: n1154_o <= n1061_o;
      6'b010000: n1154_o <= n1061_o;
      6'b001000: n1154_o <= n1061_o;
      6'b000100: n1154_o <= n1061_o;
      6'b000010: n1154_o <= n1072_o;
      6'b000001: n1154_o <= n1062_o;
      default: n1154_o <= 14'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1117_o)
      6'b100000: n1158_o <= 3'b000;
      6'b010000: n1158_o <= 3'b000;
      6'b001000: n1158_o <= n1105_o;
      6'b000100: n1158_o <= n1096_o;
      6'b000010: n1158_o <= n1087_o;
      6'b000001: n1158_o <= n1068_o;
      default: n1158_o <= 3'bX;
    endcase
  /* ni/rx_unit.vhd:180:56  */
  assign n1164_o = pkt_in[29:16];
  /* ni/rx_unit.vhd:179:25  */
  assign n1165_o = addr_load ? n1164_o : next_addr;
  /* ni/rx_unit.vhd:178:17  */
  always @(posedge clk)
    n1168_q <= n1165_o;
  /* ni/rx_unit.vhd:192:62  */
  assign n1172_o = pkt_in[31:0];
  /* ni/rx_unit.vhd:190:17  */
  assign n1176_o = wdata_high_en ? n1172_o : wdata_high;
  /* ni/rx_unit.vhd:190:17  */
  always @(posedge clk)
    n1177_q <= n1176_o;
  /* ni/rx_unit.vhd:201:25  */
  assign n1182_o = reset ? 14'b00000000000000 : next_int_addr;
  /* ni/rx_unit.vhd:201:25  */
  assign n1184_o = reset ? 3'b000 : next_state;
  /* ni/rx_unit.vhd:200:17  */
  always @(posedge clk)
    n1188_q <= n1182_o;
  /* ni/rx_unit.vhd:200:17  */
  always @(posedge clk)
    n1189_q <= n1184_o;
  /* ni/rx_unit.vhd:217:77  */
  assign n1193_o = pkt_in[31];
  /* ni/rx_unit.vhd:217:67  */
  assign n1194_o = new_data_pkt & n1193_o;
  /* ni/rx_unit.vhd:217:49  */
  assign n1195_o = ~n1194_o;
  /* ni/rx_unit.vhd:217:135  */
  assign n1196_o = pkt_in[32];
  /* ni/rx_unit.vhd:217:125  */
  assign n1197_o = n1195_o & n1196_o;
  /* ni/rx_unit.vhd:217:43  */
  assign n1198_o = reset | n1197_o;
  /* ni/rx_unit.vhd:219:56  */
  assign n1199_o = pkt_in[31];
  /* ni/rx_unit.vhd:219:46  */
  assign n1200_o = new_data_pkt & n1199_o;
  /* ni/rx_unit.vhd:219:25  */
  assign n1202_o = n1200_o ? 1'b1 : lst_data_pkt;
  /* ni/rx_unit.vhd:217:25  */
  assign n1204_o = n1198_o ? 1'b0 : n1202_o;
  /* ni/rx_unit.vhd:216:17  */
  always @(posedge clk)
    n1207_q <= n1204_o;
  /* ni/rx_unit.vhd:216:17  */
  assign n1208_o = {n1129_o, n1050_o, n1127_o, n1125_o, n1121_o, addr};
  assign n1209_o = {n1051_o, n1134_o, n1132_o, int_addr};
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
  wire [47:0] n662_o;
  wire [31:0] n664_o;
  wire n665_o;
  wire [13:0] n667_o;
  wire [1:0] n668_o;
  wire n669_o;
  wire [63:0] n670_o;
  wire [64:0] n671_o;
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
  wire [13:0] n679_o;
  wire [3:0] n680_o;
  wire [1:0] n681_o;
  wire n683_o;
  wire [1:0] n685_o;
  wire [4:0] n687_o;
  wire [7:0] n689_o;
  wire [18:0] n691_o;
  wire [34:0] n692_o;
  wire n693_o;
  wire [13:0] n695_o;
  wire [13:0] n696_o;
  wire [13:0] n697_o;
  wire [13:0] n699_o;
  wire [13:0] n700_o;
  wire [13:0] n701_o;
  wire n702_o;
  wire [1:0] n703_o;
  wire n705_o;
  wire [1:0] n707_o;
  wire n709_o;
  wire n710_o;
  wire [13:0] n711_o;
  wire [13:0] n712_o;
  wire [13:0] n713_o;
  wire [13:0] n714_o;
  wire [13:0] n715_o;
  wire [13:0] n716_o;
  wire [13:0] n717_o;
  wire [13:0] n718_o;
  wire [13:0] n719_o;
  wire [1:0] n720_o;
  wire n722_o;
  wire [3:0] n723_o;
  wire [3:0] n724_o;
  wire [3:0] n725_o;
  wire [9:0] n726_o;
  wire [3:0] n728_o;
  wire [4:0] n730_o;
  wire [13:0] n731_o;
  wire [18:0] n732_o;
  wire [34:0] n733_o;
  wire [15:0] n734_o;
  wire [15:0] n735_o;
  wire [15:0] n736_o;
  wire [34:0] n738_o;
  wire [2:0] n740_o;
  wire [13:0] n741_o;
  wire n742_o;
  wire [13:0] n743_o;
  wire n746_o;
  wire [13:0] n747_o;
  wire [28:0] n748_o;
  wire [13:0] n749_o;
  wire [13:0] n750_o;
  wire [27:0] n751_o;
  wire [28:0] n752_o;
  wire [28:0] n753_o;
  wire [3:0] n754_o;
  wire [15:0] n755_o;
  wire [15:0] n756_o;
  wire [34:0] n757_o;
  wire [2:0] n759_o;
  wire [13:0] n760_o;
  wire [1:0] n761_o;
  wire [13:0] n762_o;
  wire n764_o;
  wire [13:0] n765_o;
  wire [13:0] n766_o;
  wire [27:0] n767_o;
  wire [28:0] n768_o;
  wire [28:0] n769_o;
  wire [3:0] n770_o;
  wire [1:0] n772_o;
  wire [1:0] n774_o;
  wire [15:0] n775_o;
  wire [15:0] n776_o;
  wire [34:0] n778_o;
  wire [2:0] n779_o;
  wire [13:0] n780_o;
  wire [1:0] n781_o;
  wire [13:0] n782_o;
  wire n784_o;
  wire [13:0] n785_o;
  wire [13:0] n786_o;
  wire [27:0] n787_o;
  wire [28:0] n788_o;
  wire [28:0] n789_o;
  wire [3:0] n790_o;
  wire [1:0] n792_o;
  wire [1:0] n794_o;
  wire n796_o;
  wire [31:0] n797_o;
  wire [3:0] n799_o;
  wire [13:0] n801_o;
  wire n803_o;
  wire n805_o;
  wire n806_o;
  wire [31:0] n807_o;
  wire [34:0] n809_o;
  wire [13:0] n811_o;
  wire [31:0] n812_o;
  wire [34:0] n814_o;
  wire [34:0] n815_o;
  wire [2:0] n818_o;
  wire [13:0] n819_o;
  wire n821_o;
  wire [3:0] n823_o;
  wire [13:0] n825_o;
  wire n827_o;
  wire n829_o;
  wire n830_o;
  wire [34:0] n832_o;
  wire [13:0] n835_o;
  wire [34:0] n837_o;
  wire [15:0] n838_o;
  wire [15:0] n839_o;
  wire [15:0] n840_o;
  wire [34:0] n841_o;
  wire [2:0] n844_o;
  wire [13:0] n845_o;
  wire n847_o;
  wire [34:0] n849_o;
  wire n851_o;
  wire [34:0] n853_o;
  wire n855_o;
  wire [4:0] n856_o;
  wire [15:0] n857_o;
  reg [15:0] n859_o;
  reg [34:0] n861_o;
  reg [2:0] n866_o;
  reg [13:0] n868_o;
  reg [1:0] n870_o;
  reg [13:0] n872_o;
  reg n875_o;
  wire [13:0] n877_o;
  reg [13:0] n879_o;
  wire [27:0] n880_o;
  wire [28:0] n881_o;
  reg [28:0] n883_o;
  wire [1:0] n885_o;
  reg [3:0] n887_o;
  wire [1:0] n888_o;
  reg [1:0] n891_o;
  wire [13:0] n892_o;
  reg [13:0] n895_o;
  wire [1:0] n896_o;
  reg [1:0] n899_o;
  wire [13:0] n900_o;
  reg [13:0] n903_o;
  wire [5:0] n910_o;
  localparam [31:0] n911_o = 32'b00000000000000000000000000000000;
  wire n912_o;
  wire [27:0] n913_o;
  wire [15:0] n914_o;
  wire n915_o;
  wire n916_o;
  wire n917_o;
  wire n918_o;
  wire n919_o;
  wire n920_o;
  wire n921_o;
  wire n923_o;
  wire n925_o;
  wire n928_o;
  wire n930_o;
  wire n931_o;
  wire [27:0] n932_o;
  wire [15:0] n933_o;
  wire [15:0] n934_o;
  wire [15:0] n935_o;
  wire [11:0] n936_o;
  wire [11:0] n937_o;
  wire [11:0] n938_o;
  wire n939_o;
  wire n940_o;
  wire [2:0] n943_o;
  wire n947_o;
  wire [5:0] n948_o;
  wire [28:0] dmatbl1_a_dout;
  wire [28:0] dmatbl1_b_dout;
  wire [28:0] n950_o;
  wire [28:0] n952_o;
  wire [15:0] dmatbl2_a_dout;
  wire [15:0] dmatbl2_b_dout;
  wire [15:0] n954_o;
  wire [15:0] n956_o;
  wire [3:0] n959_o;
  wire n961_o;
  wire n962_o;
  wire n965_o;
  wire n971_o;
  reg n974_q;
  wire n978_o;
  reg n981_q;
  wire n985_o;
  reg n989_q;
  wire [2:0] n993_o;
  reg [2:0] n996_q;
  reg [13:0] n1006_q;
  reg [13:0] n1007_q;
  reg [5:0] n1008_q;
  reg [3:0] n1009_q;
  reg [15:0] n1010_q;
  reg [31:0] n1011_q;
  wire [44:0] n1012_o;
  wire [44:0] n1013_o;
  wire [44:0] n1014_o;
  wire [44:0] n1015_o;
  wire [31:0] n1016_o;
  wire [32:0] n1017_o;
  wire [80:0] n1018_o;
  assign config_slv_rdata = n664_o;
  assign config_slv_error = n665_o;
  assign spm_addr = n667_o;
  assign spm_en = n668_o;
  assign spm_wr = n669_o;
  assign spm_wdata = n670_o;
  assign pkt_out = n861_o;
  /* ni/schedule_table.vhd:103:16  */
  assign n662_o = {config_wdata, config_wr, config_en, config_addr};
  /* ni/schedule_table.vhd:59:5  */
  assign n664_o = n1017_o[31:0];
  /* ni/schedule_table.vhd:58:5  */
  assign n665_o = n1017_o[32];
  /* ni/schedule_table.vhd:56:5  */
  assign n667_o = n1018_o[13:0];
  /* ni/schedule_table.vhd:51:5  */
  assign n668_o = n1018_o[15:14];
  assign n669_o = n1018_o[16];
  assign n670_o = n1018_o[80:17];
  /* ni/schedule_table.vhd:190:1  */
  assign n671_o = {spm_slv_error, spm_slv_rdata};
  /* ni/packet_manager.vhd:78:8  */
  assign state = n996_q; // (signal)
  /* ni/packet_manager.vhd:78:15  */
  assign next_state = n866_o; // (signal)
  /* ni/packet_manager.vhd:83:8  */
  assign dmatbl_data = port_b_dout; // (signal)
  /* ni/packet_manager.vhd:94:8  */
  assign count_reg = n1006_q; // (signal)
  /* ni/packet_manager.vhd:94:19  */
  assign count_next = n868_o; // (signal)
  /* ni/packet_manager.vhd:101:8  */
  assign pkt_type = n870_o; // (signal)
  /* ni/packet_manager.vhd:103:8  */
  assign dma_en_reg = n974_q; // (signal)
  /* ni/packet_manager.vhd:105:8  */
  assign read_ptr_reg = n1007_q; // (signal)
  /* ni/packet_manager.vhd:105:22  */
  assign read_ptr_next = n872_o; // (signal)
  /* ni/packet_manager.vhd:107:8  */
  assign hi_lo_next = n930_o; // (signal)
  /* ni/packet_manager.vhd:108:8  */
  assign hi_lo_reg = n981_q; // (signal)
  /* ni/packet_manager.vhd:110:8  */
  assign port_b_wr = n947_o; // (signal)
  /* ni/packet_manager.vhd:111:8  */
  assign port_b_addr = n948_o; // (signal)
  /* ni/packet_manager.vhd:112:8  */
  assign port_b_din = dma_update_data; // (signal)
  /* ni/packet_manager.vhd:113:8  */
  assign port_b_dout = n1012_o; // (signal)
  /* ni/packet_manager.vhd:115:8  */
  assign dma_num_reg = n1008_q; // (signal)
  /* ni/packet_manager.vhd:116:8  */
  assign dma_update_en = n875_o; // (signal)
  /* ni/packet_manager.vhd:117:8  */
  assign dma_update_addr = dma_num_reg; // (signal)
  /* ni/packet_manager.vhd:118:8  */
  assign dma_update_data = n1013_o; // (signal)
  /* ni/packet_manager.vhd:131:8  */
  assign port_a_wr_hi = n925_o; // (signal)
  /* ni/packet_manager.vhd:132:8  */
  assign port_a_wr_lo = n928_o; // (signal)
  /* ni/packet_manager.vhd:133:8  */
  assign port_a_addr = n910_o; // (signal)
  /* ni/packet_manager.vhd:134:8  */
  assign port_a_din = n1014_o; // (signal)
  /* ni/packet_manager.vhd:135:8  */
  assign port_a_dout = n1015_o; // (signal)
  /* ni/packet_manager.vhd:137:8  */
  assign config_slv_error_next = n965_o; // (signal)
  /* ni/packet_manager.vhd:139:8  */
  assign pkt_len_reg = n1009_q; // (signal)
  /* ni/packet_manager.vhd:139:21  */
  assign pkt_len_next = n887_o; // (signal)
  /* ni/packet_manager.vhd:141:8  */
  assign route_reg = n1010_q; // (signal)
  /* ni/packet_manager.vhd:147:8  */
  assign payload_data = n1011_q; // (signal)
  /* ni/packet_manager.vhd:147:22  */
  assign payload_data_next = n1016_o; // (signal)
  assign n679_o = dmatbl_data[29:16];
  /* ni/packet_manager.vhd:167:3  */
  assign n680_o = dma_en ? pkt_len : pkt_len_reg;
  assign n681_o = dmatbl_data[15:14];
  /* ni/packet_manager.vhd:179:26  */
  assign n683_o = $unsigned(pkt_len_reg) >= $unsigned(4'b0001);
  /* ni/packet_manager.vhd:179:11  */
  assign n685_o = n683_o ? 2'b01 : n681_o;
  /* ni/packet_manager.vhd:182:49  */
  assign n687_o = {3'b110, pkt_type};
  /* ni/packet_manager.vhd:182:60  */
  assign n689_o = {n687_o, 3'b011};
  /* ni/packet_manager.vhd:182:70  */
  assign n691_o = {n689_o, 11'b00000000000};
  /* ni/packet_manager.vhd:182:103  */
  assign n692_o = {n691_o, route_reg};
  assign n693_o = dmatbl_data[44];
  assign n695_o = dmatbl_data[29:16];
  assign n696_o = dmatbl_data[29:16];
  assign n697_o = dmatbl_data[43:30];
  /* ni/packet_manager.vhd:191:30  */
  assign n699_o = n697_o - 14'b00000000000001;
  assign n700_o = dmatbl_data[43:30];
  /* ni/packet_manager.vhd:192:20  */
  assign n701_o = {10'b0, pkt_len_reg};  //  uext
  /* ni/packet_manager.vhd:192:20  */
  assign n702_o = $unsigned(n700_o) > $unsigned(n701_o);
  assign n703_o = dmatbl_data[15:14];
  /* ni/packet_manager.vhd:193:29  */
  assign n705_o = n703_o == 2'b10;
  /* ni/packet_manager.vhd:185:9  */
  assign n707_o = n742_o ? 2'b00 : n681_o;
  /* ni/packet_manager.vhd:192:11  */
  assign n709_o = n702_o & n705_o;
  /* ni/packet_manager.vhd:192:11  */
  assign n710_o = n702_o ? 1'b1 : 1'b0;
  /* ni/packet_manager.vhd:199:43  */
  assign n711_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:199:68  */
  assign n712_o = {10'b0, pkt_len_reg};  //  uext
  /* ni/packet_manager.vhd:199:68  */
  assign n713_o = n711_o + n712_o;
  assign n714_o = dmatbl_data[29:16];
  /* ni/packet_manager.vhd:200:39  */
  assign n715_o = {10'b0, pkt_len_reg};  //  uext
  /* ni/packet_manager.vhd:200:39  */
  assign n716_o = n714_o + n715_o;
  assign n717_o = dmatbl_data[43:30];
  /* ni/packet_manager.vhd:201:33  */
  assign n718_o = {10'b0, pkt_len_reg};  //  uext
  /* ni/packet_manager.vhd:201:33  */
  assign n719_o = n717_o - n718_o;
  assign n720_o = dmatbl_data[15:14];
  /* ni/packet_manager.vhd:202:27  */
  assign n722_o = n720_o == 2'b01;
  /* ni/packet_manager.vhd:205:43  */
  assign n723_o = dmatbl_data[13:10];
  assign n724_o = n713_o[13:10];
  /* ni/packet_manager.vhd:202:11  */
  assign n725_o = n722_o ? n723_o : n724_o;
  assign n726_o = n713_o[9:0];
  /* ni/packet_manager.vhd:207:39  */
  assign n728_o = pkt_len_reg - 4'b0001;
  /* ni/packet_manager.vhd:208:49  */
  assign n730_o = {3'b110, pkt_type};
  /* ni/packet_manager.vhd:208:68  */
  assign n731_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:208:60  */
  assign n732_o = {n730_o, n731_o};
  /* ni/packet_manager.vhd:208:93  */
  assign n733_o = {n732_o, route_reg};
  assign n734_o = {2'b11, n695_o};
  assign n735_o = {2'b00, n679_o};
  /* ni/packet_manager.vhd:185:9  */
  assign n736_o = n693_o ? n734_o : n735_o;
  /* ni/packet_manager.vhd:185:9  */
  assign n738_o = n693_o ? n733_o : 35'b00000000000000000000000000000000000;
  /* ni/packet_manager.vhd:185:9  */
  assign n740_o = n693_o ? 3'b001 : state;
  /* ni/packet_manager.vhd:185:9  */
  assign n741_o = n693_o ? n699_o : count_reg;
  /* ni/packet_manager.vhd:185:9  */
  assign n742_o = n693_o & n709_o;
  /* ni/packet_manager.vhd:185:9  */
  assign n743_o = n693_o ? n696_o : read_ptr_reg;
  /* ni/packet_manager.vhd:185:9  */
  assign n746_o = n693_o ? 1'b1 : 1'b0;
  assign n747_o = {n725_o, n726_o};
  assign n748_o = {n710_o, n719_o, n716_o};
  assign n749_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:185:9  */
  assign n750_o = n693_o ? n747_o : n749_o;
  assign n751_o = dmatbl_data[43:16];
  assign n752_o = {1'b0, n751_o};
  /* ni/packet_manager.vhd:185:9  */
  assign n753_o = n693_o ? n748_o : n752_o;
  /* ni/packet_manager.vhd:185:9  */
  assign n754_o = n693_o ? n728_o : n680_o;
  assign n755_o = {2'b00, n679_o};
  /* ni/packet_manager.vhd:177:9  */
  assign n756_o = mc ? n755_o : n736_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n757_o = mc ? n692_o : n738_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n759_o = mc ? 3'b011 : n740_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n760_o = mc ? count_reg : n741_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n761_o = mc ? n685_o : n707_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n762_o = mc ? read_ptr_reg : n743_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n764_o = mc ? 1'b0 : n746_o;
  assign n765_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:177:9  */
  assign n766_o = mc ? n765_o : n750_o;
  assign n767_o = dmatbl_data[43:16];
  assign n768_o = {1'b0, n767_o};
  /* ni/packet_manager.vhd:177:9  */
  assign n769_o = mc ? n768_o : n753_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n770_o = mc ? n680_o : n754_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n772_o = mc ? mc_idx : 2'b00;
  /* ni/packet_manager.vhd:177:9  */
  assign n774_o = mc ? mc_p : 2'b00;
  assign n775_o = {2'b00, n679_o};
  /* ni/packet_manager.vhd:176:7  */
  assign n776_o = dma_en_reg ? n756_o : n775_o;
  /* ni/packet_manager.vhd:176:7  */
  assign n778_o = dma_en_reg ? n757_o : 35'b00000000000000000000000000000000000;
  /* ni/packet_manager.vhd:176:7  */
  assign n779_o = dma_en_reg ? n759_o : state;
  /* ni/packet_manager.vhd:176:7  */
  assign n780_o = dma_en_reg ? n760_o : count_reg;
  /* ni/packet_manager.vhd:176:7  */
  assign n781_o = dma_en_reg ? n761_o : n681_o;
  /* ni/packet_manager.vhd:176:7  */
  assign n782_o = dma_en_reg ? n762_o : read_ptr_reg;
  /* ni/packet_manager.vhd:176:7  */
  assign n784_o = dma_en_reg ? n764_o : 1'b0;
  assign n785_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:176:7  */
  assign n786_o = dma_en_reg ? n766_o : n785_o;
  assign n787_o = dmatbl_data[43:16];
  assign n788_o = {1'b0, n787_o};
  /* ni/packet_manager.vhd:176:7  */
  assign n789_o = dma_en_reg ? n769_o : n788_o;
  /* ni/packet_manager.vhd:176:7  */
  assign n790_o = dma_en_reg ? n770_o : n680_o;
  /* ni/packet_manager.vhd:176:7  */
  assign n792_o = dma_en_reg ? n772_o : 2'b00;
  /* ni/packet_manager.vhd:176:7  */
  assign n794_o = dma_en_reg ? n774_o : 2'b00;
  /* ni/packet_manager.vhd:175:5  */
  assign n796_o = state == 3'b000;
  /* ni/packet_manager.vhd:213:41  */
  assign n797_o = n671_o[31:0];
  /* ni/packet_manager.vhd:214:35  */
  assign n799_o = pkt_len_reg - 4'b0001;
  /* ni/packet_manager.vhd:215:31  */
  assign n801_o = count_reg - 14'b00000000000001;
  /* ni/packet_manager.vhd:216:22  */
  assign n803_o = $unsigned(pkt_len_reg) > $unsigned(4'b0000);
  /* ni/packet_manager.vhd:216:40  */
  assign n805_o = $unsigned(count_reg) > $unsigned(14'b00000000000000);
  /* ni/packet_manager.vhd:216:26  */
  assign n806_o = n803_o & n805_o;
  /* ni/packet_manager.vhd:218:58  */
  assign n807_o = n671_o[63:32];
  /* ni/packet_manager.vhd:218:43  */
  assign n809_o = {3'b100, n807_o};
  /* ni/packet_manager.vhd:219:39  */
  assign n811_o = read_ptr_reg + 14'b00000000000001;
  /* ni/packet_manager.vhd:222:62  */
  assign n812_o = n671_o[63:32];
  /* ni/packet_manager.vhd:222:47  */
  assign n814_o = {3'b101, n812_o};
  /* ni/packet_manager.vhd:216:7  */
  assign n815_o = n806_o ? n809_o : n814_o;
  /* ni/packet_manager.vhd:216:7  */
  assign n818_o = n806_o ? 3'b010 : 3'b000;
  /* ni/packet_manager.vhd:216:7  */
  assign n819_o = n806_o ? n811_o : read_ptr_reg;
  /* ni/packet_manager.vhd:212:5  */
  assign n821_o = state == 3'b001;
  /* ni/packet_manager.vhd:226:35  */
  assign n823_o = pkt_len_reg - 4'b0001;
  /* ni/packet_manager.vhd:227:31  */
  assign n825_o = count_reg - 14'b00000000000001;
  /* ni/packet_manager.vhd:228:22  */
  assign n827_o = $unsigned(pkt_len_reg) > $unsigned(4'b0000);
  /* ni/packet_manager.vhd:228:40  */
  assign n829_o = $unsigned(count_reg) > $unsigned(14'b00000000000000);
  /* ni/packet_manager.vhd:228:26  */
  assign n830_o = n827_o & n829_o;
  /* ni/packet_manager.vhd:230:43  */
  assign n832_o = {3'b100, payload_data};
  /* ni/packet_manager.vhd:232:39  */
  assign n835_o = read_ptr_reg + 14'b00000000000001;
  /* ni/packet_manager.vhd:238:47  */
  assign n837_o = {3'b101, payload_data};
  assign n838_o = {2'b11, read_ptr_next};
  assign n839_o = {2'b00, n679_o};
  /* ni/packet_manager.vhd:228:7  */
  assign n840_o = n830_o ? n838_o : n839_o;
  /* ni/packet_manager.vhd:228:7  */
  assign n841_o = n830_o ? n832_o : n837_o;
  /* ni/packet_manager.vhd:228:7  */
  assign n844_o = n830_o ? 3'b001 : 3'b000;
  /* ni/packet_manager.vhd:228:7  */
  assign n845_o = n830_o ? n835_o : read_ptr_reg;
  /* ni/packet_manager.vhd:225:5  */
  assign n847_o = state == 3'b010;
  /* ni/packet_manager.vhd:243:41  */
  assign n849_o = {3'b100, payload_data};
  /* ni/packet_manager.vhd:241:5  */
  assign n851_o = state == 3'b011;
  /* ni/packet_manager.vhd:247:45  */
  assign n853_o = {3'b101, payload_data};
  /* ni/packet_manager.vhd:245:5  */
  assign n855_o = state == 3'b100;
  assign n856_o = {n855_o, n851_o, n847_o, n821_o, n796_o};
  assign n857_o = {2'b00, n679_o};
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n856_o)
      5'b10000: n859_o <= n857_o;
      5'b01000: n859_o <= n857_o;
      5'b00100: n859_o <= n840_o;
      5'b00010: n859_o <= n857_o;
      5'b00001: n859_o <= n776_o;
      default: n859_o <= 16'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n856_o)
      5'b10000: n861_o <= n853_o;
      5'b01000: n861_o <= n849_o;
      5'b00100: n861_o <= n841_o;
      5'b00010: n861_o <= n815_o;
      5'b00001: n861_o <= n778_o;
      default: n861_o <= 35'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n856_o)
      5'b10000: n866_o <= 3'b000;
      5'b01000: n866_o <= 3'b100;
      5'b00100: n866_o <= n844_o;
      5'b00010: n866_o <= n818_o;
      5'b00001: n866_o <= n779_o;
      default: n866_o <= 3'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n856_o)
      5'b10000: n868_o <= count_reg;
      5'b01000: n868_o <= count_reg;
      5'b00100: n868_o <= n825_o;
      5'b00010: n868_o <= n801_o;
      5'b00001: n868_o <= n780_o;
      default: n868_o <= 14'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n856_o)
      5'b10000: n870_o <= n681_o;
      5'b01000: n870_o <= n681_o;
      5'b00100: n870_o <= n681_o;
      5'b00010: n870_o <= n681_o;
      5'b00001: n870_o <= n781_o;
      default: n870_o <= 2'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n856_o)
      5'b10000: n872_o <= read_ptr_reg;
      5'b01000: n872_o <= read_ptr_reg;
      5'b00100: n872_o <= n845_o;
      5'b00010: n872_o <= n819_o;
      5'b00001: n872_o <= n782_o;
      default: n872_o <= 14'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n856_o)
      5'b10000: n875_o <= 1'b0;
      5'b01000: n875_o <= 1'b0;
      5'b00100: n875_o <= 1'b0;
      5'b00010: n875_o <= 1'b0;
      5'b00001: n875_o <= n784_o;
      default: n875_o <= 1'bX;
    endcase
  assign n877_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n856_o)
      5'b10000: n879_o <= n877_o;
      5'b01000: n879_o <= n877_o;
      5'b00100: n879_o <= n877_o;
      5'b00010: n879_o <= n877_o;
      5'b00001: n879_o <= n786_o;
      default: n879_o <= 14'bX;
    endcase
  assign n880_o = dmatbl_data[43:16];
  assign n881_o = {1'b0, n880_o};
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n856_o)
      5'b10000: n883_o <= n881_o;
      5'b01000: n883_o <= n881_o;
      5'b00100: n883_o <= n881_o;
      5'b00010: n883_o <= n881_o;
      5'b00001: n883_o <= n789_o;
      default: n883_o <= 29'bX;
    endcase
  assign n885_o = dmatbl_data[15:14];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n856_o)
      5'b10000: n887_o <= n680_o;
      5'b01000: n887_o <= n680_o;
      5'b00100: n887_o <= n823_o;
      5'b00010: n887_o <= n799_o;
      5'b00001: n887_o <= n790_o;
      default: n887_o <= 4'bX;
    endcase
  assign n888_o = n797_o[1:0];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n856_o)
      5'b10000: n891_o <= 2'b00;
      5'b01000: n891_o <= 2'b00;
      5'b00100: n891_o <= 2'b00;
      5'b00010: n891_o <= n888_o;
      5'b00001: n891_o <= n792_o;
      default: n891_o <= 2'bX;
    endcase
  assign n892_o = n797_o[15:2];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n856_o)
      5'b10000: n895_o <= 14'b00000000000000;
      5'b01000: n895_o <= 14'b00000000000000;
      5'b00100: n895_o <= 14'b00000000000000;
      5'b00010: n895_o <= n892_o;
      5'b00001: n895_o <= 14'b00000000000000;
      default: n895_o <= 14'bX;
    endcase
  assign n896_o = n797_o[17:16];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n856_o)
      5'b10000: n899_o <= 2'b00;
      5'b01000: n899_o <= 2'b00;
      5'b00100: n899_o <= 2'b00;
      5'b00010: n899_o <= n896_o;
      5'b00001: n899_o <= n794_o;
      default: n899_o <= 2'bX;
    endcase
  assign n900_o = n797_o[31:18];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n856_o)
      5'b10000: n903_o <= 14'b00000000000000;
      5'b01000: n903_o <= 14'b00000000000000;
      5'b00100: n903_o <= 14'b00000000000000;
      5'b00010: n903_o <= n900_o;
      5'b00001: n903_o <= 14'b00000000000000;
      default: n903_o <= 14'bX;
    endcase
  /* ni/packet_manager.vhd:256:29  */
  assign n910_o = n662_o[6:1];
  /* ni/packet_manager.vhd:259:52  */
  assign n912_o = n662_o[47];
  /* ni/packet_manager.vhd:262:26  */
  assign n913_o = n662_o[43:16];
  /* ni/packet_manager.vhd:264:48  */
  assign n914_o = n662_o[31:16];
  /* ni/packet_manager.vhd:266:17  */
  assign n915_o = n662_o[0];
  /* ni/packet_manager.vhd:272:28  */
  assign n916_o = n662_o[15];
  /* ni/packet_manager.vhd:272:31  */
  assign n917_o = n916_o & sel;
  /* ni/packet_manager.vhd:273:20  */
  assign n918_o = n662_o[0];
  /* ni/packet_manager.vhd:273:24  */
  assign n919_o = ~n918_o;
  /* ni/packet_manager.vhd:277:28  */
  assign n920_o = n662_o[15];
  /* ni/packet_manager.vhd:277:31  */
  assign n921_o = n920_o & sel;
  /* ni/packet_manager.vhd:273:3  */
  assign n923_o = n919_o ? n921_o : 1'b0;
  /* ni/packet_manager.vhd:266:3  */
  assign n925_o = n915_o ? n917_o : 1'b0;
  /* ni/packet_manager.vhd:266:3  */
  assign n928_o = n915_o ? 1'b0 : n923_o;
  /* ni/packet_manager.vhd:280:28  */
  assign n930_o = n662_o[0];
  /* ni/packet_manager.vhd:282:50  */
  assign n931_o = port_a_dout[44];
  /* ni/packet_manager.vhd:284:32  */
  assign n932_o = port_a_dout[43:16];
  /* ni/packet_manager.vhd:287:48  */
  assign n933_o = port_a_dout[15:0];
  assign n934_o = n932_o[15:0];
  /* ni/packet_manager.vhd:281:3  */
  assign n935_o = hi_lo_reg ? n934_o : n933_o;
  assign n936_o = n932_o[27:16];
  assign n937_o = n911_o[27:16];
  /* ni/packet_manager.vhd:281:3  */
  assign n938_o = hi_lo_reg ? n936_o : n937_o;
  assign n939_o = n911_o[31];
  /* ni/packet_manager.vhd:281:3  */
  assign n940_o = hi_lo_reg ? n931_o : n939_o;
  assign n943_o = n911_o[30:28];
  /* ni/packet_manager.vhd:297:3  */
  assign n947_o = dma_en ? 1'b0 : dma_update_en;
  /* ni/packet_manager.vhd:297:3  */
  assign n948_o = dma_en ? dma_num : dma_update_addr;
  /* ni/packet_manager.vhd:308:1  */
  tdp_ram_29_6 dmatbl1 (
    .a_clk(clk),
    .a_wr(port_a_wr_hi),
    .a_addr(port_a_addr),
    .a_din(n950_o),
    .b_clk(clk),
    .b_wr(port_b_wr),
    .b_addr(port_b_addr),
    .b_din(n952_o),
    .a_dout(dmatbl1_a_dout),
    .b_dout(dmatbl1_b_dout));
  /* ni/packet_manager.vhd:317:26  */
  assign n950_o = port_a_din[44:16];
  /* ni/packet_manager.vhd:322:26  */
  assign n952_o = port_b_din[44:16];
  /* ni/packet_manager.vhd:327:3  */
  tdp_ram_16_6 dmatbl2 (
    .a_clk(clk),
    .a_wr(port_a_wr_lo),
    .a_addr(port_a_addr),
    .a_din(n954_o),
    .b_clk(clk),
    .b_wr(port_b_wr),
    .b_addr(port_b_addr),
    .b_din(n956_o),
    .a_dout(dmatbl2_a_dout),
    .b_dout(dmatbl2_b_dout));
  /* ni/packet_manager.vhd:336:26  */
  assign n954_o = port_a_din[15:0];
  /* ni/packet_manager.vhd:341:26  */
  assign n956_o = port_b_din[15:0];
  /* ni/packet_manager.vhd:348:31  */
  assign n959_o = n662_o[10:7];
  /* ni/packet_manager.vhd:348:77  */
  assign n961_o = n959_o != 4'b0000;
  /* ni/packet_manager.vhd:348:16  */
  assign n962_o = sel & n961_o;
  /* ni/packet_manager.vhd:348:3  */
  assign n965_o = n962_o ? 1'b1 : 1'b0;
  /* ni/packet_manager.vhd:357:5  */
  assign n971_o = reset ? 1'b0 : dma_en;
  /* ni/packet_manager.vhd:356:3  */
  always @(posedge clk)
    n974_q <= n971_o;
  /* ni/packet_manager.vhd:368:5  */
  assign n978_o = reset ? 1'b0 : hi_lo_next;
  /* ni/packet_manager.vhd:367:3  */
  always @(posedge clk)
    n981_q <= n978_o;
  /* ni/packet_manager.vhd:379:5  */
  assign n985_o = reset ? 1'b0 : config_slv_error_next;
  /* ni/packet_manager.vhd:378:3  */
  always @(posedge clk)
    n989_q <= n985_o;
  /* ni/packet_manager.vhd:390:5  */
  assign n993_o = reset ? 3'b000 : next_state;
  /* ni/packet_manager.vhd:389:3  */
  always @(posedge clk)
    n996_q <= n993_o;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n1006_q <= count_next;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n1007_q <= read_ptr_next;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n1008_q <= dma_num;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n1009_q <= pkt_len_next;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n1010_q <= route;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n1011_q <= payload_data_next;
  /* ni/packet_manager.vhd:401:3  */
  assign n1012_o = {dmatbl1_b_dout, dmatbl2_b_dout};
  assign n1013_o = {n883_o, n885_o, n879_o};
  assign n1014_o = {n912_o, n913_o, n914_o};
  assign n1015_o = {dmatbl1_a_dout, dmatbl2_a_dout};
  assign n1016_o = {n903_o, n899_o, n895_o, n891_o};
  assign n1017_o = {n989_q, n940_o, n943_o, n938_o, n935_o};
  assign n1018_o = {64'b0000000000000000000000000000000000000000000000000000000000000000, 1'b0, n859_o};
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
  wire [47:0] n590_o;
  wire [31:0] n592_o;
  wire n593_o;
  wire [29:0] stbl_data;
  wire stbl_idx_en_reg;
  wire config_slv_error_next;
  wire [5:0] dma_num_sig;
  wire [29:0] port_a_din;
  wire [29:0] port_a_dout;
  wire a_wr;
  wire n599_o;
  wire n600_o;
  wire [29:0] stbl_a_dout;
  wire [29:0] stbl_b_dout;
  wire [7:0] n601_o;
  localparam n603_o = 1'b0;
  localparam [29:0] n604_o = 30'b000000000000000000000000000000;
  localparam [31:0] n607_o = 32'b00000000000000000000000000000000;
  wire [15:0] n608_o;
  wire [5:0] n610_o;
  wire [1:0] n611_o;
  wire [3:0] n613_o;
  wire [3:0] n615_o;
  wire [15:0] n616_o;
  wire [5:0] n619_o;
  wire [3:0] n621_o;
  wire [3:0] n623_o;
  wire [2:0] n626_o;
  wire n628_o;
  wire n629_o;
  wire n632_o;
  wire [15:0] n635_o;
  wire [5:0] n636_o;
  wire [3:0] n637_o;
  wire [3:0] n638_o;
  wire n642_o;
  reg n645_q;
  wire n648_o;
  wire n650_o;
  wire n655_o;
  reg n659_q;
  wire [29:0] n660_o;
  wire [32:0] n661_o;
  assign config_slv_rdata = n592_o;
  assign config_slv_error = n593_o;
  assign route = n635_o;
  assign pkt_len = n637_o;
  assign t2n = n638_o;
  assign dma_num = dma_num_sig;
  assign dma_en = n650_o;
  /* ni/MC_controller.vhd:258:32  */
  assign n590_o = {config_wdata, config_wr, config_en, config_addr};
  /* ni/MC_controller.vhd:101:40  */
  assign n592_o = n661_o[31:0];
  /* ni/MC_controller.vhd:101:24  */
  assign n593_o = n661_o[32];
  /* ni/schedule_table.vhd:78:8  */
  assign stbl_data = stbl_b_dout; // (signal)
  /* ni/schedule_table.vhd:80:8  */
  assign stbl_idx_en_reg = n645_q; // (signal)
  /* ni/schedule_table.vhd:82:8  */
  assign config_slv_error_next = n632_o; // (signal)
  /* ni/schedule_table.vhd:84:8  */
  assign dma_num_sig = n636_o; // (signal)
  /* ni/schedule_table.vhd:86:8  */
  assign port_a_din = n660_o; // (signal)
  /* ni/schedule_table.vhd:86:20  */
  assign port_a_dout = stbl_a_dout; // (signal)
  /* ni/schedule_table.vhd:88:8  */
  assign a_wr = n600_o; // (signal)
  /* ni/schedule_table.vhd:91:18  */
  assign n599_o = n590_o[15];
  /* ni/schedule_table.vhd:91:21  */
  assign n600_o = n599_o & sel;
  /* ni/schedule_table.vhd:93:1  */
  tdp_ram_30_8 stbl (
    .a_clk(clk),
    .a_wr(a_wr),
    .a_addr(n601_o),
    .a_din(port_a_din),
    .b_clk(clk),
    .b_wr(n603_o),
    .b_addr(stbl_idx),
    .b_din(n604_o),
    .a_dout(stbl_a_dout),
    .b_dout(stbl_b_dout));
  /* ni/schedule_table.vhd:101:27  */
  assign n601_o = n590_o[7:0];
  /* ni/schedule_table.vhd:117:33  */
  assign n608_o = port_a_dout[29:14];
  /* ni/schedule_table.vhd:121:33  */
  assign n610_o = port_a_dout[13:8];
  assign n611_o = n607_o[15:14];
  /* ni/schedule_table.vhd:125:33  */
  assign n613_o = port_a_dout[7:4];
  /* ni/schedule_table.vhd:129:33  */
  assign n615_o = port_a_dout[3:0];
  /* ni/schedule_table.vhd:135:34  */
  assign n616_o = n590_o[47:32];
  /* ni/schedule_table.vhd:140:34  */
  assign n619_o = n590_o[29:24];
  /* ni/schedule_table.vhd:143:34  */
  assign n621_o = n590_o[23:20];
  /* ni/schedule_table.vhd:146:34  */
  assign n623_o = n590_o[19:16];
  /* ni/schedule_table.vhd:154:31  */
  assign n626_o = n590_o[10:8];
  /* ni/schedule_table.vhd:154:73  */
  assign n628_o = n626_o != 3'b000;
  /* ni/schedule_table.vhd:154:16  */
  assign n629_o = sel & n628_o;
  /* ni/schedule_table.vhd:154:3  */
  assign n632_o = n629_o ? 1'b1 : 1'b0;
  /* ni/schedule_table.vhd:159:21  */
  assign n635_o = stbl_data[29:14];
  /* ni/schedule_table.vhd:161:34  */
  assign n636_o = stbl_data[13:8];
  /* ni/schedule_table.vhd:164:30  */
  assign n637_o = stbl_data[7:4];
  /* ni/schedule_table.vhd:166:30  */
  assign n638_o = stbl_data[3:0];
  /* ni/schedule_table.vhd:172:5  */
  assign n642_o = reset ? 1'b0 : stbl_idx_en;
  /* ni/schedule_table.vhd:171:3  */
  always @(posedge clk)
    n645_q <= n642_o;
  /* ni/schedule_table.vhd:183:18  */
  assign n648_o = dma_num_sig == 6'b111111;
  /* ni/schedule_table.vhd:183:3  */
  assign n650_o = n648_o ? 1'b0 : stbl_idx_en_reg;
  /* ni/schedule_table.vhd:193:5  */
  assign n655_o = reset ? 1'b0 : config_slv_error_next;
  /* ni/schedule_table.vhd:192:3  */
  always @(posedge clk)
    n659_q <= n655_o;
  /* ni/schedule_table.vhd:192:3  */
  assign n660_o = {n616_o, n619_o, n621_o, n623_o};
  assign n661_o = {n659_q, n608_o, n611_o, n610_o, n613_o, n615_o};
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
  reg [1:0] n385_o;
  reg [1:0] n386_o;
  reg n389_o;
  reg n392_o;
  wire n394_o;
  wire [1:0] n396_o;
  wire [7:0] n398_o;
  wire [1:0] n401_o;
  wire [7:0] n403_o;
  wire [63:0] n405_o;
  wire n407_o;
  wire [1:0] n408_o;
  wire [1:0] n409_o;
  wire [63:0] n410_o;
  wire n412_o;
  wire n413_o;
  wire [1:0] n414_o;
  wire [1:0] n415_o;
  wire [1:0] n416_o;
  wire [1:0] n417_o;
  wire [63:0] n418_o;
  wire n420_o;
  wire n423_o;
  wire n426_o;
  wire [29:0] n427_o;
  localparam n429_o = 1'b0;
  localparam [1:0] n430_o = 2'b00;
  wire [1:0] n431_o;
  localparam [1:0] n432_o = 2'b00;
  wire n436_o;
  wire n438_o;
  wire n440_o;
  reg n443_q;
  wire n445_o;
  wire n448_o;
  wire n450_o;
  wire [7:0] n456_o;
  wire [7:0] n460_o;
  wire [7:0] n462_o;
  wire n467_o;
  wire [1:0] n471_o;
  wire [31:0] n473_o;
  reg n483_q;
  reg [1:0] n485_q;
  reg [31:0] n486_q;
  wire [63:0] n491_o;
  reg [63:0] n494_q;
  wire [1:0] n497_o;
  wire [1:0] n499_o;
  reg [1:0] n502_q;
  wire [1:0] n505_o;
  wire [1:0] n507_o;
  reg [1:0] n510_q;
  wire [7:0] n513_o;
  wire [7:0] n516_o;
  reg [7:0] n522_q;
  wire [7:0] n526_o;
  wire [7:0] n528_o;
  reg [7:0] n531_q;
  wire [31:0] n533_o;
  wire [32:0] n535_o;
  wire n536_o;
  wire n537_o;
  wire n538_o;
  wire n539_o;
  wire n540_o;
  wire n541_o;
  wire n542_o;
  wire n543_o;
  wire [7:0] n544_o;
  wire [7:0] n545_o;
  wire [7:0] n546_o;
  wire [7:0] n547_o;
  wire [7:0] n548_o;
  wire [7:0] n549_o;
  wire [7:0] n550_o;
  wire [7:0] n551_o;
  wire [7:0] n552_o;
  wire [7:0] n553_o;
  wire [7:0] n554_o;
  wire [7:0] n555_o;
  wire [63:0] n556_o;
  wire n557_o;
  wire n558_o;
  wire n559_o;
  wire n560_o;
  wire n561_o;
  wire n562_o;
  wire n563_o;
  wire n564_o;
  wire [7:0] n565_o;
  wire [7:0] n566_o;
  wire [7:0] n567_o;
  wire [7:0] n568_o;
  wire [7:0] n569_o;
  wire [7:0] n570_o;
  wire [7:0] n571_o;
  wire [7:0] n572_o;
  wire [7:0] n573_o;
  wire [7:0] n574_o;
  wire [7:0] n575_o;
  wire [7:0] n576_o;
  wire [63:0] n577_o;
  wire [15:0] n578_o;
  wire [15:0] n579_o;
  wire [15:0] n580_o;
  wire [15:0] n581_o;
  wire [1:0] n582_o;
  reg [15:0] n583_o;
  wire [15:0] n584_o;
  wire [15:0] n585_o;
  wire [15:0] n586_o;
  wire [15:0] n587_o;
  wire [1:0] n588_o;
  reg [15:0] n589_o;
  assign config_slv_rdata = n356_o;
  assign config_slv_error = n357_o;
  assign stbl_min = n462_o;
  assign stbl_maxp1 = n531_q;
  assign mc = n429_o;
  assign mc_idx = n430_o;
  assign mc_p = n432_o;
  /* ni/TDM_controller.vhd:64:5  */
  assign n354_o = {config_wdata, config_wr, config_en, config_addr};
  /* ni/TDM_controller.vhd:60:5  */
  assign n356_o = n535_o[31:0];
  /* ni/TDM_controller.vhd:58:5  */
  assign n357_o = n535_o[32];
  /* ni/MC_controller.vhd:86:10  */
  assign stbl_min_next = n456_o; // (signal)
  /* ni/MC_controller.vhd:86:25  */
  assign stbl_maxp1_next = n460_o; // (signal)
  /* ni/MC_controller.vhd:87:10  */
  assign mode_change_idx_reg = n502_q; // (signal)
  /* ni/MC_controller.vhd:87:31  */
  assign mode_change_idx_next = n416_o; // (signal)
  /* ni/MC_controller.vhd:88:10  */
  assign mode_idx_reg = n510_q; // (signal)
  /* ni/MC_controller.vhd:90:10  */
  assign mode_change_cnt_reg = n485_q; // (signal)
  /* ni/MC_controller.vhd:90:31  */
  assign mode_change_cnt_next = n417_o; // (signal)
  /* ni/MC_controller.vhd:90:53  */
  assign mode_change_cnt_int = n431_o; // (signal)
  /* ni/MC_controller.vhd:92:10  */
  assign mode_reg = n494_q; // (signal)
  /* ni/MC_controller.vhd:92:20  */
  assign mode_next = n418_o; // (signal)
  /* ni/MC_controller.vhd:94:10  */
  assign global_mode_change_idx = n450_o; // (signal)
  /* ni/MC_controller.vhd:94:34  */
  assign local_mode_change_idx = n420_o; // (signal)
  /* ni/MC_controller.vhd:96:10  */
  assign config_slv_error_next = n423_o; // (signal)
  /* ni/MC_controller.vhd:98:10  */
  assign read_reg = n486_q; // (signal)
  /* ni/MC_controller.vhd:98:20  */
  assign read_next = n533_o; // (signal)
  /* ni/MC_controller.vhd:100:27  */
  assign mode_changed_reg = n443_q; // (signal)
  /* ni/MC_controller.vhd:101:10  */
  assign stbl_min_reg = n522_q; // (signal)
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
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n384_o)
      1'b1: n385_o <= n382_o;
      default: n385_o <= mode_change_idx_reg;
    endcase
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n384_o)
      1'b1: n386_o <= mode_change_cnt_int;
      default: n386_o <= mode_change_cnt_reg;
    endcase
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n384_o)
      1'b1: n389_o <= 1'b1;
      default: n389_o <= 1'b0;
    endcase
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n384_o)
      1'b1: n392_o <= 1'b0;
      default: n392_o <= 1'b1;
    endcase
  /* ni/MC_controller.vhd:158:24  */
  assign n394_o = $unsigned(mc_tbl_addr) < $unsigned(11'b00000000100);
  /* ni/MC_controller.vhd:160:22  */
  assign n396_o = mc_tbl_addr[1:0];  // trunc
  /* ni/MC_controller.vhd:160:76  */
  assign n398_o = n354_o[23:16];
  /* ni/MC_controller.vhd:161:22  */
  assign n401_o = mc_tbl_addr[1:0];  // trunc
  /* ni/MC_controller.vhd:161:76  */
  assign n403_o = n354_o[39:32];
  /* ni/MC_controller.vhd:158:9  */
  assign n405_o = n394_o ? n577_o : mode_reg;
  /* ni/MC_controller.vhd:158:9  */
  assign n407_o = n394_o ? 1'b0 : n392_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n408_o = n372_o ? mode_change_idx_reg : n385_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n409_o = n372_o ? mode_change_cnt_reg : n386_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n410_o = n372_o ? mode_reg : n405_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n412_o = n372_o ? 1'b0 : n389_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n413_o = n372_o ? n378_o : n407_o;
  assign n414_o = read_reg[1:0];
  /* ni/MC_controller.vhd:126:5  */
  assign n415_o = n426_o ? n380_o : n414_o;
  /* ni/MC_controller.vhd:126:5  */
  assign n416_o = n370_o ? n408_o : mode_change_idx_reg;
  /* ni/MC_controller.vhd:126:5  */
  assign n417_o = n370_o ? n409_o : mode_change_cnt_reg;
  /* ni/MC_controller.vhd:126:5  */
  assign n418_o = n370_o ? n410_o : mode_reg;
  /* ni/MC_controller.vhd:126:5  */
  assign n420_o = n370_o ? n412_o : 1'b0;
  /* ni/MC_controller.vhd:126:5  */
  assign n423_o = n370_o ? n413_o : 1'b0;
  /* ni/MC_controller.vhd:126:5  */
  assign n426_o = n370_o & n372_o;
  assign n427_o = read_reg[31:2];
  /* ni/MC_controller.vhd:212:49  */
  assign n431_o = n354_o[33:32];
  /* ni/MC_controller.vhd:223:11  */
  assign n436_o = global_mode_change_idx ? 1'b0 : mode_changed_reg;
  /* ni/MC_controller.vhd:221:11  */
  assign n438_o = local_mode_change_idx ? 1'b1 : n436_o;
  /* ni/MC_controller.vhd:218:9  */
  assign n440_o = reset ? 1'b0 : n438_o;
  /* ni/MC_controller.vhd:217:7  */
  always @(posedge clk)
    n443_q <= n440_o;
  /* ni/MC_controller.vhd:235:32  */
  assign n445_o = mode_change_cnt_reg == mc_p_cnt;
  /* ni/MC_controller.vhd:235:9  */
  assign n448_o = n445_o ? 1'b1 : 1'b0;
  /* ni/MC_controller.vhd:234:7  */
  assign n450_o = mode_changed_reg ? n448_o : 1'b0;
  /* ni/MC_controller.vhd:257:57  */
  assign n456_o = n583_o[7:0];
  /* ni/MC_controller.vhd:258:59  */
  assign n460_o = n589_o[15:8];
  /* ni/MC_controller.vhd:268:5  */
  assign n462_o = period_boundary ? stbl_min_next : stbl_min_reg;
  /* ni/MC_controller.vhd:281:7  */
  assign n467_o = reset ? 1'b0 : config_slv_error_next;
  /* ni/MC_controller.vhd:281:7  */
  assign n471_o = reset ? 2'b00 : mode_change_cnt_next;
  /* ni/MC_controller.vhd:281:7  */
  assign n473_o = reset ? 32'b00000000000000000000000000000000 : read_next;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n483_q <= n467_o;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n485_q <= n471_o;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n486_q <= n473_o;
  /* ni/MC_controller.vhd:302:7  */
  assign n491_o = reset ? 64'b0000000000000000000000000000000000000000000000000000000000000000 : mode_next;
  /* ni/MC_controller.vhd:301:5  */
  always @(posedge clk)
    n494_q <= n491_o;
  /* ni/MC_controller.vhd:324:9  */
  assign n497_o = local_mode_change_idx ? mode_change_idx_next : mode_change_idx_reg;
  /* ni/MC_controller.vhd:321:7  */
  assign n499_o = reset ? 2'b00 : n497_o;
  /* ni/MC_controller.vhd:320:5  */
  always @(posedge clk)
    n502_q <= n499_o;
  /* ni/MC_controller.vhd:338:9  */
  assign n505_o = global_mode_change_idx ? mode_change_idx_reg : mode_idx_reg;
  /* ni/MC_controller.vhd:335:7  */
  assign n507_o = reset ? 2'b00 : n505_o;
  /* ni/MC_controller.vhd:334:5  */
  always @(posedge clk)
    n510_q <= n507_o;
  /* ni/MC_controller.vhd:354:9  */
  assign n513_o = period_boundary ? stbl_min_next : stbl_min_reg;
  /* ni/MC_controller.vhd:350:7  */
  assign n516_o = reset ? 8'b00000000 : n513_o;
  /* ni/MC_controller.vhd:349:5  */
  always @(posedge clk)
    n522_q <= n516_o;
  /* ni/MC_controller.vhd:373:9  */
  assign n526_o = period_boundary ? stbl_maxp1_next : n531_q;
  /* ni/MC_controller.vhd:370:7  */
  assign n528_o = reset ? 8'b00000000 : n526_o;
  /* ni/MC_controller.vhd:369:5  */
  always @(posedge clk)
    n531_q <= n528_o;
  assign n533_o = {n427_o, n415_o};
  assign n535_o = {n483_q, read_reg};
  /* ni/MC_controller.vhd:160:13  */
  assign n536_o = n396_o[1];
  /* ni/MC_controller.vhd:160:13  */
  assign n537_o = ~n536_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n538_o = n396_o[0];
  /* ni/MC_controller.vhd:160:13  */
  assign n539_o = ~n538_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n540_o = n537_o & n539_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n541_o = n537_o & n538_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n542_o = n536_o & n539_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n543_o = n536_o & n538_o;
  assign n544_o = mode_reg[7:0];
  /* ni/MC_controller.vhd:160:13  */
  assign n545_o = n540_o ? n398_o : n544_o;
  /* ni/MC_controller.vhd:349:5  */
  assign n546_o = mode_reg[15:8];
  assign n547_o = mode_reg[23:16];
  /* ni/MC_controller.vhd:160:13  */
  assign n548_o = n541_o ? n398_o : n547_o;
  assign n549_o = mode_reg[31:24];
  /* ni/MC_controller.vhd:354:9  */
  assign n550_o = mode_reg[39:32];
  /* ni/MC_controller.vhd:160:13  */
  assign n551_o = n542_o ? n398_o : n550_o;
  assign n552_o = mode_reg[47:40];
  /* ni/MC_controller.vhd:332:3  */
  assign n553_o = mode_reg[55:48];
  /* ni/MC_controller.vhd:160:13  */
  assign n554_o = n543_o ? n398_o : n553_o;
  /* ni/MC_controller.vhd:318:3  */
  assign n555_o = mode_reg[63:56];
  assign n556_o = {n555_o, n554_o, n552_o, n551_o, n549_o, n548_o, n546_o, n545_o};
  /* ni/MC_controller.vhd:161:13  */
  assign n557_o = n401_o[1];
  /* ni/MC_controller.vhd:161:13  */
  assign n558_o = ~n557_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n559_o = n401_o[0];
  /* ni/MC_controller.vhd:161:13  */
  assign n560_o = ~n559_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n561_o = n558_o & n560_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n562_o = n558_o & n559_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n563_o = n557_o & n560_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n564_o = n557_o & n559_o;
  assign n565_o = n556_o[7:0];
  /* ni/MC_controller.vhd:281:7  */
  assign n566_o = n556_o[15:8];
  /* ni/MC_controller.vhd:161:13  */
  assign n567_o = n561_o ? n403_o : n566_o;
  /* ni/MC_controller.vhd:278:3  */
  assign n568_o = n556_o[23:16];
  assign n569_o = n556_o[31:24];
  /* ni/MC_controller.vhd:161:13  */
  assign n570_o = n562_o ? n403_o : n569_o;
  /* ni/MC_controller.vhd:258:33  */
  assign n571_o = n556_o[39:32];
  /* ni/MC_controller.vhd:257:31  */
  assign n572_o = n556_o[47:40];
  /* ni/MC_controller.vhd:161:13  */
  assign n573_o = n563_o ? n403_o : n572_o;
  assign n574_o = n556_o[55:48];
  /* ni/MC_controller.vhd:231:5  */
  assign n575_o = n556_o[63:56];
  /* ni/MC_controller.vhd:161:13  */
  assign n576_o = n564_o ? n403_o : n575_o;
  /* ni/MC_controller.vhd:215:5  */
  assign n577_o = {n576_o, n574_o, n573_o, n571_o, n570_o, n568_o, n567_o, n565_o};
  /* ni/MC_controller.vhd:161:23  */
  assign n578_o = mode_reg[15:0];
  /* ni/MC_controller.vhd:161:13  */
  assign n579_o = mode_reg[31:16];
  assign n580_o = mode_reg[47:32];
  assign n581_o = mode_reg[63:48];
  /* ni/MC_controller.vhd:257:30  */
  assign n582_o = mode_idx_reg[1:0];
  /* ni/MC_controller.vhd:257:30  */
  always @*
    case (n582_o)
      2'b00: n583_o <= n578_o;
      2'b01: n583_o <= n579_o;
      2'b10: n583_o <= n580_o;
      2'b11: n583_o <= n581_o;
    endcase
  /* ni/MC_controller.vhd:257:31  */
  assign n584_o = mode_reg[15:0];
  /* ni/MC_controller.vhd:257:30  */
  assign n585_o = mode_reg[31:16];
  /* ni/MC_controller.vhd:161:23  */
  assign n586_o = mode_reg[47:32];
  /* ni/MC_controller.vhd:160:23  */
  assign n587_o = mode_reg[63:48];
  /* ni/MC_controller.vhd:258:32  */
  assign n588_o = mode_idx_reg[1:0];
  /* ni/MC_controller.vhd:258:32  */
  always @*
    case (n588_o)
      2'b00: n589_o <= n584_o;
      2'b01: n589_o <= n585_o;
      2'b10: n589_o <= n586_o;
      2'b11: n589_o <= n587_o;
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
  /* ni/network_interface_s.vhd:398:40  */
  assign n193_o = {config_wdata, config_wr, config_en, config_addr};
  /* ni/network_interface_s.vhd:394:41  */
  assign n195_o = n353_o[31:0];
  /* ni/network_interface_s.vhd:392:35  */
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
  /* ni/network_interface_s.vhd:305:9  */
  assign n221_o = n220_o[31:1];
  /* ni/TDM_controller.vhd:167:11  */
  assign n223_o = n211_o == 31'b0000000000000000000000000000100;
  /* ni/network_interface_s.vhd:300:27  */
  assign n224_o = {n223_o, n219_o, n217_o, n215_o, n213_o};
  /* ni/network_interface_s.vhd:299:23  */
  assign n225_o = tdm_s_cnt_reg[0];
  /* ni/network_interface_s.vhd:298:31  */
  assign n226_o = tdm_p_cnt_reg[0];
  /* ni/network_interface_s.vhd:297:29  */
  assign n227_o = clock_delay_reg[0];
  /* ni/network_interface_s.vhd:294:31  */
  assign n228_o = clock_cnt_lo_reg[0];
  /* ni/network_interface_s.vhd:284:9  */
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
  /* ni/network_interface_s.vhd:284:9  */
  assign n231_o = tdm_s_cnt_reg[9:1];
  /* ni/network_interface_s.vhd:284:9  */
  assign n232_o = tdm_p_cnt_reg[9:1];
  /* ni/network_interface_s.vhd:284:9  */
  assign n233_o = clock_delay_reg[9:1];
  /* ni/network_interface_s.vhd:284:9  */
  assign n234_o = clock_cnt_lo_reg[9:1];
  /* ni/network_interface_s.vhd:279:29  */
  assign n235_o = n221_o[8:0];
  /* ni/network_interface_s.vhd:278:36  */
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
  /* ni/network_interface_s.vhd:275:29  */
  assign n238_o = tdm_p_cnt_reg[31:10];
  /* ni/network_interface_s.vhd:274:31  */
  assign n239_o = clock_delay_reg[31:10];
  /* ni/network_interface_s.vhd:271:31  */
  assign n240_o = clock_cnt_lo_reg[31:10];
  /* ni/network_interface_s.vhd:263:9  */
  assign n241_o = n221_o[30:9];
  /* ni/network_interface_s.vhd:263:9  */
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

module network_interface_s
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
  wire [47:0] config_master;
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
  /* ni/network_interface_s.vhd:227:8  */
  assign config_master = configbus_n151; // (signal)
  /* ni/network_interface_s.vhd:229:8  */
  assign tdm_ctrl = tdmctrl_n16; // (signal)
  /* ni/network_interface_s.vhd:229:18  */
  assign sched_tbl = schedtbl_n61; // (signal)
  /* ni/network_interface_s.vhd:229:29  */
  assign dma_tbl = pktman_n84; // (signal)
  /* ni/network_interface_s.vhd:229:38  */
  assign mc_ctrl = mcctrl_n38; // (signal)
  /* ni/network_interface_s.vhd:230:8  */
  assign tdm_ctrl_sel = configbus_n152; // (signal)
  /* ni/network_interface_s.vhd:230:22  */
  assign sched_tbl_sel = configbus_n153; // (signal)
  /* ni/network_interface_s.vhd:230:37  */
  assign dma_tbl_sel = configbus_n154; // (signal)
  /* ni/network_interface_s.vhd:230:50  */
  assign mc_ctrl_sel = configbus_n155; // (signal)
  /* ni/network_interface_s.vhd:231:8  */
  assign stbl_idx = tdmctrl_n17; // (signal)
  /* ni/network_interface_s.vhd:232:8  */
  assign stbl_idx_en = tdmctrl_n18; // (signal)
  /* ni/network_interface_s.vhd:233:8  */
  assign t2n = schedtbl_n64; // (signal)
  /* ni/network_interface_s.vhd:235:8  */
  assign route = schedtbl_n62; // (signal)
  /* ni/network_interface_s.vhd:236:8  */
  assign pkt_len = schedtbl_n63; // (signal)
  /* ni/network_interface_s.vhd:237:8  */
  assign dma_num = schedtbl_n65; // (signal)
  /* ni/network_interface_s.vhd:238:8  */
  assign dma_en = schedtbl_n66; // (signal)
  /* ni/network_interface_s.vhd:240:8  */
  assign period_boundary = tdmctrl_n19; // (signal)
  /* ni/network_interface_s.vhd:241:8  */
  assign stbl_min = mcctrl_n39; // (signal)
  /* ni/network_interface_s.vhd:242:8  */
  assign stbl_maxp1 = mcctrl_n40; // (signal)
  /* ni/network_interface_s.vhd:244:8  */
  assign tx_spm = pktman_n85; // (signal)
  /* ni/network_interface_s.vhd:244:16  */
  assign rx_spm = rxunit_n101; // (signal)
  /* ni/network_interface_s.vhd:245:8  */
  assign tx_spm_slv = spmbus_n133; // (signal)
  /* ni/network_interface_s.vhd:247:8  */
  assign irq_fifo_data = rxunit_n103; // (signal)
  /* ni/network_interface_s.vhd:248:8  */
  assign irq_fifo_data_valid = rxunit_n104; // (signal)
  /* ni/network_interface_s.vhd:248:29  */
  assign irq_fifo_irq_valid = rxunit_n105; // (signal)
  /* ni/network_interface_s.vhd:250:8  */
  assign config_unit_master = rxunit_n102; // (signal)
  /* ni/network_interface_s.vhd:251:8  */
  assign irq_if_fifo = irqfifo_n118; // (signal)
  /* ni/network_interface_s.vhd:252:8  */
  assign irq_if_fifo_sel = configbus_n156; // (signal)
  /* ni/network_interface_s.vhd:254:8  */
  assign mc = mcctrl_n41; // (signal)
  /* ni/network_interface_s.vhd:255:8  */
  assign mc_idx = mcctrl_n42; // (signal)
  /* ni/network_interface_s.vhd:256:8  */
  assign mc_p_cnt = tdmctrl_n20; // (signal)
  /* ni/network_interface_s.vhd:257:8  */
  assign mc_p = mcctrl_n43; // (signal)
  /* ni/network_interface_s.vhd:271:31  */
  assign tdmctrl_n15 = tdmctrl_master_run; // (signal)
  /* ni/network_interface_s.vhd:274:31  */
  assign tdmctrl_n16 = n26_o; // (signal)
  /* ni/network_interface_s.vhd:275:29  */
  assign tdmctrl_n17 = tdmctrl_stbl_idx; // (signal)
  /* ni/network_interface_s.vhd:276:32  */
  assign tdmctrl_n18 = tdmctrl_stbl_idx_en; // (signal)
  /* ni/network_interface_s.vhd:278:36  */
  assign tdmctrl_n19 = tdmctrl_period_boundary; // (signal)
  /* ni/network_interface_s.vhd:279:29  */
  assign tdmctrl_n20 = tdmctrl_mc_p_cnt; // (signal)
  /* ni/network_interface_s.vhd:263:9  */
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
  assign n22_o = config_master[13:0];
  assign n23_o = config_master[14];
  assign n24_o = config_master[15];
  assign n25_o = config_master[47:16];
  assign n26_o = {tdmctrl_config_slv_error, tdmctrl_config_slv_rdata};
  /* ni/network_interface_s.vhd:294:31  */
  assign mcctrl_n38 = n48_o; // (signal)
  /* ni/network_interface_s.vhd:297:29  */
  assign mcctrl_n39 = mcctrl_stbl_min; // (signal)
  /* ni/network_interface_s.vhd:298:31  */
  assign mcctrl_n40 = mcctrl_stbl_maxp1; // (signal)
  /* ni/network_interface_s.vhd:299:23  */
  assign mcctrl_n41 = mcctrl_mc; // (signal)
  /* ni/network_interface_s.vhd:300:27  */
  assign mcctrl_n42 = mcctrl_mc_idx; // (signal)
  /* ni/network_interface_s.vhd:301:25  */
  assign mcctrl_n43 = mcctrl_mc_p; // (signal)
  /* ni/network_interface_s.vhd:284:9  */
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
  assign n44_o = config_master[13:0];
  assign n45_o = config_master[14];
  assign n46_o = config_master[15];
  assign n47_o = config_master[47:16];
  assign n48_o = {mcctrl_config_slv_error, mcctrl_config_slv_rdata};
  /* ni/network_interface_s.vhd:311:31  */
  assign schedtbl_n61 = n71_o; // (signal)
  /* ni/network_interface_s.vhd:314:26  */
  assign schedtbl_n62 = schedtbl_route; // (signal)
  /* ni/network_interface_s.vhd:315:28  */
  assign schedtbl_n63 = schedtbl_pkt_len; // (signal)
  /* ni/network_interface_s.vhd:316:24  */
  assign schedtbl_n64 = schedtbl_t2n; // (signal)
  /* ni/network_interface_s.vhd:317:28  */
  assign schedtbl_n65 = schedtbl_dma_num; // (signal)
  /* ni/network_interface_s.vhd:318:27  */
  assign schedtbl_n66 = schedtbl_dma_en; // (signal)
  /* ni/network_interface_s.vhd:305:9  */
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
  assign n67_o = config_master[13:0];
  assign n68_o = config_master[14];
  assign n69_o = config_master[15];
  assign n70_o = config_master[47:16];
  assign n71_o = {schedtbl_config_slv_error, schedtbl_config_slv_rdata};
  /* ni/network_interface_s.vhd:327:31  */
  assign pktman_n84 = n91_o; // (signal)
  /* ni/network_interface_s.vhd:328:24  */
  assign pktman_n85 = n93_o; // (signal)
  /* ni/network_interface_s.vhd:337:28  */
  assign pktman_n86 = pktman_pkt_out; // (signal)
  /* ni/network_interface_s.vhd:321:9  */
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
  assign n87_o = config_master[13:0];
  assign n88_o = config_master[14];
  assign n89_o = config_master[15];
  assign n90_o = config_master[47:16];
  assign n91_o = {pktman_config_slv_error, pktman_config_slv_rdata};
  assign n93_o = {pktman_spm_wdata, pktman_spm_wr, pktman_spm_en, pktman_spm_addr};
  assign n95_o = tx_spm_slv[63:0];
  assign n96_o = tx_spm_slv[64];
  /* ni/network_interface_s.vhd:345:24  */
  assign rxunit_n101 = n106_o; // (signal)
  /* ni/network_interface_s.vhd:346:27  */
  assign rxunit_n102 = n108_o; // (signal)
  /* ni/network_interface_s.vhd:347:34  */
  assign rxunit_n103 = rxunit_irq_fifo_data; // (signal)
  /* ni/network_interface_s.vhd:348:40  */
  assign rxunit_n104 = rxunit_irq_fifo_data_valid; // (signal)
  /* ni/network_interface_s.vhd:349:39  */
  assign rxunit_n105 = rxunit_irq_fifo_irq_valid; // (signal)
  /* ni/network_interface_s.vhd:341:9  */
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
  /* ni/network_interface_s.vhd:360:31  */
  assign irqfifo_n118 = n125_o; // (signal)
  /* ni/network_interface_s.vhd:362:32  */
  assign irqfifo_n119 = irqfifo_irq_irq_sig; // (signal)
  /* ni/network_interface_s.vhd:363:34  */
  assign irqfifo_n120 = irqfifo_irq_data_sig; // (signal)
  /* ni/network_interface_s.vhd:354:9  */
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
  assign n121_o = config_master[13:0];
  assign n122_o = config_master[14];
  assign n123_o = config_master[15];
  assign n124_o = config_master[47:16];
  assign n125_o = {irqfifo_config_slv_error, irqfifo_config_slv_rdata};
  /* ni/network_interface_s.vhd:378:32  */
  assign spmbus_n132 = n136_o; // (signal)
  /* ni/network_interface_s.vhd:379:39  */
  assign spmbus_n133 = n138_o; // (signal)
  /* ni/network_interface_s.vhd:373:9  */
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
  /* ni/network_interface_s.vhd:389:41  */
  assign configbus_n150 = n162_o; // (signal)
  /* ni/network_interface_s.vhd:392:35  */
  assign configbus_n151 = n168_o; // (signal)
  /* ni/network_interface_s.vhd:394:41  */
  assign configbus_n152 = configbus_tdm_ctrl_sel; // (signal)
  /* ni/network_interface_s.vhd:396:42  */
  assign configbus_n153 = configbus_sched_tbl_sel; // (signal)
  /* ni/network_interface_s.vhd:398:40  */
  assign configbus_n154 = configbus_dma_tbl_sel; // (signal)
  /* ni/network_interface_s.vhd:400:40  */
  assign configbus_n155 = configbus_mc_ctrl_sel; // (signal)
  /* ni/network_interface_s.vhd:402:46  */
  assign configbus_n156 = configbus_irq_unit_fifo_sel; // (signal)
  /* ni/network_interface_s.vhd:384:9  */
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

