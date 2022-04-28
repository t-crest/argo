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
  reg [13:0] n1740_data; // mem_rd
  reg [13:0] n1743_data; // mem_rd
  assign a_dout = n1743_data;
  assign b_dout = n1740_data;
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
      n1740_data <= mem[b_addr];
  always @(posedge a_clk)
    if (a_wr)
      mem[a_addr] <= a_din;
  always @(posedge a_clk)
    if (1'b1)
      n1743_data <= mem[a_addr];
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
  reg [15:0] n1701_data; // mem_rd
  reg [15:0] n1704_data; // mem_rd
  assign a_dout = n1704_data;
  assign b_dout = n1701_data;
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
      n1701_data <= mem[b_addr];
  always @(posedge a_clk)
    if (a_wr)
      mem[a_addr] <= a_din;
  always @(posedge a_clk)
    if (1'b1)
      n1704_data <= mem[a_addr];
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
  reg [28:0] n1662_data; // mem_rd
  reg [28:0] n1665_data; // mem_rd
  assign a_dout = n1665_data;
  assign b_dout = n1662_data;
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
      n1662_data <= mem[b_addr];
  always @(posedge a_clk)
    if (a_wr)
      mem[a_addr] <= a_din;
  always @(posedge a_clk)
    if (1'b1)
      n1665_data <= mem[a_addr];
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
  reg [29:0] n1623_data; // mem_rd
  reg [29:0] n1626_data; // mem_rd
  assign a_dout = n1626_data;
  assign b_dout = n1623_data;
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
      n1623_data <= mem[b_addr];
  always @(posedge a_clk)
    if (a_wr)
      mem[a_addr] <= a_din;
  always @(posedge a_clk)
    if (1'b1)
      n1626_data <= mem[a_addr];
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
  wire [71:0] n1452_o;
  wire [1:0] n1454_o;
  wire [31:0] n1455_o;
  wire n1456_o;
  wire [47:0] n1457_o;
  wire [13:0] n1459_o;
  wire n1460_o;
  wire n1461_o;
  wire [31:0] n1462_o;
  wire [32:0] n1463_o;
  wire [32:0] n1465_o;
  wire [32:0] n1467_o;
  wire [32:0] n1469_o;
  wire [32:0] n1471_o;
  wire [1:0] next_ocp_resp;
  wire [1:0] ocp_resp_reg;
  wire [2:0] bank_id;
  wire [2:0] prev_bank_id;
  wire [31:0] n1474_o;
  wire [2:0] n1476_o;
  wire [13:0] n1477_o;
  wire n1478_o;
  wire n1479_o;
  wire [31:0] n1480_o;
  wire n1481_o;
  wire n1482_o;
  wire [2:0] n1483_o;
  wire n1485_o;
  wire n1486_o;
  wire [31:0] n1488_o;
  wire [2:0] n1489_o;
  wire [13:0] n1490_o;
  wire [2:0] n1493_o;
  wire n1495_o;
  wire n1496_o;
  wire [2:0] n1497_o;
  wire n1499_o;
  wire n1501_o;
  wire n1502_o;
  wire n1503_o;
  wire [47:0] n1504_o;
  wire [47:0] n1505_o;
  wire [47:0] n1506_o;
  wire [1:0] n1508_o;
  wire [2:0] n1509_o;
  wire n1511_o;
  wire n1512_o;
  wire n1513_o;
  wire [1:0] n1515_o;
  wire n1524_o;
  wire n1526_o;
  wire n1528_o;
  wire n1530_o;
  wire n1532_o;
  wire n1534_o;
  wire [5:0] n1535_o;
  reg n1538_o;
  reg n1542_o;
  reg n1546_o;
  reg n1550_o;
  reg n1554_o;
  wire [31:0] n1556_o;
  wire n1558_o;
  wire [31:0] n1559_o;
  wire n1561_o;
  wire [31:0] n1562_o;
  wire n1564_o;
  wire [31:0] n1565_o;
  wire n1567_o;
  wire [31:0] n1568_o;
  wire n1570_o;
  wire n1572_o;
  wire [5:0] n1573_o;
  reg [31:0] n1574_o;
  wire [1:0] n1579_o;
  wire [2:0] n1581_o;
  reg [1:0] n1585_q;
  reg [2:0] n1586_q;
  wire [34:0] n1587_o;
  assign ocp_config_s_sresp = n1454_o;
  assign ocp_config_s_sdata = n1455_o;
  assign ocp_config_s_scmdaccept = n1456_o;
  assign config_addr = n1459_o;
  assign config_en = n1460_o;
  assign config_wr = n1461_o;
  assign config_wdata = n1462_o;
  assign tdm_ctrl_sel = n1538_o;
  assign sched_tbl_sel = n1542_o;
  assign dma_tbl_sel = n1546_o;
  assign mc_ctrl_sel = n1550_o;
  assign irq_unit_fifo_sel = n1554_o;
  /* ni/spm_bus.vhd:50:17  */
  assign n1452_o = {ocp_config_m_mrespaccept, ocp_config_m_mbyteen, ocp_config_m_mdata, ocp_config_m_maddr, ocp_config_m_mcmd};
  /* ni/spm_bus.vhd:81:9  */
  assign n1454_o = n1587_o[1:0];
  assign n1455_o = n1587_o[33:2];
  /* ni/spm_bus.vhd:63:9  */
  assign n1456_o = n1587_o[34];
  /* ni/spm_bus.vhd:83:17  */
  assign n1457_o = {config_unit_wdata, config_unit_wr, config_unit_en, config_unit_addr};
  assign n1459_o = n1506_o[13:0];
  assign n1460_o = n1506_o[14];
  assign n1461_o = n1506_o[15];
  assign n1462_o = n1506_o[47:16];
  assign n1463_o = {tdm_ctrl_error, tdm_ctrl_rdata};
  assign n1465_o = {sched_tbl_error, sched_tbl_rdata};
  assign n1467_o = {dma_tbl_error, dma_tbl_rdata};
  assign n1469_o = {mc_ctrl_error, mc_ctrl_rdata};
  assign n1471_o = {irq_unit_fifo_error, irq_unit_fifo_rdata};
  /* ni/config_bus.vhd:88:8  */
  assign next_ocp_resp = n1515_o; // (signal)
  /* ni/config_bus.vhd:88:23  */
  assign ocp_resp_reg = n1585_q; // (signal)
  /* ni/config_bus.vhd:89:8  */
  assign bank_id = n1509_o; // (signal)
  /* ni/config_bus.vhd:89:17  */
  assign prev_bank_id = n1586_q; // (signal)
  /* ni/config_bus.vhd:105:55  */
  assign n1474_o = n1467_o[31:0];
  /* ni/config_bus.vhd:108:30  */
  assign n1476_o = n1457_o[13:11];
  /* ni/config_bus.vhd:110:30  */
  assign n1477_o = n1457_o[13:0];
  /* ni/config_bus.vhd:111:28  */
  assign n1478_o = n1457_o[14];
  /* ni/config_bus.vhd:112:28  */
  assign n1479_o = n1457_o[15];
  /* ni/config_bus.vhd:113:31  */
  assign n1480_o = n1457_o[47:16];
  /* ni/config_bus.vhd:120:18  */
  assign n1481_o = n1457_o[14];
  /* ni/config_bus.vhd:120:21  */
  assign n1482_o = ~n1481_o;
  /* ni/config_bus.vhd:120:44  */
  assign n1483_o = n1452_o[2:0];
  /* ni/config_bus.vhd:120:49  */
  assign n1485_o = n1483_o != 3'b000;
  /* ni/config_bus.vhd:120:27  */
  assign n1486_o = n1482_o & n1485_o;
  /* ni/config_bus.vhd:124:66  */
  assign n1488_o = n1452_o[66:35];
  /* ni/config_bus.vhd:126:43  */
  assign n1489_o = n1452_o[18:16];
  /* ni/config_bus.vhd:129:47  */
  assign n1490_o = n1452_o[18:5];
  /* ni/config_bus.vhd:134:21  */
  assign n1493_o = n1452_o[2:0];
  /* ni/config_bus.vhd:134:26  */
  assign n1495_o = n1493_o != 3'b000;
  /* ni/config_bus.vhd:134:42  */
  assign n1496_o = n1495_o & supervisor;
  /* ni/config_bus.vhd:135:23  */
  assign n1497_o = n1452_o[2:0];
  /* ni/config_bus.vhd:135:28  */
  assign n1499_o = n1497_o == 3'b001;
  /* ni/config_bus.vhd:134:5  */
  assign n1501_o = n1502_o ? 1'b1 : 1'b0;
  /* ni/config_bus.vhd:134:5  */
  assign n1502_o = n1496_o & n1499_o;
  /* ni/config_bus.vhd:120:3  */
  assign n1503_o = n1486_o ? 1'b1 : 1'b0;
  assign n1504_o = {n1488_o, n1501_o, 1'b1, n1490_o};
  assign n1505_o = {n1480_o, n1479_o, n1478_o, n1477_o};
  /* ni/config_bus.vhd:120:3  */
  assign n1506_o = n1486_o ? n1504_o : n1505_o;
  /* ni/config_bus.vhd:120:3  */
  assign n1508_o = n1486_o ? 2'b01 : ocp_resp_reg;
  /* ni/config_bus.vhd:120:3  */
  assign n1509_o = n1486_o ? n1489_o : n1476_o;
  /* ni/config_bus.vhd:161:20  */
  assign n1511_o = ocp_resp_reg != 2'b00;
  /* ni/config_bus.vhd:161:56  */
  assign n1512_o = n1452_o[71];
  /* ni/config_bus.vhd:161:38  */
  assign n1513_o = n1511_o & n1512_o;
  /* ni/config_bus.vhd:161:3  */
  assign n1515_o = n1513_o ? 2'b00 : n1508_o;
  /* ni/config_bus.vhd:177:5  */
  assign n1524_o = bank_id == 3'b000;
  /* ni/config_bus.vhd:179:5  */
  assign n1526_o = bank_id == 3'b001;
  /* ni/config_bus.vhd:181:5  */
  assign n1528_o = bank_id == 3'b010;
  /* ni/config_bus.vhd:183:5  */
  assign n1530_o = bank_id == 3'b011;
  /* ni/config_bus.vhd:185:5  */
  assign n1532_o = bank_id == 3'b100;
  /* ni/config_bus.vhd:187:5  */
  assign n1534_o = bank_id == 3'b111;
  assign n1535_o = {n1534_o, n1532_o, n1530_o, n1528_o, n1526_o, n1524_o};
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n1535_o)
      6'b100000: n1538_o <= 1'b0;
      6'b010000: n1538_o <= 1'b0;
      6'b001000: n1538_o <= 1'b0;
      6'b000100: n1538_o <= 1'b1;
      6'b000010: n1538_o <= 1'b0;
      6'b000001: n1538_o <= 1'b0;
      default: n1538_o <= 1'b0;
    endcase
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n1535_o)
      6'b100000: n1542_o <= 1'b0;
      6'b010000: n1542_o <= 1'b0;
      6'b001000: n1542_o <= 1'b0;
      6'b000100: n1542_o <= 1'b0;
      6'b000010: n1542_o <= 1'b1;
      6'b000001: n1542_o <= 1'b0;
      default: n1542_o <= 1'b0;
    endcase
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n1535_o)
      6'b100000: n1546_o <= 1'b0;
      6'b010000: n1546_o <= 1'b0;
      6'b001000: n1546_o <= 1'b0;
      6'b000100: n1546_o <= 1'b0;
      6'b000010: n1546_o <= 1'b0;
      6'b000001: n1546_o <= 1'b1;
      default: n1546_o <= 1'b0;
    endcase
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n1535_o)
      6'b100000: n1550_o <= 1'b0;
      6'b010000: n1550_o <= 1'b0;
      6'b001000: n1550_o <= 1'b1;
      6'b000100: n1550_o <= 1'b0;
      6'b000010: n1550_o <= 1'b0;
      6'b000001: n1550_o <= 1'b0;
      default: n1550_o <= 1'b0;
    endcase
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n1535_o)
      6'b100000: n1554_o <= 1'b0;
      6'b010000: n1554_o <= 1'b1;
      6'b001000: n1554_o <= 1'b0;
      6'b000100: n1554_o <= 1'b0;
      6'b000010: n1554_o <= 1'b0;
      6'b000001: n1554_o <= 1'b0;
      default: n1554_o <= 1'b0;
    endcase
  /* ni/config_bus.vhd:194:59  */
  assign n1556_o = n1467_o[31:0];
  /* ni/config_bus.vhd:193:5  */
  assign n1558_o = prev_bank_id == 3'b000;
  /* ni/config_bus.vhd:196:61  */
  assign n1559_o = n1465_o[31:0];
  /* ni/config_bus.vhd:195:5  */
  assign n1561_o = prev_bank_id == 3'b001;
  /* ni/config_bus.vhd:198:60  */
  assign n1562_o = n1463_o[31:0];
  /* ni/config_bus.vhd:197:5  */
  assign n1564_o = prev_bank_id == 3'b010;
  /* ni/config_bus.vhd:200:59  */
  assign n1565_o = n1469_o[31:0];
  /* ni/config_bus.vhd:199:5  */
  assign n1567_o = prev_bank_id == 3'b011;
  /* ni/config_bus.vhd:202:65  */
  assign n1568_o = n1471_o[31:0];
  /* ni/config_bus.vhd:201:5  */
  assign n1570_o = prev_bank_id == 3'b100;
  /* ni/config_bus.vhd:203:5  */
  assign n1572_o = prev_bank_id == 3'b111;
  assign n1573_o = {n1572_o, n1570_o, n1567_o, n1564_o, n1561_o, n1558_o};
  /* ni/config_bus.vhd:192:3  */
  always @*
    case (n1573_o)
      6'b100000: n1574_o <= n1474_o;
      6'b010000: n1574_o <= n1568_o;
      6'b001000: n1574_o <= n1565_o;
      6'b000100: n1574_o <= n1562_o;
      6'b000010: n1574_o <= n1559_o;
      6'b000001: n1574_o <= n1556_o;
      default: n1574_o <= n1474_o;
    endcase
  /* ni/config_bus.vhd:215:7  */
  assign n1579_o = reset ? 2'b00 : next_ocp_resp;
  /* ni/config_bus.vhd:215:7  */
  assign n1581_o = reset ? 3'b000 : bank_id;
  /* ni/config_bus.vhd:214:5  */
  always @(posedge clk)
    n1585_q <= n1579_o;
  /* ni/config_bus.vhd:214:5  */
  always @(posedge clk)
    n1586_q <= n1581_o;
  /* ni/config_bus.vhd:214:5  */
  assign n1587_o = {n1503_o, n1574_o, ocp_resp_reg};
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
  wire [64:0] n1396_o;
  wire [13:0] n1398_o;
  wire [1:0] n1399_o;
  wire n1400_o;
  wire [63:0] n1401_o;
  wire [63:0] n1403_o;
  wire n1404_o;
  wire [80:0] n1405_o;
  wire [80:0] n1406_o;
  wire [80:0] rx_spm_buff;
  wire n1409_o;
  wire n1410_o;
  wire n1411_o;
  wire n1412_o;
  wire n1413_o;
  wire n1414_o;
  wire n1415_o;
  wire n1416_o;
  wire n1417_o;
  wire [80:0] n1418_o;
  wire [80:0] n1419_o;
  wire [80:0] n1420_o;
  wire n1426_o;
  wire n1427_o;
  wire n1428_o;
  wire n1429_o;
  wire n1430_o;
  wire n1431_o;
  wire n1432_o;
  wire n1433_o;
  wire n1434_o;
  wire n1435_o;
  wire n1436_o;
  wire [13:0] n1437_o;
  wire [63:0] n1438_o;
  wire [80:0] n1439_o;
  wire [13:0] n1440_o;
  wire [13:0] n1441_o;
  wire [13:0] n1442_o;
  wire [1:0] n1443_o;
  wire [1:0] n1444_o;
  wire [64:0] n1445_o;
  wire [64:0] n1446_o;
  wire [64:0] n1447_o;
  wire [80:0] n1448_o;
  reg [80:0] n1451_q;
  assign spm_addr = n1398_o;
  assign spm_en = n1399_o;
  assign spm_wr = n1400_o;
  assign spm_wdata = n1401_o;
  assign tx_spm_slv_rdata = n1403_o;
  assign tx_spm_slv_error = n1404_o;
  /* ni/irq_fifo.vhd:146:9  */
  assign n1396_o = {spm_slv_error, spm_slv_rdata};
  /* ni/irq_fifo.vhd:53:17  */
  assign n1398_o = n1420_o[13:0];
  /* ni/irq_fifo.vhd:51:17  */
  assign n1399_o = n1420_o[15:14];
  assign n1400_o = n1420_o[16];
  assign n1401_o = n1420_o[80:17];
  assign n1403_o = n1396_o[63:0];
  /* ni/irq_fifo.vhd:216:9  */
  assign n1404_o = n1396_o[64];
  assign n1405_o = {tx_spm_wdata, tx_spm_wr, tx_spm_en, tx_spm_addr};
  /* ni/irq_fifo.vhd:200:9  */
  assign n1406_o = {rx_spm_wdata, rx_spm_wr, rx_spm_en, rx_spm_addr};
  /* ni/spm_bus.vhd:58:16  */
  assign rx_spm_buff = n1451_q; // (signal)
  /* ni/spm_bus.vhd:65:31  */
  assign n1409_o = n1405_o[14];
  /* ni/spm_bus.vhd:65:55  */
  assign n1410_o = n1405_o[15];
  /* ni/spm_bus.vhd:65:42  */
  assign n1411_o = n1409_o | n1410_o;
  /* ni/spm_bus.vhd:68:44  */
  assign n1412_o = rx_spm_buff[14];
  /* ni/spm_bus.vhd:68:73  */
  assign n1413_o = rx_spm_buff[15];
  /* ni/spm_bus.vhd:68:55  */
  assign n1414_o = n1412_o | n1413_o;
  /* ni/spm_bus.vhd:71:47  */
  assign n1415_o = n1406_o[14];
  /* ni/spm_bus.vhd:71:71  */
  assign n1416_o = n1406_o[15];
  /* ni/spm_bus.vhd:71:58  */
  assign n1417_o = n1415_o | n1416_o;
  /* ni/spm_bus.vhd:71:33  */
  assign n1418_o = n1417_o ? n1406_o : n1405_o;
  /* ni/spm_bus.vhd:68:25  */
  assign n1419_o = n1414_o ? rx_spm_buff : n1418_o;
  /* ni/spm_bus.vhd:65:17  */
  assign n1420_o = n1411_o ? n1405_o : n1419_o;
  /* ni/spm_bus.vhd:87:63  */
  assign n1426_o = n1406_o[14];
  /* ni/spm_bus.vhd:87:81  */
  assign n1427_o = n1405_o[14];
  /* ni/spm_bus.vhd:87:97  */
  assign n1428_o = n1405_o[15];
  /* ni/spm_bus.vhd:87:85  */
  assign n1429_o = n1427_o | n1428_o;
  /* ni/spm_bus.vhd:87:67  */
  assign n1430_o = n1426_o & n1429_o;
  /* ni/spm_bus.vhd:88:63  */
  assign n1431_o = n1406_o[15];
  /* ni/spm_bus.vhd:88:81  */
  assign n1432_o = n1405_o[14];
  /* ni/spm_bus.vhd:88:97  */
  assign n1433_o = n1405_o[15];
  /* ni/spm_bus.vhd:88:85  */
  assign n1434_o = n1432_o | n1433_o;
  /* ni/spm_bus.vhd:88:67  */
  assign n1435_o = n1431_o & n1434_o;
  /* ni/spm_bus.vhd:89:61  */
  assign n1436_o = n1406_o[16];
  /* ni/spm_bus.vhd:90:61  */
  assign n1437_o = n1406_o[13:0];
  /* ni/spm_bus.vhd:91:61  */
  assign n1438_o = n1406_o[80:17];
  assign n1439_o = {n1438_o, n1436_o, n1435_o, n1430_o, n1437_o};
  assign n1440_o = n1439_o[13:0];
  assign n1441_o = rx_spm_buff[13:0];
  /* ni/spm_bus.vhd:84:25  */
  assign n1442_o = reset ? n1441_o : n1440_o;
  assign n1443_o = n1439_o[15:14];
  /* ni/spm_bus.vhd:84:25  */
  assign n1444_o = reset ? 2'b00 : n1443_o;
  assign n1445_o = n1439_o[80:16];
  assign n1446_o = rx_spm_buff[80:16];
  /* ni/spm_bus.vhd:84:25  */
  assign n1447_o = reset ? n1446_o : n1445_o;
  assign n1448_o = {n1447_o, n1444_o, n1442_o};
  /* ni/spm_bus.vhd:83:17  */
  always @(posedge clk)
    n1451_q <= n1448_o;
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
  wire [47:0] n1231_o;
  wire [31:0] n1233_o;
  wire n1234_o;
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
  wire n1239_o;
  wire n1240_o;
  wire n1243_o;
  wire n1244_o;
  wire [4:0] n1248_o;
  wire n1249_o;
  wire n1251_o;
  wire n1253_o;
  wire n1254_o;
  wire n1255_o;
  wire n1256_o;
  wire [4:0] n1260_o;
  wire n1261_o;
  wire n1263_o;
  wire n1265_o;
  wire n1266_o;
  wire n1267_o;
  wire n1268_o;
  wire n1270_o;
  wire [4:0] n1271_o;
  wire n1274_o;
  wire n1275_o;
  wire n1276_o;
  wire n1277_o;
  wire [10:0] n1278_o;
  wire n1280_o;
  wire n1282_o;
  wire [1:0] n1283_o;
  reg n1286_o;
  reg n1289_o;
  reg n1292_o;
  reg [4:0] n1293_o;
  wire n1295_o;
  wire n1297_o;
  wire n1299_o;
  wire [4:0] n1300_o;
  wire n1302_o;
  wire n1305_o;
  wire n1308_o;
  wire n1310_o;
  wire n1312_o;
  wire n1313_o;
  wire n1314_o;
  localparam n1316_o = 1'b0;
  localparam [13:0] n1317_o = 14'b00000000000000;
  wire [13:0] tdpram_n1318;
  wire [13:0] tdpram_a_dout;
  wire [13:0] tdpram_b_dout;
  wire n1325_o;
  wire n1327_o;
  wire [4:0] n1329_o;
  wire [4:0] n1331_o;
  wire [4:0] n1332_o;
  wire [4:0] n1334_o;
  reg [4:0] n1337_q;
  wire n1341_o;
  wire n1343_o;
  wire [4:0] n1345_o;
  wire [4:0] n1347_o;
  wire [4:0] n1348_o;
  wire [4:0] n1350_o;
  reg [4:0] n1353_q;
  wire n1357_o;
  wire n1359_o;
  wire [4:0] n1361_o;
  wire [4:0] n1363_o;
  wire [4:0] n1364_o;
  wire [4:0] n1366_o;
  reg [4:0] n1369_q;
  wire n1373_o;
  wire n1375_o;
  wire [4:0] n1377_o;
  wire [4:0] n1379_o;
  wire [4:0] n1380_o;
  wire [4:0] n1382_o;
  reg [4:0] n1385_q;
  wire n1390_o;
  reg n1394_q;
  wire [32:0] n1395_o;
  assign config_slv_rdata = n1233_o;
  assign config_slv_error = n1234_o;
  assign irq_irq_sig = irq_not_empty;
  assign irq_data_sig = data_not_empty;
  /* ni/rx_unit.vhd:55:17  */
  assign n1231_o = {config_wdata, config_wr, config_en, config_addr};
  /* ni/rx_unit.vhd:52:17  */
  assign n1233_o = n1395_o[31:0];
  /* ni/rx_unit.vhd:50:17  */
  assign n1234_o = n1395_o[32];
  /* ni/irq_fifo.vhd:94:16  */
  assign irq_not_empty = n1240_o; // (signal)
  /* ni/irq_fifo.vhd:94:31  */
  assign data_not_empty = n1244_o; // (signal)
  /* ni/irq_fifo.vhd:94:47  */
  assign next_error = n1302_o; // (signal)
  /* ni/irq_fifo.vhd:94:59  */
  assign irq_read = n1305_o; // (signal)
  /* ni/irq_fifo.vhd:94:69  */
  assign data_read = n1308_o; // (signal)
  /* ni/irq_fifo.vhd:94:80  */
  assign irq_not_full = n1256_o; // (signal)
  /* ni/irq_fifo.vhd:94:94  */
  assign data_not_full = n1268_o; // (signal)
  /* ni/irq_fifo.vhd:95:16  */
  assign data_w_ptr = n1353_q; // (signal)
  /* ni/irq_fifo.vhd:95:28  */
  assign data_r_ptr = n1385_q; // (signal)
  /* ni/irq_fifo.vhd:95:40  */
  assign irq_w_ptr = n1337_q; // (signal)
  /* ni/irq_fifo.vhd:95:51  */
  assign irq_r_ptr = n1369_q; // (signal)
  /* ni/irq_fifo.vhd:95:62  */
  assign w_ptr = n1271_o; // (signal)
  /* ni/irq_fifo.vhd:95:69  */
  assign r_ptr = n1300_o; // (signal)
  /* ni/irq_fifo.vhd:96:16  */
  assign w_data = irq_data_fifo_data; // (signal)
  /* ni/irq_fifo.vhd:106:46  */
  assign n1239_o = irq_w_ptr == irq_r_ptr;
  /* ni/irq_fifo.vhd:106:31  */
  assign n1240_o = n1239_o ? 1'b0 : 1'b1;
  /* ni/irq_fifo.vhd:107:47  */
  assign n1243_o = data_w_ptr == data_r_ptr;
  /* ni/irq_fifo.vhd:107:31  */
  assign n1244_o = n1243_o ? 1'b0 : 1'b1;
  /* ni/irq_fifo.vhd:109:59  */
  assign n1248_o = irq_r_ptr - 5'b00001;
  /* ni/irq_fifo.vhd:109:47  */
  assign n1249_o = irq_w_ptr == n1248_o;
  /* ni/irq_fifo.vhd:109:78  */
  assign n1251_o = irq_w_ptr == 5'b01111;
  /* ni/irq_fifo.vhd:109:146  */
  assign n1253_o = irq_r_ptr == 5'b00000;
  /* ni/irq_fifo.vhd:109:132  */
  assign n1254_o = n1251_o & n1253_o;
  /* ni/irq_fifo.vhd:109:64  */
  assign n1255_o = n1249_o | n1254_o;
  /* ni/irq_fifo.vhd:109:30  */
  assign n1256_o = n1255_o ? 1'b0 : 1'b1;
  /* ni/irq_fifo.vhd:110:61  */
  assign n1260_o = data_r_ptr + 5'b00001;
  /* ni/irq_fifo.vhd:110:48  */
  assign n1261_o = data_w_ptr == n1260_o;
  /* ni/irq_fifo.vhd:110:81  */
  assign n1263_o = data_w_ptr == 5'b10000;
  /* ni/irq_fifo.vhd:110:151  */
  assign n1265_o = data_r_ptr == 5'b11111;
  /* ni/irq_fifo.vhd:110:136  */
  assign n1266_o = n1263_o & n1265_o;
  /* ni/irq_fifo.vhd:110:66  */
  assign n1267_o = n1261_o | n1266_o;
  /* ni/irq_fifo.vhd:110:30  */
  assign n1268_o = n1267_o ? 1'b0 : 1'b1;
  /* ni/irq_fifo.vhd:113:59  */
  assign n1270_o = ~irq_data_fifo_data_valid;
  /* ni/irq_fifo.vhd:113:29  */
  assign n1271_o = n1270_o ? irq_w_ptr : data_w_ptr;
  /* ni/irq_fifo.vhd:123:42  */
  assign n1274_o = n1231_o[14];
  /* ni/irq_fifo.vhd:123:31  */
  assign n1275_o = sel & n1274_o;
  /* ni/irq_fifo.vhd:125:35  */
  assign n1276_o = n1231_o[15];
  /* ni/irq_fifo.vhd:125:38  */
  assign n1277_o = ~n1276_o;
  /* ni/irq_fifo.vhd:126:50  */
  assign n1278_o = n1231_o[10:0];
  /* ni/irq_fifo.vhd:128:11  */
  assign n1280_o = n1278_o == 11'b00000000000;
  /* ni/irq_fifo.vhd:132:11  */
  assign n1282_o = n1278_o == 11'b00000000001;
  assign n1283_o = {n1282_o, n1280_o};
  /* ni/irq_fifo.vhd:126:33  */
  always @*
    case (n1283_o)
      2'b10: n1286_o <= 1'b0;
      2'b01: n1286_o <= 1'b0;
      default: n1286_o <= 1'b1;
    endcase
  /* ni/irq_fifo.vhd:126:33  */
  always @*
    case (n1283_o)
      2'b10: n1289_o <= 1'b0;
      2'b01: n1289_o <= 1'b1;
      default: n1289_o <= 1'b0;
    endcase
  /* ni/irq_fifo.vhd:126:33  */
  always @*
    case (n1283_o)
      2'b10: n1292_o <= 1'b1;
      2'b01: n1292_o <= 1'b0;
      default: n1292_o <= 1'b0;
    endcase
  /* ni/irq_fifo.vhd:126:33  */
  always @*
    case (n1283_o)
      2'b10: n1293_o <= data_r_ptr;
      2'b01: n1293_o <= irq_r_ptr;
      default: n1293_o <= data_r_ptr;
    endcase
  /* ni/irq_fifo.vhd:125:25  */
  assign n1295_o = n1277_o ? n1286_o : 1'b1;
  /* ni/irq_fifo.vhd:125:25  */
  assign n1297_o = n1277_o ? n1289_o : 1'b0;
  /* ni/irq_fifo.vhd:125:25  */
  assign n1299_o = n1277_o ? n1292_o : 1'b0;
  /* ni/irq_fifo.vhd:123:17  */
  assign n1300_o = n1310_o ? n1293_o : data_r_ptr;
  /* ni/irq_fifo.vhd:123:17  */
  assign n1302_o = n1275_o ? n1295_o : 1'b0;
  /* ni/irq_fifo.vhd:123:17  */
  assign n1305_o = n1275_o ? n1297_o : 1'b0;
  /* ni/irq_fifo.vhd:123:17  */
  assign n1308_o = n1275_o ? n1299_o : 1'b0;
  /* ni/irq_fifo.vhd:123:17  */
  assign n1310_o = n1275_o & n1277_o;
  /* ni/irq_fifo.vhd:154:60  */
  assign n1312_o = irq_irq_fifo_data_valid & irq_not_full;
  /* ni/irq_fifo.vhd:154:108  */
  assign n1313_o = irq_data_fifo_data_valid & data_not_full;
  /* ni/irq_fifo.vhd:154:79  */
  assign n1314_o = n1312_o | n1313_o;
  /* ni/irq_fifo.vhd:164:35  */
  assign tdpram_n1318 = tdpram_b_dout; // (signal)
  /* ni/irq_fifo.vhd:146:9  */
  tdp_ram_14_5 tdpram (
    .a_clk(clk),
    .a_wr(n1314_o),
    .a_addr(w_ptr),
    .a_din(w_data),
    .b_clk(clk),
    .b_wr(n1316_o),
    .b_addr(r_ptr),
    .b_din(n1317_o),
    .a_dout(),
    .b_dout(tdpram_b_dout));
  /* ni/irq_fifo.vhd:173:57  */
  assign n1325_o = irq_irq_fifo_data_valid & irq_not_full;
  /* ni/irq_fifo.vhd:174:47  */
  assign n1327_o = irq_w_ptr == 5'b01111;
  /* ni/irq_fifo.vhd:177:64  */
  assign n1329_o = irq_w_ptr + 5'b00001;
  /* ni/irq_fifo.vhd:174:33  */
  assign n1331_o = n1327_o ? 5'b00000 : n1329_o;
  /* ni/irq_fifo.vhd:173:25  */
  assign n1332_o = n1325_o ? n1331_o : irq_w_ptr;
  /* ni/irq_fifo.vhd:171:25  */
  assign n1334_o = reset ? 5'b00000 : n1332_o;
  /* ni/irq_fifo.vhd:170:17  */
  always @(posedge clk)
    n1337_q <= n1334_o;
  /* ni/irq_fifo.vhd:189:58  */
  assign n1341_o = irq_data_fifo_data_valid & data_not_full;
  /* ni/irq_fifo.vhd:190:48  */
  assign n1343_o = data_w_ptr == 5'b10000;
  /* ni/irq_fifo.vhd:193:66  */
  assign n1345_o = data_w_ptr - 5'b00001;
  /* ni/irq_fifo.vhd:190:33  */
  assign n1347_o = n1343_o ? 5'b11111 : n1345_o;
  /* ni/irq_fifo.vhd:189:25  */
  assign n1348_o = n1341_o ? n1347_o : data_w_ptr;
  /* ni/irq_fifo.vhd:187:25  */
  assign n1350_o = reset ? 5'b11111 : n1348_o;
  /* ni/irq_fifo.vhd:186:17  */
  always @(posedge clk)
    n1353_q <= n1350_o;
  /* ni/irq_fifo.vhd:205:49  */
  assign n1357_o = irq_read & irq_not_empty;
  /* ni/irq_fifo.vhd:206:47  */
  assign n1359_o = irq_r_ptr == 5'b01111;
  /* ni/irq_fifo.vhd:209:64  */
  assign n1361_o = irq_r_ptr + 5'b00001;
  /* ni/irq_fifo.vhd:206:33  */
  assign n1363_o = n1359_o ? 5'b00000 : n1361_o;
  /* ni/irq_fifo.vhd:205:25  */
  assign n1364_o = n1357_o ? n1363_o : irq_r_ptr;
  /* ni/irq_fifo.vhd:203:25  */
  assign n1366_o = reset ? 5'b00000 : n1364_o;
  /* ni/irq_fifo.vhd:202:17  */
  always @(posedge clk)
    n1369_q <= n1366_o;
  /* ni/irq_fifo.vhd:221:50  */
  assign n1373_o = data_read & data_not_empty;
  /* ni/irq_fifo.vhd:222:48  */
  assign n1375_o = data_r_ptr == 5'b10000;
  /* ni/irq_fifo.vhd:225:66  */
  assign n1377_o = data_r_ptr - 5'b00001;
  /* ni/irq_fifo.vhd:222:33  */
  assign n1379_o = n1375_o ? 5'b11111 : n1377_o;
  /* ni/irq_fifo.vhd:221:25  */
  assign n1380_o = n1373_o ? n1379_o : data_r_ptr;
  /* ni/irq_fifo.vhd:219:25  */
  assign n1382_o = reset ? 5'b11111 : n1380_o;
  /* ni/irq_fifo.vhd:218:17  */
  always @(posedge clk)
    n1385_q <= n1382_o;
  /* ni/irq_fifo.vhd:234:25  */
  assign n1390_o = reset ? 1'b0 : next_error;
  /* ni/irq_fifo.vhd:233:17  */
  always @(posedge clk)
    n1394_q <= n1390_o;
  /* ni/irq_fifo.vhd:233:17  */
  assign n1395_o = {n1394_q, 18'b000000000000000000, tdpram_n1318};
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
  wire [13:0] n1041_o;
  wire [1:0] n1042_o;
  wire n1043_o;
  wire [63:0] n1044_o;
  wire [13:0] n1046_o;
  wire n1047_o;
  wire n1048_o;
  wire [31:0] n1049_o;
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
  wire n1053_o;
  wire n1054_o;
  wire n1055_o;
  wire n1056_o;
  wire n1057_o;
  wire n1058_o;
  wire n1059_o;
  wire n1060_o;
  wire n1061_o;
  wire n1062_o;
  wire n1063_o;
  wire n1064_o;
  wire n1065_o;
  wire n1066_o;
  wire n1067_o;
  wire n1068_o;
  wire n1069_o;
  wire n1070_o;
  wire [31:0] n1071_o;
  wire [31:0] n1072_o;
  wire n1073_o;
  wire n1074_o;
  localparam [1:0] n1077_o = 2'b00;
  wire [13:0] n1082_o;
  wire [13:0] n1083_o;
  wire [2:0] n1085_o;
  wire [2:0] n1087_o;
  wire [2:0] n1089_o;
  wire n1091_o;
  wire [13:0] n1093_o;
  wire n1094_o;
  wire n1095_o;
  wire [31:0] n1098_o;
  wire n1099_o;
  wire n1100_o;
  wire n1101_o;
  wire [31:0] n1102_o;
  wire n1105_o;
  wire [2:0] n1108_o;
  wire n1110_o;
  localparam [1:0] n1111_o = 2'b11;
  wire n1113_o;
  wire n1114_o;
  wire [2:0] n1117_o;
  wire n1119_o;
  wire n1122_o;
  wire n1123_o;
  wire [2:0] n1126_o;
  wire n1128_o;
  wire n1132_o;
  wire [31:0] n1135_o;
  wire n1137_o;
  wire [5:0] n1138_o;
  wire n1139_o;
  wire n1140_o;
  reg n1142_o;
  wire n1143_o;
  wire n1144_o;
  reg n1146_o;
  reg n1148_o;
  reg [31:0] n1150_o;
  reg n1153_o;
  reg n1155_o;
  reg [13:0] n1157_o;
  reg n1161_o;
  reg n1165_o;
  reg n1170_o;
  reg [13:0] n1173_o;
  reg [13:0] n1175_o;
  reg [2:0] n1179_o;
  wire [13:0] n1185_o;
  wire [13:0] n1186_o;
  reg [13:0] n1189_q;
  wire [31:0] n1193_o;
  wire [31:0] n1197_o;
  reg [31:0] n1198_q;
  wire [13:0] n1203_o;
  wire [2:0] n1205_o;
  reg [13:0] n1209_q;
  reg [2:0] n1210_q;
  wire n1214_o;
  wire n1215_o;
  wire n1216_o;
  wire n1217_o;
  wire n1218_o;
  wire n1219_o;
  wire n1220_o;
  wire n1221_o;
  wire n1223_o;
  wire n1225_o;
  reg n1228_q;
  wire [80:0] n1229_o;
  wire [47:0] n1230_o;
  assign spm_addr = n1041_o;
  assign spm_en = n1042_o;
  assign spm_wr = n1043_o;
  assign spm_wdata = n1044_o;
  assign config_addr = n1046_o;
  assign config_en = n1047_o;
  assign config_wr = n1048_o;
  assign config_wdata = n1049_o;
  assign irq_fifo_data = n1157_o;
  assign irq_fifo_data_valid = n1074_o;
  assign irq_fifo_irq_valid = n1161_o;
  /* ni/packet_manager.vhd:323:16  */
  assign n1041_o = n1229_o[13:0];
  /* ni/packet_manager.vhd:318:16  */
  assign n1042_o = n1229_o[15:14];
  /* ni/packet_manager.vhd:60:5  */
  assign n1043_o = n1229_o[16];
  /* ni/packet_manager.vhd:51:5  */
  assign n1044_o = n1229_o[80:17];
  assign n1046_o = n1230_o[13:0];
  /* ni/packet_manager.vhd:399:1  */
  assign n1047_o = n1230_o[14];
  assign n1048_o = n1230_o[15];
  /* ni/packet_manager.vhd:387:1  */
  assign n1049_o = n1230_o[47:16];
  /* ni/rx_unit.vhd:63:16  */
  assign new_pkt = n1058_o; // (signal)
  /* ni/rx_unit.vhd:63:25  */
  assign new_data_pkt = n1061_o; // (signal)
  /* ni/rx_unit.vhd:63:39  */
  assign new_config_pkt = n1066_o; // (signal)
  /* ni/rx_unit.vhd:63:55  */
  assign new_irq_pkt = n1070_o; // (signal)
  /* ni/rx_unit.vhd:64:16  */
  assign wdata_high_en = n1165_o; // (signal)
  /* ni/rx_unit.vhd:64:45  */
  assign addr_load = n1170_o; // (signal)
  /* ni/rx_unit.vhd:64:56  */
  assign lst_data_pkt = n1228_q; // (signal)
  /* ni/rx_unit.vhd:65:16  */
  assign addr = n1189_q; // (signal)
  /* ni/rx_unit.vhd:65:22  */
  assign next_addr = n1173_o; // (signal)
  /* ni/rx_unit.vhd:65:33  */
  assign int_addr = n1209_q; // (signal)
  /* ni/rx_unit.vhd:65:43  */
  assign next_int_addr = n1175_o; // (signal)
  /* ni/rx_unit.vhd:67:8  */
  assign wdata_high = n1198_q; // (signal)
  /* ni/rx_unit.vhd:71:16  */
  assign state = n1210_q; // (signal)
  /* ni/rx_unit.vhd:71:23  */
  assign next_state = n1179_o; // (signal)
  /* ni/rx_unit.vhd:75:26  */
  assign n1053_o = pkt_in[34];
  /* ni/rx_unit.vhd:75:53  */
  assign n1054_o = pkt_in[33];
  /* ni/rx_unit.vhd:75:43  */
  assign n1055_o = n1053_o & n1054_o;
  /* ni/rx_unit.vhd:75:85  */
  assign n1056_o = pkt_in[32];
  /* ni/rx_unit.vhd:75:75  */
  assign n1057_o = ~n1056_o;
  /* ni/rx_unit.vhd:75:70  */
  assign n1058_o = n1055_o & n1057_o;
  /* ni/rx_unit.vhd:78:48  */
  assign n1059_o = pkt_in[30];
  /* ni/rx_unit.vhd:78:38  */
  assign n1060_o = ~n1059_o;
  /* ni/rx_unit.vhd:78:33  */
  assign n1061_o = new_pkt & n1060_o;
  /* ni/rx_unit.vhd:81:49  */
  assign n1062_o = pkt_in[31];
  /* ni/rx_unit.vhd:81:39  */
  assign n1063_o = ~n1062_o;
  /* ni/rx_unit.vhd:81:35  */
  assign n1064_o = new_pkt & n1063_o;
  /* ni/rx_unit.vhd:81:106  */
  assign n1065_o = pkt_in[30];
  /* ni/rx_unit.vhd:81:96  */
  assign n1066_o = n1064_o & n1065_o;
  /* ni/rx_unit.vhd:84:42  */
  assign n1067_o = pkt_in[31];
  /* ni/rx_unit.vhd:84:32  */
  assign n1068_o = new_pkt & n1067_o;
  /* ni/rx_unit.vhd:84:98  */
  assign n1069_o = pkt_in[30];
  /* ni/rx_unit.vhd:84:88  */
  assign n1070_o = n1068_o & n1069_o;
  /* ni/rx_unit.vhd:87:62  */
  assign n1071_o = pkt_in[31:0];
  /* ni/rx_unit.vhd:89:65  */
  assign n1072_o = pkt_in[31:0];
  /* ni/rx_unit.vhd:96:55  */
  assign n1073_o = pkt_in[32];
  /* ni/rx_unit.vhd:96:45  */
  assign n1074_o = lst_data_pkt & n1073_o;
  /* ni/rx_unit.vhd:113:43  */
  assign n1082_o = int_addr + 14'b00000000000001;
  /* ni/rx_unit.vhd:117:65  */
  assign n1083_o = pkt_in[29:16];
  /* ni/rx_unit.vhd:122:33  */
  assign n1085_o = new_irq_pkt ? 3'b101 : state;
  /* ni/rx_unit.vhd:120:33  */
  assign n1087_o = new_config_pkt ? 3'b100 : n1085_o;
  /* ni/rx_unit.vhd:118:33  */
  assign n1089_o = new_data_pkt ? 3'b010 : n1087_o;
  /* ni/rx_unit.vhd:115:25  */
  assign n1091_o = state == 3'b000;
  /* ni/rx_unit.vhd:127:55  */
  assign n1093_o = addr + 14'b00000000000001;
  /* ni/rx_unit.vhd:128:43  */
  assign n1094_o = pkt_in[32];
  /* ni/rx_unit.vhd:128:60  */
  assign n1095_o = ~n1094_o;
  /* ni/rx_unit.vhd:134:107  */
  assign n1098_o = pkt_in[31:0];
  assign n1099_o = n1077_o[0];
  /* ni/rx_unit.vhd:128:33  */
  assign n1100_o = n1095_o ? n1099_o : 1'b1;
  /* ni/rx_unit.vhd:128:33  */
  assign n1101_o = n1095_o ? 1'b0 : 1'b1;
  /* ni/rx_unit.vhd:128:33  */
  assign n1102_o = n1095_o ? wdata_high : n1098_o;
  /* ni/rx_unit.vhd:128:33  */
  assign n1105_o = n1095_o ? 1'b1 : 1'b0;
  /* ni/rx_unit.vhd:128:33  */
  assign n1108_o = n1095_o ? 3'b001 : 3'b000;
  /* ni/rx_unit.vhd:126:25  */
  assign n1110_o = state == 3'b010;
  /* ni/rx_unit.vhd:143:43  */
  assign n1113_o = pkt_in[32];
  /* ni/rx_unit.vhd:143:60  */
  assign n1114_o = ~n1113_o;
  /* ni/rx_unit.vhd:143:33  */
  assign n1117_o = n1114_o ? 3'b010 : 3'b000;
  /* ni/rx_unit.vhd:138:25  */
  assign n1119_o = state == 3'b001;
  /* ni/rx_unit.vhd:153:43  */
  assign n1122_o = pkt_in[32];
  /* ni/rx_unit.vhd:153:60  */
  assign n1123_o = ~n1122_o;
  /* ni/rx_unit.vhd:153:33  */
  assign n1126_o = n1123_o ? 3'b011 : 3'b000;
  /* ni/rx_unit.vhd:150:25  */
  assign n1128_o = state == 3'b100;
  /* ni/rx_unit.vhd:159:25  */
  assign n1132_o = state == 3'b011;
  /* ni/rx_unit.vhd:169:99  */
  assign n1135_o = pkt_in[31:0];
  /* ni/rx_unit.vhd:165:25  */
  assign n1137_o = state == 3'b101;
  assign n1138_o = {n1137_o, n1132_o, n1128_o, n1119_o, n1110_o, n1091_o};
  assign n1139_o = n1111_o[0];
  assign n1140_o = n1077_o[0];
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1138_o)
      6'b100000: n1142_o <= 1'b1;
      6'b010000: n1142_o <= n1140_o;
      6'b001000: n1142_o <= n1140_o;
      6'b000100: n1142_o <= n1139_o;
      6'b000010: n1142_o <= n1100_o;
      6'b000001: n1142_o <= n1140_o;
      default: n1142_o <= 1'bX;
    endcase
  assign n1143_o = n1111_o[1];
  assign n1144_o = n1077_o[1];
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1138_o)
      6'b100000: n1146_o <= n1144_o;
      6'b010000: n1146_o <= n1144_o;
      6'b001000: n1146_o <= n1144_o;
      6'b000100: n1146_o <= n1143_o;
      6'b000010: n1146_o <= n1144_o;
      6'b000001: n1146_o <= n1144_o;
      default: n1146_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1138_o)
      6'b100000: n1148_o <= 1'b1;
      6'b010000: n1148_o <= 1'b0;
      6'b001000: n1148_o <= 1'b0;
      6'b000100: n1148_o <= 1'b1;
      6'b000010: n1148_o <= n1101_o;
      6'b000001: n1148_o <= 1'b0;
      default: n1148_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1138_o)
      6'b100000: n1150_o <= n1135_o;
      6'b010000: n1150_o <= wdata_high;
      6'b001000: n1150_o <= wdata_high;
      6'b000100: n1150_o <= wdata_high;
      6'b000010: n1150_o <= n1102_o;
      6'b000001: n1150_o <= wdata_high;
      default: n1150_o <= 32'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1138_o)
      6'b100000: n1153_o <= 1'b0;
      6'b010000: n1153_o <= 1'b1;
      6'b001000: n1153_o <= 1'b1;
      6'b000100: n1153_o <= 1'b0;
      6'b000010: n1153_o <= 1'b0;
      6'b000001: n1153_o <= 1'b0;
      default: n1153_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1138_o)
      6'b100000: n1155_o <= 1'b0;
      6'b010000: n1155_o <= 1'b1;
      6'b001000: n1155_o <= 1'b1;
      6'b000100: n1155_o <= 1'b0;
      6'b000010: n1155_o <= 1'b0;
      6'b000001: n1155_o <= 1'b0;
      default: n1155_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1138_o)
      6'b100000: n1157_o <= addr;
      6'b010000: n1157_o <= addr;
      6'b001000: n1157_o <= addr;
      6'b000100: n1157_o <= int_addr;
      6'b000010: n1157_o <= addr;
      6'b000001: n1157_o <= addr;
      default: n1157_o <= 14'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1138_o)
      6'b100000: n1161_o <= 1'b1;
      6'b010000: n1161_o <= 1'b0;
      6'b001000: n1161_o <= 1'b0;
      6'b000100: n1161_o <= 1'b0;
      6'b000010: n1161_o <= 1'b0;
      6'b000001: n1161_o <= 1'b0;
      default: n1161_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1138_o)
      6'b100000: n1165_o <= 1'b0;
      6'b010000: n1165_o <= 1'b0;
      6'b001000: n1165_o <= 1'b0;
      6'b000100: n1165_o <= 1'b0;
      6'b000010: n1165_o <= n1105_o;
      6'b000001: n1165_o <= 1'b0;
      default: n1165_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1138_o)
      6'b100000: n1170_o <= 1'b0;
      6'b010000: n1170_o <= 1'b0;
      6'b001000: n1170_o <= 1'b0;
      6'b000100: n1170_o <= 1'b0;
      6'b000010: n1170_o <= 1'b0;
      6'b000001: n1170_o <= 1'b1;
      default: n1170_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1138_o)
      6'b100000: n1173_o <= addr;
      6'b010000: n1173_o <= addr;
      6'b001000: n1173_o <= addr;
      6'b000100: n1173_o <= next_int_addr;
      6'b000010: n1173_o <= addr;
      6'b000001: n1173_o <= addr;
      default: n1173_o <= 14'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1138_o)
      6'b100000: n1175_o <= n1082_o;
      6'b010000: n1175_o <= n1082_o;
      6'b001000: n1175_o <= n1082_o;
      6'b000100: n1175_o <= n1082_o;
      6'b000010: n1175_o <= n1093_o;
      6'b000001: n1175_o <= n1083_o;
      default: n1175_o <= 14'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n1138_o)
      6'b100000: n1179_o <= 3'b000;
      6'b010000: n1179_o <= 3'b000;
      6'b001000: n1179_o <= n1126_o;
      6'b000100: n1179_o <= n1117_o;
      6'b000010: n1179_o <= n1108_o;
      6'b000001: n1179_o <= n1089_o;
      default: n1179_o <= 3'bX;
    endcase
  /* ni/rx_unit.vhd:180:56  */
  assign n1185_o = pkt_in[29:16];
  /* ni/rx_unit.vhd:179:25  */
  assign n1186_o = addr_load ? n1185_o : next_addr;
  /* ni/rx_unit.vhd:178:17  */
  always @(posedge clk)
    n1189_q <= n1186_o;
  /* ni/rx_unit.vhd:192:62  */
  assign n1193_o = pkt_in[31:0];
  /* ni/rx_unit.vhd:190:17  */
  assign n1197_o = wdata_high_en ? n1193_o : wdata_high;
  /* ni/rx_unit.vhd:190:17  */
  always @(posedge clk)
    n1198_q <= n1197_o;
  /* ni/rx_unit.vhd:201:25  */
  assign n1203_o = reset ? 14'b00000000000000 : next_int_addr;
  /* ni/rx_unit.vhd:201:25  */
  assign n1205_o = reset ? 3'b000 : next_state;
  /* ni/rx_unit.vhd:200:17  */
  always @(posedge clk)
    n1209_q <= n1203_o;
  /* ni/rx_unit.vhd:200:17  */
  always @(posedge clk)
    n1210_q <= n1205_o;
  /* ni/rx_unit.vhd:217:77  */
  assign n1214_o = pkt_in[31];
  /* ni/rx_unit.vhd:217:67  */
  assign n1215_o = new_data_pkt & n1214_o;
  /* ni/rx_unit.vhd:217:49  */
  assign n1216_o = ~n1215_o;
  /* ni/rx_unit.vhd:217:135  */
  assign n1217_o = pkt_in[32];
  /* ni/rx_unit.vhd:217:125  */
  assign n1218_o = n1216_o & n1217_o;
  /* ni/rx_unit.vhd:217:43  */
  assign n1219_o = reset | n1218_o;
  /* ni/rx_unit.vhd:219:56  */
  assign n1220_o = pkt_in[31];
  /* ni/rx_unit.vhd:219:46  */
  assign n1221_o = new_data_pkt & n1220_o;
  /* ni/rx_unit.vhd:219:25  */
  assign n1223_o = n1221_o ? 1'b1 : lst_data_pkt;
  /* ni/rx_unit.vhd:217:25  */
  assign n1225_o = n1219_o ? 1'b0 : n1223_o;
  /* ni/rx_unit.vhd:216:17  */
  always @(posedge clk)
    n1228_q <= n1225_o;
  /* ni/rx_unit.vhd:216:17  */
  assign n1229_o = {n1150_o, n1071_o, n1148_o, n1146_o, n1142_o, addr};
  assign n1230_o = {n1072_o, n1155_o, n1153_o, int_addr};
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
  wire [47:0] n683_o;
  wire [31:0] n685_o;
  wire n686_o;
  wire [13:0] n688_o;
  wire [1:0] n689_o;
  wire n690_o;
  wire [63:0] n691_o;
  wire [64:0] n692_o;
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
  wire [13:0] n700_o;
  wire [3:0] n701_o;
  wire [1:0] n702_o;
  wire n704_o;
  wire [1:0] n706_o;
  wire [4:0] n708_o;
  wire [7:0] n710_o;
  wire [18:0] n712_o;
  wire [34:0] n713_o;
  wire n714_o;
  wire [13:0] n716_o;
  wire [13:0] n717_o;
  wire [13:0] n718_o;
  wire [13:0] n720_o;
  wire [13:0] n721_o;
  wire [13:0] n722_o;
  wire n723_o;
  wire [1:0] n724_o;
  wire n726_o;
  wire [1:0] n728_o;
  wire n730_o;
  wire n731_o;
  wire [13:0] n732_o;
  wire [13:0] n733_o;
  wire [13:0] n734_o;
  wire [13:0] n735_o;
  wire [13:0] n736_o;
  wire [13:0] n737_o;
  wire [13:0] n738_o;
  wire [13:0] n739_o;
  wire [13:0] n740_o;
  wire [1:0] n741_o;
  wire n743_o;
  wire [3:0] n744_o;
  wire [3:0] n745_o;
  wire [3:0] n746_o;
  wire [9:0] n747_o;
  wire [3:0] n749_o;
  wire [4:0] n751_o;
  wire [13:0] n752_o;
  wire [18:0] n753_o;
  wire [34:0] n754_o;
  wire [15:0] n755_o;
  wire [15:0] n756_o;
  wire [15:0] n757_o;
  wire [34:0] n759_o;
  wire [2:0] n761_o;
  wire [13:0] n762_o;
  wire n763_o;
  wire [13:0] n764_o;
  wire n767_o;
  wire [13:0] n768_o;
  wire [28:0] n769_o;
  wire [13:0] n770_o;
  wire [13:0] n771_o;
  wire [27:0] n772_o;
  wire [28:0] n773_o;
  wire [28:0] n774_o;
  wire [3:0] n775_o;
  wire [15:0] n776_o;
  wire [15:0] n777_o;
  wire [34:0] n778_o;
  wire [2:0] n780_o;
  wire [13:0] n781_o;
  wire [1:0] n782_o;
  wire [13:0] n783_o;
  wire n785_o;
  wire [13:0] n786_o;
  wire [13:0] n787_o;
  wire [27:0] n788_o;
  wire [28:0] n789_o;
  wire [28:0] n790_o;
  wire [3:0] n791_o;
  wire [1:0] n793_o;
  wire [1:0] n795_o;
  wire [15:0] n796_o;
  wire [15:0] n797_o;
  wire [34:0] n799_o;
  wire [2:0] n800_o;
  wire [13:0] n801_o;
  wire [1:0] n802_o;
  wire [13:0] n803_o;
  wire n805_o;
  wire [13:0] n806_o;
  wire [13:0] n807_o;
  wire [27:0] n808_o;
  wire [28:0] n809_o;
  wire [28:0] n810_o;
  wire [3:0] n811_o;
  wire [1:0] n813_o;
  wire [1:0] n815_o;
  wire n817_o;
  wire [31:0] n818_o;
  wire [3:0] n820_o;
  wire [13:0] n822_o;
  wire n824_o;
  wire n826_o;
  wire n827_o;
  wire [31:0] n828_o;
  wire [34:0] n830_o;
  wire [13:0] n832_o;
  wire [31:0] n833_o;
  wire [34:0] n835_o;
  wire [34:0] n836_o;
  wire [2:0] n839_o;
  wire [13:0] n840_o;
  wire n842_o;
  wire [3:0] n844_o;
  wire [13:0] n846_o;
  wire n848_o;
  wire n850_o;
  wire n851_o;
  wire [34:0] n853_o;
  wire [13:0] n856_o;
  wire [34:0] n858_o;
  wire [15:0] n859_o;
  wire [15:0] n860_o;
  wire [15:0] n861_o;
  wire [34:0] n862_o;
  wire [2:0] n865_o;
  wire [13:0] n866_o;
  wire n868_o;
  wire [34:0] n870_o;
  wire n872_o;
  wire [34:0] n874_o;
  wire n876_o;
  wire [4:0] n877_o;
  wire [15:0] n878_o;
  reg [15:0] n880_o;
  reg [34:0] n882_o;
  reg [2:0] n887_o;
  reg [13:0] n889_o;
  reg [1:0] n891_o;
  reg [13:0] n893_o;
  reg n896_o;
  wire [13:0] n898_o;
  reg [13:0] n900_o;
  wire [27:0] n901_o;
  wire [28:0] n902_o;
  reg [28:0] n904_o;
  wire [1:0] n906_o;
  reg [3:0] n908_o;
  wire [1:0] n909_o;
  reg [1:0] n912_o;
  wire [13:0] n913_o;
  reg [13:0] n916_o;
  wire [1:0] n917_o;
  reg [1:0] n920_o;
  wire [13:0] n921_o;
  reg [13:0] n924_o;
  wire [5:0] n931_o;
  localparam [31:0] n932_o = 32'b00000000000000000000000000000000;
  wire n933_o;
  wire [27:0] n934_o;
  wire [15:0] n935_o;
  wire n936_o;
  wire n937_o;
  wire n938_o;
  wire n939_o;
  wire n940_o;
  wire n941_o;
  wire n942_o;
  wire n944_o;
  wire n946_o;
  wire n949_o;
  wire n951_o;
  wire n952_o;
  wire [27:0] n953_o;
  wire [15:0] n954_o;
  wire [15:0] n955_o;
  wire [15:0] n956_o;
  wire [11:0] n957_o;
  wire [11:0] n958_o;
  wire [11:0] n959_o;
  wire n960_o;
  wire n961_o;
  wire [2:0] n964_o;
  wire n968_o;
  wire [5:0] n969_o;
  wire [28:0] dmatbl1_a_dout;
  wire [28:0] dmatbl1_b_dout;
  wire [28:0] n971_o;
  wire [28:0] n973_o;
  wire [15:0] dmatbl2_a_dout;
  wire [15:0] dmatbl2_b_dout;
  wire [15:0] n975_o;
  wire [15:0] n977_o;
  wire [3:0] n980_o;
  wire n982_o;
  wire n983_o;
  wire n986_o;
  wire n992_o;
  reg n995_q;
  wire n999_o;
  reg n1002_q;
  wire n1006_o;
  reg n1010_q;
  wire [2:0] n1014_o;
  reg [2:0] n1017_q;
  reg [13:0] n1027_q;
  reg [13:0] n1028_q;
  reg [5:0] n1029_q;
  reg [3:0] n1030_q;
  reg [15:0] n1031_q;
  reg [31:0] n1032_q;
  wire [44:0] n1033_o;
  wire [44:0] n1034_o;
  wire [44:0] n1035_o;
  wire [44:0] n1036_o;
  wire [31:0] n1037_o;
  wire [32:0] n1038_o;
  wire [80:0] n1039_o;
  assign config_slv_rdata = n685_o;
  assign config_slv_error = n686_o;
  assign spm_addr = n688_o;
  assign spm_en = n689_o;
  assign spm_wr = n690_o;
  assign spm_wdata = n691_o;
  assign pkt_out = n882_o;
  /* ni/schedule_table.vhd:103:16  */
  assign n683_o = {config_wdata, config_wr, config_en, config_addr};
  /* ni/schedule_table.vhd:59:5  */
  assign n685_o = n1038_o[31:0];
  /* ni/schedule_table.vhd:58:5  */
  assign n686_o = n1038_o[32];
  /* ni/schedule_table.vhd:56:5  */
  assign n688_o = n1039_o[13:0];
  /* ni/schedule_table.vhd:51:5  */
  assign n689_o = n1039_o[15:14];
  assign n690_o = n1039_o[16];
  assign n691_o = n1039_o[80:17];
  /* ni/schedule_table.vhd:190:1  */
  assign n692_o = {spm_slv_error, spm_slv_rdata};
  /* ni/packet_manager.vhd:78:8  */
  assign state = n1017_q; // (signal)
  /* ni/packet_manager.vhd:78:15  */
  assign next_state = n887_o; // (signal)
  /* ni/packet_manager.vhd:83:8  */
  assign dmatbl_data = port_b_dout; // (signal)
  /* ni/packet_manager.vhd:94:8  */
  assign count_reg = n1027_q; // (signal)
  /* ni/packet_manager.vhd:94:19  */
  assign count_next = n889_o; // (signal)
  /* ni/packet_manager.vhd:101:8  */
  assign pkt_type = n891_o; // (signal)
  /* ni/packet_manager.vhd:103:8  */
  assign dma_en_reg = n995_q; // (signal)
  /* ni/packet_manager.vhd:105:8  */
  assign read_ptr_reg = n1028_q; // (signal)
  /* ni/packet_manager.vhd:105:22  */
  assign read_ptr_next = n893_o; // (signal)
  /* ni/packet_manager.vhd:107:8  */
  assign hi_lo_next = n951_o; // (signal)
  /* ni/packet_manager.vhd:108:8  */
  assign hi_lo_reg = n1002_q; // (signal)
  /* ni/packet_manager.vhd:110:8  */
  assign port_b_wr = n968_o; // (signal)
  /* ni/packet_manager.vhd:111:8  */
  assign port_b_addr = n969_o; // (signal)
  /* ni/packet_manager.vhd:112:8  */
  assign port_b_din = dma_update_data; // (signal)
  /* ni/packet_manager.vhd:113:8  */
  assign port_b_dout = n1033_o; // (signal)
  /* ni/packet_manager.vhd:115:8  */
  assign dma_num_reg = n1029_q; // (signal)
  /* ni/packet_manager.vhd:116:8  */
  assign dma_update_en = n896_o; // (signal)
  /* ni/packet_manager.vhd:117:8  */
  assign dma_update_addr = dma_num_reg; // (signal)
  /* ni/packet_manager.vhd:118:8  */
  assign dma_update_data = n1034_o; // (signal)
  /* ni/packet_manager.vhd:131:8  */
  assign port_a_wr_hi = n946_o; // (signal)
  /* ni/packet_manager.vhd:132:8  */
  assign port_a_wr_lo = n949_o; // (signal)
  /* ni/packet_manager.vhd:133:8  */
  assign port_a_addr = n931_o; // (signal)
  /* ni/packet_manager.vhd:134:8  */
  assign port_a_din = n1035_o; // (signal)
  /* ni/packet_manager.vhd:135:8  */
  assign port_a_dout = n1036_o; // (signal)
  /* ni/packet_manager.vhd:137:8  */
  assign config_slv_error_next = n986_o; // (signal)
  /* ni/packet_manager.vhd:139:8  */
  assign pkt_len_reg = n1030_q; // (signal)
  /* ni/packet_manager.vhd:139:21  */
  assign pkt_len_next = n908_o; // (signal)
  /* ni/packet_manager.vhd:141:8  */
  assign route_reg = n1031_q; // (signal)
  /* ni/packet_manager.vhd:147:8  */
  assign payload_data = n1032_q; // (signal)
  /* ni/packet_manager.vhd:147:22  */
  assign payload_data_next = n1037_o; // (signal)
  assign n700_o = dmatbl_data[29:16];
  /* ni/packet_manager.vhd:167:3  */
  assign n701_o = dma_en ? pkt_len : pkt_len_reg;
  assign n702_o = dmatbl_data[15:14];
  /* ni/packet_manager.vhd:179:26  */
  assign n704_o = $unsigned(pkt_len_reg) >= $unsigned(4'b0001);
  /* ni/packet_manager.vhd:179:11  */
  assign n706_o = n704_o ? 2'b01 : n702_o;
  /* ni/packet_manager.vhd:182:49  */
  assign n708_o = {3'b110, pkt_type};
  /* ni/packet_manager.vhd:182:60  */
  assign n710_o = {n708_o, 3'b011};
  /* ni/packet_manager.vhd:182:70  */
  assign n712_o = {n710_o, 11'b00000000000};
  /* ni/packet_manager.vhd:182:103  */
  assign n713_o = {n712_o, route_reg};
  assign n714_o = dmatbl_data[44];
  assign n716_o = dmatbl_data[29:16];
  assign n717_o = dmatbl_data[29:16];
  assign n718_o = dmatbl_data[43:30];
  /* ni/packet_manager.vhd:191:30  */
  assign n720_o = n718_o - 14'b00000000000001;
  assign n721_o = dmatbl_data[43:30];
  /* ni/packet_manager.vhd:192:20  */
  assign n722_o = {10'b0, pkt_len_reg};  //  uext
  /* ni/packet_manager.vhd:192:20  */
  assign n723_o = $unsigned(n721_o) > $unsigned(n722_o);
  assign n724_o = dmatbl_data[15:14];
  /* ni/packet_manager.vhd:193:29  */
  assign n726_o = n724_o == 2'b10;
  /* ni/packet_manager.vhd:185:9  */
  assign n728_o = n763_o ? 2'b00 : n702_o;
  /* ni/packet_manager.vhd:192:11  */
  assign n730_o = n723_o & n726_o;
  /* ni/packet_manager.vhd:192:11  */
  assign n731_o = n723_o ? 1'b1 : 1'b0;
  /* ni/packet_manager.vhd:199:43  */
  assign n732_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:199:68  */
  assign n733_o = {10'b0, pkt_len_reg};  //  uext
  /* ni/packet_manager.vhd:199:68  */
  assign n734_o = n732_o + n733_o;
  assign n735_o = dmatbl_data[29:16];
  /* ni/packet_manager.vhd:200:39  */
  assign n736_o = {10'b0, pkt_len_reg};  //  uext
  /* ni/packet_manager.vhd:200:39  */
  assign n737_o = n735_o + n736_o;
  assign n738_o = dmatbl_data[43:30];
  /* ni/packet_manager.vhd:201:33  */
  assign n739_o = {10'b0, pkt_len_reg};  //  uext
  /* ni/packet_manager.vhd:201:33  */
  assign n740_o = n738_o - n739_o;
  assign n741_o = dmatbl_data[15:14];
  /* ni/packet_manager.vhd:202:27  */
  assign n743_o = n741_o == 2'b01;
  /* ni/packet_manager.vhd:205:43  */
  assign n744_o = dmatbl_data[13:10];
  assign n745_o = n734_o[13:10];
  /* ni/packet_manager.vhd:202:11  */
  assign n746_o = n743_o ? n744_o : n745_o;
  assign n747_o = n734_o[9:0];
  /* ni/packet_manager.vhd:207:39  */
  assign n749_o = pkt_len_reg - 4'b0001;
  /* ni/packet_manager.vhd:208:49  */
  assign n751_o = {3'b110, pkt_type};
  /* ni/packet_manager.vhd:208:68  */
  assign n752_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:208:60  */
  assign n753_o = {n751_o, n752_o};
  /* ni/packet_manager.vhd:208:93  */
  assign n754_o = {n753_o, route_reg};
  assign n755_o = {2'b11, n716_o};
  assign n756_o = {2'b00, n700_o};
  /* ni/packet_manager.vhd:185:9  */
  assign n757_o = n714_o ? n755_o : n756_o;
  /* ni/packet_manager.vhd:185:9  */
  assign n759_o = n714_o ? n754_o : 35'b00000000000000000000000000000000000;
  /* ni/packet_manager.vhd:185:9  */
  assign n761_o = n714_o ? 3'b001 : state;
  /* ni/packet_manager.vhd:185:9  */
  assign n762_o = n714_o ? n720_o : count_reg;
  /* ni/packet_manager.vhd:185:9  */
  assign n763_o = n714_o & n730_o;
  /* ni/packet_manager.vhd:185:9  */
  assign n764_o = n714_o ? n717_o : read_ptr_reg;
  /* ni/packet_manager.vhd:185:9  */
  assign n767_o = n714_o ? 1'b1 : 1'b0;
  assign n768_o = {n746_o, n747_o};
  assign n769_o = {n731_o, n740_o, n737_o};
  assign n770_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:185:9  */
  assign n771_o = n714_o ? n768_o : n770_o;
  assign n772_o = dmatbl_data[43:16];
  assign n773_o = {1'b0, n772_o};
  /* ni/packet_manager.vhd:185:9  */
  assign n774_o = n714_o ? n769_o : n773_o;
  /* ni/packet_manager.vhd:185:9  */
  assign n775_o = n714_o ? n749_o : n701_o;
  assign n776_o = {2'b00, n700_o};
  /* ni/packet_manager.vhd:177:9  */
  assign n777_o = mc ? n776_o : n757_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n778_o = mc ? n713_o : n759_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n780_o = mc ? 3'b011 : n761_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n781_o = mc ? count_reg : n762_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n782_o = mc ? n706_o : n728_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n783_o = mc ? read_ptr_reg : n764_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n785_o = mc ? 1'b0 : n767_o;
  assign n786_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:177:9  */
  assign n787_o = mc ? n786_o : n771_o;
  assign n788_o = dmatbl_data[43:16];
  assign n789_o = {1'b0, n788_o};
  /* ni/packet_manager.vhd:177:9  */
  assign n790_o = mc ? n789_o : n774_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n791_o = mc ? n701_o : n775_o;
  /* ni/packet_manager.vhd:177:9  */
  assign n793_o = mc ? mc_idx : 2'b00;
  /* ni/packet_manager.vhd:177:9  */
  assign n795_o = mc ? mc_p : 2'b00;
  assign n796_o = {2'b00, n700_o};
  /* ni/packet_manager.vhd:176:7  */
  assign n797_o = dma_en_reg ? n777_o : n796_o;
  /* ni/packet_manager.vhd:176:7  */
  assign n799_o = dma_en_reg ? n778_o : 35'b00000000000000000000000000000000000;
  /* ni/packet_manager.vhd:176:7  */
  assign n800_o = dma_en_reg ? n780_o : state;
  /* ni/packet_manager.vhd:176:7  */
  assign n801_o = dma_en_reg ? n781_o : count_reg;
  /* ni/packet_manager.vhd:176:7  */
  assign n802_o = dma_en_reg ? n782_o : n702_o;
  /* ni/packet_manager.vhd:176:7  */
  assign n803_o = dma_en_reg ? n783_o : read_ptr_reg;
  /* ni/packet_manager.vhd:176:7  */
  assign n805_o = dma_en_reg ? n785_o : 1'b0;
  assign n806_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:176:7  */
  assign n807_o = dma_en_reg ? n787_o : n806_o;
  assign n808_o = dmatbl_data[43:16];
  assign n809_o = {1'b0, n808_o};
  /* ni/packet_manager.vhd:176:7  */
  assign n810_o = dma_en_reg ? n790_o : n809_o;
  /* ni/packet_manager.vhd:176:7  */
  assign n811_o = dma_en_reg ? n791_o : n701_o;
  /* ni/packet_manager.vhd:176:7  */
  assign n813_o = dma_en_reg ? n793_o : 2'b00;
  /* ni/packet_manager.vhd:176:7  */
  assign n815_o = dma_en_reg ? n795_o : 2'b00;
  /* ni/packet_manager.vhd:175:5  */
  assign n817_o = state == 3'b000;
  /* ni/packet_manager.vhd:213:41  */
  assign n818_o = n692_o[31:0];
  /* ni/packet_manager.vhd:214:35  */
  assign n820_o = pkt_len_reg - 4'b0001;
  /* ni/packet_manager.vhd:215:31  */
  assign n822_o = count_reg - 14'b00000000000001;
  /* ni/packet_manager.vhd:216:22  */
  assign n824_o = $unsigned(pkt_len_reg) > $unsigned(4'b0000);
  /* ni/packet_manager.vhd:216:40  */
  assign n826_o = $unsigned(count_reg) > $unsigned(14'b00000000000000);
  /* ni/packet_manager.vhd:216:26  */
  assign n827_o = n824_o & n826_o;
  /* ni/packet_manager.vhd:218:58  */
  assign n828_o = n692_o[63:32];
  /* ni/packet_manager.vhd:218:43  */
  assign n830_o = {3'b100, n828_o};
  /* ni/packet_manager.vhd:219:39  */
  assign n832_o = read_ptr_reg + 14'b00000000000001;
  /* ni/packet_manager.vhd:222:62  */
  assign n833_o = n692_o[63:32];
  /* ni/packet_manager.vhd:222:47  */
  assign n835_o = {3'b101, n833_o};
  /* ni/packet_manager.vhd:216:7  */
  assign n836_o = n827_o ? n830_o : n835_o;
  /* ni/packet_manager.vhd:216:7  */
  assign n839_o = n827_o ? 3'b010 : 3'b000;
  /* ni/packet_manager.vhd:216:7  */
  assign n840_o = n827_o ? n832_o : read_ptr_reg;
  /* ni/packet_manager.vhd:212:5  */
  assign n842_o = state == 3'b001;
  /* ni/packet_manager.vhd:226:35  */
  assign n844_o = pkt_len_reg - 4'b0001;
  /* ni/packet_manager.vhd:227:31  */
  assign n846_o = count_reg - 14'b00000000000001;
  /* ni/packet_manager.vhd:228:22  */
  assign n848_o = $unsigned(pkt_len_reg) > $unsigned(4'b0000);
  /* ni/packet_manager.vhd:228:40  */
  assign n850_o = $unsigned(count_reg) > $unsigned(14'b00000000000000);
  /* ni/packet_manager.vhd:228:26  */
  assign n851_o = n848_o & n850_o;
  /* ni/packet_manager.vhd:230:43  */
  assign n853_o = {3'b100, payload_data};
  /* ni/packet_manager.vhd:232:39  */
  assign n856_o = read_ptr_reg + 14'b00000000000001;
  /* ni/packet_manager.vhd:238:47  */
  assign n858_o = {3'b101, payload_data};
  assign n859_o = {2'b11, read_ptr_next};
  assign n860_o = {2'b00, n700_o};
  /* ni/packet_manager.vhd:228:7  */
  assign n861_o = n851_o ? n859_o : n860_o;
  /* ni/packet_manager.vhd:228:7  */
  assign n862_o = n851_o ? n853_o : n858_o;
  /* ni/packet_manager.vhd:228:7  */
  assign n865_o = n851_o ? 3'b001 : 3'b000;
  /* ni/packet_manager.vhd:228:7  */
  assign n866_o = n851_o ? n856_o : read_ptr_reg;
  /* ni/packet_manager.vhd:225:5  */
  assign n868_o = state == 3'b010;
  /* ni/packet_manager.vhd:243:41  */
  assign n870_o = {3'b100, payload_data};
  /* ni/packet_manager.vhd:241:5  */
  assign n872_o = state == 3'b011;
  /* ni/packet_manager.vhd:247:45  */
  assign n874_o = {3'b101, payload_data};
  /* ni/packet_manager.vhd:245:5  */
  assign n876_o = state == 3'b100;
  assign n877_o = {n876_o, n872_o, n868_o, n842_o, n817_o};
  assign n878_o = {2'b00, n700_o};
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n877_o)
      5'b10000: n880_o <= n878_o;
      5'b01000: n880_o <= n878_o;
      5'b00100: n880_o <= n861_o;
      5'b00010: n880_o <= n878_o;
      5'b00001: n880_o <= n797_o;
      default: n880_o <= 16'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n877_o)
      5'b10000: n882_o <= n874_o;
      5'b01000: n882_o <= n870_o;
      5'b00100: n882_o <= n862_o;
      5'b00010: n882_o <= n836_o;
      5'b00001: n882_o <= n799_o;
      default: n882_o <= 35'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n877_o)
      5'b10000: n887_o <= 3'b000;
      5'b01000: n887_o <= 3'b100;
      5'b00100: n887_o <= n865_o;
      5'b00010: n887_o <= n839_o;
      5'b00001: n887_o <= n800_o;
      default: n887_o <= 3'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n877_o)
      5'b10000: n889_o <= count_reg;
      5'b01000: n889_o <= count_reg;
      5'b00100: n889_o <= n846_o;
      5'b00010: n889_o <= n822_o;
      5'b00001: n889_o <= n801_o;
      default: n889_o <= 14'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n877_o)
      5'b10000: n891_o <= n702_o;
      5'b01000: n891_o <= n702_o;
      5'b00100: n891_o <= n702_o;
      5'b00010: n891_o <= n702_o;
      5'b00001: n891_o <= n802_o;
      default: n891_o <= 2'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n877_o)
      5'b10000: n893_o <= read_ptr_reg;
      5'b01000: n893_o <= read_ptr_reg;
      5'b00100: n893_o <= n866_o;
      5'b00010: n893_o <= n840_o;
      5'b00001: n893_o <= n803_o;
      default: n893_o <= 14'bX;
    endcase
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n877_o)
      5'b10000: n896_o <= 1'b0;
      5'b01000: n896_o <= 1'b0;
      5'b00100: n896_o <= 1'b0;
      5'b00010: n896_o <= 1'b0;
      5'b00001: n896_o <= n805_o;
      default: n896_o <= 1'bX;
    endcase
  assign n898_o = dmatbl_data[13:0];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n877_o)
      5'b10000: n900_o <= n898_o;
      5'b01000: n900_o <= n898_o;
      5'b00100: n900_o <= n898_o;
      5'b00010: n900_o <= n898_o;
      5'b00001: n900_o <= n807_o;
      default: n900_o <= 14'bX;
    endcase
  assign n901_o = dmatbl_data[43:16];
  assign n902_o = {1'b0, n901_o};
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n877_o)
      5'b10000: n904_o <= n902_o;
      5'b01000: n904_o <= n902_o;
      5'b00100: n904_o <= n902_o;
      5'b00010: n904_o <= n902_o;
      5'b00001: n904_o <= n810_o;
      default: n904_o <= 29'bX;
    endcase
  assign n906_o = dmatbl_data[15:14];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n877_o)
      5'b10000: n908_o <= n701_o;
      5'b01000: n908_o <= n701_o;
      5'b00100: n908_o <= n844_o;
      5'b00010: n908_o <= n820_o;
      5'b00001: n908_o <= n811_o;
      default: n908_o <= 4'bX;
    endcase
  assign n909_o = n818_o[1:0];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n877_o)
      5'b10000: n912_o <= 2'b00;
      5'b01000: n912_o <= 2'b00;
      5'b00100: n912_o <= 2'b00;
      5'b00010: n912_o <= n909_o;
      5'b00001: n912_o <= n813_o;
      default: n912_o <= 2'bX;
    endcase
  assign n913_o = n818_o[15:2];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n877_o)
      5'b10000: n916_o <= 14'b00000000000000;
      5'b01000: n916_o <= 14'b00000000000000;
      5'b00100: n916_o <= 14'b00000000000000;
      5'b00010: n916_o <= n913_o;
      5'b00001: n916_o <= 14'b00000000000000;
      default: n916_o <= 14'bX;
    endcase
  assign n917_o = n818_o[17:16];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n877_o)
      5'b10000: n920_o <= 2'b00;
      5'b01000: n920_o <= 2'b00;
      5'b00100: n920_o <= 2'b00;
      5'b00010: n920_o <= n917_o;
      5'b00001: n920_o <= n815_o;
      default: n920_o <= 2'bX;
    endcase
  assign n921_o = n818_o[31:18];
  /* ni/packet_manager.vhd:174:3  */
  always @*
    case (n877_o)
      5'b10000: n924_o <= 14'b00000000000000;
      5'b01000: n924_o <= 14'b00000000000000;
      5'b00100: n924_o <= 14'b00000000000000;
      5'b00010: n924_o <= n921_o;
      5'b00001: n924_o <= 14'b00000000000000;
      default: n924_o <= 14'bX;
    endcase
  /* ni/packet_manager.vhd:256:29  */
  assign n931_o = n683_o[6:1];
  /* ni/packet_manager.vhd:259:52  */
  assign n933_o = n683_o[47];
  /* ni/packet_manager.vhd:262:26  */
  assign n934_o = n683_o[43:16];
  /* ni/packet_manager.vhd:264:48  */
  assign n935_o = n683_o[31:16];
  /* ni/packet_manager.vhd:266:17  */
  assign n936_o = n683_o[0];
  /* ni/packet_manager.vhd:272:28  */
  assign n937_o = n683_o[15];
  /* ni/packet_manager.vhd:272:31  */
  assign n938_o = n937_o & sel;
  /* ni/packet_manager.vhd:273:20  */
  assign n939_o = n683_o[0];
  /* ni/packet_manager.vhd:273:24  */
  assign n940_o = ~n939_o;
  /* ni/packet_manager.vhd:277:28  */
  assign n941_o = n683_o[15];
  /* ni/packet_manager.vhd:277:31  */
  assign n942_o = n941_o & sel;
  /* ni/packet_manager.vhd:273:3  */
  assign n944_o = n940_o ? n942_o : 1'b0;
  /* ni/packet_manager.vhd:266:3  */
  assign n946_o = n936_o ? n938_o : 1'b0;
  /* ni/packet_manager.vhd:266:3  */
  assign n949_o = n936_o ? 1'b0 : n944_o;
  /* ni/packet_manager.vhd:280:28  */
  assign n951_o = n683_o[0];
  /* ni/packet_manager.vhd:282:50  */
  assign n952_o = port_a_dout[44];
  /* ni/packet_manager.vhd:284:32  */
  assign n953_o = port_a_dout[43:16];
  /* ni/packet_manager.vhd:287:48  */
  assign n954_o = port_a_dout[15:0];
  assign n955_o = n953_o[15:0];
  /* ni/packet_manager.vhd:281:3  */
  assign n956_o = hi_lo_reg ? n955_o : n954_o;
  assign n957_o = n953_o[27:16];
  assign n958_o = n932_o[27:16];
  /* ni/packet_manager.vhd:281:3  */
  assign n959_o = hi_lo_reg ? n957_o : n958_o;
  assign n960_o = n932_o[31];
  /* ni/packet_manager.vhd:281:3  */
  assign n961_o = hi_lo_reg ? n952_o : n960_o;
  assign n964_o = n932_o[30:28];
  /* ni/packet_manager.vhd:297:3  */
  assign n968_o = dma_en ? 1'b0 : dma_update_en;
  /* ni/packet_manager.vhd:297:3  */
  assign n969_o = dma_en ? dma_num : dma_update_addr;
  /* ni/packet_manager.vhd:308:1  */
  tdp_ram_29_6 dmatbl1 (
    .a_clk(clk),
    .a_wr(port_a_wr_hi),
    .a_addr(port_a_addr),
    .a_din(n971_o),
    .b_clk(clk),
    .b_wr(port_b_wr),
    .b_addr(port_b_addr),
    .b_din(n973_o),
    .a_dout(dmatbl1_a_dout),
    .b_dout(dmatbl1_b_dout));
  /* ni/packet_manager.vhd:317:26  */
  assign n971_o = port_a_din[44:16];
  /* ni/packet_manager.vhd:322:26  */
  assign n973_o = port_b_din[44:16];
  /* ni/packet_manager.vhd:327:3  */
  tdp_ram_16_6 dmatbl2 (
    .a_clk(clk),
    .a_wr(port_a_wr_lo),
    .a_addr(port_a_addr),
    .a_din(n975_o),
    .b_clk(clk),
    .b_wr(port_b_wr),
    .b_addr(port_b_addr),
    .b_din(n977_o),
    .a_dout(dmatbl2_a_dout),
    .b_dout(dmatbl2_b_dout));
  /* ni/packet_manager.vhd:336:26  */
  assign n975_o = port_a_din[15:0];
  /* ni/packet_manager.vhd:341:26  */
  assign n977_o = port_b_din[15:0];
  /* ni/packet_manager.vhd:348:31  */
  assign n980_o = n683_o[10:7];
  /* ni/packet_manager.vhd:348:77  */
  assign n982_o = n980_o != 4'b0000;
  /* ni/packet_manager.vhd:348:16  */
  assign n983_o = sel & n982_o;
  /* ni/packet_manager.vhd:348:3  */
  assign n986_o = n983_o ? 1'b1 : 1'b0;
  /* ni/packet_manager.vhd:357:5  */
  assign n992_o = reset ? 1'b0 : dma_en;
  /* ni/packet_manager.vhd:356:3  */
  always @(posedge clk)
    n995_q <= n992_o;
  /* ni/packet_manager.vhd:368:5  */
  assign n999_o = reset ? 1'b0 : hi_lo_next;
  /* ni/packet_manager.vhd:367:3  */
  always @(posedge clk)
    n1002_q <= n999_o;
  /* ni/packet_manager.vhd:379:5  */
  assign n1006_o = reset ? 1'b0 : config_slv_error_next;
  /* ni/packet_manager.vhd:378:3  */
  always @(posedge clk)
    n1010_q <= n1006_o;
  /* ni/packet_manager.vhd:390:5  */
  assign n1014_o = reset ? 3'b000 : next_state;
  /* ni/packet_manager.vhd:389:3  */
  always @(posedge clk)
    n1017_q <= n1014_o;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n1027_q <= count_next;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n1028_q <= read_ptr_next;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n1029_q <= dma_num;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n1030_q <= pkt_len_next;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n1031_q <= route;
  /* ni/packet_manager.vhd:401:3  */
  always @(posedge clk)
    n1032_q <= payload_data_next;
  /* ni/packet_manager.vhd:401:3  */
  assign n1033_o = {dmatbl1_b_dout, dmatbl2_b_dout};
  assign n1034_o = {n904_o, n906_o, n900_o};
  assign n1035_o = {n933_o, n934_o, n935_o};
  assign n1036_o = {dmatbl1_a_dout, dmatbl2_a_dout};
  assign n1037_o = {n924_o, n920_o, n916_o, n912_o};
  assign n1038_o = {n1010_q, n961_o, n964_o, n959_o, n956_o};
  assign n1039_o = {64'b0000000000000000000000000000000000000000000000000000000000000000, 1'b0, n880_o};
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
  wire [47:0] n611_o;
  wire [31:0] n613_o;
  wire n614_o;
  wire [29:0] stbl_data;
  wire stbl_idx_en_reg;
  wire config_slv_error_next;
  wire [5:0] dma_num_sig;
  wire [29:0] port_a_din;
  wire [29:0] port_a_dout;
  wire a_wr;
  wire n620_o;
  wire n621_o;
  wire [29:0] stbl_a_dout;
  wire [29:0] stbl_b_dout;
  wire [7:0] n622_o;
  localparam n624_o = 1'b0;
  localparam [29:0] n625_o = 30'b000000000000000000000000000000;
  localparam [31:0] n628_o = 32'b00000000000000000000000000000000;
  wire [15:0] n629_o;
  wire [5:0] n631_o;
  wire [1:0] n632_o;
  wire [3:0] n634_o;
  wire [3:0] n636_o;
  wire [15:0] n637_o;
  wire [5:0] n640_o;
  wire [3:0] n642_o;
  wire [3:0] n644_o;
  wire [2:0] n647_o;
  wire n649_o;
  wire n650_o;
  wire n653_o;
  wire [15:0] n656_o;
  wire [5:0] n657_o;
  wire [3:0] n658_o;
  wire [3:0] n659_o;
  wire n663_o;
  reg n666_q;
  wire n669_o;
  wire n671_o;
  wire n676_o;
  reg n680_q;
  wire [29:0] n681_o;
  wire [32:0] n682_o;
  assign config_slv_rdata = n613_o;
  assign config_slv_error = n614_o;
  assign route = n656_o;
  assign pkt_len = n658_o;
  assign t2n = n659_o;
  assign dma_num = dma_num_sig;
  assign dma_en = n671_o;
  /* ni/MC_controller.vhd:258:32  */
  assign n611_o = {config_wdata, config_wr, config_en, config_addr};
  assign n613_o = n682_o[31:0];
  assign n614_o = n682_o[32];
  /* ni/schedule_table.vhd:78:8  */
  assign stbl_data = stbl_b_dout; // (signal)
  /* ni/schedule_table.vhd:80:8  */
  assign stbl_idx_en_reg = n666_q; // (signal)
  /* ni/schedule_table.vhd:82:8  */
  assign config_slv_error_next = n653_o; // (signal)
  /* ni/schedule_table.vhd:84:8  */
  assign dma_num_sig = n657_o; // (signal)
  /* ni/schedule_table.vhd:86:8  */
  assign port_a_din = n681_o; // (signal)
  /* ni/schedule_table.vhd:86:20  */
  assign port_a_dout = stbl_a_dout; // (signal)
  /* ni/schedule_table.vhd:88:8  */
  assign a_wr = n621_o; // (signal)
  /* ni/schedule_table.vhd:91:18  */
  assign n620_o = n611_o[15];
  /* ni/schedule_table.vhd:91:21  */
  assign n621_o = n620_o & sel;
  /* ni/schedule_table.vhd:93:1  */
  tdp_ram_30_8 stbl (
    .a_clk(clk),
    .a_wr(a_wr),
    .a_addr(n622_o),
    .a_din(port_a_din),
    .b_clk(clk),
    .b_wr(n624_o),
    .b_addr(stbl_idx),
    .b_din(n625_o),
    .a_dout(stbl_a_dout),
    .b_dout(stbl_b_dout));
  /* ni/schedule_table.vhd:101:27  */
  assign n622_o = n611_o[7:0];
  /* ni/schedule_table.vhd:117:33  */
  assign n629_o = port_a_dout[29:14];
  /* ni/schedule_table.vhd:121:33  */
  assign n631_o = port_a_dout[13:8];
  assign n632_o = n628_o[15:14];
  /* ni/schedule_table.vhd:125:33  */
  assign n634_o = port_a_dout[7:4];
  /* ni/schedule_table.vhd:129:33  */
  assign n636_o = port_a_dout[3:0];
  /* ni/schedule_table.vhd:135:34  */
  assign n637_o = n611_o[47:32];
  /* ni/schedule_table.vhd:140:34  */
  assign n640_o = n611_o[29:24];
  /* ni/schedule_table.vhd:143:34  */
  assign n642_o = n611_o[23:20];
  /* ni/schedule_table.vhd:146:34  */
  assign n644_o = n611_o[19:16];
  /* ni/schedule_table.vhd:154:31  */
  assign n647_o = n611_o[10:8];
  /* ni/schedule_table.vhd:154:73  */
  assign n649_o = n647_o != 3'b000;
  /* ni/schedule_table.vhd:154:16  */
  assign n650_o = sel & n649_o;
  /* ni/schedule_table.vhd:154:3  */
  assign n653_o = n650_o ? 1'b1 : 1'b0;
  /* ni/schedule_table.vhd:159:21  */
  assign n656_o = stbl_data[29:14];
  /* ni/schedule_table.vhd:161:34  */
  assign n657_o = stbl_data[13:8];
  /* ni/schedule_table.vhd:164:30  */
  assign n658_o = stbl_data[7:4];
  /* ni/schedule_table.vhd:166:30  */
  assign n659_o = stbl_data[3:0];
  /* ni/schedule_table.vhd:172:5  */
  assign n663_o = reset ? 1'b0 : stbl_idx_en;
  /* ni/schedule_table.vhd:171:3  */
  always @(posedge clk)
    n666_q <= n663_o;
  /* ni/schedule_table.vhd:183:18  */
  assign n669_o = dma_num_sig == 6'b111111;
  /* ni/schedule_table.vhd:183:3  */
  assign n671_o = n669_o ? 1'b0 : stbl_idx_en_reg;
  /* ni/schedule_table.vhd:193:5  */
  assign n676_o = reset ? 1'b0 : config_slv_error_next;
  /* ni/schedule_table.vhd:192:3  */
  always @(posedge clk)
    n680_q <= n676_o;
  /* ni/schedule_table.vhd:192:3  */
  assign n681_o = {n637_o, n640_o, n642_o, n644_o};
  assign n682_o = {n680_q, n629_o, n632_o, n631_o, n634_o, n636_o};
endmodule

module mc_controller_bf8b4530d8d246dd74ac53a13471bba17941dff7
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
  wire [47:0] n367_o;
  wire [31:0] n369_o;
  wire n370_o;
  wire [1:0] state;
  wire [1:0] next_state;
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
  wire mc_reg;
  wire mc_next;
  wire [7:0] stbl_min_reg;
  wire [10:0] mc_tbl_addr;
  wire [10:0] n379_o;
  wire [10:0] n381_o;
  wire n382_o;
  wire n383_o;
  wire n384_o;
  wire n385_o;
  wire [10:0] n386_o;
  wire n388_o;
  reg n391_o;
  wire [1:0] n392_o;
  reg [1:0] n393_o;
  wire [10:0] n394_o;
  wire [1:0] n395_o;
  wire n397_o;
  reg [1:0] n398_o;
  reg [1:0] n399_o;
  reg n402_o;
  reg n405_o;
  wire n407_o;
  wire [1:0] n409_o;
  wire [7:0] n411_o;
  wire [1:0] n414_o;
  wire [7:0] n416_o;
  wire [63:0] n418_o;
  wire n420_o;
  wire [1:0] n421_o;
  wire [1:0] n422_o;
  wire [63:0] n423_o;
  wire n425_o;
  wire n426_o;
  wire [1:0] n427_o;
  wire [1:0] n428_o;
  wire [1:0] n429_o;
  wire [1:0] n430_o;
  wire [63:0] n431_o;
  wire n433_o;
  wire n436_o;
  wire n439_o;
  wire [29:0] n440_o;
  wire [1:0] n443_o;
  wire n445_o;
  wire [1:0] n447_o;
  wire n449_o;
  wire [1:0] n451_o;
  wire n453_o;
  wire n455_o;
  wire [1:0] n457_o;
  wire n460_o;
  wire n462_o;
  wire n464_o;
  wire [2:0] n465_o;
  reg [1:0] n467_o;
  reg n470_o;
  reg n473_o;
  wire [7:0] n478_o;
  wire [7:0] n482_o;
  wire [7:0] n484_o;
  wire n489_o;
  wire [1:0] n491_o;
  wire [1:0] n493_o;
  wire [31:0] n495_o;
  wire n497_o;
  reg n505_q;
  reg [1:0] n506_q;
  reg [1:0] n507_q;
  reg [31:0] n508_q;
  reg n509_q;
  wire [63:0] n513_o;
  reg [63:0] n516_q;
  wire [1:0] n519_o;
  wire [1:0] n521_o;
  reg [1:0] n524_q;
  wire [1:0] n527_o;
  wire [1:0] n529_o;
  reg [1:0] n532_q;
  wire [7:0] n535_o;
  wire [7:0] n538_o;
  reg [7:0] n544_q;
  wire [7:0] n548_o;
  wire [7:0] n550_o;
  reg [7:0] n553_q;
  wire [31:0] n554_o;
  wire [32:0] n556_o;
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
  wire n578_o;
  wire n579_o;
  wire n580_o;
  wire n581_o;
  wire n582_o;
  wire n583_o;
  wire n584_o;
  wire n585_o;
  wire [7:0] n586_o;
  wire [7:0] n587_o;
  wire [7:0] n588_o;
  wire [7:0] n589_o;
  wire [7:0] n590_o;
  wire [7:0] n591_o;
  wire [7:0] n592_o;
  wire [7:0] n593_o;
  wire [7:0] n594_o;
  wire [7:0] n595_o;
  wire [7:0] n596_o;
  wire [7:0] n597_o;
  wire [63:0] n598_o;
  wire [15:0] n599_o;
  wire [15:0] n600_o;
  wire [15:0] n601_o;
  wire [15:0] n602_o;
  wire [1:0] n603_o;
  reg [15:0] n604_o;
  wire [15:0] n605_o;
  wire [15:0] n606_o;
  wire [15:0] n607_o;
  wire [15:0] n608_o;
  wire [1:0] n609_o;
  reg [15:0] n610_o;
  assign config_slv_rdata = n369_o;
  assign config_slv_error = n370_o;
  assign stbl_min = n484_o;
  assign stbl_maxp1 = n553_q;
  assign mc = mc_reg;
  assign mc_idx = mode_change_idx_reg;
  assign mc_p = mode_change_cnt_reg;
  /* ni/TDM_controller.vhd:64:5  */
  assign n367_o = {config_wdata, config_wr, config_en, config_addr};
  /* ni/TDM_controller.vhd:60:5  */
  assign n369_o = n556_o[31:0];
  /* ni/TDM_controller.vhd:58:5  */
  assign n370_o = n556_o[32];
  /* ni/MC_controller.vhd:84:10  */
  assign state = n506_q; // (signal)
  /* ni/MC_controller.vhd:84:17  */
  assign next_state = n467_o; // (signal)
  /* ni/MC_controller.vhd:86:10  */
  assign stbl_min_next = n478_o; // (signal)
  /* ni/MC_controller.vhd:86:25  */
  assign stbl_maxp1_next = n482_o; // (signal)
  /* ni/MC_controller.vhd:87:10  */
  assign mode_change_idx_reg = n524_q; // (signal)
  /* ni/MC_controller.vhd:87:31  */
  assign mode_change_idx_next = n429_o; // (signal)
  /* ni/MC_controller.vhd:88:10  */
  assign mode_idx_reg = n532_q; // (signal)
  /* ni/MC_controller.vhd:90:10  */
  assign mode_change_cnt_reg = n507_q; // (signal)
  /* ni/MC_controller.vhd:90:31  */
  assign mode_change_cnt_next = n430_o; // (signal)
  /* ni/MC_controller.vhd:90:53  */
  assign mode_change_cnt_int = n443_o; // (signal)
  /* ni/MC_controller.vhd:92:10  */
  assign mode_reg = n516_q; // (signal)
  /* ni/MC_controller.vhd:92:20  */
  assign mode_next = n431_o; // (signal)
  /* ni/MC_controller.vhd:94:10  */
  assign global_mode_change_idx = n470_o; // (signal)
  /* ni/MC_controller.vhd:94:34  */
  assign local_mode_change_idx = n433_o; // (signal)
  /* ni/MC_controller.vhd:96:10  */
  assign config_slv_error_next = n436_o; // (signal)
  /* ni/MC_controller.vhd:98:10  */
  assign read_reg = n508_q; // (signal)
  /* ni/MC_controller.vhd:98:20  */
  assign read_next = n554_o; // (signal)
  /* ni/MC_controller.vhd:100:10  */
  assign mc_reg = n509_q; // (signal)
  /* ni/MC_controller.vhd:100:18  */
  assign mc_next = n473_o; // (signal)
  /* ni/MC_controller.vhd:101:10  */
  assign stbl_min_reg = n544_q; // (signal)
  /* ni/MC_controller.vhd:103:10  */
  assign mc_tbl_addr = n381_o; // (signal)
  /* ni/MC_controller.vhd:124:31  */
  assign n379_o = n367_o[10:0];
  /* ni/MC_controller.vhd:124:60  */
  assign n381_o = n379_o - 11'b00000000010;
  /* ni/MC_controller.vhd:126:30  */
  assign n382_o = n367_o[14];
  /* ni/MC_controller.vhd:126:19  */
  assign n383_o = sel & n382_o;
  /* ni/MC_controller.vhd:128:17  */
  assign n384_o = n367_o[15];
  /* ni/MC_controller.vhd:128:20  */
  assign n385_o = ~n384_o;
  /* ni/MC_controller.vhd:129:26  */
  assign n386_o = n367_o[10:0];
  /* ni/MC_controller.vhd:131:11  */
  assign n388_o = n386_o == 11'b00000000000;
  /* ni/MC_controller.vhd:129:9  */
  always @*
    case (n388_o)
      1'b1: n391_o <= 1'b0;
      default: n391_o <= 1'b1;
    endcase
  assign n392_o = read_reg[1:0];
  /* ni/MC_controller.vhd:129:9  */
  always @*
    case (n388_o)
      1'b1: n393_o <= mode_idx_reg;
      default: n393_o <= n392_o;
    endcase
  /* ni/MC_controller.vhd:144:26  */
  assign n394_o = n367_o[10:0];
  /* ni/MC_controller.vhd:147:58  */
  assign n395_o = n367_o[17:16];
  /* ni/MC_controller.vhd:146:11  */
  assign n397_o = n394_o == 11'b00000000000;
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n397_o)
      1'b1: n398_o <= n395_o;
      default: n398_o <= mode_change_idx_reg;
    endcase
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n397_o)
      1'b1: n399_o <= mode_change_cnt_int;
      default: n399_o <= mode_change_cnt_reg;
    endcase
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n397_o)
      1'b1: n402_o <= 1'b1;
      default: n402_o <= 1'b0;
    endcase
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n397_o)
      1'b1: n405_o <= 1'b0;
      default: n405_o <= 1'b1;
    endcase
  /* ni/MC_controller.vhd:158:24  */
  assign n407_o = $unsigned(mc_tbl_addr) < $unsigned(11'b00000000100);
  /* ni/MC_controller.vhd:160:22  */
  assign n409_o = mc_tbl_addr[1:0];  // trunc
  /* ni/MC_controller.vhd:160:76  */
  assign n411_o = n367_o[23:16];
  /* ni/MC_controller.vhd:161:22  */
  assign n414_o = mc_tbl_addr[1:0];  // trunc
  /* ni/MC_controller.vhd:161:76  */
  assign n416_o = n367_o[39:32];
  /* ni/MC_controller.vhd:158:9  */
  assign n418_o = n407_o ? n598_o : mode_reg;
  /* ni/MC_controller.vhd:158:9  */
  assign n420_o = n407_o ? 1'b0 : n405_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n421_o = n385_o ? mode_change_idx_reg : n398_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n422_o = n385_o ? mode_change_cnt_reg : n399_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n423_o = n385_o ? mode_reg : n418_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n425_o = n385_o ? 1'b0 : n402_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n426_o = n385_o ? n391_o : n420_o;
  assign n427_o = read_reg[1:0];
  /* ni/MC_controller.vhd:126:5  */
  assign n428_o = n439_o ? n393_o : n427_o;
  /* ni/MC_controller.vhd:126:5  */
  assign n429_o = n383_o ? n421_o : mode_change_idx_reg;
  /* ni/MC_controller.vhd:126:5  */
  assign n430_o = n383_o ? n422_o : mode_change_cnt_reg;
  /* ni/MC_controller.vhd:126:5  */
  assign n431_o = n383_o ? n423_o : mode_reg;
  /* ni/MC_controller.vhd:126:5  */
  assign n433_o = n383_o ? n425_o : 1'b0;
  /* ni/MC_controller.vhd:126:5  */
  assign n436_o = n383_o ? n426_o : 1'b0;
  /* ni/MC_controller.vhd:126:5  */
  assign n439_o = n383_o & n385_o;
  assign n440_o = read_reg[31:2];
  /* ni/MC_controller.vhd:179:37  */
  assign n443_o = mc_p_cnt + 2'b10;
  /* ni/MC_controller.vhd:190:42  */
  assign n445_o = local_mode_change_idx & run;
  /* ni/MC_controller.vhd:190:11  */
  assign n447_o = n445_o ? 2'b01 : state;
  /* ni/MC_controller.vhd:189:9  */
  assign n449_o = state == 2'b00;
  /* ni/MC_controller.vhd:194:11  */
  assign n451_o = period_boundary ? 2'b10 : state;
  /* ni/MC_controller.vhd:194:11  */
  assign n453_o = period_boundary ? 1'b1 : mc_reg;
  /* ni/MC_controller.vhd:193:9  */
  assign n455_o = state == 2'b01;
  /* ni/MC_controller.vhd:199:11  */
  assign n457_o = period_boundary ? 2'b00 : state;
  /* ni/MC_controller.vhd:199:11  */
  assign n460_o = period_boundary ? 1'b1 : 1'b0;
  /* ni/MC_controller.vhd:199:11  */
  assign n462_o = period_boundary ? 1'b0 : mc_reg;
  /* ni/MC_controller.vhd:198:9  */
  assign n464_o = state == 2'b10;
  assign n465_o = {n464_o, n455_o, n449_o};
  /* ni/MC_controller.vhd:187:7  */
  always @*
    case (n465_o)
      3'b100: n467_o <= n457_o;
      3'b010: n467_o <= n451_o;
      3'b001: n467_o <= n447_o;
      default: n467_o <= 2'bX;
    endcase
  /* ni/MC_controller.vhd:187:7  */
  always @*
    case (n465_o)
      3'b100: n470_o <= n460_o;
      3'b010: n470_o <= 1'b0;
      3'b001: n470_o <= 1'b0;
      default: n470_o <= 1'bX;
    endcase
  /* ni/MC_controller.vhd:187:7  */
  always @*
    case (n465_o)
      3'b100: n473_o <= n462_o;
      3'b010: n473_o <= n453_o;
      3'b001: n473_o <= mc_reg;
      default: n473_o <= 1'bX;
    endcase
  /* ni/MC_controller.vhd:257:57  */
  assign n478_o = n604_o[7:0];
  /* ni/MC_controller.vhd:258:59  */
  assign n482_o = n610_o[15:8];
  /* ni/MC_controller.vhd:268:5  */
  assign n484_o = period_boundary ? stbl_min_next : stbl_min_reg;
  /* ni/MC_controller.vhd:281:7  */
  assign n489_o = reset ? 1'b0 : config_slv_error_next;
  /* ni/MC_controller.vhd:281:7  */
  assign n491_o = reset ? 2'b00 : next_state;
  /* ni/MC_controller.vhd:281:7  */
  assign n493_o = reset ? 2'b00 : mode_change_cnt_next;
  /* ni/MC_controller.vhd:281:7  */
  assign n495_o = reset ? 32'b00000000000000000000000000000000 : read_next;
  /* ni/MC_controller.vhd:281:7  */
  assign n497_o = reset ? 1'b0 : mc_next;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n505_q <= n489_o;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n506_q <= n491_o;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n507_q <= n493_o;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n508_q <= n495_o;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n509_q <= n497_o;
  /* ni/MC_controller.vhd:302:7  */
  assign n513_o = reset ? 64'b0000000000000000000000000000000000000000000000000000000000000000 : mode_next;
  /* ni/MC_controller.vhd:301:5  */
  always @(posedge clk)
    n516_q <= n513_o;
  /* ni/MC_controller.vhd:324:9  */
  assign n519_o = local_mode_change_idx ? mode_change_idx_next : mode_change_idx_reg;
  /* ni/MC_controller.vhd:321:7  */
  assign n521_o = reset ? 2'b00 : n519_o;
  /* ni/MC_controller.vhd:320:5  */
  always @(posedge clk)
    n524_q <= n521_o;
  /* ni/MC_controller.vhd:338:9  */
  assign n527_o = global_mode_change_idx ? mode_change_idx_reg : mode_idx_reg;
  /* ni/MC_controller.vhd:335:7  */
  assign n529_o = reset ? 2'b00 : n527_o;
  /* ni/MC_controller.vhd:334:5  */
  always @(posedge clk)
    n532_q <= n529_o;
  /* ni/MC_controller.vhd:354:9  */
  assign n535_o = period_boundary ? stbl_min_next : stbl_min_reg;
  /* ni/MC_controller.vhd:350:7  */
  assign n538_o = reset ? 8'b00000000 : n535_o;
  /* ni/MC_controller.vhd:349:5  */
  always @(posedge clk)
    n544_q <= n538_o;
  /* ni/MC_controller.vhd:373:9  */
  assign n548_o = period_boundary ? stbl_maxp1_next : n553_q;
  /* ni/MC_controller.vhd:370:7  */
  assign n550_o = reset ? 8'b00000000 : n548_o;
  /* ni/MC_controller.vhd:369:5  */
  always @(posedge clk)
    n553_q <= n550_o;
  /* ni/MC_controller.vhd:369:5  */
  assign n554_o = {n440_o, n428_o};
  assign n556_o = {n505_q, read_reg};
  /* ni/MC_controller.vhd:160:13  */
  assign n557_o = n409_o[1];
  /* ni/MC_controller.vhd:160:13  */
  assign n558_o = ~n557_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n559_o = n409_o[0];
  /* ni/MC_controller.vhd:160:13  */
  assign n560_o = ~n559_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n561_o = n558_o & n560_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n562_o = n558_o & n559_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n563_o = n557_o & n560_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n564_o = n557_o & n559_o;
  /* ni/MC_controller.vhd:367:3  */
  assign n565_o = mode_reg[7:0];
  /* ni/MC_controller.vhd:160:13  */
  assign n566_o = n561_o ? n411_o : n565_o;
  assign n567_o = mode_reg[15:8];
  /* ni/MC_controller.vhd:350:7  */
  assign n568_o = mode_reg[23:16];
  /* ni/MC_controller.vhd:160:13  */
  assign n569_o = n562_o ? n411_o : n568_o;
  /* ni/MC_controller.vhd:354:9  */
  assign n570_o = mode_reg[31:24];
  /* ni/MC_controller.vhd:347:3  */
  assign n571_o = mode_reg[39:32];
  /* ni/MC_controller.vhd:160:13  */
  assign n572_o = n563_o ? n411_o : n571_o;
  /* ni/MC_controller.vhd:332:3  */
  assign n573_o = mode_reg[47:40];
  assign n574_o = mode_reg[55:48];
  /* ni/MC_controller.vhd:160:13  */
  assign n575_o = n564_o ? n411_o : n574_o;
  assign n576_o = mode_reg[63:56];
  /* ni/MC_controller.vhd:299:3  */
  assign n577_o = {n576_o, n575_o, n573_o, n572_o, n570_o, n569_o, n567_o, n566_o};
  /* ni/MC_controller.vhd:161:13  */
  assign n578_o = n414_o[1];
  /* ni/MC_controller.vhd:161:13  */
  assign n579_o = ~n578_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n580_o = n414_o[0];
  /* ni/MC_controller.vhd:161:13  */
  assign n581_o = ~n580_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n582_o = n579_o & n581_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n583_o = n579_o & n580_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n584_o = n578_o & n581_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n585_o = n578_o & n580_o;
  /* ni/MC_controller.vhd:257:31  */
  assign n586_o = n577_o[7:0];
  assign n587_o = n577_o[15:8];
  /* ni/MC_controller.vhd:161:13  */
  assign n588_o = n582_o ? n416_o : n587_o;
  /* ni/MC_controller.vhd:182:5  */
  assign n589_o = n577_o[23:16];
  assign n590_o = n577_o[31:24];
  /* ni/MC_controller.vhd:161:13  */
  assign n591_o = n583_o ? n416_o : n590_o;
  assign n592_o = n577_o[39:32];
  assign n593_o = n577_o[47:40];
  /* ni/MC_controller.vhd:161:13  */
  assign n594_o = n584_o ? n416_o : n593_o;
  /* ni/MC_controller.vhd:160:23  */
  assign n595_o = n577_o[55:48];
  assign n596_o = n577_o[63:56];
  /* ni/MC_controller.vhd:161:13  */
  assign n597_o = n585_o ? n416_o : n596_o;
  /* ni/MC_controller.vhd:101:55  */
  assign n598_o = {n597_o, n595_o, n594_o, n592_o, n591_o, n589_o, n588_o, n586_o};
  /* ni/MC_controller.vhd:161:23  */
  assign n599_o = mode_reg[15:0];
  /* ni/MC_controller.vhd:161:13  */
  assign n600_o = mode_reg[31:16];
  /* ni/MC_controller.vhd:101:40  */
  assign n601_o = mode_reg[47:32];
  /* ni/MC_controller.vhd:101:24  */
  assign n602_o = mode_reg[63:48];
  /* ni/MC_controller.vhd:257:30  */
  assign n603_o = mode_idx_reg[1:0];
  /* ni/MC_controller.vhd:257:30  */
  always @*
    case (n603_o)
      2'b00: n604_o <= n599_o;
      2'b01: n604_o <= n600_o;
      2'b10: n604_o <= n601_o;
      2'b11: n604_o <= n602_o;
    endcase
  /* ni/MC_controller.vhd:257:31  */
  assign n605_o = mode_reg[15:0];
  /* ni/MC_controller.vhd:257:30  */
  assign n606_o = mode_reg[31:16];
  assign n607_o = mode_reg[47:32];
  assign n608_o = mode_reg[63:48];
  /* ni/MC_controller.vhd:258:32  */
  assign n609_o = mode_idx_reg[1:0];
  /* ni/MC_controller.vhd:258:32  */
  always @*
    case (n609_o)
      2'b00: n610_o <= n605_o;
      2'b01: n610_o <= n606_o;
      2'b10: n610_o <= n607_o;
      2'b11: n610_o <= n608_o;
    endcase
endmodule

module tdm_controller_bf8b4530d8d246dd74ac53a13471bba17941dff7
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
  wire master_run_next;
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
  wire [2:0] master_run_reg;
  wire run_reg;
  wire n201_o;
  wire [1:0] n205_o;
  wire [2:0] n206_o;
  wire [2:0] n208_o;
  reg [2:0] n211_q;
  wire n215_o;
  wire n216_o;
  wire n217_o;
  wire n218_o;
  wire n219_o;
  wire [10:0] n220_o;
  wire [30:0] n221_o;
  wire n223_o;
  wire n225_o;
  wire n227_o;
  wire n229_o;
  localparam [31:0] n230_o = 32'b00000000000000000000000000000000;
  wire [30:0] n231_o;
  wire n233_o;
  wire [4:0] n234_o;
  wire n235_o;
  wire n236_o;
  wire n237_o;
  wire n238_o;
  wire n239_o;
  reg n240_o;
  wire [8:0] n241_o;
  wire [8:0] n242_o;
  wire [8:0] n243_o;
  wire [8:0] n244_o;
  wire [8:0] n245_o;
  wire [8:0] n246_o;
  reg [8:0] n247_o;
  wire [21:0] n248_o;
  wire [21:0] n249_o;
  wire [21:0] n250_o;
  wire [21:0] n251_o;
  wire [21:0] n252_o;
  reg [21:0] n253_o;
  reg n259_o;
  wire [10:0] n260_o;
  wire [30:0] n261_o;
  wire n262_o;
  wire n264_o;
  reg n265_o;
  reg n268_o;
  wire n269_o;
  wire [31:0] n270_o;
  wire [31:0] n271_o;
  wire n274_o;
  wire n275_o;
  wire n276_o;
  wire n281_o;
  wire [7:0] n285_o;
  wire n288_o;
  wire n290_o;
  wire [4:0] n291_o;
  wire n293_o;
  wire n294_o;
  wire n296_o;
  wire n297_o;
  wire n298_o;
  wire n299_o;
  wire n300_o;
  wire n301_o;
  wire n302_o;
  wire n305_o;
  wire n306_o;
  wire n307_o;
  wire n308_o;
  wire n309_o;
  wire n311_o;
  wire n312_o;
  wire [7:0] n313_o;
  wire n317_o;
  wire [31:0] n319_o;
  wire n321_o;
  wire n322_o;
  reg n329_q;
  reg [31:0] n330_q;
  reg n331_q;
  reg n332_q;
  wire [1:0] n341_o;
  wire [1:0] n342_o;
  wire [1:0] n344_o;
  reg [1:0] n347_q;
  wire [3:0] n351_o;
  wire [3:0] n352_o;
  wire [3:0] n354_o;
  reg [3:0] n357_q;
  wire [7:0] n360_o;
  wire [7:0] n362_o;
  reg [7:0] n365_q;
  wire [32:0] n366_o;
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
  assign n195_o = n366_o[31:0];
  /* ni/network_interface.vhd:392:35  */
  assign n196_o = n366_o[32];
  /* ni/TDM_controller.vhd:84:10  */
  assign tdm_s_cnt_reg = 10'b0000000000; // (signal)
  /* ni/TDM_controller.vhd:85:10  */
  assign tdm_p_cnt_reg = 32'b00000000000000000000000000000000; // (signal)
  /* ni/TDM_controller.vhd:87:10  */
  assign stbl_idx_reg = n365_q; // (signal)
  /* ni/TDM_controller.vhd:88:10  */
  assign stbl_idx_next = n313_o; // (signal)
  /* ni/TDM_controller.vhd:89:10  */
  assign time2next_reg = n357_q; // (signal)
  /* ni/TDM_controller.vhd:165:42  */
  assign clock_cnt_lo_reg = 32'b00000000000000000000000000000000; // (signal)
  /* ni/TDM_controller.vhd:93:10  */
  assign master_run_next = n275_o; // (signal)
  /* ni/TDM_controller.vhd:95:10  */
  assign mc_p_cnt_reg = n347_q; // (signal)
  /* ni/TDM_controller.vhd:105:10  */
  assign read_reg = n330_q; // (signal)
  /* ni/TDM_controller.vhd:105:20  */
  assign read_next = n271_o; // (signal)
  /* ni/TDM_controller.vhd:106:10  */
  assign clock_delay_reg = 32'b00000000000000000000000000000000; // (signal)
  /* ni/TDM_controller.vhd:108:10  */
  assign period_boundary_sig = n311_o; // (signal)
  /* ni/TDM_controller.vhd:109:10  */
  assign stbl_idx_reset = n309_o; // (signal)
  /* ni/TDM_controller.vhd:109:26  */
  assign stbl_idx_en_sig = n302_o; // (signal)
  /* ni/TDM_controller.vhd:109:43  */
  assign t2n_ld_reg = n331_q; // (signal)
  /* ni/TDM_controller.vhd:110:10  */
  assign stbl_idx_inc = n285_o; // (signal)
  /* ni/TDM_controller.vhd:112:10  */
  assign config_slv_error_next = n281_o; // (signal)
  /* ni/TDM_controller.vhd:115:10  */
  assign master_run_reg = n211_q; // (signal)
  /* ni/TDM_controller.vhd:117:10  */
  assign run_reg = n332_q; // (signal)
  /* ni/TDM_controller.vhd:124:33  */
  assign n201_o = master_run_reg[2];
  /* ni/TDM_controller.vhd:131:43  */
  assign n205_o = master_run_reg[1:0];
  /* ni/TDM_controller.vhd:131:76  */
  assign n206_o = {n205_o, master_run_next};
  /* ni/TDM_controller.vhd:128:9  */
  assign n208_o = reset ? 3'b000 : n206_o;
  /* ni/TDM_controller.vhd:127:7  */
  always @(posedge clk)
    n211_q <= n208_o;
  /* ni/TDM_controller.vhd:153:41  */
  assign n215_o = master_run_reg[0];
  /* ni/TDM_controller.vhd:154:30  */
  assign n216_o = n193_o[14];
  /* ni/TDM_controller.vhd:154:19  */
  assign n217_o = sel & n216_o;
  /* ni/TDM_controller.vhd:156:17  */
  assign n218_o = n193_o[15];
  /* ni/TDM_controller.vhd:156:20  */
  assign n219_o = ~n218_o;
  /* ni/TDM_controller.vhd:157:37  */
  assign n220_o = n193_o[10:0];
  /* ni/TDM_controller.vhd:157:15  */
  assign n221_o = {20'b0, n220_o};  //  uext
  /* ni/TDM_controller.vhd:158:11  */
  assign n223_o = n221_o == 31'b0000000000000000000000000000000;
  /* ni/TDM_controller.vhd:160:11  */
  assign n225_o = n221_o == 31'b0000000000000000000000000000001;
  /* ni/TDM_controller.vhd:162:11  */
  assign n227_o = n221_o == 31'b0000000000000000000000000000010;
  /* ni/TDM_controller.vhd:164:11  */
  assign n229_o = n221_o == 31'b0000000000000000000000000000011;
  /* ni/network_interface.vhd:284:9  */
  assign n231_o = n230_o[31:1];
  /* ni/TDM_controller.vhd:167:11  */
  assign n233_o = n221_o == 31'b0000000000000000000000000000100;
  /* ni/network_interface.vhd:284:9  */
  assign n234_o = {n233_o, n229_o, n227_o, n225_o, n223_o};
  /* ni/network_interface.vhd:284:9  */
  assign n235_o = tdm_s_cnt_reg[0];
  /* ni/network_interface.vhd:284:9  */
  assign n236_o = tdm_p_cnt_reg[0];
  /* ni/network_interface.vhd:279:29  */
  assign n237_o = clock_delay_reg[0];
  /* ni/network_interface.vhd:278:36  */
  assign n238_o = clock_cnt_lo_reg[0];
  /* ni/network_interface.vhd:276:32  */
  assign n239_o = tdm_p_cnt_reg[0];
  /* ni/TDM_controller.vhd:157:9  */
  always @*
    case (n234_o)
      5'b10000: n240_o <= run;
      5'b01000: n240_o <= n238_o;
      5'b00100: n240_o <= n237_o;
      5'b00010: n240_o <= n236_o;
      5'b00001: n240_o <= n235_o;
      default: n240_o <= n239_o;
    endcase
  /* ni/network_interface.vhd:274:31  */
  assign n241_o = tdm_s_cnt_reg[9:1];
  /* ni/network_interface.vhd:271:31  */
  assign n242_o = tdm_p_cnt_reg[9:1];
  /* ni/network_interface.vhd:263:9  */
  assign n243_o = clock_delay_reg[9:1];
  /* ni/network_interface.vhd:263:9  */
  assign n244_o = clock_cnt_lo_reg[9:1];
  /* ni/network_interface.vhd:263:9  */
  assign n245_o = n231_o[8:0];
  /* ni/network_interface.vhd:263:9  */
  assign n246_o = tdm_p_cnt_reg[9:1];
  /* ni/TDM_controller.vhd:157:9  */
  always @*
    case (n234_o)
      5'b10000: n247_o <= n245_o;
      5'b01000: n247_o <= n244_o;
      5'b00100: n247_o <= n243_o;
      5'b00010: n247_o <= n242_o;
      5'b00001: n247_o <= n241_o;
      default: n247_o <= n246_o;
    endcase
  /* ni/network_interface.vhd:263:9  */
  assign n248_o = tdm_p_cnt_reg[31:10];
  /* ni/network_interface.vhd:64:9  */
  assign n249_o = clock_delay_reg[31:10];
  /* ni/network_interface.vhd:62:9  */
  assign n250_o = clock_cnt_lo_reg[31:10];
  /* ni/network_interface.vhd:60:9  */
  assign n251_o = n231_o[30:9];
  /* ni/network_interface.vhd:59:9  */
  assign n252_o = tdm_p_cnt_reg[31:10];
  /* ni/TDM_controller.vhd:157:9  */
  always @*
    case (n234_o)
      5'b10000: n253_o <= n251_o;
      5'b01000: n253_o <= n250_o;
      5'b00100: n253_o <= n249_o;
      5'b00010: n253_o <= n248_o;
      5'b00001: n253_o <= n252_o;
      default: n253_o <= n252_o;
    endcase
  /* ni/TDM_controller.vhd:157:9  */
  always @*
    case (n234_o)
      5'b10000: n259_o <= 1'b0;
      5'b01000: n259_o <= 1'b0;
      5'b00100: n259_o <= 1'b0;
      5'b00010: n259_o <= 1'b0;
      5'b00001: n259_o <= 1'b0;
      default: n259_o <= 1'b1;
    endcase
  /* ni/TDM_controller.vhd:174:37  */
  assign n260_o = n193_o[10:0];
  /* ni/TDM_controller.vhd:174:15  */
  assign n261_o = {20'b0, n260_o};  //  uext
  /* ni/TDM_controller.vhd:177:63  */
  assign n262_o = n193_o[16];
  /* ni/TDM_controller.vhd:175:11  */
  assign n264_o = n261_o == 31'b0000000000000000000000000000100;
  /* ni/TDM_controller.vhd:174:9  */
  always @*
    case (n264_o)
      1'b1: n265_o <= n262_o;
      default: n265_o <= n215_o;
    endcase
  /* ni/TDM_controller.vhd:174:9  */
  always @*
    case (n264_o)
      1'b1: n268_o <= 1'b0;
      default: n268_o <= 1'b1;
    endcase
  /* ni/TDM_controller.vhd:156:7  */
  assign n269_o = n219_o ? n215_o : n265_o;
  assign n270_o = {n253_o, n247_o, n240_o};
  /* ni/TDM_controller.vhd:154:5  */
  assign n271_o = n276_o ? n270_o : tdm_p_cnt_reg;
  /* ni/TDM_controller.vhd:156:7  */
  assign n274_o = n219_o ? n259_o : n268_o;
  /* ni/TDM_controller.vhd:154:5  */
  assign n275_o = n217_o ? n269_o : n215_o;
  /* ni/TDM_controller.vhd:154:5  */
  assign n276_o = n217_o & n219_o;
  /* ni/TDM_controller.vhd:154:5  */
  assign n281_o = n217_o ? n274_o : 1'b0;
  /* ni/TDM_controller.vhd:194:32  */
  assign n285_o = stbl_idx_reg + 8'b00000001;
  /* ni/TDM_controller.vhd:198:49  */
  assign n288_o = time2next_reg == 4'b0001;
  /* ni/TDM_controller.vhd:198:74  */
  assign n290_o = time2next_reg == 4'b0000;
  /* ni/TDM_controller.vhd:198:97  */
  assign n291_o = {1'b0, time2next_reg};  //  uext
  /* ni/TDM_controller.vhd:198:97  */
  assign n293_o = n291_o == 5'b11111;
  /* ni/TDM_controller.vhd:198:79  */
  assign n294_o = n290_o | n293_o;
  /* ni/TDM_controller.vhd:198:118  */
  assign n296_o = t2n == 4'b0000;
  /* ni/TDM_controller.vhd:198:109  */
  assign n297_o = n294_o & n296_o;
  /* ni/TDM_controller.vhd:198:54  */
  assign n298_o = n288_o | n297_o;
  /* ni/TDM_controller.vhd:198:134  */
  assign n299_o = run != run_reg;
  /* ni/TDM_controller.vhd:198:125  */
  assign n300_o = n298_o | n299_o;
  /* ni/TDM_controller.vhd:198:147  */
  assign n301_o = n300_o & run;
  /* ni/TDM_controller.vhd:198:26  */
  assign n302_o = n301_o ? 1'b1 : 1'b0;
  /* ni/TDM_controller.vhd:201:46  */
  assign n305_o = stbl_idx_inc == stbl_maxp1;
  /* ni/TDM_controller.vhd:201:69  */
  assign n306_o = run != run_reg;
  /* ni/TDM_controller.vhd:201:60  */
  assign n307_o = n305_o | n306_o;
  /* ni/TDM_controller.vhd:201:82  */
  assign n308_o = n307_o & run;
  /* ni/TDM_controller.vhd:201:25  */
  assign n309_o = n308_o ? 1'b1 : 1'b0;
  /* ni/TDM_controller.vhd:205:41  */
  assign n311_o = stbl_idx_reset & stbl_idx_en_sig;
  /* ni/TDM_controller.vhd:208:53  */
  assign n312_o = ~stbl_idx_reset;
  /* ni/TDM_controller.vhd:208:33  */
  assign n313_o = n312_o ? stbl_idx_inc : stbl_min;
  /* ni/TDM_controller.vhd:220:7  */
  assign n317_o = reset ? 1'b0 : config_slv_error_next;
  /* ni/TDM_controller.vhd:220:7  */
  assign n319_o = reset ? 32'b00000000000000000000000000000000 : read_next;
  /* ni/TDM_controller.vhd:220:7  */
  assign n321_o = reset ? 1'b1 : stbl_idx_en_sig;
  /* ni/TDM_controller.vhd:220:7  */
  assign n322_o = reset ? run_reg : run;
  /* ni/TDM_controller.vhd:219:5  */
  always @(posedge clk)
    n329_q <= n317_o;
  /* ni/TDM_controller.vhd:219:5  */
  always @(posedge clk)
    n330_q <= n319_o;
  /* ni/TDM_controller.vhd:219:5  */
  always @(posedge clk)
    n331_q <= n321_o;
  /* ni/TDM_controller.vhd:219:5  */
  always @(posedge clk)
    n332_q <= n322_o;
  /* ni/TDM_controller.vhd:336:40  */
  assign n341_o = mc_p_cnt_reg + 2'b01;
  /* ni/TDM_controller.vhd:335:9  */
  assign n342_o = period_boundary_sig ? n341_o : mc_p_cnt_reg;
  /* ni/TDM_controller.vhd:332:7  */
  assign n344_o = reset ? 2'b00 : n342_o;
  /* ni/TDM_controller.vhd:331:5  */
  always @(posedge clk)
    n347_q <= n344_o;
  /* ni/TDM_controller.vhd:354:42  */
  assign n351_o = time2next_reg - 4'b0001;
  /* ni/TDM_controller.vhd:351:9  */
  assign n352_o = t2n_ld_reg ? t2n : n351_o;
  /* ni/TDM_controller.vhd:348:7  */
  assign n354_o = reset ? 4'b0000 : n352_o;
  /* ni/TDM_controller.vhd:347:5  */
  always @(posedge clk)
    n357_q <= n354_o;
  /* ni/TDM_controller.vhd:369:9  */
  assign n360_o = stbl_idx_en_sig ? stbl_idx_next : stbl_idx_reg;
  /* ni/TDM_controller.vhd:365:7  */
  assign n362_o = reset ? 8'b00000000 : n360_o;
  /* ni/TDM_controller.vhd:364:5  */
  always @(posedge clk)
    n365_q <= n362_o;
  /* ni/TDM_controller.vhd:364:5  */
  assign n366_o = {n329_q, read_reg};
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
  /* ni/network_interface.vhd:227:8  */
  assign config_master = configbus_n151; // (signal)
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
  tdm_controller_bf8b4530d8d246dd74ac53a13471bba17941dff7 tdmctrl (
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
  mc_controller_bf8b4530d8d246dd74ac53a13471bba17941dff7 mcctrl (
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
  assign n67_o = config_master[13:0];
  assign n68_o = config_master[14];
  assign n69_o = config_master[15];
  assign n70_o = config_master[47:16];
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
  assign n87_o = config_master[13:0];
  assign n88_o = config_master[14];
  assign n89_o = config_master[15];
  assign n90_o = config_master[47:16];
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
  assign n121_o = config_master[13:0];
  assign n122_o = config_master[14];
  assign n123_o = config_master[15];
  assign n124_o = config_master[47:16];
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

