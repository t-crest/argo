module tdp_bram_8_9
  (input  a_clk,
   input  a_wr,
   input  [8:0] a_addr,
   input  [7:0] a_din,
   input  b_clk,
   input  b_wr,
   input  [8:0] b_addr,
   input  [7:0] b_din,
   output [7:0] a_dout,
   output [7:0] b_dout);
  reg [7:0] n216_data; // mem_rd
  reg [7:0] n219_data; // mem_rd
  assign a_dout = n219_data;
  assign b_dout = n216_data;
  /* mem/tdp_bram.vhd:57:5  */
  reg [7:0] mem[511:0] ; // memory
  initial begin
    mem[511] = 8'b00000000;
    mem[510] = 8'b00000000;
    mem[509] = 8'b00000000;
    mem[508] = 8'b00000000;
    mem[507] = 8'b00000000;
    mem[506] = 8'b00000000;
    mem[505] = 8'b00000000;
    mem[504] = 8'b00000000;
    mem[503] = 8'b00000000;
    mem[502] = 8'b00000000;
    mem[501] = 8'b00000000;
    mem[500] = 8'b00000000;
    mem[499] = 8'b00000000;
    mem[498] = 8'b00000000;
    mem[497] = 8'b00000000;
    mem[496] = 8'b00000000;
    mem[495] = 8'b00000000;
    mem[494] = 8'b00000000;
    mem[493] = 8'b00000000;
    mem[492] = 8'b00000000;
    mem[491] = 8'b00000000;
    mem[490] = 8'b00000000;
    mem[489] = 8'b00000000;
    mem[488] = 8'b00000000;
    mem[487] = 8'b00000000;
    mem[486] = 8'b00000000;
    mem[485] = 8'b00000000;
    mem[484] = 8'b00000000;
    mem[483] = 8'b00000000;
    mem[482] = 8'b00000000;
    mem[481] = 8'b00000000;
    mem[480] = 8'b00000000;
    mem[479] = 8'b00000000;
    mem[478] = 8'b00000000;
    mem[477] = 8'b00000000;
    mem[476] = 8'b00000000;
    mem[475] = 8'b00000000;
    mem[474] = 8'b00000000;
    mem[473] = 8'b00000000;
    mem[472] = 8'b00000000;
    mem[471] = 8'b00000000;
    mem[470] = 8'b00000000;
    mem[469] = 8'b00000000;
    mem[468] = 8'b00000000;
    mem[467] = 8'b00000000;
    mem[466] = 8'b00000000;
    mem[465] = 8'b00000000;
    mem[464] = 8'b00000000;
    mem[463] = 8'b00000000;
    mem[462] = 8'b00000000;
    mem[461] = 8'b00000000;
    mem[460] = 8'b00000000;
    mem[459] = 8'b00000000;
    mem[458] = 8'b00000000;
    mem[457] = 8'b00000000;
    mem[456] = 8'b00000000;
    mem[455] = 8'b00000000;
    mem[454] = 8'b00000000;
    mem[453] = 8'b00000000;
    mem[452] = 8'b00000000;
    mem[451] = 8'b00000000;
    mem[450] = 8'b00000000;
    mem[449] = 8'b00000000;
    mem[448] = 8'b00000000;
    mem[447] = 8'b00000000;
    mem[446] = 8'b00000000;
    mem[445] = 8'b00000000;
    mem[444] = 8'b00000000;
    mem[443] = 8'b00000000;
    mem[442] = 8'b00000000;
    mem[441] = 8'b00000000;
    mem[440] = 8'b00000000;
    mem[439] = 8'b00000000;
    mem[438] = 8'b00000000;
    mem[437] = 8'b00000000;
    mem[436] = 8'b00000000;
    mem[435] = 8'b00000000;
    mem[434] = 8'b00000000;
    mem[433] = 8'b00000000;
    mem[432] = 8'b00000000;
    mem[431] = 8'b00000000;
    mem[430] = 8'b00000000;
    mem[429] = 8'b00000000;
    mem[428] = 8'b00000000;
    mem[427] = 8'b00000000;
    mem[426] = 8'b00000000;
    mem[425] = 8'b00000000;
    mem[424] = 8'b00000000;
    mem[423] = 8'b00000000;
    mem[422] = 8'b00000000;
    mem[421] = 8'b00000000;
    mem[420] = 8'b00000000;
    mem[419] = 8'b00000000;
    mem[418] = 8'b00000000;
    mem[417] = 8'b00000000;
    mem[416] = 8'b00000000;
    mem[415] = 8'b00000000;
    mem[414] = 8'b00000000;
    mem[413] = 8'b00000000;
    mem[412] = 8'b00000000;
    mem[411] = 8'b00000000;
    mem[410] = 8'b00000000;
    mem[409] = 8'b00000000;
    mem[408] = 8'b00000000;
    mem[407] = 8'b00000000;
    mem[406] = 8'b00000000;
    mem[405] = 8'b00000000;
    mem[404] = 8'b00000000;
    mem[403] = 8'b00000000;
    mem[402] = 8'b00000000;
    mem[401] = 8'b00000000;
    mem[400] = 8'b00000000;
    mem[399] = 8'b00000000;
    mem[398] = 8'b00000000;
    mem[397] = 8'b00000000;
    mem[396] = 8'b00000000;
    mem[395] = 8'b00000000;
    mem[394] = 8'b00000000;
    mem[393] = 8'b00000000;
    mem[392] = 8'b00000000;
    mem[391] = 8'b00000000;
    mem[390] = 8'b00000000;
    mem[389] = 8'b00000000;
    mem[388] = 8'b00000000;
    mem[387] = 8'b00000000;
    mem[386] = 8'b00000000;
    mem[385] = 8'b00000000;
    mem[384] = 8'b00000000;
    mem[383] = 8'b00000000;
    mem[382] = 8'b00000000;
    mem[381] = 8'b00000000;
    mem[380] = 8'b00000000;
    mem[379] = 8'b00000000;
    mem[378] = 8'b00000000;
    mem[377] = 8'b00000000;
    mem[376] = 8'b00000000;
    mem[375] = 8'b00000000;
    mem[374] = 8'b00000000;
    mem[373] = 8'b00000000;
    mem[372] = 8'b00000000;
    mem[371] = 8'b00000000;
    mem[370] = 8'b00000000;
    mem[369] = 8'b00000000;
    mem[368] = 8'b00000000;
    mem[367] = 8'b00000000;
    mem[366] = 8'b00000000;
    mem[365] = 8'b00000000;
    mem[364] = 8'b00000000;
    mem[363] = 8'b00000000;
    mem[362] = 8'b00000000;
    mem[361] = 8'b00000000;
    mem[360] = 8'b00000000;
    mem[359] = 8'b00000000;
    mem[358] = 8'b00000000;
    mem[357] = 8'b00000000;
    mem[356] = 8'b00000000;
    mem[355] = 8'b00000000;
    mem[354] = 8'b00000000;
    mem[353] = 8'b00000000;
    mem[352] = 8'b00000000;
    mem[351] = 8'b00000000;
    mem[350] = 8'b00000000;
    mem[349] = 8'b00000000;
    mem[348] = 8'b00000000;
    mem[347] = 8'b00000000;
    mem[346] = 8'b00000000;
    mem[345] = 8'b00000000;
    mem[344] = 8'b00000000;
    mem[343] = 8'b00000000;
    mem[342] = 8'b00000000;
    mem[341] = 8'b00000000;
    mem[340] = 8'b00000000;
    mem[339] = 8'b00000000;
    mem[338] = 8'b00000000;
    mem[337] = 8'b00000000;
    mem[336] = 8'b00000000;
    mem[335] = 8'b00000000;
    mem[334] = 8'b00000000;
    mem[333] = 8'b00000000;
    mem[332] = 8'b00000000;
    mem[331] = 8'b00000000;
    mem[330] = 8'b00000000;
    mem[329] = 8'b00000000;
    mem[328] = 8'b00000000;
    mem[327] = 8'b00000000;
    mem[326] = 8'b00000000;
    mem[325] = 8'b00000000;
    mem[324] = 8'b00000000;
    mem[323] = 8'b00000000;
    mem[322] = 8'b00000000;
    mem[321] = 8'b00000000;
    mem[320] = 8'b00000000;
    mem[319] = 8'b00000000;
    mem[318] = 8'b00000000;
    mem[317] = 8'b00000000;
    mem[316] = 8'b00000000;
    mem[315] = 8'b00000000;
    mem[314] = 8'b00000000;
    mem[313] = 8'b00000000;
    mem[312] = 8'b00000000;
    mem[311] = 8'b00000000;
    mem[310] = 8'b00000000;
    mem[309] = 8'b00000000;
    mem[308] = 8'b00000000;
    mem[307] = 8'b00000000;
    mem[306] = 8'b00000000;
    mem[305] = 8'b00000000;
    mem[304] = 8'b00000000;
    mem[303] = 8'b00000000;
    mem[302] = 8'b00000000;
    mem[301] = 8'b00000000;
    mem[300] = 8'b00000000;
    mem[299] = 8'b00000000;
    mem[298] = 8'b00000000;
    mem[297] = 8'b00000000;
    mem[296] = 8'b00000000;
    mem[295] = 8'b00000000;
    mem[294] = 8'b00000000;
    mem[293] = 8'b00000000;
    mem[292] = 8'b00000000;
    mem[291] = 8'b00000000;
    mem[290] = 8'b00000000;
    mem[289] = 8'b00000000;
    mem[288] = 8'b00000000;
    mem[287] = 8'b00000000;
    mem[286] = 8'b00000000;
    mem[285] = 8'b00000000;
    mem[284] = 8'b00000000;
    mem[283] = 8'b00000000;
    mem[282] = 8'b00000000;
    mem[281] = 8'b00000000;
    mem[280] = 8'b00000000;
    mem[279] = 8'b00000000;
    mem[278] = 8'b00000000;
    mem[277] = 8'b00000000;
    mem[276] = 8'b00000000;
    mem[275] = 8'b00000000;
    mem[274] = 8'b00000000;
    mem[273] = 8'b00000000;
    mem[272] = 8'b00000000;
    mem[271] = 8'b00000000;
    mem[270] = 8'b00000000;
    mem[269] = 8'b00000000;
    mem[268] = 8'b00000000;
    mem[267] = 8'b00000000;
    mem[266] = 8'b00000000;
    mem[265] = 8'b00000000;
    mem[264] = 8'b00000000;
    mem[263] = 8'b00000000;
    mem[262] = 8'b00000000;
    mem[261] = 8'b00000000;
    mem[260] = 8'b00000000;
    mem[259] = 8'b00000000;
    mem[258] = 8'b00000000;
    mem[257] = 8'b00000000;
    mem[256] = 8'b00000000;
    mem[255] = 8'b00000000;
    mem[254] = 8'b00000000;
    mem[253] = 8'b00000000;
    mem[252] = 8'b00000000;
    mem[251] = 8'b00000000;
    mem[250] = 8'b00000000;
    mem[249] = 8'b00000000;
    mem[248] = 8'b00000000;
    mem[247] = 8'b00000000;
    mem[246] = 8'b00000000;
    mem[245] = 8'b00000000;
    mem[244] = 8'b00000000;
    mem[243] = 8'b00000000;
    mem[242] = 8'b00000000;
    mem[241] = 8'b00000000;
    mem[240] = 8'b00000000;
    mem[239] = 8'b00000000;
    mem[238] = 8'b00000000;
    mem[237] = 8'b00000000;
    mem[236] = 8'b00000000;
    mem[235] = 8'b00000000;
    mem[234] = 8'b00000000;
    mem[233] = 8'b00000000;
    mem[232] = 8'b00000000;
    mem[231] = 8'b00000000;
    mem[230] = 8'b00000000;
    mem[229] = 8'b00000000;
    mem[228] = 8'b00000000;
    mem[227] = 8'b00000000;
    mem[226] = 8'b00000000;
    mem[225] = 8'b00000000;
    mem[224] = 8'b00000000;
    mem[223] = 8'b00000000;
    mem[222] = 8'b00000000;
    mem[221] = 8'b00000000;
    mem[220] = 8'b00000000;
    mem[219] = 8'b00000000;
    mem[218] = 8'b00000000;
    mem[217] = 8'b00000000;
    mem[216] = 8'b00000000;
    mem[215] = 8'b00000000;
    mem[214] = 8'b00000000;
    mem[213] = 8'b00000000;
    mem[212] = 8'b00000000;
    mem[211] = 8'b00000000;
    mem[210] = 8'b00000000;
    mem[209] = 8'b00000000;
    mem[208] = 8'b00000000;
    mem[207] = 8'b00000000;
    mem[206] = 8'b00000000;
    mem[205] = 8'b00000000;
    mem[204] = 8'b00000000;
    mem[203] = 8'b00000000;
    mem[202] = 8'b00000000;
    mem[201] = 8'b00000000;
    mem[200] = 8'b00000000;
    mem[199] = 8'b00000000;
    mem[198] = 8'b00000000;
    mem[197] = 8'b00000000;
    mem[196] = 8'b00000000;
    mem[195] = 8'b00000000;
    mem[194] = 8'b00000000;
    mem[193] = 8'b00000000;
    mem[192] = 8'b00000000;
    mem[191] = 8'b00000000;
    mem[190] = 8'b00000000;
    mem[189] = 8'b00000000;
    mem[188] = 8'b00000000;
    mem[187] = 8'b00000000;
    mem[186] = 8'b00000000;
    mem[185] = 8'b00000000;
    mem[184] = 8'b00000000;
    mem[183] = 8'b00000000;
    mem[182] = 8'b00000000;
    mem[181] = 8'b00000000;
    mem[180] = 8'b00000000;
    mem[179] = 8'b00000000;
    mem[178] = 8'b00000000;
    mem[177] = 8'b00000000;
    mem[176] = 8'b00000000;
    mem[175] = 8'b00000000;
    mem[174] = 8'b00000000;
    mem[173] = 8'b00000000;
    mem[172] = 8'b00000000;
    mem[171] = 8'b00000000;
    mem[170] = 8'b00000000;
    mem[169] = 8'b00000000;
    mem[168] = 8'b00000000;
    mem[167] = 8'b00000000;
    mem[166] = 8'b00000000;
    mem[165] = 8'b00000000;
    mem[164] = 8'b00000000;
    mem[163] = 8'b00000000;
    mem[162] = 8'b00000000;
    mem[161] = 8'b00000000;
    mem[160] = 8'b00000000;
    mem[159] = 8'b00000000;
    mem[158] = 8'b00000000;
    mem[157] = 8'b00000000;
    mem[156] = 8'b00000000;
    mem[155] = 8'b00000000;
    mem[154] = 8'b00000000;
    mem[153] = 8'b00000000;
    mem[152] = 8'b00000000;
    mem[151] = 8'b00000000;
    mem[150] = 8'b00000000;
    mem[149] = 8'b00000000;
    mem[148] = 8'b00000000;
    mem[147] = 8'b00000000;
    mem[146] = 8'b00000000;
    mem[145] = 8'b00000000;
    mem[144] = 8'b00000000;
    mem[143] = 8'b00000000;
    mem[142] = 8'b00000000;
    mem[141] = 8'b00000000;
    mem[140] = 8'b00000000;
    mem[139] = 8'b00000000;
    mem[138] = 8'b00000000;
    mem[137] = 8'b00000000;
    mem[136] = 8'b00000000;
    mem[135] = 8'b00000000;
    mem[134] = 8'b00000000;
    mem[133] = 8'b00000000;
    mem[132] = 8'b00000000;
    mem[131] = 8'b00000000;
    mem[130] = 8'b00000000;
    mem[129] = 8'b00000000;
    mem[128] = 8'b00000000;
    mem[127] = 8'b00000000;
    mem[126] = 8'b00000000;
    mem[125] = 8'b00000000;
    mem[124] = 8'b00000000;
    mem[123] = 8'b00000000;
    mem[122] = 8'b00000000;
    mem[121] = 8'b00000000;
    mem[120] = 8'b00000000;
    mem[119] = 8'b00000000;
    mem[118] = 8'b00000000;
    mem[117] = 8'b00000000;
    mem[116] = 8'b00000000;
    mem[115] = 8'b00000000;
    mem[114] = 8'b00000000;
    mem[113] = 8'b00000000;
    mem[112] = 8'b00000000;
    mem[111] = 8'b00000000;
    mem[110] = 8'b00000000;
    mem[109] = 8'b00000000;
    mem[108] = 8'b00000000;
    mem[107] = 8'b00000000;
    mem[106] = 8'b00000000;
    mem[105] = 8'b00000000;
    mem[104] = 8'b00000000;
    mem[103] = 8'b00000000;
    mem[102] = 8'b00000000;
    mem[101] = 8'b00000000;
    mem[100] = 8'b00000000;
    mem[99] = 8'b00000000;
    mem[98] = 8'b00000000;
    mem[97] = 8'b00000000;
    mem[96] = 8'b00000000;
    mem[95] = 8'b00000000;
    mem[94] = 8'b00000000;
    mem[93] = 8'b00000000;
    mem[92] = 8'b00000000;
    mem[91] = 8'b00000000;
    mem[90] = 8'b00000000;
    mem[89] = 8'b00000000;
    mem[88] = 8'b00000000;
    mem[87] = 8'b00000000;
    mem[86] = 8'b00000000;
    mem[85] = 8'b00000000;
    mem[84] = 8'b00000000;
    mem[83] = 8'b00000000;
    mem[82] = 8'b00000000;
    mem[81] = 8'b00000000;
    mem[80] = 8'b00000000;
    mem[79] = 8'b00000000;
    mem[78] = 8'b00000000;
    mem[77] = 8'b00000000;
    mem[76] = 8'b00000000;
    mem[75] = 8'b00000000;
    mem[74] = 8'b00000000;
    mem[73] = 8'b00000000;
    mem[72] = 8'b00000000;
    mem[71] = 8'b00000000;
    mem[70] = 8'b00000000;
    mem[69] = 8'b00000000;
    mem[68] = 8'b00000000;
    mem[67] = 8'b00000000;
    mem[66] = 8'b00000000;
    mem[65] = 8'b00000000;
    mem[64] = 8'b00000000;
    mem[63] = 8'b00000000;
    mem[62] = 8'b00000000;
    mem[61] = 8'b00000000;
    mem[60] = 8'b00000000;
    mem[59] = 8'b00000000;
    mem[58] = 8'b00000000;
    mem[57] = 8'b00000000;
    mem[56] = 8'b00000000;
    mem[55] = 8'b00000000;
    mem[54] = 8'b00000000;
    mem[53] = 8'b00000000;
    mem[52] = 8'b00000000;
    mem[51] = 8'b00000000;
    mem[50] = 8'b00000000;
    mem[49] = 8'b00000000;
    mem[48] = 8'b00000000;
    mem[47] = 8'b00000000;
    mem[46] = 8'b00000000;
    mem[45] = 8'b00000000;
    mem[44] = 8'b00000000;
    mem[43] = 8'b00000000;
    mem[42] = 8'b00000000;
    mem[41] = 8'b00000000;
    mem[40] = 8'b00000000;
    mem[39] = 8'b00000000;
    mem[38] = 8'b00000000;
    mem[37] = 8'b00000000;
    mem[36] = 8'b00000000;
    mem[35] = 8'b00000000;
    mem[34] = 8'b00000000;
    mem[33] = 8'b00000000;
    mem[32] = 8'b00000000;
    mem[31] = 8'b00000000;
    mem[30] = 8'b00000000;
    mem[29] = 8'b00000000;
    mem[28] = 8'b00000000;
    mem[27] = 8'b00000000;
    mem[26] = 8'b00000000;
    mem[25] = 8'b00000000;
    mem[24] = 8'b00000000;
    mem[23] = 8'b00000000;
    mem[22] = 8'b00000000;
    mem[21] = 8'b00000000;
    mem[20] = 8'b00000000;
    mem[19] = 8'b00000000;
    mem[18] = 8'b00000000;
    mem[17] = 8'b00000000;
    mem[16] = 8'b00000000;
    mem[15] = 8'b00000000;
    mem[14] = 8'b00000000;
    mem[13] = 8'b00000000;
    mem[12] = 8'b00000000;
    mem[11] = 8'b00000000;
    mem[10] = 8'b00000000;
    mem[9] = 8'b00000000;
    mem[8] = 8'b00000000;
    mem[7] = 8'b00000000;
    mem[6] = 8'b00000000;
    mem[5] = 8'b00000000;
    mem[4] = 8'b00000000;
    mem[3] = 8'b00000000;
    mem[2] = 8'b00000000;
    mem[1] = 8'b00000000;
    mem[0] = 8'b00000000;
    end
  always @(posedge b_clk)
    if (b_wr)
      mem[b_addr] <= b_din;
  always @(posedge b_clk)
    if (1'b1)
      n216_data <= mem[b_addr];
  always @(posedge a_clk)
    if (a_wr)
      mem[a_addr] <= a_din;
  always @(posedge a_clk)
    if (1'b1)
      n219_data <= mem[a_addr];
  /* mem/tdp_bram.vhd:101:17  */
  /* mem/tdp_bram.vhd:85:17  */
  /* mem/tdp_bram.vhd:100:9  */
endmodule

module com_spm
  (input  p_clk,
   input  n_clk,
   input  reset,
   input  [2:0] ocp_core_m_MCmd,
   input  [31:0] ocp_core_m_MAddr,
   input  [31:0] ocp_core_m_MData,
   input  [3:0] ocp_core_m_MByteEn,
   input  [13:0] spm_m_addr,
   input  [1:0] spm_m_en,
   input  spm_m_wr,
   input  [63:0] spm_m_wdata,
   output [1:0] ocp_core_s_SResp,
   output [31:0] ocp_core_s_SData,
   output [63:0] spm_s_rdata,
   output spm_s_error);
  wire [70:0] n0_o;
  wire [1:0] n2_o;
  wire [31:0] n3_o;
  wire [80:0] n4_o;
  wire [63:0] n6_o;
  wire n7_o;
  wire wr_h;
  wire wr_l;
  wire [31:0] sdata_h;
  wire [31:0] sdata_l;
  wire select_low;
  wire select_low_reg;
  wire select_high;
  wire select_high_reg;
  wire [2:0] mcmd;
  wire h_0_en;
  wire h_1_en;
  wire h_2_en;
  wire h_3_en;
  wire l_0_en;
  wire l_1_en;
  wire l_2_en;
  wire l_3_en;
  wire [31:0] even_wr_word;
  wire [31:0] odd_wr_word;
  wire [31:0] even_rd_word;
  wire [31:0] odd_rd_word;
  wire [8:0] even_addr;
  wire even_wr;
  wire odd_wr;
  wire addr_reg;
  wire n9_o;
  wire n12_o;
  wire n16_o;
  wire n20_o;
  wire n23_o;
  wire n26_o;
  wire n28_o;
  wire n30_o;
  wire n33_o;
  wire n39_o;
  wire [31:0] n40_o;
  wire [31:0] n41_o;
  wire [33:0] n43_o;
  wire [33:0] n44_o;
  wire n46_o;
  wire [1:0] n48_o;
  wire [1:0] n49_o;
  wire [1:0] n50_o;
  wire [1:0] n51_o;
  wire [31:0] n52_o;
  wire [31:0] n53_o;
  wire [31:0] n54_o;
  wire n58_o;
  wire [2:0] n59_o;
  wire n61_o;
  wire n63_o;
  wire [2:0] n65_o;
  reg n70_q;
  reg n71_q;
  reg [2:0] n72_q;
  wire n73_o;
  wire n74_o;
  wire n75_o;
  wire n76_o;
  wire n77_o;
  wire n78_o;
  wire n79_o;
  wire n80_o;
  wire n81_o;
  wire n82_o;
  wire n83_o;
  wire n84_o;
  wire n85_o;
  wire n86_o;
  wire n87_o;
  wire n88_o;
  wire [7:0] spm_h_0_a_dout;
  wire [7:0] spm_h_0_b_dout;
  wire [8:0] n89_o;
  wire [7:0] n90_o;
  wire [7:0] n92_o;
  wire [7:0] spm_h_1_a_dout;
  wire [7:0] spm_h_1_b_dout;
  wire [8:0] n94_o;
  wire [7:0] n95_o;
  wire [7:0] n97_o;
  wire [7:0] spm_h_2_a_dout;
  wire [7:0] spm_h_2_b_dout;
  wire [8:0] n99_o;
  wire [7:0] n100_o;
  wire [7:0] n102_o;
  wire [7:0] spm_h_3_a_dout;
  wire [7:0] spm_h_3_b_dout;
  wire [8:0] n104_o;
  wire [7:0] n105_o;
  wire [7:0] n107_o;
  wire [7:0] spm_l_0_a_dout;
  wire [7:0] spm_l_0_b_dout;
  wire [8:0] n109_o;
  wire [7:0] n110_o;
  wire [8:0] n112_o;
  wire [7:0] n113_o;
  wire [7:0] spm_l_1_a_dout;
  wire [7:0] spm_l_1_b_dout;
  wire [8:0] n115_o;
  wire [7:0] n116_o;
  wire [8:0] n118_o;
  wire [7:0] n119_o;
  wire [7:0] spm_l_2_a_dout;
  wire [7:0] spm_l_2_b_dout;
  wire [8:0] n121_o;
  wire [7:0] n122_o;
  wire [8:0] n124_o;
  wire [7:0] n125_o;
  wire [7:0] spm_l_3_a_dout;
  wire [7:0] spm_l_3_b_dout;
  wire [8:0] n127_o;
  wire [7:0] n128_o;
  wire [8:0] n130_o;
  wire [7:0] n131_o;
  wire n134_o;
  wire n135_o;
  wire [8:0] n136_o;
  wire [31:0] n137_o;
  wire n138_o;
  wire n139_o;
  wire n140_o;
  wire [31:0] n141_o;
  wire n142_o;
  wire n143_o;
  wire n144_o;
  wire [8:0] n145_o;
  wire [8:0] n147_o;
  wire [31:0] n148_o;
  wire n149_o;
  wire n150_o;
  wire n151_o;
  wire [31:0] n152_o;
  wire n153_o;
  wire n154_o;
  wire n155_o;
  wire [31:0] n156_o;
  wire [31:0] n157_o;
  wire [8:0] n158_o;
  wire n159_o;
  wire n160_o;
  wire n163_o;
  wire [63:0] n164_o;
  wire [63:0] n165_o;
  wire [63:0] n166_o;
  wire n170_o;
  reg n173_q;
  wire [31:0] n174_o;
  wire [31:0] n175_o;
  wire [31:0] n176_o;
  wire [31:0] n177_o;
  wire [33:0] n178_o;
  wire [64:0] n180_o;
  assign ocp_core_s_SResp = n2_o;
  assign ocp_core_s_SData = n3_o;
  assign spm_s_rdata = n6_o;
  assign spm_s_error = n7_o;
  assign n0_o = {ocp_core_m_MByteEn, ocp_core_m_MData, ocp_core_m_MAddr, ocp_core_m_MCmd};
  assign n2_o = n178_o[1:0];
  assign n3_o = n178_o[33:2];
  assign n4_o = {spm_m_wdata, spm_m_wr, spm_m_en, spm_m_addr};
  assign n6_o = n180_o[63:0];
  assign n7_o = n180_o[64];
  /* mem/com_spm.vhd:89:12  */
  assign wr_h = n30_o; // (signal)
  /* mem/com_spm.vhd:89:18  */
  assign wr_l = n33_o; // (signal)
  /* mem/com_spm.vhd:90:12  */
  assign sdata_h = n174_o; // (signal)
  /* mem/com_spm.vhd:90:21  */
  assign sdata_l = n175_o; // (signal)
  /* mem/com_spm.vhd:91:12  */
  assign select_low = n12_o; // (signal)
  /* mem/com_spm.vhd:91:24  */
  assign select_low_reg = n70_q; // (signal)
  /* mem/com_spm.vhd:92:12  */
  assign select_high = n16_o; // (signal)
  /* mem/com_spm.vhd:92:25  */
  assign select_high_reg = n71_q; // (signal)
  /* mem/com_spm.vhd:94:12  */
  assign mcmd = n72_q; // (signal)
  /* mem/com_spm.vhd:96:12  */
  assign h_0_en = n74_o; // (signal)
  /* mem/com_spm.vhd:96:20  */
  assign h_1_en = n76_o; // (signal)
  /* mem/com_spm.vhd:96:28  */
  assign h_2_en = n78_o; // (signal)
  /* mem/com_spm.vhd:96:36  */
  assign h_3_en = n80_o; // (signal)
  /* mem/com_spm.vhd:97:12  */
  assign l_0_en = n82_o; // (signal)
  /* mem/com_spm.vhd:97:20  */
  assign l_1_en = n84_o; // (signal)
  /* mem/com_spm.vhd:97:28  */
  assign l_2_en = n86_o; // (signal)
  /* mem/com_spm.vhd:97:36  */
  assign l_3_en = n88_o; // (signal)
  /* mem/com_spm.vhd:101:12  */
  assign even_wr_word = n156_o; // (signal)
  /* mem/com_spm.vhd:101:26  */
  assign odd_wr_word = n157_o; // (signal)
  /* mem/com_spm.vhd:102:12  */
  assign even_rd_word = n176_o; // (signal)
  /* mem/com_spm.vhd:102:26  */
  assign odd_rd_word = n177_o; // (signal)
  /* mem/com_spm.vhd:103:12  */
  assign even_addr = n158_o; // (signal)
  /* mem/com_spm.vhd:104:12  */
  assign even_wr = n159_o; // (signal)
  /* mem/com_spm.vhd:104:21  */
  assign odd_wr = n160_o; // (signal)
  /* mem/com_spm.vhd:106:12  */
  assign addr_reg = n173_q; // (signal)
  /* mem/com_spm.vhd:114:28  */
  assign n9_o = n0_o[5];
  /* mem/com_spm.vhd:114:9  */
  assign n12_o = n9_o ? 1'b1 : 1'b0;
  /* mem/com_spm.vhd:114:9  */
  assign n16_o = n9_o ? 1'b0 : 1'b1;
  /* mem/com_spm.vhd:125:27  */
  assign n20_o = n0_o[0];
  /* mem/com_spm.vhd:128:13  */
  assign n23_o = select_low ? 1'b1 : 1'b0;
  /* mem/com_spm.vhd:126:13  */
  assign n26_o = select_high ? 1'b1 : 1'b0;
  /* mem/com_spm.vhd:126:13  */
  assign n28_o = select_high ? 1'b0 : n23_o;
  /* mem/com_spm.vhd:125:9  */
  assign n30_o = n20_o ? n26_o : 1'b0;
  /* mem/com_spm.vhd:125:9  */
  assign n33_o = n20_o ? n28_o : 1'b0;
  /* mem/com_spm.vhd:138:16  */
  assign n39_o = mcmd[1];
  /* mem/com_spm.vhd:141:13  */
  assign n40_o = select_low_reg ? sdata_l : 32'b00000000000000000000000000000000;
  /* mem/com_spm.vhd:139:13  */
  assign n41_o = select_high_reg ? sdata_h : n40_o;
  assign n43_o = {n41_o, 2'b01};
  assign n44_o = {32'b00000000000000000000000000000000, 2'b00};
  /* mem/com_spm.vhd:147:16  */
  assign n46_o = mcmd[0];
  assign n48_o = n43_o[1:0];
  assign n49_o = n44_o[1:0];
  /* mem/com_spm.vhd:138:9  */
  assign n50_o = n39_o ? n48_o : n49_o;
  /* mem/com_spm.vhd:147:9  */
  assign n51_o = n46_o ? 2'b01 : n50_o;
  assign n52_o = n43_o[33:2];
  assign n53_o = n44_o[33:2];
  /* mem/com_spm.vhd:138:9  */
  assign n54_o = n39_o ? n52_o : n53_o;
  /* mem/com_spm.vhd:155:22  */
  assign n58_o = ~reset;
  /* mem/com_spm.vhd:156:36  */
  assign n59_o = n0_o[2:0];
  /* mem/com_spm.vhd:155:13  */
  assign n61_o = n58_o ? select_low : 1'b0;
  /* mem/com_spm.vhd:155:13  */
  assign n63_o = n58_o ? select_high : 1'b0;
  /* mem/com_spm.vhd:155:13  */
  assign n65_o = n58_o ? n59_o : 3'b000;
  /* mem/com_spm.vhd:154:9  */
  always @(posedge p_clk)
    n70_q <= n61_o;
  /* mem/com_spm.vhd:154:9  */
  always @(posedge p_clk)
    n71_q <= n63_o;
  /* mem/com_spm.vhd:154:9  */
  always @(posedge p_clk)
    n72_q <= n65_o;
  /* mem/com_spm.vhd:169:29  */
  assign n73_o = n0_o[67];
  /* mem/com_spm.vhd:169:33  */
  assign n74_o = n73_o & wr_h;
  /* mem/com_spm.vhd:170:29  */
  assign n75_o = n0_o[68];
  /* mem/com_spm.vhd:170:33  */
  assign n76_o = n75_o & wr_h;
  /* mem/com_spm.vhd:171:29  */
  assign n77_o = n0_o[69];
  /* mem/com_spm.vhd:171:33  */
  assign n78_o = n77_o & wr_h;
  /* mem/com_spm.vhd:172:29  */
  assign n79_o = n0_o[70];
  /* mem/com_spm.vhd:172:33  */
  assign n80_o = n79_o & wr_h;
  /* mem/com_spm.vhd:174:29  */
  assign n81_o = n0_o[67];
  /* mem/com_spm.vhd:174:33  */
  assign n82_o = n81_o & wr_l;
  /* mem/com_spm.vhd:175:29  */
  assign n83_o = n0_o[68];
  /* mem/com_spm.vhd:175:33  */
  assign n84_o = n83_o & wr_l;
  /* mem/com_spm.vhd:176:29  */
  assign n85_o = n0_o[69];
  /* mem/com_spm.vhd:176:33  */
  assign n86_o = n85_o & wr_l;
  /* mem/com_spm.vhd:177:29  */
  assign n87_o = n0_o[70];
  /* mem/com_spm.vhd:177:33  */
  assign n88_o = n87_o & wr_l;
  /* mem/com_spm.vhd:180:1  */
  tdp_bram_8_9 spm_h_0 (
    .a_clk(p_clk),
    .a_wr(h_0_en),
    .a_addr(n89_o),
    .a_din(n90_o),
    .b_clk(n_clk),
    .b_wr(even_wr),
    .b_addr(even_addr),
    .b_din(n92_o),
    .a_dout(spm_h_0_a_dout),
    .b_dout(spm_h_0_b_dout));
  /* mem/com_spm.vhd:184:40  */
  assign n89_o = n0_o[14:6];
  /* mem/com_spm.vhd:185:39  */
  assign n90_o = n0_o[42:35];
  /* mem/com_spm.vhd:190:26  */
  assign n92_o = even_wr_word[7:0];
  /* mem/com_spm.vhd:194:1  */
  tdp_bram_8_9 spm_h_1 (
    .a_clk(p_clk),
    .a_wr(h_1_en),
    .a_addr(n94_o),
    .a_din(n95_o),
    .b_clk(n_clk),
    .b_wr(even_wr),
    .b_addr(even_addr),
    .b_din(n97_o),
    .a_dout(spm_h_1_a_dout),
    .b_dout(spm_h_1_b_dout));
  /* mem/com_spm.vhd:198:40  */
  assign n94_o = n0_o[14:6];
  /* mem/com_spm.vhd:199:39  */
  assign n95_o = n0_o[50:43];
  /* mem/com_spm.vhd:204:26  */
  assign n97_o = even_wr_word[15:8];
  /* mem/com_spm.vhd:208:1  */
  tdp_bram_8_9 spm_h_2 (
    .a_clk(p_clk),
    .a_wr(h_2_en),
    .a_addr(n99_o),
    .a_din(n100_o),
    .b_clk(n_clk),
    .b_wr(even_wr),
    .b_addr(even_addr),
    .b_din(n102_o),
    .a_dout(spm_h_2_a_dout),
    .b_dout(spm_h_2_b_dout));
  /* mem/com_spm.vhd:212:40  */
  assign n99_o = n0_o[14:6];
  /* mem/com_spm.vhd:213:39  */
  assign n100_o = n0_o[58:51];
  /* mem/com_spm.vhd:218:26  */
  assign n102_o = even_wr_word[23:16];
  /* mem/com_spm.vhd:222:1  */
  tdp_bram_8_9 spm_h_3 (
    .a_clk(p_clk),
    .a_wr(h_3_en),
    .a_addr(n104_o),
    .a_din(n105_o),
    .b_clk(n_clk),
    .b_wr(even_wr),
    .b_addr(even_addr),
    .b_din(n107_o),
    .a_dout(spm_h_3_a_dout),
    .b_dout(spm_h_3_b_dout));
  /* mem/com_spm.vhd:226:40  */
  assign n104_o = n0_o[14:6];
  /* mem/com_spm.vhd:227:39  */
  assign n105_o = n0_o[66:59];
  /* mem/com_spm.vhd:232:26  */
  assign n107_o = even_wr_word[31:24];
  /* mem/com_spm.vhd:236:1  */
  tdp_bram_8_9 spm_l_0 (
    .a_clk(p_clk),
    .a_wr(l_0_en),
    .a_addr(n109_o),
    .a_din(n110_o),
    .b_clk(n_clk),
    .b_wr(odd_wr),
    .b_addr(n112_o),
    .b_din(n113_o),
    .a_dout(spm_l_0_a_dout),
    .b_dout(spm_l_0_b_dout));
  /* mem/com_spm.vhd:240:40  */
  assign n109_o = n0_o[14:6];
  /* mem/com_spm.vhd:241:39  */
  assign n110_o = n0_o[42:35];
  /* mem/com_spm.vhd:245:25  */
  assign n112_o = n4_o[9:1];
  /* mem/com_spm.vhd:246:25  */
  assign n113_o = odd_wr_word[7:0];
  /* mem/com_spm.vhd:250:1  */
  tdp_bram_8_9 spm_l_1 (
    .a_clk(p_clk),
    .a_wr(l_1_en),
    .a_addr(n115_o),
    .a_din(n116_o),
    .b_clk(n_clk),
    .b_wr(odd_wr),
    .b_addr(n118_o),
    .b_din(n119_o),
    .a_dout(spm_l_1_a_dout),
    .b_dout(spm_l_1_b_dout));
  /* mem/com_spm.vhd:254:40  */
  assign n115_o = n0_o[14:6];
  /* mem/com_spm.vhd:255:39  */
  assign n116_o = n0_o[50:43];
  /* mem/com_spm.vhd:259:25  */
  assign n118_o = n4_o[9:1];
  /* mem/com_spm.vhd:260:25  */
  assign n119_o = odd_wr_word[15:8];
  /* mem/com_spm.vhd:264:1  */
  tdp_bram_8_9 spm_l_2 (
    .a_clk(p_clk),
    .a_wr(l_2_en),
    .a_addr(n121_o),
    .a_din(n122_o),
    .b_clk(n_clk),
    .b_wr(odd_wr),
    .b_addr(n124_o),
    .b_din(n125_o),
    .a_dout(spm_l_2_a_dout),
    .b_dout(spm_l_2_b_dout));
  /* mem/com_spm.vhd:268:40  */
  assign n121_o = n0_o[14:6];
  /* mem/com_spm.vhd:269:39  */
  assign n122_o = n0_o[58:51];
  /* mem/com_spm.vhd:273:25  */
  assign n124_o = n4_o[9:1];
  /* mem/com_spm.vhd:274:25  */
  assign n125_o = odd_wr_word[23:16];
  /* mem/com_spm.vhd:278:1  */
  tdp_bram_8_9 spm_l_3 (
    .a_clk(p_clk),
    .a_wr(l_3_en),
    .a_addr(n127_o),
    .a_din(n128_o),
    .b_clk(n_clk),
    .b_wr(odd_wr),
    .b_addr(n130_o),
    .b_din(n131_o),
    .a_dout(spm_l_3_a_dout),
    .b_dout(spm_l_3_b_dout));
  /* mem/com_spm.vhd:282:40  */
  assign n127_o = n0_o[14:6];
  /* mem/com_spm.vhd:283:39  */
  assign n128_o = n0_o[66:59];
  /* mem/com_spm.vhd:287:25  */
  assign n130_o = n4_o[9:1];
  /* mem/com_spm.vhd:288:25  */
  assign n131_o = odd_wr_word[31:24];
  /* mem/com_spm.vhd:294:18  */
  assign n134_o = n4_o[0];
  /* mem/com_spm.vhd:294:22  */
  assign n135_o = ~n134_o;
  /* mem/com_spm.vhd:295:32  */
  assign n136_o = n4_o[9:1];
  /* mem/com_spm.vhd:296:36  */
  assign n137_o = n4_o[80:49];
  /* mem/com_spm.vhd:297:28  */
  assign n138_o = n4_o[16];
  /* mem/com_spm.vhd:297:43  */
  assign n139_o = n4_o[14];
  /* mem/com_spm.vhd:297:31  */
  assign n140_o = n138_o & n139_o;
  /* mem/com_spm.vhd:298:36  */
  assign n141_o = n4_o[48:17];
  /* mem/com_spm.vhd:299:28  */
  assign n142_o = n4_o[16];
  /* mem/com_spm.vhd:299:43  */
  assign n143_o = n4_o[15];
  /* mem/com_spm.vhd:299:31  */
  assign n144_o = n142_o & n143_o;
  /* mem/com_spm.vhd:301:32  */
  assign n145_o = n4_o[9:1];
  /* mem/com_spm.vhd:301:58  */
  assign n147_o = n145_o + 9'b000000001;
  /* mem/com_spm.vhd:302:36  */
  assign n148_o = n4_o[48:17];
  /* mem/com_spm.vhd:303:28  */
  assign n149_o = n4_o[16];
  /* mem/com_spm.vhd:303:43  */
  assign n150_o = n4_o[15];
  /* mem/com_spm.vhd:303:31  */
  assign n151_o = n149_o & n150_o;
  /* mem/com_spm.vhd:304:36  */
  assign n152_o = n4_o[80:49];
  /* mem/com_spm.vhd:305:28  */
  assign n153_o = n4_o[16];
  /* mem/com_spm.vhd:305:43  */
  assign n154_o = n4_o[14];
  /* mem/com_spm.vhd:305:31  */
  assign n155_o = n153_o & n154_o;
  /* mem/com_spm.vhd:294:5  */
  assign n156_o = n135_o ? n137_o : n148_o;
  /* mem/com_spm.vhd:294:5  */
  assign n157_o = n135_o ? n141_o : n152_o;
  /* mem/com_spm.vhd:294:5  */
  assign n158_o = n135_o ? n136_o : n147_o;
  /* mem/com_spm.vhd:294:5  */
  assign n159_o = n135_o ? n140_o : n151_o;
  /* mem/com_spm.vhd:294:5  */
  assign n160_o = n135_o ? n144_o : n155_o;
  /* mem/com_spm.vhd:311:17  */
  assign n163_o = ~addr_reg;
  assign n164_o = {odd_rd_word, even_rd_word};
  assign n165_o = {even_rd_word, odd_rd_word};
  /* mem/com_spm.vhd:311:5  */
  assign n166_o = n163_o ? n165_o : n164_o;
  /* mem/com_spm.vhd:323:31  */
  assign n170_o = n4_o[0];
  /* mem/com_spm.vhd:322:5  */
  always @(posedge n_clk)
    n173_q <= n170_o;
  /* mem/com_spm.vhd:322:5  */
  assign n174_o = {spm_h_3_a_dout, spm_h_2_a_dout, spm_h_1_a_dout, spm_h_0_a_dout};
  assign n175_o = {spm_l_3_a_dout, spm_l_2_a_dout, spm_l_1_a_dout, spm_l_0_a_dout};
  assign n176_o = {spm_h_3_b_dout, spm_h_2_b_dout, spm_h_1_b_dout, spm_h_0_b_dout};
  assign n177_o = {spm_l_3_b_dout, spm_l_2_b_dout, spm_l_1_b_dout, spm_l_0_b_dout};
  assign n178_o = {n54_o, n51_o};
  assign n180_o = {1'bZ, n166_o};
endmodule

