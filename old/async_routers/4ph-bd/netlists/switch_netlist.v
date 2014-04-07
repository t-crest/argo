
module sr_latch_0_0 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n2;

  HS65_LS_AND2X27 C8 ( .A(n2), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n2) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_0 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_0 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_0 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, N0, n1;
  assign Rout = Aout;
  assign lt_en = N0;

  c_gate_0_0 gate ( .preset(preset), .a(n1), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 U1 ( .A(Ain), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(Aout), .Z(N0) );
endmodule


module channel_latch_1_xxxxxxxxx_0 ( preset, .left_in({\left_in[REQ] , 
        \left_in[DATA][33] , \left_in[DATA][32] , \left_in[DATA][31] , 
        \left_in[DATA][30] , \left_in[DATA][29] , \left_in[DATA][28] , 
        \left_in[DATA][27] , \left_in[DATA][26] , \left_in[DATA][25] , 
        \left_in[DATA][24] , \left_in[DATA][23] , \left_in[DATA][22] , 
        \left_in[DATA][21] , \left_in[DATA][20] , \left_in[DATA][19] , 
        \left_in[DATA][18] , \left_in[DATA][17] , \left_in[DATA][16] , 
        \left_in[DATA][15] , \left_in[DATA][14] , \left_in[DATA][13] , 
        \left_in[DATA][12] , \left_in[DATA][11] , \left_in[DATA][10] , 
        \left_in[DATA][9] , \left_in[DATA][8] , \left_in[DATA][7] , 
        \left_in[DATA][6] , \left_in[DATA][5] , \left_in[DATA][4] , 
        \left_in[DATA][3] , \left_in[DATA][2] , \left_in[DATA][1] , 
        \left_in[DATA][0] }), .left_out(\left_out[ACK] ), .right_out({
        \right_out[REQ] , \right_out[DATA][33] , \right_out[DATA][32] , 
        \right_out[DATA][31] , \right_out[DATA][30] , \right_out[DATA][29] , 
        \right_out[DATA][28] , \right_out[DATA][27] , \right_out[DATA][26] , 
        \right_out[DATA][25] , \right_out[DATA][24] , \right_out[DATA][23] , 
        \right_out[DATA][22] , \right_out[DATA][21] , \right_out[DATA][20] , 
        \right_out[DATA][19] , \right_out[DATA][18] , \right_out[DATA][17] , 
        \right_out[DATA][16] , \right_out[DATA][15] , \right_out[DATA][14] , 
        \right_out[DATA][13] , \right_out[DATA][12] , \right_out[DATA][11] , 
        \right_out[DATA][10] , \right_out[DATA][9] , \right_out[DATA][8] , 
        \right_out[DATA][7] , \right_out[DATA][6] , \right_out[DATA][5] , 
        \right_out[DATA][4] , \right_out[DATA][3] , \right_out[DATA][2] , 
        \right_out[DATA][1] , \right_out[DATA][0] }), .right_in(
        \right_in[ACK] ) );
  input preset, \left_in[REQ] , \left_in[DATA][33] , \left_in[DATA][32] ,
         \left_in[DATA][31] , \left_in[DATA][30] , \left_in[DATA][29] ,
         \left_in[DATA][28] , \left_in[DATA][27] , \left_in[DATA][26] ,
         \left_in[DATA][25] , \left_in[DATA][24] , \left_in[DATA][23] ,
         \left_in[DATA][22] , \left_in[DATA][21] , \left_in[DATA][20] ,
         \left_in[DATA][19] , \left_in[DATA][18] , \left_in[DATA][17] ,
         \left_in[DATA][16] , \left_in[DATA][15] , \left_in[DATA][14] ,
         \left_in[DATA][13] , \left_in[DATA][12] , \left_in[DATA][11] ,
         \left_in[DATA][10] , \left_in[DATA][9] , \left_in[DATA][8] ,
         \left_in[DATA][7] , \left_in[DATA][6] , \left_in[DATA][5] ,
         \left_in[DATA][4] , \left_in[DATA][3] , \left_in[DATA][2] ,
         \left_in[DATA][1] , \left_in[DATA][0] , \right_in[ACK] ;
  output \left_out[ACK] , \right_out[REQ] , \right_out[DATA][33] ,
         \right_out[DATA][32] , \right_out[DATA][31] , \right_out[DATA][30] ,
         \right_out[DATA][29] , \right_out[DATA][28] , \right_out[DATA][27] ,
         \right_out[DATA][26] , \right_out[DATA][25] , \right_out[DATA][24] ,
         \right_out[DATA][23] , \right_out[DATA][22] , \right_out[DATA][21] ,
         \right_out[DATA][20] , \right_out[DATA][19] , \right_out[DATA][18] ,
         \right_out[DATA][17] , \right_out[DATA][16] , \right_out[DATA][15] ,
         \right_out[DATA][14] , \right_out[DATA][13] , \right_out[DATA][12] ,
         \right_out[DATA][11] , \right_out[DATA][10] , \right_out[DATA][9] ,
         \right_out[DATA][8] , \right_out[DATA][7] , \right_out[DATA][6] ,
         \right_out[DATA][5] , \right_out[DATA][4] , \right_out[DATA][3] ,
         \right_out[DATA][2] , \right_out[DATA][1] , \right_out[DATA][0] ;
  wire   lt_en, N3;

  latch_controller_1_0 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N3), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N3), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N3), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N3), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N3), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N3), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N3), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N3), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N3), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N3), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N3), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N3), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N3), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N3), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N3), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N3), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N3), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N3), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N3), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX9 \data_reg[12]  ( .G(N3), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N3), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N3), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N3), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N3), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N3), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N3), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N3), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N3), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N3), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N3), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[33]  ( .G(N3), .D(\left_in[DATA][33] ), .Q(
        \right_out[DATA][33] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N3), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N3), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LS_LDHQX9 \data_reg[32]  ( .G(N3), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LS_OR2X9 U3 ( .A(lt_en), .B(preset), .Z(N3) );
endmodule


module hpu_comb_0_0 ( data_valid, data_in, data_out, sel );
  input [33:0] data_in;
  output [33:0] data_out;
  output [4:0] sel;
  input data_valid;
  wire   N16, N17, N18, N19, N20, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n35, n36, n37, n1, n38, n39,
         n40, n41, n42, n43;
  assign data_out[33] = data_in[33];
  assign data_out[32] = data_in[32];

  HS65_LS_LDHQX9 \sel_reg[4]  ( .G(N20), .D(N19), .Q(sel[4]) );
  HS65_LS_LDHQX9 \sel_reg[3]  ( .G(N20), .D(N18), .Q(sel[3]) );
  HS65_LS_LDHQX9 \sel_reg[2]  ( .G(N20), .D(N17), .Q(sel[2]) );
  HS65_LS_LDHQX9 \sel_reg[1]  ( .G(N20), .D(N16), .Q(sel[1]) );
  HS65_LS_LDHQX9 \sel_reg[0]  ( .G(N20), .D(1'b0), .Q(sel[0]) );
  HS65_LS_BFX9 U3 ( .A(n42), .Z(n40) );
  HS65_LS_NOR2X5 U4 ( .A(n41), .B(n36), .Z(N19) );
  HS65_LS_NAND2X7 U5 ( .A(n39), .B(n36), .Z(n37) );
  HS65_LS_IVX9 U6 ( .A(n43), .Z(n38) );
  HS65_LS_IVX9 U7 ( .A(n43), .Z(n1) );
  HS65_LS_IVX9 U8 ( .A(n43), .Z(n39) );
  HS65_LS_BFX9 U9 ( .A(n42), .Z(n41) );
  HS65_LS_OAI22X6 U10 ( .A(n43), .B(n25), .C(n1), .D(n27), .Z(data_out[6]) );
  HS65_LS_OAI22X6 U11 ( .A(n24), .B(n41), .C(n1), .D(n26), .Z(data_out[7]) );
  HS65_LS_OAI22X6 U12 ( .A(n41), .B(n31), .C(n39), .D(n33), .Z(data_out[0]) );
  HS65_LS_OAI22X6 U13 ( .A(n41), .B(n30), .C(n38), .D(n32), .Z(data_out[1]) );
  HS65_LS_OAI22X6 U14 ( .A(n40), .B(n29), .C(n1), .D(n31), .Z(data_out[2]) );
  HS65_LS_OAI22X6 U15 ( .A(n40), .B(n28), .C(n1), .D(n30), .Z(data_out[3]) );
  HS65_LS_OAI22X6 U16 ( .A(n40), .B(n27), .C(n1), .D(n29), .Z(data_out[4]) );
  HS65_LS_OAI22X6 U17 ( .A(n40), .B(n26), .C(n38), .D(n28), .Z(data_out[5]) );
  HS65_LS_OAI22X6 U18 ( .A(n40), .B(n23), .C(n1), .D(n25), .Z(data_out[8]) );
  HS65_LS_OAI22X6 U19 ( .A(n40), .B(n22), .C(n1), .D(n24), .Z(data_out[9]) );
  HS65_LS_OAI22X6 U20 ( .A(n41), .B(n21), .C(n39), .D(n23), .Z(data_out[10])
         );
  HS65_LS_OAI22X6 U21 ( .A(n41), .B(n20), .C(n39), .D(n22), .Z(data_out[11])
         );
  HS65_LS_OAI22X6 U22 ( .A(n41), .B(n19), .C(n39), .D(n21), .Z(data_out[12])
         );
  HS65_LS_OAI22X6 U23 ( .A(n41), .B(n18), .C(n39), .D(n20), .Z(data_out[13])
         );
  HS65_LS_OAI22X6 U24 ( .A(n41), .B(n17), .C(n39), .D(n19), .Z(data_out[14])
         );
  HS65_LS_OAI22X6 U25 ( .A(n41), .B(n16), .C(n38), .D(n18), .Z(data_out[15])
         );
  HS65_LS_OAI22X6 U26 ( .A(n41), .B(n15), .C(n38), .D(n17), .Z(data_out[16])
         );
  HS65_LS_OAI22X6 U27 ( .A(n40), .B(n14), .C(n38), .D(n16), .Z(data_out[17])
         );
  HS65_LS_OAI22X6 U28 ( .A(n40), .B(n13), .C(n38), .D(n15), .Z(data_out[18])
         );
  HS65_LS_OAI22X6 U29 ( .A(n40), .B(n12), .C(n38), .D(n14), .Z(data_out[19])
         );
  HS65_LS_OAI22X6 U30 ( .A(n40), .B(n11), .C(n38), .D(n13), .Z(data_out[20])
         );
  HS65_LS_OAI22X6 U31 ( .A(n40), .B(n10), .C(n38), .D(n12), .Z(data_out[21])
         );
  HS65_LS_OAI22X6 U32 ( .A(n40), .B(n9), .C(n38), .D(n11), .Z(data_out[22]) );
  HS65_LS_OAI22X6 U33 ( .A(n40), .B(n8), .C(n38), .D(n10), .Z(data_out[23]) );
  HS65_LS_OAI22X6 U34 ( .A(n40), .B(n7), .C(n38), .D(n9), .Z(data_out[24]) );
  HS65_LS_OAI22X6 U35 ( .A(n40), .B(n6), .C(n1), .D(n8), .Z(data_out[25]) );
  HS65_LS_OAI22X6 U36 ( .A(n40), .B(n5), .C(n1), .D(n7), .Z(data_out[26]) );
  HS65_LS_OAI22X6 U37 ( .A(n40), .B(n4), .C(n1), .D(n6), .Z(data_out[27]) );
  HS65_LS_OAI22X6 U38 ( .A(n40), .B(n3), .C(n1), .D(n5), .Z(data_out[28]) );
  HS65_LS_OAI22X6 U39 ( .A(n40), .B(n2), .C(n1), .D(n4), .Z(data_out[29]) );
  HS65_LS_IVX9 U40 ( .A(n35), .Z(n43) );
  HS65_LS_NOR3X4 U41 ( .A(n37), .B(n32), .C(n33), .Z(N18) );
  HS65_LS_NAND2X7 U42 ( .A(n32), .B(n33), .Z(n36) );
  HS65_LS_IVX9 U43 ( .A(n35), .Z(n42) );
  HS65_LS_NOR2X6 U44 ( .A(n39), .B(n3), .Z(data_out[30]) );
  HS65_LS_NOR2X6 U45 ( .A(n39), .B(n2), .Z(data_out[31]) );
  HS65_LS_IVX9 U46 ( .A(data_in[1]), .Z(n32) );
  HS65_LS_NOR2AX13 U47 ( .A(data_in[33]), .B(data_in[32]), .Z(n35) );
  HS65_LS_IVX9 U48 ( .A(data_in[0]), .Z(n33) );
  HS65_LS_IVX9 U49 ( .A(data_in[9]), .Z(n24) );
  HS65_LS_IVX9 U50 ( .A(data_in[2]), .Z(n31) );
  HS65_LS_IVX9 U51 ( .A(data_in[3]), .Z(n30) );
  HS65_LS_IVX9 U52 ( .A(data_in[4]), .Z(n29) );
  HS65_LS_IVX9 U53 ( .A(data_in[5]), .Z(n28) );
  HS65_LS_IVX9 U54 ( .A(data_in[6]), .Z(n27) );
  HS65_LS_IVX9 U55 ( .A(data_in[7]), .Z(n26) );
  HS65_LS_IVX9 U56 ( .A(data_in[8]), .Z(n25) );
  HS65_LS_IVX9 U57 ( .A(data_in[10]), .Z(n23) );
  HS65_LS_IVX9 U58 ( .A(data_in[11]), .Z(n22) );
  HS65_LS_IVX9 U59 ( .A(data_in[12]), .Z(n21) );
  HS65_LS_IVX9 U60 ( .A(data_in[13]), .Z(n20) );
  HS65_LS_IVX9 U61 ( .A(data_in[14]), .Z(n19) );
  HS65_LS_IVX9 U62 ( .A(data_in[15]), .Z(n18) );
  HS65_LS_IVX9 U63 ( .A(data_in[16]), .Z(n17) );
  HS65_LS_IVX9 U64 ( .A(data_in[17]), .Z(n16) );
  HS65_LS_IVX9 U65 ( .A(data_in[18]), .Z(n15) );
  HS65_LS_IVX9 U66 ( .A(data_in[19]), .Z(n14) );
  HS65_LS_IVX9 U67 ( .A(data_in[20]), .Z(n13) );
  HS65_LS_IVX9 U68 ( .A(data_in[21]), .Z(n12) );
  HS65_LS_IVX9 U69 ( .A(data_in[22]), .Z(n11) );
  HS65_LS_IVX9 U70 ( .A(data_in[23]), .Z(n10) );
  HS65_LS_IVX9 U71 ( .A(data_in[24]), .Z(n9) );
  HS65_LS_IVX9 U72 ( .A(data_in[25]), .Z(n8) );
  HS65_LS_IVX9 U73 ( .A(data_in[26]), .Z(n7) );
  HS65_LS_IVX9 U74 ( .A(data_in[27]), .Z(n6) );
  HS65_LS_IVX9 U75 ( .A(data_in[28]), .Z(n5) );
  HS65_LS_IVX9 U77 ( .A(data_in[29]), .Z(n4) );
  HS65_LS_IVX9 U78 ( .A(data_in[30]), .Z(n3) );
  HS65_LS_IVX9 U79 ( .A(data_in[31]), .Z(n2) );
  HS65_LS_NOR2X6 U80 ( .A(data_in[1]), .B(n37), .Z(N16) );
  HS65_LS_NOR2X6 U81 ( .A(data_in[0]), .B(n37), .Z(N17) );
  HS65_LS_NOR2AX3 U82 ( .A(data_valid), .B(data_in[32]), .Z(N20) );
endmodule


module sr_latch_0_5 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X27 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_5 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_5 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_OAI21X3 U3 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_IVX9 U4 ( .A(preset), .Z(n1) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_5 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, N0, n2;
  assign Rout = Aout;
  assign lt_en = N0;

  c_gate_0_5 gate ( .preset(preset), .a(n2), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 I_0 ( .A(Aout), .Z(N0) );
  HS65_LS_IVX9 U1 ( .A(Ain), .Z(n2) );
endmodule


module channel_latch_1_xxxxxxxxx_5 ( preset, .left_in({\left_in[REQ] , 
        \left_in[DATA][33] , \left_in[DATA][32] , \left_in[DATA][31] , 
        \left_in[DATA][30] , \left_in[DATA][29] , \left_in[DATA][28] , 
        \left_in[DATA][27] , \left_in[DATA][26] , \left_in[DATA][25] , 
        \left_in[DATA][24] , \left_in[DATA][23] , \left_in[DATA][22] , 
        \left_in[DATA][21] , \left_in[DATA][20] , \left_in[DATA][19] , 
        \left_in[DATA][18] , \left_in[DATA][17] , \left_in[DATA][16] , 
        \left_in[DATA][15] , \left_in[DATA][14] , \left_in[DATA][13] , 
        \left_in[DATA][12] , \left_in[DATA][11] , \left_in[DATA][10] , 
        \left_in[DATA][9] , \left_in[DATA][8] , \left_in[DATA][7] , 
        \left_in[DATA][6] , \left_in[DATA][5] , \left_in[DATA][4] , 
        \left_in[DATA][3] , \left_in[DATA][2] , \left_in[DATA][1] , 
        \left_in[DATA][0] }), .left_out(\left_out[ACK] ), .right_out({
        \right_out[REQ] , \right_out[DATA][33] , \right_out[DATA][32] , 
        \right_out[DATA][31] , \right_out[DATA][30] , \right_out[DATA][29] , 
        \right_out[DATA][28] , \right_out[DATA][27] , \right_out[DATA][26] , 
        \right_out[DATA][25] , \right_out[DATA][24] , \right_out[DATA][23] , 
        \right_out[DATA][22] , \right_out[DATA][21] , \right_out[DATA][20] , 
        \right_out[DATA][19] , \right_out[DATA][18] , \right_out[DATA][17] , 
        \right_out[DATA][16] , \right_out[DATA][15] , \right_out[DATA][14] , 
        \right_out[DATA][13] , \right_out[DATA][12] , \right_out[DATA][11] , 
        \right_out[DATA][10] , \right_out[DATA][9] , \right_out[DATA][8] , 
        \right_out[DATA][7] , \right_out[DATA][6] , \right_out[DATA][5] , 
        \right_out[DATA][4] , \right_out[DATA][3] , \right_out[DATA][2] , 
        \right_out[DATA][1] , \right_out[DATA][0] }), .right_in(
        \right_in[ACK] ) );
  input preset, \left_in[REQ] , \left_in[DATA][33] , \left_in[DATA][32] ,
         \left_in[DATA][31] , \left_in[DATA][30] , \left_in[DATA][29] ,
         \left_in[DATA][28] , \left_in[DATA][27] , \left_in[DATA][26] ,
         \left_in[DATA][25] , \left_in[DATA][24] , \left_in[DATA][23] ,
         \left_in[DATA][22] , \left_in[DATA][21] , \left_in[DATA][20] ,
         \left_in[DATA][19] , \left_in[DATA][18] , \left_in[DATA][17] ,
         \left_in[DATA][16] , \left_in[DATA][15] , \left_in[DATA][14] ,
         \left_in[DATA][13] , \left_in[DATA][12] , \left_in[DATA][11] ,
         \left_in[DATA][10] , \left_in[DATA][9] , \left_in[DATA][8] ,
         \left_in[DATA][7] , \left_in[DATA][6] , \left_in[DATA][5] ,
         \left_in[DATA][4] , \left_in[DATA][3] , \left_in[DATA][2] ,
         \left_in[DATA][1] , \left_in[DATA][0] , \right_in[ACK] ;
  output \left_out[ACK] , \right_out[REQ] , \right_out[DATA][33] ,
         \right_out[DATA][32] , \right_out[DATA][31] , \right_out[DATA][30] ,
         \right_out[DATA][29] , \right_out[DATA][28] , \right_out[DATA][27] ,
         \right_out[DATA][26] , \right_out[DATA][25] , \right_out[DATA][24] ,
         \right_out[DATA][23] , \right_out[DATA][22] , \right_out[DATA][21] ,
         \right_out[DATA][20] , \right_out[DATA][19] , \right_out[DATA][18] ,
         \right_out[DATA][17] , \right_out[DATA][16] , \right_out[DATA][15] ,
         \right_out[DATA][14] , \right_out[DATA][13] , \right_out[DATA][12] ,
         \right_out[DATA][11] , \right_out[DATA][10] , \right_out[DATA][9] ,
         \right_out[DATA][8] , \right_out[DATA][7] , \right_out[DATA][6] ,
         \right_out[DATA][5] , \right_out[DATA][4] , \right_out[DATA][3] ,
         \right_out[DATA][2] , \right_out[DATA][1] , \right_out[DATA][0] ;
  wire   lt_en, N3;

  latch_controller_1_5 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX18 \data_reg[29]  ( .G(N3), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX18 \data_reg[28]  ( .G(N3), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX18 \data_reg[27]  ( .G(N3), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX18 \data_reg[26]  ( .G(N3), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX18 \data_reg[25]  ( .G(N3), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX18 \data_reg[24]  ( .G(N3), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX18 \data_reg[23]  ( .G(N3), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX18 \data_reg[22]  ( .G(N3), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX18 \data_reg[21]  ( .G(N3), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX18 \data_reg[20]  ( .G(N3), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX18 \data_reg[19]  ( .G(N3), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX18 \data_reg[18]  ( .G(N3), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX18 \data_reg[17]  ( .G(N3), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX18 \data_reg[16]  ( .G(N3), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX18 \data_reg[15]  ( .G(N3), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX18 \data_reg[14]  ( .G(N3), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX18 \data_reg[13]  ( .G(N3), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX18 \data_reg[12]  ( .G(N3), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX18 \data_reg[11]  ( .G(N3), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX18 \data_reg[10]  ( .G(N3), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX18 \data_reg[9]  ( .G(N3), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX18 \data_reg[8]  ( .G(N3), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX18 \data_reg[7]  ( .G(N3), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_LDHQX18 \data_reg[6]  ( .G(N3), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX18 \data_reg[5]  ( .G(N3), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX18 \data_reg[4]  ( .G(N3), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_LDHQX18 \data_reg[3]  ( .G(N3), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX18 \data_reg[2]  ( .G(N3), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX18 \data_reg[1]  ( .G(N3), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LS_LDHQX18 \data_reg[0]  ( .G(N3), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N3), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N3), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDHQX9 \data_reg[33]  ( .G(N3), .D(\left_in[DATA][33] ), .Q(
        \right_out[DATA][33] ) );
  HS65_LS_LDHQX9 \data_reg[32]  ( .G(N3), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LS_OR2X9 U3 ( .A(lt_en), .B(preset), .Z(N3) );
endmodule


module hpu_0_0 ( preset, .chan_in_f({\chan_in_f[REQ] , \chan_in_f[DATA][33] , 
        \chan_in_f[DATA][32] , \chan_in_f[DATA][31] , \chan_in_f[DATA][30] , 
        \chan_in_f[DATA][29] , \chan_in_f[DATA][28] , \chan_in_f[DATA][27] , 
        \chan_in_f[DATA][26] , \chan_in_f[DATA][25] , \chan_in_f[DATA][24] , 
        \chan_in_f[DATA][23] , \chan_in_f[DATA][22] , \chan_in_f[DATA][21] , 
        \chan_in_f[DATA][20] , \chan_in_f[DATA][19] , \chan_in_f[DATA][18] , 
        \chan_in_f[DATA][17] , \chan_in_f[DATA][16] , \chan_in_f[DATA][15] , 
        \chan_in_f[DATA][14] , \chan_in_f[DATA][13] , \chan_in_f[DATA][12] , 
        \chan_in_f[DATA][11] , \chan_in_f[DATA][10] , \chan_in_f[DATA][9] , 
        \chan_in_f[DATA][8] , \chan_in_f[DATA][7] , \chan_in_f[DATA][6] , 
        \chan_in_f[DATA][5] , \chan_in_f[DATA][4] , \chan_in_f[DATA][3] , 
        \chan_in_f[DATA][2] , \chan_in_f[DATA][1] , \chan_in_f[DATA][0] }), 
    .chan_in_b(\chan_in_b[ACK] ), .chan_out_f({\chan_out_f[REQ] , 
        \chan_out_f[DATA][33] , \chan_out_f[DATA][32] , \chan_out_f[DATA][31] , 
        \chan_out_f[DATA][30] , \chan_out_f[DATA][29] , \chan_out_f[DATA][28] , 
        \chan_out_f[DATA][27] , \chan_out_f[DATA][26] , \chan_out_f[DATA][25] , 
        \chan_out_f[DATA][24] , \chan_out_f[DATA][23] , \chan_out_f[DATA][22] , 
        \chan_out_f[DATA][21] , \chan_out_f[DATA][20] , \chan_out_f[DATA][19] , 
        \chan_out_f[DATA][18] , \chan_out_f[DATA][17] , \chan_out_f[DATA][16] , 
        \chan_out_f[DATA][15] , \chan_out_f[DATA][14] , \chan_out_f[DATA][13] , 
        \chan_out_f[DATA][12] , \chan_out_f[DATA][11] , \chan_out_f[DATA][10] , 
        \chan_out_f[DATA][9] , \chan_out_f[DATA][8] , \chan_out_f[DATA][7] , 
        \chan_out_f[DATA][6] , \chan_out_f[DATA][5] , \chan_out_f[DATA][4] , 
        \chan_out_f[DATA][3] , \chan_out_f[DATA][2] , \chan_out_f[DATA][1] , 
        \chan_out_f[DATA][0] }), .chan_out_b(\chan_out_b[ACK] ), sel );
  output [4:0] sel;
  input preset, \chan_in_f[REQ] , \chan_in_f[DATA][33] , \chan_in_f[DATA][32] ,
         \chan_in_f[DATA][31] , \chan_in_f[DATA][30] , \chan_in_f[DATA][29] ,
         \chan_in_f[DATA][28] , \chan_in_f[DATA][27] , \chan_in_f[DATA][26] ,
         \chan_in_f[DATA][25] , \chan_in_f[DATA][24] , \chan_in_f[DATA][23] ,
         \chan_in_f[DATA][22] , \chan_in_f[DATA][21] , \chan_in_f[DATA][20] ,
         \chan_in_f[DATA][19] , \chan_in_f[DATA][18] , \chan_in_f[DATA][17] ,
         \chan_in_f[DATA][16] , \chan_in_f[DATA][15] , \chan_in_f[DATA][14] ,
         \chan_in_f[DATA][13] , \chan_in_f[DATA][12] , \chan_in_f[DATA][11] ,
         \chan_in_f[DATA][10] , \chan_in_f[DATA][9] , \chan_in_f[DATA][8] ,
         \chan_in_f[DATA][7] , \chan_in_f[DATA][6] , \chan_in_f[DATA][5] ,
         \chan_in_f[DATA][4] , \chan_in_f[DATA][3] , \chan_in_f[DATA][2] ,
         \chan_in_f[DATA][1] , \chan_in_f[DATA][0] , \chan_out_b[ACK] ;
  output \chan_in_b[ACK] , \chan_out_f[REQ] , \chan_out_f[DATA][33] ,
         \chan_out_f[DATA][32] , \chan_out_f[DATA][31] ,
         \chan_out_f[DATA][30] , \chan_out_f[DATA][29] ,
         \chan_out_f[DATA][28] , \chan_out_f[DATA][27] ,
         \chan_out_f[DATA][26] , \chan_out_f[DATA][25] ,
         \chan_out_f[DATA][24] , \chan_out_f[DATA][23] ,
         \chan_out_f[DATA][22] , \chan_out_f[DATA][21] ,
         \chan_out_f[DATA][20] , \chan_out_f[DATA][19] ,
         \chan_out_f[DATA][18] , \chan_out_f[DATA][17] ,
         \chan_out_f[DATA][16] , \chan_out_f[DATA][15] ,
         \chan_out_f[DATA][14] , \chan_out_f[DATA][13] ,
         \chan_out_f[DATA][12] , \chan_out_f[DATA][11] ,
         \chan_out_f[DATA][10] , \chan_out_f[DATA][9] , \chan_out_f[DATA][8] ,
         \chan_out_f[DATA][7] , \chan_out_f[DATA][6] , \chan_out_f[DATA][5] ,
         \chan_out_f[DATA][4] , \chan_out_f[DATA][3] , \chan_out_f[DATA][2] ,
         \chan_out_f[DATA][1] , \chan_out_f[DATA][0] ;
  wire   data_in_valid, req_n, \chan_internal_f[DATA][33] ,
         \chan_internal_f[DATA][32] , \chan_internal_f[DATA][31] ,
         \chan_internal_f[DATA][30] , \chan_internal_f[DATA][29] ,
         \chan_internal_f[DATA][28] , \chan_internal_f[DATA][27] ,
         \chan_internal_f[DATA][26] , \chan_internal_f[DATA][25] ,
         \chan_internal_f[DATA][24] , \chan_internal_f[DATA][23] ,
         \chan_internal_f[DATA][22] , \chan_internal_f[DATA][21] ,
         \chan_internal_f[DATA][20] , \chan_internal_f[DATA][19] ,
         \chan_internal_f[DATA][18] , \chan_internal_f[DATA][17] ,
         \chan_internal_f[DATA][16] , \chan_internal_f[DATA][15] ,
         \chan_internal_f[DATA][14] , \chan_internal_f[DATA][13] ,
         \chan_internal_f[DATA][12] , \chan_internal_f[DATA][11] ,
         \chan_internal_f[DATA][10] , \chan_internal_f[DATA][9] ,
         \chan_internal_f[DATA][8] , \chan_internal_f[DATA][7] ,
         \chan_internal_f[DATA][6] , \chan_internal_f[DATA][5] ,
         \chan_internal_f[DATA][4] , \chan_internal_f[DATA][3] ,
         \chan_internal_f[DATA][2] , \chan_internal_f[DATA][1] ,
         \chan_internal_f[DATA][0] , N0, n1;

  hpu_comb_0_0 hpu_combinatorial ( .data_valid(data_in_valid), .data_in({
        \chan_in_f[DATA][33] , \chan_in_f[DATA][32] , \chan_in_f[DATA][31] , 
        \chan_in_f[DATA][30] , \chan_in_f[DATA][29] , \chan_in_f[DATA][28] , 
        \chan_in_f[DATA][27] , \chan_in_f[DATA][26] , \chan_in_f[DATA][25] , 
        \chan_in_f[DATA][24] , \chan_in_f[DATA][23] , \chan_in_f[DATA][22] , 
        \chan_in_f[DATA][21] , \chan_in_f[DATA][20] , \chan_in_f[DATA][19] , 
        \chan_in_f[DATA][18] , \chan_in_f[DATA][17] , \chan_in_f[DATA][16] , 
        \chan_in_f[DATA][15] , \chan_in_f[DATA][14] , \chan_in_f[DATA][13] , 
        \chan_in_f[DATA][12] , \chan_in_f[DATA][11] , \chan_in_f[DATA][10] , 
        \chan_in_f[DATA][9] , \chan_in_f[DATA][8] , \chan_in_f[DATA][7] , 
        \chan_in_f[DATA][6] , \chan_in_f[DATA][5] , \chan_in_f[DATA][4] , 
        \chan_in_f[DATA][3] , \chan_in_f[DATA][2] , \chan_in_f[DATA][1] , 
        \chan_in_f[DATA][0] }), .data_out({\chan_internal_f[DATA][33] , 
        \chan_internal_f[DATA][32] , \chan_internal_f[DATA][31] , 
        \chan_internal_f[DATA][30] , \chan_internal_f[DATA][29] , 
        \chan_internal_f[DATA][28] , \chan_internal_f[DATA][27] , 
        \chan_internal_f[DATA][26] , \chan_internal_f[DATA][25] , 
        \chan_internal_f[DATA][24] , \chan_internal_f[DATA][23] , 
        \chan_internal_f[DATA][22] , \chan_internal_f[DATA][21] , 
        \chan_internal_f[DATA][20] , \chan_internal_f[DATA][19] , 
        \chan_internal_f[DATA][18] , \chan_internal_f[DATA][17] , 
        \chan_internal_f[DATA][16] , \chan_internal_f[DATA][15] , 
        \chan_internal_f[DATA][14] , \chan_internal_f[DATA][13] , 
        \chan_internal_f[DATA][12] , \chan_internal_f[DATA][11] , 
        \chan_internal_f[DATA][10] , \chan_internal_f[DATA][9] , 
        \chan_internal_f[DATA][8] , \chan_internal_f[DATA][7] , 
        \chan_internal_f[DATA][6] , \chan_internal_f[DATA][5] , 
        \chan_internal_f[DATA][4] , \chan_internal_f[DATA][3] , 
        \chan_internal_f[DATA][2] , \chan_internal_f[DATA][1] , 
        \chan_internal_f[DATA][0] }), .sel(sel) );
  channel_latch_1_xxxxxxxxx_5 token_latch ( .preset(preset), .left_in({n1, 
        \chan_internal_f[DATA][33] , \chan_internal_f[DATA][32] , 
        \chan_internal_f[DATA][31] , \chan_internal_f[DATA][30] , 
        \chan_internal_f[DATA][29] , \chan_internal_f[DATA][28] , 
        \chan_internal_f[DATA][27] , \chan_internal_f[DATA][26] , 
        \chan_internal_f[DATA][25] , \chan_internal_f[DATA][24] , 
        \chan_internal_f[DATA][23] , \chan_internal_f[DATA][22] , 
        \chan_internal_f[DATA][21] , \chan_internal_f[DATA][20] , 
        \chan_internal_f[DATA][19] , \chan_internal_f[DATA][18] , 
        \chan_internal_f[DATA][17] , \chan_internal_f[DATA][16] , 
        \chan_internal_f[DATA][15] , \chan_internal_f[DATA][14] , 
        \chan_internal_f[DATA][13] , \chan_internal_f[DATA][12] , 
        \chan_internal_f[DATA][11] , \chan_internal_f[DATA][10] , 
        \chan_internal_f[DATA][9] , \chan_internal_f[DATA][8] , 
        \chan_internal_f[DATA][7] , \chan_internal_f[DATA][6] , 
        \chan_internal_f[DATA][5] , \chan_internal_f[DATA][4] , 
        \chan_internal_f[DATA][3] , \chan_internal_f[DATA][2] , 
        \chan_internal_f[DATA][1] , \chan_internal_f[DATA][0] }), .left_out(
        \chan_in_b[ACK] ), .right_out({\chan_out_f[REQ] , 
        \chan_out_f[DATA][33] , \chan_out_f[DATA][32] , \chan_out_f[DATA][31] , 
        \chan_out_f[DATA][30] , \chan_out_f[DATA][29] , \chan_out_f[DATA][28] , 
        \chan_out_f[DATA][27] , \chan_out_f[DATA][26] , \chan_out_f[DATA][25] , 
        \chan_out_f[DATA][24] , \chan_out_f[DATA][23] , \chan_out_f[DATA][22] , 
        \chan_out_f[DATA][21] , \chan_out_f[DATA][20] , \chan_out_f[DATA][19] , 
        \chan_out_f[DATA][18] , \chan_out_f[DATA][17] , \chan_out_f[DATA][16] , 
        \chan_out_f[DATA][15] , \chan_out_f[DATA][14] , \chan_out_f[DATA][13] , 
        \chan_out_f[DATA][12] , \chan_out_f[DATA][11] , \chan_out_f[DATA][10] , 
        \chan_out_f[DATA][9] , \chan_out_f[DATA][8] , \chan_out_f[DATA][7] , 
        \chan_out_f[DATA][6] , \chan_out_f[DATA][5] , \chan_out_f[DATA][4] , 
        \chan_out_f[DATA][3] , \chan_out_f[DATA][2] , \chan_out_f[DATA][1] , 
        \chan_out_f[DATA][0] }), .right_in(\chan_out_b[ACK] ) );
  HS65_LS_IVX9 I_1 ( .A(\chan_in_f[REQ] ), .Z(req_n) );
  HS65_LS_IVX9 I_0 ( .A(\chan_in_b[ACK] ), .Z(N0) );
  HS65_LS_AND2X4 U1 ( .A(\chan_in_f[REQ] ), .B(N0), .Z(data_in_valid) );
  HS65_LS_IVX9 U2 ( .A(req_n), .Z(n1) );
endmodule


module hpu_comb_0_2 ( data_valid, data_in, data_out, sel );
  input [33:0] data_in;
  output [33:0] data_out;
  output [4:0] sel;
  input data_valid;
  wire   N18, N19, N21, N22, N23, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n19, n20, n21, n22, n1, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36;
  assign data_out[33] = data_in[33];
  assign data_out[32] = data_in[32];

  HS65_LS_LDHQX9 \sel_reg[4]  ( .G(N23), .D(N22), .Q(sel[4]) );
  HS65_LS_LDHQX9 \sel_reg[3]  ( .G(N23), .D(N21), .Q(sel[3]) );
  HS65_LS_LDHQX9 \sel_reg[2]  ( .G(N23), .D(1'b0), .Q(sel[2]) );
  HS65_LS_LDHQX9 \sel_reg[1]  ( .G(N23), .D(N19), .Q(sel[1]) );
  HS65_LS_LDHQX9 \sel_reg[0]  ( .G(N23), .D(N18), .Q(sel[0]) );
  HS65_LS_NAND2X7 U3 ( .A(n23), .B(n24), .Z(data_out[12]) );
  HS65_LS_OR2X9 U4 ( .A(n35), .B(n11), .Z(n24) );
  HS65_LS_BFX31 U5 ( .A(n31), .Z(n34) );
  HS65_LS_BFX18 U6 ( .A(n31), .Z(n35) );
  HS65_LS_BFX7 U7 ( .A(n31), .Z(n30) );
  HS65_LS_BFX4 U8 ( .A(n31), .Z(n36) );
  HS65_LS_BFX31 U9 ( .A(n19), .Z(n31) );
  HS65_LS_BFX9 U10 ( .A(n31), .Z(n1) );
  HS65_LS_OR2X9 U11 ( .A(n26), .B(n10), .Z(n23) );
  HS65_LS_IVX9 U12 ( .A(n34), .Z(n25) );
  HS65_LS_IVX9 U13 ( .A(n34), .Z(n26) );
  HS65_LS_IVX9 U14 ( .A(n34), .Z(n27) );
  HS65_LS_IVX7 U15 ( .A(n34), .Z(n33) );
  HS65_LS_OAI22X6 U16 ( .A(n26), .B(n11), .C(n35), .D(n12), .Z(data_out[10])
         );
  HS65_LS_AND2X4 U17 ( .A(n33), .B(data_in[29]), .Z(n29) );
  HS65_LS_OR2X9 U18 ( .A(n28), .B(n29), .Z(data_out[29]) );
  HS65_LH_AND2X4 U19 ( .A(n34), .B(data_in[31]), .Z(n28) );
  HS65_LH_OAI22X1 U20 ( .A(n33), .B(n13), .C(n30), .D(n14), .Z(data_out[6]) );
  HS65_LH_OAI22X1 U21 ( .A(n33), .B(n5), .C(n1), .D(n6), .Z(data_out[22]) );
  HS65_LH_OAI22X1 U22 ( .A(n33), .B(n16), .C(n30), .D(n17), .Z(data_out[0]) );
  HS65_LS_OAI22X1 U23 ( .A(n27), .B(n9), .C(n36), .D(n10), .Z(data_out[14]) );
  HS65_LS_OAI22X1 U24 ( .A(n33), .B(n4), .C(n1), .D(n5), .Z(data_out[24]) );
  HS65_LS_OAI22X1 U25 ( .A(n26), .B(n2), .C(n1), .D(n3), .Z(data_out[28]) );
  HS65_LS_NAND2X2 U26 ( .A(n35), .B(n20), .Z(n21) );
  HS65_LH_NOR2X2 U27 ( .A(n32), .B(n20), .Z(N22) );
  HS65_LS_IVX9 U28 ( .A(n34), .Z(n32) );
  HS65_LS_OAI22X6 U29 ( .A(n27), .B(n15), .C(n35), .D(n16), .Z(data_out[2]) );
  HS65_LS_OAI22X6 U30 ( .A(n32), .B(n14), .C(n35), .D(n15), .Z(data_out[4]) );
  HS65_LS_OAI22X6 U31 ( .A(n25), .B(n12), .C(n36), .D(n13), .Z(data_out[8]) );
  HS65_LS_OAI22X6 U32 ( .A(n25), .B(n8), .C(n35), .D(n9), .Z(data_out[16]) );
  HS65_LS_OAI22X6 U33 ( .A(n26), .B(n7), .C(n30), .D(n8), .Z(data_out[18]) );
  HS65_LS_OAI22X6 U34 ( .A(n32), .B(n6), .C(n30), .D(n7), .Z(data_out[20]) );
  HS65_LS_OAI22X6 U35 ( .A(n27), .B(n3), .C(n1), .D(n4), .Z(data_out[26]) );
  HS65_LS_NOR3X4 U36 ( .A(n21), .B(n17), .C(n22), .Z(N21) );
  HS65_LS_NOR2AX3 U37 ( .A(n22), .B(n21), .Z(N19) );
  HS65_LS_NOR2X6 U38 ( .A(n34), .B(n2), .Z(data_out[30]) );
  HS65_LS_IVX9 U39 ( .A(data_in[0]), .Z(n17) );
  HS65_LS_NOR2AX13 U40 ( .A(data_in[33]), .B(data_in[32]), .Z(n19) );
  HS65_LS_NAND2X7 U41 ( .A(data_in[1]), .B(n17), .Z(n20) );
  HS65_LS_NOR2X6 U42 ( .A(n17), .B(data_in[1]), .Z(n22) );
  HS65_LS_IVX9 U43 ( .A(data_in[2]), .Z(n16) );
  HS65_LS_IVX9 U44 ( .A(data_in[4]), .Z(n15) );
  HS65_LS_IVX9 U45 ( .A(data_in[6]), .Z(n14) );
  HS65_LS_IVX9 U46 ( .A(data_in[8]), .Z(n13) );
  HS65_LS_IVX9 U47 ( .A(data_in[10]), .Z(n12) );
  HS65_LS_IVX9 U48 ( .A(data_in[12]), .Z(n11) );
  HS65_LS_IVX9 U49 ( .A(data_in[14]), .Z(n10) );
  HS65_LS_IVX9 U50 ( .A(data_in[16]), .Z(n9) );
  HS65_LS_IVX9 U51 ( .A(data_in[18]), .Z(n8) );
  HS65_LS_IVX9 U52 ( .A(data_in[20]), .Z(n7) );
  HS65_LS_IVX9 U53 ( .A(data_in[22]), .Z(n6) );
  HS65_LS_IVX9 U54 ( .A(data_in[24]), .Z(n5) );
  HS65_LS_IVX9 U55 ( .A(data_in[26]), .Z(n4) );
  HS65_LS_IVX9 U56 ( .A(data_in[28]), .Z(n3) );
  HS65_LS_IVX9 U57 ( .A(data_in[30]), .Z(n2) );
  HS65_LS_NOR2X6 U58 ( .A(data_in[0]), .B(n21), .Z(N18) );
  HS65_LS_AO22X9 U59 ( .A(n35), .B(data_in[3]), .C(n26), .D(data_in[1]), .Z(
        data_out[1]) );
  HS65_LS_AO22X9 U60 ( .A(n35), .B(data_in[5]), .C(n25), .D(data_in[3]), .Z(
        data_out[3]) );
  HS65_LS_AO22X9 U62 ( .A(n30), .B(data_in[7]), .C(n25), .D(data_in[5]), .Z(
        data_out[5]) );
  HS65_LS_AO22X9 U63 ( .A(n1), .B(data_in[11]), .C(n27), .D(data_in[9]), .Z(
        data_out[9]) );
  HS65_LS_AO22X9 U64 ( .A(n35), .B(data_in[13]), .C(n32), .D(data_in[11]), .Z(
        data_out[11]) );
  HS65_LS_AO22X9 U65 ( .A(n35), .B(data_in[15]), .C(n25), .D(data_in[13]), .Z(
        data_out[13]) );
  HS65_LS_AO22X9 U66 ( .A(n35), .B(data_in[17]), .C(n26), .D(data_in[15]), .Z(
        data_out[15]) );
  HS65_LS_AO22X9 U67 ( .A(n35), .B(data_in[19]), .C(n27), .D(data_in[17]), .Z(
        data_out[17]) );
  HS65_LS_AO22X9 U68 ( .A(n36), .B(data_in[21]), .C(n32), .D(data_in[19]), .Z(
        data_out[19]) );
  HS65_LS_AO22X9 U69 ( .A(n1), .B(data_in[23]), .C(n32), .D(data_in[21]), .Z(
        data_out[21]) );
  HS65_LS_AO22X9 U70 ( .A(n35), .B(data_in[25]), .C(n25), .D(data_in[23]), .Z(
        data_out[23]) );
  HS65_LS_AO22X9 U71 ( .A(n36), .B(data_in[27]), .C(n27), .D(data_in[25]), .Z(
        data_out[25]) );
  HS65_LS_AO22X9 U72 ( .A(n30), .B(data_in[29]), .C(n26), .D(data_in[27]), .Z(
        data_out[27]) );
  HS65_LS_AO22X9 U73 ( .A(data_in[9]), .B(n35), .C(n27), .D(data_in[7]), .Z(
        data_out[7]) );
  HS65_LS_AND2X4 U74 ( .A(data_in[31]), .B(n32), .Z(data_out[31]) );
  HS65_LS_NOR2AX3 U75 ( .A(data_valid), .B(data_in[32]), .Z(N23) );
endmodule


module sr_latch_0_4 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X27 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_4 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_4 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_OAI12X18 U4 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_4 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, N0, n2;
  assign Rout = Aout;
  assign lt_en = N0;

  c_gate_0_4 gate ( .preset(preset), .a(n2), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 I_0 ( .A(Aout), .Z(N0) );
  HS65_LS_IVX9 U1 ( .A(Ain), .Z(n2) );
endmodule


module channel_latch_1_xxxxxxxxx_4 ( preset, .left_in({\left_in[REQ] , 
        \left_in[DATA][33] , \left_in[DATA][32] , \left_in[DATA][31] , 
        \left_in[DATA][30] , \left_in[DATA][29] , \left_in[DATA][28] , 
        \left_in[DATA][27] , \left_in[DATA][26] , \left_in[DATA][25] , 
        \left_in[DATA][24] , \left_in[DATA][23] , \left_in[DATA][22] , 
        \left_in[DATA][21] , \left_in[DATA][20] , \left_in[DATA][19] , 
        \left_in[DATA][18] , \left_in[DATA][17] , \left_in[DATA][16] , 
        \left_in[DATA][15] , \left_in[DATA][14] , \left_in[DATA][13] , 
        \left_in[DATA][12] , \left_in[DATA][11] , \left_in[DATA][10] , 
        \left_in[DATA][9] , \left_in[DATA][8] , \left_in[DATA][7] , 
        \left_in[DATA][6] , \left_in[DATA][5] , \left_in[DATA][4] , 
        \left_in[DATA][3] , \left_in[DATA][2] , \left_in[DATA][1] , 
        \left_in[DATA][0] }), .left_out(\left_out[ACK] ), .right_out({
        \right_out[REQ] , \right_out[DATA][33] , \right_out[DATA][32] , 
        \right_out[DATA][31] , \right_out[DATA][30] , \right_out[DATA][29] , 
        \right_out[DATA][28] , \right_out[DATA][27] , \right_out[DATA][26] , 
        \right_out[DATA][25] , \right_out[DATA][24] , \right_out[DATA][23] , 
        \right_out[DATA][22] , \right_out[DATA][21] , \right_out[DATA][20] , 
        \right_out[DATA][19] , \right_out[DATA][18] , \right_out[DATA][17] , 
        \right_out[DATA][16] , \right_out[DATA][15] , \right_out[DATA][14] , 
        \right_out[DATA][13] , \right_out[DATA][12] , \right_out[DATA][11] , 
        \right_out[DATA][10] , \right_out[DATA][9] , \right_out[DATA][8] , 
        \right_out[DATA][7] , \right_out[DATA][6] , \right_out[DATA][5] , 
        \right_out[DATA][4] , \right_out[DATA][3] , \right_out[DATA][2] , 
        \right_out[DATA][1] , \right_out[DATA][0] }), .right_in(
        \right_in[ACK] ) );
  input preset, \left_in[REQ] , \left_in[DATA][33] , \left_in[DATA][32] ,
         \left_in[DATA][31] , \left_in[DATA][30] , \left_in[DATA][29] ,
         \left_in[DATA][28] , \left_in[DATA][27] , \left_in[DATA][26] ,
         \left_in[DATA][25] , \left_in[DATA][24] , \left_in[DATA][23] ,
         \left_in[DATA][22] , \left_in[DATA][21] , \left_in[DATA][20] ,
         \left_in[DATA][19] , \left_in[DATA][18] , \left_in[DATA][17] ,
         \left_in[DATA][16] , \left_in[DATA][15] , \left_in[DATA][14] ,
         \left_in[DATA][13] , \left_in[DATA][12] , \left_in[DATA][11] ,
         \left_in[DATA][10] , \left_in[DATA][9] , \left_in[DATA][8] ,
         \left_in[DATA][7] , \left_in[DATA][6] , \left_in[DATA][5] ,
         \left_in[DATA][4] , \left_in[DATA][3] , \left_in[DATA][2] ,
         \left_in[DATA][1] , \left_in[DATA][0] , \right_in[ACK] ;
  output \left_out[ACK] , \right_out[REQ] , \right_out[DATA][33] ,
         \right_out[DATA][32] , \right_out[DATA][31] , \right_out[DATA][30] ,
         \right_out[DATA][29] , \right_out[DATA][28] , \right_out[DATA][27] ,
         \right_out[DATA][26] , \right_out[DATA][25] , \right_out[DATA][24] ,
         \right_out[DATA][23] , \right_out[DATA][22] , \right_out[DATA][21] ,
         \right_out[DATA][20] , \right_out[DATA][19] , \right_out[DATA][18] ,
         \right_out[DATA][17] , \right_out[DATA][16] , \right_out[DATA][15] ,
         \right_out[DATA][14] , \right_out[DATA][13] , \right_out[DATA][12] ,
         \right_out[DATA][11] , \right_out[DATA][10] , \right_out[DATA][9] ,
         \right_out[DATA][8] , \right_out[DATA][7] , \right_out[DATA][6] ,
         \right_out[DATA][5] , \right_out[DATA][4] , \right_out[DATA][3] ,
         \right_out[DATA][2] , \right_out[DATA][1] , \right_out[DATA][0] ;
  wire   lt_en, N3;

  latch_controller_1_4 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX18 \data_reg[27]  ( .G(N3), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX18 \data_reg[25]  ( .G(N3), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX18 \data_reg[23]  ( .G(N3), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX18 \data_reg[21]  ( .G(N3), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX18 \data_reg[19]  ( .G(N3), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX18 \data_reg[17]  ( .G(N3), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX18 \data_reg[15]  ( .G(N3), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX18 \data_reg[13]  ( .G(N3), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX18 \data_reg[11]  ( .G(N3), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX18 \data_reg[9]  ( .G(N3), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX18 \data_reg[5]  ( .G(N3), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX18 \data_reg[3]  ( .G(N3), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX18 \data_reg[1]  ( .G(N3), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LS_LDHQX9 \data_reg[33]  ( .G(N3), .D(\left_in[DATA][33] ), .Q(
        \right_out[DATA][33] ) );
  HS65_LS_LDHQX9 \data_reg[32]  ( .G(N3), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N3), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX18 \data_reg[18]  ( .G(N3), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX18 \data_reg[8]  ( .G(N3), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX18 \data_reg[6]  ( .G(N3), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX18 \data_reg[4]  ( .G(N3), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_LDHQX18 \data_reg[16]  ( .G(N3), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX18 \data_reg[14]  ( .G(N3), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX18 \data_reg[10]  ( .G(N3), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX18 \data_reg[0]  ( .G(N3), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LS_LDHQX18 \data_reg[28]  ( .G(N3), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX18 \data_reg[26]  ( .G(N3), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX18 \data_reg[24]  ( .G(N3), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N3), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDHQX18 \data_reg[22]  ( .G(N3), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX18 \data_reg[20]  ( .G(N3), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX18 \data_reg[29]  ( .G(N3), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX18 \data_reg[31]  ( .G(N3), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_LDHQX18 \data_reg[12]  ( .G(N3), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX18 \data_reg[7]  ( .G(N3), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_OR2X9 U3 ( .A(lt_en), .B(preset), .Z(N3) );
endmodule


module hpu_0_2 ( preset, .chan_in_f({\chan_in_f[REQ] , \chan_in_f[DATA][33] , 
        \chan_in_f[DATA][32] , \chan_in_f[DATA][31] , \chan_in_f[DATA][30] , 
        \chan_in_f[DATA][29] , \chan_in_f[DATA][28] , \chan_in_f[DATA][27] , 
        \chan_in_f[DATA][26] , \chan_in_f[DATA][25] , \chan_in_f[DATA][24] , 
        \chan_in_f[DATA][23] , \chan_in_f[DATA][22] , \chan_in_f[DATA][21] , 
        \chan_in_f[DATA][20] , \chan_in_f[DATA][19] , \chan_in_f[DATA][18] , 
        \chan_in_f[DATA][17] , \chan_in_f[DATA][16] , \chan_in_f[DATA][15] , 
        \chan_in_f[DATA][14] , \chan_in_f[DATA][13] , \chan_in_f[DATA][12] , 
        \chan_in_f[DATA][11] , \chan_in_f[DATA][10] , \chan_in_f[DATA][9] , 
        \chan_in_f[DATA][8] , \chan_in_f[DATA][7] , \chan_in_f[DATA][6] , 
        \chan_in_f[DATA][5] , \chan_in_f[DATA][4] , \chan_in_f[DATA][3] , 
        \chan_in_f[DATA][2] , \chan_in_f[DATA][1] , \chan_in_f[DATA][0] }), 
    .chan_in_b(\chan_in_b[ACK] ), .chan_out_f({\chan_out_f[REQ] , 
        \chan_out_f[DATA][33] , \chan_out_f[DATA][32] , \chan_out_f[DATA][31] , 
        \chan_out_f[DATA][30] , \chan_out_f[DATA][29] , \chan_out_f[DATA][28] , 
        \chan_out_f[DATA][27] , \chan_out_f[DATA][26] , \chan_out_f[DATA][25] , 
        \chan_out_f[DATA][24] , \chan_out_f[DATA][23] , \chan_out_f[DATA][22] , 
        \chan_out_f[DATA][21] , \chan_out_f[DATA][20] , \chan_out_f[DATA][19] , 
        \chan_out_f[DATA][18] , \chan_out_f[DATA][17] , \chan_out_f[DATA][16] , 
        \chan_out_f[DATA][15] , \chan_out_f[DATA][14] , \chan_out_f[DATA][13] , 
        \chan_out_f[DATA][12] , \chan_out_f[DATA][11] , \chan_out_f[DATA][10] , 
        \chan_out_f[DATA][9] , \chan_out_f[DATA][8] , \chan_out_f[DATA][7] , 
        \chan_out_f[DATA][6] , \chan_out_f[DATA][5] , \chan_out_f[DATA][4] , 
        \chan_out_f[DATA][3] , \chan_out_f[DATA][2] , \chan_out_f[DATA][1] , 
        \chan_out_f[DATA][0] }), .chan_out_b(\chan_out_b[ACK] ), sel );
  output [4:0] sel;
  input preset, \chan_in_f[REQ] , \chan_in_f[DATA][33] , \chan_in_f[DATA][32] ,
         \chan_in_f[DATA][31] , \chan_in_f[DATA][30] , \chan_in_f[DATA][29] ,
         \chan_in_f[DATA][28] , \chan_in_f[DATA][27] , \chan_in_f[DATA][26] ,
         \chan_in_f[DATA][25] , \chan_in_f[DATA][24] , \chan_in_f[DATA][23] ,
         \chan_in_f[DATA][22] , \chan_in_f[DATA][21] , \chan_in_f[DATA][20] ,
         \chan_in_f[DATA][19] , \chan_in_f[DATA][18] , \chan_in_f[DATA][17] ,
         \chan_in_f[DATA][16] , \chan_in_f[DATA][15] , \chan_in_f[DATA][14] ,
         \chan_in_f[DATA][13] , \chan_in_f[DATA][12] , \chan_in_f[DATA][11] ,
         \chan_in_f[DATA][10] , \chan_in_f[DATA][9] , \chan_in_f[DATA][8] ,
         \chan_in_f[DATA][7] , \chan_in_f[DATA][6] , \chan_in_f[DATA][5] ,
         \chan_in_f[DATA][4] , \chan_in_f[DATA][3] , \chan_in_f[DATA][2] ,
         \chan_in_f[DATA][1] , \chan_in_f[DATA][0] , \chan_out_b[ACK] ;
  output \chan_in_b[ACK] , \chan_out_f[REQ] , \chan_out_f[DATA][33] ,
         \chan_out_f[DATA][32] , \chan_out_f[DATA][31] ,
         \chan_out_f[DATA][30] , \chan_out_f[DATA][29] ,
         \chan_out_f[DATA][28] , \chan_out_f[DATA][27] ,
         \chan_out_f[DATA][26] , \chan_out_f[DATA][25] ,
         \chan_out_f[DATA][24] , \chan_out_f[DATA][23] ,
         \chan_out_f[DATA][22] , \chan_out_f[DATA][21] ,
         \chan_out_f[DATA][20] , \chan_out_f[DATA][19] ,
         \chan_out_f[DATA][18] , \chan_out_f[DATA][17] ,
         \chan_out_f[DATA][16] , \chan_out_f[DATA][15] ,
         \chan_out_f[DATA][14] , \chan_out_f[DATA][13] ,
         \chan_out_f[DATA][12] , \chan_out_f[DATA][11] ,
         \chan_out_f[DATA][10] , \chan_out_f[DATA][9] , \chan_out_f[DATA][8] ,
         \chan_out_f[DATA][7] , \chan_out_f[DATA][6] , \chan_out_f[DATA][5] ,
         \chan_out_f[DATA][4] , \chan_out_f[DATA][3] , \chan_out_f[DATA][2] ,
         \chan_out_f[DATA][1] , \chan_out_f[DATA][0] ;
  wire   data_in_valid, req_n, \chan_internal_f[DATA][33] ,
         \chan_internal_f[DATA][32] , \chan_internal_f[DATA][31] ,
         \chan_internal_f[DATA][30] , \chan_internal_f[DATA][29] ,
         \chan_internal_f[DATA][28] , \chan_internal_f[DATA][27] ,
         \chan_internal_f[DATA][26] , \chan_internal_f[DATA][25] ,
         \chan_internal_f[DATA][24] , \chan_internal_f[DATA][23] ,
         \chan_internal_f[DATA][22] , \chan_internal_f[DATA][21] ,
         \chan_internal_f[DATA][20] , \chan_internal_f[DATA][19] ,
         \chan_internal_f[DATA][18] , \chan_internal_f[DATA][17] ,
         \chan_internal_f[DATA][16] , \chan_internal_f[DATA][15] ,
         \chan_internal_f[DATA][14] , \chan_internal_f[DATA][13] ,
         \chan_internal_f[DATA][12] , \chan_internal_f[DATA][11] ,
         \chan_internal_f[DATA][10] , \chan_internal_f[DATA][9] ,
         \chan_internal_f[DATA][8] , \chan_internal_f[DATA][7] ,
         \chan_internal_f[DATA][6] , \chan_internal_f[DATA][5] ,
         \chan_internal_f[DATA][4] , \chan_internal_f[DATA][3] ,
         \chan_internal_f[DATA][2] , \chan_internal_f[DATA][1] ,
         \chan_internal_f[DATA][0] , N0, n1;

  hpu_comb_0_2 hpu_combinatorial ( .data_valid(data_in_valid), .data_in({
        \chan_in_f[DATA][33] , \chan_in_f[DATA][32] , \chan_in_f[DATA][31] , 
        \chan_in_f[DATA][30] , \chan_in_f[DATA][29] , \chan_in_f[DATA][28] , 
        \chan_in_f[DATA][27] , \chan_in_f[DATA][26] , \chan_in_f[DATA][25] , 
        \chan_in_f[DATA][24] , \chan_in_f[DATA][23] , \chan_in_f[DATA][22] , 
        \chan_in_f[DATA][21] , \chan_in_f[DATA][20] , \chan_in_f[DATA][19] , 
        \chan_in_f[DATA][18] , \chan_in_f[DATA][17] , \chan_in_f[DATA][16] , 
        \chan_in_f[DATA][15] , \chan_in_f[DATA][14] , \chan_in_f[DATA][13] , 
        \chan_in_f[DATA][12] , \chan_in_f[DATA][11] , \chan_in_f[DATA][10] , 
        \chan_in_f[DATA][9] , \chan_in_f[DATA][8] , \chan_in_f[DATA][7] , 
        \chan_in_f[DATA][6] , \chan_in_f[DATA][5] , \chan_in_f[DATA][4] , 
        \chan_in_f[DATA][3] , \chan_in_f[DATA][2] , \chan_in_f[DATA][1] , 
        \chan_in_f[DATA][0] }), .data_out({\chan_internal_f[DATA][33] , 
        \chan_internal_f[DATA][32] , \chan_internal_f[DATA][31] , 
        \chan_internal_f[DATA][30] , \chan_internal_f[DATA][29] , 
        \chan_internal_f[DATA][28] , \chan_internal_f[DATA][27] , 
        \chan_internal_f[DATA][26] , \chan_internal_f[DATA][25] , 
        \chan_internal_f[DATA][24] , \chan_internal_f[DATA][23] , 
        \chan_internal_f[DATA][22] , \chan_internal_f[DATA][21] , 
        \chan_internal_f[DATA][20] , \chan_internal_f[DATA][19] , 
        \chan_internal_f[DATA][18] , \chan_internal_f[DATA][17] , 
        \chan_internal_f[DATA][16] , \chan_internal_f[DATA][15] , 
        \chan_internal_f[DATA][14] , \chan_internal_f[DATA][13] , 
        \chan_internal_f[DATA][12] , \chan_internal_f[DATA][11] , 
        \chan_internal_f[DATA][10] , \chan_internal_f[DATA][9] , 
        \chan_internal_f[DATA][8] , \chan_internal_f[DATA][7] , 
        \chan_internal_f[DATA][6] , \chan_internal_f[DATA][5] , 
        \chan_internal_f[DATA][4] , \chan_internal_f[DATA][3] , 
        \chan_internal_f[DATA][2] , \chan_internal_f[DATA][1] , 
        \chan_internal_f[DATA][0] }), .sel(sel) );
  channel_latch_1_xxxxxxxxx_4 token_latch ( .preset(preset), .left_in({n1, 
        \chan_internal_f[DATA][33] , \chan_internal_f[DATA][32] , 
        \chan_internal_f[DATA][31] , \chan_internal_f[DATA][30] , 
        \chan_internal_f[DATA][29] , \chan_internal_f[DATA][28] , 
        \chan_internal_f[DATA][27] , \chan_internal_f[DATA][26] , 
        \chan_internal_f[DATA][25] , \chan_internal_f[DATA][24] , 
        \chan_internal_f[DATA][23] , \chan_internal_f[DATA][22] , 
        \chan_internal_f[DATA][21] , \chan_internal_f[DATA][20] , 
        \chan_internal_f[DATA][19] , \chan_internal_f[DATA][18] , 
        \chan_internal_f[DATA][17] , \chan_internal_f[DATA][16] , 
        \chan_internal_f[DATA][15] , \chan_internal_f[DATA][14] , 
        \chan_internal_f[DATA][13] , \chan_internal_f[DATA][12] , 
        \chan_internal_f[DATA][11] , \chan_internal_f[DATA][10] , 
        \chan_internal_f[DATA][9] , \chan_internal_f[DATA][8] , 
        \chan_internal_f[DATA][7] , \chan_internal_f[DATA][6] , 
        \chan_internal_f[DATA][5] , \chan_internal_f[DATA][4] , 
        \chan_internal_f[DATA][3] , \chan_internal_f[DATA][2] , 
        \chan_internal_f[DATA][1] , \chan_internal_f[DATA][0] }), .left_out(
        \chan_in_b[ACK] ), .right_out({\chan_out_f[REQ] , 
        \chan_out_f[DATA][33] , \chan_out_f[DATA][32] , \chan_out_f[DATA][31] , 
        \chan_out_f[DATA][30] , \chan_out_f[DATA][29] , \chan_out_f[DATA][28] , 
        \chan_out_f[DATA][27] , \chan_out_f[DATA][26] , \chan_out_f[DATA][25] , 
        \chan_out_f[DATA][24] , \chan_out_f[DATA][23] , \chan_out_f[DATA][22] , 
        \chan_out_f[DATA][21] , \chan_out_f[DATA][20] , \chan_out_f[DATA][19] , 
        \chan_out_f[DATA][18] , \chan_out_f[DATA][17] , \chan_out_f[DATA][16] , 
        \chan_out_f[DATA][15] , \chan_out_f[DATA][14] , \chan_out_f[DATA][13] , 
        \chan_out_f[DATA][12] , \chan_out_f[DATA][11] , \chan_out_f[DATA][10] , 
        \chan_out_f[DATA][9] , \chan_out_f[DATA][8] , \chan_out_f[DATA][7] , 
        \chan_out_f[DATA][6] , \chan_out_f[DATA][5] , \chan_out_f[DATA][4] , 
        \chan_out_f[DATA][3] , \chan_out_f[DATA][2] , \chan_out_f[DATA][1] , 
        \chan_out_f[DATA][0] }), .right_in(\chan_out_b[ACK] ) );
  HS65_LS_IVX9 I_1 ( .A(\chan_in_f[REQ] ), .Z(req_n) );
  HS65_LS_IVX9 I_0 ( .A(\chan_in_b[ACK] ), .Z(N0) );
  HS65_LS_AND2X4 U1 ( .A(\chan_in_f[REQ] ), .B(N0), .Z(data_in_valid) );
  HS65_LS_IVX9 U2 ( .A(req_n), .Z(n1) );
endmodule


module hpu_comb_0_1 ( data_valid, data_in, data_out, sel );
  input [33:0] data_in;
  output [33:0] data_out;
  output [4:0] sel;
  input data_valid;
  wire   N15, N17, N18, N19, N20, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n20, n22, n1, n2, n19, n21, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41;
  assign data_out[33] = data_in[33];
  assign data_out[32] = data_in[32];

  HS65_LS_LDHQX9 \sel_reg[4]  ( .G(N20), .D(N19), .Q(sel[4]) );
  HS65_LS_LDHQX9 \sel_reg[3]  ( .G(N20), .D(N18), .Q(sel[3]) );
  HS65_LS_LDHQX9 \sel_reg[2]  ( .G(N20), .D(N17), .Q(sel[2]) );
  HS65_LS_LDHQX9 \sel_reg[1]  ( .G(N20), .D(1'b0), .Q(sel[1]) );
  HS65_LS_LDHQX9 \sel_reg[0]  ( .G(N20), .D(N15), .Q(sel[0]) );
  HS65_LH_IVX2 U3 ( .A(n40), .Z(n1) );
  HS65_LS_NAND2X14 U4 ( .A(data_in[33]), .B(n25), .Z(n40) );
  HS65_LS_BFX31 U5 ( .A(n41), .Z(n19) );
  HS65_LH_AND2X4 U6 ( .A(n40), .B(data_in[31]), .Z(data_out[31]) );
  HS65_LH_AND2X4 U7 ( .A(data_in[30]), .B(n40), .Z(data_out[30]) );
  HS65_LH_NOR2AX3 U8 ( .A(data_valid), .B(data_in[32]), .Z(N20) );
  HS65_LS_BFX9 U9 ( .A(n19), .Z(n23) );
  HS65_LS_BFX9 U10 ( .A(n19), .Z(n21) );
  HS65_LS_BFX9 U11 ( .A(n19), .Z(n24) );
  HS65_LS_MUXI21X2 U12 ( .D0(n17), .D1(n16), .S0(n24), .Z(data_out[1]) );
  HS65_LS_AND2X4 U13 ( .A(n20), .B(n24), .Z(n2) );
  HS65_LS_MUXI21X2 U14 ( .D0(n14), .D1(n13), .S0(n23), .Z(data_out[7]) );
  HS65_LS_MUXI21X2 U15 ( .D0(n13), .D1(n12), .S0(n23), .Z(data_out[9]) );
  HS65_LS_MUXI21X2 U16 ( .D0(n12), .D1(n11), .S0(n23), .Z(data_out[11]) );
  HS65_LS_MUXI21X2 U17 ( .D0(n11), .D1(n10), .S0(n23), .Z(data_out[13]) );
  HS65_LS_MUXI21X2 U18 ( .D0(n10), .D1(n9), .S0(n23), .Z(data_out[15]) );
  HS65_LS_MUXI21X2 U19 ( .D0(n9), .D1(n8), .S0(n1), .Z(data_out[17]) );
  HS65_LS_MUXI21X2 U20 ( .D0(n8), .D1(n7), .S0(n21), .Z(data_out[19]) );
  HS65_LS_MUXI21X2 U21 ( .D0(n7), .D1(n6), .S0(n21), .Z(data_out[21]) );
  HS65_LS_MUXI21X2 U22 ( .D0(n6), .D1(n5), .S0(n1), .Z(data_out[23]) );
  HS65_LS_MUXI21X2 U23 ( .D0(n5), .D1(n4), .S0(n21), .Z(data_out[25]) );
  HS65_LS_MUXI21X2 U24 ( .D0(n4), .D1(n3), .S0(n21), .Z(data_out[27]) );
  HS65_LS_MUXI21X2 U25 ( .D0(n16), .D1(n15), .S0(n24), .Z(data_out[3]) );
  HS65_LS_MUXI21X2 U26 ( .D0(n15), .D1(n14), .S0(n24), .Z(data_out[5]) );
  HS65_LS_NOR3AX2 U27 ( .A(n2), .B(n17), .C(n22), .Z(N18) );
  HS65_LS_AND2X4 U28 ( .A(n22), .B(n2), .Z(N17) );
  HS65_LS_NOR2AX3 U29 ( .A(n24), .B(n20), .Z(N19) );
  HS65_LS_MUX21X4 U30 ( .D0(data_in[28]), .D1(data_in[30]), .S0(n19), .Z(
        data_out[28]) );
  HS65_LS_IVX9 U31 ( .A(data_in[1]), .Z(n17) );
  HS65_LS_NOR2X6 U32 ( .A(n17), .B(data_in[0]), .Z(n22) );
  HS65_LS_NAND2X7 U33 ( .A(data_in[0]), .B(n17), .Z(n20) );
  HS65_LS_NOR2AX3 U34 ( .A(n2), .B(data_in[1]), .Z(N15) );
  HS65_LS_IVX9 U35 ( .A(data_in[3]), .Z(n16) );
  HS65_LS_IVX9 U36 ( .A(data_in[5]), .Z(n15) );
  HS65_LS_IVX9 U37 ( .A(data_in[7]), .Z(n14) );
  HS65_LS_IVX9 U38 ( .A(data_in[9]), .Z(n13) );
  HS65_LS_IVX9 U39 ( .A(data_in[11]), .Z(n12) );
  HS65_LS_IVX9 U40 ( .A(data_in[13]), .Z(n11) );
  HS65_LS_IVX9 U41 ( .A(data_in[15]), .Z(n10) );
  HS65_LS_IVX9 U42 ( .A(data_in[17]), .Z(n9) );
  HS65_LS_IVX9 U43 ( .A(data_in[19]), .Z(n8) );
  HS65_LS_IVX9 U44 ( .A(data_in[21]), .Z(n7) );
  HS65_LS_IVX9 U45 ( .A(data_in[23]), .Z(n6) );
  HS65_LS_IVX9 U46 ( .A(data_in[25]), .Z(n5) );
  HS65_LS_IVX9 U47 ( .A(data_in[27]), .Z(n4) );
  HS65_LS_IVX9 U48 ( .A(data_in[29]), .Z(n3) );
  HS65_LS_IVX9 U49 ( .A(data_in[0]), .Z(n26) );
  HS65_LS_IVX9 U50 ( .A(data_in[32]), .Z(n25) );
  HS65_LS_IVX9 U51 ( .A(n40), .Z(n41) );
  HS65_LS_MUX21I1X6 U52 ( .D0(n26), .D1(data_in[2]), .S0(n21), .Z(data_out[0])
         );
  HS65_LS_IVX9 U53 ( .A(data_in[2]), .Z(n27) );
  HS65_LS_MUX21I1X6 U54 ( .D0(n27), .D1(data_in[4]), .S0(n24), .Z(data_out[2])
         );
  HS65_LS_IVX9 U55 ( .A(data_in[4]), .Z(n28) );
  HS65_LS_MUX21I1X6 U56 ( .D0(n28), .D1(data_in[6]), .S0(n24), .Z(data_out[4])
         );
  HS65_LS_IVX9 U57 ( .A(data_in[6]), .Z(n29) );
  HS65_LS_MUX21I1X6 U58 ( .D0(n29), .D1(data_in[8]), .S0(n24), .Z(data_out[6])
         );
  HS65_LS_IVX9 U59 ( .A(data_in[8]), .Z(n30) );
  HS65_LS_MUX21I1X6 U60 ( .D0(n30), .D1(data_in[10]), .S0(n23), .Z(data_out[8]) );
  HS65_LS_IVX9 U62 ( .A(data_in[10]), .Z(n31) );
  HS65_LS_MUX21I1X6 U63 ( .D0(n31), .D1(data_in[12]), .S0(n23), .Z(
        data_out[10]) );
  HS65_LS_IVX9 U64 ( .A(data_in[12]), .Z(n32) );
  HS65_LS_MUX21I1X6 U65 ( .D0(n32), .D1(data_in[14]), .S0(n23), .Z(
        data_out[12]) );
  HS65_LS_IVX9 U66 ( .A(data_in[14]), .Z(n33) );
  HS65_LS_MUX21I1X6 U67 ( .D0(n33), .D1(data_in[16]), .S0(n23), .Z(
        data_out[14]) );
  HS65_LS_IVX9 U68 ( .A(data_in[16]), .Z(n34) );
  HS65_LS_MUX21I1X6 U69 ( .D0(n34), .D1(data_in[18]), .S0(n23), .Z(
        data_out[16]) );
  HS65_LS_IVX9 U70 ( .A(data_in[18]), .Z(n35) );
  HS65_LS_MUX21I1X6 U71 ( .D0(n35), .D1(data_in[20]), .S0(n21), .Z(
        data_out[18]) );
  HS65_LS_IVX9 U72 ( .A(data_in[20]), .Z(n36) );
  HS65_LS_MUX21I1X6 U73 ( .D0(n36), .D1(data_in[22]), .S0(n21), .Z(
        data_out[20]) );
  HS65_LS_IVX9 U74 ( .A(data_in[22]), .Z(n37) );
  HS65_LS_MUX21I1X6 U75 ( .D0(n37), .D1(data_in[24]), .S0(n21), .Z(
        data_out[22]) );
  HS65_LS_IVX9 U76 ( .A(data_in[24]), .Z(n38) );
  HS65_LS_MUX21I1X6 U77 ( .D0(n38), .D1(data_in[26]), .S0(n21), .Z(
        data_out[24]) );
  HS65_LS_IVX9 U78 ( .A(data_in[26]), .Z(n39) );
  HS65_LS_MUX21I1X6 U79 ( .D0(n39), .D1(data_in[28]), .S0(n21), .Z(
        data_out[26]) );
  HS65_LS_MUX21I1X6 U80 ( .D0(n3), .D1(data_in[31]), .S0(n21), .Z(data_out[29]) );
endmodule


module sr_latch_0_3 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X27 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_3 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_3 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_OAI12X18 U4 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_3 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, N0, n2;
  assign Rout = Aout;
  assign lt_en = N0;

  c_gate_0_3 gate ( .preset(preset), .a(n2), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 I_0 ( .A(Aout), .Z(N0) );
  HS65_LS_IVX9 U1 ( .A(Ain), .Z(n2) );
endmodule


module channel_latch_1_xxxxxxxxx_3 ( preset, .left_in({\left_in[REQ] , 
        \left_in[DATA][33] , \left_in[DATA][32] , \left_in[DATA][31] , 
        \left_in[DATA][30] , \left_in[DATA][29] , \left_in[DATA][28] , 
        \left_in[DATA][27] , \left_in[DATA][26] , \left_in[DATA][25] , 
        \left_in[DATA][24] , \left_in[DATA][23] , \left_in[DATA][22] , 
        \left_in[DATA][21] , \left_in[DATA][20] , \left_in[DATA][19] , 
        \left_in[DATA][18] , \left_in[DATA][17] , \left_in[DATA][16] , 
        \left_in[DATA][15] , \left_in[DATA][14] , \left_in[DATA][13] , 
        \left_in[DATA][12] , \left_in[DATA][11] , \left_in[DATA][10] , 
        \left_in[DATA][9] , \left_in[DATA][8] , \left_in[DATA][7] , 
        \left_in[DATA][6] , \left_in[DATA][5] , \left_in[DATA][4] , 
        \left_in[DATA][3] , \left_in[DATA][2] , \left_in[DATA][1] , 
        \left_in[DATA][0] }), .left_out(\left_out[ACK] ), .right_out({
        \right_out[REQ] , \right_out[DATA][33] , \right_out[DATA][32] , 
        \right_out[DATA][31] , \right_out[DATA][30] , \right_out[DATA][29] , 
        \right_out[DATA][28] , \right_out[DATA][27] , \right_out[DATA][26] , 
        \right_out[DATA][25] , \right_out[DATA][24] , \right_out[DATA][23] , 
        \right_out[DATA][22] , \right_out[DATA][21] , \right_out[DATA][20] , 
        \right_out[DATA][19] , \right_out[DATA][18] , \right_out[DATA][17] , 
        \right_out[DATA][16] , \right_out[DATA][15] , \right_out[DATA][14] , 
        \right_out[DATA][13] , \right_out[DATA][12] , \right_out[DATA][11] , 
        \right_out[DATA][10] , \right_out[DATA][9] , \right_out[DATA][8] , 
        \right_out[DATA][7] , \right_out[DATA][6] , \right_out[DATA][5] , 
        \right_out[DATA][4] , \right_out[DATA][3] , \right_out[DATA][2] , 
        \right_out[DATA][1] , \right_out[DATA][0] }), .right_in(
        \right_in[ACK] ) );
  input preset, \left_in[REQ] , \left_in[DATA][33] , \left_in[DATA][32] ,
         \left_in[DATA][31] , \left_in[DATA][30] , \left_in[DATA][29] ,
         \left_in[DATA][28] , \left_in[DATA][27] , \left_in[DATA][26] ,
         \left_in[DATA][25] , \left_in[DATA][24] , \left_in[DATA][23] ,
         \left_in[DATA][22] , \left_in[DATA][21] , \left_in[DATA][20] ,
         \left_in[DATA][19] , \left_in[DATA][18] , \left_in[DATA][17] ,
         \left_in[DATA][16] , \left_in[DATA][15] , \left_in[DATA][14] ,
         \left_in[DATA][13] , \left_in[DATA][12] , \left_in[DATA][11] ,
         \left_in[DATA][10] , \left_in[DATA][9] , \left_in[DATA][8] ,
         \left_in[DATA][7] , \left_in[DATA][6] , \left_in[DATA][5] ,
         \left_in[DATA][4] , \left_in[DATA][3] , \left_in[DATA][2] ,
         \left_in[DATA][1] , \left_in[DATA][0] , \right_in[ACK] ;
  output \left_out[ACK] , \right_out[REQ] , \right_out[DATA][33] ,
         \right_out[DATA][32] , \right_out[DATA][31] , \right_out[DATA][30] ,
         \right_out[DATA][29] , \right_out[DATA][28] , \right_out[DATA][27] ,
         \right_out[DATA][26] , \right_out[DATA][25] , \right_out[DATA][24] ,
         \right_out[DATA][23] , \right_out[DATA][22] , \right_out[DATA][21] ,
         \right_out[DATA][20] , \right_out[DATA][19] , \right_out[DATA][18] ,
         \right_out[DATA][17] , \right_out[DATA][16] , \right_out[DATA][15] ,
         \right_out[DATA][14] , \right_out[DATA][13] , \right_out[DATA][12] ,
         \right_out[DATA][11] , \right_out[DATA][10] , \right_out[DATA][9] ,
         \right_out[DATA][8] , \right_out[DATA][7] , \right_out[DATA][6] ,
         \right_out[DATA][5] , \right_out[DATA][4] , \right_out[DATA][3] ,
         \right_out[DATA][2] , \right_out[DATA][1] , \right_out[DATA][0] ;
  wire   lt_en, N3;

  latch_controller_1_3 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N3), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N3), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N3), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N3), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N3), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N3), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N3), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N3), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N3), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N3), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N3), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N3), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N3), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N3), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N3), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N3), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N3), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N3), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N3), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N3), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N3), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N3), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N3), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDHQX4 \data_reg[33]  ( .G(N3), .D(\left_in[DATA][33] ), .Q(
        \right_out[DATA][33] ) );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N3), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N3), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N3), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N3), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N3), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N3), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N3), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX18 \data_reg[12]  ( .G(N3), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX18 \data_reg[7]  ( .G(N3), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[32]  ( .G(N3), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LS_OR2X9 U3 ( .A(lt_en), .B(preset), .Z(N3) );
endmodule


module hpu_0_1 ( preset, .chan_in_f({\chan_in_f[REQ] , \chan_in_f[DATA][33] , 
        \chan_in_f[DATA][32] , \chan_in_f[DATA][31] , \chan_in_f[DATA][30] , 
        \chan_in_f[DATA][29] , \chan_in_f[DATA][28] , \chan_in_f[DATA][27] , 
        \chan_in_f[DATA][26] , \chan_in_f[DATA][25] , \chan_in_f[DATA][24] , 
        \chan_in_f[DATA][23] , \chan_in_f[DATA][22] , \chan_in_f[DATA][21] , 
        \chan_in_f[DATA][20] , \chan_in_f[DATA][19] , \chan_in_f[DATA][18] , 
        \chan_in_f[DATA][17] , \chan_in_f[DATA][16] , \chan_in_f[DATA][15] , 
        \chan_in_f[DATA][14] , \chan_in_f[DATA][13] , \chan_in_f[DATA][12] , 
        \chan_in_f[DATA][11] , \chan_in_f[DATA][10] , \chan_in_f[DATA][9] , 
        \chan_in_f[DATA][8] , \chan_in_f[DATA][7] , \chan_in_f[DATA][6] , 
        \chan_in_f[DATA][5] , \chan_in_f[DATA][4] , \chan_in_f[DATA][3] , 
        \chan_in_f[DATA][2] , \chan_in_f[DATA][1] , \chan_in_f[DATA][0] }), 
    .chan_in_b(\chan_in_b[ACK] ), .chan_out_f({\chan_out_f[REQ] , 
        \chan_out_f[DATA][33] , \chan_out_f[DATA][32] , \chan_out_f[DATA][31] , 
        \chan_out_f[DATA][30] , \chan_out_f[DATA][29] , \chan_out_f[DATA][28] , 
        \chan_out_f[DATA][27] , \chan_out_f[DATA][26] , \chan_out_f[DATA][25] , 
        \chan_out_f[DATA][24] , \chan_out_f[DATA][23] , \chan_out_f[DATA][22] , 
        \chan_out_f[DATA][21] , \chan_out_f[DATA][20] , \chan_out_f[DATA][19] , 
        \chan_out_f[DATA][18] , \chan_out_f[DATA][17] , \chan_out_f[DATA][16] , 
        \chan_out_f[DATA][15] , \chan_out_f[DATA][14] , \chan_out_f[DATA][13] , 
        \chan_out_f[DATA][12] , \chan_out_f[DATA][11] , \chan_out_f[DATA][10] , 
        \chan_out_f[DATA][9] , \chan_out_f[DATA][8] , \chan_out_f[DATA][7] , 
        \chan_out_f[DATA][6] , \chan_out_f[DATA][5] , \chan_out_f[DATA][4] , 
        \chan_out_f[DATA][3] , \chan_out_f[DATA][2] , \chan_out_f[DATA][1] , 
        \chan_out_f[DATA][0] }), .chan_out_b(\chan_out_b[ACK] ), sel );
  output [4:0] sel;
  input preset, \chan_in_f[REQ] , \chan_in_f[DATA][33] , \chan_in_f[DATA][32] ,
         \chan_in_f[DATA][31] , \chan_in_f[DATA][30] , \chan_in_f[DATA][29] ,
         \chan_in_f[DATA][28] , \chan_in_f[DATA][27] , \chan_in_f[DATA][26] ,
         \chan_in_f[DATA][25] , \chan_in_f[DATA][24] , \chan_in_f[DATA][23] ,
         \chan_in_f[DATA][22] , \chan_in_f[DATA][21] , \chan_in_f[DATA][20] ,
         \chan_in_f[DATA][19] , \chan_in_f[DATA][18] , \chan_in_f[DATA][17] ,
         \chan_in_f[DATA][16] , \chan_in_f[DATA][15] , \chan_in_f[DATA][14] ,
         \chan_in_f[DATA][13] , \chan_in_f[DATA][12] , \chan_in_f[DATA][11] ,
         \chan_in_f[DATA][10] , \chan_in_f[DATA][9] , \chan_in_f[DATA][8] ,
         \chan_in_f[DATA][7] , \chan_in_f[DATA][6] , \chan_in_f[DATA][5] ,
         \chan_in_f[DATA][4] , \chan_in_f[DATA][3] , \chan_in_f[DATA][2] ,
         \chan_in_f[DATA][1] , \chan_in_f[DATA][0] , \chan_out_b[ACK] ;
  output \chan_in_b[ACK] , \chan_out_f[REQ] , \chan_out_f[DATA][33] ,
         \chan_out_f[DATA][32] , \chan_out_f[DATA][31] ,
         \chan_out_f[DATA][30] , \chan_out_f[DATA][29] ,
         \chan_out_f[DATA][28] , \chan_out_f[DATA][27] ,
         \chan_out_f[DATA][26] , \chan_out_f[DATA][25] ,
         \chan_out_f[DATA][24] , \chan_out_f[DATA][23] ,
         \chan_out_f[DATA][22] , \chan_out_f[DATA][21] ,
         \chan_out_f[DATA][20] , \chan_out_f[DATA][19] ,
         \chan_out_f[DATA][18] , \chan_out_f[DATA][17] ,
         \chan_out_f[DATA][16] , \chan_out_f[DATA][15] ,
         \chan_out_f[DATA][14] , \chan_out_f[DATA][13] ,
         \chan_out_f[DATA][12] , \chan_out_f[DATA][11] ,
         \chan_out_f[DATA][10] , \chan_out_f[DATA][9] , \chan_out_f[DATA][8] ,
         \chan_out_f[DATA][7] , \chan_out_f[DATA][6] , \chan_out_f[DATA][5] ,
         \chan_out_f[DATA][4] , \chan_out_f[DATA][3] , \chan_out_f[DATA][2] ,
         \chan_out_f[DATA][1] , \chan_out_f[DATA][0] ;
  wire   data_in_valid, req_n, \chan_internal_f[DATA][33] ,
         \chan_internal_f[DATA][32] , \chan_internal_f[DATA][31] ,
         \chan_internal_f[DATA][30] , \chan_internal_f[DATA][29] ,
         \chan_internal_f[DATA][28] , \chan_internal_f[DATA][27] ,
         \chan_internal_f[DATA][26] , \chan_internal_f[DATA][25] ,
         \chan_internal_f[DATA][24] , \chan_internal_f[DATA][23] ,
         \chan_internal_f[DATA][22] , \chan_internal_f[DATA][21] ,
         \chan_internal_f[DATA][20] , \chan_internal_f[DATA][19] ,
         \chan_internal_f[DATA][18] , \chan_internal_f[DATA][17] ,
         \chan_internal_f[DATA][16] , \chan_internal_f[DATA][15] ,
         \chan_internal_f[DATA][14] , \chan_internal_f[DATA][13] ,
         \chan_internal_f[DATA][12] , \chan_internal_f[DATA][11] ,
         \chan_internal_f[DATA][10] , \chan_internal_f[DATA][9] ,
         \chan_internal_f[DATA][8] , \chan_internal_f[DATA][7] ,
         \chan_internal_f[DATA][6] , \chan_internal_f[DATA][5] ,
         \chan_internal_f[DATA][4] , \chan_internal_f[DATA][3] ,
         \chan_internal_f[DATA][2] , \chan_internal_f[DATA][1] ,
         \chan_internal_f[DATA][0] , N0, n1;

  hpu_comb_0_1 hpu_combinatorial ( .data_valid(data_in_valid), .data_in({
        \chan_in_f[DATA][33] , \chan_in_f[DATA][32] , \chan_in_f[DATA][31] , 
        \chan_in_f[DATA][30] , \chan_in_f[DATA][29] , \chan_in_f[DATA][28] , 
        \chan_in_f[DATA][27] , \chan_in_f[DATA][26] , \chan_in_f[DATA][25] , 
        \chan_in_f[DATA][24] , \chan_in_f[DATA][23] , \chan_in_f[DATA][22] , 
        \chan_in_f[DATA][21] , \chan_in_f[DATA][20] , \chan_in_f[DATA][19] , 
        \chan_in_f[DATA][18] , \chan_in_f[DATA][17] , \chan_in_f[DATA][16] , 
        \chan_in_f[DATA][15] , \chan_in_f[DATA][14] , \chan_in_f[DATA][13] , 
        \chan_in_f[DATA][12] , \chan_in_f[DATA][11] , \chan_in_f[DATA][10] , 
        \chan_in_f[DATA][9] , \chan_in_f[DATA][8] , \chan_in_f[DATA][7] , 
        \chan_in_f[DATA][6] , \chan_in_f[DATA][5] , \chan_in_f[DATA][4] , 
        \chan_in_f[DATA][3] , \chan_in_f[DATA][2] , \chan_in_f[DATA][1] , 
        \chan_in_f[DATA][0] }), .data_out({\chan_internal_f[DATA][33] , 
        \chan_internal_f[DATA][32] , \chan_internal_f[DATA][31] , 
        \chan_internal_f[DATA][30] , \chan_internal_f[DATA][29] , 
        \chan_internal_f[DATA][28] , \chan_internal_f[DATA][27] , 
        \chan_internal_f[DATA][26] , \chan_internal_f[DATA][25] , 
        \chan_internal_f[DATA][24] , \chan_internal_f[DATA][23] , 
        \chan_internal_f[DATA][22] , \chan_internal_f[DATA][21] , 
        \chan_internal_f[DATA][20] , \chan_internal_f[DATA][19] , 
        \chan_internal_f[DATA][18] , \chan_internal_f[DATA][17] , 
        \chan_internal_f[DATA][16] , \chan_internal_f[DATA][15] , 
        \chan_internal_f[DATA][14] , \chan_internal_f[DATA][13] , 
        \chan_internal_f[DATA][12] , \chan_internal_f[DATA][11] , 
        \chan_internal_f[DATA][10] , \chan_internal_f[DATA][9] , 
        \chan_internal_f[DATA][8] , \chan_internal_f[DATA][7] , 
        \chan_internal_f[DATA][6] , \chan_internal_f[DATA][5] , 
        \chan_internal_f[DATA][4] , \chan_internal_f[DATA][3] , 
        \chan_internal_f[DATA][2] , \chan_internal_f[DATA][1] , 
        \chan_internal_f[DATA][0] }), .sel(sel) );
  channel_latch_1_xxxxxxxxx_3 token_latch ( .preset(preset), .left_in({n1, 
        \chan_internal_f[DATA][33] , \chan_internal_f[DATA][32] , 
        \chan_internal_f[DATA][31] , \chan_internal_f[DATA][30] , 
        \chan_internal_f[DATA][29] , \chan_internal_f[DATA][28] , 
        \chan_internal_f[DATA][27] , \chan_internal_f[DATA][26] , 
        \chan_internal_f[DATA][25] , \chan_internal_f[DATA][24] , 
        \chan_internal_f[DATA][23] , \chan_internal_f[DATA][22] , 
        \chan_internal_f[DATA][21] , \chan_internal_f[DATA][20] , 
        \chan_internal_f[DATA][19] , \chan_internal_f[DATA][18] , 
        \chan_internal_f[DATA][17] , \chan_internal_f[DATA][16] , 
        \chan_internal_f[DATA][15] , \chan_internal_f[DATA][14] , 
        \chan_internal_f[DATA][13] , \chan_internal_f[DATA][12] , 
        \chan_internal_f[DATA][11] , \chan_internal_f[DATA][10] , 
        \chan_internal_f[DATA][9] , \chan_internal_f[DATA][8] , 
        \chan_internal_f[DATA][7] , \chan_internal_f[DATA][6] , 
        \chan_internal_f[DATA][5] , \chan_internal_f[DATA][4] , 
        \chan_internal_f[DATA][3] , \chan_internal_f[DATA][2] , 
        \chan_internal_f[DATA][1] , \chan_internal_f[DATA][0] }), .left_out(
        \chan_in_b[ACK] ), .right_out({\chan_out_f[REQ] , 
        \chan_out_f[DATA][33] , \chan_out_f[DATA][32] , \chan_out_f[DATA][31] , 
        \chan_out_f[DATA][30] , \chan_out_f[DATA][29] , \chan_out_f[DATA][28] , 
        \chan_out_f[DATA][27] , \chan_out_f[DATA][26] , \chan_out_f[DATA][25] , 
        \chan_out_f[DATA][24] , \chan_out_f[DATA][23] , \chan_out_f[DATA][22] , 
        \chan_out_f[DATA][21] , \chan_out_f[DATA][20] , \chan_out_f[DATA][19] , 
        \chan_out_f[DATA][18] , \chan_out_f[DATA][17] , \chan_out_f[DATA][16] , 
        \chan_out_f[DATA][15] , \chan_out_f[DATA][14] , \chan_out_f[DATA][13] , 
        \chan_out_f[DATA][12] , \chan_out_f[DATA][11] , \chan_out_f[DATA][10] , 
        \chan_out_f[DATA][9] , \chan_out_f[DATA][8] , \chan_out_f[DATA][7] , 
        \chan_out_f[DATA][6] , \chan_out_f[DATA][5] , \chan_out_f[DATA][4] , 
        \chan_out_f[DATA][3] , \chan_out_f[DATA][2] , \chan_out_f[DATA][1] , 
        \chan_out_f[DATA][0] }), .right_in(\chan_out_b[ACK] ) );
  HS65_LS_IVX9 I_1 ( .A(\chan_in_f[REQ] ), .Z(req_n) );
  HS65_LS_IVX9 I_0 ( .A(\chan_in_b[ACK] ), .Z(N0) );
  HS65_LS_AND2X4 U1 ( .A(\chan_in_f[REQ] ), .B(N0), .Z(data_in_valid) );
  HS65_LS_IVX9 U2 ( .A(req_n), .Z(n1) );
endmodule


module hpu_comb_0_3 ( data_valid, data_in, data_out, sel );
  input [33:0] data_in;
  output [33:0] data_out;
  output [4:0] sel;
  input data_valid;
  wire   N17, N18, N19, N21, N22, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n35, n36, n37, n38, n1, n39,
         n40, n41, n42, n43, n44, n45;
  assign data_out[33] = data_in[33];
  assign data_out[32] = data_in[32];

  HS65_LS_LDHQX9 \sel_reg[4]  ( .G(N22), .D(N21), .Q(sel[4]) );
  HS65_LS_LDHQX9 \sel_reg[3]  ( .G(N22), .D(1'b0), .Q(sel[3]) );
  HS65_LS_LDHQX9 \sel_reg[2]  ( .G(N22), .D(N19), .Q(sel[2]) );
  HS65_LS_LDHQX9 \sel_reg[1]  ( .G(N22), .D(N18), .Q(sel[1]) );
  HS65_LS_LDHQX9 \sel_reg[0]  ( .G(N22), .D(N17), .Q(sel[0]) );
  HS65_LS_BFX13 U3 ( .A(n44), .Z(n42) );
  HS65_LS_BFX18 U4 ( .A(n35), .Z(n1) );
  HS65_LS_IVX9 U5 ( .A(n45), .Z(n40) );
  HS65_LS_IVX9 U6 ( .A(n45), .Z(n39) );
  HS65_LS_IVX9 U7 ( .A(n45), .Z(n41) );
  HS65_LS_BFX9 U8 ( .A(n44), .Z(n43) );
  HS65_LS_NOR2X6 U9 ( .A(n43), .B(n38), .Z(N17) );
  HS65_LS_OAI22X6 U10 ( .A(n45), .B(n25), .C(n39), .D(n27), .Z(data_out[6]) );
  HS65_LS_OAI22X6 U11 ( .A(n24), .B(n43), .C(n39), .D(n26), .Z(data_out[7]) );
  HS65_LS_OAI22X6 U12 ( .A(n43), .B(n31), .C(n41), .D(n33), .Z(data_out[0]) );
  HS65_LS_OAI22X6 U13 ( .A(n42), .B(n30), .C(n40), .D(n32), .Z(data_out[1]) );
  HS65_LS_OAI22X6 U14 ( .A(n42), .B(n29), .C(n39), .D(n31), .Z(data_out[2]) );
  HS65_LS_OAI22X6 U15 ( .A(n42), .B(n28), .C(n39), .D(n30), .Z(data_out[3]) );
  HS65_LS_OAI22X6 U16 ( .A(n42), .B(n27), .C(n39), .D(n29), .Z(data_out[4]) );
  HS65_LS_OAI22X6 U17 ( .A(n42), .B(n26), .C(n40), .D(n28), .Z(data_out[5]) );
  HS65_LS_OAI22X6 U18 ( .A(n42), .B(n23), .C(n39), .D(n25), .Z(data_out[8]) );
  HS65_LS_OAI22X6 U19 ( .A(n42), .B(n22), .C(n39), .D(n24), .Z(data_out[9]) );
  HS65_LS_OAI22X6 U20 ( .A(n43), .B(n21), .C(n41), .D(n23), .Z(data_out[10])
         );
  HS65_LS_OAI22X6 U21 ( .A(n43), .B(n20), .C(n41), .D(n22), .Z(data_out[11])
         );
  HS65_LS_OAI22X6 U22 ( .A(n43), .B(n19), .C(n41), .D(n21), .Z(data_out[12])
         );
  HS65_LS_OAI22X6 U23 ( .A(n43), .B(n18), .C(n41), .D(n20), .Z(data_out[13])
         );
  HS65_LS_OAI22X6 U24 ( .A(n43), .B(n17), .C(n41), .D(n19), .Z(data_out[14])
         );
  HS65_LS_OAI22X6 U25 ( .A(n43), .B(n16), .C(n40), .D(n18), .Z(data_out[15])
         );
  HS65_LS_OAI22X6 U26 ( .A(n43), .B(n15), .C(n40), .D(n17), .Z(data_out[16])
         );
  HS65_LS_OAI22X6 U27 ( .A(n42), .B(n14), .C(n40), .D(n16), .Z(data_out[17])
         );
  HS65_LS_OAI22X6 U28 ( .A(n42), .B(n13), .C(n40), .D(n15), .Z(data_out[18])
         );
  HS65_LS_OAI22X6 U29 ( .A(n42), .B(n12), .C(n40), .D(n14), .Z(data_out[19])
         );
  HS65_LS_OAI22X6 U30 ( .A(n42), .B(n11), .C(n40), .D(n13), .Z(data_out[20])
         );
  HS65_LS_OAI22X6 U31 ( .A(n42), .B(n10), .C(n40), .D(n12), .Z(data_out[21])
         );
  HS65_LS_OAI22X6 U32 ( .A(n42), .B(n9), .C(n40), .D(n11), .Z(data_out[22]) );
  HS65_LS_OAI22X6 U33 ( .A(n42), .B(n8), .C(n40), .D(n10), .Z(data_out[23]) );
  HS65_LS_OAI22X6 U34 ( .A(n42), .B(n7), .C(n40), .D(n9), .Z(data_out[24]) );
  HS65_LS_OAI22X6 U35 ( .A(n42), .B(n6), .C(n39), .D(n8), .Z(data_out[25]) );
  HS65_LS_OAI22X6 U36 ( .A(n42), .B(n5), .C(n39), .D(n7), .Z(data_out[26]) );
  HS65_LS_OAI22X6 U37 ( .A(n42), .B(n4), .C(n39), .D(n6), .Z(data_out[27]) );
  HS65_LS_OAI22X6 U38 ( .A(n42), .B(n3), .C(n39), .D(n5), .Z(data_out[28]) );
  HS65_LS_OAI22X6 U39 ( .A(n42), .B(n2), .C(n39), .D(n4), .Z(data_out[29]) );
  HS65_LS_IVX9 U40 ( .A(n1), .Z(n45) );
  HS65_LS_NAND3X5 U41 ( .A(n38), .B(n36), .C(n41), .Z(n37) );
  HS65_LS_NAND2X7 U42 ( .A(n32), .B(n33), .Z(n38) );
  HS65_LS_NOR2X6 U43 ( .A(n33), .B(n37), .Z(N18) );
  HS65_LS_NOR2X6 U44 ( .A(n43), .B(n36), .Z(N21) );
  HS65_LS_IVX9 U45 ( .A(n1), .Z(n44) );
  HS65_LS_NOR2X6 U46 ( .A(n41), .B(n3), .Z(data_out[30]) );
  HS65_LS_NOR2X6 U47 ( .A(n41), .B(n2), .Z(data_out[31]) );
  HS65_LS_IVX9 U48 ( .A(data_in[0]), .Z(n33) );
  HS65_LS_NAND2X7 U49 ( .A(data_in[1]), .B(data_in[0]), .Z(n36) );
  HS65_LS_NOR2AX13 U50 ( .A(data_in[33]), .B(data_in[32]), .Z(n35) );
  HS65_LS_IVX9 U51 ( .A(data_in[9]), .Z(n24) );
  HS65_LS_IVX9 U52 ( .A(data_in[2]), .Z(n31) );
  HS65_LS_IVX9 U53 ( .A(data_in[3]), .Z(n30) );
  HS65_LS_IVX9 U54 ( .A(data_in[4]), .Z(n29) );
  HS65_LS_IVX9 U55 ( .A(data_in[5]), .Z(n28) );
  HS65_LS_IVX9 U56 ( .A(data_in[6]), .Z(n27) );
  HS65_LS_IVX9 U57 ( .A(data_in[7]), .Z(n26) );
  HS65_LS_IVX9 U58 ( .A(data_in[8]), .Z(n25) );
  HS65_LS_IVX9 U59 ( .A(data_in[10]), .Z(n23) );
  HS65_LS_IVX9 U60 ( .A(data_in[11]), .Z(n22) );
  HS65_LS_IVX9 U61 ( .A(data_in[12]), .Z(n21) );
  HS65_LS_IVX9 U62 ( .A(data_in[13]), .Z(n20) );
  HS65_LS_IVX9 U63 ( .A(data_in[14]), .Z(n19) );
  HS65_LS_IVX9 U64 ( .A(data_in[15]), .Z(n18) );
  HS65_LS_IVX9 U65 ( .A(data_in[16]), .Z(n17) );
  HS65_LS_IVX9 U66 ( .A(data_in[17]), .Z(n16) );
  HS65_LS_IVX9 U67 ( .A(data_in[18]), .Z(n15) );
  HS65_LS_IVX9 U68 ( .A(data_in[19]), .Z(n14) );
  HS65_LS_IVX9 U69 ( .A(data_in[20]), .Z(n13) );
  HS65_LS_IVX9 U70 ( .A(data_in[21]), .Z(n12) );
  HS65_LS_IVX9 U71 ( .A(data_in[22]), .Z(n11) );
  HS65_LS_IVX9 U72 ( .A(data_in[23]), .Z(n10) );
  HS65_LS_IVX9 U73 ( .A(data_in[24]), .Z(n9) );
  HS65_LS_IVX9 U74 ( .A(data_in[25]), .Z(n8) );
  HS65_LS_IVX9 U75 ( .A(data_in[26]), .Z(n7) );
  HS65_LS_IVX9 U76 ( .A(data_in[27]), .Z(n6) );
  HS65_LS_IVX9 U78 ( .A(data_in[28]), .Z(n5) );
  HS65_LS_IVX9 U79 ( .A(data_in[29]), .Z(n4) );
  HS65_LS_IVX9 U80 ( .A(data_in[30]), .Z(n3) );
  HS65_LS_IVX9 U81 ( .A(data_in[31]), .Z(n2) );
  HS65_LS_IVX9 U82 ( .A(data_in[1]), .Z(n32) );
  HS65_LS_NOR2X6 U83 ( .A(data_in[0]), .B(n37), .Z(N19) );
  HS65_LS_NOR2AX3 U84 ( .A(data_valid), .B(data_in[32]), .Z(N22) );
endmodule


module sr_latch_0_2 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X27 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_2 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_2 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_OAI12X18 U4 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_2 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, N0, n2;
  assign Rout = Aout;
  assign lt_en = N0;

  c_gate_0_2 gate ( .preset(preset), .a(n2), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 I_0 ( .A(Aout), .Z(N0) );
  HS65_LS_IVX9 U1 ( .A(Ain), .Z(n2) );
endmodule


module channel_latch_1_xxxxxxxxx_2 ( preset, .left_in({\left_in[REQ] , 
        \left_in[DATA][33] , \left_in[DATA][32] , \left_in[DATA][31] , 
        \left_in[DATA][30] , \left_in[DATA][29] , \left_in[DATA][28] , 
        \left_in[DATA][27] , \left_in[DATA][26] , \left_in[DATA][25] , 
        \left_in[DATA][24] , \left_in[DATA][23] , \left_in[DATA][22] , 
        \left_in[DATA][21] , \left_in[DATA][20] , \left_in[DATA][19] , 
        \left_in[DATA][18] , \left_in[DATA][17] , \left_in[DATA][16] , 
        \left_in[DATA][15] , \left_in[DATA][14] , \left_in[DATA][13] , 
        \left_in[DATA][12] , \left_in[DATA][11] , \left_in[DATA][10] , 
        \left_in[DATA][9] , \left_in[DATA][8] , \left_in[DATA][7] , 
        \left_in[DATA][6] , \left_in[DATA][5] , \left_in[DATA][4] , 
        \left_in[DATA][3] , \left_in[DATA][2] , \left_in[DATA][1] , 
        \left_in[DATA][0] }), .left_out(\left_out[ACK] ), .right_out({
        \right_out[REQ] , \right_out[DATA][33] , \right_out[DATA][32] , 
        \right_out[DATA][31] , \right_out[DATA][30] , \right_out[DATA][29] , 
        \right_out[DATA][28] , \right_out[DATA][27] , \right_out[DATA][26] , 
        \right_out[DATA][25] , \right_out[DATA][24] , \right_out[DATA][23] , 
        \right_out[DATA][22] , \right_out[DATA][21] , \right_out[DATA][20] , 
        \right_out[DATA][19] , \right_out[DATA][18] , \right_out[DATA][17] , 
        \right_out[DATA][16] , \right_out[DATA][15] , \right_out[DATA][14] , 
        \right_out[DATA][13] , \right_out[DATA][12] , \right_out[DATA][11] , 
        \right_out[DATA][10] , \right_out[DATA][9] , \right_out[DATA][8] , 
        \right_out[DATA][7] , \right_out[DATA][6] , \right_out[DATA][5] , 
        \right_out[DATA][4] , \right_out[DATA][3] , \right_out[DATA][2] , 
        \right_out[DATA][1] , \right_out[DATA][0] }), .right_in(
        \right_in[ACK] ) );
  input preset, \left_in[REQ] , \left_in[DATA][33] , \left_in[DATA][32] ,
         \left_in[DATA][31] , \left_in[DATA][30] , \left_in[DATA][29] ,
         \left_in[DATA][28] , \left_in[DATA][27] , \left_in[DATA][26] ,
         \left_in[DATA][25] , \left_in[DATA][24] , \left_in[DATA][23] ,
         \left_in[DATA][22] , \left_in[DATA][21] , \left_in[DATA][20] ,
         \left_in[DATA][19] , \left_in[DATA][18] , \left_in[DATA][17] ,
         \left_in[DATA][16] , \left_in[DATA][15] , \left_in[DATA][14] ,
         \left_in[DATA][13] , \left_in[DATA][12] , \left_in[DATA][11] ,
         \left_in[DATA][10] , \left_in[DATA][9] , \left_in[DATA][8] ,
         \left_in[DATA][7] , \left_in[DATA][6] , \left_in[DATA][5] ,
         \left_in[DATA][4] , \left_in[DATA][3] , \left_in[DATA][2] ,
         \left_in[DATA][1] , \left_in[DATA][0] , \right_in[ACK] ;
  output \left_out[ACK] , \right_out[REQ] , \right_out[DATA][33] ,
         \right_out[DATA][32] , \right_out[DATA][31] , \right_out[DATA][30] ,
         \right_out[DATA][29] , \right_out[DATA][28] , \right_out[DATA][27] ,
         \right_out[DATA][26] , \right_out[DATA][25] , \right_out[DATA][24] ,
         \right_out[DATA][23] , \right_out[DATA][22] , \right_out[DATA][21] ,
         \right_out[DATA][20] , \right_out[DATA][19] , \right_out[DATA][18] ,
         \right_out[DATA][17] , \right_out[DATA][16] , \right_out[DATA][15] ,
         \right_out[DATA][14] , \right_out[DATA][13] , \right_out[DATA][12] ,
         \right_out[DATA][11] , \right_out[DATA][10] , \right_out[DATA][9] ,
         \right_out[DATA][8] , \right_out[DATA][7] , \right_out[DATA][6] ,
         \right_out[DATA][5] , \right_out[DATA][4] , \right_out[DATA][3] ,
         \right_out[DATA][2] , \right_out[DATA][1] , \right_out[DATA][0] ;
  wire   lt_en, N3;

  latch_controller_1_2 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LH_LDHQX4 \data_reg[33]  ( .G(N3), .D(\left_in[DATA][33] ), .Q(
        \right_out[DATA][33] ) );
  HS65_LS_LDHQX9 \data_reg[32]  ( .G(N3), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N3), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N3), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N3), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N3), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N3), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N3), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N3), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N3), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N3), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N3), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N3), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N3), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N3), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N3), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N3), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N3), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N3), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N3), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N3), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX9 \data_reg[12]  ( .G(N3), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N3), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N3), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N3), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N3), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N3), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N3), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N3), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N3), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N3), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N3), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N3), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N3), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LS_OR2X9 U3 ( .A(lt_en), .B(preset), .Z(N3) );
endmodule


module hpu_0_3 ( preset, .chan_in_f({\chan_in_f[REQ] , \chan_in_f[DATA][33] , 
        \chan_in_f[DATA][32] , \chan_in_f[DATA][31] , \chan_in_f[DATA][30] , 
        \chan_in_f[DATA][29] , \chan_in_f[DATA][28] , \chan_in_f[DATA][27] , 
        \chan_in_f[DATA][26] , \chan_in_f[DATA][25] , \chan_in_f[DATA][24] , 
        \chan_in_f[DATA][23] , \chan_in_f[DATA][22] , \chan_in_f[DATA][21] , 
        \chan_in_f[DATA][20] , \chan_in_f[DATA][19] , \chan_in_f[DATA][18] , 
        \chan_in_f[DATA][17] , \chan_in_f[DATA][16] , \chan_in_f[DATA][15] , 
        \chan_in_f[DATA][14] , \chan_in_f[DATA][13] , \chan_in_f[DATA][12] , 
        \chan_in_f[DATA][11] , \chan_in_f[DATA][10] , \chan_in_f[DATA][9] , 
        \chan_in_f[DATA][8] , \chan_in_f[DATA][7] , \chan_in_f[DATA][6] , 
        \chan_in_f[DATA][5] , \chan_in_f[DATA][4] , \chan_in_f[DATA][3] , 
        \chan_in_f[DATA][2] , \chan_in_f[DATA][1] , \chan_in_f[DATA][0] }), 
    .chan_in_b(\chan_in_b[ACK] ), .chan_out_f({\chan_out_f[REQ] , 
        \chan_out_f[DATA][33] , \chan_out_f[DATA][32] , \chan_out_f[DATA][31] , 
        \chan_out_f[DATA][30] , \chan_out_f[DATA][29] , \chan_out_f[DATA][28] , 
        \chan_out_f[DATA][27] , \chan_out_f[DATA][26] , \chan_out_f[DATA][25] , 
        \chan_out_f[DATA][24] , \chan_out_f[DATA][23] , \chan_out_f[DATA][22] , 
        \chan_out_f[DATA][21] , \chan_out_f[DATA][20] , \chan_out_f[DATA][19] , 
        \chan_out_f[DATA][18] , \chan_out_f[DATA][17] , \chan_out_f[DATA][16] , 
        \chan_out_f[DATA][15] , \chan_out_f[DATA][14] , \chan_out_f[DATA][13] , 
        \chan_out_f[DATA][12] , \chan_out_f[DATA][11] , \chan_out_f[DATA][10] , 
        \chan_out_f[DATA][9] , \chan_out_f[DATA][8] , \chan_out_f[DATA][7] , 
        \chan_out_f[DATA][6] , \chan_out_f[DATA][5] , \chan_out_f[DATA][4] , 
        \chan_out_f[DATA][3] , \chan_out_f[DATA][2] , \chan_out_f[DATA][1] , 
        \chan_out_f[DATA][0] }), .chan_out_b(\chan_out_b[ACK] ), sel );
  output [4:0] sel;
  input preset, \chan_in_f[REQ] , \chan_in_f[DATA][33] , \chan_in_f[DATA][32] ,
         \chan_in_f[DATA][31] , \chan_in_f[DATA][30] , \chan_in_f[DATA][29] ,
         \chan_in_f[DATA][28] , \chan_in_f[DATA][27] , \chan_in_f[DATA][26] ,
         \chan_in_f[DATA][25] , \chan_in_f[DATA][24] , \chan_in_f[DATA][23] ,
         \chan_in_f[DATA][22] , \chan_in_f[DATA][21] , \chan_in_f[DATA][20] ,
         \chan_in_f[DATA][19] , \chan_in_f[DATA][18] , \chan_in_f[DATA][17] ,
         \chan_in_f[DATA][16] , \chan_in_f[DATA][15] , \chan_in_f[DATA][14] ,
         \chan_in_f[DATA][13] , \chan_in_f[DATA][12] , \chan_in_f[DATA][11] ,
         \chan_in_f[DATA][10] , \chan_in_f[DATA][9] , \chan_in_f[DATA][8] ,
         \chan_in_f[DATA][7] , \chan_in_f[DATA][6] , \chan_in_f[DATA][5] ,
         \chan_in_f[DATA][4] , \chan_in_f[DATA][3] , \chan_in_f[DATA][2] ,
         \chan_in_f[DATA][1] , \chan_in_f[DATA][0] , \chan_out_b[ACK] ;
  output \chan_in_b[ACK] , \chan_out_f[REQ] , \chan_out_f[DATA][33] ,
         \chan_out_f[DATA][32] , \chan_out_f[DATA][31] ,
         \chan_out_f[DATA][30] , \chan_out_f[DATA][29] ,
         \chan_out_f[DATA][28] , \chan_out_f[DATA][27] ,
         \chan_out_f[DATA][26] , \chan_out_f[DATA][25] ,
         \chan_out_f[DATA][24] , \chan_out_f[DATA][23] ,
         \chan_out_f[DATA][22] , \chan_out_f[DATA][21] ,
         \chan_out_f[DATA][20] , \chan_out_f[DATA][19] ,
         \chan_out_f[DATA][18] , \chan_out_f[DATA][17] ,
         \chan_out_f[DATA][16] , \chan_out_f[DATA][15] ,
         \chan_out_f[DATA][14] , \chan_out_f[DATA][13] ,
         \chan_out_f[DATA][12] , \chan_out_f[DATA][11] ,
         \chan_out_f[DATA][10] , \chan_out_f[DATA][9] , \chan_out_f[DATA][8] ,
         \chan_out_f[DATA][7] , \chan_out_f[DATA][6] , \chan_out_f[DATA][5] ,
         \chan_out_f[DATA][4] , \chan_out_f[DATA][3] , \chan_out_f[DATA][2] ,
         \chan_out_f[DATA][1] , \chan_out_f[DATA][0] ;
  wire   data_in_valid, req_n, \chan_internal_f[DATA][33] ,
         \chan_internal_f[DATA][32] , \chan_internal_f[DATA][31] ,
         \chan_internal_f[DATA][30] , \chan_internal_f[DATA][29] ,
         \chan_internal_f[DATA][28] , \chan_internal_f[DATA][27] ,
         \chan_internal_f[DATA][26] , \chan_internal_f[DATA][25] ,
         \chan_internal_f[DATA][24] , \chan_internal_f[DATA][23] ,
         \chan_internal_f[DATA][22] , \chan_internal_f[DATA][21] ,
         \chan_internal_f[DATA][20] , \chan_internal_f[DATA][19] ,
         \chan_internal_f[DATA][18] , \chan_internal_f[DATA][17] ,
         \chan_internal_f[DATA][16] , \chan_internal_f[DATA][15] ,
         \chan_internal_f[DATA][14] , \chan_internal_f[DATA][13] ,
         \chan_internal_f[DATA][12] , \chan_internal_f[DATA][11] ,
         \chan_internal_f[DATA][10] , \chan_internal_f[DATA][9] ,
         \chan_internal_f[DATA][8] , \chan_internal_f[DATA][7] ,
         \chan_internal_f[DATA][6] , \chan_internal_f[DATA][5] ,
         \chan_internal_f[DATA][4] , \chan_internal_f[DATA][3] ,
         \chan_internal_f[DATA][2] , \chan_internal_f[DATA][1] ,
         \chan_internal_f[DATA][0] , N0, n1;

  hpu_comb_0_3 hpu_combinatorial ( .data_valid(data_in_valid), .data_in({
        \chan_in_f[DATA][33] , \chan_in_f[DATA][32] , \chan_in_f[DATA][31] , 
        \chan_in_f[DATA][30] , \chan_in_f[DATA][29] , \chan_in_f[DATA][28] , 
        \chan_in_f[DATA][27] , \chan_in_f[DATA][26] , \chan_in_f[DATA][25] , 
        \chan_in_f[DATA][24] , \chan_in_f[DATA][23] , \chan_in_f[DATA][22] , 
        \chan_in_f[DATA][21] , \chan_in_f[DATA][20] , \chan_in_f[DATA][19] , 
        \chan_in_f[DATA][18] , \chan_in_f[DATA][17] , \chan_in_f[DATA][16] , 
        \chan_in_f[DATA][15] , \chan_in_f[DATA][14] , \chan_in_f[DATA][13] , 
        \chan_in_f[DATA][12] , \chan_in_f[DATA][11] , \chan_in_f[DATA][10] , 
        \chan_in_f[DATA][9] , \chan_in_f[DATA][8] , \chan_in_f[DATA][7] , 
        \chan_in_f[DATA][6] , \chan_in_f[DATA][5] , \chan_in_f[DATA][4] , 
        \chan_in_f[DATA][3] , \chan_in_f[DATA][2] , \chan_in_f[DATA][1] , 
        \chan_in_f[DATA][0] }), .data_out({\chan_internal_f[DATA][33] , 
        \chan_internal_f[DATA][32] , \chan_internal_f[DATA][31] , 
        \chan_internal_f[DATA][30] , \chan_internal_f[DATA][29] , 
        \chan_internal_f[DATA][28] , \chan_internal_f[DATA][27] , 
        \chan_internal_f[DATA][26] , \chan_internal_f[DATA][25] , 
        \chan_internal_f[DATA][24] , \chan_internal_f[DATA][23] , 
        \chan_internal_f[DATA][22] , \chan_internal_f[DATA][21] , 
        \chan_internal_f[DATA][20] , \chan_internal_f[DATA][19] , 
        \chan_internal_f[DATA][18] , \chan_internal_f[DATA][17] , 
        \chan_internal_f[DATA][16] , \chan_internal_f[DATA][15] , 
        \chan_internal_f[DATA][14] , \chan_internal_f[DATA][13] , 
        \chan_internal_f[DATA][12] , \chan_internal_f[DATA][11] , 
        \chan_internal_f[DATA][10] , \chan_internal_f[DATA][9] , 
        \chan_internal_f[DATA][8] , \chan_internal_f[DATA][7] , 
        \chan_internal_f[DATA][6] , \chan_internal_f[DATA][5] , 
        \chan_internal_f[DATA][4] , \chan_internal_f[DATA][3] , 
        \chan_internal_f[DATA][2] , \chan_internal_f[DATA][1] , 
        \chan_internal_f[DATA][0] }), .sel(sel) );
  channel_latch_1_xxxxxxxxx_2 token_latch ( .preset(preset), .left_in({n1, 
        \chan_internal_f[DATA][33] , \chan_internal_f[DATA][32] , 
        \chan_internal_f[DATA][31] , \chan_internal_f[DATA][30] , 
        \chan_internal_f[DATA][29] , \chan_internal_f[DATA][28] , 
        \chan_internal_f[DATA][27] , \chan_internal_f[DATA][26] , 
        \chan_internal_f[DATA][25] , \chan_internal_f[DATA][24] , 
        \chan_internal_f[DATA][23] , \chan_internal_f[DATA][22] , 
        \chan_internal_f[DATA][21] , \chan_internal_f[DATA][20] , 
        \chan_internal_f[DATA][19] , \chan_internal_f[DATA][18] , 
        \chan_internal_f[DATA][17] , \chan_internal_f[DATA][16] , 
        \chan_internal_f[DATA][15] , \chan_internal_f[DATA][14] , 
        \chan_internal_f[DATA][13] , \chan_internal_f[DATA][12] , 
        \chan_internal_f[DATA][11] , \chan_internal_f[DATA][10] , 
        \chan_internal_f[DATA][9] , \chan_internal_f[DATA][8] , 
        \chan_internal_f[DATA][7] , \chan_internal_f[DATA][6] , 
        \chan_internal_f[DATA][5] , \chan_internal_f[DATA][4] , 
        \chan_internal_f[DATA][3] , \chan_internal_f[DATA][2] , 
        \chan_internal_f[DATA][1] , \chan_internal_f[DATA][0] }), .left_out(
        \chan_in_b[ACK] ), .right_out({\chan_out_f[REQ] , 
        \chan_out_f[DATA][33] , \chan_out_f[DATA][32] , \chan_out_f[DATA][31] , 
        \chan_out_f[DATA][30] , \chan_out_f[DATA][29] , \chan_out_f[DATA][28] , 
        \chan_out_f[DATA][27] , \chan_out_f[DATA][26] , \chan_out_f[DATA][25] , 
        \chan_out_f[DATA][24] , \chan_out_f[DATA][23] , \chan_out_f[DATA][22] , 
        \chan_out_f[DATA][21] , \chan_out_f[DATA][20] , \chan_out_f[DATA][19] , 
        \chan_out_f[DATA][18] , \chan_out_f[DATA][17] , \chan_out_f[DATA][16] , 
        \chan_out_f[DATA][15] , \chan_out_f[DATA][14] , \chan_out_f[DATA][13] , 
        \chan_out_f[DATA][12] , \chan_out_f[DATA][11] , \chan_out_f[DATA][10] , 
        \chan_out_f[DATA][9] , \chan_out_f[DATA][8] , \chan_out_f[DATA][7] , 
        \chan_out_f[DATA][6] , \chan_out_f[DATA][5] , \chan_out_f[DATA][4] , 
        \chan_out_f[DATA][3] , \chan_out_f[DATA][2] , \chan_out_f[DATA][1] , 
        \chan_out_f[DATA][0] }), .right_in(\chan_out_b[ACK] ) );
  HS65_LS_IVX9 I_1 ( .A(\chan_in_f[REQ] ), .Z(req_n) );
  HS65_LS_IVX9 I_0 ( .A(\chan_in_b[ACK] ), .Z(N0) );
  HS65_LS_AND2X4 U1 ( .A(\chan_in_f[REQ] ), .B(N0), .Z(data_in_valid) );
  HS65_LS_IVX9 U2 ( .A(req_n), .Z(n1) );
endmodule


module hpu_comb_1_x ( data_valid, data_in, data_out, sel );
  input [33:0] data_in;
  output [33:0] data_out;
  output [4:0] sel;
  input data_valid;
  wire   N12, N13, N14, N15, N16, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n1, n38,
         n39, n40, n41, n42, n43, n44;
  assign data_out[33] = data_in[33];
  assign data_out[32] = data_in[32];

  HS65_LS_LDHQX9 \sel_reg[4]  ( .G(N16), .D(1'b0), .Q(sel[4]) );
  HS65_LS_LDHQX9 \sel_reg[3]  ( .G(N16), .D(N15), .Q(sel[3]) );
  HS65_LS_LDHQX9 \sel_reg[2]  ( .G(N16), .D(N14), .Q(sel[2]) );
  HS65_LS_LDHQX9 \sel_reg[1]  ( .G(N16), .D(N13), .Q(sel[1]) );
  HS65_LS_LDHQX9 \sel_reg[0]  ( .G(N16), .D(N12), .Q(sel[0]) );
  HS65_LS_BFX13 U3 ( .A(n43), .Z(n41) );
  HS65_LS_BFX18 U4 ( .A(n34), .Z(n1) );
  HS65_LS_IVX9 U5 ( .A(n44), .Z(n39) );
  HS65_LS_IVX9 U6 ( .A(n44), .Z(n38) );
  HS65_LS_IVX9 U7 ( .A(n44), .Z(n40) );
  HS65_LS_BFX9 U8 ( .A(n43), .Z(n42) );
  HS65_LS_NOR2X6 U9 ( .A(n42), .B(n36), .Z(N12) );
  HS65_LS_OAI22X6 U10 ( .A(n44), .B(n25), .C(n38), .D(n27), .Z(data_out[6]) );
  HS65_LS_OAI22X6 U11 ( .A(n24), .B(n42), .C(n38), .D(n26), .Z(data_out[7]) );
  HS65_LS_OAI22X6 U12 ( .A(n42), .B(n31), .C(n40), .D(n33), .Z(data_out[0]) );
  HS65_LS_OAI22X6 U13 ( .A(n41), .B(n30), .C(n39), .D(n32), .Z(data_out[1]) );
  HS65_LS_OAI22X6 U14 ( .A(n41), .B(n29), .C(n38), .D(n31), .Z(data_out[2]) );
  HS65_LS_OAI22X6 U15 ( .A(n41), .B(n28), .C(n38), .D(n30), .Z(data_out[3]) );
  HS65_LS_OAI22X6 U16 ( .A(n41), .B(n27), .C(n38), .D(n29), .Z(data_out[4]) );
  HS65_LS_OAI22X6 U17 ( .A(n41), .B(n26), .C(n39), .D(n28), .Z(data_out[5]) );
  HS65_LS_OAI22X6 U18 ( .A(n41), .B(n23), .C(n38), .D(n25), .Z(data_out[8]) );
  HS65_LS_OAI22X6 U19 ( .A(n41), .B(n22), .C(n38), .D(n24), .Z(data_out[9]) );
  HS65_LS_OAI22X6 U20 ( .A(n42), .B(n21), .C(n40), .D(n23), .Z(data_out[10])
         );
  HS65_LS_OAI22X6 U21 ( .A(n42), .B(n20), .C(n40), .D(n22), .Z(data_out[11])
         );
  HS65_LS_OAI22X6 U22 ( .A(n42), .B(n19), .C(n40), .D(n21), .Z(data_out[12])
         );
  HS65_LS_OAI22X6 U23 ( .A(n42), .B(n18), .C(n40), .D(n20), .Z(data_out[13])
         );
  HS65_LS_OAI22X6 U24 ( .A(n42), .B(n17), .C(n40), .D(n19), .Z(data_out[14])
         );
  HS65_LS_OAI22X6 U25 ( .A(n42), .B(n16), .C(n39), .D(n18), .Z(data_out[15])
         );
  HS65_LS_OAI22X6 U26 ( .A(n42), .B(n15), .C(n39), .D(n17), .Z(data_out[16])
         );
  HS65_LS_OAI22X6 U27 ( .A(n41), .B(n14), .C(n39), .D(n16), .Z(data_out[17])
         );
  HS65_LS_OAI22X6 U28 ( .A(n41), .B(n13), .C(n39), .D(n15), .Z(data_out[18])
         );
  HS65_LS_OAI22X6 U29 ( .A(n41), .B(n12), .C(n39), .D(n14), .Z(data_out[19])
         );
  HS65_LS_OAI22X6 U30 ( .A(n41), .B(n11), .C(n39), .D(n13), .Z(data_out[20])
         );
  HS65_LS_OAI22X6 U31 ( .A(n41), .B(n10), .C(n39), .D(n12), .Z(data_out[21])
         );
  HS65_LS_OAI22X6 U32 ( .A(n41), .B(n9), .C(n39), .D(n11), .Z(data_out[22]) );
  HS65_LS_OAI22X6 U33 ( .A(n41), .B(n8), .C(n39), .D(n10), .Z(data_out[23]) );
  HS65_LS_OAI22X6 U34 ( .A(n41), .B(n7), .C(n39), .D(n9), .Z(data_out[24]) );
  HS65_LS_OAI22X6 U35 ( .A(n41), .B(n6), .C(n38), .D(n8), .Z(data_out[25]) );
  HS65_LS_OAI22X6 U36 ( .A(n41), .B(n5), .C(n38), .D(n7), .Z(data_out[26]) );
  HS65_LS_OAI22X6 U37 ( .A(n41), .B(n4), .C(n38), .D(n6), .Z(data_out[27]) );
  HS65_LS_OAI22X6 U38 ( .A(n41), .B(n3), .C(n38), .D(n5), .Z(data_out[28]) );
  HS65_LS_OAI22X6 U39 ( .A(n41), .B(n2), .C(n38), .D(n4), .Z(data_out[29]) );
  HS65_LS_IVX9 U40 ( .A(n1), .Z(n44) );
  HS65_LS_NAND3X5 U41 ( .A(n36), .B(n37), .C(n40), .Z(n35) );
  HS65_LS_NAND2X7 U42 ( .A(n32), .B(n33), .Z(n36) );
  HS65_LS_NOR2X6 U43 ( .A(n33), .B(n35), .Z(N15) );
  HS65_LS_NOR2X6 U44 ( .A(n42), .B(n37), .Z(N13) );
  HS65_LS_IVX9 U45 ( .A(n1), .Z(n43) );
  HS65_LS_NOR2X6 U46 ( .A(n40), .B(n3), .Z(data_out[30]) );
  HS65_LS_NOR2X6 U47 ( .A(n40), .B(n2), .Z(data_out[31]) );
  HS65_LS_IVX9 U48 ( .A(data_in[0]), .Z(n33) );
  HS65_LS_NAND2X7 U49 ( .A(data_in[0]), .B(n32), .Z(n37) );
  HS65_LS_IVX9 U50 ( .A(data_in[1]), .Z(n32) );
  HS65_LS_NOR2AX13 U51 ( .A(data_in[33]), .B(data_in[32]), .Z(n34) );
  HS65_LS_IVX9 U52 ( .A(data_in[9]), .Z(n24) );
  HS65_LS_IVX9 U53 ( .A(data_in[2]), .Z(n31) );
  HS65_LS_IVX9 U54 ( .A(data_in[3]), .Z(n30) );
  HS65_LS_IVX9 U55 ( .A(data_in[4]), .Z(n29) );
  HS65_LS_IVX9 U56 ( .A(data_in[5]), .Z(n28) );
  HS65_LS_IVX9 U57 ( .A(data_in[6]), .Z(n27) );
  HS65_LS_IVX9 U58 ( .A(data_in[7]), .Z(n26) );
  HS65_LS_IVX9 U59 ( .A(data_in[8]), .Z(n25) );
  HS65_LS_IVX9 U60 ( .A(data_in[10]), .Z(n23) );
  HS65_LS_IVX9 U61 ( .A(data_in[11]), .Z(n22) );
  HS65_LS_IVX9 U62 ( .A(data_in[12]), .Z(n21) );
  HS65_LS_IVX9 U63 ( .A(data_in[13]), .Z(n20) );
  HS65_LS_IVX9 U64 ( .A(data_in[14]), .Z(n19) );
  HS65_LS_IVX9 U65 ( .A(data_in[15]), .Z(n18) );
  HS65_LS_IVX9 U66 ( .A(data_in[16]), .Z(n17) );
  HS65_LS_IVX9 U67 ( .A(data_in[17]), .Z(n16) );
  HS65_LS_IVX9 U68 ( .A(data_in[18]), .Z(n15) );
  HS65_LS_IVX9 U69 ( .A(data_in[19]), .Z(n14) );
  HS65_LS_IVX9 U70 ( .A(data_in[20]), .Z(n13) );
  HS65_LS_IVX9 U71 ( .A(data_in[21]), .Z(n12) );
  HS65_LS_IVX9 U72 ( .A(data_in[22]), .Z(n11) );
  HS65_LS_IVX9 U73 ( .A(data_in[23]), .Z(n10) );
  HS65_LS_IVX9 U74 ( .A(data_in[24]), .Z(n9) );
  HS65_LS_IVX9 U75 ( .A(data_in[25]), .Z(n8) );
  HS65_LS_IVX9 U76 ( .A(data_in[26]), .Z(n7) );
  HS65_LS_IVX9 U77 ( .A(data_in[27]), .Z(n6) );
  HS65_LS_IVX9 U78 ( .A(data_in[28]), .Z(n5) );
  HS65_LS_IVX9 U79 ( .A(data_in[29]), .Z(n4) );
  HS65_LS_IVX9 U80 ( .A(data_in[30]), .Z(n3) );
  HS65_LS_IVX9 U81 ( .A(data_in[31]), .Z(n2) );
  HS65_LS_NOR2X6 U82 ( .A(data_in[0]), .B(n35), .Z(N14) );
  HS65_LS_NOR2AX3 U83 ( .A(data_valid), .B(data_in[32]), .Z(N16) );
endmodule


module sr_latch_0_1 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X27 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_1 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_1 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_OAI12X18 U4 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_1 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, N0, n2;
  assign Rout = Aout;
  assign lt_en = N0;

  c_gate_0_1 gate ( .preset(preset), .a(n2), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 I_0 ( .A(Aout), .Z(N0) );
  HS65_LS_IVX9 U1 ( .A(Ain), .Z(n2) );
endmodule


module channel_latch_1_xxxxxxxxx_1 ( preset, .left_in({\left_in[REQ] , 
        \left_in[DATA][33] , \left_in[DATA][32] , \left_in[DATA][31] , 
        \left_in[DATA][30] , \left_in[DATA][29] , \left_in[DATA][28] , 
        \left_in[DATA][27] , \left_in[DATA][26] , \left_in[DATA][25] , 
        \left_in[DATA][24] , \left_in[DATA][23] , \left_in[DATA][22] , 
        \left_in[DATA][21] , \left_in[DATA][20] , \left_in[DATA][19] , 
        \left_in[DATA][18] , \left_in[DATA][17] , \left_in[DATA][16] , 
        \left_in[DATA][15] , \left_in[DATA][14] , \left_in[DATA][13] , 
        \left_in[DATA][12] , \left_in[DATA][11] , \left_in[DATA][10] , 
        \left_in[DATA][9] , \left_in[DATA][8] , \left_in[DATA][7] , 
        \left_in[DATA][6] , \left_in[DATA][5] , \left_in[DATA][4] , 
        \left_in[DATA][3] , \left_in[DATA][2] , \left_in[DATA][1] , 
        \left_in[DATA][0] }), .left_out(\left_out[ACK] ), .right_out({
        \right_out[REQ] , \right_out[DATA][33] , \right_out[DATA][32] , 
        \right_out[DATA][31] , \right_out[DATA][30] , \right_out[DATA][29] , 
        \right_out[DATA][28] , \right_out[DATA][27] , \right_out[DATA][26] , 
        \right_out[DATA][25] , \right_out[DATA][24] , \right_out[DATA][23] , 
        \right_out[DATA][22] , \right_out[DATA][21] , \right_out[DATA][20] , 
        \right_out[DATA][19] , \right_out[DATA][18] , \right_out[DATA][17] , 
        \right_out[DATA][16] , \right_out[DATA][15] , \right_out[DATA][14] , 
        \right_out[DATA][13] , \right_out[DATA][12] , \right_out[DATA][11] , 
        \right_out[DATA][10] , \right_out[DATA][9] , \right_out[DATA][8] , 
        \right_out[DATA][7] , \right_out[DATA][6] , \right_out[DATA][5] , 
        \right_out[DATA][4] , \right_out[DATA][3] , \right_out[DATA][2] , 
        \right_out[DATA][1] , \right_out[DATA][0] }), .right_in(
        \right_in[ACK] ) );
  input preset, \left_in[REQ] , \left_in[DATA][33] , \left_in[DATA][32] ,
         \left_in[DATA][31] , \left_in[DATA][30] , \left_in[DATA][29] ,
         \left_in[DATA][28] , \left_in[DATA][27] , \left_in[DATA][26] ,
         \left_in[DATA][25] , \left_in[DATA][24] , \left_in[DATA][23] ,
         \left_in[DATA][22] , \left_in[DATA][21] , \left_in[DATA][20] ,
         \left_in[DATA][19] , \left_in[DATA][18] , \left_in[DATA][17] ,
         \left_in[DATA][16] , \left_in[DATA][15] , \left_in[DATA][14] ,
         \left_in[DATA][13] , \left_in[DATA][12] , \left_in[DATA][11] ,
         \left_in[DATA][10] , \left_in[DATA][9] , \left_in[DATA][8] ,
         \left_in[DATA][7] , \left_in[DATA][6] , \left_in[DATA][5] ,
         \left_in[DATA][4] , \left_in[DATA][3] , \left_in[DATA][2] ,
         \left_in[DATA][1] , \left_in[DATA][0] , \right_in[ACK] ;
  output \left_out[ACK] , \right_out[REQ] , \right_out[DATA][33] ,
         \right_out[DATA][32] , \right_out[DATA][31] , \right_out[DATA][30] ,
         \right_out[DATA][29] , \right_out[DATA][28] , \right_out[DATA][27] ,
         \right_out[DATA][26] , \right_out[DATA][25] , \right_out[DATA][24] ,
         \right_out[DATA][23] , \right_out[DATA][22] , \right_out[DATA][21] ,
         \right_out[DATA][20] , \right_out[DATA][19] , \right_out[DATA][18] ,
         \right_out[DATA][17] , \right_out[DATA][16] , \right_out[DATA][15] ,
         \right_out[DATA][14] , \right_out[DATA][13] , \right_out[DATA][12] ,
         \right_out[DATA][11] , \right_out[DATA][10] , \right_out[DATA][9] ,
         \right_out[DATA][8] , \right_out[DATA][7] , \right_out[DATA][6] ,
         \right_out[DATA][5] , \right_out[DATA][4] , \right_out[DATA][3] ,
         \right_out[DATA][2] , \right_out[DATA][1] , \right_out[DATA][0] ;
  wire   lt_en, N3;

  latch_controller_1_1 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LH_LDHQX4 \data_reg[33]  ( .G(N3), .D(\left_in[DATA][33] ), .Q(
        \right_out[DATA][33] ) );
  HS65_LS_LDHQX9 \data_reg[32]  ( .G(N3), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N3), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N3), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N3), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N3), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N3), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N3), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N3), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N3), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N3), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N3), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N3), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N3), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N3), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N3), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N3), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N3), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N3), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N3), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N3), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX9 \data_reg[12]  ( .G(N3), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N3), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N3), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N3), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N3), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N3), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N3), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N3), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N3), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N3), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N3), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N3), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N3), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LS_OR2X9 U3 ( .A(lt_en), .B(preset), .Z(N3) );
endmodule


module hpu_1_x ( preset, .chan_in_f({\chan_in_f[REQ] , \chan_in_f[DATA][33] , 
        \chan_in_f[DATA][32] , \chan_in_f[DATA][31] , \chan_in_f[DATA][30] , 
        \chan_in_f[DATA][29] , \chan_in_f[DATA][28] , \chan_in_f[DATA][27] , 
        \chan_in_f[DATA][26] , \chan_in_f[DATA][25] , \chan_in_f[DATA][24] , 
        \chan_in_f[DATA][23] , \chan_in_f[DATA][22] , \chan_in_f[DATA][21] , 
        \chan_in_f[DATA][20] , \chan_in_f[DATA][19] , \chan_in_f[DATA][18] , 
        \chan_in_f[DATA][17] , \chan_in_f[DATA][16] , \chan_in_f[DATA][15] , 
        \chan_in_f[DATA][14] , \chan_in_f[DATA][13] , \chan_in_f[DATA][12] , 
        \chan_in_f[DATA][11] , \chan_in_f[DATA][10] , \chan_in_f[DATA][9] , 
        \chan_in_f[DATA][8] , \chan_in_f[DATA][7] , \chan_in_f[DATA][6] , 
        \chan_in_f[DATA][5] , \chan_in_f[DATA][4] , \chan_in_f[DATA][3] , 
        \chan_in_f[DATA][2] , \chan_in_f[DATA][1] , \chan_in_f[DATA][0] }), 
    .chan_in_b(\chan_in_b[ACK] ), .chan_out_f({\chan_out_f[REQ] , 
        \chan_out_f[DATA][33] , \chan_out_f[DATA][32] , \chan_out_f[DATA][31] , 
        \chan_out_f[DATA][30] , \chan_out_f[DATA][29] , \chan_out_f[DATA][28] , 
        \chan_out_f[DATA][27] , \chan_out_f[DATA][26] , \chan_out_f[DATA][25] , 
        \chan_out_f[DATA][24] , \chan_out_f[DATA][23] , \chan_out_f[DATA][22] , 
        \chan_out_f[DATA][21] , \chan_out_f[DATA][20] , \chan_out_f[DATA][19] , 
        \chan_out_f[DATA][18] , \chan_out_f[DATA][17] , \chan_out_f[DATA][16] , 
        \chan_out_f[DATA][15] , \chan_out_f[DATA][14] , \chan_out_f[DATA][13] , 
        \chan_out_f[DATA][12] , \chan_out_f[DATA][11] , \chan_out_f[DATA][10] , 
        \chan_out_f[DATA][9] , \chan_out_f[DATA][8] , \chan_out_f[DATA][7] , 
        \chan_out_f[DATA][6] , \chan_out_f[DATA][5] , \chan_out_f[DATA][4] , 
        \chan_out_f[DATA][3] , \chan_out_f[DATA][2] , \chan_out_f[DATA][1] , 
        \chan_out_f[DATA][0] }), .chan_out_b(\chan_out_b[ACK] ), sel );
  output [4:0] sel;
  input preset, \chan_in_f[REQ] , \chan_in_f[DATA][33] , \chan_in_f[DATA][32] ,
         \chan_in_f[DATA][31] , \chan_in_f[DATA][30] , \chan_in_f[DATA][29] ,
         \chan_in_f[DATA][28] , \chan_in_f[DATA][27] , \chan_in_f[DATA][26] ,
         \chan_in_f[DATA][25] , \chan_in_f[DATA][24] , \chan_in_f[DATA][23] ,
         \chan_in_f[DATA][22] , \chan_in_f[DATA][21] , \chan_in_f[DATA][20] ,
         \chan_in_f[DATA][19] , \chan_in_f[DATA][18] , \chan_in_f[DATA][17] ,
         \chan_in_f[DATA][16] , \chan_in_f[DATA][15] , \chan_in_f[DATA][14] ,
         \chan_in_f[DATA][13] , \chan_in_f[DATA][12] , \chan_in_f[DATA][11] ,
         \chan_in_f[DATA][10] , \chan_in_f[DATA][9] , \chan_in_f[DATA][8] ,
         \chan_in_f[DATA][7] , \chan_in_f[DATA][6] , \chan_in_f[DATA][5] ,
         \chan_in_f[DATA][4] , \chan_in_f[DATA][3] , \chan_in_f[DATA][2] ,
         \chan_in_f[DATA][1] , \chan_in_f[DATA][0] , \chan_out_b[ACK] ;
  output \chan_in_b[ACK] , \chan_out_f[REQ] , \chan_out_f[DATA][33] ,
         \chan_out_f[DATA][32] , \chan_out_f[DATA][31] ,
         \chan_out_f[DATA][30] , \chan_out_f[DATA][29] ,
         \chan_out_f[DATA][28] , \chan_out_f[DATA][27] ,
         \chan_out_f[DATA][26] , \chan_out_f[DATA][25] ,
         \chan_out_f[DATA][24] , \chan_out_f[DATA][23] ,
         \chan_out_f[DATA][22] , \chan_out_f[DATA][21] ,
         \chan_out_f[DATA][20] , \chan_out_f[DATA][19] ,
         \chan_out_f[DATA][18] , \chan_out_f[DATA][17] ,
         \chan_out_f[DATA][16] , \chan_out_f[DATA][15] ,
         \chan_out_f[DATA][14] , \chan_out_f[DATA][13] ,
         \chan_out_f[DATA][12] , \chan_out_f[DATA][11] ,
         \chan_out_f[DATA][10] , \chan_out_f[DATA][9] , \chan_out_f[DATA][8] ,
         \chan_out_f[DATA][7] , \chan_out_f[DATA][6] , \chan_out_f[DATA][5] ,
         \chan_out_f[DATA][4] , \chan_out_f[DATA][3] , \chan_out_f[DATA][2] ,
         \chan_out_f[DATA][1] , \chan_out_f[DATA][0] ;
  wire   data_in_valid, req_n, \chan_internal_f[DATA][33] ,
         \chan_internal_f[DATA][32] , \chan_internal_f[DATA][31] ,
         \chan_internal_f[DATA][30] , \chan_internal_f[DATA][29] ,
         \chan_internal_f[DATA][28] , \chan_internal_f[DATA][27] ,
         \chan_internal_f[DATA][26] , \chan_internal_f[DATA][25] ,
         \chan_internal_f[DATA][24] , \chan_internal_f[DATA][23] ,
         \chan_internal_f[DATA][22] , \chan_internal_f[DATA][21] ,
         \chan_internal_f[DATA][20] , \chan_internal_f[DATA][19] ,
         \chan_internal_f[DATA][18] , \chan_internal_f[DATA][17] ,
         \chan_internal_f[DATA][16] , \chan_internal_f[DATA][15] ,
         \chan_internal_f[DATA][14] , \chan_internal_f[DATA][13] ,
         \chan_internal_f[DATA][12] , \chan_internal_f[DATA][11] ,
         \chan_internal_f[DATA][10] , \chan_internal_f[DATA][9] ,
         \chan_internal_f[DATA][8] , \chan_internal_f[DATA][7] ,
         \chan_internal_f[DATA][6] , \chan_internal_f[DATA][5] ,
         \chan_internal_f[DATA][4] , \chan_internal_f[DATA][3] ,
         \chan_internal_f[DATA][2] , \chan_internal_f[DATA][1] ,
         \chan_internal_f[DATA][0] , N0, n1;

  hpu_comb_1_x hpu_combinatorial ( .data_valid(data_in_valid), .data_in({
        \chan_in_f[DATA][33] , \chan_in_f[DATA][32] , \chan_in_f[DATA][31] , 
        \chan_in_f[DATA][30] , \chan_in_f[DATA][29] , \chan_in_f[DATA][28] , 
        \chan_in_f[DATA][27] , \chan_in_f[DATA][26] , \chan_in_f[DATA][25] , 
        \chan_in_f[DATA][24] , \chan_in_f[DATA][23] , \chan_in_f[DATA][22] , 
        \chan_in_f[DATA][21] , \chan_in_f[DATA][20] , \chan_in_f[DATA][19] , 
        \chan_in_f[DATA][18] , \chan_in_f[DATA][17] , \chan_in_f[DATA][16] , 
        \chan_in_f[DATA][15] , \chan_in_f[DATA][14] , \chan_in_f[DATA][13] , 
        \chan_in_f[DATA][12] , \chan_in_f[DATA][11] , \chan_in_f[DATA][10] , 
        \chan_in_f[DATA][9] , \chan_in_f[DATA][8] , \chan_in_f[DATA][7] , 
        \chan_in_f[DATA][6] , \chan_in_f[DATA][5] , \chan_in_f[DATA][4] , 
        \chan_in_f[DATA][3] , \chan_in_f[DATA][2] , \chan_in_f[DATA][1] , 
        \chan_in_f[DATA][0] }), .data_out({\chan_internal_f[DATA][33] , 
        \chan_internal_f[DATA][32] , \chan_internal_f[DATA][31] , 
        \chan_internal_f[DATA][30] , \chan_internal_f[DATA][29] , 
        \chan_internal_f[DATA][28] , \chan_internal_f[DATA][27] , 
        \chan_internal_f[DATA][26] , \chan_internal_f[DATA][25] , 
        \chan_internal_f[DATA][24] , \chan_internal_f[DATA][23] , 
        \chan_internal_f[DATA][22] , \chan_internal_f[DATA][21] , 
        \chan_internal_f[DATA][20] , \chan_internal_f[DATA][19] , 
        \chan_internal_f[DATA][18] , \chan_internal_f[DATA][17] , 
        \chan_internal_f[DATA][16] , \chan_internal_f[DATA][15] , 
        \chan_internal_f[DATA][14] , \chan_internal_f[DATA][13] , 
        \chan_internal_f[DATA][12] , \chan_internal_f[DATA][11] , 
        \chan_internal_f[DATA][10] , \chan_internal_f[DATA][9] , 
        \chan_internal_f[DATA][8] , \chan_internal_f[DATA][7] , 
        \chan_internal_f[DATA][6] , \chan_internal_f[DATA][5] , 
        \chan_internal_f[DATA][4] , \chan_internal_f[DATA][3] , 
        \chan_internal_f[DATA][2] , \chan_internal_f[DATA][1] , 
        \chan_internal_f[DATA][0] }), .sel(sel) );
  channel_latch_1_xxxxxxxxx_1 token_latch ( .preset(preset), .left_in({n1, 
        \chan_internal_f[DATA][33] , \chan_internal_f[DATA][32] , 
        \chan_internal_f[DATA][31] , \chan_internal_f[DATA][30] , 
        \chan_internal_f[DATA][29] , \chan_internal_f[DATA][28] , 
        \chan_internal_f[DATA][27] , \chan_internal_f[DATA][26] , 
        \chan_internal_f[DATA][25] , \chan_internal_f[DATA][24] , 
        \chan_internal_f[DATA][23] , \chan_internal_f[DATA][22] , 
        \chan_internal_f[DATA][21] , \chan_internal_f[DATA][20] , 
        \chan_internal_f[DATA][19] , \chan_internal_f[DATA][18] , 
        \chan_internal_f[DATA][17] , \chan_internal_f[DATA][16] , 
        \chan_internal_f[DATA][15] , \chan_internal_f[DATA][14] , 
        \chan_internal_f[DATA][13] , \chan_internal_f[DATA][12] , 
        \chan_internal_f[DATA][11] , \chan_internal_f[DATA][10] , 
        \chan_internal_f[DATA][9] , \chan_internal_f[DATA][8] , 
        \chan_internal_f[DATA][7] , \chan_internal_f[DATA][6] , 
        \chan_internal_f[DATA][5] , \chan_internal_f[DATA][4] , 
        \chan_internal_f[DATA][3] , \chan_internal_f[DATA][2] , 
        \chan_internal_f[DATA][1] , \chan_internal_f[DATA][0] }), .left_out(
        \chan_in_b[ACK] ), .right_out({\chan_out_f[REQ] , 
        \chan_out_f[DATA][33] , \chan_out_f[DATA][32] , \chan_out_f[DATA][31] , 
        \chan_out_f[DATA][30] , \chan_out_f[DATA][29] , \chan_out_f[DATA][28] , 
        \chan_out_f[DATA][27] , \chan_out_f[DATA][26] , \chan_out_f[DATA][25] , 
        \chan_out_f[DATA][24] , \chan_out_f[DATA][23] , \chan_out_f[DATA][22] , 
        \chan_out_f[DATA][21] , \chan_out_f[DATA][20] , \chan_out_f[DATA][19] , 
        \chan_out_f[DATA][18] , \chan_out_f[DATA][17] , \chan_out_f[DATA][16] , 
        \chan_out_f[DATA][15] , \chan_out_f[DATA][14] , \chan_out_f[DATA][13] , 
        \chan_out_f[DATA][12] , \chan_out_f[DATA][11] , \chan_out_f[DATA][10] , 
        \chan_out_f[DATA][9] , \chan_out_f[DATA][8] , \chan_out_f[DATA][7] , 
        \chan_out_f[DATA][6] , \chan_out_f[DATA][5] , \chan_out_f[DATA][4] , 
        \chan_out_f[DATA][3] , \chan_out_f[DATA][2] , \chan_out_f[DATA][1] , 
        \chan_out_f[DATA][0] }), .right_in(\chan_out_b[ACK] ) );
  HS65_LS_IVX9 I_1 ( .A(\chan_in_f[REQ] ), .Z(req_n) );
  HS65_LS_IVX9 I_0 ( .A(\chan_in_b[ACK] ), .Z(N0) );
  HS65_LS_AND2X4 U1 ( .A(\chan_in_f[REQ] ), .B(N0), .Z(data_in_valid) );
  HS65_LS_IVX9 U2 ( .A(req_n), .Z(n1) );
endmodule


module sr_latch_0_7 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X27 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_generic_0_5_0 ( preset, \input , \output  );
  input [4:0] \input ;
  input preset;
  output \output ;
  wire   set, reset, n2, n3, n1;

  sr_latch_0_7 latch ( .s(set), .r(reset), .q(\output ) );
  HS65_LS_OAI13X15 U5 ( .A(n3), .B(\input [1]), .C(\input [0]), .D(n1), .Z(
        reset) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OR3X9 U4 ( .A(\input [3]), .B(\input [4]), .C(\input [2]), .Z(n3) );
  HS65_LS_NOR4ABX2 U6 ( .A(\input [0]), .B(\input [1]), .C(n2), .D(preset), 
        .Z(set) );
  HS65_LS_NAND3X5 U7 ( .A(\input [3]), .B(\input [2]), .C(\input [4]), .Z(n2)
         );
endmodule


module sr_latch_0_6 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X27 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_generic_0_5_1 ( preset, \input , \output  );
  input [4:0] \input ;
  input preset;
  output \output ;
  wire   set, reset, n1, n4, n5;

  sr_latch_0_6 latch ( .s(set), .r(reset), .q(\output ) );
  HS65_LS_OAI31X5 U3 ( .A(n4), .B(\input [1]), .C(\input [0]), .D(n1), .Z(
        reset) );
  HS65_LS_IVX9 U4 ( .A(preset), .Z(n1) );
  HS65_LS_OR3X9 U5 ( .A(\input [3]), .B(\input [4]), .C(\input [2]), .Z(n4) );
  HS65_LS_NOR4ABX2 U6 ( .A(\input [0]), .B(\input [1]), .C(n5), .D(preset), 
        .Z(set) );
  HS65_LS_NAND3X5 U7 ( .A(\input [3]), .B(\input [2]), .C(\input [4]), .Z(n5)
         );
endmodule


module crossbar_1_0_0 ( preset, .switch_sel({\switch_sel[4][4] , 
        \switch_sel[4][3] , \switch_sel[4][2] , \switch_sel[4][1] , 
        \switch_sel[4][0] , \switch_sel[3][4] , \switch_sel[3][3] , 
        \switch_sel[3][2] , \switch_sel[3][1] , \switch_sel[3][0] , 
        \switch_sel[2][4] , \switch_sel[2][3] , \switch_sel[2][2] , 
        \switch_sel[2][1] , \switch_sel[2][0] , \switch_sel[1][4] , 
        \switch_sel[1][3] , \switch_sel[1][2] , \switch_sel[1][1] , 
        \switch_sel[1][0] , \switch_sel[0][4] , \switch_sel[0][3] , 
        \switch_sel[0][2] , \switch_sel[0][1] , \switch_sel[0][0] }), 
    .chs_in_f({\chs_in_f[4][REQ] , \chs_in_f[4][DATA][33] , 
        \chs_in_f[4][DATA][32] , \chs_in_f[4][DATA][31] , 
        \chs_in_f[4][DATA][30] , \chs_in_f[4][DATA][29] , 
        \chs_in_f[4][DATA][28] , \chs_in_f[4][DATA][27] , 
        \chs_in_f[4][DATA][26] , \chs_in_f[4][DATA][25] , 
        \chs_in_f[4][DATA][24] , \chs_in_f[4][DATA][23] , 
        \chs_in_f[4][DATA][22] , \chs_in_f[4][DATA][21] , 
        \chs_in_f[4][DATA][20] , \chs_in_f[4][DATA][19] , 
        \chs_in_f[4][DATA][18] , \chs_in_f[4][DATA][17] , 
        \chs_in_f[4][DATA][16] , \chs_in_f[4][DATA][15] , 
        \chs_in_f[4][DATA][14] , \chs_in_f[4][DATA][13] , 
        \chs_in_f[4][DATA][12] , \chs_in_f[4][DATA][11] , 
        \chs_in_f[4][DATA][10] , \chs_in_f[4][DATA][9] , 
        \chs_in_f[4][DATA][8] , \chs_in_f[4][DATA][7] , \chs_in_f[4][DATA][6] , 
        \chs_in_f[4][DATA][5] , \chs_in_f[4][DATA][4] , \chs_in_f[4][DATA][3] , 
        \chs_in_f[4][DATA][2] , \chs_in_f[4][DATA][1] , \chs_in_f[4][DATA][0] , 
        \chs_in_f[3][REQ] , \chs_in_f[3][DATA][33] , \chs_in_f[3][DATA][32] , 
        \chs_in_f[3][DATA][31] , \chs_in_f[3][DATA][30] , 
        \chs_in_f[3][DATA][29] , \chs_in_f[3][DATA][28] , 
        \chs_in_f[3][DATA][27] , \chs_in_f[3][DATA][26] , 
        \chs_in_f[3][DATA][25] , \chs_in_f[3][DATA][24] , 
        \chs_in_f[3][DATA][23] , \chs_in_f[3][DATA][22] , 
        \chs_in_f[3][DATA][21] , \chs_in_f[3][DATA][20] , 
        \chs_in_f[3][DATA][19] , \chs_in_f[3][DATA][18] , 
        \chs_in_f[3][DATA][17] , \chs_in_f[3][DATA][16] , 
        \chs_in_f[3][DATA][15] , \chs_in_f[3][DATA][14] , 
        \chs_in_f[3][DATA][13] , \chs_in_f[3][DATA][12] , 
        \chs_in_f[3][DATA][11] , \chs_in_f[3][DATA][10] , 
        \chs_in_f[3][DATA][9] , \chs_in_f[3][DATA][8] , \chs_in_f[3][DATA][7] , 
        \chs_in_f[3][DATA][6] , \chs_in_f[3][DATA][5] , \chs_in_f[3][DATA][4] , 
        \chs_in_f[3][DATA][3] , \chs_in_f[3][DATA][2] , \chs_in_f[3][DATA][1] , 
        \chs_in_f[3][DATA][0] , \chs_in_f[2][REQ] , \chs_in_f[2][DATA][33] , 
        \chs_in_f[2][DATA][32] , \chs_in_f[2][DATA][31] , 
        \chs_in_f[2][DATA][30] , \chs_in_f[2][DATA][29] , 
        \chs_in_f[2][DATA][28] , \chs_in_f[2][DATA][27] , 
        \chs_in_f[2][DATA][26] , \chs_in_f[2][DATA][25] , 
        \chs_in_f[2][DATA][24] , \chs_in_f[2][DATA][23] , 
        \chs_in_f[2][DATA][22] , \chs_in_f[2][DATA][21] , 
        \chs_in_f[2][DATA][20] , \chs_in_f[2][DATA][19] , 
        \chs_in_f[2][DATA][18] , \chs_in_f[2][DATA][17] , 
        \chs_in_f[2][DATA][16] , \chs_in_f[2][DATA][15] , 
        \chs_in_f[2][DATA][14] , \chs_in_f[2][DATA][13] , 
        \chs_in_f[2][DATA][12] , \chs_in_f[2][DATA][11] , 
        \chs_in_f[2][DATA][10] , \chs_in_f[2][DATA][9] , 
        \chs_in_f[2][DATA][8] , \chs_in_f[2][DATA][7] , \chs_in_f[2][DATA][6] , 
        \chs_in_f[2][DATA][5] , \chs_in_f[2][DATA][4] , \chs_in_f[2][DATA][3] , 
        \chs_in_f[2][DATA][2] , \chs_in_f[2][DATA][1] , \chs_in_f[2][DATA][0] , 
        \chs_in_f[1][REQ] , \chs_in_f[1][DATA][33] , \chs_in_f[1][DATA][32] , 
        \chs_in_f[1][DATA][31] , \chs_in_f[1][DATA][30] , 
        \chs_in_f[1][DATA][29] , \chs_in_f[1][DATA][28] , 
        \chs_in_f[1][DATA][27] , \chs_in_f[1][DATA][26] , 
        \chs_in_f[1][DATA][25] , \chs_in_f[1][DATA][24] , 
        \chs_in_f[1][DATA][23] , \chs_in_f[1][DATA][22] , 
        \chs_in_f[1][DATA][21] , \chs_in_f[1][DATA][20] , 
        \chs_in_f[1][DATA][19] , \chs_in_f[1][DATA][18] , 
        \chs_in_f[1][DATA][17] , \chs_in_f[1][DATA][16] , 
        \chs_in_f[1][DATA][15] , \chs_in_f[1][DATA][14] , 
        \chs_in_f[1][DATA][13] , \chs_in_f[1][DATA][12] , 
        \chs_in_f[1][DATA][11] , \chs_in_f[1][DATA][10] , 
        \chs_in_f[1][DATA][9] , \chs_in_f[1][DATA][8] , \chs_in_f[1][DATA][7] , 
        \chs_in_f[1][DATA][6] , \chs_in_f[1][DATA][5] , \chs_in_f[1][DATA][4] , 
        \chs_in_f[1][DATA][3] , \chs_in_f[1][DATA][2] , \chs_in_f[1][DATA][1] , 
        \chs_in_f[1][DATA][0] , \chs_in_f[0][REQ] , \chs_in_f[0][DATA][33] , 
        \chs_in_f[0][DATA][32] , \chs_in_f[0][DATA][31] , 
        \chs_in_f[0][DATA][30] , \chs_in_f[0][DATA][29] , 
        \chs_in_f[0][DATA][28] , \chs_in_f[0][DATA][27] , 
        \chs_in_f[0][DATA][26] , \chs_in_f[0][DATA][25] , 
        \chs_in_f[0][DATA][24] , \chs_in_f[0][DATA][23] , 
        \chs_in_f[0][DATA][22] , \chs_in_f[0][DATA][21] , 
        \chs_in_f[0][DATA][20] , \chs_in_f[0][DATA][19] , 
        \chs_in_f[0][DATA][18] , \chs_in_f[0][DATA][17] , 
        \chs_in_f[0][DATA][16] , \chs_in_f[0][DATA][15] , 
        \chs_in_f[0][DATA][14] , \chs_in_f[0][DATA][13] , 
        \chs_in_f[0][DATA][12] , \chs_in_f[0][DATA][11] , 
        \chs_in_f[0][DATA][10] , \chs_in_f[0][DATA][9] , 
        \chs_in_f[0][DATA][8] , \chs_in_f[0][DATA][7] , \chs_in_f[0][DATA][6] , 
        \chs_in_f[0][DATA][5] , \chs_in_f[0][DATA][4] , \chs_in_f[0][DATA][3] , 
        \chs_in_f[0][DATA][2] , \chs_in_f[0][DATA][1] , \chs_in_f[0][DATA][0] 
        }), .chs_in_b({\chs_in_b[4][ACK] , \chs_in_b[3][ACK] , 
        \chs_in_b[2][ACK] , \chs_in_b[1][ACK] , \chs_in_b[0][ACK] }), 
    .chs_out_f({\chs_out_f[4][REQ] , \chs_out_f[4][DATA][33] , 
        \chs_out_f[4][DATA][32] , \chs_out_f[4][DATA][31] , 
        \chs_out_f[4][DATA][30] , \chs_out_f[4][DATA][29] , 
        \chs_out_f[4][DATA][28] , \chs_out_f[4][DATA][27] , 
        \chs_out_f[4][DATA][26] , \chs_out_f[4][DATA][25] , 
        \chs_out_f[4][DATA][24] , \chs_out_f[4][DATA][23] , 
        \chs_out_f[4][DATA][22] , \chs_out_f[4][DATA][21] , 
        \chs_out_f[4][DATA][20] , \chs_out_f[4][DATA][19] , 
        \chs_out_f[4][DATA][18] , \chs_out_f[4][DATA][17] , 
        \chs_out_f[4][DATA][16] , \chs_out_f[4][DATA][15] , 
        \chs_out_f[4][DATA][14] , \chs_out_f[4][DATA][13] , 
        \chs_out_f[4][DATA][12] , \chs_out_f[4][DATA][11] , 
        \chs_out_f[4][DATA][10] , \chs_out_f[4][DATA][9] , 
        \chs_out_f[4][DATA][8] , \chs_out_f[4][DATA][7] , 
        \chs_out_f[4][DATA][6] , \chs_out_f[4][DATA][5] , 
        \chs_out_f[4][DATA][4] , \chs_out_f[4][DATA][3] , 
        \chs_out_f[4][DATA][2] , \chs_out_f[4][DATA][1] , 
        \chs_out_f[4][DATA][0] , \chs_out_f[3][REQ] , \chs_out_f[3][DATA][33] , 
        \chs_out_f[3][DATA][32] , \chs_out_f[3][DATA][31] , 
        \chs_out_f[3][DATA][30] , \chs_out_f[3][DATA][29] , 
        \chs_out_f[3][DATA][28] , \chs_out_f[3][DATA][27] , 
        \chs_out_f[3][DATA][26] , \chs_out_f[3][DATA][25] , 
        \chs_out_f[3][DATA][24] , \chs_out_f[3][DATA][23] , 
        \chs_out_f[3][DATA][22] , \chs_out_f[3][DATA][21] , 
        \chs_out_f[3][DATA][20] , \chs_out_f[3][DATA][19] , 
        \chs_out_f[3][DATA][18] , \chs_out_f[3][DATA][17] , 
        \chs_out_f[3][DATA][16] , \chs_out_f[3][DATA][15] , 
        \chs_out_f[3][DATA][14] , \chs_out_f[3][DATA][13] , 
        \chs_out_f[3][DATA][12] , \chs_out_f[3][DATA][11] , 
        \chs_out_f[3][DATA][10] , \chs_out_f[3][DATA][9] , 
        \chs_out_f[3][DATA][8] , \chs_out_f[3][DATA][7] , 
        \chs_out_f[3][DATA][6] , \chs_out_f[3][DATA][5] , 
        \chs_out_f[3][DATA][4] , \chs_out_f[3][DATA][3] , 
        \chs_out_f[3][DATA][2] , \chs_out_f[3][DATA][1] , 
        \chs_out_f[3][DATA][0] , \chs_out_f[2][REQ] , \chs_out_f[2][DATA][33] , 
        \chs_out_f[2][DATA][32] , \chs_out_f[2][DATA][31] , 
        \chs_out_f[2][DATA][30] , \chs_out_f[2][DATA][29] , 
        \chs_out_f[2][DATA][28] , \chs_out_f[2][DATA][27] , 
        \chs_out_f[2][DATA][26] , \chs_out_f[2][DATA][25] , 
        \chs_out_f[2][DATA][24] , \chs_out_f[2][DATA][23] , 
        \chs_out_f[2][DATA][22] , \chs_out_f[2][DATA][21] , 
        \chs_out_f[2][DATA][20] , \chs_out_f[2][DATA][19] , 
        \chs_out_f[2][DATA][18] , \chs_out_f[2][DATA][17] , 
        \chs_out_f[2][DATA][16] , \chs_out_f[2][DATA][15] , 
        \chs_out_f[2][DATA][14] , \chs_out_f[2][DATA][13] , 
        \chs_out_f[2][DATA][12] , \chs_out_f[2][DATA][11] , 
        \chs_out_f[2][DATA][10] , \chs_out_f[2][DATA][9] , 
        \chs_out_f[2][DATA][8] , \chs_out_f[2][DATA][7] , 
        \chs_out_f[2][DATA][6] , \chs_out_f[2][DATA][5] , 
        \chs_out_f[2][DATA][4] , \chs_out_f[2][DATA][3] , 
        \chs_out_f[2][DATA][2] , \chs_out_f[2][DATA][1] , 
        \chs_out_f[2][DATA][0] , \chs_out_f[1][REQ] , \chs_out_f[1][DATA][33] , 
        \chs_out_f[1][DATA][32] , \chs_out_f[1][DATA][31] , 
        \chs_out_f[1][DATA][30] , \chs_out_f[1][DATA][29] , 
        \chs_out_f[1][DATA][28] , \chs_out_f[1][DATA][27] , 
        \chs_out_f[1][DATA][26] , \chs_out_f[1][DATA][25] , 
        \chs_out_f[1][DATA][24] , \chs_out_f[1][DATA][23] , 
        \chs_out_f[1][DATA][22] , \chs_out_f[1][DATA][21] , 
        \chs_out_f[1][DATA][20] , \chs_out_f[1][DATA][19] , 
        \chs_out_f[1][DATA][18] , \chs_out_f[1][DATA][17] , 
        \chs_out_f[1][DATA][16] , \chs_out_f[1][DATA][15] , 
        \chs_out_f[1][DATA][14] , \chs_out_f[1][DATA][13] , 
        \chs_out_f[1][DATA][12] , \chs_out_f[1][DATA][11] , 
        \chs_out_f[1][DATA][10] , \chs_out_f[1][DATA][9] , 
        \chs_out_f[1][DATA][8] , \chs_out_f[1][DATA][7] , 
        \chs_out_f[1][DATA][6] , \chs_out_f[1][DATA][5] , 
        \chs_out_f[1][DATA][4] , \chs_out_f[1][DATA][3] , 
        \chs_out_f[1][DATA][2] , \chs_out_f[1][DATA][1] , 
        \chs_out_f[1][DATA][0] , \chs_out_f[0][REQ] , \chs_out_f[0][DATA][33] , 
        \chs_out_f[0][DATA][32] , \chs_out_f[0][DATA][31] , 
        \chs_out_f[0][DATA][30] , \chs_out_f[0][DATA][29] , 
        \chs_out_f[0][DATA][28] , \chs_out_f[0][DATA][27] , 
        \chs_out_f[0][DATA][26] , \chs_out_f[0][DATA][25] , 
        \chs_out_f[0][DATA][24] , \chs_out_f[0][DATA][23] , 
        \chs_out_f[0][DATA][22] , \chs_out_f[0][DATA][21] , 
        \chs_out_f[0][DATA][20] , \chs_out_f[0][DATA][19] , 
        \chs_out_f[0][DATA][18] , \chs_out_f[0][DATA][17] , 
        \chs_out_f[0][DATA][16] , \chs_out_f[0][DATA][15] , 
        \chs_out_f[0][DATA][14] , \chs_out_f[0][DATA][13] , 
        \chs_out_f[0][DATA][12] , \chs_out_f[0][DATA][11] , 
        \chs_out_f[0][DATA][10] , \chs_out_f[0][DATA][9] , 
        \chs_out_f[0][DATA][8] , \chs_out_f[0][DATA][7] , 
        \chs_out_f[0][DATA][6] , \chs_out_f[0][DATA][5] , 
        \chs_out_f[0][DATA][4] , \chs_out_f[0][DATA][3] , 
        \chs_out_f[0][DATA][2] , \chs_out_f[0][DATA][1] , 
        \chs_out_f[0][DATA][0] }), .chs_out_b({\chs_out_b[4][ACK] , 
        \chs_out_b[3][ACK] , \chs_out_b[2][ACK] , \chs_out_b[1][ACK] , 
        \chs_out_b[0][ACK] }) );
  input preset, \switch_sel[4][4] , \switch_sel[4][3] , \switch_sel[4][2] ,
         \switch_sel[4][1] , \switch_sel[4][0] , \switch_sel[3][4] ,
         \switch_sel[3][3] , \switch_sel[3][2] , \switch_sel[3][1] ,
         \switch_sel[3][0] , \switch_sel[2][4] , \switch_sel[2][3] ,
         \switch_sel[2][2] , \switch_sel[2][1] , \switch_sel[2][0] ,
         \switch_sel[1][4] , \switch_sel[1][3] , \switch_sel[1][2] ,
         \switch_sel[1][1] , \switch_sel[1][0] , \switch_sel[0][4] ,
         \switch_sel[0][3] , \switch_sel[0][2] , \switch_sel[0][1] ,
         \switch_sel[0][0] , \chs_in_f[4][REQ] , \chs_in_f[4][DATA][33] ,
         \chs_in_f[4][DATA][32] , \chs_in_f[4][DATA][31] ,
         \chs_in_f[4][DATA][30] , \chs_in_f[4][DATA][29] ,
         \chs_in_f[4][DATA][28] , \chs_in_f[4][DATA][27] ,
         \chs_in_f[4][DATA][26] , \chs_in_f[4][DATA][25] ,
         \chs_in_f[4][DATA][24] , \chs_in_f[4][DATA][23] ,
         \chs_in_f[4][DATA][22] , \chs_in_f[4][DATA][21] ,
         \chs_in_f[4][DATA][20] , \chs_in_f[4][DATA][19] ,
         \chs_in_f[4][DATA][18] , \chs_in_f[4][DATA][17] ,
         \chs_in_f[4][DATA][16] , \chs_in_f[4][DATA][15] ,
         \chs_in_f[4][DATA][14] , \chs_in_f[4][DATA][13] ,
         \chs_in_f[4][DATA][12] , \chs_in_f[4][DATA][11] ,
         \chs_in_f[4][DATA][10] , \chs_in_f[4][DATA][9] ,
         \chs_in_f[4][DATA][8] , \chs_in_f[4][DATA][7] ,
         \chs_in_f[4][DATA][6] , \chs_in_f[4][DATA][5] ,
         \chs_in_f[4][DATA][4] , \chs_in_f[4][DATA][3] ,
         \chs_in_f[4][DATA][2] , \chs_in_f[4][DATA][1] ,
         \chs_in_f[4][DATA][0] , \chs_in_f[3][REQ] , \chs_in_f[3][DATA][33] ,
         \chs_in_f[3][DATA][32] , \chs_in_f[3][DATA][31] ,
         \chs_in_f[3][DATA][30] , \chs_in_f[3][DATA][29] ,
         \chs_in_f[3][DATA][28] , \chs_in_f[3][DATA][27] ,
         \chs_in_f[3][DATA][26] , \chs_in_f[3][DATA][25] ,
         \chs_in_f[3][DATA][24] , \chs_in_f[3][DATA][23] ,
         \chs_in_f[3][DATA][22] , \chs_in_f[3][DATA][21] ,
         \chs_in_f[3][DATA][20] , \chs_in_f[3][DATA][19] ,
         \chs_in_f[3][DATA][18] , \chs_in_f[3][DATA][17] ,
         \chs_in_f[3][DATA][16] , \chs_in_f[3][DATA][15] ,
         \chs_in_f[3][DATA][14] , \chs_in_f[3][DATA][13] ,
         \chs_in_f[3][DATA][12] , \chs_in_f[3][DATA][11] ,
         \chs_in_f[3][DATA][10] , \chs_in_f[3][DATA][9] ,
         \chs_in_f[3][DATA][8] , \chs_in_f[3][DATA][7] ,
         \chs_in_f[3][DATA][6] , \chs_in_f[3][DATA][5] ,
         \chs_in_f[3][DATA][4] , \chs_in_f[3][DATA][3] ,
         \chs_in_f[3][DATA][2] , \chs_in_f[3][DATA][1] ,
         \chs_in_f[3][DATA][0] , \chs_in_f[2][REQ] , \chs_in_f[2][DATA][33] ,
         \chs_in_f[2][DATA][32] , \chs_in_f[2][DATA][31] ,
         \chs_in_f[2][DATA][30] , \chs_in_f[2][DATA][29] ,
         \chs_in_f[2][DATA][28] , \chs_in_f[2][DATA][27] ,
         \chs_in_f[2][DATA][26] , \chs_in_f[2][DATA][25] ,
         \chs_in_f[2][DATA][24] , \chs_in_f[2][DATA][23] ,
         \chs_in_f[2][DATA][22] , \chs_in_f[2][DATA][21] ,
         \chs_in_f[2][DATA][20] , \chs_in_f[2][DATA][19] ,
         \chs_in_f[2][DATA][18] , \chs_in_f[2][DATA][17] ,
         \chs_in_f[2][DATA][16] , \chs_in_f[2][DATA][15] ,
         \chs_in_f[2][DATA][14] , \chs_in_f[2][DATA][13] ,
         \chs_in_f[2][DATA][12] , \chs_in_f[2][DATA][11] ,
         \chs_in_f[2][DATA][10] , \chs_in_f[2][DATA][9] ,
         \chs_in_f[2][DATA][8] , \chs_in_f[2][DATA][7] ,
         \chs_in_f[2][DATA][6] , \chs_in_f[2][DATA][5] ,
         \chs_in_f[2][DATA][4] , \chs_in_f[2][DATA][3] ,
         \chs_in_f[2][DATA][2] , \chs_in_f[2][DATA][1] ,
         \chs_in_f[2][DATA][0] , \chs_in_f[1][REQ] , \chs_in_f[1][DATA][33] ,
         \chs_in_f[1][DATA][32] , \chs_in_f[1][DATA][31] ,
         \chs_in_f[1][DATA][30] , \chs_in_f[1][DATA][29] ,
         \chs_in_f[1][DATA][28] , \chs_in_f[1][DATA][27] ,
         \chs_in_f[1][DATA][26] , \chs_in_f[1][DATA][25] ,
         \chs_in_f[1][DATA][24] , \chs_in_f[1][DATA][23] ,
         \chs_in_f[1][DATA][22] , \chs_in_f[1][DATA][21] ,
         \chs_in_f[1][DATA][20] , \chs_in_f[1][DATA][19] ,
         \chs_in_f[1][DATA][18] , \chs_in_f[1][DATA][17] ,
         \chs_in_f[1][DATA][16] , \chs_in_f[1][DATA][15] ,
         \chs_in_f[1][DATA][14] , \chs_in_f[1][DATA][13] ,
         \chs_in_f[1][DATA][12] , \chs_in_f[1][DATA][11] ,
         \chs_in_f[1][DATA][10] , \chs_in_f[1][DATA][9] ,
         \chs_in_f[1][DATA][8] , \chs_in_f[1][DATA][7] ,
         \chs_in_f[1][DATA][6] , \chs_in_f[1][DATA][5] ,
         \chs_in_f[1][DATA][4] , \chs_in_f[1][DATA][3] ,
         \chs_in_f[1][DATA][2] , \chs_in_f[1][DATA][1] ,
         \chs_in_f[1][DATA][0] , \chs_in_f[0][REQ] , \chs_in_f[0][DATA][33] ,
         \chs_in_f[0][DATA][32] , \chs_in_f[0][DATA][31] ,
         \chs_in_f[0][DATA][30] , \chs_in_f[0][DATA][29] ,
         \chs_in_f[0][DATA][28] , \chs_in_f[0][DATA][27] ,
         \chs_in_f[0][DATA][26] , \chs_in_f[0][DATA][25] ,
         \chs_in_f[0][DATA][24] , \chs_in_f[0][DATA][23] ,
         \chs_in_f[0][DATA][22] , \chs_in_f[0][DATA][21] ,
         \chs_in_f[0][DATA][20] , \chs_in_f[0][DATA][19] ,
         \chs_in_f[0][DATA][18] , \chs_in_f[0][DATA][17] ,
         \chs_in_f[0][DATA][16] , \chs_in_f[0][DATA][15] ,
         \chs_in_f[0][DATA][14] , \chs_in_f[0][DATA][13] ,
         \chs_in_f[0][DATA][12] , \chs_in_f[0][DATA][11] ,
         \chs_in_f[0][DATA][10] , \chs_in_f[0][DATA][9] ,
         \chs_in_f[0][DATA][8] , \chs_in_f[0][DATA][7] ,
         \chs_in_f[0][DATA][6] , \chs_in_f[0][DATA][5] ,
         \chs_in_f[0][DATA][4] , \chs_in_f[0][DATA][3] ,
         \chs_in_f[0][DATA][2] , \chs_in_f[0][DATA][1] ,
         \chs_in_f[0][DATA][0] , \chs_out_b[4][ACK] , \chs_out_b[3][ACK] ,
         \chs_out_b[2][ACK] , \chs_out_b[1][ACK] , \chs_out_b[0][ACK] ;
  output \chs_in_b[4][ACK] , \chs_in_b[3][ACK] , \chs_in_b[2][ACK] ,
         \chs_in_b[1][ACK] , \chs_in_b[0][ACK] , \chs_out_f[4][REQ] ,
         \chs_out_f[4][DATA][33] , \chs_out_f[4][DATA][32] ,
         \chs_out_f[4][DATA][31] , \chs_out_f[4][DATA][30] ,
         \chs_out_f[4][DATA][29] , \chs_out_f[4][DATA][28] ,
         \chs_out_f[4][DATA][27] , \chs_out_f[4][DATA][26] ,
         \chs_out_f[4][DATA][25] , \chs_out_f[4][DATA][24] ,
         \chs_out_f[4][DATA][23] , \chs_out_f[4][DATA][22] ,
         \chs_out_f[4][DATA][21] , \chs_out_f[4][DATA][20] ,
         \chs_out_f[4][DATA][19] , \chs_out_f[4][DATA][18] ,
         \chs_out_f[4][DATA][17] , \chs_out_f[4][DATA][16] ,
         \chs_out_f[4][DATA][15] , \chs_out_f[4][DATA][14] ,
         \chs_out_f[4][DATA][13] , \chs_out_f[4][DATA][12] ,
         \chs_out_f[4][DATA][11] , \chs_out_f[4][DATA][10] ,
         \chs_out_f[4][DATA][9] , \chs_out_f[4][DATA][8] ,
         \chs_out_f[4][DATA][7] , \chs_out_f[4][DATA][6] ,
         \chs_out_f[4][DATA][5] , \chs_out_f[4][DATA][4] ,
         \chs_out_f[4][DATA][3] , \chs_out_f[4][DATA][2] ,
         \chs_out_f[4][DATA][1] , \chs_out_f[4][DATA][0] , \chs_out_f[3][REQ] ,
         \chs_out_f[3][DATA][33] , \chs_out_f[3][DATA][32] ,
         \chs_out_f[3][DATA][31] , \chs_out_f[3][DATA][30] ,
         \chs_out_f[3][DATA][29] , \chs_out_f[3][DATA][28] ,
         \chs_out_f[3][DATA][27] , \chs_out_f[3][DATA][26] ,
         \chs_out_f[3][DATA][25] , \chs_out_f[3][DATA][24] ,
         \chs_out_f[3][DATA][23] , \chs_out_f[3][DATA][22] ,
         \chs_out_f[3][DATA][21] , \chs_out_f[3][DATA][20] ,
         \chs_out_f[3][DATA][19] , \chs_out_f[3][DATA][18] ,
         \chs_out_f[3][DATA][17] , \chs_out_f[3][DATA][16] ,
         \chs_out_f[3][DATA][15] , \chs_out_f[3][DATA][14] ,
         \chs_out_f[3][DATA][13] , \chs_out_f[3][DATA][12] ,
         \chs_out_f[3][DATA][11] , \chs_out_f[3][DATA][10] ,
         \chs_out_f[3][DATA][9] , \chs_out_f[3][DATA][8] ,
         \chs_out_f[3][DATA][7] , \chs_out_f[3][DATA][6] ,
         \chs_out_f[3][DATA][5] , \chs_out_f[3][DATA][4] ,
         \chs_out_f[3][DATA][3] , \chs_out_f[3][DATA][2] ,
         \chs_out_f[3][DATA][1] , \chs_out_f[3][DATA][0] , \chs_out_f[2][REQ] ,
         \chs_out_f[2][DATA][33] , \chs_out_f[2][DATA][32] ,
         \chs_out_f[2][DATA][31] , \chs_out_f[2][DATA][30] ,
         \chs_out_f[2][DATA][29] , \chs_out_f[2][DATA][28] ,
         \chs_out_f[2][DATA][27] , \chs_out_f[2][DATA][26] ,
         \chs_out_f[2][DATA][25] , \chs_out_f[2][DATA][24] ,
         \chs_out_f[2][DATA][23] , \chs_out_f[2][DATA][22] ,
         \chs_out_f[2][DATA][21] , \chs_out_f[2][DATA][20] ,
         \chs_out_f[2][DATA][19] , \chs_out_f[2][DATA][18] ,
         \chs_out_f[2][DATA][17] , \chs_out_f[2][DATA][16] ,
         \chs_out_f[2][DATA][15] , \chs_out_f[2][DATA][14] ,
         \chs_out_f[2][DATA][13] , \chs_out_f[2][DATA][12] ,
         \chs_out_f[2][DATA][11] , \chs_out_f[2][DATA][10] ,
         \chs_out_f[2][DATA][9] , \chs_out_f[2][DATA][8] ,
         \chs_out_f[2][DATA][7] , \chs_out_f[2][DATA][6] ,
         \chs_out_f[2][DATA][5] , \chs_out_f[2][DATA][4] ,
         \chs_out_f[2][DATA][3] , \chs_out_f[2][DATA][2] ,
         \chs_out_f[2][DATA][1] , \chs_out_f[2][DATA][0] , \chs_out_f[1][REQ] ,
         \chs_out_f[1][DATA][33] , \chs_out_f[1][DATA][32] ,
         \chs_out_f[1][DATA][31] , \chs_out_f[1][DATA][30] ,
         \chs_out_f[1][DATA][29] , \chs_out_f[1][DATA][28] ,
         \chs_out_f[1][DATA][27] , \chs_out_f[1][DATA][26] ,
         \chs_out_f[1][DATA][25] , \chs_out_f[1][DATA][24] ,
         \chs_out_f[1][DATA][23] , \chs_out_f[1][DATA][22] ,
         \chs_out_f[1][DATA][21] , \chs_out_f[1][DATA][20] ,
         \chs_out_f[1][DATA][19] , \chs_out_f[1][DATA][18] ,
         \chs_out_f[1][DATA][17] , \chs_out_f[1][DATA][16] ,
         \chs_out_f[1][DATA][15] , \chs_out_f[1][DATA][14] ,
         \chs_out_f[1][DATA][13] , \chs_out_f[1][DATA][12] ,
         \chs_out_f[1][DATA][11] , \chs_out_f[1][DATA][10] ,
         \chs_out_f[1][DATA][9] , \chs_out_f[1][DATA][8] ,
         \chs_out_f[1][DATA][7] , \chs_out_f[1][DATA][6] ,
         \chs_out_f[1][DATA][5] , \chs_out_f[1][DATA][4] ,
         \chs_out_f[1][DATA][3] , \chs_out_f[1][DATA][2] ,
         \chs_out_f[1][DATA][1] , \chs_out_f[1][DATA][0] , \chs_out_f[0][REQ] ,
         \chs_out_f[0][DATA][33] , \chs_out_f[0][DATA][32] ,
         \chs_out_f[0][DATA][31] , \chs_out_f[0][DATA][30] ,
         \chs_out_f[0][DATA][29] , \chs_out_f[0][DATA][28] ,
         \chs_out_f[0][DATA][27] , \chs_out_f[0][DATA][26] ,
         \chs_out_f[0][DATA][25] , \chs_out_f[0][DATA][24] ,
         \chs_out_f[0][DATA][23] , \chs_out_f[0][DATA][22] ,
         \chs_out_f[0][DATA][21] , \chs_out_f[0][DATA][20] ,
         \chs_out_f[0][DATA][19] , \chs_out_f[0][DATA][18] ,
         \chs_out_f[0][DATA][17] , \chs_out_f[0][DATA][16] ,
         \chs_out_f[0][DATA][15] , \chs_out_f[0][DATA][14] ,
         \chs_out_f[0][DATA][13] , \chs_out_f[0][DATA][12] ,
         \chs_out_f[0][DATA][11] , \chs_out_f[0][DATA][10] ,
         \chs_out_f[0][DATA][9] , \chs_out_f[0][DATA][8] ,
         \chs_out_f[0][DATA][7] , \chs_out_f[0][DATA][6] ,
         \chs_out_f[0][DATA][5] , \chs_out_f[0][DATA][4] ,
         \chs_out_f[0][DATA][3] , \chs_out_f[0][DATA][2] ,
         \chs_out_f[0][DATA][1] , \chs_out_f[0][DATA][0] ;
  wire   \chs_in_b[4][ACK] , \chs_out_f[4][REQ] , n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416;
  assign \chs_in_b[0][ACK]  = \chs_in_b[4][ACK] ;
  assign \chs_in_b[1][ACK]  = \chs_in_b[4][ACK] ;
  assign \chs_in_b[2][ACK]  = \chs_in_b[4][ACK] ;
  assign \chs_in_b[3][ACK]  = \chs_in_b[4][ACK] ;
  assign \chs_out_f[0][REQ]  = \chs_out_f[4][REQ] ;
  assign \chs_out_f[1][REQ]  = \chs_out_f[4][REQ] ;
  assign \chs_out_f[2][REQ]  = \chs_out_f[4][REQ] ;
  assign \chs_out_f[3][REQ]  = \chs_out_f[4][REQ] ;

  c_gate_generic_0_5_0 c_sync_req ( .preset(n416), .\input ({
        \chs_in_f[4][REQ] , \chs_in_f[3][REQ] , \chs_in_f[2][REQ] , 
        \chs_in_f[1][REQ] , \chs_in_f[0][REQ] }), .\output (
        \chs_out_f[4][REQ] ) );
  c_gate_generic_0_5_1 c_sync_ack ( .preset(n416), .\input ({
        \chs_out_b[4][ACK] , \chs_out_b[3][ACK] , \chs_out_b[2][ACK] , 
        \chs_out_b[1][ACK] , \chs_out_b[0][ACK] }), .\output (
        \chs_in_b[4][ACK] ) );
  HS65_LS_BFX9 U2 ( .A(n408), .Z(n409) );
  HS65_LS_BFX9 U3 ( .A(n400), .Z(n403) );
  HS65_LS_BFX9 U4 ( .A(n360), .Z(n363) );
  HS65_LS_BFX9 U5 ( .A(n412), .Z(n415) );
  HS65_LH_NAND2X2 U6 ( .A(n403), .B(\chs_in_f[2][DATA][7] ), .Z(n249) );
  HS65_LS_NAND2X2 U7 ( .A(n363), .B(\chs_in_f[0][DATA][7] ), .Z(n250) );
  HS65_LS_NAND2X5 U8 ( .A(n383), .B(\chs_in_f[1][DATA][7] ), .Z(n251) );
  HS65_LS_AND3X18 U9 ( .A(n249), .B(n250), .C(n251), .Z(n183) );
  HS65_LS_OAI212X5 U10 ( .A(n71), .B(n331), .C(n37), .D(n346), .E(n183), .Z(
        \chs_out_f[1][DATA][7] ) );
  HS65_LS_OR2X9 U11 ( .A(n338), .B(n66), .Z(n252) );
  HS65_LS_OR2X9 U12 ( .A(n353), .B(n32), .Z(n253) );
  HS65_LS_NAND3X5 U13 ( .A(n252), .B(n253), .C(n109), .Z(
        \chs_out_f[4][DATA][12] ) );
  HS65_LH_NAND2X2 U14 ( .A(\chs_in_f[2][DATA][12] ), .B(n415), .Z(n254) );
  HS65_LS_NAND2X7 U15 ( .A(\chs_in_f[0][DATA][12] ), .B(n373), .Z(n255) );
  HS65_LH_NAND2X2 U16 ( .A(\chs_in_f[1][DATA][12] ), .B(n395), .Z(n256) );
  HS65_LS_AND3X9 U17 ( .A(n254), .B(n255), .C(n256), .Z(n109) );
  HS65_LS_BFX9 U18 ( .A(n404), .Z(n406) );
  HS65_LS_BFX9 U19 ( .A(n364), .Z(n366) );
  HS65_LS_AND3X9 U20 ( .A(n274), .B(n275), .C(n276), .Z(n104) );
  HS65_LS_NAND3X5 U21 ( .A(n272), .B(n273), .C(n104), .Z(
        \chs_out_f[4][DATA][17] ) );
  HS65_LS_AOI222X4 U22 ( .A(\chs_in_f[2][DATA][0] ), .B(n415), .C(
        \chs_in_f[0][DATA][0] ), .D(n373), .E(\chs_in_f[1][DATA][0] ), .F(n395), .Z(n112) );
  HS65_LH_NAND2X2 U23 ( .A(n367), .B(\chs_in_f[0][DATA][7] ), .Z(n268) );
  HS65_LS_NAND2X2 U24 ( .A(n387), .B(\chs_in_f[1][DATA][7] ), .Z(n269) );
  HS65_LS_NAND2X7 U25 ( .A(n366), .B(\chs_in_f[0][DATA][29] ), .Z(n258) );
  HS65_LH_NAND2X2 U26 ( .A(n386), .B(\chs_in_f[1][DATA][29] ), .Z(n259) );
  HS65_LS_NAND3X5 U27 ( .A(n260), .B(n261), .C(n159), .Z(
        \chs_out_f[2][DATA][29] ) );
  HS65_LS_NAND2X2 U28 ( .A(n406), .B(\chs_in_f[2][DATA][29] ), .Z(n257) );
  HS65_LS_AND3X9 U29 ( .A(n257), .B(n258), .C(n259), .Z(n159) );
  HS65_LS_OR2X9 U30 ( .A(n49), .B(n333), .Z(n260) );
  HS65_LS_OR2X9 U31 ( .A(n15), .B(n348), .Z(n261) );
  HS65_LS_BFX9 U32 ( .A(n384), .Z(n387) );
  HS65_LS_BFX9 U33 ( .A(n404), .Z(n407) );
  HS65_LS_BFX9 U34 ( .A(n364), .Z(n367) );
  HS65_LH_NAND2X2 U35 ( .A(\chs_in_f[0][DATA][17] ), .B(n373), .Z(n275) );
  HS65_LH_NAND2X2 U36 ( .A(n389), .B(\chs_in_f[1][DATA][0] ), .Z(n264) );
  HS65_LS_NAND3X5 U37 ( .A(n265), .B(n266), .C(n146), .Z(
        \chs_out_f[3][DATA][0] ) );
  HS65_LS_NAND2X2 U38 ( .A(n409), .B(\chs_in_f[2][DATA][0] ), .Z(n262) );
  HS65_LS_NAND2X7 U39 ( .A(n369), .B(\chs_in_f[0][DATA][0] ), .Z(n263) );
  HS65_LS_AND3X9 U40 ( .A(n262), .B(n263), .C(n264), .Z(n146) );
  HS65_LS_OR2X9 U41 ( .A(n78), .B(n335), .Z(n265) );
  HS65_LS_OR2X9 U42 ( .A(n44), .B(n350), .Z(n266) );
  HS65_LH_NAND2X2 U43 ( .A(n407), .B(\chs_in_f[2][DATA][7] ), .Z(n267) );
  HS65_LS_AND3X9 U44 ( .A(n267), .B(n268), .C(n269), .Z(n149) );
  HS65_LS_OR2X9 U45 ( .A(n71), .B(n334), .Z(n270) );
  HS65_LS_OR2X9 U46 ( .A(n37), .B(n349), .Z(n271) );
  HS65_LS_NAND3X5 U47 ( .A(n270), .B(n271), .C(n149), .Z(
        \chs_out_f[2][DATA][7] ) );
  HS65_LS_BFX9 U48 ( .A(n372), .Z(n373) );
  HS65_LS_BFX9 U49 ( .A(n412), .Z(n414) );
  HS65_LS_NAND2X4 U50 ( .A(\chs_in_f[1][DATA][22] ), .B(n394), .Z(n315) );
  HS65_LS_NAND2X2 U51 ( .A(\chs_in_f[0][DATA][22] ), .B(n374), .Z(n314) );
  HS65_LS_AND3X9 U52 ( .A(n277), .B(n278), .C(n279), .Z(n107) );
  HS65_LS_NAND2X4 U53 ( .A(\chs_in_f[1][DATA][14] ), .B(n395), .Z(n279) );
  HS65_LH_NAND2X2 U54 ( .A(n371), .B(\chs_in_f[0][DATA][7] ), .Z(n281) );
  HS65_LS_OR2X9 U55 ( .A(n338), .B(n61), .Z(n272) );
  HS65_LS_OR2X9 U56 ( .A(n353), .B(n27), .Z(n273) );
  HS65_LH_NAND2X2 U57 ( .A(\chs_in_f[2][DATA][17] ), .B(n414), .Z(n274) );
  HS65_LH_NAND2X2 U58 ( .A(\chs_in_f[1][DATA][17] ), .B(n394), .Z(n276) );
  HS65_LS_BFX9 U59 ( .A(n412), .Z(n413) );
  HS65_LS_BFX9 U60 ( .A(n388), .Z(n391) );
  HS65_LS_BFX9 U61 ( .A(n408), .Z(n411) );
  HS65_LS_BFX9 U62 ( .A(n368), .Z(n371) );
  HS65_LH_AND2X4 U63 ( .A(\chs_in_f[0][DATA][1] ), .B(n373), .Z(n296) );
  HS65_LH_NAND2X2 U64 ( .A(n391), .B(\chs_in_f[1][DATA][7] ), .Z(n282) );
  HS65_LH_AND2X4 U65 ( .A(\chs_in_f[2][DATA][31] ), .B(n413), .Z(n285) );
  HS65_LS_AND2X4 U66 ( .A(\chs_in_f[0][DATA][31] ), .B(n375), .Z(n286) );
  HS65_LS_NAND2X2 U67 ( .A(\chs_in_f[2][DATA][14] ), .B(n415), .Z(n277) );
  HS65_LS_NAND2X7 U68 ( .A(\chs_in_f[0][DATA][14] ), .B(n373), .Z(n278) );
  HS65_LH_NAND2X2 U69 ( .A(n411), .B(\chs_in_f[2][DATA][7] ), .Z(n280) );
  HS65_LS_AND3X9 U70 ( .A(n280), .B(n281), .C(n282), .Z(n115) );
  HS65_LS_OR2X9 U71 ( .A(n71), .B(n337), .Z(n283) );
  HS65_LS_OR2X9 U72 ( .A(n37), .B(n352), .Z(n284) );
  HS65_LS_NAND3X5 U73 ( .A(n283), .B(n284), .C(n115), .Z(
        \chs_out_f[3][DATA][7] ) );
  HS65_LS_AND2X4 U74 ( .A(\chs_in_f[1][DATA][31] ), .B(n393), .Z(n287) );
  HS65_LS_NOR3X4 U75 ( .A(n285), .B(n286), .C(n287), .Z(n88) );
  HS65_LS_OAI212X5 U76 ( .A(n340), .B(n47), .C(n354), .D(n13), .E(n88), .Z(
        \chs_out_f[4][DATA][31] ) );
  HS65_LH_NAND2X2 U77 ( .A(n362), .B(\chs_in_f[0][DATA][29] ), .Z(n304) );
  HS65_LS_NAND3X5 U78 ( .A(n306), .B(n307), .C(n193), .Z(
        \chs_out_f[1][DATA][29] ) );
  HS65_LS_NAND3X5 U79 ( .A(n311), .B(n312), .C(n168), .Z(
        \chs_out_f[2][DATA][20] ) );
  HS65_LS_NAND3X5 U80 ( .A(n293), .B(n294), .C(n101), .Z(
        \chs_out_f[4][DATA][1] ) );
  HS65_LS_NAND3X5 U81 ( .A(n288), .B(n289), .C(n90), .Z(
        \chs_out_f[4][DATA][2] ) );
  HS65_LS_AND2X4 U82 ( .A(\chs_in_f[2][DATA][2] ), .B(n413), .Z(n290) );
  HS65_LS_OR2X9 U83 ( .A(n339), .B(n76), .Z(n288) );
  HS65_LS_OR2X9 U84 ( .A(n354), .B(n42), .Z(n289) );
  HS65_LS_AND2X4 U85 ( .A(\chs_in_f[0][DATA][2] ), .B(n374), .Z(n291) );
  HS65_LS_AND2X4 U86 ( .A(\chs_in_f[1][DATA][2] ), .B(n393), .Z(n292) );
  HS65_LS_NOR3X4 U87 ( .A(n290), .B(n291), .C(n292), .Z(n90) );
  HS65_LS_OR2X9 U88 ( .A(n338), .B(n77), .Z(n293) );
  HS65_LS_OR2X9 U89 ( .A(n353), .B(n43), .Z(n294) );
  HS65_LS_AND2X4 U90 ( .A(\chs_in_f[2][DATA][1] ), .B(n414), .Z(n295) );
  HS65_LS_AND2X4 U91 ( .A(\chs_in_f[1][DATA][1] ), .B(n394), .Z(n297) );
  HS65_LS_NOR3X4 U92 ( .A(n295), .B(n296), .C(n297), .Z(n101) );
  HS65_LS_BFX9 U93 ( .A(n400), .Z(n402) );
  HS65_LS_BFX9 U94 ( .A(n380), .Z(n382) );
  HS65_LH_NAND2X2 U95 ( .A(\chs_in_f[2][DATA][22] ), .B(n414), .Z(n313) );
  HS65_LH_NAND2X2 U96 ( .A(n366), .B(\chs_in_f[0][DATA][20] ), .Z(n309) );
  HS65_LS_OR2X9 U97 ( .A(n340), .B(n71), .Z(n298) );
  HS65_LS_OR2X9 U98 ( .A(n355), .B(n37), .Z(n299) );
  HS65_LS_NAND3X6 U99 ( .A(n298), .B(n299), .C(n81), .Z(
        \chs_out_f[4][DATA][7] ) );
  HS65_LH_NAND2X2 U100 ( .A(\chs_in_f[2][DATA][7] ), .B(n413), .Z(n300) );
  HS65_LH_NAND2X2 U101 ( .A(\chs_in_f[0][DATA][7] ), .B(n375), .Z(n301) );
  HS65_LS_NAND2X2 U102 ( .A(\chs_in_f[1][DATA][7] ), .B(n393), .Z(n302) );
  HS65_LS_AND3X9 U103 ( .A(n300), .B(n301), .C(n302), .Z(n81) );
  HS65_LH_NAND2X2 U104 ( .A(n402), .B(\chs_in_f[2][DATA][29] ), .Z(n303) );
  HS65_LH_NAND2X2 U105 ( .A(n382), .B(\chs_in_f[1][DATA][29] ), .Z(n305) );
  HS65_LS_AND3X9 U106 ( .A(n303), .B(n304), .C(n305), .Z(n193) );
  HS65_LS_OR2X9 U107 ( .A(n49), .B(n330), .Z(n306) );
  HS65_LS_OR2X9 U108 ( .A(n15), .B(n345), .Z(n307) );
  HS65_LS_BFX9 U109 ( .A(n392), .Z(n394) );
  HS65_LS_BFX9 U110 ( .A(n384), .Z(n386) );
  HS65_LS_AND3X9 U111 ( .A(n318), .B(n319), .C(n320), .Z(n91) );
  HS65_LS_OR2X9 U112 ( .A(n339), .B(n49), .Z(n316) );
  HS65_LS_OR2X9 U113 ( .A(n354), .B(n15), .Z(n317) );
  HS65_LS_NAND3X5 U114 ( .A(n316), .B(n317), .C(n91), .Z(
        \chs_out_f[4][DATA][29] ) );
  HS65_LH_NAND2X2 U115 ( .A(\chs_in_f[0][DATA][29] ), .B(n374), .Z(n319) );
  HS65_LS_AOI222X2 U116 ( .A(\chs_in_f[2][DATA][16] ), .B(n415), .C(
        \chs_in_f[0][DATA][16] ), .D(n373), .E(\chs_in_f[1][DATA][16] ), .F(
        n395), .Z(n105) );
  HS65_LS_AOI222X2 U117 ( .A(\chs_in_f[2][DATA][10] ), .B(n415), .C(
        \chs_in_f[0][DATA][10] ), .D(n373), .E(\chs_in_f[1][DATA][10] ), .F(
        n395), .Z(n111) );
  HS65_LS_AOI222X2 U118 ( .A(\chs_in_f[2][DATA][18] ), .B(n414), .C(
        \chs_in_f[0][DATA][18] ), .D(n373), .E(\chs_in_f[1][DATA][18] ), .F(
        n394), .Z(n103) );
  HS65_LS_AOI222X2 U119 ( .A(\chs_in_f[2][DATA][15] ), .B(n415), .C(
        \chs_in_f[0][DATA][15] ), .D(n373), .E(\chs_in_f[1][DATA][15] ), .F(
        n395), .Z(n106) );
  HS65_LS_AOI222X2 U120 ( .A(\chs_in_f[2][DATA][19] ), .B(n414), .C(
        \chs_in_f[0][DATA][19] ), .D(n373), .E(\chs_in_f[1][DATA][19] ), .F(
        n394), .Z(n102) );
  HS65_LS_AOI222X2 U121 ( .A(\chs_in_f[2][DATA][11] ), .B(n415), .C(
        \chs_in_f[0][DATA][11] ), .D(n373), .E(\chs_in_f[1][DATA][11] ), .F(
        n395), .Z(n110) );
  HS65_LS_AOI222X2 U122 ( .A(\chs_in_f[2][DATA][13] ), .B(n415), .C(
        \chs_in_f[0][DATA][13] ), .D(n373), .E(\chs_in_f[1][DATA][13] ), .F(
        n395), .Z(n108) );
  HS65_LS_AOI222X2 U123 ( .A(\chs_in_f[2][DATA][26] ), .B(n414), .C(
        \chs_in_f[0][DATA][26] ), .D(n374), .E(\chs_in_f[1][DATA][26] ), .F(
        n394), .Z(n94) );
  HS65_LS_AOI222X2 U124 ( .A(\chs_in_f[2][DATA][28] ), .B(n414), .C(
        \chs_in_f[0][DATA][28] ), .D(n374), .E(\chs_in_f[1][DATA][28] ), .F(
        n394), .Z(n92) );
  HS65_LS_AOI222X2 U125 ( .A(\chs_in_f[2][DATA][24] ), .B(n414), .C(
        \chs_in_f[0][DATA][24] ), .D(n374), .E(\chs_in_f[1][DATA][24] ), .F(
        n394), .Z(n96) );
  HS65_LS_AOI222X2 U126 ( .A(\chs_in_f[2][DATA][20] ), .B(n414), .C(
        \chs_in_f[0][DATA][20] ), .D(n374), .E(\chs_in_f[1][DATA][20] ), .F(
        n394), .Z(n100) );
  HS65_LS_AOI222X2 U127 ( .A(\chs_in_f[2][DATA][21] ), .B(n414), .C(
        \chs_in_f[0][DATA][21] ), .D(n374), .E(\chs_in_f[1][DATA][21] ), .F(
        n394), .Z(n99) );
  HS65_LS_AOI222X2 U128 ( .A(\chs_in_f[2][DATA][25] ), .B(n414), .C(
        \chs_in_f[0][DATA][25] ), .D(n374), .E(\chs_in_f[1][DATA][25] ), .F(
        n394), .Z(n95) );
  HS65_LS_AOI222X2 U129 ( .A(\chs_in_f[2][DATA][23] ), .B(n414), .C(
        \chs_in_f[0][DATA][23] ), .D(n374), .E(\chs_in_f[1][DATA][23] ), .F(
        n394), .Z(n97) );
  HS65_LS_AOI222X2 U130 ( .A(\chs_in_f[2][DATA][27] ), .B(n414), .C(
        \chs_in_f[0][DATA][27] ), .D(n374), .E(\chs_in_f[1][DATA][27] ), .F(
        n394), .Z(n93) );
  HS65_LS_AOI222X2 U131 ( .A(\chs_in_f[2][DATA][4] ), .B(n413), .C(
        \chs_in_f[0][DATA][4] ), .D(n375), .E(\chs_in_f[1][DATA][4] ), .F(n393), .Z(n84) );
  HS65_LS_AOI222X2 U132 ( .A(\chs_in_f[2][DATA][6] ), .B(n413), .C(
        \chs_in_f[0][DATA][6] ), .D(n375), .E(\chs_in_f[1][DATA][6] ), .F(n393), .Z(n82) );
  HS65_LS_AOI222X2 U133 ( .A(\chs_in_f[2][DATA][5] ), .B(n413), .C(
        \chs_in_f[0][DATA][5] ), .D(n375), .E(\chs_in_f[1][DATA][5] ), .F(n393), .Z(n83) );
  HS65_LH_NAND2X2 U134 ( .A(n406), .B(\chs_in_f[2][DATA][20] ), .Z(n308) );
  HS65_LH_NAND2X2 U135 ( .A(n386), .B(\chs_in_f[1][DATA][20] ), .Z(n310) );
  HS65_LS_AND3X9 U136 ( .A(n308), .B(n309), .C(n310), .Z(n168) );
  HS65_LS_OR2X9 U137 ( .A(n58), .B(n332), .Z(n311) );
  HS65_LS_OR2X9 U138 ( .A(n24), .B(n348), .Z(n312) );
  HS65_LS_AND3X18 U139 ( .A(n313), .B(n314), .C(n315), .Z(n98) );
  HS65_LS_OAI212X3 U140 ( .A(n76), .B(n336), .C(n42), .D(n351), .E(n124), .Z(
        \chs_out_f[3][DATA][2] ) );
  HS65_LS_OAI212X3 U141 ( .A(n56), .B(n336), .C(n22), .D(n351), .E(n132), .Z(
        \chs_out_f[3][DATA][22] ) );
  HS65_LS_OAI212X3 U142 ( .A(n58), .B(n335), .C(n24), .D(n351), .E(n134), .Z(
        \chs_out_f[3][DATA][20] ) );
  HS65_LH_NAND2X2 U143 ( .A(n370), .B(\chs_in_f[0][DATA][29] ), .Z(n324) );
  HS65_LH_NAND2X2 U144 ( .A(\chs_in_f[2][DATA][29] ), .B(n413), .Z(n318) );
  HS65_LH_NAND2X2 U145 ( .A(\chs_in_f[1][DATA][29] ), .B(n393), .Z(n320) );
  HS65_LS_BFX9 U146 ( .A(n388), .Z(n390) );
  HS65_LS_AOI222X2 U147 ( .A(n399), .B(\chs_in_f[2][DATA][7] ), .C(n359), .D(
        \chs_in_f[0][DATA][7] ), .E(n379), .F(\chs_in_f[1][DATA][7] ), .Z(n217) );
  HS65_LS_OAI212X3 U148 ( .A(n54), .B(n336), .C(n20), .D(n351), .E(n130), .Z(
        \chs_out_f[3][DATA][24] ) );
  HS65_LS_OAI212X3 U149 ( .A(n52), .B(n336), .C(n18), .D(n351), .E(n128), .Z(
        \chs_out_f[3][DATA][26] ) );
  HS65_LS_OAI212X3 U150 ( .A(n50), .B(n336), .C(n16), .D(n351), .E(n126), .Z(
        \chs_out_f[3][DATA][28] ) );
  HS65_LS_OAI212X3 U151 ( .A(n76), .B(n333), .C(n42), .D(n348), .E(n158), .Z(
        \chs_out_f[2][DATA][2] ) );
  HS65_LS_OAI212X3 U152 ( .A(n56), .B(n333), .C(n22), .D(n348), .E(n166), .Z(
        \chs_out_f[2][DATA][22] ) );
  HS65_LS_OAI212X3 U153 ( .A(n54), .B(n333), .C(n20), .D(n348), .E(n164), .Z(
        \chs_out_f[2][DATA][24] ) );
  HS65_LS_OAI212X3 U154 ( .A(n52), .B(n333), .C(n18), .D(n348), .E(n162), .Z(
        \chs_out_f[2][DATA][26] ) );
  HS65_LS_OAI212X3 U155 ( .A(n50), .B(n333), .C(n16), .D(n348), .E(n160), .Z(
        \chs_out_f[2][DATA][28] ) );
  HS65_LS_OAI212X3 U156 ( .A(n76), .B(n330), .C(n42), .D(n345), .E(n192), .Z(
        \chs_out_f[1][DATA][2] ) );
  HS65_LS_OAI212X3 U157 ( .A(n58), .B(n329), .C(n24), .D(n345), .E(n202), .Z(
        \chs_out_f[1][DATA][20] ) );
  HS65_LS_OAI212X3 U158 ( .A(n56), .B(n330), .C(n22), .D(n345), .E(n200), .Z(
        \chs_out_f[1][DATA][22] ) );
  HS65_LS_OAI212X3 U159 ( .A(n54), .B(n330), .C(n20), .D(n345), .E(n198), .Z(
        \chs_out_f[1][DATA][24] ) );
  HS65_LS_OAI212X3 U160 ( .A(n52), .B(n330), .C(n18), .D(n345), .E(n196), .Z(
        \chs_out_f[1][DATA][26] ) );
  HS65_LS_OAI212X3 U161 ( .A(n50), .B(n330), .C(n16), .D(n345), .E(n194), .Z(
        \chs_out_f[1][DATA][28] ) );
  HS65_LS_OAI212X3 U162 ( .A(n68), .B(n335), .C(n34), .D(n350), .E(n145), .Z(
        \chs_out_f[3][DATA][10] ) );
  HS65_LS_OAI212X3 U163 ( .A(n66), .B(n335), .C(n32), .D(n350), .E(n143), .Z(
        \chs_out_f[3][DATA][12] ) );
  HS65_LS_OAI212X3 U164 ( .A(n64), .B(n335), .C(n30), .D(n350), .E(n141), .Z(
        \chs_out_f[3][DATA][14] ) );
  HS65_LS_OAI212X3 U165 ( .A(n62), .B(n335), .C(n28), .D(n350), .E(n139), .Z(
        \chs_out_f[3][DATA][16] ) );
  HS65_LS_OAI212X3 U166 ( .A(n78), .B(n332), .C(n44), .D(n347), .E(n180), .Z(
        \chs_out_f[2][DATA][0] ) );
  HS65_LS_OAI212X3 U167 ( .A(n68), .B(n332), .C(n34), .D(n347), .E(n179), .Z(
        \chs_out_f[2][DATA][10] ) );
  HS65_LS_OAI212X3 U168 ( .A(n66), .B(n332), .C(n32), .D(n347), .E(n177), .Z(
        \chs_out_f[2][DATA][12] ) );
  HS65_LS_OAI212X3 U169 ( .A(n64), .B(n332), .C(n30), .D(n347), .E(n175), .Z(
        \chs_out_f[2][DATA][14] ) );
  HS65_LS_OAI212X3 U170 ( .A(n62), .B(n332), .C(n28), .D(n347), .E(n173), .Z(
        \chs_out_f[2][DATA][16] ) );
  HS65_LS_OAI212X3 U171 ( .A(n78), .B(n329), .C(n44), .D(n344), .E(n214), .Z(
        \chs_out_f[1][DATA][0] ) );
  HS65_LS_OAI212X3 U172 ( .A(n68), .B(n329), .C(n34), .D(n344), .E(n213), .Z(
        \chs_out_f[1][DATA][10] ) );
  HS65_LS_OAI212X3 U173 ( .A(n66), .B(n329), .C(n32), .D(n344), .E(n211), .Z(
        \chs_out_f[1][DATA][12] ) );
  HS65_LS_OAI212X3 U174 ( .A(n64), .B(n329), .C(n30), .D(n344), .E(n209), .Z(
        \chs_out_f[1][DATA][14] ) );
  HS65_LS_OAI212X3 U175 ( .A(n62), .B(n329), .C(n28), .D(n344), .E(n207), .Z(
        \chs_out_f[1][DATA][16] ) );
  HS65_LS_OAI212X3 U176 ( .A(n57), .B(n336), .C(n23), .D(n351), .E(n133), .Z(
        \chs_out_f[3][DATA][21] ) );
  HS65_LS_OAI212X3 U177 ( .A(n55), .B(n336), .C(n21), .D(n351), .E(n131), .Z(
        \chs_out_f[3][DATA][23] ) );
  HS65_LS_OAI212X3 U178 ( .A(n53), .B(n336), .C(n19), .D(n351), .E(n129), .Z(
        \chs_out_f[3][DATA][25] ) );
  HS65_LS_OAI212X3 U179 ( .A(n51), .B(n336), .C(n17), .D(n351), .E(n127), .Z(
        \chs_out_f[3][DATA][27] ) );
  HS65_LS_OAI212X3 U180 ( .A(n57), .B(n333), .C(n23), .D(n348), .E(n167), .Z(
        \chs_out_f[2][DATA][21] ) );
  HS65_LS_OAI212X3 U181 ( .A(n55), .B(n333), .C(n21), .D(n348), .E(n165), .Z(
        \chs_out_f[2][DATA][23] ) );
  HS65_LS_OAI212X3 U182 ( .A(n53), .B(n333), .C(n19), .D(n348), .E(n163), .Z(
        \chs_out_f[2][DATA][25] ) );
  HS65_LS_OAI212X3 U183 ( .A(n51), .B(n333), .C(n17), .D(n348), .E(n161), .Z(
        \chs_out_f[2][DATA][27] ) );
  HS65_LS_OAI212X3 U184 ( .A(n57), .B(n330), .C(n23), .D(n345), .E(n201), .Z(
        \chs_out_f[1][DATA][21] ) );
  HS65_LS_OAI212X3 U185 ( .A(n55), .B(n330), .C(n21), .D(n345), .E(n199), .Z(
        \chs_out_f[1][DATA][23] ) );
  HS65_LS_OAI212X3 U186 ( .A(n53), .B(n330), .C(n19), .D(n345), .E(n197), .Z(
        \chs_out_f[1][DATA][25] ) );
  HS65_LS_OAI212X3 U187 ( .A(n51), .B(n330), .C(n17), .D(n345), .E(n195), .Z(
        \chs_out_f[1][DATA][27] ) );
  HS65_LS_OAI212X3 U188 ( .A(n77), .B(n335), .C(n43), .D(n350), .E(n135), .Z(
        \chs_out_f[3][DATA][1] ) );
  HS65_LS_OAI212X3 U189 ( .A(n67), .B(n335), .C(n33), .D(n350), .E(n144), .Z(
        \chs_out_f[3][DATA][11] ) );
  HS65_LS_OAI212X3 U190 ( .A(n65), .B(n335), .C(n31), .D(n350), .E(n142), .Z(
        \chs_out_f[3][DATA][13] ) );
  HS65_LS_OAI212X3 U191 ( .A(n63), .B(n335), .C(n29), .D(n350), .E(n140), .Z(
        \chs_out_f[3][DATA][15] ) );
  HS65_LS_OAI212X3 U192 ( .A(n61), .B(n335), .C(n27), .D(n350), .E(n138), .Z(
        \chs_out_f[3][DATA][17] ) );
  HS65_LS_OAI212X3 U193 ( .A(n59), .B(n335), .C(n25), .D(n350), .E(n136), .Z(
        \chs_out_f[3][DATA][19] ) );
  HS65_LS_OAI212X3 U194 ( .A(n77), .B(n332), .C(n43), .D(n347), .E(n169), .Z(
        \chs_out_f[2][DATA][1] ) );
  HS65_LS_OAI212X3 U195 ( .A(n67), .B(n332), .C(n33), .D(n347), .E(n178), .Z(
        \chs_out_f[2][DATA][11] ) );
  HS65_LS_OAI212X3 U196 ( .A(n65), .B(n332), .C(n31), .D(n347), .E(n176), .Z(
        \chs_out_f[2][DATA][13] ) );
  HS65_LS_OAI212X3 U197 ( .A(n63), .B(n332), .C(n29), .D(n347), .E(n174), .Z(
        \chs_out_f[2][DATA][15] ) );
  HS65_LS_OAI212X3 U198 ( .A(n61), .B(n332), .C(n27), .D(n347), .E(n172), .Z(
        \chs_out_f[2][DATA][17] ) );
  HS65_LS_OAI212X3 U199 ( .A(n59), .B(n332), .C(n25), .D(n347), .E(n170), .Z(
        \chs_out_f[2][DATA][19] ) );
  HS65_LS_OAI212X3 U200 ( .A(n77), .B(n329), .C(n43), .D(n344), .E(n203), .Z(
        \chs_out_f[1][DATA][1] ) );
  HS65_LS_OAI212X3 U201 ( .A(n67), .B(n329), .C(n33), .D(n344), .E(n212), .Z(
        \chs_out_f[1][DATA][11] ) );
  HS65_LS_OAI212X3 U202 ( .A(n65), .B(n329), .C(n31), .D(n344), .E(n210), .Z(
        \chs_out_f[1][DATA][13] ) );
  HS65_LS_OAI212X3 U203 ( .A(n63), .B(n329), .C(n29), .D(n344), .E(n208), .Z(
        \chs_out_f[1][DATA][15] ) );
  HS65_LS_OAI212X3 U204 ( .A(n61), .B(n329), .C(n27), .D(n344), .E(n206), .Z(
        \chs_out_f[1][DATA][17] ) );
  HS65_LS_OAI212X3 U205 ( .A(n59), .B(n329), .C(n25), .D(n344), .E(n204), .Z(
        \chs_out_f[1][DATA][19] ) );
  HS65_LS_OAI212X3 U206 ( .A(n60), .B(n335), .C(n26), .D(n350), .E(n137), .Z(
        \chs_out_f[3][DATA][18] ) );
  HS65_LS_OAI212X3 U207 ( .A(n60), .B(n332), .C(n26), .D(n347), .E(n171), .Z(
        \chs_out_f[2][DATA][18] ) );
  HS65_LS_OAI212X3 U208 ( .A(n60), .B(n329), .C(n26), .D(n344), .E(n205), .Z(
        \chs_out_f[1][DATA][18] ) );
  HS65_LS_AOI222X2 U209 ( .A(n398), .B(\chs_in_f[2][DATA][29] ), .C(n358), .D(
        \chs_in_f[0][DATA][29] ), .E(n378), .F(\chs_in_f[1][DATA][29] ), .Z(
        n227) );
  HS65_LS_AOI222X2 U210 ( .A(n397), .B(\chs_in_f[2][DATA][0] ), .C(n357), .D(
        \chs_in_f[0][DATA][0] ), .E(n377), .F(\chs_in_f[1][DATA][0] ), .Z(n248) );
  HS65_LS_AOI222X2 U211 ( .A(n398), .B(\chs_in_f[2][DATA][2] ), .C(n358), .D(
        \chs_in_f[0][DATA][2] ), .E(n378), .F(\chs_in_f[1][DATA][2] ), .Z(n226) );
  HS65_LS_AOI222X2 U212 ( .A(n397), .B(\chs_in_f[2][DATA][10] ), .C(n357), .D(
        \chs_in_f[0][DATA][10] ), .E(n377), .F(\chs_in_f[1][DATA][10] ), .Z(
        n247) );
  HS65_LS_AOI222X2 U213 ( .A(n397), .B(\chs_in_f[2][DATA][12] ), .C(n357), .D(
        \chs_in_f[0][DATA][12] ), .E(n377), .F(\chs_in_f[1][DATA][12] ), .Z(
        n245) );
  HS65_LS_AOI222X2 U214 ( .A(n397), .B(\chs_in_f[2][DATA][14] ), .C(n357), .D(
        \chs_in_f[0][DATA][14] ), .E(n377), .F(\chs_in_f[1][DATA][14] ), .Z(
        n243) );
  HS65_LS_AOI222X2 U215 ( .A(n397), .B(\chs_in_f[2][DATA][16] ), .C(n357), .D(
        \chs_in_f[0][DATA][16] ), .E(n377), .F(\chs_in_f[1][DATA][16] ), .Z(
        n241) );
  HS65_LS_AOI222X2 U216 ( .A(n398), .B(\chs_in_f[2][DATA][20] ), .C(n358), .D(
        \chs_in_f[0][DATA][20] ), .E(n378), .F(\chs_in_f[1][DATA][20] ), .Z(
        n236) );
  HS65_LS_AOI222X2 U217 ( .A(n398), .B(\chs_in_f[2][DATA][22] ), .C(n358), .D(
        \chs_in_f[0][DATA][22] ), .E(n378), .F(\chs_in_f[1][DATA][22] ), .Z(
        n234) );
  HS65_LS_AOI222X2 U218 ( .A(n398), .B(\chs_in_f[2][DATA][24] ), .C(n358), .D(
        \chs_in_f[0][DATA][24] ), .E(n378), .F(\chs_in_f[1][DATA][24] ), .Z(
        n232) );
  HS65_LS_AOI222X2 U219 ( .A(n398), .B(\chs_in_f[2][DATA][26] ), .C(n358), .D(
        \chs_in_f[0][DATA][26] ), .E(n378), .F(\chs_in_f[1][DATA][26] ), .Z(
        n230) );
  HS65_LS_AOI222X2 U220 ( .A(n398), .B(\chs_in_f[2][DATA][28] ), .C(n358), .D(
        \chs_in_f[0][DATA][28] ), .E(n378), .F(\chs_in_f[1][DATA][28] ), .Z(
        n228) );
  HS65_LS_AOI222X2 U221 ( .A(n397), .B(\chs_in_f[2][DATA][1] ), .C(n357), .D(
        \chs_in_f[0][DATA][1] ), .E(n377), .F(\chs_in_f[1][DATA][1] ), .Z(n237) );
  HS65_LS_AOI222X2 U222 ( .A(n397), .B(\chs_in_f[2][DATA][11] ), .C(n357), .D(
        \chs_in_f[0][DATA][11] ), .E(n377), .F(\chs_in_f[1][DATA][11] ), .Z(
        n246) );
  HS65_LS_AOI222X2 U223 ( .A(n397), .B(\chs_in_f[2][DATA][13] ), .C(n357), .D(
        \chs_in_f[0][DATA][13] ), .E(n377), .F(\chs_in_f[1][DATA][13] ), .Z(
        n244) );
  HS65_LS_AOI222X2 U224 ( .A(n397), .B(\chs_in_f[2][DATA][15] ), .C(n357), .D(
        \chs_in_f[0][DATA][15] ), .E(n377), .F(\chs_in_f[1][DATA][15] ), .Z(
        n242) );
  HS65_LS_AOI222X2 U225 ( .A(n397), .B(\chs_in_f[2][DATA][17] ), .C(n357), .D(
        \chs_in_f[0][DATA][17] ), .E(n377), .F(\chs_in_f[1][DATA][17] ), .Z(
        n240) );
  HS65_LS_AOI222X2 U226 ( .A(n397), .B(\chs_in_f[2][DATA][19] ), .C(n357), .D(
        \chs_in_f[0][DATA][19] ), .E(n377), .F(\chs_in_f[1][DATA][19] ), .Z(
        n238) );
  HS65_LS_AOI222X2 U227 ( .A(n398), .B(\chs_in_f[2][DATA][21] ), .C(n358), .D(
        \chs_in_f[0][DATA][21] ), .E(n378), .F(\chs_in_f[1][DATA][21] ), .Z(
        n235) );
  HS65_LS_AOI222X2 U228 ( .A(n398), .B(\chs_in_f[2][DATA][23] ), .C(n358), .D(
        \chs_in_f[0][DATA][23] ), .E(n378), .F(\chs_in_f[1][DATA][23] ), .Z(
        n233) );
  HS65_LS_AOI222X2 U229 ( .A(n398), .B(\chs_in_f[2][DATA][25] ), .C(n358), .D(
        \chs_in_f[0][DATA][25] ), .E(n378), .F(\chs_in_f[1][DATA][25] ), .Z(
        n231) );
  HS65_LS_AOI222X2 U230 ( .A(n398), .B(\chs_in_f[2][DATA][27] ), .C(n358), .D(
        \chs_in_f[0][DATA][27] ), .E(n378), .F(\chs_in_f[1][DATA][27] ), .Z(
        n229) );
  HS65_LS_AOI222X2 U231 ( .A(n398), .B(\chs_in_f[2][DATA][30] ), .C(n358), .D(
        \chs_in_f[0][DATA][30] ), .E(n378), .F(\chs_in_f[1][DATA][30] ), .Z(
        n225) );
  HS65_LS_AOI222X2 U232 ( .A(n410), .B(\chs_in_f[2][DATA][30] ), .C(n370), .D(
        \chs_in_f[0][DATA][30] ), .E(n390), .F(\chs_in_f[1][DATA][30] ), .Z(
        n123) );
  HS65_LS_AOI222X2 U233 ( .A(n406), .B(\chs_in_f[2][DATA][30] ), .C(n366), .D(
        \chs_in_f[0][DATA][30] ), .E(n386), .F(\chs_in_f[1][DATA][30] ), .Z(
        n157) );
  HS65_LS_AOI222X2 U234 ( .A(n402), .B(\chs_in_f[2][DATA][30] ), .C(n362), .D(
        \chs_in_f[0][DATA][30] ), .E(n382), .F(\chs_in_f[1][DATA][30] ), .Z(
        n191) );
  HS65_LS_AOI222X2 U235 ( .A(n397), .B(\chs_in_f[2][DATA][18] ), .C(n357), .D(
        \chs_in_f[0][DATA][18] ), .E(n377), .F(\chs_in_f[1][DATA][18] ), .Z(
        n239) );
  HS65_LS_AOI222X2 U236 ( .A(n413), .B(\chs_in_f[2][DATA][9] ), .C(n375), .D(
        \chs_in_f[0][DATA][9] ), .E(n393), .F(\chs_in_f[1][DATA][9] ), .Z(n79)
         );
  HS65_LS_OAI212X3 U237 ( .A(n74), .B(n337), .C(n40), .D(n352), .E(n118), .Z(
        \chs_out_f[3][DATA][4] ) );
  HS65_LS_OAI212X3 U238 ( .A(n72), .B(n337), .C(n38), .D(n352), .E(n116), .Z(
        \chs_out_f[3][DATA][6] ) );
  HS65_LS_OAI212X3 U239 ( .A(n70), .B(n337), .C(n36), .D(n352), .E(n114), .Z(
        \chs_out_f[3][DATA][8] ) );
  HS65_LS_OAI212X3 U240 ( .A(n74), .B(n334), .C(n40), .D(n349), .E(n152), .Z(
        \chs_out_f[2][DATA][4] ) );
  HS65_LS_OAI212X3 U241 ( .A(n72), .B(n334), .C(n38), .D(n349), .E(n150), .Z(
        \chs_out_f[2][DATA][6] ) );
  HS65_LS_OAI212X3 U242 ( .A(n70), .B(n334), .C(n36), .D(n349), .E(n148), .Z(
        \chs_out_f[2][DATA][8] ) );
  HS65_LS_OAI212X3 U243 ( .A(n74), .B(n331), .C(n40), .D(n346), .E(n186), .Z(
        \chs_out_f[1][DATA][4] ) );
  HS65_LS_OAI212X3 U244 ( .A(n72), .B(n331), .C(n38), .D(n346), .E(n184), .Z(
        \chs_out_f[1][DATA][6] ) );
  HS65_LS_OAI212X3 U245 ( .A(n70), .B(n331), .C(n36), .D(n346), .E(n182), .Z(
        \chs_out_f[1][DATA][8] ) );
  HS65_LS_OAI212X3 U246 ( .A(n75), .B(n337), .C(n41), .D(n352), .E(n119), .Z(
        \chs_out_f[3][DATA][3] ) );
  HS65_LS_OAI212X3 U247 ( .A(n73), .B(n337), .C(n39), .D(n352), .E(n117), .Z(
        \chs_out_f[3][DATA][5] ) );
  HS65_LS_OAI212X3 U248 ( .A(n75), .B(n334), .C(n41), .D(n349), .E(n153), .Z(
        \chs_out_f[2][DATA][3] ) );
  HS65_LS_OAI212X3 U249 ( .A(n73), .B(n334), .C(n39), .D(n349), .E(n151), .Z(
        \chs_out_f[2][DATA][5] ) );
  HS65_LS_OAI212X3 U250 ( .A(n75), .B(n331), .C(n41), .D(n346), .E(n187), .Z(
        \chs_out_f[1][DATA][3] ) );
  HS65_LS_OAI212X3 U251 ( .A(n73), .B(n331), .C(n39), .D(n346), .E(n185), .Z(
        \chs_out_f[1][DATA][5] ) );
  HS65_LS_OAI212X3 U252 ( .A(n69), .B(n328), .C(n35), .D(n343), .E(n215), .Z(
        \chs_out_f[0][DATA][9] ) );
  HS65_LS_OAI212X3 U253 ( .A(n69), .B(n337), .C(n35), .D(n352), .E(n113), .Z(
        \chs_out_f[3][DATA][9] ) );
  HS65_LS_OAI212X3 U254 ( .A(n69), .B(n334), .C(n35), .D(n349), .E(n147), .Z(
        \chs_out_f[2][DATA][9] ) );
  HS65_LS_OAI212X3 U255 ( .A(n69), .B(n331), .C(n35), .D(n346), .E(n181), .Z(
        \chs_out_f[1][DATA][9] ) );
  HS65_LS_AOI222X2 U256 ( .A(n399), .B(\chs_in_f[2][DATA][4] ), .C(n359), .D(
        \chs_in_f[0][DATA][4] ), .E(n379), .F(\chs_in_f[1][DATA][4] ), .Z(n220) );
  HS65_LS_AOI222X2 U257 ( .A(n399), .B(\chs_in_f[2][DATA][6] ), .C(n359), .D(
        \chs_in_f[0][DATA][6] ), .E(n379), .F(\chs_in_f[1][DATA][6] ), .Z(n218) );
  HS65_LS_AOI222X2 U258 ( .A(n399), .B(\chs_in_f[2][DATA][8] ), .C(n359), .D(
        \chs_in_f[0][DATA][8] ), .E(n379), .F(\chs_in_f[1][DATA][8] ), .Z(n216) );
  HS65_LS_AOI222X2 U259 ( .A(n399), .B(\chs_in_f[2][DATA][3] ), .C(n359), .D(
        \chs_in_f[0][DATA][3] ), .E(n379), .F(\chs_in_f[1][DATA][3] ), .Z(n221) );
  HS65_LS_AOI222X2 U260 ( .A(n399), .B(\chs_in_f[2][DATA][5] ), .C(n359), .D(
        \chs_in_f[0][DATA][5] ), .E(n379), .F(\chs_in_f[1][DATA][5] ), .Z(n219) );
  HS65_LS_OAI212X3 U261 ( .A(n339), .B(n48), .C(n354), .D(n14), .E(n89), .Z(
        \chs_out_f[4][DATA][30] ) );
  HS65_LS_AOI222X2 U262 ( .A(\chs_in_f[2][DATA][8] ), .B(n413), .C(
        \chs_in_f[0][DATA][8] ), .D(n375), .E(\chs_in_f[1][DATA][8] ), .F(n393), .Z(n80) );
  HS65_LS_AOI222X2 U263 ( .A(\chs_in_f[2][DATA][3] ), .B(n413), .C(
        \chs_in_f[0][DATA][3] ), .D(n375), .E(\chs_in_f[1][DATA][3] ), .F(n393), .Z(n85) );
  HS65_LS_OR2X9 U264 ( .A(n49), .B(n336), .Z(n321) );
  HS65_LS_OR2X9 U265 ( .A(n15), .B(n351), .Z(n322) );
  HS65_LS_NAND3X5 U266 ( .A(n321), .B(n322), .C(n125), .Z(
        \chs_out_f[3][DATA][29] ) );
  HS65_LH_NAND2X2 U267 ( .A(n410), .B(\chs_in_f[2][DATA][29] ), .Z(n323) );
  HS65_LH_NAND2X2 U268 ( .A(n390), .B(\chs_in_f[1][DATA][29] ), .Z(n325) );
  HS65_LS_AND3X9 U269 ( .A(n323), .B(n324), .C(n325), .Z(n125) );
  HS65_LS_BFX9 U270 ( .A(preset), .Z(n416) );
  HS65_LS_BFX9 U271 ( .A(n1), .Z(n354) );
  HS65_LS_BFX9 U272 ( .A(n6), .Z(n339) );
  HS65_LS_BFX9 U273 ( .A(n392), .Z(n393) );
  HS65_LS_BFX9 U274 ( .A(n1), .Z(n353) );
  HS65_LS_BFX9 U275 ( .A(n372), .Z(n374) );
  HS65_LS_BFX9 U276 ( .A(n6), .Z(n338) );
  HS65_LS_BFX9 U277 ( .A(n7), .Z(n335) );
  HS65_LS_BFX9 U278 ( .A(n7), .Z(n336) );
  HS65_LS_BFX9 U279 ( .A(n8), .Z(n332) );
  HS65_LS_BFX9 U280 ( .A(n8), .Z(n333) );
  HS65_LS_BFX9 U281 ( .A(n9), .Z(n329) );
  HS65_LS_BFX9 U282 ( .A(n9), .Z(n330) );
  HS65_LS_BFX9 U283 ( .A(n10), .Z(n326) );
  HS65_LS_BFX9 U284 ( .A(n10), .Z(n327) );
  HS65_LS_BFX9 U285 ( .A(n388), .Z(n389) );
  HS65_LS_BFX9 U286 ( .A(n384), .Z(n385) );
  HS65_LS_BFX9 U287 ( .A(n380), .Z(n381) );
  HS65_LS_BFX9 U288 ( .A(n376), .Z(n377) );
  HS65_LS_BFX9 U289 ( .A(n376), .Z(n378) );
  HS65_LS_BFX9 U290 ( .A(n408), .Z(n410) );
  HS65_LS_BFX9 U291 ( .A(n404), .Z(n405) );
  HS65_LS_BFX9 U292 ( .A(n400), .Z(n401) );
  HS65_LS_BFX9 U293 ( .A(n396), .Z(n397) );
  HS65_LS_BFX9 U294 ( .A(n396), .Z(n398) );
  HS65_LS_BFX9 U295 ( .A(n368), .Z(n369) );
  HS65_LS_BFX9 U296 ( .A(n368), .Z(n370) );
  HS65_LS_BFX9 U297 ( .A(n364), .Z(n365) );
  HS65_LS_BFX9 U298 ( .A(n360), .Z(n361) );
  HS65_LS_BFX9 U299 ( .A(n360), .Z(n362) );
  HS65_LS_BFX9 U300 ( .A(n356), .Z(n357) );
  HS65_LS_BFX9 U301 ( .A(n356), .Z(n358) );
  HS65_LS_BFX9 U302 ( .A(n6), .Z(n340) );
  HS65_LS_BFX9 U303 ( .A(n2), .Z(n350) );
  HS65_LS_BFX9 U304 ( .A(n2), .Z(n351) );
  HS65_LS_BFX9 U305 ( .A(n3), .Z(n347) );
  HS65_LS_BFX9 U306 ( .A(n3), .Z(n348) );
  HS65_LS_BFX9 U307 ( .A(n4), .Z(n344) );
  HS65_LS_BFX9 U308 ( .A(n4), .Z(n345) );
  HS65_LS_BFX9 U309 ( .A(n5), .Z(n341) );
  HS65_LS_BFX9 U310 ( .A(n5), .Z(n342) );
  HS65_LS_BFX9 U311 ( .A(n372), .Z(n375) );
  HS65_LS_BFX9 U312 ( .A(n380), .Z(n383) );
  HS65_LS_BFX9 U313 ( .A(n376), .Z(n379) );
  HS65_LS_BFX9 U314 ( .A(n396), .Z(n399) );
  HS65_LS_BFX9 U315 ( .A(n2), .Z(n352) );
  HS65_LS_BFX9 U316 ( .A(n3), .Z(n349) );
  HS65_LS_BFX9 U317 ( .A(n4), .Z(n346) );
  HS65_LS_BFX9 U318 ( .A(n5), .Z(n343) );
  HS65_LS_BFX9 U319 ( .A(n356), .Z(n359) );
  HS65_LS_BFX9 U320 ( .A(n1), .Z(n355) );
  HS65_LS_BFX9 U321 ( .A(n7), .Z(n337) );
  HS65_LS_BFX9 U322 ( .A(n8), .Z(n334) );
  HS65_LS_BFX9 U323 ( .A(n9), .Z(n331) );
  HS65_LS_BFX9 U324 ( .A(n10), .Z(n328) );
  HS65_LS_BFX9 U325 ( .A(n392), .Z(n395) );
  HS65_LS_OAI212X5 U326 ( .A(n338), .B(n78), .C(n353), .D(n44), .E(n112), .Z(
        \chs_out_f[4][DATA][0] ) );
  HS65_LS_OAI212X5 U327 ( .A(n340), .B(n75), .C(n355), .D(n41), .E(n85), .Z(
        \chs_out_f[4][DATA][3] ) );
  HS65_LS_OAI212X5 U328 ( .A(n340), .B(n74), .C(n355), .D(n40), .E(n84), .Z(
        \chs_out_f[4][DATA][4] ) );
  HS65_LS_OAI212X5 U329 ( .A(n340), .B(n73), .C(n355), .D(n39), .E(n83), .Z(
        \chs_out_f[4][DATA][5] ) );
  HS65_LS_OAI212X5 U330 ( .A(n340), .B(n72), .C(n355), .D(n38), .E(n82), .Z(
        \chs_out_f[4][DATA][6] ) );
  HS65_LS_OAI212X5 U331 ( .A(n340), .B(n70), .C(n355), .D(n36), .E(n80), .Z(
        \chs_out_f[4][DATA][8] ) );
  HS65_LS_OAI212X5 U332 ( .A(n338), .B(n68), .C(n353), .D(n34), .E(n111), .Z(
        \chs_out_f[4][DATA][10] ) );
  HS65_LS_OAI212X5 U333 ( .A(n338), .B(n67), .C(n353), .D(n33), .E(n110), .Z(
        \chs_out_f[4][DATA][11] ) );
  HS65_LS_OAI212X5 U334 ( .A(n338), .B(n65), .C(n353), .D(n31), .E(n108), .Z(
        \chs_out_f[4][DATA][13] ) );
  HS65_LS_OAI212X5 U335 ( .A(n338), .B(n64), .C(n353), .D(n30), .E(n107), .Z(
        \chs_out_f[4][DATA][14] ) );
  HS65_LS_OAI212X5 U336 ( .A(n338), .B(n63), .C(n353), .D(n29), .E(n106), .Z(
        \chs_out_f[4][DATA][15] ) );
  HS65_LS_OAI212X5 U337 ( .A(n338), .B(n62), .C(n353), .D(n28), .E(n105), .Z(
        \chs_out_f[4][DATA][16] ) );
  HS65_LS_OAI212X5 U338 ( .A(n338), .B(n60), .C(n353), .D(n26), .E(n103), .Z(
        \chs_out_f[4][DATA][18] ) );
  HS65_LS_OAI212X5 U339 ( .A(n338), .B(n59), .C(n353), .D(n25), .E(n102), .Z(
        \chs_out_f[4][DATA][19] ) );
  HS65_LS_OAI212X5 U340 ( .A(n339), .B(n58), .C(n353), .D(n24), .E(n100), .Z(
        \chs_out_f[4][DATA][20] ) );
  HS65_LS_OAI212X5 U341 ( .A(n339), .B(n57), .C(n354), .D(n23), .E(n99), .Z(
        \chs_out_f[4][DATA][21] ) );
  HS65_LS_OAI212X5 U342 ( .A(n339), .B(n56), .C(n354), .D(n22), .E(n98), .Z(
        \chs_out_f[4][DATA][22] ) );
  HS65_LS_OAI212X5 U343 ( .A(n339), .B(n55), .C(n354), .D(n21), .E(n97), .Z(
        \chs_out_f[4][DATA][23] ) );
  HS65_LS_OAI212X5 U344 ( .A(n339), .B(n54), .C(n354), .D(n20), .E(n96), .Z(
        \chs_out_f[4][DATA][24] ) );
  HS65_LS_OAI212X5 U345 ( .A(n339), .B(n53), .C(n354), .D(n19), .E(n95), .Z(
        \chs_out_f[4][DATA][25] ) );
  HS65_LS_OAI212X5 U346 ( .A(n339), .B(n52), .C(n354), .D(n18), .E(n94), .Z(
        \chs_out_f[4][DATA][26] ) );
  HS65_LS_OAI212X5 U347 ( .A(n339), .B(n51), .C(n354), .D(n17), .E(n93), .Z(
        \chs_out_f[4][DATA][27] ) );
  HS65_LS_OAI212X5 U348 ( .A(n339), .B(n50), .C(n354), .D(n16), .E(n92), .Z(
        \chs_out_f[4][DATA][28] ) );
  HS65_LS_AOI222X2 U349 ( .A(\chs_in_f[2][DATA][30] ), .B(n413), .C(
        \chs_in_f[0][DATA][30] ), .D(n374), .E(\chs_in_f[1][DATA][30] ), .F(
        n393), .Z(n89) );
  HS65_LS_OAI212X5 U350 ( .A(n340), .B(n46), .C(n354), .D(n12), .E(n87), .Z(
        \chs_out_f[4][DATA][32] ) );
  HS65_LS_AOI222X2 U351 ( .A(\chs_in_f[2][DATA][32] ), .B(n413), .C(
        \chs_in_f[0][DATA][32] ), .D(n375), .E(\chs_in_f[1][DATA][32] ), .F(
        n393), .Z(n87) );
  HS65_LS_OAI212X5 U352 ( .A(n340), .B(n45), .C(n355), .D(n11), .E(n86), .Z(
        \chs_out_f[4][DATA][33] ) );
  HS65_LS_AOI222X2 U353 ( .A(\chs_in_f[2][DATA][33] ), .B(n413), .C(
        \chs_in_f[0][DATA][33] ), .D(n375), .E(\chs_in_f[1][DATA][33] ), .F(
        n393), .Z(n86) );
  HS65_LS_AOI222X2 U354 ( .A(n411), .B(\chs_in_f[2][DATA][9] ), .C(n371), .D(
        \chs_in_f[0][DATA][9] ), .E(n391), .F(\chs_in_f[1][DATA][9] ), .Z(n113) );
  HS65_LS_AOI222X2 U355 ( .A(n407), .B(\chs_in_f[2][DATA][9] ), .C(n367), .D(
        \chs_in_f[0][DATA][9] ), .E(n387), .F(\chs_in_f[1][DATA][9] ), .Z(n147) );
  HS65_LS_AOI222X2 U356 ( .A(n403), .B(\chs_in_f[2][DATA][9] ), .C(n363), .D(
        \chs_in_f[0][DATA][9] ), .E(n383), .F(\chs_in_f[1][DATA][9] ), .Z(n181) );
  HS65_LS_AOI222X2 U357 ( .A(n399), .B(\chs_in_f[2][DATA][9] ), .C(n359), .D(
        \chs_in_f[0][DATA][9] ), .E(n379), .F(\chs_in_f[1][DATA][9] ), .Z(n215) );
  HS65_LS_OAI212X5 U358 ( .A(n69), .B(n340), .C(n35), .D(n355), .E(n79), .Z(
        \chs_out_f[4][DATA][9] ) );
  HS65_LS_AOI222X2 U359 ( .A(n410), .B(\chs_in_f[2][DATA][2] ), .C(n370), .D(
        \chs_in_f[0][DATA][2] ), .E(n390), .F(\chs_in_f[1][DATA][2] ), .Z(n124) );
  HS65_LS_AOI222X2 U360 ( .A(n411), .B(\chs_in_f[2][DATA][3] ), .C(n371), .D(
        \chs_in_f[0][DATA][3] ), .E(n391), .F(\chs_in_f[1][DATA][3] ), .Z(n119) );
  HS65_LS_AOI222X2 U361 ( .A(n411), .B(\chs_in_f[2][DATA][4] ), .C(n371), .D(
        \chs_in_f[0][DATA][4] ), .E(n391), .F(\chs_in_f[1][DATA][4] ), .Z(n118) );
  HS65_LS_AOI222X2 U362 ( .A(n411), .B(\chs_in_f[2][DATA][5] ), .C(n371), .D(
        \chs_in_f[0][DATA][5] ), .E(n391), .F(\chs_in_f[1][DATA][5] ), .Z(n117) );
  HS65_LS_AOI222X2 U363 ( .A(n411), .B(\chs_in_f[2][DATA][6] ), .C(n371), .D(
        \chs_in_f[0][DATA][6] ), .E(n391), .F(\chs_in_f[1][DATA][6] ), .Z(n116) );
  HS65_LS_AOI222X2 U364 ( .A(n411), .B(\chs_in_f[2][DATA][8] ), .C(n371), .D(
        \chs_in_f[0][DATA][8] ), .E(n391), .F(\chs_in_f[1][DATA][8] ), .Z(n114) );
  HS65_LS_AOI222X2 U365 ( .A(n409), .B(\chs_in_f[2][DATA][10] ), .C(n369), .D(
        \chs_in_f[0][DATA][10] ), .E(n389), .F(\chs_in_f[1][DATA][10] ), .Z(
        n145) );
  HS65_LS_AOI222X2 U366 ( .A(n409), .B(\chs_in_f[2][DATA][11] ), .C(n369), .D(
        \chs_in_f[0][DATA][11] ), .E(n389), .F(\chs_in_f[1][DATA][11] ), .Z(
        n144) );
  HS65_LS_AOI222X2 U367 ( .A(n409), .B(\chs_in_f[2][DATA][12] ), .C(n369), .D(
        \chs_in_f[0][DATA][12] ), .E(n389), .F(\chs_in_f[1][DATA][12] ), .Z(
        n143) );
  HS65_LS_AOI222X2 U368 ( .A(n409), .B(\chs_in_f[2][DATA][13] ), .C(n369), .D(
        \chs_in_f[0][DATA][13] ), .E(n389), .F(\chs_in_f[1][DATA][13] ), .Z(
        n142) );
  HS65_LS_AOI222X2 U369 ( .A(n409), .B(\chs_in_f[2][DATA][14] ), .C(n369), .D(
        \chs_in_f[0][DATA][14] ), .E(n389), .F(\chs_in_f[1][DATA][14] ), .Z(
        n141) );
  HS65_LS_AOI222X2 U370 ( .A(n409), .B(\chs_in_f[2][DATA][15] ), .C(n369), .D(
        \chs_in_f[0][DATA][15] ), .E(n389), .F(\chs_in_f[1][DATA][15] ), .Z(
        n140) );
  HS65_LS_AOI222X2 U371 ( .A(n409), .B(\chs_in_f[2][DATA][16] ), .C(n369), .D(
        \chs_in_f[0][DATA][16] ), .E(n389), .F(\chs_in_f[1][DATA][16] ), .Z(
        n139) );
  HS65_LS_AOI222X2 U372 ( .A(n409), .B(\chs_in_f[2][DATA][17] ), .C(n369), .D(
        \chs_in_f[0][DATA][17] ), .E(n389), .F(\chs_in_f[1][DATA][17] ), .Z(
        n138) );
  HS65_LS_AOI222X2 U373 ( .A(n409), .B(\chs_in_f[2][DATA][18] ), .C(n369), .D(
        \chs_in_f[0][DATA][18] ), .E(n389), .F(\chs_in_f[1][DATA][18] ), .Z(
        n137) );
  HS65_LS_AOI222X2 U374 ( .A(n409), .B(\chs_in_f[2][DATA][19] ), .C(n369), .D(
        \chs_in_f[0][DATA][19] ), .E(n389), .F(\chs_in_f[1][DATA][19] ), .Z(
        n136) );
  HS65_LS_AOI222X2 U375 ( .A(n410), .B(\chs_in_f[2][DATA][20] ), .C(n370), .D(
        \chs_in_f[0][DATA][20] ), .E(n390), .F(\chs_in_f[1][DATA][20] ), .Z(
        n134) );
  HS65_LS_AOI222X2 U376 ( .A(n410), .B(\chs_in_f[2][DATA][21] ), .C(n370), .D(
        \chs_in_f[0][DATA][21] ), .E(n390), .F(\chs_in_f[1][DATA][21] ), .Z(
        n133) );
  HS65_LS_AOI222X2 U377 ( .A(n410), .B(\chs_in_f[2][DATA][22] ), .C(n370), .D(
        \chs_in_f[0][DATA][22] ), .E(n390), .F(\chs_in_f[1][DATA][22] ), .Z(
        n132) );
  HS65_LS_AOI222X2 U378 ( .A(n410), .B(\chs_in_f[2][DATA][23] ), .C(n370), .D(
        \chs_in_f[0][DATA][23] ), .E(n390), .F(\chs_in_f[1][DATA][23] ), .Z(
        n131) );
  HS65_LS_AOI222X2 U379 ( .A(n410), .B(\chs_in_f[2][DATA][24] ), .C(n370), .D(
        \chs_in_f[0][DATA][24] ), .E(n390), .F(\chs_in_f[1][DATA][24] ), .Z(
        n130) );
  HS65_LS_AOI222X2 U380 ( .A(n410), .B(\chs_in_f[2][DATA][25] ), .C(n370), .D(
        \chs_in_f[0][DATA][25] ), .E(n390), .F(\chs_in_f[1][DATA][25] ), .Z(
        n129) );
  HS65_LS_AOI222X2 U381 ( .A(n410), .B(\chs_in_f[2][DATA][26] ), .C(n370), .D(
        \chs_in_f[0][DATA][26] ), .E(n390), .F(\chs_in_f[1][DATA][26] ), .Z(
        n128) );
  HS65_LS_AOI222X2 U382 ( .A(n410), .B(\chs_in_f[2][DATA][27] ), .C(n370), .D(
        \chs_in_f[0][DATA][27] ), .E(n390), .F(\chs_in_f[1][DATA][27] ), .Z(
        n127) );
  HS65_LS_AOI222X2 U383 ( .A(n410), .B(\chs_in_f[2][DATA][28] ), .C(n370), .D(
        \chs_in_f[0][DATA][28] ), .E(n390), .F(\chs_in_f[1][DATA][28] ), .Z(
        n126) );
  HS65_LS_OAI212X5 U384 ( .A(n48), .B(n336), .C(n14), .D(n351), .E(n123), .Z(
        \chs_out_f[3][DATA][30] ) );
  HS65_LS_OAI212X5 U385 ( .A(n47), .B(n336), .C(n13), .D(n352), .E(n122), .Z(
        \chs_out_f[3][DATA][31] ) );
  HS65_LS_AOI222X4 U386 ( .A(n411), .B(\chs_in_f[2][DATA][31] ), .C(n371), .D(
        \chs_in_f[0][DATA][31] ), .E(n391), .F(\chs_in_f[1][DATA][31] ), .Z(
        n122) );
  HS65_LS_OAI212X5 U387 ( .A(n46), .B(n336), .C(n12), .D(n352), .E(n121), .Z(
        \chs_out_f[3][DATA][32] ) );
  HS65_LS_AOI222X4 U388 ( .A(n411), .B(\chs_in_f[2][DATA][32] ), .C(n371), .D(
        \chs_in_f[0][DATA][32] ), .E(n391), .F(\chs_in_f[1][DATA][32] ), .Z(
        n121) );
  HS65_LS_OAI212X5 U389 ( .A(n45), .B(n337), .C(n11), .D(n352), .E(n120), .Z(
        \chs_out_f[3][DATA][33] ) );
  HS65_LS_AOI222X4 U390 ( .A(n411), .B(\chs_in_f[2][DATA][33] ), .C(n371), .D(
        \chs_in_f[0][DATA][33] ), .E(n391), .F(\chs_in_f[1][DATA][33] ), .Z(
        n120) );
  HS65_LS_AOI222X2 U391 ( .A(n405), .B(\chs_in_f[2][DATA][0] ), .C(n365), .D(
        \chs_in_f[0][DATA][0] ), .E(n385), .F(\chs_in_f[1][DATA][0] ), .Z(n180) );
  HS65_LS_AOI222X2 U392 ( .A(n406), .B(\chs_in_f[2][DATA][2] ), .C(n366), .D(
        \chs_in_f[0][DATA][2] ), .E(n386), .F(\chs_in_f[1][DATA][2] ), .Z(n158) );
  HS65_LS_AOI222X2 U393 ( .A(n407), .B(\chs_in_f[2][DATA][3] ), .C(n367), .D(
        \chs_in_f[0][DATA][3] ), .E(n387), .F(\chs_in_f[1][DATA][3] ), .Z(n153) );
  HS65_LS_AOI222X2 U394 ( .A(n407), .B(\chs_in_f[2][DATA][4] ), .C(n367), .D(
        \chs_in_f[0][DATA][4] ), .E(n387), .F(\chs_in_f[1][DATA][4] ), .Z(n152) );
  HS65_LS_AOI222X2 U395 ( .A(n407), .B(\chs_in_f[2][DATA][5] ), .C(n367), .D(
        \chs_in_f[0][DATA][5] ), .E(n387), .F(\chs_in_f[1][DATA][5] ), .Z(n151) );
  HS65_LS_AOI222X2 U396 ( .A(n407), .B(\chs_in_f[2][DATA][6] ), .C(n367), .D(
        \chs_in_f[0][DATA][6] ), .E(n387), .F(\chs_in_f[1][DATA][6] ), .Z(n150) );
  HS65_LS_AOI222X2 U397 ( .A(n407), .B(\chs_in_f[2][DATA][8] ), .C(n367), .D(
        \chs_in_f[0][DATA][8] ), .E(n387), .F(\chs_in_f[1][DATA][8] ), .Z(n148) );
  HS65_LS_AOI222X2 U398 ( .A(n405), .B(\chs_in_f[2][DATA][10] ), .C(n365), .D(
        \chs_in_f[0][DATA][10] ), .E(n385), .F(\chs_in_f[1][DATA][10] ), .Z(
        n179) );
  HS65_LS_AOI222X2 U399 ( .A(n405), .B(\chs_in_f[2][DATA][11] ), .C(n365), .D(
        \chs_in_f[0][DATA][11] ), .E(n385), .F(\chs_in_f[1][DATA][11] ), .Z(
        n178) );
  HS65_LS_AOI222X2 U400 ( .A(n405), .B(\chs_in_f[2][DATA][12] ), .C(n365), .D(
        \chs_in_f[0][DATA][12] ), .E(n385), .F(\chs_in_f[1][DATA][12] ), .Z(
        n177) );
  HS65_LS_AOI222X2 U401 ( .A(n405), .B(\chs_in_f[2][DATA][13] ), .C(n365), .D(
        \chs_in_f[0][DATA][13] ), .E(n385), .F(\chs_in_f[1][DATA][13] ), .Z(
        n176) );
  HS65_LS_AOI222X2 U402 ( .A(n405), .B(\chs_in_f[2][DATA][14] ), .C(n365), .D(
        \chs_in_f[0][DATA][14] ), .E(n385), .F(\chs_in_f[1][DATA][14] ), .Z(
        n175) );
  HS65_LS_AOI222X2 U403 ( .A(n405), .B(\chs_in_f[2][DATA][15] ), .C(n365), .D(
        \chs_in_f[0][DATA][15] ), .E(n385), .F(\chs_in_f[1][DATA][15] ), .Z(
        n174) );
  HS65_LS_AOI222X2 U404 ( .A(n405), .B(\chs_in_f[2][DATA][16] ), .C(n365), .D(
        \chs_in_f[0][DATA][16] ), .E(n385), .F(\chs_in_f[1][DATA][16] ), .Z(
        n173) );
  HS65_LS_AOI222X2 U405 ( .A(n405), .B(\chs_in_f[2][DATA][17] ), .C(n365), .D(
        \chs_in_f[0][DATA][17] ), .E(n385), .F(\chs_in_f[1][DATA][17] ), .Z(
        n172) );
  HS65_LS_AOI222X2 U406 ( .A(n405), .B(\chs_in_f[2][DATA][18] ), .C(n365), .D(
        \chs_in_f[0][DATA][18] ), .E(n385), .F(\chs_in_f[1][DATA][18] ), .Z(
        n171) );
  HS65_LS_AOI222X2 U407 ( .A(n405), .B(\chs_in_f[2][DATA][19] ), .C(n365), .D(
        \chs_in_f[0][DATA][19] ), .E(n385), .F(\chs_in_f[1][DATA][19] ), .Z(
        n170) );
  HS65_LS_AOI222X2 U408 ( .A(n406), .B(\chs_in_f[2][DATA][21] ), .C(n366), .D(
        \chs_in_f[0][DATA][21] ), .E(n386), .F(\chs_in_f[1][DATA][21] ), .Z(
        n167) );
  HS65_LS_AOI222X2 U409 ( .A(n406), .B(\chs_in_f[2][DATA][22] ), .C(n366), .D(
        \chs_in_f[0][DATA][22] ), .E(n386), .F(\chs_in_f[1][DATA][22] ), .Z(
        n166) );
  HS65_LS_AOI222X2 U410 ( .A(n406), .B(\chs_in_f[2][DATA][23] ), .C(n366), .D(
        \chs_in_f[0][DATA][23] ), .E(n386), .F(\chs_in_f[1][DATA][23] ), .Z(
        n165) );
  HS65_LS_AOI222X2 U411 ( .A(n406), .B(\chs_in_f[2][DATA][24] ), .C(n366), .D(
        \chs_in_f[0][DATA][24] ), .E(n386), .F(\chs_in_f[1][DATA][24] ), .Z(
        n164) );
  HS65_LS_AOI222X2 U412 ( .A(n406), .B(\chs_in_f[2][DATA][25] ), .C(n366), .D(
        \chs_in_f[0][DATA][25] ), .E(n386), .F(\chs_in_f[1][DATA][25] ), .Z(
        n163) );
  HS65_LS_AOI222X2 U413 ( .A(n406), .B(\chs_in_f[2][DATA][26] ), .C(n366), .D(
        \chs_in_f[0][DATA][26] ), .E(n386), .F(\chs_in_f[1][DATA][26] ), .Z(
        n162) );
  HS65_LS_AOI222X2 U414 ( .A(n406), .B(\chs_in_f[2][DATA][27] ), .C(n366), .D(
        \chs_in_f[0][DATA][27] ), .E(n386), .F(\chs_in_f[1][DATA][27] ), .Z(
        n161) );
  HS65_LS_AOI222X2 U415 ( .A(n406), .B(\chs_in_f[2][DATA][28] ), .C(n366), .D(
        \chs_in_f[0][DATA][28] ), .E(n386), .F(\chs_in_f[1][DATA][28] ), .Z(
        n160) );
  HS65_LS_OAI212X5 U416 ( .A(n48), .B(n333), .C(n14), .D(n348), .E(n157), .Z(
        \chs_out_f[2][DATA][30] ) );
  HS65_LS_OAI212X5 U417 ( .A(n47), .B(n333), .C(n13), .D(n349), .E(n156), .Z(
        \chs_out_f[2][DATA][31] ) );
  HS65_LS_AOI222X4 U418 ( .A(n407), .B(\chs_in_f[2][DATA][31] ), .C(n367), .D(
        \chs_in_f[0][DATA][31] ), .E(n387), .F(\chs_in_f[1][DATA][31] ), .Z(
        n156) );
  HS65_LS_OAI212X5 U419 ( .A(n46), .B(n333), .C(n12), .D(n349), .E(n155), .Z(
        \chs_out_f[2][DATA][32] ) );
  HS65_LS_AOI222X4 U420 ( .A(n407), .B(\chs_in_f[2][DATA][32] ), .C(n367), .D(
        \chs_in_f[0][DATA][32] ), .E(n387), .F(\chs_in_f[1][DATA][32] ), .Z(
        n155) );
  HS65_LS_OAI212X5 U421 ( .A(n45), .B(n334), .C(n11), .D(n349), .E(n154), .Z(
        \chs_out_f[2][DATA][33] ) );
  HS65_LS_AOI222X4 U422 ( .A(n407), .B(\chs_in_f[2][DATA][33] ), .C(n367), .D(
        \chs_in_f[0][DATA][33] ), .E(n387), .F(\chs_in_f[1][DATA][33] ), .Z(
        n154) );
  HS65_LS_AOI222X2 U423 ( .A(n401), .B(\chs_in_f[2][DATA][0] ), .C(n361), .D(
        \chs_in_f[0][DATA][0] ), .E(n381), .F(\chs_in_f[1][DATA][0] ), .Z(n214) );
  HS65_LS_AOI222X2 U424 ( .A(n402), .B(\chs_in_f[2][DATA][2] ), .C(n362), .D(
        \chs_in_f[0][DATA][2] ), .E(n382), .F(\chs_in_f[1][DATA][2] ), .Z(n192) );
  HS65_LS_AOI222X2 U425 ( .A(n403), .B(\chs_in_f[2][DATA][3] ), .C(n363), .D(
        \chs_in_f[0][DATA][3] ), .E(n383), .F(\chs_in_f[1][DATA][3] ), .Z(n187) );
  HS65_LS_AOI222X2 U426 ( .A(n403), .B(\chs_in_f[2][DATA][4] ), .C(n363), .D(
        \chs_in_f[0][DATA][4] ), .E(n383), .F(\chs_in_f[1][DATA][4] ), .Z(n186) );
  HS65_LS_AOI222X2 U427 ( .A(n403), .B(\chs_in_f[2][DATA][5] ), .C(n363), .D(
        \chs_in_f[0][DATA][5] ), .E(n383), .F(\chs_in_f[1][DATA][5] ), .Z(n185) );
  HS65_LS_AOI222X2 U428 ( .A(n403), .B(\chs_in_f[2][DATA][6] ), .C(n363), .D(
        \chs_in_f[0][DATA][6] ), .E(n383), .F(\chs_in_f[1][DATA][6] ), .Z(n184) );
  HS65_LS_AOI222X2 U429 ( .A(n403), .B(\chs_in_f[2][DATA][8] ), .C(n363), .D(
        \chs_in_f[0][DATA][8] ), .E(n383), .F(\chs_in_f[1][DATA][8] ), .Z(n182) );
  HS65_LS_AOI222X2 U430 ( .A(n401), .B(\chs_in_f[2][DATA][10] ), .C(n361), .D(
        \chs_in_f[0][DATA][10] ), .E(n381), .F(\chs_in_f[1][DATA][10] ), .Z(
        n213) );
  HS65_LS_AOI222X2 U431 ( .A(n401), .B(\chs_in_f[2][DATA][11] ), .C(n361), .D(
        \chs_in_f[0][DATA][11] ), .E(n381), .F(\chs_in_f[1][DATA][11] ), .Z(
        n212) );
  HS65_LS_AOI222X2 U432 ( .A(n401), .B(\chs_in_f[2][DATA][12] ), .C(n361), .D(
        \chs_in_f[0][DATA][12] ), .E(n381), .F(\chs_in_f[1][DATA][12] ), .Z(
        n211) );
  HS65_LS_AOI222X2 U433 ( .A(n401), .B(\chs_in_f[2][DATA][13] ), .C(n361), .D(
        \chs_in_f[0][DATA][13] ), .E(n381), .F(\chs_in_f[1][DATA][13] ), .Z(
        n210) );
  HS65_LS_AOI222X2 U434 ( .A(n401), .B(\chs_in_f[2][DATA][14] ), .C(n361), .D(
        \chs_in_f[0][DATA][14] ), .E(n381), .F(\chs_in_f[1][DATA][14] ), .Z(
        n209) );
  HS65_LS_AOI222X2 U435 ( .A(n401), .B(\chs_in_f[2][DATA][15] ), .C(n361), .D(
        \chs_in_f[0][DATA][15] ), .E(n381), .F(\chs_in_f[1][DATA][15] ), .Z(
        n208) );
  HS65_LS_AOI222X2 U436 ( .A(n401), .B(\chs_in_f[2][DATA][16] ), .C(n361), .D(
        \chs_in_f[0][DATA][16] ), .E(n381), .F(\chs_in_f[1][DATA][16] ), .Z(
        n207) );
  HS65_LS_AOI222X2 U437 ( .A(n401), .B(\chs_in_f[2][DATA][17] ), .C(n361), .D(
        \chs_in_f[0][DATA][17] ), .E(n381), .F(\chs_in_f[1][DATA][17] ), .Z(
        n206) );
  HS65_LS_AOI222X2 U438 ( .A(n401), .B(\chs_in_f[2][DATA][18] ), .C(n361), .D(
        \chs_in_f[0][DATA][18] ), .E(n381), .F(\chs_in_f[1][DATA][18] ), .Z(
        n205) );
  HS65_LS_AOI222X2 U439 ( .A(n401), .B(\chs_in_f[2][DATA][19] ), .C(n361), .D(
        \chs_in_f[0][DATA][19] ), .E(n381), .F(\chs_in_f[1][DATA][19] ), .Z(
        n204) );
  HS65_LS_AOI222X2 U440 ( .A(n402), .B(\chs_in_f[2][DATA][20] ), .C(n362), .D(
        \chs_in_f[0][DATA][20] ), .E(n382), .F(\chs_in_f[1][DATA][20] ), .Z(
        n202) );
  HS65_LS_AOI222X2 U441 ( .A(n402), .B(\chs_in_f[2][DATA][21] ), .C(n362), .D(
        \chs_in_f[0][DATA][21] ), .E(n382), .F(\chs_in_f[1][DATA][21] ), .Z(
        n201) );
  HS65_LS_AOI222X2 U442 ( .A(n402), .B(\chs_in_f[2][DATA][22] ), .C(n362), .D(
        \chs_in_f[0][DATA][22] ), .E(n382), .F(\chs_in_f[1][DATA][22] ), .Z(
        n200) );
  HS65_LS_AOI222X2 U443 ( .A(n402), .B(\chs_in_f[2][DATA][23] ), .C(n362), .D(
        \chs_in_f[0][DATA][23] ), .E(n382), .F(\chs_in_f[1][DATA][23] ), .Z(
        n199) );
  HS65_LS_AOI222X2 U444 ( .A(n402), .B(\chs_in_f[2][DATA][24] ), .C(n362), .D(
        \chs_in_f[0][DATA][24] ), .E(n382), .F(\chs_in_f[1][DATA][24] ), .Z(
        n198) );
  HS65_LS_AOI222X2 U445 ( .A(n402), .B(\chs_in_f[2][DATA][25] ), .C(n362), .D(
        \chs_in_f[0][DATA][25] ), .E(n382), .F(\chs_in_f[1][DATA][25] ), .Z(
        n197) );
  HS65_LS_AOI222X2 U446 ( .A(n402), .B(\chs_in_f[2][DATA][26] ), .C(n362), .D(
        \chs_in_f[0][DATA][26] ), .E(n382), .F(\chs_in_f[1][DATA][26] ), .Z(
        n196) );
  HS65_LS_AOI222X2 U447 ( .A(n402), .B(\chs_in_f[2][DATA][27] ), .C(n362), .D(
        \chs_in_f[0][DATA][27] ), .E(n382), .F(\chs_in_f[1][DATA][27] ), .Z(
        n195) );
  HS65_LS_AOI222X2 U448 ( .A(n402), .B(\chs_in_f[2][DATA][28] ), .C(n362), .D(
        \chs_in_f[0][DATA][28] ), .E(n382), .F(\chs_in_f[1][DATA][28] ), .Z(
        n194) );
  HS65_LS_OAI212X5 U449 ( .A(n48), .B(n330), .C(n14), .D(n345), .E(n191), .Z(
        \chs_out_f[1][DATA][30] ) );
  HS65_LS_OAI212X5 U450 ( .A(n47), .B(n330), .C(n13), .D(n346), .E(n190), .Z(
        \chs_out_f[1][DATA][31] ) );
  HS65_LS_AOI222X4 U451 ( .A(n403), .B(\chs_in_f[2][DATA][31] ), .C(n363), .D(
        \chs_in_f[0][DATA][31] ), .E(n383), .F(\chs_in_f[1][DATA][31] ), .Z(
        n190) );
  HS65_LS_OAI212X5 U452 ( .A(n46), .B(n330), .C(n12), .D(n346), .E(n189), .Z(
        \chs_out_f[1][DATA][32] ) );
  HS65_LS_AOI222X4 U453 ( .A(n403), .B(\chs_in_f[2][DATA][32] ), .C(n363), .D(
        \chs_in_f[0][DATA][32] ), .E(n383), .F(\chs_in_f[1][DATA][32] ), .Z(
        n189) );
  HS65_LS_OAI212X5 U454 ( .A(n45), .B(n331), .C(n11), .D(n346), .E(n188), .Z(
        \chs_out_f[1][DATA][33] ) );
  HS65_LS_AOI222X4 U455 ( .A(n403), .B(\chs_in_f[2][DATA][33] ), .C(n363), .D(
        \chs_in_f[0][DATA][33] ), .E(n383), .F(\chs_in_f[1][DATA][33] ), .Z(
        n188) );
  HS65_LS_OAI212X5 U456 ( .A(n78), .B(n326), .C(n44), .D(n341), .E(n248), .Z(
        \chs_out_f[0][DATA][0] ) );
  HS65_LS_OAI212X5 U457 ( .A(n76), .B(n327), .C(n42), .D(n342), .E(n226), .Z(
        \chs_out_f[0][DATA][2] ) );
  HS65_LS_OAI212X5 U458 ( .A(n75), .B(n328), .C(n41), .D(n343), .E(n221), .Z(
        \chs_out_f[0][DATA][3] ) );
  HS65_LS_OAI212X5 U459 ( .A(n74), .B(n328), .C(n40), .D(n343), .E(n220), .Z(
        \chs_out_f[0][DATA][4] ) );
  HS65_LS_OAI212X5 U460 ( .A(n73), .B(n328), .C(n39), .D(n343), .E(n219), .Z(
        \chs_out_f[0][DATA][5] ) );
  HS65_LS_OAI212X5 U461 ( .A(n72), .B(n328), .C(n38), .D(n343), .E(n218), .Z(
        \chs_out_f[0][DATA][6] ) );
  HS65_LS_OAI212X5 U462 ( .A(n71), .B(n328), .C(n37), .D(n343), .E(n217), .Z(
        \chs_out_f[0][DATA][7] ) );
  HS65_LS_OAI212X5 U463 ( .A(n70), .B(n328), .C(n36), .D(n343), .E(n216), .Z(
        \chs_out_f[0][DATA][8] ) );
  HS65_LS_OAI212X5 U464 ( .A(n68), .B(n326), .C(n34), .D(n341), .E(n247), .Z(
        \chs_out_f[0][DATA][10] ) );
  HS65_LS_OAI212X5 U465 ( .A(n67), .B(n326), .C(n33), .D(n341), .E(n246), .Z(
        \chs_out_f[0][DATA][11] ) );
  HS65_LS_OAI212X5 U466 ( .A(n66), .B(n326), .C(n32), .D(n341), .E(n245), .Z(
        \chs_out_f[0][DATA][12] ) );
  HS65_LS_OAI212X5 U467 ( .A(n65), .B(n326), .C(n31), .D(n341), .E(n244), .Z(
        \chs_out_f[0][DATA][13] ) );
  HS65_LS_OAI212X5 U468 ( .A(n64), .B(n326), .C(n30), .D(n341), .E(n243), .Z(
        \chs_out_f[0][DATA][14] ) );
  HS65_LS_OAI212X5 U469 ( .A(n63), .B(n326), .C(n29), .D(n341), .E(n242), .Z(
        \chs_out_f[0][DATA][15] ) );
  HS65_LS_OAI212X5 U470 ( .A(n62), .B(n326), .C(n28), .D(n341), .E(n241), .Z(
        \chs_out_f[0][DATA][16] ) );
  HS65_LS_OAI212X5 U471 ( .A(n61), .B(n326), .C(n27), .D(n341), .E(n240), .Z(
        \chs_out_f[0][DATA][17] ) );
  HS65_LS_OAI212X5 U472 ( .A(n60), .B(n326), .C(n26), .D(n341), .E(n239), .Z(
        \chs_out_f[0][DATA][18] ) );
  HS65_LS_OAI212X5 U473 ( .A(n59), .B(n326), .C(n25), .D(n341), .E(n238), .Z(
        \chs_out_f[0][DATA][19] ) );
  HS65_LS_OAI212X5 U474 ( .A(n58), .B(n326), .C(n24), .D(n342), .E(n236), .Z(
        \chs_out_f[0][DATA][20] ) );
  HS65_LS_OAI212X5 U475 ( .A(n57), .B(n327), .C(n23), .D(n342), .E(n235), .Z(
        \chs_out_f[0][DATA][21] ) );
  HS65_LS_OAI212X5 U476 ( .A(n56), .B(n327), .C(n22), .D(n342), .E(n234), .Z(
        \chs_out_f[0][DATA][22] ) );
  HS65_LS_OAI212X5 U477 ( .A(n55), .B(n327), .C(n21), .D(n342), .E(n233), .Z(
        \chs_out_f[0][DATA][23] ) );
  HS65_LS_OAI212X5 U478 ( .A(n54), .B(n327), .C(n20), .D(n342), .E(n232), .Z(
        \chs_out_f[0][DATA][24] ) );
  HS65_LS_OAI212X5 U479 ( .A(n53), .B(n327), .C(n19), .D(n342), .E(n231), .Z(
        \chs_out_f[0][DATA][25] ) );
  HS65_LS_OAI212X5 U480 ( .A(n52), .B(n327), .C(n18), .D(n342), .E(n230), .Z(
        \chs_out_f[0][DATA][26] ) );
  HS65_LS_OAI212X5 U481 ( .A(n51), .B(n327), .C(n17), .D(n342), .E(n229), .Z(
        \chs_out_f[0][DATA][27] ) );
  HS65_LS_OAI212X5 U482 ( .A(n50), .B(n327), .C(n16), .D(n342), .E(n228), .Z(
        \chs_out_f[0][DATA][28] ) );
  HS65_LS_OAI212X5 U483 ( .A(n49), .B(n327), .C(n15), .D(n342), .E(n227), .Z(
        \chs_out_f[0][DATA][29] ) );
  HS65_LS_OAI212X5 U484 ( .A(n48), .B(n327), .C(n14), .D(n342), .E(n225), .Z(
        \chs_out_f[0][DATA][30] ) );
  HS65_LS_OAI212X5 U485 ( .A(n47), .B(n327), .C(n13), .D(n343), .E(n224), .Z(
        \chs_out_f[0][DATA][31] ) );
  HS65_LS_AOI222X4 U486 ( .A(n399), .B(\chs_in_f[2][DATA][31] ), .C(n359), .D(
        \chs_in_f[0][DATA][31] ), .E(n379), .F(\chs_in_f[1][DATA][31] ), .Z(
        n224) );
  HS65_LS_OAI212X5 U487 ( .A(n46), .B(n327), .C(n12), .D(n343), .E(n223), .Z(
        \chs_out_f[0][DATA][32] ) );
  HS65_LS_AOI222X4 U488 ( .A(n399), .B(\chs_in_f[2][DATA][32] ), .C(n359), .D(
        \chs_in_f[0][DATA][32] ), .E(n379), .F(\chs_in_f[1][DATA][32] ), .Z(
        n223) );
  HS65_LS_OAI212X5 U489 ( .A(n45), .B(n328), .C(n11), .D(n343), .E(n222), .Z(
        \chs_out_f[0][DATA][33] ) );
  HS65_LS_AOI222X4 U490 ( .A(n399), .B(\chs_in_f[2][DATA][33] ), .C(n359), .D(
        \chs_in_f[0][DATA][33] ), .E(n379), .F(\chs_in_f[1][DATA][33] ), .Z(
        n222) );
  HS65_LS_AOI222X2 U491 ( .A(n409), .B(\chs_in_f[2][DATA][1] ), .C(n369), .D(
        \chs_in_f[0][DATA][1] ), .E(n389), .F(\chs_in_f[1][DATA][1] ), .Z(n135) );
  HS65_LS_AOI222X2 U492 ( .A(n405), .B(\chs_in_f[2][DATA][1] ), .C(n365), .D(
        \chs_in_f[0][DATA][1] ), .E(n385), .F(\chs_in_f[1][DATA][1] ), .Z(n169) );
  HS65_LS_AOI222X2 U493 ( .A(n401), .B(\chs_in_f[2][DATA][1] ), .C(n361), .D(
        \chs_in_f[0][DATA][1] ), .E(n381), .F(\chs_in_f[1][DATA][1] ), .Z(n203) );
  HS65_LS_OAI212X5 U494 ( .A(n77), .B(n326), .C(n43), .D(n341), .E(n237), .Z(
        \chs_out_f[0][DATA][1] ) );
  HS65_LS_IVX9 U495 ( .A(\chs_in_f[3][DATA][9] ), .Z(n69) );
  HS65_LS_IVX9 U496 ( .A(\chs_in_f[3][DATA][0] ), .Z(n78) );
  HS65_LS_IVX9 U497 ( .A(\chs_in_f[3][DATA][2] ), .Z(n76) );
  HS65_LS_IVX9 U498 ( .A(\chs_in_f[3][DATA][3] ), .Z(n75) );
  HS65_LS_IVX9 U499 ( .A(\chs_in_f[3][DATA][4] ), .Z(n74) );
  HS65_LS_IVX9 U500 ( .A(\chs_in_f[3][DATA][5] ), .Z(n73) );
  HS65_LS_IVX9 U501 ( .A(\chs_in_f[3][DATA][6] ), .Z(n72) );
  HS65_LS_IVX9 U502 ( .A(\chs_in_f[3][DATA][7] ), .Z(n71) );
  HS65_LS_IVX9 U503 ( .A(\chs_in_f[3][DATA][8] ), .Z(n70) );
  HS65_LS_IVX9 U504 ( .A(\chs_in_f[3][DATA][10] ), .Z(n68) );
  HS65_LS_IVX9 U505 ( .A(\chs_in_f[3][DATA][11] ), .Z(n67) );
  HS65_LS_IVX9 U506 ( .A(\chs_in_f[3][DATA][12] ), .Z(n66) );
  HS65_LS_IVX9 U507 ( .A(\chs_in_f[3][DATA][13] ), .Z(n65) );
  HS65_LS_IVX9 U508 ( .A(\chs_in_f[3][DATA][14] ), .Z(n64) );
  HS65_LS_IVX9 U509 ( .A(\chs_in_f[3][DATA][15] ), .Z(n63) );
  HS65_LS_IVX9 U510 ( .A(\chs_in_f[3][DATA][16] ), .Z(n62) );
  HS65_LS_IVX9 U511 ( .A(\chs_in_f[3][DATA][17] ), .Z(n61) );
  HS65_LS_IVX9 U512 ( .A(\chs_in_f[3][DATA][18] ), .Z(n60) );
  HS65_LS_IVX9 U513 ( .A(\chs_in_f[3][DATA][19] ), .Z(n59) );
  HS65_LS_IVX9 U514 ( .A(\chs_in_f[3][DATA][20] ), .Z(n58) );
  HS65_LS_IVX9 U515 ( .A(\chs_in_f[3][DATA][21] ), .Z(n57) );
  HS65_LS_IVX9 U516 ( .A(\chs_in_f[3][DATA][22] ), .Z(n56) );
  HS65_LS_IVX9 U517 ( .A(\chs_in_f[3][DATA][23] ), .Z(n55) );
  HS65_LS_IVX9 U518 ( .A(\chs_in_f[3][DATA][24] ), .Z(n54) );
  HS65_LS_IVX9 U519 ( .A(\chs_in_f[3][DATA][25] ), .Z(n53) );
  HS65_LS_IVX9 U520 ( .A(\chs_in_f[3][DATA][26] ), .Z(n52) );
  HS65_LS_IVX9 U521 ( .A(\chs_in_f[3][DATA][27] ), .Z(n51) );
  HS65_LS_IVX9 U522 ( .A(\chs_in_f[3][DATA][28] ), .Z(n50) );
  HS65_LS_IVX9 U523 ( .A(\chs_in_f[3][DATA][29] ), .Z(n49) );
  HS65_LS_IVX9 U524 ( .A(\chs_in_f[3][DATA][30] ), .Z(n48) );
  HS65_LS_IVX9 U525 ( .A(\chs_in_f[3][DATA][31] ), .Z(n47) );
  HS65_LS_IVX9 U526 ( .A(\chs_in_f[3][DATA][32] ), .Z(n46) );
  HS65_LS_IVX9 U527 ( .A(\chs_in_f[3][DATA][33] ), .Z(n45) );
  HS65_LS_IVX9 U528 ( .A(\chs_in_f[4][DATA][9] ), .Z(n35) );
  HS65_LS_IVX9 U529 ( .A(\chs_in_f[4][DATA][0] ), .Z(n44) );
  HS65_LS_IVX9 U530 ( .A(\chs_in_f[4][DATA][2] ), .Z(n42) );
  HS65_LS_IVX9 U531 ( .A(\chs_in_f[4][DATA][3] ), .Z(n41) );
  HS65_LS_IVX9 U532 ( .A(\chs_in_f[4][DATA][4] ), .Z(n40) );
  HS65_LS_IVX9 U533 ( .A(\chs_in_f[4][DATA][5] ), .Z(n39) );
  HS65_LS_IVX9 U534 ( .A(\chs_in_f[4][DATA][6] ), .Z(n38) );
  HS65_LS_IVX9 U535 ( .A(\chs_in_f[4][DATA][7] ), .Z(n37) );
  HS65_LS_IVX9 U536 ( .A(\chs_in_f[4][DATA][8] ), .Z(n36) );
  HS65_LS_IVX9 U537 ( .A(\chs_in_f[4][DATA][10] ), .Z(n34) );
  HS65_LS_IVX9 U538 ( .A(\chs_in_f[4][DATA][11] ), .Z(n33) );
  HS65_LS_IVX9 U539 ( .A(\chs_in_f[4][DATA][12] ), .Z(n32) );
  HS65_LS_IVX9 U540 ( .A(\chs_in_f[4][DATA][13] ), .Z(n31) );
  HS65_LS_IVX9 U541 ( .A(\chs_in_f[4][DATA][14] ), .Z(n30) );
  HS65_LS_IVX9 U542 ( .A(\chs_in_f[4][DATA][15] ), .Z(n29) );
  HS65_LS_IVX9 U543 ( .A(\chs_in_f[4][DATA][16] ), .Z(n28) );
  HS65_LS_IVX9 U544 ( .A(\chs_in_f[4][DATA][17] ), .Z(n27) );
  HS65_LS_IVX9 U545 ( .A(\chs_in_f[4][DATA][18] ), .Z(n26) );
  HS65_LS_IVX9 U546 ( .A(\chs_in_f[4][DATA][19] ), .Z(n25) );
  HS65_LS_IVX9 U547 ( .A(\chs_in_f[4][DATA][20] ), .Z(n24) );
  HS65_LS_IVX9 U548 ( .A(\chs_in_f[4][DATA][21] ), .Z(n23) );
  HS65_LS_IVX9 U549 ( .A(\chs_in_f[4][DATA][22] ), .Z(n22) );
  HS65_LS_IVX9 U550 ( .A(\chs_in_f[4][DATA][23] ), .Z(n21) );
  HS65_LS_IVX9 U551 ( .A(\chs_in_f[4][DATA][24] ), .Z(n20) );
  HS65_LS_IVX9 U552 ( .A(\chs_in_f[4][DATA][25] ), .Z(n19) );
  HS65_LS_IVX9 U553 ( .A(\chs_in_f[4][DATA][26] ), .Z(n18) );
  HS65_LS_IVX9 U554 ( .A(\chs_in_f[4][DATA][27] ), .Z(n17) );
  HS65_LS_IVX9 U555 ( .A(\chs_in_f[4][DATA][28] ), .Z(n16) );
  HS65_LS_IVX9 U556 ( .A(\chs_in_f[4][DATA][29] ), .Z(n15) );
  HS65_LS_IVX9 U557 ( .A(\chs_in_f[4][DATA][30] ), .Z(n14) );
  HS65_LS_IVX9 U558 ( .A(\chs_in_f[4][DATA][31] ), .Z(n13) );
  HS65_LS_IVX9 U559 ( .A(\chs_in_f[4][DATA][32] ), .Z(n12) );
  HS65_LS_IVX9 U560 ( .A(\chs_in_f[4][DATA][33] ), .Z(n11) );
  HS65_LS_IVX9 U561 ( .A(\chs_in_f[3][DATA][1] ), .Z(n77) );
  HS65_LS_IVX9 U562 ( .A(\chs_in_f[4][DATA][1] ), .Z(n43) );
  HS65_LS_IVX9 U563 ( .A(\switch_sel[4][3] ), .Z(n2) );
  HS65_LS_IVX9 U564 ( .A(\switch_sel[3][3] ), .Z(n7) );
  HS65_LS_IVX9 U565 ( .A(\switch_sel[4][2] ), .Z(n3) );
  HS65_LS_IVX9 U566 ( .A(\switch_sel[3][2] ), .Z(n8) );
  HS65_LS_IVX9 U567 ( .A(\switch_sel[4][1] ), .Z(n4) );
  HS65_LS_IVX9 U568 ( .A(\switch_sel[3][1] ), .Z(n9) );
  HS65_LS_IVX9 U569 ( .A(\switch_sel[4][0] ), .Z(n5) );
  HS65_LS_IVX9 U570 ( .A(\switch_sel[3][0] ), .Z(n10) );
  HS65_LS_IVX9 U571 ( .A(\switch_sel[3][4] ), .Z(n6) );
  HS65_LS_IVX9 U572 ( .A(\switch_sel[4][4] ), .Z(n1) );
  HS65_LS_BFX9 U573 ( .A(\switch_sel[1][3] ), .Z(n388) );
  HS65_LS_BFX9 U574 ( .A(\switch_sel[2][3] ), .Z(n408) );
  HS65_LS_BFX9 U575 ( .A(\switch_sel[0][3] ), .Z(n368) );
  HS65_LS_BFX9 U576 ( .A(\switch_sel[1][2] ), .Z(n384) );
  HS65_LS_BFX9 U577 ( .A(\switch_sel[2][2] ), .Z(n404) );
  HS65_LS_BFX9 U578 ( .A(\switch_sel[0][2] ), .Z(n364) );
  HS65_LS_BFX9 U579 ( .A(\switch_sel[1][1] ), .Z(n380) );
  HS65_LS_BFX9 U580 ( .A(\switch_sel[2][1] ), .Z(n400) );
  HS65_LS_BFX9 U581 ( .A(\switch_sel[0][1] ), .Z(n360) );
  HS65_LS_BFX9 U582 ( .A(\switch_sel[1][0] ), .Z(n376) );
  HS65_LS_BFX9 U583 ( .A(\switch_sel[2][0] ), .Z(n396) );
  HS65_LS_BFX9 U584 ( .A(\switch_sel[0][0] ), .Z(n356) );
  HS65_LS_BFX9 U585 ( .A(\switch_sel[1][4] ), .Z(n392) );
  HS65_LS_BFX9 U586 ( .A(\switch_sel[2][4] ), .Z(n412) );
  HS65_LS_BFX9 U587 ( .A(\switch_sel[0][4] ), .Z(n372) );
endmodule


module sr_latch_1_0 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n2;

  HS65_LS_AND2X27 C8 ( .A(n2), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n2) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_1_0 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset;

  sr_latch_1_0 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_NOR3X4 U3 ( .A(a), .B(preset), .C(b), .Z(reset) );
  HS65_LS_AO12X9 U4 ( .A(a), .B(b), .C(preset), .Z(set) );
endmodule


module latch_controller_0_0 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, n2;
  assign Rout = Aout;

  c_gate_1_0 gate ( .preset(preset), .a(n2), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 U1 ( .A(Aout), .Z(lt_en) );
  HS65_LS_IVX9 U2 ( .A(Ain), .Z(n2) );
endmodule


module channel_latch_0_000000000_0 ( preset, .left_in({\left_in[REQ] , 
        \left_in[DATA][33] , \left_in[DATA][32] , \left_in[DATA][31] , 
        \left_in[DATA][30] , \left_in[DATA][29] , \left_in[DATA][28] , 
        \left_in[DATA][27] , \left_in[DATA][26] , \left_in[DATA][25] , 
        \left_in[DATA][24] , \left_in[DATA][23] , \left_in[DATA][22] , 
        \left_in[DATA][21] , \left_in[DATA][20] , \left_in[DATA][19] , 
        \left_in[DATA][18] , \left_in[DATA][17] , \left_in[DATA][16] , 
        \left_in[DATA][15] , \left_in[DATA][14] , \left_in[DATA][13] , 
        \left_in[DATA][12] , \left_in[DATA][11] , \left_in[DATA][10] , 
        \left_in[DATA][9] , \left_in[DATA][8] , \left_in[DATA][7] , 
        \left_in[DATA][6] , \left_in[DATA][5] , \left_in[DATA][4] , 
        \left_in[DATA][3] , \left_in[DATA][2] , \left_in[DATA][1] , 
        \left_in[DATA][0] }), .left_out(\left_out[ACK] ), .right_out({
        \right_out[REQ] , \right_out[DATA][33] , \right_out[DATA][32] , 
        \right_out[DATA][31] , \right_out[DATA][30] , \right_out[DATA][29] , 
        \right_out[DATA][28] , \right_out[DATA][27] , \right_out[DATA][26] , 
        \right_out[DATA][25] , \right_out[DATA][24] , \right_out[DATA][23] , 
        \right_out[DATA][22] , \right_out[DATA][21] , \right_out[DATA][20] , 
        \right_out[DATA][19] , \right_out[DATA][18] , \right_out[DATA][17] , 
        \right_out[DATA][16] , \right_out[DATA][15] , \right_out[DATA][14] , 
        \right_out[DATA][13] , \right_out[DATA][12] , \right_out[DATA][11] , 
        \right_out[DATA][10] , \right_out[DATA][9] , \right_out[DATA][8] , 
        \right_out[DATA][7] , \right_out[DATA][6] , \right_out[DATA][5] , 
        \right_out[DATA][4] , \right_out[DATA][3] , \right_out[DATA][2] , 
        \right_out[DATA][1] , \right_out[DATA][0] }), .right_in(
        \right_in[ACK] ) );
  input preset, \left_in[REQ] , \left_in[DATA][33] , \left_in[DATA][32] ,
         \left_in[DATA][31] , \left_in[DATA][30] , \left_in[DATA][29] ,
         \left_in[DATA][28] , \left_in[DATA][27] , \left_in[DATA][26] ,
         \left_in[DATA][25] , \left_in[DATA][24] , \left_in[DATA][23] ,
         \left_in[DATA][22] , \left_in[DATA][21] , \left_in[DATA][20] ,
         \left_in[DATA][19] , \left_in[DATA][18] , \left_in[DATA][17] ,
         \left_in[DATA][16] , \left_in[DATA][15] , \left_in[DATA][14] ,
         \left_in[DATA][13] , \left_in[DATA][12] , \left_in[DATA][11] ,
         \left_in[DATA][10] , \left_in[DATA][9] , \left_in[DATA][8] ,
         \left_in[DATA][7] , \left_in[DATA][6] , \left_in[DATA][5] ,
         \left_in[DATA][4] , \left_in[DATA][3] , \left_in[DATA][2] ,
         \left_in[DATA][1] , \left_in[DATA][0] , \right_in[ACK] ;
  output \left_out[ACK] , \right_out[REQ] , \right_out[DATA][33] ,
         \right_out[DATA][32] , \right_out[DATA][31] , \right_out[DATA][30] ,
         \right_out[DATA][29] , \right_out[DATA][28] , \right_out[DATA][27] ,
         \right_out[DATA][26] , \right_out[DATA][25] , \right_out[DATA][24] ,
         \right_out[DATA][23] , \right_out[DATA][22] , \right_out[DATA][21] ,
         \right_out[DATA][20] , \right_out[DATA][19] , \right_out[DATA][18] ,
         \right_out[DATA][17] , \right_out[DATA][16] , \right_out[DATA][15] ,
         \right_out[DATA][14] , \right_out[DATA][13] , \right_out[DATA][12] ,
         \right_out[DATA][11] , \right_out[DATA][10] , \right_out[DATA][9] ,
         \right_out[DATA][8] , \right_out[DATA][7] , \right_out[DATA][6] ,
         \right_out[DATA][5] , \right_out[DATA][4] , \right_out[DATA][3] ,
         \right_out[DATA][2] , \right_out[DATA][1] , \right_out[DATA][0] ;
  wire   lt_en, n1, n2, n3, n4, n5;

  latch_controller_0_0 controller ( .preset(n3), .Rin(\left_in[REQ] ), .Aout(
        \left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHRQX9 \data_reg[33]  ( .G(lt_en), .D(\left_in[DATA][33] ), .RN(n2), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_LDHRQX9 \data_reg[32]  ( .G(lt_en), .D(\left_in[DATA][32] ), .RN(n1), 
        .Q(\right_out[DATA][32] ) );
  HS65_LS_LDHRQX9 \data_reg[31]  ( .G(lt_en), .D(\left_in[DATA][31] ), .RN(n2), 
        .Q(\right_out[DATA][31] ) );
  HS65_LS_LDHRQX9 \data_reg[30]  ( .G(lt_en), .D(\left_in[DATA][30] ), .RN(n1), 
        .Q(\right_out[DATA][30] ) );
  HS65_LS_LDHRQX9 \data_reg[29]  ( .G(lt_en), .D(\left_in[DATA][29] ), .RN(n2), 
        .Q(\right_out[DATA][29] ) );
  HS65_LS_LDHRQX9 \data_reg[28]  ( .G(lt_en), .D(\left_in[DATA][28] ), .RN(n1), 
        .Q(\right_out[DATA][28] ) );
  HS65_LS_LDHRQX9 \data_reg[27]  ( .G(lt_en), .D(\left_in[DATA][27] ), .RN(n2), 
        .Q(\right_out[DATA][27] ) );
  HS65_LS_LDHRQX9 \data_reg[26]  ( .G(lt_en), .D(\left_in[DATA][26] ), .RN(n1), 
        .Q(\right_out[DATA][26] ) );
  HS65_LS_LDHRQX9 \data_reg[25]  ( .G(lt_en), .D(\left_in[DATA][25] ), .RN(n2), 
        .Q(\right_out[DATA][25] ) );
  HS65_LS_LDHRQX9 \data_reg[24]  ( .G(lt_en), .D(\left_in[DATA][24] ), .RN(n1), 
        .Q(\right_out[DATA][24] ) );
  HS65_LS_LDHRQX9 \data_reg[23]  ( .G(lt_en), .D(\left_in[DATA][23] ), .RN(n2), 
        .Q(\right_out[DATA][23] ) );
  HS65_LS_LDHRQX9 \data_reg[22]  ( .G(lt_en), .D(\left_in[DATA][22] ), .RN(n2), 
        .Q(\right_out[DATA][22] ) );
  HS65_LS_LDHRQX9 \data_reg[21]  ( .G(lt_en), .D(\left_in[DATA][21] ), .RN(n2), 
        .Q(\right_out[DATA][21] ) );
  HS65_LS_LDHRQX9 \data_reg[20]  ( .G(lt_en), .D(\left_in[DATA][20] ), .RN(n2), 
        .Q(\right_out[DATA][20] ) );
  HS65_LS_LDHRQX9 \data_reg[19]  ( .G(lt_en), .D(\left_in[DATA][19] ), .RN(n2), 
        .Q(\right_out[DATA][19] ) );
  HS65_LS_LDHRQX9 \data_reg[18]  ( .G(lt_en), .D(\left_in[DATA][18] ), .RN(n2), 
        .Q(\right_out[DATA][18] ) );
  HS65_LS_LDHRQX9 \data_reg[17]  ( .G(lt_en), .D(\left_in[DATA][17] ), .RN(n2), 
        .Q(\right_out[DATA][17] ) );
  HS65_LS_LDHRQX9 \data_reg[16]  ( .G(lt_en), .D(\left_in[DATA][16] ), .RN(n2), 
        .Q(\right_out[DATA][16] ) );
  HS65_LS_LDHRQX9 \data_reg[15]  ( .G(lt_en), .D(\left_in[DATA][15] ), .RN(n2), 
        .Q(\right_out[DATA][15] ) );
  HS65_LS_LDHRQX9 \data_reg[14]  ( .G(lt_en), .D(\left_in[DATA][14] ), .RN(n2), 
        .Q(\right_out[DATA][14] ) );
  HS65_LS_LDHRQX9 \data_reg[13]  ( .G(lt_en), .D(\left_in[DATA][13] ), .RN(n2), 
        .Q(\right_out[DATA][13] ) );
  HS65_LS_LDHRQX9 \data_reg[12]  ( .G(lt_en), .D(\left_in[DATA][12] ), .RN(n2), 
        .Q(\right_out[DATA][12] ) );
  HS65_LS_LDHRQX9 \data_reg[11]  ( .G(lt_en), .D(\left_in[DATA][11] ), .RN(n1), 
        .Q(\right_out[DATA][11] ) );
  HS65_LS_LDHRQX9 \data_reg[10]  ( .G(lt_en), .D(\left_in[DATA][10] ), .RN(n1), 
        .Q(\right_out[DATA][10] ) );
  HS65_LS_LDHRQX9 \data_reg[9]  ( .G(lt_en), .D(\left_in[DATA][9] ), .RN(n1), 
        .Q(\right_out[DATA][9] ) );
  HS65_LS_LDHRQX9 \data_reg[8]  ( .G(lt_en), .D(\left_in[DATA][8] ), .RN(n1), 
        .Q(\right_out[DATA][8] ) );
  HS65_LS_LDHRQX9 \data_reg[7]  ( .G(lt_en), .D(\left_in[DATA][7] ), .RN(n1), 
        .Q(\right_out[DATA][7] ) );
  HS65_LS_LDHRQX9 \data_reg[6]  ( .G(lt_en), .D(\left_in[DATA][6] ), .RN(n1), 
        .Q(\right_out[DATA][6] ) );
  HS65_LS_LDHRQX9 \data_reg[5]  ( .G(lt_en), .D(\left_in[DATA][5] ), .RN(n1), 
        .Q(\right_out[DATA][5] ) );
  HS65_LS_LDHRQX9 \data_reg[4]  ( .G(lt_en), .D(\left_in[DATA][4] ), .RN(n1), 
        .Q(\right_out[DATA][4] ) );
  HS65_LS_LDHRQX9 \data_reg[3]  ( .G(lt_en), .D(\left_in[DATA][3] ), .RN(n1), 
        .Q(\right_out[DATA][3] ) );
  HS65_LS_LDHRQX9 \data_reg[2]  ( .G(lt_en), .D(\left_in[DATA][2] ), .RN(n1), 
        .Q(\right_out[DATA][2] ) );
  HS65_LS_LDHRQX9 \data_reg[1]  ( .G(lt_en), .D(\left_in[DATA][1] ), .RN(n1), 
        .Q(\right_out[DATA][1] ) );
  HS65_LS_LDHRQX9 \data_reg[0]  ( .G(lt_en), .D(\left_in[DATA][0] ), .RN(n1), 
        .Q(\right_out[DATA][0] ) );
  HS65_LS_BFX9 U3 ( .A(preset), .Z(n3) );
  HS65_LS_IVX9 U4 ( .A(n5), .Z(n1) );
  HS65_LS_BFX9 U5 ( .A(preset), .Z(n5) );
  HS65_LS_IVX9 U6 ( .A(n4), .Z(n2) );
  HS65_LS_BFX9 U7 ( .A(preset), .Z(n4) );
endmodule


module sr_latch_1_1 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X27 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_1_1 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset;

  sr_latch_1_1 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_NOR3X4 U3 ( .A(a), .B(preset), .C(b), .Z(reset) );
  HS65_LS_AO12X9 U4 ( .A(a), .B(b), .C(preset), .Z(set) );
endmodule


module latch_controller_0_1 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, n1;
  assign Rout = Aout;

  c_gate_1_1 gate ( .preset(preset), .a(n1), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 U1 ( .A(Aout), .Z(lt_en) );
  HS65_LS_IVX9 U2 ( .A(Ain), .Z(n1) );
endmodule


module channel_latch_0_000000000_1 ( preset, .left_in({\left_in[REQ] , 
        \left_in[DATA][33] , \left_in[DATA][32] , \left_in[DATA][31] , 
        \left_in[DATA][30] , \left_in[DATA][29] , \left_in[DATA][28] , 
        \left_in[DATA][27] , \left_in[DATA][26] , \left_in[DATA][25] , 
        \left_in[DATA][24] , \left_in[DATA][23] , \left_in[DATA][22] , 
        \left_in[DATA][21] , \left_in[DATA][20] , \left_in[DATA][19] , 
        \left_in[DATA][18] , \left_in[DATA][17] , \left_in[DATA][16] , 
        \left_in[DATA][15] , \left_in[DATA][14] , \left_in[DATA][13] , 
        \left_in[DATA][12] , \left_in[DATA][11] , \left_in[DATA][10] , 
        \left_in[DATA][9] , \left_in[DATA][8] , \left_in[DATA][7] , 
        \left_in[DATA][6] , \left_in[DATA][5] , \left_in[DATA][4] , 
        \left_in[DATA][3] , \left_in[DATA][2] , \left_in[DATA][1] , 
        \left_in[DATA][0] }), .left_out(\left_out[ACK] ), .right_out({
        \right_out[REQ] , \right_out[DATA][33] , \right_out[DATA][32] , 
        \right_out[DATA][31] , \right_out[DATA][30] , \right_out[DATA][29] , 
        \right_out[DATA][28] , \right_out[DATA][27] , \right_out[DATA][26] , 
        \right_out[DATA][25] , \right_out[DATA][24] , \right_out[DATA][23] , 
        \right_out[DATA][22] , \right_out[DATA][21] , \right_out[DATA][20] , 
        \right_out[DATA][19] , \right_out[DATA][18] , \right_out[DATA][17] , 
        \right_out[DATA][16] , \right_out[DATA][15] , \right_out[DATA][14] , 
        \right_out[DATA][13] , \right_out[DATA][12] , \right_out[DATA][11] , 
        \right_out[DATA][10] , \right_out[DATA][9] , \right_out[DATA][8] , 
        \right_out[DATA][7] , \right_out[DATA][6] , \right_out[DATA][5] , 
        \right_out[DATA][4] , \right_out[DATA][3] , \right_out[DATA][2] , 
        \right_out[DATA][1] , \right_out[DATA][0] }), .right_in(
        \right_in[ACK] ) );
  input preset, \left_in[REQ] , \left_in[DATA][33] , \left_in[DATA][32] ,
         \left_in[DATA][31] , \left_in[DATA][30] , \left_in[DATA][29] ,
         \left_in[DATA][28] , \left_in[DATA][27] , \left_in[DATA][26] ,
         \left_in[DATA][25] , \left_in[DATA][24] , \left_in[DATA][23] ,
         \left_in[DATA][22] , \left_in[DATA][21] , \left_in[DATA][20] ,
         \left_in[DATA][19] , \left_in[DATA][18] , \left_in[DATA][17] ,
         \left_in[DATA][16] , \left_in[DATA][15] , \left_in[DATA][14] ,
         \left_in[DATA][13] , \left_in[DATA][12] , \left_in[DATA][11] ,
         \left_in[DATA][10] , \left_in[DATA][9] , \left_in[DATA][8] ,
         \left_in[DATA][7] , \left_in[DATA][6] , \left_in[DATA][5] ,
         \left_in[DATA][4] , \left_in[DATA][3] , \left_in[DATA][2] ,
         \left_in[DATA][1] , \left_in[DATA][0] , \right_in[ACK] ;
  output \left_out[ACK] , \right_out[REQ] , \right_out[DATA][33] ,
         \right_out[DATA][32] , \right_out[DATA][31] , \right_out[DATA][30] ,
         \right_out[DATA][29] , \right_out[DATA][28] , \right_out[DATA][27] ,
         \right_out[DATA][26] , \right_out[DATA][25] , \right_out[DATA][24] ,
         \right_out[DATA][23] , \right_out[DATA][22] , \right_out[DATA][21] ,
         \right_out[DATA][20] , \right_out[DATA][19] , \right_out[DATA][18] ,
         \right_out[DATA][17] , \right_out[DATA][16] , \right_out[DATA][15] ,
         \right_out[DATA][14] , \right_out[DATA][13] , \right_out[DATA][12] ,
         \right_out[DATA][11] , \right_out[DATA][10] , \right_out[DATA][9] ,
         \right_out[DATA][8] , \right_out[DATA][7] , \right_out[DATA][6] ,
         \right_out[DATA][5] , \right_out[DATA][4] , \right_out[DATA][3] ,
         \right_out[DATA][2] , \right_out[DATA][1] , \right_out[DATA][0] ;
  wire   lt_en, n1, n2, n3, n4, n5;

  latch_controller_0_1 controller ( .preset(n3), .Rin(\left_in[REQ] ), .Aout(
        \left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHRQX9 \data_reg[33]  ( .G(lt_en), .D(\left_in[DATA][33] ), .RN(n2), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_LDHRQX9 \data_reg[32]  ( .G(lt_en), .D(\left_in[DATA][32] ), .RN(n1), 
        .Q(\right_out[DATA][32] ) );
  HS65_LS_LDHRQX9 \data_reg[31]  ( .G(lt_en), .D(\left_in[DATA][31] ), .RN(n2), 
        .Q(\right_out[DATA][31] ) );
  HS65_LS_LDHRQX9 \data_reg[30]  ( .G(lt_en), .D(\left_in[DATA][30] ), .RN(n1), 
        .Q(\right_out[DATA][30] ) );
  HS65_LS_LDHRQX9 \data_reg[29]  ( .G(lt_en), .D(\left_in[DATA][29] ), .RN(n2), 
        .Q(\right_out[DATA][29] ) );
  HS65_LS_LDHRQX9 \data_reg[28]  ( .G(lt_en), .D(\left_in[DATA][28] ), .RN(n1), 
        .Q(\right_out[DATA][28] ) );
  HS65_LS_LDHRQX9 \data_reg[27]  ( .G(lt_en), .D(\left_in[DATA][27] ), .RN(n2), 
        .Q(\right_out[DATA][27] ) );
  HS65_LS_LDHRQX9 \data_reg[26]  ( .G(lt_en), .D(\left_in[DATA][26] ), .RN(n1), 
        .Q(\right_out[DATA][26] ) );
  HS65_LS_LDHRQX9 \data_reg[25]  ( .G(lt_en), .D(\left_in[DATA][25] ), .RN(n2), 
        .Q(\right_out[DATA][25] ) );
  HS65_LS_LDHRQX9 \data_reg[24]  ( .G(lt_en), .D(\left_in[DATA][24] ), .RN(n1), 
        .Q(\right_out[DATA][24] ) );
  HS65_LS_LDHRQX9 \data_reg[23]  ( .G(lt_en), .D(\left_in[DATA][23] ), .RN(n2), 
        .Q(\right_out[DATA][23] ) );
  HS65_LS_LDHRQX9 \data_reg[22]  ( .G(lt_en), .D(\left_in[DATA][22] ), .RN(n2), 
        .Q(\right_out[DATA][22] ) );
  HS65_LS_LDHRQX9 \data_reg[21]  ( .G(lt_en), .D(\left_in[DATA][21] ), .RN(n2), 
        .Q(\right_out[DATA][21] ) );
  HS65_LS_LDHRQX9 \data_reg[20]  ( .G(lt_en), .D(\left_in[DATA][20] ), .RN(n2), 
        .Q(\right_out[DATA][20] ) );
  HS65_LS_LDHRQX9 \data_reg[19]  ( .G(lt_en), .D(\left_in[DATA][19] ), .RN(n2), 
        .Q(\right_out[DATA][19] ) );
  HS65_LS_LDHRQX9 \data_reg[18]  ( .G(lt_en), .D(\left_in[DATA][18] ), .RN(n2), 
        .Q(\right_out[DATA][18] ) );
  HS65_LS_LDHRQX9 \data_reg[17]  ( .G(lt_en), .D(\left_in[DATA][17] ), .RN(n2), 
        .Q(\right_out[DATA][17] ) );
  HS65_LS_LDHRQX9 \data_reg[16]  ( .G(lt_en), .D(\left_in[DATA][16] ), .RN(n2), 
        .Q(\right_out[DATA][16] ) );
  HS65_LS_LDHRQX9 \data_reg[15]  ( .G(lt_en), .D(\left_in[DATA][15] ), .RN(n2), 
        .Q(\right_out[DATA][15] ) );
  HS65_LS_LDHRQX9 \data_reg[14]  ( .G(lt_en), .D(\left_in[DATA][14] ), .RN(n2), 
        .Q(\right_out[DATA][14] ) );
  HS65_LS_LDHRQX9 \data_reg[13]  ( .G(lt_en), .D(\left_in[DATA][13] ), .RN(n2), 
        .Q(\right_out[DATA][13] ) );
  HS65_LS_LDHRQX9 \data_reg[12]  ( .G(lt_en), .D(\left_in[DATA][12] ), .RN(n2), 
        .Q(\right_out[DATA][12] ) );
  HS65_LS_LDHRQX9 \data_reg[11]  ( .G(lt_en), .D(\left_in[DATA][11] ), .RN(n1), 
        .Q(\right_out[DATA][11] ) );
  HS65_LS_LDHRQX9 \data_reg[10]  ( .G(lt_en), .D(\left_in[DATA][10] ), .RN(n1), 
        .Q(\right_out[DATA][10] ) );
  HS65_LS_LDHRQX9 \data_reg[9]  ( .G(lt_en), .D(\left_in[DATA][9] ), .RN(n1), 
        .Q(\right_out[DATA][9] ) );
  HS65_LS_LDHRQX9 \data_reg[8]  ( .G(lt_en), .D(\left_in[DATA][8] ), .RN(n1), 
        .Q(\right_out[DATA][8] ) );
  HS65_LS_LDHRQX9 \data_reg[7]  ( .G(lt_en), .D(\left_in[DATA][7] ), .RN(n1), 
        .Q(\right_out[DATA][7] ) );
  HS65_LS_LDHRQX9 \data_reg[6]  ( .G(lt_en), .D(\left_in[DATA][6] ), .RN(n1), 
        .Q(\right_out[DATA][6] ) );
  HS65_LS_LDHRQX9 \data_reg[5]  ( .G(lt_en), .D(\left_in[DATA][5] ), .RN(n1), 
        .Q(\right_out[DATA][5] ) );
  HS65_LS_LDHRQX9 \data_reg[4]  ( .G(lt_en), .D(\left_in[DATA][4] ), .RN(n1), 
        .Q(\right_out[DATA][4] ) );
  HS65_LS_LDHRQX9 \data_reg[3]  ( .G(lt_en), .D(\left_in[DATA][3] ), .RN(n1), 
        .Q(\right_out[DATA][3] ) );
  HS65_LS_LDHRQX9 \data_reg[2]  ( .G(lt_en), .D(\left_in[DATA][2] ), .RN(n1), 
        .Q(\right_out[DATA][2] ) );
  HS65_LS_LDHRQX9 \data_reg[1]  ( .G(lt_en), .D(\left_in[DATA][1] ), .RN(n1), 
        .Q(\right_out[DATA][1] ) );
  HS65_LS_LDHRQX9 \data_reg[0]  ( .G(lt_en), .D(\left_in[DATA][0] ), .RN(n1), 
        .Q(\right_out[DATA][0] ) );
  HS65_LS_BFX9 U3 ( .A(preset), .Z(n3) );
  HS65_LS_IVX9 U4 ( .A(n5), .Z(n1) );
  HS65_LS_BFX9 U5 ( .A(preset), .Z(n5) );
  HS65_LS_IVX9 U6 ( .A(n4), .Z(n2) );
  HS65_LS_BFX9 U7 ( .A(preset), .Z(n4) );
endmodule


module sr_latch_1_2 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X27 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_1_2 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset;

  sr_latch_1_2 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_NOR3X4 U3 ( .A(a), .B(preset), .C(b), .Z(reset) );
  HS65_LS_AO12X9 U4 ( .A(a), .B(b), .C(preset), .Z(set) );
endmodule


module latch_controller_0_2 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, n1;
  assign Rout = Aout;

  c_gate_1_2 gate ( .preset(preset), .a(n1), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 U1 ( .A(Aout), .Z(lt_en) );
  HS65_LS_IVX9 U2 ( .A(Ain), .Z(n1) );
endmodule


module channel_latch_0_000000000_2 ( preset, .left_in({\left_in[REQ] , 
        \left_in[DATA][33] , \left_in[DATA][32] , \left_in[DATA][31] , 
        \left_in[DATA][30] , \left_in[DATA][29] , \left_in[DATA][28] , 
        \left_in[DATA][27] , \left_in[DATA][26] , \left_in[DATA][25] , 
        \left_in[DATA][24] , \left_in[DATA][23] , \left_in[DATA][22] , 
        \left_in[DATA][21] , \left_in[DATA][20] , \left_in[DATA][19] , 
        \left_in[DATA][18] , \left_in[DATA][17] , \left_in[DATA][16] , 
        \left_in[DATA][15] , \left_in[DATA][14] , \left_in[DATA][13] , 
        \left_in[DATA][12] , \left_in[DATA][11] , \left_in[DATA][10] , 
        \left_in[DATA][9] , \left_in[DATA][8] , \left_in[DATA][7] , 
        \left_in[DATA][6] , \left_in[DATA][5] , \left_in[DATA][4] , 
        \left_in[DATA][3] , \left_in[DATA][2] , \left_in[DATA][1] , 
        \left_in[DATA][0] }), .left_out(\left_out[ACK] ), .right_out({
        \right_out[REQ] , \right_out[DATA][33] , \right_out[DATA][32] , 
        \right_out[DATA][31] , \right_out[DATA][30] , \right_out[DATA][29] , 
        \right_out[DATA][28] , \right_out[DATA][27] , \right_out[DATA][26] , 
        \right_out[DATA][25] , \right_out[DATA][24] , \right_out[DATA][23] , 
        \right_out[DATA][22] , \right_out[DATA][21] , \right_out[DATA][20] , 
        \right_out[DATA][19] , \right_out[DATA][18] , \right_out[DATA][17] , 
        \right_out[DATA][16] , \right_out[DATA][15] , \right_out[DATA][14] , 
        \right_out[DATA][13] , \right_out[DATA][12] , \right_out[DATA][11] , 
        \right_out[DATA][10] , \right_out[DATA][9] , \right_out[DATA][8] , 
        \right_out[DATA][7] , \right_out[DATA][6] , \right_out[DATA][5] , 
        \right_out[DATA][4] , \right_out[DATA][3] , \right_out[DATA][2] , 
        \right_out[DATA][1] , \right_out[DATA][0] }), .right_in(
        \right_in[ACK] ) );
  input preset, \left_in[REQ] , \left_in[DATA][33] , \left_in[DATA][32] ,
         \left_in[DATA][31] , \left_in[DATA][30] , \left_in[DATA][29] ,
         \left_in[DATA][28] , \left_in[DATA][27] , \left_in[DATA][26] ,
         \left_in[DATA][25] , \left_in[DATA][24] , \left_in[DATA][23] ,
         \left_in[DATA][22] , \left_in[DATA][21] , \left_in[DATA][20] ,
         \left_in[DATA][19] , \left_in[DATA][18] , \left_in[DATA][17] ,
         \left_in[DATA][16] , \left_in[DATA][15] , \left_in[DATA][14] ,
         \left_in[DATA][13] , \left_in[DATA][12] , \left_in[DATA][11] ,
         \left_in[DATA][10] , \left_in[DATA][9] , \left_in[DATA][8] ,
         \left_in[DATA][7] , \left_in[DATA][6] , \left_in[DATA][5] ,
         \left_in[DATA][4] , \left_in[DATA][3] , \left_in[DATA][2] ,
         \left_in[DATA][1] , \left_in[DATA][0] , \right_in[ACK] ;
  output \left_out[ACK] , \right_out[REQ] , \right_out[DATA][33] ,
         \right_out[DATA][32] , \right_out[DATA][31] , \right_out[DATA][30] ,
         \right_out[DATA][29] , \right_out[DATA][28] , \right_out[DATA][27] ,
         \right_out[DATA][26] , \right_out[DATA][25] , \right_out[DATA][24] ,
         \right_out[DATA][23] , \right_out[DATA][22] , \right_out[DATA][21] ,
         \right_out[DATA][20] , \right_out[DATA][19] , \right_out[DATA][18] ,
         \right_out[DATA][17] , \right_out[DATA][16] , \right_out[DATA][15] ,
         \right_out[DATA][14] , \right_out[DATA][13] , \right_out[DATA][12] ,
         \right_out[DATA][11] , \right_out[DATA][10] , \right_out[DATA][9] ,
         \right_out[DATA][8] , \right_out[DATA][7] , \right_out[DATA][6] ,
         \right_out[DATA][5] , \right_out[DATA][4] , \right_out[DATA][3] ,
         \right_out[DATA][2] , \right_out[DATA][1] , \right_out[DATA][0] ;
  wire   lt_en, n1, n2, n3, n4, n5;

  latch_controller_0_2 controller ( .preset(n3), .Rin(\left_in[REQ] ), .Aout(
        \left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHRQX9 \data_reg[33]  ( .G(lt_en), .D(\left_in[DATA][33] ), .RN(n2), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_LDHRQX9 \data_reg[32]  ( .G(lt_en), .D(\left_in[DATA][32] ), .RN(n1), 
        .Q(\right_out[DATA][32] ) );
  HS65_LS_LDHRQX9 \data_reg[31]  ( .G(lt_en), .D(\left_in[DATA][31] ), .RN(n2), 
        .Q(\right_out[DATA][31] ) );
  HS65_LS_LDHRQX9 \data_reg[30]  ( .G(lt_en), .D(\left_in[DATA][30] ), .RN(n1), 
        .Q(\right_out[DATA][30] ) );
  HS65_LS_LDHRQX9 \data_reg[29]  ( .G(lt_en), .D(\left_in[DATA][29] ), .RN(n2), 
        .Q(\right_out[DATA][29] ) );
  HS65_LS_LDHRQX9 \data_reg[28]  ( .G(lt_en), .D(\left_in[DATA][28] ), .RN(n1), 
        .Q(\right_out[DATA][28] ) );
  HS65_LS_LDHRQX9 \data_reg[27]  ( .G(lt_en), .D(\left_in[DATA][27] ), .RN(n2), 
        .Q(\right_out[DATA][27] ) );
  HS65_LS_LDHRQX9 \data_reg[26]  ( .G(lt_en), .D(\left_in[DATA][26] ), .RN(n1), 
        .Q(\right_out[DATA][26] ) );
  HS65_LS_LDHRQX9 \data_reg[25]  ( .G(lt_en), .D(\left_in[DATA][25] ), .RN(n2), 
        .Q(\right_out[DATA][25] ) );
  HS65_LS_LDHRQX9 \data_reg[24]  ( .G(lt_en), .D(\left_in[DATA][24] ), .RN(n1), 
        .Q(\right_out[DATA][24] ) );
  HS65_LS_LDHRQX9 \data_reg[23]  ( .G(lt_en), .D(\left_in[DATA][23] ), .RN(n2), 
        .Q(\right_out[DATA][23] ) );
  HS65_LS_LDHRQX9 \data_reg[22]  ( .G(lt_en), .D(\left_in[DATA][22] ), .RN(n2), 
        .Q(\right_out[DATA][22] ) );
  HS65_LS_LDHRQX9 \data_reg[21]  ( .G(lt_en), .D(\left_in[DATA][21] ), .RN(n2), 
        .Q(\right_out[DATA][21] ) );
  HS65_LS_LDHRQX9 \data_reg[20]  ( .G(lt_en), .D(\left_in[DATA][20] ), .RN(n2), 
        .Q(\right_out[DATA][20] ) );
  HS65_LS_LDHRQX9 \data_reg[19]  ( .G(lt_en), .D(\left_in[DATA][19] ), .RN(n2), 
        .Q(\right_out[DATA][19] ) );
  HS65_LS_LDHRQX9 \data_reg[18]  ( .G(lt_en), .D(\left_in[DATA][18] ), .RN(n2), 
        .Q(\right_out[DATA][18] ) );
  HS65_LS_LDHRQX9 \data_reg[17]  ( .G(lt_en), .D(\left_in[DATA][17] ), .RN(n2), 
        .Q(\right_out[DATA][17] ) );
  HS65_LS_LDHRQX9 \data_reg[16]  ( .G(lt_en), .D(\left_in[DATA][16] ), .RN(n2), 
        .Q(\right_out[DATA][16] ) );
  HS65_LS_LDHRQX9 \data_reg[15]  ( .G(lt_en), .D(\left_in[DATA][15] ), .RN(n2), 
        .Q(\right_out[DATA][15] ) );
  HS65_LS_LDHRQX9 \data_reg[14]  ( .G(lt_en), .D(\left_in[DATA][14] ), .RN(n2), 
        .Q(\right_out[DATA][14] ) );
  HS65_LS_LDHRQX9 \data_reg[13]  ( .G(lt_en), .D(\left_in[DATA][13] ), .RN(n2), 
        .Q(\right_out[DATA][13] ) );
  HS65_LS_LDHRQX9 \data_reg[12]  ( .G(lt_en), .D(\left_in[DATA][12] ), .RN(n2), 
        .Q(\right_out[DATA][12] ) );
  HS65_LS_LDHRQX9 \data_reg[11]  ( .G(lt_en), .D(\left_in[DATA][11] ), .RN(n1), 
        .Q(\right_out[DATA][11] ) );
  HS65_LS_LDHRQX9 \data_reg[10]  ( .G(lt_en), .D(\left_in[DATA][10] ), .RN(n1), 
        .Q(\right_out[DATA][10] ) );
  HS65_LS_LDHRQX9 \data_reg[9]  ( .G(lt_en), .D(\left_in[DATA][9] ), .RN(n1), 
        .Q(\right_out[DATA][9] ) );
  HS65_LS_LDHRQX9 \data_reg[8]  ( .G(lt_en), .D(\left_in[DATA][8] ), .RN(n1), 
        .Q(\right_out[DATA][8] ) );
  HS65_LS_LDHRQX9 \data_reg[7]  ( .G(lt_en), .D(\left_in[DATA][7] ), .RN(n1), 
        .Q(\right_out[DATA][7] ) );
  HS65_LS_LDHRQX9 \data_reg[6]  ( .G(lt_en), .D(\left_in[DATA][6] ), .RN(n1), 
        .Q(\right_out[DATA][6] ) );
  HS65_LS_LDHRQX9 \data_reg[5]  ( .G(lt_en), .D(\left_in[DATA][5] ), .RN(n1), 
        .Q(\right_out[DATA][5] ) );
  HS65_LS_LDHRQX9 \data_reg[4]  ( .G(lt_en), .D(\left_in[DATA][4] ), .RN(n1), 
        .Q(\right_out[DATA][4] ) );
  HS65_LS_LDHRQX9 \data_reg[3]  ( .G(lt_en), .D(\left_in[DATA][3] ), .RN(n1), 
        .Q(\right_out[DATA][3] ) );
  HS65_LS_LDHRQX9 \data_reg[2]  ( .G(lt_en), .D(\left_in[DATA][2] ), .RN(n1), 
        .Q(\right_out[DATA][2] ) );
  HS65_LS_LDHRQX9 \data_reg[1]  ( .G(lt_en), .D(\left_in[DATA][1] ), .RN(n1), 
        .Q(\right_out[DATA][1] ) );
  HS65_LS_LDHRQX9 \data_reg[0]  ( .G(lt_en), .D(\left_in[DATA][0] ), .RN(n1), 
        .Q(\right_out[DATA][0] ) );
  HS65_LS_BFX9 U3 ( .A(preset), .Z(n3) );
  HS65_LS_IVX9 U4 ( .A(n5), .Z(n1) );
  HS65_LS_BFX9 U5 ( .A(preset), .Z(n5) );
  HS65_LS_IVX9 U6 ( .A(n4), .Z(n2) );
  HS65_LS_BFX9 U7 ( .A(preset), .Z(n4) );
endmodule


module sr_latch_1_3 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X27 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_1_3 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset;

  sr_latch_1_3 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_NOR3X4 U3 ( .A(a), .B(preset), .C(b), .Z(reset) );
  HS65_LS_AO12X9 U4 ( .A(a), .B(b), .C(preset), .Z(set) );
endmodule


module latch_controller_0_3 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, n1;
  assign Rout = Aout;

  c_gate_1_3 gate ( .preset(preset), .a(n1), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 U1 ( .A(Aout), .Z(lt_en) );
  HS65_LS_IVX9 U2 ( .A(Ain), .Z(n1) );
endmodule


module channel_latch_0_000000000_3 ( preset, .left_in({\left_in[REQ] , 
        \left_in[DATA][33] , \left_in[DATA][32] , \left_in[DATA][31] , 
        \left_in[DATA][30] , \left_in[DATA][29] , \left_in[DATA][28] , 
        \left_in[DATA][27] , \left_in[DATA][26] , \left_in[DATA][25] , 
        \left_in[DATA][24] , \left_in[DATA][23] , \left_in[DATA][22] , 
        \left_in[DATA][21] , \left_in[DATA][20] , \left_in[DATA][19] , 
        \left_in[DATA][18] , \left_in[DATA][17] , \left_in[DATA][16] , 
        \left_in[DATA][15] , \left_in[DATA][14] , \left_in[DATA][13] , 
        \left_in[DATA][12] , \left_in[DATA][11] , \left_in[DATA][10] , 
        \left_in[DATA][9] , \left_in[DATA][8] , \left_in[DATA][7] , 
        \left_in[DATA][6] , \left_in[DATA][5] , \left_in[DATA][4] , 
        \left_in[DATA][3] , \left_in[DATA][2] , \left_in[DATA][1] , 
        \left_in[DATA][0] }), .left_out(\left_out[ACK] ), .right_out({
        \right_out[REQ] , \right_out[DATA][33] , \right_out[DATA][32] , 
        \right_out[DATA][31] , \right_out[DATA][30] , \right_out[DATA][29] , 
        \right_out[DATA][28] , \right_out[DATA][27] , \right_out[DATA][26] , 
        \right_out[DATA][25] , \right_out[DATA][24] , \right_out[DATA][23] , 
        \right_out[DATA][22] , \right_out[DATA][21] , \right_out[DATA][20] , 
        \right_out[DATA][19] , \right_out[DATA][18] , \right_out[DATA][17] , 
        \right_out[DATA][16] , \right_out[DATA][15] , \right_out[DATA][14] , 
        \right_out[DATA][13] , \right_out[DATA][12] , \right_out[DATA][11] , 
        \right_out[DATA][10] , \right_out[DATA][9] , \right_out[DATA][8] , 
        \right_out[DATA][7] , \right_out[DATA][6] , \right_out[DATA][5] , 
        \right_out[DATA][4] , \right_out[DATA][3] , \right_out[DATA][2] , 
        \right_out[DATA][1] , \right_out[DATA][0] }), .right_in(
        \right_in[ACK] ) );
  input preset, \left_in[REQ] , \left_in[DATA][33] , \left_in[DATA][32] ,
         \left_in[DATA][31] , \left_in[DATA][30] , \left_in[DATA][29] ,
         \left_in[DATA][28] , \left_in[DATA][27] , \left_in[DATA][26] ,
         \left_in[DATA][25] , \left_in[DATA][24] , \left_in[DATA][23] ,
         \left_in[DATA][22] , \left_in[DATA][21] , \left_in[DATA][20] ,
         \left_in[DATA][19] , \left_in[DATA][18] , \left_in[DATA][17] ,
         \left_in[DATA][16] , \left_in[DATA][15] , \left_in[DATA][14] ,
         \left_in[DATA][13] , \left_in[DATA][12] , \left_in[DATA][11] ,
         \left_in[DATA][10] , \left_in[DATA][9] , \left_in[DATA][8] ,
         \left_in[DATA][7] , \left_in[DATA][6] , \left_in[DATA][5] ,
         \left_in[DATA][4] , \left_in[DATA][3] , \left_in[DATA][2] ,
         \left_in[DATA][1] , \left_in[DATA][0] , \right_in[ACK] ;
  output \left_out[ACK] , \right_out[REQ] , \right_out[DATA][33] ,
         \right_out[DATA][32] , \right_out[DATA][31] , \right_out[DATA][30] ,
         \right_out[DATA][29] , \right_out[DATA][28] , \right_out[DATA][27] ,
         \right_out[DATA][26] , \right_out[DATA][25] , \right_out[DATA][24] ,
         \right_out[DATA][23] , \right_out[DATA][22] , \right_out[DATA][21] ,
         \right_out[DATA][20] , \right_out[DATA][19] , \right_out[DATA][18] ,
         \right_out[DATA][17] , \right_out[DATA][16] , \right_out[DATA][15] ,
         \right_out[DATA][14] , \right_out[DATA][13] , \right_out[DATA][12] ,
         \right_out[DATA][11] , \right_out[DATA][10] , \right_out[DATA][9] ,
         \right_out[DATA][8] , \right_out[DATA][7] , \right_out[DATA][6] ,
         \right_out[DATA][5] , \right_out[DATA][4] , \right_out[DATA][3] ,
         \right_out[DATA][2] , \right_out[DATA][1] , \right_out[DATA][0] ;
  wire   lt_en, n1, n2, n3, n4, n5;

  latch_controller_0_3 controller ( .preset(n3), .Rin(\left_in[REQ] ), .Aout(
        \left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHRQX9 \data_reg[33]  ( .G(lt_en), .D(\left_in[DATA][33] ), .RN(n2), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_LDHRQX9 \data_reg[32]  ( .G(lt_en), .D(\left_in[DATA][32] ), .RN(n1), 
        .Q(\right_out[DATA][32] ) );
  HS65_LS_LDHRQX9 \data_reg[31]  ( .G(lt_en), .D(\left_in[DATA][31] ), .RN(n2), 
        .Q(\right_out[DATA][31] ) );
  HS65_LS_LDHRQX9 \data_reg[30]  ( .G(lt_en), .D(\left_in[DATA][30] ), .RN(n1), 
        .Q(\right_out[DATA][30] ) );
  HS65_LS_LDHRQX9 \data_reg[29]  ( .G(lt_en), .D(\left_in[DATA][29] ), .RN(n2), 
        .Q(\right_out[DATA][29] ) );
  HS65_LS_LDHRQX9 \data_reg[28]  ( .G(lt_en), .D(\left_in[DATA][28] ), .RN(n1), 
        .Q(\right_out[DATA][28] ) );
  HS65_LS_LDHRQX9 \data_reg[27]  ( .G(lt_en), .D(\left_in[DATA][27] ), .RN(n2), 
        .Q(\right_out[DATA][27] ) );
  HS65_LS_LDHRQX9 \data_reg[26]  ( .G(lt_en), .D(\left_in[DATA][26] ), .RN(n1), 
        .Q(\right_out[DATA][26] ) );
  HS65_LS_LDHRQX9 \data_reg[25]  ( .G(lt_en), .D(\left_in[DATA][25] ), .RN(n2), 
        .Q(\right_out[DATA][25] ) );
  HS65_LS_LDHRQX9 \data_reg[24]  ( .G(lt_en), .D(\left_in[DATA][24] ), .RN(n1), 
        .Q(\right_out[DATA][24] ) );
  HS65_LS_LDHRQX9 \data_reg[23]  ( .G(lt_en), .D(\left_in[DATA][23] ), .RN(n2), 
        .Q(\right_out[DATA][23] ) );
  HS65_LS_LDHRQX9 \data_reg[22]  ( .G(lt_en), .D(\left_in[DATA][22] ), .RN(n2), 
        .Q(\right_out[DATA][22] ) );
  HS65_LS_LDHRQX9 \data_reg[21]  ( .G(lt_en), .D(\left_in[DATA][21] ), .RN(n2), 
        .Q(\right_out[DATA][21] ) );
  HS65_LS_LDHRQX9 \data_reg[20]  ( .G(lt_en), .D(\left_in[DATA][20] ), .RN(n2), 
        .Q(\right_out[DATA][20] ) );
  HS65_LS_LDHRQX9 \data_reg[19]  ( .G(lt_en), .D(\left_in[DATA][19] ), .RN(n2), 
        .Q(\right_out[DATA][19] ) );
  HS65_LS_LDHRQX9 \data_reg[18]  ( .G(lt_en), .D(\left_in[DATA][18] ), .RN(n2), 
        .Q(\right_out[DATA][18] ) );
  HS65_LS_LDHRQX9 \data_reg[17]  ( .G(lt_en), .D(\left_in[DATA][17] ), .RN(n2), 
        .Q(\right_out[DATA][17] ) );
  HS65_LS_LDHRQX9 \data_reg[16]  ( .G(lt_en), .D(\left_in[DATA][16] ), .RN(n2), 
        .Q(\right_out[DATA][16] ) );
  HS65_LS_LDHRQX9 \data_reg[15]  ( .G(lt_en), .D(\left_in[DATA][15] ), .RN(n2), 
        .Q(\right_out[DATA][15] ) );
  HS65_LS_LDHRQX9 \data_reg[14]  ( .G(lt_en), .D(\left_in[DATA][14] ), .RN(n2), 
        .Q(\right_out[DATA][14] ) );
  HS65_LS_LDHRQX9 \data_reg[13]  ( .G(lt_en), .D(\left_in[DATA][13] ), .RN(n2), 
        .Q(\right_out[DATA][13] ) );
  HS65_LS_LDHRQX9 \data_reg[12]  ( .G(lt_en), .D(\left_in[DATA][12] ), .RN(n2), 
        .Q(\right_out[DATA][12] ) );
  HS65_LS_LDHRQX9 \data_reg[11]  ( .G(lt_en), .D(\left_in[DATA][11] ), .RN(n1), 
        .Q(\right_out[DATA][11] ) );
  HS65_LS_LDHRQX9 \data_reg[10]  ( .G(lt_en), .D(\left_in[DATA][10] ), .RN(n1), 
        .Q(\right_out[DATA][10] ) );
  HS65_LS_LDHRQX9 \data_reg[9]  ( .G(lt_en), .D(\left_in[DATA][9] ), .RN(n1), 
        .Q(\right_out[DATA][9] ) );
  HS65_LS_LDHRQX9 \data_reg[8]  ( .G(lt_en), .D(\left_in[DATA][8] ), .RN(n1), 
        .Q(\right_out[DATA][8] ) );
  HS65_LS_LDHRQX9 \data_reg[7]  ( .G(lt_en), .D(\left_in[DATA][7] ), .RN(n1), 
        .Q(\right_out[DATA][7] ) );
  HS65_LS_LDHRQX9 \data_reg[6]  ( .G(lt_en), .D(\left_in[DATA][6] ), .RN(n1), 
        .Q(\right_out[DATA][6] ) );
  HS65_LS_LDHRQX9 \data_reg[5]  ( .G(lt_en), .D(\left_in[DATA][5] ), .RN(n1), 
        .Q(\right_out[DATA][5] ) );
  HS65_LS_LDHRQX9 \data_reg[4]  ( .G(lt_en), .D(\left_in[DATA][4] ), .RN(n1), 
        .Q(\right_out[DATA][4] ) );
  HS65_LS_LDHRQX9 \data_reg[3]  ( .G(lt_en), .D(\left_in[DATA][3] ), .RN(n1), 
        .Q(\right_out[DATA][3] ) );
  HS65_LS_LDHRQX9 \data_reg[2]  ( .G(lt_en), .D(\left_in[DATA][2] ), .RN(n1), 
        .Q(\right_out[DATA][2] ) );
  HS65_LS_LDHRQX9 \data_reg[1]  ( .G(lt_en), .D(\left_in[DATA][1] ), .RN(n1), 
        .Q(\right_out[DATA][1] ) );
  HS65_LS_LDHRQX9 \data_reg[0]  ( .G(lt_en), .D(\left_in[DATA][0] ), .RN(n1), 
        .Q(\right_out[DATA][0] ) );
  HS65_LS_BFX9 U3 ( .A(preset), .Z(n3) );
  HS65_LS_IVX9 U4 ( .A(n5), .Z(n1) );
  HS65_LS_BFX9 U5 ( .A(preset), .Z(n5) );
  HS65_LS_IVX9 U6 ( .A(n4), .Z(n2) );
  HS65_LS_BFX9 U7 ( .A(preset), .Z(n4) );
endmodule


module sr_latch_1_4 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X27 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_1_4 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset;

  sr_latch_1_4 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_NOR3X4 U3 ( .A(a), .B(preset), .C(b), .Z(reset) );
  HS65_LS_AO12X9 U4 ( .A(a), .B(b), .C(preset), .Z(set) );
endmodule


module latch_controller_0_4 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, n1;
  assign Rout = Aout;

  c_gate_1_4 gate ( .preset(preset), .a(n1), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 U1 ( .A(Aout), .Z(lt_en) );
  HS65_LS_IVX9 U2 ( .A(Ain), .Z(n1) );
endmodule


module channel_latch_0_000000000_4 ( preset, .left_in({\left_in[REQ] , 
        \left_in[DATA][33] , \left_in[DATA][32] , \left_in[DATA][31] , 
        \left_in[DATA][30] , \left_in[DATA][29] , \left_in[DATA][28] , 
        \left_in[DATA][27] , \left_in[DATA][26] , \left_in[DATA][25] , 
        \left_in[DATA][24] , \left_in[DATA][23] , \left_in[DATA][22] , 
        \left_in[DATA][21] , \left_in[DATA][20] , \left_in[DATA][19] , 
        \left_in[DATA][18] , \left_in[DATA][17] , \left_in[DATA][16] , 
        \left_in[DATA][15] , \left_in[DATA][14] , \left_in[DATA][13] , 
        \left_in[DATA][12] , \left_in[DATA][11] , \left_in[DATA][10] , 
        \left_in[DATA][9] , \left_in[DATA][8] , \left_in[DATA][7] , 
        \left_in[DATA][6] , \left_in[DATA][5] , \left_in[DATA][4] , 
        \left_in[DATA][3] , \left_in[DATA][2] , \left_in[DATA][1] , 
        \left_in[DATA][0] }), .left_out(\left_out[ACK] ), .right_out({
        \right_out[REQ] , \right_out[DATA][33] , \right_out[DATA][32] , 
        \right_out[DATA][31] , \right_out[DATA][30] , \right_out[DATA][29] , 
        \right_out[DATA][28] , \right_out[DATA][27] , \right_out[DATA][26] , 
        \right_out[DATA][25] , \right_out[DATA][24] , \right_out[DATA][23] , 
        \right_out[DATA][22] , \right_out[DATA][21] , \right_out[DATA][20] , 
        \right_out[DATA][19] , \right_out[DATA][18] , \right_out[DATA][17] , 
        \right_out[DATA][16] , \right_out[DATA][15] , \right_out[DATA][14] , 
        \right_out[DATA][13] , \right_out[DATA][12] , \right_out[DATA][11] , 
        \right_out[DATA][10] , \right_out[DATA][9] , \right_out[DATA][8] , 
        \right_out[DATA][7] , \right_out[DATA][6] , \right_out[DATA][5] , 
        \right_out[DATA][4] , \right_out[DATA][3] , \right_out[DATA][2] , 
        \right_out[DATA][1] , \right_out[DATA][0] }), .right_in(
        \right_in[ACK] ) );
  input preset, \left_in[REQ] , \left_in[DATA][33] , \left_in[DATA][32] ,
         \left_in[DATA][31] , \left_in[DATA][30] , \left_in[DATA][29] ,
         \left_in[DATA][28] , \left_in[DATA][27] , \left_in[DATA][26] ,
         \left_in[DATA][25] , \left_in[DATA][24] , \left_in[DATA][23] ,
         \left_in[DATA][22] , \left_in[DATA][21] , \left_in[DATA][20] ,
         \left_in[DATA][19] , \left_in[DATA][18] , \left_in[DATA][17] ,
         \left_in[DATA][16] , \left_in[DATA][15] , \left_in[DATA][14] ,
         \left_in[DATA][13] , \left_in[DATA][12] , \left_in[DATA][11] ,
         \left_in[DATA][10] , \left_in[DATA][9] , \left_in[DATA][8] ,
         \left_in[DATA][7] , \left_in[DATA][6] , \left_in[DATA][5] ,
         \left_in[DATA][4] , \left_in[DATA][3] , \left_in[DATA][2] ,
         \left_in[DATA][1] , \left_in[DATA][0] , \right_in[ACK] ;
  output \left_out[ACK] , \right_out[REQ] , \right_out[DATA][33] ,
         \right_out[DATA][32] , \right_out[DATA][31] , \right_out[DATA][30] ,
         \right_out[DATA][29] , \right_out[DATA][28] , \right_out[DATA][27] ,
         \right_out[DATA][26] , \right_out[DATA][25] , \right_out[DATA][24] ,
         \right_out[DATA][23] , \right_out[DATA][22] , \right_out[DATA][21] ,
         \right_out[DATA][20] , \right_out[DATA][19] , \right_out[DATA][18] ,
         \right_out[DATA][17] , \right_out[DATA][16] , \right_out[DATA][15] ,
         \right_out[DATA][14] , \right_out[DATA][13] , \right_out[DATA][12] ,
         \right_out[DATA][11] , \right_out[DATA][10] , \right_out[DATA][9] ,
         \right_out[DATA][8] , \right_out[DATA][7] , \right_out[DATA][6] ,
         \right_out[DATA][5] , \right_out[DATA][4] , \right_out[DATA][3] ,
         \right_out[DATA][2] , \right_out[DATA][1] , \right_out[DATA][0] ;
  wire   lt_en, n1, n2, n3, n4, n5;

  latch_controller_0_4 controller ( .preset(n3), .Rin(\left_in[REQ] ), .Aout(
        \left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHRQX9 \data_reg[33]  ( .G(lt_en), .D(\left_in[DATA][33] ), .RN(n2), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_LDHRQX9 \data_reg[32]  ( .G(lt_en), .D(\left_in[DATA][32] ), .RN(n1), 
        .Q(\right_out[DATA][32] ) );
  HS65_LS_LDHRQX9 \data_reg[31]  ( .G(lt_en), .D(\left_in[DATA][31] ), .RN(n2), 
        .Q(\right_out[DATA][31] ) );
  HS65_LS_LDHRQX9 \data_reg[30]  ( .G(lt_en), .D(\left_in[DATA][30] ), .RN(n1), 
        .Q(\right_out[DATA][30] ) );
  HS65_LS_LDHRQX9 \data_reg[29]  ( .G(lt_en), .D(\left_in[DATA][29] ), .RN(n2), 
        .Q(\right_out[DATA][29] ) );
  HS65_LS_LDHRQX9 \data_reg[28]  ( .G(lt_en), .D(\left_in[DATA][28] ), .RN(n1), 
        .Q(\right_out[DATA][28] ) );
  HS65_LS_LDHRQX9 \data_reg[27]  ( .G(lt_en), .D(\left_in[DATA][27] ), .RN(n2), 
        .Q(\right_out[DATA][27] ) );
  HS65_LS_LDHRQX9 \data_reg[26]  ( .G(lt_en), .D(\left_in[DATA][26] ), .RN(n1), 
        .Q(\right_out[DATA][26] ) );
  HS65_LS_LDHRQX9 \data_reg[25]  ( .G(lt_en), .D(\left_in[DATA][25] ), .RN(n2), 
        .Q(\right_out[DATA][25] ) );
  HS65_LS_LDHRQX9 \data_reg[24]  ( .G(lt_en), .D(\left_in[DATA][24] ), .RN(n1), 
        .Q(\right_out[DATA][24] ) );
  HS65_LS_LDHRQX9 \data_reg[23]  ( .G(lt_en), .D(\left_in[DATA][23] ), .RN(n2), 
        .Q(\right_out[DATA][23] ) );
  HS65_LS_LDHRQX9 \data_reg[22]  ( .G(lt_en), .D(\left_in[DATA][22] ), .RN(n2), 
        .Q(\right_out[DATA][22] ) );
  HS65_LS_LDHRQX9 \data_reg[21]  ( .G(lt_en), .D(\left_in[DATA][21] ), .RN(n2), 
        .Q(\right_out[DATA][21] ) );
  HS65_LS_LDHRQX9 \data_reg[20]  ( .G(lt_en), .D(\left_in[DATA][20] ), .RN(n2), 
        .Q(\right_out[DATA][20] ) );
  HS65_LS_LDHRQX9 \data_reg[19]  ( .G(lt_en), .D(\left_in[DATA][19] ), .RN(n2), 
        .Q(\right_out[DATA][19] ) );
  HS65_LS_LDHRQX9 \data_reg[18]  ( .G(lt_en), .D(\left_in[DATA][18] ), .RN(n2), 
        .Q(\right_out[DATA][18] ) );
  HS65_LS_LDHRQX9 \data_reg[17]  ( .G(lt_en), .D(\left_in[DATA][17] ), .RN(n2), 
        .Q(\right_out[DATA][17] ) );
  HS65_LS_LDHRQX9 \data_reg[16]  ( .G(lt_en), .D(\left_in[DATA][16] ), .RN(n2), 
        .Q(\right_out[DATA][16] ) );
  HS65_LS_LDHRQX9 \data_reg[15]  ( .G(lt_en), .D(\left_in[DATA][15] ), .RN(n2), 
        .Q(\right_out[DATA][15] ) );
  HS65_LS_LDHRQX9 \data_reg[14]  ( .G(lt_en), .D(\left_in[DATA][14] ), .RN(n2), 
        .Q(\right_out[DATA][14] ) );
  HS65_LS_LDHRQX9 \data_reg[13]  ( .G(lt_en), .D(\left_in[DATA][13] ), .RN(n2), 
        .Q(\right_out[DATA][13] ) );
  HS65_LS_LDHRQX9 \data_reg[12]  ( .G(lt_en), .D(\left_in[DATA][12] ), .RN(n2), 
        .Q(\right_out[DATA][12] ) );
  HS65_LS_LDHRQX9 \data_reg[11]  ( .G(lt_en), .D(\left_in[DATA][11] ), .RN(n1), 
        .Q(\right_out[DATA][11] ) );
  HS65_LS_LDHRQX9 \data_reg[10]  ( .G(lt_en), .D(\left_in[DATA][10] ), .RN(n1), 
        .Q(\right_out[DATA][10] ) );
  HS65_LS_LDHRQX9 \data_reg[9]  ( .G(lt_en), .D(\left_in[DATA][9] ), .RN(n1), 
        .Q(\right_out[DATA][9] ) );
  HS65_LS_LDHRQX9 \data_reg[8]  ( .G(lt_en), .D(\left_in[DATA][8] ), .RN(n1), 
        .Q(\right_out[DATA][8] ) );
  HS65_LS_LDHRQX9 \data_reg[7]  ( .G(lt_en), .D(\left_in[DATA][7] ), .RN(n1), 
        .Q(\right_out[DATA][7] ) );
  HS65_LS_LDHRQX9 \data_reg[6]  ( .G(lt_en), .D(\left_in[DATA][6] ), .RN(n1), 
        .Q(\right_out[DATA][6] ) );
  HS65_LS_LDHRQX9 \data_reg[5]  ( .G(lt_en), .D(\left_in[DATA][5] ), .RN(n1), 
        .Q(\right_out[DATA][5] ) );
  HS65_LS_LDHRQX9 \data_reg[4]  ( .G(lt_en), .D(\left_in[DATA][4] ), .RN(n1), 
        .Q(\right_out[DATA][4] ) );
  HS65_LS_LDHRQX9 \data_reg[3]  ( .G(lt_en), .D(\left_in[DATA][3] ), .RN(n1), 
        .Q(\right_out[DATA][3] ) );
  HS65_LS_LDHRQX9 \data_reg[2]  ( .G(lt_en), .D(\left_in[DATA][2] ), .RN(n1), 
        .Q(\right_out[DATA][2] ) );
  HS65_LS_LDHRQX9 \data_reg[1]  ( .G(lt_en), .D(\left_in[DATA][1] ), .RN(n1), 
        .Q(\right_out[DATA][1] ) );
  HS65_LS_LDHRQX9 \data_reg[0]  ( .G(lt_en), .D(\left_in[DATA][0] ), .RN(n1), 
        .Q(\right_out[DATA][0] ) );
  HS65_LS_BFX9 U3 ( .A(preset), .Z(n3) );
  HS65_LS_IVX9 U4 ( .A(n5), .Z(n1) );
  HS65_LS_BFX9 U5 ( .A(preset), .Z(n5) );
  HS65_LS_IVX9 U6 ( .A(n4), .Z(n2) );
  HS65_LS_BFX9 U7 ( .A(preset), .Z(n4) );
endmodule


module crossbar_stage_x0_y0 ( preset, .switch_sel({\switch_sel[4][4] , 
        \switch_sel[4][3] , \switch_sel[4][2] , \switch_sel[4][1] , 
        \switch_sel[4][0] , \switch_sel[3][4] , \switch_sel[3][3] , 
        \switch_sel[3][2] , \switch_sel[3][1] , \switch_sel[3][0] , 
        \switch_sel[2][4] , \switch_sel[2][3] , \switch_sel[2][2] , 
        \switch_sel[2][1] , \switch_sel[2][0] , \switch_sel[1][4] , 
        \switch_sel[1][3] , \switch_sel[1][2] , \switch_sel[1][1] , 
        \switch_sel[1][0] , \switch_sel[0][4] , \switch_sel[0][3] , 
        \switch_sel[0][2] , \switch_sel[0][1] , \switch_sel[0][0] }), 
    .chs_in_f({\chs_in_f[4][REQ] , \chs_in_f[4][DATA][33] , 
        \chs_in_f[4][DATA][32] , \chs_in_f[4][DATA][31] , 
        \chs_in_f[4][DATA][30] , \chs_in_f[4][DATA][29] , 
        \chs_in_f[4][DATA][28] , \chs_in_f[4][DATA][27] , 
        \chs_in_f[4][DATA][26] , \chs_in_f[4][DATA][25] , 
        \chs_in_f[4][DATA][24] , \chs_in_f[4][DATA][23] , 
        \chs_in_f[4][DATA][22] , \chs_in_f[4][DATA][21] , 
        \chs_in_f[4][DATA][20] , \chs_in_f[4][DATA][19] , 
        \chs_in_f[4][DATA][18] , \chs_in_f[4][DATA][17] , 
        \chs_in_f[4][DATA][16] , \chs_in_f[4][DATA][15] , 
        \chs_in_f[4][DATA][14] , \chs_in_f[4][DATA][13] , 
        \chs_in_f[4][DATA][12] , \chs_in_f[4][DATA][11] , 
        \chs_in_f[4][DATA][10] , \chs_in_f[4][DATA][9] , 
        \chs_in_f[4][DATA][8] , \chs_in_f[4][DATA][7] , \chs_in_f[4][DATA][6] , 
        \chs_in_f[4][DATA][5] , \chs_in_f[4][DATA][4] , \chs_in_f[4][DATA][3] , 
        \chs_in_f[4][DATA][2] , \chs_in_f[4][DATA][1] , \chs_in_f[4][DATA][0] , 
        \chs_in_f[3][REQ] , \chs_in_f[3][DATA][33] , \chs_in_f[3][DATA][32] , 
        \chs_in_f[3][DATA][31] , \chs_in_f[3][DATA][30] , 
        \chs_in_f[3][DATA][29] , \chs_in_f[3][DATA][28] , 
        \chs_in_f[3][DATA][27] , \chs_in_f[3][DATA][26] , 
        \chs_in_f[3][DATA][25] , \chs_in_f[3][DATA][24] , 
        \chs_in_f[3][DATA][23] , \chs_in_f[3][DATA][22] , 
        \chs_in_f[3][DATA][21] , \chs_in_f[3][DATA][20] , 
        \chs_in_f[3][DATA][19] , \chs_in_f[3][DATA][18] , 
        \chs_in_f[3][DATA][17] , \chs_in_f[3][DATA][16] , 
        \chs_in_f[3][DATA][15] , \chs_in_f[3][DATA][14] , 
        \chs_in_f[3][DATA][13] , \chs_in_f[3][DATA][12] , 
        \chs_in_f[3][DATA][11] , \chs_in_f[3][DATA][10] , 
        \chs_in_f[3][DATA][9] , \chs_in_f[3][DATA][8] , \chs_in_f[3][DATA][7] , 
        \chs_in_f[3][DATA][6] , \chs_in_f[3][DATA][5] , \chs_in_f[3][DATA][4] , 
        \chs_in_f[3][DATA][3] , \chs_in_f[3][DATA][2] , \chs_in_f[3][DATA][1] , 
        \chs_in_f[3][DATA][0] , \chs_in_f[2][REQ] , \chs_in_f[2][DATA][33] , 
        \chs_in_f[2][DATA][32] , \chs_in_f[2][DATA][31] , 
        \chs_in_f[2][DATA][30] , \chs_in_f[2][DATA][29] , 
        \chs_in_f[2][DATA][28] , \chs_in_f[2][DATA][27] , 
        \chs_in_f[2][DATA][26] , \chs_in_f[2][DATA][25] , 
        \chs_in_f[2][DATA][24] , \chs_in_f[2][DATA][23] , 
        \chs_in_f[2][DATA][22] , \chs_in_f[2][DATA][21] , 
        \chs_in_f[2][DATA][20] , \chs_in_f[2][DATA][19] , 
        \chs_in_f[2][DATA][18] , \chs_in_f[2][DATA][17] , 
        \chs_in_f[2][DATA][16] , \chs_in_f[2][DATA][15] , 
        \chs_in_f[2][DATA][14] , \chs_in_f[2][DATA][13] , 
        \chs_in_f[2][DATA][12] , \chs_in_f[2][DATA][11] , 
        \chs_in_f[2][DATA][10] , \chs_in_f[2][DATA][9] , 
        \chs_in_f[2][DATA][8] , \chs_in_f[2][DATA][7] , \chs_in_f[2][DATA][6] , 
        \chs_in_f[2][DATA][5] , \chs_in_f[2][DATA][4] , \chs_in_f[2][DATA][3] , 
        \chs_in_f[2][DATA][2] , \chs_in_f[2][DATA][1] , \chs_in_f[2][DATA][0] , 
        \chs_in_f[1][REQ] , \chs_in_f[1][DATA][33] , \chs_in_f[1][DATA][32] , 
        \chs_in_f[1][DATA][31] , \chs_in_f[1][DATA][30] , 
        \chs_in_f[1][DATA][29] , \chs_in_f[1][DATA][28] , 
        \chs_in_f[1][DATA][27] , \chs_in_f[1][DATA][26] , 
        \chs_in_f[1][DATA][25] , \chs_in_f[1][DATA][24] , 
        \chs_in_f[1][DATA][23] , \chs_in_f[1][DATA][22] , 
        \chs_in_f[1][DATA][21] , \chs_in_f[1][DATA][20] , 
        \chs_in_f[1][DATA][19] , \chs_in_f[1][DATA][18] , 
        \chs_in_f[1][DATA][17] , \chs_in_f[1][DATA][16] , 
        \chs_in_f[1][DATA][15] , \chs_in_f[1][DATA][14] , 
        \chs_in_f[1][DATA][13] , \chs_in_f[1][DATA][12] , 
        \chs_in_f[1][DATA][11] , \chs_in_f[1][DATA][10] , 
        \chs_in_f[1][DATA][9] , \chs_in_f[1][DATA][8] , \chs_in_f[1][DATA][7] , 
        \chs_in_f[1][DATA][6] , \chs_in_f[1][DATA][5] , \chs_in_f[1][DATA][4] , 
        \chs_in_f[1][DATA][3] , \chs_in_f[1][DATA][2] , \chs_in_f[1][DATA][1] , 
        \chs_in_f[1][DATA][0] , \chs_in_f[0][REQ] , \chs_in_f[0][DATA][33] , 
        \chs_in_f[0][DATA][32] , \chs_in_f[0][DATA][31] , 
        \chs_in_f[0][DATA][30] , \chs_in_f[0][DATA][29] , 
        \chs_in_f[0][DATA][28] , \chs_in_f[0][DATA][27] , 
        \chs_in_f[0][DATA][26] , \chs_in_f[0][DATA][25] , 
        \chs_in_f[0][DATA][24] , \chs_in_f[0][DATA][23] , 
        \chs_in_f[0][DATA][22] , \chs_in_f[0][DATA][21] , 
        \chs_in_f[0][DATA][20] , \chs_in_f[0][DATA][19] , 
        \chs_in_f[0][DATA][18] , \chs_in_f[0][DATA][17] , 
        \chs_in_f[0][DATA][16] , \chs_in_f[0][DATA][15] , 
        \chs_in_f[0][DATA][14] , \chs_in_f[0][DATA][13] , 
        \chs_in_f[0][DATA][12] , \chs_in_f[0][DATA][11] , 
        \chs_in_f[0][DATA][10] , \chs_in_f[0][DATA][9] , 
        \chs_in_f[0][DATA][8] , \chs_in_f[0][DATA][7] , \chs_in_f[0][DATA][6] , 
        \chs_in_f[0][DATA][5] , \chs_in_f[0][DATA][4] , \chs_in_f[0][DATA][3] , 
        \chs_in_f[0][DATA][2] , \chs_in_f[0][DATA][1] , \chs_in_f[0][DATA][0] 
        }), .chs_in_b({\chs_in_b[4][ACK] , \chs_in_b[3][ACK] , 
        \chs_in_b[2][ACK] , \chs_in_b[1][ACK] , \chs_in_b[0][ACK] }), 
    .latches_out_f({\latches_out_f[4][REQ] , \latches_out_f[4][DATA][33] , 
        \latches_out_f[4][DATA][32] , \latches_out_f[4][DATA][31] , 
        \latches_out_f[4][DATA][30] , \latches_out_f[4][DATA][29] , 
        \latches_out_f[4][DATA][28] , \latches_out_f[4][DATA][27] , 
        \latches_out_f[4][DATA][26] , \latches_out_f[4][DATA][25] , 
        \latches_out_f[4][DATA][24] , \latches_out_f[4][DATA][23] , 
        \latches_out_f[4][DATA][22] , \latches_out_f[4][DATA][21] , 
        \latches_out_f[4][DATA][20] , \latches_out_f[4][DATA][19] , 
        \latches_out_f[4][DATA][18] , \latches_out_f[4][DATA][17] , 
        \latches_out_f[4][DATA][16] , \latches_out_f[4][DATA][15] , 
        \latches_out_f[4][DATA][14] , \latches_out_f[4][DATA][13] , 
        \latches_out_f[4][DATA][12] , \latches_out_f[4][DATA][11] , 
        \latches_out_f[4][DATA][10] , \latches_out_f[4][DATA][9] , 
        \latches_out_f[4][DATA][8] , \latches_out_f[4][DATA][7] , 
        \latches_out_f[4][DATA][6] , \latches_out_f[4][DATA][5] , 
        \latches_out_f[4][DATA][4] , \latches_out_f[4][DATA][3] , 
        \latches_out_f[4][DATA][2] , \latches_out_f[4][DATA][1] , 
        \latches_out_f[4][DATA][0] , \latches_out_f[3][REQ] , 
        \latches_out_f[3][DATA][33] , \latches_out_f[3][DATA][32] , 
        \latches_out_f[3][DATA][31] , \latches_out_f[3][DATA][30] , 
        \latches_out_f[3][DATA][29] , \latches_out_f[3][DATA][28] , 
        \latches_out_f[3][DATA][27] , \latches_out_f[3][DATA][26] , 
        \latches_out_f[3][DATA][25] , \latches_out_f[3][DATA][24] , 
        \latches_out_f[3][DATA][23] , \latches_out_f[3][DATA][22] , 
        \latches_out_f[3][DATA][21] , \latches_out_f[3][DATA][20] , 
        \latches_out_f[3][DATA][19] , \latches_out_f[3][DATA][18] , 
        \latches_out_f[3][DATA][17] , \latches_out_f[3][DATA][16] , 
        \latches_out_f[3][DATA][15] , \latches_out_f[3][DATA][14] , 
        \latches_out_f[3][DATA][13] , \latches_out_f[3][DATA][12] , 
        \latches_out_f[3][DATA][11] , \latches_out_f[3][DATA][10] , 
        \latches_out_f[3][DATA][9] , \latches_out_f[3][DATA][8] , 
        \latches_out_f[3][DATA][7] , \latches_out_f[3][DATA][6] , 
        \latches_out_f[3][DATA][5] , \latches_out_f[3][DATA][4] , 
        \latches_out_f[3][DATA][3] , \latches_out_f[3][DATA][2] , 
        \latches_out_f[3][DATA][1] , \latches_out_f[3][DATA][0] , 
        \latches_out_f[2][REQ] , \latches_out_f[2][DATA][33] , 
        \latches_out_f[2][DATA][32] , \latches_out_f[2][DATA][31] , 
        \latches_out_f[2][DATA][30] , \latches_out_f[2][DATA][29] , 
        \latches_out_f[2][DATA][28] , \latches_out_f[2][DATA][27] , 
        \latches_out_f[2][DATA][26] , \latches_out_f[2][DATA][25] , 
        \latches_out_f[2][DATA][24] , \latches_out_f[2][DATA][23] , 
        \latches_out_f[2][DATA][22] , \latches_out_f[2][DATA][21] , 
        \latches_out_f[2][DATA][20] , \latches_out_f[2][DATA][19] , 
        \latches_out_f[2][DATA][18] , \latches_out_f[2][DATA][17] , 
        \latches_out_f[2][DATA][16] , \latches_out_f[2][DATA][15] , 
        \latches_out_f[2][DATA][14] , \latches_out_f[2][DATA][13] , 
        \latches_out_f[2][DATA][12] , \latches_out_f[2][DATA][11] , 
        \latches_out_f[2][DATA][10] , \latches_out_f[2][DATA][9] , 
        \latches_out_f[2][DATA][8] , \latches_out_f[2][DATA][7] , 
        \latches_out_f[2][DATA][6] , \latches_out_f[2][DATA][5] , 
        \latches_out_f[2][DATA][4] , \latches_out_f[2][DATA][3] , 
        \latches_out_f[2][DATA][2] , \latches_out_f[2][DATA][1] , 
        \latches_out_f[2][DATA][0] , \latches_out_f[1][REQ] , 
        \latches_out_f[1][DATA][33] , \latches_out_f[1][DATA][32] , 
        \latches_out_f[1][DATA][31] , \latches_out_f[1][DATA][30] , 
        \latches_out_f[1][DATA][29] , \latches_out_f[1][DATA][28] , 
        \latches_out_f[1][DATA][27] , \latches_out_f[1][DATA][26] , 
        \latches_out_f[1][DATA][25] , \latches_out_f[1][DATA][24] , 
        \latches_out_f[1][DATA][23] , \latches_out_f[1][DATA][22] , 
        \latches_out_f[1][DATA][21] , \latches_out_f[1][DATA][20] , 
        \latches_out_f[1][DATA][19] , \latches_out_f[1][DATA][18] , 
        \latches_out_f[1][DATA][17] , \latches_out_f[1][DATA][16] , 
        \latches_out_f[1][DATA][15] , \latches_out_f[1][DATA][14] , 
        \latches_out_f[1][DATA][13] , \latches_out_f[1][DATA][12] , 
        \latches_out_f[1][DATA][11] , \latches_out_f[1][DATA][10] , 
        \latches_out_f[1][DATA][9] , \latches_out_f[1][DATA][8] , 
        \latches_out_f[1][DATA][7] , \latches_out_f[1][DATA][6] , 
        \latches_out_f[1][DATA][5] , \latches_out_f[1][DATA][4] , 
        \latches_out_f[1][DATA][3] , \latches_out_f[1][DATA][2] , 
        \latches_out_f[1][DATA][1] , \latches_out_f[1][DATA][0] , 
        \latches_out_f[0][REQ] , \latches_out_f[0][DATA][33] , 
        \latches_out_f[0][DATA][32] , \latches_out_f[0][DATA][31] , 
        \latches_out_f[0][DATA][30] , \latches_out_f[0][DATA][29] , 
        \latches_out_f[0][DATA][28] , \latches_out_f[0][DATA][27] , 
        \latches_out_f[0][DATA][26] , \latches_out_f[0][DATA][25] , 
        \latches_out_f[0][DATA][24] , \latches_out_f[0][DATA][23] , 
        \latches_out_f[0][DATA][22] , \latches_out_f[0][DATA][21] , 
        \latches_out_f[0][DATA][20] , \latches_out_f[0][DATA][19] , 
        \latches_out_f[0][DATA][18] , \latches_out_f[0][DATA][17] , 
        \latches_out_f[0][DATA][16] , \latches_out_f[0][DATA][15] , 
        \latches_out_f[0][DATA][14] , \latches_out_f[0][DATA][13] , 
        \latches_out_f[0][DATA][12] , \latches_out_f[0][DATA][11] , 
        \latches_out_f[0][DATA][10] , \latches_out_f[0][DATA][9] , 
        \latches_out_f[0][DATA][8] , \latches_out_f[0][DATA][7] , 
        \latches_out_f[0][DATA][6] , \latches_out_f[0][DATA][5] , 
        \latches_out_f[0][DATA][4] , \latches_out_f[0][DATA][3] , 
        \latches_out_f[0][DATA][2] , \latches_out_f[0][DATA][1] , 
        \latches_out_f[0][DATA][0] }), .latches_out_b({\latches_out_b[4][ACK] , 
        \latches_out_b[3][ACK] , \latches_out_b[2][ACK] , 
        \latches_out_b[1][ACK] , \latches_out_b[0][ACK] }) );
  input preset, \switch_sel[4][4] , \switch_sel[4][3] , \switch_sel[4][2] ,
         \switch_sel[4][1] , \switch_sel[4][0] , \switch_sel[3][4] ,
         \switch_sel[3][3] , \switch_sel[3][2] , \switch_sel[3][1] ,
         \switch_sel[3][0] , \switch_sel[2][4] , \switch_sel[2][3] ,
         \switch_sel[2][2] , \switch_sel[2][1] , \switch_sel[2][0] ,
         \switch_sel[1][4] , \switch_sel[1][3] , \switch_sel[1][2] ,
         \switch_sel[1][1] , \switch_sel[1][0] , \switch_sel[0][4] ,
         \switch_sel[0][3] , \switch_sel[0][2] , \switch_sel[0][1] ,
         \switch_sel[0][0] , \chs_in_f[4][REQ] , \chs_in_f[4][DATA][33] ,
         \chs_in_f[4][DATA][32] , \chs_in_f[4][DATA][31] ,
         \chs_in_f[4][DATA][30] , \chs_in_f[4][DATA][29] ,
         \chs_in_f[4][DATA][28] , \chs_in_f[4][DATA][27] ,
         \chs_in_f[4][DATA][26] , \chs_in_f[4][DATA][25] ,
         \chs_in_f[4][DATA][24] , \chs_in_f[4][DATA][23] ,
         \chs_in_f[4][DATA][22] , \chs_in_f[4][DATA][21] ,
         \chs_in_f[4][DATA][20] , \chs_in_f[4][DATA][19] ,
         \chs_in_f[4][DATA][18] , \chs_in_f[4][DATA][17] ,
         \chs_in_f[4][DATA][16] , \chs_in_f[4][DATA][15] ,
         \chs_in_f[4][DATA][14] , \chs_in_f[4][DATA][13] ,
         \chs_in_f[4][DATA][12] , \chs_in_f[4][DATA][11] ,
         \chs_in_f[4][DATA][10] , \chs_in_f[4][DATA][9] ,
         \chs_in_f[4][DATA][8] , \chs_in_f[4][DATA][7] ,
         \chs_in_f[4][DATA][6] , \chs_in_f[4][DATA][5] ,
         \chs_in_f[4][DATA][4] , \chs_in_f[4][DATA][3] ,
         \chs_in_f[4][DATA][2] , \chs_in_f[4][DATA][1] ,
         \chs_in_f[4][DATA][0] , \chs_in_f[3][REQ] , \chs_in_f[3][DATA][33] ,
         \chs_in_f[3][DATA][32] , \chs_in_f[3][DATA][31] ,
         \chs_in_f[3][DATA][30] , \chs_in_f[3][DATA][29] ,
         \chs_in_f[3][DATA][28] , \chs_in_f[3][DATA][27] ,
         \chs_in_f[3][DATA][26] , \chs_in_f[3][DATA][25] ,
         \chs_in_f[3][DATA][24] , \chs_in_f[3][DATA][23] ,
         \chs_in_f[3][DATA][22] , \chs_in_f[3][DATA][21] ,
         \chs_in_f[3][DATA][20] , \chs_in_f[3][DATA][19] ,
         \chs_in_f[3][DATA][18] , \chs_in_f[3][DATA][17] ,
         \chs_in_f[3][DATA][16] , \chs_in_f[3][DATA][15] ,
         \chs_in_f[3][DATA][14] , \chs_in_f[3][DATA][13] ,
         \chs_in_f[3][DATA][12] , \chs_in_f[3][DATA][11] ,
         \chs_in_f[3][DATA][10] , \chs_in_f[3][DATA][9] ,
         \chs_in_f[3][DATA][8] , \chs_in_f[3][DATA][7] ,
         \chs_in_f[3][DATA][6] , \chs_in_f[3][DATA][5] ,
         \chs_in_f[3][DATA][4] , \chs_in_f[3][DATA][3] ,
         \chs_in_f[3][DATA][2] , \chs_in_f[3][DATA][1] ,
         \chs_in_f[3][DATA][0] , \chs_in_f[2][REQ] , \chs_in_f[2][DATA][33] ,
         \chs_in_f[2][DATA][32] , \chs_in_f[2][DATA][31] ,
         \chs_in_f[2][DATA][30] , \chs_in_f[2][DATA][29] ,
         \chs_in_f[2][DATA][28] , \chs_in_f[2][DATA][27] ,
         \chs_in_f[2][DATA][26] , \chs_in_f[2][DATA][25] ,
         \chs_in_f[2][DATA][24] , \chs_in_f[2][DATA][23] ,
         \chs_in_f[2][DATA][22] , \chs_in_f[2][DATA][21] ,
         \chs_in_f[2][DATA][20] , \chs_in_f[2][DATA][19] ,
         \chs_in_f[2][DATA][18] , \chs_in_f[2][DATA][17] ,
         \chs_in_f[2][DATA][16] , \chs_in_f[2][DATA][15] ,
         \chs_in_f[2][DATA][14] , \chs_in_f[2][DATA][13] ,
         \chs_in_f[2][DATA][12] , \chs_in_f[2][DATA][11] ,
         \chs_in_f[2][DATA][10] , \chs_in_f[2][DATA][9] ,
         \chs_in_f[2][DATA][8] , \chs_in_f[2][DATA][7] ,
         \chs_in_f[2][DATA][6] , \chs_in_f[2][DATA][5] ,
         \chs_in_f[2][DATA][4] , \chs_in_f[2][DATA][3] ,
         \chs_in_f[2][DATA][2] , \chs_in_f[2][DATA][1] ,
         \chs_in_f[2][DATA][0] , \chs_in_f[1][REQ] , \chs_in_f[1][DATA][33] ,
         \chs_in_f[1][DATA][32] , \chs_in_f[1][DATA][31] ,
         \chs_in_f[1][DATA][30] , \chs_in_f[1][DATA][29] ,
         \chs_in_f[1][DATA][28] , \chs_in_f[1][DATA][27] ,
         \chs_in_f[1][DATA][26] , \chs_in_f[1][DATA][25] ,
         \chs_in_f[1][DATA][24] , \chs_in_f[1][DATA][23] ,
         \chs_in_f[1][DATA][22] , \chs_in_f[1][DATA][21] ,
         \chs_in_f[1][DATA][20] , \chs_in_f[1][DATA][19] ,
         \chs_in_f[1][DATA][18] , \chs_in_f[1][DATA][17] ,
         \chs_in_f[1][DATA][16] , \chs_in_f[1][DATA][15] ,
         \chs_in_f[1][DATA][14] , \chs_in_f[1][DATA][13] ,
         \chs_in_f[1][DATA][12] , \chs_in_f[1][DATA][11] ,
         \chs_in_f[1][DATA][10] , \chs_in_f[1][DATA][9] ,
         \chs_in_f[1][DATA][8] , \chs_in_f[1][DATA][7] ,
         \chs_in_f[1][DATA][6] , \chs_in_f[1][DATA][5] ,
         \chs_in_f[1][DATA][4] , \chs_in_f[1][DATA][3] ,
         \chs_in_f[1][DATA][2] , \chs_in_f[1][DATA][1] ,
         \chs_in_f[1][DATA][0] , \chs_in_f[0][REQ] , \chs_in_f[0][DATA][33] ,
         \chs_in_f[0][DATA][32] , \chs_in_f[0][DATA][31] ,
         \chs_in_f[0][DATA][30] , \chs_in_f[0][DATA][29] ,
         \chs_in_f[0][DATA][28] , \chs_in_f[0][DATA][27] ,
         \chs_in_f[0][DATA][26] , \chs_in_f[0][DATA][25] ,
         \chs_in_f[0][DATA][24] , \chs_in_f[0][DATA][23] ,
         \chs_in_f[0][DATA][22] , \chs_in_f[0][DATA][21] ,
         \chs_in_f[0][DATA][20] , \chs_in_f[0][DATA][19] ,
         \chs_in_f[0][DATA][18] , \chs_in_f[0][DATA][17] ,
         \chs_in_f[0][DATA][16] , \chs_in_f[0][DATA][15] ,
         \chs_in_f[0][DATA][14] , \chs_in_f[0][DATA][13] ,
         \chs_in_f[0][DATA][12] , \chs_in_f[0][DATA][11] ,
         \chs_in_f[0][DATA][10] , \chs_in_f[0][DATA][9] ,
         \chs_in_f[0][DATA][8] , \chs_in_f[0][DATA][7] ,
         \chs_in_f[0][DATA][6] , \chs_in_f[0][DATA][5] ,
         \chs_in_f[0][DATA][4] , \chs_in_f[0][DATA][3] ,
         \chs_in_f[0][DATA][2] , \chs_in_f[0][DATA][1] ,
         \chs_in_f[0][DATA][0] , \latches_out_b[4][ACK] ,
         \latches_out_b[3][ACK] , \latches_out_b[2][ACK] ,
         \latches_out_b[1][ACK] , \latches_out_b[0][ACK] ;
  output \chs_in_b[4][ACK] , \chs_in_b[3][ACK] , \chs_in_b[2][ACK] ,
         \chs_in_b[1][ACK] , \chs_in_b[0][ACK] , \latches_out_f[4][REQ] ,
         \latches_out_f[4][DATA][33] , \latches_out_f[4][DATA][32] ,
         \latches_out_f[4][DATA][31] , \latches_out_f[4][DATA][30] ,
         \latches_out_f[4][DATA][29] , \latches_out_f[4][DATA][28] ,
         \latches_out_f[4][DATA][27] , \latches_out_f[4][DATA][26] ,
         \latches_out_f[4][DATA][25] , \latches_out_f[4][DATA][24] ,
         \latches_out_f[4][DATA][23] , \latches_out_f[4][DATA][22] ,
         \latches_out_f[4][DATA][21] , \latches_out_f[4][DATA][20] ,
         \latches_out_f[4][DATA][19] , \latches_out_f[4][DATA][18] ,
         \latches_out_f[4][DATA][17] , \latches_out_f[4][DATA][16] ,
         \latches_out_f[4][DATA][15] , \latches_out_f[4][DATA][14] ,
         \latches_out_f[4][DATA][13] , \latches_out_f[4][DATA][12] ,
         \latches_out_f[4][DATA][11] , \latches_out_f[4][DATA][10] ,
         \latches_out_f[4][DATA][9] , \latches_out_f[4][DATA][8] ,
         \latches_out_f[4][DATA][7] , \latches_out_f[4][DATA][6] ,
         \latches_out_f[4][DATA][5] , \latches_out_f[4][DATA][4] ,
         \latches_out_f[4][DATA][3] , \latches_out_f[4][DATA][2] ,
         \latches_out_f[4][DATA][1] , \latches_out_f[4][DATA][0] ,
         \latches_out_f[3][REQ] , \latches_out_f[3][DATA][33] ,
         \latches_out_f[3][DATA][32] , \latches_out_f[3][DATA][31] ,
         \latches_out_f[3][DATA][30] , \latches_out_f[3][DATA][29] ,
         \latches_out_f[3][DATA][28] , \latches_out_f[3][DATA][27] ,
         \latches_out_f[3][DATA][26] , \latches_out_f[3][DATA][25] ,
         \latches_out_f[3][DATA][24] , \latches_out_f[3][DATA][23] ,
         \latches_out_f[3][DATA][22] , \latches_out_f[3][DATA][21] ,
         \latches_out_f[3][DATA][20] , \latches_out_f[3][DATA][19] ,
         \latches_out_f[3][DATA][18] , \latches_out_f[3][DATA][17] ,
         \latches_out_f[3][DATA][16] , \latches_out_f[3][DATA][15] ,
         \latches_out_f[3][DATA][14] , \latches_out_f[3][DATA][13] ,
         \latches_out_f[3][DATA][12] , \latches_out_f[3][DATA][11] ,
         \latches_out_f[3][DATA][10] , \latches_out_f[3][DATA][9] ,
         \latches_out_f[3][DATA][8] , \latches_out_f[3][DATA][7] ,
         \latches_out_f[3][DATA][6] , \latches_out_f[3][DATA][5] ,
         \latches_out_f[3][DATA][4] , \latches_out_f[3][DATA][3] ,
         \latches_out_f[3][DATA][2] , \latches_out_f[3][DATA][1] ,
         \latches_out_f[3][DATA][0] , \latches_out_f[2][REQ] ,
         \latches_out_f[2][DATA][33] , \latches_out_f[2][DATA][32] ,
         \latches_out_f[2][DATA][31] , \latches_out_f[2][DATA][30] ,
         \latches_out_f[2][DATA][29] , \latches_out_f[2][DATA][28] ,
         \latches_out_f[2][DATA][27] , \latches_out_f[2][DATA][26] ,
         \latches_out_f[2][DATA][25] , \latches_out_f[2][DATA][24] ,
         \latches_out_f[2][DATA][23] , \latches_out_f[2][DATA][22] ,
         \latches_out_f[2][DATA][21] , \latches_out_f[2][DATA][20] ,
         \latches_out_f[2][DATA][19] , \latches_out_f[2][DATA][18] ,
         \latches_out_f[2][DATA][17] , \latches_out_f[2][DATA][16] ,
         \latches_out_f[2][DATA][15] , \latches_out_f[2][DATA][14] ,
         \latches_out_f[2][DATA][13] , \latches_out_f[2][DATA][12] ,
         \latches_out_f[2][DATA][11] , \latches_out_f[2][DATA][10] ,
         \latches_out_f[2][DATA][9] , \latches_out_f[2][DATA][8] ,
         \latches_out_f[2][DATA][7] , \latches_out_f[2][DATA][6] ,
         \latches_out_f[2][DATA][5] , \latches_out_f[2][DATA][4] ,
         \latches_out_f[2][DATA][3] , \latches_out_f[2][DATA][2] ,
         \latches_out_f[2][DATA][1] , \latches_out_f[2][DATA][0] ,
         \latches_out_f[1][REQ] , \latches_out_f[1][DATA][33] ,
         \latches_out_f[1][DATA][32] , \latches_out_f[1][DATA][31] ,
         \latches_out_f[1][DATA][30] , \latches_out_f[1][DATA][29] ,
         \latches_out_f[1][DATA][28] , \latches_out_f[1][DATA][27] ,
         \latches_out_f[1][DATA][26] , \latches_out_f[1][DATA][25] ,
         \latches_out_f[1][DATA][24] , \latches_out_f[1][DATA][23] ,
         \latches_out_f[1][DATA][22] , \latches_out_f[1][DATA][21] ,
         \latches_out_f[1][DATA][20] , \latches_out_f[1][DATA][19] ,
         \latches_out_f[1][DATA][18] , \latches_out_f[1][DATA][17] ,
         \latches_out_f[1][DATA][16] , \latches_out_f[1][DATA][15] ,
         \latches_out_f[1][DATA][14] , \latches_out_f[1][DATA][13] ,
         \latches_out_f[1][DATA][12] , \latches_out_f[1][DATA][11] ,
         \latches_out_f[1][DATA][10] , \latches_out_f[1][DATA][9] ,
         \latches_out_f[1][DATA][8] , \latches_out_f[1][DATA][7] ,
         \latches_out_f[1][DATA][6] , \latches_out_f[1][DATA][5] ,
         \latches_out_f[1][DATA][4] , \latches_out_f[1][DATA][3] ,
         \latches_out_f[1][DATA][2] , \latches_out_f[1][DATA][1] ,
         \latches_out_f[1][DATA][0] , \latches_out_f[0][REQ] ,
         \latches_out_f[0][DATA][33] , \latches_out_f[0][DATA][32] ,
         \latches_out_f[0][DATA][31] , \latches_out_f[0][DATA][30] ,
         \latches_out_f[0][DATA][29] , \latches_out_f[0][DATA][28] ,
         \latches_out_f[0][DATA][27] , \latches_out_f[0][DATA][26] ,
         \latches_out_f[0][DATA][25] , \latches_out_f[0][DATA][24] ,
         \latches_out_f[0][DATA][23] , \latches_out_f[0][DATA][22] ,
         \latches_out_f[0][DATA][21] , \latches_out_f[0][DATA][20] ,
         \latches_out_f[0][DATA][19] , \latches_out_f[0][DATA][18] ,
         \latches_out_f[0][DATA][17] , \latches_out_f[0][DATA][16] ,
         \latches_out_f[0][DATA][15] , \latches_out_f[0][DATA][14] ,
         \latches_out_f[0][DATA][13] , \latches_out_f[0][DATA][12] ,
         \latches_out_f[0][DATA][11] , \latches_out_f[0][DATA][10] ,
         \latches_out_f[0][DATA][9] , \latches_out_f[0][DATA][8] ,
         \latches_out_f[0][DATA][7] , \latches_out_f[0][DATA][6] ,
         \latches_out_f[0][DATA][5] , \latches_out_f[0][DATA][4] ,
         \latches_out_f[0][DATA][3] , \latches_out_f[0][DATA][2] ,
         \latches_out_f[0][DATA][1] , \latches_out_f[0][DATA][0] ;
  wire   \latches_in_f[4][REQ] , \latches_in_f[4][DATA][33] ,
         \latches_in_f[4][DATA][32] , \latches_in_f[4][DATA][31] ,
         \latches_in_f[4][DATA][30] , \latches_in_f[4][DATA][29] ,
         \latches_in_f[4][DATA][28] , \latches_in_f[4][DATA][27] ,
         \latches_in_f[4][DATA][26] , \latches_in_f[4][DATA][25] ,
         \latches_in_f[4][DATA][24] , \latches_in_f[4][DATA][23] ,
         \latches_in_f[4][DATA][22] , \latches_in_f[4][DATA][21] ,
         \latches_in_f[4][DATA][20] , \latches_in_f[4][DATA][19] ,
         \latches_in_f[4][DATA][18] , \latches_in_f[4][DATA][17] ,
         \latches_in_f[4][DATA][16] , \latches_in_f[4][DATA][15] ,
         \latches_in_f[4][DATA][14] , \latches_in_f[4][DATA][13] ,
         \latches_in_f[4][DATA][12] , \latches_in_f[4][DATA][11] ,
         \latches_in_f[4][DATA][10] , \latches_in_f[4][DATA][9] ,
         \latches_in_f[4][DATA][8] , \latches_in_f[4][DATA][7] ,
         \latches_in_f[4][DATA][6] , \latches_in_f[4][DATA][5] ,
         \latches_in_f[4][DATA][4] , \latches_in_f[4][DATA][3] ,
         \latches_in_f[4][DATA][2] , \latches_in_f[4][DATA][1] ,
         \latches_in_f[4][DATA][0] , \latches_in_f[3][REQ] ,
         \latches_in_f[3][DATA][33] , \latches_in_f[3][DATA][32] ,
         \latches_in_f[3][DATA][31] , \latches_in_f[3][DATA][30] ,
         \latches_in_f[3][DATA][29] , \latches_in_f[3][DATA][28] ,
         \latches_in_f[3][DATA][27] , \latches_in_f[3][DATA][26] ,
         \latches_in_f[3][DATA][25] , \latches_in_f[3][DATA][24] ,
         \latches_in_f[3][DATA][23] , \latches_in_f[3][DATA][22] ,
         \latches_in_f[3][DATA][21] , \latches_in_f[3][DATA][20] ,
         \latches_in_f[3][DATA][19] , \latches_in_f[3][DATA][18] ,
         \latches_in_f[3][DATA][17] , \latches_in_f[3][DATA][16] ,
         \latches_in_f[3][DATA][15] , \latches_in_f[3][DATA][14] ,
         \latches_in_f[3][DATA][13] , \latches_in_f[3][DATA][12] ,
         \latches_in_f[3][DATA][11] , \latches_in_f[3][DATA][10] ,
         \latches_in_f[3][DATA][9] , \latches_in_f[3][DATA][8] ,
         \latches_in_f[3][DATA][7] , \latches_in_f[3][DATA][6] ,
         \latches_in_f[3][DATA][5] , \latches_in_f[3][DATA][4] ,
         \latches_in_f[3][DATA][3] , \latches_in_f[3][DATA][2] ,
         \latches_in_f[3][DATA][1] , \latches_in_f[3][DATA][0] ,
         \latches_in_f[2][REQ] , \latches_in_f[2][DATA][33] ,
         \latches_in_f[2][DATA][32] , \latches_in_f[2][DATA][31] ,
         \latches_in_f[2][DATA][30] , \latches_in_f[2][DATA][29] ,
         \latches_in_f[2][DATA][28] , \latches_in_f[2][DATA][27] ,
         \latches_in_f[2][DATA][26] , \latches_in_f[2][DATA][25] ,
         \latches_in_f[2][DATA][24] , \latches_in_f[2][DATA][23] ,
         \latches_in_f[2][DATA][22] , \latches_in_f[2][DATA][21] ,
         \latches_in_f[2][DATA][20] , \latches_in_f[2][DATA][19] ,
         \latches_in_f[2][DATA][18] , \latches_in_f[2][DATA][17] ,
         \latches_in_f[2][DATA][16] , \latches_in_f[2][DATA][15] ,
         \latches_in_f[2][DATA][14] , \latches_in_f[2][DATA][13] ,
         \latches_in_f[2][DATA][12] , \latches_in_f[2][DATA][11] ,
         \latches_in_f[2][DATA][10] , \latches_in_f[2][DATA][9] ,
         \latches_in_f[2][DATA][8] , \latches_in_f[2][DATA][7] ,
         \latches_in_f[2][DATA][6] , \latches_in_f[2][DATA][5] ,
         \latches_in_f[2][DATA][4] , \latches_in_f[2][DATA][3] ,
         \latches_in_f[2][DATA][2] , \latches_in_f[2][DATA][1] ,
         \latches_in_f[2][DATA][0] , \latches_in_f[1][REQ] ,
         \latches_in_f[1][DATA][33] , \latches_in_f[1][DATA][32] ,
         \latches_in_f[1][DATA][31] , \latches_in_f[1][DATA][30] ,
         \latches_in_f[1][DATA][29] , \latches_in_f[1][DATA][28] ,
         \latches_in_f[1][DATA][27] , \latches_in_f[1][DATA][26] ,
         \latches_in_f[1][DATA][25] , \latches_in_f[1][DATA][24] ,
         \latches_in_f[1][DATA][23] , \latches_in_f[1][DATA][22] ,
         \latches_in_f[1][DATA][21] , \latches_in_f[1][DATA][20] ,
         \latches_in_f[1][DATA][19] , \latches_in_f[1][DATA][18] ,
         \latches_in_f[1][DATA][17] , \latches_in_f[1][DATA][16] ,
         \latches_in_f[1][DATA][15] , \latches_in_f[1][DATA][14] ,
         \latches_in_f[1][DATA][13] , \latches_in_f[1][DATA][12] ,
         \latches_in_f[1][DATA][11] , \latches_in_f[1][DATA][10] ,
         \latches_in_f[1][DATA][9] , \latches_in_f[1][DATA][8] ,
         \latches_in_f[1][DATA][7] , \latches_in_f[1][DATA][6] ,
         \latches_in_f[1][DATA][5] , \latches_in_f[1][DATA][4] ,
         \latches_in_f[1][DATA][3] , \latches_in_f[1][DATA][2] ,
         \latches_in_f[1][DATA][1] , \latches_in_f[1][DATA][0] ,
         \latches_in_f[0][REQ] , \latches_in_f[0][DATA][33] ,
         \latches_in_f[0][DATA][32] , \latches_in_f[0][DATA][31] ,
         \latches_in_f[0][DATA][30] , \latches_in_f[0][DATA][29] ,
         \latches_in_f[0][DATA][28] , \latches_in_f[0][DATA][27] ,
         \latches_in_f[0][DATA][26] , \latches_in_f[0][DATA][25] ,
         \latches_in_f[0][DATA][24] , \latches_in_f[0][DATA][23] ,
         \latches_in_f[0][DATA][22] , \latches_in_f[0][DATA][21] ,
         \latches_in_f[0][DATA][20] , \latches_in_f[0][DATA][19] ,
         \latches_in_f[0][DATA][18] , \latches_in_f[0][DATA][17] ,
         \latches_in_f[0][DATA][16] , \latches_in_f[0][DATA][15] ,
         \latches_in_f[0][DATA][14] , \latches_in_f[0][DATA][13] ,
         \latches_in_f[0][DATA][12] , \latches_in_f[0][DATA][11] ,
         \latches_in_f[0][DATA][10] , \latches_in_f[0][DATA][9] ,
         \latches_in_f[0][DATA][8] , \latches_in_f[0][DATA][7] ,
         \latches_in_f[0][DATA][6] , \latches_in_f[0][DATA][5] ,
         \latches_in_f[0][DATA][4] , \latches_in_f[0][DATA][3] ,
         \latches_in_f[0][DATA][2] , \latches_in_f[0][DATA][1] ,
         \latches_in_f[0][DATA][0] , \latches_in_b[4][ACK] ,
         \latches_in_b[3][ACK] , \latches_in_b[2][ACK] ,
         \latches_in_b[1][ACK] , \latches_in_b[0][ACK] , n1;

  crossbar_1_0_0 crossbar ( .preset(n1), .switch_sel({\switch_sel[4][4] , 
        \switch_sel[4][3] , \switch_sel[4][2] , \switch_sel[4][1] , 
        \switch_sel[4][0] , \switch_sel[3][4] , \switch_sel[3][3] , 
        \switch_sel[3][2] , \switch_sel[3][1] , \switch_sel[3][0] , 
        \switch_sel[2][4] , \switch_sel[2][3] , \switch_sel[2][2] , 
        \switch_sel[2][1] , \switch_sel[2][0] , \switch_sel[1][4] , 
        \switch_sel[1][3] , \switch_sel[1][2] , \switch_sel[1][1] , 
        \switch_sel[1][0] , \switch_sel[0][4] , \switch_sel[0][3] , 
        \switch_sel[0][2] , \switch_sel[0][1] , \switch_sel[0][0] }), 
        .chs_in_f({\chs_in_f[4][REQ] , \chs_in_f[4][DATA][33] , 
        \chs_in_f[4][DATA][32] , \chs_in_f[4][DATA][31] , 
        \chs_in_f[4][DATA][30] , \chs_in_f[4][DATA][29] , 
        \chs_in_f[4][DATA][28] , \chs_in_f[4][DATA][27] , 
        \chs_in_f[4][DATA][26] , \chs_in_f[4][DATA][25] , 
        \chs_in_f[4][DATA][24] , \chs_in_f[4][DATA][23] , 
        \chs_in_f[4][DATA][22] , \chs_in_f[4][DATA][21] , 
        \chs_in_f[4][DATA][20] , \chs_in_f[4][DATA][19] , 
        \chs_in_f[4][DATA][18] , \chs_in_f[4][DATA][17] , 
        \chs_in_f[4][DATA][16] , \chs_in_f[4][DATA][15] , 
        \chs_in_f[4][DATA][14] , \chs_in_f[4][DATA][13] , 
        \chs_in_f[4][DATA][12] , \chs_in_f[4][DATA][11] , 
        \chs_in_f[4][DATA][10] , \chs_in_f[4][DATA][9] , 
        \chs_in_f[4][DATA][8] , \chs_in_f[4][DATA][7] , \chs_in_f[4][DATA][6] , 
        \chs_in_f[4][DATA][5] , \chs_in_f[4][DATA][4] , \chs_in_f[4][DATA][3] , 
        \chs_in_f[4][DATA][2] , \chs_in_f[4][DATA][1] , \chs_in_f[4][DATA][0] , 
        \chs_in_f[3][REQ] , \chs_in_f[3][DATA][33] , \chs_in_f[3][DATA][32] , 
        \chs_in_f[3][DATA][31] , \chs_in_f[3][DATA][30] , 
        \chs_in_f[3][DATA][29] , \chs_in_f[3][DATA][28] , 
        \chs_in_f[3][DATA][27] , \chs_in_f[3][DATA][26] , 
        \chs_in_f[3][DATA][25] , \chs_in_f[3][DATA][24] , 
        \chs_in_f[3][DATA][23] , \chs_in_f[3][DATA][22] , 
        \chs_in_f[3][DATA][21] , \chs_in_f[3][DATA][20] , 
        \chs_in_f[3][DATA][19] , \chs_in_f[3][DATA][18] , 
        \chs_in_f[3][DATA][17] , \chs_in_f[3][DATA][16] , 
        \chs_in_f[3][DATA][15] , \chs_in_f[3][DATA][14] , 
        \chs_in_f[3][DATA][13] , \chs_in_f[3][DATA][12] , 
        \chs_in_f[3][DATA][11] , \chs_in_f[3][DATA][10] , 
        \chs_in_f[3][DATA][9] , \chs_in_f[3][DATA][8] , \chs_in_f[3][DATA][7] , 
        \chs_in_f[3][DATA][6] , \chs_in_f[3][DATA][5] , \chs_in_f[3][DATA][4] , 
        \chs_in_f[3][DATA][3] , \chs_in_f[3][DATA][2] , \chs_in_f[3][DATA][1] , 
        \chs_in_f[3][DATA][0] , \chs_in_f[2][REQ] , \chs_in_f[2][DATA][33] , 
        \chs_in_f[2][DATA][32] , \chs_in_f[2][DATA][31] , 
        \chs_in_f[2][DATA][30] , \chs_in_f[2][DATA][29] , 
        \chs_in_f[2][DATA][28] , \chs_in_f[2][DATA][27] , 
        \chs_in_f[2][DATA][26] , \chs_in_f[2][DATA][25] , 
        \chs_in_f[2][DATA][24] , \chs_in_f[2][DATA][23] , 
        \chs_in_f[2][DATA][22] , \chs_in_f[2][DATA][21] , 
        \chs_in_f[2][DATA][20] , \chs_in_f[2][DATA][19] , 
        \chs_in_f[2][DATA][18] , \chs_in_f[2][DATA][17] , 
        \chs_in_f[2][DATA][16] , \chs_in_f[2][DATA][15] , 
        \chs_in_f[2][DATA][14] , \chs_in_f[2][DATA][13] , 
        \chs_in_f[2][DATA][12] , \chs_in_f[2][DATA][11] , 
        \chs_in_f[2][DATA][10] , \chs_in_f[2][DATA][9] , 
        \chs_in_f[2][DATA][8] , \chs_in_f[2][DATA][7] , \chs_in_f[2][DATA][6] , 
        \chs_in_f[2][DATA][5] , \chs_in_f[2][DATA][4] , \chs_in_f[2][DATA][3] , 
        \chs_in_f[2][DATA][2] , \chs_in_f[2][DATA][1] , \chs_in_f[2][DATA][0] , 
        \chs_in_f[1][REQ] , \chs_in_f[1][DATA][33] , \chs_in_f[1][DATA][32] , 
        \chs_in_f[1][DATA][31] , \chs_in_f[1][DATA][30] , 
        \chs_in_f[1][DATA][29] , \chs_in_f[1][DATA][28] , 
        \chs_in_f[1][DATA][27] , \chs_in_f[1][DATA][26] , 
        \chs_in_f[1][DATA][25] , \chs_in_f[1][DATA][24] , 
        \chs_in_f[1][DATA][23] , \chs_in_f[1][DATA][22] , 
        \chs_in_f[1][DATA][21] , \chs_in_f[1][DATA][20] , 
        \chs_in_f[1][DATA][19] , \chs_in_f[1][DATA][18] , 
        \chs_in_f[1][DATA][17] , \chs_in_f[1][DATA][16] , 
        \chs_in_f[1][DATA][15] , \chs_in_f[1][DATA][14] , 
        \chs_in_f[1][DATA][13] , \chs_in_f[1][DATA][12] , 
        \chs_in_f[1][DATA][11] , \chs_in_f[1][DATA][10] , 
        \chs_in_f[1][DATA][9] , \chs_in_f[1][DATA][8] , \chs_in_f[1][DATA][7] , 
        \chs_in_f[1][DATA][6] , \chs_in_f[1][DATA][5] , \chs_in_f[1][DATA][4] , 
        \chs_in_f[1][DATA][3] , \chs_in_f[1][DATA][2] , \chs_in_f[1][DATA][1] , 
        \chs_in_f[1][DATA][0] , \chs_in_f[0][REQ] , \chs_in_f[0][DATA][33] , 
        \chs_in_f[0][DATA][32] , \chs_in_f[0][DATA][31] , 
        \chs_in_f[0][DATA][30] , \chs_in_f[0][DATA][29] , 
        \chs_in_f[0][DATA][28] , \chs_in_f[0][DATA][27] , 
        \chs_in_f[0][DATA][26] , \chs_in_f[0][DATA][25] , 
        \chs_in_f[0][DATA][24] , \chs_in_f[0][DATA][23] , 
        \chs_in_f[0][DATA][22] , \chs_in_f[0][DATA][21] , 
        \chs_in_f[0][DATA][20] , \chs_in_f[0][DATA][19] , 
        \chs_in_f[0][DATA][18] , \chs_in_f[0][DATA][17] , 
        \chs_in_f[0][DATA][16] , \chs_in_f[0][DATA][15] , 
        \chs_in_f[0][DATA][14] , \chs_in_f[0][DATA][13] , 
        \chs_in_f[0][DATA][12] , \chs_in_f[0][DATA][11] , 
        \chs_in_f[0][DATA][10] , \chs_in_f[0][DATA][9] , 
        \chs_in_f[0][DATA][8] , \chs_in_f[0][DATA][7] , \chs_in_f[0][DATA][6] , 
        \chs_in_f[0][DATA][5] , \chs_in_f[0][DATA][4] , \chs_in_f[0][DATA][3] , 
        \chs_in_f[0][DATA][2] , \chs_in_f[0][DATA][1] , \chs_in_f[0][DATA][0] }), .chs_in_b({\chs_in_b[4][ACK] , \chs_in_b[3][ACK] , \chs_in_b[2][ACK] , 
        \chs_in_b[1][ACK] , \chs_in_b[0][ACK] }), .chs_out_f({
        \latches_in_f[4][REQ] , \latches_in_f[4][DATA][33] , 
        \latches_in_f[4][DATA][32] , \latches_in_f[4][DATA][31] , 
        \latches_in_f[4][DATA][30] , \latches_in_f[4][DATA][29] , 
        \latches_in_f[4][DATA][28] , \latches_in_f[4][DATA][27] , 
        \latches_in_f[4][DATA][26] , \latches_in_f[4][DATA][25] , 
        \latches_in_f[4][DATA][24] , \latches_in_f[4][DATA][23] , 
        \latches_in_f[4][DATA][22] , \latches_in_f[4][DATA][21] , 
        \latches_in_f[4][DATA][20] , \latches_in_f[4][DATA][19] , 
        \latches_in_f[4][DATA][18] , \latches_in_f[4][DATA][17] , 
        \latches_in_f[4][DATA][16] , \latches_in_f[4][DATA][15] , 
        \latches_in_f[4][DATA][14] , \latches_in_f[4][DATA][13] , 
        \latches_in_f[4][DATA][12] , \latches_in_f[4][DATA][11] , 
        \latches_in_f[4][DATA][10] , \latches_in_f[4][DATA][9] , 
        \latches_in_f[4][DATA][8] , \latches_in_f[4][DATA][7] , 
        \latches_in_f[4][DATA][6] , \latches_in_f[4][DATA][5] , 
        \latches_in_f[4][DATA][4] , \latches_in_f[4][DATA][3] , 
        \latches_in_f[4][DATA][2] , \latches_in_f[4][DATA][1] , 
        \latches_in_f[4][DATA][0] , \latches_in_f[3][REQ] , 
        \latches_in_f[3][DATA][33] , \latches_in_f[3][DATA][32] , 
        \latches_in_f[3][DATA][31] , \latches_in_f[3][DATA][30] , 
        \latches_in_f[3][DATA][29] , \latches_in_f[3][DATA][28] , 
        \latches_in_f[3][DATA][27] , \latches_in_f[3][DATA][26] , 
        \latches_in_f[3][DATA][25] , \latches_in_f[3][DATA][24] , 
        \latches_in_f[3][DATA][23] , \latches_in_f[3][DATA][22] , 
        \latches_in_f[3][DATA][21] , \latches_in_f[3][DATA][20] , 
        \latches_in_f[3][DATA][19] , \latches_in_f[3][DATA][18] , 
        \latches_in_f[3][DATA][17] , \latches_in_f[3][DATA][16] , 
        \latches_in_f[3][DATA][15] , \latches_in_f[3][DATA][14] , 
        \latches_in_f[3][DATA][13] , \latches_in_f[3][DATA][12] , 
        \latches_in_f[3][DATA][11] , \latches_in_f[3][DATA][10] , 
        \latches_in_f[3][DATA][9] , \latches_in_f[3][DATA][8] , 
        \latches_in_f[3][DATA][7] , \latches_in_f[3][DATA][6] , 
        \latches_in_f[3][DATA][5] , \latches_in_f[3][DATA][4] , 
        \latches_in_f[3][DATA][3] , \latches_in_f[3][DATA][2] , 
        \latches_in_f[3][DATA][1] , \latches_in_f[3][DATA][0] , 
        \latches_in_f[2][REQ] , \latches_in_f[2][DATA][33] , 
        \latches_in_f[2][DATA][32] , \latches_in_f[2][DATA][31] , 
        \latches_in_f[2][DATA][30] , \latches_in_f[2][DATA][29] , 
        \latches_in_f[2][DATA][28] , \latches_in_f[2][DATA][27] , 
        \latches_in_f[2][DATA][26] , \latches_in_f[2][DATA][25] , 
        \latches_in_f[2][DATA][24] , \latches_in_f[2][DATA][23] , 
        \latches_in_f[2][DATA][22] , \latches_in_f[2][DATA][21] , 
        \latches_in_f[2][DATA][20] , \latches_in_f[2][DATA][19] , 
        \latches_in_f[2][DATA][18] , \latches_in_f[2][DATA][17] , 
        \latches_in_f[2][DATA][16] , \latches_in_f[2][DATA][15] , 
        \latches_in_f[2][DATA][14] , \latches_in_f[2][DATA][13] , 
        \latches_in_f[2][DATA][12] , \latches_in_f[2][DATA][11] , 
        \latches_in_f[2][DATA][10] , \latches_in_f[2][DATA][9] , 
        \latches_in_f[2][DATA][8] , \latches_in_f[2][DATA][7] , 
        \latches_in_f[2][DATA][6] , \latches_in_f[2][DATA][5] , 
        \latches_in_f[2][DATA][4] , \latches_in_f[2][DATA][3] , 
        \latches_in_f[2][DATA][2] , \latches_in_f[2][DATA][1] , 
        \latches_in_f[2][DATA][0] , \latches_in_f[1][REQ] , 
        \latches_in_f[1][DATA][33] , \latches_in_f[1][DATA][32] , 
        \latches_in_f[1][DATA][31] , \latches_in_f[1][DATA][30] , 
        \latches_in_f[1][DATA][29] , \latches_in_f[1][DATA][28] , 
        \latches_in_f[1][DATA][27] , \latches_in_f[1][DATA][26] , 
        \latches_in_f[1][DATA][25] , \latches_in_f[1][DATA][24] , 
        \latches_in_f[1][DATA][23] , \latches_in_f[1][DATA][22] , 
        \latches_in_f[1][DATA][21] , \latches_in_f[1][DATA][20] , 
        \latches_in_f[1][DATA][19] , \latches_in_f[1][DATA][18] , 
        \latches_in_f[1][DATA][17] , \latches_in_f[1][DATA][16] , 
        \latches_in_f[1][DATA][15] , \latches_in_f[1][DATA][14] , 
        \latches_in_f[1][DATA][13] , \latches_in_f[1][DATA][12] , 
        \latches_in_f[1][DATA][11] , \latches_in_f[1][DATA][10] , 
        \latches_in_f[1][DATA][9] , \latches_in_f[1][DATA][8] , 
        \latches_in_f[1][DATA][7] , \latches_in_f[1][DATA][6] , 
        \latches_in_f[1][DATA][5] , \latches_in_f[1][DATA][4] , 
        \latches_in_f[1][DATA][3] , \latches_in_f[1][DATA][2] , 
        \latches_in_f[1][DATA][1] , \latches_in_f[1][DATA][0] , 
        \latches_in_f[0][REQ] , \latches_in_f[0][DATA][33] , 
        \latches_in_f[0][DATA][32] , \latches_in_f[0][DATA][31] , 
        \latches_in_f[0][DATA][30] , \latches_in_f[0][DATA][29] , 
        \latches_in_f[0][DATA][28] , \latches_in_f[0][DATA][27] , 
        \latches_in_f[0][DATA][26] , \latches_in_f[0][DATA][25] , 
        \latches_in_f[0][DATA][24] , \latches_in_f[0][DATA][23] , 
        \latches_in_f[0][DATA][22] , \latches_in_f[0][DATA][21] , 
        \latches_in_f[0][DATA][20] , \latches_in_f[0][DATA][19] , 
        \latches_in_f[0][DATA][18] , \latches_in_f[0][DATA][17] , 
        \latches_in_f[0][DATA][16] , \latches_in_f[0][DATA][15] , 
        \latches_in_f[0][DATA][14] , \latches_in_f[0][DATA][13] , 
        \latches_in_f[0][DATA][12] , \latches_in_f[0][DATA][11] , 
        \latches_in_f[0][DATA][10] , \latches_in_f[0][DATA][9] , 
        \latches_in_f[0][DATA][8] , \latches_in_f[0][DATA][7] , 
        \latches_in_f[0][DATA][6] , \latches_in_f[0][DATA][5] , 
        \latches_in_f[0][DATA][4] , \latches_in_f[0][DATA][3] , 
        \latches_in_f[0][DATA][2] , \latches_in_f[0][DATA][1] , 
        \latches_in_f[0][DATA][0] }), .chs_out_b({\latches_in_b[4][ACK] , 
        \latches_in_b[3][ACK] , \latches_in_b[2][ACK] , \latches_in_b[1][ACK] , 
        \latches_in_b[0][ACK] }) );
  channel_latch_0_000000000_0 ch_latch_4 ( .preset(n1), .left_in({
        \latches_in_f[4][REQ] , \latches_in_f[4][DATA][33] , 
        \latches_in_f[4][DATA][32] , \latches_in_f[4][DATA][31] , 
        \latches_in_f[4][DATA][30] , \latches_in_f[4][DATA][29] , 
        \latches_in_f[4][DATA][28] , \latches_in_f[4][DATA][27] , 
        \latches_in_f[4][DATA][26] , \latches_in_f[4][DATA][25] , 
        \latches_in_f[4][DATA][24] , \latches_in_f[4][DATA][23] , 
        \latches_in_f[4][DATA][22] , \latches_in_f[4][DATA][21] , 
        \latches_in_f[4][DATA][20] , \latches_in_f[4][DATA][19] , 
        \latches_in_f[4][DATA][18] , \latches_in_f[4][DATA][17] , 
        \latches_in_f[4][DATA][16] , \latches_in_f[4][DATA][15] , 
        \latches_in_f[4][DATA][14] , \latches_in_f[4][DATA][13] , 
        \latches_in_f[4][DATA][12] , \latches_in_f[4][DATA][11] , 
        \latches_in_f[4][DATA][10] , \latches_in_f[4][DATA][9] , 
        \latches_in_f[4][DATA][8] , \latches_in_f[4][DATA][7] , 
        \latches_in_f[4][DATA][6] , \latches_in_f[4][DATA][5] , 
        \latches_in_f[4][DATA][4] , \latches_in_f[4][DATA][3] , 
        \latches_in_f[4][DATA][2] , \latches_in_f[4][DATA][1] , 
        \latches_in_f[4][DATA][0] }), .left_out(\latches_in_b[4][ACK] ), 
        .right_out({\latches_out_f[4][REQ] , \latches_out_f[4][DATA][33] , 
        \latches_out_f[4][DATA][32] , \latches_out_f[4][DATA][31] , 
        \latches_out_f[4][DATA][30] , \latches_out_f[4][DATA][29] , 
        \latches_out_f[4][DATA][28] , \latches_out_f[4][DATA][27] , 
        \latches_out_f[4][DATA][26] , \latches_out_f[4][DATA][25] , 
        \latches_out_f[4][DATA][24] , \latches_out_f[4][DATA][23] , 
        \latches_out_f[4][DATA][22] , \latches_out_f[4][DATA][21] , 
        \latches_out_f[4][DATA][20] , \latches_out_f[4][DATA][19] , 
        \latches_out_f[4][DATA][18] , \latches_out_f[4][DATA][17] , 
        \latches_out_f[4][DATA][16] , \latches_out_f[4][DATA][15] , 
        \latches_out_f[4][DATA][14] , \latches_out_f[4][DATA][13] , 
        \latches_out_f[4][DATA][12] , \latches_out_f[4][DATA][11] , 
        \latches_out_f[4][DATA][10] , \latches_out_f[4][DATA][9] , 
        \latches_out_f[4][DATA][8] , \latches_out_f[4][DATA][7] , 
        \latches_out_f[4][DATA][6] , \latches_out_f[4][DATA][5] , 
        \latches_out_f[4][DATA][4] , \latches_out_f[4][DATA][3] , 
        \latches_out_f[4][DATA][2] , \latches_out_f[4][DATA][1] , 
        \latches_out_f[4][DATA][0] }), .right_in(\latches_out_b[4][ACK] ) );
  channel_latch_0_000000000_4 ch_latch_3 ( .preset(n1), .left_in({
        \latches_in_f[3][REQ] , \latches_in_f[3][DATA][33] , 
        \latches_in_f[3][DATA][32] , \latches_in_f[3][DATA][31] , 
        \latches_in_f[3][DATA][30] , \latches_in_f[3][DATA][29] , 
        \latches_in_f[3][DATA][28] , \latches_in_f[3][DATA][27] , 
        \latches_in_f[3][DATA][26] , \latches_in_f[3][DATA][25] , 
        \latches_in_f[3][DATA][24] , \latches_in_f[3][DATA][23] , 
        \latches_in_f[3][DATA][22] , \latches_in_f[3][DATA][21] , 
        \latches_in_f[3][DATA][20] , \latches_in_f[3][DATA][19] , 
        \latches_in_f[3][DATA][18] , \latches_in_f[3][DATA][17] , 
        \latches_in_f[3][DATA][16] , \latches_in_f[3][DATA][15] , 
        \latches_in_f[3][DATA][14] , \latches_in_f[3][DATA][13] , 
        \latches_in_f[3][DATA][12] , \latches_in_f[3][DATA][11] , 
        \latches_in_f[3][DATA][10] , \latches_in_f[3][DATA][9] , 
        \latches_in_f[3][DATA][8] , \latches_in_f[3][DATA][7] , 
        \latches_in_f[3][DATA][6] , \latches_in_f[3][DATA][5] , 
        \latches_in_f[3][DATA][4] , \latches_in_f[3][DATA][3] , 
        \latches_in_f[3][DATA][2] , \latches_in_f[3][DATA][1] , 
        \latches_in_f[3][DATA][0] }), .left_out(\latches_in_b[3][ACK] ), 
        .right_out({\latches_out_f[3][REQ] , \latches_out_f[3][DATA][33] , 
        \latches_out_f[3][DATA][32] , \latches_out_f[3][DATA][31] , 
        \latches_out_f[3][DATA][30] , \latches_out_f[3][DATA][29] , 
        \latches_out_f[3][DATA][28] , \latches_out_f[3][DATA][27] , 
        \latches_out_f[3][DATA][26] , \latches_out_f[3][DATA][25] , 
        \latches_out_f[3][DATA][24] , \latches_out_f[3][DATA][23] , 
        \latches_out_f[3][DATA][22] , \latches_out_f[3][DATA][21] , 
        \latches_out_f[3][DATA][20] , \latches_out_f[3][DATA][19] , 
        \latches_out_f[3][DATA][18] , \latches_out_f[3][DATA][17] , 
        \latches_out_f[3][DATA][16] , \latches_out_f[3][DATA][15] , 
        \latches_out_f[3][DATA][14] , \latches_out_f[3][DATA][13] , 
        \latches_out_f[3][DATA][12] , \latches_out_f[3][DATA][11] , 
        \latches_out_f[3][DATA][10] , \latches_out_f[3][DATA][9] , 
        \latches_out_f[3][DATA][8] , \latches_out_f[3][DATA][7] , 
        \latches_out_f[3][DATA][6] , \latches_out_f[3][DATA][5] , 
        \latches_out_f[3][DATA][4] , \latches_out_f[3][DATA][3] , 
        \latches_out_f[3][DATA][2] , \latches_out_f[3][DATA][1] , 
        \latches_out_f[3][DATA][0] }), .right_in(\latches_out_b[3][ACK] ) );
  channel_latch_0_000000000_3 ch_latch_2 ( .preset(n1), .left_in({
        \latches_in_f[2][REQ] , \latches_in_f[2][DATA][33] , 
        \latches_in_f[2][DATA][32] , \latches_in_f[2][DATA][31] , 
        \latches_in_f[2][DATA][30] , \latches_in_f[2][DATA][29] , 
        \latches_in_f[2][DATA][28] , \latches_in_f[2][DATA][27] , 
        \latches_in_f[2][DATA][26] , \latches_in_f[2][DATA][25] , 
        \latches_in_f[2][DATA][24] , \latches_in_f[2][DATA][23] , 
        \latches_in_f[2][DATA][22] , \latches_in_f[2][DATA][21] , 
        \latches_in_f[2][DATA][20] , \latches_in_f[2][DATA][19] , 
        \latches_in_f[2][DATA][18] , \latches_in_f[2][DATA][17] , 
        \latches_in_f[2][DATA][16] , \latches_in_f[2][DATA][15] , 
        \latches_in_f[2][DATA][14] , \latches_in_f[2][DATA][13] , 
        \latches_in_f[2][DATA][12] , \latches_in_f[2][DATA][11] , 
        \latches_in_f[2][DATA][10] , \latches_in_f[2][DATA][9] , 
        \latches_in_f[2][DATA][8] , \latches_in_f[2][DATA][7] , 
        \latches_in_f[2][DATA][6] , \latches_in_f[2][DATA][5] , 
        \latches_in_f[2][DATA][4] , \latches_in_f[2][DATA][3] , 
        \latches_in_f[2][DATA][2] , \latches_in_f[2][DATA][1] , 
        \latches_in_f[2][DATA][0] }), .left_out(\latches_in_b[2][ACK] ), 
        .right_out({\latches_out_f[2][REQ] , \latches_out_f[2][DATA][33] , 
        \latches_out_f[2][DATA][32] , \latches_out_f[2][DATA][31] , 
        \latches_out_f[2][DATA][30] , \latches_out_f[2][DATA][29] , 
        \latches_out_f[2][DATA][28] , \latches_out_f[2][DATA][27] , 
        \latches_out_f[2][DATA][26] , \latches_out_f[2][DATA][25] , 
        \latches_out_f[2][DATA][24] , \latches_out_f[2][DATA][23] , 
        \latches_out_f[2][DATA][22] , \latches_out_f[2][DATA][21] , 
        \latches_out_f[2][DATA][20] , \latches_out_f[2][DATA][19] , 
        \latches_out_f[2][DATA][18] , \latches_out_f[2][DATA][17] , 
        \latches_out_f[2][DATA][16] , \latches_out_f[2][DATA][15] , 
        \latches_out_f[2][DATA][14] , \latches_out_f[2][DATA][13] , 
        \latches_out_f[2][DATA][12] , \latches_out_f[2][DATA][11] , 
        \latches_out_f[2][DATA][10] , \latches_out_f[2][DATA][9] , 
        \latches_out_f[2][DATA][8] , \latches_out_f[2][DATA][7] , 
        \latches_out_f[2][DATA][6] , \latches_out_f[2][DATA][5] , 
        \latches_out_f[2][DATA][4] , \latches_out_f[2][DATA][3] , 
        \latches_out_f[2][DATA][2] , \latches_out_f[2][DATA][1] , 
        \latches_out_f[2][DATA][0] }), .right_in(\latches_out_b[2][ACK] ) );
  channel_latch_0_000000000_2 ch_latch_1 ( .preset(n1), .left_in({
        \latches_in_f[1][REQ] , \latches_in_f[1][DATA][33] , 
        \latches_in_f[1][DATA][32] , \latches_in_f[1][DATA][31] , 
        \latches_in_f[1][DATA][30] , \latches_in_f[1][DATA][29] , 
        \latches_in_f[1][DATA][28] , \latches_in_f[1][DATA][27] , 
        \latches_in_f[1][DATA][26] , \latches_in_f[1][DATA][25] , 
        \latches_in_f[1][DATA][24] , \latches_in_f[1][DATA][23] , 
        \latches_in_f[1][DATA][22] , \latches_in_f[1][DATA][21] , 
        \latches_in_f[1][DATA][20] , \latches_in_f[1][DATA][19] , 
        \latches_in_f[1][DATA][18] , \latches_in_f[1][DATA][17] , 
        \latches_in_f[1][DATA][16] , \latches_in_f[1][DATA][15] , 
        \latches_in_f[1][DATA][14] , \latches_in_f[1][DATA][13] , 
        \latches_in_f[1][DATA][12] , \latches_in_f[1][DATA][11] , 
        \latches_in_f[1][DATA][10] , \latches_in_f[1][DATA][9] , 
        \latches_in_f[1][DATA][8] , \latches_in_f[1][DATA][7] , 
        \latches_in_f[1][DATA][6] , \latches_in_f[1][DATA][5] , 
        \latches_in_f[1][DATA][4] , \latches_in_f[1][DATA][3] , 
        \latches_in_f[1][DATA][2] , \latches_in_f[1][DATA][1] , 
        \latches_in_f[1][DATA][0] }), .left_out(\latches_in_b[1][ACK] ), 
        .right_out({\latches_out_f[1][REQ] , \latches_out_f[1][DATA][33] , 
        \latches_out_f[1][DATA][32] , \latches_out_f[1][DATA][31] , 
        \latches_out_f[1][DATA][30] , \latches_out_f[1][DATA][29] , 
        \latches_out_f[1][DATA][28] , \latches_out_f[1][DATA][27] , 
        \latches_out_f[1][DATA][26] , \latches_out_f[1][DATA][25] , 
        \latches_out_f[1][DATA][24] , \latches_out_f[1][DATA][23] , 
        \latches_out_f[1][DATA][22] , \latches_out_f[1][DATA][21] , 
        \latches_out_f[1][DATA][20] , \latches_out_f[1][DATA][19] , 
        \latches_out_f[1][DATA][18] , \latches_out_f[1][DATA][17] , 
        \latches_out_f[1][DATA][16] , \latches_out_f[1][DATA][15] , 
        \latches_out_f[1][DATA][14] , \latches_out_f[1][DATA][13] , 
        \latches_out_f[1][DATA][12] , \latches_out_f[1][DATA][11] , 
        \latches_out_f[1][DATA][10] , \latches_out_f[1][DATA][9] , 
        \latches_out_f[1][DATA][8] , \latches_out_f[1][DATA][7] , 
        \latches_out_f[1][DATA][6] , \latches_out_f[1][DATA][5] , 
        \latches_out_f[1][DATA][4] , \latches_out_f[1][DATA][3] , 
        \latches_out_f[1][DATA][2] , \latches_out_f[1][DATA][1] , 
        \latches_out_f[1][DATA][0] }), .right_in(\latches_out_b[1][ACK] ) );
  channel_latch_0_000000000_1 ch_latch_0 ( .preset(n1), .left_in({
        \latches_in_f[0][REQ] , \latches_in_f[0][DATA][33] , 
        \latches_in_f[0][DATA][32] , \latches_in_f[0][DATA][31] , 
        \latches_in_f[0][DATA][30] , \latches_in_f[0][DATA][29] , 
        \latches_in_f[0][DATA][28] , \latches_in_f[0][DATA][27] , 
        \latches_in_f[0][DATA][26] , \latches_in_f[0][DATA][25] , 
        \latches_in_f[0][DATA][24] , \latches_in_f[0][DATA][23] , 
        \latches_in_f[0][DATA][22] , \latches_in_f[0][DATA][21] , 
        \latches_in_f[0][DATA][20] , \latches_in_f[0][DATA][19] , 
        \latches_in_f[0][DATA][18] , \latches_in_f[0][DATA][17] , 
        \latches_in_f[0][DATA][16] , \latches_in_f[0][DATA][15] , 
        \latches_in_f[0][DATA][14] , \latches_in_f[0][DATA][13] , 
        \latches_in_f[0][DATA][12] , \latches_in_f[0][DATA][11] , 
        \latches_in_f[0][DATA][10] , \latches_in_f[0][DATA][9] , 
        \latches_in_f[0][DATA][8] , \latches_in_f[0][DATA][7] , 
        \latches_in_f[0][DATA][6] , \latches_in_f[0][DATA][5] , 
        \latches_in_f[0][DATA][4] , \latches_in_f[0][DATA][3] , 
        \latches_in_f[0][DATA][2] , \latches_in_f[0][DATA][1] , 
        \latches_in_f[0][DATA][0] }), .left_out(\latches_in_b[0][ACK] ), 
        .right_out({\latches_out_f[0][REQ] , \latches_out_f[0][DATA][33] , 
        \latches_out_f[0][DATA][32] , \latches_out_f[0][DATA][31] , 
        \latches_out_f[0][DATA][30] , \latches_out_f[0][DATA][29] , 
        \latches_out_f[0][DATA][28] , \latches_out_f[0][DATA][27] , 
        \latches_out_f[0][DATA][26] , \latches_out_f[0][DATA][25] , 
        \latches_out_f[0][DATA][24] , \latches_out_f[0][DATA][23] , 
        \latches_out_f[0][DATA][22] , \latches_out_f[0][DATA][21] , 
        \latches_out_f[0][DATA][20] , \latches_out_f[0][DATA][19] , 
        \latches_out_f[0][DATA][18] , \latches_out_f[0][DATA][17] , 
        \latches_out_f[0][DATA][16] , \latches_out_f[0][DATA][15] , 
        \latches_out_f[0][DATA][14] , \latches_out_f[0][DATA][13] , 
        \latches_out_f[0][DATA][12] , \latches_out_f[0][DATA][11] , 
        \latches_out_f[0][DATA][10] , \latches_out_f[0][DATA][9] , 
        \latches_out_f[0][DATA][8] , \latches_out_f[0][DATA][7] , 
        \latches_out_f[0][DATA][6] , \latches_out_f[0][DATA][5] , 
        \latches_out_f[0][DATA][4] , \latches_out_f[0][DATA][3] , 
        \latches_out_f[0][DATA][2] , \latches_out_f[0][DATA][1] , 
        \latches_out_f[0][DATA][0] }), .right_in(\latches_out_b[0][ACK] ) );
  HS65_LS_BFX9 U1 ( .A(preset), .Z(n1) );
endmodule


module sr_latch_0_8 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X27 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_6 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_8 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_6 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, N0, n2;
  assign Rout = Aout;
  assign lt_en = N0;

  c_gate_0_6 gate ( .preset(preset), .a(n2), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 U1 ( .A(Ain), .Z(n2) );
  HS65_LS_IVX9 U2 ( .A(Aout), .Z(N0) );
endmodule


module channel_latch_1_xxxxxxxxx_6 ( preset, .left_in({\left_in[REQ] , 
        \left_in[DATA][33] , \left_in[DATA][32] , \left_in[DATA][31] , 
        \left_in[DATA][30] , \left_in[DATA][29] , \left_in[DATA][28] , 
        \left_in[DATA][27] , \left_in[DATA][26] , \left_in[DATA][25] , 
        \left_in[DATA][24] , \left_in[DATA][23] , \left_in[DATA][22] , 
        \left_in[DATA][21] , \left_in[DATA][20] , \left_in[DATA][19] , 
        \left_in[DATA][18] , \left_in[DATA][17] , \left_in[DATA][16] , 
        \left_in[DATA][15] , \left_in[DATA][14] , \left_in[DATA][13] , 
        \left_in[DATA][12] , \left_in[DATA][11] , \left_in[DATA][10] , 
        \left_in[DATA][9] , \left_in[DATA][8] , \left_in[DATA][7] , 
        \left_in[DATA][6] , \left_in[DATA][5] , \left_in[DATA][4] , 
        \left_in[DATA][3] , \left_in[DATA][2] , \left_in[DATA][1] , 
        \left_in[DATA][0] }), .left_out(\left_out[ACK] ), .right_out({
        \right_out[REQ] , \right_out[DATA][33] , \right_out[DATA][32] , 
        \right_out[DATA][31] , \right_out[DATA][30] , \right_out[DATA][29] , 
        \right_out[DATA][28] , \right_out[DATA][27] , \right_out[DATA][26] , 
        \right_out[DATA][25] , \right_out[DATA][24] , \right_out[DATA][23] , 
        \right_out[DATA][22] , \right_out[DATA][21] , \right_out[DATA][20] , 
        \right_out[DATA][19] , \right_out[DATA][18] , \right_out[DATA][17] , 
        \right_out[DATA][16] , \right_out[DATA][15] , \right_out[DATA][14] , 
        \right_out[DATA][13] , \right_out[DATA][12] , \right_out[DATA][11] , 
        \right_out[DATA][10] , \right_out[DATA][9] , \right_out[DATA][8] , 
        \right_out[DATA][7] , \right_out[DATA][6] , \right_out[DATA][5] , 
        \right_out[DATA][4] , \right_out[DATA][3] , \right_out[DATA][2] , 
        \right_out[DATA][1] , \right_out[DATA][0] }), .right_in(
        \right_in[ACK] ) );
  input preset, \left_in[REQ] , \left_in[DATA][33] , \left_in[DATA][32] ,
         \left_in[DATA][31] , \left_in[DATA][30] , \left_in[DATA][29] ,
         \left_in[DATA][28] , \left_in[DATA][27] , \left_in[DATA][26] ,
         \left_in[DATA][25] , \left_in[DATA][24] , \left_in[DATA][23] ,
         \left_in[DATA][22] , \left_in[DATA][21] , \left_in[DATA][20] ,
         \left_in[DATA][19] , \left_in[DATA][18] , \left_in[DATA][17] ,
         \left_in[DATA][16] , \left_in[DATA][15] , \left_in[DATA][14] ,
         \left_in[DATA][13] , \left_in[DATA][12] , \left_in[DATA][11] ,
         \left_in[DATA][10] , \left_in[DATA][9] , \left_in[DATA][8] ,
         \left_in[DATA][7] , \left_in[DATA][6] , \left_in[DATA][5] ,
         \left_in[DATA][4] , \left_in[DATA][3] , \left_in[DATA][2] ,
         \left_in[DATA][1] , \left_in[DATA][0] , \right_in[ACK] ;
  output \left_out[ACK] , \right_out[REQ] , \right_out[DATA][33] ,
         \right_out[DATA][32] , \right_out[DATA][31] , \right_out[DATA][30] ,
         \right_out[DATA][29] , \right_out[DATA][28] , \right_out[DATA][27] ,
         \right_out[DATA][26] , \right_out[DATA][25] , \right_out[DATA][24] ,
         \right_out[DATA][23] , \right_out[DATA][22] , \right_out[DATA][21] ,
         \right_out[DATA][20] , \right_out[DATA][19] , \right_out[DATA][18] ,
         \right_out[DATA][17] , \right_out[DATA][16] , \right_out[DATA][15] ,
         \right_out[DATA][14] , \right_out[DATA][13] , \right_out[DATA][12] ,
         \right_out[DATA][11] , \right_out[DATA][10] , \right_out[DATA][9] ,
         \right_out[DATA][8] , \right_out[DATA][7] , \right_out[DATA][6] ,
         \right_out[DATA][5] , \right_out[DATA][4] , \right_out[DATA][3] ,
         \right_out[DATA][2] , \right_out[DATA][1] , \right_out[DATA][0] ;
  wire   lt_en, N3;

  latch_controller_1_6 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX9 \data_reg[33]  ( .G(N3), .D(\left_in[DATA][33] ), .Q(
        \right_out[DATA][33] ) );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N3), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N3), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N3), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N3), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N3), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N3), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N3), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N3), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N3), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N3), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N3), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N3), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N3), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N3), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N3), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N3), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N3), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N3), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N3), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX9 \data_reg[12]  ( .G(N3), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N3), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N3), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N3), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N3), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N3), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N3), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N3), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N3), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N3), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N3), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N3), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N3), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LS_LDHQX9 \data_reg[32]  ( .G(N3), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LS_OR2X9 U3 ( .A(lt_en), .B(preset), .Z(N3) );
endmodule


module sr_latch_0_9 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X27 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_7 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_9 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_7 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, N0, n2;
  assign Rout = Aout;
  assign lt_en = N0;

  c_gate_0_7 gate ( .preset(preset), .a(n2), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 U1 ( .A(Ain), .Z(n2) );
  HS65_LS_IVX9 U2 ( .A(Aout), .Z(N0) );
endmodule


module channel_latch_1_xxxxxxxxx_7 ( preset, .left_in({\left_in[REQ] , 
        \left_in[DATA][33] , \left_in[DATA][32] , \left_in[DATA][31] , 
        \left_in[DATA][30] , \left_in[DATA][29] , \left_in[DATA][28] , 
        \left_in[DATA][27] , \left_in[DATA][26] , \left_in[DATA][25] , 
        \left_in[DATA][24] , \left_in[DATA][23] , \left_in[DATA][22] , 
        \left_in[DATA][21] , \left_in[DATA][20] , \left_in[DATA][19] , 
        \left_in[DATA][18] , \left_in[DATA][17] , \left_in[DATA][16] , 
        \left_in[DATA][15] , \left_in[DATA][14] , \left_in[DATA][13] , 
        \left_in[DATA][12] , \left_in[DATA][11] , \left_in[DATA][10] , 
        \left_in[DATA][9] , \left_in[DATA][8] , \left_in[DATA][7] , 
        \left_in[DATA][6] , \left_in[DATA][5] , \left_in[DATA][4] , 
        \left_in[DATA][3] , \left_in[DATA][2] , \left_in[DATA][1] , 
        \left_in[DATA][0] }), .left_out(\left_out[ACK] ), .right_out({
        \right_out[REQ] , \right_out[DATA][33] , \right_out[DATA][32] , 
        \right_out[DATA][31] , \right_out[DATA][30] , \right_out[DATA][29] , 
        \right_out[DATA][28] , \right_out[DATA][27] , \right_out[DATA][26] , 
        \right_out[DATA][25] , \right_out[DATA][24] , \right_out[DATA][23] , 
        \right_out[DATA][22] , \right_out[DATA][21] , \right_out[DATA][20] , 
        \right_out[DATA][19] , \right_out[DATA][18] , \right_out[DATA][17] , 
        \right_out[DATA][16] , \right_out[DATA][15] , \right_out[DATA][14] , 
        \right_out[DATA][13] , \right_out[DATA][12] , \right_out[DATA][11] , 
        \right_out[DATA][10] , \right_out[DATA][9] , \right_out[DATA][8] , 
        \right_out[DATA][7] , \right_out[DATA][6] , \right_out[DATA][5] , 
        \right_out[DATA][4] , \right_out[DATA][3] , \right_out[DATA][2] , 
        \right_out[DATA][1] , \right_out[DATA][0] }), .right_in(
        \right_in[ACK] ) );
  input preset, \left_in[REQ] , \left_in[DATA][33] , \left_in[DATA][32] ,
         \left_in[DATA][31] , \left_in[DATA][30] , \left_in[DATA][29] ,
         \left_in[DATA][28] , \left_in[DATA][27] , \left_in[DATA][26] ,
         \left_in[DATA][25] , \left_in[DATA][24] , \left_in[DATA][23] ,
         \left_in[DATA][22] , \left_in[DATA][21] , \left_in[DATA][20] ,
         \left_in[DATA][19] , \left_in[DATA][18] , \left_in[DATA][17] ,
         \left_in[DATA][16] , \left_in[DATA][15] , \left_in[DATA][14] ,
         \left_in[DATA][13] , \left_in[DATA][12] , \left_in[DATA][11] ,
         \left_in[DATA][10] , \left_in[DATA][9] , \left_in[DATA][8] ,
         \left_in[DATA][7] , \left_in[DATA][6] , \left_in[DATA][5] ,
         \left_in[DATA][4] , \left_in[DATA][3] , \left_in[DATA][2] ,
         \left_in[DATA][1] , \left_in[DATA][0] , \right_in[ACK] ;
  output \left_out[ACK] , \right_out[REQ] , \right_out[DATA][33] ,
         \right_out[DATA][32] , \right_out[DATA][31] , \right_out[DATA][30] ,
         \right_out[DATA][29] , \right_out[DATA][28] , \right_out[DATA][27] ,
         \right_out[DATA][26] , \right_out[DATA][25] , \right_out[DATA][24] ,
         \right_out[DATA][23] , \right_out[DATA][22] , \right_out[DATA][21] ,
         \right_out[DATA][20] , \right_out[DATA][19] , \right_out[DATA][18] ,
         \right_out[DATA][17] , \right_out[DATA][16] , \right_out[DATA][15] ,
         \right_out[DATA][14] , \right_out[DATA][13] , \right_out[DATA][12] ,
         \right_out[DATA][11] , \right_out[DATA][10] , \right_out[DATA][9] ,
         \right_out[DATA][8] , \right_out[DATA][7] , \right_out[DATA][6] ,
         \right_out[DATA][5] , \right_out[DATA][4] , \right_out[DATA][3] ,
         \right_out[DATA][2] , \right_out[DATA][1] , \right_out[DATA][0] ;
  wire   lt_en, N3;

  latch_controller_1_7 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX9 \data_reg[33]  ( .G(N3), .D(\left_in[DATA][33] ), .Q(
        \right_out[DATA][33] ) );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N3), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N3), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N3), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N3), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N3), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N3), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N3), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N3), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N3), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N3), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N3), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N3), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N3), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N3), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N3), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N3), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N3), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N3), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N3), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX9 \data_reg[12]  ( .G(N3), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N3), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N3), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N3), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N3), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N3), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N3), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N3), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N3), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N3), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N3), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N3), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N3), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LS_LDHQX9 \data_reg[32]  ( .G(N3), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LS_OR2X9 U3 ( .A(lt_en), .B(preset), .Z(N3) );
endmodule


module sr_latch_0_10 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X27 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_8 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_10 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_8 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, N0, n2;
  assign Rout = Aout;
  assign lt_en = N0;

  c_gate_0_8 gate ( .preset(preset), .a(n2), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 U1 ( .A(Ain), .Z(n2) );
  HS65_LS_IVX9 U2 ( .A(Aout), .Z(N0) );
endmodule


module channel_latch_1_xxxxxxxxx_8 ( preset, .left_in({\left_in[REQ] , 
        \left_in[DATA][33] , \left_in[DATA][32] , \left_in[DATA][31] , 
        \left_in[DATA][30] , \left_in[DATA][29] , \left_in[DATA][28] , 
        \left_in[DATA][27] , \left_in[DATA][26] , \left_in[DATA][25] , 
        \left_in[DATA][24] , \left_in[DATA][23] , \left_in[DATA][22] , 
        \left_in[DATA][21] , \left_in[DATA][20] , \left_in[DATA][19] , 
        \left_in[DATA][18] , \left_in[DATA][17] , \left_in[DATA][16] , 
        \left_in[DATA][15] , \left_in[DATA][14] , \left_in[DATA][13] , 
        \left_in[DATA][12] , \left_in[DATA][11] , \left_in[DATA][10] , 
        \left_in[DATA][9] , \left_in[DATA][8] , \left_in[DATA][7] , 
        \left_in[DATA][6] , \left_in[DATA][5] , \left_in[DATA][4] , 
        \left_in[DATA][3] , \left_in[DATA][2] , \left_in[DATA][1] , 
        \left_in[DATA][0] }), .left_out(\left_out[ACK] ), .right_out({
        \right_out[REQ] , \right_out[DATA][33] , \right_out[DATA][32] , 
        \right_out[DATA][31] , \right_out[DATA][30] , \right_out[DATA][29] , 
        \right_out[DATA][28] , \right_out[DATA][27] , \right_out[DATA][26] , 
        \right_out[DATA][25] , \right_out[DATA][24] , \right_out[DATA][23] , 
        \right_out[DATA][22] , \right_out[DATA][21] , \right_out[DATA][20] , 
        \right_out[DATA][19] , \right_out[DATA][18] , \right_out[DATA][17] , 
        \right_out[DATA][16] , \right_out[DATA][15] , \right_out[DATA][14] , 
        \right_out[DATA][13] , \right_out[DATA][12] , \right_out[DATA][11] , 
        \right_out[DATA][10] , \right_out[DATA][9] , \right_out[DATA][8] , 
        \right_out[DATA][7] , \right_out[DATA][6] , \right_out[DATA][5] , 
        \right_out[DATA][4] , \right_out[DATA][3] , \right_out[DATA][2] , 
        \right_out[DATA][1] , \right_out[DATA][0] }), .right_in(
        \right_in[ACK] ) );
  input preset, \left_in[REQ] , \left_in[DATA][33] , \left_in[DATA][32] ,
         \left_in[DATA][31] , \left_in[DATA][30] , \left_in[DATA][29] ,
         \left_in[DATA][28] , \left_in[DATA][27] , \left_in[DATA][26] ,
         \left_in[DATA][25] , \left_in[DATA][24] , \left_in[DATA][23] ,
         \left_in[DATA][22] , \left_in[DATA][21] , \left_in[DATA][20] ,
         \left_in[DATA][19] , \left_in[DATA][18] , \left_in[DATA][17] ,
         \left_in[DATA][16] , \left_in[DATA][15] , \left_in[DATA][14] ,
         \left_in[DATA][13] , \left_in[DATA][12] , \left_in[DATA][11] ,
         \left_in[DATA][10] , \left_in[DATA][9] , \left_in[DATA][8] ,
         \left_in[DATA][7] , \left_in[DATA][6] , \left_in[DATA][5] ,
         \left_in[DATA][4] , \left_in[DATA][3] , \left_in[DATA][2] ,
         \left_in[DATA][1] , \left_in[DATA][0] , \right_in[ACK] ;
  output \left_out[ACK] , \right_out[REQ] , \right_out[DATA][33] ,
         \right_out[DATA][32] , \right_out[DATA][31] , \right_out[DATA][30] ,
         \right_out[DATA][29] , \right_out[DATA][28] , \right_out[DATA][27] ,
         \right_out[DATA][26] , \right_out[DATA][25] , \right_out[DATA][24] ,
         \right_out[DATA][23] , \right_out[DATA][22] , \right_out[DATA][21] ,
         \right_out[DATA][20] , \right_out[DATA][19] , \right_out[DATA][18] ,
         \right_out[DATA][17] , \right_out[DATA][16] , \right_out[DATA][15] ,
         \right_out[DATA][14] , \right_out[DATA][13] , \right_out[DATA][12] ,
         \right_out[DATA][11] , \right_out[DATA][10] , \right_out[DATA][9] ,
         \right_out[DATA][8] , \right_out[DATA][7] , \right_out[DATA][6] ,
         \right_out[DATA][5] , \right_out[DATA][4] , \right_out[DATA][3] ,
         \right_out[DATA][2] , \right_out[DATA][1] , \right_out[DATA][0] ;
  wire   lt_en, N3;

  latch_controller_1_8 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX18 \data_reg[32]  ( .G(N3), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N3), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N3), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N3), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N3), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N3), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N3), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N3), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N3), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX9 \data_reg[12]  ( .G(N3), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N3), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N3), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N3), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N3), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N3), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N3), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N3), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N3), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N3), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N3), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N3), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N3), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N3), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N3), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N3), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N3), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N3), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N3), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N3), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N3), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N3), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N3), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N3), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LS_LDHQX18 \data_reg[33]  ( .G(N3), .D(\left_in[DATA][33] ), .Q(
        \right_out[DATA][33] ) );
  HS65_LS_OR2X9 U3 ( .A(lt_en), .B(preset), .Z(N3) );
endmodule


module sr_latch_0_11 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X27 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_9 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_11 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_9 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, N0, n2;
  assign Rout = Aout;
  assign lt_en = N0;

  c_gate_0_9 gate ( .preset(preset), .a(n2), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 U1 ( .A(Ain), .Z(n2) );
  HS65_LS_IVX9 U2 ( .A(Aout), .Z(N0) );
endmodule


module channel_latch_1_xxxxxxxxx_9 ( preset, .left_in({\left_in[REQ] , 
        \left_in[DATA][33] , \left_in[DATA][32] , \left_in[DATA][31] , 
        \left_in[DATA][30] , \left_in[DATA][29] , \left_in[DATA][28] , 
        \left_in[DATA][27] , \left_in[DATA][26] , \left_in[DATA][25] , 
        \left_in[DATA][24] , \left_in[DATA][23] , \left_in[DATA][22] , 
        \left_in[DATA][21] , \left_in[DATA][20] , \left_in[DATA][19] , 
        \left_in[DATA][18] , \left_in[DATA][17] , \left_in[DATA][16] , 
        \left_in[DATA][15] , \left_in[DATA][14] , \left_in[DATA][13] , 
        \left_in[DATA][12] , \left_in[DATA][11] , \left_in[DATA][10] , 
        \left_in[DATA][9] , \left_in[DATA][8] , \left_in[DATA][7] , 
        \left_in[DATA][6] , \left_in[DATA][5] , \left_in[DATA][4] , 
        \left_in[DATA][3] , \left_in[DATA][2] , \left_in[DATA][1] , 
        \left_in[DATA][0] }), .left_out(\left_out[ACK] ), .right_out({
        \right_out[REQ] , \right_out[DATA][33] , \right_out[DATA][32] , 
        \right_out[DATA][31] , \right_out[DATA][30] , \right_out[DATA][29] , 
        \right_out[DATA][28] , \right_out[DATA][27] , \right_out[DATA][26] , 
        \right_out[DATA][25] , \right_out[DATA][24] , \right_out[DATA][23] , 
        \right_out[DATA][22] , \right_out[DATA][21] , \right_out[DATA][20] , 
        \right_out[DATA][19] , \right_out[DATA][18] , \right_out[DATA][17] , 
        \right_out[DATA][16] , \right_out[DATA][15] , \right_out[DATA][14] , 
        \right_out[DATA][13] , \right_out[DATA][12] , \right_out[DATA][11] , 
        \right_out[DATA][10] , \right_out[DATA][9] , \right_out[DATA][8] , 
        \right_out[DATA][7] , \right_out[DATA][6] , \right_out[DATA][5] , 
        \right_out[DATA][4] , \right_out[DATA][3] , \right_out[DATA][2] , 
        \right_out[DATA][1] , \right_out[DATA][0] }), .right_in(
        \right_in[ACK] ) );
  input preset, \left_in[REQ] , \left_in[DATA][33] , \left_in[DATA][32] ,
         \left_in[DATA][31] , \left_in[DATA][30] , \left_in[DATA][29] ,
         \left_in[DATA][28] , \left_in[DATA][27] , \left_in[DATA][26] ,
         \left_in[DATA][25] , \left_in[DATA][24] , \left_in[DATA][23] ,
         \left_in[DATA][22] , \left_in[DATA][21] , \left_in[DATA][20] ,
         \left_in[DATA][19] , \left_in[DATA][18] , \left_in[DATA][17] ,
         \left_in[DATA][16] , \left_in[DATA][15] , \left_in[DATA][14] ,
         \left_in[DATA][13] , \left_in[DATA][12] , \left_in[DATA][11] ,
         \left_in[DATA][10] , \left_in[DATA][9] , \left_in[DATA][8] ,
         \left_in[DATA][7] , \left_in[DATA][6] , \left_in[DATA][5] ,
         \left_in[DATA][4] , \left_in[DATA][3] , \left_in[DATA][2] ,
         \left_in[DATA][1] , \left_in[DATA][0] , \right_in[ACK] ;
  output \left_out[ACK] , \right_out[REQ] , \right_out[DATA][33] ,
         \right_out[DATA][32] , \right_out[DATA][31] , \right_out[DATA][30] ,
         \right_out[DATA][29] , \right_out[DATA][28] , \right_out[DATA][27] ,
         \right_out[DATA][26] , \right_out[DATA][25] , \right_out[DATA][24] ,
         \right_out[DATA][23] , \right_out[DATA][22] , \right_out[DATA][21] ,
         \right_out[DATA][20] , \right_out[DATA][19] , \right_out[DATA][18] ,
         \right_out[DATA][17] , \right_out[DATA][16] , \right_out[DATA][15] ,
         \right_out[DATA][14] , \right_out[DATA][13] , \right_out[DATA][12] ,
         \right_out[DATA][11] , \right_out[DATA][10] , \right_out[DATA][9] ,
         \right_out[DATA][8] , \right_out[DATA][7] , \right_out[DATA][6] ,
         \right_out[DATA][5] , \right_out[DATA][4] , \right_out[DATA][3] ,
         \right_out[DATA][2] , \right_out[DATA][1] , \right_out[DATA][0] ;
  wire   lt_en, N3;

  latch_controller_1_9 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX9 \data_reg[33]  ( .G(N3), .D(\left_in[DATA][33] ), .Q(
        \right_out[DATA][33] ) );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N3), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N3), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N3), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N3), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N3), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N3), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N3), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N3), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N3), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX9 \data_reg[12]  ( .G(N3), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N3), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N3), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N3), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N3), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N3), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N3), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N3), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N3), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N3), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N3), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N3), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N3), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N3), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N3), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N3), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N3), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N3), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N3), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N3), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N3), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N3), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LH_LDHQX9 \data_reg[29]  ( .G(N3), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX9 \data_reg[32]  ( .G(N3), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LS_OR2X9 U3 ( .A(lt_en), .B(preset), .Z(N3) );
endmodule


module noc_switch_x0_y0 ( preset, north_in_f, east_in_f, south_in_f, west_in_f, 
        resource_in_f, north_out_f, east_out_f, south_out_f, west_out_f, 
        resource_out_f, north_in_b_ACK_, east_in_b_ACK_, south_in_b_ACK_, 
        west_in_b_ACK_, resource_in_b_ACK_, north_out_b_ACK_, east_out_b_ACK_, 
        south_out_b_ACK_, west_out_b_ACK_, resource_out_b_ACK_ );
  input [34:0] north_in_f;
  input [34:0] east_in_f;
  input [34:0] south_in_f;
  input [34:0] west_in_f;
  input [34:0] resource_in_f;
  output [34:0] north_out_f;
  output [34:0] east_out_f;
  output [34:0] south_out_f;
  output [34:0] west_out_f;
  output [34:0] resource_out_f;
  input preset, north_out_b_ACK_, east_out_b_ACK_, south_out_b_ACK_,
         west_out_b_ACK_, resource_out_b_ACK_;
  output north_in_b_ACK_, east_in_b_ACK_, south_in_b_ACK_, west_in_b_ACK_,
         resource_in_b_ACK_;
  wire   north_hpu_b_ACK_, south_hpu_b_ACK_, east_hpu_b_ACK_, west_hpu_b_ACK_,
         resource_hpu_b_ACK_, chs_in_b_4__ACK_, chs_in_b_3__ACK_,
         chs_in_b_2__ACK_, chs_in_b_1__ACK_, chs_in_b_0__ACK_;
  wire   [34:0] north_hpu_f;
  wire   [34:0] south_hpu_f;
  wire   [34:0] east_hpu_f;
  wire   [34:0] west_hpu_f;
  wire   [34:0] resource_hpu_f;
  wire   [174:0] chs_in_f;
  wire   [24:0] switch_sel;

  channel_latch_1_xxxxxxxxx_0 north_in_latch ( .preset(preset), .left_in(
        north_in_f), .left_out(north_in_b_ACK_), .right_out(north_hpu_f), 
        .right_in(north_hpu_b_ACK_) );
  channel_latch_1_xxxxxxxxx_9 south_in_latch ( .preset(preset), .left_in(
        south_in_f), .left_out(south_in_b_ACK_), .right_out(south_hpu_f), 
        .right_in(south_hpu_b_ACK_) );
  channel_latch_1_xxxxxxxxx_8 east_in_latch ( .preset(preset), .left_in(
        east_in_f), .left_out(east_in_b_ACK_), .right_out(east_hpu_f), 
        .right_in(east_hpu_b_ACK_) );
  channel_latch_1_xxxxxxxxx_7 west_in_latch ( .preset(preset), .left_in(
        west_in_f), .left_out(west_in_b_ACK_), .right_out(west_hpu_f), 
        .right_in(west_hpu_b_ACK_) );
  channel_latch_1_xxxxxxxxx_6 resource_in_latch ( .preset(preset), .left_in(
        resource_in_f), .left_out(resource_in_b_ACK_), .right_out(
        resource_hpu_f), .right_in(resource_hpu_b_ACK_) );
  hpu_0_0 north_hpu ( .preset(preset), .chan_in_f(north_hpu_f), .chan_in_b(
        north_hpu_b_ACK_), .chan_out_f(chs_in_f[34:0]), .chan_out_b(
        chs_in_b_0__ACK_), .sel(switch_sel[4:0]) );
  hpu_0_2 south_hpu ( .preset(preset), .chan_in_f(south_hpu_f), .chan_in_b(
        south_hpu_b_ACK_), .chan_out_f(chs_in_f[104:70]), .chan_out_b(
        chs_in_b_2__ACK_), .sel(switch_sel[14:10]) );
  hpu_0_1 east_hpu ( .preset(preset), .chan_in_f(east_hpu_f), .chan_in_b(
        east_hpu_b_ACK_), .chan_out_f(chs_in_f[69:35]), .chan_out_b(
        chs_in_b_1__ACK_), .sel(switch_sel[9:5]) );
  hpu_0_3 west_hpu ( .preset(preset), .chan_in_f(west_hpu_f), .chan_in_b(
        west_hpu_b_ACK_), .chan_out_f(chs_in_f[139:105]), .chan_out_b(
        chs_in_b_3__ACK_), .sel(switch_sel[19:15]) );
  hpu_1_x resource_hpu ( .preset(preset), .chan_in_f(resource_hpu_f), 
        .chan_in_b(resource_hpu_b_ACK_), .chan_out_f(chs_in_f[174:140]), 
        .chan_out_b(chs_in_b_4__ACK_), .sel(switch_sel[24:20]) );
  crossbar_stage_x0_y0 xbar_with_latches ( .preset(preset), .switch_sel(
        switch_sel), .chs_in_f(chs_in_f), .chs_in_b({chs_in_b_4__ACK_, 
        chs_in_b_3__ACK_, chs_in_b_2__ACK_, chs_in_b_1__ACK_, chs_in_b_0__ACK_}), .latches_out_f({resource_out_f, west_out_f, south_out_f, east_out_f, 
        north_out_f}), .latches_out_b({resource_out_b_ACK_, west_out_b_ACK_, 
        south_out_b_ACK_, east_out_b_ACK_, north_out_b_ACK_}) );
endmodule

