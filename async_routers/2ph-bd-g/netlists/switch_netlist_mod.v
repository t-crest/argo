
module sr_latch_0_0 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n2;

  HS65_LS_AND2X4 C8 ( .A(n2), .B(N1), .Z(q) );
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
  wire   Aout, not_Ain;
  assign Rout = Aout;

  c_gate_0_0 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LSS_XOR2X6 U1 ( .A(Aout), .B(Ain), .Z(lt_en) );
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
  wire   lt_en, N5, n2, n1;

  latch_controller_1_0 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX18 \data_reg[32]  ( .G(N5), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N5), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N5), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N5), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N5), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N5), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N5), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N5), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N5), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N5), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N5), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N5), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N5), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N5), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N5), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N5), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N5), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N5), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N5), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N5), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX9 \data_reg[12]  ( .G(N5), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N5), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N5), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N5), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N5), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N5), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N5), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N5), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N5), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N5), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N5), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N5), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N5), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LS_LDLRQX9 type_out_reg ( .D(\left_in[DATA][33] ), .GN(lt_en), .RN(n1), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(lt_en), .B(n2), .C(n1), .Z(N5) );
  HS65_LS_IVX9 U5 ( .A(\left_in[DATA][33] ), .Z(n2) );
endmodule


module hpu_comb_0_0 ( data_valid, data_in, data_out, sel );
  input [33:0] data_in;
  output [33:0] data_out;
  output [4:0] sel;
  input data_valid;
  wire   N16, N17, N18, N19, N20, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n1, n37, n38,
         n39, n40, n41, n42, n43;
  assign data_out[33] = data_in[33];
  assign data_out[32] = data_in[32];
  assign sel[0] = 1'b0;

  HS65_LS_LDHQX9 \sel_reg[4]  ( .G(N20), .D(N19), .Q(sel[4]) );
  HS65_LS_LDHQX9 \sel_reg[3]  ( .G(N20), .D(N18), .Q(sel[3]) );
  HS65_LS_LDHQX9 \sel_reg[2]  ( .G(N20), .D(N17), .Q(sel[2]) );
  HS65_LS_LDHQX9 \sel_reg[1]  ( .G(N20), .D(N16), .Q(sel[1]) );
  HS65_LS_IVX7 U4 ( .A(n1), .Z(n43) );
  HS65_LS_OAI22X4 U5 ( .A(n40), .B(n30), .C(n38), .D(n32), .Z(data_out[1]) );
  HS65_LS_OAI22X4 U6 ( .A(n40), .B(n28), .C(n37), .D(n30), .Z(data_out[3]) );
  HS65_LS_OAI22X4 U7 ( .A(n40), .B(n27), .C(n37), .D(n29), .Z(data_out[4]) );
  HS65_LS_OAI22X4 U8 ( .A(n40), .B(n26), .C(n38), .D(n28), .Z(data_out[5]) );
  HS65_LS_OAI22X4 U9 ( .A(n40), .B(n23), .C(n37), .D(n25), .Z(data_out[8]) );
  HS65_LS_OAI22X4 U10 ( .A(n40), .B(n14), .C(n38), .D(n16), .Z(data_out[17])
         );
  HS65_LS_OAI22X4 U11 ( .A(n40), .B(n12), .C(n38), .D(n14), .Z(data_out[19])
         );
  HS65_LS_OAI22X4 U12 ( .A(n40), .B(n10), .C(n38), .D(n12), .Z(data_out[21])
         );
  HS65_LS_OAI22X4 U13 ( .A(n40), .B(n8), .C(n38), .D(n10), .Z(data_out[23]) );
  HS65_LS_OAI22X4 U14 ( .A(n40), .B(n6), .C(n37), .D(n8), .Z(data_out[25]) );
  HS65_LS_OAI22X4 U15 ( .A(n40), .B(n4), .C(n37), .D(n6), .Z(data_out[27]) );
  HS65_LS_OAI22X4 U16 ( .A(n40), .B(n2), .C(n37), .D(n4), .Z(data_out[29]) );
  HS65_LS_BFX18 U17 ( .A(n34), .Z(n1) );
  HS65_LS_NOR2AX3 U18 ( .A(data_in[33]), .B(data_in[32]), .Z(n34) );
  HS65_LH_NOR2AX3 U19 ( .A(data_valid), .B(data_in[32]), .Z(N20) );
  HS65_LS_IVX9 U20 ( .A(n43), .Z(n38) );
  HS65_LS_IVX9 U21 ( .A(n43), .Z(n37) );
  HS65_LS_BFX9 U22 ( .A(n42), .Z(n40) );
  HS65_LS_IVX9 U23 ( .A(n43), .Z(n39) );
  HS65_LS_BFX9 U24 ( .A(n42), .Z(n41) );
  HS65_LS_NAND2X7 U25 ( .A(n39), .B(n35), .Z(n36) );
  HS65_LS_NOR2X6 U26 ( .A(n41), .B(n35), .Z(N19) );
  HS65_LS_OAI22X6 U27 ( .A(n43), .B(n25), .C(n37), .D(n27), .Z(data_out[6]) );
  HS65_LS_OAI22X6 U28 ( .A(n24), .B(n41), .C(n37), .D(n26), .Z(data_out[7]) );
  HS65_LS_OAI22X6 U29 ( .A(n41), .B(n31), .C(n39), .D(n33), .Z(data_out[0]) );
  HS65_LS_OAI22X6 U30 ( .A(n40), .B(n29), .C(n37), .D(n31), .Z(data_out[2]) );
  HS65_LS_OAI22X6 U31 ( .A(n40), .B(n22), .C(n37), .D(n24), .Z(data_out[9]) );
  HS65_LS_OAI22X6 U32 ( .A(n41), .B(n21), .C(n39), .D(n23), .Z(data_out[10])
         );
  HS65_LS_OAI22X6 U33 ( .A(n41), .B(n20), .C(n39), .D(n22), .Z(data_out[11])
         );
  HS65_LS_OAI22X6 U34 ( .A(n41), .B(n19), .C(n39), .D(n21), .Z(data_out[12])
         );
  HS65_LS_OAI22X6 U35 ( .A(n41), .B(n18), .C(n39), .D(n20), .Z(data_out[13])
         );
  HS65_LS_OAI22X6 U36 ( .A(n41), .B(n17), .C(n39), .D(n19), .Z(data_out[14])
         );
  HS65_LS_OAI22X6 U37 ( .A(n41), .B(n16), .C(n38), .D(n18), .Z(data_out[15])
         );
  HS65_LS_OAI22X6 U38 ( .A(n41), .B(n15), .C(n38), .D(n17), .Z(data_out[16])
         );
  HS65_LS_OAI22X6 U39 ( .A(n40), .B(n13), .C(n38), .D(n15), .Z(data_out[18])
         );
  HS65_LS_OAI22X6 U40 ( .A(n40), .B(n11), .C(n38), .D(n13), .Z(data_out[20])
         );
  HS65_LS_OAI22X6 U41 ( .A(n40), .B(n9), .C(n38), .D(n11), .Z(data_out[22]) );
  HS65_LS_OAI22X6 U42 ( .A(n40), .B(n7), .C(n38), .D(n9), .Z(data_out[24]) );
  HS65_LS_OAI22X6 U43 ( .A(n40), .B(n5), .C(n37), .D(n7), .Z(data_out[26]) );
  HS65_LS_OAI22X6 U44 ( .A(n40), .B(n3), .C(n37), .D(n5), .Z(data_out[28]) );
  HS65_LS_IVX9 U45 ( .A(n1), .Z(n42) );
  HS65_LS_NOR2X6 U46 ( .A(n39), .B(n3), .Z(data_out[30]) );
  HS65_LS_NOR2X6 U47 ( .A(n39), .B(n2), .Z(data_out[31]) );
  HS65_LS_NOR3X4 U48 ( .A(n36), .B(n32), .C(n33), .Z(N18) );
  HS65_LS_NAND2X7 U49 ( .A(n32), .B(n33), .Z(n35) );
  HS65_LS_IVX9 U50 ( .A(data_in[1]), .Z(n32) );
  HS65_LS_IVX9 U51 ( .A(data_in[0]), .Z(n33) );
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
  HS65_LS_NOR2X6 U82 ( .A(data_in[1]), .B(n36), .Z(N16) );
  HS65_LS_NOR2X6 U83 ( .A(data_in[0]), .B(n36), .Z(N17) );
endmodule


module sr_latch_0_5 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LH_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_5 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_5 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_5 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, not_Ain;
  assign Rout = Aout;

  c_gate_0_5 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LSS_XOR2X6 U1 ( .A(Aout), .B(Ain), .Z(lt_en) );
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
  wire   lt_en, N5, n1, n3;

  latch_controller_1_5 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX18 \data_reg[31]  ( .G(N5), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_LDHQX18 \data_reg[30]  ( .G(N5), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDHQX18 \data_reg[14]  ( .G(N5), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX18 \data_reg[13]  ( .G(N5), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX18 \data_reg[12]  ( .G(N5), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX18 \data_reg[11]  ( .G(N5), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX18 \data_reg[10]  ( .G(N5), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX18 \data_reg[9]  ( .G(N5), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX18 \data_reg[0]  ( .G(N5), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N5), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N5), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N5), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N5), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N5), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N5), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N5), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N5), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[32]  ( .G(N5), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LS_LDLRQX9 type_out_reg ( .D(\left_in[DATA][33] ), .GN(lt_en), .RN(n1), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N5), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N5), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N5), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N5), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N5), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N5), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N5), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N5), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N5), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N5), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N5), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N5), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N5), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N5), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N5), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(lt_en), .B(n3), .C(n1), .Z(N5) );
  HS65_LH_IVX2 U5 ( .A(\left_in[DATA][33] ), .Z(n3) );
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
  wire   n10, \chan_internal_f[REQ] , \chan_internal_f[DATA][33] ,
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
         \chan_internal_f[DATA][0] , data_in_valid, req_n, n1, n2, n3, n4, n5,
         n6, n7, n8;
  assign sel[0] = 1'b0;

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
        \chan_internal_f[DATA][0] }), .sel({sel[4:1], n10}) );
  channel_latch_1_xxxxxxxxx_5 token_latch ( .preset(preset), .left_in({
        \chan_internal_f[REQ] , \chan_internal_f[DATA][33] , 
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
        \chan_internal_f[DATA][0] }), .left_out(\chan_in_b[ACK] ), .right_out(
        {\chan_out_f[REQ] , \chan_out_f[DATA][33] , \chan_out_f[DATA][32] , 
        \chan_out_f[DATA][31] , \chan_out_f[DATA][30] , \chan_out_f[DATA][29] , 
        \chan_out_f[DATA][28] , \chan_out_f[DATA][27] , \chan_out_f[DATA][26] , 
        \chan_out_f[DATA][25] , \chan_out_f[DATA][24] , \chan_out_f[DATA][23] , 
        \chan_out_f[DATA][22] , \chan_out_f[DATA][21] , \chan_out_f[DATA][20] , 
        \chan_out_f[DATA][19] , \chan_out_f[DATA][18] , \chan_out_f[DATA][17] , 
        \chan_out_f[DATA][16] , \chan_out_f[DATA][15] , \chan_out_f[DATA][14] , 
        \chan_out_f[DATA][13] , \chan_out_f[DATA][12] , \chan_out_f[DATA][11] , 
        \chan_out_f[DATA][10] , \chan_out_f[DATA][9] , \chan_out_f[DATA][8] , 
        \chan_out_f[DATA][7] , \chan_out_f[DATA][6] , \chan_out_f[DATA][5] , 
        \chan_out_f[DATA][4] , \chan_out_f[DATA][3] , \chan_out_f[DATA][2] , 
        \chan_out_f[DATA][1] , \chan_out_f[DATA][0] }), .right_in(
        \chan_out_b[ACK] ) );
  HS65_LS_IVX9 I_0 ( .A(\chan_in_f[REQ] ), .Z(req_n) );
  HS65_LS_IVX9 I_1 ( .A(n2), .Z(\chan_internal_f[REQ] ) );
  HS65_LS_IVX9 U1 ( .A(n3), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(n1), .Z(n2) );
  HS65_LS_BFX9 U3 ( .A(n4), .Z(n3) );
  HS65_LS_BFX9 U4 ( .A(n5), .Z(n4) );
  HS65_LS_BFX9 U5 ( .A(n6), .Z(n5) );
  HS65_LS_BFX9 U6 ( .A(n7), .Z(n6) );
  HS65_LS_BFX9 U7 ( .A(n8), .Z(n7) );
  HS65_LS_BFX9 U8 ( .A(req_n), .Z(n8) );
  HS65_LSS_XOR2X6 U9 ( .A(\chan_internal_f[REQ] ), .B(\chan_in_b[ACK] ), .Z(
        data_in_valid) );
endmodule


module hpu_comb_0_2 ( data_valid, data_in, data_out, sel );
  input [33:0] data_in;
  output [33:0] data_out;
  output [4:0] sel;
  input data_valid;
  wire   N18, N19, N21, N22, N23, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n1, n22, n23, n24,
         n25, n26, n27;
  assign data_out[33] = data_in[33];
  assign data_out[32] = data_in[32];
  assign sel[2] = 1'b0;

  HS65_LS_LDHQX9 \sel_reg[4]  ( .G(N23), .D(N22), .Q(sel[4]) );
  HS65_LS_LDHQX9 \sel_reg[3]  ( .G(N23), .D(N21), .Q(sel[3]) );
  HS65_LS_LDHQX9 \sel_reg[1]  ( .G(N23), .D(N19), .Q(sel[1]) );
  HS65_LS_LDHQX9 \sel_reg[0]  ( .G(N23), .D(N18), .Q(sel[0]) );
  HS65_LS_BFX7 U4 ( .A(n1), .Z(n25) );
  HS65_LH_NOR2X2 U5 ( .A(n23), .B(n19), .Z(N22) );
  HS65_LH_AO22X4 U6 ( .A(n27), .B(data_in[15]), .C(n23), .D(data_in[13]), .Z(
        data_out[13]) );
  HS65_LH_AO22X4 U7 ( .A(n27), .B(data_in[17]), .C(n23), .D(data_in[15]), .Z(
        data_out[15]) );
  HS65_LS_AO22X4 U8 ( .A(n27), .B(data_in[19]), .C(n23), .D(data_in[17]), .Z(
        data_out[17]) );
  HS65_LS_AO22X4 U9 ( .A(n27), .B(data_in[21]), .C(n23), .D(data_in[19]), .Z(
        data_out[19]) );
  HS65_LS_AO22X4 U10 ( .A(n27), .B(data_in[23]), .C(n23), .D(data_in[21]), .Z(
        data_out[21]) );
  HS65_LS_AO22X4 U11 ( .A(n27), .B(data_in[25]), .C(n23), .D(data_in[23]), .Z(
        data_out[23]) );
  HS65_LS_AO22X4 U12 ( .A(n27), .B(data_in[27]), .C(n23), .D(data_in[25]), .Z(
        data_out[25]) );
  HS65_LS_AO22X4 U13 ( .A(n27), .B(data_in[29]), .C(n23), .D(data_in[27]), .Z(
        data_out[27]) );
  HS65_LH_AO22X9 U14 ( .A(n27), .B(data_in[3]), .C(n23), .D(data_in[1]), .Z(
        data_out[1]) );
  HS65_LH_NOR2AX3 U15 ( .A(data_valid), .B(data_in[32]), .Z(N23) );
  HS65_LS_IVX9 U16 ( .A(n25), .Z(n23) );
  HS65_LS_IVX9 U17 ( .A(n25), .Z(n22) );
  HS65_LS_IVX9 U18 ( .A(n25), .Z(n24) );
  HS65_LS_OAI22X6 U19 ( .A(n23), .B(n16), .C(n26), .D(n17), .Z(data_out[0]) );
  HS65_LS_OAI22X6 U20 ( .A(n22), .B(n15), .C(n26), .D(n16), .Z(data_out[2]) );
  HS65_LS_OAI22X6 U21 ( .A(n22), .B(n14), .C(n26), .D(n15), .Z(data_out[4]) );
  HS65_LS_OAI22X6 U22 ( .A(n22), .B(n13), .C(n26), .D(n14), .Z(data_out[6]) );
  HS65_LS_OAI22X6 U23 ( .A(n22), .B(n12), .C(n26), .D(n13), .Z(data_out[8]) );
  HS65_LS_OAI22X6 U24 ( .A(n23), .B(n11), .C(n26), .D(n12), .Z(data_out[10])
         );
  HS65_LS_OAI22X6 U25 ( .A(n23), .B(n10), .C(n26), .D(n11), .Z(data_out[12])
         );
  HS65_LS_OAI22X6 U26 ( .A(n22), .B(n9), .C(n26), .D(n10), .Z(data_out[14]) );
  HS65_LS_OAI22X6 U27 ( .A(n22), .B(n8), .C(n26), .D(n9), .Z(data_out[16]) );
  HS65_LS_OAI22X6 U28 ( .A(n22), .B(n7), .C(n25), .D(n8), .Z(data_out[18]) );
  HS65_LS_OAI22X6 U29 ( .A(n22), .B(n6), .C(n26), .D(n7), .Z(data_out[20]) );
  HS65_LS_OAI22X6 U30 ( .A(n22), .B(n5), .C(n26), .D(n6), .Z(data_out[22]) );
  HS65_LS_OAI22X6 U31 ( .A(n22), .B(n4), .C(n26), .D(n5), .Z(data_out[24]) );
  HS65_LS_OAI22X6 U32 ( .A(n22), .B(n3), .C(n26), .D(n4), .Z(data_out[26]) );
  HS65_LS_OAI22X6 U33 ( .A(n22), .B(n2), .C(n26), .D(n3), .Z(data_out[28]) );
  HS65_LS_BFX9 U34 ( .A(n1), .Z(n26) );
  HS65_LS_BFX9 U35 ( .A(n1), .Z(n27) );
  HS65_LS_NOR2X6 U36 ( .A(n26), .B(n2), .Z(data_out[30]) );
  HS65_LS_NAND2X7 U37 ( .A(n26), .B(n19), .Z(n20) );
  HS65_LS_NOR3X4 U38 ( .A(n20), .B(n17), .C(n21), .Z(N21) );
  HS65_LS_NOR2AX3 U39 ( .A(n21), .B(n20), .Z(N19) );
  HS65_LS_IVX9 U40 ( .A(data_in[0]), .Z(n17) );
  HS65_LS_IVX9 U41 ( .A(data_in[2]), .Z(n16) );
  HS65_LS_IVX9 U42 ( .A(data_in[4]), .Z(n15) );
  HS65_LS_IVX9 U43 ( .A(data_in[6]), .Z(n14) );
  HS65_LS_IVX9 U44 ( .A(data_in[8]), .Z(n13) );
  HS65_LS_IVX9 U45 ( .A(data_in[10]), .Z(n12) );
  HS65_LS_IVX9 U46 ( .A(data_in[12]), .Z(n11) );
  HS65_LS_IVX9 U47 ( .A(data_in[14]), .Z(n10) );
  HS65_LS_IVX9 U48 ( .A(data_in[16]), .Z(n9) );
  HS65_LS_IVX9 U49 ( .A(data_in[18]), .Z(n8) );
  HS65_LS_IVX9 U50 ( .A(data_in[20]), .Z(n7) );
  HS65_LS_IVX9 U51 ( .A(data_in[22]), .Z(n6) );
  HS65_LS_IVX9 U52 ( .A(data_in[24]), .Z(n5) );
  HS65_LS_IVX9 U53 ( .A(data_in[26]), .Z(n4) );
  HS65_LS_IVX9 U54 ( .A(data_in[28]), .Z(n3) );
  HS65_LS_IVX9 U55 ( .A(data_in[30]), .Z(n2) );
  HS65_LS_BFX27 U56 ( .A(n18), .Z(n1) );
  HS65_LS_NOR2AX13 U57 ( .A(data_in[33]), .B(data_in[32]), .Z(n18) );
  HS65_LS_AO22X9 U58 ( .A(n26), .B(data_in[5]), .C(n23), .D(data_in[3]), .Z(
        data_out[3]) );
  HS65_LS_AO22X9 U59 ( .A(n26), .B(data_in[7]), .C(n23), .D(data_in[5]), .Z(
        data_out[5]) );
  HS65_LS_AO22X9 U60 ( .A(n27), .B(data_in[11]), .C(n23), .D(data_in[9]), .Z(
        data_out[9]) );
  HS65_LS_AO22X9 U61 ( .A(n26), .B(data_in[13]), .C(n23), .D(data_in[11]), .Z(
        data_out[11]) );
  HS65_LS_AO22X9 U62 ( .A(data_in[9]), .B(n27), .C(n24), .D(data_in[7]), .Z(
        data_out[7]) );
  HS65_LS_AO22X9 U63 ( .A(n26), .B(data_in[31]), .C(n24), .D(data_in[29]), .Z(
        data_out[29]) );
  HS65_LS_AND2X4 U64 ( .A(data_in[31]), .B(n24), .Z(data_out[31]) );
  HS65_LS_NAND2X7 U65 ( .A(data_in[1]), .B(n17), .Z(n19) );
  HS65_LS_NOR2X6 U66 ( .A(n17), .B(data_in[1]), .Z(n21) );
  HS65_LS_NOR2X6 U67 ( .A(data_in[0]), .B(n20), .Z(N18) );
endmodule


module sr_latch_0_4 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LH_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_4 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_4 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_4 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, not_Ain;
  assign Rout = Aout;

  c_gate_0_4 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LSS_XOR2X6 U1 ( .A(Aout), .B(Ain), .Z(lt_en) );
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
  wire   lt_en, N5, n1, n3;

  latch_controller_1_4 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX18 \data_reg[28]  ( .G(N5), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX18 \data_reg[26]  ( .G(N5), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX18 \data_reg[24]  ( .G(N5), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX18 \data_reg[22]  ( .G(N5), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX18 \data_reg[20]  ( .G(N5), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX18 \data_reg[18]  ( .G(N5), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX18 \data_reg[16]  ( .G(N5), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX18 \data_reg[14]  ( .G(N5), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX18 \data_reg[12]  ( .G(N5), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX18 \data_reg[10]  ( .G(N5), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX18 \data_reg[8]  ( .G(N5), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX18 \data_reg[6]  ( .G(N5), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX18 \data_reg[4]  ( .G(N5), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_LDHQX18 \data_reg[2]  ( .G(N5), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX18 \data_reg[0]  ( .G(N5), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N5), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N5), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N5), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N5), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N5), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N5), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX9 \data_reg[32]  ( .G(N5), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N5), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDLRQX9 type_out_reg ( .D(\left_in[DATA][33] ), .GN(lt_en), .RN(n1), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N5), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N5), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N5), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N5), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N5), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N5), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N5), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N5), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N5), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N5), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_IVX2 U3 ( .A(\left_in[DATA][33] ), .Z(n3) );
  HS65_LS_IVX9 U4 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U5 ( .A(lt_en), .B(n3), .C(n1), .Z(N5) );
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
  wire   n10, \chan_internal_f[REQ] , \chan_internal_f[DATA][33] ,
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
         \chan_internal_f[DATA][0] , data_in_valid, req_n, n1, n2, n3, n4, n5,
         n6, n7, n8;
  assign sel[2] = 1'b0;

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
        \chan_internal_f[DATA][0] }), .sel({sel[4:3], n10, sel[1:0]}) );
  channel_latch_1_xxxxxxxxx_4 token_latch ( .preset(preset), .left_in({
        \chan_internal_f[REQ] , \chan_internal_f[DATA][33] , 
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
        \chan_internal_f[DATA][0] }), .left_out(\chan_in_b[ACK] ), .right_out(
        {\chan_out_f[REQ] , \chan_out_f[DATA][33] , \chan_out_f[DATA][32] , 
        \chan_out_f[DATA][31] , \chan_out_f[DATA][30] , \chan_out_f[DATA][29] , 
        \chan_out_f[DATA][28] , \chan_out_f[DATA][27] , \chan_out_f[DATA][26] , 
        \chan_out_f[DATA][25] , \chan_out_f[DATA][24] , \chan_out_f[DATA][23] , 
        \chan_out_f[DATA][22] , \chan_out_f[DATA][21] , \chan_out_f[DATA][20] , 
        \chan_out_f[DATA][19] , \chan_out_f[DATA][18] , \chan_out_f[DATA][17] , 
        \chan_out_f[DATA][16] , \chan_out_f[DATA][15] , \chan_out_f[DATA][14] , 
        \chan_out_f[DATA][13] , \chan_out_f[DATA][12] , \chan_out_f[DATA][11] , 
        \chan_out_f[DATA][10] , \chan_out_f[DATA][9] , \chan_out_f[DATA][8] , 
        \chan_out_f[DATA][7] , \chan_out_f[DATA][6] , \chan_out_f[DATA][5] , 
        \chan_out_f[DATA][4] , \chan_out_f[DATA][3] , \chan_out_f[DATA][2] , 
        \chan_out_f[DATA][1] , \chan_out_f[DATA][0] }), .right_in(
        \chan_out_b[ACK] ) );
  HS65_LS_IVX9 I_0 ( .A(\chan_in_f[REQ] ), .Z(req_n) );
  HS65_LS_IVX9 I_1 ( .A(n2), .Z(\chan_internal_f[REQ] ) );
  HS65_LS_IVX9 U1 ( .A(n3), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(n1), .Z(n2) );
  HS65_LS_BFX9 U3 ( .A(n4), .Z(n3) );
  HS65_LS_BFX9 U4 ( .A(n5), .Z(n4) );
  HS65_LS_BFX9 U5 ( .A(n6), .Z(n5) );
  HS65_LS_BFX9 U6 ( .A(n7), .Z(n6) );
  HS65_LS_BFX9 U7 ( .A(n8), .Z(n7) );
  HS65_LS_BFX9 U8 ( .A(req_n), .Z(n8) );
  HS65_LSS_XOR2X6 U9 ( .A(\chan_internal_f[REQ] ), .B(\chan_in_b[ACK] ), .Z(
        data_in_valid) );
endmodule


module hpu_comb_0_1 ( data_valid, data_in, data_out, sel );
  input [33:0] data_in;
  output [33:0] data_out;
  output [4:0] sel;
  input data_valid;
  wire   N15, N17, N18, N19, N20, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n1, n22, n23, n24,
         n25, n26, n27;
  assign data_out[33] = data_in[33];
  assign data_out[32] = data_in[32];
  assign sel[1] = 1'b0;

  HS65_LS_LDHQX9 \sel_reg[4]  ( .G(N20), .D(N19), .Q(sel[4]) );
  HS65_LS_LDHQX9 \sel_reg[3]  ( .G(N20), .D(N18), .Q(sel[3]) );
  HS65_LS_LDHQX9 \sel_reg[2]  ( .G(N20), .D(N17), .Q(sel[2]) );
  HS65_LS_LDHQX9 \sel_reg[0]  ( .G(N20), .D(N15), .Q(sel[0]) );
  HS65_LS_BFX7 U4 ( .A(n1), .Z(n25) );
  HS65_LS_IVX9 U5 ( .A(n25), .Z(n23) );
  HS65_LS_IVX9 U6 ( .A(n25), .Z(n22) );
  HS65_LS_IVX9 U7 ( .A(n25), .Z(n24) );
  HS65_LS_OAI22X6 U8 ( .A(n13), .B(n23), .C(n25), .D(n14), .Z(data_out[7]) );
  HS65_LS_OAI22X6 U9 ( .A(n22), .B(n16), .C(n26), .D(n17), .Z(data_out[1]) );
  HS65_LS_OAI22X6 U10 ( .A(n22), .B(n15), .C(n26), .D(n16), .Z(data_out[3]) );
  HS65_LS_OAI22X6 U11 ( .A(n22), .B(n14), .C(n26), .D(n15), .Z(data_out[5]) );
  HS65_LS_OAI22X6 U12 ( .A(n22), .B(n12), .C(n26), .D(n13), .Z(data_out[9]) );
  HS65_LS_OAI22X6 U13 ( .A(n22), .B(n11), .C(n26), .D(n12), .Z(data_out[11])
         );
  HS65_LS_OAI22X6 U14 ( .A(n22), .B(n10), .C(n26), .D(n11), .Z(data_out[13])
         );
  HS65_LS_OAI22X6 U15 ( .A(n22), .B(n9), .C(n26), .D(n10), .Z(data_out[15]) );
  HS65_LS_OAI22X6 U16 ( .A(n22), .B(n8), .C(n26), .D(n9), .Z(data_out[17]) );
  HS65_LS_OAI22X6 U17 ( .A(n22), .B(n7), .C(n26), .D(n8), .Z(data_out[19]) );
  HS65_LS_OAI22X6 U18 ( .A(n22), .B(n6), .C(n26), .D(n7), .Z(data_out[21]) );
  HS65_LS_OAI22X6 U19 ( .A(n22), .B(n5), .C(n26), .D(n6), .Z(data_out[23]) );
  HS65_LS_OAI22X6 U20 ( .A(n23), .B(n4), .C(n26), .D(n5), .Z(data_out[25]) );
  HS65_LS_OAI22X6 U21 ( .A(n22), .B(n3), .C(n26), .D(n4), .Z(data_out[27]) );
  HS65_LS_OAI22X6 U22 ( .A(n23), .B(n2), .C(n26), .D(n3), .Z(data_out[29]) );
  HS65_LS_BFX9 U23 ( .A(n1), .Z(n26) );
  HS65_LS_BFX9 U24 ( .A(n1), .Z(n27) );
  HS65_LS_NOR2X6 U25 ( .A(n26), .B(n2), .Z(data_out[31]) );
  HS65_LS_NAND2X7 U26 ( .A(n26), .B(n19), .Z(n20) );
  HS65_LS_NOR3X4 U27 ( .A(n20), .B(n17), .C(n21), .Z(N18) );
  HS65_LS_NOR2AX3 U28 ( .A(n21), .B(n20), .Z(N17) );
  HS65_LS_NOR2X6 U29 ( .A(n23), .B(n19), .Z(N19) );
  HS65_LS_IVX9 U30 ( .A(data_in[1]), .Z(n17) );
  HS65_LS_IVX9 U31 ( .A(data_in[9]), .Z(n13) );
  HS65_LS_IVX9 U32 ( .A(data_in[3]), .Z(n16) );
  HS65_LS_IVX9 U33 ( .A(data_in[5]), .Z(n15) );
  HS65_LS_IVX9 U34 ( .A(data_in[7]), .Z(n14) );
  HS65_LS_IVX9 U35 ( .A(data_in[11]), .Z(n12) );
  HS65_LS_IVX9 U36 ( .A(data_in[13]), .Z(n11) );
  HS65_LS_IVX9 U37 ( .A(data_in[15]), .Z(n10) );
  HS65_LS_IVX9 U38 ( .A(data_in[17]), .Z(n9) );
  HS65_LS_IVX9 U39 ( .A(data_in[19]), .Z(n8) );
  HS65_LS_IVX9 U40 ( .A(data_in[21]), .Z(n7) );
  HS65_LS_IVX9 U41 ( .A(data_in[23]), .Z(n6) );
  HS65_LS_IVX9 U42 ( .A(data_in[25]), .Z(n5) );
  HS65_LS_IVX9 U43 ( .A(data_in[27]), .Z(n4) );
  HS65_LS_IVX9 U44 ( .A(data_in[29]), .Z(n3) );
  HS65_LS_IVX9 U45 ( .A(data_in[31]), .Z(n2) );
  HS65_LS_BFX27 U46 ( .A(n18), .Z(n1) );
  HS65_LS_NOR2AX13 U47 ( .A(data_in[33]), .B(data_in[32]), .Z(n18) );
  HS65_LS_AO22X9 U48 ( .A(n27), .B(data_in[2]), .C(n23), .D(data_in[0]), .Z(
        data_out[0]) );
  HS65_LS_AO22X9 U49 ( .A(n27), .B(data_in[4]), .C(n23), .D(data_in[2]), .Z(
        data_out[2]) );
  HS65_LS_AO22X9 U50 ( .A(n27), .B(data_in[6]), .C(n23), .D(data_in[4]), .Z(
        data_out[4]) );
  HS65_LS_AO22X9 U51 ( .A(n27), .B(data_in[8]), .C(n23), .D(data_in[6]), .Z(
        data_out[6]) );
  HS65_LS_AO22X9 U52 ( .A(n27), .B(data_in[10]), .C(n23), .D(data_in[8]), .Z(
        data_out[8]) );
  HS65_LS_AO22X9 U53 ( .A(n27), .B(data_in[16]), .C(n23), .D(data_in[14]), .Z(
        data_out[14]) );
  HS65_LS_AO22X9 U54 ( .A(n26), .B(data_in[18]), .C(n23), .D(data_in[16]), .Z(
        data_out[16]) );
  HS65_LS_AO22X9 U55 ( .A(n26), .B(data_in[20]), .C(n23), .D(data_in[18]), .Z(
        data_out[18]) );
  HS65_LS_AO22X9 U56 ( .A(n27), .B(data_in[22]), .C(n23), .D(data_in[20]), .Z(
        data_out[20]) );
  HS65_LS_AO22X9 U57 ( .A(n26), .B(data_in[24]), .C(n23), .D(data_in[22]), .Z(
        data_out[22]) );
  HS65_LS_AO22X9 U58 ( .A(n26), .B(data_in[26]), .C(n23), .D(data_in[24]), .Z(
        data_out[24]) );
  HS65_LS_AO22X9 U59 ( .A(n27), .B(data_in[28]), .C(n23), .D(data_in[26]), .Z(
        data_out[26]) );
  HS65_LS_AO22X9 U60 ( .A(n27), .B(data_in[30]), .C(n23), .D(data_in[28]), .Z(
        data_out[28]) );
  HS65_LS_AO22X9 U61 ( .A(n27), .B(data_in[12]), .C(n24), .D(data_in[10]), .Z(
        data_out[10]) );
  HS65_LS_AO22X9 U62 ( .A(n27), .B(data_in[14]), .C(n24), .D(data_in[12]), .Z(
        data_out[12]) );
  HS65_LS_AND2X4 U63 ( .A(data_in[30]), .B(n24), .Z(data_out[30]) );
  HS65_LS_NAND2X7 U64 ( .A(data_in[0]), .B(n17), .Z(n19) );
  HS65_LS_NOR2X6 U65 ( .A(n17), .B(data_in[0]), .Z(n21) );
  HS65_LS_NOR2AX3 U66 ( .A(data_valid), .B(data_in[32]), .Z(N20) );
  HS65_LS_NOR2X6 U67 ( .A(data_in[1]), .B(n20), .Z(N15) );
endmodule


module sr_latch_0_3 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LH_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_3 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_3 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_3 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, not_Ain;
  assign Rout = Aout;

  c_gate_0_3 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LSS_XOR2X6 U1 ( .A(Aout), .B(Ain), .Z(lt_en) );
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
  wire   lt_en, N5, n1, n3;

  latch_controller_1_3 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX18 \data_reg[28]  ( .G(N5), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX18 \data_reg[26]  ( .G(N5), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX18 \data_reg[24]  ( .G(N5), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX18 \data_reg[22]  ( .G(N5), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX18 \data_reg[20]  ( .G(N5), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX18 \data_reg[18]  ( .G(N5), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX18 \data_reg[16]  ( .G(N5), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX18 \data_reg[14]  ( .G(N5), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX18 \data_reg[12]  ( .G(N5), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX18 \data_reg[10]  ( .G(N5), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX18 \data_reg[8]  ( .G(N5), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX18 \data_reg[6]  ( .G(N5), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX18 \data_reg[4]  ( .G(N5), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_LDHQX18 \data_reg[2]  ( .G(N5), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX18 \data_reg[0]  ( .G(N5), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N5), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[32]  ( .G(N5), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N5), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N5), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N5), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N5), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N5), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N5), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N5), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N5), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N5), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N5), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N5), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N5), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N5), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N5), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N5), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N5), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LS_LDLRQX4 type_out_reg ( .D(\left_in[DATA][33] ), .GN(lt_en), .RN(n1), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(lt_en), .B(n3), .C(n1), .Z(N5) );
  HS65_LS_IVX9 U5 ( .A(\left_in[DATA][33] ), .Z(n3) );
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
  wire   n10, \chan_internal_f[REQ] , \chan_internal_f[DATA][33] ,
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
         \chan_internal_f[DATA][0] , data_in_valid, req_n, n1, n2, n3, n4, n5,
         n6, n7, n8;
  assign sel[1] = 1'b0;

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
        \chan_internal_f[DATA][0] }), .sel({sel[4:2], n10, sel[0]}) );
  channel_latch_1_xxxxxxxxx_3 token_latch ( .preset(preset), .left_in({
        \chan_internal_f[REQ] , \chan_internal_f[DATA][33] , 
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
        \chan_internal_f[DATA][0] }), .left_out(\chan_in_b[ACK] ), .right_out(
        {\chan_out_f[REQ] , \chan_out_f[DATA][33] , \chan_out_f[DATA][32] , 
        \chan_out_f[DATA][31] , \chan_out_f[DATA][30] , \chan_out_f[DATA][29] , 
        \chan_out_f[DATA][28] , \chan_out_f[DATA][27] , \chan_out_f[DATA][26] , 
        \chan_out_f[DATA][25] , \chan_out_f[DATA][24] , \chan_out_f[DATA][23] , 
        \chan_out_f[DATA][22] , \chan_out_f[DATA][21] , \chan_out_f[DATA][20] , 
        \chan_out_f[DATA][19] , \chan_out_f[DATA][18] , \chan_out_f[DATA][17] , 
        \chan_out_f[DATA][16] , \chan_out_f[DATA][15] , \chan_out_f[DATA][14] , 
        \chan_out_f[DATA][13] , \chan_out_f[DATA][12] , \chan_out_f[DATA][11] , 
        \chan_out_f[DATA][10] , \chan_out_f[DATA][9] , \chan_out_f[DATA][8] , 
        \chan_out_f[DATA][7] , \chan_out_f[DATA][6] , \chan_out_f[DATA][5] , 
        \chan_out_f[DATA][4] , \chan_out_f[DATA][3] , \chan_out_f[DATA][2] , 
        \chan_out_f[DATA][1] , \chan_out_f[DATA][0] }), .right_in(
        \chan_out_b[ACK] ) );
  HS65_LS_IVX9 I_0 ( .A(\chan_in_f[REQ] ), .Z(req_n) );
  HS65_LS_IVX9 I_1 ( .A(n2), .Z(\chan_internal_f[REQ] ) );
  HS65_LS_IVX9 U1 ( .A(n3), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(n1), .Z(n2) );
  HS65_LS_BFX9 U3 ( .A(n4), .Z(n3) );
  HS65_LS_BFX9 U4 ( .A(n5), .Z(n4) );
  HS65_LS_BFX9 U5 ( .A(n6), .Z(n5) );
  HS65_LS_BFX9 U6 ( .A(n7), .Z(n6) );
  HS65_LS_BFX9 U7 ( .A(n8), .Z(n7) );
  HS65_LS_BFX9 U8 ( .A(req_n), .Z(n8) );
  HS65_LSS_XOR2X6 U9 ( .A(\chan_internal_f[REQ] ), .B(\chan_in_b[ACK] ), .Z(
        data_in_valid) );
endmodule


module hpu_comb_0_3 ( data_valid, data_in, data_out, sel );
  input [33:0] data_in;
  output [33:0] data_out;
  output [4:0] sel;
  input data_valid;
  wire   N17, N18, N19, N21, N22, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n1, n38,
         n39, n40, n41, n42, n43, n44;
  assign data_out[33] = data_in[33];
  assign data_out[32] = data_in[32];
  assign sel[3] = 1'b0;

  HS65_LS_LDHQX9 \sel_reg[4]  ( .G(N22), .D(N21), .Q(sel[4]) );
  HS65_LS_LDHQX9 \sel_reg[2]  ( .G(N22), .D(N19), .Q(sel[2]) );
  HS65_LS_LDHQX9 \sel_reg[1]  ( .G(N22), .D(N18), .Q(sel[1]) );
  HS65_LS_LDHQX9 \sel_reg[0]  ( .G(N22), .D(N17), .Q(sel[0]) );
  HS65_LS_NOR2X5 U4 ( .A(n42), .B(n37), .Z(N17) );
  HS65_LS_NOR2X5 U5 ( .A(n42), .B(n35), .Z(N21) );
  HS65_LS_BFX18 U6 ( .A(n34), .Z(n1) );
  HS65_LS_NOR2AX6 U7 ( .A(data_in[33]), .B(data_in[32]), .Z(n34) );
  HS65_LH_NOR2AX3 U8 ( .A(data_valid), .B(data_in[32]), .Z(N22) );
  HS65_LS_IVX9 U9 ( .A(n44), .Z(n39) );
  HS65_LS_IVX9 U10 ( .A(n44), .Z(n38) );
  HS65_LS_BFX9 U11 ( .A(n43), .Z(n41) );
  HS65_LS_IVX9 U12 ( .A(n44), .Z(n40) );
  HS65_LS_BFX9 U13 ( .A(n43), .Z(n42) );
  HS65_LS_OAI22X6 U14 ( .A(n44), .B(n25), .C(n38), .D(n27), .Z(data_out[6]) );
  HS65_LS_OAI22X6 U15 ( .A(n24), .B(n42), .C(n38), .D(n26), .Z(data_out[7]) );
  HS65_LS_OAI22X6 U16 ( .A(n42), .B(n31), .C(n40), .D(n33), .Z(data_out[0]) );
  HS65_LS_OAI22X6 U17 ( .A(n41), .B(n30), .C(n39), .D(n32), .Z(data_out[1]) );
  HS65_LS_OAI22X6 U18 ( .A(n41), .B(n29), .C(n38), .D(n31), .Z(data_out[2]) );
  HS65_LS_OAI22X6 U19 ( .A(n41), .B(n28), .C(n38), .D(n30), .Z(data_out[3]) );
  HS65_LS_OAI22X6 U20 ( .A(n41), .B(n27), .C(n38), .D(n29), .Z(data_out[4]) );
  HS65_LS_OAI22X6 U21 ( .A(n41), .B(n26), .C(n39), .D(n28), .Z(data_out[5]) );
  HS65_LS_OAI22X6 U22 ( .A(n41), .B(n23), .C(n38), .D(n25), .Z(data_out[8]) );
  HS65_LS_OAI22X6 U23 ( .A(n41), .B(n22), .C(n38), .D(n24), .Z(data_out[9]) );
  HS65_LS_OAI22X6 U24 ( .A(n42), .B(n21), .C(n40), .D(n23), .Z(data_out[10])
         );
  HS65_LS_OAI22X6 U25 ( .A(n42), .B(n20), .C(n40), .D(n22), .Z(data_out[11])
         );
  HS65_LS_OAI22X6 U26 ( .A(n42), .B(n19), .C(n40), .D(n21), .Z(data_out[12])
         );
  HS65_LS_OAI22X6 U27 ( .A(n42), .B(n18), .C(n40), .D(n20), .Z(data_out[13])
         );
  HS65_LS_OAI22X6 U28 ( .A(n42), .B(n17), .C(n40), .D(n19), .Z(data_out[14])
         );
  HS65_LS_OAI22X6 U29 ( .A(n42), .B(n16), .C(n39), .D(n18), .Z(data_out[15])
         );
  HS65_LS_OAI22X6 U30 ( .A(n42), .B(n15), .C(n39), .D(n17), .Z(data_out[16])
         );
  HS65_LS_OAI22X6 U31 ( .A(n41), .B(n14), .C(n39), .D(n16), .Z(data_out[17])
         );
  HS65_LS_OAI22X6 U32 ( .A(n41), .B(n13), .C(n39), .D(n15), .Z(data_out[18])
         );
  HS65_LS_OAI22X6 U33 ( .A(n41), .B(n12), .C(n39), .D(n14), .Z(data_out[19])
         );
  HS65_LS_OAI22X6 U34 ( .A(n41), .B(n11), .C(n39), .D(n13), .Z(data_out[20])
         );
  HS65_LS_OAI22X6 U35 ( .A(n41), .B(n10), .C(n39), .D(n12), .Z(data_out[21])
         );
  HS65_LS_OAI22X6 U36 ( .A(n41), .B(n9), .C(n39), .D(n11), .Z(data_out[22]) );
  HS65_LS_OAI22X6 U37 ( .A(n41), .B(n8), .C(n39), .D(n10), .Z(data_out[23]) );
  HS65_LS_OAI22X6 U38 ( .A(n41), .B(n7), .C(n39), .D(n9), .Z(data_out[24]) );
  HS65_LS_OAI22X6 U39 ( .A(n41), .B(n6), .C(n38), .D(n8), .Z(data_out[25]) );
  HS65_LS_OAI22X6 U40 ( .A(n41), .B(n5), .C(n38), .D(n7), .Z(data_out[26]) );
  HS65_LS_OAI22X6 U41 ( .A(n41), .B(n4), .C(n38), .D(n6), .Z(data_out[27]) );
  HS65_LS_OAI22X6 U42 ( .A(n41), .B(n3), .C(n38), .D(n5), .Z(data_out[28]) );
  HS65_LS_OAI22X6 U43 ( .A(n41), .B(n2), .C(n38), .D(n4), .Z(data_out[29]) );
  HS65_LS_IVX9 U44 ( .A(n1), .Z(n43) );
  HS65_LS_NOR2X6 U45 ( .A(n40), .B(n3), .Z(data_out[30]) );
  HS65_LS_NOR2X6 U46 ( .A(n40), .B(n2), .Z(data_out[31]) );
  HS65_LS_IVX9 U47 ( .A(n1), .Z(n44) );
  HS65_LS_NAND3X5 U48 ( .A(n37), .B(n35), .C(n40), .Z(n36) );
  HS65_LS_NAND2X7 U49 ( .A(n32), .B(n33), .Z(n37) );
  HS65_LS_NOR2X6 U50 ( .A(n33), .B(n36), .Z(N18) );
  HS65_LS_IVX9 U51 ( .A(data_in[0]), .Z(n33) );
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
  HS65_LS_IVX9 U82 ( .A(data_in[1]), .Z(n32) );
  HS65_LS_NAND2X7 U83 ( .A(data_in[1]), .B(data_in[0]), .Z(n35) );
  HS65_LS_NOR2X6 U84 ( .A(data_in[0]), .B(n36), .Z(N19) );
endmodule


module sr_latch_0_2 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LH_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_2 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_2 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_2 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, not_Ain;
  assign Rout = Aout;

  c_gate_0_2 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LSS_XOR2X6 U1 ( .A(Aout), .B(Ain), .Z(lt_en) );
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
  wire   lt_en, N5, n1, n3;

  latch_controller_1_2 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N5), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N5), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N5), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N5), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N5), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N5), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N5), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N5), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N5), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N5), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N5), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N5), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N5), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N5), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N5), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N5), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N5), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N5), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N5), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX9 \data_reg[12]  ( .G(N5), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N5), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N5), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N5), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N5), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N5), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N5), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N5), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N5), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N5), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N5), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N5), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N5), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LH_LDHQX9 \data_reg[32]  ( .G(N5), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LH_LDLRQX9 type_out_reg ( .D(\left_in[DATA][33] ), .GN(lt_en), .RN(n1), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(lt_en), .B(n3), .C(n1), .Z(N5) );
  HS65_LH_IVX2 U5 ( .A(\left_in[DATA][33] ), .Z(n3) );
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
  wire   n10, \chan_internal_f[REQ] , \chan_internal_f[DATA][33] ,
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
         \chan_internal_f[DATA][0] , data_in_valid, req_n, n1, n2, n3, n4, n5,
         n6, n7, n8;
  assign sel[3] = 1'b0;

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
        \chan_internal_f[DATA][0] }), .sel({sel[4], n10, sel[2:0]}) );
  channel_latch_1_xxxxxxxxx_2 token_latch ( .preset(preset), .left_in({
        \chan_internal_f[REQ] , \chan_internal_f[DATA][33] , 
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
        \chan_internal_f[DATA][0] }), .left_out(\chan_in_b[ACK] ), .right_out(
        {\chan_out_f[REQ] , \chan_out_f[DATA][33] , \chan_out_f[DATA][32] , 
        \chan_out_f[DATA][31] , \chan_out_f[DATA][30] , \chan_out_f[DATA][29] , 
        \chan_out_f[DATA][28] , \chan_out_f[DATA][27] , \chan_out_f[DATA][26] , 
        \chan_out_f[DATA][25] , \chan_out_f[DATA][24] , \chan_out_f[DATA][23] , 
        \chan_out_f[DATA][22] , \chan_out_f[DATA][21] , \chan_out_f[DATA][20] , 
        \chan_out_f[DATA][19] , \chan_out_f[DATA][18] , \chan_out_f[DATA][17] , 
        \chan_out_f[DATA][16] , \chan_out_f[DATA][15] , \chan_out_f[DATA][14] , 
        \chan_out_f[DATA][13] , \chan_out_f[DATA][12] , \chan_out_f[DATA][11] , 
        \chan_out_f[DATA][10] , \chan_out_f[DATA][9] , \chan_out_f[DATA][8] , 
        \chan_out_f[DATA][7] , \chan_out_f[DATA][6] , \chan_out_f[DATA][5] , 
        \chan_out_f[DATA][4] , \chan_out_f[DATA][3] , \chan_out_f[DATA][2] , 
        \chan_out_f[DATA][1] , \chan_out_f[DATA][0] }), .right_in(
        \chan_out_b[ACK] ) );
  HS65_LS_IVX9 I_0 ( .A(\chan_in_f[REQ] ), .Z(req_n) );
  HS65_LS_IVX9 I_1 ( .A(n2), .Z(\chan_internal_f[REQ] ) );
  HS65_LS_IVX9 U1 ( .A(n3), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(n1), .Z(n2) );
  HS65_LS_BFX9 U3 ( .A(n4), .Z(n3) );
  HS65_LS_BFX9 U4 ( .A(n5), .Z(n4) );
  HS65_LS_BFX9 U5 ( .A(n6), .Z(n5) );
  HS65_LS_BFX9 U6 ( .A(n7), .Z(n6) );
  HS65_LS_BFX9 U7 ( .A(n8), .Z(n7) );
  HS65_LS_BFX9 U8 ( .A(req_n), .Z(n8) );
  HS65_LSS_XOR2X6 U9 ( .A(\chan_internal_f[REQ] ), .B(\chan_in_b[ACK] ), .Z(
        data_in_valid) );
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
  assign sel[4] = 1'b0;

  HS65_LS_LDHQX9 \sel_reg[3]  ( .G(N16), .D(N15), .Q(sel[3]) );
  HS65_LS_LDHQX9 \sel_reg[2]  ( .G(N16), .D(N14), .Q(sel[2]) );
  HS65_LS_LDHQX9 \sel_reg[1]  ( .G(N16), .D(N13), .Q(sel[1]) );
  HS65_LS_LDHQX9 \sel_reg[0]  ( .G(N16), .D(N12), .Q(sel[0]) );
  HS65_LS_NOR2X5 U4 ( .A(n42), .B(n36), .Z(N12) );
  HS65_LS_NOR2X5 U5 ( .A(n42), .B(n37), .Z(N13) );
  HS65_LS_BFX18 U6 ( .A(n34), .Z(n1) );
  HS65_LS_NOR2AX6 U7 ( .A(data_in[33]), .B(data_in[32]), .Z(n34) );
  HS65_LH_NOR2AX3 U8 ( .A(data_valid), .B(data_in[32]), .Z(N16) );
  HS65_LS_IVX9 U9 ( .A(n44), .Z(n39) );
  HS65_LS_IVX9 U10 ( .A(n44), .Z(n38) );
  HS65_LS_BFX9 U11 ( .A(n43), .Z(n41) );
  HS65_LS_IVX9 U12 ( .A(n44), .Z(n40) );
  HS65_LS_BFX9 U13 ( .A(n43), .Z(n42) );
  HS65_LS_OAI22X6 U14 ( .A(n44), .B(n25), .C(n38), .D(n27), .Z(data_out[6]) );
  HS65_LS_OAI22X6 U15 ( .A(n24), .B(n42), .C(n38), .D(n26), .Z(data_out[7]) );
  HS65_LS_OAI22X6 U16 ( .A(n42), .B(n31), .C(n40), .D(n33), .Z(data_out[0]) );
  HS65_LS_OAI22X6 U17 ( .A(n41), .B(n30), .C(n39), .D(n32), .Z(data_out[1]) );
  HS65_LS_OAI22X6 U18 ( .A(n41), .B(n29), .C(n38), .D(n31), .Z(data_out[2]) );
  HS65_LS_OAI22X6 U19 ( .A(n41), .B(n28), .C(n38), .D(n30), .Z(data_out[3]) );
  HS65_LS_OAI22X6 U20 ( .A(n41), .B(n27), .C(n38), .D(n29), .Z(data_out[4]) );
  HS65_LS_OAI22X6 U21 ( .A(n41), .B(n26), .C(n39), .D(n28), .Z(data_out[5]) );
  HS65_LS_OAI22X6 U22 ( .A(n41), .B(n23), .C(n38), .D(n25), .Z(data_out[8]) );
  HS65_LS_OAI22X6 U23 ( .A(n41), .B(n22), .C(n38), .D(n24), .Z(data_out[9]) );
  HS65_LS_OAI22X6 U24 ( .A(n42), .B(n21), .C(n40), .D(n23), .Z(data_out[10])
         );
  HS65_LS_OAI22X6 U25 ( .A(n42), .B(n20), .C(n40), .D(n22), .Z(data_out[11])
         );
  HS65_LS_OAI22X6 U26 ( .A(n42), .B(n19), .C(n40), .D(n21), .Z(data_out[12])
         );
  HS65_LS_OAI22X6 U27 ( .A(n42), .B(n18), .C(n40), .D(n20), .Z(data_out[13])
         );
  HS65_LS_OAI22X6 U28 ( .A(n42), .B(n17), .C(n40), .D(n19), .Z(data_out[14])
         );
  HS65_LS_OAI22X6 U29 ( .A(n42), .B(n16), .C(n39), .D(n18), .Z(data_out[15])
         );
  HS65_LS_OAI22X6 U30 ( .A(n42), .B(n15), .C(n39), .D(n17), .Z(data_out[16])
         );
  HS65_LS_OAI22X6 U31 ( .A(n41), .B(n14), .C(n39), .D(n16), .Z(data_out[17])
         );
  HS65_LS_OAI22X6 U32 ( .A(n41), .B(n13), .C(n39), .D(n15), .Z(data_out[18])
         );
  HS65_LS_OAI22X6 U33 ( .A(n41), .B(n12), .C(n39), .D(n14), .Z(data_out[19])
         );
  HS65_LS_OAI22X6 U34 ( .A(n41), .B(n11), .C(n39), .D(n13), .Z(data_out[20])
         );
  HS65_LS_OAI22X6 U35 ( .A(n41), .B(n10), .C(n39), .D(n12), .Z(data_out[21])
         );
  HS65_LS_OAI22X6 U36 ( .A(n41), .B(n9), .C(n39), .D(n11), .Z(data_out[22]) );
  HS65_LS_OAI22X6 U37 ( .A(n41), .B(n8), .C(n39), .D(n10), .Z(data_out[23]) );
  HS65_LS_OAI22X6 U38 ( .A(n41), .B(n7), .C(n39), .D(n9), .Z(data_out[24]) );
  HS65_LS_OAI22X6 U39 ( .A(n41), .B(n6), .C(n38), .D(n8), .Z(data_out[25]) );
  HS65_LS_OAI22X6 U40 ( .A(n41), .B(n5), .C(n38), .D(n7), .Z(data_out[26]) );
  HS65_LS_OAI22X6 U41 ( .A(n41), .B(n4), .C(n38), .D(n6), .Z(data_out[27]) );
  HS65_LS_OAI22X6 U42 ( .A(n41), .B(n3), .C(n38), .D(n5), .Z(data_out[28]) );
  HS65_LS_OAI22X6 U43 ( .A(n41), .B(n2), .C(n38), .D(n4), .Z(data_out[29]) );
  HS65_LS_IVX9 U44 ( .A(n1), .Z(n43) );
  HS65_LS_NOR2X6 U45 ( .A(n40), .B(n3), .Z(data_out[30]) );
  HS65_LS_NOR2X6 U46 ( .A(n40), .B(n2), .Z(data_out[31]) );
  HS65_LS_IVX9 U47 ( .A(n1), .Z(n44) );
  HS65_LS_NAND3X5 U48 ( .A(n36), .B(n37), .C(n40), .Z(n35) );
  HS65_LS_NAND2X7 U49 ( .A(n32), .B(n33), .Z(n36) );
  HS65_LS_NOR2X6 U50 ( .A(n33), .B(n35), .Z(N15) );
  HS65_LS_IVX9 U51 ( .A(data_in[0]), .Z(n33) );
  HS65_LS_IVX9 U52 ( .A(data_in[1]), .Z(n32) );
  HS65_LS_IVX9 U53 ( .A(data_in[9]), .Z(n24) );
  HS65_LS_IVX9 U54 ( .A(data_in[2]), .Z(n31) );
  HS65_LS_IVX9 U55 ( .A(data_in[3]), .Z(n30) );
  HS65_LS_IVX9 U56 ( .A(data_in[4]), .Z(n29) );
  HS65_LS_IVX9 U57 ( .A(data_in[5]), .Z(n28) );
  HS65_LS_IVX9 U58 ( .A(data_in[6]), .Z(n27) );
  HS65_LS_IVX9 U59 ( .A(data_in[7]), .Z(n26) );
  HS65_LS_IVX9 U60 ( .A(data_in[8]), .Z(n25) );
  HS65_LS_IVX9 U61 ( .A(data_in[10]), .Z(n23) );
  HS65_LS_IVX9 U62 ( .A(data_in[11]), .Z(n22) );
  HS65_LS_IVX9 U63 ( .A(data_in[12]), .Z(n21) );
  HS65_LS_IVX9 U64 ( .A(data_in[13]), .Z(n20) );
  HS65_LS_IVX9 U65 ( .A(data_in[14]), .Z(n19) );
  HS65_LS_IVX9 U66 ( .A(data_in[15]), .Z(n18) );
  HS65_LS_IVX9 U67 ( .A(data_in[16]), .Z(n17) );
  HS65_LS_IVX9 U68 ( .A(data_in[17]), .Z(n16) );
  HS65_LS_IVX9 U69 ( .A(data_in[18]), .Z(n15) );
  HS65_LS_IVX9 U70 ( .A(data_in[19]), .Z(n14) );
  HS65_LS_IVX9 U71 ( .A(data_in[20]), .Z(n13) );
  HS65_LS_IVX9 U72 ( .A(data_in[21]), .Z(n12) );
  HS65_LS_IVX9 U73 ( .A(data_in[22]), .Z(n11) );
  HS65_LS_IVX9 U74 ( .A(data_in[23]), .Z(n10) );
  HS65_LS_IVX9 U75 ( .A(data_in[24]), .Z(n9) );
  HS65_LS_IVX9 U76 ( .A(data_in[25]), .Z(n8) );
  HS65_LS_IVX9 U77 ( .A(data_in[26]), .Z(n7) );
  HS65_LS_IVX9 U78 ( .A(data_in[27]), .Z(n6) );
  HS65_LS_IVX9 U79 ( .A(data_in[28]), .Z(n5) );
  HS65_LS_IVX9 U80 ( .A(data_in[29]), .Z(n4) );
  HS65_LS_IVX9 U81 ( .A(data_in[30]), .Z(n3) );
  HS65_LS_IVX9 U82 ( .A(data_in[31]), .Z(n2) );
  HS65_LS_NAND2X7 U83 ( .A(data_in[0]), .B(n32), .Z(n37) );
  HS65_LS_NOR2X6 U84 ( .A(data_in[0]), .B(n35), .Z(N14) );
endmodule


module sr_latch_0_1 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_1 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_1 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_1 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, not_Ain;
  assign Rout = Aout;

  c_gate_0_1 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Aout) );
  HS65_LH_IVX2 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LSS_XOR2X6 U1 ( .A(Aout), .B(Ain), .Z(lt_en) );
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
  wire   lt_en, N5, n1, n3;

  latch_controller_1_1 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N5), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N5), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N5), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N5), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N5), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N5), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N5), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N5), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N5), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N5), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N5), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N5), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N5), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N5), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N5), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N5), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N5), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N5), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N5), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX9 \data_reg[12]  ( .G(N5), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N5), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N5), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N5), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N5), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N5), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N5), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N5), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N5), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N5), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N5), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N5), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N5), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LH_LDHQX9 \data_reg[32]  ( .G(N5), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LH_LDLRQX9 type_out_reg ( .D(\left_in[DATA][33] ), .GN(lt_en), .RN(n1), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(lt_en), .B(n3), .C(n1), .Z(N5) );
  HS65_LH_IVX2 U5 ( .A(\left_in[DATA][33] ), .Z(n3) );
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
  wire   n10, \chan_internal_f[REQ] , \chan_internal_f[DATA][33] ,
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
         \chan_internal_f[DATA][0] , data_in_valid, req_n, n1, n2, n3, n4, n5,
         n6, n7, n8;
  assign sel[4] = 1'b0;

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
        \chan_internal_f[DATA][0] }), .sel({n10, sel[3:0]}) );
  channel_latch_1_xxxxxxxxx_1 token_latch ( .preset(preset), .left_in({
        \chan_internal_f[REQ] , \chan_internal_f[DATA][33] , 
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
        \chan_internal_f[DATA][0] }), .left_out(\chan_in_b[ACK] ), .right_out(
        {\chan_out_f[REQ] , \chan_out_f[DATA][33] , \chan_out_f[DATA][32] , 
        \chan_out_f[DATA][31] , \chan_out_f[DATA][30] , \chan_out_f[DATA][29] , 
        \chan_out_f[DATA][28] , \chan_out_f[DATA][27] , \chan_out_f[DATA][26] , 
        \chan_out_f[DATA][25] , \chan_out_f[DATA][24] , \chan_out_f[DATA][23] , 
        \chan_out_f[DATA][22] , \chan_out_f[DATA][21] , \chan_out_f[DATA][20] , 
        \chan_out_f[DATA][19] , \chan_out_f[DATA][18] , \chan_out_f[DATA][17] , 
        \chan_out_f[DATA][16] , \chan_out_f[DATA][15] , \chan_out_f[DATA][14] , 
        \chan_out_f[DATA][13] , \chan_out_f[DATA][12] , \chan_out_f[DATA][11] , 
        \chan_out_f[DATA][10] , \chan_out_f[DATA][9] , \chan_out_f[DATA][8] , 
        \chan_out_f[DATA][7] , \chan_out_f[DATA][6] , \chan_out_f[DATA][5] , 
        \chan_out_f[DATA][4] , \chan_out_f[DATA][3] , \chan_out_f[DATA][2] , 
        \chan_out_f[DATA][1] , \chan_out_f[DATA][0] }), .right_in(
        \chan_out_b[ACK] ) );
  HS65_LS_IVX9 I_0 ( .A(\chan_in_f[REQ] ), .Z(req_n) );
  HS65_LS_IVX9 I_1 ( .A(n2), .Z(\chan_internal_f[REQ] ) );
  HS65_LS_IVX9 U1 ( .A(n3), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(n1), .Z(n2) );
  HS65_LS_BFX9 U3 ( .A(n4), .Z(n3) );
  HS65_LS_BFX9 U4 ( .A(n5), .Z(n4) );
  HS65_LS_BFX9 U5 ( .A(n6), .Z(n5) );
  HS65_LS_BFX9 U6 ( .A(n7), .Z(n6) );
  HS65_LS_BFX9 U7 ( .A(n8), .Z(n7) );
  HS65_LS_BFX9 U8 ( .A(req_n), .Z(n8) );
  HS65_LSS_XOR2X6 U9 ( .A(\chan_internal_f[REQ] ), .B(\chan_in_b[ACK] ), .Z(
        data_in_valid) );
endmodule


module sr_latch_1_0 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n2;

  HS65_LS_AND2X4 C8 ( .A(n2), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(qn), .Z(N1) );
  HS65_LS_IVX9 U2 ( .A(r), .Z(n2) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_generic_1_5_0 ( preset, \input , \output  );
  input [4:0] \input ;
  input preset;
  output \output ;
  wire   set, reset, n1, n2, n3;

  sr_latch_1_0 latch ( .s(set), .r(reset), .q(\output ) );
  HS65_LS_NOR4ABX2 U3 ( .A(n1), .B(n3), .C(\input [2]), .D(\input [1]), .Z(
        reset) );
  HS65_LS_IVX9 U4 ( .A(\input [0]), .Z(n1) );
  HS65_LS_NOR3X4 U5 ( .A(\input [3]), .B(preset), .C(\input [4]), .Z(n3) );
  HS65_LS_AO31X9 U6 ( .A(n2), .B(\input [3]), .C(\input [4]), .D(preset), .Z(
        set) );
  HS65_LS_AND3X9 U7 ( .A(\input [1]), .B(\input [0]), .C(\input [2]), .Z(n2)
         );
endmodule


module sr_latch_1_6 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LH_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(qn), .Z(N1) );
  HS65_LS_IVX9 U2 ( .A(r), .Z(n1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_generic_1_5_1 ( preset, \input , \output  );
  input [4:0] \input ;
  input preset;
  output \output ;
  wire   set, reset, n4, n5, n6;

  sr_latch_1_6 latch ( .s(set), .r(reset), .q(\output ) );
  HS65_LS_NOR4ABX2 U3 ( .A(n6), .B(n4), .C(\input [2]), .D(\input [1]), .Z(
        reset) );
  HS65_LS_IVX9 U4 ( .A(\input [0]), .Z(n6) );
  HS65_LS_NOR3X4 U5 ( .A(\input [3]), .B(preset), .C(\input [4]), .Z(n4) );
  HS65_LS_AO31X9 U6 ( .A(n5), .B(\input [3]), .C(\input [4]), .D(preset), .Z(
        set) );
  HS65_LS_AND3X9 U7 ( .A(\input [1]), .B(\input [0]), .C(\input [2]), .Z(n5)
         );
endmodule


module crossbar_x0_y0 ( preset, .switch_sel({\switch_sel[4][4] , 
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
  wire   \chs_in_b[4][ACK] , synced_req, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326;
  assign \chs_in_b[0][ACK]  = \chs_in_b[4][ACK] ;
  assign \chs_in_b[1][ACK]  = \chs_in_b[4][ACK] ;
  assign \chs_in_b[2][ACK]  = \chs_in_b[4][ACK] ;
  assign \chs_in_b[3][ACK]  = \chs_in_b[4][ACK] ;
  assign \chs_out_f[0][REQ]  = synced_req;
  assign \chs_out_f[1][REQ]  = synced_req;
  assign \chs_out_f[2][REQ]  = synced_req;
  assign \chs_out_f[3][REQ]  = synced_req;
  assign \chs_out_f[4][REQ]  = synced_req;

  c_gate_generic_1_5_0 c_sync_req ( .preset(preset), .\input ({
        \chs_in_f[4][REQ] , \chs_in_f[3][REQ] , \chs_in_f[2][REQ] , 
        \chs_in_f[1][REQ] , \chs_in_f[0][REQ] }), .\output (synced_req) );
  c_gate_generic_1_5_1 c_sync_ack ( .preset(preset), .\input ({
        \chs_out_b[4][ACK] , \chs_out_b[3][ACK] , \chs_out_b[2][ACK] , 
        \chs_out_b[1][ACK] , \chs_out_b[0][ACK] }), .\output (
        \chs_in_b[4][ACK] ) );
  HS65_LS_OAI212X3 U2 ( .A(n262), .B(n48), .C(n277), .D(n14), .E(n89), .Z(
        \chs_out_f[4][DATA][30] ) );
  HS65_LS_OAI212X3 U3 ( .A(n263), .B(n46), .C(n277), .D(n12), .E(n87), .Z(
        \chs_out_f[4][DATA][32] ) );
  HS65_LS_AOI222X2 U4 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][30] ), 
        .C(n285), .D(\chs_in_f[0][DATA][30] ), .E(n301), .F(
        \chs_in_f[1][DATA][30] ), .Z(n157) );
  HS65_LS_AOI222X2 U5 ( .A(n317), .B(\chs_in_f[2][DATA][30] ), .C(n281), .D(
        \chs_in_f[0][DATA][30] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][30] ), .Z(n191) );
  HS65_LS_AOI222X2 U6 ( .A(\chs_in_f[2][DATA][30] ), .B(n324), .C(
        \chs_in_f[0][DATA][30] ), .D(n293), .E(\chs_in_f[1][DATA][30] ), .F(
        n308), .Z(n89) );
  HS65_LS_AOI222X2 U7 ( .A(\chs_in_f[2][DATA][32] ), .B(n324), .C(
        \chs_in_f[0][DATA][32] ), .D(n294), .E(\chs_in_f[1][DATA][32] ), .F(
        n308), .Z(n87) );
  HS65_LS_AOI222X2 U8 ( .A(\chs_in_f[2][DATA][4] ), .B(n324), .C(
        \chs_in_f[0][DATA][4] ), .D(n294), .E(\chs_in_f[1][DATA][4] ), .F(n308), .Z(n84) );
  HS65_LS_AOI222X2 U9 ( .A(\chs_in_f[2][DATA][8] ), .B(n324), .C(
        \chs_in_f[0][DATA][8] ), .D(n294), .E(\chs_in_f[1][DATA][8] ), .F(n308), .Z(n80) );
  HS65_LS_AOI222X2 U10 ( .A(\chs_in_f[2][DATA][10] ), .B(n326), .C(
        \chs_in_f[0][DATA][10] ), .D(n292), .E(\chs_in_f[1][DATA][10] ), .F(
        n310), .Z(n111) );
  HS65_LS_AOI222X2 U11 ( .A(\chs_in_f[2][DATA][12] ), .B(n326), .C(
        \chs_in_f[0][DATA][12] ), .D(n292), .E(\chs_in_f[1][DATA][12] ), .F(
        n310), .Z(n109) );
  HS65_LS_AOI222X2 U12 ( .A(\chs_in_f[2][DATA][14] ), .B(n326), .C(
        \chs_in_f[0][DATA][14] ), .D(n292), .E(\chs_in_f[1][DATA][14] ), .F(
        n310), .Z(n107) );
  HS65_LS_AOI222X2 U13 ( .A(n318), .B(\chs_in_f[2][DATA][32] ), .C(n282), .D(
        \chs_in_f[0][DATA][32] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][32] ), .Z(n189) );
  HS65_LS_AOI222X2 U14 ( .A(n314), .B(\chs_in_f[2][DATA][32] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][32] ), .E(n298), .F(
        \chs_in_f[1][DATA][32] ), .Z(n223) );
  HS65_LS_AOI222X2 U15 ( .A(\chs_in_f[2][DATA][0] ), .B(n326), .C(
        \chs_in_f[0][DATA][0] ), .D(n292), .E(\chs_in_f[1][DATA][0] ), .F(n310), .Z(n112) );
  HS65_LS_BFX9 U16 ( .A(n6), .Z(n261) );
  HS65_LS_BFX9 U17 ( .A(n6), .Z(n262) );
  HS65_LS_BFX9 U18 ( .A(n307), .Z(n308) );
  HS65_LS_BFX9 U19 ( .A(n307), .Z(n309) );
  HS65_LS_BFX9 U20 ( .A(n323), .Z(n324) );
  HS65_LS_BFX9 U21 ( .A(n323), .Z(n325) );
  HS65_LS_BFX9 U22 ( .A(n291), .Z(n292) );
  HS65_LS_BFX9 U23 ( .A(n291), .Z(n293) );
  HS65_LS_BFX9 U24 ( .A(n8), .Z(n255) );
  HS65_LS_BFX9 U25 ( .A(n8), .Z(n256) );
  HS65_LS_BFX9 U26 ( .A(n9), .Z(n252) );
  HS65_LS_BFX9 U27 ( .A(n9), .Z(n253) );
  HS65_LS_BFX9 U28 ( .A(n10), .Z(n249) );
  HS65_LS_BFX9 U29 ( .A(n10), .Z(n250) );
  HS65_LS_BFX9 U30 ( .A(n303), .Z(n304) );
  HS65_LS_BFX9 U31 ( .A(n303), .Z(n305) );
  HS65_LS_BFX9 U32 ( .A(n299), .Z(n300) );
  HS65_LS_BFX9 U33 ( .A(n299), .Z(n301) );
  HS65_LS_BFX9 U34 ( .A(n295), .Z(n296) );
  HS65_LS_BFX9 U35 ( .A(n295), .Z(n297) );
  HS65_LS_BFX9 U36 ( .A(n319), .Z(n320) );
  HS65_LS_BFX9 U37 ( .A(n319), .Z(n321) );
  HS65_LS_BFX9 U38 ( .A(n315), .Z(n316) );
  HS65_LS_BFX9 U39 ( .A(n315), .Z(n317) );
  HS65_LS_BFX9 U40 ( .A(n311), .Z(n312) );
  HS65_LS_BFX9 U41 ( .A(n311), .Z(n313) );
  HS65_LS_BFX9 U42 ( .A(n287), .Z(n288) );
  HS65_LS_BFX9 U43 ( .A(n287), .Z(n289) );
  HS65_LS_BFX9 U44 ( .A(n283), .Z(n284) );
  HS65_LS_BFX9 U45 ( .A(n283), .Z(n285) );
  HS65_LS_BFX9 U46 ( .A(n279), .Z(n280) );
  HS65_LS_BFX9 U47 ( .A(n279), .Z(n281) );
  HS65_LS_BFX9 U48 ( .A(n6), .Z(n263) );
  HS65_LS_BFX9 U49 ( .A(n2), .Z(n273) );
  HS65_LS_BFX9 U50 ( .A(n2), .Z(n274) );
  HS65_LS_BFX9 U51 ( .A(n3), .Z(n270) );
  HS65_LS_BFX9 U52 ( .A(n3), .Z(n271) );
  HS65_LS_BFX9 U53 ( .A(n4), .Z(n267) );
  HS65_LS_BFX9 U54 ( .A(n4), .Z(n268) );
  HS65_LS_BFX9 U55 ( .A(n5), .Z(n264) );
  HS65_LS_BFX9 U56 ( .A(n5), .Z(n265) );
  HS65_LS_BFX9 U57 ( .A(n291), .Z(n294) );
  HS65_LS_BFX9 U58 ( .A(n303), .Z(n306) );
  HS65_LS_BFX9 U59 ( .A(n299), .Z(n302) );
  HS65_LS_BFX9 U60 ( .A(n295), .Z(n298) );
  HS65_LS_BFX9 U61 ( .A(n319), .Z(n322) );
  HS65_LS_BFX9 U62 ( .A(n315), .Z(n318) );
  HS65_LS_BFX9 U63 ( .A(n311), .Z(n314) );
  HS65_LS_BFX9 U64 ( .A(n2), .Z(n275) );
  HS65_LS_BFX9 U65 ( .A(n3), .Z(n272) );
  HS65_LS_BFX9 U66 ( .A(n4), .Z(n269) );
  HS65_LS_BFX9 U67 ( .A(n5), .Z(n266) );
  HS65_LS_BFX9 U68 ( .A(n287), .Z(n290) );
  HS65_LS_BFX9 U69 ( .A(n283), .Z(n286) );
  HS65_LS_BFX9 U70 ( .A(n279), .Z(n282) );
  HS65_LS_BFX9 U71 ( .A(n8), .Z(n257) );
  HS65_LS_BFX9 U72 ( .A(n9), .Z(n254) );
  HS65_LS_BFX9 U73 ( .A(n10), .Z(n251) );
  HS65_LS_BFX9 U74 ( .A(n307), .Z(n310) );
  HS65_LS_BFX9 U75 ( .A(n323), .Z(n326) );
  HS65_LS_BFX9 U76 ( .A(n1), .Z(n276) );
  HS65_LS_BFX9 U77 ( .A(n1), .Z(n277) );
  HS65_LS_BFX9 U78 ( .A(n7), .Z(n258) );
  HS65_LS_BFX9 U79 ( .A(n7), .Z(n259) );
  HS65_LS_BFX9 U80 ( .A(n1), .Z(n278) );
  HS65_LS_BFX9 U81 ( .A(n7), .Z(n260) );
  HS65_LS_OAI212X5 U82 ( .A(n263), .B(n45), .C(n278), .D(n11), .E(n86), .Z(
        \chs_out_f[4][DATA][33] ) );
  HS65_LS_AOI222X2 U83 ( .A(\chs_in_f[2][DATA][33] ), .B(n324), .C(
        \chs_in_f[0][DATA][33] ), .D(n294), .E(\chs_in_f[1][DATA][33] ), .F(
        n308), .Z(n86) );
  HS65_LS_OAI212X5 U84 ( .A(n74), .B(n260), .C(n40), .D(n275), .E(n118), .Z(
        \chs_out_f[3][DATA][4] ) );
  HS65_LS_AOI222X2 U85 ( .A(n322), .B(\chs_in_f[2][DATA][4] ), .C(n290), .D(
        \chs_in_f[0][DATA][4] ), .E(n306), .F(\chs_in_f[1][DATA][4] ), .Z(n118) );
  HS65_LS_OAI212X5 U86 ( .A(n72), .B(n260), .C(n38), .D(n275), .E(n116), .Z(
        \chs_out_f[3][DATA][6] ) );
  HS65_LS_AOI222X2 U87 ( .A(n322), .B(\chs_in_f[2][DATA][6] ), .C(n290), .D(
        \chs_in_f[0][DATA][6] ), .E(n306), .F(\chs_in_f[1][DATA][6] ), .Z(n116) );
  HS65_LS_OAI212X5 U88 ( .A(n70), .B(n260), .C(n36), .D(n275), .E(n114), .Z(
        \chs_out_f[3][DATA][8] ) );
  HS65_LS_AOI222X2 U89 ( .A(n322), .B(\chs_in_f[2][DATA][8] ), .C(n290), .D(
        \chs_in_f[0][DATA][8] ), .E(n306), .F(\chs_in_f[1][DATA][8] ), .Z(n114) );
  HS65_LS_OAI212X5 U90 ( .A(n75), .B(n257), .C(n41), .D(n272), .E(n153), .Z(
        \chs_out_f[2][DATA][3] ) );
  HS65_LS_AOI222X2 U91 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][3] ), 
        .C(n286), .D(\chs_in_f[0][DATA][3] ), .E(n302), .F(
        \chs_in_f[1][DATA][3] ), .Z(n153) );
  HS65_LS_OAI212X5 U92 ( .A(n74), .B(n257), .C(n40), .D(n272), .E(n152), .Z(
        \chs_out_f[2][DATA][4] ) );
  HS65_LS_AOI222X2 U93 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][4] ), 
        .C(n286), .D(\chs_in_f[0][DATA][4] ), .E(n302), .F(
        \chs_in_f[1][DATA][4] ), .Z(n152) );
  HS65_LS_OAI212X5 U94 ( .A(n73), .B(n257), .C(n39), .D(n272), .E(n151), .Z(
        \chs_out_f[2][DATA][5] ) );
  HS65_LS_AOI222X2 U95 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][5] ), 
        .C(n286), .D(\chs_in_f[0][DATA][5] ), .E(n302), .F(
        \chs_in_f[1][DATA][5] ), .Z(n151) );
  HS65_LS_OAI212X5 U96 ( .A(n72), .B(n257), .C(n38), .D(n272), .E(n150), .Z(
        \chs_out_f[2][DATA][6] ) );
  HS65_LS_AOI222X2 U97 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][6] ), 
        .C(n286), .D(\chs_in_f[0][DATA][6] ), .E(n302), .F(
        \chs_in_f[1][DATA][6] ), .Z(n150) );
  HS65_LS_OAI212X5 U98 ( .A(n71), .B(n257), .C(n37), .D(n272), .E(n149), .Z(
        \chs_out_f[2][DATA][7] ) );
  HS65_LS_AOI222X2 U99 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][7] ), 
        .C(n286), .D(\chs_in_f[0][DATA][7] ), .E(n302), .F(
        \chs_in_f[1][DATA][7] ), .Z(n149) );
  HS65_LS_OAI212X5 U100 ( .A(n70), .B(n257), .C(n36), .D(n272), .E(n148), .Z(
        \chs_out_f[2][DATA][8] ) );
  HS65_LS_AOI222X2 U101 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][8] ), 
        .C(n286), .D(\chs_in_f[0][DATA][8] ), .E(n302), .F(
        \chs_in_f[1][DATA][8] ), .Z(n148) );
  HS65_LS_OAI212X5 U102 ( .A(n74), .B(n254), .C(n40), .D(n269), .E(n186), .Z(
        \chs_out_f[1][DATA][4] ) );
  HS65_LS_AOI222X2 U103 ( .A(n318), .B(\chs_in_f[2][DATA][4] ), .C(n282), .D(
        \chs_in_f[0][DATA][4] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][4] ), .Z(n186) );
  HS65_LS_OAI212X5 U104 ( .A(n72), .B(n254), .C(n38), .D(n269), .E(n184), .Z(
        \chs_out_f[1][DATA][6] ) );
  HS65_LS_AOI222X2 U105 ( .A(n318), .B(\chs_in_f[2][DATA][6] ), .C(n282), .D(
        \chs_in_f[0][DATA][6] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][6] ), .Z(n184) );
  HS65_LS_OAI212X5 U106 ( .A(n70), .B(n254), .C(n36), .D(n269), .E(n182), .Z(
        \chs_out_f[1][DATA][8] ) );
  HS65_LS_AOI222X2 U107 ( .A(n318), .B(\chs_in_f[2][DATA][8] ), .C(n282), .D(
        \chs_in_f[0][DATA][8] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][8] ), .Z(n182) );
  HS65_LS_OAI212X5 U108 ( .A(n45), .B(n257), .C(n11), .D(n272), .E(n154), .Z(
        \chs_out_f[2][DATA][33] ) );
  HS65_LS_AOI222X2 U109 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][33] ), 
        .C(n286), .D(\chs_in_f[0][DATA][33] ), .E(n302), .F(
        \chs_in_f[1][DATA][33] ), .Z(n154) );
  HS65_LS_OAI212X5 U110 ( .A(n45), .B(n254), .C(n11), .D(n269), .E(n188), .Z(
        \chs_out_f[1][DATA][33] ) );
  HS65_LS_AOI222X2 U111 ( .A(n318), .B(\chs_in_f[2][DATA][33] ), .C(n282), .D(
        \chs_in_f[0][DATA][33] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][33] ), .Z(n188) );
  HS65_LS_OAI212X5 U112 ( .A(n45), .B(n251), .C(n11), .D(n266), .E(n222), .Z(
        \chs_out_f[0][DATA][33] ) );
  HS65_LS_AOI222X2 U113 ( .A(n314), .B(\chs_in_f[2][DATA][33] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][33] ), .E(n298), .F(
        \chs_in_f[1][DATA][33] ), .Z(n222) );
  HS65_LS_OAI212X5 U114 ( .A(n45), .B(n260), .C(n11), .D(n275), .E(n120), .Z(
        \chs_out_f[3][DATA][33] ) );
  HS65_LS_AOI222X2 U115 ( .A(n322), .B(\chs_in_f[2][DATA][33] ), .C(n290), .D(
        \chs_in_f[0][DATA][33] ), .E(n306), .F(\chs_in_f[1][DATA][33] ), .Z(
        n120) );
  HS65_LS_OAI212X5 U116 ( .A(n78), .B(n249), .C(n44), .D(n264), .E(n248), .Z(
        \chs_out_f[0][DATA][0] ) );
  HS65_LS_AOI222X2 U117 ( .A(n312), .B(\chs_in_f[2][DATA][0] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][0] ), .E(n296), .F(
        \chs_in_f[1][DATA][0] ), .Z(n248) );
  HS65_LS_OAI212X5 U118 ( .A(n76), .B(n250), .C(n42), .D(n265), .E(n226), .Z(
        \chs_out_f[0][DATA][2] ) );
  HS65_LS_AOI222X2 U119 ( .A(n313), .B(\chs_in_f[2][DATA][2] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][2] ), .E(n297), .F(
        \chs_in_f[1][DATA][2] ), .Z(n226) );
  HS65_LS_OAI212X5 U120 ( .A(n68), .B(n249), .C(n34), .D(n264), .E(n247), .Z(
        \chs_out_f[0][DATA][10] ) );
  HS65_LS_AOI222X2 U121 ( .A(n312), .B(\chs_in_f[2][DATA][10] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][10] ), .E(n296), .F(
        \chs_in_f[1][DATA][10] ), .Z(n247) );
  HS65_LS_OAI212X5 U122 ( .A(n66), .B(n249), .C(n32), .D(n264), .E(n245), .Z(
        \chs_out_f[0][DATA][12] ) );
  HS65_LS_AOI222X2 U123 ( .A(n312), .B(\chs_in_f[2][DATA][12] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][12] ), .E(n296), .F(
        \chs_in_f[1][DATA][12] ), .Z(n245) );
  HS65_LS_OAI212X5 U124 ( .A(n64), .B(n249), .C(n30), .D(n264), .E(n243), .Z(
        \chs_out_f[0][DATA][14] ) );
  HS65_LS_AOI222X2 U125 ( .A(n312), .B(\chs_in_f[2][DATA][14] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][14] ), .E(n296), .F(
        \chs_in_f[1][DATA][14] ), .Z(n243) );
  HS65_LS_OAI212X5 U126 ( .A(n62), .B(n249), .C(n28), .D(n264), .E(n241), .Z(
        \chs_out_f[0][DATA][16] ) );
  HS65_LS_AOI222X2 U127 ( .A(n312), .B(\chs_in_f[2][DATA][16] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][16] ), .E(n296), .F(
        \chs_in_f[1][DATA][16] ), .Z(n241) );
  HS65_LS_OAI212X5 U128 ( .A(n60), .B(n249), .C(n26), .D(n264), .E(n239), .Z(
        \chs_out_f[0][DATA][18] ) );
  HS65_LS_AOI222X2 U129 ( .A(n312), .B(\chs_in_f[2][DATA][18] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][18] ), .E(n296), .F(
        \chs_in_f[1][DATA][18] ), .Z(n239) );
  HS65_LS_OAI212X5 U130 ( .A(n58), .B(n249), .C(n24), .D(n265), .E(n236), .Z(
        \chs_out_f[0][DATA][20] ) );
  HS65_LS_AOI222X2 U131 ( .A(n313), .B(\chs_in_f[2][DATA][20] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][20] ), .E(n297), .F(
        \chs_in_f[1][DATA][20] ), .Z(n236) );
  HS65_LS_OAI212X5 U132 ( .A(n56), .B(n250), .C(n22), .D(n265), .E(n234), .Z(
        \chs_out_f[0][DATA][22] ) );
  HS65_LS_AOI222X2 U133 ( .A(n313), .B(\chs_in_f[2][DATA][22] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][22] ), .E(n297), .F(
        \chs_in_f[1][DATA][22] ), .Z(n234) );
  HS65_LS_OAI212X5 U134 ( .A(n54), .B(n250), .C(n20), .D(n265), .E(n232), .Z(
        \chs_out_f[0][DATA][24] ) );
  HS65_LS_AOI222X2 U135 ( .A(n313), .B(\chs_in_f[2][DATA][24] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][24] ), .E(n297), .F(
        \chs_in_f[1][DATA][24] ), .Z(n232) );
  HS65_LS_OAI212X5 U136 ( .A(n52), .B(n250), .C(n18), .D(n265), .E(n230), .Z(
        \chs_out_f[0][DATA][26] ) );
  HS65_LS_AOI222X2 U137 ( .A(n313), .B(\chs_in_f[2][DATA][26] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][26] ), .E(n297), .F(
        \chs_in_f[1][DATA][26] ), .Z(n230) );
  HS65_LS_OAI212X5 U138 ( .A(n50), .B(n250), .C(n16), .D(n265), .E(n228), .Z(
        \chs_out_f[0][DATA][28] ) );
  HS65_LS_AOI222X2 U139 ( .A(n313), .B(\chs_in_f[2][DATA][28] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][28] ), .E(n297), .F(
        \chs_in_f[1][DATA][28] ), .Z(n228) );
  HS65_LS_OAI212X5 U140 ( .A(n48), .B(n250), .C(n14), .D(n265), .E(n225), .Z(
        \chs_out_f[0][DATA][30] ) );
  HS65_LS_AOI222X2 U141 ( .A(n313), .B(\chs_in_f[2][DATA][30] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][30] ), .E(n297), .F(
        \chs_in_f[1][DATA][30] ), .Z(n225) );
  HS65_LS_OAI212X5 U142 ( .A(n77), .B(n252), .C(n43), .D(n267), .E(n203), .Z(
        \chs_out_f[1][DATA][1] ) );
  HS65_LS_AOI222X2 U143 ( .A(n316), .B(\chs_in_f[2][DATA][1] ), .C(n280), .D(
        \chs_in_f[0][DATA][1] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][1] ), .Z(n203) );
  HS65_LS_OAI212X5 U144 ( .A(n67), .B(n252), .C(n33), .D(n267), .E(n212), .Z(
        \chs_out_f[1][DATA][11] ) );
  HS65_LS_AOI222X2 U145 ( .A(n316), .B(\chs_in_f[2][DATA][11] ), .C(n280), .D(
        \chs_in_f[0][DATA][11] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][11] ), .Z(n212) );
  HS65_LS_OAI212X5 U146 ( .A(n65), .B(n252), .C(n31), .D(n267), .E(n210), .Z(
        \chs_out_f[1][DATA][13] ) );
  HS65_LS_AOI222X2 U147 ( .A(n316), .B(\chs_in_f[2][DATA][13] ), .C(n280), .D(
        \chs_in_f[0][DATA][13] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][13] ), .Z(n210) );
  HS65_LS_OAI212X5 U148 ( .A(n63), .B(n252), .C(n29), .D(n267), .E(n208), .Z(
        \chs_out_f[1][DATA][15] ) );
  HS65_LS_AOI222X2 U149 ( .A(n316), .B(\chs_in_f[2][DATA][15] ), .C(n280), .D(
        \chs_in_f[0][DATA][15] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][15] ), .Z(n208) );
  HS65_LS_OAI212X5 U150 ( .A(n61), .B(n252), .C(n27), .D(n267), .E(n206), .Z(
        \chs_out_f[1][DATA][17] ) );
  HS65_LS_AOI222X2 U151 ( .A(n316), .B(\chs_in_f[2][DATA][17] ), .C(n280), .D(
        \chs_in_f[0][DATA][17] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][17] ), .Z(n206) );
  HS65_LS_OAI212X5 U152 ( .A(n59), .B(n252), .C(n25), .D(n267), .E(n204), .Z(
        \chs_out_f[1][DATA][19] ) );
  HS65_LS_AOI222X2 U153 ( .A(n316), .B(\chs_in_f[2][DATA][19] ), .C(n280), .D(
        \chs_in_f[0][DATA][19] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][19] ), .Z(n204) );
  HS65_LS_OAI212X5 U154 ( .A(n57), .B(n253), .C(n23), .D(n268), .E(n201), .Z(
        \chs_out_f[1][DATA][21] ) );
  HS65_LS_AOI222X2 U155 ( .A(n317), .B(\chs_in_f[2][DATA][21] ), .C(n281), .D(
        \chs_in_f[0][DATA][21] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][21] ), .Z(n201) );
  HS65_LS_OAI212X5 U156 ( .A(n55), .B(n253), .C(n21), .D(n268), .E(n199), .Z(
        \chs_out_f[1][DATA][23] ) );
  HS65_LS_AOI222X2 U157 ( .A(n317), .B(\chs_in_f[2][DATA][23] ), .C(n281), .D(
        \chs_in_f[0][DATA][23] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][23] ), .Z(n199) );
  HS65_LS_OAI212X5 U158 ( .A(n53), .B(n253), .C(n19), .D(n268), .E(n197), .Z(
        \chs_out_f[1][DATA][25] ) );
  HS65_LS_AOI222X2 U159 ( .A(n317), .B(\chs_in_f[2][DATA][25] ), .C(n281), .D(
        \chs_in_f[0][DATA][25] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][25] ), .Z(n197) );
  HS65_LS_OAI212X5 U160 ( .A(n51), .B(n253), .C(n17), .D(n268), .E(n195), .Z(
        \chs_out_f[1][DATA][27] ) );
  HS65_LS_AOI222X2 U161 ( .A(n317), .B(\chs_in_f[2][DATA][27] ), .C(n281), .D(
        \chs_in_f[0][DATA][27] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][27] ), .Z(n195) );
  HS65_LS_IVX9 U162 ( .A(\chs_in_f[3][DATA][9] ), .Z(n69) );
  HS65_LS_IVX9 U163 ( .A(\chs_in_f[3][DATA][33] ), .Z(n45) );
  HS65_LS_IVX9 U164 ( .A(\chs_in_f[3][DATA][0] ), .Z(n78) );
  HS65_LS_IVX9 U165 ( .A(\chs_in_f[3][DATA][1] ), .Z(n77) );
  HS65_LS_IVX9 U166 ( .A(\chs_in_f[3][DATA][2] ), .Z(n76) );
  HS65_LS_IVX9 U167 ( .A(\chs_in_f[3][DATA][3] ), .Z(n75) );
  HS65_LS_IVX9 U168 ( .A(\chs_in_f[3][DATA][4] ), .Z(n74) );
  HS65_LS_IVX9 U169 ( .A(\chs_in_f[3][DATA][5] ), .Z(n73) );
  HS65_LS_IVX9 U170 ( .A(\chs_in_f[3][DATA][6] ), .Z(n72) );
  HS65_LS_IVX9 U171 ( .A(\chs_in_f[3][DATA][7] ), .Z(n71) );
  HS65_LS_IVX9 U172 ( .A(\chs_in_f[3][DATA][8] ), .Z(n70) );
  HS65_LS_IVX9 U173 ( .A(\chs_in_f[3][DATA][10] ), .Z(n68) );
  HS65_LS_IVX9 U174 ( .A(\chs_in_f[3][DATA][11] ), .Z(n67) );
  HS65_LS_IVX9 U175 ( .A(\chs_in_f[3][DATA][12] ), .Z(n66) );
  HS65_LS_IVX9 U176 ( .A(\chs_in_f[3][DATA][13] ), .Z(n65) );
  HS65_LS_IVX9 U177 ( .A(\chs_in_f[3][DATA][14] ), .Z(n64) );
  HS65_LS_IVX9 U178 ( .A(\chs_in_f[3][DATA][15] ), .Z(n63) );
  HS65_LS_IVX9 U179 ( .A(\chs_in_f[3][DATA][16] ), .Z(n62) );
  HS65_LS_IVX9 U180 ( .A(\chs_in_f[3][DATA][17] ), .Z(n61) );
  HS65_LS_IVX9 U181 ( .A(\chs_in_f[3][DATA][18] ), .Z(n60) );
  HS65_LS_IVX9 U182 ( .A(\chs_in_f[3][DATA][19] ), .Z(n59) );
  HS65_LS_IVX9 U183 ( .A(\chs_in_f[3][DATA][20] ), .Z(n58) );
  HS65_LS_IVX9 U184 ( .A(\chs_in_f[3][DATA][21] ), .Z(n57) );
  HS65_LS_IVX9 U185 ( .A(\chs_in_f[3][DATA][22] ), .Z(n56) );
  HS65_LS_IVX9 U186 ( .A(\chs_in_f[3][DATA][23] ), .Z(n55) );
  HS65_LS_IVX9 U187 ( .A(\chs_in_f[3][DATA][24] ), .Z(n54) );
  HS65_LS_IVX9 U188 ( .A(\chs_in_f[3][DATA][25] ), .Z(n53) );
  HS65_LS_IVX9 U189 ( .A(\chs_in_f[3][DATA][26] ), .Z(n52) );
  HS65_LS_IVX9 U190 ( .A(\chs_in_f[3][DATA][27] ), .Z(n51) );
  HS65_LS_IVX9 U191 ( .A(\chs_in_f[3][DATA][28] ), .Z(n50) );
  HS65_LS_IVX9 U192 ( .A(\chs_in_f[3][DATA][29] ), .Z(n49) );
  HS65_LS_IVX9 U193 ( .A(\chs_in_f[3][DATA][30] ), .Z(n48) );
  HS65_LS_IVX9 U194 ( .A(\chs_in_f[3][DATA][31] ), .Z(n47) );
  HS65_LS_IVX9 U195 ( .A(\chs_in_f[3][DATA][32] ), .Z(n46) );
  HS65_LS_IVX9 U196 ( .A(\chs_in_f[4][DATA][9] ), .Z(n35) );
  HS65_LS_IVX9 U197 ( .A(\chs_in_f[4][DATA][33] ), .Z(n11) );
  HS65_LS_IVX9 U198 ( .A(\chs_in_f[4][DATA][0] ), .Z(n44) );
  HS65_LS_IVX9 U199 ( .A(\chs_in_f[4][DATA][1] ), .Z(n43) );
  HS65_LS_IVX9 U200 ( .A(\chs_in_f[4][DATA][2] ), .Z(n42) );
  HS65_LS_IVX9 U201 ( .A(\chs_in_f[4][DATA][3] ), .Z(n41) );
  HS65_LS_IVX9 U202 ( .A(\chs_in_f[4][DATA][4] ), .Z(n40) );
  HS65_LS_IVX9 U203 ( .A(\chs_in_f[4][DATA][5] ), .Z(n39) );
  HS65_LS_IVX9 U204 ( .A(\chs_in_f[4][DATA][6] ), .Z(n38) );
  HS65_LS_IVX9 U205 ( .A(\chs_in_f[4][DATA][7] ), .Z(n37) );
  HS65_LS_IVX9 U206 ( .A(\chs_in_f[4][DATA][8] ), .Z(n36) );
  HS65_LS_IVX9 U207 ( .A(\chs_in_f[4][DATA][10] ), .Z(n34) );
  HS65_LS_IVX9 U208 ( .A(\chs_in_f[4][DATA][11] ), .Z(n33) );
  HS65_LS_IVX9 U209 ( .A(\chs_in_f[4][DATA][12] ), .Z(n32) );
  HS65_LS_IVX9 U210 ( .A(\chs_in_f[4][DATA][13] ), .Z(n31) );
  HS65_LS_IVX9 U211 ( .A(\chs_in_f[4][DATA][14] ), .Z(n30) );
  HS65_LS_IVX9 U212 ( .A(\chs_in_f[4][DATA][15] ), .Z(n29) );
  HS65_LS_IVX9 U213 ( .A(\chs_in_f[4][DATA][16] ), .Z(n28) );
  HS65_LS_IVX9 U214 ( .A(\chs_in_f[4][DATA][17] ), .Z(n27) );
  HS65_LS_IVX9 U215 ( .A(\chs_in_f[4][DATA][18] ), .Z(n26) );
  HS65_LS_IVX9 U216 ( .A(\chs_in_f[4][DATA][19] ), .Z(n25) );
  HS65_LS_IVX9 U217 ( .A(\chs_in_f[4][DATA][20] ), .Z(n24) );
  HS65_LS_IVX9 U218 ( .A(\chs_in_f[4][DATA][21] ), .Z(n23) );
  HS65_LS_IVX9 U219 ( .A(\chs_in_f[4][DATA][22] ), .Z(n22) );
  HS65_LS_IVX9 U220 ( .A(\chs_in_f[4][DATA][23] ), .Z(n21) );
  HS65_LS_IVX9 U221 ( .A(\chs_in_f[4][DATA][24] ), .Z(n20) );
  HS65_LS_IVX9 U222 ( .A(\chs_in_f[4][DATA][25] ), .Z(n19) );
  HS65_LS_IVX9 U223 ( .A(\chs_in_f[4][DATA][26] ), .Z(n18) );
  HS65_LS_IVX9 U224 ( .A(\chs_in_f[4][DATA][27] ), .Z(n17) );
  HS65_LS_IVX9 U225 ( .A(\chs_in_f[4][DATA][28] ), .Z(n16) );
  HS65_LS_IVX9 U226 ( .A(\chs_in_f[4][DATA][29] ), .Z(n15) );
  HS65_LS_IVX9 U227 ( .A(\chs_in_f[4][DATA][30] ), .Z(n14) );
  HS65_LS_IVX9 U228 ( .A(\chs_in_f[4][DATA][31] ), .Z(n13) );
  HS65_LS_IVX9 U229 ( .A(\chs_in_f[4][DATA][32] ), .Z(n12) );
  HS65_LS_OAI212X5 U230 ( .A(n77), .B(n258), .C(n43), .D(n273), .E(n135), .Z(
        \chs_out_f[3][DATA][1] ) );
  HS65_LS_AOI222X2 U231 ( .A(n320), .B(\chs_in_f[2][DATA][1] ), .C(n288), .D(
        \chs_in_f[0][DATA][1] ), .E(n304), .F(\chs_in_f[1][DATA][1] ), .Z(n135) );
  HS65_LS_OAI212X5 U232 ( .A(n67), .B(n258), .C(n33), .D(n273), .E(n144), .Z(
        \chs_out_f[3][DATA][11] ) );
  HS65_LS_AOI222X2 U233 ( .A(n320), .B(\chs_in_f[2][DATA][11] ), .C(n288), .D(
        \chs_in_f[0][DATA][11] ), .E(n304), .F(\chs_in_f[1][DATA][11] ), .Z(
        n144) );
  HS65_LS_OAI212X5 U234 ( .A(n65), .B(n258), .C(n31), .D(n273), .E(n142), .Z(
        \chs_out_f[3][DATA][13] ) );
  HS65_LS_AOI222X2 U235 ( .A(n320), .B(\chs_in_f[2][DATA][13] ), .C(n288), .D(
        \chs_in_f[0][DATA][13] ), .E(n304), .F(\chs_in_f[1][DATA][13] ), .Z(
        n142) );
  HS65_LS_OAI212X5 U236 ( .A(n63), .B(n258), .C(n29), .D(n273), .E(n140), .Z(
        \chs_out_f[3][DATA][15] ) );
  HS65_LS_AOI222X2 U237 ( .A(n320), .B(\chs_in_f[2][DATA][15] ), .C(n288), .D(
        \chs_in_f[0][DATA][15] ), .E(n304), .F(\chs_in_f[1][DATA][15] ), .Z(
        n140) );
  HS65_LS_OAI212X5 U238 ( .A(n61), .B(n258), .C(n27), .D(n273), .E(n138), .Z(
        \chs_out_f[3][DATA][17] ) );
  HS65_LS_AOI222X2 U239 ( .A(n320), .B(\chs_in_f[2][DATA][17] ), .C(n288), .D(
        \chs_in_f[0][DATA][17] ), .E(n304), .F(\chs_in_f[1][DATA][17] ), .Z(
        n138) );
  HS65_LS_OAI212X5 U240 ( .A(n59), .B(n258), .C(n25), .D(n273), .E(n136), .Z(
        \chs_out_f[3][DATA][19] ) );
  HS65_LS_AOI222X2 U241 ( .A(n320), .B(\chs_in_f[2][DATA][19] ), .C(n288), .D(
        \chs_in_f[0][DATA][19] ), .E(n304), .F(\chs_in_f[1][DATA][19] ), .Z(
        n136) );
  HS65_LS_OAI212X5 U242 ( .A(n57), .B(n259), .C(n23), .D(n274), .E(n133), .Z(
        \chs_out_f[3][DATA][21] ) );
  HS65_LS_AOI222X2 U243 ( .A(n321), .B(\chs_in_f[2][DATA][21] ), .C(n289), .D(
        \chs_in_f[0][DATA][21] ), .E(n305), .F(\chs_in_f[1][DATA][21] ), .Z(
        n133) );
  HS65_LS_OAI212X5 U244 ( .A(n55), .B(n259), .C(n21), .D(n274), .E(n131), .Z(
        \chs_out_f[3][DATA][23] ) );
  HS65_LS_AOI222X2 U245 ( .A(n321), .B(\chs_in_f[2][DATA][23] ), .C(n289), .D(
        \chs_in_f[0][DATA][23] ), .E(n305), .F(\chs_in_f[1][DATA][23] ), .Z(
        n131) );
  HS65_LS_OAI212X5 U246 ( .A(n53), .B(n259), .C(n19), .D(n274), .E(n129), .Z(
        \chs_out_f[3][DATA][25] ) );
  HS65_LS_AOI222X2 U247 ( .A(n321), .B(\chs_in_f[2][DATA][25] ), .C(n289), .D(
        \chs_in_f[0][DATA][25] ), .E(n305), .F(\chs_in_f[1][DATA][25] ), .Z(
        n129) );
  HS65_LS_OAI212X5 U248 ( .A(n51), .B(n259), .C(n17), .D(n274), .E(n127), .Z(
        \chs_out_f[3][DATA][27] ) );
  HS65_LS_AOI222X2 U249 ( .A(n321), .B(\chs_in_f[2][DATA][27] ), .C(n289), .D(
        \chs_in_f[0][DATA][27] ), .E(n305), .F(\chs_in_f[1][DATA][27] ), .Z(
        n127) );
  HS65_LS_OAI212X5 U250 ( .A(n68), .B(n258), .C(n34), .D(n273), .E(n145), .Z(
        \chs_out_f[3][DATA][10] ) );
  HS65_LS_AOI222X2 U251 ( .A(n320), .B(\chs_in_f[2][DATA][10] ), .C(n288), .D(
        \chs_in_f[0][DATA][10] ), .E(n304), .F(\chs_in_f[1][DATA][10] ), .Z(
        n145) );
  HS65_LS_OAI212X5 U252 ( .A(n66), .B(n258), .C(n32), .D(n273), .E(n143), .Z(
        \chs_out_f[3][DATA][12] ) );
  HS65_LS_AOI222X2 U253 ( .A(n320), .B(\chs_in_f[2][DATA][12] ), .C(n288), .D(
        \chs_in_f[0][DATA][12] ), .E(n304), .F(\chs_in_f[1][DATA][12] ), .Z(
        n143) );
  HS65_LS_OAI212X5 U254 ( .A(n64), .B(n258), .C(n30), .D(n273), .E(n141), .Z(
        \chs_out_f[3][DATA][14] ) );
  HS65_LS_AOI222X2 U255 ( .A(n320), .B(\chs_in_f[2][DATA][14] ), .C(n288), .D(
        \chs_in_f[0][DATA][14] ), .E(n304), .F(\chs_in_f[1][DATA][14] ), .Z(
        n141) );
  HS65_LS_OAI212X5 U256 ( .A(n68), .B(n255), .C(n34), .D(n270), .E(n179), .Z(
        \chs_out_f[2][DATA][10] ) );
  HS65_LS_AOI222X2 U257 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][10] ), 
        .C(n284), .D(\chs_in_f[0][DATA][10] ), .E(n300), .F(
        \chs_in_f[1][DATA][10] ), .Z(n179) );
  HS65_LS_OAI212X5 U258 ( .A(n67), .B(n255), .C(n33), .D(n270), .E(n178), .Z(
        \chs_out_f[2][DATA][11] ) );
  HS65_LS_AOI222X2 U259 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][11] ), 
        .C(n284), .D(\chs_in_f[0][DATA][11] ), .E(n300), .F(
        \chs_in_f[1][DATA][11] ), .Z(n178) );
  HS65_LS_OAI212X5 U260 ( .A(n66), .B(n255), .C(n32), .D(n270), .E(n177), .Z(
        \chs_out_f[2][DATA][12] ) );
  HS65_LS_AOI222X2 U261 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][12] ), 
        .C(n284), .D(\chs_in_f[0][DATA][12] ), .E(n300), .F(
        \chs_in_f[1][DATA][12] ), .Z(n177) );
  HS65_LS_OAI212X5 U262 ( .A(n65), .B(n255), .C(n31), .D(n270), .E(n176), .Z(
        \chs_out_f[2][DATA][13] ) );
  HS65_LS_AOI222X2 U263 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][13] ), 
        .C(n284), .D(\chs_in_f[0][DATA][13] ), .E(n300), .F(
        \chs_in_f[1][DATA][13] ), .Z(n176) );
  HS65_LS_OAI212X5 U264 ( .A(n64), .B(n255), .C(n30), .D(n270), .E(n175), .Z(
        \chs_out_f[2][DATA][14] ) );
  HS65_LS_AOI222X2 U265 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][14] ), 
        .C(n284), .D(\chs_in_f[0][DATA][14] ), .E(n300), .F(
        \chs_in_f[1][DATA][14] ), .Z(n175) );
  HS65_LS_OAI212X5 U266 ( .A(n68), .B(n252), .C(n34), .D(n267), .E(n213), .Z(
        \chs_out_f[1][DATA][10] ) );
  HS65_LS_AOI222X2 U267 ( .A(n316), .B(\chs_in_f[2][DATA][10] ), .C(n280), .D(
        \chs_in_f[0][DATA][10] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][10] ), .Z(n213) );
  HS65_LS_OAI212X5 U268 ( .A(n66), .B(n252), .C(n32), .D(n267), .E(n211), .Z(
        \chs_out_f[1][DATA][12] ) );
  HS65_LS_AOI222X2 U269 ( .A(n316), .B(\chs_in_f[2][DATA][12] ), .C(n280), .D(
        \chs_in_f[0][DATA][12] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][12] ), .Z(n211) );
  HS65_LS_OAI212X5 U270 ( .A(n64), .B(n252), .C(n30), .D(n267), .E(n209), .Z(
        \chs_out_f[1][DATA][14] ) );
  HS65_LS_AOI222X2 U271 ( .A(n316), .B(\chs_in_f[2][DATA][14] ), .C(n280), .D(
        \chs_in_f[0][DATA][14] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][14] ), .Z(n209) );
  HS65_LS_OAI212X5 U272 ( .A(n74), .B(n251), .C(n40), .D(n266), .E(n220), .Z(
        \chs_out_f[0][DATA][4] ) );
  HS65_LS_AOI222X4 U273 ( .A(n314), .B(\chs_in_f[2][DATA][4] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][4] ), .E(n298), .F(
        \chs_in_f[1][DATA][4] ), .Z(n220) );
  HS65_LS_OAI212X5 U274 ( .A(n72), .B(n251), .C(n38), .D(n266), .E(n218), .Z(
        \chs_out_f[0][DATA][6] ) );
  HS65_LS_AOI222X4 U275 ( .A(n314), .B(\chs_in_f[2][DATA][6] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][6] ), .E(n298), .F(
        \chs_in_f[1][DATA][6] ), .Z(n218) );
  HS65_LS_OAI212X5 U276 ( .A(n70), .B(n251), .C(n36), .D(n266), .E(n216), .Z(
        \chs_out_f[0][DATA][8] ) );
  HS65_LS_AOI222X4 U277 ( .A(n314), .B(\chs_in_f[2][DATA][8] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][8] ), .E(n298), .F(
        \chs_in_f[1][DATA][8] ), .Z(n216) );
  HS65_LS_OAI212X5 U278 ( .A(n73), .B(n260), .C(n39), .D(n275), .E(n117), .Z(
        \chs_out_f[3][DATA][5] ) );
  HS65_LS_AOI222X2 U279 ( .A(n322), .B(\chs_in_f[2][DATA][5] ), .C(n290), .D(
        \chs_in_f[0][DATA][5] ), .E(n306), .F(\chs_in_f[1][DATA][5] ), .Z(n117) );
  HS65_LS_OAI212X5 U280 ( .A(n71), .B(n260), .C(n37), .D(n275), .E(n115), .Z(
        \chs_out_f[3][DATA][7] ) );
  HS65_LS_AOI222X2 U281 ( .A(n322), .B(\chs_in_f[2][DATA][7] ), .C(n290), .D(
        \chs_in_f[0][DATA][7] ), .E(n306), .F(\chs_in_f[1][DATA][7] ), .Z(n115) );
  HS65_LS_OAI212X5 U282 ( .A(n69), .B(n260), .C(n35), .D(n275), .E(n113), .Z(
        \chs_out_f[3][DATA][9] ) );
  HS65_LS_AOI222X2 U283 ( .A(n322), .B(\chs_in_f[2][DATA][9] ), .C(n290), .D(
        \chs_in_f[0][DATA][9] ), .E(n306), .F(\chs_in_f[1][DATA][9] ), .Z(n113) );
  HS65_LS_OAI212X5 U284 ( .A(n62), .B(n258), .C(n28), .D(n273), .E(n139), .Z(
        \chs_out_f[3][DATA][16] ) );
  HS65_LS_AOI222X2 U285 ( .A(n320), .B(\chs_in_f[2][DATA][16] ), .C(n288), .D(
        \chs_in_f[0][DATA][16] ), .E(n304), .F(\chs_in_f[1][DATA][16] ), .Z(
        n139) );
  HS65_LS_OAI212X5 U286 ( .A(n60), .B(n258), .C(n26), .D(n273), .E(n137), .Z(
        \chs_out_f[3][DATA][18] ) );
  HS65_LS_AOI222X2 U287 ( .A(n320), .B(\chs_in_f[2][DATA][18] ), .C(n288), .D(
        \chs_in_f[0][DATA][18] ), .E(n304), .F(\chs_in_f[1][DATA][18] ), .Z(
        n137) );
  HS65_LS_OAI212X5 U288 ( .A(n58), .B(n258), .C(n24), .D(n274), .E(n134), .Z(
        \chs_out_f[3][DATA][20] ) );
  HS65_LS_AOI222X2 U289 ( .A(n321), .B(\chs_in_f[2][DATA][20] ), .C(n289), .D(
        \chs_in_f[0][DATA][20] ), .E(n305), .F(\chs_in_f[1][DATA][20] ), .Z(
        n134) );
  HS65_LS_OAI212X5 U290 ( .A(n69), .B(n257), .C(n35), .D(n272), .E(n147), .Z(
        \chs_out_f[2][DATA][9] ) );
  HS65_LS_AOI222X2 U291 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][9] ), 
        .C(n286), .D(\chs_in_f[0][DATA][9] ), .E(n302), .F(
        \chs_in_f[1][DATA][9] ), .Z(n147) );
  HS65_LS_OAI212X5 U292 ( .A(n63), .B(n255), .C(n29), .D(n270), .E(n174), .Z(
        \chs_out_f[2][DATA][15] ) );
  HS65_LS_AOI222X2 U293 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][15] ), 
        .C(n284), .D(\chs_in_f[0][DATA][15] ), .E(n300), .F(
        \chs_in_f[1][DATA][15] ), .Z(n174) );
  HS65_LS_OAI212X5 U294 ( .A(n62), .B(n255), .C(n28), .D(n270), .E(n173), .Z(
        \chs_out_f[2][DATA][16] ) );
  HS65_LS_AOI222X2 U295 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][16] ), 
        .C(n284), .D(\chs_in_f[0][DATA][16] ), .E(n300), .F(
        \chs_in_f[1][DATA][16] ), .Z(n173) );
  HS65_LS_OAI212X5 U296 ( .A(n61), .B(n255), .C(n27), .D(n270), .E(n172), .Z(
        \chs_out_f[2][DATA][17] ) );
  HS65_LS_AOI222X2 U297 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][17] ), 
        .C(n284), .D(\chs_in_f[0][DATA][17] ), .E(n300), .F(
        \chs_in_f[1][DATA][17] ), .Z(n172) );
  HS65_LS_OAI212X5 U298 ( .A(n60), .B(n255), .C(n26), .D(n270), .E(n171), .Z(
        \chs_out_f[2][DATA][18] ) );
  HS65_LS_AOI222X2 U299 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][18] ), 
        .C(n284), .D(\chs_in_f[0][DATA][18] ), .E(n300), .F(
        \chs_in_f[1][DATA][18] ), .Z(n171) );
  HS65_LS_OAI212X5 U300 ( .A(n59), .B(n255), .C(n25), .D(n270), .E(n170), .Z(
        \chs_out_f[2][DATA][19] ) );
  HS65_LS_AOI222X2 U301 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][19] ), 
        .C(n284), .D(\chs_in_f[0][DATA][19] ), .E(n300), .F(
        \chs_in_f[1][DATA][19] ), .Z(n170) );
  HS65_LS_OAI212X5 U302 ( .A(n58), .B(n255), .C(n24), .D(n271), .E(n168), .Z(
        \chs_out_f[2][DATA][20] ) );
  HS65_LS_AOI222X2 U303 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][20] ), 
        .C(n285), .D(\chs_in_f[0][DATA][20] ), .E(n301), .F(
        \chs_in_f[1][DATA][20] ), .Z(n168) );
  HS65_LS_OAI212X5 U304 ( .A(n57), .B(n256), .C(n23), .D(n271), .E(n167), .Z(
        \chs_out_f[2][DATA][21] ) );
  HS65_LS_AOI222X2 U305 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][21] ), 
        .C(n285), .D(\chs_in_f[0][DATA][21] ), .E(n301), .F(
        \chs_in_f[1][DATA][21] ), .Z(n167) );
  HS65_LS_OAI212X5 U306 ( .A(n73), .B(n254), .C(n39), .D(n269), .E(n185), .Z(
        \chs_out_f[1][DATA][5] ) );
  HS65_LS_AOI222X2 U307 ( .A(n318), .B(\chs_in_f[2][DATA][5] ), .C(n282), .D(
        \chs_in_f[0][DATA][5] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][5] ), .Z(n185) );
  HS65_LS_OAI212X5 U308 ( .A(n71), .B(n254), .C(n37), .D(n269), .E(n183), .Z(
        \chs_out_f[1][DATA][7] ) );
  HS65_LS_AOI222X2 U309 ( .A(n318), .B(\chs_in_f[2][DATA][7] ), .C(n282), .D(
        \chs_in_f[0][DATA][7] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][7] ), .Z(n183) );
  HS65_LS_OAI212X5 U310 ( .A(n69), .B(n254), .C(n35), .D(n269), .E(n181), .Z(
        \chs_out_f[1][DATA][9] ) );
  HS65_LS_AOI222X2 U311 ( .A(n318), .B(\chs_in_f[2][DATA][9] ), .C(n282), .D(
        \chs_in_f[0][DATA][9] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][9] ), .Z(n181) );
  HS65_LS_OAI212X5 U312 ( .A(n62), .B(n252), .C(n28), .D(n267), .E(n207), .Z(
        \chs_out_f[1][DATA][16] ) );
  HS65_LS_AOI222X2 U313 ( .A(n316), .B(\chs_in_f[2][DATA][16] ), .C(n280), .D(
        \chs_in_f[0][DATA][16] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][16] ), .Z(n207) );
  HS65_LS_OAI212X5 U314 ( .A(n60), .B(n252), .C(n26), .D(n267), .E(n205), .Z(
        \chs_out_f[1][DATA][18] ) );
  HS65_LS_AOI222X2 U315 ( .A(n316), .B(\chs_in_f[2][DATA][18] ), .C(n280), .D(
        \chs_in_f[0][DATA][18] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][18] ), .Z(n205) );
  HS65_LS_OAI212X5 U316 ( .A(n58), .B(n252), .C(n24), .D(n268), .E(n202), .Z(
        \chs_out_f[1][DATA][20] ) );
  HS65_LS_AOI222X2 U317 ( .A(n317), .B(\chs_in_f[2][DATA][20] ), .C(n281), .D(
        \chs_in_f[0][DATA][20] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][20] ), .Z(n202) );
  HS65_LS_OAI212X5 U318 ( .A(n73), .B(n251), .C(n39), .D(n266), .E(n219), .Z(
        \chs_out_f[0][DATA][5] ) );
  HS65_LS_AOI222X2 U319 ( .A(n314), .B(\chs_in_f[2][DATA][5] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][5] ), .E(n298), .F(
        \chs_in_f[1][DATA][5] ), .Z(n219) );
  HS65_LS_OAI212X5 U320 ( .A(n71), .B(n251), .C(n37), .D(n266), .E(n217), .Z(
        \chs_out_f[0][DATA][7] ) );
  HS65_LS_AOI222X2 U321 ( .A(n314), .B(\chs_in_f[2][DATA][7] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][7] ), .E(n298), .F(
        \chs_in_f[1][DATA][7] ), .Z(n217) );
  HS65_LS_OAI212X5 U322 ( .A(n69), .B(n251), .C(n35), .D(n266), .E(n215), .Z(
        \chs_out_f[0][DATA][9] ) );
  HS65_LS_AOI222X2 U323 ( .A(n314), .B(\chs_in_f[2][DATA][9] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][9] ), .E(n298), .F(
        \chs_in_f[1][DATA][9] ), .Z(n215) );
  HS65_LS_OAI212X5 U324 ( .A(n67), .B(n249), .C(n33), .D(n264), .E(n246), .Z(
        \chs_out_f[0][DATA][11] ) );
  HS65_LS_AOI222X2 U325 ( .A(n312), .B(\chs_in_f[2][DATA][11] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][11] ), .E(n296), .F(
        \chs_in_f[1][DATA][11] ), .Z(n246) );
  HS65_LS_OAI212X5 U326 ( .A(n65), .B(n249), .C(n31), .D(n264), .E(n244), .Z(
        \chs_out_f[0][DATA][13] ) );
  HS65_LS_AOI222X2 U327 ( .A(n312), .B(\chs_in_f[2][DATA][13] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][13] ), .E(n296), .F(
        \chs_in_f[1][DATA][13] ), .Z(n244) );
  HS65_LS_OAI212X5 U328 ( .A(n63), .B(n249), .C(n29), .D(n264), .E(n242), .Z(
        \chs_out_f[0][DATA][15] ) );
  HS65_LS_AOI222X2 U329 ( .A(n312), .B(\chs_in_f[2][DATA][15] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][15] ), .E(n296), .F(
        \chs_in_f[1][DATA][15] ), .Z(n242) );
  HS65_LS_OAI212X5 U330 ( .A(n61), .B(n249), .C(n27), .D(n264), .E(n240), .Z(
        \chs_out_f[0][DATA][17] ) );
  HS65_LS_AOI222X2 U331 ( .A(n312), .B(\chs_in_f[2][DATA][17] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][17] ), .E(n296), .F(
        \chs_in_f[1][DATA][17] ), .Z(n240) );
  HS65_LS_OAI212X5 U332 ( .A(n59), .B(n249), .C(n25), .D(n264), .E(n238), .Z(
        \chs_out_f[0][DATA][19] ) );
  HS65_LS_AOI222X2 U333 ( .A(n312), .B(\chs_in_f[2][DATA][19] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][19] ), .E(n296), .F(
        \chs_in_f[1][DATA][19] ), .Z(n238) );
  HS65_LS_OAI212X5 U334 ( .A(n57), .B(n250), .C(n23), .D(n265), .E(n235), .Z(
        \chs_out_f[0][DATA][21] ) );
  HS65_LS_AOI222X2 U335 ( .A(n313), .B(\chs_in_f[2][DATA][21] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][21] ), .E(n297), .F(
        \chs_in_f[1][DATA][21] ), .Z(n235) );
  HS65_LS_OAI212X5 U336 ( .A(n263), .B(n74), .C(n278), .D(n40), .E(n84), .Z(
        \chs_out_f[4][DATA][4] ) );
  HS65_LS_OAI212X5 U337 ( .A(n263), .B(n73), .C(n278), .D(n39), .E(n83), .Z(
        \chs_out_f[4][DATA][5] ) );
  HS65_LS_AOI222X2 U338 ( .A(\chs_in_f[2][DATA][5] ), .B(n324), .C(
        \chs_in_f[0][DATA][5] ), .D(n294), .E(\chs_in_f[1][DATA][5] ), .F(n308), .Z(n83) );
  HS65_LS_OAI212X5 U339 ( .A(n263), .B(n72), .C(n278), .D(n38), .E(n82), .Z(
        \chs_out_f[4][DATA][6] ) );
  HS65_LS_AOI222X4 U340 ( .A(\chs_in_f[2][DATA][6] ), .B(n324), .C(
        \chs_in_f[0][DATA][6] ), .D(n294), .E(\chs_in_f[1][DATA][6] ), .F(n308), .Z(n82) );
  HS65_LS_OAI212X5 U341 ( .A(n263), .B(n71), .C(n278), .D(n37), .E(n81), .Z(
        \chs_out_f[4][DATA][7] ) );
  HS65_LS_AOI222X2 U342 ( .A(\chs_in_f[2][DATA][7] ), .B(n324), .C(
        \chs_in_f[0][DATA][7] ), .D(n294), .E(\chs_in_f[1][DATA][7] ), .F(n308), .Z(n81) );
  HS65_LS_OAI212X5 U343 ( .A(n263), .B(n70), .C(n278), .D(n36), .E(n80), .Z(
        \chs_out_f[4][DATA][8] ) );
  HS65_LS_OAI212X5 U344 ( .A(n69), .B(n263), .C(n35), .D(n278), .E(n79), .Z(
        \chs_out_f[4][DATA][9] ) );
  HS65_LS_AOI222X4 U345 ( .A(n324), .B(\chs_in_f[2][DATA][9] ), .C(n294), .D(
        \chs_in_f[0][DATA][9] ), .E(n308), .F(\chs_in_f[1][DATA][9] ), .Z(n79)
         );
  HS65_LS_OAI212X5 U346 ( .A(n261), .B(n68), .C(n276), .D(n34), .E(n111), .Z(
        \chs_out_f[4][DATA][10] ) );
  HS65_LS_OAI212X5 U347 ( .A(n261), .B(n67), .C(n276), .D(n33), .E(n110), .Z(
        \chs_out_f[4][DATA][11] ) );
  HS65_LS_AOI222X2 U348 ( .A(\chs_in_f[2][DATA][11] ), .B(n326), .C(
        \chs_in_f[0][DATA][11] ), .D(n292), .E(\chs_in_f[1][DATA][11] ), .F(
        n310), .Z(n110) );
  HS65_LS_OAI212X5 U349 ( .A(n261), .B(n66), .C(n276), .D(n32), .E(n109), .Z(
        \chs_out_f[4][DATA][12] ) );
  HS65_LS_OAI212X5 U350 ( .A(n261), .B(n65), .C(n276), .D(n31), .E(n108), .Z(
        \chs_out_f[4][DATA][13] ) );
  HS65_LS_AOI222X2 U351 ( .A(\chs_in_f[2][DATA][13] ), .B(n326), .C(
        \chs_in_f[0][DATA][13] ), .D(n292), .E(\chs_in_f[1][DATA][13] ), .F(
        n310), .Z(n108) );
  HS65_LS_OAI212X5 U352 ( .A(n261), .B(n64), .C(n276), .D(n30), .E(n107), .Z(
        \chs_out_f[4][DATA][14] ) );
  HS65_LS_OAI212X5 U353 ( .A(n261), .B(n63), .C(n276), .D(n29), .E(n106), .Z(
        \chs_out_f[4][DATA][15] ) );
  HS65_LS_AOI222X2 U354 ( .A(\chs_in_f[2][DATA][15] ), .B(n326), .C(
        \chs_in_f[0][DATA][15] ), .D(n292), .E(\chs_in_f[1][DATA][15] ), .F(
        n310), .Z(n106) );
  HS65_LS_OAI212X5 U355 ( .A(n261), .B(n62), .C(n276), .D(n28), .E(n105), .Z(
        \chs_out_f[4][DATA][16] ) );
  HS65_LS_AOI222X4 U356 ( .A(\chs_in_f[2][DATA][16] ), .B(n326), .C(
        \chs_in_f[0][DATA][16] ), .D(n292), .E(\chs_in_f[1][DATA][16] ), .F(
        n310), .Z(n105) );
  HS65_LS_OAI212X5 U357 ( .A(n261), .B(n61), .C(n276), .D(n27), .E(n104), .Z(
        \chs_out_f[4][DATA][17] ) );
  HS65_LS_AOI222X2 U358 ( .A(\chs_in_f[2][DATA][17] ), .B(n325), .C(
        \chs_in_f[0][DATA][17] ), .D(n292), .E(\chs_in_f[1][DATA][17] ), .F(
        n309), .Z(n104) );
  HS65_LS_OAI212X5 U359 ( .A(n261), .B(n60), .C(n276), .D(n26), .E(n103), .Z(
        \chs_out_f[4][DATA][18] ) );
  HS65_LS_AOI222X4 U360 ( .A(\chs_in_f[2][DATA][18] ), .B(n325), .C(
        \chs_in_f[0][DATA][18] ), .D(n292), .E(\chs_in_f[1][DATA][18] ), .F(
        n309), .Z(n103) );
  HS65_LS_OAI212X5 U361 ( .A(n261), .B(n59), .C(n276), .D(n25), .E(n102), .Z(
        \chs_out_f[4][DATA][19] ) );
  HS65_LS_AOI222X2 U362 ( .A(\chs_in_f[2][DATA][19] ), .B(n325), .C(
        \chs_in_f[0][DATA][19] ), .D(n292), .E(\chs_in_f[1][DATA][19] ), .F(
        n309), .Z(n102) );
  HS65_LS_OAI212X5 U363 ( .A(n262), .B(n58), .C(n276), .D(n24), .E(n100), .Z(
        \chs_out_f[4][DATA][20] ) );
  HS65_LS_AOI222X4 U364 ( .A(\chs_in_f[2][DATA][20] ), .B(n325), .C(
        \chs_in_f[0][DATA][20] ), .D(n293), .E(\chs_in_f[1][DATA][20] ), .F(
        n309), .Z(n100) );
  HS65_LS_OAI212X5 U365 ( .A(n262), .B(n57), .C(n277), .D(n23), .E(n99), .Z(
        \chs_out_f[4][DATA][21] ) );
  HS65_LS_AOI222X2 U366 ( .A(\chs_in_f[2][DATA][21] ), .B(n325), .C(
        \chs_in_f[0][DATA][21] ), .D(n293), .E(\chs_in_f[1][DATA][21] ), .F(
        n309), .Z(n99) );
  HS65_LS_OAI212X5 U367 ( .A(n78), .B(n258), .C(n44), .D(n273), .E(n146), .Z(
        \chs_out_f[3][DATA][0] ) );
  HS65_LS_AOI222X2 U368 ( .A(n320), .B(\chs_in_f[2][DATA][0] ), .C(n288), .D(
        \chs_in_f[0][DATA][0] ), .E(n304), .F(\chs_in_f[1][DATA][0] ), .Z(n146) );
  HS65_LS_OAI212X5 U369 ( .A(n48), .B(n259), .C(n14), .D(n274), .E(n123), .Z(
        \chs_out_f[3][DATA][30] ) );
  HS65_LS_AOI222X2 U370 ( .A(n321), .B(\chs_in_f[2][DATA][30] ), .C(n289), .D(
        \chs_in_f[0][DATA][30] ), .E(n305), .F(\chs_in_f[1][DATA][30] ), .Z(
        n123) );
  HS65_LS_OAI212X5 U371 ( .A(n47), .B(n259), .C(n13), .D(n275), .E(n122), .Z(
        \chs_out_f[3][DATA][31] ) );
  HS65_LS_AOI222X2 U372 ( .A(n322), .B(\chs_in_f[2][DATA][31] ), .C(n290), .D(
        \chs_in_f[0][DATA][31] ), .E(n306), .F(\chs_in_f[1][DATA][31] ), .Z(
        n122) );
  HS65_LS_OAI212X5 U373 ( .A(n46), .B(n259), .C(n12), .D(n275), .E(n121), .Z(
        \chs_out_f[3][DATA][32] ) );
  HS65_LS_AOI222X2 U374 ( .A(n322), .B(\chs_in_f[2][DATA][32] ), .C(n290), .D(
        \chs_in_f[0][DATA][32] ), .E(n306), .F(\chs_in_f[1][DATA][32] ), .Z(
        n121) );
  HS65_LS_OAI212X5 U375 ( .A(n78), .B(n255), .C(n44), .D(n270), .E(n180), .Z(
        \chs_out_f[2][DATA][0] ) );
  HS65_LS_AOI222X2 U376 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][0] ), 
        .C(n284), .D(\chs_in_f[0][DATA][0] ), .E(n300), .F(
        \chs_in_f[1][DATA][0] ), .Z(n180) );
  HS65_LS_OAI212X5 U377 ( .A(n48), .B(n256), .C(n14), .D(n271), .E(n157), .Z(
        \chs_out_f[2][DATA][30] ) );
  HS65_LS_OAI212X5 U378 ( .A(n47), .B(n256), .C(n13), .D(n272), .E(n156), .Z(
        \chs_out_f[2][DATA][31] ) );
  HS65_LS_AOI222X2 U379 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][31] ), 
        .C(n286), .D(\chs_in_f[0][DATA][31] ), .E(n302), .F(
        \chs_in_f[1][DATA][31] ), .Z(n156) );
  HS65_LS_OAI212X5 U380 ( .A(n46), .B(n256), .C(n12), .D(n272), .E(n155), .Z(
        \chs_out_f[2][DATA][32] ) );
  HS65_LS_AOI222X2 U381 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][32] ), 
        .C(n286), .D(\chs_in_f[0][DATA][32] ), .E(n302), .F(
        \chs_in_f[1][DATA][32] ), .Z(n155) );
  HS65_LS_OAI212X5 U382 ( .A(n78), .B(n252), .C(n44), .D(n267), .E(n214), .Z(
        \chs_out_f[1][DATA][0] ) );
  HS65_LS_AOI222X2 U383 ( .A(n316), .B(\chs_in_f[2][DATA][0] ), .C(n280), .D(
        \chs_in_f[0][DATA][0] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][0] ), .Z(n214) );
  HS65_LS_OAI212X5 U384 ( .A(n48), .B(n253), .C(n14), .D(n268), .E(n191), .Z(
        \chs_out_f[1][DATA][30] ) );
  HS65_LS_OAI212X5 U385 ( .A(n47), .B(n253), .C(n13), .D(n269), .E(n190), .Z(
        \chs_out_f[1][DATA][31] ) );
  HS65_LS_AOI222X2 U386 ( .A(n318), .B(\chs_in_f[2][DATA][31] ), .C(n282), .D(
        \chs_in_f[0][DATA][31] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][31] ), .Z(n190) );
  HS65_LS_OAI212X5 U387 ( .A(n46), .B(n253), .C(n12), .D(n269), .E(n189), .Z(
        \chs_out_f[1][DATA][32] ) );
  HS65_LS_OAI212X5 U388 ( .A(n47), .B(n250), .C(n13), .D(n266), .E(n224), .Z(
        \chs_out_f[0][DATA][31] ) );
  HS65_LS_AOI222X2 U389 ( .A(n314), .B(\chs_in_f[2][DATA][31] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][31] ), .E(n298), .F(
        \chs_in_f[1][DATA][31] ), .Z(n224) );
  HS65_LS_OAI212X5 U390 ( .A(n46), .B(n250), .C(n12), .D(n266), .E(n223), .Z(
        \chs_out_f[0][DATA][32] ) );
  HS65_LS_OAI212X5 U391 ( .A(n263), .B(n47), .C(n277), .D(n13), .E(n88), .Z(
        \chs_out_f[4][DATA][31] ) );
  HS65_LS_AOI222X2 U392 ( .A(\chs_in_f[2][DATA][31] ), .B(n324), .C(
        \chs_in_f[0][DATA][31] ), .D(n294), .E(\chs_in_f[1][DATA][31] ), .F(
        n308), .Z(n88) );
  HS65_LS_OAI212X5 U393 ( .A(n76), .B(n259), .C(n42), .D(n274), .E(n124), .Z(
        \chs_out_f[3][DATA][2] ) );
  HS65_LS_AOI222X2 U394 ( .A(n321), .B(\chs_in_f[2][DATA][2] ), .C(n289), .D(
        \chs_in_f[0][DATA][2] ), .E(n305), .F(\chs_in_f[1][DATA][2] ), .Z(n124) );
  HS65_LS_OAI212X5 U395 ( .A(n75), .B(n260), .C(n41), .D(n275), .E(n119), .Z(
        \chs_out_f[3][DATA][3] ) );
  HS65_LS_AOI222X2 U396 ( .A(n322), .B(\chs_in_f[2][DATA][3] ), .C(n290), .D(
        \chs_in_f[0][DATA][3] ), .E(n306), .F(\chs_in_f[1][DATA][3] ), .Z(n119) );
  HS65_LS_OAI212X5 U397 ( .A(n56), .B(n259), .C(n22), .D(n274), .E(n132), .Z(
        \chs_out_f[3][DATA][22] ) );
  HS65_LS_AOI222X2 U398 ( .A(n321), .B(\chs_in_f[2][DATA][22] ), .C(n289), .D(
        \chs_in_f[0][DATA][22] ), .E(n305), .F(\chs_in_f[1][DATA][22] ), .Z(
        n132) );
  HS65_LS_OAI212X5 U399 ( .A(n54), .B(n259), .C(n20), .D(n274), .E(n130), .Z(
        \chs_out_f[3][DATA][24] ) );
  HS65_LS_AOI222X2 U400 ( .A(n321), .B(\chs_in_f[2][DATA][24] ), .C(n289), .D(
        \chs_in_f[0][DATA][24] ), .E(n305), .F(\chs_in_f[1][DATA][24] ), .Z(
        n130) );
  HS65_LS_OAI212X5 U401 ( .A(n52), .B(n259), .C(n18), .D(n274), .E(n128), .Z(
        \chs_out_f[3][DATA][26] ) );
  HS65_LS_AOI222X2 U402 ( .A(n321), .B(\chs_in_f[2][DATA][26] ), .C(n289), .D(
        \chs_in_f[0][DATA][26] ), .E(n305), .F(\chs_in_f[1][DATA][26] ), .Z(
        n128) );
  HS65_LS_OAI212X5 U403 ( .A(n50), .B(n259), .C(n16), .D(n274), .E(n126), .Z(
        \chs_out_f[3][DATA][28] ) );
  HS65_LS_AOI222X2 U404 ( .A(n321), .B(\chs_in_f[2][DATA][28] ), .C(n289), .D(
        \chs_in_f[0][DATA][28] ), .E(n305), .F(\chs_in_f[1][DATA][28] ), .Z(
        n126) );
  HS65_LS_OAI212X5 U405 ( .A(n49), .B(n259), .C(n15), .D(n274), .E(n125), .Z(
        \chs_out_f[3][DATA][29] ) );
  HS65_LS_AOI222X2 U406 ( .A(n321), .B(\chs_in_f[2][DATA][29] ), .C(n289), .D(
        \chs_in_f[0][DATA][29] ), .E(n305), .F(\chs_in_f[1][DATA][29] ), .Z(
        n125) );
  HS65_LS_OAI212X5 U407 ( .A(n77), .B(n255), .C(n43), .D(n270), .E(n169), .Z(
        \chs_out_f[2][DATA][1] ) );
  HS65_LS_AOI222X2 U408 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][1] ), 
        .C(n284), .D(\chs_in_f[0][DATA][1] ), .E(n300), .F(
        \chs_in_f[1][DATA][1] ), .Z(n169) );
  HS65_LS_OAI212X5 U409 ( .A(n76), .B(n256), .C(n42), .D(n271), .E(n158), .Z(
        \chs_out_f[2][DATA][2] ) );
  HS65_LS_AOI222X2 U410 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][2] ), 
        .C(n285), .D(\chs_in_f[0][DATA][2] ), .E(n301), .F(
        \chs_in_f[1][DATA][2] ), .Z(n158) );
  HS65_LS_OAI212X5 U411 ( .A(n56), .B(n256), .C(n22), .D(n271), .E(n166), .Z(
        \chs_out_f[2][DATA][22] ) );
  HS65_LS_AOI222X2 U412 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][22] ), 
        .C(n285), .D(\chs_in_f[0][DATA][22] ), .E(n301), .F(
        \chs_in_f[1][DATA][22] ), .Z(n166) );
  HS65_LS_OAI212X5 U413 ( .A(n55), .B(n256), .C(n21), .D(n271), .E(n165), .Z(
        \chs_out_f[2][DATA][23] ) );
  HS65_LS_AOI222X2 U414 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][23] ), 
        .C(n285), .D(\chs_in_f[0][DATA][23] ), .E(n301), .F(
        \chs_in_f[1][DATA][23] ), .Z(n165) );
  HS65_LS_OAI212X5 U415 ( .A(n54), .B(n256), .C(n20), .D(n271), .E(n164), .Z(
        \chs_out_f[2][DATA][24] ) );
  HS65_LS_AOI222X2 U416 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][24] ), 
        .C(n285), .D(\chs_in_f[0][DATA][24] ), .E(n301), .F(
        \chs_in_f[1][DATA][24] ), .Z(n164) );
  HS65_LS_OAI212X5 U417 ( .A(n53), .B(n256), .C(n19), .D(n271), .E(n163), .Z(
        \chs_out_f[2][DATA][25] ) );
  HS65_LS_AOI222X2 U418 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][25] ), 
        .C(n285), .D(\chs_in_f[0][DATA][25] ), .E(n301), .F(
        \chs_in_f[1][DATA][25] ), .Z(n163) );
  HS65_LS_OAI212X5 U419 ( .A(n52), .B(n256), .C(n18), .D(n271), .E(n162), .Z(
        \chs_out_f[2][DATA][26] ) );
  HS65_LS_AOI222X2 U420 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][26] ), 
        .C(n285), .D(\chs_in_f[0][DATA][26] ), .E(n301), .F(
        \chs_in_f[1][DATA][26] ), .Z(n162) );
  HS65_LS_OAI212X5 U421 ( .A(n51), .B(n256), .C(n17), .D(n271), .E(n161), .Z(
        \chs_out_f[2][DATA][27] ) );
  HS65_LS_AOI222X2 U422 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][27] ), 
        .C(n285), .D(\chs_in_f[0][DATA][27] ), .E(n301), .F(
        \chs_in_f[1][DATA][27] ), .Z(n161) );
  HS65_LS_OAI212X5 U423 ( .A(n50), .B(n256), .C(n16), .D(n271), .E(n160), .Z(
        \chs_out_f[2][DATA][28] ) );
  HS65_LS_AOI222X2 U424 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][28] ), 
        .C(n285), .D(\chs_in_f[0][DATA][28] ), .E(n301), .F(
        \chs_in_f[1][DATA][28] ), .Z(n160) );
  HS65_LS_OAI212X5 U425 ( .A(n49), .B(n256), .C(n15), .D(n271), .E(n159), .Z(
        \chs_out_f[2][DATA][29] ) );
  HS65_LS_AOI222X2 U426 ( .A(\switch_sel[2][2] ), .B(\chs_in_f[2][DATA][29] ), 
        .C(n285), .D(\chs_in_f[0][DATA][29] ), .E(n301), .F(
        \chs_in_f[1][DATA][29] ), .Z(n159) );
  HS65_LS_OAI212X5 U427 ( .A(n76), .B(n253), .C(n42), .D(n268), .E(n192), .Z(
        \chs_out_f[1][DATA][2] ) );
  HS65_LS_AOI222X2 U428 ( .A(n317), .B(\chs_in_f[2][DATA][2] ), .C(n281), .D(
        \chs_in_f[0][DATA][2] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][2] ), .Z(n192) );
  HS65_LS_OAI212X5 U429 ( .A(n75), .B(n254), .C(n41), .D(n269), .E(n187), .Z(
        \chs_out_f[1][DATA][3] ) );
  HS65_LS_AOI222X2 U430 ( .A(n318), .B(\chs_in_f[2][DATA][3] ), .C(n282), .D(
        \chs_in_f[0][DATA][3] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][3] ), .Z(n187) );
  HS65_LS_OAI212X5 U431 ( .A(n56), .B(n253), .C(n22), .D(n268), .E(n200), .Z(
        \chs_out_f[1][DATA][22] ) );
  HS65_LS_AOI222X2 U432 ( .A(n317), .B(\chs_in_f[2][DATA][22] ), .C(n281), .D(
        \chs_in_f[0][DATA][22] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][22] ), .Z(n200) );
  HS65_LS_OAI212X5 U433 ( .A(n54), .B(n253), .C(n20), .D(n268), .E(n198), .Z(
        \chs_out_f[1][DATA][24] ) );
  HS65_LS_AOI222X2 U434 ( .A(n317), .B(\chs_in_f[2][DATA][24] ), .C(n281), .D(
        \chs_in_f[0][DATA][24] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][24] ), .Z(n198) );
  HS65_LS_OAI212X5 U435 ( .A(n52), .B(n253), .C(n18), .D(n268), .E(n196), .Z(
        \chs_out_f[1][DATA][26] ) );
  HS65_LS_AOI222X2 U436 ( .A(n317), .B(\chs_in_f[2][DATA][26] ), .C(n281), .D(
        \chs_in_f[0][DATA][26] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][26] ), .Z(n196) );
  HS65_LS_OAI212X5 U437 ( .A(n50), .B(n253), .C(n16), .D(n268), .E(n194), .Z(
        \chs_out_f[1][DATA][28] ) );
  HS65_LS_AOI222X2 U438 ( .A(n317), .B(\chs_in_f[2][DATA][28] ), .C(n281), .D(
        \chs_in_f[0][DATA][28] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][28] ), .Z(n194) );
  HS65_LS_OAI212X5 U439 ( .A(n49), .B(n253), .C(n15), .D(n268), .E(n193), .Z(
        \chs_out_f[1][DATA][29] ) );
  HS65_LS_AOI222X2 U440 ( .A(n317), .B(\chs_in_f[2][DATA][29] ), .C(n281), .D(
        \chs_in_f[0][DATA][29] ), .E(\switch_sel[1][1] ), .F(
        \chs_in_f[1][DATA][29] ), .Z(n193) );
  HS65_LS_OAI212X5 U441 ( .A(n77), .B(n249), .C(n43), .D(n264), .E(n237), .Z(
        \chs_out_f[0][DATA][1] ) );
  HS65_LS_AOI222X2 U442 ( .A(n312), .B(\chs_in_f[2][DATA][1] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][1] ), .E(n296), .F(
        \chs_in_f[1][DATA][1] ), .Z(n237) );
  HS65_LS_OAI212X5 U443 ( .A(n75), .B(n251), .C(n41), .D(n266), .E(n221), .Z(
        \chs_out_f[0][DATA][3] ) );
  HS65_LS_AOI222X2 U444 ( .A(n314), .B(\chs_in_f[2][DATA][3] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][3] ), .E(n298), .F(
        \chs_in_f[1][DATA][3] ), .Z(n221) );
  HS65_LS_OAI212X5 U445 ( .A(n55), .B(n250), .C(n21), .D(n265), .E(n233), .Z(
        \chs_out_f[0][DATA][23] ) );
  HS65_LS_AOI222X2 U446 ( .A(n313), .B(\chs_in_f[2][DATA][23] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][23] ), .E(n297), .F(
        \chs_in_f[1][DATA][23] ), .Z(n233) );
  HS65_LS_OAI212X5 U447 ( .A(n53), .B(n250), .C(n19), .D(n265), .E(n231), .Z(
        \chs_out_f[0][DATA][25] ) );
  HS65_LS_AOI222X2 U448 ( .A(n313), .B(\chs_in_f[2][DATA][25] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][25] ), .E(n297), .F(
        \chs_in_f[1][DATA][25] ), .Z(n231) );
  HS65_LS_OAI212X5 U449 ( .A(n51), .B(n250), .C(n17), .D(n265), .E(n229), .Z(
        \chs_out_f[0][DATA][27] ) );
  HS65_LS_AOI222X2 U450 ( .A(n313), .B(\chs_in_f[2][DATA][27] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][27] ), .E(n297), .F(
        \chs_in_f[1][DATA][27] ), .Z(n229) );
  HS65_LS_OAI212X5 U451 ( .A(n49), .B(n250), .C(n15), .D(n265), .E(n227), .Z(
        \chs_out_f[0][DATA][29] ) );
  HS65_LS_AOI222X2 U452 ( .A(n313), .B(\chs_in_f[2][DATA][29] ), .C(
        \switch_sel[0][0] ), .D(\chs_in_f[0][DATA][29] ), .E(n297), .F(
        \chs_in_f[1][DATA][29] ), .Z(n227) );
  HS65_LS_OAI212X5 U453 ( .A(n261), .B(n78), .C(n276), .D(n44), .E(n112), .Z(
        \chs_out_f[4][DATA][0] ) );
  HS65_LS_OAI212X5 U454 ( .A(n261), .B(n77), .C(n276), .D(n43), .E(n101), .Z(
        \chs_out_f[4][DATA][1] ) );
  HS65_LS_AOI222X2 U455 ( .A(\chs_in_f[2][DATA][1] ), .B(n325), .C(
        \chs_in_f[0][DATA][1] ), .D(n292), .E(\chs_in_f[1][DATA][1] ), .F(n309), .Z(n101) );
  HS65_LS_OAI212X5 U456 ( .A(n262), .B(n76), .C(n277), .D(n42), .E(n90), .Z(
        \chs_out_f[4][DATA][2] ) );
  HS65_LS_AOI222X4 U457 ( .A(\chs_in_f[2][DATA][2] ), .B(n324), .C(
        \chs_in_f[0][DATA][2] ), .D(n293), .E(\chs_in_f[1][DATA][2] ), .F(n308), .Z(n90) );
  HS65_LS_OAI212X5 U458 ( .A(n263), .B(n75), .C(n278), .D(n41), .E(n85), .Z(
        \chs_out_f[4][DATA][3] ) );
  HS65_LS_AOI222X2 U459 ( .A(\chs_in_f[2][DATA][3] ), .B(n324), .C(
        \chs_in_f[0][DATA][3] ), .D(n294), .E(\chs_in_f[1][DATA][3] ), .F(n308), .Z(n85) );
  HS65_LS_OAI212X5 U460 ( .A(n262), .B(n56), .C(n277), .D(n22), .E(n98), .Z(
        \chs_out_f[4][DATA][22] ) );
  HS65_LS_AOI222X4 U461 ( .A(\chs_in_f[2][DATA][22] ), .B(n325), .C(
        \chs_in_f[0][DATA][22] ), .D(n293), .E(\chs_in_f[1][DATA][22] ), .F(
        n309), .Z(n98) );
  HS65_LS_OAI212X5 U462 ( .A(n262), .B(n55), .C(n277), .D(n21), .E(n97), .Z(
        \chs_out_f[4][DATA][23] ) );
  HS65_LS_AOI222X2 U463 ( .A(\chs_in_f[2][DATA][23] ), .B(n325), .C(
        \chs_in_f[0][DATA][23] ), .D(n293), .E(\chs_in_f[1][DATA][23] ), .F(
        n309), .Z(n97) );
  HS65_LS_OAI212X5 U464 ( .A(n262), .B(n54), .C(n277), .D(n20), .E(n96), .Z(
        \chs_out_f[4][DATA][24] ) );
  HS65_LS_AOI222X4 U465 ( .A(\chs_in_f[2][DATA][24] ), .B(n325), .C(
        \chs_in_f[0][DATA][24] ), .D(n293), .E(\chs_in_f[1][DATA][24] ), .F(
        n309), .Z(n96) );
  HS65_LS_OAI212X5 U466 ( .A(n262), .B(n53), .C(n277), .D(n19), .E(n95), .Z(
        \chs_out_f[4][DATA][25] ) );
  HS65_LS_AOI222X2 U467 ( .A(\chs_in_f[2][DATA][25] ), .B(n325), .C(
        \chs_in_f[0][DATA][25] ), .D(n293), .E(\chs_in_f[1][DATA][25] ), .F(
        n309), .Z(n95) );
  HS65_LS_OAI212X5 U468 ( .A(n262), .B(n52), .C(n277), .D(n18), .E(n94), .Z(
        \chs_out_f[4][DATA][26] ) );
  HS65_LS_AOI222X4 U469 ( .A(\chs_in_f[2][DATA][26] ), .B(n325), .C(
        \chs_in_f[0][DATA][26] ), .D(n293), .E(\chs_in_f[1][DATA][26] ), .F(
        n309), .Z(n94) );
  HS65_LS_OAI212X5 U470 ( .A(n262), .B(n51), .C(n277), .D(n17), .E(n93), .Z(
        \chs_out_f[4][DATA][27] ) );
  HS65_LS_AOI222X2 U471 ( .A(\chs_in_f[2][DATA][27] ), .B(n325), .C(
        \chs_in_f[0][DATA][27] ), .D(n293), .E(\chs_in_f[1][DATA][27] ), .F(
        n309), .Z(n93) );
  HS65_LS_OAI212X5 U472 ( .A(n262), .B(n50), .C(n277), .D(n16), .E(n92), .Z(
        \chs_out_f[4][DATA][28] ) );
  HS65_LS_AOI222X4 U473 ( .A(\chs_in_f[2][DATA][28] ), .B(n325), .C(
        \chs_in_f[0][DATA][28] ), .D(n293), .E(\chs_in_f[1][DATA][28] ), .F(
        n309), .Z(n92) );
  HS65_LS_OAI212X5 U474 ( .A(n262), .B(n49), .C(n277), .D(n15), .E(n91), .Z(
        \chs_out_f[4][DATA][29] ) );
  HS65_LS_AOI222X2 U475 ( .A(\chs_in_f[2][DATA][29] ), .B(n324), .C(
        \chs_in_f[0][DATA][29] ), .D(n293), .E(\chs_in_f[1][DATA][29] ), .F(
        n308), .Z(n91) );
  HS65_LS_IVX9 U476 ( .A(\switch_sel[4][3] ), .Z(n2) );
  HS65_LS_IVX9 U477 ( .A(\switch_sel[3][2] ), .Z(n8) );
  HS65_LS_IVX9 U478 ( .A(\switch_sel[4][2] ), .Z(n3) );
  HS65_LS_IVX9 U479 ( .A(\switch_sel[3][1] ), .Z(n9) );
  HS65_LS_IVX9 U480 ( .A(\switch_sel[4][1] ), .Z(n4) );
  HS65_LS_IVX9 U481 ( .A(\switch_sel[3][0] ), .Z(n10) );
  HS65_LS_IVX9 U482 ( .A(\switch_sel[4][0] ), .Z(n5) );
  HS65_LS_IVX9 U483 ( .A(\switch_sel[3][4] ), .Z(n6) );
  HS65_LS_BFX9 U484 ( .A(\switch_sel[1][3] ), .Z(n303) );
  HS65_LS_BFX9 U485 ( .A(\switch_sel[2][3] ), .Z(n319) );
  HS65_LS_BFX9 U486 ( .A(\switch_sel[0][3] ), .Z(n287) );
  HS65_LS_BFX9 U487 ( .A(\switch_sel[1][2] ), .Z(n299) );
  HS65_LS_BFX9 U488 ( .A(\switch_sel[0][2] ), .Z(n283) );
  HS65_LS_BFX9 U489 ( .A(\switch_sel[2][1] ), .Z(n315) );
  HS65_LS_BFX9 U490 ( .A(\switch_sel[0][1] ), .Z(n279) );
  HS65_LS_BFX9 U491 ( .A(\switch_sel[1][0] ), .Z(n295) );
  HS65_LS_BFX9 U492 ( .A(\switch_sel[2][0] ), .Z(n311) );
  HS65_LS_BFX9 U493 ( .A(\switch_sel[1][4] ), .Z(n307) );
  HS65_LS_BFX9 U494 ( .A(\switch_sel[2][4] ), .Z(n323) );
  HS65_LS_BFX9 U495 ( .A(\switch_sel[0][4] ), .Z(n291) );
  HS65_LS_IVX9 U496 ( .A(\switch_sel[3][3] ), .Z(n7) );
  HS65_LS_IVX9 U497 ( .A(\switch_sel[4][4] ), .Z(n1) );
endmodule


module sr_latch_1_5 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(qn), .Z(N1) );
  HS65_LS_IVX9 U2 ( .A(r), .Z(n1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_1_0 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset;

  sr_latch_1_5 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_NOR3X4 U3 ( .A(a), .B(preset), .C(b), .Z(reset) );
  HS65_LS_AO12X9 U4 ( .A(a), .B(b), .C(preset), .Z(set) );
endmodule


module latch_controller_0_0 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, n1;
  assign Rout = Aout;

  c_gate_1_0 gate ( .preset(preset), .a(n1), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 U1 ( .A(Ain), .Z(n1) );
  HS65_LSS_XOR2X6 U2 ( .A(Aout), .B(Ain), .Z(lt_en) );
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
  wire   lt_en, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31,
         N32, N33, N34, N35, N36, N37, N38, n2, n1, n3, n4;

  latch_controller_0_0 controller ( .preset(n1), .Rin(\left_in[REQ] ), .Aout(
        \left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX9 \data_reg[32]  ( .G(N5), .D(N38), .Q(\right_out[DATA][32] )
         );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N5), .D(N37), .Q(\right_out[DATA][31] )
         );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N5), .D(N36), .Q(\right_out[DATA][30] )
         );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N5), .D(N35), .Q(\right_out[DATA][29] )
         );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N5), .D(N34), .Q(\right_out[DATA][28] )
         );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N5), .D(N33), .Q(\right_out[DATA][27] )
         );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N5), .D(N32), .Q(\right_out[DATA][26] )
         );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N5), .D(N31), .Q(\right_out[DATA][25] )
         );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N5), .D(N30), .Q(\right_out[DATA][24] )
         );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N5), .D(N29), .Q(\right_out[DATA][23] )
         );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N5), .D(N28), .Q(\right_out[DATA][22] )
         );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N5), .D(N27), .Q(\right_out[DATA][21] )
         );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N5), .D(N26), .Q(\right_out[DATA][20] )
         );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N5), .D(N25), .Q(\right_out[DATA][19] )
         );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N5), .D(N24), .Q(\right_out[DATA][18] )
         );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N5), .D(N23), .Q(\right_out[DATA][17] )
         );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N5), .D(N22), .Q(\right_out[DATA][16] )
         );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N5), .D(N21), .Q(\right_out[DATA][15] )
         );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N5), .D(N20), .Q(\right_out[DATA][14] )
         );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N5), .D(N19), .Q(\right_out[DATA][13] )
         );
  HS65_LS_LDHQX9 \data_reg[12]  ( .G(N5), .D(N18), .Q(\right_out[DATA][12] )
         );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N5), .D(N17), .Q(\right_out[DATA][11] )
         );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N5), .D(N16), .Q(\right_out[DATA][10] )
         );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N5), .D(N15), .Q(\right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N5), .D(N14), .Q(\right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N5), .D(N13), .Q(\right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N5), .D(N12), .Q(\right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N5), .D(N11), .Q(\right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N5), .D(N10), .Q(\right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N5), .D(N9), .Q(\right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N5), .D(N8), .Q(\right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N5), .D(N7), .Q(\right_out[DATA][1] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N5), .D(N6), .Q(\right_out[DATA][0] ) );
  HS65_LS_LDLRQX9 type_out_reg ( .D(\left_in[DATA][33] ), .GN(lt_en), .RN(n4), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n4) );
  HS65_LS_IVX9 U4 ( .A(n4), .Z(n1) );
  HS65_LS_IVX9 U5 ( .A(n4), .Z(n3) );
  HS65_LS_NOR2AX3 U6 ( .A(\left_in[DATA][4] ), .B(n1), .Z(N10) );
  HS65_LS_NOR2AX3 U7 ( .A(\left_in[DATA][5] ), .B(n1), .Z(N11) );
  HS65_LS_NOR2AX3 U8 ( .A(\left_in[DATA][6] ), .B(n1), .Z(N12) );
  HS65_LS_NOR2AX3 U9 ( .A(\left_in[DATA][7] ), .B(n1), .Z(N13) );
  HS65_LS_NOR2AX3 U10 ( .A(\left_in[DATA][8] ), .B(n1), .Z(N14) );
  HS65_LS_NOR2AX3 U11 ( .A(\left_in[DATA][9] ), .B(n1), .Z(N15) );
  HS65_LS_NOR2AX3 U12 ( .A(\left_in[DATA][10] ), .B(n1), .Z(N16) );
  HS65_LS_NOR2AX3 U13 ( .A(\left_in[DATA][11] ), .B(n1), .Z(N17) );
  HS65_LS_NOR2AX3 U14 ( .A(\left_in[DATA][12] ), .B(n1), .Z(N18) );
  HS65_LS_NOR2AX3 U15 ( .A(\left_in[DATA][13] ), .B(n1), .Z(N19) );
  HS65_LS_NOR2AX3 U16 ( .A(\left_in[DATA][14] ), .B(n1), .Z(N20) );
  HS65_LS_NOR2AX3 U17 ( .A(\left_in[DATA][15] ), .B(n1), .Z(N21) );
  HS65_LS_NOR2AX3 U18 ( .A(\left_in[DATA][16] ), .B(n1), .Z(N22) );
  HS65_LS_NOR2AX3 U19 ( .A(\left_in[DATA][17] ), .B(n1), .Z(N23) );
  HS65_LS_NOR2AX3 U20 ( .A(\left_in[DATA][18] ), .B(n1), .Z(N24) );
  HS65_LS_NOR2AX3 U21 ( .A(\left_in[DATA][19] ), .B(n1), .Z(N25) );
  HS65_LS_NOR2AX3 U22 ( .A(\left_in[DATA][20] ), .B(n1), .Z(N26) );
  HS65_LS_NOR2AX3 U23 ( .A(\left_in[DATA][21] ), .B(n1), .Z(N27) );
  HS65_LS_NOR2AX3 U24 ( .A(\left_in[DATA][30] ), .B(n3), .Z(N36) );
  HS65_LS_NOR2AX3 U25 ( .A(\left_in[DATA][31] ), .B(n3), .Z(N37) );
  HS65_LS_NOR2AX3 U26 ( .A(\left_in[DATA][32] ), .B(n3), .Z(N38) );
  HS65_LS_NOR2AX3 U27 ( .A(\left_in[DATA][0] ), .B(n3), .Z(N6) );
  HS65_LS_NOR2AX3 U28 ( .A(\left_in[DATA][1] ), .B(n3), .Z(N7) );
  HS65_LS_NOR2AX3 U29 ( .A(\left_in[DATA][2] ), .B(n3), .Z(N8) );
  HS65_LS_NOR2AX3 U30 ( .A(\left_in[DATA][3] ), .B(n3), .Z(N9) );
  HS65_LS_NOR2AX3 U31 ( .A(\left_in[DATA][22] ), .B(n3), .Z(N28) );
  HS65_LS_NOR2AX3 U32 ( .A(\left_in[DATA][23] ), .B(n3), .Z(N29) );
  HS65_LS_NOR2AX3 U33 ( .A(\left_in[DATA][24] ), .B(n3), .Z(N30) );
  HS65_LS_NOR2AX3 U34 ( .A(\left_in[DATA][25] ), .B(n3), .Z(N31) );
  HS65_LS_NOR2AX3 U35 ( .A(\left_in[DATA][26] ), .B(n3), .Z(N32) );
  HS65_LS_NOR2AX3 U36 ( .A(\left_in[DATA][27] ), .B(n3), .Z(N33) );
  HS65_LS_NOR2AX3 U37 ( .A(\left_in[DATA][28] ), .B(n3), .Z(N34) );
  HS65_LS_NOR2AX3 U38 ( .A(\left_in[DATA][29] ), .B(n3), .Z(N35) );
  HS65_LS_OAI21X3 U39 ( .A(lt_en), .B(n2), .C(n4), .Z(N5) );
  HS65_LS_IVX9 U40 ( .A(\left_in[DATA][33] ), .Z(n2) );
endmodule


module sr_latch_1_1 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(qn), .Z(N1) );
  HS65_LS_IVX9 U2 ( .A(r), .Z(n1) );
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
  wire   Aout, n2;
  assign Rout = Aout;

  c_gate_1_1 gate ( .preset(preset), .a(n2), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 U1 ( .A(Ain), .Z(n2) );
  HS65_LSS_XOR2X6 U2 ( .A(Aout), .B(Ain), .Z(lt_en) );
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
  wire   lt_en, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31,
         N32, N33, N34, N35, N36, N37, N38, n1, n3, n4, n5;

  latch_controller_0_1 controller ( .preset(n1), .Rin(\left_in[REQ] ), .Aout(
        \left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX9 \data_reg[32]  ( .G(N5), .D(N38), .Q(\right_out[DATA][32] )
         );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N5), .D(N37), .Q(\right_out[DATA][31] )
         );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N5), .D(N36), .Q(\right_out[DATA][30] )
         );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N5), .D(N35), .Q(\right_out[DATA][29] )
         );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N5), .D(N34), .Q(\right_out[DATA][28] )
         );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N5), .D(N33), .Q(\right_out[DATA][27] )
         );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N5), .D(N32), .Q(\right_out[DATA][26] )
         );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N5), .D(N31), .Q(\right_out[DATA][25] )
         );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N5), .D(N30), .Q(\right_out[DATA][24] )
         );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N5), .D(N29), .Q(\right_out[DATA][23] )
         );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N5), .D(N28), .Q(\right_out[DATA][22] )
         );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N5), .D(N27), .Q(\right_out[DATA][21] )
         );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N5), .D(N26), .Q(\right_out[DATA][20] )
         );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N5), .D(N25), .Q(\right_out[DATA][19] )
         );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N5), .D(N24), .Q(\right_out[DATA][18] )
         );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N5), .D(N23), .Q(\right_out[DATA][17] )
         );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N5), .D(N22), .Q(\right_out[DATA][16] )
         );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N5), .D(N21), .Q(\right_out[DATA][15] )
         );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N5), .D(N20), .Q(\right_out[DATA][14] )
         );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N5), .D(N19), .Q(\right_out[DATA][13] )
         );
  HS65_LS_LDHQX9 \data_reg[12]  ( .G(N5), .D(N18), .Q(\right_out[DATA][12] )
         );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N5), .D(N17), .Q(\right_out[DATA][11] )
         );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N5), .D(N16), .Q(\right_out[DATA][10] )
         );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N5), .D(N15), .Q(\right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N5), .D(N14), .Q(\right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N5), .D(N13), .Q(\right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N5), .D(N12), .Q(\right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N5), .D(N11), .Q(\right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N5), .D(N10), .Q(\right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N5), .D(N9), .Q(\right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N5), .D(N8), .Q(\right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N5), .D(N7), .Q(\right_out[DATA][1] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N5), .D(N6), .Q(\right_out[DATA][0] ) );
  HS65_LS_LDLRQX9 type_out_reg ( .D(\left_in[DATA][33] ), .GN(lt_en), .RN(n4), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n4) );
  HS65_LS_IVX9 U4 ( .A(n4), .Z(n1) );
  HS65_LS_IVX9 U5 ( .A(n4), .Z(n3) );
  HS65_LS_NOR2AX3 U6 ( .A(\left_in[DATA][0] ), .B(n3), .Z(N6) );
  HS65_LS_NOR2AX3 U7 ( .A(\left_in[DATA][2] ), .B(n3), .Z(N8) );
  HS65_LS_NOR2AX3 U8 ( .A(\left_in[DATA][10] ), .B(n1), .Z(N16) );
  HS65_LS_NOR2AX3 U9 ( .A(\left_in[DATA][12] ), .B(n1), .Z(N18) );
  HS65_LS_NOR2AX3 U10 ( .A(\left_in[DATA][14] ), .B(n1), .Z(N20) );
  HS65_LS_NOR2AX3 U11 ( .A(\left_in[DATA][16] ), .B(n1), .Z(N22) );
  HS65_LS_NOR2AX3 U12 ( .A(\left_in[DATA][18] ), .B(n1), .Z(N24) );
  HS65_LS_NOR2AX3 U13 ( .A(\left_in[DATA][20] ), .B(n1), .Z(N26) );
  HS65_LS_NOR2AX3 U14 ( .A(\left_in[DATA][22] ), .B(n3), .Z(N28) );
  HS65_LS_NOR2AX3 U15 ( .A(\left_in[DATA][24] ), .B(n3), .Z(N30) );
  HS65_LS_NOR2AX3 U16 ( .A(\left_in[DATA][26] ), .B(n3), .Z(N32) );
  HS65_LS_NOR2AX3 U17 ( .A(\left_in[DATA][28] ), .B(n3), .Z(N34) );
  HS65_LS_NOR2AX3 U18 ( .A(\left_in[DATA][30] ), .B(n3), .Z(N36) );
  HS65_LS_NOR2AX3 U19 ( .A(\left_in[DATA][4] ), .B(n1), .Z(N10) );
  HS65_LS_NOR2AX3 U20 ( .A(\left_in[DATA][6] ), .B(n1), .Z(N12) );
  HS65_LS_NOR2AX3 U21 ( .A(\left_in[DATA][8] ), .B(n1), .Z(N14) );
  HS65_LS_NOR2AX3 U22 ( .A(\left_in[DATA][5] ), .B(n1), .Z(N11) );
  HS65_LS_NOR2AX3 U23 ( .A(\left_in[DATA][7] ), .B(n1), .Z(N13) );
  HS65_LS_NOR2AX3 U24 ( .A(\left_in[DATA][9] ), .B(n1), .Z(N15) );
  HS65_LS_NOR2AX3 U25 ( .A(\left_in[DATA][11] ), .B(n1), .Z(N17) );
  HS65_LS_NOR2AX3 U26 ( .A(\left_in[DATA][13] ), .B(n1), .Z(N19) );
  HS65_LS_NOR2AX3 U27 ( .A(\left_in[DATA][15] ), .B(n1), .Z(N21) );
  HS65_LS_NOR2AX3 U28 ( .A(\left_in[DATA][17] ), .B(n1), .Z(N23) );
  HS65_LS_NOR2AX3 U29 ( .A(\left_in[DATA][19] ), .B(n1), .Z(N25) );
  HS65_LS_NOR2AX3 U30 ( .A(\left_in[DATA][21] ), .B(n1), .Z(N27) );
  HS65_LS_NOR2AX3 U31 ( .A(\left_in[DATA][31] ), .B(n3), .Z(N37) );
  HS65_LS_NOR2AX3 U32 ( .A(\left_in[DATA][32] ), .B(n3), .Z(N38) );
  HS65_LS_NOR2AX3 U33 ( .A(\left_in[DATA][1] ), .B(n3), .Z(N7) );
  HS65_LS_NOR2AX3 U34 ( .A(\left_in[DATA][3] ), .B(n3), .Z(N9) );
  HS65_LS_NOR2AX3 U35 ( .A(\left_in[DATA][23] ), .B(n3), .Z(N29) );
  HS65_LS_NOR2AX3 U36 ( .A(\left_in[DATA][25] ), .B(n3), .Z(N31) );
  HS65_LS_NOR2AX3 U37 ( .A(\left_in[DATA][27] ), .B(n3), .Z(N33) );
  HS65_LS_NOR2AX3 U38 ( .A(\left_in[DATA][29] ), .B(n3), .Z(N35) );
  HS65_LS_OAI21X3 U39 ( .A(lt_en), .B(n5), .C(n4), .Z(N5) );
  HS65_LS_IVX9 U40 ( .A(\left_in[DATA][33] ), .Z(n5) );
endmodule


module sr_latch_1_2 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(qn), .Z(N1) );
  HS65_LS_IVX9 U2 ( .A(r), .Z(n1) );
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
  wire   Aout, n2;
  assign Rout = Aout;

  c_gate_1_2 gate ( .preset(preset), .a(n2), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 U1 ( .A(Ain), .Z(n2) );
  HS65_LSS_XOR2X6 U2 ( .A(Aout), .B(Ain), .Z(lt_en) );
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
  wire   lt_en, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31,
         N32, N33, N34, N35, N36, N37, N38, n1, n3, n4, n5;

  latch_controller_0_2 controller ( .preset(n1), .Rin(\left_in[REQ] ), .Aout(
        \left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX9 \data_reg[32]  ( .G(N5), .D(N38), .Q(\right_out[DATA][32] )
         );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N5), .D(N37), .Q(\right_out[DATA][31] )
         );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N5), .D(N36), .Q(\right_out[DATA][30] )
         );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N5), .D(N35), .Q(\right_out[DATA][29] )
         );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N5), .D(N34), .Q(\right_out[DATA][28] )
         );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N5), .D(N33), .Q(\right_out[DATA][27] )
         );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N5), .D(N32), .Q(\right_out[DATA][26] )
         );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N5), .D(N31), .Q(\right_out[DATA][25] )
         );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N5), .D(N30), .Q(\right_out[DATA][24] )
         );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N5), .D(N29), .Q(\right_out[DATA][23] )
         );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N5), .D(N28), .Q(\right_out[DATA][22] )
         );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N5), .D(N27), .Q(\right_out[DATA][21] )
         );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N5), .D(N26), .Q(\right_out[DATA][20] )
         );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N5), .D(N25), .Q(\right_out[DATA][19] )
         );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N5), .D(N24), .Q(\right_out[DATA][18] )
         );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N5), .D(N23), .Q(\right_out[DATA][17] )
         );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N5), .D(N22), .Q(\right_out[DATA][16] )
         );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N5), .D(N21), .Q(\right_out[DATA][15] )
         );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N5), .D(N20), .Q(\right_out[DATA][14] )
         );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N5), .D(N19), .Q(\right_out[DATA][13] )
         );
  HS65_LS_LDHQX9 \data_reg[12]  ( .G(N5), .D(N18), .Q(\right_out[DATA][12] )
         );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N5), .D(N17), .Q(\right_out[DATA][11] )
         );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N5), .D(N16), .Q(\right_out[DATA][10] )
         );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N5), .D(N15), .Q(\right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N5), .D(N14), .Q(\right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N5), .D(N13), .Q(\right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N5), .D(N12), .Q(\right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N5), .D(N11), .Q(\right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N5), .D(N10), .Q(\right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N5), .D(N9), .Q(\right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N5), .D(N8), .Q(\right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N5), .D(N7), .Q(\right_out[DATA][1] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N5), .D(N6), .Q(\right_out[DATA][0] ) );
  HS65_LS_LDLRQX9 type_out_reg ( .D(\left_in[DATA][33] ), .GN(lt_en), .RN(n4), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n4) );
  HS65_LS_IVX9 U4 ( .A(n4), .Z(n1) );
  HS65_LS_IVX9 U5 ( .A(n4), .Z(n3) );
  HS65_LS_NOR2AX3 U6 ( .A(\left_in[DATA][4] ), .B(n1), .Z(N10) );
  HS65_LS_NOR2AX3 U7 ( .A(\left_in[DATA][6] ), .B(n1), .Z(N12) );
  HS65_LS_NOR2AX3 U8 ( .A(\left_in[DATA][8] ), .B(n1), .Z(N14) );
  HS65_LS_NOR2AX3 U9 ( .A(\left_in[DATA][1] ), .B(n3), .Z(N7) );
  HS65_LS_NOR2AX3 U10 ( .A(\left_in[DATA][11] ), .B(n1), .Z(N17) );
  HS65_LS_NOR2AX3 U11 ( .A(\left_in[DATA][13] ), .B(n1), .Z(N19) );
  HS65_LS_NOR2AX3 U12 ( .A(\left_in[DATA][15] ), .B(n1), .Z(N21) );
  HS65_LS_NOR2AX3 U13 ( .A(\left_in[DATA][17] ), .B(n1), .Z(N23) );
  HS65_LS_NOR2AX3 U14 ( .A(\left_in[DATA][19] ), .B(n1), .Z(N25) );
  HS65_LS_NOR2AX3 U15 ( .A(\left_in[DATA][21] ), .B(n1), .Z(N27) );
  HS65_LS_NOR2AX3 U16 ( .A(\left_in[DATA][23] ), .B(n3), .Z(N29) );
  HS65_LS_NOR2AX3 U17 ( .A(\left_in[DATA][25] ), .B(n3), .Z(N31) );
  HS65_LS_NOR2AX3 U18 ( .A(\left_in[DATA][27] ), .B(n3), .Z(N33) );
  HS65_LS_NOR2AX3 U19 ( .A(\left_in[DATA][10] ), .B(n1), .Z(N16) );
  HS65_LS_NOR2AX3 U20 ( .A(\left_in[DATA][12] ), .B(n1), .Z(N18) );
  HS65_LS_NOR2AX3 U21 ( .A(\left_in[DATA][14] ), .B(n1), .Z(N20) );
  HS65_LS_NOR2AX3 U22 ( .A(\left_in[DATA][5] ), .B(n1), .Z(N11) );
  HS65_LS_NOR2AX3 U23 ( .A(\left_in[DATA][7] ), .B(n1), .Z(N13) );
  HS65_LS_NOR2AX3 U24 ( .A(\left_in[DATA][9] ), .B(n1), .Z(N15) );
  HS65_LS_NOR2AX3 U25 ( .A(\left_in[DATA][16] ), .B(n1), .Z(N22) );
  HS65_LS_NOR2AX3 U26 ( .A(\left_in[DATA][18] ), .B(n1), .Z(N24) );
  HS65_LS_NOR2AX3 U27 ( .A(\left_in[DATA][20] ), .B(n1), .Z(N26) );
  HS65_LS_NOR2AX3 U28 ( .A(\left_in[DATA][0] ), .B(n3), .Z(N6) );
  HS65_LS_NOR2AX3 U29 ( .A(\left_in[DATA][30] ), .B(n3), .Z(N36) );
  HS65_LS_NOR2AX3 U30 ( .A(\left_in[DATA][31] ), .B(n3), .Z(N37) );
  HS65_LS_NOR2AX3 U31 ( .A(\left_in[DATA][32] ), .B(n3), .Z(N38) );
  HS65_LS_NOR2AX3 U32 ( .A(\left_in[DATA][2] ), .B(n3), .Z(N8) );
  HS65_LS_NOR2AX3 U33 ( .A(\left_in[DATA][3] ), .B(n3), .Z(N9) );
  HS65_LS_NOR2AX3 U34 ( .A(\left_in[DATA][22] ), .B(n3), .Z(N28) );
  HS65_LS_NOR2AX3 U35 ( .A(\left_in[DATA][24] ), .B(n3), .Z(N30) );
  HS65_LS_NOR2AX3 U36 ( .A(\left_in[DATA][26] ), .B(n3), .Z(N32) );
  HS65_LS_NOR2AX3 U37 ( .A(\left_in[DATA][28] ), .B(n3), .Z(N34) );
  HS65_LS_NOR2AX3 U38 ( .A(\left_in[DATA][29] ), .B(n3), .Z(N35) );
  HS65_LS_OAI21X3 U39 ( .A(lt_en), .B(n5), .C(n4), .Z(N5) );
  HS65_LS_IVX9 U40 ( .A(\left_in[DATA][33] ), .Z(n5) );
endmodule


module sr_latch_1_3 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(qn), .Z(N1) );
  HS65_LS_IVX9 U2 ( .A(r), .Z(n1) );
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
  wire   Aout, n2;
  assign Rout = Aout;

  c_gate_1_3 gate ( .preset(preset), .a(n2), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 U1 ( .A(Ain), .Z(n2) );
  HS65_LSS_XOR2X6 U2 ( .A(Aout), .B(Ain), .Z(lt_en) );
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
  wire   lt_en, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31,
         N32, N33, N34, N35, N36, N37, N38, n1, n3, n4, n5;

  latch_controller_0_3 controller ( .preset(n1), .Rin(\left_in[REQ] ), .Aout(
        \left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX9 \data_reg[32]  ( .G(N5), .D(N38), .Q(\right_out[DATA][32] )
         );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N5), .D(N37), .Q(\right_out[DATA][31] )
         );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N5), .D(N36), .Q(\right_out[DATA][30] )
         );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N5), .D(N35), .Q(\right_out[DATA][29] )
         );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N5), .D(N34), .Q(\right_out[DATA][28] )
         );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N5), .D(N33), .Q(\right_out[DATA][27] )
         );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N5), .D(N32), .Q(\right_out[DATA][26] )
         );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N5), .D(N31), .Q(\right_out[DATA][25] )
         );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N5), .D(N30), .Q(\right_out[DATA][24] )
         );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N5), .D(N29), .Q(\right_out[DATA][23] )
         );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N5), .D(N28), .Q(\right_out[DATA][22] )
         );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N5), .D(N27), .Q(\right_out[DATA][21] )
         );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N5), .D(N26), .Q(\right_out[DATA][20] )
         );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N5), .D(N25), .Q(\right_out[DATA][19] )
         );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N5), .D(N24), .Q(\right_out[DATA][18] )
         );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N5), .D(N23), .Q(\right_out[DATA][17] )
         );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N5), .D(N22), .Q(\right_out[DATA][16] )
         );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N5), .D(N21), .Q(\right_out[DATA][15] )
         );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N5), .D(N20), .Q(\right_out[DATA][14] )
         );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N5), .D(N19), .Q(\right_out[DATA][13] )
         );
  HS65_LS_LDHQX9 \data_reg[12]  ( .G(N5), .D(N18), .Q(\right_out[DATA][12] )
         );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N5), .D(N17), .Q(\right_out[DATA][11] )
         );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N5), .D(N16), .Q(\right_out[DATA][10] )
         );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N5), .D(N15), .Q(\right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N5), .D(N14), .Q(\right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N5), .D(N13), .Q(\right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N5), .D(N12), .Q(\right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N5), .D(N11), .Q(\right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N5), .D(N10), .Q(\right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N5), .D(N9), .Q(\right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N5), .D(N8), .Q(\right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N5), .D(N7), .Q(\right_out[DATA][1] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N5), .D(N6), .Q(\right_out[DATA][0] ) );
  HS65_LS_LDLRQX9 type_out_reg ( .D(\left_in[DATA][33] ), .GN(lt_en), .RN(n4), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n4) );
  HS65_LS_IVX9 U4 ( .A(n4), .Z(n1) );
  HS65_LS_IVX9 U5 ( .A(n4), .Z(n3) );
  HS65_LS_NOR2AX3 U6 ( .A(\left_in[DATA][3] ), .B(n3), .Z(N9) );
  HS65_LS_NOR2AX3 U7 ( .A(\left_in[DATA][4] ), .B(n1), .Z(N10) );
  HS65_LS_NOR2AX3 U8 ( .A(\left_in[DATA][5] ), .B(n1), .Z(N11) );
  HS65_LS_NOR2AX3 U9 ( .A(\left_in[DATA][6] ), .B(n1), .Z(N12) );
  HS65_LS_NOR2AX3 U10 ( .A(\left_in[DATA][7] ), .B(n1), .Z(N13) );
  HS65_LS_NOR2AX3 U11 ( .A(\left_in[DATA][8] ), .B(n1), .Z(N14) );
  HS65_LS_NOR2AX3 U12 ( .A(\left_in[DATA][10] ), .B(n1), .Z(N16) );
  HS65_LS_NOR2AX3 U13 ( .A(\left_in[DATA][11] ), .B(n1), .Z(N17) );
  HS65_LS_NOR2AX3 U14 ( .A(\left_in[DATA][12] ), .B(n1), .Z(N18) );
  HS65_LS_NOR2AX3 U15 ( .A(\left_in[DATA][13] ), .B(n1), .Z(N19) );
  HS65_LS_NOR2AX3 U16 ( .A(\left_in[DATA][14] ), .B(n1), .Z(N20) );
  HS65_LS_NOR2AX3 U17 ( .A(\left_in[DATA][9] ), .B(n1), .Z(N15) );
  HS65_LS_NOR2AX3 U18 ( .A(\left_in[DATA][15] ), .B(n1), .Z(N21) );
  HS65_LS_NOR2AX3 U19 ( .A(\left_in[DATA][16] ), .B(n1), .Z(N22) );
  HS65_LS_NOR2AX3 U20 ( .A(\left_in[DATA][17] ), .B(n1), .Z(N23) );
  HS65_LS_NOR2AX3 U21 ( .A(\left_in[DATA][18] ), .B(n1), .Z(N24) );
  HS65_LS_NOR2AX3 U22 ( .A(\left_in[DATA][19] ), .B(n1), .Z(N25) );
  HS65_LS_NOR2AX3 U23 ( .A(\left_in[DATA][20] ), .B(n1), .Z(N26) );
  HS65_LS_NOR2AX3 U24 ( .A(\left_in[DATA][21] ), .B(n1), .Z(N27) );
  HS65_LS_NOR2AX3 U25 ( .A(\left_in[DATA][0] ), .B(n3), .Z(N6) );
  HS65_LS_NOR2AX3 U26 ( .A(\left_in[DATA][30] ), .B(n3), .Z(N36) );
  HS65_LS_NOR2AX3 U27 ( .A(\left_in[DATA][31] ), .B(n3), .Z(N37) );
  HS65_LS_NOR2AX3 U28 ( .A(\left_in[DATA][32] ), .B(n3), .Z(N38) );
  HS65_LS_NOR2AX3 U29 ( .A(\left_in[DATA][1] ), .B(n3), .Z(N7) );
  HS65_LS_NOR2AX3 U30 ( .A(\left_in[DATA][2] ), .B(n3), .Z(N8) );
  HS65_LS_NOR2AX3 U31 ( .A(\left_in[DATA][22] ), .B(n3), .Z(N28) );
  HS65_LS_NOR2AX3 U32 ( .A(\left_in[DATA][23] ), .B(n3), .Z(N29) );
  HS65_LS_NOR2AX3 U33 ( .A(\left_in[DATA][24] ), .B(n3), .Z(N30) );
  HS65_LS_NOR2AX3 U34 ( .A(\left_in[DATA][25] ), .B(n3), .Z(N31) );
  HS65_LS_NOR2AX3 U35 ( .A(\left_in[DATA][26] ), .B(n3), .Z(N32) );
  HS65_LS_NOR2AX3 U36 ( .A(\left_in[DATA][27] ), .B(n3), .Z(N33) );
  HS65_LS_NOR2AX3 U37 ( .A(\left_in[DATA][28] ), .B(n3), .Z(N34) );
  HS65_LS_NOR2AX3 U38 ( .A(\left_in[DATA][29] ), .B(n3), .Z(N35) );
  HS65_LS_OAI21X3 U39 ( .A(lt_en), .B(n5), .C(n4), .Z(N5) );
  HS65_LS_IVX9 U40 ( .A(\left_in[DATA][33] ), .Z(n5) );
endmodule


module sr_latch_1_4 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(qn), .Z(N1) );
  HS65_LS_IVX9 U2 ( .A(r), .Z(n1) );
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
  wire   Aout, n2;
  assign Rout = Aout;

  c_gate_1_4 gate ( .preset(preset), .a(n2), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 U1 ( .A(Ain), .Z(n2) );
  HS65_LSS_XOR2X6 U2 ( .A(Aout), .B(Ain), .Z(lt_en) );
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
  wire   lt_en, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31,
         N32, N33, N34, N35, N36, N37, N38, n1, n3, n4, n5;

  latch_controller_0_4 controller ( .preset(n1), .Rin(\left_in[REQ] ), .Aout(
        \left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX9 \data_reg[32]  ( .G(N5), .D(N38), .Q(\right_out[DATA][32] )
         );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N5), .D(N37), .Q(\right_out[DATA][31] )
         );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N5), .D(N36), .Q(\right_out[DATA][30] )
         );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N5), .D(N35), .Q(\right_out[DATA][29] )
         );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N5), .D(N34), .Q(\right_out[DATA][28] )
         );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N5), .D(N33), .Q(\right_out[DATA][27] )
         );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N5), .D(N32), .Q(\right_out[DATA][26] )
         );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N5), .D(N31), .Q(\right_out[DATA][25] )
         );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N5), .D(N30), .Q(\right_out[DATA][24] )
         );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N5), .D(N29), .Q(\right_out[DATA][23] )
         );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N5), .D(N28), .Q(\right_out[DATA][22] )
         );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N5), .D(N27), .Q(\right_out[DATA][21] )
         );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N5), .D(N26), .Q(\right_out[DATA][20] )
         );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N5), .D(N25), .Q(\right_out[DATA][19] )
         );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N5), .D(N24), .Q(\right_out[DATA][18] )
         );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N5), .D(N23), .Q(\right_out[DATA][17] )
         );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N5), .D(N22), .Q(\right_out[DATA][16] )
         );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N5), .D(N21), .Q(\right_out[DATA][15] )
         );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N5), .D(N20), .Q(\right_out[DATA][14] )
         );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N5), .D(N19), .Q(\right_out[DATA][13] )
         );
  HS65_LS_LDHQX9 \data_reg[12]  ( .G(N5), .D(N18), .Q(\right_out[DATA][12] )
         );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N5), .D(N17), .Q(\right_out[DATA][11] )
         );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N5), .D(N16), .Q(\right_out[DATA][10] )
         );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N5), .D(N15), .Q(\right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N5), .D(N14), .Q(\right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N5), .D(N13), .Q(\right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N5), .D(N12), .Q(\right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N5), .D(N11), .Q(\right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N5), .D(N10), .Q(\right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N5), .D(N9), .Q(\right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N5), .D(N8), .Q(\right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N5), .D(N7), .Q(\right_out[DATA][1] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N5), .D(N6), .Q(\right_out[DATA][0] ) );
  HS65_LS_LDLRQX9 type_out_reg ( .D(\left_in[DATA][33] ), .GN(lt_en), .RN(n4), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n4) );
  HS65_LS_IVX9 U4 ( .A(n4), .Z(n1) );
  HS65_LS_IVX9 U5 ( .A(n4), .Z(n3) );
  HS65_LS_NOR2AX3 U6 ( .A(\left_in[DATA][4] ), .B(n1), .Z(N10) );
  HS65_LS_NOR2AX3 U7 ( .A(\left_in[DATA][6] ), .B(n1), .Z(N12) );
  HS65_LS_NOR2AX3 U8 ( .A(\left_in[DATA][8] ), .B(n1), .Z(N14) );
  HS65_LS_NOR2AX3 U9 ( .A(\left_in[DATA][1] ), .B(n3), .Z(N7) );
  HS65_LS_NOR2AX3 U10 ( .A(\left_in[DATA][11] ), .B(n1), .Z(N17) );
  HS65_LS_NOR2AX3 U11 ( .A(\left_in[DATA][13] ), .B(n1), .Z(N19) );
  HS65_LS_NOR2AX3 U12 ( .A(\left_in[DATA][15] ), .B(n1), .Z(N21) );
  HS65_LS_NOR2AX3 U13 ( .A(\left_in[DATA][17] ), .B(n1), .Z(N23) );
  HS65_LS_NOR2AX3 U14 ( .A(\left_in[DATA][19] ), .B(n1), .Z(N25) );
  HS65_LS_NOR2AX3 U15 ( .A(\left_in[DATA][21] ), .B(n1), .Z(N27) );
  HS65_LS_NOR2AX3 U16 ( .A(\left_in[DATA][23] ), .B(n3), .Z(N29) );
  HS65_LS_NOR2AX3 U17 ( .A(\left_in[DATA][25] ), .B(n3), .Z(N31) );
  HS65_LS_NOR2AX3 U18 ( .A(\left_in[DATA][27] ), .B(n3), .Z(N33) );
  HS65_LS_NOR2AX3 U19 ( .A(\left_in[DATA][10] ), .B(n1), .Z(N16) );
  HS65_LS_NOR2AX3 U20 ( .A(\left_in[DATA][12] ), .B(n1), .Z(N18) );
  HS65_LS_NOR2AX3 U21 ( .A(\left_in[DATA][14] ), .B(n1), .Z(N20) );
  HS65_LS_NOR2AX3 U22 ( .A(\left_in[DATA][5] ), .B(n1), .Z(N11) );
  HS65_LS_NOR2AX3 U23 ( .A(\left_in[DATA][7] ), .B(n1), .Z(N13) );
  HS65_LS_NOR2AX3 U24 ( .A(\left_in[DATA][9] ), .B(n1), .Z(N15) );
  HS65_LS_NOR2AX3 U25 ( .A(\left_in[DATA][16] ), .B(n1), .Z(N22) );
  HS65_LS_NOR2AX3 U26 ( .A(\left_in[DATA][18] ), .B(n1), .Z(N24) );
  HS65_LS_NOR2AX3 U27 ( .A(\left_in[DATA][20] ), .B(n1), .Z(N26) );
  HS65_LS_NOR2AX3 U28 ( .A(\left_in[DATA][0] ), .B(n3), .Z(N6) );
  HS65_LS_NOR2AX3 U29 ( .A(\left_in[DATA][30] ), .B(n3), .Z(N36) );
  HS65_LS_NOR2AX3 U30 ( .A(\left_in[DATA][31] ), .B(n3), .Z(N37) );
  HS65_LS_NOR2AX3 U31 ( .A(\left_in[DATA][32] ), .B(n3), .Z(N38) );
  HS65_LS_NOR2AX3 U32 ( .A(\left_in[DATA][2] ), .B(n3), .Z(N8) );
  HS65_LS_NOR2AX3 U33 ( .A(\left_in[DATA][3] ), .B(n3), .Z(N9) );
  HS65_LS_NOR2AX3 U34 ( .A(\left_in[DATA][22] ), .B(n3), .Z(N28) );
  HS65_LS_NOR2AX3 U35 ( .A(\left_in[DATA][24] ), .B(n3), .Z(N30) );
  HS65_LS_NOR2AX3 U36 ( .A(\left_in[DATA][26] ), .B(n3), .Z(N32) );
  HS65_LS_NOR2AX3 U37 ( .A(\left_in[DATA][28] ), .B(n3), .Z(N34) );
  HS65_LS_NOR2AX3 U38 ( .A(\left_in[DATA][29] ), .B(n3), .Z(N35) );
  HS65_LS_OAI21X3 U39 ( .A(lt_en), .B(n5), .C(n4), .Z(N5) );
  HS65_LS_IVX9 U40 ( .A(\left_in[DATA][33] ), .Z(n5) );
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

  crossbar_x0_y0 crossbar ( .preset(n1), .switch_sel({\switch_sel[4][4] , 
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


module sr_latch_0_6 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_6 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_6 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_6 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, not_Ain;
  assign Rout = Aout;

  c_gate_0_6 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LSS_XOR2X6 U1 ( .A(Aout), .B(Ain), .Z(lt_en) );
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
  wire   lt_en, N5, n1, n3;

  latch_controller_1_6 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX18 \data_reg[32]  ( .G(N5), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N5), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N5), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N5), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N5), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N5), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N5), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N5), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N5), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N5), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N5), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N5), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N5), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N5), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N5), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N5), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N5), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N5), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N5), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N5), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX9 \data_reg[12]  ( .G(N5), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N5), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N5), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N5), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N5), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N5), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N5), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N5), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N5), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N5), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N5), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N5), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LS_LDLRQX9 type_out_reg ( .D(\left_in[DATA][33] ), .GN(lt_en), .RN(n1), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N5), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(lt_en), .B(n3), .C(n1), .Z(N5) );
  HS65_LS_IVX9 U5 ( .A(\left_in[DATA][33] ), .Z(n3) );
endmodule


module sr_latch_0_7 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_7 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_7 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_7 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, not_Ain;
  assign Rout = Aout;

  c_gate_0_7 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LSS_XOR2X6 U1 ( .A(Aout), .B(Ain), .Z(lt_en) );
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
  wire   lt_en, N5, n1, n3;

  latch_controller_1_7 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX18 \data_reg[32]  ( .G(N5), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N5), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N5), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N5), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N5), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N5), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N5), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N5), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N5), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N5), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N5), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N5), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N5), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N5), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N5), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N5), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N5), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N5), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N5), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N5), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX9 \data_reg[12]  ( .G(N5), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N5), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N5), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N5), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N5), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N5), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N5), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N5), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N5), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N5), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N5), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N5), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LS_LDLRQX9 type_out_reg ( .D(\left_in[DATA][33] ), .GN(lt_en), .RN(n1), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N5), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(lt_en), .B(n3), .C(n1), .Z(N5) );
  HS65_LS_IVX9 U5 ( .A(\left_in[DATA][33] ), .Z(n3) );
endmodule


module sr_latch_0_8 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_8 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_8 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_8 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, not_Ain;
  assign Rout = Aout;

  c_gate_0_8 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LSS_XOR2X6 U1 ( .A(Aout), .B(Ain), .Z(lt_en) );
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
  wire   lt_en, N5, n1, n3;

  latch_controller_1_8 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDLRQX18 type_out_reg ( .D(\left_in[DATA][33] ), .GN(lt_en), .RN(n1), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_LDHQX18 \data_reg[32]  ( .G(N5), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N5), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N5), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N5), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N5), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N5), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N5), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N5), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N5), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N5), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N5), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N5), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N5), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N5), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N5), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N5), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N5), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N5), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N5), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N5), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N5), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N5), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N5), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N5), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX9 \data_reg[12]  ( .G(N5), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N5), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N5), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N5), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N5), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N5), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N5), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N5), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N5), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(lt_en), .B(n3), .C(n1), .Z(N5) );
  HS65_LS_IVX9 U5 ( .A(\left_in[DATA][33] ), .Z(n3) );
endmodule


module sr_latch_0_9 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_9 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_9 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_9 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   Aout, not_Ain;
  assign Rout = Aout;

  c_gate_0_9 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Aout) );
  HS65_LS_IVX9 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LSS_XOR2X6 U1 ( .A(Aout), .B(Ain), .Z(lt_en) );
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
  wire   lt_en, N5, n1, n3;

  latch_controller_1_9 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDLRQX18 type_out_reg ( .D(\left_in[DATA][33] ), .GN(lt_en), .RN(n1), 
        .Q(\right_out[DATA][33] ) );
  HS65_LS_LDHQX18 \data_reg[32]  ( .G(N5), .D(\left_in[DATA][32] ), .Q(
        \right_out[DATA][32] ) );
  HS65_LS_LDHQX9 \data_reg[30]  ( .G(N5), .D(\left_in[DATA][30] ), .Q(
        \right_out[DATA][30] ) );
  HS65_LS_LDHQX9 \data_reg[28]  ( .G(N5), .D(\left_in[DATA][28] ), .Q(
        \right_out[DATA][28] ) );
  HS65_LS_LDHQX9 \data_reg[26]  ( .G(N5), .D(\left_in[DATA][26] ), .Q(
        \right_out[DATA][26] ) );
  HS65_LS_LDHQX9 \data_reg[24]  ( .G(N5), .D(\left_in[DATA][24] ), .Q(
        \right_out[DATA][24] ) );
  HS65_LS_LDHQX9 \data_reg[22]  ( .G(N5), .D(\left_in[DATA][22] ), .Q(
        \right_out[DATA][22] ) );
  HS65_LS_LDHQX9 \data_reg[20]  ( .G(N5), .D(\left_in[DATA][20] ), .Q(
        \right_out[DATA][20] ) );
  HS65_LS_LDHQX9 \data_reg[18]  ( .G(N5), .D(\left_in[DATA][18] ), .Q(
        \right_out[DATA][18] ) );
  HS65_LS_LDHQX9 \data_reg[16]  ( .G(N5), .D(\left_in[DATA][16] ), .Q(
        \right_out[DATA][16] ) );
  HS65_LS_LDHQX9 \data_reg[14]  ( .G(N5), .D(\left_in[DATA][14] ), .Q(
        \right_out[DATA][14] ) );
  HS65_LS_LDHQX9 \data_reg[12]  ( .G(N5), .D(\left_in[DATA][12] ), .Q(
        \right_out[DATA][12] ) );
  HS65_LS_LDHQX9 \data_reg[10]  ( .G(N5), .D(\left_in[DATA][10] ), .Q(
        \right_out[DATA][10] ) );
  HS65_LS_LDHQX9 \data_reg[8]  ( .G(N5), .D(\left_in[DATA][8] ), .Q(
        \right_out[DATA][8] ) );
  HS65_LS_LDHQX9 \data_reg[6]  ( .G(N5), .D(\left_in[DATA][6] ), .Q(
        \right_out[DATA][6] ) );
  HS65_LS_LDHQX9 \data_reg[4]  ( .G(N5), .D(\left_in[DATA][4] ), .Q(
        \right_out[DATA][4] ) );
  HS65_LS_LDHQX9 \data_reg[2]  ( .G(N5), .D(\left_in[DATA][2] ), .Q(
        \right_out[DATA][2] ) );
  HS65_LS_LDHQX9 \data_reg[29]  ( .G(N5), .D(\left_in[DATA][29] ), .Q(
        \right_out[DATA][29] ) );
  HS65_LS_LDHQX9 \data_reg[27]  ( .G(N5), .D(\left_in[DATA][27] ), .Q(
        \right_out[DATA][27] ) );
  HS65_LS_LDHQX9 \data_reg[25]  ( .G(N5), .D(\left_in[DATA][25] ), .Q(
        \right_out[DATA][25] ) );
  HS65_LS_LDHQX9 \data_reg[23]  ( .G(N5), .D(\left_in[DATA][23] ), .Q(
        \right_out[DATA][23] ) );
  HS65_LS_LDHQX9 \data_reg[21]  ( .G(N5), .D(\left_in[DATA][21] ), .Q(
        \right_out[DATA][21] ) );
  HS65_LS_LDHQX9 \data_reg[19]  ( .G(N5), .D(\left_in[DATA][19] ), .Q(
        \right_out[DATA][19] ) );
  HS65_LS_LDHQX9 \data_reg[17]  ( .G(N5), .D(\left_in[DATA][17] ), .Q(
        \right_out[DATA][17] ) );
  HS65_LS_LDHQX9 \data_reg[15]  ( .G(N5), .D(\left_in[DATA][15] ), .Q(
        \right_out[DATA][15] ) );
  HS65_LS_LDHQX9 \data_reg[13]  ( .G(N5), .D(\left_in[DATA][13] ), .Q(
        \right_out[DATA][13] ) );
  HS65_LS_LDHQX9 \data_reg[11]  ( .G(N5), .D(\left_in[DATA][11] ), .Q(
        \right_out[DATA][11] ) );
  HS65_LS_LDHQX9 \data_reg[7]  ( .G(N5), .D(\left_in[DATA][7] ), .Q(
        \right_out[DATA][7] ) );
  HS65_LS_LDHQX9 \data_reg[5]  ( .G(N5), .D(\left_in[DATA][5] ), .Q(
        \right_out[DATA][5] ) );
  HS65_LS_LDHQX9 \data_reg[3]  ( .G(N5), .D(\left_in[DATA][3] ), .Q(
        \right_out[DATA][3] ) );
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N5), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_LDHQX9 \data_reg[31]  ( .G(N5), .D(\left_in[DATA][31] ), .Q(
        \right_out[DATA][31] ) );
  HS65_LS_LDHQX9 \data_reg[0]  ( .G(N5), .D(\left_in[DATA][0] ), .Q(
        \right_out[DATA][0] ) );
  HS65_LS_LDHQX9 \data_reg[1]  ( .G(N5), .D(\left_in[DATA][1] ), .Q(
        \right_out[DATA][1] ) );
  HS65_LS_IVX9 U3 ( .A(preset), .Z(n1) );
  HS65_LS_OAI21X3 U4 ( .A(lt_en), .B(n3), .C(n1), .Z(N5) );
  HS65_LS_IVX9 U5 ( .A(\left_in[DATA][33] ), .Z(n3) );
endmodule


module noc_switch_x0_y0 ( preset, north_in_f, east_in_f, south_in_f, west_in_f, 
        resource_in_f, north_out_f, east_out_f, south_out_f, west_out_f, 
        resource_out_f, north_in_b_ACK, east_in_b_ACK, south_in_b_ACK, 
        west_in_b_ACK, resource_in_b_ACK, north_out_b_ACK, east_out_b_ACK, 
        south_out_b_ACK, west_out_b_ACK, resource_out_b_ACK );
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
  input preset, north_out_b_ACK, east_out_b_ACK, south_out_b_ACK,
         west_out_b_ACK, resource_out_b_ACK;
  output north_in_b_ACK, east_in_b_ACK, south_in_b_ACK, west_in_b_ACK,
         resource_in_b_ACK;
  wire   north_hpu_b_ACK, south_hpu_b_ACK, east_hpu_b_ACK, west_hpu_b_ACK,
         resource_hpu_b_ACK, chs_in_b_4__ACK, chs_in_b_3__ACK,
         chs_in_b_2__ACK, chs_in_b_1__ACK, chs_in_b_0__ACK;
  wire   [34:0] north_hpu_f;
  wire   [34:0] south_hpu_f;
  wire   [34:0] east_hpu_f;
  wire   [34:0] west_hpu_f;
  wire   [34:0] resource_hpu_f;
  wire   [174:0] chs_in_f;
  wire   [24:0] switch_sel;

  channel_latch_1_xxxxxxxxx_0 north_in_latch ( .preset(preset), .left_in(
        north_in_f), .left_out(north_in_b_ACK), .right_out(north_hpu_f), 
        .right_in(north_hpu_b_ACK) );
  channel_latch_1_xxxxxxxxx_9 south_in_latch ( .preset(preset), .left_in(
        south_in_f), .left_out(south_in_b_ACK), .right_out(south_hpu_f), 
        .right_in(south_hpu_b_ACK) );
  channel_latch_1_xxxxxxxxx_8 east_in_latch ( .preset(preset), .left_in(
        east_in_f), .left_out(east_in_b_ACK), .right_out(east_hpu_f), 
        .right_in(east_hpu_b_ACK) );
  channel_latch_1_xxxxxxxxx_7 west_in_latch ( .preset(preset), .left_in(
        west_in_f), .left_out(west_in_b_ACK), .right_out(west_hpu_f), 
        .right_in(west_hpu_b_ACK) );
  channel_latch_1_xxxxxxxxx_6 resource_in_latch ( .preset(preset), .left_in(
        resource_in_f), .left_out(resource_in_b_ACK), .right_out(
        resource_hpu_f), .right_in(resource_hpu_b_ACK) );
  hpu_0_0 north_hpu ( .preset(preset), .chan_in_f(north_hpu_f), .chan_in_b(
        north_hpu_b_ACK), .chan_out_f(chs_in_f[34:0]), .chan_out_b(
        chs_in_b_0__ACK), .sel(switch_sel[4:0]) );
  hpu_0_2 south_hpu ( .preset(preset), .chan_in_f(south_hpu_f), .chan_in_b(
        south_hpu_b_ACK), .chan_out_f(chs_in_f[104:70]), .chan_out_b(
        chs_in_b_2__ACK), .sel(switch_sel[14:10]) );
  hpu_0_1 east_hpu ( .preset(preset), .chan_in_f(east_hpu_f), .chan_in_b(
        east_hpu_b_ACK), .chan_out_f(chs_in_f[69:35]), .chan_out_b(
        chs_in_b_1__ACK), .sel(switch_sel[9:5]) );
  hpu_0_3 west_hpu ( .preset(preset), .chan_in_f(west_hpu_f), .chan_in_b(
        west_hpu_b_ACK), .chan_out_f(chs_in_f[139:105]), .chan_out_b(
        chs_in_b_3__ACK), .sel(switch_sel[19:15]) );
  hpu_1_x resource_hpu ( .preset(preset), .chan_in_f(resource_hpu_f), 
        .chan_in_b(resource_hpu_b_ACK), .chan_out_f(chs_in_f[174:140]), 
        .chan_out_b(chs_in_b_4__ACK), .sel(switch_sel[24:20]) );
  crossbar_stage_x0_y0 xbar_with_latches ( .preset(preset), .switch_sel({1'b0, 
        switch_sel[23:19], 1'b0, switch_sel[17:13], 1'b0, switch_sel[11:7], 
        1'b0, switch_sel[5:1], 1'b0}), .chs_in_f(chs_in_f), .chs_in_b({
        chs_in_b_4__ACK, chs_in_b_3__ACK, chs_in_b_2__ACK, chs_in_b_1__ACK, 
        chs_in_b_0__ACK}), .latches_out_f({resource_out_f, west_out_f, 
        south_out_f, east_out_f, north_out_f}), .latches_out_b({
        resource_out_b_ACK, west_out_b_ACK, south_out_b_ACK, 
        east_out_b_ACK, north_out_b_ACK}) );
endmodule

