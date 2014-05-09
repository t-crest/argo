
module select_element_0 ( preset, \input , true, false, sel );
  input preset, \input , sel;
  output true, false;
  wire   n1, n2, n3;

  HS65_LS_LDHRQX9 true_latch_out_reg ( .G(sel), .D(n1), .RN(n3), .Q(true) );
  HS65_LS_LDLRQX9 false_latch_out_reg ( .D(n2), .GN(sel), .RN(n3), .Q(false)
         );
  HS65_LSS_XOR2X6 U3 ( .A(\input ), .B(false), .Z(n1) );
  HS65_LS_IVX9 U4 ( .A(preset), .Z(n3) );
  HS65_LSS_XOR2X6 U5 ( .A(\input ), .B(true), .Z(n2) );
endmodule


module sr_latch_0_0 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n2;

  HS65_LS_AND2X18 C8 ( .A(n2), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(qn), .Z(N1) );
  HS65_LS_IVX9 U2 ( .A(r), .Z(n2) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_0 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_0 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_OAI12X6 U3 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_IVX9 U4 ( .A(preset), .Z(n1) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module sr_latch_0_19 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X18 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX7 U1 ( .A(r), .Z(n1) );
  HS65_LS_NOR2X6 U2 ( .A(s), .B(q), .Z(qn) );
  HS65_LS_IVX9 U3 ( .A(qn), .Z(N1) );
endmodule


module c_gate_generic_0_33_0 ( preset, \input , \output  );
  input [32:0] \input ;
  input preset;
  output \output ;
  wire   set, reset, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n1;

  sr_latch_0_19 latch ( .s(set), .r(reset), .q(\output ) );
  HS65_LH_NOR4ABX2 U3 ( .A(\input [23]), .B(\input [22]), .C(n7), .D(n6), .Z(
        n17) );
  HS65_LS_NAND4ABX19 U4 ( .A(\input [23]), .B(\input [22]), .C(n7), .D(n6), 
        .Z(n30) );
  HS65_LH_NOR4ABX2 U5 ( .A(\input [2]), .B(\input [30]), .C(n3), .D(n4), .Z(
        n25) );
  HS65_LS_NAND4ABX19 U6 ( .A(\input [30]), .B(\input [2]), .C(n5), .D(n4), .Z(
        n34) );
  HS65_LS_OAI12X6 U7 ( .A(n28), .B(n29), .C(n1), .Z(reset) );
  HS65_LS_NAND4ABX6 U8 ( .A(n34), .B(n35), .C(n36), .D(n37), .Z(n28) );
  HS65_LS_NAND3X13 U9 ( .A(n15), .B(n14), .C(n38), .Z(n35) );
  HS65_LS_NOR3X13 U10 ( .A(\input [7]), .B(\input [9]), .C(\input [8]), .Z(n38) );
  HS65_LS_NOR4ABX4 U11 ( .A(n11), .B(n10), .C(\input [16]), .D(\input [15]), 
        .Z(n33) );
  HS65_LS_NOR4ABX4 U12 ( .A(n3), .B(n2), .C(\input [4]), .D(\input [3]), .Z(
        n37) );
  HS65_LS_NOR4ABX4 U13 ( .A(n16), .B(n12), .C(\input [12]), .D(\input [11]), 
        .Z(n32) );
  HS65_LS_NAND4ABX6 U14 ( .A(n30), .B(n31), .C(n32), .D(n33), .Z(n29) );
  HS65_LS_IVX9 U15 ( .A(\input [17]), .Z(n9) );
  HS65_LS_IVX9 U16 ( .A(\input [20]), .Z(n7) );
  HS65_LS_NAND4ABX6 U17 ( .A(\input [1]), .B(\input [19]), .C(n9), .D(n8), .Z(
        n31) );
  HS65_LS_IVX9 U18 ( .A(\input [28]), .Z(n5) );
  HS65_LS_IVX9 U19 ( .A(\input [18]), .Z(n8) );
  HS65_LS_IVX9 U20 ( .A(\input [21]), .Z(n6) );
  HS65_LS_IVX9 U21 ( .A(\input [29]), .Z(n4) );
  HS65_LS_IVX9 U22 ( .A(\input [5]), .Z(n15) );
  HS65_LS_IVX9 U23 ( .A(\input [6]), .Z(n14) );
  HS65_LS_IVX9 U24 ( .A(\input [13]), .Z(n11) );
  HS65_LS_IVX9 U25 ( .A(\input [31]), .Z(n3) );
  HS65_LS_IVX9 U26 ( .A(\input [10]), .Z(n12) );
  HS65_LS_IVX9 U27 ( .A(\input [0]), .Z(n16) );
  HS65_LS_IVX9 U28 ( .A(\input [14]), .Z(n10) );
  HS65_LS_IVX9 U29 ( .A(\input [32]), .Z(n2) );
  HS65_LS_NOR4X4 U30 ( .A(\input [24]), .B(\input [25]), .C(\input [27]), .D(
        \input [26]), .Z(n36) );
  HS65_LS_NOR3X4 U31 ( .A(n12), .B(preset), .C(n16), .Z(n21) );
  HS65_LS_NOR4ABX2 U32 ( .A(n17), .B(n18), .C(n19), .D(n20), .Z(set) );
  HS65_LS_NOR3AX2 U33 ( .A(\input [27]), .B(n27), .C(n5), .Z(n26) );
  HS65_LS_IVX9 U34 ( .A(preset), .Z(n1) );
  HS65_LS_NOR4ABX2 U35 ( .A(\input [1]), .B(\input [19]), .C(n9), .D(n8), .Z(
        n18) );
  HS65_LS_NAND4ABX3 U36 ( .A(n23), .B(n24), .C(n25), .D(n26), .Z(n19) );
  HS65_LS_NOR4ABX2 U37 ( .A(\input [16]), .B(\input [15]), .C(n11), .D(n10), 
        .Z(n22) );
  HS65_LS_NAND3X5 U38 ( .A(\input [25]), .B(\input [24]), .C(\input [26]), .Z(
        n27) );
  HS65_LS_NAND4ABX3 U39 ( .A(n2), .B(n15), .C(\input [3]), .D(\input [4]), .Z(
        n23) );
  HS65_LS_NAND4ABX3 U40 ( .A(n14), .B(n13), .C(\input [7]), .D(\input [8]), 
        .Z(n24) );
  HS65_LS_NAND4X9 U41 ( .A(\input [11]), .B(\input [12]), .C(n21), .D(n22), 
        .Z(n20) );
  HS65_LS_IVX9 U42 ( .A(\input [9]), .Z(n13) );
endmodule


module sr_latch_0_10 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LH_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LH_IVX62 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_10 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_10 latch ( .s(set), .r(reset), .q(c) );
  HS65_LH_OAI21X2 U3 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_IVX9 U4 ( .A(preset), .Z(n1) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_0 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   not_Ain, d, n1, n2, n3, n4;

  c_gate_0_10 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Rout) );
  HS65_LS_IVX9 I_1 ( .A(n1), .Z(Aout) );
  HS65_LS_IVX9 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LH_IVX2 I_2 ( .A(Rout), .Z(d) );
  HS65_LS_BFX9 U1 ( .A(n3), .Z(n1) );
  HS65_LH_IVX106 U2 ( .A(n4), .Z(n2) );
  HS65_LH_BFX2 U3 ( .A(d), .Z(n4) );
  HS65_LS_IVX9 U4 ( .A(n2), .Z(n3) );
  HS65_LSS_XOR2X6 U5 ( .A(Rout), .B(Ain), .Z(lt_en) );
endmodule


module LEDR2bundled_1_000000000_0 ( preset, .LEDR_link_f({
        \LEDR_link_f[TOKEN_T] , \LEDR_link_f[TOKEN_PARITY] , 
        \LEDR_link_f[PHIT][32] , \LEDR_link_f[PHIT][31] , 
        \LEDR_link_f[PHIT][30] , \LEDR_link_f[PHIT][29] , 
        \LEDR_link_f[PHIT][28] , \LEDR_link_f[PHIT][27] , 
        \LEDR_link_f[PHIT][26] , \LEDR_link_f[PHIT][25] , 
        \LEDR_link_f[PHIT][24] , \LEDR_link_f[PHIT][23] , 
        \LEDR_link_f[PHIT][22] , \LEDR_link_f[PHIT][21] , 
        \LEDR_link_f[PHIT][20] , \LEDR_link_f[PHIT][19] , 
        \LEDR_link_f[PHIT][18] , \LEDR_link_f[PHIT][17] , 
        \LEDR_link_f[PHIT][16] , \LEDR_link_f[PHIT][15] , 
        \LEDR_link_f[PHIT][14] , \LEDR_link_f[PHIT][13] , 
        \LEDR_link_f[PHIT][12] , \LEDR_link_f[PHIT][11] , 
        \LEDR_link_f[PHIT][10] , \LEDR_link_f[PHIT][9] , 
        \LEDR_link_f[PHIT][8] , \LEDR_link_f[PHIT][7] , \LEDR_link_f[PHIT][6] , 
        \LEDR_link_f[PHIT][5] , \LEDR_link_f[PHIT][4] , \LEDR_link_f[PHIT][3] , 
        \LEDR_link_f[PHIT][2] , \LEDR_link_f[PHIT][1] , \LEDR_link_f[PHIT][0] , 
        \LEDR_link_f[PHIT_PARITY][32] , \LEDR_link_f[PHIT_PARITY][31] , 
        \LEDR_link_f[PHIT_PARITY][30] , \LEDR_link_f[PHIT_PARITY][29] , 
        \LEDR_link_f[PHIT_PARITY][28] , \LEDR_link_f[PHIT_PARITY][27] , 
        \LEDR_link_f[PHIT_PARITY][26] , \LEDR_link_f[PHIT_PARITY][25] , 
        \LEDR_link_f[PHIT_PARITY][24] , \LEDR_link_f[PHIT_PARITY][23] , 
        \LEDR_link_f[PHIT_PARITY][22] , \LEDR_link_f[PHIT_PARITY][21] , 
        \LEDR_link_f[PHIT_PARITY][20] , \LEDR_link_f[PHIT_PARITY][19] , 
        \LEDR_link_f[PHIT_PARITY][18] , \LEDR_link_f[PHIT_PARITY][17] , 
        \LEDR_link_f[PHIT_PARITY][16] , \LEDR_link_f[PHIT_PARITY][15] , 
        \LEDR_link_f[PHIT_PARITY][14] , \LEDR_link_f[PHIT_PARITY][13] , 
        \LEDR_link_f[PHIT_PARITY][12] , \LEDR_link_f[PHIT_PARITY][11] , 
        \LEDR_link_f[PHIT_PARITY][10] , \LEDR_link_f[PHIT_PARITY][9] , 
        \LEDR_link_f[PHIT_PARITY][8] , \LEDR_link_f[PHIT_PARITY][7] , 
        \LEDR_link_f[PHIT_PARITY][6] , \LEDR_link_f[PHIT_PARITY][5] , 
        \LEDR_link_f[PHIT_PARITY][4] , \LEDR_link_f[PHIT_PARITY][3] , 
        \LEDR_link_f[PHIT_PARITY][2] , \LEDR_link_f[PHIT_PARITY][1] , 
        \LEDR_link_f[PHIT_PARITY][0] }), .LEDR_link_b(\LEDR_link_b[ACK] ), 
    .bundled_ch_f({\bundled_ch_f[REQ] , \bundled_ch_f[DATA][33] , 
        \bundled_ch_f[DATA][32] , \bundled_ch_f[DATA][31] , 
        \bundled_ch_f[DATA][30] , \bundled_ch_f[DATA][29] , 
        \bundled_ch_f[DATA][28] , \bundled_ch_f[DATA][27] , 
        \bundled_ch_f[DATA][26] , \bundled_ch_f[DATA][25] , 
        \bundled_ch_f[DATA][24] , \bundled_ch_f[DATA][23] , 
        \bundled_ch_f[DATA][22] , \bundled_ch_f[DATA][21] , 
        \bundled_ch_f[DATA][20] , \bundled_ch_f[DATA][19] , 
        \bundled_ch_f[DATA][18] , \bundled_ch_f[DATA][17] , 
        \bundled_ch_f[DATA][16] , \bundled_ch_f[DATA][15] , 
        \bundled_ch_f[DATA][14] , \bundled_ch_f[DATA][13] , 
        \bundled_ch_f[DATA][12] , \bundled_ch_f[DATA][11] , 
        \bundled_ch_f[DATA][10] , \bundled_ch_f[DATA][9] , 
        \bundled_ch_f[DATA][8] , \bundled_ch_f[DATA][7] , 
        \bundled_ch_f[DATA][6] , \bundled_ch_f[DATA][5] , 
        \bundled_ch_f[DATA][4] , \bundled_ch_f[DATA][3] , 
        \bundled_ch_f[DATA][2] , \bundled_ch_f[DATA][1] , 
        \bundled_ch_f[DATA][0] }), .bundled_ch_b(\bundled_ch_b[ACK] ) );
  input preset, \LEDR_link_f[TOKEN_T] , \LEDR_link_f[TOKEN_PARITY] ,
         \LEDR_link_f[PHIT][32] , \LEDR_link_f[PHIT][31] ,
         \LEDR_link_f[PHIT][30] , \LEDR_link_f[PHIT][29] ,
         \LEDR_link_f[PHIT][28] , \LEDR_link_f[PHIT][27] ,
         \LEDR_link_f[PHIT][26] , \LEDR_link_f[PHIT][25] ,
         \LEDR_link_f[PHIT][24] , \LEDR_link_f[PHIT][23] ,
         \LEDR_link_f[PHIT][22] , \LEDR_link_f[PHIT][21] ,
         \LEDR_link_f[PHIT][20] , \LEDR_link_f[PHIT][19] ,
         \LEDR_link_f[PHIT][18] , \LEDR_link_f[PHIT][17] ,
         \LEDR_link_f[PHIT][16] , \LEDR_link_f[PHIT][15] ,
         \LEDR_link_f[PHIT][14] , \LEDR_link_f[PHIT][13] ,
         \LEDR_link_f[PHIT][12] , \LEDR_link_f[PHIT][11] ,
         \LEDR_link_f[PHIT][10] , \LEDR_link_f[PHIT][9] ,
         \LEDR_link_f[PHIT][8] , \LEDR_link_f[PHIT][7] ,
         \LEDR_link_f[PHIT][6] , \LEDR_link_f[PHIT][5] ,
         \LEDR_link_f[PHIT][4] , \LEDR_link_f[PHIT][3] ,
         \LEDR_link_f[PHIT][2] , \LEDR_link_f[PHIT][1] ,
         \LEDR_link_f[PHIT][0] , \LEDR_link_f[PHIT_PARITY][32] ,
         \LEDR_link_f[PHIT_PARITY][31] , \LEDR_link_f[PHIT_PARITY][30] ,
         \LEDR_link_f[PHIT_PARITY][29] , \LEDR_link_f[PHIT_PARITY][28] ,
         \LEDR_link_f[PHIT_PARITY][27] , \LEDR_link_f[PHIT_PARITY][26] ,
         \LEDR_link_f[PHIT_PARITY][25] , \LEDR_link_f[PHIT_PARITY][24] ,
         \LEDR_link_f[PHIT_PARITY][23] , \LEDR_link_f[PHIT_PARITY][22] ,
         \LEDR_link_f[PHIT_PARITY][21] , \LEDR_link_f[PHIT_PARITY][20] ,
         \LEDR_link_f[PHIT_PARITY][19] , \LEDR_link_f[PHIT_PARITY][18] ,
         \LEDR_link_f[PHIT_PARITY][17] , \LEDR_link_f[PHIT_PARITY][16] ,
         \LEDR_link_f[PHIT_PARITY][15] , \LEDR_link_f[PHIT_PARITY][14] ,
         \LEDR_link_f[PHIT_PARITY][13] , \LEDR_link_f[PHIT_PARITY][12] ,
         \LEDR_link_f[PHIT_PARITY][11] , \LEDR_link_f[PHIT_PARITY][10] ,
         \LEDR_link_f[PHIT_PARITY][9] , \LEDR_link_f[PHIT_PARITY][8] ,
         \LEDR_link_f[PHIT_PARITY][7] , \LEDR_link_f[PHIT_PARITY][6] ,
         \LEDR_link_f[PHIT_PARITY][5] , \LEDR_link_f[PHIT_PARITY][4] ,
         \LEDR_link_f[PHIT_PARITY][3] , \LEDR_link_f[PHIT_PARITY][2] ,
         \LEDR_link_f[PHIT_PARITY][1] , \LEDR_link_f[PHIT_PARITY][0] ,
         \bundled_ch_b[ACK] ;
  output \LEDR_link_b[ACK] , \bundled_ch_f[REQ] , \bundled_ch_f[DATA][33] ,
         \bundled_ch_f[DATA][32] , \bundled_ch_f[DATA][31] ,
         \bundled_ch_f[DATA][30] , \bundled_ch_f[DATA][29] ,
         \bundled_ch_f[DATA][28] , \bundled_ch_f[DATA][27] ,
         \bundled_ch_f[DATA][26] , \bundled_ch_f[DATA][25] ,
         \bundled_ch_f[DATA][24] , \bundled_ch_f[DATA][23] ,
         \bundled_ch_f[DATA][22] , \bundled_ch_f[DATA][21] ,
         \bundled_ch_f[DATA][20] , \bundled_ch_f[DATA][19] ,
         \bundled_ch_f[DATA][18] , \bundled_ch_f[DATA][17] ,
         \bundled_ch_f[DATA][16] , \bundled_ch_f[DATA][15] ,
         \bundled_ch_f[DATA][14] , \bundled_ch_f[DATA][13] ,
         \bundled_ch_f[DATA][12] , \bundled_ch_f[DATA][11] ,
         \bundled_ch_f[DATA][10] , \bundled_ch_f[DATA][9] ,
         \bundled_ch_f[DATA][8] , \bundled_ch_f[DATA][7] ,
         \bundled_ch_f[DATA][6] , \bundled_ch_f[DATA][5] ,
         \bundled_ch_f[DATA][4] , \bundled_ch_f[DATA][3] ,
         \bundled_ch_f[DATA][2] , \bundled_ch_f[DATA][1] ,
         \bundled_ch_f[DATA][0] ;
  wire   token_phase, full_phase, empty_phase, data_phase, data_cd_phase,
         req_in, latch_enable, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13,
         N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27,
         N28, N29, N30, N31, N32, N33, N34, N35, N36, n2, n1;
  wire   [32:0] data_cd;

  select_element_0 select_element ( .preset(preset), .\input (token_phase), 
        .true(full_phase), .false(empty_phase), .sel(\LEDR_link_f[TOKEN_T] )
         );
  c_gate_0_0 data_cd_c ( .preset(preset), .a(full_phase), .b(data_phase), .c(
        data_cd_phase) );
  c_gate_generic_0_33_0 data_ch ( .preset(preset), .\input (data_cd), 
        .\output (data_phase) );
  latch_controller_1_0 latch_controller ( .preset(preset), .Rin(req_in), 
        .Aout(\LEDR_link_b[ACK] ), .Rout(\bundled_ch_f[REQ] ), .Ain(
        \bundled_ch_b[ACK] ), .lt_en(latch_enable) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][31]  ( .G(N3), .D(N35), .Q(
        \bundled_ch_f[DATA][31] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][30]  ( .G(N3), .D(N34), .Q(
        \bundled_ch_f[DATA][30] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][29]  ( .G(N3), .D(N33), .Q(
        \bundled_ch_f[DATA][29] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][28]  ( .G(N3), .D(N32), .Q(
        \bundled_ch_f[DATA][28] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][27]  ( .G(N3), .D(N31), .Q(
        \bundled_ch_f[DATA][27] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][26]  ( .G(N3), .D(N30), .Q(
        \bundled_ch_f[DATA][26] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][25]  ( .G(N3), .D(N29), .Q(
        \bundled_ch_f[DATA][25] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][24]  ( .G(N3), .D(N28), .Q(
        \bundled_ch_f[DATA][24] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][23]  ( .G(N3), .D(N27), .Q(
        \bundled_ch_f[DATA][23] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][22]  ( .G(N3), .D(N26), .Q(
        \bundled_ch_f[DATA][22] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][21]  ( .G(N3), .D(N25), .Q(
        \bundled_ch_f[DATA][21] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][20]  ( .G(N3), .D(N24), .Q(
        \bundled_ch_f[DATA][20] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][19]  ( .G(N3), .D(N23), .Q(
        \bundled_ch_f[DATA][19] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][18]  ( .G(N3), .D(N22), .Q(
        \bundled_ch_f[DATA][18] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][17]  ( .G(N3), .D(N21), .Q(
        \bundled_ch_f[DATA][17] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][16]  ( .G(N3), .D(N20), .Q(
        \bundled_ch_f[DATA][16] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][15]  ( .G(N3), .D(N19), .Q(
        \bundled_ch_f[DATA][15] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][14]  ( .G(N3), .D(N18), .Q(
        \bundled_ch_f[DATA][14] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][13]  ( .G(N3), .D(N17), .Q(
        \bundled_ch_f[DATA][13] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][12]  ( .G(N3), .D(N16), .Q(
        \bundled_ch_f[DATA][12] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][11]  ( .G(N3), .D(N15), .Q(
        \bundled_ch_f[DATA][11] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][10]  ( .G(N3), .D(N14), .Q(
        \bundled_ch_f[DATA][10] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][9]  ( .G(N3), .D(N13), .Q(
        \bundled_ch_f[DATA][9] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][8]  ( .G(N3), .D(N12), .Q(
        \bundled_ch_f[DATA][8] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][7]  ( .G(N3), .D(N11), .Q(
        \bundled_ch_f[DATA][7] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][6]  ( .G(N3), .D(N10), .Q(
        \bundled_ch_f[DATA][6] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][5]  ( .G(N3), .D(N9), .Q(
        \bundled_ch_f[DATA][5] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][4]  ( .G(N3), .D(N8), .Q(
        \bundled_ch_f[DATA][4] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][3]  ( .G(N3), .D(N7), .Q(
        \bundled_ch_f[DATA][3] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][2]  ( .G(N3), .D(N6), .Q(
        \bundled_ch_f[DATA][2] ) );
  HS65_LS_LDLRQX9 \bundled_ch_f_reg[DATA][33]  ( .D(\LEDR_link_f[TOKEN_T] ), 
        .GN(latch_enable), .RN(n1), .Q(\bundled_ch_f[DATA][33] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][1]  ( .G(N3), .D(N5), .Q(
        \bundled_ch_f[DATA][1] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][0]  ( .G(N3), .D(N4), .Q(
        \bundled_ch_f[DATA][0] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][32]  ( .G(N3), .D(N36), .Q(
        \bundled_ch_f[DATA][32] ) );
  HS65_LSS_XOR2X6 U3 ( .A(\LEDR_link_f[PHIT_PARITY][7] ), .B(
        \LEDR_link_f[PHIT][7] ), .Z(data_cd[7]) );
  HS65_LSS_XOR2X6 U4 ( .A(\LEDR_link_f[PHIT_PARITY][4] ), .B(
        \LEDR_link_f[PHIT][4] ), .Z(data_cd[4]) );
  HS65_LSS_XOR2X6 U5 ( .A(\LEDR_link_f[PHIT_PARITY][3] ), .B(
        \LEDR_link_f[PHIT][3] ), .Z(data_cd[3]) );
  HS65_LSS_XOR2X6 U6 ( .A(\LEDR_link_f[PHIT_PARITY][8] ), .B(
        \LEDR_link_f[PHIT][8] ), .Z(data_cd[8]) );
  HS65_LSS_XOR2X6 U7 ( .A(\LEDR_link_f[PHIT_PARITY][9] ), .B(
        \LEDR_link_f[PHIT][9] ), .Z(data_cd[9]) );
  HS65_LSS_XOR2X6 U8 ( .A(\LEDR_link_f[PHIT_PARITY][16] ), .B(
        \LEDR_link_f[PHIT][16] ), .Z(data_cd[16]) );
  HS65_LSS_XOR2X6 U9 ( .A(\LEDR_link_f[PHIT_PARITY][15] ), .B(
        \LEDR_link_f[PHIT][15] ), .Z(data_cd[15]) );
  HS65_LSS_XOR2X6 U10 ( .A(\LEDR_link_f[PHIT_PARITY][25] ), .B(
        \LEDR_link_f[PHIT][25] ), .Z(data_cd[25]) );
  HS65_LSS_XOR2X6 U11 ( .A(\LEDR_link_f[PHIT_PARITY][24] ), .B(
        \LEDR_link_f[PHIT][24] ), .Z(data_cd[24]) );
  HS65_LSS_XOR2X6 U12 ( .A(\LEDR_link_f[PHIT_PARITY][26] ), .B(
        \LEDR_link_f[PHIT][26] ), .Z(data_cd[26]) );
  HS65_LSS_XOR2X6 U13 ( .A(\LEDR_link_f[PHIT_PARITY][12] ), .B(
        \LEDR_link_f[PHIT][12] ), .Z(data_cd[12]) );
  HS65_LSS_XOR2X6 U14 ( .A(\LEDR_link_f[PHIT_PARITY][1] ), .B(
        \LEDR_link_f[PHIT][1] ), .Z(data_cd[1]) );
  HS65_LSS_XOR2X6 U15 ( .A(\LEDR_link_f[PHIT_PARITY][23] ), .B(
        \LEDR_link_f[PHIT][23] ), .Z(data_cd[23]) );
  HS65_LSS_XOR2X6 U16 ( .A(\LEDR_link_f[PHIT_PARITY][2] ), .B(
        \LEDR_link_f[PHIT][2] ), .Z(data_cd[2]) );
  HS65_LSS_XOR2X6 U17 ( .A(\LEDR_link_f[PHIT_PARITY][30] ), .B(
        \LEDR_link_f[PHIT][30] ), .Z(data_cd[30]) );
  HS65_LSS_XOR2X6 U18 ( .A(\LEDR_link_f[PHIT_PARITY][19] ), .B(
        \LEDR_link_f[PHIT][19] ), .Z(data_cd[19]) );
  HS65_LSS_XOR2X6 U19 ( .A(\LEDR_link_f[PHIT_PARITY][22] ), .B(
        \LEDR_link_f[PHIT][22] ), .Z(data_cd[22]) );
  HS65_LSS_XOR2X6 U20 ( .A(\LEDR_link_f[PHIT_PARITY][11] ), .B(
        \LEDR_link_f[PHIT][11] ), .Z(data_cd[11]) );
  HS65_LSS_XOR2X6 U21 ( .A(\LEDR_link_f[PHIT_PARITY][27] ), .B(
        \LEDR_link_f[PHIT][27] ), .Z(data_cd[27]) );
  HS65_LSS_XOR2X6 U22 ( .A(\LEDR_link_f[PHIT_PARITY][0] ), .B(
        \LEDR_link_f[PHIT][0] ), .Z(data_cd[0]) );
  HS65_LSS_XOR2X6 U23 ( .A(\LEDR_link_f[PHIT_PARITY][10] ), .B(
        \LEDR_link_f[PHIT][10] ), .Z(data_cd[10]) );
  HS65_LSS_XOR2X6 U24 ( .A(\LEDR_link_f[PHIT_PARITY][13] ), .B(
        \LEDR_link_f[PHIT][13] ), .Z(data_cd[13]) );
  HS65_LSS_XOR2X6 U25 ( .A(\LEDR_link_f[PHIT_PARITY][14] ), .B(
        \LEDR_link_f[PHIT][14] ), .Z(data_cd[14]) );
  HS65_LSS_XOR2X6 U26 ( .A(\LEDR_link_f[PHIT_PARITY][17] ), .B(
        \LEDR_link_f[PHIT][17] ), .Z(data_cd[17]) );
  HS65_LSS_XOR2X6 U27 ( .A(\LEDR_link_f[PHIT_PARITY][18] ), .B(
        \LEDR_link_f[PHIT][18] ), .Z(data_cd[18]) );
  HS65_LSS_XOR2X6 U28 ( .A(\LEDR_link_f[PHIT_PARITY][20] ), .B(
        \LEDR_link_f[PHIT][20] ), .Z(data_cd[20]) );
  HS65_LSS_XOR2X6 U29 ( .A(\LEDR_link_f[PHIT_PARITY][21] ), .B(
        \LEDR_link_f[PHIT][21] ), .Z(data_cd[21]) );
  HS65_LSS_XOR2X6 U30 ( .A(\LEDR_link_f[PHIT_PARITY][28] ), .B(
        \LEDR_link_f[PHIT][28] ), .Z(data_cd[28]) );
  HS65_LSS_XOR2X6 U31 ( .A(\LEDR_link_f[PHIT_PARITY][29] ), .B(
        \LEDR_link_f[PHIT][29] ), .Z(data_cd[29]) );
  HS65_LSS_XOR2X6 U32 ( .A(\LEDR_link_f[PHIT_PARITY][31] ), .B(
        \LEDR_link_f[PHIT][31] ), .Z(data_cd[31]) );
  HS65_LSS_XOR2X6 U33 ( .A(\LEDR_link_f[PHIT_PARITY][32] ), .B(
        \LEDR_link_f[PHIT][32] ), .Z(data_cd[32]) );
  HS65_LSS_XOR2X6 U34 ( .A(\LEDR_link_f[PHIT_PARITY][5] ), .B(
        \LEDR_link_f[PHIT][5] ), .Z(data_cd[5]) );
  HS65_LSS_XOR2X6 U35 ( .A(\LEDR_link_f[PHIT_PARITY][6] ), .B(
        \LEDR_link_f[PHIT][6] ), .Z(data_cd[6]) );
  HS65_LSS_XNOR2X6 U36 ( .A(n2), .B(\LEDR_link_f[TOKEN_PARITY] ), .Z(
        token_phase) );
  HS65_LS_IVX9 U37 ( .A(preset), .Z(n1) );
  HS65_LS_IVX9 U38 ( .A(\LEDR_link_f[TOKEN_T] ), .Z(n2) );
  HS65_LS_NOR2AX3 U39 ( .A(\LEDR_link_f[PHIT][0] ), .B(preset), .Z(N4) );
  HS65_LS_NOR2AX3 U40 ( .A(\LEDR_link_f[PHIT][1] ), .B(preset), .Z(N5) );
  HS65_LS_NOR2AX3 U41 ( .A(\LEDR_link_f[PHIT][2] ), .B(preset), .Z(N6) );
  HS65_LS_NOR2AX3 U42 ( .A(\LEDR_link_f[PHIT][3] ), .B(preset), .Z(N7) );
  HS65_LS_NOR2AX3 U43 ( .A(\LEDR_link_f[PHIT][4] ), .B(preset), .Z(N8) );
  HS65_LS_NOR2AX3 U44 ( .A(\LEDR_link_f[PHIT][6] ), .B(preset), .Z(N10) );
  HS65_LS_NOR2AX3 U45 ( .A(\LEDR_link_f[PHIT][24] ), .B(preset), .Z(N28) );
  HS65_LS_NOR2AX3 U46 ( .A(\LEDR_link_f[PHIT][25] ), .B(preset), .Z(N29) );
  HS65_LS_NOR2AX3 U47 ( .A(\LEDR_link_f[PHIT][26] ), .B(preset), .Z(N30) );
  HS65_LS_NOR2AX3 U48 ( .A(\LEDR_link_f[PHIT][27] ), .B(preset), .Z(N31) );
  HS65_LS_NOR2AX3 U49 ( .A(\LEDR_link_f[PHIT][28] ), .B(preset), .Z(N32) );
  HS65_LS_NOR2AX3 U50 ( .A(\LEDR_link_f[PHIT][29] ), .B(preset), .Z(N33) );
  HS65_LS_NOR2AX3 U51 ( .A(\LEDR_link_f[PHIT][30] ), .B(preset), .Z(N34) );
  HS65_LS_NOR2AX3 U52 ( .A(\LEDR_link_f[PHIT][31] ), .B(preset), .Z(N35) );
  HS65_LS_NOR2AX3 U53 ( .A(\LEDR_link_f[PHIT][32] ), .B(preset), .Z(N36) );
  HS65_LS_NOR2AX3 U54 ( .A(\LEDR_link_f[PHIT][5] ), .B(preset), .Z(N9) );
  HS65_LS_NOR2AX3 U55 ( .A(\LEDR_link_f[PHIT][7] ), .B(preset), .Z(N11) );
  HS65_LS_NOR2AX3 U56 ( .A(\LEDR_link_f[PHIT][8] ), .B(preset), .Z(N12) );
  HS65_LS_NOR2AX3 U57 ( .A(\LEDR_link_f[PHIT][9] ), .B(preset), .Z(N13) );
  HS65_LS_NOR2AX3 U58 ( .A(\LEDR_link_f[PHIT][10] ), .B(preset), .Z(N14) );
  HS65_LS_NOR2AX3 U59 ( .A(\LEDR_link_f[PHIT][11] ), .B(preset), .Z(N15) );
  HS65_LS_NOR2AX3 U60 ( .A(\LEDR_link_f[PHIT][12] ), .B(preset), .Z(N16) );
  HS65_LS_NOR2AX3 U61 ( .A(\LEDR_link_f[PHIT][13] ), .B(preset), .Z(N17) );
  HS65_LS_NOR2AX3 U62 ( .A(\LEDR_link_f[PHIT][14] ), .B(preset), .Z(N18) );
  HS65_LS_NOR2AX3 U63 ( .A(\LEDR_link_f[PHIT][15] ), .B(preset), .Z(N19) );
  HS65_LS_NOR2AX3 U64 ( .A(\LEDR_link_f[PHIT][16] ), .B(preset), .Z(N20) );
  HS65_LS_NOR2AX3 U65 ( .A(\LEDR_link_f[PHIT][17] ), .B(preset), .Z(N21) );
  HS65_LS_NOR2AX3 U66 ( .A(\LEDR_link_f[PHIT][18] ), .B(preset), .Z(N22) );
  HS65_LS_NOR2AX3 U67 ( .A(\LEDR_link_f[PHIT][19] ), .B(preset), .Z(N23) );
  HS65_LS_NOR2AX3 U68 ( .A(\LEDR_link_f[PHIT][20] ), .B(preset), .Z(N24) );
  HS65_LS_NOR2AX3 U69 ( .A(\LEDR_link_f[PHIT][21] ), .B(preset), .Z(N25) );
  HS65_LS_NOR2AX3 U70 ( .A(\LEDR_link_f[PHIT][22] ), .B(preset), .Z(N26) );
  HS65_LS_NOR2AX3 U71 ( .A(\LEDR_link_f[PHIT][23] ), .B(preset), .Z(N27) );
  HS65_LS_OAI21X3 U72 ( .A(latch_enable), .B(n2), .C(n1), .Z(N3) );
  HS65_LSS_XOR2X6 U73 ( .A(empty_phase), .B(data_cd_phase), .Z(req_in) );
endmodule


module hpu_comb_0_0 ( data_valid, data_in, data_out, sel );
  input [33:0] data_in;
  output [33:0] data_out;
  output [4:0] sel;
  input data_valid;
  wire   N16, N17, N18, N19, N20, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n35, n36, n37, n1, n38, n39,
         n40, n41, n42;
  assign data_out[33] = data_in[33];
  assign data_out[32] = data_in[32];

  HS65_LS_LDHQX9 \sel_reg[4]  ( .G(N20), .D(N19), .Q(sel[4]) );
  HS65_LS_LDHQX9 \sel_reg[3]  ( .G(N20), .D(N18), .Q(sel[3]) );
  HS65_LS_LDHQX9 \sel_reg[2]  ( .G(N20), .D(N17), .Q(sel[2]) );
  HS65_LS_LDHQX9 \sel_reg[1]  ( .G(N20), .D(N16), .Q(sel[1]) );
  HS65_LS_LDHQX9 \sel_reg[0]  ( .G(N20), .D(1'b0), .Q(sel[0]) );
  HS65_LS_BFX9 U3 ( .A(n42), .Z(n39) );
  HS65_LS_NOR2AX3 U4 ( .A(data_in[33]), .B(data_in[32]), .Z(n35) );
  HS65_LS_NAND2X7 U5 ( .A(n38), .B(n36), .Z(n37) );
  HS65_LS_IVX9 U6 ( .A(n39), .Z(n38) );
  HS65_LS_IVX9 U7 ( .A(n39), .Z(n1) );
  HS65_LS_BFX9 U8 ( .A(n42), .Z(n40) );
  HS65_LS_BFX9 U9 ( .A(n42), .Z(n41) );
  HS65_LS_NOR2X6 U10 ( .A(n41), .B(n36), .Z(N19) );
  HS65_LS_OAI22X6 U11 ( .A(n39), .B(n25), .C(n1), .D(n27), .Z(data_out[6]) );
  HS65_LS_OAI22X6 U12 ( .A(n24), .B(n41), .C(n1), .D(n26), .Z(data_out[7]) );
  HS65_LS_OAI22X6 U13 ( .A(n41), .B(n31), .C(n1), .D(n33), .Z(data_out[0]) );
  HS65_LS_OAI22X6 U14 ( .A(n40), .B(n30), .C(n38), .D(n32), .Z(data_out[1]) );
  HS65_LS_OAI22X6 U15 ( .A(n40), .B(n29), .C(n1), .D(n31), .Z(data_out[2]) );
  HS65_LS_OAI22X6 U16 ( .A(n40), .B(n28), .C(n1), .D(n30), .Z(data_out[3]) );
  HS65_LS_OAI22X6 U17 ( .A(n40), .B(n27), .C(n1), .D(n29), .Z(data_out[4]) );
  HS65_LS_OAI22X6 U18 ( .A(n40), .B(n26), .C(n38), .D(n28), .Z(data_out[5]) );
  HS65_LS_OAI22X6 U19 ( .A(n40), .B(n23), .C(n1), .D(n25), .Z(data_out[8]) );
  HS65_LS_OAI22X6 U20 ( .A(n40), .B(n22), .C(n1), .D(n24), .Z(data_out[9]) );
  HS65_LS_OAI22X6 U21 ( .A(n41), .B(n21), .C(n1), .D(n23), .Z(data_out[10]) );
  HS65_LS_OAI22X6 U22 ( .A(n41), .B(n20), .C(n1), .D(n22), .Z(data_out[11]) );
  HS65_LS_OAI22X6 U23 ( .A(n41), .B(n19), .C(n1), .D(n21), .Z(data_out[12]) );
  HS65_LS_OAI22X6 U24 ( .A(n41), .B(n18), .C(n1), .D(n20), .Z(data_out[13]) );
  HS65_LS_OAI22X6 U25 ( .A(n41), .B(n17), .C(n1), .D(n19), .Z(data_out[14]) );
  HS65_LS_OAI22X6 U26 ( .A(n41), .B(n16), .C(n38), .D(n18), .Z(data_out[15])
         );
  HS65_LS_OAI22X6 U27 ( .A(n41), .B(n15), .C(n38), .D(n17), .Z(data_out[16])
         );
  HS65_LS_OAI22X6 U28 ( .A(n40), .B(n14), .C(n38), .D(n16), .Z(data_out[17])
         );
  HS65_LS_OAI22X6 U29 ( .A(n40), .B(n13), .C(n38), .D(n15), .Z(data_out[18])
         );
  HS65_LS_OAI22X6 U30 ( .A(n40), .B(n12), .C(n38), .D(n14), .Z(data_out[19])
         );
  HS65_LS_OAI22X6 U31 ( .A(n40), .B(n11), .C(n38), .D(n13), .Z(data_out[20])
         );
  HS65_LS_OAI22X6 U32 ( .A(n40), .B(n10), .C(n38), .D(n12), .Z(data_out[21])
         );
  HS65_LS_OAI22X6 U33 ( .A(n40), .B(n9), .C(n38), .D(n11), .Z(data_out[22]) );
  HS65_LS_OAI22X6 U34 ( .A(n40), .B(n8), .C(n38), .D(n10), .Z(data_out[23]) );
  HS65_LS_OAI22X6 U35 ( .A(n40), .B(n7), .C(n38), .D(n9), .Z(data_out[24]) );
  HS65_LS_OAI22X6 U36 ( .A(n40), .B(n6), .C(n1), .D(n8), .Z(data_out[25]) );
  HS65_LS_OAI22X6 U37 ( .A(n40), .B(n5), .C(n1), .D(n7), .Z(data_out[26]) );
  HS65_LS_OAI22X6 U38 ( .A(n40), .B(n4), .C(n1), .D(n6), .Z(data_out[27]) );
  HS65_LS_OAI22X6 U39 ( .A(n40), .B(n3), .C(n1), .D(n5), .Z(data_out[28]) );
  HS65_LS_OAI22X6 U40 ( .A(n40), .B(n2), .C(n1), .D(n4), .Z(data_out[29]) );
  HS65_LS_NOR3X4 U41 ( .A(n37), .B(n32), .C(n33), .Z(N18) );
  HS65_LS_NAND2X7 U42 ( .A(n32), .B(n33), .Z(n36) );
  HS65_LS_NOR2X6 U43 ( .A(n1), .B(n3), .Z(data_out[30]) );
  HS65_LS_NOR2X6 U44 ( .A(n1), .B(n2), .Z(data_out[31]) );
  HS65_LS_IVX9 U45 ( .A(n35), .Z(n42) );
  HS65_LS_IVX9 U46 ( .A(data_in[1]), .Z(n32) );
  HS65_LS_IVX9 U47 ( .A(data_in[0]), .Z(n33) );
  HS65_LS_IVX9 U48 ( .A(data_in[9]), .Z(n24) );
  HS65_LS_IVX9 U49 ( .A(data_in[2]), .Z(n31) );
  HS65_LS_IVX9 U50 ( .A(data_in[3]), .Z(n30) );
  HS65_LS_IVX9 U51 ( .A(data_in[4]), .Z(n29) );
  HS65_LS_IVX9 U52 ( .A(data_in[5]), .Z(n28) );
  HS65_LS_IVX9 U53 ( .A(data_in[6]), .Z(n27) );
  HS65_LS_IVX9 U54 ( .A(data_in[7]), .Z(n26) );
  HS65_LS_IVX9 U55 ( .A(data_in[8]), .Z(n25) );
  HS65_LS_IVX9 U56 ( .A(data_in[10]), .Z(n23) );
  HS65_LS_IVX9 U57 ( .A(data_in[11]), .Z(n22) );
  HS65_LS_IVX9 U58 ( .A(data_in[12]), .Z(n21) );
  HS65_LS_IVX9 U59 ( .A(data_in[13]), .Z(n20) );
  HS65_LS_IVX9 U60 ( .A(data_in[14]), .Z(n19) );
  HS65_LS_IVX9 U61 ( .A(data_in[15]), .Z(n18) );
  HS65_LS_IVX9 U62 ( .A(data_in[16]), .Z(n17) );
  HS65_LS_IVX9 U63 ( .A(data_in[17]), .Z(n16) );
  HS65_LS_IVX9 U64 ( .A(data_in[18]), .Z(n15) );
  HS65_LS_IVX9 U65 ( .A(data_in[19]), .Z(n14) );
  HS65_LS_IVX9 U66 ( .A(data_in[20]), .Z(n13) );
  HS65_LS_IVX9 U67 ( .A(data_in[21]), .Z(n12) );
  HS65_LS_IVX9 U68 ( .A(data_in[22]), .Z(n11) );
  HS65_LS_IVX9 U69 ( .A(data_in[23]), .Z(n10) );
  HS65_LS_IVX9 U70 ( .A(data_in[24]), .Z(n9) );
  HS65_LS_IVX9 U71 ( .A(data_in[25]), .Z(n8) );
  HS65_LS_IVX9 U72 ( .A(data_in[26]), .Z(n7) );
  HS65_LS_IVX9 U73 ( .A(data_in[27]), .Z(n6) );
  HS65_LS_IVX9 U74 ( .A(data_in[28]), .Z(n5) );
  HS65_LS_IVX9 U75 ( .A(data_in[29]), .Z(n4) );
  HS65_LS_IVX9 U77 ( .A(data_in[30]), .Z(n3) );
  HS65_LS_IVX9 U78 ( .A(data_in[31]), .Z(n2) );
  HS65_LS_NOR2X6 U79 ( .A(data_in[1]), .B(n37), .Z(N16) );
  HS65_LS_NOR2X6 U80 ( .A(data_in[0]), .B(n37), .Z(N17) );
  HS65_LS_NOR2AX3 U81 ( .A(data_valid), .B(data_in[32]), .Z(N20) );
endmodule


module sr_latch_0_5 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(qn), .Z(N1) );
  HS65_LS_IVX9 U2 ( .A(r), .Z(n1) );
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
  wire   not_Ain, d, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;

  c_gate_0_5 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Rout) );
  HS65_LS_IVX9 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LS_IVX9 I_2 ( .A(Rout), .Z(d) );
  HS65_LS_IVX9 I_1 ( .A(n1), .Z(Aout) );
  HS65_LS_BFX9 U1 ( .A(n2), .Z(n1) );
  HS65_LS_BFX9 U2 ( .A(n3), .Z(n2) );
  HS65_LS_BFX9 U3 ( .A(n4), .Z(n3) );
  HS65_LS_BFX9 U4 ( .A(n5), .Z(n4) );
  HS65_LS_BFX9 U5 ( .A(n6), .Z(n5) );
  HS65_LS_BFX9 U6 ( .A(n7), .Z(n6) );
  HS65_LS_BFX9 U7 ( .A(n8), .Z(n7) );
  HS65_LS_BFX9 U8 ( .A(n9), .Z(n8) );
  HS65_LS_BFX9 U9 ( .A(n10), .Z(n9) );
  HS65_LS_BFX9 U10 ( .A(d), .Z(n10) );
  HS65_LSS_XOR2X6 U11 ( .A(Rout), .B(Ain), .Z(lt_en) );
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

  latch_controller_1_5 controller ( .preset(preset), .Rin(\left_in[REQ] ), 
        .Aout(\left_out[ACK] ), .Rout(\right_out[REQ] ), .Ain(\right_in[ACK] ), 
        .lt_en(lt_en) );
  HS65_LS_LDHQX9 \data_reg[33]  ( .G(N3), .D(\left_in[DATA][33] ), .Q(
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
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N3), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
  HS65_LS_NAND2AX7 U3 ( .A(preset), .B(lt_en), .Z(N3) );
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
  wire   \chan_internal_f[REQ] , \chan_internal_f[DATA][33] ,
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
         n6;

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
  channel_latch_1_xxxxxxxxx_0 token_latch ( .preset(preset), .left_in({
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
  HS65_LS_IVX9 I_1 ( .A(n1), .Z(\chan_internal_f[REQ] ) );
  HS65_LH_IVX2 I_0 ( .A(\chan_in_f[REQ] ), .Z(req_n) );
  HS65_LS_BFX9 U1 ( .A(n2), .Z(n1) );
  HS65_LS_BFX9 U2 ( .A(n3), .Z(n2) );
  HS65_LS_BFX9 U3 ( .A(n4), .Z(n3) );
  HS65_LS_BFX9 U4 ( .A(n5), .Z(n4) );
  HS65_LS_BFX9 U5 ( .A(n6), .Z(n5) );
  HS65_LS_BFX9 U6 ( .A(req_n), .Z(n6) );
  HS65_LSS_XOR2X6 U7 ( .A(\chan_internal_f[REQ] ), .B(\chan_in_b[ACK] ), .Z(
        data_in_valid) );
endmodule


module hpu_comb_0_2 ( data_valid, data_in, data_out, sel );
  input [33:0] data_in;
  output [33:0] data_out;
  output [4:0] sel;
  input data_valid;
  wire   N18, N19, N21, N22, N23, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n19, n20, n21, n22, n1, n23, n24, n25,
         n26, n27;
  assign data_out[33] = data_in[33];
  assign data_out[32] = data_in[32];

  HS65_LS_LDHQX9 \sel_reg[4]  ( .G(N23), .D(N22), .Q(sel[4]) );
  HS65_LS_LDHQX9 \sel_reg[3]  ( .G(N23), .D(N21), .Q(sel[3]) );
  HS65_LS_LDHQX9 \sel_reg[2]  ( .G(N23), .D(1'b0), .Q(sel[2]) );
  HS65_LS_LDHQX9 \sel_reg[1]  ( .G(N23), .D(N19), .Q(sel[1]) );
  HS65_LS_LDHQX9 \sel_reg[0]  ( .G(N23), .D(N18), .Q(sel[0]) );
  HS65_LS_BFX9 U3 ( .A(n19), .Z(n1) );
  HS65_LS_AO22X4 U4 ( .A(n26), .B(data_in[7]), .C(n24), .D(data_in[5]), .Z(
        data_out[5]) );
  HS65_LS_AO22X4 U5 ( .A(n26), .B(data_in[13]), .C(n24), .D(data_in[11]), .Z(
        data_out[11]) );
  HS65_LS_AO22X4 U6 ( .A(n26), .B(data_in[31]), .C(n23), .D(data_in[29]), .Z(
        data_out[29]) );
  HS65_LS_BFX9 U7 ( .A(n1), .Z(n25) );
  HS65_LS_IVX9 U8 ( .A(n25), .Z(n24) );
  HS65_LS_IVX9 U9 ( .A(n25), .Z(n23) );
  HS65_LS_OAI22X6 U10 ( .A(n24), .B(n16), .C(n26), .D(n17), .Z(data_out[0]) );
  HS65_LS_OAI22X6 U11 ( .A(n23), .B(n15), .C(n26), .D(n16), .Z(data_out[2]) );
  HS65_LS_OAI22X6 U12 ( .A(n23), .B(n14), .C(n26), .D(n15), .Z(data_out[4]) );
  HS65_LS_OAI22X6 U13 ( .A(n23), .B(n13), .C(n26), .D(n14), .Z(data_out[6]) );
  HS65_LS_OAI22X6 U14 ( .A(n23), .B(n12), .C(n26), .D(n13), .Z(data_out[8]) );
  HS65_LS_OAI22X6 U15 ( .A(n24), .B(n11), .C(n26), .D(n12), .Z(data_out[10])
         );
  HS65_LS_OAI22X6 U16 ( .A(n24), .B(n10), .C(n26), .D(n11), .Z(data_out[12])
         );
  HS65_LS_OAI22X6 U17 ( .A(n23), .B(n9), .C(n26), .D(n10), .Z(data_out[14]) );
  HS65_LS_OAI22X6 U18 ( .A(n23), .B(n8), .C(n26), .D(n9), .Z(data_out[16]) );
  HS65_LS_OAI22X6 U19 ( .A(n23), .B(n7), .C(n25), .D(n8), .Z(data_out[18]) );
  HS65_LS_OAI22X6 U20 ( .A(n23), .B(n6), .C(n26), .D(n7), .Z(data_out[20]) );
  HS65_LS_OAI22X6 U21 ( .A(n23), .B(n5), .C(n26), .D(n6), .Z(data_out[22]) );
  HS65_LS_OAI22X6 U22 ( .A(n23), .B(n4), .C(n26), .D(n5), .Z(data_out[24]) );
  HS65_LS_OAI22X6 U23 ( .A(n23), .B(n3), .C(n26), .D(n4), .Z(data_out[26]) );
  HS65_LS_OAI22X6 U24 ( .A(n23), .B(n2), .C(n26), .D(n3), .Z(data_out[28]) );
  HS65_LS_NAND2X7 U25 ( .A(n26), .B(n20), .Z(n21) );
  HS65_LS_NOR3X4 U26 ( .A(n21), .B(n17), .C(n22), .Z(N21) );
  HS65_LS_BFX9 U27 ( .A(n1), .Z(n26) );
  HS65_LS_NOR2AX3 U28 ( .A(n22), .B(n21), .Z(N19) );
  HS65_LS_NOR2X6 U29 ( .A(n24), .B(n20), .Z(N22) );
  HS65_LS_BFX9 U30 ( .A(n1), .Z(n27) );
  HS65_LS_NOR2X6 U31 ( .A(n26), .B(n2), .Z(data_out[30]) );
  HS65_LS_IVX9 U32 ( .A(data_in[0]), .Z(n17) );
  HS65_LS_NAND2X7 U33 ( .A(data_in[1]), .B(n17), .Z(n20) );
  HS65_LS_NOR2X6 U34 ( .A(n17), .B(data_in[1]), .Z(n22) );
  HS65_LS_IVX9 U35 ( .A(data_in[2]), .Z(n16) );
  HS65_LS_IVX9 U36 ( .A(data_in[4]), .Z(n15) );
  HS65_LS_IVX9 U37 ( .A(data_in[6]), .Z(n14) );
  HS65_LS_IVX9 U38 ( .A(data_in[8]), .Z(n13) );
  HS65_LS_IVX9 U39 ( .A(data_in[10]), .Z(n12) );
  HS65_LS_IVX9 U40 ( .A(data_in[12]), .Z(n11) );
  HS65_LS_IVX9 U41 ( .A(data_in[14]), .Z(n10) );
  HS65_LS_IVX9 U42 ( .A(data_in[16]), .Z(n9) );
  HS65_LS_IVX9 U43 ( .A(data_in[18]), .Z(n8) );
  HS65_LS_IVX9 U44 ( .A(data_in[20]), .Z(n7) );
  HS65_LS_IVX9 U45 ( .A(data_in[22]), .Z(n6) );
  HS65_LS_IVX9 U46 ( .A(data_in[24]), .Z(n5) );
  HS65_LS_IVX9 U47 ( .A(data_in[26]), .Z(n4) );
  HS65_LS_IVX9 U48 ( .A(data_in[28]), .Z(n3) );
  HS65_LS_IVX9 U49 ( .A(data_in[30]), .Z(n2) );
  HS65_LS_NOR2AX3 U50 ( .A(data_in[33]), .B(data_in[32]), .Z(n19) );
  HS65_LS_NOR2X6 U51 ( .A(data_in[0]), .B(n21), .Z(N18) );
  HS65_LS_AO22X9 U52 ( .A(n27), .B(data_in[3]), .C(n24), .D(data_in[1]), .Z(
        data_out[1]) );
  HS65_LS_AO22X9 U53 ( .A(n26), .B(data_in[5]), .C(n24), .D(data_in[3]), .Z(
        data_out[3]) );
  HS65_LS_AO22X9 U54 ( .A(n27), .B(data_in[11]), .C(n24), .D(data_in[9]), .Z(
        data_out[9]) );
  HS65_LS_AO22X9 U55 ( .A(n27), .B(data_in[15]), .C(n24), .D(data_in[13]), .Z(
        data_out[13]) );
  HS65_LS_AO22X9 U56 ( .A(n27), .B(data_in[17]), .C(n24), .D(data_in[15]), .Z(
        data_out[15]) );
  HS65_LS_AO22X9 U57 ( .A(n27), .B(data_in[19]), .C(n24), .D(data_in[17]), .Z(
        data_out[17]) );
  HS65_LS_AO22X9 U58 ( .A(n27), .B(data_in[21]), .C(n24), .D(data_in[19]), .Z(
        data_out[19]) );
  HS65_LS_AO22X9 U59 ( .A(n27), .B(data_in[23]), .C(n24), .D(data_in[21]), .Z(
        data_out[21]) );
  HS65_LS_AO22X9 U60 ( .A(n27), .B(data_in[25]), .C(n24), .D(data_in[23]), .Z(
        data_out[23]) );
  HS65_LS_AO22X9 U62 ( .A(n27), .B(data_in[27]), .C(n24), .D(data_in[25]), .Z(
        data_out[25]) );
  HS65_LS_AO22X9 U63 ( .A(n27), .B(data_in[29]), .C(n24), .D(data_in[27]), .Z(
        data_out[27]) );
  HS65_LS_AO22X9 U64 ( .A(data_in[9]), .B(n27), .C(n23), .D(data_in[7]), .Z(
        data_out[7]) );
  HS65_LS_AND2X4 U65 ( .A(data_in[31]), .B(n23), .Z(data_out[31]) );
  HS65_LS_NOR2AX3 U66 ( .A(data_valid), .B(data_in[32]), .Z(N23) );
endmodule


module sr_latch_0_4 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(qn), .Z(N1) );
  HS65_LS_IVX9 U2 ( .A(r), .Z(n1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_4 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_4 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_OAI21X3 U3 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_IVX9 U4 ( .A(preset), .Z(n1) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_4 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   not_Ain, d, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;

  c_gate_0_4 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Rout) );
  HS65_LS_IVX9 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LS_IVX9 I_2 ( .A(Rout), .Z(d) );
  HS65_LS_IVX9 I_1 ( .A(n1), .Z(Aout) );
  HS65_LS_BFX9 U1 ( .A(n2), .Z(n1) );
  HS65_LS_BFX9 U2 ( .A(n3), .Z(n2) );
  HS65_LS_BFX9 U3 ( .A(n4), .Z(n3) );
  HS65_LS_BFX9 U4 ( .A(n5), .Z(n4) );
  HS65_LS_BFX9 U5 ( .A(n6), .Z(n5) );
  HS65_LS_BFX9 U6 ( .A(n7), .Z(n6) );
  HS65_LS_BFX9 U7 ( .A(n8), .Z(n7) );
  HS65_LS_BFX9 U8 ( .A(n9), .Z(n8) );
  HS65_LS_BFX9 U9 ( .A(n10), .Z(n9) );
  HS65_LS_BFX9 U10 ( .A(d), .Z(n10) );
  HS65_LSS_XOR2X6 U11 ( .A(Rout), .B(Ain), .Z(lt_en) );
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
  HS65_LS_LDHQX9 \data_reg[9]  ( .G(N3), .D(\left_in[DATA][9] ), .Q(
        \right_out[DATA][9] ) );
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
  HS65_LS_LDHQX4 \data_reg[33]  ( .G(N3), .D(\left_in[DATA][33] ), .Q(
        \right_out[DATA][33] ) );
  HS65_LS_NAND2AX7 U3 ( .A(preset), .B(lt_en), .Z(N3) );
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
  wire   \chan_internal_f[REQ] , \chan_internal_f[DATA][33] ,
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
         n6;

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
  HS65_LS_IVX9 I_1 ( .A(n1), .Z(\chan_internal_f[REQ] ) );
  HS65_LH_IVX2 I_0 ( .A(\chan_in_f[REQ] ), .Z(req_n) );
  HS65_LS_BFX9 U1 ( .A(n2), .Z(n1) );
  HS65_LS_BFX9 U2 ( .A(n3), .Z(n2) );
  HS65_LS_BFX9 U3 ( .A(n4), .Z(n3) );
  HS65_LS_BFX9 U4 ( .A(n5), .Z(n4) );
  HS65_LS_BFX9 U5 ( .A(n6), .Z(n5) );
  HS65_LS_BFX9 U6 ( .A(req_n), .Z(n6) );
  HS65_LSS_XOR2X6 U7 ( .A(\chan_internal_f[REQ] ), .B(\chan_in_b[ACK] ), .Z(
        data_in_valid) );
endmodule


module hpu_comb_0_1 ( data_valid, data_in, data_out, sel );
  input [33:0] data_in;
  output [33:0] data_out;
  output [4:0] sel;
  input data_valid;
  wire   N15, N17, N18, N19, N20, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n19, n20, n21, n22, n1, n23, n24, n25,
         n26, n27;
  assign data_out[33] = data_in[33];
  assign data_out[32] = data_in[32];

  HS65_LS_LDHQX9 \sel_reg[4]  ( .G(N20), .D(N19), .Q(sel[4]) );
  HS65_LS_LDHQX9 \sel_reg[3]  ( .G(N20), .D(N18), .Q(sel[3]) );
  HS65_LS_LDHQX9 \sel_reg[2]  ( .G(N20), .D(N17), .Q(sel[2]) );
  HS65_LS_LDHQX9 \sel_reg[1]  ( .G(N20), .D(1'b0), .Q(sel[1]) );
  HS65_LS_LDHQX9 \sel_reg[0]  ( .G(N20), .D(N15), .Q(sel[0]) );
  HS65_LS_BFX9 U3 ( .A(n19), .Z(n1) );
  HS65_LS_AO22X4 U4 ( .A(n26), .B(data_in[20]), .C(n24), .D(data_in[18]), .Z(
        data_out[18]) );
  HS65_LS_AO22X4 U5 ( .A(n26), .B(data_in[24]), .C(n24), .D(data_in[22]), .Z(
        data_out[22]) );
  HS65_LS_AO22X4 U6 ( .A(n26), .B(data_in[26]), .C(n24), .D(data_in[24]), .Z(
        data_out[24]) );
  HS65_LS_BFX9 U7 ( .A(n1), .Z(n25) );
  HS65_LS_IVX9 U8 ( .A(n25), .Z(n24) );
  HS65_LS_IVX9 U9 ( .A(n25), .Z(n23) );
  HS65_LS_OAI22X6 U10 ( .A(n13), .B(n24), .C(n25), .D(n14), .Z(data_out[7]) );
  HS65_LS_OAI22X6 U11 ( .A(n23), .B(n16), .C(n26), .D(n17), .Z(data_out[1]) );
  HS65_LS_OAI22X6 U12 ( .A(n23), .B(n15), .C(n26), .D(n16), .Z(data_out[3]) );
  HS65_LS_OAI22X6 U13 ( .A(n23), .B(n14), .C(n26), .D(n15), .Z(data_out[5]) );
  HS65_LS_OAI22X6 U14 ( .A(n23), .B(n12), .C(n26), .D(n13), .Z(data_out[9]) );
  HS65_LS_OAI22X6 U15 ( .A(n23), .B(n11), .C(n26), .D(n12), .Z(data_out[11])
         );
  HS65_LS_OAI22X6 U16 ( .A(n23), .B(n10), .C(n26), .D(n11), .Z(data_out[13])
         );
  HS65_LS_OAI22X6 U17 ( .A(n23), .B(n9), .C(n26), .D(n10), .Z(data_out[15]) );
  HS65_LS_OAI22X6 U18 ( .A(n23), .B(n8), .C(n26), .D(n9), .Z(data_out[17]) );
  HS65_LS_OAI22X6 U19 ( .A(n23), .B(n7), .C(n26), .D(n8), .Z(data_out[19]) );
  HS65_LS_OAI22X6 U20 ( .A(n23), .B(n6), .C(n26), .D(n7), .Z(data_out[21]) );
  HS65_LS_OAI22X6 U21 ( .A(n23), .B(n5), .C(n26), .D(n6), .Z(data_out[23]) );
  HS65_LS_OAI22X6 U22 ( .A(n24), .B(n4), .C(n26), .D(n5), .Z(data_out[25]) );
  HS65_LS_OAI22X6 U23 ( .A(n23), .B(n3), .C(n26), .D(n4), .Z(data_out[27]) );
  HS65_LS_OAI22X6 U24 ( .A(n24), .B(n2), .C(n26), .D(n3), .Z(data_out[29]) );
  HS65_LS_NAND2X7 U25 ( .A(n26), .B(n20), .Z(n21) );
  HS65_LS_NOR3X4 U26 ( .A(n21), .B(n17), .C(n22), .Z(N18) );
  HS65_LS_BFX9 U27 ( .A(n1), .Z(n26) );
  HS65_LS_NOR2AX3 U28 ( .A(n22), .B(n21), .Z(N17) );
  HS65_LS_NOR2X6 U29 ( .A(n24), .B(n20), .Z(N19) );
  HS65_LS_BFX9 U30 ( .A(n1), .Z(n27) );
  HS65_LS_NOR2X6 U31 ( .A(n26), .B(n2), .Z(data_out[31]) );
  HS65_LS_IVX9 U32 ( .A(data_in[1]), .Z(n17) );
  HS65_LS_NAND2X7 U33 ( .A(data_in[0]), .B(n17), .Z(n20) );
  HS65_LS_NOR2X6 U34 ( .A(n17), .B(data_in[0]), .Z(n22) );
  HS65_LS_IVX9 U35 ( .A(data_in[9]), .Z(n13) );
  HS65_LS_IVX9 U36 ( .A(data_in[3]), .Z(n16) );
  HS65_LS_IVX9 U37 ( .A(data_in[5]), .Z(n15) );
  HS65_LS_IVX9 U38 ( .A(data_in[7]), .Z(n14) );
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
  HS65_LS_IVX9 U49 ( .A(data_in[31]), .Z(n2) );
  HS65_LS_NOR2AX3 U50 ( .A(data_in[33]), .B(data_in[32]), .Z(n19) );
  HS65_LS_NOR2X6 U51 ( .A(data_in[1]), .B(n21), .Z(N15) );
  HS65_LS_AO22X9 U52 ( .A(n27), .B(data_in[2]), .C(n24), .D(data_in[0]), .Z(
        data_out[0]) );
  HS65_LS_AO22X9 U53 ( .A(n27), .B(data_in[4]), .C(n24), .D(data_in[2]), .Z(
        data_out[2]) );
  HS65_LS_AO22X9 U54 ( .A(n27), .B(data_in[6]), .C(n24), .D(data_in[4]), .Z(
        data_out[4]) );
  HS65_LS_AO22X9 U55 ( .A(n27), .B(data_in[8]), .C(n24), .D(data_in[6]), .Z(
        data_out[6]) );
  HS65_LS_AO22X9 U56 ( .A(n27), .B(data_in[10]), .C(n24), .D(data_in[8]), .Z(
        data_out[8]) );
  HS65_LS_AO22X9 U57 ( .A(n27), .B(data_in[16]), .C(n24), .D(data_in[14]), .Z(
        data_out[14]) );
  HS65_LS_AO22X9 U58 ( .A(n26), .B(data_in[18]), .C(n24), .D(data_in[16]), .Z(
        data_out[16]) );
  HS65_LS_AO22X9 U59 ( .A(n27), .B(data_in[22]), .C(n24), .D(data_in[20]), .Z(
        data_out[20]) );
  HS65_LS_AO22X9 U60 ( .A(n27), .B(data_in[28]), .C(n24), .D(data_in[26]), .Z(
        data_out[26]) );
  HS65_LS_AO22X9 U62 ( .A(n27), .B(data_in[30]), .C(n24), .D(data_in[28]), .Z(
        data_out[28]) );
  HS65_LS_AO22X9 U63 ( .A(n27), .B(data_in[12]), .C(n23), .D(data_in[10]), .Z(
        data_out[10]) );
  HS65_LS_AO22X9 U64 ( .A(n27), .B(data_in[14]), .C(n23), .D(data_in[12]), .Z(
        data_out[12]) );
  HS65_LS_AND2X4 U65 ( .A(data_in[30]), .B(n23), .Z(data_out[30]) );
  HS65_LS_NOR2AX3 U66 ( .A(data_valid), .B(data_in[32]), .Z(N20) );
endmodule


module sr_latch_0_3 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(qn), .Z(N1) );
  HS65_LS_IVX9 U2 ( .A(r), .Z(n1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_3 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_3 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_OAI21X3 U3 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_IVX9 U4 ( .A(preset), .Z(n1) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_3 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   not_Ain, d, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;

  c_gate_0_3 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Rout) );
  HS65_LS_IVX9 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LS_IVX9 I_2 ( .A(Rout), .Z(d) );
  HS65_LS_IVX9 I_1 ( .A(n1), .Z(Aout) );
  HS65_LS_BFX9 U1 ( .A(n2), .Z(n1) );
  HS65_LS_BFX9 U2 ( .A(n3), .Z(n2) );
  HS65_LS_BFX9 U3 ( .A(n4), .Z(n3) );
  HS65_LS_BFX9 U4 ( .A(n5), .Z(n4) );
  HS65_LS_BFX9 U5 ( .A(n6), .Z(n5) );
  HS65_LS_BFX9 U6 ( .A(n7), .Z(n6) );
  HS65_LS_BFX9 U7 ( .A(n8), .Z(n7) );
  HS65_LS_BFX9 U8 ( .A(n9), .Z(n8) );
  HS65_LS_BFX9 U9 ( .A(n10), .Z(n9) );
  HS65_LS_BFX9 U10 ( .A(d), .Z(n10) );
  HS65_LSS_XOR2X6 U11 ( .A(Rout), .B(Ain), .Z(lt_en) );
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
  HS65_LS_LDHQX9 \data_reg[33]  ( .G(N3), .D(\left_in[DATA][33] ), .Q(
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
  HS65_LS_NAND2AX7 U3 ( .A(preset), .B(lt_en), .Z(N3) );
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
  wire   \chan_internal_f[REQ] , \chan_internal_f[DATA][33] ,
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
         n6;

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
  HS65_LS_IVX9 I_1 ( .A(n1), .Z(\chan_internal_f[REQ] ) );
  HS65_LH_IVX2 I_0 ( .A(\chan_in_f[REQ] ), .Z(req_n) );
  HS65_LS_BFX9 U1 ( .A(n2), .Z(n1) );
  HS65_LS_BFX9 U2 ( .A(n3), .Z(n2) );
  HS65_LS_BFX9 U3 ( .A(n4), .Z(n3) );
  HS65_LS_BFX9 U4 ( .A(n5), .Z(n4) );
  HS65_LS_BFX9 U5 ( .A(n6), .Z(n5) );
  HS65_LS_BFX9 U6 ( .A(req_n), .Z(n6) );
  HS65_LSS_XOR2X6 U7 ( .A(\chan_internal_f[REQ] ), .B(\chan_in_b[ACK] ), .Z(
        data_in_valid) );
endmodule


module hpu_comb_0_3 ( data_valid, data_in, data_out, sel );
  input [33:0] data_in;
  output [33:0] data_out;
  output [4:0] sel;
  input data_valid;
  wire   N17, N18, N19, N21, N22, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n35, n36, n37, n38, n1, n39,
         n40, n41, n42, n43;
  assign data_out[33] = data_in[33];
  assign data_out[32] = data_in[32];

  HS65_LS_LDHQX9 \sel_reg[4]  ( .G(N22), .D(N21), .Q(sel[4]) );
  HS65_LS_LDHQX9 \sel_reg[3]  ( .G(N22), .D(1'b0), .Q(sel[3]) );
  HS65_LS_LDHQX9 \sel_reg[2]  ( .G(N22), .D(N19), .Q(sel[2]) );
  HS65_LS_LDHQX9 \sel_reg[1]  ( .G(N22), .D(N18), .Q(sel[1]) );
  HS65_LS_LDHQX9 \sel_reg[0]  ( .G(N22), .D(N17), .Q(sel[0]) );
  HS65_LS_BFX9 U3 ( .A(n43), .Z(n40) );
  HS65_LS_NOR2AX3 U4 ( .A(data_in[33]), .B(data_in[32]), .Z(n35) );
  HS65_LS_IVX9 U5 ( .A(n40), .Z(n39) );
  HS65_LS_IVX9 U6 ( .A(n40), .Z(n1) );
  HS65_LS_BFX9 U7 ( .A(n43), .Z(n41) );
  HS65_LS_BFX9 U8 ( .A(n43), .Z(n42) );
  HS65_LS_NOR2X6 U9 ( .A(n42), .B(n38), .Z(N17) );
  HS65_LS_OAI22X6 U10 ( .A(n40), .B(n25), .C(n1), .D(n27), .Z(data_out[6]) );
  HS65_LS_OAI22X6 U11 ( .A(n24), .B(n42), .C(n1), .D(n26), .Z(data_out[7]) );
  HS65_LS_OAI22X6 U12 ( .A(n42), .B(n31), .C(n1), .D(n33), .Z(data_out[0]) );
  HS65_LS_OAI22X6 U13 ( .A(n41), .B(n30), .C(n39), .D(n32), .Z(data_out[1]) );
  HS65_LS_OAI22X6 U14 ( .A(n41), .B(n29), .C(n1), .D(n31), .Z(data_out[2]) );
  HS65_LS_OAI22X6 U15 ( .A(n41), .B(n28), .C(n1), .D(n30), .Z(data_out[3]) );
  HS65_LS_OAI22X6 U16 ( .A(n41), .B(n27), .C(n1), .D(n29), .Z(data_out[4]) );
  HS65_LS_OAI22X6 U17 ( .A(n41), .B(n26), .C(n39), .D(n28), .Z(data_out[5]) );
  HS65_LS_OAI22X6 U18 ( .A(n41), .B(n23), .C(n1), .D(n25), .Z(data_out[8]) );
  HS65_LS_OAI22X6 U19 ( .A(n41), .B(n22), .C(n1), .D(n24), .Z(data_out[9]) );
  HS65_LS_OAI22X6 U20 ( .A(n42), .B(n21), .C(n1), .D(n23), .Z(data_out[10]) );
  HS65_LS_OAI22X6 U21 ( .A(n42), .B(n20), .C(n1), .D(n22), .Z(data_out[11]) );
  HS65_LS_OAI22X6 U22 ( .A(n42), .B(n19), .C(n1), .D(n21), .Z(data_out[12]) );
  HS65_LS_OAI22X6 U23 ( .A(n42), .B(n18), .C(n1), .D(n20), .Z(data_out[13]) );
  HS65_LS_OAI22X6 U24 ( .A(n42), .B(n17), .C(n1), .D(n19), .Z(data_out[14]) );
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
  HS65_LS_OAI22X6 U35 ( .A(n41), .B(n6), .C(n1), .D(n8), .Z(data_out[25]) );
  HS65_LS_OAI22X6 U36 ( .A(n41), .B(n5), .C(n1), .D(n7), .Z(data_out[26]) );
  HS65_LS_OAI22X6 U37 ( .A(n41), .B(n4), .C(n1), .D(n6), .Z(data_out[27]) );
  HS65_LS_OAI22X6 U38 ( .A(n41), .B(n3), .C(n1), .D(n5), .Z(data_out[28]) );
  HS65_LS_OAI22X6 U39 ( .A(n41), .B(n2), .C(n1), .D(n4), .Z(data_out[29]) );
  HS65_LS_NAND3X5 U40 ( .A(n38), .B(n36), .C(n39), .Z(n37) );
  HS65_LS_NAND2X7 U41 ( .A(n32), .B(n33), .Z(n38) );
  HS65_LS_NOR2X6 U42 ( .A(n33), .B(n37), .Z(N18) );
  HS65_LS_NOR2X6 U43 ( .A(n42), .B(n36), .Z(N21) );
  HS65_LS_NOR2X6 U44 ( .A(n1), .B(n3), .Z(data_out[30]) );
  HS65_LS_NOR2X6 U45 ( .A(n1), .B(n2), .Z(data_out[31]) );
  HS65_LS_IVX9 U46 ( .A(n35), .Z(n43) );
  HS65_LS_IVX9 U47 ( .A(data_in[0]), .Z(n33) );
  HS65_LS_NAND2X7 U48 ( .A(data_in[1]), .B(data_in[0]), .Z(n36) );
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
  HS65_LS_IVX9 U76 ( .A(data_in[29]), .Z(n4) );
  HS65_LS_IVX9 U78 ( .A(data_in[30]), .Z(n3) );
  HS65_LS_IVX9 U79 ( .A(data_in[31]), .Z(n2) );
  HS65_LS_IVX9 U80 ( .A(data_in[1]), .Z(n32) );
  HS65_LS_NOR2X6 U81 ( .A(data_in[0]), .B(n37), .Z(N19) );
  HS65_LS_NOR2AX3 U82 ( .A(data_valid), .B(data_in[32]), .Z(N22) );
endmodule


module sr_latch_0_2 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(qn), .Z(N1) );
  HS65_LS_IVX9 U2 ( .A(r), .Z(n1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_2 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_2 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_OAI21X3 U3 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_IVX9 U4 ( .A(preset), .Z(n1) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_2 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   not_Ain, d, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;

  c_gate_0_2 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Rout) );
  HS65_LS_IVX9 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LS_IVX9 I_2 ( .A(Rout), .Z(d) );
  HS65_LS_IVX9 I_1 ( .A(n1), .Z(Aout) );
  HS65_LS_BFX9 U1 ( .A(n2), .Z(n1) );
  HS65_LS_BFX9 U2 ( .A(n3), .Z(n2) );
  HS65_LS_BFX9 U3 ( .A(n4), .Z(n3) );
  HS65_LS_BFX9 U4 ( .A(n5), .Z(n4) );
  HS65_LS_BFX9 U5 ( .A(n6), .Z(n5) );
  HS65_LS_BFX9 U6 ( .A(n7), .Z(n6) );
  HS65_LS_BFX9 U7 ( .A(n8), .Z(n7) );
  HS65_LS_BFX9 U8 ( .A(n9), .Z(n8) );
  HS65_LS_BFX9 U9 ( .A(n10), .Z(n9) );
  HS65_LS_BFX9 U10 ( .A(d), .Z(n10) );
  HS65_LSS_XOR2X6 U11 ( .A(Rout), .B(Ain), .Z(lt_en) );
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
  HS65_LS_LDHQX9 \data_reg[33]  ( .G(N3), .D(\left_in[DATA][33] ), .Q(
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
  HS65_LS_NAND2AX7 U3 ( .A(preset), .B(lt_en), .Z(N3) );
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
  wire   \chan_internal_f[REQ] , \chan_internal_f[DATA][33] ,
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
         n6;

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
  HS65_LS_IVX9 I_1 ( .A(n1), .Z(\chan_internal_f[REQ] ) );
  HS65_LH_IVX2 I_0 ( .A(\chan_in_f[REQ] ), .Z(req_n) );
  HS65_LS_BFX9 U1 ( .A(n2), .Z(n1) );
  HS65_LS_BFX9 U2 ( .A(n3), .Z(n2) );
  HS65_LS_BFX9 U3 ( .A(n4), .Z(n3) );
  HS65_LS_BFX9 U4 ( .A(n5), .Z(n4) );
  HS65_LS_BFX9 U5 ( .A(n6), .Z(n5) );
  HS65_LS_BFX9 U6 ( .A(req_n), .Z(n6) );
  HS65_LSS_XOR2X6 U7 ( .A(\chan_internal_f[REQ] ), .B(\chan_in_b[ACK] ), .Z(
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
         n39, n40, n41, n42;
  assign data_out[33] = data_in[33];
  assign data_out[32] = data_in[32];

  HS65_LS_LDHQX9 \sel_reg[4]  ( .G(N16), .D(1'b0), .Q(sel[4]) );
  HS65_LS_LDHQX9 \sel_reg[3]  ( .G(N16), .D(N15), .Q(sel[3]) );
  HS65_LS_LDHQX9 \sel_reg[2]  ( .G(N16), .D(N14), .Q(sel[2]) );
  HS65_LS_LDHQX9 \sel_reg[1]  ( .G(N16), .D(N13), .Q(sel[1]) );
  HS65_LS_LDHQX9 \sel_reg[0]  ( .G(N16), .D(N12), .Q(sel[0]) );
  HS65_LS_BFX9 U3 ( .A(n42), .Z(n39) );
  HS65_LS_NOR2AX3 U4 ( .A(data_in[33]), .B(data_in[32]), .Z(n34) );
  HS65_LS_IVX9 U5 ( .A(n39), .Z(n38) );
  HS65_LS_IVX9 U6 ( .A(n39), .Z(n1) );
  HS65_LS_BFX9 U7 ( .A(n42), .Z(n40) );
  HS65_LS_BFX9 U8 ( .A(n42), .Z(n41) );
  HS65_LS_NOR2X6 U9 ( .A(n41), .B(n36), .Z(N12) );
  HS65_LS_OAI22X6 U10 ( .A(n39), .B(n25), .C(n1), .D(n27), .Z(data_out[6]) );
  HS65_LS_OAI22X6 U11 ( .A(n24), .B(n41), .C(n1), .D(n26), .Z(data_out[7]) );
  HS65_LS_OAI22X6 U12 ( .A(n41), .B(n31), .C(n1), .D(n33), .Z(data_out[0]) );
  HS65_LS_OAI22X6 U13 ( .A(n40), .B(n30), .C(n38), .D(n32), .Z(data_out[1]) );
  HS65_LS_OAI22X6 U14 ( .A(n40), .B(n29), .C(n1), .D(n31), .Z(data_out[2]) );
  HS65_LS_OAI22X6 U15 ( .A(n40), .B(n28), .C(n1), .D(n30), .Z(data_out[3]) );
  HS65_LS_OAI22X6 U16 ( .A(n40), .B(n27), .C(n1), .D(n29), .Z(data_out[4]) );
  HS65_LS_OAI22X6 U17 ( .A(n40), .B(n26), .C(n38), .D(n28), .Z(data_out[5]) );
  HS65_LS_OAI22X6 U18 ( .A(n40), .B(n23), .C(n1), .D(n25), .Z(data_out[8]) );
  HS65_LS_OAI22X6 U19 ( .A(n40), .B(n22), .C(n1), .D(n24), .Z(data_out[9]) );
  HS65_LS_OAI22X6 U20 ( .A(n41), .B(n21), .C(n1), .D(n23), .Z(data_out[10]) );
  HS65_LS_OAI22X6 U21 ( .A(n41), .B(n20), .C(n1), .D(n22), .Z(data_out[11]) );
  HS65_LS_OAI22X6 U22 ( .A(n41), .B(n19), .C(n1), .D(n21), .Z(data_out[12]) );
  HS65_LS_OAI22X6 U23 ( .A(n41), .B(n18), .C(n1), .D(n20), .Z(data_out[13]) );
  HS65_LS_OAI22X6 U24 ( .A(n41), .B(n17), .C(n1), .D(n19), .Z(data_out[14]) );
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
  HS65_LS_NAND3X5 U40 ( .A(n36), .B(n37), .C(n38), .Z(n35) );
  HS65_LS_NAND2X7 U41 ( .A(n32), .B(n33), .Z(n36) );
  HS65_LS_NOR2X6 U42 ( .A(n33), .B(n35), .Z(N15) );
  HS65_LS_NOR2X6 U43 ( .A(n41), .B(n37), .Z(N13) );
  HS65_LS_NOR2X6 U44 ( .A(n1), .B(n3), .Z(data_out[30]) );
  HS65_LS_NOR2X6 U45 ( .A(n1), .B(n2), .Z(data_out[31]) );
  HS65_LS_IVX9 U46 ( .A(n34), .Z(n42) );
  HS65_LS_IVX9 U47 ( .A(data_in[0]), .Z(n33) );
  HS65_LS_NAND2X7 U48 ( .A(data_in[0]), .B(n32), .Z(n37) );
  HS65_LS_IVX9 U49 ( .A(data_in[1]), .Z(n32) );
  HS65_LS_IVX9 U50 ( .A(data_in[9]), .Z(n24) );
  HS65_LS_IVX9 U51 ( .A(data_in[2]), .Z(n31) );
  HS65_LS_IVX9 U52 ( .A(data_in[3]), .Z(n30) );
  HS65_LS_IVX9 U53 ( .A(data_in[4]), .Z(n29) );
  HS65_LS_IVX9 U54 ( .A(data_in[5]), .Z(n28) );
  HS65_LS_IVX9 U55 ( .A(data_in[6]), .Z(n27) );
  HS65_LS_IVX9 U56 ( .A(data_in[7]), .Z(n26) );
  HS65_LS_IVX9 U57 ( .A(data_in[8]), .Z(n25) );
  HS65_LS_IVX9 U58 ( .A(data_in[10]), .Z(n23) );
  HS65_LS_IVX9 U59 ( .A(data_in[11]), .Z(n22) );
  HS65_LS_IVX9 U60 ( .A(data_in[12]), .Z(n21) );
  HS65_LS_IVX9 U61 ( .A(data_in[13]), .Z(n20) );
  HS65_LS_IVX9 U62 ( .A(data_in[14]), .Z(n19) );
  HS65_LS_IVX9 U63 ( .A(data_in[15]), .Z(n18) );
  HS65_LS_IVX9 U64 ( .A(data_in[16]), .Z(n17) );
  HS65_LS_IVX9 U65 ( .A(data_in[17]), .Z(n16) );
  HS65_LS_IVX9 U66 ( .A(data_in[18]), .Z(n15) );
  HS65_LS_IVX9 U67 ( .A(data_in[19]), .Z(n14) );
  HS65_LS_IVX9 U68 ( .A(data_in[20]), .Z(n13) );
  HS65_LS_IVX9 U69 ( .A(data_in[21]), .Z(n12) );
  HS65_LS_IVX9 U70 ( .A(data_in[22]), .Z(n11) );
  HS65_LS_IVX9 U71 ( .A(data_in[23]), .Z(n10) );
  HS65_LS_IVX9 U72 ( .A(data_in[24]), .Z(n9) );
  HS65_LS_IVX9 U73 ( .A(data_in[25]), .Z(n8) );
  HS65_LS_IVX9 U74 ( .A(data_in[26]), .Z(n7) );
  HS65_LS_IVX9 U75 ( .A(data_in[27]), .Z(n6) );
  HS65_LS_IVX9 U76 ( .A(data_in[28]), .Z(n5) );
  HS65_LS_IVX9 U77 ( .A(data_in[29]), .Z(n4) );
  HS65_LS_IVX9 U78 ( .A(data_in[30]), .Z(n3) );
  HS65_LS_IVX9 U79 ( .A(data_in[31]), .Z(n2) );
  HS65_LS_NOR2X6 U80 ( .A(data_in[0]), .B(n35), .Z(N14) );
  HS65_LS_NOR2AX3 U81 ( .A(data_valid), .B(data_in[32]), .Z(N16) );
endmodule


module sr_latch_0_1 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(qn), .Z(N1) );
  HS65_LS_IVX9 U2 ( .A(r), .Z(n1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_1 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_1 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_OAI21X3 U3 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_IVX9 U4 ( .A(preset), .Z(n1) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_1 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   not_Ain, d, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;

  c_gate_0_1 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Rout) );
  HS65_LS_IVX9 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LS_IVX9 I_2 ( .A(Rout), .Z(d) );
  HS65_LS_IVX9 I_1 ( .A(n1), .Z(Aout) );
  HS65_LS_BFX9 U1 ( .A(n2), .Z(n1) );
  HS65_LS_BFX9 U2 ( .A(n3), .Z(n2) );
  HS65_LS_BFX9 U3 ( .A(n4), .Z(n3) );
  HS65_LS_BFX9 U4 ( .A(n5), .Z(n4) );
  HS65_LS_BFX9 U5 ( .A(n6), .Z(n5) );
  HS65_LS_BFX9 U6 ( .A(n7), .Z(n6) );
  HS65_LS_BFX9 U7 ( .A(n8), .Z(n7) );
  HS65_LS_BFX9 U8 ( .A(n9), .Z(n8) );
  HS65_LS_BFX9 U9 ( .A(n10), .Z(n9) );
  HS65_LS_BFX9 U10 ( .A(d), .Z(n10) );
  HS65_LSS_XOR2X6 U11 ( .A(Rout), .B(Ain), .Z(lt_en) );
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
  HS65_LS_LDHQX9 \data_reg[33]  ( .G(N3), .D(\left_in[DATA][33] ), .Q(
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
  HS65_LS_NAND2AX7 U3 ( .A(preset), .B(lt_en), .Z(N3) );
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
  wire   \chan_internal_f[REQ] , \chan_internal_f[DATA][33] ,
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
         n6;

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
  HS65_LS_IVX9 I_1 ( .A(n1), .Z(\chan_internal_f[REQ] ) );
  HS65_LH_IVX2 I_0 ( .A(\chan_in_f[REQ] ), .Z(req_n) );
  HS65_LS_BFX9 U1 ( .A(n2), .Z(n1) );
  HS65_LS_BFX9 U2 ( .A(n3), .Z(n2) );
  HS65_LS_BFX9 U3 ( .A(n4), .Z(n3) );
  HS65_LS_BFX9 U4 ( .A(n5), .Z(n4) );
  HS65_LS_BFX9 U5 ( .A(n6), .Z(n5) );
  HS65_LS_BFX9 U6 ( .A(req_n), .Z(n6) );
  HS65_LSS_XOR2X6 U7 ( .A(\chan_internal_f[REQ] ), .B(\chan_in_b[ACK] ), .Z(
        data_in_valid) );
endmodule


module sr_latch_1_0 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n2;

  HS65_LH_AND2X4 C8 ( .A(n2), .B(N1), .Z(q) );
  HS65_LS_NOR2X6 U1 ( .A(s), .B(q), .Z(qn) );
  HS65_LS_IVX9 U2 ( .A(r), .Z(n2) );
  HS65_LS_IVX9 U3 ( .A(qn), .Z(N1) );
endmodule


module c_gate_generic_1_5_0 ( preset, \input , \output  );
  input [4:0] \input ;
  input preset;
  output \output ;
  wire   set, reset, n1, n2, n3;

  sr_latch_1_0 latch ( .s(set), .r(reset), .q(\output ) );
  HS65_LS_NOR4ABX2 U3 ( .A(n1), .B(n3), .C(\input [2]), .D(\input [1]), .Z(
        reset) );
  HS65_LS_NOR3X4 U4 ( .A(\input [3]), .B(preset), .C(\input [4]), .Z(n3) );
  HS65_LS_AO31X9 U5 ( .A(n2), .B(\input [3]), .C(\input [4]), .D(preset), .Z(
        set) );
  HS65_LS_AND3X9 U6 ( .A(\input [1]), .B(\input [0]), .C(\input [2]), .Z(n2)
         );
  HS65_LS_IVX9 U7 ( .A(\input [0]), .Z(n1) );
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


module c_gate_generic_1_5_1 ( preset, \input , \output  );
  input [4:0] \input ;
  input preset;
  output \output ;
  wire   set, reset, n4, n5, n6;

  sr_latch_1_1 latch ( .s(set), .r(reset), .q(\output ) );
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
  wire   \chs_in_b[4][ACK] , \chs_out_f[4][REQ] , synced_req, del, n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, n332,
         n333, n334, n335, n336, n337, n338, n339, n340, n341, n342, n343,
         n344, n345, n346;
  assign \chs_in_b[0][ACK]  = \chs_in_b[4][ACK] ;
  assign \chs_in_b[1][ACK]  = \chs_in_b[4][ACK] ;
  assign \chs_in_b[2][ACK]  = \chs_in_b[4][ACK] ;
  assign \chs_in_b[3][ACK]  = \chs_in_b[4][ACK] ;
  assign \chs_out_f[0][REQ]  = \chs_out_f[4][REQ] ;
  assign \chs_out_f[1][REQ]  = \chs_out_f[4][REQ] ;
  assign \chs_out_f[2][REQ]  = \chs_out_f[4][REQ] ;
  assign \chs_out_f[3][REQ]  = \chs_out_f[4][REQ] ;

  c_gate_generic_1_5_0 c_sync_req ( .preset(preset), .\input ({
        \chs_in_f[4][REQ] , \chs_in_f[3][REQ] , \chs_in_f[2][REQ] , 
        \chs_in_f[1][REQ] , \chs_in_f[0][REQ] }), .\output (synced_req) );
  c_gate_generic_1_5_1 c_sync_ack ( .preset(preset), .\input ({
        \chs_out_b[4][ACK] , \chs_out_b[3][ACK] , \chs_out_b[2][ACK] , 
        \chs_out_b[1][ACK] , \chs_out_b[0][ACK] }), .\output (
        \chs_in_b[4][ACK] ) );
  HS65_LS_IVX9 I_1 ( .A(n249), .Z(\chs_out_f[4][REQ] ) );
  HS65_LH_IVX2 I_0 ( .A(synced_req), .Z(del) );
  HS65_LS_BFX9 U2 ( .A(n250), .Z(n249) );
  HS65_LS_BFX9 U3 ( .A(n251), .Z(n250) );
  HS65_LS_BFX9 U4 ( .A(n252), .Z(n251) );
  HS65_LS_BFX9 U5 ( .A(n253), .Z(n252) );
  HS65_LS_BFX9 U6 ( .A(n254), .Z(n253) );
  HS65_LS_BFX9 U7 ( .A(n255), .Z(n254) );
  HS65_LS_BFX9 U8 ( .A(n256), .Z(n255) );
  HS65_LS_BFX9 U9 ( .A(del), .Z(n256) );
  HS65_LS_BFX9 U10 ( .A(n1), .Z(n284) );
  HS65_LS_BFX9 U11 ( .A(n1), .Z(n285) );
  HS65_LS_BFX9 U12 ( .A(n6), .Z(n269) );
  HS65_LS_BFX9 U13 ( .A(n6), .Z(n270) );
  HS65_LS_BFX9 U14 ( .A(n323), .Z(n324) );
  HS65_LS_BFX9 U15 ( .A(n323), .Z(n325) );
  HS65_LS_BFX9 U16 ( .A(n343), .Z(n344) );
  HS65_LS_BFX9 U17 ( .A(n343), .Z(n345) );
  HS65_LS_BFX9 U18 ( .A(n303), .Z(n304) );
  HS65_LS_BFX9 U19 ( .A(n303), .Z(n305) );
  HS65_LS_BFX9 U20 ( .A(n7), .Z(n266) );
  HS65_LS_BFX9 U21 ( .A(n7), .Z(n267) );
  HS65_LS_BFX9 U22 ( .A(n8), .Z(n263) );
  HS65_LS_BFX9 U23 ( .A(n8), .Z(n264) );
  HS65_LS_BFX9 U24 ( .A(n9), .Z(n260) );
  HS65_LS_BFX9 U25 ( .A(n9), .Z(n261) );
  HS65_LS_BFX9 U26 ( .A(n10), .Z(n257) );
  HS65_LS_BFX9 U27 ( .A(n10), .Z(n258) );
  HS65_LS_BFX9 U28 ( .A(n319), .Z(n320) );
  HS65_LS_BFX9 U29 ( .A(n319), .Z(n321) );
  HS65_LS_BFX9 U30 ( .A(n315), .Z(n316) );
  HS65_LS_BFX9 U31 ( .A(n315), .Z(n317) );
  HS65_LS_BFX9 U32 ( .A(n311), .Z(n312) );
  HS65_LS_BFX9 U33 ( .A(n311), .Z(n313) );
  HS65_LS_BFX9 U34 ( .A(n307), .Z(n308) );
  HS65_LS_BFX9 U35 ( .A(n307), .Z(n309) );
  HS65_LS_BFX9 U36 ( .A(n339), .Z(n340) );
  HS65_LS_BFX9 U37 ( .A(n339), .Z(n341) );
  HS65_LS_BFX9 U38 ( .A(n335), .Z(n336) );
  HS65_LS_BFX9 U39 ( .A(n335), .Z(n337) );
  HS65_LS_BFX9 U40 ( .A(n331), .Z(n332) );
  HS65_LS_BFX9 U41 ( .A(n331), .Z(n333) );
  HS65_LS_BFX9 U42 ( .A(n327), .Z(n328) );
  HS65_LS_BFX9 U43 ( .A(n327), .Z(n329) );
  HS65_LS_BFX9 U44 ( .A(n299), .Z(n300) );
  HS65_LS_BFX9 U45 ( .A(n299), .Z(n301) );
  HS65_LS_BFX9 U46 ( .A(n295), .Z(n296) );
  HS65_LS_BFX9 U47 ( .A(n295), .Z(n297) );
  HS65_LS_BFX9 U48 ( .A(n291), .Z(n292) );
  HS65_LS_BFX9 U49 ( .A(n291), .Z(n293) );
  HS65_LS_BFX9 U50 ( .A(n287), .Z(n288) );
  HS65_LS_BFX9 U51 ( .A(n287), .Z(n289) );
  HS65_LS_BFX9 U52 ( .A(n6), .Z(n271) );
  HS65_LS_BFX9 U53 ( .A(n2), .Z(n281) );
  HS65_LS_BFX9 U54 ( .A(n2), .Z(n282) );
  HS65_LS_BFX9 U55 ( .A(n3), .Z(n278) );
  HS65_LS_BFX9 U56 ( .A(n3), .Z(n279) );
  HS65_LS_BFX9 U57 ( .A(n4), .Z(n275) );
  HS65_LS_BFX9 U58 ( .A(n4), .Z(n276) );
  HS65_LS_BFX9 U59 ( .A(n5), .Z(n272) );
  HS65_LS_BFX9 U60 ( .A(n5), .Z(n273) );
  HS65_LS_BFX9 U61 ( .A(n303), .Z(n306) );
  HS65_LS_BFX9 U62 ( .A(n319), .Z(n322) );
  HS65_LS_BFX9 U63 ( .A(n315), .Z(n318) );
  HS65_LS_BFX9 U64 ( .A(n311), .Z(n314) );
  HS65_LS_BFX9 U65 ( .A(n307), .Z(n310) );
  HS65_LS_BFX9 U66 ( .A(n339), .Z(n342) );
  HS65_LS_BFX9 U67 ( .A(n335), .Z(n338) );
  HS65_LS_BFX9 U68 ( .A(n331), .Z(n334) );
  HS65_LS_BFX9 U69 ( .A(n327), .Z(n330) );
  HS65_LS_BFX9 U70 ( .A(n2), .Z(n283) );
  HS65_LS_BFX9 U71 ( .A(n3), .Z(n280) );
  HS65_LS_BFX9 U72 ( .A(n4), .Z(n277) );
  HS65_LS_BFX9 U73 ( .A(n5), .Z(n274) );
  HS65_LS_BFX9 U74 ( .A(n299), .Z(n302) );
  HS65_LS_BFX9 U75 ( .A(n295), .Z(n298) );
  HS65_LS_BFX9 U76 ( .A(n291), .Z(n294) );
  HS65_LS_BFX9 U77 ( .A(n287), .Z(n290) );
  HS65_LS_BFX9 U78 ( .A(n1), .Z(n286) );
  HS65_LS_BFX9 U79 ( .A(n7), .Z(n268) );
  HS65_LS_BFX9 U80 ( .A(n8), .Z(n265) );
  HS65_LS_BFX9 U81 ( .A(n9), .Z(n262) );
  HS65_LS_BFX9 U82 ( .A(n10), .Z(n259) );
  HS65_LS_BFX9 U83 ( .A(n323), .Z(n326) );
  HS65_LS_BFX9 U84 ( .A(n343), .Z(n346) );
  HS65_LS_OAI212X5 U85 ( .A(n271), .B(n45), .C(n286), .D(n11), .E(n86), .Z(
        \chs_out_f[4][DATA][33] ) );
  HS65_LS_AOI222X2 U86 ( .A(\chs_in_f[2][DATA][33] ), .B(n344), .C(
        \chs_in_f[0][DATA][33] ), .D(n306), .E(\chs_in_f[1][DATA][33] ), .F(
        n324), .Z(n86) );
  HS65_LS_OAI212X5 U87 ( .A(n45), .B(n268), .C(n11), .D(n283), .E(n120), .Z(
        \chs_out_f[3][DATA][33] ) );
  HS65_LS_AOI222X2 U88 ( .A(n342), .B(\chs_in_f[2][DATA][33] ), .C(n302), .D(
        \chs_in_f[0][DATA][33] ), .E(n322), .F(\chs_in_f[1][DATA][33] ), .Z(
        n120) );
  HS65_LS_OAI212X5 U89 ( .A(n45), .B(n265), .C(n11), .D(n280), .E(n154), .Z(
        \chs_out_f[2][DATA][33] ) );
  HS65_LS_AOI222X2 U90 ( .A(n338), .B(\chs_in_f[2][DATA][33] ), .C(n298), .D(
        \chs_in_f[0][DATA][33] ), .E(n318), .F(\chs_in_f[1][DATA][33] ), .Z(
        n154) );
  HS65_LS_OAI212X5 U91 ( .A(n45), .B(n262), .C(n11), .D(n277), .E(n188), .Z(
        \chs_out_f[1][DATA][33] ) );
  HS65_LS_AOI222X2 U92 ( .A(n334), .B(\chs_in_f[2][DATA][33] ), .C(n294), .D(
        \chs_in_f[0][DATA][33] ), .E(n314), .F(\chs_in_f[1][DATA][33] ), .Z(
        n188) );
  HS65_LS_OAI212X5 U93 ( .A(n45), .B(n259), .C(n11), .D(n274), .E(n222), .Z(
        \chs_out_f[0][DATA][33] ) );
  HS65_LS_AOI222X2 U94 ( .A(n330), .B(\chs_in_f[2][DATA][33] ), .C(n290), .D(
        \chs_in_f[0][DATA][33] ), .E(n310), .F(\chs_in_f[1][DATA][33] ), .Z(
        n222) );
  HS65_LS_OAI212X5 U95 ( .A(n269), .B(n78), .C(n284), .D(n44), .E(n112), .Z(
        \chs_out_f[4][DATA][0] ) );
  HS65_LS_AOI222X2 U96 ( .A(\chs_in_f[2][DATA][0] ), .B(n346), .C(
        \chs_in_f[0][DATA][0] ), .D(n304), .E(\chs_in_f[1][DATA][0] ), .F(n326), .Z(n112) );
  HS65_LS_OAI212X5 U97 ( .A(n269), .B(n77), .C(n284), .D(n43), .E(n101), .Z(
        \chs_out_f[4][DATA][1] ) );
  HS65_LS_AOI222X2 U98 ( .A(\chs_in_f[2][DATA][1] ), .B(n345), .C(
        \chs_in_f[0][DATA][1] ), .D(n304), .E(\chs_in_f[1][DATA][1] ), .F(n325), .Z(n101) );
  HS65_LS_OAI212X5 U99 ( .A(n270), .B(n76), .C(n285), .D(n42), .E(n90), .Z(
        \chs_out_f[4][DATA][2] ) );
  HS65_LS_AOI222X2 U100 ( .A(\chs_in_f[2][DATA][2] ), .B(n344), .C(
        \chs_in_f[0][DATA][2] ), .D(n305), .E(\chs_in_f[1][DATA][2] ), .F(n324), .Z(n90) );
  HS65_LS_OAI212X5 U101 ( .A(n271), .B(n75), .C(n286), .D(n41), .E(n85), .Z(
        \chs_out_f[4][DATA][3] ) );
  HS65_LS_AOI222X2 U102 ( .A(\chs_in_f[2][DATA][3] ), .B(n344), .C(
        \chs_in_f[0][DATA][3] ), .D(n306), .E(\chs_in_f[1][DATA][3] ), .F(n324), .Z(n85) );
  HS65_LS_OAI212X5 U103 ( .A(n271), .B(n74), .C(n286), .D(n40), .E(n84), .Z(
        \chs_out_f[4][DATA][4] ) );
  HS65_LS_AOI222X2 U104 ( .A(\chs_in_f[2][DATA][4] ), .B(n344), .C(
        \chs_in_f[0][DATA][4] ), .D(n306), .E(\chs_in_f[1][DATA][4] ), .F(n324), .Z(n84) );
  HS65_LS_OAI212X5 U105 ( .A(n271), .B(n73), .C(n286), .D(n39), .E(n83), .Z(
        \chs_out_f[4][DATA][5] ) );
  HS65_LS_AOI222X2 U106 ( .A(\chs_in_f[2][DATA][5] ), .B(n344), .C(
        \chs_in_f[0][DATA][5] ), .D(n306), .E(\chs_in_f[1][DATA][5] ), .F(n324), .Z(n83) );
  HS65_LS_OAI212X5 U107 ( .A(n271), .B(n72), .C(n286), .D(n38), .E(n82), .Z(
        \chs_out_f[4][DATA][6] ) );
  HS65_LS_AOI222X2 U108 ( .A(\chs_in_f[2][DATA][6] ), .B(n344), .C(
        \chs_in_f[0][DATA][6] ), .D(n306), .E(\chs_in_f[1][DATA][6] ), .F(n324), .Z(n82) );
  HS65_LS_OAI212X5 U109 ( .A(n271), .B(n71), .C(n286), .D(n37), .E(n81), .Z(
        \chs_out_f[4][DATA][7] ) );
  HS65_LS_AOI222X2 U110 ( .A(\chs_in_f[2][DATA][7] ), .B(n344), .C(
        \chs_in_f[0][DATA][7] ), .D(n306), .E(\chs_in_f[1][DATA][7] ), .F(n324), .Z(n81) );
  HS65_LS_OAI212X5 U111 ( .A(n271), .B(n70), .C(n286), .D(n36), .E(n80), .Z(
        \chs_out_f[4][DATA][8] ) );
  HS65_LS_AOI222X2 U112 ( .A(\chs_in_f[2][DATA][8] ), .B(n344), .C(
        \chs_in_f[0][DATA][8] ), .D(n306), .E(\chs_in_f[1][DATA][8] ), .F(n324), .Z(n80) );
  HS65_LS_OAI212X5 U113 ( .A(n269), .B(n68), .C(n284), .D(n34), .E(n111), .Z(
        \chs_out_f[4][DATA][10] ) );
  HS65_LS_AOI222X2 U114 ( .A(\chs_in_f[2][DATA][10] ), .B(n346), .C(
        \chs_in_f[0][DATA][10] ), .D(n304), .E(\chs_in_f[1][DATA][10] ), .F(
        n326), .Z(n111) );
  HS65_LS_OAI212X5 U115 ( .A(n269), .B(n67), .C(n284), .D(n33), .E(n110), .Z(
        \chs_out_f[4][DATA][11] ) );
  HS65_LS_AOI222X2 U116 ( .A(\chs_in_f[2][DATA][11] ), .B(n346), .C(
        \chs_in_f[0][DATA][11] ), .D(n304), .E(\chs_in_f[1][DATA][11] ), .F(
        n326), .Z(n110) );
  HS65_LS_OAI212X5 U117 ( .A(n269), .B(n66), .C(n284), .D(n32), .E(n109), .Z(
        \chs_out_f[4][DATA][12] ) );
  HS65_LS_AOI222X2 U118 ( .A(\chs_in_f[2][DATA][12] ), .B(n346), .C(
        \chs_in_f[0][DATA][12] ), .D(n304), .E(\chs_in_f[1][DATA][12] ), .F(
        n326), .Z(n109) );
  HS65_LS_OAI212X5 U119 ( .A(n269), .B(n65), .C(n284), .D(n31), .E(n108), .Z(
        \chs_out_f[4][DATA][13] ) );
  HS65_LS_AOI222X2 U120 ( .A(\chs_in_f[2][DATA][13] ), .B(n346), .C(
        \chs_in_f[0][DATA][13] ), .D(n304), .E(\chs_in_f[1][DATA][13] ), .F(
        n326), .Z(n108) );
  HS65_LS_OAI212X5 U121 ( .A(n269), .B(n64), .C(n284), .D(n30), .E(n107), .Z(
        \chs_out_f[4][DATA][14] ) );
  HS65_LS_AOI222X2 U122 ( .A(\chs_in_f[2][DATA][14] ), .B(n346), .C(
        \chs_in_f[0][DATA][14] ), .D(n304), .E(\chs_in_f[1][DATA][14] ), .F(
        n326), .Z(n107) );
  HS65_LS_OAI212X5 U123 ( .A(n269), .B(n63), .C(n284), .D(n29), .E(n106), .Z(
        \chs_out_f[4][DATA][15] ) );
  HS65_LS_AOI222X2 U124 ( .A(\chs_in_f[2][DATA][15] ), .B(n346), .C(
        \chs_in_f[0][DATA][15] ), .D(n304), .E(\chs_in_f[1][DATA][15] ), .F(
        n326), .Z(n106) );
  HS65_LS_OAI212X5 U125 ( .A(n269), .B(n62), .C(n284), .D(n28), .E(n105), .Z(
        \chs_out_f[4][DATA][16] ) );
  HS65_LS_AOI222X2 U126 ( .A(\chs_in_f[2][DATA][16] ), .B(n346), .C(
        \chs_in_f[0][DATA][16] ), .D(n304), .E(\chs_in_f[1][DATA][16] ), .F(
        n326), .Z(n105) );
  HS65_LS_OAI212X5 U127 ( .A(n269), .B(n61), .C(n284), .D(n27), .E(n104), .Z(
        \chs_out_f[4][DATA][17] ) );
  HS65_LS_AOI222X2 U128 ( .A(\chs_in_f[2][DATA][17] ), .B(n345), .C(
        \chs_in_f[0][DATA][17] ), .D(n304), .E(\chs_in_f[1][DATA][17] ), .F(
        n325), .Z(n104) );
  HS65_LS_OAI212X5 U129 ( .A(n269), .B(n60), .C(n284), .D(n26), .E(n103), .Z(
        \chs_out_f[4][DATA][18] ) );
  HS65_LS_AOI222X2 U130 ( .A(\chs_in_f[2][DATA][18] ), .B(n345), .C(
        \chs_in_f[0][DATA][18] ), .D(n304), .E(\chs_in_f[1][DATA][18] ), .F(
        n325), .Z(n103) );
  HS65_LS_OAI212X5 U131 ( .A(n269), .B(n59), .C(n284), .D(n25), .E(n102), .Z(
        \chs_out_f[4][DATA][19] ) );
  HS65_LS_AOI222X2 U132 ( .A(\chs_in_f[2][DATA][19] ), .B(n345), .C(
        \chs_in_f[0][DATA][19] ), .D(n304), .E(\chs_in_f[1][DATA][19] ), .F(
        n325), .Z(n102) );
  HS65_LS_OAI212X5 U133 ( .A(n270), .B(n58), .C(n284), .D(n24), .E(n100), .Z(
        \chs_out_f[4][DATA][20] ) );
  HS65_LS_AOI222X2 U134 ( .A(\chs_in_f[2][DATA][20] ), .B(n345), .C(
        \chs_in_f[0][DATA][20] ), .D(n305), .E(\chs_in_f[1][DATA][20] ), .F(
        n325), .Z(n100) );
  HS65_LS_OAI212X5 U135 ( .A(n270), .B(n57), .C(n285), .D(n23), .E(n99), .Z(
        \chs_out_f[4][DATA][21] ) );
  HS65_LS_AOI222X2 U136 ( .A(\chs_in_f[2][DATA][21] ), .B(n345), .C(
        \chs_in_f[0][DATA][21] ), .D(n305), .E(\chs_in_f[1][DATA][21] ), .F(
        n325), .Z(n99) );
  HS65_LS_OAI212X5 U137 ( .A(n270), .B(n56), .C(n285), .D(n22), .E(n98), .Z(
        \chs_out_f[4][DATA][22] ) );
  HS65_LS_AOI222X2 U138 ( .A(\chs_in_f[2][DATA][22] ), .B(n345), .C(
        \chs_in_f[0][DATA][22] ), .D(n305), .E(\chs_in_f[1][DATA][22] ), .F(
        n325), .Z(n98) );
  HS65_LS_OAI212X5 U139 ( .A(n270), .B(n55), .C(n285), .D(n21), .E(n97), .Z(
        \chs_out_f[4][DATA][23] ) );
  HS65_LS_AOI222X2 U140 ( .A(\chs_in_f[2][DATA][23] ), .B(n345), .C(
        \chs_in_f[0][DATA][23] ), .D(n305), .E(\chs_in_f[1][DATA][23] ), .F(
        n325), .Z(n97) );
  HS65_LS_OAI212X5 U141 ( .A(n270), .B(n54), .C(n285), .D(n20), .E(n96), .Z(
        \chs_out_f[4][DATA][24] ) );
  HS65_LS_AOI222X2 U142 ( .A(\chs_in_f[2][DATA][24] ), .B(n345), .C(
        \chs_in_f[0][DATA][24] ), .D(n305), .E(\chs_in_f[1][DATA][24] ), .F(
        n325), .Z(n96) );
  HS65_LS_OAI212X5 U143 ( .A(n270), .B(n53), .C(n285), .D(n19), .E(n95), .Z(
        \chs_out_f[4][DATA][25] ) );
  HS65_LS_AOI222X2 U144 ( .A(\chs_in_f[2][DATA][25] ), .B(n345), .C(
        \chs_in_f[0][DATA][25] ), .D(n305), .E(\chs_in_f[1][DATA][25] ), .F(
        n325), .Z(n95) );
  HS65_LS_OAI212X5 U145 ( .A(n270), .B(n52), .C(n285), .D(n18), .E(n94), .Z(
        \chs_out_f[4][DATA][26] ) );
  HS65_LS_AOI222X2 U146 ( .A(\chs_in_f[2][DATA][26] ), .B(n345), .C(
        \chs_in_f[0][DATA][26] ), .D(n305), .E(\chs_in_f[1][DATA][26] ), .F(
        n325), .Z(n94) );
  HS65_LS_OAI212X5 U147 ( .A(n270), .B(n51), .C(n285), .D(n17), .E(n93), .Z(
        \chs_out_f[4][DATA][27] ) );
  HS65_LS_AOI222X2 U148 ( .A(\chs_in_f[2][DATA][27] ), .B(n345), .C(
        \chs_in_f[0][DATA][27] ), .D(n305), .E(\chs_in_f[1][DATA][27] ), .F(
        n325), .Z(n93) );
  HS65_LS_OAI212X5 U149 ( .A(n270), .B(n50), .C(n285), .D(n16), .E(n92), .Z(
        \chs_out_f[4][DATA][28] ) );
  HS65_LS_AOI222X2 U150 ( .A(\chs_in_f[2][DATA][28] ), .B(n345), .C(
        \chs_in_f[0][DATA][28] ), .D(n305), .E(\chs_in_f[1][DATA][28] ), .F(
        n325), .Z(n92) );
  HS65_LS_OAI212X5 U151 ( .A(n270), .B(n49), .C(n285), .D(n15), .E(n91), .Z(
        \chs_out_f[4][DATA][29] ) );
  HS65_LS_AOI222X2 U152 ( .A(\chs_in_f[2][DATA][29] ), .B(n344), .C(
        \chs_in_f[0][DATA][29] ), .D(n305), .E(\chs_in_f[1][DATA][29] ), .F(
        n324), .Z(n91) );
  HS65_LS_OAI212X5 U153 ( .A(n270), .B(n48), .C(n285), .D(n14), .E(n89), .Z(
        \chs_out_f[4][DATA][30] ) );
  HS65_LS_AOI222X2 U154 ( .A(\chs_in_f[2][DATA][30] ), .B(n344), .C(
        \chs_in_f[0][DATA][30] ), .D(n305), .E(\chs_in_f[1][DATA][30] ), .F(
        n324), .Z(n89) );
  HS65_LS_OAI212X5 U155 ( .A(n271), .B(n47), .C(n285), .D(n13), .E(n88), .Z(
        \chs_out_f[4][DATA][31] ) );
  HS65_LS_AOI222X2 U156 ( .A(\chs_in_f[2][DATA][31] ), .B(n344), .C(
        \chs_in_f[0][DATA][31] ), .D(n306), .E(\chs_in_f[1][DATA][31] ), .F(
        n324), .Z(n88) );
  HS65_LS_OAI212X5 U157 ( .A(n271), .B(n46), .C(n285), .D(n12), .E(n87), .Z(
        \chs_out_f[4][DATA][32] ) );
  HS65_LS_AOI222X2 U158 ( .A(\chs_in_f[2][DATA][32] ), .B(n344), .C(
        \chs_in_f[0][DATA][32] ), .D(n306), .E(\chs_in_f[1][DATA][32] ), .F(
        n324), .Z(n87) );
  HS65_LS_OAI212X5 U159 ( .A(n69), .B(n268), .C(n35), .D(n283), .E(n113), .Z(
        \chs_out_f[3][DATA][9] ) );
  HS65_LS_AOI222X2 U160 ( .A(n342), .B(\chs_in_f[2][DATA][9] ), .C(n302), .D(
        \chs_in_f[0][DATA][9] ), .E(n322), .F(\chs_in_f[1][DATA][9] ), .Z(n113) );
  HS65_LS_OAI212X5 U161 ( .A(n69), .B(n265), .C(n35), .D(n280), .E(n147), .Z(
        \chs_out_f[2][DATA][9] ) );
  HS65_LS_AOI222X2 U162 ( .A(n338), .B(\chs_in_f[2][DATA][9] ), .C(n298), .D(
        \chs_in_f[0][DATA][9] ), .E(n318), .F(\chs_in_f[1][DATA][9] ), .Z(n147) );
  HS65_LS_OAI212X5 U163 ( .A(n69), .B(n262), .C(n35), .D(n277), .E(n181), .Z(
        \chs_out_f[1][DATA][9] ) );
  HS65_LS_AOI222X2 U164 ( .A(n334), .B(\chs_in_f[2][DATA][9] ), .C(n294), .D(
        \chs_in_f[0][DATA][9] ), .E(n314), .F(\chs_in_f[1][DATA][9] ), .Z(n181) );
  HS65_LS_OAI212X5 U165 ( .A(n69), .B(n259), .C(n35), .D(n274), .E(n215), .Z(
        \chs_out_f[0][DATA][9] ) );
  HS65_LS_AOI222X2 U166 ( .A(n330), .B(\chs_in_f[2][DATA][9] ), .C(n290), .D(
        \chs_in_f[0][DATA][9] ), .E(n310), .F(\chs_in_f[1][DATA][9] ), .Z(n215) );
  HS65_LS_OAI212X5 U167 ( .A(n69), .B(n271), .C(n35), .D(n286), .E(n79), .Z(
        \chs_out_f[4][DATA][9] ) );
  HS65_LS_AOI222X2 U168 ( .A(n344), .B(\chs_in_f[2][DATA][9] ), .C(n306), .D(
        \chs_in_f[0][DATA][9] ), .E(n324), .F(\chs_in_f[1][DATA][9] ), .Z(n79)
         );
  HS65_LS_OAI212X5 U169 ( .A(n78), .B(n266), .C(n44), .D(n281), .E(n146), .Z(
        \chs_out_f[3][DATA][0] ) );
  HS65_LS_AOI222X2 U170 ( .A(n340), .B(\chs_in_f[2][DATA][0] ), .C(n300), .D(
        \chs_in_f[0][DATA][0] ), .E(n320), .F(\chs_in_f[1][DATA][0] ), .Z(n146) );
  HS65_LS_OAI212X5 U171 ( .A(n77), .B(n266), .C(n43), .D(n281), .E(n135), .Z(
        \chs_out_f[3][DATA][1] ) );
  HS65_LS_AOI222X2 U172 ( .A(n340), .B(\chs_in_f[2][DATA][1] ), .C(n300), .D(
        \chs_in_f[0][DATA][1] ), .E(n320), .F(\chs_in_f[1][DATA][1] ), .Z(n135) );
  HS65_LS_OAI212X5 U173 ( .A(n76), .B(n267), .C(n42), .D(n282), .E(n124), .Z(
        \chs_out_f[3][DATA][2] ) );
  HS65_LS_AOI222X2 U174 ( .A(n341), .B(\chs_in_f[2][DATA][2] ), .C(n301), .D(
        \chs_in_f[0][DATA][2] ), .E(n321), .F(\chs_in_f[1][DATA][2] ), .Z(n124) );
  HS65_LS_OAI212X5 U175 ( .A(n68), .B(n266), .C(n34), .D(n281), .E(n145), .Z(
        \chs_out_f[3][DATA][10] ) );
  HS65_LS_AOI222X2 U176 ( .A(n340), .B(\chs_in_f[2][DATA][10] ), .C(n300), .D(
        \chs_in_f[0][DATA][10] ), .E(n320), .F(\chs_in_f[1][DATA][10] ), .Z(
        n145) );
  HS65_LS_OAI212X5 U177 ( .A(n67), .B(n266), .C(n33), .D(n281), .E(n144), .Z(
        \chs_out_f[3][DATA][11] ) );
  HS65_LS_AOI222X2 U178 ( .A(n340), .B(\chs_in_f[2][DATA][11] ), .C(n300), .D(
        \chs_in_f[0][DATA][11] ), .E(n320), .F(\chs_in_f[1][DATA][11] ), .Z(
        n144) );
  HS65_LS_OAI212X5 U179 ( .A(n66), .B(n266), .C(n32), .D(n281), .E(n143), .Z(
        \chs_out_f[3][DATA][12] ) );
  HS65_LS_AOI222X2 U180 ( .A(n340), .B(\chs_in_f[2][DATA][12] ), .C(n300), .D(
        \chs_in_f[0][DATA][12] ), .E(n320), .F(\chs_in_f[1][DATA][12] ), .Z(
        n143) );
  HS65_LS_OAI212X5 U181 ( .A(n65), .B(n266), .C(n31), .D(n281), .E(n142), .Z(
        \chs_out_f[3][DATA][13] ) );
  HS65_LS_AOI222X2 U182 ( .A(n340), .B(\chs_in_f[2][DATA][13] ), .C(n300), .D(
        \chs_in_f[0][DATA][13] ), .E(n320), .F(\chs_in_f[1][DATA][13] ), .Z(
        n142) );
  HS65_LS_OAI212X5 U183 ( .A(n64), .B(n266), .C(n30), .D(n281), .E(n141), .Z(
        \chs_out_f[3][DATA][14] ) );
  HS65_LS_AOI222X2 U184 ( .A(n340), .B(\chs_in_f[2][DATA][14] ), .C(n300), .D(
        \chs_in_f[0][DATA][14] ), .E(n320), .F(\chs_in_f[1][DATA][14] ), .Z(
        n141) );
  HS65_LS_OAI212X5 U185 ( .A(n63), .B(n266), .C(n29), .D(n281), .E(n140), .Z(
        \chs_out_f[3][DATA][15] ) );
  HS65_LS_AOI222X2 U186 ( .A(n340), .B(\chs_in_f[2][DATA][15] ), .C(n300), .D(
        \chs_in_f[0][DATA][15] ), .E(n320), .F(\chs_in_f[1][DATA][15] ), .Z(
        n140) );
  HS65_LS_OAI212X5 U187 ( .A(n62), .B(n266), .C(n28), .D(n281), .E(n139), .Z(
        \chs_out_f[3][DATA][16] ) );
  HS65_LS_AOI222X2 U188 ( .A(n340), .B(\chs_in_f[2][DATA][16] ), .C(n300), .D(
        \chs_in_f[0][DATA][16] ), .E(n320), .F(\chs_in_f[1][DATA][16] ), .Z(
        n139) );
  HS65_LS_OAI212X5 U189 ( .A(n61), .B(n266), .C(n27), .D(n281), .E(n138), .Z(
        \chs_out_f[3][DATA][17] ) );
  HS65_LS_AOI222X2 U190 ( .A(n340), .B(\chs_in_f[2][DATA][17] ), .C(n300), .D(
        \chs_in_f[0][DATA][17] ), .E(n320), .F(\chs_in_f[1][DATA][17] ), .Z(
        n138) );
  HS65_LS_OAI212X5 U191 ( .A(n60), .B(n266), .C(n26), .D(n281), .E(n137), .Z(
        \chs_out_f[3][DATA][18] ) );
  HS65_LS_AOI222X2 U192 ( .A(n340), .B(\chs_in_f[2][DATA][18] ), .C(n300), .D(
        \chs_in_f[0][DATA][18] ), .E(n320), .F(\chs_in_f[1][DATA][18] ), .Z(
        n137) );
  HS65_LS_OAI212X5 U193 ( .A(n59), .B(n266), .C(n25), .D(n281), .E(n136), .Z(
        \chs_out_f[3][DATA][19] ) );
  HS65_LS_AOI222X2 U194 ( .A(n340), .B(\chs_in_f[2][DATA][19] ), .C(n300), .D(
        \chs_in_f[0][DATA][19] ), .E(n320), .F(\chs_in_f[1][DATA][19] ), .Z(
        n136) );
  HS65_LS_OAI212X5 U195 ( .A(n58), .B(n266), .C(n24), .D(n282), .E(n134), .Z(
        \chs_out_f[3][DATA][20] ) );
  HS65_LS_AOI222X2 U196 ( .A(n341), .B(\chs_in_f[2][DATA][20] ), .C(n301), .D(
        \chs_in_f[0][DATA][20] ), .E(n321), .F(\chs_in_f[1][DATA][20] ), .Z(
        n134) );
  HS65_LS_OAI212X5 U197 ( .A(n57), .B(n267), .C(n23), .D(n282), .E(n133), .Z(
        \chs_out_f[3][DATA][21] ) );
  HS65_LS_AOI222X2 U198 ( .A(n341), .B(\chs_in_f[2][DATA][21] ), .C(n301), .D(
        \chs_in_f[0][DATA][21] ), .E(n321), .F(\chs_in_f[1][DATA][21] ), .Z(
        n133) );
  HS65_LS_OAI212X5 U199 ( .A(n56), .B(n267), .C(n22), .D(n282), .E(n132), .Z(
        \chs_out_f[3][DATA][22] ) );
  HS65_LS_AOI222X2 U200 ( .A(n341), .B(\chs_in_f[2][DATA][22] ), .C(n301), .D(
        \chs_in_f[0][DATA][22] ), .E(n321), .F(\chs_in_f[1][DATA][22] ), .Z(
        n132) );
  HS65_LS_OAI212X5 U201 ( .A(n55), .B(n267), .C(n21), .D(n282), .E(n131), .Z(
        \chs_out_f[3][DATA][23] ) );
  HS65_LS_AOI222X2 U202 ( .A(n341), .B(\chs_in_f[2][DATA][23] ), .C(n301), .D(
        \chs_in_f[0][DATA][23] ), .E(n321), .F(\chs_in_f[1][DATA][23] ), .Z(
        n131) );
  HS65_LS_OAI212X5 U203 ( .A(n54), .B(n267), .C(n20), .D(n282), .E(n130), .Z(
        \chs_out_f[3][DATA][24] ) );
  HS65_LS_AOI222X2 U204 ( .A(n341), .B(\chs_in_f[2][DATA][24] ), .C(n301), .D(
        \chs_in_f[0][DATA][24] ), .E(n321), .F(\chs_in_f[1][DATA][24] ), .Z(
        n130) );
  HS65_LS_OAI212X5 U205 ( .A(n53), .B(n267), .C(n19), .D(n282), .E(n129), .Z(
        \chs_out_f[3][DATA][25] ) );
  HS65_LS_AOI222X2 U206 ( .A(n341), .B(\chs_in_f[2][DATA][25] ), .C(n301), .D(
        \chs_in_f[0][DATA][25] ), .E(n321), .F(\chs_in_f[1][DATA][25] ), .Z(
        n129) );
  HS65_LS_OAI212X5 U207 ( .A(n52), .B(n267), .C(n18), .D(n282), .E(n128), .Z(
        \chs_out_f[3][DATA][26] ) );
  HS65_LS_AOI222X2 U208 ( .A(n341), .B(\chs_in_f[2][DATA][26] ), .C(n301), .D(
        \chs_in_f[0][DATA][26] ), .E(n321), .F(\chs_in_f[1][DATA][26] ), .Z(
        n128) );
  HS65_LS_OAI212X5 U209 ( .A(n51), .B(n267), .C(n17), .D(n282), .E(n127), .Z(
        \chs_out_f[3][DATA][27] ) );
  HS65_LS_AOI222X2 U210 ( .A(n341), .B(\chs_in_f[2][DATA][27] ), .C(n301), .D(
        \chs_in_f[0][DATA][27] ), .E(n321), .F(\chs_in_f[1][DATA][27] ), .Z(
        n127) );
  HS65_LS_OAI212X5 U211 ( .A(n50), .B(n267), .C(n16), .D(n282), .E(n126), .Z(
        \chs_out_f[3][DATA][28] ) );
  HS65_LS_AOI222X2 U212 ( .A(n341), .B(\chs_in_f[2][DATA][28] ), .C(n301), .D(
        \chs_in_f[0][DATA][28] ), .E(n321), .F(\chs_in_f[1][DATA][28] ), .Z(
        n126) );
  HS65_LS_OAI212X5 U213 ( .A(n49), .B(n267), .C(n15), .D(n282), .E(n125), .Z(
        \chs_out_f[3][DATA][29] ) );
  HS65_LS_AOI222X2 U214 ( .A(n341), .B(\chs_in_f[2][DATA][29] ), .C(n301), .D(
        \chs_in_f[0][DATA][29] ), .E(n321), .F(\chs_in_f[1][DATA][29] ), .Z(
        n125) );
  HS65_LS_OAI212X5 U215 ( .A(n48), .B(n267), .C(n14), .D(n282), .E(n123), .Z(
        \chs_out_f[3][DATA][30] ) );
  HS65_LS_AOI222X2 U216 ( .A(n341), .B(\chs_in_f[2][DATA][30] ), .C(n301), .D(
        \chs_in_f[0][DATA][30] ), .E(n321), .F(\chs_in_f[1][DATA][30] ), .Z(
        n123) );
  HS65_LS_OAI212X5 U217 ( .A(n47), .B(n267), .C(n13), .D(n283), .E(n122), .Z(
        \chs_out_f[3][DATA][31] ) );
  HS65_LS_AOI222X2 U218 ( .A(n342), .B(\chs_in_f[2][DATA][31] ), .C(n302), .D(
        \chs_in_f[0][DATA][31] ), .E(n322), .F(\chs_in_f[1][DATA][31] ), .Z(
        n122) );
  HS65_LS_OAI212X5 U219 ( .A(n46), .B(n267), .C(n12), .D(n283), .E(n121), .Z(
        \chs_out_f[3][DATA][32] ) );
  HS65_LS_AOI222X2 U220 ( .A(n342), .B(\chs_in_f[2][DATA][32] ), .C(n302), .D(
        \chs_in_f[0][DATA][32] ), .E(n322), .F(\chs_in_f[1][DATA][32] ), .Z(
        n121) );
  HS65_LS_OAI212X5 U221 ( .A(n78), .B(n263), .C(n44), .D(n278), .E(n180), .Z(
        \chs_out_f[2][DATA][0] ) );
  HS65_LS_AOI222X2 U222 ( .A(n336), .B(\chs_in_f[2][DATA][0] ), .C(n296), .D(
        \chs_in_f[0][DATA][0] ), .E(n316), .F(\chs_in_f[1][DATA][0] ), .Z(n180) );
  HS65_LS_OAI212X5 U223 ( .A(n77), .B(n263), .C(n43), .D(n278), .E(n169), .Z(
        \chs_out_f[2][DATA][1] ) );
  HS65_LS_AOI222X2 U224 ( .A(n336), .B(\chs_in_f[2][DATA][1] ), .C(n296), .D(
        \chs_in_f[0][DATA][1] ), .E(n316), .F(\chs_in_f[1][DATA][1] ), .Z(n169) );
  HS65_LS_OAI212X5 U225 ( .A(n76), .B(n264), .C(n42), .D(n279), .E(n158), .Z(
        \chs_out_f[2][DATA][2] ) );
  HS65_LS_AOI222X2 U226 ( .A(n337), .B(\chs_in_f[2][DATA][2] ), .C(n297), .D(
        \chs_in_f[0][DATA][2] ), .E(n317), .F(\chs_in_f[1][DATA][2] ), .Z(n158) );
  HS65_LS_OAI212X5 U227 ( .A(n68), .B(n263), .C(n34), .D(n278), .E(n179), .Z(
        \chs_out_f[2][DATA][10] ) );
  HS65_LS_AOI222X2 U228 ( .A(n336), .B(\chs_in_f[2][DATA][10] ), .C(n296), .D(
        \chs_in_f[0][DATA][10] ), .E(n316), .F(\chs_in_f[1][DATA][10] ), .Z(
        n179) );
  HS65_LS_OAI212X5 U229 ( .A(n67), .B(n263), .C(n33), .D(n278), .E(n178), .Z(
        \chs_out_f[2][DATA][11] ) );
  HS65_LS_AOI222X2 U230 ( .A(n336), .B(\chs_in_f[2][DATA][11] ), .C(n296), .D(
        \chs_in_f[0][DATA][11] ), .E(n316), .F(\chs_in_f[1][DATA][11] ), .Z(
        n178) );
  HS65_LS_OAI212X5 U231 ( .A(n66), .B(n263), .C(n32), .D(n278), .E(n177), .Z(
        \chs_out_f[2][DATA][12] ) );
  HS65_LS_AOI222X2 U232 ( .A(n336), .B(\chs_in_f[2][DATA][12] ), .C(n296), .D(
        \chs_in_f[0][DATA][12] ), .E(n316), .F(\chs_in_f[1][DATA][12] ), .Z(
        n177) );
  HS65_LS_OAI212X5 U233 ( .A(n65), .B(n263), .C(n31), .D(n278), .E(n176), .Z(
        \chs_out_f[2][DATA][13] ) );
  HS65_LS_AOI222X2 U234 ( .A(n336), .B(\chs_in_f[2][DATA][13] ), .C(n296), .D(
        \chs_in_f[0][DATA][13] ), .E(n316), .F(\chs_in_f[1][DATA][13] ), .Z(
        n176) );
  HS65_LS_OAI212X5 U235 ( .A(n64), .B(n263), .C(n30), .D(n278), .E(n175), .Z(
        \chs_out_f[2][DATA][14] ) );
  HS65_LS_AOI222X2 U236 ( .A(n336), .B(\chs_in_f[2][DATA][14] ), .C(n296), .D(
        \chs_in_f[0][DATA][14] ), .E(n316), .F(\chs_in_f[1][DATA][14] ), .Z(
        n175) );
  HS65_LS_OAI212X5 U237 ( .A(n63), .B(n263), .C(n29), .D(n278), .E(n174), .Z(
        \chs_out_f[2][DATA][15] ) );
  HS65_LS_AOI222X2 U238 ( .A(n336), .B(\chs_in_f[2][DATA][15] ), .C(n296), .D(
        \chs_in_f[0][DATA][15] ), .E(n316), .F(\chs_in_f[1][DATA][15] ), .Z(
        n174) );
  HS65_LS_OAI212X5 U239 ( .A(n62), .B(n263), .C(n28), .D(n278), .E(n173), .Z(
        \chs_out_f[2][DATA][16] ) );
  HS65_LS_AOI222X2 U240 ( .A(n336), .B(\chs_in_f[2][DATA][16] ), .C(n296), .D(
        \chs_in_f[0][DATA][16] ), .E(n316), .F(\chs_in_f[1][DATA][16] ), .Z(
        n173) );
  HS65_LS_OAI212X5 U241 ( .A(n61), .B(n263), .C(n27), .D(n278), .E(n172), .Z(
        \chs_out_f[2][DATA][17] ) );
  HS65_LS_AOI222X2 U242 ( .A(n336), .B(\chs_in_f[2][DATA][17] ), .C(n296), .D(
        \chs_in_f[0][DATA][17] ), .E(n316), .F(\chs_in_f[1][DATA][17] ), .Z(
        n172) );
  HS65_LS_OAI212X5 U243 ( .A(n60), .B(n263), .C(n26), .D(n278), .E(n171), .Z(
        \chs_out_f[2][DATA][18] ) );
  HS65_LS_AOI222X2 U244 ( .A(n336), .B(\chs_in_f[2][DATA][18] ), .C(n296), .D(
        \chs_in_f[0][DATA][18] ), .E(n316), .F(\chs_in_f[1][DATA][18] ), .Z(
        n171) );
  HS65_LS_OAI212X5 U245 ( .A(n59), .B(n263), .C(n25), .D(n278), .E(n170), .Z(
        \chs_out_f[2][DATA][19] ) );
  HS65_LS_AOI222X2 U246 ( .A(n336), .B(\chs_in_f[2][DATA][19] ), .C(n296), .D(
        \chs_in_f[0][DATA][19] ), .E(n316), .F(\chs_in_f[1][DATA][19] ), .Z(
        n170) );
  HS65_LS_OAI212X5 U247 ( .A(n58), .B(n263), .C(n24), .D(n279), .E(n168), .Z(
        \chs_out_f[2][DATA][20] ) );
  HS65_LS_AOI222X2 U248 ( .A(n337), .B(\chs_in_f[2][DATA][20] ), .C(n297), .D(
        \chs_in_f[0][DATA][20] ), .E(n317), .F(\chs_in_f[1][DATA][20] ), .Z(
        n168) );
  HS65_LS_OAI212X5 U249 ( .A(n57), .B(n264), .C(n23), .D(n279), .E(n167), .Z(
        \chs_out_f[2][DATA][21] ) );
  HS65_LS_AOI222X2 U250 ( .A(n337), .B(\chs_in_f[2][DATA][21] ), .C(n297), .D(
        \chs_in_f[0][DATA][21] ), .E(n317), .F(\chs_in_f[1][DATA][21] ), .Z(
        n167) );
  HS65_LS_OAI212X5 U251 ( .A(n56), .B(n264), .C(n22), .D(n279), .E(n166), .Z(
        \chs_out_f[2][DATA][22] ) );
  HS65_LS_AOI222X2 U252 ( .A(n337), .B(\chs_in_f[2][DATA][22] ), .C(n297), .D(
        \chs_in_f[0][DATA][22] ), .E(n317), .F(\chs_in_f[1][DATA][22] ), .Z(
        n166) );
  HS65_LS_OAI212X5 U253 ( .A(n55), .B(n264), .C(n21), .D(n279), .E(n165), .Z(
        \chs_out_f[2][DATA][23] ) );
  HS65_LS_AOI222X2 U254 ( .A(n337), .B(\chs_in_f[2][DATA][23] ), .C(n297), .D(
        \chs_in_f[0][DATA][23] ), .E(n317), .F(\chs_in_f[1][DATA][23] ), .Z(
        n165) );
  HS65_LS_OAI212X5 U255 ( .A(n54), .B(n264), .C(n20), .D(n279), .E(n164), .Z(
        \chs_out_f[2][DATA][24] ) );
  HS65_LS_AOI222X2 U256 ( .A(n337), .B(\chs_in_f[2][DATA][24] ), .C(n297), .D(
        \chs_in_f[0][DATA][24] ), .E(n317), .F(\chs_in_f[1][DATA][24] ), .Z(
        n164) );
  HS65_LS_OAI212X5 U257 ( .A(n53), .B(n264), .C(n19), .D(n279), .E(n163), .Z(
        \chs_out_f[2][DATA][25] ) );
  HS65_LS_AOI222X2 U258 ( .A(n337), .B(\chs_in_f[2][DATA][25] ), .C(n297), .D(
        \chs_in_f[0][DATA][25] ), .E(n317), .F(\chs_in_f[1][DATA][25] ), .Z(
        n163) );
  HS65_LS_OAI212X5 U259 ( .A(n52), .B(n264), .C(n18), .D(n279), .E(n162), .Z(
        \chs_out_f[2][DATA][26] ) );
  HS65_LS_AOI222X2 U260 ( .A(n337), .B(\chs_in_f[2][DATA][26] ), .C(n297), .D(
        \chs_in_f[0][DATA][26] ), .E(n317), .F(\chs_in_f[1][DATA][26] ), .Z(
        n162) );
  HS65_LS_OAI212X5 U261 ( .A(n51), .B(n264), .C(n17), .D(n279), .E(n161), .Z(
        \chs_out_f[2][DATA][27] ) );
  HS65_LS_AOI222X2 U262 ( .A(n337), .B(\chs_in_f[2][DATA][27] ), .C(n297), .D(
        \chs_in_f[0][DATA][27] ), .E(n317), .F(\chs_in_f[1][DATA][27] ), .Z(
        n161) );
  HS65_LS_OAI212X5 U263 ( .A(n50), .B(n264), .C(n16), .D(n279), .E(n160), .Z(
        \chs_out_f[2][DATA][28] ) );
  HS65_LS_AOI222X2 U264 ( .A(n337), .B(\chs_in_f[2][DATA][28] ), .C(n297), .D(
        \chs_in_f[0][DATA][28] ), .E(n317), .F(\chs_in_f[1][DATA][28] ), .Z(
        n160) );
  HS65_LS_OAI212X5 U265 ( .A(n49), .B(n264), .C(n15), .D(n279), .E(n159), .Z(
        \chs_out_f[2][DATA][29] ) );
  HS65_LS_AOI222X2 U266 ( .A(n337), .B(\chs_in_f[2][DATA][29] ), .C(n297), .D(
        \chs_in_f[0][DATA][29] ), .E(n317), .F(\chs_in_f[1][DATA][29] ), .Z(
        n159) );
  HS65_LS_OAI212X5 U267 ( .A(n48), .B(n264), .C(n14), .D(n279), .E(n157), .Z(
        \chs_out_f[2][DATA][30] ) );
  HS65_LS_AOI222X2 U268 ( .A(n337), .B(\chs_in_f[2][DATA][30] ), .C(n297), .D(
        \chs_in_f[0][DATA][30] ), .E(n317), .F(\chs_in_f[1][DATA][30] ), .Z(
        n157) );
  HS65_LS_OAI212X5 U269 ( .A(n47), .B(n264), .C(n13), .D(n280), .E(n156), .Z(
        \chs_out_f[2][DATA][31] ) );
  HS65_LS_AOI222X2 U270 ( .A(n338), .B(\chs_in_f[2][DATA][31] ), .C(n298), .D(
        \chs_in_f[0][DATA][31] ), .E(n318), .F(\chs_in_f[1][DATA][31] ), .Z(
        n156) );
  HS65_LS_OAI212X5 U271 ( .A(n46), .B(n264), .C(n12), .D(n280), .E(n155), .Z(
        \chs_out_f[2][DATA][32] ) );
  HS65_LS_AOI222X2 U272 ( .A(n338), .B(\chs_in_f[2][DATA][32] ), .C(n298), .D(
        \chs_in_f[0][DATA][32] ), .E(n318), .F(\chs_in_f[1][DATA][32] ), .Z(
        n155) );
  HS65_LS_OAI212X5 U273 ( .A(n78), .B(n260), .C(n44), .D(n275), .E(n214), .Z(
        \chs_out_f[1][DATA][0] ) );
  HS65_LS_AOI222X2 U274 ( .A(n332), .B(\chs_in_f[2][DATA][0] ), .C(n292), .D(
        \chs_in_f[0][DATA][0] ), .E(n312), .F(\chs_in_f[1][DATA][0] ), .Z(n214) );
  HS65_LS_OAI212X5 U275 ( .A(n77), .B(n260), .C(n43), .D(n275), .E(n203), .Z(
        \chs_out_f[1][DATA][1] ) );
  HS65_LS_AOI222X2 U276 ( .A(n332), .B(\chs_in_f[2][DATA][1] ), .C(n292), .D(
        \chs_in_f[0][DATA][1] ), .E(n312), .F(\chs_in_f[1][DATA][1] ), .Z(n203) );
  HS65_LS_OAI212X5 U277 ( .A(n76), .B(n261), .C(n42), .D(n276), .E(n192), .Z(
        \chs_out_f[1][DATA][2] ) );
  HS65_LS_AOI222X2 U278 ( .A(n333), .B(\chs_in_f[2][DATA][2] ), .C(n293), .D(
        \chs_in_f[0][DATA][2] ), .E(n313), .F(\chs_in_f[1][DATA][2] ), .Z(n192) );
  HS65_LS_OAI212X5 U279 ( .A(n68), .B(n260), .C(n34), .D(n275), .E(n213), .Z(
        \chs_out_f[1][DATA][10] ) );
  HS65_LS_AOI222X2 U280 ( .A(n332), .B(\chs_in_f[2][DATA][10] ), .C(n292), .D(
        \chs_in_f[0][DATA][10] ), .E(n312), .F(\chs_in_f[1][DATA][10] ), .Z(
        n213) );
  HS65_LS_OAI212X5 U281 ( .A(n67), .B(n260), .C(n33), .D(n275), .E(n212), .Z(
        \chs_out_f[1][DATA][11] ) );
  HS65_LS_AOI222X2 U282 ( .A(n332), .B(\chs_in_f[2][DATA][11] ), .C(n292), .D(
        \chs_in_f[0][DATA][11] ), .E(n312), .F(\chs_in_f[1][DATA][11] ), .Z(
        n212) );
  HS65_LS_OAI212X5 U283 ( .A(n66), .B(n260), .C(n32), .D(n275), .E(n211), .Z(
        \chs_out_f[1][DATA][12] ) );
  HS65_LS_AOI222X2 U284 ( .A(n332), .B(\chs_in_f[2][DATA][12] ), .C(n292), .D(
        \chs_in_f[0][DATA][12] ), .E(n312), .F(\chs_in_f[1][DATA][12] ), .Z(
        n211) );
  HS65_LS_OAI212X5 U285 ( .A(n65), .B(n260), .C(n31), .D(n275), .E(n210), .Z(
        \chs_out_f[1][DATA][13] ) );
  HS65_LS_AOI222X2 U286 ( .A(n332), .B(\chs_in_f[2][DATA][13] ), .C(n292), .D(
        \chs_in_f[0][DATA][13] ), .E(n312), .F(\chs_in_f[1][DATA][13] ), .Z(
        n210) );
  HS65_LS_OAI212X5 U287 ( .A(n64), .B(n260), .C(n30), .D(n275), .E(n209), .Z(
        \chs_out_f[1][DATA][14] ) );
  HS65_LS_AOI222X2 U288 ( .A(n332), .B(\chs_in_f[2][DATA][14] ), .C(n292), .D(
        \chs_in_f[0][DATA][14] ), .E(n312), .F(\chs_in_f[1][DATA][14] ), .Z(
        n209) );
  HS65_LS_OAI212X5 U289 ( .A(n63), .B(n260), .C(n29), .D(n275), .E(n208), .Z(
        \chs_out_f[1][DATA][15] ) );
  HS65_LS_AOI222X2 U290 ( .A(n332), .B(\chs_in_f[2][DATA][15] ), .C(n292), .D(
        \chs_in_f[0][DATA][15] ), .E(n312), .F(\chs_in_f[1][DATA][15] ), .Z(
        n208) );
  HS65_LS_OAI212X5 U291 ( .A(n62), .B(n260), .C(n28), .D(n275), .E(n207), .Z(
        \chs_out_f[1][DATA][16] ) );
  HS65_LS_AOI222X2 U292 ( .A(n332), .B(\chs_in_f[2][DATA][16] ), .C(n292), .D(
        \chs_in_f[0][DATA][16] ), .E(n312), .F(\chs_in_f[1][DATA][16] ), .Z(
        n207) );
  HS65_LS_OAI212X5 U293 ( .A(n61), .B(n260), .C(n27), .D(n275), .E(n206), .Z(
        \chs_out_f[1][DATA][17] ) );
  HS65_LS_AOI222X2 U294 ( .A(n332), .B(\chs_in_f[2][DATA][17] ), .C(n292), .D(
        \chs_in_f[0][DATA][17] ), .E(n312), .F(\chs_in_f[1][DATA][17] ), .Z(
        n206) );
  HS65_LS_OAI212X5 U295 ( .A(n60), .B(n260), .C(n26), .D(n275), .E(n205), .Z(
        \chs_out_f[1][DATA][18] ) );
  HS65_LS_AOI222X2 U296 ( .A(n332), .B(\chs_in_f[2][DATA][18] ), .C(n292), .D(
        \chs_in_f[0][DATA][18] ), .E(n312), .F(\chs_in_f[1][DATA][18] ), .Z(
        n205) );
  HS65_LS_OAI212X5 U297 ( .A(n59), .B(n260), .C(n25), .D(n275), .E(n204), .Z(
        \chs_out_f[1][DATA][19] ) );
  HS65_LS_AOI222X2 U298 ( .A(n332), .B(\chs_in_f[2][DATA][19] ), .C(n292), .D(
        \chs_in_f[0][DATA][19] ), .E(n312), .F(\chs_in_f[1][DATA][19] ), .Z(
        n204) );
  HS65_LS_OAI212X5 U299 ( .A(n58), .B(n260), .C(n24), .D(n276), .E(n202), .Z(
        \chs_out_f[1][DATA][20] ) );
  HS65_LS_AOI222X2 U300 ( .A(n333), .B(\chs_in_f[2][DATA][20] ), .C(n293), .D(
        \chs_in_f[0][DATA][20] ), .E(n313), .F(\chs_in_f[1][DATA][20] ), .Z(
        n202) );
  HS65_LS_OAI212X5 U301 ( .A(n57), .B(n261), .C(n23), .D(n276), .E(n201), .Z(
        \chs_out_f[1][DATA][21] ) );
  HS65_LS_AOI222X2 U302 ( .A(n333), .B(\chs_in_f[2][DATA][21] ), .C(n293), .D(
        \chs_in_f[0][DATA][21] ), .E(n313), .F(\chs_in_f[1][DATA][21] ), .Z(
        n201) );
  HS65_LS_OAI212X5 U303 ( .A(n56), .B(n261), .C(n22), .D(n276), .E(n200), .Z(
        \chs_out_f[1][DATA][22] ) );
  HS65_LS_AOI222X2 U304 ( .A(n333), .B(\chs_in_f[2][DATA][22] ), .C(n293), .D(
        \chs_in_f[0][DATA][22] ), .E(n313), .F(\chs_in_f[1][DATA][22] ), .Z(
        n200) );
  HS65_LS_OAI212X5 U305 ( .A(n55), .B(n261), .C(n21), .D(n276), .E(n199), .Z(
        \chs_out_f[1][DATA][23] ) );
  HS65_LS_AOI222X2 U306 ( .A(n333), .B(\chs_in_f[2][DATA][23] ), .C(n293), .D(
        \chs_in_f[0][DATA][23] ), .E(n313), .F(\chs_in_f[1][DATA][23] ), .Z(
        n199) );
  HS65_LS_OAI212X5 U307 ( .A(n54), .B(n261), .C(n20), .D(n276), .E(n198), .Z(
        \chs_out_f[1][DATA][24] ) );
  HS65_LS_AOI222X2 U308 ( .A(n333), .B(\chs_in_f[2][DATA][24] ), .C(n293), .D(
        \chs_in_f[0][DATA][24] ), .E(n313), .F(\chs_in_f[1][DATA][24] ), .Z(
        n198) );
  HS65_LS_OAI212X5 U309 ( .A(n53), .B(n261), .C(n19), .D(n276), .E(n197), .Z(
        \chs_out_f[1][DATA][25] ) );
  HS65_LS_AOI222X2 U310 ( .A(n333), .B(\chs_in_f[2][DATA][25] ), .C(n293), .D(
        \chs_in_f[0][DATA][25] ), .E(n313), .F(\chs_in_f[1][DATA][25] ), .Z(
        n197) );
  HS65_LS_OAI212X5 U311 ( .A(n52), .B(n261), .C(n18), .D(n276), .E(n196), .Z(
        \chs_out_f[1][DATA][26] ) );
  HS65_LS_AOI222X2 U312 ( .A(n333), .B(\chs_in_f[2][DATA][26] ), .C(n293), .D(
        \chs_in_f[0][DATA][26] ), .E(n313), .F(\chs_in_f[1][DATA][26] ), .Z(
        n196) );
  HS65_LS_OAI212X5 U313 ( .A(n51), .B(n261), .C(n17), .D(n276), .E(n195), .Z(
        \chs_out_f[1][DATA][27] ) );
  HS65_LS_AOI222X2 U314 ( .A(n333), .B(\chs_in_f[2][DATA][27] ), .C(n293), .D(
        \chs_in_f[0][DATA][27] ), .E(n313), .F(\chs_in_f[1][DATA][27] ), .Z(
        n195) );
  HS65_LS_OAI212X5 U315 ( .A(n50), .B(n261), .C(n16), .D(n276), .E(n194), .Z(
        \chs_out_f[1][DATA][28] ) );
  HS65_LS_AOI222X2 U316 ( .A(n333), .B(\chs_in_f[2][DATA][28] ), .C(n293), .D(
        \chs_in_f[0][DATA][28] ), .E(n313), .F(\chs_in_f[1][DATA][28] ), .Z(
        n194) );
  HS65_LS_OAI212X5 U317 ( .A(n49), .B(n261), .C(n15), .D(n276), .E(n193), .Z(
        \chs_out_f[1][DATA][29] ) );
  HS65_LS_AOI222X2 U318 ( .A(n333), .B(\chs_in_f[2][DATA][29] ), .C(n293), .D(
        \chs_in_f[0][DATA][29] ), .E(n313), .F(\chs_in_f[1][DATA][29] ), .Z(
        n193) );
  HS65_LS_OAI212X5 U319 ( .A(n48), .B(n261), .C(n14), .D(n276), .E(n191), .Z(
        \chs_out_f[1][DATA][30] ) );
  HS65_LS_AOI222X2 U320 ( .A(n333), .B(\chs_in_f[2][DATA][30] ), .C(n293), .D(
        \chs_in_f[0][DATA][30] ), .E(n313), .F(\chs_in_f[1][DATA][30] ), .Z(
        n191) );
  HS65_LS_OAI212X5 U321 ( .A(n47), .B(n261), .C(n13), .D(n277), .E(n190), .Z(
        \chs_out_f[1][DATA][31] ) );
  HS65_LS_AOI222X2 U322 ( .A(n334), .B(\chs_in_f[2][DATA][31] ), .C(n294), .D(
        \chs_in_f[0][DATA][31] ), .E(n314), .F(\chs_in_f[1][DATA][31] ), .Z(
        n190) );
  HS65_LS_OAI212X5 U323 ( .A(n46), .B(n261), .C(n12), .D(n277), .E(n189), .Z(
        \chs_out_f[1][DATA][32] ) );
  HS65_LS_AOI222X2 U324 ( .A(n334), .B(\chs_in_f[2][DATA][32] ), .C(n294), .D(
        \chs_in_f[0][DATA][32] ), .E(n314), .F(\chs_in_f[1][DATA][32] ), .Z(
        n189) );
  HS65_LS_OAI212X5 U325 ( .A(n78), .B(n257), .C(n44), .D(n272), .E(n248), .Z(
        \chs_out_f[0][DATA][0] ) );
  HS65_LS_AOI222X2 U326 ( .A(n328), .B(\chs_in_f[2][DATA][0] ), .C(n288), .D(
        \chs_in_f[0][DATA][0] ), .E(n308), .F(\chs_in_f[1][DATA][0] ), .Z(n248) );
  HS65_LS_OAI212X5 U327 ( .A(n77), .B(n257), .C(n43), .D(n272), .E(n237), .Z(
        \chs_out_f[0][DATA][1] ) );
  HS65_LS_AOI222X2 U328 ( .A(n328), .B(\chs_in_f[2][DATA][1] ), .C(n288), .D(
        \chs_in_f[0][DATA][1] ), .E(n308), .F(\chs_in_f[1][DATA][1] ), .Z(n237) );
  HS65_LS_OAI212X5 U329 ( .A(n76), .B(n258), .C(n42), .D(n273), .E(n226), .Z(
        \chs_out_f[0][DATA][2] ) );
  HS65_LS_AOI222X2 U330 ( .A(n329), .B(\chs_in_f[2][DATA][2] ), .C(n289), .D(
        \chs_in_f[0][DATA][2] ), .E(n309), .F(\chs_in_f[1][DATA][2] ), .Z(n226) );
  HS65_LS_OAI212X5 U331 ( .A(n68), .B(n257), .C(n34), .D(n272), .E(n247), .Z(
        \chs_out_f[0][DATA][10] ) );
  HS65_LS_AOI222X2 U332 ( .A(n328), .B(\chs_in_f[2][DATA][10] ), .C(n288), .D(
        \chs_in_f[0][DATA][10] ), .E(n308), .F(\chs_in_f[1][DATA][10] ), .Z(
        n247) );
  HS65_LS_OAI212X5 U333 ( .A(n67), .B(n257), .C(n33), .D(n272), .E(n246), .Z(
        \chs_out_f[0][DATA][11] ) );
  HS65_LS_AOI222X2 U334 ( .A(n328), .B(\chs_in_f[2][DATA][11] ), .C(n288), .D(
        \chs_in_f[0][DATA][11] ), .E(n308), .F(\chs_in_f[1][DATA][11] ), .Z(
        n246) );
  HS65_LS_OAI212X5 U335 ( .A(n66), .B(n257), .C(n32), .D(n272), .E(n245), .Z(
        \chs_out_f[0][DATA][12] ) );
  HS65_LS_AOI222X2 U336 ( .A(n328), .B(\chs_in_f[2][DATA][12] ), .C(n288), .D(
        \chs_in_f[0][DATA][12] ), .E(n308), .F(\chs_in_f[1][DATA][12] ), .Z(
        n245) );
  HS65_LS_OAI212X5 U337 ( .A(n65), .B(n257), .C(n31), .D(n272), .E(n244), .Z(
        \chs_out_f[0][DATA][13] ) );
  HS65_LS_AOI222X2 U338 ( .A(n328), .B(\chs_in_f[2][DATA][13] ), .C(n288), .D(
        \chs_in_f[0][DATA][13] ), .E(n308), .F(\chs_in_f[1][DATA][13] ), .Z(
        n244) );
  HS65_LS_OAI212X5 U339 ( .A(n64), .B(n257), .C(n30), .D(n272), .E(n243), .Z(
        \chs_out_f[0][DATA][14] ) );
  HS65_LS_AOI222X2 U340 ( .A(n328), .B(\chs_in_f[2][DATA][14] ), .C(n288), .D(
        \chs_in_f[0][DATA][14] ), .E(n308), .F(\chs_in_f[1][DATA][14] ), .Z(
        n243) );
  HS65_LS_OAI212X5 U341 ( .A(n63), .B(n257), .C(n29), .D(n272), .E(n242), .Z(
        \chs_out_f[0][DATA][15] ) );
  HS65_LS_AOI222X2 U342 ( .A(n328), .B(\chs_in_f[2][DATA][15] ), .C(n288), .D(
        \chs_in_f[0][DATA][15] ), .E(n308), .F(\chs_in_f[1][DATA][15] ), .Z(
        n242) );
  HS65_LS_OAI212X5 U343 ( .A(n62), .B(n257), .C(n28), .D(n272), .E(n241), .Z(
        \chs_out_f[0][DATA][16] ) );
  HS65_LS_AOI222X2 U344 ( .A(n328), .B(\chs_in_f[2][DATA][16] ), .C(n288), .D(
        \chs_in_f[0][DATA][16] ), .E(n308), .F(\chs_in_f[1][DATA][16] ), .Z(
        n241) );
  HS65_LS_OAI212X5 U345 ( .A(n61), .B(n257), .C(n27), .D(n272), .E(n240), .Z(
        \chs_out_f[0][DATA][17] ) );
  HS65_LS_AOI222X2 U346 ( .A(n328), .B(\chs_in_f[2][DATA][17] ), .C(n288), .D(
        \chs_in_f[0][DATA][17] ), .E(n308), .F(\chs_in_f[1][DATA][17] ), .Z(
        n240) );
  HS65_LS_OAI212X5 U347 ( .A(n60), .B(n257), .C(n26), .D(n272), .E(n239), .Z(
        \chs_out_f[0][DATA][18] ) );
  HS65_LS_AOI222X2 U348 ( .A(n328), .B(\chs_in_f[2][DATA][18] ), .C(n288), .D(
        \chs_in_f[0][DATA][18] ), .E(n308), .F(\chs_in_f[1][DATA][18] ), .Z(
        n239) );
  HS65_LS_OAI212X5 U349 ( .A(n59), .B(n257), .C(n25), .D(n272), .E(n238), .Z(
        \chs_out_f[0][DATA][19] ) );
  HS65_LS_AOI222X2 U350 ( .A(n328), .B(\chs_in_f[2][DATA][19] ), .C(n288), .D(
        \chs_in_f[0][DATA][19] ), .E(n308), .F(\chs_in_f[1][DATA][19] ), .Z(
        n238) );
  HS65_LS_OAI212X5 U351 ( .A(n58), .B(n257), .C(n24), .D(n273), .E(n236), .Z(
        \chs_out_f[0][DATA][20] ) );
  HS65_LS_AOI222X2 U352 ( .A(n329), .B(\chs_in_f[2][DATA][20] ), .C(n289), .D(
        \chs_in_f[0][DATA][20] ), .E(n309), .F(\chs_in_f[1][DATA][20] ), .Z(
        n236) );
  HS65_LS_OAI212X5 U353 ( .A(n57), .B(n258), .C(n23), .D(n273), .E(n235), .Z(
        \chs_out_f[0][DATA][21] ) );
  HS65_LS_AOI222X2 U354 ( .A(n329), .B(\chs_in_f[2][DATA][21] ), .C(n289), .D(
        \chs_in_f[0][DATA][21] ), .E(n309), .F(\chs_in_f[1][DATA][21] ), .Z(
        n235) );
  HS65_LS_OAI212X5 U355 ( .A(n56), .B(n258), .C(n22), .D(n273), .E(n234), .Z(
        \chs_out_f[0][DATA][22] ) );
  HS65_LS_AOI222X2 U356 ( .A(n329), .B(\chs_in_f[2][DATA][22] ), .C(n289), .D(
        \chs_in_f[0][DATA][22] ), .E(n309), .F(\chs_in_f[1][DATA][22] ), .Z(
        n234) );
  HS65_LS_OAI212X5 U357 ( .A(n55), .B(n258), .C(n21), .D(n273), .E(n233), .Z(
        \chs_out_f[0][DATA][23] ) );
  HS65_LS_AOI222X2 U358 ( .A(n329), .B(\chs_in_f[2][DATA][23] ), .C(n289), .D(
        \chs_in_f[0][DATA][23] ), .E(n309), .F(\chs_in_f[1][DATA][23] ), .Z(
        n233) );
  HS65_LS_OAI212X5 U359 ( .A(n54), .B(n258), .C(n20), .D(n273), .E(n232), .Z(
        \chs_out_f[0][DATA][24] ) );
  HS65_LS_AOI222X2 U360 ( .A(n329), .B(\chs_in_f[2][DATA][24] ), .C(n289), .D(
        \chs_in_f[0][DATA][24] ), .E(n309), .F(\chs_in_f[1][DATA][24] ), .Z(
        n232) );
  HS65_LS_OAI212X5 U361 ( .A(n53), .B(n258), .C(n19), .D(n273), .E(n231), .Z(
        \chs_out_f[0][DATA][25] ) );
  HS65_LS_AOI222X2 U362 ( .A(n329), .B(\chs_in_f[2][DATA][25] ), .C(n289), .D(
        \chs_in_f[0][DATA][25] ), .E(n309), .F(\chs_in_f[1][DATA][25] ), .Z(
        n231) );
  HS65_LS_OAI212X5 U363 ( .A(n52), .B(n258), .C(n18), .D(n273), .E(n230), .Z(
        \chs_out_f[0][DATA][26] ) );
  HS65_LS_AOI222X2 U364 ( .A(n329), .B(\chs_in_f[2][DATA][26] ), .C(n289), .D(
        \chs_in_f[0][DATA][26] ), .E(n309), .F(\chs_in_f[1][DATA][26] ), .Z(
        n230) );
  HS65_LS_OAI212X5 U365 ( .A(n51), .B(n258), .C(n17), .D(n273), .E(n229), .Z(
        \chs_out_f[0][DATA][27] ) );
  HS65_LS_AOI222X2 U366 ( .A(n329), .B(\chs_in_f[2][DATA][27] ), .C(n289), .D(
        \chs_in_f[0][DATA][27] ), .E(n309), .F(\chs_in_f[1][DATA][27] ), .Z(
        n229) );
  HS65_LS_OAI212X5 U367 ( .A(n50), .B(n258), .C(n16), .D(n273), .E(n228), .Z(
        \chs_out_f[0][DATA][28] ) );
  HS65_LS_AOI222X2 U368 ( .A(n329), .B(\chs_in_f[2][DATA][28] ), .C(n289), .D(
        \chs_in_f[0][DATA][28] ), .E(n309), .F(\chs_in_f[1][DATA][28] ), .Z(
        n228) );
  HS65_LS_OAI212X5 U369 ( .A(n49), .B(n258), .C(n15), .D(n273), .E(n227), .Z(
        \chs_out_f[0][DATA][29] ) );
  HS65_LS_AOI222X2 U370 ( .A(n329), .B(\chs_in_f[2][DATA][29] ), .C(n289), .D(
        \chs_in_f[0][DATA][29] ), .E(n309), .F(\chs_in_f[1][DATA][29] ), .Z(
        n227) );
  HS65_LS_OAI212X5 U371 ( .A(n48), .B(n258), .C(n14), .D(n273), .E(n225), .Z(
        \chs_out_f[0][DATA][30] ) );
  HS65_LS_AOI222X2 U372 ( .A(n329), .B(\chs_in_f[2][DATA][30] ), .C(n289), .D(
        \chs_in_f[0][DATA][30] ), .E(n309), .F(\chs_in_f[1][DATA][30] ), .Z(
        n225) );
  HS65_LS_OAI212X5 U373 ( .A(n47), .B(n258), .C(n13), .D(n274), .E(n224), .Z(
        \chs_out_f[0][DATA][31] ) );
  HS65_LS_AOI222X2 U374 ( .A(n330), .B(\chs_in_f[2][DATA][31] ), .C(n290), .D(
        \chs_in_f[0][DATA][31] ), .E(n310), .F(\chs_in_f[1][DATA][31] ), .Z(
        n224) );
  HS65_LS_OAI212X5 U375 ( .A(n46), .B(n258), .C(n12), .D(n274), .E(n223), .Z(
        \chs_out_f[0][DATA][32] ) );
  HS65_LS_AOI222X2 U376 ( .A(n330), .B(\chs_in_f[2][DATA][32] ), .C(n290), .D(
        \chs_in_f[0][DATA][32] ), .E(n310), .F(\chs_in_f[1][DATA][32] ), .Z(
        n223) );
  HS65_LS_OAI212X5 U377 ( .A(n75), .B(n268), .C(n41), .D(n283), .E(n119), .Z(
        \chs_out_f[3][DATA][3] ) );
  HS65_LS_AOI222X2 U378 ( .A(n342), .B(\chs_in_f[2][DATA][3] ), .C(n302), .D(
        \chs_in_f[0][DATA][3] ), .E(n322), .F(\chs_in_f[1][DATA][3] ), .Z(n119) );
  HS65_LS_OAI212X5 U379 ( .A(n74), .B(n268), .C(n40), .D(n283), .E(n118), .Z(
        \chs_out_f[3][DATA][4] ) );
  HS65_LS_AOI222X2 U380 ( .A(n342), .B(\chs_in_f[2][DATA][4] ), .C(n302), .D(
        \chs_in_f[0][DATA][4] ), .E(n322), .F(\chs_in_f[1][DATA][4] ), .Z(n118) );
  HS65_LS_OAI212X5 U381 ( .A(n73), .B(n268), .C(n39), .D(n283), .E(n117), .Z(
        \chs_out_f[3][DATA][5] ) );
  HS65_LS_AOI222X2 U382 ( .A(n342), .B(\chs_in_f[2][DATA][5] ), .C(n302), .D(
        \chs_in_f[0][DATA][5] ), .E(n322), .F(\chs_in_f[1][DATA][5] ), .Z(n117) );
  HS65_LS_OAI212X5 U383 ( .A(n72), .B(n268), .C(n38), .D(n283), .E(n116), .Z(
        \chs_out_f[3][DATA][6] ) );
  HS65_LS_AOI222X2 U384 ( .A(n342), .B(\chs_in_f[2][DATA][6] ), .C(n302), .D(
        \chs_in_f[0][DATA][6] ), .E(n322), .F(\chs_in_f[1][DATA][6] ), .Z(n116) );
  HS65_LS_OAI212X5 U385 ( .A(n71), .B(n268), .C(n37), .D(n283), .E(n115), .Z(
        \chs_out_f[3][DATA][7] ) );
  HS65_LS_AOI222X2 U386 ( .A(n342), .B(\chs_in_f[2][DATA][7] ), .C(n302), .D(
        \chs_in_f[0][DATA][7] ), .E(n322), .F(\chs_in_f[1][DATA][7] ), .Z(n115) );
  HS65_LS_OAI212X5 U387 ( .A(n70), .B(n268), .C(n36), .D(n283), .E(n114), .Z(
        \chs_out_f[3][DATA][8] ) );
  HS65_LS_AOI222X2 U388 ( .A(n342), .B(\chs_in_f[2][DATA][8] ), .C(n302), .D(
        \chs_in_f[0][DATA][8] ), .E(n322), .F(\chs_in_f[1][DATA][8] ), .Z(n114) );
  HS65_LS_OAI212X5 U389 ( .A(n75), .B(n265), .C(n41), .D(n280), .E(n153), .Z(
        \chs_out_f[2][DATA][3] ) );
  HS65_LS_AOI222X2 U390 ( .A(n338), .B(\chs_in_f[2][DATA][3] ), .C(n298), .D(
        \chs_in_f[0][DATA][3] ), .E(n318), .F(\chs_in_f[1][DATA][3] ), .Z(n153) );
  HS65_LS_OAI212X5 U391 ( .A(n74), .B(n265), .C(n40), .D(n280), .E(n152), .Z(
        \chs_out_f[2][DATA][4] ) );
  HS65_LS_AOI222X2 U392 ( .A(n338), .B(\chs_in_f[2][DATA][4] ), .C(n298), .D(
        \chs_in_f[0][DATA][4] ), .E(n318), .F(\chs_in_f[1][DATA][4] ), .Z(n152) );
  HS65_LS_OAI212X5 U393 ( .A(n73), .B(n265), .C(n39), .D(n280), .E(n151), .Z(
        \chs_out_f[2][DATA][5] ) );
  HS65_LS_AOI222X2 U394 ( .A(n338), .B(\chs_in_f[2][DATA][5] ), .C(n298), .D(
        \chs_in_f[0][DATA][5] ), .E(n318), .F(\chs_in_f[1][DATA][5] ), .Z(n151) );
  HS65_LS_OAI212X5 U395 ( .A(n72), .B(n265), .C(n38), .D(n280), .E(n150), .Z(
        \chs_out_f[2][DATA][6] ) );
  HS65_LS_AOI222X2 U396 ( .A(n338), .B(\chs_in_f[2][DATA][6] ), .C(n298), .D(
        \chs_in_f[0][DATA][6] ), .E(n318), .F(\chs_in_f[1][DATA][6] ), .Z(n150) );
  HS65_LS_OAI212X5 U397 ( .A(n71), .B(n265), .C(n37), .D(n280), .E(n149), .Z(
        \chs_out_f[2][DATA][7] ) );
  HS65_LS_AOI222X2 U398 ( .A(n338), .B(\chs_in_f[2][DATA][7] ), .C(n298), .D(
        \chs_in_f[0][DATA][7] ), .E(n318), .F(\chs_in_f[1][DATA][7] ), .Z(n149) );
  HS65_LS_OAI212X5 U399 ( .A(n70), .B(n265), .C(n36), .D(n280), .E(n148), .Z(
        \chs_out_f[2][DATA][8] ) );
  HS65_LS_AOI222X2 U400 ( .A(n338), .B(\chs_in_f[2][DATA][8] ), .C(n298), .D(
        \chs_in_f[0][DATA][8] ), .E(n318), .F(\chs_in_f[1][DATA][8] ), .Z(n148) );
  HS65_LS_OAI212X5 U401 ( .A(n75), .B(n262), .C(n41), .D(n277), .E(n187), .Z(
        \chs_out_f[1][DATA][3] ) );
  HS65_LS_AOI222X2 U402 ( .A(n334), .B(\chs_in_f[2][DATA][3] ), .C(n294), .D(
        \chs_in_f[0][DATA][3] ), .E(n314), .F(\chs_in_f[1][DATA][3] ), .Z(n187) );
  HS65_LS_OAI212X5 U403 ( .A(n74), .B(n262), .C(n40), .D(n277), .E(n186), .Z(
        \chs_out_f[1][DATA][4] ) );
  HS65_LS_AOI222X2 U404 ( .A(n334), .B(\chs_in_f[2][DATA][4] ), .C(n294), .D(
        \chs_in_f[0][DATA][4] ), .E(n314), .F(\chs_in_f[1][DATA][4] ), .Z(n186) );
  HS65_LS_OAI212X5 U405 ( .A(n73), .B(n262), .C(n39), .D(n277), .E(n185), .Z(
        \chs_out_f[1][DATA][5] ) );
  HS65_LS_AOI222X2 U406 ( .A(n334), .B(\chs_in_f[2][DATA][5] ), .C(n294), .D(
        \chs_in_f[0][DATA][5] ), .E(n314), .F(\chs_in_f[1][DATA][5] ), .Z(n185) );
  HS65_LS_OAI212X5 U407 ( .A(n72), .B(n262), .C(n38), .D(n277), .E(n184), .Z(
        \chs_out_f[1][DATA][6] ) );
  HS65_LS_AOI222X2 U408 ( .A(n334), .B(\chs_in_f[2][DATA][6] ), .C(n294), .D(
        \chs_in_f[0][DATA][6] ), .E(n314), .F(\chs_in_f[1][DATA][6] ), .Z(n184) );
  HS65_LS_OAI212X5 U409 ( .A(n71), .B(n262), .C(n37), .D(n277), .E(n183), .Z(
        \chs_out_f[1][DATA][7] ) );
  HS65_LS_AOI222X2 U410 ( .A(n334), .B(\chs_in_f[2][DATA][7] ), .C(n294), .D(
        \chs_in_f[0][DATA][7] ), .E(n314), .F(\chs_in_f[1][DATA][7] ), .Z(n183) );
  HS65_LS_OAI212X5 U411 ( .A(n70), .B(n262), .C(n36), .D(n277), .E(n182), .Z(
        \chs_out_f[1][DATA][8] ) );
  HS65_LS_AOI222X2 U412 ( .A(n334), .B(\chs_in_f[2][DATA][8] ), .C(n294), .D(
        \chs_in_f[0][DATA][8] ), .E(n314), .F(\chs_in_f[1][DATA][8] ), .Z(n182) );
  HS65_LS_OAI212X5 U413 ( .A(n75), .B(n259), .C(n41), .D(n274), .E(n221), .Z(
        \chs_out_f[0][DATA][3] ) );
  HS65_LS_AOI222X2 U414 ( .A(n330), .B(\chs_in_f[2][DATA][3] ), .C(n290), .D(
        \chs_in_f[0][DATA][3] ), .E(n310), .F(\chs_in_f[1][DATA][3] ), .Z(n221) );
  HS65_LS_OAI212X5 U415 ( .A(n74), .B(n259), .C(n40), .D(n274), .E(n220), .Z(
        \chs_out_f[0][DATA][4] ) );
  HS65_LS_AOI222X2 U416 ( .A(n330), .B(\chs_in_f[2][DATA][4] ), .C(n290), .D(
        \chs_in_f[0][DATA][4] ), .E(n310), .F(\chs_in_f[1][DATA][4] ), .Z(n220) );
  HS65_LS_OAI212X5 U417 ( .A(n73), .B(n259), .C(n39), .D(n274), .E(n219), .Z(
        \chs_out_f[0][DATA][5] ) );
  HS65_LS_AOI222X2 U418 ( .A(n330), .B(\chs_in_f[2][DATA][5] ), .C(n290), .D(
        \chs_in_f[0][DATA][5] ), .E(n310), .F(\chs_in_f[1][DATA][5] ), .Z(n219) );
  HS65_LS_OAI212X5 U419 ( .A(n72), .B(n259), .C(n38), .D(n274), .E(n218), .Z(
        \chs_out_f[0][DATA][6] ) );
  HS65_LS_AOI222X2 U420 ( .A(n330), .B(\chs_in_f[2][DATA][6] ), .C(n290), .D(
        \chs_in_f[0][DATA][6] ), .E(n310), .F(\chs_in_f[1][DATA][6] ), .Z(n218) );
  HS65_LS_OAI212X5 U421 ( .A(n71), .B(n259), .C(n37), .D(n274), .E(n217), .Z(
        \chs_out_f[0][DATA][7] ) );
  HS65_LS_AOI222X2 U422 ( .A(n330), .B(\chs_in_f[2][DATA][7] ), .C(n290), .D(
        \chs_in_f[0][DATA][7] ), .E(n310), .F(\chs_in_f[1][DATA][7] ), .Z(n217) );
  HS65_LS_OAI212X5 U423 ( .A(n70), .B(n259), .C(n36), .D(n274), .E(n216), .Z(
        \chs_out_f[0][DATA][8] ) );
  HS65_LS_AOI222X2 U424 ( .A(n330), .B(\chs_in_f[2][DATA][8] ), .C(n290), .D(
        \chs_in_f[0][DATA][8] ), .E(n310), .F(\chs_in_f[1][DATA][8] ), .Z(n216) );
  HS65_LS_IVX9 U425 ( .A(\chs_in_f[3][DATA][9] ), .Z(n69) );
  HS65_LS_IVX9 U426 ( .A(\chs_in_f[3][DATA][0] ), .Z(n78) );
  HS65_LS_IVX9 U427 ( .A(\chs_in_f[3][DATA][1] ), .Z(n77) );
  HS65_LS_IVX9 U428 ( .A(\chs_in_f[3][DATA][2] ), .Z(n76) );
  HS65_LS_IVX9 U429 ( .A(\chs_in_f[3][DATA][3] ), .Z(n75) );
  HS65_LS_IVX9 U430 ( .A(\chs_in_f[3][DATA][4] ), .Z(n74) );
  HS65_LS_IVX9 U431 ( .A(\chs_in_f[3][DATA][5] ), .Z(n73) );
  HS65_LS_IVX9 U432 ( .A(\chs_in_f[3][DATA][6] ), .Z(n72) );
  HS65_LS_IVX9 U433 ( .A(\chs_in_f[3][DATA][7] ), .Z(n71) );
  HS65_LS_IVX9 U434 ( .A(\chs_in_f[3][DATA][8] ), .Z(n70) );
  HS65_LS_IVX9 U435 ( .A(\chs_in_f[3][DATA][10] ), .Z(n68) );
  HS65_LS_IVX9 U436 ( .A(\chs_in_f[3][DATA][11] ), .Z(n67) );
  HS65_LS_IVX9 U437 ( .A(\chs_in_f[3][DATA][12] ), .Z(n66) );
  HS65_LS_IVX9 U438 ( .A(\chs_in_f[3][DATA][13] ), .Z(n65) );
  HS65_LS_IVX9 U439 ( .A(\chs_in_f[3][DATA][14] ), .Z(n64) );
  HS65_LS_IVX9 U440 ( .A(\chs_in_f[3][DATA][15] ), .Z(n63) );
  HS65_LS_IVX9 U441 ( .A(\chs_in_f[3][DATA][16] ), .Z(n62) );
  HS65_LS_IVX9 U442 ( .A(\chs_in_f[3][DATA][17] ), .Z(n61) );
  HS65_LS_IVX9 U443 ( .A(\chs_in_f[3][DATA][18] ), .Z(n60) );
  HS65_LS_IVX9 U444 ( .A(\chs_in_f[3][DATA][19] ), .Z(n59) );
  HS65_LS_IVX9 U445 ( .A(\chs_in_f[3][DATA][20] ), .Z(n58) );
  HS65_LS_IVX9 U446 ( .A(\chs_in_f[3][DATA][21] ), .Z(n57) );
  HS65_LS_IVX9 U447 ( .A(\chs_in_f[3][DATA][22] ), .Z(n56) );
  HS65_LS_IVX9 U448 ( .A(\chs_in_f[3][DATA][23] ), .Z(n55) );
  HS65_LS_IVX9 U449 ( .A(\chs_in_f[3][DATA][24] ), .Z(n54) );
  HS65_LS_IVX9 U450 ( .A(\chs_in_f[3][DATA][25] ), .Z(n53) );
  HS65_LS_IVX9 U451 ( .A(\chs_in_f[3][DATA][26] ), .Z(n52) );
  HS65_LS_IVX9 U452 ( .A(\chs_in_f[3][DATA][27] ), .Z(n51) );
  HS65_LS_IVX9 U453 ( .A(\chs_in_f[3][DATA][28] ), .Z(n50) );
  HS65_LS_IVX9 U454 ( .A(\chs_in_f[3][DATA][29] ), .Z(n49) );
  HS65_LS_IVX9 U455 ( .A(\chs_in_f[3][DATA][30] ), .Z(n48) );
  HS65_LS_IVX9 U456 ( .A(\chs_in_f[3][DATA][31] ), .Z(n47) );
  HS65_LS_IVX9 U457 ( .A(\chs_in_f[3][DATA][32] ), .Z(n46) );
  HS65_LS_IVX9 U458 ( .A(\chs_in_f[3][DATA][33] ), .Z(n45) );
  HS65_LS_IVX9 U459 ( .A(\chs_in_f[4][DATA][9] ), .Z(n35) );
  HS65_LS_IVX9 U460 ( .A(\chs_in_f[4][DATA][0] ), .Z(n44) );
  HS65_LS_IVX9 U461 ( .A(\chs_in_f[4][DATA][1] ), .Z(n43) );
  HS65_LS_IVX9 U462 ( .A(\chs_in_f[4][DATA][2] ), .Z(n42) );
  HS65_LS_IVX9 U463 ( .A(\chs_in_f[4][DATA][3] ), .Z(n41) );
  HS65_LS_IVX9 U464 ( .A(\chs_in_f[4][DATA][4] ), .Z(n40) );
  HS65_LS_IVX9 U465 ( .A(\chs_in_f[4][DATA][5] ), .Z(n39) );
  HS65_LS_IVX9 U466 ( .A(\chs_in_f[4][DATA][6] ), .Z(n38) );
  HS65_LS_IVX9 U467 ( .A(\chs_in_f[4][DATA][7] ), .Z(n37) );
  HS65_LS_IVX9 U468 ( .A(\chs_in_f[4][DATA][8] ), .Z(n36) );
  HS65_LS_IVX9 U469 ( .A(\chs_in_f[4][DATA][10] ), .Z(n34) );
  HS65_LS_IVX9 U470 ( .A(\chs_in_f[4][DATA][11] ), .Z(n33) );
  HS65_LS_IVX9 U471 ( .A(\chs_in_f[4][DATA][12] ), .Z(n32) );
  HS65_LS_IVX9 U472 ( .A(\chs_in_f[4][DATA][13] ), .Z(n31) );
  HS65_LS_IVX9 U473 ( .A(\chs_in_f[4][DATA][14] ), .Z(n30) );
  HS65_LS_IVX9 U474 ( .A(\chs_in_f[4][DATA][15] ), .Z(n29) );
  HS65_LS_IVX9 U475 ( .A(\chs_in_f[4][DATA][16] ), .Z(n28) );
  HS65_LS_IVX9 U476 ( .A(\chs_in_f[4][DATA][17] ), .Z(n27) );
  HS65_LS_IVX9 U477 ( .A(\chs_in_f[4][DATA][18] ), .Z(n26) );
  HS65_LS_IVX9 U478 ( .A(\chs_in_f[4][DATA][19] ), .Z(n25) );
  HS65_LS_IVX9 U479 ( .A(\chs_in_f[4][DATA][20] ), .Z(n24) );
  HS65_LS_IVX9 U480 ( .A(\chs_in_f[4][DATA][21] ), .Z(n23) );
  HS65_LS_IVX9 U481 ( .A(\chs_in_f[4][DATA][22] ), .Z(n22) );
  HS65_LS_IVX9 U482 ( .A(\chs_in_f[4][DATA][23] ), .Z(n21) );
  HS65_LS_IVX9 U483 ( .A(\chs_in_f[4][DATA][24] ), .Z(n20) );
  HS65_LS_IVX9 U484 ( .A(\chs_in_f[4][DATA][25] ), .Z(n19) );
  HS65_LS_IVX9 U485 ( .A(\chs_in_f[4][DATA][26] ), .Z(n18) );
  HS65_LS_IVX9 U486 ( .A(\chs_in_f[4][DATA][27] ), .Z(n17) );
  HS65_LS_IVX9 U487 ( .A(\chs_in_f[4][DATA][28] ), .Z(n16) );
  HS65_LS_IVX9 U488 ( .A(\chs_in_f[4][DATA][29] ), .Z(n15) );
  HS65_LS_IVX9 U489 ( .A(\chs_in_f[4][DATA][30] ), .Z(n14) );
  HS65_LS_IVX9 U490 ( .A(\chs_in_f[4][DATA][31] ), .Z(n13) );
  HS65_LS_IVX9 U491 ( .A(\chs_in_f[4][DATA][32] ), .Z(n12) );
  HS65_LS_IVX9 U492 ( .A(\chs_in_f[4][DATA][33] ), .Z(n11) );
  HS65_LS_IVX9 U493 ( .A(\switch_sel[4][3] ), .Z(n2) );
  HS65_LS_IVX9 U494 ( .A(\switch_sel[3][3] ), .Z(n7) );
  HS65_LS_IVX9 U495 ( .A(\switch_sel[4][2] ), .Z(n3) );
  HS65_LS_IVX9 U496 ( .A(\switch_sel[3][2] ), .Z(n8) );
  HS65_LS_IVX9 U497 ( .A(\switch_sel[4][1] ), .Z(n4) );
  HS65_LS_IVX9 U498 ( .A(\switch_sel[3][1] ), .Z(n9) );
  HS65_LS_IVX9 U499 ( .A(\switch_sel[4][0] ), .Z(n5) );
  HS65_LS_IVX9 U500 ( .A(\switch_sel[3][0] ), .Z(n10) );
  HS65_LS_IVX9 U501 ( .A(\switch_sel[3][4] ), .Z(n6) );
  HS65_LS_IVX9 U502 ( .A(\switch_sel[4][4] ), .Z(n1) );
  HS65_LS_BFX9 U503 ( .A(\switch_sel[1][3] ), .Z(n319) );
  HS65_LS_BFX9 U504 ( .A(\switch_sel[2][3] ), .Z(n339) );
  HS65_LS_BFX9 U505 ( .A(\switch_sel[0][3] ), .Z(n299) );
  HS65_LS_BFX9 U506 ( .A(\switch_sel[1][2] ), .Z(n315) );
  HS65_LS_BFX9 U507 ( .A(\switch_sel[2][2] ), .Z(n335) );
  HS65_LS_BFX9 U508 ( .A(\switch_sel[0][2] ), .Z(n295) );
  HS65_LS_BFX9 U509 ( .A(\switch_sel[1][1] ), .Z(n311) );
  HS65_LS_BFX9 U510 ( .A(\switch_sel[2][1] ), .Z(n331) );
  HS65_LS_BFX9 U511 ( .A(\switch_sel[0][1] ), .Z(n291) );
  HS65_LS_BFX9 U512 ( .A(\switch_sel[1][0] ), .Z(n307) );
  HS65_LS_BFX9 U513 ( .A(\switch_sel[2][0] ), .Z(n327) );
  HS65_LS_BFX9 U514 ( .A(\switch_sel[0][0] ), .Z(n287) );
  HS65_LS_BFX9 U515 ( .A(\switch_sel[1][4] ), .Z(n323) );
  HS65_LS_BFX9 U516 ( .A(\switch_sel[2][4] ), .Z(n343) );
  HS65_LS_BFX9 U517 ( .A(\switch_sel[0][4] ), .Z(n303) );
endmodule


module bundled2LEDR_0 ( preset, .bundled_ch_f({\bundled_ch_f[REQ] , 
        \bundled_ch_f[DATA][33] , \bundled_ch_f[DATA][32] , 
        \bundled_ch_f[DATA][31] , \bundled_ch_f[DATA][30] , 
        \bundled_ch_f[DATA][29] , \bundled_ch_f[DATA][28] , 
        \bundled_ch_f[DATA][27] , \bundled_ch_f[DATA][26] , 
        \bundled_ch_f[DATA][25] , \bundled_ch_f[DATA][24] , 
        \bundled_ch_f[DATA][23] , \bundled_ch_f[DATA][22] , 
        \bundled_ch_f[DATA][21] , \bundled_ch_f[DATA][20] , 
        \bundled_ch_f[DATA][19] , \bundled_ch_f[DATA][18] , 
        \bundled_ch_f[DATA][17] , \bundled_ch_f[DATA][16] , 
        \bundled_ch_f[DATA][15] , \bundled_ch_f[DATA][14] , 
        \bundled_ch_f[DATA][13] , \bundled_ch_f[DATA][12] , 
        \bundled_ch_f[DATA][11] , \bundled_ch_f[DATA][10] , 
        \bundled_ch_f[DATA][9] , \bundled_ch_f[DATA][8] , 
        \bundled_ch_f[DATA][7] , \bundled_ch_f[DATA][6] , 
        \bundled_ch_f[DATA][5] , \bundled_ch_f[DATA][4] , 
        \bundled_ch_f[DATA][3] , \bundled_ch_f[DATA][2] , 
        \bundled_ch_f[DATA][1] , \bundled_ch_f[DATA][0] }), .bundled_ch_b(
        \bundled_ch_b[ACK] ), .LEDR_link_f({\LEDR_link_f[TOKEN_T] , 
        \LEDR_link_f[TOKEN_PARITY] , \LEDR_link_f[PHIT][32] , 
        \LEDR_link_f[PHIT][31] , \LEDR_link_f[PHIT][30] , 
        \LEDR_link_f[PHIT][29] , \LEDR_link_f[PHIT][28] , 
        \LEDR_link_f[PHIT][27] , \LEDR_link_f[PHIT][26] , 
        \LEDR_link_f[PHIT][25] , \LEDR_link_f[PHIT][24] , 
        \LEDR_link_f[PHIT][23] , \LEDR_link_f[PHIT][22] , 
        \LEDR_link_f[PHIT][21] , \LEDR_link_f[PHIT][20] , 
        \LEDR_link_f[PHIT][19] , \LEDR_link_f[PHIT][18] , 
        \LEDR_link_f[PHIT][17] , \LEDR_link_f[PHIT][16] , 
        \LEDR_link_f[PHIT][15] , \LEDR_link_f[PHIT][14] , 
        \LEDR_link_f[PHIT][13] , \LEDR_link_f[PHIT][12] , 
        \LEDR_link_f[PHIT][11] , \LEDR_link_f[PHIT][10] , 
        \LEDR_link_f[PHIT][9] , \LEDR_link_f[PHIT][8] , \LEDR_link_f[PHIT][7] , 
        \LEDR_link_f[PHIT][6] , \LEDR_link_f[PHIT][5] , \LEDR_link_f[PHIT][4] , 
        \LEDR_link_f[PHIT][3] , \LEDR_link_f[PHIT][2] , \LEDR_link_f[PHIT][1] , 
        \LEDR_link_f[PHIT][0] , \LEDR_link_f[PHIT_PARITY][32] , 
        \LEDR_link_f[PHIT_PARITY][31] , \LEDR_link_f[PHIT_PARITY][30] , 
        \LEDR_link_f[PHIT_PARITY][29] , \LEDR_link_f[PHIT_PARITY][28] , 
        \LEDR_link_f[PHIT_PARITY][27] , \LEDR_link_f[PHIT_PARITY][26] , 
        \LEDR_link_f[PHIT_PARITY][25] , \LEDR_link_f[PHIT_PARITY][24] , 
        \LEDR_link_f[PHIT_PARITY][23] , \LEDR_link_f[PHIT_PARITY][22] , 
        \LEDR_link_f[PHIT_PARITY][21] , \LEDR_link_f[PHIT_PARITY][20] , 
        \LEDR_link_f[PHIT_PARITY][19] , \LEDR_link_f[PHIT_PARITY][18] , 
        \LEDR_link_f[PHIT_PARITY][17] , \LEDR_link_f[PHIT_PARITY][16] , 
        \LEDR_link_f[PHIT_PARITY][15] , \LEDR_link_f[PHIT_PARITY][14] , 
        \LEDR_link_f[PHIT_PARITY][13] , \LEDR_link_f[PHIT_PARITY][12] , 
        \LEDR_link_f[PHIT_PARITY][11] , \LEDR_link_f[PHIT_PARITY][10] , 
        \LEDR_link_f[PHIT_PARITY][9] , \LEDR_link_f[PHIT_PARITY][8] , 
        \LEDR_link_f[PHIT_PARITY][7] , \LEDR_link_f[PHIT_PARITY][6] , 
        \LEDR_link_f[PHIT_PARITY][5] , \LEDR_link_f[PHIT_PARITY][4] , 
        \LEDR_link_f[PHIT_PARITY][3] , \LEDR_link_f[PHIT_PARITY][2] , 
        \LEDR_link_f[PHIT_PARITY][1] , \LEDR_link_f[PHIT_PARITY][0] }), 
    .LEDR_link_b(\LEDR_link_b[ACK] ) );
  input preset, \bundled_ch_f[REQ] , \bundled_ch_f[DATA][33] ,
         \bundled_ch_f[DATA][32] , \bundled_ch_f[DATA][31] ,
         \bundled_ch_f[DATA][30] , \bundled_ch_f[DATA][29] ,
         \bundled_ch_f[DATA][28] , \bundled_ch_f[DATA][27] ,
         \bundled_ch_f[DATA][26] , \bundled_ch_f[DATA][25] ,
         \bundled_ch_f[DATA][24] , \bundled_ch_f[DATA][23] ,
         \bundled_ch_f[DATA][22] , \bundled_ch_f[DATA][21] ,
         \bundled_ch_f[DATA][20] , \bundled_ch_f[DATA][19] ,
         \bundled_ch_f[DATA][18] , \bundled_ch_f[DATA][17] ,
         \bundled_ch_f[DATA][16] , \bundled_ch_f[DATA][15] ,
         \bundled_ch_f[DATA][14] , \bundled_ch_f[DATA][13] ,
         \bundled_ch_f[DATA][12] , \bundled_ch_f[DATA][11] ,
         \bundled_ch_f[DATA][10] , \bundled_ch_f[DATA][9] ,
         \bundled_ch_f[DATA][8] , \bundled_ch_f[DATA][7] ,
         \bundled_ch_f[DATA][6] , \bundled_ch_f[DATA][5] ,
         \bundled_ch_f[DATA][4] , \bundled_ch_f[DATA][3] ,
         \bundled_ch_f[DATA][2] , \bundled_ch_f[DATA][1] ,
         \bundled_ch_f[DATA][0] , \LEDR_link_b[ACK] ;
  output \bundled_ch_b[ACK] , \LEDR_link_f[TOKEN_T] ,
         \LEDR_link_f[TOKEN_PARITY] , \LEDR_link_f[PHIT][32] ,
         \LEDR_link_f[PHIT][31] , \LEDR_link_f[PHIT][30] ,
         \LEDR_link_f[PHIT][29] , \LEDR_link_f[PHIT][28] ,
         \LEDR_link_f[PHIT][27] , \LEDR_link_f[PHIT][26] ,
         \LEDR_link_f[PHIT][25] , \LEDR_link_f[PHIT][24] ,
         \LEDR_link_f[PHIT][23] , \LEDR_link_f[PHIT][22] ,
         \LEDR_link_f[PHIT][21] , \LEDR_link_f[PHIT][20] ,
         \LEDR_link_f[PHIT][19] , \LEDR_link_f[PHIT][18] ,
         \LEDR_link_f[PHIT][17] , \LEDR_link_f[PHIT][16] ,
         \LEDR_link_f[PHIT][15] , \LEDR_link_f[PHIT][14] ,
         \LEDR_link_f[PHIT][13] , \LEDR_link_f[PHIT][12] ,
         \LEDR_link_f[PHIT][11] , \LEDR_link_f[PHIT][10] ,
         \LEDR_link_f[PHIT][9] , \LEDR_link_f[PHIT][8] ,
         \LEDR_link_f[PHIT][7] , \LEDR_link_f[PHIT][6] ,
         \LEDR_link_f[PHIT][5] , \LEDR_link_f[PHIT][4] ,
         \LEDR_link_f[PHIT][3] , \LEDR_link_f[PHIT][2] ,
         \LEDR_link_f[PHIT][1] , \LEDR_link_f[PHIT][0] ,
         \LEDR_link_f[PHIT_PARITY][32] , \LEDR_link_f[PHIT_PARITY][31] ,
         \LEDR_link_f[PHIT_PARITY][30] , \LEDR_link_f[PHIT_PARITY][29] ,
         \LEDR_link_f[PHIT_PARITY][28] , \LEDR_link_f[PHIT_PARITY][27] ,
         \LEDR_link_f[PHIT_PARITY][26] , \LEDR_link_f[PHIT_PARITY][25] ,
         \LEDR_link_f[PHIT_PARITY][24] , \LEDR_link_f[PHIT_PARITY][23] ,
         \LEDR_link_f[PHIT_PARITY][22] , \LEDR_link_f[PHIT_PARITY][21] ,
         \LEDR_link_f[PHIT_PARITY][20] , \LEDR_link_f[PHIT_PARITY][19] ,
         \LEDR_link_f[PHIT_PARITY][18] , \LEDR_link_f[PHIT_PARITY][17] ,
         \LEDR_link_f[PHIT_PARITY][16] , \LEDR_link_f[PHIT_PARITY][15] ,
         \LEDR_link_f[PHIT_PARITY][14] , \LEDR_link_f[PHIT_PARITY][13] ,
         \LEDR_link_f[PHIT_PARITY][12] , \LEDR_link_f[PHIT_PARITY][11] ,
         \LEDR_link_f[PHIT_PARITY][10] , \LEDR_link_f[PHIT_PARITY][9] ,
         \LEDR_link_f[PHIT_PARITY][8] , \LEDR_link_f[PHIT_PARITY][7] ,
         \LEDR_link_f[PHIT_PARITY][6] , \LEDR_link_f[PHIT_PARITY][5] ,
         \LEDR_link_f[PHIT_PARITY][4] , \LEDR_link_f[PHIT_PARITY][3] ,
         \LEDR_link_f[PHIT_PARITY][2] , \LEDR_link_f[PHIT_PARITY][1] ,
         \LEDR_link_f[PHIT_PARITY][0] ;
  wire   clk, type_out, enabled_clk, N2, data_phase, N5, N6, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11;
  wire   [32:0] data_parity;

  HS65_LS_DFPRQX4 type_out_reg ( .D(\bundled_ch_f[DATA][33] ), .CP(clk), .RN(
        n7), .Q(type_out) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_T]  ( .D(\bundled_ch_f[DATA][33] ), 
        .CP(clk), .RN(n5), .Q(\LEDR_link_f[TOKEN_T] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_PARITY]  ( .D(N2), .CP(clk), .RN(n5), 
        .Q(\LEDR_link_f[TOKEN_PARITY] ) );
  HS65_LS_DFPSQX4 data_phase_reg ( .D(n2), .CP(enabled_clk), .SN(n8), .Q(
        data_phase) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][32]  ( .D(\bundled_ch_f[DATA][32] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][32] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][31]  ( .D(\bundled_ch_f[DATA][31] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][31] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][30]  ( .D(\bundled_ch_f[DATA][30] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][30] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][29]  ( .D(\bundled_ch_f[DATA][29] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][29] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][28]  ( .D(\bundled_ch_f[DATA][28] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][28] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][27]  ( .D(\bundled_ch_f[DATA][27] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][27] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][26]  ( .D(\bundled_ch_f[DATA][26] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][26] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][25]  ( .D(\bundled_ch_f[DATA][25] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][25] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][24]  ( .D(\bundled_ch_f[DATA][24] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][24] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][23]  ( .D(\bundled_ch_f[DATA][23] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][23] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][22]  ( .D(\bundled_ch_f[DATA][22] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][22] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][21]  ( .D(\bundled_ch_f[DATA][21] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][21] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][20]  ( .D(\bundled_ch_f[DATA][20] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][20] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][19]  ( .D(\bundled_ch_f[DATA][19] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][19] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][18]  ( .D(\bundled_ch_f[DATA][18] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][18] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][17]  ( .D(\bundled_ch_f[DATA][17] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][17] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][16]  ( .D(\bundled_ch_f[DATA][16] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][16] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][15]  ( .D(\bundled_ch_f[DATA][15] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][15] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][14]  ( .D(\bundled_ch_f[DATA][14] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][14] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][13]  ( .D(\bundled_ch_f[DATA][13] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][13] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][12]  ( .D(\bundled_ch_f[DATA][12] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][12] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][11]  ( .D(\bundled_ch_f[DATA][11] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][11] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][10]  ( .D(\bundled_ch_f[DATA][10] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][10] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][9]  ( .D(\bundled_ch_f[DATA][9] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][9] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][8]  ( .D(\bundled_ch_f[DATA][8] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][8] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][7]  ( .D(\bundled_ch_f[DATA][7] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][7] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][6]  ( .D(\bundled_ch_f[DATA][6] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][6] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][5]  ( .D(\bundled_ch_f[DATA][5] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][5] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][4]  ( .D(\bundled_ch_f[DATA][4] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][4] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][3]  ( .D(\bundled_ch_f[DATA][3] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][3] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][2]  ( .D(\bundled_ch_f[DATA][2] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][2] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][1]  ( .D(\bundled_ch_f[DATA][1] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][1] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][0]  ( .D(\bundled_ch_f[DATA][0] ), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT][0] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][32]  ( .D(data_parity[32]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][32] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][31]  ( .D(data_parity[31]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][31] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][30]  ( .D(data_parity[30]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][30] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][29]  ( .D(data_parity[29]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][29] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][28]  ( .D(data_parity[28]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][28] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][27]  ( .D(data_parity[27]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][27] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][26]  ( .D(data_parity[26]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][26] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][25]  ( .D(data_parity[25]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][25] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][24]  ( .D(data_parity[24]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][24] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][23]  ( .D(data_parity[23]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][23] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][22]  ( .D(data_parity[22]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][22] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][21]  ( .D(data_parity[21]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][21] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][20]  ( .D(data_parity[20]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][20] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][19]  ( .D(data_parity[19]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][19] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][18]  ( .D(data_parity[18]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][18] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][17]  ( .D(data_parity[17]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][17] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][16]  ( .D(data_parity[16]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][16] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][15]  ( .D(data_parity[15]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][15] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][14]  ( .D(data_parity[14]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][14] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][13]  ( .D(data_parity[13]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][13] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][12]  ( .D(data_parity[12]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][12] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][11]  ( .D(data_parity[11]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][11] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][10]  ( .D(data_parity[10]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][10] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][9]  ( .D(data_parity[9]), .CP(
        enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][9] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][8]  ( .D(data_parity[8]), .CP(
        enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT_PARITY][8] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][7]  ( .D(data_parity[7]), .CP(
        enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT_PARITY][7] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][6]  ( .D(data_parity[6]), .CP(
        enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT_PARITY][6] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][5]  ( .D(data_parity[5]), .CP(
        enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT_PARITY][5] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][4]  ( .D(data_parity[4]), .CP(
        enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][4] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][3]  ( .D(data_parity[3]), .CP(
        enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][3] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][2]  ( .D(data_parity[2]), .CP(
        enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT_PARITY][2] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][1]  ( .D(data_parity[1]), .CP(
        enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT_PARITY][1] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][0]  ( .D(data_parity[0]), .CP(
        enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT_PARITY][0] ) );
  HS65_LS_LDHQX9 ack_reg ( .G(N5), .D(N6), .Q(\bundled_ch_b[ACK] ) );
  HS65_LSS_XOR2X6 C214 ( .A(\LEDR_link_b[ACK] ), .B(\bundled_ch_b[ACK] ), .Z(
        clk) );
  HS65_LS_AND2X9 C215 ( .A(clk), .B(type_out), .Z(enabled_clk) );
  HS65_LS_BFX9 U3 ( .A(preset), .Z(n10) );
  HS65_LS_BFX9 U4 ( .A(preset), .Z(n11) );
  HS65_LS_IVX9 U5 ( .A(n3), .Z(n1) );
  HS65_LS_BFX9 U6 ( .A(n4), .Z(n3) );
  HS65_LSS_XOR2X6 U7 ( .A(\bundled_ch_f[REQ] ), .B(\bundled_ch_f[DATA][33] ), 
        .Z(N2) );
  HS65_LS_BFX9 U8 ( .A(n4), .Z(n2) );
  HS65_LS_IVX9 U9 ( .A(data_phase), .Z(n4) );
  HS65_LSS_XOR2X6 U10 ( .A(n1), .B(\bundled_ch_f[DATA][0] ), .Z(data_parity[0]) );
  HS65_LSS_XOR2X6 U11 ( .A(n1), .B(\bundled_ch_f[DATA][1] ), .Z(data_parity[1]) );
  HS65_LSS_XOR2X6 U12 ( .A(data_phase), .B(\bundled_ch_f[DATA][2] ), .Z(
        data_parity[2]) );
  HS65_LSS_XOR2X6 U13 ( .A(n1), .B(\bundled_ch_f[DATA][3] ), .Z(data_parity[3]) );
  HS65_LSS_XOR2X6 U14 ( .A(n1), .B(\bundled_ch_f[DATA][4] ), .Z(data_parity[4]) );
  HS65_LSS_XOR2X6 U15 ( .A(data_phase), .B(\bundled_ch_f[DATA][5] ), .Z(
        data_parity[5]) );
  HS65_LSS_XOR2X6 U16 ( .A(data_phase), .B(\bundled_ch_f[DATA][6] ), .Z(
        data_parity[6]) );
  HS65_LSS_XOR2X6 U17 ( .A(data_phase), .B(\bundled_ch_f[DATA][7] ), .Z(
        data_parity[7]) );
  HS65_LSS_XOR2X6 U18 ( .A(data_phase), .B(\bundled_ch_f[DATA][8] ), .Z(
        data_parity[8]) );
  HS65_LSS_XOR2X6 U19 ( .A(n1), .B(\bundled_ch_f[DATA][10] ), .Z(
        data_parity[10]) );
  HS65_LSS_XOR2X6 U20 ( .A(n1), .B(\bundled_ch_f[DATA][11] ), .Z(
        data_parity[11]) );
  HS65_LSS_XOR2X6 U21 ( .A(n1), .B(\bundled_ch_f[DATA][12] ), .Z(
        data_parity[12]) );
  HS65_LSS_XOR2X6 U22 ( .A(n1), .B(\bundled_ch_f[DATA][13] ), .Z(
        data_parity[13]) );
  HS65_LSS_XOR2X6 U23 ( .A(n1), .B(\bundled_ch_f[DATA][14] ), .Z(
        data_parity[14]) );
  HS65_LSS_XOR2X6 U24 ( .A(n1), .B(\bundled_ch_f[DATA][15] ), .Z(
        data_parity[15]) );
  HS65_LSS_XOR2X6 U25 ( .A(n1), .B(\bundled_ch_f[DATA][16] ), .Z(
        data_parity[16]) );
  HS65_LSS_XOR2X6 U26 ( .A(n1), .B(\bundled_ch_f[DATA][17] ), .Z(
        data_parity[17]) );
  HS65_LSS_XOR2X6 U27 ( .A(n1), .B(\bundled_ch_f[DATA][18] ), .Z(
        data_parity[18]) );
  HS65_LSS_XOR2X6 U28 ( .A(n1), .B(\bundled_ch_f[DATA][19] ), .Z(
        data_parity[19]) );
  HS65_LSS_XOR2X6 U29 ( .A(data_phase), .B(\bundled_ch_f[DATA][20] ), .Z(
        data_parity[20]) );
  HS65_LSS_XOR2X6 U30 ( .A(data_phase), .B(\bundled_ch_f[DATA][21] ), .Z(
        data_parity[21]) );
  HS65_LSS_XOR2X6 U31 ( .A(data_phase), .B(\bundled_ch_f[DATA][22] ), .Z(
        data_parity[22]) );
  HS65_LSS_XOR2X6 U32 ( .A(data_phase), .B(\bundled_ch_f[DATA][23] ), .Z(
        data_parity[23]) );
  HS65_LSS_XOR2X6 U33 ( .A(data_phase), .B(\bundled_ch_f[DATA][24] ), .Z(
        data_parity[24]) );
  HS65_LSS_XOR2X6 U34 ( .A(data_phase), .B(\bundled_ch_f[DATA][25] ), .Z(
        data_parity[25]) );
  HS65_LSS_XOR2X6 U35 ( .A(data_phase), .B(\bundled_ch_f[DATA][26] ), .Z(
        data_parity[26]) );
  HS65_LSS_XOR2X6 U36 ( .A(data_phase), .B(\bundled_ch_f[DATA][27] ), .Z(
        data_parity[27]) );
  HS65_LSS_XOR2X6 U37 ( .A(data_phase), .B(\bundled_ch_f[DATA][28] ), .Z(
        data_parity[28]) );
  HS65_LSS_XOR2X6 U38 ( .A(data_phase), .B(\bundled_ch_f[DATA][29] ), .Z(
        data_parity[29]) );
  HS65_LSS_XOR2X6 U39 ( .A(data_phase), .B(\bundled_ch_f[DATA][30] ), .Z(
        data_parity[30]) );
  HS65_LSS_XOR2X6 U40 ( .A(data_phase), .B(\bundled_ch_f[DATA][31] ), .Z(
        data_parity[31]) );
  HS65_LSS_XOR2X6 U41 ( .A(data_phase), .B(\bundled_ch_f[DATA][32] ), .Z(
        data_parity[32]) );
  HS65_LSS_XOR2X6 U42 ( .A(n1), .B(\bundled_ch_f[DATA][9] ), .Z(data_parity[9]) );
  HS65_LS_IVX9 U43 ( .A(n10), .Z(n6) );
  HS65_LS_IVX9 U44 ( .A(n10), .Z(n5) );
  HS65_LS_IVX9 U45 ( .A(n10), .Z(n7) );
  HS65_LS_IVX9 U46 ( .A(n11), .Z(n9) );
  HS65_LS_IVX9 U47 ( .A(n11), .Z(n8) );
  HS65_LS_NOR2AX3 U48 ( .A(\bundled_ch_f[REQ] ), .B(n10), .Z(N6) );
  HS65_LS_NAND2AX7 U49 ( .A(n11), .B(clk), .Z(N5) );
endmodule


module bundled2LEDR_1 ( preset, .bundled_ch_f({\bundled_ch_f[REQ] , 
        \bundled_ch_f[DATA][33] , \bundled_ch_f[DATA][32] , 
        \bundled_ch_f[DATA][31] , \bundled_ch_f[DATA][30] , 
        \bundled_ch_f[DATA][29] , \bundled_ch_f[DATA][28] , 
        \bundled_ch_f[DATA][27] , \bundled_ch_f[DATA][26] , 
        \bundled_ch_f[DATA][25] , \bundled_ch_f[DATA][24] , 
        \bundled_ch_f[DATA][23] , \bundled_ch_f[DATA][22] , 
        \bundled_ch_f[DATA][21] , \bundled_ch_f[DATA][20] , 
        \bundled_ch_f[DATA][19] , \bundled_ch_f[DATA][18] , 
        \bundled_ch_f[DATA][17] , \bundled_ch_f[DATA][16] , 
        \bundled_ch_f[DATA][15] , \bundled_ch_f[DATA][14] , 
        \bundled_ch_f[DATA][13] , \bundled_ch_f[DATA][12] , 
        \bundled_ch_f[DATA][11] , \bundled_ch_f[DATA][10] , 
        \bundled_ch_f[DATA][9] , \bundled_ch_f[DATA][8] , 
        \bundled_ch_f[DATA][7] , \bundled_ch_f[DATA][6] , 
        \bundled_ch_f[DATA][5] , \bundled_ch_f[DATA][4] , 
        \bundled_ch_f[DATA][3] , \bundled_ch_f[DATA][2] , 
        \bundled_ch_f[DATA][1] , \bundled_ch_f[DATA][0] }), .bundled_ch_b(
        \bundled_ch_b[ACK] ), .LEDR_link_f({\LEDR_link_f[TOKEN_T] , 
        \LEDR_link_f[TOKEN_PARITY] , \LEDR_link_f[PHIT][32] , 
        \LEDR_link_f[PHIT][31] , \LEDR_link_f[PHIT][30] , 
        \LEDR_link_f[PHIT][29] , \LEDR_link_f[PHIT][28] , 
        \LEDR_link_f[PHIT][27] , \LEDR_link_f[PHIT][26] , 
        \LEDR_link_f[PHIT][25] , \LEDR_link_f[PHIT][24] , 
        \LEDR_link_f[PHIT][23] , \LEDR_link_f[PHIT][22] , 
        \LEDR_link_f[PHIT][21] , \LEDR_link_f[PHIT][20] , 
        \LEDR_link_f[PHIT][19] , \LEDR_link_f[PHIT][18] , 
        \LEDR_link_f[PHIT][17] , \LEDR_link_f[PHIT][16] , 
        \LEDR_link_f[PHIT][15] , \LEDR_link_f[PHIT][14] , 
        \LEDR_link_f[PHIT][13] , \LEDR_link_f[PHIT][12] , 
        \LEDR_link_f[PHIT][11] , \LEDR_link_f[PHIT][10] , 
        \LEDR_link_f[PHIT][9] , \LEDR_link_f[PHIT][8] , \LEDR_link_f[PHIT][7] , 
        \LEDR_link_f[PHIT][6] , \LEDR_link_f[PHIT][5] , \LEDR_link_f[PHIT][4] , 
        \LEDR_link_f[PHIT][3] , \LEDR_link_f[PHIT][2] , \LEDR_link_f[PHIT][1] , 
        \LEDR_link_f[PHIT][0] , \LEDR_link_f[PHIT_PARITY][32] , 
        \LEDR_link_f[PHIT_PARITY][31] , \LEDR_link_f[PHIT_PARITY][30] , 
        \LEDR_link_f[PHIT_PARITY][29] , \LEDR_link_f[PHIT_PARITY][28] , 
        \LEDR_link_f[PHIT_PARITY][27] , \LEDR_link_f[PHIT_PARITY][26] , 
        \LEDR_link_f[PHIT_PARITY][25] , \LEDR_link_f[PHIT_PARITY][24] , 
        \LEDR_link_f[PHIT_PARITY][23] , \LEDR_link_f[PHIT_PARITY][22] , 
        \LEDR_link_f[PHIT_PARITY][21] , \LEDR_link_f[PHIT_PARITY][20] , 
        \LEDR_link_f[PHIT_PARITY][19] , \LEDR_link_f[PHIT_PARITY][18] , 
        \LEDR_link_f[PHIT_PARITY][17] , \LEDR_link_f[PHIT_PARITY][16] , 
        \LEDR_link_f[PHIT_PARITY][15] , \LEDR_link_f[PHIT_PARITY][14] , 
        \LEDR_link_f[PHIT_PARITY][13] , \LEDR_link_f[PHIT_PARITY][12] , 
        \LEDR_link_f[PHIT_PARITY][11] , \LEDR_link_f[PHIT_PARITY][10] , 
        \LEDR_link_f[PHIT_PARITY][9] , \LEDR_link_f[PHIT_PARITY][8] , 
        \LEDR_link_f[PHIT_PARITY][7] , \LEDR_link_f[PHIT_PARITY][6] , 
        \LEDR_link_f[PHIT_PARITY][5] , \LEDR_link_f[PHIT_PARITY][4] , 
        \LEDR_link_f[PHIT_PARITY][3] , \LEDR_link_f[PHIT_PARITY][2] , 
        \LEDR_link_f[PHIT_PARITY][1] , \LEDR_link_f[PHIT_PARITY][0] }), 
    .LEDR_link_b(\LEDR_link_b[ACK] ) );
  input preset, \bundled_ch_f[REQ] , \bundled_ch_f[DATA][33] ,
         \bundled_ch_f[DATA][32] , \bundled_ch_f[DATA][31] ,
         \bundled_ch_f[DATA][30] , \bundled_ch_f[DATA][29] ,
         \bundled_ch_f[DATA][28] , \bundled_ch_f[DATA][27] ,
         \bundled_ch_f[DATA][26] , \bundled_ch_f[DATA][25] ,
         \bundled_ch_f[DATA][24] , \bundled_ch_f[DATA][23] ,
         \bundled_ch_f[DATA][22] , \bundled_ch_f[DATA][21] ,
         \bundled_ch_f[DATA][20] , \bundled_ch_f[DATA][19] ,
         \bundled_ch_f[DATA][18] , \bundled_ch_f[DATA][17] ,
         \bundled_ch_f[DATA][16] , \bundled_ch_f[DATA][15] ,
         \bundled_ch_f[DATA][14] , \bundled_ch_f[DATA][13] ,
         \bundled_ch_f[DATA][12] , \bundled_ch_f[DATA][11] ,
         \bundled_ch_f[DATA][10] , \bundled_ch_f[DATA][9] ,
         \bundled_ch_f[DATA][8] , \bundled_ch_f[DATA][7] ,
         \bundled_ch_f[DATA][6] , \bundled_ch_f[DATA][5] ,
         \bundled_ch_f[DATA][4] , \bundled_ch_f[DATA][3] ,
         \bundled_ch_f[DATA][2] , \bundled_ch_f[DATA][1] ,
         \bundled_ch_f[DATA][0] , \LEDR_link_b[ACK] ;
  output \bundled_ch_b[ACK] , \LEDR_link_f[TOKEN_T] ,
         \LEDR_link_f[TOKEN_PARITY] , \LEDR_link_f[PHIT][32] ,
         \LEDR_link_f[PHIT][31] , \LEDR_link_f[PHIT][30] ,
         \LEDR_link_f[PHIT][29] , \LEDR_link_f[PHIT][28] ,
         \LEDR_link_f[PHIT][27] , \LEDR_link_f[PHIT][26] ,
         \LEDR_link_f[PHIT][25] , \LEDR_link_f[PHIT][24] ,
         \LEDR_link_f[PHIT][23] , \LEDR_link_f[PHIT][22] ,
         \LEDR_link_f[PHIT][21] , \LEDR_link_f[PHIT][20] ,
         \LEDR_link_f[PHIT][19] , \LEDR_link_f[PHIT][18] ,
         \LEDR_link_f[PHIT][17] , \LEDR_link_f[PHIT][16] ,
         \LEDR_link_f[PHIT][15] , \LEDR_link_f[PHIT][14] ,
         \LEDR_link_f[PHIT][13] , \LEDR_link_f[PHIT][12] ,
         \LEDR_link_f[PHIT][11] , \LEDR_link_f[PHIT][10] ,
         \LEDR_link_f[PHIT][9] , \LEDR_link_f[PHIT][8] ,
         \LEDR_link_f[PHIT][7] , \LEDR_link_f[PHIT][6] ,
         \LEDR_link_f[PHIT][5] , \LEDR_link_f[PHIT][4] ,
         \LEDR_link_f[PHIT][3] , \LEDR_link_f[PHIT][2] ,
         \LEDR_link_f[PHIT][1] , \LEDR_link_f[PHIT][0] ,
         \LEDR_link_f[PHIT_PARITY][32] , \LEDR_link_f[PHIT_PARITY][31] ,
         \LEDR_link_f[PHIT_PARITY][30] , \LEDR_link_f[PHIT_PARITY][29] ,
         \LEDR_link_f[PHIT_PARITY][28] , \LEDR_link_f[PHIT_PARITY][27] ,
         \LEDR_link_f[PHIT_PARITY][26] , \LEDR_link_f[PHIT_PARITY][25] ,
         \LEDR_link_f[PHIT_PARITY][24] , \LEDR_link_f[PHIT_PARITY][23] ,
         \LEDR_link_f[PHIT_PARITY][22] , \LEDR_link_f[PHIT_PARITY][21] ,
         \LEDR_link_f[PHIT_PARITY][20] , \LEDR_link_f[PHIT_PARITY][19] ,
         \LEDR_link_f[PHIT_PARITY][18] , \LEDR_link_f[PHIT_PARITY][17] ,
         \LEDR_link_f[PHIT_PARITY][16] , \LEDR_link_f[PHIT_PARITY][15] ,
         \LEDR_link_f[PHIT_PARITY][14] , \LEDR_link_f[PHIT_PARITY][13] ,
         \LEDR_link_f[PHIT_PARITY][12] , \LEDR_link_f[PHIT_PARITY][11] ,
         \LEDR_link_f[PHIT_PARITY][10] , \LEDR_link_f[PHIT_PARITY][9] ,
         \LEDR_link_f[PHIT_PARITY][8] , \LEDR_link_f[PHIT_PARITY][7] ,
         \LEDR_link_f[PHIT_PARITY][6] , \LEDR_link_f[PHIT_PARITY][5] ,
         \LEDR_link_f[PHIT_PARITY][4] , \LEDR_link_f[PHIT_PARITY][3] ,
         \LEDR_link_f[PHIT_PARITY][2] , \LEDR_link_f[PHIT_PARITY][1] ,
         \LEDR_link_f[PHIT_PARITY][0] ;
  wire   clk, type_out, enabled_clk, N2, data_phase, N5, N6, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11;
  wire   [32:0] data_parity;

  HS65_LS_DFPRQX4 type_out_reg ( .D(\bundled_ch_f[DATA][33] ), .CP(clk), .RN(
        n7), .Q(type_out) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_T]  ( .D(\bundled_ch_f[DATA][33] ), 
        .CP(clk), .RN(n5), .Q(\LEDR_link_f[TOKEN_T] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_PARITY]  ( .D(N2), .CP(clk), .RN(n5), 
        .Q(\LEDR_link_f[TOKEN_PARITY] ) );
  HS65_LS_DFPSQX4 data_phase_reg ( .D(n2), .CP(enabled_clk), .SN(n8), .Q(
        data_phase) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][32]  ( .D(\bundled_ch_f[DATA][32] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][32] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][31]  ( .D(\bundled_ch_f[DATA][31] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][31] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][30]  ( .D(\bundled_ch_f[DATA][30] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][30] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][29]  ( .D(\bundled_ch_f[DATA][29] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][29] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][28]  ( .D(\bundled_ch_f[DATA][28] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][28] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][27]  ( .D(\bundled_ch_f[DATA][27] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][27] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][26]  ( .D(\bundled_ch_f[DATA][26] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][26] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][25]  ( .D(\bundled_ch_f[DATA][25] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][25] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][24]  ( .D(\bundled_ch_f[DATA][24] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][24] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][23]  ( .D(\bundled_ch_f[DATA][23] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][23] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][22]  ( .D(\bundled_ch_f[DATA][22] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][22] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][21]  ( .D(\bundled_ch_f[DATA][21] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][21] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][20]  ( .D(\bundled_ch_f[DATA][20] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][20] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][19]  ( .D(\bundled_ch_f[DATA][19] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][19] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][18]  ( .D(\bundled_ch_f[DATA][18] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][18] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][17]  ( .D(\bundled_ch_f[DATA][17] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][17] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][16]  ( .D(\bundled_ch_f[DATA][16] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][16] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][15]  ( .D(\bundled_ch_f[DATA][15] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][15] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][14]  ( .D(\bundled_ch_f[DATA][14] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][14] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][13]  ( .D(\bundled_ch_f[DATA][13] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][13] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][12]  ( .D(\bundled_ch_f[DATA][12] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][12] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][11]  ( .D(\bundled_ch_f[DATA][11] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][11] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][10]  ( .D(\bundled_ch_f[DATA][10] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][10] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][9]  ( .D(\bundled_ch_f[DATA][9] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][9] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][8]  ( .D(\bundled_ch_f[DATA][8] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][8] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][7]  ( .D(\bundled_ch_f[DATA][7] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][7] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][6]  ( .D(\bundled_ch_f[DATA][6] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][6] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][5]  ( .D(\bundled_ch_f[DATA][5] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][5] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][4]  ( .D(\bundled_ch_f[DATA][4] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][4] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][3]  ( .D(\bundled_ch_f[DATA][3] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][3] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][2]  ( .D(\bundled_ch_f[DATA][2] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][2] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][1]  ( .D(\bundled_ch_f[DATA][1] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][1] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][0]  ( .D(\bundled_ch_f[DATA][0] ), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT][0] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][32]  ( .D(data_parity[32]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][32] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][31]  ( .D(data_parity[31]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][31] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][30]  ( .D(data_parity[30]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][30] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][29]  ( .D(data_parity[29]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][29] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][28]  ( .D(data_parity[28]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][28] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][27]  ( .D(data_parity[27]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][27] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][26]  ( .D(data_parity[26]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][26] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][25]  ( .D(data_parity[25]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][25] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][24]  ( .D(data_parity[24]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][24] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][23]  ( .D(data_parity[23]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][23] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][22]  ( .D(data_parity[22]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][22] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][21]  ( .D(data_parity[21]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][21] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][20]  ( .D(data_parity[20]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][20] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][19]  ( .D(data_parity[19]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][19] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][18]  ( .D(data_parity[18]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][18] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][17]  ( .D(data_parity[17]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][17] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][16]  ( .D(data_parity[16]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][16] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][15]  ( .D(data_parity[15]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][15] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][14]  ( .D(data_parity[14]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][14] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][13]  ( .D(data_parity[13]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][13] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][12]  ( .D(data_parity[12]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][12] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][11]  ( .D(data_parity[11]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][11] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][10]  ( .D(data_parity[10]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][10] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][9]  ( .D(data_parity[9]), .CP(
        enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT_PARITY][9] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][8]  ( .D(data_parity[8]), .CP(
        enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT_PARITY][8] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][7]  ( .D(data_parity[7]), .CP(
        enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT_PARITY][7] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][6]  ( .D(data_parity[6]), .CP(
        enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][6] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][5]  ( .D(data_parity[5]), .CP(
        enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT_PARITY][5] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][4]  ( .D(data_parity[4]), .CP(
        enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT_PARITY][4] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][3]  ( .D(data_parity[3]), .CP(
        enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][3] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][2]  ( .D(data_parity[2]), .CP(
        enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][2] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][1]  ( .D(data_parity[1]), .CP(
        enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT_PARITY][1] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][0]  ( .D(data_parity[0]), .CP(
        enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT_PARITY][0] ) );
  HS65_LS_LDHQX9 ack_reg ( .G(N5), .D(N6), .Q(\bundled_ch_b[ACK] ) );
  HS65_LSS_XOR2X6 C214 ( .A(\LEDR_link_b[ACK] ), .B(\bundled_ch_b[ACK] ), .Z(
        clk) );
  HS65_LS_AND2X9 C215 ( .A(clk), .B(type_out), .Z(enabled_clk) );
  HS65_LS_BFX9 U3 ( .A(preset), .Z(n10) );
  HS65_LS_BFX9 U4 ( .A(preset), .Z(n11) );
  HS65_LS_IVX9 U5 ( .A(n3), .Z(n1) );
  HS65_LS_BFX9 U6 ( .A(n4), .Z(n3) );
  HS65_LSS_XOR2X6 U7 ( .A(\bundled_ch_f[REQ] ), .B(\bundled_ch_f[DATA][33] ), 
        .Z(N2) );
  HS65_LS_BFX9 U8 ( .A(n4), .Z(n2) );
  HS65_LS_IVX9 U9 ( .A(data_phase), .Z(n4) );
  HS65_LSS_XOR2X6 U10 ( .A(n1), .B(\bundled_ch_f[DATA][9] ), .Z(data_parity[9]) );
  HS65_LSS_XOR2X6 U11 ( .A(n1), .B(\bundled_ch_f[DATA][0] ), .Z(data_parity[0]) );
  HS65_LSS_XOR2X6 U12 ( .A(n1), .B(\bundled_ch_f[DATA][1] ), .Z(data_parity[1]) );
  HS65_LSS_XOR2X6 U13 ( .A(data_phase), .B(\bundled_ch_f[DATA][2] ), .Z(
        data_parity[2]) );
  HS65_LSS_XOR2X6 U14 ( .A(n1), .B(\bundled_ch_f[DATA][10] ), .Z(
        data_parity[10]) );
  HS65_LSS_XOR2X6 U15 ( .A(n1), .B(\bundled_ch_f[DATA][11] ), .Z(
        data_parity[11]) );
  HS65_LSS_XOR2X6 U16 ( .A(n1), .B(\bundled_ch_f[DATA][12] ), .Z(
        data_parity[12]) );
  HS65_LSS_XOR2X6 U17 ( .A(n1), .B(\bundled_ch_f[DATA][13] ), .Z(
        data_parity[13]) );
  HS65_LSS_XOR2X6 U18 ( .A(n1), .B(\bundled_ch_f[DATA][14] ), .Z(
        data_parity[14]) );
  HS65_LSS_XOR2X6 U19 ( .A(n1), .B(\bundled_ch_f[DATA][15] ), .Z(
        data_parity[15]) );
  HS65_LSS_XOR2X6 U20 ( .A(n1), .B(\bundled_ch_f[DATA][16] ), .Z(
        data_parity[16]) );
  HS65_LSS_XOR2X6 U21 ( .A(n1), .B(\bundled_ch_f[DATA][17] ), .Z(
        data_parity[17]) );
  HS65_LSS_XOR2X6 U22 ( .A(n1), .B(\bundled_ch_f[DATA][18] ), .Z(
        data_parity[18]) );
  HS65_LSS_XOR2X6 U23 ( .A(n1), .B(\bundled_ch_f[DATA][19] ), .Z(
        data_parity[19]) );
  HS65_LSS_XOR2X6 U24 ( .A(data_phase), .B(\bundled_ch_f[DATA][20] ), .Z(
        data_parity[20]) );
  HS65_LSS_XOR2X6 U25 ( .A(data_phase), .B(\bundled_ch_f[DATA][21] ), .Z(
        data_parity[21]) );
  HS65_LSS_XOR2X6 U26 ( .A(data_phase), .B(\bundled_ch_f[DATA][22] ), .Z(
        data_parity[22]) );
  HS65_LSS_XOR2X6 U27 ( .A(data_phase), .B(\bundled_ch_f[DATA][23] ), .Z(
        data_parity[23]) );
  HS65_LSS_XOR2X6 U28 ( .A(data_phase), .B(\bundled_ch_f[DATA][24] ), .Z(
        data_parity[24]) );
  HS65_LSS_XOR2X6 U29 ( .A(data_phase), .B(\bundled_ch_f[DATA][25] ), .Z(
        data_parity[25]) );
  HS65_LSS_XOR2X6 U30 ( .A(data_phase), .B(\bundled_ch_f[DATA][26] ), .Z(
        data_parity[26]) );
  HS65_LSS_XOR2X6 U31 ( .A(data_phase), .B(\bundled_ch_f[DATA][27] ), .Z(
        data_parity[27]) );
  HS65_LSS_XOR2X6 U32 ( .A(data_phase), .B(\bundled_ch_f[DATA][28] ), .Z(
        data_parity[28]) );
  HS65_LSS_XOR2X6 U33 ( .A(data_phase), .B(\bundled_ch_f[DATA][29] ), .Z(
        data_parity[29]) );
  HS65_LSS_XOR2X6 U34 ( .A(data_phase), .B(\bundled_ch_f[DATA][30] ), .Z(
        data_parity[30]) );
  HS65_LSS_XOR2X6 U35 ( .A(n1), .B(\bundled_ch_f[DATA][31] ), .Z(
        data_parity[31]) );
  HS65_LSS_XOR2X6 U36 ( .A(n1), .B(\bundled_ch_f[DATA][32] ), .Z(
        data_parity[32]) );
  HS65_LSS_XOR2X6 U37 ( .A(data_phase), .B(\bundled_ch_f[DATA][3] ), .Z(
        data_parity[3]) );
  HS65_LSS_XOR2X6 U38 ( .A(data_phase), .B(\bundled_ch_f[DATA][4] ), .Z(
        data_parity[4]) );
  HS65_LSS_XOR2X6 U39 ( .A(data_phase), .B(\bundled_ch_f[DATA][5] ), .Z(
        data_parity[5]) );
  HS65_LSS_XOR2X6 U40 ( .A(data_phase), .B(\bundled_ch_f[DATA][6] ), .Z(
        data_parity[6]) );
  HS65_LSS_XOR2X6 U41 ( .A(data_phase), .B(\bundled_ch_f[DATA][7] ), .Z(
        data_parity[7]) );
  HS65_LSS_XOR2X6 U42 ( .A(data_phase), .B(\bundled_ch_f[DATA][8] ), .Z(
        data_parity[8]) );
  HS65_LS_IVX9 U43 ( .A(n10), .Z(n6) );
  HS65_LS_IVX9 U44 ( .A(n10), .Z(n5) );
  HS65_LS_IVX9 U45 ( .A(n10), .Z(n7) );
  HS65_LS_IVX9 U46 ( .A(n11), .Z(n9) );
  HS65_LS_IVX9 U47 ( .A(n11), .Z(n8) );
  HS65_LS_NOR2AX3 U48 ( .A(\bundled_ch_f[REQ] ), .B(n10), .Z(N6) );
  HS65_LS_NAND2AX7 U49 ( .A(n11), .B(clk), .Z(N5) );
endmodule


module bundled2LEDR_2 ( preset, .bundled_ch_f({\bundled_ch_f[REQ] , 
        \bundled_ch_f[DATA][33] , \bundled_ch_f[DATA][32] , 
        \bundled_ch_f[DATA][31] , \bundled_ch_f[DATA][30] , 
        \bundled_ch_f[DATA][29] , \bundled_ch_f[DATA][28] , 
        \bundled_ch_f[DATA][27] , \bundled_ch_f[DATA][26] , 
        \bundled_ch_f[DATA][25] , \bundled_ch_f[DATA][24] , 
        \bundled_ch_f[DATA][23] , \bundled_ch_f[DATA][22] , 
        \bundled_ch_f[DATA][21] , \bundled_ch_f[DATA][20] , 
        \bundled_ch_f[DATA][19] , \bundled_ch_f[DATA][18] , 
        \bundled_ch_f[DATA][17] , \bundled_ch_f[DATA][16] , 
        \bundled_ch_f[DATA][15] , \bundled_ch_f[DATA][14] , 
        \bundled_ch_f[DATA][13] , \bundled_ch_f[DATA][12] , 
        \bundled_ch_f[DATA][11] , \bundled_ch_f[DATA][10] , 
        \bundled_ch_f[DATA][9] , \bundled_ch_f[DATA][8] , 
        \bundled_ch_f[DATA][7] , \bundled_ch_f[DATA][6] , 
        \bundled_ch_f[DATA][5] , \bundled_ch_f[DATA][4] , 
        \bundled_ch_f[DATA][3] , \bundled_ch_f[DATA][2] , 
        \bundled_ch_f[DATA][1] , \bundled_ch_f[DATA][0] }), .bundled_ch_b(
        \bundled_ch_b[ACK] ), .LEDR_link_f({\LEDR_link_f[TOKEN_T] , 
        \LEDR_link_f[TOKEN_PARITY] , \LEDR_link_f[PHIT][32] , 
        \LEDR_link_f[PHIT][31] , \LEDR_link_f[PHIT][30] , 
        \LEDR_link_f[PHIT][29] , \LEDR_link_f[PHIT][28] , 
        \LEDR_link_f[PHIT][27] , \LEDR_link_f[PHIT][26] , 
        \LEDR_link_f[PHIT][25] , \LEDR_link_f[PHIT][24] , 
        \LEDR_link_f[PHIT][23] , \LEDR_link_f[PHIT][22] , 
        \LEDR_link_f[PHIT][21] , \LEDR_link_f[PHIT][20] , 
        \LEDR_link_f[PHIT][19] , \LEDR_link_f[PHIT][18] , 
        \LEDR_link_f[PHIT][17] , \LEDR_link_f[PHIT][16] , 
        \LEDR_link_f[PHIT][15] , \LEDR_link_f[PHIT][14] , 
        \LEDR_link_f[PHIT][13] , \LEDR_link_f[PHIT][12] , 
        \LEDR_link_f[PHIT][11] , \LEDR_link_f[PHIT][10] , 
        \LEDR_link_f[PHIT][9] , \LEDR_link_f[PHIT][8] , \LEDR_link_f[PHIT][7] , 
        \LEDR_link_f[PHIT][6] , \LEDR_link_f[PHIT][5] , \LEDR_link_f[PHIT][4] , 
        \LEDR_link_f[PHIT][3] , \LEDR_link_f[PHIT][2] , \LEDR_link_f[PHIT][1] , 
        \LEDR_link_f[PHIT][0] , \LEDR_link_f[PHIT_PARITY][32] , 
        \LEDR_link_f[PHIT_PARITY][31] , \LEDR_link_f[PHIT_PARITY][30] , 
        \LEDR_link_f[PHIT_PARITY][29] , \LEDR_link_f[PHIT_PARITY][28] , 
        \LEDR_link_f[PHIT_PARITY][27] , \LEDR_link_f[PHIT_PARITY][26] , 
        \LEDR_link_f[PHIT_PARITY][25] , \LEDR_link_f[PHIT_PARITY][24] , 
        \LEDR_link_f[PHIT_PARITY][23] , \LEDR_link_f[PHIT_PARITY][22] , 
        \LEDR_link_f[PHIT_PARITY][21] , \LEDR_link_f[PHIT_PARITY][20] , 
        \LEDR_link_f[PHIT_PARITY][19] , \LEDR_link_f[PHIT_PARITY][18] , 
        \LEDR_link_f[PHIT_PARITY][17] , \LEDR_link_f[PHIT_PARITY][16] , 
        \LEDR_link_f[PHIT_PARITY][15] , \LEDR_link_f[PHIT_PARITY][14] , 
        \LEDR_link_f[PHIT_PARITY][13] , \LEDR_link_f[PHIT_PARITY][12] , 
        \LEDR_link_f[PHIT_PARITY][11] , \LEDR_link_f[PHIT_PARITY][10] , 
        \LEDR_link_f[PHIT_PARITY][9] , \LEDR_link_f[PHIT_PARITY][8] , 
        \LEDR_link_f[PHIT_PARITY][7] , \LEDR_link_f[PHIT_PARITY][6] , 
        \LEDR_link_f[PHIT_PARITY][5] , \LEDR_link_f[PHIT_PARITY][4] , 
        \LEDR_link_f[PHIT_PARITY][3] , \LEDR_link_f[PHIT_PARITY][2] , 
        \LEDR_link_f[PHIT_PARITY][1] , \LEDR_link_f[PHIT_PARITY][0] }), 
    .LEDR_link_b(\LEDR_link_b[ACK] ) );
  input preset, \bundled_ch_f[REQ] , \bundled_ch_f[DATA][33] ,
         \bundled_ch_f[DATA][32] , \bundled_ch_f[DATA][31] ,
         \bundled_ch_f[DATA][30] , \bundled_ch_f[DATA][29] ,
         \bundled_ch_f[DATA][28] , \bundled_ch_f[DATA][27] ,
         \bundled_ch_f[DATA][26] , \bundled_ch_f[DATA][25] ,
         \bundled_ch_f[DATA][24] , \bundled_ch_f[DATA][23] ,
         \bundled_ch_f[DATA][22] , \bundled_ch_f[DATA][21] ,
         \bundled_ch_f[DATA][20] , \bundled_ch_f[DATA][19] ,
         \bundled_ch_f[DATA][18] , \bundled_ch_f[DATA][17] ,
         \bundled_ch_f[DATA][16] , \bundled_ch_f[DATA][15] ,
         \bundled_ch_f[DATA][14] , \bundled_ch_f[DATA][13] ,
         \bundled_ch_f[DATA][12] , \bundled_ch_f[DATA][11] ,
         \bundled_ch_f[DATA][10] , \bundled_ch_f[DATA][9] ,
         \bundled_ch_f[DATA][8] , \bundled_ch_f[DATA][7] ,
         \bundled_ch_f[DATA][6] , \bundled_ch_f[DATA][5] ,
         \bundled_ch_f[DATA][4] , \bundled_ch_f[DATA][3] ,
         \bundled_ch_f[DATA][2] , \bundled_ch_f[DATA][1] ,
         \bundled_ch_f[DATA][0] , \LEDR_link_b[ACK] ;
  output \bundled_ch_b[ACK] , \LEDR_link_f[TOKEN_T] ,
         \LEDR_link_f[TOKEN_PARITY] , \LEDR_link_f[PHIT][32] ,
         \LEDR_link_f[PHIT][31] , \LEDR_link_f[PHIT][30] ,
         \LEDR_link_f[PHIT][29] , \LEDR_link_f[PHIT][28] ,
         \LEDR_link_f[PHIT][27] , \LEDR_link_f[PHIT][26] ,
         \LEDR_link_f[PHIT][25] , \LEDR_link_f[PHIT][24] ,
         \LEDR_link_f[PHIT][23] , \LEDR_link_f[PHIT][22] ,
         \LEDR_link_f[PHIT][21] , \LEDR_link_f[PHIT][20] ,
         \LEDR_link_f[PHIT][19] , \LEDR_link_f[PHIT][18] ,
         \LEDR_link_f[PHIT][17] , \LEDR_link_f[PHIT][16] ,
         \LEDR_link_f[PHIT][15] , \LEDR_link_f[PHIT][14] ,
         \LEDR_link_f[PHIT][13] , \LEDR_link_f[PHIT][12] ,
         \LEDR_link_f[PHIT][11] , \LEDR_link_f[PHIT][10] ,
         \LEDR_link_f[PHIT][9] , \LEDR_link_f[PHIT][8] ,
         \LEDR_link_f[PHIT][7] , \LEDR_link_f[PHIT][6] ,
         \LEDR_link_f[PHIT][5] , \LEDR_link_f[PHIT][4] ,
         \LEDR_link_f[PHIT][3] , \LEDR_link_f[PHIT][2] ,
         \LEDR_link_f[PHIT][1] , \LEDR_link_f[PHIT][0] ,
         \LEDR_link_f[PHIT_PARITY][32] , \LEDR_link_f[PHIT_PARITY][31] ,
         \LEDR_link_f[PHIT_PARITY][30] , \LEDR_link_f[PHIT_PARITY][29] ,
         \LEDR_link_f[PHIT_PARITY][28] , \LEDR_link_f[PHIT_PARITY][27] ,
         \LEDR_link_f[PHIT_PARITY][26] , \LEDR_link_f[PHIT_PARITY][25] ,
         \LEDR_link_f[PHIT_PARITY][24] , \LEDR_link_f[PHIT_PARITY][23] ,
         \LEDR_link_f[PHIT_PARITY][22] , \LEDR_link_f[PHIT_PARITY][21] ,
         \LEDR_link_f[PHIT_PARITY][20] , \LEDR_link_f[PHIT_PARITY][19] ,
         \LEDR_link_f[PHIT_PARITY][18] , \LEDR_link_f[PHIT_PARITY][17] ,
         \LEDR_link_f[PHIT_PARITY][16] , \LEDR_link_f[PHIT_PARITY][15] ,
         \LEDR_link_f[PHIT_PARITY][14] , \LEDR_link_f[PHIT_PARITY][13] ,
         \LEDR_link_f[PHIT_PARITY][12] , \LEDR_link_f[PHIT_PARITY][11] ,
         \LEDR_link_f[PHIT_PARITY][10] , \LEDR_link_f[PHIT_PARITY][9] ,
         \LEDR_link_f[PHIT_PARITY][8] , \LEDR_link_f[PHIT_PARITY][7] ,
         \LEDR_link_f[PHIT_PARITY][6] , \LEDR_link_f[PHIT_PARITY][5] ,
         \LEDR_link_f[PHIT_PARITY][4] , \LEDR_link_f[PHIT_PARITY][3] ,
         \LEDR_link_f[PHIT_PARITY][2] , \LEDR_link_f[PHIT_PARITY][1] ,
         \LEDR_link_f[PHIT_PARITY][0] ;
  wire   clk, type_out, enabled_clk, N2, data_phase, N5, N6, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11;
  wire   [32:0] data_parity;

  HS65_LS_DFPRQX4 type_out_reg ( .D(\bundled_ch_f[DATA][33] ), .CP(clk), .RN(
        n7), .Q(type_out) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_T]  ( .D(\bundled_ch_f[DATA][33] ), 
        .CP(clk), .RN(n5), .Q(\LEDR_link_f[TOKEN_T] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_PARITY]  ( .D(N2), .CP(clk), .RN(n5), 
        .Q(\LEDR_link_f[TOKEN_PARITY] ) );
  HS65_LS_DFPSQX4 data_phase_reg ( .D(n2), .CP(enabled_clk), .SN(n8), .Q(
        data_phase) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][32]  ( .D(\bundled_ch_f[DATA][32] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][32] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][31]  ( .D(\bundled_ch_f[DATA][31] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][31] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][30]  ( .D(\bundled_ch_f[DATA][30] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][30] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][29]  ( .D(\bundled_ch_f[DATA][29] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][29] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][28]  ( .D(\bundled_ch_f[DATA][28] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][28] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][27]  ( .D(\bundled_ch_f[DATA][27] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][27] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][26]  ( .D(\bundled_ch_f[DATA][26] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][26] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][25]  ( .D(\bundled_ch_f[DATA][25] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][25] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][24]  ( .D(\bundled_ch_f[DATA][24] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][24] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][23]  ( .D(\bundled_ch_f[DATA][23] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][23] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][22]  ( .D(\bundled_ch_f[DATA][22] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][22] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][21]  ( .D(\bundled_ch_f[DATA][21] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][21] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][20]  ( .D(\bundled_ch_f[DATA][20] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][20] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][19]  ( .D(\bundled_ch_f[DATA][19] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][19] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][18]  ( .D(\bundled_ch_f[DATA][18] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][18] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][17]  ( .D(\bundled_ch_f[DATA][17] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][17] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][16]  ( .D(\bundled_ch_f[DATA][16] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][16] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][15]  ( .D(\bundled_ch_f[DATA][15] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][15] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][14]  ( .D(\bundled_ch_f[DATA][14] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][14] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][13]  ( .D(\bundled_ch_f[DATA][13] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][13] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][12]  ( .D(\bundled_ch_f[DATA][12] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][12] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][11]  ( .D(\bundled_ch_f[DATA][11] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][11] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][10]  ( .D(\bundled_ch_f[DATA][10] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][10] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][9]  ( .D(\bundled_ch_f[DATA][9] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][9] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][8]  ( .D(\bundled_ch_f[DATA][8] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][8] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][7]  ( .D(\bundled_ch_f[DATA][7] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][7] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][6]  ( .D(\bundled_ch_f[DATA][6] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][6] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][5]  ( .D(\bundled_ch_f[DATA][5] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][5] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][4]  ( .D(\bundled_ch_f[DATA][4] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][4] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][3]  ( .D(\bundled_ch_f[DATA][3] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][3] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][2]  ( .D(\bundled_ch_f[DATA][2] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][2] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][1]  ( .D(\bundled_ch_f[DATA][1] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][1] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][0]  ( .D(\bundled_ch_f[DATA][0] ), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT][0] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][32]  ( .D(data_parity[32]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][32] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][31]  ( .D(data_parity[31]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][31] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][30]  ( .D(data_parity[30]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][30] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][29]  ( .D(data_parity[29]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][29] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][28]  ( .D(data_parity[28]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][28] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][27]  ( .D(data_parity[27]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][27] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][26]  ( .D(data_parity[26]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][26] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][25]  ( .D(data_parity[25]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][25] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][24]  ( .D(data_parity[24]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][24] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][23]  ( .D(data_parity[23]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][23] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][22]  ( .D(data_parity[22]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][22] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][21]  ( .D(data_parity[21]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][21] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][20]  ( .D(data_parity[20]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][20] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][19]  ( .D(data_parity[19]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][19] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][18]  ( .D(data_parity[18]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][18] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][17]  ( .D(data_parity[17]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][17] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][16]  ( .D(data_parity[16]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][16] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][15]  ( .D(data_parity[15]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][15] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][14]  ( .D(data_parity[14]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][14] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][13]  ( .D(data_parity[13]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][13] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][12]  ( .D(data_parity[12]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][12] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][11]  ( .D(data_parity[11]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][11] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][10]  ( .D(data_parity[10]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][10] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][9]  ( .D(data_parity[9]), .CP(
        enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT_PARITY][9] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][8]  ( .D(data_parity[8]), .CP(
        enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT_PARITY][8] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][7]  ( .D(data_parity[7]), .CP(
        enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT_PARITY][7] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][6]  ( .D(data_parity[6]), .CP(
        enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][6] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][5]  ( .D(data_parity[5]), .CP(
        enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT_PARITY][5] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][4]  ( .D(data_parity[4]), .CP(
        enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT_PARITY][4] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][3]  ( .D(data_parity[3]), .CP(
        enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][3] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][2]  ( .D(data_parity[2]), .CP(
        enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][2] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][1]  ( .D(data_parity[1]), .CP(
        enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT_PARITY][1] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][0]  ( .D(data_parity[0]), .CP(
        enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT_PARITY][0] ) );
  HS65_LS_LDHQX9 ack_reg ( .G(N5), .D(N6), .Q(\bundled_ch_b[ACK] ) );
  HS65_LSS_XOR2X6 C214 ( .A(\LEDR_link_b[ACK] ), .B(\bundled_ch_b[ACK] ), .Z(
        clk) );
  HS65_LS_AND2X9 C215 ( .A(clk), .B(type_out), .Z(enabled_clk) );
  HS65_LS_BFX9 U3 ( .A(preset), .Z(n10) );
  HS65_LS_BFX9 U4 ( .A(preset), .Z(n11) );
  HS65_LS_IVX9 U5 ( .A(n3), .Z(n1) );
  HS65_LS_BFX9 U6 ( .A(n4), .Z(n3) );
  HS65_LSS_XOR2X6 U7 ( .A(\bundled_ch_f[REQ] ), .B(\bundled_ch_f[DATA][33] ), 
        .Z(N2) );
  HS65_LS_BFX9 U8 ( .A(n4), .Z(n2) );
  HS65_LS_IVX9 U9 ( .A(data_phase), .Z(n4) );
  HS65_LSS_XOR2X6 U10 ( .A(n1), .B(\bundled_ch_f[DATA][9] ), .Z(data_parity[9]) );
  HS65_LSS_XOR2X6 U11 ( .A(n1), .B(\bundled_ch_f[DATA][0] ), .Z(data_parity[0]) );
  HS65_LSS_XOR2X6 U12 ( .A(n1), .B(\bundled_ch_f[DATA][1] ), .Z(data_parity[1]) );
  HS65_LSS_XOR2X6 U13 ( .A(data_phase), .B(\bundled_ch_f[DATA][2] ), .Z(
        data_parity[2]) );
  HS65_LSS_XOR2X6 U14 ( .A(n1), .B(\bundled_ch_f[DATA][10] ), .Z(
        data_parity[10]) );
  HS65_LSS_XOR2X6 U15 ( .A(n1), .B(\bundled_ch_f[DATA][11] ), .Z(
        data_parity[11]) );
  HS65_LSS_XOR2X6 U16 ( .A(n1), .B(\bundled_ch_f[DATA][12] ), .Z(
        data_parity[12]) );
  HS65_LSS_XOR2X6 U17 ( .A(n1), .B(\bundled_ch_f[DATA][13] ), .Z(
        data_parity[13]) );
  HS65_LSS_XOR2X6 U18 ( .A(n1), .B(\bundled_ch_f[DATA][14] ), .Z(
        data_parity[14]) );
  HS65_LSS_XOR2X6 U19 ( .A(n1), .B(\bundled_ch_f[DATA][15] ), .Z(
        data_parity[15]) );
  HS65_LSS_XOR2X6 U20 ( .A(n1), .B(\bundled_ch_f[DATA][16] ), .Z(
        data_parity[16]) );
  HS65_LSS_XOR2X6 U21 ( .A(n1), .B(\bundled_ch_f[DATA][17] ), .Z(
        data_parity[17]) );
  HS65_LSS_XOR2X6 U22 ( .A(n1), .B(\bundled_ch_f[DATA][18] ), .Z(
        data_parity[18]) );
  HS65_LSS_XOR2X6 U23 ( .A(n1), .B(\bundled_ch_f[DATA][19] ), .Z(
        data_parity[19]) );
  HS65_LSS_XOR2X6 U24 ( .A(data_phase), .B(\bundled_ch_f[DATA][20] ), .Z(
        data_parity[20]) );
  HS65_LSS_XOR2X6 U25 ( .A(data_phase), .B(\bundled_ch_f[DATA][21] ), .Z(
        data_parity[21]) );
  HS65_LSS_XOR2X6 U26 ( .A(data_phase), .B(\bundled_ch_f[DATA][22] ), .Z(
        data_parity[22]) );
  HS65_LSS_XOR2X6 U27 ( .A(data_phase), .B(\bundled_ch_f[DATA][23] ), .Z(
        data_parity[23]) );
  HS65_LSS_XOR2X6 U28 ( .A(data_phase), .B(\bundled_ch_f[DATA][24] ), .Z(
        data_parity[24]) );
  HS65_LSS_XOR2X6 U29 ( .A(data_phase), .B(\bundled_ch_f[DATA][25] ), .Z(
        data_parity[25]) );
  HS65_LSS_XOR2X6 U30 ( .A(data_phase), .B(\bundled_ch_f[DATA][26] ), .Z(
        data_parity[26]) );
  HS65_LSS_XOR2X6 U31 ( .A(data_phase), .B(\bundled_ch_f[DATA][27] ), .Z(
        data_parity[27]) );
  HS65_LSS_XOR2X6 U32 ( .A(data_phase), .B(\bundled_ch_f[DATA][28] ), .Z(
        data_parity[28]) );
  HS65_LSS_XOR2X6 U33 ( .A(data_phase), .B(\bundled_ch_f[DATA][29] ), .Z(
        data_parity[29]) );
  HS65_LSS_XOR2X6 U34 ( .A(data_phase), .B(\bundled_ch_f[DATA][30] ), .Z(
        data_parity[30]) );
  HS65_LSS_XOR2X6 U35 ( .A(n1), .B(\bundled_ch_f[DATA][31] ), .Z(
        data_parity[31]) );
  HS65_LSS_XOR2X6 U36 ( .A(n1), .B(\bundled_ch_f[DATA][32] ), .Z(
        data_parity[32]) );
  HS65_LSS_XOR2X6 U37 ( .A(data_phase), .B(\bundled_ch_f[DATA][3] ), .Z(
        data_parity[3]) );
  HS65_LSS_XOR2X6 U38 ( .A(data_phase), .B(\bundled_ch_f[DATA][4] ), .Z(
        data_parity[4]) );
  HS65_LSS_XOR2X6 U39 ( .A(data_phase), .B(\bundled_ch_f[DATA][5] ), .Z(
        data_parity[5]) );
  HS65_LSS_XOR2X6 U40 ( .A(data_phase), .B(\bundled_ch_f[DATA][6] ), .Z(
        data_parity[6]) );
  HS65_LSS_XOR2X6 U41 ( .A(data_phase), .B(\bundled_ch_f[DATA][7] ), .Z(
        data_parity[7]) );
  HS65_LSS_XOR2X6 U42 ( .A(data_phase), .B(\bundled_ch_f[DATA][8] ), .Z(
        data_parity[8]) );
  HS65_LS_IVX9 U43 ( .A(n10), .Z(n6) );
  HS65_LS_IVX9 U44 ( .A(n10), .Z(n5) );
  HS65_LS_IVX9 U45 ( .A(n10), .Z(n7) );
  HS65_LS_IVX9 U46 ( .A(n11), .Z(n9) );
  HS65_LS_IVX9 U47 ( .A(n11), .Z(n8) );
  HS65_LS_NOR2AX3 U48 ( .A(\bundled_ch_f[REQ] ), .B(n10), .Z(N6) );
  HS65_LS_NAND2AX7 U49 ( .A(n11), .B(clk), .Z(N5) );
endmodule


module bundled2LEDR_3 ( preset, .bundled_ch_f({\bundled_ch_f[REQ] , 
        \bundled_ch_f[DATA][33] , \bundled_ch_f[DATA][32] , 
        \bundled_ch_f[DATA][31] , \bundled_ch_f[DATA][30] , 
        \bundled_ch_f[DATA][29] , \bundled_ch_f[DATA][28] , 
        \bundled_ch_f[DATA][27] , \bundled_ch_f[DATA][26] , 
        \bundled_ch_f[DATA][25] , \bundled_ch_f[DATA][24] , 
        \bundled_ch_f[DATA][23] , \bundled_ch_f[DATA][22] , 
        \bundled_ch_f[DATA][21] , \bundled_ch_f[DATA][20] , 
        \bundled_ch_f[DATA][19] , \bundled_ch_f[DATA][18] , 
        \bundled_ch_f[DATA][17] , \bundled_ch_f[DATA][16] , 
        \bundled_ch_f[DATA][15] , \bundled_ch_f[DATA][14] , 
        \bundled_ch_f[DATA][13] , \bundled_ch_f[DATA][12] , 
        \bundled_ch_f[DATA][11] , \bundled_ch_f[DATA][10] , 
        \bundled_ch_f[DATA][9] , \bundled_ch_f[DATA][8] , 
        \bundled_ch_f[DATA][7] , \bundled_ch_f[DATA][6] , 
        \bundled_ch_f[DATA][5] , \bundled_ch_f[DATA][4] , 
        \bundled_ch_f[DATA][3] , \bundled_ch_f[DATA][2] , 
        \bundled_ch_f[DATA][1] , \bundled_ch_f[DATA][0] }), .bundled_ch_b(
        \bundled_ch_b[ACK] ), .LEDR_link_f({\LEDR_link_f[TOKEN_T] , 
        \LEDR_link_f[TOKEN_PARITY] , \LEDR_link_f[PHIT][32] , 
        \LEDR_link_f[PHIT][31] , \LEDR_link_f[PHIT][30] , 
        \LEDR_link_f[PHIT][29] , \LEDR_link_f[PHIT][28] , 
        \LEDR_link_f[PHIT][27] , \LEDR_link_f[PHIT][26] , 
        \LEDR_link_f[PHIT][25] , \LEDR_link_f[PHIT][24] , 
        \LEDR_link_f[PHIT][23] , \LEDR_link_f[PHIT][22] , 
        \LEDR_link_f[PHIT][21] , \LEDR_link_f[PHIT][20] , 
        \LEDR_link_f[PHIT][19] , \LEDR_link_f[PHIT][18] , 
        \LEDR_link_f[PHIT][17] , \LEDR_link_f[PHIT][16] , 
        \LEDR_link_f[PHIT][15] , \LEDR_link_f[PHIT][14] , 
        \LEDR_link_f[PHIT][13] , \LEDR_link_f[PHIT][12] , 
        \LEDR_link_f[PHIT][11] , \LEDR_link_f[PHIT][10] , 
        \LEDR_link_f[PHIT][9] , \LEDR_link_f[PHIT][8] , \LEDR_link_f[PHIT][7] , 
        \LEDR_link_f[PHIT][6] , \LEDR_link_f[PHIT][5] , \LEDR_link_f[PHIT][4] , 
        \LEDR_link_f[PHIT][3] , \LEDR_link_f[PHIT][2] , \LEDR_link_f[PHIT][1] , 
        \LEDR_link_f[PHIT][0] , \LEDR_link_f[PHIT_PARITY][32] , 
        \LEDR_link_f[PHIT_PARITY][31] , \LEDR_link_f[PHIT_PARITY][30] , 
        \LEDR_link_f[PHIT_PARITY][29] , \LEDR_link_f[PHIT_PARITY][28] , 
        \LEDR_link_f[PHIT_PARITY][27] , \LEDR_link_f[PHIT_PARITY][26] , 
        \LEDR_link_f[PHIT_PARITY][25] , \LEDR_link_f[PHIT_PARITY][24] , 
        \LEDR_link_f[PHIT_PARITY][23] , \LEDR_link_f[PHIT_PARITY][22] , 
        \LEDR_link_f[PHIT_PARITY][21] , \LEDR_link_f[PHIT_PARITY][20] , 
        \LEDR_link_f[PHIT_PARITY][19] , \LEDR_link_f[PHIT_PARITY][18] , 
        \LEDR_link_f[PHIT_PARITY][17] , \LEDR_link_f[PHIT_PARITY][16] , 
        \LEDR_link_f[PHIT_PARITY][15] , \LEDR_link_f[PHIT_PARITY][14] , 
        \LEDR_link_f[PHIT_PARITY][13] , \LEDR_link_f[PHIT_PARITY][12] , 
        \LEDR_link_f[PHIT_PARITY][11] , \LEDR_link_f[PHIT_PARITY][10] , 
        \LEDR_link_f[PHIT_PARITY][9] , \LEDR_link_f[PHIT_PARITY][8] , 
        \LEDR_link_f[PHIT_PARITY][7] , \LEDR_link_f[PHIT_PARITY][6] , 
        \LEDR_link_f[PHIT_PARITY][5] , \LEDR_link_f[PHIT_PARITY][4] , 
        \LEDR_link_f[PHIT_PARITY][3] , \LEDR_link_f[PHIT_PARITY][2] , 
        \LEDR_link_f[PHIT_PARITY][1] , \LEDR_link_f[PHIT_PARITY][0] }), 
    .LEDR_link_b(\LEDR_link_b[ACK] ) );
  input preset, \bundled_ch_f[REQ] , \bundled_ch_f[DATA][33] ,
         \bundled_ch_f[DATA][32] , \bundled_ch_f[DATA][31] ,
         \bundled_ch_f[DATA][30] , \bundled_ch_f[DATA][29] ,
         \bundled_ch_f[DATA][28] , \bundled_ch_f[DATA][27] ,
         \bundled_ch_f[DATA][26] , \bundled_ch_f[DATA][25] ,
         \bundled_ch_f[DATA][24] , \bundled_ch_f[DATA][23] ,
         \bundled_ch_f[DATA][22] , \bundled_ch_f[DATA][21] ,
         \bundled_ch_f[DATA][20] , \bundled_ch_f[DATA][19] ,
         \bundled_ch_f[DATA][18] , \bundled_ch_f[DATA][17] ,
         \bundled_ch_f[DATA][16] , \bundled_ch_f[DATA][15] ,
         \bundled_ch_f[DATA][14] , \bundled_ch_f[DATA][13] ,
         \bundled_ch_f[DATA][12] , \bundled_ch_f[DATA][11] ,
         \bundled_ch_f[DATA][10] , \bundled_ch_f[DATA][9] ,
         \bundled_ch_f[DATA][8] , \bundled_ch_f[DATA][7] ,
         \bundled_ch_f[DATA][6] , \bundled_ch_f[DATA][5] ,
         \bundled_ch_f[DATA][4] , \bundled_ch_f[DATA][3] ,
         \bundled_ch_f[DATA][2] , \bundled_ch_f[DATA][1] ,
         \bundled_ch_f[DATA][0] , \LEDR_link_b[ACK] ;
  output \bundled_ch_b[ACK] , \LEDR_link_f[TOKEN_T] ,
         \LEDR_link_f[TOKEN_PARITY] , \LEDR_link_f[PHIT][32] ,
         \LEDR_link_f[PHIT][31] , \LEDR_link_f[PHIT][30] ,
         \LEDR_link_f[PHIT][29] , \LEDR_link_f[PHIT][28] ,
         \LEDR_link_f[PHIT][27] , \LEDR_link_f[PHIT][26] ,
         \LEDR_link_f[PHIT][25] , \LEDR_link_f[PHIT][24] ,
         \LEDR_link_f[PHIT][23] , \LEDR_link_f[PHIT][22] ,
         \LEDR_link_f[PHIT][21] , \LEDR_link_f[PHIT][20] ,
         \LEDR_link_f[PHIT][19] , \LEDR_link_f[PHIT][18] ,
         \LEDR_link_f[PHIT][17] , \LEDR_link_f[PHIT][16] ,
         \LEDR_link_f[PHIT][15] , \LEDR_link_f[PHIT][14] ,
         \LEDR_link_f[PHIT][13] , \LEDR_link_f[PHIT][12] ,
         \LEDR_link_f[PHIT][11] , \LEDR_link_f[PHIT][10] ,
         \LEDR_link_f[PHIT][9] , \LEDR_link_f[PHIT][8] ,
         \LEDR_link_f[PHIT][7] , \LEDR_link_f[PHIT][6] ,
         \LEDR_link_f[PHIT][5] , \LEDR_link_f[PHIT][4] ,
         \LEDR_link_f[PHIT][3] , \LEDR_link_f[PHIT][2] ,
         \LEDR_link_f[PHIT][1] , \LEDR_link_f[PHIT][0] ,
         \LEDR_link_f[PHIT_PARITY][32] , \LEDR_link_f[PHIT_PARITY][31] ,
         \LEDR_link_f[PHIT_PARITY][30] , \LEDR_link_f[PHIT_PARITY][29] ,
         \LEDR_link_f[PHIT_PARITY][28] , \LEDR_link_f[PHIT_PARITY][27] ,
         \LEDR_link_f[PHIT_PARITY][26] , \LEDR_link_f[PHIT_PARITY][25] ,
         \LEDR_link_f[PHIT_PARITY][24] , \LEDR_link_f[PHIT_PARITY][23] ,
         \LEDR_link_f[PHIT_PARITY][22] , \LEDR_link_f[PHIT_PARITY][21] ,
         \LEDR_link_f[PHIT_PARITY][20] , \LEDR_link_f[PHIT_PARITY][19] ,
         \LEDR_link_f[PHIT_PARITY][18] , \LEDR_link_f[PHIT_PARITY][17] ,
         \LEDR_link_f[PHIT_PARITY][16] , \LEDR_link_f[PHIT_PARITY][15] ,
         \LEDR_link_f[PHIT_PARITY][14] , \LEDR_link_f[PHIT_PARITY][13] ,
         \LEDR_link_f[PHIT_PARITY][12] , \LEDR_link_f[PHIT_PARITY][11] ,
         \LEDR_link_f[PHIT_PARITY][10] , \LEDR_link_f[PHIT_PARITY][9] ,
         \LEDR_link_f[PHIT_PARITY][8] , \LEDR_link_f[PHIT_PARITY][7] ,
         \LEDR_link_f[PHIT_PARITY][6] , \LEDR_link_f[PHIT_PARITY][5] ,
         \LEDR_link_f[PHIT_PARITY][4] , \LEDR_link_f[PHIT_PARITY][3] ,
         \LEDR_link_f[PHIT_PARITY][2] , \LEDR_link_f[PHIT_PARITY][1] ,
         \LEDR_link_f[PHIT_PARITY][0] ;
  wire   clk, type_out, enabled_clk, N2, data_phase, N5, N6, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11;
  wire   [32:0] data_parity;

  HS65_LS_DFPRQX4 type_out_reg ( .D(\bundled_ch_f[DATA][33] ), .CP(clk), .RN(
        n7), .Q(type_out) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_T]  ( .D(\bundled_ch_f[DATA][33] ), 
        .CP(clk), .RN(n5), .Q(\LEDR_link_f[TOKEN_T] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_PARITY]  ( .D(N2), .CP(clk), .RN(n5), 
        .Q(\LEDR_link_f[TOKEN_PARITY] ) );
  HS65_LS_DFPSQX4 data_phase_reg ( .D(n2), .CP(enabled_clk), .SN(n8), .Q(
        data_phase) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][32]  ( .D(\bundled_ch_f[DATA][32] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][32] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][31]  ( .D(\bundled_ch_f[DATA][31] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][31] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][30]  ( .D(\bundled_ch_f[DATA][30] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][30] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][29]  ( .D(\bundled_ch_f[DATA][29] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][29] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][28]  ( .D(\bundled_ch_f[DATA][28] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][28] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][27]  ( .D(\bundled_ch_f[DATA][27] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][27] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][26]  ( .D(\bundled_ch_f[DATA][26] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][26] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][25]  ( .D(\bundled_ch_f[DATA][25] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][25] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][24]  ( .D(\bundled_ch_f[DATA][24] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][24] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][23]  ( .D(\bundled_ch_f[DATA][23] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][23] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][22]  ( .D(\bundled_ch_f[DATA][22] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][22] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][21]  ( .D(\bundled_ch_f[DATA][21] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][21] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][20]  ( .D(\bundled_ch_f[DATA][20] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][20] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][19]  ( .D(\bundled_ch_f[DATA][19] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][19] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][18]  ( .D(\bundled_ch_f[DATA][18] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][18] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][17]  ( .D(\bundled_ch_f[DATA][17] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][17] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][16]  ( .D(\bundled_ch_f[DATA][16] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][16] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][15]  ( .D(\bundled_ch_f[DATA][15] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][15] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][14]  ( .D(\bundled_ch_f[DATA][14] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][14] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][13]  ( .D(\bundled_ch_f[DATA][13] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][13] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][12]  ( .D(\bundled_ch_f[DATA][12] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][12] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][11]  ( .D(\bundled_ch_f[DATA][11] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][11] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][10]  ( .D(\bundled_ch_f[DATA][10] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][10] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][9]  ( .D(\bundled_ch_f[DATA][9] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][9] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][8]  ( .D(\bundled_ch_f[DATA][8] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][8] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][7]  ( .D(\bundled_ch_f[DATA][7] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][7] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][6]  ( .D(\bundled_ch_f[DATA][6] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][6] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][5]  ( .D(\bundled_ch_f[DATA][5] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][5] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][4]  ( .D(\bundled_ch_f[DATA][4] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][4] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][3]  ( .D(\bundled_ch_f[DATA][3] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][3] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][2]  ( .D(\bundled_ch_f[DATA][2] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][2] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][1]  ( .D(\bundled_ch_f[DATA][1] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][1] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][0]  ( .D(\bundled_ch_f[DATA][0] ), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT][0] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][32]  ( .D(data_parity[32]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][32] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][31]  ( .D(data_parity[31]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][31] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][30]  ( .D(data_parity[30]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][30] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][29]  ( .D(data_parity[29]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][29] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][28]  ( .D(data_parity[28]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][28] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][27]  ( .D(data_parity[27]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][27] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][26]  ( .D(data_parity[26]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][26] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][25]  ( .D(data_parity[25]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][25] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][24]  ( .D(data_parity[24]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][24] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][23]  ( .D(data_parity[23]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][23] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][22]  ( .D(data_parity[22]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][22] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][21]  ( .D(data_parity[21]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][21] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][20]  ( .D(data_parity[20]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][20] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][19]  ( .D(data_parity[19]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][19] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][18]  ( .D(data_parity[18]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][18] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][17]  ( .D(data_parity[17]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][17] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][16]  ( .D(data_parity[16]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][16] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][15]  ( .D(data_parity[15]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][15] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][14]  ( .D(data_parity[14]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][14] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][13]  ( .D(data_parity[13]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][13] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][12]  ( .D(data_parity[12]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][12] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][11]  ( .D(data_parity[11]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][11] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][10]  ( .D(data_parity[10]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][10] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][9]  ( .D(data_parity[9]), .CP(
        enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT_PARITY][9] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][8]  ( .D(data_parity[8]), .CP(
        enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT_PARITY][8] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][7]  ( .D(data_parity[7]), .CP(
        enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT_PARITY][7] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][6]  ( .D(data_parity[6]), .CP(
        enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][6] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][5]  ( .D(data_parity[5]), .CP(
        enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT_PARITY][5] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][4]  ( .D(data_parity[4]), .CP(
        enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT_PARITY][4] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][3]  ( .D(data_parity[3]), .CP(
        enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][3] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][2]  ( .D(data_parity[2]), .CP(
        enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][2] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][1]  ( .D(data_parity[1]), .CP(
        enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT_PARITY][1] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][0]  ( .D(data_parity[0]), .CP(
        enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT_PARITY][0] ) );
  HS65_LS_LDHQX9 ack_reg ( .G(N5), .D(N6), .Q(\bundled_ch_b[ACK] ) );
  HS65_LSS_XOR2X6 C214 ( .A(\LEDR_link_b[ACK] ), .B(\bundled_ch_b[ACK] ), .Z(
        clk) );
  HS65_LS_AND2X9 C215 ( .A(clk), .B(type_out), .Z(enabled_clk) );
  HS65_LS_BFX9 U3 ( .A(preset), .Z(n10) );
  HS65_LS_BFX9 U4 ( .A(preset), .Z(n11) );
  HS65_LS_IVX9 U5 ( .A(n3), .Z(n1) );
  HS65_LS_BFX9 U6 ( .A(n4), .Z(n3) );
  HS65_LSS_XOR2X6 U7 ( .A(\bundled_ch_f[REQ] ), .B(\bundled_ch_f[DATA][33] ), 
        .Z(N2) );
  HS65_LS_BFX9 U8 ( .A(n4), .Z(n2) );
  HS65_LS_IVX9 U9 ( .A(data_phase), .Z(n4) );
  HS65_LSS_XOR2X6 U10 ( .A(n1), .B(\bundled_ch_f[DATA][9] ), .Z(data_parity[9]) );
  HS65_LSS_XOR2X6 U11 ( .A(n1), .B(\bundled_ch_f[DATA][0] ), .Z(data_parity[0]) );
  HS65_LSS_XOR2X6 U12 ( .A(n1), .B(\bundled_ch_f[DATA][1] ), .Z(data_parity[1]) );
  HS65_LSS_XOR2X6 U13 ( .A(data_phase), .B(\bundled_ch_f[DATA][2] ), .Z(
        data_parity[2]) );
  HS65_LSS_XOR2X6 U14 ( .A(n1), .B(\bundled_ch_f[DATA][10] ), .Z(
        data_parity[10]) );
  HS65_LSS_XOR2X6 U15 ( .A(n1), .B(\bundled_ch_f[DATA][11] ), .Z(
        data_parity[11]) );
  HS65_LSS_XOR2X6 U16 ( .A(n1), .B(\bundled_ch_f[DATA][12] ), .Z(
        data_parity[12]) );
  HS65_LSS_XOR2X6 U17 ( .A(n1), .B(\bundled_ch_f[DATA][13] ), .Z(
        data_parity[13]) );
  HS65_LSS_XOR2X6 U18 ( .A(n1), .B(\bundled_ch_f[DATA][14] ), .Z(
        data_parity[14]) );
  HS65_LSS_XOR2X6 U19 ( .A(n1), .B(\bundled_ch_f[DATA][15] ), .Z(
        data_parity[15]) );
  HS65_LSS_XOR2X6 U20 ( .A(n1), .B(\bundled_ch_f[DATA][16] ), .Z(
        data_parity[16]) );
  HS65_LSS_XOR2X6 U21 ( .A(n1), .B(\bundled_ch_f[DATA][17] ), .Z(
        data_parity[17]) );
  HS65_LSS_XOR2X6 U22 ( .A(n1), .B(\bundled_ch_f[DATA][18] ), .Z(
        data_parity[18]) );
  HS65_LSS_XOR2X6 U23 ( .A(n1), .B(\bundled_ch_f[DATA][19] ), .Z(
        data_parity[19]) );
  HS65_LSS_XOR2X6 U24 ( .A(data_phase), .B(\bundled_ch_f[DATA][20] ), .Z(
        data_parity[20]) );
  HS65_LSS_XOR2X6 U25 ( .A(data_phase), .B(\bundled_ch_f[DATA][21] ), .Z(
        data_parity[21]) );
  HS65_LSS_XOR2X6 U26 ( .A(data_phase), .B(\bundled_ch_f[DATA][22] ), .Z(
        data_parity[22]) );
  HS65_LSS_XOR2X6 U27 ( .A(data_phase), .B(\bundled_ch_f[DATA][23] ), .Z(
        data_parity[23]) );
  HS65_LSS_XOR2X6 U28 ( .A(data_phase), .B(\bundled_ch_f[DATA][24] ), .Z(
        data_parity[24]) );
  HS65_LSS_XOR2X6 U29 ( .A(data_phase), .B(\bundled_ch_f[DATA][25] ), .Z(
        data_parity[25]) );
  HS65_LSS_XOR2X6 U30 ( .A(data_phase), .B(\bundled_ch_f[DATA][26] ), .Z(
        data_parity[26]) );
  HS65_LSS_XOR2X6 U31 ( .A(data_phase), .B(\bundled_ch_f[DATA][27] ), .Z(
        data_parity[27]) );
  HS65_LSS_XOR2X6 U32 ( .A(data_phase), .B(\bundled_ch_f[DATA][28] ), .Z(
        data_parity[28]) );
  HS65_LSS_XOR2X6 U33 ( .A(data_phase), .B(\bundled_ch_f[DATA][29] ), .Z(
        data_parity[29]) );
  HS65_LSS_XOR2X6 U34 ( .A(data_phase), .B(\bundled_ch_f[DATA][30] ), .Z(
        data_parity[30]) );
  HS65_LSS_XOR2X6 U35 ( .A(n1), .B(\bundled_ch_f[DATA][31] ), .Z(
        data_parity[31]) );
  HS65_LSS_XOR2X6 U36 ( .A(n1), .B(\bundled_ch_f[DATA][32] ), .Z(
        data_parity[32]) );
  HS65_LSS_XOR2X6 U37 ( .A(data_phase), .B(\bundled_ch_f[DATA][3] ), .Z(
        data_parity[3]) );
  HS65_LSS_XOR2X6 U38 ( .A(data_phase), .B(\bundled_ch_f[DATA][4] ), .Z(
        data_parity[4]) );
  HS65_LSS_XOR2X6 U39 ( .A(data_phase), .B(\bundled_ch_f[DATA][5] ), .Z(
        data_parity[5]) );
  HS65_LSS_XOR2X6 U40 ( .A(data_phase), .B(\bundled_ch_f[DATA][6] ), .Z(
        data_parity[6]) );
  HS65_LSS_XOR2X6 U41 ( .A(data_phase), .B(\bundled_ch_f[DATA][7] ), .Z(
        data_parity[7]) );
  HS65_LSS_XOR2X6 U42 ( .A(data_phase), .B(\bundled_ch_f[DATA][8] ), .Z(
        data_parity[8]) );
  HS65_LS_IVX9 U43 ( .A(n10), .Z(n6) );
  HS65_LS_IVX9 U44 ( .A(n10), .Z(n5) );
  HS65_LS_IVX9 U45 ( .A(n10), .Z(n7) );
  HS65_LS_IVX9 U46 ( .A(n11), .Z(n9) );
  HS65_LS_IVX9 U47 ( .A(n11), .Z(n8) );
  HS65_LS_NOR2AX3 U48 ( .A(\bundled_ch_f[REQ] ), .B(n10), .Z(N6) );
  HS65_LS_NAND2AX7 U49 ( .A(n11), .B(clk), .Z(N5) );
endmodule


module bundled2LEDR_4 ( preset, .bundled_ch_f({\bundled_ch_f[REQ] , 
        \bundled_ch_f[DATA][33] , \bundled_ch_f[DATA][32] , 
        \bundled_ch_f[DATA][31] , \bundled_ch_f[DATA][30] , 
        \bundled_ch_f[DATA][29] , \bundled_ch_f[DATA][28] , 
        \bundled_ch_f[DATA][27] , \bundled_ch_f[DATA][26] , 
        \bundled_ch_f[DATA][25] , \bundled_ch_f[DATA][24] , 
        \bundled_ch_f[DATA][23] , \bundled_ch_f[DATA][22] , 
        \bundled_ch_f[DATA][21] , \bundled_ch_f[DATA][20] , 
        \bundled_ch_f[DATA][19] , \bundled_ch_f[DATA][18] , 
        \bundled_ch_f[DATA][17] , \bundled_ch_f[DATA][16] , 
        \bundled_ch_f[DATA][15] , \bundled_ch_f[DATA][14] , 
        \bundled_ch_f[DATA][13] , \bundled_ch_f[DATA][12] , 
        \bundled_ch_f[DATA][11] , \bundled_ch_f[DATA][10] , 
        \bundled_ch_f[DATA][9] , \bundled_ch_f[DATA][8] , 
        \bundled_ch_f[DATA][7] , \bundled_ch_f[DATA][6] , 
        \bundled_ch_f[DATA][5] , \bundled_ch_f[DATA][4] , 
        \bundled_ch_f[DATA][3] , \bundled_ch_f[DATA][2] , 
        \bundled_ch_f[DATA][1] , \bundled_ch_f[DATA][0] }), .bundled_ch_b(
        \bundled_ch_b[ACK] ), .LEDR_link_f({\LEDR_link_f[TOKEN_T] , 
        \LEDR_link_f[TOKEN_PARITY] , \LEDR_link_f[PHIT][32] , 
        \LEDR_link_f[PHIT][31] , \LEDR_link_f[PHIT][30] , 
        \LEDR_link_f[PHIT][29] , \LEDR_link_f[PHIT][28] , 
        \LEDR_link_f[PHIT][27] , \LEDR_link_f[PHIT][26] , 
        \LEDR_link_f[PHIT][25] , \LEDR_link_f[PHIT][24] , 
        \LEDR_link_f[PHIT][23] , \LEDR_link_f[PHIT][22] , 
        \LEDR_link_f[PHIT][21] , \LEDR_link_f[PHIT][20] , 
        \LEDR_link_f[PHIT][19] , \LEDR_link_f[PHIT][18] , 
        \LEDR_link_f[PHIT][17] , \LEDR_link_f[PHIT][16] , 
        \LEDR_link_f[PHIT][15] , \LEDR_link_f[PHIT][14] , 
        \LEDR_link_f[PHIT][13] , \LEDR_link_f[PHIT][12] , 
        \LEDR_link_f[PHIT][11] , \LEDR_link_f[PHIT][10] , 
        \LEDR_link_f[PHIT][9] , \LEDR_link_f[PHIT][8] , \LEDR_link_f[PHIT][7] , 
        \LEDR_link_f[PHIT][6] , \LEDR_link_f[PHIT][5] , \LEDR_link_f[PHIT][4] , 
        \LEDR_link_f[PHIT][3] , \LEDR_link_f[PHIT][2] , \LEDR_link_f[PHIT][1] , 
        \LEDR_link_f[PHIT][0] , \LEDR_link_f[PHIT_PARITY][32] , 
        \LEDR_link_f[PHIT_PARITY][31] , \LEDR_link_f[PHIT_PARITY][30] , 
        \LEDR_link_f[PHIT_PARITY][29] , \LEDR_link_f[PHIT_PARITY][28] , 
        \LEDR_link_f[PHIT_PARITY][27] , \LEDR_link_f[PHIT_PARITY][26] , 
        \LEDR_link_f[PHIT_PARITY][25] , \LEDR_link_f[PHIT_PARITY][24] , 
        \LEDR_link_f[PHIT_PARITY][23] , \LEDR_link_f[PHIT_PARITY][22] , 
        \LEDR_link_f[PHIT_PARITY][21] , \LEDR_link_f[PHIT_PARITY][20] , 
        \LEDR_link_f[PHIT_PARITY][19] , \LEDR_link_f[PHIT_PARITY][18] , 
        \LEDR_link_f[PHIT_PARITY][17] , \LEDR_link_f[PHIT_PARITY][16] , 
        \LEDR_link_f[PHIT_PARITY][15] , \LEDR_link_f[PHIT_PARITY][14] , 
        \LEDR_link_f[PHIT_PARITY][13] , \LEDR_link_f[PHIT_PARITY][12] , 
        \LEDR_link_f[PHIT_PARITY][11] , \LEDR_link_f[PHIT_PARITY][10] , 
        \LEDR_link_f[PHIT_PARITY][9] , \LEDR_link_f[PHIT_PARITY][8] , 
        \LEDR_link_f[PHIT_PARITY][7] , \LEDR_link_f[PHIT_PARITY][6] , 
        \LEDR_link_f[PHIT_PARITY][5] , \LEDR_link_f[PHIT_PARITY][4] , 
        \LEDR_link_f[PHIT_PARITY][3] , \LEDR_link_f[PHIT_PARITY][2] , 
        \LEDR_link_f[PHIT_PARITY][1] , \LEDR_link_f[PHIT_PARITY][0] }), 
    .LEDR_link_b(\LEDR_link_b[ACK] ) );
  input preset, \bundled_ch_f[REQ] , \bundled_ch_f[DATA][33] ,
         \bundled_ch_f[DATA][32] , \bundled_ch_f[DATA][31] ,
         \bundled_ch_f[DATA][30] , \bundled_ch_f[DATA][29] ,
         \bundled_ch_f[DATA][28] , \bundled_ch_f[DATA][27] ,
         \bundled_ch_f[DATA][26] , \bundled_ch_f[DATA][25] ,
         \bundled_ch_f[DATA][24] , \bundled_ch_f[DATA][23] ,
         \bundled_ch_f[DATA][22] , \bundled_ch_f[DATA][21] ,
         \bundled_ch_f[DATA][20] , \bundled_ch_f[DATA][19] ,
         \bundled_ch_f[DATA][18] , \bundled_ch_f[DATA][17] ,
         \bundled_ch_f[DATA][16] , \bundled_ch_f[DATA][15] ,
         \bundled_ch_f[DATA][14] , \bundled_ch_f[DATA][13] ,
         \bundled_ch_f[DATA][12] , \bundled_ch_f[DATA][11] ,
         \bundled_ch_f[DATA][10] , \bundled_ch_f[DATA][9] ,
         \bundled_ch_f[DATA][8] , \bundled_ch_f[DATA][7] ,
         \bundled_ch_f[DATA][6] , \bundled_ch_f[DATA][5] ,
         \bundled_ch_f[DATA][4] , \bundled_ch_f[DATA][3] ,
         \bundled_ch_f[DATA][2] , \bundled_ch_f[DATA][1] ,
         \bundled_ch_f[DATA][0] , \LEDR_link_b[ACK] ;
  output \bundled_ch_b[ACK] , \LEDR_link_f[TOKEN_T] ,
         \LEDR_link_f[TOKEN_PARITY] , \LEDR_link_f[PHIT][32] ,
         \LEDR_link_f[PHIT][31] , \LEDR_link_f[PHIT][30] ,
         \LEDR_link_f[PHIT][29] , \LEDR_link_f[PHIT][28] ,
         \LEDR_link_f[PHIT][27] , \LEDR_link_f[PHIT][26] ,
         \LEDR_link_f[PHIT][25] , \LEDR_link_f[PHIT][24] ,
         \LEDR_link_f[PHIT][23] , \LEDR_link_f[PHIT][22] ,
         \LEDR_link_f[PHIT][21] , \LEDR_link_f[PHIT][20] ,
         \LEDR_link_f[PHIT][19] , \LEDR_link_f[PHIT][18] ,
         \LEDR_link_f[PHIT][17] , \LEDR_link_f[PHIT][16] ,
         \LEDR_link_f[PHIT][15] , \LEDR_link_f[PHIT][14] ,
         \LEDR_link_f[PHIT][13] , \LEDR_link_f[PHIT][12] ,
         \LEDR_link_f[PHIT][11] , \LEDR_link_f[PHIT][10] ,
         \LEDR_link_f[PHIT][9] , \LEDR_link_f[PHIT][8] ,
         \LEDR_link_f[PHIT][7] , \LEDR_link_f[PHIT][6] ,
         \LEDR_link_f[PHIT][5] , \LEDR_link_f[PHIT][4] ,
         \LEDR_link_f[PHIT][3] , \LEDR_link_f[PHIT][2] ,
         \LEDR_link_f[PHIT][1] , \LEDR_link_f[PHIT][0] ,
         \LEDR_link_f[PHIT_PARITY][32] , \LEDR_link_f[PHIT_PARITY][31] ,
         \LEDR_link_f[PHIT_PARITY][30] , \LEDR_link_f[PHIT_PARITY][29] ,
         \LEDR_link_f[PHIT_PARITY][28] , \LEDR_link_f[PHIT_PARITY][27] ,
         \LEDR_link_f[PHIT_PARITY][26] , \LEDR_link_f[PHIT_PARITY][25] ,
         \LEDR_link_f[PHIT_PARITY][24] , \LEDR_link_f[PHIT_PARITY][23] ,
         \LEDR_link_f[PHIT_PARITY][22] , \LEDR_link_f[PHIT_PARITY][21] ,
         \LEDR_link_f[PHIT_PARITY][20] , \LEDR_link_f[PHIT_PARITY][19] ,
         \LEDR_link_f[PHIT_PARITY][18] , \LEDR_link_f[PHIT_PARITY][17] ,
         \LEDR_link_f[PHIT_PARITY][16] , \LEDR_link_f[PHIT_PARITY][15] ,
         \LEDR_link_f[PHIT_PARITY][14] , \LEDR_link_f[PHIT_PARITY][13] ,
         \LEDR_link_f[PHIT_PARITY][12] , \LEDR_link_f[PHIT_PARITY][11] ,
         \LEDR_link_f[PHIT_PARITY][10] , \LEDR_link_f[PHIT_PARITY][9] ,
         \LEDR_link_f[PHIT_PARITY][8] , \LEDR_link_f[PHIT_PARITY][7] ,
         \LEDR_link_f[PHIT_PARITY][6] , \LEDR_link_f[PHIT_PARITY][5] ,
         \LEDR_link_f[PHIT_PARITY][4] , \LEDR_link_f[PHIT_PARITY][3] ,
         \LEDR_link_f[PHIT_PARITY][2] , \LEDR_link_f[PHIT_PARITY][1] ,
         \LEDR_link_f[PHIT_PARITY][0] ;
  wire   clk, type_out, enabled_clk, N2, data_phase, N5, N6, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11;
  wire   [32:0] data_parity;

  HS65_LS_DFPRQX4 type_out_reg ( .D(\bundled_ch_f[DATA][33] ), .CP(clk), .RN(
        n7), .Q(type_out) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_T]  ( .D(\bundled_ch_f[DATA][33] ), 
        .CP(clk), .RN(n5), .Q(\LEDR_link_f[TOKEN_T] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_PARITY]  ( .D(N2), .CP(clk), .RN(n5), 
        .Q(\LEDR_link_f[TOKEN_PARITY] ) );
  HS65_LS_DFPSQX4 data_phase_reg ( .D(n2), .CP(enabled_clk), .SN(n8), .Q(
        data_phase) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][32]  ( .D(\bundled_ch_f[DATA][32] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][32] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][31]  ( .D(\bundled_ch_f[DATA][31] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][31] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][30]  ( .D(\bundled_ch_f[DATA][30] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][30] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][29]  ( .D(\bundled_ch_f[DATA][29] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][29] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][28]  ( .D(\bundled_ch_f[DATA][28] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][28] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][27]  ( .D(\bundled_ch_f[DATA][27] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][27] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][26]  ( .D(\bundled_ch_f[DATA][26] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][26] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][25]  ( .D(\bundled_ch_f[DATA][25] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][25] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][24]  ( .D(\bundled_ch_f[DATA][24] ), 
        .CP(enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT][24] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][23]  ( .D(\bundled_ch_f[DATA][23] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][23] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][22]  ( .D(\bundled_ch_f[DATA][22] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][22] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][21]  ( .D(\bundled_ch_f[DATA][21] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][21] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][20]  ( .D(\bundled_ch_f[DATA][20] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][20] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][19]  ( .D(\bundled_ch_f[DATA][19] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][19] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][18]  ( .D(\bundled_ch_f[DATA][18] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][18] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][17]  ( .D(\bundled_ch_f[DATA][17] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][17] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][16]  ( .D(\bundled_ch_f[DATA][16] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][16] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][15]  ( .D(\bundled_ch_f[DATA][15] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][15] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][14]  ( .D(\bundled_ch_f[DATA][14] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][14] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][13]  ( .D(\bundled_ch_f[DATA][13] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][13] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][12]  ( .D(\bundled_ch_f[DATA][12] ), 
        .CP(enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT][12] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][11]  ( .D(\bundled_ch_f[DATA][11] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][11] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][10]  ( .D(\bundled_ch_f[DATA][10] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][10] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][9]  ( .D(\bundled_ch_f[DATA][9] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][9] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][8]  ( .D(\bundled_ch_f[DATA][8] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][8] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][7]  ( .D(\bundled_ch_f[DATA][7] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][7] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][6]  ( .D(\bundled_ch_f[DATA][6] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][6] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][5]  ( .D(\bundled_ch_f[DATA][5] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][5] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][4]  ( .D(\bundled_ch_f[DATA][4] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][4] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][3]  ( .D(\bundled_ch_f[DATA][3] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][3] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][2]  ( .D(\bundled_ch_f[DATA][2] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][2] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][1]  ( .D(\bundled_ch_f[DATA][1] ), 
        .CP(enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT][1] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][0]  ( .D(\bundled_ch_f[DATA][0] ), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT][0] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][32]  ( .D(data_parity[32]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][32] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][31]  ( .D(data_parity[31]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][31] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][30]  ( .D(data_parity[30]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][30] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][29]  ( .D(data_parity[29]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][29] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][28]  ( .D(data_parity[28]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][28] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][27]  ( .D(data_parity[27]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][27] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][26]  ( .D(data_parity[26]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][26] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][25]  ( .D(data_parity[25]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][25] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][24]  ( .D(data_parity[24]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][24] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][23]  ( .D(data_parity[23]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][23] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][22]  ( .D(data_parity[22]), 
        .CP(enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][22] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][21]  ( .D(data_parity[21]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][21] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][20]  ( .D(data_parity[20]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][20] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][19]  ( .D(data_parity[19]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][19] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][18]  ( .D(data_parity[18]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][18] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][17]  ( .D(data_parity[17]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][17] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][16]  ( .D(data_parity[16]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][16] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][15]  ( .D(data_parity[15]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][15] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][14]  ( .D(data_parity[14]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][14] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][13]  ( .D(data_parity[13]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][13] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][12]  ( .D(data_parity[12]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][12] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][11]  ( .D(data_parity[11]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][11] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][10]  ( .D(data_parity[10]), 
        .CP(enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][10] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][9]  ( .D(data_parity[9]), .CP(
        enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT_PARITY][9] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][8]  ( .D(data_parity[8]), .CP(
        enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT_PARITY][8] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][7]  ( .D(data_parity[7]), .CP(
        enabled_clk), .RN(n6), .Q(\LEDR_link_f[PHIT_PARITY][7] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][6]  ( .D(data_parity[6]), .CP(
        enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][6] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][5]  ( .D(data_parity[5]), .CP(
        enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT_PARITY][5] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][4]  ( .D(data_parity[4]), .CP(
        enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT_PARITY][4] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][3]  ( .D(data_parity[3]), .CP(
        enabled_clk), .RN(n9), .Q(\LEDR_link_f[PHIT_PARITY][3] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][2]  ( .D(data_parity[2]), .CP(
        enabled_clk), .RN(n8), .Q(\LEDR_link_f[PHIT_PARITY][2] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][1]  ( .D(data_parity[1]), .CP(
        enabled_clk), .RN(n7), .Q(\LEDR_link_f[PHIT_PARITY][1] ) );
  HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][0]  ( .D(data_parity[0]), .CP(
        enabled_clk), .RN(n5), .Q(\LEDR_link_f[PHIT_PARITY][0] ) );
  HS65_LS_LDHQX9 ack_reg ( .G(N5), .D(N6), .Q(\bundled_ch_b[ACK] ) );
  HS65_LSS_XOR2X6 C214 ( .A(\LEDR_link_b[ACK] ), .B(\bundled_ch_b[ACK] ), .Z(
        clk) );
  HS65_LS_AND2X9 C215 ( .A(clk), .B(type_out), .Z(enabled_clk) );
  HS65_LS_BFX9 U3 ( .A(preset), .Z(n10) );
  HS65_LS_BFX9 U4 ( .A(preset), .Z(n11) );
  HS65_LS_IVX9 U5 ( .A(n3), .Z(n1) );
  HS65_LS_BFX9 U6 ( .A(n4), .Z(n3) );
  HS65_LSS_XOR2X6 U7 ( .A(\bundled_ch_f[REQ] ), .B(\bundled_ch_f[DATA][33] ), 
        .Z(N2) );
  HS65_LS_BFX9 U8 ( .A(n4), .Z(n2) );
  HS65_LS_IVX9 U9 ( .A(data_phase), .Z(n4) );
  HS65_LSS_XOR2X6 U10 ( .A(n1), .B(\bundled_ch_f[DATA][9] ), .Z(data_parity[9]) );
  HS65_LSS_XOR2X6 U11 ( .A(n1), .B(\bundled_ch_f[DATA][0] ), .Z(data_parity[0]) );
  HS65_LSS_XOR2X6 U12 ( .A(n1), .B(\bundled_ch_f[DATA][1] ), .Z(data_parity[1]) );
  HS65_LSS_XOR2X6 U13 ( .A(data_phase), .B(\bundled_ch_f[DATA][2] ), .Z(
        data_parity[2]) );
  HS65_LSS_XOR2X6 U14 ( .A(n1), .B(\bundled_ch_f[DATA][10] ), .Z(
        data_parity[10]) );
  HS65_LSS_XOR2X6 U15 ( .A(n1), .B(\bundled_ch_f[DATA][11] ), .Z(
        data_parity[11]) );
  HS65_LSS_XOR2X6 U16 ( .A(n1), .B(\bundled_ch_f[DATA][12] ), .Z(
        data_parity[12]) );
  HS65_LSS_XOR2X6 U17 ( .A(n1), .B(\bundled_ch_f[DATA][13] ), .Z(
        data_parity[13]) );
  HS65_LSS_XOR2X6 U18 ( .A(n1), .B(\bundled_ch_f[DATA][14] ), .Z(
        data_parity[14]) );
  HS65_LSS_XOR2X6 U19 ( .A(n1), .B(\bundled_ch_f[DATA][15] ), .Z(
        data_parity[15]) );
  HS65_LSS_XOR2X6 U20 ( .A(n1), .B(\bundled_ch_f[DATA][16] ), .Z(
        data_parity[16]) );
  HS65_LSS_XOR2X6 U21 ( .A(n1), .B(\bundled_ch_f[DATA][17] ), .Z(
        data_parity[17]) );
  HS65_LSS_XOR2X6 U22 ( .A(n1), .B(\bundled_ch_f[DATA][18] ), .Z(
        data_parity[18]) );
  HS65_LSS_XOR2X6 U23 ( .A(n1), .B(\bundled_ch_f[DATA][19] ), .Z(
        data_parity[19]) );
  HS65_LSS_XOR2X6 U24 ( .A(data_phase), .B(\bundled_ch_f[DATA][20] ), .Z(
        data_parity[20]) );
  HS65_LSS_XOR2X6 U25 ( .A(data_phase), .B(\bundled_ch_f[DATA][21] ), .Z(
        data_parity[21]) );
  HS65_LSS_XOR2X6 U26 ( .A(data_phase), .B(\bundled_ch_f[DATA][22] ), .Z(
        data_parity[22]) );
  HS65_LSS_XOR2X6 U27 ( .A(data_phase), .B(\bundled_ch_f[DATA][23] ), .Z(
        data_parity[23]) );
  HS65_LSS_XOR2X6 U28 ( .A(data_phase), .B(\bundled_ch_f[DATA][24] ), .Z(
        data_parity[24]) );
  HS65_LSS_XOR2X6 U29 ( .A(data_phase), .B(\bundled_ch_f[DATA][25] ), .Z(
        data_parity[25]) );
  HS65_LSS_XOR2X6 U30 ( .A(data_phase), .B(\bundled_ch_f[DATA][26] ), .Z(
        data_parity[26]) );
  HS65_LSS_XOR2X6 U31 ( .A(data_phase), .B(\bundled_ch_f[DATA][27] ), .Z(
        data_parity[27]) );
  HS65_LSS_XOR2X6 U32 ( .A(data_phase), .B(\bundled_ch_f[DATA][28] ), .Z(
        data_parity[28]) );
  HS65_LSS_XOR2X6 U33 ( .A(data_phase), .B(\bundled_ch_f[DATA][29] ), .Z(
        data_parity[29]) );
  HS65_LSS_XOR2X6 U34 ( .A(data_phase), .B(\bundled_ch_f[DATA][30] ), .Z(
        data_parity[30]) );
  HS65_LSS_XOR2X6 U35 ( .A(n1), .B(\bundled_ch_f[DATA][31] ), .Z(
        data_parity[31]) );
  HS65_LSS_XOR2X6 U36 ( .A(n1), .B(\bundled_ch_f[DATA][32] ), .Z(
        data_parity[32]) );
  HS65_LSS_XOR2X6 U37 ( .A(data_phase), .B(\bundled_ch_f[DATA][3] ), .Z(
        data_parity[3]) );
  HS65_LSS_XOR2X6 U38 ( .A(data_phase), .B(\bundled_ch_f[DATA][4] ), .Z(
        data_parity[4]) );
  HS65_LSS_XOR2X6 U39 ( .A(data_phase), .B(\bundled_ch_f[DATA][5] ), .Z(
        data_parity[5]) );
  HS65_LSS_XOR2X6 U40 ( .A(data_phase), .B(\bundled_ch_f[DATA][6] ), .Z(
        data_parity[6]) );
  HS65_LSS_XOR2X6 U41 ( .A(data_phase), .B(\bundled_ch_f[DATA][7] ), .Z(
        data_parity[7]) );
  HS65_LSS_XOR2X6 U42 ( .A(data_phase), .B(\bundled_ch_f[DATA][8] ), .Z(
        data_parity[8]) );
  HS65_LS_IVX9 U43 ( .A(n10), .Z(n6) );
  HS65_LS_IVX9 U44 ( .A(n10), .Z(n5) );
  HS65_LS_IVX9 U45 ( .A(n10), .Z(n7) );
  HS65_LS_IVX9 U46 ( .A(n11), .Z(n9) );
  HS65_LS_IVX9 U47 ( .A(n11), .Z(n8) );
  HS65_LS_NOR2AX3 U48 ( .A(\bundled_ch_f[REQ] ), .B(n10), .Z(N6) );
  HS65_LS_NAND2AX7 U49 ( .A(n11), .B(clk), .Z(N5) );
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
    .latches_out_f({\latches_out_f[4][TOKEN_T] , 
        \latches_out_f[4][TOKEN_PARITY] , \latches_out_f[4][PHIT][32] , 
        \latches_out_f[4][PHIT][31] , \latches_out_f[4][PHIT][30] , 
        \latches_out_f[4][PHIT][29] , \latches_out_f[4][PHIT][28] , 
        \latches_out_f[4][PHIT][27] , \latches_out_f[4][PHIT][26] , 
        \latches_out_f[4][PHIT][25] , \latches_out_f[4][PHIT][24] , 
        \latches_out_f[4][PHIT][23] , \latches_out_f[4][PHIT][22] , 
        \latches_out_f[4][PHIT][21] , \latches_out_f[4][PHIT][20] , 
        \latches_out_f[4][PHIT][19] , \latches_out_f[4][PHIT][18] , 
        \latches_out_f[4][PHIT][17] , \latches_out_f[4][PHIT][16] , 
        \latches_out_f[4][PHIT][15] , \latches_out_f[4][PHIT][14] , 
        \latches_out_f[4][PHIT][13] , \latches_out_f[4][PHIT][12] , 
        \latches_out_f[4][PHIT][11] , \latches_out_f[4][PHIT][10] , 
        \latches_out_f[4][PHIT][9] , \latches_out_f[4][PHIT][8] , 
        \latches_out_f[4][PHIT][7] , \latches_out_f[4][PHIT][6] , 
        \latches_out_f[4][PHIT][5] , \latches_out_f[4][PHIT][4] , 
        \latches_out_f[4][PHIT][3] , \latches_out_f[4][PHIT][2] , 
        \latches_out_f[4][PHIT][1] , \latches_out_f[4][PHIT][0] , 
        \latches_out_f[4][PHIT_PARITY][32] , 
        \latches_out_f[4][PHIT_PARITY][31] , 
        \latches_out_f[4][PHIT_PARITY][30] , 
        \latches_out_f[4][PHIT_PARITY][29] , 
        \latches_out_f[4][PHIT_PARITY][28] , 
        \latches_out_f[4][PHIT_PARITY][27] , 
        \latches_out_f[4][PHIT_PARITY][26] , 
        \latches_out_f[4][PHIT_PARITY][25] , 
        \latches_out_f[4][PHIT_PARITY][24] , 
        \latches_out_f[4][PHIT_PARITY][23] , 
        \latches_out_f[4][PHIT_PARITY][22] , 
        \latches_out_f[4][PHIT_PARITY][21] , 
        \latches_out_f[4][PHIT_PARITY][20] , 
        \latches_out_f[4][PHIT_PARITY][19] , 
        \latches_out_f[4][PHIT_PARITY][18] , 
        \latches_out_f[4][PHIT_PARITY][17] , 
        \latches_out_f[4][PHIT_PARITY][16] , 
        \latches_out_f[4][PHIT_PARITY][15] , 
        \latches_out_f[4][PHIT_PARITY][14] , 
        \latches_out_f[4][PHIT_PARITY][13] , 
        \latches_out_f[4][PHIT_PARITY][12] , 
        \latches_out_f[4][PHIT_PARITY][11] , 
        \latches_out_f[4][PHIT_PARITY][10] , 
        \latches_out_f[4][PHIT_PARITY][9] , \latches_out_f[4][PHIT_PARITY][8] , 
        \latches_out_f[4][PHIT_PARITY][7] , \latches_out_f[4][PHIT_PARITY][6] , 
        \latches_out_f[4][PHIT_PARITY][5] , \latches_out_f[4][PHIT_PARITY][4] , 
        \latches_out_f[4][PHIT_PARITY][3] , \latches_out_f[4][PHIT_PARITY][2] , 
        \latches_out_f[4][PHIT_PARITY][1] , \latches_out_f[4][PHIT_PARITY][0] , 
        \latches_out_f[3][TOKEN_T] , \latches_out_f[3][TOKEN_PARITY] , 
        \latches_out_f[3][PHIT][32] , \latches_out_f[3][PHIT][31] , 
        \latches_out_f[3][PHIT][30] , \latches_out_f[3][PHIT][29] , 
        \latches_out_f[3][PHIT][28] , \latches_out_f[3][PHIT][27] , 
        \latches_out_f[3][PHIT][26] , \latches_out_f[3][PHIT][25] , 
        \latches_out_f[3][PHIT][24] , \latches_out_f[3][PHIT][23] , 
        \latches_out_f[3][PHIT][22] , \latches_out_f[3][PHIT][21] , 
        \latches_out_f[3][PHIT][20] , \latches_out_f[3][PHIT][19] , 
        \latches_out_f[3][PHIT][18] , \latches_out_f[3][PHIT][17] , 
        \latches_out_f[3][PHIT][16] , \latches_out_f[3][PHIT][15] , 
        \latches_out_f[3][PHIT][14] , \latches_out_f[3][PHIT][13] , 
        \latches_out_f[3][PHIT][12] , \latches_out_f[3][PHIT][11] , 
        \latches_out_f[3][PHIT][10] , \latches_out_f[3][PHIT][9] , 
        \latches_out_f[3][PHIT][8] , \latches_out_f[3][PHIT][7] , 
        \latches_out_f[3][PHIT][6] , \latches_out_f[3][PHIT][5] , 
        \latches_out_f[3][PHIT][4] , \latches_out_f[3][PHIT][3] , 
        \latches_out_f[3][PHIT][2] , \latches_out_f[3][PHIT][1] , 
        \latches_out_f[3][PHIT][0] , \latches_out_f[3][PHIT_PARITY][32] , 
        \latches_out_f[3][PHIT_PARITY][31] , 
        \latches_out_f[3][PHIT_PARITY][30] , 
        \latches_out_f[3][PHIT_PARITY][29] , 
        \latches_out_f[3][PHIT_PARITY][28] , 
        \latches_out_f[3][PHIT_PARITY][27] , 
        \latches_out_f[3][PHIT_PARITY][26] , 
        \latches_out_f[3][PHIT_PARITY][25] , 
        \latches_out_f[3][PHIT_PARITY][24] , 
        \latches_out_f[3][PHIT_PARITY][23] , 
        \latches_out_f[3][PHIT_PARITY][22] , 
        \latches_out_f[3][PHIT_PARITY][21] , 
        \latches_out_f[3][PHIT_PARITY][20] , 
        \latches_out_f[3][PHIT_PARITY][19] , 
        \latches_out_f[3][PHIT_PARITY][18] , 
        \latches_out_f[3][PHIT_PARITY][17] , 
        \latches_out_f[3][PHIT_PARITY][16] , 
        \latches_out_f[3][PHIT_PARITY][15] , 
        \latches_out_f[3][PHIT_PARITY][14] , 
        \latches_out_f[3][PHIT_PARITY][13] , 
        \latches_out_f[3][PHIT_PARITY][12] , 
        \latches_out_f[3][PHIT_PARITY][11] , 
        \latches_out_f[3][PHIT_PARITY][10] , 
        \latches_out_f[3][PHIT_PARITY][9] , \latches_out_f[3][PHIT_PARITY][8] , 
        \latches_out_f[3][PHIT_PARITY][7] , \latches_out_f[3][PHIT_PARITY][6] , 
        \latches_out_f[3][PHIT_PARITY][5] , \latches_out_f[3][PHIT_PARITY][4] , 
        \latches_out_f[3][PHIT_PARITY][3] , \latches_out_f[3][PHIT_PARITY][2] , 
        \latches_out_f[3][PHIT_PARITY][1] , \latches_out_f[3][PHIT_PARITY][0] , 
        \latches_out_f[2][TOKEN_T] , \latches_out_f[2][TOKEN_PARITY] , 
        \latches_out_f[2][PHIT][32] , \latches_out_f[2][PHIT][31] , 
        \latches_out_f[2][PHIT][30] , \latches_out_f[2][PHIT][29] , 
        \latches_out_f[2][PHIT][28] , \latches_out_f[2][PHIT][27] , 
        \latches_out_f[2][PHIT][26] , \latches_out_f[2][PHIT][25] , 
        \latches_out_f[2][PHIT][24] , \latches_out_f[2][PHIT][23] , 
        \latches_out_f[2][PHIT][22] , \latches_out_f[2][PHIT][21] , 
        \latches_out_f[2][PHIT][20] , \latches_out_f[2][PHIT][19] , 
        \latches_out_f[2][PHIT][18] , \latches_out_f[2][PHIT][17] , 
        \latches_out_f[2][PHIT][16] , \latches_out_f[2][PHIT][15] , 
        \latches_out_f[2][PHIT][14] , \latches_out_f[2][PHIT][13] , 
        \latches_out_f[2][PHIT][12] , \latches_out_f[2][PHIT][11] , 
        \latches_out_f[2][PHIT][10] , \latches_out_f[2][PHIT][9] , 
        \latches_out_f[2][PHIT][8] , \latches_out_f[2][PHIT][7] , 
        \latches_out_f[2][PHIT][6] , \latches_out_f[2][PHIT][5] , 
        \latches_out_f[2][PHIT][4] , \latches_out_f[2][PHIT][3] , 
        \latches_out_f[2][PHIT][2] , \latches_out_f[2][PHIT][1] , 
        \latches_out_f[2][PHIT][0] , \latches_out_f[2][PHIT_PARITY][32] , 
        \latches_out_f[2][PHIT_PARITY][31] , 
        \latches_out_f[2][PHIT_PARITY][30] , 
        \latches_out_f[2][PHIT_PARITY][29] , 
        \latches_out_f[2][PHIT_PARITY][28] , 
        \latches_out_f[2][PHIT_PARITY][27] , 
        \latches_out_f[2][PHIT_PARITY][26] , 
        \latches_out_f[2][PHIT_PARITY][25] , 
        \latches_out_f[2][PHIT_PARITY][24] , 
        \latches_out_f[2][PHIT_PARITY][23] , 
        \latches_out_f[2][PHIT_PARITY][22] , 
        \latches_out_f[2][PHIT_PARITY][21] , 
        \latches_out_f[2][PHIT_PARITY][20] , 
        \latches_out_f[2][PHIT_PARITY][19] , 
        \latches_out_f[2][PHIT_PARITY][18] , 
        \latches_out_f[2][PHIT_PARITY][17] , 
        \latches_out_f[2][PHIT_PARITY][16] , 
        \latches_out_f[2][PHIT_PARITY][15] , 
        \latches_out_f[2][PHIT_PARITY][14] , 
        \latches_out_f[2][PHIT_PARITY][13] , 
        \latches_out_f[2][PHIT_PARITY][12] , 
        \latches_out_f[2][PHIT_PARITY][11] , 
        \latches_out_f[2][PHIT_PARITY][10] , 
        \latches_out_f[2][PHIT_PARITY][9] , \latches_out_f[2][PHIT_PARITY][8] , 
        \latches_out_f[2][PHIT_PARITY][7] , \latches_out_f[2][PHIT_PARITY][6] , 
        \latches_out_f[2][PHIT_PARITY][5] , \latches_out_f[2][PHIT_PARITY][4] , 
        \latches_out_f[2][PHIT_PARITY][3] , \latches_out_f[2][PHIT_PARITY][2] , 
        \latches_out_f[2][PHIT_PARITY][1] , \latches_out_f[2][PHIT_PARITY][0] , 
        \latches_out_f[1][TOKEN_T] , \latches_out_f[1][TOKEN_PARITY] , 
        \latches_out_f[1][PHIT][32] , \latches_out_f[1][PHIT][31] , 
        \latches_out_f[1][PHIT][30] , \latches_out_f[1][PHIT][29] , 
        \latches_out_f[1][PHIT][28] , \latches_out_f[1][PHIT][27] , 
        \latches_out_f[1][PHIT][26] , \latches_out_f[1][PHIT][25] , 
        \latches_out_f[1][PHIT][24] , \latches_out_f[1][PHIT][23] , 
        \latches_out_f[1][PHIT][22] , \latches_out_f[1][PHIT][21] , 
        \latches_out_f[1][PHIT][20] , \latches_out_f[1][PHIT][19] , 
        \latches_out_f[1][PHIT][18] , \latches_out_f[1][PHIT][17] , 
        \latches_out_f[1][PHIT][16] , \latches_out_f[1][PHIT][15] , 
        \latches_out_f[1][PHIT][14] , \latches_out_f[1][PHIT][13] , 
        \latches_out_f[1][PHIT][12] , \latches_out_f[1][PHIT][11] , 
        \latches_out_f[1][PHIT][10] , \latches_out_f[1][PHIT][9] , 
        \latches_out_f[1][PHIT][8] , \latches_out_f[1][PHIT][7] , 
        \latches_out_f[1][PHIT][6] , \latches_out_f[1][PHIT][5] , 
        \latches_out_f[1][PHIT][4] , \latches_out_f[1][PHIT][3] , 
        \latches_out_f[1][PHIT][2] , \latches_out_f[1][PHIT][1] , 
        \latches_out_f[1][PHIT][0] , \latches_out_f[1][PHIT_PARITY][32] , 
        \latches_out_f[1][PHIT_PARITY][31] , 
        \latches_out_f[1][PHIT_PARITY][30] , 
        \latches_out_f[1][PHIT_PARITY][29] , 
        \latches_out_f[1][PHIT_PARITY][28] , 
        \latches_out_f[1][PHIT_PARITY][27] , 
        \latches_out_f[1][PHIT_PARITY][26] , 
        \latches_out_f[1][PHIT_PARITY][25] , 
        \latches_out_f[1][PHIT_PARITY][24] , 
        \latches_out_f[1][PHIT_PARITY][23] , 
        \latches_out_f[1][PHIT_PARITY][22] , 
        \latches_out_f[1][PHIT_PARITY][21] , 
        \latches_out_f[1][PHIT_PARITY][20] , 
        \latches_out_f[1][PHIT_PARITY][19] , 
        \latches_out_f[1][PHIT_PARITY][18] , 
        \latches_out_f[1][PHIT_PARITY][17] , 
        \latches_out_f[1][PHIT_PARITY][16] , 
        \latches_out_f[1][PHIT_PARITY][15] , 
        \latches_out_f[1][PHIT_PARITY][14] , 
        \latches_out_f[1][PHIT_PARITY][13] , 
        \latches_out_f[1][PHIT_PARITY][12] , 
        \latches_out_f[1][PHIT_PARITY][11] , 
        \latches_out_f[1][PHIT_PARITY][10] , 
        \latches_out_f[1][PHIT_PARITY][9] , \latches_out_f[1][PHIT_PARITY][8] , 
        \latches_out_f[1][PHIT_PARITY][7] , \latches_out_f[1][PHIT_PARITY][6] , 
        \latches_out_f[1][PHIT_PARITY][5] , \latches_out_f[1][PHIT_PARITY][4] , 
        \latches_out_f[1][PHIT_PARITY][3] , \latches_out_f[1][PHIT_PARITY][2] , 
        \latches_out_f[1][PHIT_PARITY][1] , \latches_out_f[1][PHIT_PARITY][0] , 
        \latches_out_f[0][TOKEN_T] , \latches_out_f[0][TOKEN_PARITY] , 
        \latches_out_f[0][PHIT][32] , \latches_out_f[0][PHIT][31] , 
        \latches_out_f[0][PHIT][30] , \latches_out_f[0][PHIT][29] , 
        \latches_out_f[0][PHIT][28] , \latches_out_f[0][PHIT][27] , 
        \latches_out_f[0][PHIT][26] , \latches_out_f[0][PHIT][25] , 
        \latches_out_f[0][PHIT][24] , \latches_out_f[0][PHIT][23] , 
        \latches_out_f[0][PHIT][22] , \latches_out_f[0][PHIT][21] , 
        \latches_out_f[0][PHIT][20] , \latches_out_f[0][PHIT][19] , 
        \latches_out_f[0][PHIT][18] , \latches_out_f[0][PHIT][17] , 
        \latches_out_f[0][PHIT][16] , \latches_out_f[0][PHIT][15] , 
        \latches_out_f[0][PHIT][14] , \latches_out_f[0][PHIT][13] , 
        \latches_out_f[0][PHIT][12] , \latches_out_f[0][PHIT][11] , 
        \latches_out_f[0][PHIT][10] , \latches_out_f[0][PHIT][9] , 
        \latches_out_f[0][PHIT][8] , \latches_out_f[0][PHIT][7] , 
        \latches_out_f[0][PHIT][6] , \latches_out_f[0][PHIT][5] , 
        \latches_out_f[0][PHIT][4] , \latches_out_f[0][PHIT][3] , 
        \latches_out_f[0][PHIT][2] , \latches_out_f[0][PHIT][1] , 
        \latches_out_f[0][PHIT][0] , \latches_out_f[0][PHIT_PARITY][32] , 
        \latches_out_f[0][PHIT_PARITY][31] , 
        \latches_out_f[0][PHIT_PARITY][30] , 
        \latches_out_f[0][PHIT_PARITY][29] , 
        \latches_out_f[0][PHIT_PARITY][28] , 
        \latches_out_f[0][PHIT_PARITY][27] , 
        \latches_out_f[0][PHIT_PARITY][26] , 
        \latches_out_f[0][PHIT_PARITY][25] , 
        \latches_out_f[0][PHIT_PARITY][24] , 
        \latches_out_f[0][PHIT_PARITY][23] , 
        \latches_out_f[0][PHIT_PARITY][22] , 
        \latches_out_f[0][PHIT_PARITY][21] , 
        \latches_out_f[0][PHIT_PARITY][20] , 
        \latches_out_f[0][PHIT_PARITY][19] , 
        \latches_out_f[0][PHIT_PARITY][18] , 
        \latches_out_f[0][PHIT_PARITY][17] , 
        \latches_out_f[0][PHIT_PARITY][16] , 
        \latches_out_f[0][PHIT_PARITY][15] , 
        \latches_out_f[0][PHIT_PARITY][14] , 
        \latches_out_f[0][PHIT_PARITY][13] , 
        \latches_out_f[0][PHIT_PARITY][12] , 
        \latches_out_f[0][PHIT_PARITY][11] , 
        \latches_out_f[0][PHIT_PARITY][10] , 
        \latches_out_f[0][PHIT_PARITY][9] , \latches_out_f[0][PHIT_PARITY][8] , 
        \latches_out_f[0][PHIT_PARITY][7] , \latches_out_f[0][PHIT_PARITY][6] , 
        \latches_out_f[0][PHIT_PARITY][5] , \latches_out_f[0][PHIT_PARITY][4] , 
        \latches_out_f[0][PHIT_PARITY][3] , \latches_out_f[0][PHIT_PARITY][2] , 
        \latches_out_f[0][PHIT_PARITY][1] , \latches_out_f[0][PHIT_PARITY][0] 
        }), .latches_out_b({\latches_out_b[4][ACK] , \latches_out_b[3][ACK] , 
        \latches_out_b[2][ACK] , \latches_out_b[1][ACK] , 
        \latches_out_b[0][ACK] }) );
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
         \chs_in_b[1][ACK] , \chs_in_b[0][ACK] , \latches_out_f[4][TOKEN_T] ,
         \latches_out_f[4][TOKEN_PARITY] , \latches_out_f[4][PHIT][32] ,
         \latches_out_f[4][PHIT][31] , \latches_out_f[4][PHIT][30] ,
         \latches_out_f[4][PHIT][29] , \latches_out_f[4][PHIT][28] ,
         \latches_out_f[4][PHIT][27] , \latches_out_f[4][PHIT][26] ,
         \latches_out_f[4][PHIT][25] , \latches_out_f[4][PHIT][24] ,
         \latches_out_f[4][PHIT][23] , \latches_out_f[4][PHIT][22] ,
         \latches_out_f[4][PHIT][21] , \latches_out_f[4][PHIT][20] ,
         \latches_out_f[4][PHIT][19] , \latches_out_f[4][PHIT][18] ,
         \latches_out_f[4][PHIT][17] , \latches_out_f[4][PHIT][16] ,
         \latches_out_f[4][PHIT][15] , \latches_out_f[4][PHIT][14] ,
         \latches_out_f[4][PHIT][13] , \latches_out_f[4][PHIT][12] ,
         \latches_out_f[4][PHIT][11] , \latches_out_f[4][PHIT][10] ,
         \latches_out_f[4][PHIT][9] , \latches_out_f[4][PHIT][8] ,
         \latches_out_f[4][PHIT][7] , \latches_out_f[4][PHIT][6] ,
         \latches_out_f[4][PHIT][5] , \latches_out_f[4][PHIT][4] ,
         \latches_out_f[4][PHIT][3] , \latches_out_f[4][PHIT][2] ,
         \latches_out_f[4][PHIT][1] , \latches_out_f[4][PHIT][0] ,
         \latches_out_f[4][PHIT_PARITY][32] ,
         \latches_out_f[4][PHIT_PARITY][31] ,
         \latches_out_f[4][PHIT_PARITY][30] ,
         \latches_out_f[4][PHIT_PARITY][29] ,
         \latches_out_f[4][PHIT_PARITY][28] ,
         \latches_out_f[4][PHIT_PARITY][27] ,
         \latches_out_f[4][PHIT_PARITY][26] ,
         \latches_out_f[4][PHIT_PARITY][25] ,
         \latches_out_f[4][PHIT_PARITY][24] ,
         \latches_out_f[4][PHIT_PARITY][23] ,
         \latches_out_f[4][PHIT_PARITY][22] ,
         \latches_out_f[4][PHIT_PARITY][21] ,
         \latches_out_f[4][PHIT_PARITY][20] ,
         \latches_out_f[4][PHIT_PARITY][19] ,
         \latches_out_f[4][PHIT_PARITY][18] ,
         \latches_out_f[4][PHIT_PARITY][17] ,
         \latches_out_f[4][PHIT_PARITY][16] ,
         \latches_out_f[4][PHIT_PARITY][15] ,
         \latches_out_f[4][PHIT_PARITY][14] ,
         \latches_out_f[4][PHIT_PARITY][13] ,
         \latches_out_f[4][PHIT_PARITY][12] ,
         \latches_out_f[4][PHIT_PARITY][11] ,
         \latches_out_f[4][PHIT_PARITY][10] ,
         \latches_out_f[4][PHIT_PARITY][9] ,
         \latches_out_f[4][PHIT_PARITY][8] ,
         \latches_out_f[4][PHIT_PARITY][7] ,
         \latches_out_f[4][PHIT_PARITY][6] ,
         \latches_out_f[4][PHIT_PARITY][5] ,
         \latches_out_f[4][PHIT_PARITY][4] ,
         \latches_out_f[4][PHIT_PARITY][3] ,
         \latches_out_f[4][PHIT_PARITY][2] ,
         \latches_out_f[4][PHIT_PARITY][1] ,
         \latches_out_f[4][PHIT_PARITY][0] , \latches_out_f[3][TOKEN_T] ,
         \latches_out_f[3][TOKEN_PARITY] , \latches_out_f[3][PHIT][32] ,
         \latches_out_f[3][PHIT][31] , \latches_out_f[3][PHIT][30] ,
         \latches_out_f[3][PHIT][29] , \latches_out_f[3][PHIT][28] ,
         \latches_out_f[3][PHIT][27] , \latches_out_f[3][PHIT][26] ,
         \latches_out_f[3][PHIT][25] , \latches_out_f[3][PHIT][24] ,
         \latches_out_f[3][PHIT][23] , \latches_out_f[3][PHIT][22] ,
         \latches_out_f[3][PHIT][21] , \latches_out_f[3][PHIT][20] ,
         \latches_out_f[3][PHIT][19] , \latches_out_f[3][PHIT][18] ,
         \latches_out_f[3][PHIT][17] , \latches_out_f[3][PHIT][16] ,
         \latches_out_f[3][PHIT][15] , \latches_out_f[3][PHIT][14] ,
         \latches_out_f[3][PHIT][13] , \latches_out_f[3][PHIT][12] ,
         \latches_out_f[3][PHIT][11] , \latches_out_f[3][PHIT][10] ,
         \latches_out_f[3][PHIT][9] , \latches_out_f[3][PHIT][8] ,
         \latches_out_f[3][PHIT][7] , \latches_out_f[3][PHIT][6] ,
         \latches_out_f[3][PHIT][5] , \latches_out_f[3][PHIT][4] ,
         \latches_out_f[3][PHIT][3] , \latches_out_f[3][PHIT][2] ,
         \latches_out_f[3][PHIT][1] , \latches_out_f[3][PHIT][0] ,
         \latches_out_f[3][PHIT_PARITY][32] ,
         \latches_out_f[3][PHIT_PARITY][31] ,
         \latches_out_f[3][PHIT_PARITY][30] ,
         \latches_out_f[3][PHIT_PARITY][29] ,
         \latches_out_f[3][PHIT_PARITY][28] ,
         \latches_out_f[3][PHIT_PARITY][27] ,
         \latches_out_f[3][PHIT_PARITY][26] ,
         \latches_out_f[3][PHIT_PARITY][25] ,
         \latches_out_f[3][PHIT_PARITY][24] ,
         \latches_out_f[3][PHIT_PARITY][23] ,
         \latches_out_f[3][PHIT_PARITY][22] ,
         \latches_out_f[3][PHIT_PARITY][21] ,
         \latches_out_f[3][PHIT_PARITY][20] ,
         \latches_out_f[3][PHIT_PARITY][19] ,
         \latches_out_f[3][PHIT_PARITY][18] ,
         \latches_out_f[3][PHIT_PARITY][17] ,
         \latches_out_f[3][PHIT_PARITY][16] ,
         \latches_out_f[3][PHIT_PARITY][15] ,
         \latches_out_f[3][PHIT_PARITY][14] ,
         \latches_out_f[3][PHIT_PARITY][13] ,
         \latches_out_f[3][PHIT_PARITY][12] ,
         \latches_out_f[3][PHIT_PARITY][11] ,
         \latches_out_f[3][PHIT_PARITY][10] ,
         \latches_out_f[3][PHIT_PARITY][9] ,
         \latches_out_f[3][PHIT_PARITY][8] ,
         \latches_out_f[3][PHIT_PARITY][7] ,
         \latches_out_f[3][PHIT_PARITY][6] ,
         \latches_out_f[3][PHIT_PARITY][5] ,
         \latches_out_f[3][PHIT_PARITY][4] ,
         \latches_out_f[3][PHIT_PARITY][3] ,
         \latches_out_f[3][PHIT_PARITY][2] ,
         \latches_out_f[3][PHIT_PARITY][1] ,
         \latches_out_f[3][PHIT_PARITY][0] , \latches_out_f[2][TOKEN_T] ,
         \latches_out_f[2][TOKEN_PARITY] , \latches_out_f[2][PHIT][32] ,
         \latches_out_f[2][PHIT][31] , \latches_out_f[2][PHIT][30] ,
         \latches_out_f[2][PHIT][29] , \latches_out_f[2][PHIT][28] ,
         \latches_out_f[2][PHIT][27] , \latches_out_f[2][PHIT][26] ,
         \latches_out_f[2][PHIT][25] , \latches_out_f[2][PHIT][24] ,
         \latches_out_f[2][PHIT][23] , \latches_out_f[2][PHIT][22] ,
         \latches_out_f[2][PHIT][21] , \latches_out_f[2][PHIT][20] ,
         \latches_out_f[2][PHIT][19] , \latches_out_f[2][PHIT][18] ,
         \latches_out_f[2][PHIT][17] , \latches_out_f[2][PHIT][16] ,
         \latches_out_f[2][PHIT][15] , \latches_out_f[2][PHIT][14] ,
         \latches_out_f[2][PHIT][13] , \latches_out_f[2][PHIT][12] ,
         \latches_out_f[2][PHIT][11] , \latches_out_f[2][PHIT][10] ,
         \latches_out_f[2][PHIT][9] , \latches_out_f[2][PHIT][8] ,
         \latches_out_f[2][PHIT][7] , \latches_out_f[2][PHIT][6] ,
         \latches_out_f[2][PHIT][5] , \latches_out_f[2][PHIT][4] ,
         \latches_out_f[2][PHIT][3] , \latches_out_f[2][PHIT][2] ,
         \latches_out_f[2][PHIT][1] , \latches_out_f[2][PHIT][0] ,
         \latches_out_f[2][PHIT_PARITY][32] ,
         \latches_out_f[2][PHIT_PARITY][31] ,
         \latches_out_f[2][PHIT_PARITY][30] ,
         \latches_out_f[2][PHIT_PARITY][29] ,
         \latches_out_f[2][PHIT_PARITY][28] ,
         \latches_out_f[2][PHIT_PARITY][27] ,
         \latches_out_f[2][PHIT_PARITY][26] ,
         \latches_out_f[2][PHIT_PARITY][25] ,
         \latches_out_f[2][PHIT_PARITY][24] ,
         \latches_out_f[2][PHIT_PARITY][23] ,
         \latches_out_f[2][PHIT_PARITY][22] ,
         \latches_out_f[2][PHIT_PARITY][21] ,
         \latches_out_f[2][PHIT_PARITY][20] ,
         \latches_out_f[2][PHIT_PARITY][19] ,
         \latches_out_f[2][PHIT_PARITY][18] ,
         \latches_out_f[2][PHIT_PARITY][17] ,
         \latches_out_f[2][PHIT_PARITY][16] ,
         \latches_out_f[2][PHIT_PARITY][15] ,
         \latches_out_f[2][PHIT_PARITY][14] ,
         \latches_out_f[2][PHIT_PARITY][13] ,
         \latches_out_f[2][PHIT_PARITY][12] ,
         \latches_out_f[2][PHIT_PARITY][11] ,
         \latches_out_f[2][PHIT_PARITY][10] ,
         \latches_out_f[2][PHIT_PARITY][9] ,
         \latches_out_f[2][PHIT_PARITY][8] ,
         \latches_out_f[2][PHIT_PARITY][7] ,
         \latches_out_f[2][PHIT_PARITY][6] ,
         \latches_out_f[2][PHIT_PARITY][5] ,
         \latches_out_f[2][PHIT_PARITY][4] ,
         \latches_out_f[2][PHIT_PARITY][3] ,
         \latches_out_f[2][PHIT_PARITY][2] ,
         \latches_out_f[2][PHIT_PARITY][1] ,
         \latches_out_f[2][PHIT_PARITY][0] , \latches_out_f[1][TOKEN_T] ,
         \latches_out_f[1][TOKEN_PARITY] , \latches_out_f[1][PHIT][32] ,
         \latches_out_f[1][PHIT][31] , \latches_out_f[1][PHIT][30] ,
         \latches_out_f[1][PHIT][29] , \latches_out_f[1][PHIT][28] ,
         \latches_out_f[1][PHIT][27] , \latches_out_f[1][PHIT][26] ,
         \latches_out_f[1][PHIT][25] , \latches_out_f[1][PHIT][24] ,
         \latches_out_f[1][PHIT][23] , \latches_out_f[1][PHIT][22] ,
         \latches_out_f[1][PHIT][21] , \latches_out_f[1][PHIT][20] ,
         \latches_out_f[1][PHIT][19] , \latches_out_f[1][PHIT][18] ,
         \latches_out_f[1][PHIT][17] , \latches_out_f[1][PHIT][16] ,
         \latches_out_f[1][PHIT][15] , \latches_out_f[1][PHIT][14] ,
         \latches_out_f[1][PHIT][13] , \latches_out_f[1][PHIT][12] ,
         \latches_out_f[1][PHIT][11] , \latches_out_f[1][PHIT][10] ,
         \latches_out_f[1][PHIT][9] , \latches_out_f[1][PHIT][8] ,
         \latches_out_f[1][PHIT][7] , \latches_out_f[1][PHIT][6] ,
         \latches_out_f[1][PHIT][5] , \latches_out_f[1][PHIT][4] ,
         \latches_out_f[1][PHIT][3] , \latches_out_f[1][PHIT][2] ,
         \latches_out_f[1][PHIT][1] , \latches_out_f[1][PHIT][0] ,
         \latches_out_f[1][PHIT_PARITY][32] ,
         \latches_out_f[1][PHIT_PARITY][31] ,
         \latches_out_f[1][PHIT_PARITY][30] ,
         \latches_out_f[1][PHIT_PARITY][29] ,
         \latches_out_f[1][PHIT_PARITY][28] ,
         \latches_out_f[1][PHIT_PARITY][27] ,
         \latches_out_f[1][PHIT_PARITY][26] ,
         \latches_out_f[1][PHIT_PARITY][25] ,
         \latches_out_f[1][PHIT_PARITY][24] ,
         \latches_out_f[1][PHIT_PARITY][23] ,
         \latches_out_f[1][PHIT_PARITY][22] ,
         \latches_out_f[1][PHIT_PARITY][21] ,
         \latches_out_f[1][PHIT_PARITY][20] ,
         \latches_out_f[1][PHIT_PARITY][19] ,
         \latches_out_f[1][PHIT_PARITY][18] ,
         \latches_out_f[1][PHIT_PARITY][17] ,
         \latches_out_f[1][PHIT_PARITY][16] ,
         \latches_out_f[1][PHIT_PARITY][15] ,
         \latches_out_f[1][PHIT_PARITY][14] ,
         \latches_out_f[1][PHIT_PARITY][13] ,
         \latches_out_f[1][PHIT_PARITY][12] ,
         \latches_out_f[1][PHIT_PARITY][11] ,
         \latches_out_f[1][PHIT_PARITY][10] ,
         \latches_out_f[1][PHIT_PARITY][9] ,
         \latches_out_f[1][PHIT_PARITY][8] ,
         \latches_out_f[1][PHIT_PARITY][7] ,
         \latches_out_f[1][PHIT_PARITY][6] ,
         \latches_out_f[1][PHIT_PARITY][5] ,
         \latches_out_f[1][PHIT_PARITY][4] ,
         \latches_out_f[1][PHIT_PARITY][3] ,
         \latches_out_f[1][PHIT_PARITY][2] ,
         \latches_out_f[1][PHIT_PARITY][1] ,
         \latches_out_f[1][PHIT_PARITY][0] , \latches_out_f[0][TOKEN_T] ,
         \latches_out_f[0][TOKEN_PARITY] , \latches_out_f[0][PHIT][32] ,
         \latches_out_f[0][PHIT][31] , \latches_out_f[0][PHIT][30] ,
         \latches_out_f[0][PHIT][29] , \latches_out_f[0][PHIT][28] ,
         \latches_out_f[0][PHIT][27] , \latches_out_f[0][PHIT][26] ,
         \latches_out_f[0][PHIT][25] , \latches_out_f[0][PHIT][24] ,
         \latches_out_f[0][PHIT][23] , \latches_out_f[0][PHIT][22] ,
         \latches_out_f[0][PHIT][21] , \latches_out_f[0][PHIT][20] ,
         \latches_out_f[0][PHIT][19] , \latches_out_f[0][PHIT][18] ,
         \latches_out_f[0][PHIT][17] , \latches_out_f[0][PHIT][16] ,
         \latches_out_f[0][PHIT][15] , \latches_out_f[0][PHIT][14] ,
         \latches_out_f[0][PHIT][13] , \latches_out_f[0][PHIT][12] ,
         \latches_out_f[0][PHIT][11] , \latches_out_f[0][PHIT][10] ,
         \latches_out_f[0][PHIT][9] , \latches_out_f[0][PHIT][8] ,
         \latches_out_f[0][PHIT][7] , \latches_out_f[0][PHIT][6] ,
         \latches_out_f[0][PHIT][5] , \latches_out_f[0][PHIT][4] ,
         \latches_out_f[0][PHIT][3] , \latches_out_f[0][PHIT][2] ,
         \latches_out_f[0][PHIT][1] , \latches_out_f[0][PHIT][0] ,
         \latches_out_f[0][PHIT_PARITY][32] ,
         \latches_out_f[0][PHIT_PARITY][31] ,
         \latches_out_f[0][PHIT_PARITY][30] ,
         \latches_out_f[0][PHIT_PARITY][29] ,
         \latches_out_f[0][PHIT_PARITY][28] ,
         \latches_out_f[0][PHIT_PARITY][27] ,
         \latches_out_f[0][PHIT_PARITY][26] ,
         \latches_out_f[0][PHIT_PARITY][25] ,
         \latches_out_f[0][PHIT_PARITY][24] ,
         \latches_out_f[0][PHIT_PARITY][23] ,
         \latches_out_f[0][PHIT_PARITY][22] ,
         \latches_out_f[0][PHIT_PARITY][21] ,
         \latches_out_f[0][PHIT_PARITY][20] ,
         \latches_out_f[0][PHIT_PARITY][19] ,
         \latches_out_f[0][PHIT_PARITY][18] ,
         \latches_out_f[0][PHIT_PARITY][17] ,
         \latches_out_f[0][PHIT_PARITY][16] ,
         \latches_out_f[0][PHIT_PARITY][15] ,
         \latches_out_f[0][PHIT_PARITY][14] ,
         \latches_out_f[0][PHIT_PARITY][13] ,
         \latches_out_f[0][PHIT_PARITY][12] ,
         \latches_out_f[0][PHIT_PARITY][11] ,
         \latches_out_f[0][PHIT_PARITY][10] ,
         \latches_out_f[0][PHIT_PARITY][9] ,
         \latches_out_f[0][PHIT_PARITY][8] ,
         \latches_out_f[0][PHIT_PARITY][7] ,
         \latches_out_f[0][PHIT_PARITY][6] ,
         \latches_out_f[0][PHIT_PARITY][5] ,
         \latches_out_f[0][PHIT_PARITY][4] ,
         \latches_out_f[0][PHIT_PARITY][3] ,
         \latches_out_f[0][PHIT_PARITY][2] ,
         \latches_out_f[0][PHIT_PARITY][1] ,
         \latches_out_f[0][PHIT_PARITY][0] ;
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
  bundled2LEDR_0 ch_latch_4 ( .preset(n1), .bundled_ch_f({
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
        \latches_in_f[4][DATA][0] }), .bundled_ch_b(\latches_in_b[4][ACK] ), 
        .LEDR_link_f({\latches_out_f[4][TOKEN_T] , 
        \latches_out_f[4][TOKEN_PARITY] , \latches_out_f[4][PHIT][32] , 
        \latches_out_f[4][PHIT][31] , \latches_out_f[4][PHIT][30] , 
        \latches_out_f[4][PHIT][29] , \latches_out_f[4][PHIT][28] , 
        \latches_out_f[4][PHIT][27] , \latches_out_f[4][PHIT][26] , 
        \latches_out_f[4][PHIT][25] , \latches_out_f[4][PHIT][24] , 
        \latches_out_f[4][PHIT][23] , \latches_out_f[4][PHIT][22] , 
        \latches_out_f[4][PHIT][21] , \latches_out_f[4][PHIT][20] , 
        \latches_out_f[4][PHIT][19] , \latches_out_f[4][PHIT][18] , 
        \latches_out_f[4][PHIT][17] , \latches_out_f[4][PHIT][16] , 
        \latches_out_f[4][PHIT][15] , \latches_out_f[4][PHIT][14] , 
        \latches_out_f[4][PHIT][13] , \latches_out_f[4][PHIT][12] , 
        \latches_out_f[4][PHIT][11] , \latches_out_f[4][PHIT][10] , 
        \latches_out_f[4][PHIT][9] , \latches_out_f[4][PHIT][8] , 
        \latches_out_f[4][PHIT][7] , \latches_out_f[4][PHIT][6] , 
        \latches_out_f[4][PHIT][5] , \latches_out_f[4][PHIT][4] , 
        \latches_out_f[4][PHIT][3] , \latches_out_f[4][PHIT][2] , 
        \latches_out_f[4][PHIT][1] , \latches_out_f[4][PHIT][0] , 
        \latches_out_f[4][PHIT_PARITY][32] , 
        \latches_out_f[4][PHIT_PARITY][31] , 
        \latches_out_f[4][PHIT_PARITY][30] , 
        \latches_out_f[4][PHIT_PARITY][29] , 
        \latches_out_f[4][PHIT_PARITY][28] , 
        \latches_out_f[4][PHIT_PARITY][27] , 
        \latches_out_f[4][PHIT_PARITY][26] , 
        \latches_out_f[4][PHIT_PARITY][25] , 
        \latches_out_f[4][PHIT_PARITY][24] , 
        \latches_out_f[4][PHIT_PARITY][23] , 
        \latches_out_f[4][PHIT_PARITY][22] , 
        \latches_out_f[4][PHIT_PARITY][21] , 
        \latches_out_f[4][PHIT_PARITY][20] , 
        \latches_out_f[4][PHIT_PARITY][19] , 
        \latches_out_f[4][PHIT_PARITY][18] , 
        \latches_out_f[4][PHIT_PARITY][17] , 
        \latches_out_f[4][PHIT_PARITY][16] , 
        \latches_out_f[4][PHIT_PARITY][15] , 
        \latches_out_f[4][PHIT_PARITY][14] , 
        \latches_out_f[4][PHIT_PARITY][13] , 
        \latches_out_f[4][PHIT_PARITY][12] , 
        \latches_out_f[4][PHIT_PARITY][11] , 
        \latches_out_f[4][PHIT_PARITY][10] , 
        \latches_out_f[4][PHIT_PARITY][9] , \latches_out_f[4][PHIT_PARITY][8] , 
        \latches_out_f[4][PHIT_PARITY][7] , \latches_out_f[4][PHIT_PARITY][6] , 
        \latches_out_f[4][PHIT_PARITY][5] , \latches_out_f[4][PHIT_PARITY][4] , 
        \latches_out_f[4][PHIT_PARITY][3] , \latches_out_f[4][PHIT_PARITY][2] , 
        \latches_out_f[4][PHIT_PARITY][1] , \latches_out_f[4][PHIT_PARITY][0] }), .LEDR_link_b(\latches_out_b[4][ACK] ) );
  bundled2LEDR_4 ch_latch_3 ( .preset(n1), .bundled_ch_f({
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
        \latches_in_f[3][DATA][0] }), .bundled_ch_b(\latches_in_b[3][ACK] ), 
        .LEDR_link_f({\latches_out_f[3][TOKEN_T] , 
        \latches_out_f[3][TOKEN_PARITY] , \latches_out_f[3][PHIT][32] , 
        \latches_out_f[3][PHIT][31] , \latches_out_f[3][PHIT][30] , 
        \latches_out_f[3][PHIT][29] , \latches_out_f[3][PHIT][28] , 
        \latches_out_f[3][PHIT][27] , \latches_out_f[3][PHIT][26] , 
        \latches_out_f[3][PHIT][25] , \latches_out_f[3][PHIT][24] , 
        \latches_out_f[3][PHIT][23] , \latches_out_f[3][PHIT][22] , 
        \latches_out_f[3][PHIT][21] , \latches_out_f[3][PHIT][20] , 
        \latches_out_f[3][PHIT][19] , \latches_out_f[3][PHIT][18] , 
        \latches_out_f[3][PHIT][17] , \latches_out_f[3][PHIT][16] , 
        \latches_out_f[3][PHIT][15] , \latches_out_f[3][PHIT][14] , 
        \latches_out_f[3][PHIT][13] , \latches_out_f[3][PHIT][12] , 
        \latches_out_f[3][PHIT][11] , \latches_out_f[3][PHIT][10] , 
        \latches_out_f[3][PHIT][9] , \latches_out_f[3][PHIT][8] , 
        \latches_out_f[3][PHIT][7] , \latches_out_f[3][PHIT][6] , 
        \latches_out_f[3][PHIT][5] , \latches_out_f[3][PHIT][4] , 
        \latches_out_f[3][PHIT][3] , \latches_out_f[3][PHIT][2] , 
        \latches_out_f[3][PHIT][1] , \latches_out_f[3][PHIT][0] , 
        \latches_out_f[3][PHIT_PARITY][32] , 
        \latches_out_f[3][PHIT_PARITY][31] , 
        \latches_out_f[3][PHIT_PARITY][30] , 
        \latches_out_f[3][PHIT_PARITY][29] , 
        \latches_out_f[3][PHIT_PARITY][28] , 
        \latches_out_f[3][PHIT_PARITY][27] , 
        \latches_out_f[3][PHIT_PARITY][26] , 
        \latches_out_f[3][PHIT_PARITY][25] , 
        \latches_out_f[3][PHIT_PARITY][24] , 
        \latches_out_f[3][PHIT_PARITY][23] , 
        \latches_out_f[3][PHIT_PARITY][22] , 
        \latches_out_f[3][PHIT_PARITY][21] , 
        \latches_out_f[3][PHIT_PARITY][20] , 
        \latches_out_f[3][PHIT_PARITY][19] , 
        \latches_out_f[3][PHIT_PARITY][18] , 
        \latches_out_f[3][PHIT_PARITY][17] , 
        \latches_out_f[3][PHIT_PARITY][16] , 
        \latches_out_f[3][PHIT_PARITY][15] , 
        \latches_out_f[3][PHIT_PARITY][14] , 
        \latches_out_f[3][PHIT_PARITY][13] , 
        \latches_out_f[3][PHIT_PARITY][12] , 
        \latches_out_f[3][PHIT_PARITY][11] , 
        \latches_out_f[3][PHIT_PARITY][10] , 
        \latches_out_f[3][PHIT_PARITY][9] , \latches_out_f[3][PHIT_PARITY][8] , 
        \latches_out_f[3][PHIT_PARITY][7] , \latches_out_f[3][PHIT_PARITY][6] , 
        \latches_out_f[3][PHIT_PARITY][5] , \latches_out_f[3][PHIT_PARITY][4] , 
        \latches_out_f[3][PHIT_PARITY][3] , \latches_out_f[3][PHIT_PARITY][2] , 
        \latches_out_f[3][PHIT_PARITY][1] , \latches_out_f[3][PHIT_PARITY][0] }), .LEDR_link_b(\latches_out_b[3][ACK] ) );
  bundled2LEDR_3 ch_latch_2 ( .preset(n1), .bundled_ch_f({
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
        \latches_in_f[2][DATA][0] }), .bundled_ch_b(\latches_in_b[2][ACK] ), 
        .LEDR_link_f({\latches_out_f[2][TOKEN_T] , 
        \latches_out_f[2][TOKEN_PARITY] , \latches_out_f[2][PHIT][32] , 
        \latches_out_f[2][PHIT][31] , \latches_out_f[2][PHIT][30] , 
        \latches_out_f[2][PHIT][29] , \latches_out_f[2][PHIT][28] , 
        \latches_out_f[2][PHIT][27] , \latches_out_f[2][PHIT][26] , 
        \latches_out_f[2][PHIT][25] , \latches_out_f[2][PHIT][24] , 
        \latches_out_f[2][PHIT][23] , \latches_out_f[2][PHIT][22] , 
        \latches_out_f[2][PHIT][21] , \latches_out_f[2][PHIT][20] , 
        \latches_out_f[2][PHIT][19] , \latches_out_f[2][PHIT][18] , 
        \latches_out_f[2][PHIT][17] , \latches_out_f[2][PHIT][16] , 
        \latches_out_f[2][PHIT][15] , \latches_out_f[2][PHIT][14] , 
        \latches_out_f[2][PHIT][13] , \latches_out_f[2][PHIT][12] , 
        \latches_out_f[2][PHIT][11] , \latches_out_f[2][PHIT][10] , 
        \latches_out_f[2][PHIT][9] , \latches_out_f[2][PHIT][8] , 
        \latches_out_f[2][PHIT][7] , \latches_out_f[2][PHIT][6] , 
        \latches_out_f[2][PHIT][5] , \latches_out_f[2][PHIT][4] , 
        \latches_out_f[2][PHIT][3] , \latches_out_f[2][PHIT][2] , 
        \latches_out_f[2][PHIT][1] , \latches_out_f[2][PHIT][0] , 
        \latches_out_f[2][PHIT_PARITY][32] , 
        \latches_out_f[2][PHIT_PARITY][31] , 
        \latches_out_f[2][PHIT_PARITY][30] , 
        \latches_out_f[2][PHIT_PARITY][29] , 
        \latches_out_f[2][PHIT_PARITY][28] , 
        \latches_out_f[2][PHIT_PARITY][27] , 
        \latches_out_f[2][PHIT_PARITY][26] , 
        \latches_out_f[2][PHIT_PARITY][25] , 
        \latches_out_f[2][PHIT_PARITY][24] , 
        \latches_out_f[2][PHIT_PARITY][23] , 
        \latches_out_f[2][PHIT_PARITY][22] , 
        \latches_out_f[2][PHIT_PARITY][21] , 
        \latches_out_f[2][PHIT_PARITY][20] , 
        \latches_out_f[2][PHIT_PARITY][19] , 
        \latches_out_f[2][PHIT_PARITY][18] , 
        \latches_out_f[2][PHIT_PARITY][17] , 
        \latches_out_f[2][PHIT_PARITY][16] , 
        \latches_out_f[2][PHIT_PARITY][15] , 
        \latches_out_f[2][PHIT_PARITY][14] , 
        \latches_out_f[2][PHIT_PARITY][13] , 
        \latches_out_f[2][PHIT_PARITY][12] , 
        \latches_out_f[2][PHIT_PARITY][11] , 
        \latches_out_f[2][PHIT_PARITY][10] , 
        \latches_out_f[2][PHIT_PARITY][9] , \latches_out_f[2][PHIT_PARITY][8] , 
        \latches_out_f[2][PHIT_PARITY][7] , \latches_out_f[2][PHIT_PARITY][6] , 
        \latches_out_f[2][PHIT_PARITY][5] , \latches_out_f[2][PHIT_PARITY][4] , 
        \latches_out_f[2][PHIT_PARITY][3] , \latches_out_f[2][PHIT_PARITY][2] , 
        \latches_out_f[2][PHIT_PARITY][1] , \latches_out_f[2][PHIT_PARITY][0] }), .LEDR_link_b(\latches_out_b[2][ACK] ) );
  bundled2LEDR_2 ch_latch_1 ( .preset(n1), .bundled_ch_f({
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
        \latches_in_f[1][DATA][0] }), .bundled_ch_b(\latches_in_b[1][ACK] ), 
        .LEDR_link_f({\latches_out_f[1][TOKEN_T] , 
        \latches_out_f[1][TOKEN_PARITY] , \latches_out_f[1][PHIT][32] , 
        \latches_out_f[1][PHIT][31] , \latches_out_f[1][PHIT][30] , 
        \latches_out_f[1][PHIT][29] , \latches_out_f[1][PHIT][28] , 
        \latches_out_f[1][PHIT][27] , \latches_out_f[1][PHIT][26] , 
        \latches_out_f[1][PHIT][25] , \latches_out_f[1][PHIT][24] , 
        \latches_out_f[1][PHIT][23] , \latches_out_f[1][PHIT][22] , 
        \latches_out_f[1][PHIT][21] , \latches_out_f[1][PHIT][20] , 
        \latches_out_f[1][PHIT][19] , \latches_out_f[1][PHIT][18] , 
        \latches_out_f[1][PHIT][17] , \latches_out_f[1][PHIT][16] , 
        \latches_out_f[1][PHIT][15] , \latches_out_f[1][PHIT][14] , 
        \latches_out_f[1][PHIT][13] , \latches_out_f[1][PHIT][12] , 
        \latches_out_f[1][PHIT][11] , \latches_out_f[1][PHIT][10] , 
        \latches_out_f[1][PHIT][9] , \latches_out_f[1][PHIT][8] , 
        \latches_out_f[1][PHIT][7] , \latches_out_f[1][PHIT][6] , 
        \latches_out_f[1][PHIT][5] , \latches_out_f[1][PHIT][4] , 
        \latches_out_f[1][PHIT][3] , \latches_out_f[1][PHIT][2] , 
        \latches_out_f[1][PHIT][1] , \latches_out_f[1][PHIT][0] , 
        \latches_out_f[1][PHIT_PARITY][32] , 
        \latches_out_f[1][PHIT_PARITY][31] , 
        \latches_out_f[1][PHIT_PARITY][30] , 
        \latches_out_f[1][PHIT_PARITY][29] , 
        \latches_out_f[1][PHIT_PARITY][28] , 
        \latches_out_f[1][PHIT_PARITY][27] , 
        \latches_out_f[1][PHIT_PARITY][26] , 
        \latches_out_f[1][PHIT_PARITY][25] , 
        \latches_out_f[1][PHIT_PARITY][24] , 
        \latches_out_f[1][PHIT_PARITY][23] , 
        \latches_out_f[1][PHIT_PARITY][22] , 
        \latches_out_f[1][PHIT_PARITY][21] , 
        \latches_out_f[1][PHIT_PARITY][20] , 
        \latches_out_f[1][PHIT_PARITY][19] , 
        \latches_out_f[1][PHIT_PARITY][18] , 
        \latches_out_f[1][PHIT_PARITY][17] , 
        \latches_out_f[1][PHIT_PARITY][16] , 
        \latches_out_f[1][PHIT_PARITY][15] , 
        \latches_out_f[1][PHIT_PARITY][14] , 
        \latches_out_f[1][PHIT_PARITY][13] , 
        \latches_out_f[1][PHIT_PARITY][12] , 
        \latches_out_f[1][PHIT_PARITY][11] , 
        \latches_out_f[1][PHIT_PARITY][10] , 
        \latches_out_f[1][PHIT_PARITY][9] , \latches_out_f[1][PHIT_PARITY][8] , 
        \latches_out_f[1][PHIT_PARITY][7] , \latches_out_f[1][PHIT_PARITY][6] , 
        \latches_out_f[1][PHIT_PARITY][5] , \latches_out_f[1][PHIT_PARITY][4] , 
        \latches_out_f[1][PHIT_PARITY][3] , \latches_out_f[1][PHIT_PARITY][2] , 
        \latches_out_f[1][PHIT_PARITY][1] , \latches_out_f[1][PHIT_PARITY][0] }), .LEDR_link_b(\latches_out_b[1][ACK] ) );
  bundled2LEDR_1 ch_latch_0 ( .preset(n1), .bundled_ch_f({
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
        \latches_in_f[0][DATA][0] }), .bundled_ch_b(\latches_in_b[0][ACK] ), 
        .LEDR_link_f({\latches_out_f[0][TOKEN_T] , 
        \latches_out_f[0][TOKEN_PARITY] , \latches_out_f[0][PHIT][32] , 
        \latches_out_f[0][PHIT][31] , \latches_out_f[0][PHIT][30] , 
        \latches_out_f[0][PHIT][29] , \latches_out_f[0][PHIT][28] , 
        \latches_out_f[0][PHIT][27] , \latches_out_f[0][PHIT][26] , 
        \latches_out_f[0][PHIT][25] , \latches_out_f[0][PHIT][24] , 
        \latches_out_f[0][PHIT][23] , \latches_out_f[0][PHIT][22] , 
        \latches_out_f[0][PHIT][21] , \latches_out_f[0][PHIT][20] , 
        \latches_out_f[0][PHIT][19] , \latches_out_f[0][PHIT][18] , 
        \latches_out_f[0][PHIT][17] , \latches_out_f[0][PHIT][16] , 
        \latches_out_f[0][PHIT][15] , \latches_out_f[0][PHIT][14] , 
        \latches_out_f[0][PHIT][13] , \latches_out_f[0][PHIT][12] , 
        \latches_out_f[0][PHIT][11] , \latches_out_f[0][PHIT][10] , 
        \latches_out_f[0][PHIT][9] , \latches_out_f[0][PHIT][8] , 
        \latches_out_f[0][PHIT][7] , \latches_out_f[0][PHIT][6] , 
        \latches_out_f[0][PHIT][5] , \latches_out_f[0][PHIT][4] , 
        \latches_out_f[0][PHIT][3] , \latches_out_f[0][PHIT][2] , 
        \latches_out_f[0][PHIT][1] , \latches_out_f[0][PHIT][0] , 
        \latches_out_f[0][PHIT_PARITY][32] , 
        \latches_out_f[0][PHIT_PARITY][31] , 
        \latches_out_f[0][PHIT_PARITY][30] , 
        \latches_out_f[0][PHIT_PARITY][29] , 
        \latches_out_f[0][PHIT_PARITY][28] , 
        \latches_out_f[0][PHIT_PARITY][27] , 
        \latches_out_f[0][PHIT_PARITY][26] , 
        \latches_out_f[0][PHIT_PARITY][25] , 
        \latches_out_f[0][PHIT_PARITY][24] , 
        \latches_out_f[0][PHIT_PARITY][23] , 
        \latches_out_f[0][PHIT_PARITY][22] , 
        \latches_out_f[0][PHIT_PARITY][21] , 
        \latches_out_f[0][PHIT_PARITY][20] , 
        \latches_out_f[0][PHIT_PARITY][19] , 
        \latches_out_f[0][PHIT_PARITY][18] , 
        \latches_out_f[0][PHIT_PARITY][17] , 
        \latches_out_f[0][PHIT_PARITY][16] , 
        \latches_out_f[0][PHIT_PARITY][15] , 
        \latches_out_f[0][PHIT_PARITY][14] , 
        \latches_out_f[0][PHIT_PARITY][13] , 
        \latches_out_f[0][PHIT_PARITY][12] , 
        \latches_out_f[0][PHIT_PARITY][11] , 
        \latches_out_f[0][PHIT_PARITY][10] , 
        \latches_out_f[0][PHIT_PARITY][9] , \latches_out_f[0][PHIT_PARITY][8] , 
        \latches_out_f[0][PHIT_PARITY][7] , \latches_out_f[0][PHIT_PARITY][6] , 
        \latches_out_f[0][PHIT_PARITY][5] , \latches_out_f[0][PHIT_PARITY][4] , 
        \latches_out_f[0][PHIT_PARITY][3] , \latches_out_f[0][PHIT_PARITY][2] , 
        \latches_out_f[0][PHIT_PARITY][1] , \latches_out_f[0][PHIT_PARITY][0] }), .LEDR_link_b(\latches_out_b[0][ACK] ) );
  HS65_LS_BFX9 U1 ( .A(preset), .Z(n1) );
endmodule


module select_element_1 ( preset, \input , true, false, sel );
  input preset, \input , sel;
  output true, false;
  wire   n1, n2, n3;

  HS65_LS_LDHRQX9 true_latch_out_reg ( .G(sel), .D(n1), .RN(n3), .Q(true) );
  HS65_LS_LDLRQX9 false_latch_out_reg ( .D(n2), .GN(sel), .RN(n3), .Q(false)
         );
  HS65_LSS_XOR2X6 U3 ( .A(\input ), .B(false), .Z(n1) );
  HS65_LS_IVX9 U4 ( .A(preset), .Z(n3) );
  HS65_LSS_XOR2X6 U5 ( .A(\input ), .B(true), .Z(n2) );
endmodule


module sr_latch_0_12 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X18 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(qn), .Z(N1) );
  HS65_LS_IVX9 U2 ( .A(r), .Z(n1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_11 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_12 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_OAI12X6 U3 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LH_AND3X4 U4 ( .A(b), .B(n1), .C(a), .Z(set) );
  HS65_LS_IVX9 U5 ( .A(preset), .Z(n1) );
endmodule


module sr_latch_0_11 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X18 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX7 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_generic_0_33_1 ( preset, \input , \output  );
  input [32:0] \input ;
  input preset;
  output \output ;
  wire   set, reset, n1, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75;

  sr_latch_0_11 latch ( .s(set), .r(reset), .q(\output ) );
  HS65_LH_NOR4ABX2 U3 ( .A(\input [23]), .B(\input [22]), .C(n70), .D(n71), 
        .Z(n60) );
  HS65_LS_NAND4ABX19 U4 ( .A(\input [23]), .B(\input [22]), .C(n70), .D(n71), 
        .Z(n47) );
  HS65_LH_NOR4ABX2 U5 ( .A(\input [2]), .B(\input [30]), .C(n74), .D(n73), .Z(
        n52) );
  HS65_LS_NAND4ABX19 U6 ( .A(\input [30]), .B(\input [2]), .C(n72), .D(n73), 
        .Z(n43) );
  HS65_LS_OAI12X6 U7 ( .A(n49), .B(n48), .C(n1), .Z(reset) );
  HS65_LS_NAND4ABX6 U8 ( .A(n43), .B(n42), .C(n41), .D(n40), .Z(n49) );
  HS65_LS_NAND3X13 U9 ( .A(n62), .B(n63), .C(n39), .Z(n42) );
  HS65_LS_NOR3X13 U10 ( .A(\input [7]), .B(\input [9]), .C(\input [8]), .Z(n39) );
  HS65_LS_NOR4ABX4 U11 ( .A(n66), .B(n67), .C(\input [16]), .D(\input [15]), 
        .Z(n44) );
  HS65_LS_NOR4ABX4 U12 ( .A(n74), .B(n75), .C(\input [4]), .D(\input [3]), .Z(
        n40) );
  HS65_LS_NOR4ABX4 U13 ( .A(n61), .B(n65), .C(\input [12]), .D(\input [11]), 
        .Z(n45) );
  HS65_LS_NAND4ABX6 U14 ( .A(n47), .B(n46), .C(n45), .D(n44), .Z(n48) );
  HS65_LS_IVX9 U15 ( .A(\input [17]), .Z(n68) );
  HS65_LS_IVX9 U16 ( .A(\input [20]), .Z(n70) );
  HS65_LS_NAND4ABX6 U17 ( .A(\input [1]), .B(\input [19]), .C(n68), .D(n69), 
        .Z(n46) );
  HS65_LS_IVX9 U18 ( .A(\input [28]), .Z(n72) );
  HS65_LS_IVX9 U19 ( .A(\input [18]), .Z(n69) );
  HS65_LS_IVX9 U20 ( .A(\input [21]), .Z(n71) );
  HS65_LS_IVX9 U21 ( .A(\input [29]), .Z(n73) );
  HS65_LS_IVX9 U22 ( .A(\input [5]), .Z(n62) );
  HS65_LS_IVX9 U23 ( .A(\input [6]), .Z(n63) );
  HS65_LS_IVX9 U24 ( .A(\input [13]), .Z(n66) );
  HS65_LS_IVX9 U25 ( .A(\input [31]), .Z(n74) );
  HS65_LS_IVX9 U26 ( .A(\input [10]), .Z(n65) );
  HS65_LS_IVX9 U27 ( .A(\input [0]), .Z(n61) );
  HS65_LS_IVX9 U28 ( .A(\input [14]), .Z(n67) );
  HS65_LS_IVX9 U29 ( .A(\input [32]), .Z(n75) );
  HS65_LS_NOR4X4 U30 ( .A(\input [24]), .B(\input [25]), .C(\input [27]), .D(
        \input [26]), .Z(n41) );
  HS65_LS_NOR3X4 U31 ( .A(n65), .B(preset), .C(n61), .Z(n56) );
  HS65_LS_NOR3AX2 U32 ( .A(\input [27]), .B(n50), .C(n72), .Z(n51) );
  HS65_LS_IVX9 U33 ( .A(preset), .Z(n1) );
  HS65_LS_NOR4ABX2 U34 ( .A(\input [1]), .B(\input [19]), .C(n68), .D(n69), 
        .Z(n59) );
  HS65_LS_NOR4ABX2 U35 ( .A(n60), .B(n59), .C(n58), .D(n57), .Z(set) );
  HS65_LS_NAND4ABX3 U36 ( .A(n54), .B(n53), .C(n52), .D(n51), .Z(n58) );
  HS65_LS_NOR4ABX2 U37 ( .A(\input [16]), .B(\input [15]), .C(n66), .D(n67), 
        .Z(n55) );
  HS65_LS_NAND3X5 U38 ( .A(\input [25]), .B(\input [24]), .C(\input [26]), .Z(
        n50) );
  HS65_LS_NAND4ABX3 U39 ( .A(n75), .B(n62), .C(\input [3]), .D(\input [4]), 
        .Z(n54) );
  HS65_LS_NAND4ABX3 U40 ( .A(n63), .B(n64), .C(\input [7]), .D(\input [8]), 
        .Z(n53) );
  HS65_LS_NAND4X9 U41 ( .A(\input [11]), .B(\input [12]), .C(n56), .D(n55), 
        .Z(n57) );
  HS65_LS_IVX9 U42 ( .A(\input [9]), .Z(n64) );
endmodule


module sr_latch_0_6 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LH_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LH_IVX62 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_6 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_6 latch ( .s(set), .r(reset), .q(c) );
  HS65_LH_OAI21X2 U3 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_IVX9 U4 ( .A(preset), .Z(n1) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_6 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   not_Ain, d, n1, n2, n3, n4;

  c_gate_0_6 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Rout) );
  HS65_LS_IVX9 I_1 ( .A(n1), .Z(Aout) );
  HS65_LS_IVX9 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LH_IVX2 I_2 ( .A(Rout), .Z(d) );
  HS65_LS_BFX9 U1 ( .A(n3), .Z(n1) );
  HS65_LH_IVX106 U2 ( .A(n4), .Z(n2) );
  HS65_LH_BFX2 U3 ( .A(d), .Z(n4) );
  HS65_LS_IVX9 U4 ( .A(n2), .Z(n3) );
  HS65_LSS_XOR2X6 U5 ( .A(Rout), .B(Ain), .Z(lt_en) );
endmodule


module LEDR2bundled_1_000000000_1 ( preset, .LEDR_link_f({
        \LEDR_link_f[TOKEN_T] , \LEDR_link_f[TOKEN_PARITY] , 
        \LEDR_link_f[PHIT][32] , \LEDR_link_f[PHIT][31] , 
        \LEDR_link_f[PHIT][30] , \LEDR_link_f[PHIT][29] , 
        \LEDR_link_f[PHIT][28] , \LEDR_link_f[PHIT][27] , 
        \LEDR_link_f[PHIT][26] , \LEDR_link_f[PHIT][25] , 
        \LEDR_link_f[PHIT][24] , \LEDR_link_f[PHIT][23] , 
        \LEDR_link_f[PHIT][22] , \LEDR_link_f[PHIT][21] , 
        \LEDR_link_f[PHIT][20] , \LEDR_link_f[PHIT][19] , 
        \LEDR_link_f[PHIT][18] , \LEDR_link_f[PHIT][17] , 
        \LEDR_link_f[PHIT][16] , \LEDR_link_f[PHIT][15] , 
        \LEDR_link_f[PHIT][14] , \LEDR_link_f[PHIT][13] , 
        \LEDR_link_f[PHIT][12] , \LEDR_link_f[PHIT][11] , 
        \LEDR_link_f[PHIT][10] , \LEDR_link_f[PHIT][9] , 
        \LEDR_link_f[PHIT][8] , \LEDR_link_f[PHIT][7] , \LEDR_link_f[PHIT][6] , 
        \LEDR_link_f[PHIT][5] , \LEDR_link_f[PHIT][4] , \LEDR_link_f[PHIT][3] , 
        \LEDR_link_f[PHIT][2] , \LEDR_link_f[PHIT][1] , \LEDR_link_f[PHIT][0] , 
        \LEDR_link_f[PHIT_PARITY][32] , \LEDR_link_f[PHIT_PARITY][31] , 
        \LEDR_link_f[PHIT_PARITY][30] , \LEDR_link_f[PHIT_PARITY][29] , 
        \LEDR_link_f[PHIT_PARITY][28] , \LEDR_link_f[PHIT_PARITY][27] , 
        \LEDR_link_f[PHIT_PARITY][26] , \LEDR_link_f[PHIT_PARITY][25] , 
        \LEDR_link_f[PHIT_PARITY][24] , \LEDR_link_f[PHIT_PARITY][23] , 
        \LEDR_link_f[PHIT_PARITY][22] , \LEDR_link_f[PHIT_PARITY][21] , 
        \LEDR_link_f[PHIT_PARITY][20] , \LEDR_link_f[PHIT_PARITY][19] , 
        \LEDR_link_f[PHIT_PARITY][18] , \LEDR_link_f[PHIT_PARITY][17] , 
        \LEDR_link_f[PHIT_PARITY][16] , \LEDR_link_f[PHIT_PARITY][15] , 
        \LEDR_link_f[PHIT_PARITY][14] , \LEDR_link_f[PHIT_PARITY][13] , 
        \LEDR_link_f[PHIT_PARITY][12] , \LEDR_link_f[PHIT_PARITY][11] , 
        \LEDR_link_f[PHIT_PARITY][10] , \LEDR_link_f[PHIT_PARITY][9] , 
        \LEDR_link_f[PHIT_PARITY][8] , \LEDR_link_f[PHIT_PARITY][7] , 
        \LEDR_link_f[PHIT_PARITY][6] , \LEDR_link_f[PHIT_PARITY][5] , 
        \LEDR_link_f[PHIT_PARITY][4] , \LEDR_link_f[PHIT_PARITY][3] , 
        \LEDR_link_f[PHIT_PARITY][2] , \LEDR_link_f[PHIT_PARITY][1] , 
        \LEDR_link_f[PHIT_PARITY][0] }), .LEDR_link_b(\LEDR_link_b[ACK] ), 
    .bundled_ch_f({\bundled_ch_f[REQ] , \bundled_ch_f[DATA][33] , 
        \bundled_ch_f[DATA][32] , \bundled_ch_f[DATA][31] , 
        \bundled_ch_f[DATA][30] , \bundled_ch_f[DATA][29] , 
        \bundled_ch_f[DATA][28] , \bundled_ch_f[DATA][27] , 
        \bundled_ch_f[DATA][26] , \bundled_ch_f[DATA][25] , 
        \bundled_ch_f[DATA][24] , \bundled_ch_f[DATA][23] , 
        \bundled_ch_f[DATA][22] , \bundled_ch_f[DATA][21] , 
        \bundled_ch_f[DATA][20] , \bundled_ch_f[DATA][19] , 
        \bundled_ch_f[DATA][18] , \bundled_ch_f[DATA][17] , 
        \bundled_ch_f[DATA][16] , \bundled_ch_f[DATA][15] , 
        \bundled_ch_f[DATA][14] , \bundled_ch_f[DATA][13] , 
        \bundled_ch_f[DATA][12] , \bundled_ch_f[DATA][11] , 
        \bundled_ch_f[DATA][10] , \bundled_ch_f[DATA][9] , 
        \bundled_ch_f[DATA][8] , \bundled_ch_f[DATA][7] , 
        \bundled_ch_f[DATA][6] , \bundled_ch_f[DATA][5] , 
        \bundled_ch_f[DATA][4] , \bundled_ch_f[DATA][3] , 
        \bundled_ch_f[DATA][2] , \bundled_ch_f[DATA][1] , 
        \bundled_ch_f[DATA][0] }), .bundled_ch_b(\bundled_ch_b[ACK] ) );
  input preset, \LEDR_link_f[TOKEN_T] , \LEDR_link_f[TOKEN_PARITY] ,
         \LEDR_link_f[PHIT][32] , \LEDR_link_f[PHIT][31] ,
         \LEDR_link_f[PHIT][30] , \LEDR_link_f[PHIT][29] ,
         \LEDR_link_f[PHIT][28] , \LEDR_link_f[PHIT][27] ,
         \LEDR_link_f[PHIT][26] , \LEDR_link_f[PHIT][25] ,
         \LEDR_link_f[PHIT][24] , \LEDR_link_f[PHIT][23] ,
         \LEDR_link_f[PHIT][22] , \LEDR_link_f[PHIT][21] ,
         \LEDR_link_f[PHIT][20] , \LEDR_link_f[PHIT][19] ,
         \LEDR_link_f[PHIT][18] , \LEDR_link_f[PHIT][17] ,
         \LEDR_link_f[PHIT][16] , \LEDR_link_f[PHIT][15] ,
         \LEDR_link_f[PHIT][14] , \LEDR_link_f[PHIT][13] ,
         \LEDR_link_f[PHIT][12] , \LEDR_link_f[PHIT][11] ,
         \LEDR_link_f[PHIT][10] , \LEDR_link_f[PHIT][9] ,
         \LEDR_link_f[PHIT][8] , \LEDR_link_f[PHIT][7] ,
         \LEDR_link_f[PHIT][6] , \LEDR_link_f[PHIT][5] ,
         \LEDR_link_f[PHIT][4] , \LEDR_link_f[PHIT][3] ,
         \LEDR_link_f[PHIT][2] , \LEDR_link_f[PHIT][1] ,
         \LEDR_link_f[PHIT][0] , \LEDR_link_f[PHIT_PARITY][32] ,
         \LEDR_link_f[PHIT_PARITY][31] , \LEDR_link_f[PHIT_PARITY][30] ,
         \LEDR_link_f[PHIT_PARITY][29] , \LEDR_link_f[PHIT_PARITY][28] ,
         \LEDR_link_f[PHIT_PARITY][27] , \LEDR_link_f[PHIT_PARITY][26] ,
         \LEDR_link_f[PHIT_PARITY][25] , \LEDR_link_f[PHIT_PARITY][24] ,
         \LEDR_link_f[PHIT_PARITY][23] , \LEDR_link_f[PHIT_PARITY][22] ,
         \LEDR_link_f[PHIT_PARITY][21] , \LEDR_link_f[PHIT_PARITY][20] ,
         \LEDR_link_f[PHIT_PARITY][19] , \LEDR_link_f[PHIT_PARITY][18] ,
         \LEDR_link_f[PHIT_PARITY][17] , \LEDR_link_f[PHIT_PARITY][16] ,
         \LEDR_link_f[PHIT_PARITY][15] , \LEDR_link_f[PHIT_PARITY][14] ,
         \LEDR_link_f[PHIT_PARITY][13] , \LEDR_link_f[PHIT_PARITY][12] ,
         \LEDR_link_f[PHIT_PARITY][11] , \LEDR_link_f[PHIT_PARITY][10] ,
         \LEDR_link_f[PHIT_PARITY][9] , \LEDR_link_f[PHIT_PARITY][8] ,
         \LEDR_link_f[PHIT_PARITY][7] , \LEDR_link_f[PHIT_PARITY][6] ,
         \LEDR_link_f[PHIT_PARITY][5] , \LEDR_link_f[PHIT_PARITY][4] ,
         \LEDR_link_f[PHIT_PARITY][3] , \LEDR_link_f[PHIT_PARITY][2] ,
         \LEDR_link_f[PHIT_PARITY][1] , \LEDR_link_f[PHIT_PARITY][0] ,
         \bundled_ch_b[ACK] ;
  output \LEDR_link_b[ACK] , \bundled_ch_f[REQ] , \bundled_ch_f[DATA][33] ,
         \bundled_ch_f[DATA][32] , \bundled_ch_f[DATA][31] ,
         \bundled_ch_f[DATA][30] , \bundled_ch_f[DATA][29] ,
         \bundled_ch_f[DATA][28] , \bundled_ch_f[DATA][27] ,
         \bundled_ch_f[DATA][26] , \bundled_ch_f[DATA][25] ,
         \bundled_ch_f[DATA][24] , \bundled_ch_f[DATA][23] ,
         \bundled_ch_f[DATA][22] , \bundled_ch_f[DATA][21] ,
         \bundled_ch_f[DATA][20] , \bundled_ch_f[DATA][19] ,
         \bundled_ch_f[DATA][18] , \bundled_ch_f[DATA][17] ,
         \bundled_ch_f[DATA][16] , \bundled_ch_f[DATA][15] ,
         \bundled_ch_f[DATA][14] , \bundled_ch_f[DATA][13] ,
         \bundled_ch_f[DATA][12] , \bundled_ch_f[DATA][11] ,
         \bundled_ch_f[DATA][10] , \bundled_ch_f[DATA][9] ,
         \bundled_ch_f[DATA][8] , \bundled_ch_f[DATA][7] ,
         \bundled_ch_f[DATA][6] , \bundled_ch_f[DATA][5] ,
         \bundled_ch_f[DATA][4] , \bundled_ch_f[DATA][3] ,
         \bundled_ch_f[DATA][2] , \bundled_ch_f[DATA][1] ,
         \bundled_ch_f[DATA][0] ;
  wire   token_phase, full_phase, empty_phase, data_phase, data_cd_phase,
         req_in, latch_enable, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13,
         N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27,
         N28, N29, N30, N31, N32, N33, N34, N35, N36, n1, n3;
  wire   [32:0] data_cd;

  select_element_1 select_element ( .preset(preset), .\input (token_phase), 
        .true(full_phase), .false(empty_phase), .sel(\LEDR_link_f[TOKEN_T] )
         );
  c_gate_0_11 data_cd_c ( .preset(preset), .a(full_phase), .b(data_phase), .c(
        data_cd_phase) );
  c_gate_generic_0_33_1 data_ch ( .preset(preset), .\input (data_cd), 
        .\output (data_phase) );
  latch_controller_1_6 latch_controller ( .preset(preset), .Rin(req_in), 
        .Aout(\LEDR_link_b[ACK] ), .Rout(\bundled_ch_f[REQ] ), .Ain(
        \bundled_ch_b[ACK] ), .lt_en(latch_enable) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][31]  ( .G(N3), .D(N35), .Q(
        \bundled_ch_f[DATA][31] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][30]  ( .G(N3), .D(N34), .Q(
        \bundled_ch_f[DATA][30] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][29]  ( .G(N3), .D(N33), .Q(
        \bundled_ch_f[DATA][29] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][28]  ( .G(N3), .D(N32), .Q(
        \bundled_ch_f[DATA][28] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][27]  ( .G(N3), .D(N31), .Q(
        \bundled_ch_f[DATA][27] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][26]  ( .G(N3), .D(N30), .Q(
        \bundled_ch_f[DATA][26] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][25]  ( .G(N3), .D(N29), .Q(
        \bundled_ch_f[DATA][25] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][24]  ( .G(N3), .D(N28), .Q(
        \bundled_ch_f[DATA][24] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][23]  ( .G(N3), .D(N27), .Q(
        \bundled_ch_f[DATA][23] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][22]  ( .G(N3), .D(N26), .Q(
        \bundled_ch_f[DATA][22] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][21]  ( .G(N3), .D(N25), .Q(
        \bundled_ch_f[DATA][21] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][20]  ( .G(N3), .D(N24), .Q(
        \bundled_ch_f[DATA][20] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][19]  ( .G(N3), .D(N23), .Q(
        \bundled_ch_f[DATA][19] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][18]  ( .G(N3), .D(N22), .Q(
        \bundled_ch_f[DATA][18] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][17]  ( .G(N3), .D(N21), .Q(
        \bundled_ch_f[DATA][17] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][16]  ( .G(N3), .D(N20), .Q(
        \bundled_ch_f[DATA][16] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][15]  ( .G(N3), .D(N19), .Q(
        \bundled_ch_f[DATA][15] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][14]  ( .G(N3), .D(N18), .Q(
        \bundled_ch_f[DATA][14] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][13]  ( .G(N3), .D(N17), .Q(
        \bundled_ch_f[DATA][13] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][12]  ( .G(N3), .D(N16), .Q(
        \bundled_ch_f[DATA][12] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][11]  ( .G(N3), .D(N15), .Q(
        \bundled_ch_f[DATA][11] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][10]  ( .G(N3), .D(N14), .Q(
        \bundled_ch_f[DATA][10] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][9]  ( .G(N3), .D(N13), .Q(
        \bundled_ch_f[DATA][9] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][8]  ( .G(N3), .D(N12), .Q(
        \bundled_ch_f[DATA][8] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][7]  ( .G(N3), .D(N11), .Q(
        \bundled_ch_f[DATA][7] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][6]  ( .G(N3), .D(N10), .Q(
        \bundled_ch_f[DATA][6] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][5]  ( .G(N3), .D(N9), .Q(
        \bundled_ch_f[DATA][5] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][4]  ( .G(N3), .D(N8), .Q(
        \bundled_ch_f[DATA][4] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][3]  ( .G(N3), .D(N7), .Q(
        \bundled_ch_f[DATA][3] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][2]  ( .G(N3), .D(N6), .Q(
        \bundled_ch_f[DATA][2] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][1]  ( .G(N3), .D(N5), .Q(
        \bundled_ch_f[DATA][1] ) );
  HS65_LS_LDLRQX9 \bundled_ch_f_reg[DATA][33]  ( .D(\LEDR_link_f[TOKEN_T] ), 
        .GN(latch_enable), .RN(n1), .Q(\bundled_ch_f[DATA][33] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][32]  ( .G(N3), .D(N36), .Q(
        \bundled_ch_f[DATA][32] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][0]  ( .G(N3), .D(N4), .Q(
        \bundled_ch_f[DATA][0] ) );
  HS65_LSS_XOR2X6 U3 ( .A(\LEDR_link_f[PHIT_PARITY][7] ), .B(
        \LEDR_link_f[PHIT][7] ), .Z(data_cd[7]) );
  HS65_LSS_XOR2X6 U4 ( .A(\LEDR_link_f[PHIT_PARITY][4] ), .B(
        \LEDR_link_f[PHIT][4] ), .Z(data_cd[4]) );
  HS65_LSS_XOR2X6 U5 ( .A(\LEDR_link_f[PHIT_PARITY][3] ), .B(
        \LEDR_link_f[PHIT][3] ), .Z(data_cd[3]) );
  HS65_LSS_XOR2X6 U6 ( .A(\LEDR_link_f[PHIT_PARITY][8] ), .B(
        \LEDR_link_f[PHIT][8] ), .Z(data_cd[8]) );
  HS65_LSS_XOR2X6 U7 ( .A(\LEDR_link_f[PHIT_PARITY][9] ), .B(
        \LEDR_link_f[PHIT][9] ), .Z(data_cd[9]) );
  HS65_LSS_XOR2X6 U8 ( .A(\LEDR_link_f[PHIT_PARITY][16] ), .B(
        \LEDR_link_f[PHIT][16] ), .Z(data_cd[16]) );
  HS65_LSS_XOR2X6 U9 ( .A(\LEDR_link_f[PHIT_PARITY][15] ), .B(
        \LEDR_link_f[PHIT][15] ), .Z(data_cd[15]) );
  HS65_LSS_XOR2X6 U10 ( .A(\LEDR_link_f[PHIT_PARITY][25] ), .B(
        \LEDR_link_f[PHIT][25] ), .Z(data_cd[25]) );
  HS65_LSS_XOR2X6 U11 ( .A(\LEDR_link_f[PHIT_PARITY][24] ), .B(
        \LEDR_link_f[PHIT][24] ), .Z(data_cd[24]) );
  HS65_LSS_XOR2X6 U12 ( .A(\LEDR_link_f[PHIT_PARITY][26] ), .B(
        \LEDR_link_f[PHIT][26] ), .Z(data_cd[26]) );
  HS65_LSS_XOR2X6 U13 ( .A(\LEDR_link_f[PHIT_PARITY][12] ), .B(
        \LEDR_link_f[PHIT][12] ), .Z(data_cd[12]) );
  HS65_LSS_XOR2X6 U14 ( .A(\LEDR_link_f[PHIT_PARITY][1] ), .B(
        \LEDR_link_f[PHIT][1] ), .Z(data_cd[1]) );
  HS65_LSS_XOR2X6 U15 ( .A(\LEDR_link_f[PHIT_PARITY][23] ), .B(
        \LEDR_link_f[PHIT][23] ), .Z(data_cd[23]) );
  HS65_LSS_XOR2X6 U16 ( .A(\LEDR_link_f[PHIT_PARITY][2] ), .B(
        \LEDR_link_f[PHIT][2] ), .Z(data_cd[2]) );
  HS65_LSS_XOR2X6 U17 ( .A(\LEDR_link_f[PHIT_PARITY][30] ), .B(
        \LEDR_link_f[PHIT][30] ), .Z(data_cd[30]) );
  HS65_LSS_XOR2X6 U18 ( .A(\LEDR_link_f[PHIT_PARITY][19] ), .B(
        \LEDR_link_f[PHIT][19] ), .Z(data_cd[19]) );
  HS65_LSS_XOR2X6 U19 ( .A(\LEDR_link_f[PHIT_PARITY][22] ), .B(
        \LEDR_link_f[PHIT][22] ), .Z(data_cd[22]) );
  HS65_LSS_XOR2X6 U20 ( .A(\LEDR_link_f[PHIT_PARITY][11] ), .B(
        \LEDR_link_f[PHIT][11] ), .Z(data_cd[11]) );
  HS65_LSS_XOR2X6 U21 ( .A(\LEDR_link_f[PHIT_PARITY][27] ), .B(
        \LEDR_link_f[PHIT][27] ), .Z(data_cd[27]) );
  HS65_LSS_XOR2X6 U22 ( .A(\LEDR_link_f[PHIT_PARITY][0] ), .B(
        \LEDR_link_f[PHIT][0] ), .Z(data_cd[0]) );
  HS65_LSS_XOR2X6 U23 ( .A(\LEDR_link_f[PHIT_PARITY][10] ), .B(
        \LEDR_link_f[PHIT][10] ), .Z(data_cd[10]) );
  HS65_LSS_XOR2X6 U24 ( .A(\LEDR_link_f[PHIT_PARITY][13] ), .B(
        \LEDR_link_f[PHIT][13] ), .Z(data_cd[13]) );
  HS65_LSS_XOR2X6 U25 ( .A(\LEDR_link_f[PHIT_PARITY][14] ), .B(
        \LEDR_link_f[PHIT][14] ), .Z(data_cd[14]) );
  HS65_LSS_XOR2X6 U26 ( .A(\LEDR_link_f[PHIT_PARITY][17] ), .B(
        \LEDR_link_f[PHIT][17] ), .Z(data_cd[17]) );
  HS65_LSS_XOR2X6 U27 ( .A(\LEDR_link_f[PHIT_PARITY][18] ), .B(
        \LEDR_link_f[PHIT][18] ), .Z(data_cd[18]) );
  HS65_LSS_XOR2X6 U28 ( .A(\LEDR_link_f[PHIT_PARITY][20] ), .B(
        \LEDR_link_f[PHIT][20] ), .Z(data_cd[20]) );
  HS65_LSS_XOR2X6 U29 ( .A(\LEDR_link_f[PHIT_PARITY][21] ), .B(
        \LEDR_link_f[PHIT][21] ), .Z(data_cd[21]) );
  HS65_LSS_XOR2X6 U30 ( .A(\LEDR_link_f[PHIT_PARITY][28] ), .B(
        \LEDR_link_f[PHIT][28] ), .Z(data_cd[28]) );
  HS65_LSS_XOR2X6 U31 ( .A(\LEDR_link_f[PHIT_PARITY][29] ), .B(
        \LEDR_link_f[PHIT][29] ), .Z(data_cd[29]) );
  HS65_LSS_XOR2X6 U32 ( .A(\LEDR_link_f[PHIT_PARITY][31] ), .B(
        \LEDR_link_f[PHIT][31] ), .Z(data_cd[31]) );
  HS65_LSS_XOR2X6 U33 ( .A(\LEDR_link_f[PHIT_PARITY][32] ), .B(
        \LEDR_link_f[PHIT][32] ), .Z(data_cd[32]) );
  HS65_LSS_XOR2X6 U34 ( .A(\LEDR_link_f[PHIT_PARITY][5] ), .B(
        \LEDR_link_f[PHIT][5] ), .Z(data_cd[5]) );
  HS65_LSS_XOR2X6 U35 ( .A(\LEDR_link_f[PHIT_PARITY][6] ), .B(
        \LEDR_link_f[PHIT][6] ), .Z(data_cd[6]) );
  HS65_LSS_XNOR2X6 U36 ( .A(n3), .B(\LEDR_link_f[TOKEN_PARITY] ), .Z(
        token_phase) );
  HS65_LS_IVX9 U37 ( .A(preset), .Z(n1) );
  HS65_LS_IVX9 U38 ( .A(\LEDR_link_f[TOKEN_T] ), .Z(n3) );
  HS65_LS_NOR2AX3 U39 ( .A(\LEDR_link_f[PHIT][0] ), .B(preset), .Z(N4) );
  HS65_LS_NOR2AX3 U40 ( .A(\LEDR_link_f[PHIT][1] ), .B(preset), .Z(N5) );
  HS65_LS_NOR2AX3 U41 ( .A(\LEDR_link_f[PHIT][2] ), .B(preset), .Z(N6) );
  HS65_LS_NOR2AX3 U42 ( .A(\LEDR_link_f[PHIT][3] ), .B(preset), .Z(N7) );
  HS65_LS_NOR2AX3 U43 ( .A(\LEDR_link_f[PHIT][4] ), .B(preset), .Z(N8) );
  HS65_LS_NOR2AX3 U44 ( .A(\LEDR_link_f[PHIT][6] ), .B(preset), .Z(N10) );
  HS65_LS_NOR2AX3 U45 ( .A(\LEDR_link_f[PHIT][24] ), .B(preset), .Z(N28) );
  HS65_LS_NOR2AX3 U46 ( .A(\LEDR_link_f[PHIT][25] ), .B(preset), .Z(N29) );
  HS65_LS_NOR2AX3 U47 ( .A(\LEDR_link_f[PHIT][26] ), .B(preset), .Z(N30) );
  HS65_LS_NOR2AX3 U48 ( .A(\LEDR_link_f[PHIT][27] ), .B(preset), .Z(N31) );
  HS65_LS_NOR2AX3 U49 ( .A(\LEDR_link_f[PHIT][28] ), .B(preset), .Z(N32) );
  HS65_LS_NOR2AX3 U50 ( .A(\LEDR_link_f[PHIT][29] ), .B(preset), .Z(N33) );
  HS65_LS_NOR2AX3 U51 ( .A(\LEDR_link_f[PHIT][30] ), .B(preset), .Z(N34) );
  HS65_LS_NOR2AX3 U52 ( .A(\LEDR_link_f[PHIT][31] ), .B(preset), .Z(N35) );
  HS65_LS_NOR2AX3 U53 ( .A(\LEDR_link_f[PHIT][32] ), .B(preset), .Z(N36) );
  HS65_LS_NOR2AX3 U54 ( .A(\LEDR_link_f[PHIT][5] ), .B(preset), .Z(N9) );
  HS65_LS_NOR2AX3 U55 ( .A(\LEDR_link_f[PHIT][7] ), .B(preset), .Z(N11) );
  HS65_LS_NOR2AX3 U56 ( .A(\LEDR_link_f[PHIT][8] ), .B(preset), .Z(N12) );
  HS65_LS_NOR2AX3 U57 ( .A(\LEDR_link_f[PHIT][9] ), .B(preset), .Z(N13) );
  HS65_LS_NOR2AX3 U58 ( .A(\LEDR_link_f[PHIT][10] ), .B(preset), .Z(N14) );
  HS65_LS_NOR2AX3 U59 ( .A(\LEDR_link_f[PHIT][11] ), .B(preset), .Z(N15) );
  HS65_LS_NOR2AX3 U60 ( .A(\LEDR_link_f[PHIT][12] ), .B(preset), .Z(N16) );
  HS65_LS_NOR2AX3 U61 ( .A(\LEDR_link_f[PHIT][13] ), .B(preset), .Z(N17) );
  HS65_LS_NOR2AX3 U62 ( .A(\LEDR_link_f[PHIT][14] ), .B(preset), .Z(N18) );
  HS65_LS_NOR2AX3 U63 ( .A(\LEDR_link_f[PHIT][15] ), .B(preset), .Z(N19) );
  HS65_LS_NOR2AX3 U64 ( .A(\LEDR_link_f[PHIT][16] ), .B(preset), .Z(N20) );
  HS65_LS_NOR2AX3 U65 ( .A(\LEDR_link_f[PHIT][17] ), .B(preset), .Z(N21) );
  HS65_LS_NOR2AX3 U66 ( .A(\LEDR_link_f[PHIT][18] ), .B(preset), .Z(N22) );
  HS65_LS_NOR2AX3 U67 ( .A(\LEDR_link_f[PHIT][19] ), .B(preset), .Z(N23) );
  HS65_LS_NOR2AX3 U68 ( .A(\LEDR_link_f[PHIT][20] ), .B(preset), .Z(N24) );
  HS65_LS_NOR2AX3 U69 ( .A(\LEDR_link_f[PHIT][21] ), .B(preset), .Z(N25) );
  HS65_LS_NOR2AX3 U70 ( .A(\LEDR_link_f[PHIT][22] ), .B(preset), .Z(N26) );
  HS65_LS_NOR2AX3 U71 ( .A(\LEDR_link_f[PHIT][23] ), .B(preset), .Z(N27) );
  HS65_LS_OAI21X3 U72 ( .A(latch_enable), .B(n3), .C(n1), .Z(N3) );
  HS65_LSS_XOR2X6 U73 ( .A(empty_phase), .B(data_cd_phase), .Z(req_in) );
endmodule


module select_element_2 ( preset, \input , true, false, sel );
  input preset, \input , sel;
  output true, false;
  wire   n1, n2, n3;

  HS65_LS_LDHRQX9 true_latch_out_reg ( .G(sel), .D(n1), .RN(n3), .Q(true) );
  HS65_LS_LDLRQX9 false_latch_out_reg ( .D(n2), .GN(sel), .RN(n3), .Q(false)
         );
  HS65_LSS_XOR2X6 U3 ( .A(\input ), .B(false), .Z(n1) );
  HS65_LS_IVX9 U4 ( .A(preset), .Z(n3) );
  HS65_LSS_XOR2X6 U5 ( .A(\input ), .B(true), .Z(n2) );
endmodule


module sr_latch_0_14 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X18 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(qn), .Z(N1) );
  HS65_LS_IVX9 U2 ( .A(r), .Z(n1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_12 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_14 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_OAI12X6 U3 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LH_AND3X4 U4 ( .A(b), .B(n1), .C(a), .Z(set) );
  HS65_LS_IVX9 U5 ( .A(preset), .Z(n1) );
endmodule


module sr_latch_0_13 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X18 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_generic_0_33_2 ( preset, \input , \output  );
  input [32:0] \input ;
  input preset;
  output \output ;
  wire   set, reset, n1, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75;

  sr_latch_0_13 latch ( .s(set), .r(reset), .q(\output ) );
  HS65_LH_NOR4ABX2 U3 ( .A(\input [2]), .B(\input [30]), .C(n74), .D(n73), .Z(
        n52) );
  HS65_LS_NAND4ABX19 U4 ( .A(\input [30]), .B(\input [2]), .C(n72), .D(n73), 
        .Z(n43) );
  HS65_LS_OAI12X6 U5 ( .A(n49), .B(n48), .C(n1), .Z(reset) );
  HS65_LS_NAND4ABX19 U6 ( .A(n47), .B(n46), .C(n45), .D(n44), .Z(n48) );
  HS65_LS_NOR4ABX4 U7 ( .A(n66), .B(n67), .C(\input [16]), .D(\input [15]), 
        .Z(n44) );
  HS65_LS_NOR4ABX4 U8 ( .A(n74), .B(n75), .C(\input [4]), .D(\input [3]), .Z(
        n40) );
  HS65_LS_NOR4ABX4 U9 ( .A(n61), .B(n65), .C(\input [12]), .D(\input [11]), 
        .Z(n45) );
  HS65_LS_NAND4ABX13 U10 ( .A(\input [23]), .B(\input [22]), .C(n70), .D(n71), 
        .Z(n47) );
  HS65_LS_NAND4ABX6 U11 ( .A(n43), .B(n42), .C(n41), .D(n40), .Z(n49) );
  HS65_LS_NAND3X13 U12 ( .A(n62), .B(n63), .C(n39), .Z(n42) );
  HS65_LS_NOR3X13 U13 ( .A(\input [7]), .B(\input [9]), .C(\input [8]), .Z(n39) );
  HS65_LS_IVX9 U14 ( .A(\input [17]), .Z(n68) );
  HS65_LS_IVX9 U15 ( .A(\input [20]), .Z(n70) );
  HS65_LS_NAND4ABX6 U16 ( .A(\input [1]), .B(\input [19]), .C(n68), .D(n69), 
        .Z(n46) );
  HS65_LS_IVX9 U17 ( .A(\input [28]), .Z(n72) );
  HS65_LS_IVX9 U18 ( .A(\input [18]), .Z(n69) );
  HS65_LS_IVX9 U19 ( .A(\input [21]), .Z(n71) );
  HS65_LS_IVX9 U20 ( .A(\input [29]), .Z(n73) );
  HS65_LS_IVX9 U21 ( .A(\input [5]), .Z(n62) );
  HS65_LS_IVX9 U22 ( .A(\input [6]), .Z(n63) );
  HS65_LS_IVX9 U23 ( .A(\input [13]), .Z(n66) );
  HS65_LS_IVX9 U24 ( .A(\input [31]), .Z(n74) );
  HS65_LS_IVX9 U25 ( .A(\input [10]), .Z(n65) );
  HS65_LS_IVX9 U26 ( .A(\input [0]), .Z(n61) );
  HS65_LS_IVX9 U27 ( .A(\input [14]), .Z(n67) );
  HS65_LS_IVX9 U28 ( .A(\input [32]), .Z(n75) );
  HS65_LS_NOR4X4 U29 ( .A(\input [24]), .B(\input [25]), .C(\input [27]), .D(
        \input [26]), .Z(n41) );
  HS65_LS_NOR3X4 U30 ( .A(n65), .B(preset), .C(n61), .Z(n56) );
  HS65_LS_NOR3AX2 U31 ( .A(\input [27]), .B(n50), .C(n72), .Z(n51) );
  HS65_LS_IVX9 U32 ( .A(preset), .Z(n1) );
  HS65_LS_NOR4ABX2 U33 ( .A(\input [23]), .B(\input [22]), .C(n70), .D(n71), 
        .Z(n60) );
  HS65_LS_NOR4ABX2 U34 ( .A(\input [1]), .B(\input [19]), .C(n68), .D(n69), 
        .Z(n59) );
  HS65_LS_NOR4ABX2 U35 ( .A(n60), .B(n59), .C(n58), .D(n57), .Z(set) );
  HS65_LS_NAND4ABX3 U36 ( .A(n54), .B(n53), .C(n52), .D(n51), .Z(n58) );
  HS65_LS_NOR4ABX2 U37 ( .A(\input [16]), .B(\input [15]), .C(n66), .D(n67), 
        .Z(n55) );
  HS65_LS_NAND3X5 U38 ( .A(\input [25]), .B(\input [24]), .C(\input [26]), .Z(
        n50) );
  HS65_LS_NAND4ABX3 U39 ( .A(n75), .B(n62), .C(\input [3]), .D(\input [4]), 
        .Z(n54) );
  HS65_LS_NAND4ABX3 U40 ( .A(n63), .B(n64), .C(\input [7]), .D(\input [8]), 
        .Z(n53) );
  HS65_LS_NAND4X9 U41 ( .A(\input [11]), .B(\input [12]), .C(n56), .D(n55), 
        .Z(n57) );
  HS65_LS_IVX9 U42 ( .A(\input [9]), .Z(n64) );
endmodule


module sr_latch_0_7 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LH_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LH_IVX62 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_7 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_7 latch ( .s(set), .r(reset), .q(c) );
  HS65_LH_OAI21X2 U3 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_IVX9 U4 ( .A(preset), .Z(n1) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_7 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   not_Ain, d, n1, n2, n3, n4;

  c_gate_0_7 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Rout) );
  HS65_LS_IVX9 I_1 ( .A(n1), .Z(Aout) );
  HS65_LS_IVX9 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LH_IVX2 I_2 ( .A(Rout), .Z(d) );
  HS65_LS_BFX9 U1 ( .A(n3), .Z(n1) );
  HS65_LH_IVX106 U2 ( .A(n4), .Z(n2) );
  HS65_LH_BFX2 U3 ( .A(d), .Z(n4) );
  HS65_LS_IVX9 U4 ( .A(n2), .Z(n3) );
  HS65_LSS_XOR2X6 U5 ( .A(Rout), .B(Ain), .Z(lt_en) );
endmodule


module LEDR2bundled_1_000000000_2 ( preset, .LEDR_link_f({
        \LEDR_link_f[TOKEN_T] , \LEDR_link_f[TOKEN_PARITY] , 
        \LEDR_link_f[PHIT][32] , \LEDR_link_f[PHIT][31] , 
        \LEDR_link_f[PHIT][30] , \LEDR_link_f[PHIT][29] , 
        \LEDR_link_f[PHIT][28] , \LEDR_link_f[PHIT][27] , 
        \LEDR_link_f[PHIT][26] , \LEDR_link_f[PHIT][25] , 
        \LEDR_link_f[PHIT][24] , \LEDR_link_f[PHIT][23] , 
        \LEDR_link_f[PHIT][22] , \LEDR_link_f[PHIT][21] , 
        \LEDR_link_f[PHIT][20] , \LEDR_link_f[PHIT][19] , 
        \LEDR_link_f[PHIT][18] , \LEDR_link_f[PHIT][17] , 
        \LEDR_link_f[PHIT][16] , \LEDR_link_f[PHIT][15] , 
        \LEDR_link_f[PHIT][14] , \LEDR_link_f[PHIT][13] , 
        \LEDR_link_f[PHIT][12] , \LEDR_link_f[PHIT][11] , 
        \LEDR_link_f[PHIT][10] , \LEDR_link_f[PHIT][9] , 
        \LEDR_link_f[PHIT][8] , \LEDR_link_f[PHIT][7] , \LEDR_link_f[PHIT][6] , 
        \LEDR_link_f[PHIT][5] , \LEDR_link_f[PHIT][4] , \LEDR_link_f[PHIT][3] , 
        \LEDR_link_f[PHIT][2] , \LEDR_link_f[PHIT][1] , \LEDR_link_f[PHIT][0] , 
        \LEDR_link_f[PHIT_PARITY][32] , \LEDR_link_f[PHIT_PARITY][31] , 
        \LEDR_link_f[PHIT_PARITY][30] , \LEDR_link_f[PHIT_PARITY][29] , 
        \LEDR_link_f[PHIT_PARITY][28] , \LEDR_link_f[PHIT_PARITY][27] , 
        \LEDR_link_f[PHIT_PARITY][26] , \LEDR_link_f[PHIT_PARITY][25] , 
        \LEDR_link_f[PHIT_PARITY][24] , \LEDR_link_f[PHIT_PARITY][23] , 
        \LEDR_link_f[PHIT_PARITY][22] , \LEDR_link_f[PHIT_PARITY][21] , 
        \LEDR_link_f[PHIT_PARITY][20] , \LEDR_link_f[PHIT_PARITY][19] , 
        \LEDR_link_f[PHIT_PARITY][18] , \LEDR_link_f[PHIT_PARITY][17] , 
        \LEDR_link_f[PHIT_PARITY][16] , \LEDR_link_f[PHIT_PARITY][15] , 
        \LEDR_link_f[PHIT_PARITY][14] , \LEDR_link_f[PHIT_PARITY][13] , 
        \LEDR_link_f[PHIT_PARITY][12] , \LEDR_link_f[PHIT_PARITY][11] , 
        \LEDR_link_f[PHIT_PARITY][10] , \LEDR_link_f[PHIT_PARITY][9] , 
        \LEDR_link_f[PHIT_PARITY][8] , \LEDR_link_f[PHIT_PARITY][7] , 
        \LEDR_link_f[PHIT_PARITY][6] , \LEDR_link_f[PHIT_PARITY][5] , 
        \LEDR_link_f[PHIT_PARITY][4] , \LEDR_link_f[PHIT_PARITY][3] , 
        \LEDR_link_f[PHIT_PARITY][2] , \LEDR_link_f[PHIT_PARITY][1] , 
        \LEDR_link_f[PHIT_PARITY][0] }), .LEDR_link_b(\LEDR_link_b[ACK] ), 
    .bundled_ch_f({\bundled_ch_f[REQ] , \bundled_ch_f[DATA][33] , 
        \bundled_ch_f[DATA][32] , \bundled_ch_f[DATA][31] , 
        \bundled_ch_f[DATA][30] , \bundled_ch_f[DATA][29] , 
        \bundled_ch_f[DATA][28] , \bundled_ch_f[DATA][27] , 
        \bundled_ch_f[DATA][26] , \bundled_ch_f[DATA][25] , 
        \bundled_ch_f[DATA][24] , \bundled_ch_f[DATA][23] , 
        \bundled_ch_f[DATA][22] , \bundled_ch_f[DATA][21] , 
        \bundled_ch_f[DATA][20] , \bundled_ch_f[DATA][19] , 
        \bundled_ch_f[DATA][18] , \bundled_ch_f[DATA][17] , 
        \bundled_ch_f[DATA][16] , \bundled_ch_f[DATA][15] , 
        \bundled_ch_f[DATA][14] , \bundled_ch_f[DATA][13] , 
        \bundled_ch_f[DATA][12] , \bundled_ch_f[DATA][11] , 
        \bundled_ch_f[DATA][10] , \bundled_ch_f[DATA][9] , 
        \bundled_ch_f[DATA][8] , \bundled_ch_f[DATA][7] , 
        \bundled_ch_f[DATA][6] , \bundled_ch_f[DATA][5] , 
        \bundled_ch_f[DATA][4] , \bundled_ch_f[DATA][3] , 
        \bundled_ch_f[DATA][2] , \bundled_ch_f[DATA][1] , 
        \bundled_ch_f[DATA][0] }), .bundled_ch_b(\bundled_ch_b[ACK] ) );
  input preset, \LEDR_link_f[TOKEN_T] , \LEDR_link_f[TOKEN_PARITY] ,
         \LEDR_link_f[PHIT][32] , \LEDR_link_f[PHIT][31] ,
         \LEDR_link_f[PHIT][30] , \LEDR_link_f[PHIT][29] ,
         \LEDR_link_f[PHIT][28] , \LEDR_link_f[PHIT][27] ,
         \LEDR_link_f[PHIT][26] , \LEDR_link_f[PHIT][25] ,
         \LEDR_link_f[PHIT][24] , \LEDR_link_f[PHIT][23] ,
         \LEDR_link_f[PHIT][22] , \LEDR_link_f[PHIT][21] ,
         \LEDR_link_f[PHIT][20] , \LEDR_link_f[PHIT][19] ,
         \LEDR_link_f[PHIT][18] , \LEDR_link_f[PHIT][17] ,
         \LEDR_link_f[PHIT][16] , \LEDR_link_f[PHIT][15] ,
         \LEDR_link_f[PHIT][14] , \LEDR_link_f[PHIT][13] ,
         \LEDR_link_f[PHIT][12] , \LEDR_link_f[PHIT][11] ,
         \LEDR_link_f[PHIT][10] , \LEDR_link_f[PHIT][9] ,
         \LEDR_link_f[PHIT][8] , \LEDR_link_f[PHIT][7] ,
         \LEDR_link_f[PHIT][6] , \LEDR_link_f[PHIT][5] ,
         \LEDR_link_f[PHIT][4] , \LEDR_link_f[PHIT][3] ,
         \LEDR_link_f[PHIT][2] , \LEDR_link_f[PHIT][1] ,
         \LEDR_link_f[PHIT][0] , \LEDR_link_f[PHIT_PARITY][32] ,
         \LEDR_link_f[PHIT_PARITY][31] , \LEDR_link_f[PHIT_PARITY][30] ,
         \LEDR_link_f[PHIT_PARITY][29] , \LEDR_link_f[PHIT_PARITY][28] ,
         \LEDR_link_f[PHIT_PARITY][27] , \LEDR_link_f[PHIT_PARITY][26] ,
         \LEDR_link_f[PHIT_PARITY][25] , \LEDR_link_f[PHIT_PARITY][24] ,
         \LEDR_link_f[PHIT_PARITY][23] , \LEDR_link_f[PHIT_PARITY][22] ,
         \LEDR_link_f[PHIT_PARITY][21] , \LEDR_link_f[PHIT_PARITY][20] ,
         \LEDR_link_f[PHIT_PARITY][19] , \LEDR_link_f[PHIT_PARITY][18] ,
         \LEDR_link_f[PHIT_PARITY][17] , \LEDR_link_f[PHIT_PARITY][16] ,
         \LEDR_link_f[PHIT_PARITY][15] , \LEDR_link_f[PHIT_PARITY][14] ,
         \LEDR_link_f[PHIT_PARITY][13] , \LEDR_link_f[PHIT_PARITY][12] ,
         \LEDR_link_f[PHIT_PARITY][11] , \LEDR_link_f[PHIT_PARITY][10] ,
         \LEDR_link_f[PHIT_PARITY][9] , \LEDR_link_f[PHIT_PARITY][8] ,
         \LEDR_link_f[PHIT_PARITY][7] , \LEDR_link_f[PHIT_PARITY][6] ,
         \LEDR_link_f[PHIT_PARITY][5] , \LEDR_link_f[PHIT_PARITY][4] ,
         \LEDR_link_f[PHIT_PARITY][3] , \LEDR_link_f[PHIT_PARITY][2] ,
         \LEDR_link_f[PHIT_PARITY][1] , \LEDR_link_f[PHIT_PARITY][0] ,
         \bundled_ch_b[ACK] ;
  output \LEDR_link_b[ACK] , \bundled_ch_f[REQ] , \bundled_ch_f[DATA][33] ,
         \bundled_ch_f[DATA][32] , \bundled_ch_f[DATA][31] ,
         \bundled_ch_f[DATA][30] , \bundled_ch_f[DATA][29] ,
         \bundled_ch_f[DATA][28] , \bundled_ch_f[DATA][27] ,
         \bundled_ch_f[DATA][26] , \bundled_ch_f[DATA][25] ,
         \bundled_ch_f[DATA][24] , \bundled_ch_f[DATA][23] ,
         \bundled_ch_f[DATA][22] , \bundled_ch_f[DATA][21] ,
         \bundled_ch_f[DATA][20] , \bundled_ch_f[DATA][19] ,
         \bundled_ch_f[DATA][18] , \bundled_ch_f[DATA][17] ,
         \bundled_ch_f[DATA][16] , \bundled_ch_f[DATA][15] ,
         \bundled_ch_f[DATA][14] , \bundled_ch_f[DATA][13] ,
         \bundled_ch_f[DATA][12] , \bundled_ch_f[DATA][11] ,
         \bundled_ch_f[DATA][10] , \bundled_ch_f[DATA][9] ,
         \bundled_ch_f[DATA][8] , \bundled_ch_f[DATA][7] ,
         \bundled_ch_f[DATA][6] , \bundled_ch_f[DATA][5] ,
         \bundled_ch_f[DATA][4] , \bundled_ch_f[DATA][3] ,
         \bundled_ch_f[DATA][2] , \bundled_ch_f[DATA][1] ,
         \bundled_ch_f[DATA][0] ;
  wire   token_phase, full_phase, empty_phase, data_phase, data_cd_phase,
         req_in, latch_enable, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13,
         N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27,
         N28, N29, N30, N31, N32, N33, N34, N35, N36, n1, n3;
  wire   [32:0] data_cd;

  select_element_2 select_element ( .preset(preset), .\input (token_phase), 
        .true(full_phase), .false(empty_phase), .sel(\LEDR_link_f[TOKEN_T] )
         );
  c_gate_0_12 data_cd_c ( .preset(preset), .a(full_phase), .b(data_phase), .c(
        data_cd_phase) );
  c_gate_generic_0_33_2 data_ch ( .preset(preset), .\input (data_cd), 
        .\output (data_phase) );
  latch_controller_1_7 latch_controller ( .preset(preset), .Rin(req_in), 
        .Aout(\LEDR_link_b[ACK] ), .Rout(\bundled_ch_f[REQ] ), .Ain(
        \bundled_ch_b[ACK] ), .lt_en(latch_enable) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][31]  ( .G(N3), .D(N35), .Q(
        \bundled_ch_f[DATA][31] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][30]  ( .G(N3), .D(N34), .Q(
        \bundled_ch_f[DATA][30] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][29]  ( .G(N3), .D(N33), .Q(
        \bundled_ch_f[DATA][29] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][28]  ( .G(N3), .D(N32), .Q(
        \bundled_ch_f[DATA][28] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][27]  ( .G(N3), .D(N31), .Q(
        \bundled_ch_f[DATA][27] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][26]  ( .G(N3), .D(N30), .Q(
        \bundled_ch_f[DATA][26] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][25]  ( .G(N3), .D(N29), .Q(
        \bundled_ch_f[DATA][25] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][24]  ( .G(N3), .D(N28), .Q(
        \bundled_ch_f[DATA][24] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][23]  ( .G(N3), .D(N27), .Q(
        \bundled_ch_f[DATA][23] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][22]  ( .G(N3), .D(N26), .Q(
        \bundled_ch_f[DATA][22] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][21]  ( .G(N3), .D(N25), .Q(
        \bundled_ch_f[DATA][21] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][20]  ( .G(N3), .D(N24), .Q(
        \bundled_ch_f[DATA][20] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][19]  ( .G(N3), .D(N23), .Q(
        \bundled_ch_f[DATA][19] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][18]  ( .G(N3), .D(N22), .Q(
        \bundled_ch_f[DATA][18] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][17]  ( .G(N3), .D(N21), .Q(
        \bundled_ch_f[DATA][17] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][16]  ( .G(N3), .D(N20), .Q(
        \bundled_ch_f[DATA][16] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][15]  ( .G(N3), .D(N19), .Q(
        \bundled_ch_f[DATA][15] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][14]  ( .G(N3), .D(N18), .Q(
        \bundled_ch_f[DATA][14] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][13]  ( .G(N3), .D(N17), .Q(
        \bundled_ch_f[DATA][13] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][12]  ( .G(N3), .D(N16), .Q(
        \bundled_ch_f[DATA][12] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][11]  ( .G(N3), .D(N15), .Q(
        \bundled_ch_f[DATA][11] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][10]  ( .G(N3), .D(N14), .Q(
        \bundled_ch_f[DATA][10] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][9]  ( .G(N3), .D(N13), .Q(
        \bundled_ch_f[DATA][9] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][8]  ( .G(N3), .D(N12), .Q(
        \bundled_ch_f[DATA][8] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][7]  ( .G(N3), .D(N11), .Q(
        \bundled_ch_f[DATA][7] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][6]  ( .G(N3), .D(N10), .Q(
        \bundled_ch_f[DATA][6] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][5]  ( .G(N3), .D(N9), .Q(
        \bundled_ch_f[DATA][5] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][4]  ( .G(N3), .D(N8), .Q(
        \bundled_ch_f[DATA][4] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][3]  ( .G(N3), .D(N7), .Q(
        \bundled_ch_f[DATA][3] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][2]  ( .G(N3), .D(N6), .Q(
        \bundled_ch_f[DATA][2] ) );
  HS65_LS_LDLRQX9 \bundled_ch_f_reg[DATA][33]  ( .D(\LEDR_link_f[TOKEN_T] ), 
        .GN(latch_enable), .RN(n1), .Q(\bundled_ch_f[DATA][33] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][1]  ( .G(N3), .D(N5), .Q(
        \bundled_ch_f[DATA][1] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][32]  ( .G(N3), .D(N36), .Q(
        \bundled_ch_f[DATA][32] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][0]  ( .G(N3), .D(N4), .Q(
        \bundled_ch_f[DATA][0] ) );
  HS65_LSS_XOR2X6 U3 ( .A(\LEDR_link_f[PHIT_PARITY][7] ), .B(
        \LEDR_link_f[PHIT][7] ), .Z(data_cd[7]) );
  HS65_LSS_XOR2X6 U4 ( .A(\LEDR_link_f[PHIT_PARITY][4] ), .B(
        \LEDR_link_f[PHIT][4] ), .Z(data_cd[4]) );
  HS65_LSS_XOR2X6 U5 ( .A(\LEDR_link_f[PHIT_PARITY][3] ), .B(
        \LEDR_link_f[PHIT][3] ), .Z(data_cd[3]) );
  HS65_LSS_XOR2X6 U6 ( .A(\LEDR_link_f[PHIT_PARITY][8] ), .B(
        \LEDR_link_f[PHIT][8] ), .Z(data_cd[8]) );
  HS65_LSS_XOR2X6 U7 ( .A(\LEDR_link_f[PHIT_PARITY][9] ), .B(
        \LEDR_link_f[PHIT][9] ), .Z(data_cd[9]) );
  HS65_LSS_XOR2X6 U8 ( .A(\LEDR_link_f[PHIT_PARITY][16] ), .B(
        \LEDR_link_f[PHIT][16] ), .Z(data_cd[16]) );
  HS65_LSS_XOR2X6 U9 ( .A(\LEDR_link_f[PHIT_PARITY][15] ), .B(
        \LEDR_link_f[PHIT][15] ), .Z(data_cd[15]) );
  HS65_LSS_XOR2X6 U10 ( .A(\LEDR_link_f[PHIT_PARITY][25] ), .B(
        \LEDR_link_f[PHIT][25] ), .Z(data_cd[25]) );
  HS65_LSS_XOR2X6 U11 ( .A(\LEDR_link_f[PHIT_PARITY][24] ), .B(
        \LEDR_link_f[PHIT][24] ), .Z(data_cd[24]) );
  HS65_LSS_XOR2X6 U12 ( .A(\LEDR_link_f[PHIT_PARITY][26] ), .B(
        \LEDR_link_f[PHIT][26] ), .Z(data_cd[26]) );
  HS65_LSS_XOR2X6 U13 ( .A(\LEDR_link_f[PHIT_PARITY][12] ), .B(
        \LEDR_link_f[PHIT][12] ), .Z(data_cd[12]) );
  HS65_LSS_XOR2X6 U14 ( .A(\LEDR_link_f[PHIT_PARITY][1] ), .B(
        \LEDR_link_f[PHIT][1] ), .Z(data_cd[1]) );
  HS65_LSS_XOR2X6 U15 ( .A(\LEDR_link_f[PHIT_PARITY][23] ), .B(
        \LEDR_link_f[PHIT][23] ), .Z(data_cd[23]) );
  HS65_LSS_XOR2X6 U16 ( .A(\LEDR_link_f[PHIT_PARITY][2] ), .B(
        \LEDR_link_f[PHIT][2] ), .Z(data_cd[2]) );
  HS65_LSS_XOR2X6 U17 ( .A(\LEDR_link_f[PHIT_PARITY][30] ), .B(
        \LEDR_link_f[PHIT][30] ), .Z(data_cd[30]) );
  HS65_LSS_XOR2X6 U18 ( .A(\LEDR_link_f[PHIT_PARITY][19] ), .B(
        \LEDR_link_f[PHIT][19] ), .Z(data_cd[19]) );
  HS65_LSS_XOR2X6 U19 ( .A(\LEDR_link_f[PHIT_PARITY][22] ), .B(
        \LEDR_link_f[PHIT][22] ), .Z(data_cd[22]) );
  HS65_LSS_XOR2X6 U20 ( .A(\LEDR_link_f[PHIT_PARITY][11] ), .B(
        \LEDR_link_f[PHIT][11] ), .Z(data_cd[11]) );
  HS65_LSS_XOR2X6 U21 ( .A(\LEDR_link_f[PHIT_PARITY][27] ), .B(
        \LEDR_link_f[PHIT][27] ), .Z(data_cd[27]) );
  HS65_LSS_XOR2X6 U22 ( .A(\LEDR_link_f[PHIT_PARITY][0] ), .B(
        \LEDR_link_f[PHIT][0] ), .Z(data_cd[0]) );
  HS65_LSS_XOR2X6 U23 ( .A(\LEDR_link_f[PHIT_PARITY][10] ), .B(
        \LEDR_link_f[PHIT][10] ), .Z(data_cd[10]) );
  HS65_LSS_XOR2X6 U24 ( .A(\LEDR_link_f[PHIT_PARITY][13] ), .B(
        \LEDR_link_f[PHIT][13] ), .Z(data_cd[13]) );
  HS65_LSS_XOR2X6 U25 ( .A(\LEDR_link_f[PHIT_PARITY][14] ), .B(
        \LEDR_link_f[PHIT][14] ), .Z(data_cd[14]) );
  HS65_LSS_XOR2X6 U26 ( .A(\LEDR_link_f[PHIT_PARITY][17] ), .B(
        \LEDR_link_f[PHIT][17] ), .Z(data_cd[17]) );
  HS65_LSS_XOR2X6 U27 ( .A(\LEDR_link_f[PHIT_PARITY][18] ), .B(
        \LEDR_link_f[PHIT][18] ), .Z(data_cd[18]) );
  HS65_LSS_XOR2X6 U28 ( .A(\LEDR_link_f[PHIT_PARITY][20] ), .B(
        \LEDR_link_f[PHIT][20] ), .Z(data_cd[20]) );
  HS65_LSS_XOR2X6 U29 ( .A(\LEDR_link_f[PHIT_PARITY][21] ), .B(
        \LEDR_link_f[PHIT][21] ), .Z(data_cd[21]) );
  HS65_LSS_XOR2X6 U30 ( .A(\LEDR_link_f[PHIT_PARITY][28] ), .B(
        \LEDR_link_f[PHIT][28] ), .Z(data_cd[28]) );
  HS65_LSS_XOR2X6 U31 ( .A(\LEDR_link_f[PHIT_PARITY][29] ), .B(
        \LEDR_link_f[PHIT][29] ), .Z(data_cd[29]) );
  HS65_LSS_XOR2X6 U32 ( .A(\LEDR_link_f[PHIT_PARITY][31] ), .B(
        \LEDR_link_f[PHIT][31] ), .Z(data_cd[31]) );
  HS65_LSS_XOR2X6 U33 ( .A(\LEDR_link_f[PHIT_PARITY][32] ), .B(
        \LEDR_link_f[PHIT][32] ), .Z(data_cd[32]) );
  HS65_LSS_XOR2X6 U34 ( .A(\LEDR_link_f[PHIT_PARITY][5] ), .B(
        \LEDR_link_f[PHIT][5] ), .Z(data_cd[5]) );
  HS65_LSS_XOR2X6 U35 ( .A(\LEDR_link_f[PHIT_PARITY][6] ), .B(
        \LEDR_link_f[PHIT][6] ), .Z(data_cd[6]) );
  HS65_LSS_XNOR2X6 U36 ( .A(n3), .B(\LEDR_link_f[TOKEN_PARITY] ), .Z(
        token_phase) );
  HS65_LS_IVX9 U37 ( .A(preset), .Z(n1) );
  HS65_LS_IVX9 U38 ( .A(\LEDR_link_f[TOKEN_T] ), .Z(n3) );
  HS65_LS_NOR2AX3 U39 ( .A(\LEDR_link_f[PHIT][0] ), .B(preset), .Z(N4) );
  HS65_LS_NOR2AX3 U40 ( .A(\LEDR_link_f[PHIT][1] ), .B(preset), .Z(N5) );
  HS65_LS_NOR2AX3 U41 ( .A(\LEDR_link_f[PHIT][2] ), .B(preset), .Z(N6) );
  HS65_LS_NOR2AX3 U42 ( .A(\LEDR_link_f[PHIT][3] ), .B(preset), .Z(N7) );
  HS65_LS_NOR2AX3 U43 ( .A(\LEDR_link_f[PHIT][4] ), .B(preset), .Z(N8) );
  HS65_LS_NOR2AX3 U44 ( .A(\LEDR_link_f[PHIT][6] ), .B(preset), .Z(N10) );
  HS65_LS_NOR2AX3 U45 ( .A(\LEDR_link_f[PHIT][24] ), .B(preset), .Z(N28) );
  HS65_LS_NOR2AX3 U46 ( .A(\LEDR_link_f[PHIT][25] ), .B(preset), .Z(N29) );
  HS65_LS_NOR2AX3 U47 ( .A(\LEDR_link_f[PHIT][26] ), .B(preset), .Z(N30) );
  HS65_LS_NOR2AX3 U48 ( .A(\LEDR_link_f[PHIT][27] ), .B(preset), .Z(N31) );
  HS65_LS_NOR2AX3 U49 ( .A(\LEDR_link_f[PHIT][28] ), .B(preset), .Z(N32) );
  HS65_LS_NOR2AX3 U50 ( .A(\LEDR_link_f[PHIT][29] ), .B(preset), .Z(N33) );
  HS65_LS_NOR2AX3 U51 ( .A(\LEDR_link_f[PHIT][30] ), .B(preset), .Z(N34) );
  HS65_LS_NOR2AX3 U52 ( .A(\LEDR_link_f[PHIT][31] ), .B(preset), .Z(N35) );
  HS65_LS_NOR2AX3 U53 ( .A(\LEDR_link_f[PHIT][32] ), .B(preset), .Z(N36) );
  HS65_LS_NOR2AX3 U54 ( .A(\LEDR_link_f[PHIT][5] ), .B(preset), .Z(N9) );
  HS65_LS_NOR2AX3 U55 ( .A(\LEDR_link_f[PHIT][7] ), .B(preset), .Z(N11) );
  HS65_LS_NOR2AX3 U56 ( .A(\LEDR_link_f[PHIT][8] ), .B(preset), .Z(N12) );
  HS65_LS_NOR2AX3 U57 ( .A(\LEDR_link_f[PHIT][9] ), .B(preset), .Z(N13) );
  HS65_LS_NOR2AX3 U58 ( .A(\LEDR_link_f[PHIT][10] ), .B(preset), .Z(N14) );
  HS65_LS_NOR2AX3 U59 ( .A(\LEDR_link_f[PHIT][11] ), .B(preset), .Z(N15) );
  HS65_LS_NOR2AX3 U60 ( .A(\LEDR_link_f[PHIT][12] ), .B(preset), .Z(N16) );
  HS65_LS_NOR2AX3 U61 ( .A(\LEDR_link_f[PHIT][13] ), .B(preset), .Z(N17) );
  HS65_LS_NOR2AX3 U62 ( .A(\LEDR_link_f[PHIT][14] ), .B(preset), .Z(N18) );
  HS65_LS_NOR2AX3 U63 ( .A(\LEDR_link_f[PHIT][15] ), .B(preset), .Z(N19) );
  HS65_LS_NOR2AX3 U64 ( .A(\LEDR_link_f[PHIT][16] ), .B(preset), .Z(N20) );
  HS65_LS_NOR2AX3 U65 ( .A(\LEDR_link_f[PHIT][17] ), .B(preset), .Z(N21) );
  HS65_LS_NOR2AX3 U66 ( .A(\LEDR_link_f[PHIT][18] ), .B(preset), .Z(N22) );
  HS65_LS_NOR2AX3 U67 ( .A(\LEDR_link_f[PHIT][19] ), .B(preset), .Z(N23) );
  HS65_LS_NOR2AX3 U68 ( .A(\LEDR_link_f[PHIT][20] ), .B(preset), .Z(N24) );
  HS65_LS_NOR2AX3 U69 ( .A(\LEDR_link_f[PHIT][21] ), .B(preset), .Z(N25) );
  HS65_LS_NOR2AX3 U70 ( .A(\LEDR_link_f[PHIT][22] ), .B(preset), .Z(N26) );
  HS65_LS_NOR2AX3 U71 ( .A(\LEDR_link_f[PHIT][23] ), .B(preset), .Z(N27) );
  HS65_LS_OAI21X3 U72 ( .A(latch_enable), .B(n3), .C(n1), .Z(N3) );
  HS65_LSS_XOR2X6 U73 ( .A(empty_phase), .B(data_cd_phase), .Z(req_in) );
endmodule


module select_element_3 ( preset, \input , true, false, sel );
  input preset, \input , sel;
  output true, false;
  wire   n1, n2, n3;

  HS65_LS_LDHRQX9 true_latch_out_reg ( .G(sel), .D(n1), .RN(n3), .Q(true) );
  HS65_LS_LDLRQX9 false_latch_out_reg ( .D(n2), .GN(sel), .RN(n3), .Q(false)
         );
  HS65_LSS_XOR2X6 U3 ( .A(\input ), .B(false), .Z(n1) );
  HS65_LS_IVX9 U4 ( .A(preset), .Z(n3) );
  HS65_LSS_XOR2X6 U5 ( .A(\input ), .B(true), .Z(n2) );
endmodule


module sr_latch_0_16 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X18 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(qn), .Z(N1) );
  HS65_LS_IVX9 U2 ( .A(r), .Z(n1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_13 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_16 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_OAI12X6 U3 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LH_AND3X4 U4 ( .A(b), .B(n1), .C(a), .Z(set) );
  HS65_LS_IVX9 U5 ( .A(preset), .Z(n1) );
endmodule


module sr_latch_0_15 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X18 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_generic_0_33_3 ( preset, \input , \output  );
  input [32:0] \input ;
  input preset;
  output \output ;
  wire   set, reset, n1, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75;

  sr_latch_0_15 latch ( .s(set), .r(reset), .q(\output ) );
  HS65_LS_NAND4ABX6 U3 ( .A(\input [30]), .B(\input [2]), .C(n72), .D(n73), 
        .Z(n43) );
  HS65_LS_OAI12X6 U4 ( .A(n49), .B(n48), .C(n1), .Z(reset) );
  HS65_LS_NAND4ABX6 U5 ( .A(n43), .B(n42), .C(n41), .D(n40), .Z(n49) );
  HS65_LS_NAND3X13 U6 ( .A(n62), .B(n63), .C(n39), .Z(n42) );
  HS65_LS_NOR3X13 U7 ( .A(\input [7]), .B(\input [9]), .C(\input [8]), .Z(n39)
         );
  HS65_LS_NOR4ABX4 U8 ( .A(n66), .B(n67), .C(\input [16]), .D(\input [15]), 
        .Z(n44) );
  HS65_LS_NOR4ABX4 U9 ( .A(n74), .B(n75), .C(\input [4]), .D(\input [3]), .Z(
        n40) );
  HS65_LS_NOR4ABX4 U10 ( .A(n61), .B(n65), .C(\input [12]), .D(\input [11]), 
        .Z(n45) );
  HS65_LS_NAND4ABX6 U11 ( .A(n47), .B(n46), .C(n45), .D(n44), .Z(n48) );
  HS65_LS_IVX9 U12 ( .A(\input [17]), .Z(n68) );
  HS65_LS_IVX9 U13 ( .A(\input [20]), .Z(n70) );
  HS65_LS_NAND4ABX6 U14 ( .A(\input [23]), .B(\input [22]), .C(n70), .D(n71), 
        .Z(n47) );
  HS65_LS_NAND4ABX6 U15 ( .A(\input [1]), .B(\input [19]), .C(n68), .D(n69), 
        .Z(n46) );
  HS65_LS_IVX9 U16 ( .A(\input [28]), .Z(n72) );
  HS65_LS_IVX9 U17 ( .A(\input [18]), .Z(n69) );
  HS65_LS_IVX9 U18 ( .A(\input [21]), .Z(n71) );
  HS65_LS_IVX9 U19 ( .A(\input [29]), .Z(n73) );
  HS65_LS_IVX9 U20 ( .A(\input [5]), .Z(n62) );
  HS65_LS_IVX9 U21 ( .A(\input [6]), .Z(n63) );
  HS65_LS_IVX9 U22 ( .A(\input [13]), .Z(n66) );
  HS65_LS_IVX9 U23 ( .A(\input [31]), .Z(n74) );
  HS65_LS_IVX9 U24 ( .A(\input [10]), .Z(n65) );
  HS65_LS_IVX9 U25 ( .A(\input [0]), .Z(n61) );
  HS65_LS_IVX9 U26 ( .A(\input [14]), .Z(n67) );
  HS65_LS_IVX9 U27 ( .A(\input [32]), .Z(n75) );
  HS65_LS_NOR4X4 U28 ( .A(\input [24]), .B(\input [25]), .C(\input [27]), .D(
        \input [26]), .Z(n41) );
  HS65_LS_NOR3X4 U29 ( .A(n65), .B(preset), .C(n61), .Z(n56) );
  HS65_LS_NOR3AX2 U30 ( .A(\input [27]), .B(n50), .C(n72), .Z(n51) );
  HS65_LS_NOR4ABX2 U31 ( .A(\input [2]), .B(\input [30]), .C(n74), .D(n73), 
        .Z(n52) );
  HS65_LS_IVX9 U32 ( .A(preset), .Z(n1) );
  HS65_LS_NOR4ABX2 U33 ( .A(\input [23]), .B(\input [22]), .C(n70), .D(n71), 
        .Z(n60) );
  HS65_LS_NOR4ABX2 U34 ( .A(\input [1]), .B(\input [19]), .C(n68), .D(n69), 
        .Z(n59) );
  HS65_LS_NOR4ABX2 U35 ( .A(n60), .B(n59), .C(n58), .D(n57), .Z(set) );
  HS65_LS_NAND4ABX3 U36 ( .A(n54), .B(n53), .C(n52), .D(n51), .Z(n58) );
  HS65_LS_NOR4ABX2 U37 ( .A(\input [16]), .B(\input [15]), .C(n66), .D(n67), 
        .Z(n55) );
  HS65_LS_NAND3X5 U38 ( .A(\input [25]), .B(\input [24]), .C(\input [26]), .Z(
        n50) );
  HS65_LS_NAND4ABX3 U39 ( .A(n75), .B(n62), .C(\input [3]), .D(\input [4]), 
        .Z(n54) );
  HS65_LS_NAND4ABX3 U40 ( .A(n63), .B(n64), .C(\input [7]), .D(\input [8]), 
        .Z(n53) );
  HS65_LS_NAND4X9 U41 ( .A(\input [11]), .B(\input [12]), .C(n56), .D(n55), 
        .Z(n57) );
  HS65_LS_IVX9 U42 ( .A(\input [9]), .Z(n64) );
endmodule


module sr_latch_0_8 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LH_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LH_IVX62 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_8 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_8 latch ( .s(set), .r(reset), .q(c) );
  HS65_LH_OAI21X2 U3 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_IVX9 U4 ( .A(preset), .Z(n1) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_8 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   not_Ain, d, n1, n2, n3, n4;

  c_gate_0_8 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Rout) );
  HS65_LS_IVX9 I_1 ( .A(n1), .Z(Aout) );
  HS65_LS_IVX9 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LH_IVX2 I_2 ( .A(Rout), .Z(d) );
  HS65_LS_BFX9 U1 ( .A(n3), .Z(n1) );
  HS65_LH_IVX106 U2 ( .A(n4), .Z(n2) );
  HS65_LH_BFX2 U3 ( .A(d), .Z(n4) );
  HS65_LS_IVX9 U4 ( .A(n2), .Z(n3) );
  HS65_LSS_XOR2X6 U5 ( .A(Rout), .B(Ain), .Z(lt_en) );
endmodule


module LEDR2bundled_1_000000000_3 ( preset, .LEDR_link_f({
        \LEDR_link_f[TOKEN_T] , \LEDR_link_f[TOKEN_PARITY] , 
        \LEDR_link_f[PHIT][32] , \LEDR_link_f[PHIT][31] , 
        \LEDR_link_f[PHIT][30] , \LEDR_link_f[PHIT][29] , 
        \LEDR_link_f[PHIT][28] , \LEDR_link_f[PHIT][27] , 
        \LEDR_link_f[PHIT][26] , \LEDR_link_f[PHIT][25] , 
        \LEDR_link_f[PHIT][24] , \LEDR_link_f[PHIT][23] , 
        \LEDR_link_f[PHIT][22] , \LEDR_link_f[PHIT][21] , 
        \LEDR_link_f[PHIT][20] , \LEDR_link_f[PHIT][19] , 
        \LEDR_link_f[PHIT][18] , \LEDR_link_f[PHIT][17] , 
        \LEDR_link_f[PHIT][16] , \LEDR_link_f[PHIT][15] , 
        \LEDR_link_f[PHIT][14] , \LEDR_link_f[PHIT][13] , 
        \LEDR_link_f[PHIT][12] , \LEDR_link_f[PHIT][11] , 
        \LEDR_link_f[PHIT][10] , \LEDR_link_f[PHIT][9] , 
        \LEDR_link_f[PHIT][8] , \LEDR_link_f[PHIT][7] , \LEDR_link_f[PHIT][6] , 
        \LEDR_link_f[PHIT][5] , \LEDR_link_f[PHIT][4] , \LEDR_link_f[PHIT][3] , 
        \LEDR_link_f[PHIT][2] , \LEDR_link_f[PHIT][1] , \LEDR_link_f[PHIT][0] , 
        \LEDR_link_f[PHIT_PARITY][32] , \LEDR_link_f[PHIT_PARITY][31] , 
        \LEDR_link_f[PHIT_PARITY][30] , \LEDR_link_f[PHIT_PARITY][29] , 
        \LEDR_link_f[PHIT_PARITY][28] , \LEDR_link_f[PHIT_PARITY][27] , 
        \LEDR_link_f[PHIT_PARITY][26] , \LEDR_link_f[PHIT_PARITY][25] , 
        \LEDR_link_f[PHIT_PARITY][24] , \LEDR_link_f[PHIT_PARITY][23] , 
        \LEDR_link_f[PHIT_PARITY][22] , \LEDR_link_f[PHIT_PARITY][21] , 
        \LEDR_link_f[PHIT_PARITY][20] , \LEDR_link_f[PHIT_PARITY][19] , 
        \LEDR_link_f[PHIT_PARITY][18] , \LEDR_link_f[PHIT_PARITY][17] , 
        \LEDR_link_f[PHIT_PARITY][16] , \LEDR_link_f[PHIT_PARITY][15] , 
        \LEDR_link_f[PHIT_PARITY][14] , \LEDR_link_f[PHIT_PARITY][13] , 
        \LEDR_link_f[PHIT_PARITY][12] , \LEDR_link_f[PHIT_PARITY][11] , 
        \LEDR_link_f[PHIT_PARITY][10] , \LEDR_link_f[PHIT_PARITY][9] , 
        \LEDR_link_f[PHIT_PARITY][8] , \LEDR_link_f[PHIT_PARITY][7] , 
        \LEDR_link_f[PHIT_PARITY][6] , \LEDR_link_f[PHIT_PARITY][5] , 
        \LEDR_link_f[PHIT_PARITY][4] , \LEDR_link_f[PHIT_PARITY][3] , 
        \LEDR_link_f[PHIT_PARITY][2] , \LEDR_link_f[PHIT_PARITY][1] , 
        \LEDR_link_f[PHIT_PARITY][0] }), .LEDR_link_b(\LEDR_link_b[ACK] ), 
    .bundled_ch_f({\bundled_ch_f[REQ] , \bundled_ch_f[DATA][33] , 
        \bundled_ch_f[DATA][32] , \bundled_ch_f[DATA][31] , 
        \bundled_ch_f[DATA][30] , \bundled_ch_f[DATA][29] , 
        \bundled_ch_f[DATA][28] , \bundled_ch_f[DATA][27] , 
        \bundled_ch_f[DATA][26] , \bundled_ch_f[DATA][25] , 
        \bundled_ch_f[DATA][24] , \bundled_ch_f[DATA][23] , 
        \bundled_ch_f[DATA][22] , \bundled_ch_f[DATA][21] , 
        \bundled_ch_f[DATA][20] , \bundled_ch_f[DATA][19] , 
        \bundled_ch_f[DATA][18] , \bundled_ch_f[DATA][17] , 
        \bundled_ch_f[DATA][16] , \bundled_ch_f[DATA][15] , 
        \bundled_ch_f[DATA][14] , \bundled_ch_f[DATA][13] , 
        \bundled_ch_f[DATA][12] , \bundled_ch_f[DATA][11] , 
        \bundled_ch_f[DATA][10] , \bundled_ch_f[DATA][9] , 
        \bundled_ch_f[DATA][8] , \bundled_ch_f[DATA][7] , 
        \bundled_ch_f[DATA][6] , \bundled_ch_f[DATA][5] , 
        \bundled_ch_f[DATA][4] , \bundled_ch_f[DATA][3] , 
        \bundled_ch_f[DATA][2] , \bundled_ch_f[DATA][1] , 
        \bundled_ch_f[DATA][0] }), .bundled_ch_b(\bundled_ch_b[ACK] ) );
  input preset, \LEDR_link_f[TOKEN_T] , \LEDR_link_f[TOKEN_PARITY] ,
         \LEDR_link_f[PHIT][32] , \LEDR_link_f[PHIT][31] ,
         \LEDR_link_f[PHIT][30] , \LEDR_link_f[PHIT][29] ,
         \LEDR_link_f[PHIT][28] , \LEDR_link_f[PHIT][27] ,
         \LEDR_link_f[PHIT][26] , \LEDR_link_f[PHIT][25] ,
         \LEDR_link_f[PHIT][24] , \LEDR_link_f[PHIT][23] ,
         \LEDR_link_f[PHIT][22] , \LEDR_link_f[PHIT][21] ,
         \LEDR_link_f[PHIT][20] , \LEDR_link_f[PHIT][19] ,
         \LEDR_link_f[PHIT][18] , \LEDR_link_f[PHIT][17] ,
         \LEDR_link_f[PHIT][16] , \LEDR_link_f[PHIT][15] ,
         \LEDR_link_f[PHIT][14] , \LEDR_link_f[PHIT][13] ,
         \LEDR_link_f[PHIT][12] , \LEDR_link_f[PHIT][11] ,
         \LEDR_link_f[PHIT][10] , \LEDR_link_f[PHIT][9] ,
         \LEDR_link_f[PHIT][8] , \LEDR_link_f[PHIT][7] ,
         \LEDR_link_f[PHIT][6] , \LEDR_link_f[PHIT][5] ,
         \LEDR_link_f[PHIT][4] , \LEDR_link_f[PHIT][3] ,
         \LEDR_link_f[PHIT][2] , \LEDR_link_f[PHIT][1] ,
         \LEDR_link_f[PHIT][0] , \LEDR_link_f[PHIT_PARITY][32] ,
         \LEDR_link_f[PHIT_PARITY][31] , \LEDR_link_f[PHIT_PARITY][30] ,
         \LEDR_link_f[PHIT_PARITY][29] , \LEDR_link_f[PHIT_PARITY][28] ,
         \LEDR_link_f[PHIT_PARITY][27] , \LEDR_link_f[PHIT_PARITY][26] ,
         \LEDR_link_f[PHIT_PARITY][25] , \LEDR_link_f[PHIT_PARITY][24] ,
         \LEDR_link_f[PHIT_PARITY][23] , \LEDR_link_f[PHIT_PARITY][22] ,
         \LEDR_link_f[PHIT_PARITY][21] , \LEDR_link_f[PHIT_PARITY][20] ,
         \LEDR_link_f[PHIT_PARITY][19] , \LEDR_link_f[PHIT_PARITY][18] ,
         \LEDR_link_f[PHIT_PARITY][17] , \LEDR_link_f[PHIT_PARITY][16] ,
         \LEDR_link_f[PHIT_PARITY][15] , \LEDR_link_f[PHIT_PARITY][14] ,
         \LEDR_link_f[PHIT_PARITY][13] , \LEDR_link_f[PHIT_PARITY][12] ,
         \LEDR_link_f[PHIT_PARITY][11] , \LEDR_link_f[PHIT_PARITY][10] ,
         \LEDR_link_f[PHIT_PARITY][9] , \LEDR_link_f[PHIT_PARITY][8] ,
         \LEDR_link_f[PHIT_PARITY][7] , \LEDR_link_f[PHIT_PARITY][6] ,
         \LEDR_link_f[PHIT_PARITY][5] , \LEDR_link_f[PHIT_PARITY][4] ,
         \LEDR_link_f[PHIT_PARITY][3] , \LEDR_link_f[PHIT_PARITY][2] ,
         \LEDR_link_f[PHIT_PARITY][1] , \LEDR_link_f[PHIT_PARITY][0] ,
         \bundled_ch_b[ACK] ;
  output \LEDR_link_b[ACK] , \bundled_ch_f[REQ] , \bundled_ch_f[DATA][33] ,
         \bundled_ch_f[DATA][32] , \bundled_ch_f[DATA][31] ,
         \bundled_ch_f[DATA][30] , \bundled_ch_f[DATA][29] ,
         \bundled_ch_f[DATA][28] , \bundled_ch_f[DATA][27] ,
         \bundled_ch_f[DATA][26] , \bundled_ch_f[DATA][25] ,
         \bundled_ch_f[DATA][24] , \bundled_ch_f[DATA][23] ,
         \bundled_ch_f[DATA][22] , \bundled_ch_f[DATA][21] ,
         \bundled_ch_f[DATA][20] , \bundled_ch_f[DATA][19] ,
         \bundled_ch_f[DATA][18] , \bundled_ch_f[DATA][17] ,
         \bundled_ch_f[DATA][16] , \bundled_ch_f[DATA][15] ,
         \bundled_ch_f[DATA][14] , \bundled_ch_f[DATA][13] ,
         \bundled_ch_f[DATA][12] , \bundled_ch_f[DATA][11] ,
         \bundled_ch_f[DATA][10] , \bundled_ch_f[DATA][9] ,
         \bundled_ch_f[DATA][8] , \bundled_ch_f[DATA][7] ,
         \bundled_ch_f[DATA][6] , \bundled_ch_f[DATA][5] ,
         \bundled_ch_f[DATA][4] , \bundled_ch_f[DATA][3] ,
         \bundled_ch_f[DATA][2] , \bundled_ch_f[DATA][1] ,
         \bundled_ch_f[DATA][0] ;
  wire   token_phase, full_phase, empty_phase, data_phase, data_cd_phase,
         req_in, latch_enable, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13,
         N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27,
         N28, N29, N30, N31, N32, N33, N34, N35, N36, n1, n3;
  wire   [32:0] data_cd;

  select_element_3 select_element ( .preset(preset), .\input (token_phase), 
        .true(full_phase), .false(empty_phase), .sel(\LEDR_link_f[TOKEN_T] )
         );
  c_gate_0_13 data_cd_c ( .preset(preset), .a(full_phase), .b(data_phase), .c(
        data_cd_phase) );
  c_gate_generic_0_33_3 data_ch ( .preset(preset), .\input (data_cd), 
        .\output (data_phase) );
  latch_controller_1_8 latch_controller ( .preset(preset), .Rin(req_in), 
        .Aout(\LEDR_link_b[ACK] ), .Rout(\bundled_ch_f[REQ] ), .Ain(
        \bundled_ch_b[ACK] ), .lt_en(latch_enable) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][31]  ( .G(N3), .D(N35), .Q(
        \bundled_ch_f[DATA][31] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][29]  ( .G(N3), .D(N33), .Q(
        \bundled_ch_f[DATA][29] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][27]  ( .G(N3), .D(N31), .Q(
        \bundled_ch_f[DATA][27] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][25]  ( .G(N3), .D(N29), .Q(
        \bundled_ch_f[DATA][25] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][23]  ( .G(N3), .D(N27), .Q(
        \bundled_ch_f[DATA][23] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][21]  ( .G(N3), .D(N25), .Q(
        \bundled_ch_f[DATA][21] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][19]  ( .G(N3), .D(N23), .Q(
        \bundled_ch_f[DATA][19] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][17]  ( .G(N3), .D(N21), .Q(
        \bundled_ch_f[DATA][17] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][15]  ( .G(N3), .D(N19), .Q(
        \bundled_ch_f[DATA][15] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][13]  ( .G(N3), .D(N17), .Q(
        \bundled_ch_f[DATA][13] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][11]  ( .G(N3), .D(N15), .Q(
        \bundled_ch_f[DATA][11] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][9]  ( .G(N3), .D(N13), .Q(
        \bundled_ch_f[DATA][9] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][7]  ( .G(N3), .D(N11), .Q(
        \bundled_ch_f[DATA][7] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][5]  ( .G(N3), .D(N9), .Q(
        \bundled_ch_f[DATA][5] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][3]  ( .G(N3), .D(N7), .Q(
        \bundled_ch_f[DATA][3] ) );
  HS65_LS_LDLRQX9 \bundled_ch_f_reg[DATA][33]  ( .D(\LEDR_link_f[TOKEN_T] ), 
        .GN(latch_enable), .RN(n1), .Q(\bundled_ch_f[DATA][33] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][28]  ( .G(N3), .D(N32), .Q(
        \bundled_ch_f[DATA][28] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][26]  ( .G(N3), .D(N30), .Q(
        \bundled_ch_f[DATA][26] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][24]  ( .G(N3), .D(N28), .Q(
        \bundled_ch_f[DATA][24] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][22]  ( .G(N3), .D(N26), .Q(
        \bundled_ch_f[DATA][22] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][20]  ( .G(N3), .D(N24), .Q(
        \bundled_ch_f[DATA][20] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][18]  ( .G(N3), .D(N22), .Q(
        \bundled_ch_f[DATA][18] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][16]  ( .G(N3), .D(N20), .Q(
        \bundled_ch_f[DATA][16] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][14]  ( .G(N3), .D(N18), .Q(
        \bundled_ch_f[DATA][14] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][12]  ( .G(N3), .D(N16), .Q(
        \bundled_ch_f[DATA][12] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][10]  ( .G(N3), .D(N14), .Q(
        \bundled_ch_f[DATA][10] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][8]  ( .G(N3), .D(N12), .Q(
        \bundled_ch_f[DATA][8] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][6]  ( .G(N3), .D(N10), .Q(
        \bundled_ch_f[DATA][6] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][4]  ( .G(N3), .D(N8), .Q(
        \bundled_ch_f[DATA][4] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][2]  ( .G(N3), .D(N6), .Q(
        \bundled_ch_f[DATA][2] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][30]  ( .G(N3), .D(N34), .Q(
        \bundled_ch_f[DATA][30] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][1]  ( .G(N3), .D(N5), .Q(
        \bundled_ch_f[DATA][1] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][32]  ( .G(N3), .D(N36), .Q(
        \bundled_ch_f[DATA][32] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][0]  ( .G(N3), .D(N4), .Q(
        \bundled_ch_f[DATA][0] ) );
  HS65_LSS_XOR2X6 U3 ( .A(\LEDR_link_f[PHIT_PARITY][7] ), .B(
        \LEDR_link_f[PHIT][7] ), .Z(data_cd[7]) );
  HS65_LSS_XOR2X6 U4 ( .A(\LEDR_link_f[PHIT_PARITY][4] ), .B(
        \LEDR_link_f[PHIT][4] ), .Z(data_cd[4]) );
  HS65_LSS_XOR2X6 U5 ( .A(\LEDR_link_f[PHIT_PARITY][3] ), .B(
        \LEDR_link_f[PHIT][3] ), .Z(data_cd[3]) );
  HS65_LSS_XOR2X6 U6 ( .A(\LEDR_link_f[PHIT_PARITY][8] ), .B(
        \LEDR_link_f[PHIT][8] ), .Z(data_cd[8]) );
  HS65_LSS_XOR2X6 U7 ( .A(\LEDR_link_f[PHIT_PARITY][9] ), .B(
        \LEDR_link_f[PHIT][9] ), .Z(data_cd[9]) );
  HS65_LSS_XOR2X6 U8 ( .A(\LEDR_link_f[PHIT_PARITY][16] ), .B(
        \LEDR_link_f[PHIT][16] ), .Z(data_cd[16]) );
  HS65_LSS_XOR2X6 U9 ( .A(\LEDR_link_f[PHIT_PARITY][15] ), .B(
        \LEDR_link_f[PHIT][15] ), .Z(data_cd[15]) );
  HS65_LSS_XOR2X6 U10 ( .A(\LEDR_link_f[PHIT_PARITY][25] ), .B(
        \LEDR_link_f[PHIT][25] ), .Z(data_cd[25]) );
  HS65_LSS_XOR2X6 U11 ( .A(\LEDR_link_f[PHIT_PARITY][24] ), .B(
        \LEDR_link_f[PHIT][24] ), .Z(data_cd[24]) );
  HS65_LSS_XOR2X6 U12 ( .A(\LEDR_link_f[PHIT_PARITY][26] ), .B(
        \LEDR_link_f[PHIT][26] ), .Z(data_cd[26]) );
  HS65_LSS_XOR2X6 U13 ( .A(\LEDR_link_f[PHIT_PARITY][12] ), .B(
        \LEDR_link_f[PHIT][12] ), .Z(data_cd[12]) );
  HS65_LSS_XOR2X6 U14 ( .A(\LEDR_link_f[PHIT_PARITY][1] ), .B(
        \LEDR_link_f[PHIT][1] ), .Z(data_cd[1]) );
  HS65_LSS_XOR2X6 U15 ( .A(\LEDR_link_f[PHIT_PARITY][23] ), .B(
        \LEDR_link_f[PHIT][23] ), .Z(data_cd[23]) );
  HS65_LSS_XOR2X6 U16 ( .A(\LEDR_link_f[PHIT_PARITY][2] ), .B(
        \LEDR_link_f[PHIT][2] ), .Z(data_cd[2]) );
  HS65_LSS_XOR2X6 U17 ( .A(\LEDR_link_f[PHIT_PARITY][30] ), .B(
        \LEDR_link_f[PHIT][30] ), .Z(data_cd[30]) );
  HS65_LSS_XOR2X6 U18 ( .A(\LEDR_link_f[PHIT_PARITY][19] ), .B(
        \LEDR_link_f[PHIT][19] ), .Z(data_cd[19]) );
  HS65_LSS_XOR2X6 U19 ( .A(\LEDR_link_f[PHIT_PARITY][22] ), .B(
        \LEDR_link_f[PHIT][22] ), .Z(data_cd[22]) );
  HS65_LSS_XOR2X6 U20 ( .A(\LEDR_link_f[PHIT_PARITY][11] ), .B(
        \LEDR_link_f[PHIT][11] ), .Z(data_cd[11]) );
  HS65_LSS_XOR2X6 U21 ( .A(\LEDR_link_f[PHIT_PARITY][27] ), .B(
        \LEDR_link_f[PHIT][27] ), .Z(data_cd[27]) );
  HS65_LSS_XOR2X6 U22 ( .A(\LEDR_link_f[PHIT_PARITY][0] ), .B(
        \LEDR_link_f[PHIT][0] ), .Z(data_cd[0]) );
  HS65_LSS_XOR2X6 U23 ( .A(\LEDR_link_f[PHIT_PARITY][10] ), .B(
        \LEDR_link_f[PHIT][10] ), .Z(data_cd[10]) );
  HS65_LSS_XOR2X6 U24 ( .A(\LEDR_link_f[PHIT_PARITY][13] ), .B(
        \LEDR_link_f[PHIT][13] ), .Z(data_cd[13]) );
  HS65_LSS_XOR2X6 U25 ( .A(\LEDR_link_f[PHIT_PARITY][14] ), .B(
        \LEDR_link_f[PHIT][14] ), .Z(data_cd[14]) );
  HS65_LSS_XOR2X6 U26 ( .A(\LEDR_link_f[PHIT_PARITY][17] ), .B(
        \LEDR_link_f[PHIT][17] ), .Z(data_cd[17]) );
  HS65_LSS_XOR2X6 U27 ( .A(\LEDR_link_f[PHIT_PARITY][18] ), .B(
        \LEDR_link_f[PHIT][18] ), .Z(data_cd[18]) );
  HS65_LSS_XOR2X6 U28 ( .A(\LEDR_link_f[PHIT_PARITY][20] ), .B(
        \LEDR_link_f[PHIT][20] ), .Z(data_cd[20]) );
  HS65_LSS_XOR2X6 U29 ( .A(\LEDR_link_f[PHIT_PARITY][21] ), .B(
        \LEDR_link_f[PHIT][21] ), .Z(data_cd[21]) );
  HS65_LSS_XOR2X6 U30 ( .A(\LEDR_link_f[PHIT_PARITY][28] ), .B(
        \LEDR_link_f[PHIT][28] ), .Z(data_cd[28]) );
  HS65_LSS_XOR2X6 U31 ( .A(\LEDR_link_f[PHIT_PARITY][29] ), .B(
        \LEDR_link_f[PHIT][29] ), .Z(data_cd[29]) );
  HS65_LSS_XOR2X6 U32 ( .A(\LEDR_link_f[PHIT_PARITY][31] ), .B(
        \LEDR_link_f[PHIT][31] ), .Z(data_cd[31]) );
  HS65_LSS_XOR2X6 U33 ( .A(\LEDR_link_f[PHIT_PARITY][32] ), .B(
        \LEDR_link_f[PHIT][32] ), .Z(data_cd[32]) );
  HS65_LSS_XOR2X6 U34 ( .A(\LEDR_link_f[PHIT_PARITY][5] ), .B(
        \LEDR_link_f[PHIT][5] ), .Z(data_cd[5]) );
  HS65_LSS_XOR2X6 U35 ( .A(\LEDR_link_f[PHIT_PARITY][6] ), .B(
        \LEDR_link_f[PHIT][6] ), .Z(data_cd[6]) );
  HS65_LSS_XNOR2X6 U36 ( .A(n3), .B(\LEDR_link_f[TOKEN_PARITY] ), .Z(
        token_phase) );
  HS65_LS_IVX9 U37 ( .A(preset), .Z(n1) );
  HS65_LS_IVX9 U38 ( .A(\LEDR_link_f[TOKEN_T] ), .Z(n3) );
  HS65_LS_NOR2AX3 U39 ( .A(\LEDR_link_f[PHIT][0] ), .B(preset), .Z(N4) );
  HS65_LS_NOR2AX3 U40 ( .A(\LEDR_link_f[PHIT][1] ), .B(preset), .Z(N5) );
  HS65_LS_NOR2AX3 U41 ( .A(\LEDR_link_f[PHIT][2] ), .B(preset), .Z(N6) );
  HS65_LS_NOR2AX3 U42 ( .A(\LEDR_link_f[PHIT][3] ), .B(preset), .Z(N7) );
  HS65_LS_NOR2AX3 U43 ( .A(\LEDR_link_f[PHIT][4] ), .B(preset), .Z(N8) );
  HS65_LS_NOR2AX3 U44 ( .A(\LEDR_link_f[PHIT][6] ), .B(preset), .Z(N10) );
  HS65_LS_NOR2AX3 U45 ( .A(\LEDR_link_f[PHIT][24] ), .B(preset), .Z(N28) );
  HS65_LS_NOR2AX3 U46 ( .A(\LEDR_link_f[PHIT][25] ), .B(preset), .Z(N29) );
  HS65_LS_NOR2AX3 U47 ( .A(\LEDR_link_f[PHIT][26] ), .B(preset), .Z(N30) );
  HS65_LS_NOR2AX3 U48 ( .A(\LEDR_link_f[PHIT][27] ), .B(preset), .Z(N31) );
  HS65_LS_NOR2AX3 U49 ( .A(\LEDR_link_f[PHIT][28] ), .B(preset), .Z(N32) );
  HS65_LS_NOR2AX3 U50 ( .A(\LEDR_link_f[PHIT][29] ), .B(preset), .Z(N33) );
  HS65_LS_NOR2AX3 U51 ( .A(\LEDR_link_f[PHIT][30] ), .B(preset), .Z(N34) );
  HS65_LS_NOR2AX3 U52 ( .A(\LEDR_link_f[PHIT][31] ), .B(preset), .Z(N35) );
  HS65_LS_NOR2AX3 U53 ( .A(\LEDR_link_f[PHIT][32] ), .B(preset), .Z(N36) );
  HS65_LS_NOR2AX3 U54 ( .A(\LEDR_link_f[PHIT][5] ), .B(preset), .Z(N9) );
  HS65_LS_NOR2AX3 U55 ( .A(\LEDR_link_f[PHIT][7] ), .B(preset), .Z(N11) );
  HS65_LS_NOR2AX3 U56 ( .A(\LEDR_link_f[PHIT][8] ), .B(preset), .Z(N12) );
  HS65_LS_NOR2AX3 U57 ( .A(\LEDR_link_f[PHIT][9] ), .B(preset), .Z(N13) );
  HS65_LS_NOR2AX3 U58 ( .A(\LEDR_link_f[PHIT][10] ), .B(preset), .Z(N14) );
  HS65_LS_NOR2AX3 U59 ( .A(\LEDR_link_f[PHIT][11] ), .B(preset), .Z(N15) );
  HS65_LS_NOR2AX3 U60 ( .A(\LEDR_link_f[PHIT][12] ), .B(preset), .Z(N16) );
  HS65_LS_NOR2AX3 U61 ( .A(\LEDR_link_f[PHIT][13] ), .B(preset), .Z(N17) );
  HS65_LS_NOR2AX3 U62 ( .A(\LEDR_link_f[PHIT][14] ), .B(preset), .Z(N18) );
  HS65_LS_NOR2AX3 U63 ( .A(\LEDR_link_f[PHIT][15] ), .B(preset), .Z(N19) );
  HS65_LS_NOR2AX3 U64 ( .A(\LEDR_link_f[PHIT][16] ), .B(preset), .Z(N20) );
  HS65_LS_NOR2AX3 U65 ( .A(\LEDR_link_f[PHIT][17] ), .B(preset), .Z(N21) );
  HS65_LS_NOR2AX3 U66 ( .A(\LEDR_link_f[PHIT][18] ), .B(preset), .Z(N22) );
  HS65_LS_NOR2AX3 U67 ( .A(\LEDR_link_f[PHIT][19] ), .B(preset), .Z(N23) );
  HS65_LS_NOR2AX3 U68 ( .A(\LEDR_link_f[PHIT][20] ), .B(preset), .Z(N24) );
  HS65_LS_NOR2AX3 U69 ( .A(\LEDR_link_f[PHIT][21] ), .B(preset), .Z(N25) );
  HS65_LS_NOR2AX3 U70 ( .A(\LEDR_link_f[PHIT][22] ), .B(preset), .Z(N26) );
  HS65_LS_NOR2AX3 U71 ( .A(\LEDR_link_f[PHIT][23] ), .B(preset), .Z(N27) );
  HS65_LS_OAI21X3 U72 ( .A(latch_enable), .B(n3), .C(n1), .Z(N3) );
  HS65_LSS_XOR2X6 U73 ( .A(empty_phase), .B(data_cd_phase), .Z(req_in) );
endmodule


module select_element_4 ( preset, \input , true, false, sel );
  input preset, \input , sel;
  output true, false;
  wire   n1, n2, n3;

  HS65_LS_LDHRQX9 true_latch_out_reg ( .G(sel), .D(n1), .RN(n3), .Q(true) );
  HS65_LS_LDLRQX9 false_latch_out_reg ( .D(n2), .GN(sel), .RN(n3), .Q(false)
         );
  HS65_LSS_XOR2X6 U3 ( .A(\input ), .B(false), .Z(n1) );
  HS65_LS_IVX9 U4 ( .A(preset), .Z(n3) );
  HS65_LSS_XOR2X6 U5 ( .A(\input ), .B(true), .Z(n2) );
endmodule


module sr_latch_0_18 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X18 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(qn), .Z(N1) );
  HS65_LS_IVX9 U2 ( .A(r), .Z(n1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_14 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_18 latch ( .s(set), .r(reset), .q(c) );
  HS65_LS_OAI12X6 U3 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LH_AND3X4 U4 ( .A(b), .B(n1), .C(a), .Z(set) );
  HS65_LS_IVX9 U5 ( .A(preset), .Z(n1) );
endmodule


module sr_latch_0_17 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LS_AND2X18 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LS_IVX9 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_generic_0_33_4 ( preset, \input , \output  );
  input [32:0] \input ;
  input preset;
  output \output ;
  wire   set, reset, n1, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75;

  sr_latch_0_17 latch ( .s(set), .r(reset), .q(\output ) );
  HS65_LH_NOR4ABX2 U3 ( .A(\input [2]), .B(\input [30]), .C(n74), .D(n73), .Z(
        n52) );
  HS65_LS_NAND4ABX19 U4 ( .A(\input [30]), .B(\input [2]), .C(n72), .D(n73), 
        .Z(n43) );
  HS65_LS_OAI12X6 U5 ( .A(n49), .B(n48), .C(n1), .Z(reset) );
  HS65_LS_NAND4ABX19 U6 ( .A(n47), .B(n46), .C(n45), .D(n44), .Z(n48) );
  HS65_LS_NOR4ABX4 U7 ( .A(n66), .B(n67), .C(\input [16]), .D(\input [15]), 
        .Z(n44) );
  HS65_LS_NOR4ABX4 U8 ( .A(n74), .B(n75), .C(\input [4]), .D(\input [3]), .Z(
        n40) );
  HS65_LS_NOR4ABX4 U9 ( .A(n61), .B(n65), .C(\input [12]), .D(\input [11]), 
        .Z(n45) );
  HS65_LS_NAND4ABX13 U10 ( .A(\input [23]), .B(\input [22]), .C(n70), .D(n71), 
        .Z(n47) );
  HS65_LS_NAND4ABX6 U11 ( .A(n43), .B(n42), .C(n41), .D(n40), .Z(n49) );
  HS65_LS_NAND3X13 U12 ( .A(n62), .B(n63), .C(n39), .Z(n42) );
  HS65_LS_NOR3X13 U13 ( .A(\input [7]), .B(\input [9]), .C(\input [8]), .Z(n39) );
  HS65_LS_IVX9 U14 ( .A(\input [17]), .Z(n68) );
  HS65_LS_IVX9 U15 ( .A(\input [20]), .Z(n70) );
  HS65_LS_NAND4ABX6 U16 ( .A(\input [1]), .B(\input [19]), .C(n68), .D(n69), 
        .Z(n46) );
  HS65_LS_IVX9 U17 ( .A(\input [28]), .Z(n72) );
  HS65_LS_IVX9 U18 ( .A(\input [18]), .Z(n69) );
  HS65_LS_IVX9 U19 ( .A(\input [21]), .Z(n71) );
  HS65_LS_IVX9 U20 ( .A(\input [29]), .Z(n73) );
  HS65_LS_IVX9 U21 ( .A(\input [5]), .Z(n62) );
  HS65_LS_IVX9 U22 ( .A(\input [6]), .Z(n63) );
  HS65_LS_IVX9 U23 ( .A(\input [13]), .Z(n66) );
  HS65_LS_IVX9 U24 ( .A(\input [31]), .Z(n74) );
  HS65_LS_IVX9 U25 ( .A(\input [10]), .Z(n65) );
  HS65_LS_IVX9 U26 ( .A(\input [0]), .Z(n61) );
  HS65_LS_IVX9 U27 ( .A(\input [14]), .Z(n67) );
  HS65_LS_IVX9 U28 ( .A(\input [32]), .Z(n75) );
  HS65_LS_NOR4X4 U29 ( .A(\input [24]), .B(\input [25]), .C(\input [27]), .D(
        \input [26]), .Z(n41) );
  HS65_LS_NOR3X4 U30 ( .A(n65), .B(preset), .C(n61), .Z(n56) );
  HS65_LS_NOR3AX2 U31 ( .A(\input [27]), .B(n50), .C(n72), .Z(n51) );
  HS65_LS_IVX9 U32 ( .A(preset), .Z(n1) );
  HS65_LS_NOR4ABX2 U33 ( .A(\input [23]), .B(\input [22]), .C(n70), .D(n71), 
        .Z(n60) );
  HS65_LS_NOR4ABX2 U34 ( .A(\input [1]), .B(\input [19]), .C(n68), .D(n69), 
        .Z(n59) );
  HS65_LS_NOR4ABX2 U35 ( .A(n60), .B(n59), .C(n58), .D(n57), .Z(set) );
  HS65_LS_NAND4ABX3 U36 ( .A(n54), .B(n53), .C(n52), .D(n51), .Z(n58) );
  HS65_LS_NOR4ABX2 U37 ( .A(\input [16]), .B(\input [15]), .C(n66), .D(n67), 
        .Z(n55) );
  HS65_LS_NAND3X5 U38 ( .A(\input [25]), .B(\input [24]), .C(\input [26]), .Z(
        n50) );
  HS65_LS_NAND4ABX3 U39 ( .A(n75), .B(n62), .C(\input [3]), .D(\input [4]), 
        .Z(n54) );
  HS65_LS_NAND4ABX3 U40 ( .A(n63), .B(n64), .C(\input [7]), .D(\input [8]), 
        .Z(n53) );
  HS65_LS_NAND4X9 U41 ( .A(\input [11]), .B(\input [12]), .C(n56), .D(n55), 
        .Z(n57) );
  HS65_LS_IVX9 U42 ( .A(\input [9]), .Z(n64) );
endmodule


module sr_latch_0_9 ( s, r, q, qn );
  input s, r;
  output q, qn;
  wire   N1, n1;

  HS65_LH_AND2X4 C8 ( .A(n1), .B(N1), .Z(q) );
  HS65_LH_IVX62 U1 ( .A(r), .Z(n1) );
  HS65_LS_IVX9 U2 ( .A(qn), .Z(N1) );
  HS65_LS_NOR2X6 U3 ( .A(s), .B(q), .Z(qn) );
endmodule


module c_gate_0_9 ( preset, a, b, c );
  input preset, a, b;
  output c;
  wire   set, reset, n1;

  sr_latch_0_9 latch ( .s(set), .r(reset), .q(c) );
  HS65_LH_OAI21X2 U3 ( .A(b), .B(a), .C(n1), .Z(reset) );
  HS65_LS_IVX9 U4 ( .A(preset), .Z(n1) );
  HS65_LS_AND3X9 U5 ( .A(b), .B(n1), .C(a), .Z(set) );
endmodule


module latch_controller_1_9 ( preset, Rin, Aout, Rout, Ain, lt_en );
  input preset, Rin, Ain;
  output Aout, Rout, lt_en;
  wire   not_Ain, d, n1, n2, n3, n4;

  c_gate_0_9 gate ( .preset(preset), .a(not_Ain), .b(Rin), .c(Rout) );
  HS65_LS_IVX9 I_1 ( .A(n1), .Z(Aout) );
  HS65_LS_IVX9 I_0 ( .A(Ain), .Z(not_Ain) );
  HS65_LH_IVX2 I_2 ( .A(Rout), .Z(d) );
  HS65_LS_BFX9 U1 ( .A(n3), .Z(n1) );
  HS65_LH_IVX106 U2 ( .A(n4), .Z(n2) );
  HS65_LH_BFX2 U3 ( .A(d), .Z(n4) );
  HS65_LS_IVX9 U4 ( .A(n2), .Z(n3) );
  HS65_LSS_XOR2X6 U5 ( .A(Rout), .B(Ain), .Z(lt_en) );
endmodule


module LEDR2bundled_1_000000000_4 ( preset, .LEDR_link_f({
        \LEDR_link_f[TOKEN_T] , \LEDR_link_f[TOKEN_PARITY] , 
        \LEDR_link_f[PHIT][32] , \LEDR_link_f[PHIT][31] , 
        \LEDR_link_f[PHIT][30] , \LEDR_link_f[PHIT][29] , 
        \LEDR_link_f[PHIT][28] , \LEDR_link_f[PHIT][27] , 
        \LEDR_link_f[PHIT][26] , \LEDR_link_f[PHIT][25] , 
        \LEDR_link_f[PHIT][24] , \LEDR_link_f[PHIT][23] , 
        \LEDR_link_f[PHIT][22] , \LEDR_link_f[PHIT][21] , 
        \LEDR_link_f[PHIT][20] , \LEDR_link_f[PHIT][19] , 
        \LEDR_link_f[PHIT][18] , \LEDR_link_f[PHIT][17] , 
        \LEDR_link_f[PHIT][16] , \LEDR_link_f[PHIT][15] , 
        \LEDR_link_f[PHIT][14] , \LEDR_link_f[PHIT][13] , 
        \LEDR_link_f[PHIT][12] , \LEDR_link_f[PHIT][11] , 
        \LEDR_link_f[PHIT][10] , \LEDR_link_f[PHIT][9] , 
        \LEDR_link_f[PHIT][8] , \LEDR_link_f[PHIT][7] , \LEDR_link_f[PHIT][6] , 
        \LEDR_link_f[PHIT][5] , \LEDR_link_f[PHIT][4] , \LEDR_link_f[PHIT][3] , 
        \LEDR_link_f[PHIT][2] , \LEDR_link_f[PHIT][1] , \LEDR_link_f[PHIT][0] , 
        \LEDR_link_f[PHIT_PARITY][32] , \LEDR_link_f[PHIT_PARITY][31] , 
        \LEDR_link_f[PHIT_PARITY][30] , \LEDR_link_f[PHIT_PARITY][29] , 
        \LEDR_link_f[PHIT_PARITY][28] , \LEDR_link_f[PHIT_PARITY][27] , 
        \LEDR_link_f[PHIT_PARITY][26] , \LEDR_link_f[PHIT_PARITY][25] , 
        \LEDR_link_f[PHIT_PARITY][24] , \LEDR_link_f[PHIT_PARITY][23] , 
        \LEDR_link_f[PHIT_PARITY][22] , \LEDR_link_f[PHIT_PARITY][21] , 
        \LEDR_link_f[PHIT_PARITY][20] , \LEDR_link_f[PHIT_PARITY][19] , 
        \LEDR_link_f[PHIT_PARITY][18] , \LEDR_link_f[PHIT_PARITY][17] , 
        \LEDR_link_f[PHIT_PARITY][16] , \LEDR_link_f[PHIT_PARITY][15] , 
        \LEDR_link_f[PHIT_PARITY][14] , \LEDR_link_f[PHIT_PARITY][13] , 
        \LEDR_link_f[PHIT_PARITY][12] , \LEDR_link_f[PHIT_PARITY][11] , 
        \LEDR_link_f[PHIT_PARITY][10] , \LEDR_link_f[PHIT_PARITY][9] , 
        \LEDR_link_f[PHIT_PARITY][8] , \LEDR_link_f[PHIT_PARITY][7] , 
        \LEDR_link_f[PHIT_PARITY][6] , \LEDR_link_f[PHIT_PARITY][5] , 
        \LEDR_link_f[PHIT_PARITY][4] , \LEDR_link_f[PHIT_PARITY][3] , 
        \LEDR_link_f[PHIT_PARITY][2] , \LEDR_link_f[PHIT_PARITY][1] , 
        \LEDR_link_f[PHIT_PARITY][0] }), .LEDR_link_b(\LEDR_link_b[ACK] ), 
    .bundled_ch_f({\bundled_ch_f[REQ] , \bundled_ch_f[DATA][33] , 
        \bundled_ch_f[DATA][32] , \bundled_ch_f[DATA][31] , 
        \bundled_ch_f[DATA][30] , \bundled_ch_f[DATA][29] , 
        \bundled_ch_f[DATA][28] , \bundled_ch_f[DATA][27] , 
        \bundled_ch_f[DATA][26] , \bundled_ch_f[DATA][25] , 
        \bundled_ch_f[DATA][24] , \bundled_ch_f[DATA][23] , 
        \bundled_ch_f[DATA][22] , \bundled_ch_f[DATA][21] , 
        \bundled_ch_f[DATA][20] , \bundled_ch_f[DATA][19] , 
        \bundled_ch_f[DATA][18] , \bundled_ch_f[DATA][17] , 
        \bundled_ch_f[DATA][16] , \bundled_ch_f[DATA][15] , 
        \bundled_ch_f[DATA][14] , \bundled_ch_f[DATA][13] , 
        \bundled_ch_f[DATA][12] , \bundled_ch_f[DATA][11] , 
        \bundled_ch_f[DATA][10] , \bundled_ch_f[DATA][9] , 
        \bundled_ch_f[DATA][8] , \bundled_ch_f[DATA][7] , 
        \bundled_ch_f[DATA][6] , \bundled_ch_f[DATA][5] , 
        \bundled_ch_f[DATA][4] , \bundled_ch_f[DATA][3] , 
        \bundled_ch_f[DATA][2] , \bundled_ch_f[DATA][1] , 
        \bundled_ch_f[DATA][0] }), .bundled_ch_b(\bundled_ch_b[ACK] ) );
  input preset, \LEDR_link_f[TOKEN_T] , \LEDR_link_f[TOKEN_PARITY] ,
         \LEDR_link_f[PHIT][32] , \LEDR_link_f[PHIT][31] ,
         \LEDR_link_f[PHIT][30] , \LEDR_link_f[PHIT][29] ,
         \LEDR_link_f[PHIT][28] , \LEDR_link_f[PHIT][27] ,
         \LEDR_link_f[PHIT][26] , \LEDR_link_f[PHIT][25] ,
         \LEDR_link_f[PHIT][24] , \LEDR_link_f[PHIT][23] ,
         \LEDR_link_f[PHIT][22] , \LEDR_link_f[PHIT][21] ,
         \LEDR_link_f[PHIT][20] , \LEDR_link_f[PHIT][19] ,
         \LEDR_link_f[PHIT][18] , \LEDR_link_f[PHIT][17] ,
         \LEDR_link_f[PHIT][16] , \LEDR_link_f[PHIT][15] ,
         \LEDR_link_f[PHIT][14] , \LEDR_link_f[PHIT][13] ,
         \LEDR_link_f[PHIT][12] , \LEDR_link_f[PHIT][11] ,
         \LEDR_link_f[PHIT][10] , \LEDR_link_f[PHIT][9] ,
         \LEDR_link_f[PHIT][8] , \LEDR_link_f[PHIT][7] ,
         \LEDR_link_f[PHIT][6] , \LEDR_link_f[PHIT][5] ,
         \LEDR_link_f[PHIT][4] , \LEDR_link_f[PHIT][3] ,
         \LEDR_link_f[PHIT][2] , \LEDR_link_f[PHIT][1] ,
         \LEDR_link_f[PHIT][0] , \LEDR_link_f[PHIT_PARITY][32] ,
         \LEDR_link_f[PHIT_PARITY][31] , \LEDR_link_f[PHIT_PARITY][30] ,
         \LEDR_link_f[PHIT_PARITY][29] , \LEDR_link_f[PHIT_PARITY][28] ,
         \LEDR_link_f[PHIT_PARITY][27] , \LEDR_link_f[PHIT_PARITY][26] ,
         \LEDR_link_f[PHIT_PARITY][25] , \LEDR_link_f[PHIT_PARITY][24] ,
         \LEDR_link_f[PHIT_PARITY][23] , \LEDR_link_f[PHIT_PARITY][22] ,
         \LEDR_link_f[PHIT_PARITY][21] , \LEDR_link_f[PHIT_PARITY][20] ,
         \LEDR_link_f[PHIT_PARITY][19] , \LEDR_link_f[PHIT_PARITY][18] ,
         \LEDR_link_f[PHIT_PARITY][17] , \LEDR_link_f[PHIT_PARITY][16] ,
         \LEDR_link_f[PHIT_PARITY][15] , \LEDR_link_f[PHIT_PARITY][14] ,
         \LEDR_link_f[PHIT_PARITY][13] , \LEDR_link_f[PHIT_PARITY][12] ,
         \LEDR_link_f[PHIT_PARITY][11] , \LEDR_link_f[PHIT_PARITY][10] ,
         \LEDR_link_f[PHIT_PARITY][9] , \LEDR_link_f[PHIT_PARITY][8] ,
         \LEDR_link_f[PHIT_PARITY][7] , \LEDR_link_f[PHIT_PARITY][6] ,
         \LEDR_link_f[PHIT_PARITY][5] , \LEDR_link_f[PHIT_PARITY][4] ,
         \LEDR_link_f[PHIT_PARITY][3] , \LEDR_link_f[PHIT_PARITY][2] ,
         \LEDR_link_f[PHIT_PARITY][1] , \LEDR_link_f[PHIT_PARITY][0] ,
         \bundled_ch_b[ACK] ;
  output \LEDR_link_b[ACK] , \bundled_ch_f[REQ] , \bundled_ch_f[DATA][33] ,
         \bundled_ch_f[DATA][32] , \bundled_ch_f[DATA][31] ,
         \bundled_ch_f[DATA][30] , \bundled_ch_f[DATA][29] ,
         \bundled_ch_f[DATA][28] , \bundled_ch_f[DATA][27] ,
         \bundled_ch_f[DATA][26] , \bundled_ch_f[DATA][25] ,
         \bundled_ch_f[DATA][24] , \bundled_ch_f[DATA][23] ,
         \bundled_ch_f[DATA][22] , \bundled_ch_f[DATA][21] ,
         \bundled_ch_f[DATA][20] , \bundled_ch_f[DATA][19] ,
         \bundled_ch_f[DATA][18] , \bundled_ch_f[DATA][17] ,
         \bundled_ch_f[DATA][16] , \bundled_ch_f[DATA][15] ,
         \bundled_ch_f[DATA][14] , \bundled_ch_f[DATA][13] ,
         \bundled_ch_f[DATA][12] , \bundled_ch_f[DATA][11] ,
         \bundled_ch_f[DATA][10] , \bundled_ch_f[DATA][9] ,
         \bundled_ch_f[DATA][8] , \bundled_ch_f[DATA][7] ,
         \bundled_ch_f[DATA][6] , \bundled_ch_f[DATA][5] ,
         \bundled_ch_f[DATA][4] , \bundled_ch_f[DATA][3] ,
         \bundled_ch_f[DATA][2] , \bundled_ch_f[DATA][1] ,
         \bundled_ch_f[DATA][0] ;
  wire   token_phase, full_phase, empty_phase, data_phase, data_cd_phase,
         req_in, latch_enable, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13,
         N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27,
         N28, N29, N30, N31, N32, N33, N34, N35, N36, n1, n3;
  wire   [32:0] data_cd;

  select_element_4 select_element ( .preset(preset), .\input (token_phase), 
        .true(full_phase), .false(empty_phase), .sel(\LEDR_link_f[TOKEN_T] )
         );
  c_gate_0_14 data_cd_c ( .preset(preset), .a(full_phase), .b(data_phase), .c(
        data_cd_phase) );
  c_gate_generic_0_33_4 data_ch ( .preset(preset), .\input (data_cd), 
        .\output (data_phase) );
  latch_controller_1_9 latch_controller ( .preset(preset), .Rin(req_in), 
        .Aout(\LEDR_link_b[ACK] ), .Rout(\bundled_ch_f[REQ] ), .Ain(
        \bundled_ch_b[ACK] ), .lt_en(latch_enable) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][30]  ( .G(N3), .D(N34), .Q(
        \bundled_ch_f[DATA][30] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][28]  ( .G(N3), .D(N32), .Q(
        \bundled_ch_f[DATA][28] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][26]  ( .G(N3), .D(N30), .Q(
        \bundled_ch_f[DATA][26] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][24]  ( .G(N3), .D(N28), .Q(
        \bundled_ch_f[DATA][24] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][22]  ( .G(N3), .D(N26), .Q(
        \bundled_ch_f[DATA][22] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][20]  ( .G(N3), .D(N24), .Q(
        \bundled_ch_f[DATA][20] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][18]  ( .G(N3), .D(N22), .Q(
        \bundled_ch_f[DATA][18] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][16]  ( .G(N3), .D(N20), .Q(
        \bundled_ch_f[DATA][16] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][14]  ( .G(N3), .D(N18), .Q(
        \bundled_ch_f[DATA][14] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][12]  ( .G(N3), .D(N16), .Q(
        \bundled_ch_f[DATA][12] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][10]  ( .G(N3), .D(N14), .Q(
        \bundled_ch_f[DATA][10] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][8]  ( .G(N3), .D(N12), .Q(
        \bundled_ch_f[DATA][8] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][6]  ( .G(N3), .D(N10), .Q(
        \bundled_ch_f[DATA][6] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][4]  ( .G(N3), .D(N8), .Q(
        \bundled_ch_f[DATA][4] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][2]  ( .G(N3), .D(N6), .Q(
        \bundled_ch_f[DATA][2] ) );
  HS65_LS_LDLRQX9 \bundled_ch_f_reg[DATA][33]  ( .D(\LEDR_link_f[TOKEN_T] ), 
        .GN(latch_enable), .RN(n1), .Q(\bundled_ch_f[DATA][33] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][29]  ( .G(N3), .D(N33), .Q(
        \bundled_ch_f[DATA][29] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][27]  ( .G(N3), .D(N31), .Q(
        \bundled_ch_f[DATA][27] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][25]  ( .G(N3), .D(N29), .Q(
        \bundled_ch_f[DATA][25] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][23]  ( .G(N3), .D(N27), .Q(
        \bundled_ch_f[DATA][23] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][21]  ( .G(N3), .D(N25), .Q(
        \bundled_ch_f[DATA][21] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][19]  ( .G(N3), .D(N23), .Q(
        \bundled_ch_f[DATA][19] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][17]  ( .G(N3), .D(N21), .Q(
        \bundled_ch_f[DATA][17] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][15]  ( .G(N3), .D(N19), .Q(
        \bundled_ch_f[DATA][15] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][13]  ( .G(N3), .D(N17), .Q(
        \bundled_ch_f[DATA][13] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][11]  ( .G(N3), .D(N15), .Q(
        \bundled_ch_f[DATA][11] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][7]  ( .G(N3), .D(N11), .Q(
        \bundled_ch_f[DATA][7] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][5]  ( .G(N3), .D(N9), .Q(
        \bundled_ch_f[DATA][5] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][3]  ( .G(N3), .D(N7), .Q(
        \bundled_ch_f[DATA][3] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][9]  ( .G(N3), .D(N13), .Q(
        \bundled_ch_f[DATA][9] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][31]  ( .G(N3), .D(N35), .Q(
        \bundled_ch_f[DATA][31] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][0]  ( .G(N3), .D(N4), .Q(
        \bundled_ch_f[DATA][0] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][32]  ( .G(N3), .D(N36), .Q(
        \bundled_ch_f[DATA][32] ) );
  HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][1]  ( .G(N3), .D(N5), .Q(
        \bundled_ch_f[DATA][1] ) );
  HS65_LSS_XOR2X6 U3 ( .A(\LEDR_link_f[PHIT_PARITY][7] ), .B(
        \LEDR_link_f[PHIT][7] ), .Z(data_cd[7]) );
  HS65_LSS_XOR2X6 U4 ( .A(\LEDR_link_f[PHIT_PARITY][4] ), .B(
        \LEDR_link_f[PHIT][4] ), .Z(data_cd[4]) );
  HS65_LSS_XOR2X6 U5 ( .A(\LEDR_link_f[PHIT_PARITY][3] ), .B(
        \LEDR_link_f[PHIT][3] ), .Z(data_cd[3]) );
  HS65_LSS_XOR2X6 U6 ( .A(\LEDR_link_f[PHIT_PARITY][8] ), .B(
        \LEDR_link_f[PHIT][8] ), .Z(data_cd[8]) );
  HS65_LSS_XOR2X6 U7 ( .A(\LEDR_link_f[PHIT_PARITY][9] ), .B(
        \LEDR_link_f[PHIT][9] ), .Z(data_cd[9]) );
  HS65_LSS_XOR2X6 U8 ( .A(\LEDR_link_f[PHIT_PARITY][16] ), .B(
        \LEDR_link_f[PHIT][16] ), .Z(data_cd[16]) );
  HS65_LSS_XOR2X6 U9 ( .A(\LEDR_link_f[PHIT_PARITY][15] ), .B(
        \LEDR_link_f[PHIT][15] ), .Z(data_cd[15]) );
  HS65_LSS_XOR2X6 U10 ( .A(\LEDR_link_f[PHIT_PARITY][25] ), .B(
        \LEDR_link_f[PHIT][25] ), .Z(data_cd[25]) );
  HS65_LSS_XOR2X6 U11 ( .A(\LEDR_link_f[PHIT_PARITY][24] ), .B(
        \LEDR_link_f[PHIT][24] ), .Z(data_cd[24]) );
  HS65_LSS_XOR2X6 U12 ( .A(\LEDR_link_f[PHIT_PARITY][26] ), .B(
        \LEDR_link_f[PHIT][26] ), .Z(data_cd[26]) );
  HS65_LSS_XOR2X6 U13 ( .A(\LEDR_link_f[PHIT_PARITY][12] ), .B(
        \LEDR_link_f[PHIT][12] ), .Z(data_cd[12]) );
  HS65_LSS_XOR2X6 U14 ( .A(\LEDR_link_f[PHIT_PARITY][1] ), .B(
        \LEDR_link_f[PHIT][1] ), .Z(data_cd[1]) );
  HS65_LSS_XOR2X6 U15 ( .A(\LEDR_link_f[PHIT_PARITY][23] ), .B(
        \LEDR_link_f[PHIT][23] ), .Z(data_cd[23]) );
  HS65_LSS_XOR2X6 U16 ( .A(\LEDR_link_f[PHIT_PARITY][2] ), .B(
        \LEDR_link_f[PHIT][2] ), .Z(data_cd[2]) );
  HS65_LSS_XOR2X6 U17 ( .A(\LEDR_link_f[PHIT_PARITY][30] ), .B(
        \LEDR_link_f[PHIT][30] ), .Z(data_cd[30]) );
  HS65_LSS_XOR2X6 U18 ( .A(\LEDR_link_f[PHIT_PARITY][19] ), .B(
        \LEDR_link_f[PHIT][19] ), .Z(data_cd[19]) );
  HS65_LSS_XOR2X6 U19 ( .A(\LEDR_link_f[PHIT_PARITY][22] ), .B(
        \LEDR_link_f[PHIT][22] ), .Z(data_cd[22]) );
  HS65_LSS_XOR2X6 U20 ( .A(\LEDR_link_f[PHIT_PARITY][11] ), .B(
        \LEDR_link_f[PHIT][11] ), .Z(data_cd[11]) );
  HS65_LSS_XOR2X6 U21 ( .A(\LEDR_link_f[PHIT_PARITY][27] ), .B(
        \LEDR_link_f[PHIT][27] ), .Z(data_cd[27]) );
  HS65_LSS_XOR2X6 U22 ( .A(\LEDR_link_f[PHIT_PARITY][0] ), .B(
        \LEDR_link_f[PHIT][0] ), .Z(data_cd[0]) );
  HS65_LSS_XOR2X6 U23 ( .A(\LEDR_link_f[PHIT_PARITY][10] ), .B(
        \LEDR_link_f[PHIT][10] ), .Z(data_cd[10]) );
  HS65_LSS_XOR2X6 U24 ( .A(\LEDR_link_f[PHIT_PARITY][13] ), .B(
        \LEDR_link_f[PHIT][13] ), .Z(data_cd[13]) );
  HS65_LSS_XOR2X6 U25 ( .A(\LEDR_link_f[PHIT_PARITY][14] ), .B(
        \LEDR_link_f[PHIT][14] ), .Z(data_cd[14]) );
  HS65_LSS_XOR2X6 U26 ( .A(\LEDR_link_f[PHIT_PARITY][17] ), .B(
        \LEDR_link_f[PHIT][17] ), .Z(data_cd[17]) );
  HS65_LSS_XOR2X6 U27 ( .A(\LEDR_link_f[PHIT_PARITY][18] ), .B(
        \LEDR_link_f[PHIT][18] ), .Z(data_cd[18]) );
  HS65_LSS_XOR2X6 U28 ( .A(\LEDR_link_f[PHIT_PARITY][20] ), .B(
        \LEDR_link_f[PHIT][20] ), .Z(data_cd[20]) );
  HS65_LSS_XOR2X6 U29 ( .A(\LEDR_link_f[PHIT_PARITY][21] ), .B(
        \LEDR_link_f[PHIT][21] ), .Z(data_cd[21]) );
  HS65_LSS_XOR2X6 U30 ( .A(\LEDR_link_f[PHIT_PARITY][28] ), .B(
        \LEDR_link_f[PHIT][28] ), .Z(data_cd[28]) );
  HS65_LSS_XOR2X6 U31 ( .A(\LEDR_link_f[PHIT_PARITY][29] ), .B(
        \LEDR_link_f[PHIT][29] ), .Z(data_cd[29]) );
  HS65_LSS_XOR2X6 U32 ( .A(\LEDR_link_f[PHIT_PARITY][31] ), .B(
        \LEDR_link_f[PHIT][31] ), .Z(data_cd[31]) );
  HS65_LSS_XOR2X6 U33 ( .A(\LEDR_link_f[PHIT_PARITY][32] ), .B(
        \LEDR_link_f[PHIT][32] ), .Z(data_cd[32]) );
  HS65_LSS_XOR2X6 U34 ( .A(\LEDR_link_f[PHIT_PARITY][5] ), .B(
        \LEDR_link_f[PHIT][5] ), .Z(data_cd[5]) );
  HS65_LSS_XOR2X6 U35 ( .A(\LEDR_link_f[PHIT_PARITY][6] ), .B(
        \LEDR_link_f[PHIT][6] ), .Z(data_cd[6]) );
  HS65_LSS_XNOR2X6 U36 ( .A(n3), .B(\LEDR_link_f[TOKEN_PARITY] ), .Z(
        token_phase) );
  HS65_LS_IVX9 U37 ( .A(preset), .Z(n1) );
  HS65_LS_IVX9 U38 ( .A(\LEDR_link_f[TOKEN_T] ), .Z(n3) );
  HS65_LS_NOR2AX3 U39 ( .A(\LEDR_link_f[PHIT][0] ), .B(preset), .Z(N4) );
  HS65_LS_NOR2AX3 U40 ( .A(\LEDR_link_f[PHIT][1] ), .B(preset), .Z(N5) );
  HS65_LS_NOR2AX3 U41 ( .A(\LEDR_link_f[PHIT][2] ), .B(preset), .Z(N6) );
  HS65_LS_NOR2AX3 U42 ( .A(\LEDR_link_f[PHIT][3] ), .B(preset), .Z(N7) );
  HS65_LS_NOR2AX3 U43 ( .A(\LEDR_link_f[PHIT][4] ), .B(preset), .Z(N8) );
  HS65_LS_NOR2AX3 U44 ( .A(\LEDR_link_f[PHIT][6] ), .B(preset), .Z(N10) );
  HS65_LS_NOR2AX3 U45 ( .A(\LEDR_link_f[PHIT][24] ), .B(preset), .Z(N28) );
  HS65_LS_NOR2AX3 U46 ( .A(\LEDR_link_f[PHIT][25] ), .B(preset), .Z(N29) );
  HS65_LS_NOR2AX3 U47 ( .A(\LEDR_link_f[PHIT][26] ), .B(preset), .Z(N30) );
  HS65_LS_NOR2AX3 U48 ( .A(\LEDR_link_f[PHIT][27] ), .B(preset), .Z(N31) );
  HS65_LS_NOR2AX3 U49 ( .A(\LEDR_link_f[PHIT][28] ), .B(preset), .Z(N32) );
  HS65_LS_NOR2AX3 U50 ( .A(\LEDR_link_f[PHIT][29] ), .B(preset), .Z(N33) );
  HS65_LS_NOR2AX3 U51 ( .A(\LEDR_link_f[PHIT][30] ), .B(preset), .Z(N34) );
  HS65_LS_NOR2AX3 U52 ( .A(\LEDR_link_f[PHIT][31] ), .B(preset), .Z(N35) );
  HS65_LS_NOR2AX3 U53 ( .A(\LEDR_link_f[PHIT][32] ), .B(preset), .Z(N36) );
  HS65_LS_NOR2AX3 U54 ( .A(\LEDR_link_f[PHIT][5] ), .B(preset), .Z(N9) );
  HS65_LS_NOR2AX3 U55 ( .A(\LEDR_link_f[PHIT][7] ), .B(preset), .Z(N11) );
  HS65_LS_NOR2AX3 U56 ( .A(\LEDR_link_f[PHIT][8] ), .B(preset), .Z(N12) );
  HS65_LS_NOR2AX3 U57 ( .A(\LEDR_link_f[PHIT][9] ), .B(preset), .Z(N13) );
  HS65_LS_NOR2AX3 U58 ( .A(\LEDR_link_f[PHIT][10] ), .B(preset), .Z(N14) );
  HS65_LS_NOR2AX3 U59 ( .A(\LEDR_link_f[PHIT][11] ), .B(preset), .Z(N15) );
  HS65_LS_NOR2AX3 U60 ( .A(\LEDR_link_f[PHIT][12] ), .B(preset), .Z(N16) );
  HS65_LS_NOR2AX3 U61 ( .A(\LEDR_link_f[PHIT][13] ), .B(preset), .Z(N17) );
  HS65_LS_NOR2AX3 U62 ( .A(\LEDR_link_f[PHIT][14] ), .B(preset), .Z(N18) );
  HS65_LS_NOR2AX3 U63 ( .A(\LEDR_link_f[PHIT][15] ), .B(preset), .Z(N19) );
  HS65_LS_NOR2AX3 U64 ( .A(\LEDR_link_f[PHIT][16] ), .B(preset), .Z(N20) );
  HS65_LS_NOR2AX3 U65 ( .A(\LEDR_link_f[PHIT][17] ), .B(preset), .Z(N21) );
  HS65_LS_NOR2AX3 U66 ( .A(\LEDR_link_f[PHIT][18] ), .B(preset), .Z(N22) );
  HS65_LS_NOR2AX3 U67 ( .A(\LEDR_link_f[PHIT][19] ), .B(preset), .Z(N23) );
  HS65_LS_NOR2AX3 U68 ( .A(\LEDR_link_f[PHIT][20] ), .B(preset), .Z(N24) );
  HS65_LS_NOR2AX3 U69 ( .A(\LEDR_link_f[PHIT][21] ), .B(preset), .Z(N25) );
  HS65_LS_NOR2AX3 U70 ( .A(\LEDR_link_f[PHIT][22] ), .B(preset), .Z(N26) );
  HS65_LS_NOR2AX3 U71 ( .A(\LEDR_link_f[PHIT][23] ), .B(preset), .Z(N27) );
  HS65_LS_OAI21X3 U72 ( .A(latch_enable), .B(n3), .C(n1), .Z(N3) );
  HS65_LSS_XOR2X6 U73 ( .A(empty_phase), .B(data_cd_phase), .Z(req_in) );
endmodule


module noc_switch_x0_y0 ( preset, north_in_f, east_in_f, south_in_f, west_in_f, 
        resource_in_f, north_out_f, east_out_f, south_out_f, west_out_f, 
        resource_out_f, north_in_b_ACK_, east_in_b_ACK_, south_in_b_ACK_, 
        west_in_b_ACK_, resource_in_b_ACK_, north_out_b_ACK_, east_out_b_ACK_, 
        south_out_b_ACK_, west_out_b_ACK_, resource_out_b_ACK_ );
  input [67:0] north_in_f;
  input [67:0] east_in_f;
  input [67:0] south_in_f;
  input [67:0] west_in_f;
  input [67:0] resource_in_f;
  output [67:0] north_out_f;
  output [67:0] east_out_f;
  output [67:0] south_out_f;
  output [67:0] west_out_f;
  output [67:0] resource_out_f;
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

  LEDR2bundled_1_000000000_0 north_in_latch ( .preset(preset), .LEDR_link_f(
        north_in_f), .LEDR_link_b(north_in_b_ACK_), .bundled_ch_f(north_hpu_f), 
        .bundled_ch_b(north_hpu_b_ACK_) );
  LEDR2bundled_1_000000000_4 south_in_latch ( .preset(preset), .LEDR_link_f(
        south_in_f), .LEDR_link_b(south_in_b_ACK_), .bundled_ch_f(south_hpu_f), 
        .bundled_ch_b(south_hpu_b_ACK_) );
  LEDR2bundled_1_000000000_3 east_in_latch ( .preset(preset), .LEDR_link_f(
        east_in_f), .LEDR_link_b(east_in_b_ACK_), .bundled_ch_f(east_hpu_f), 
        .bundled_ch_b(east_hpu_b_ACK_) );
  LEDR2bundled_1_000000000_2 west_in_latch ( .preset(preset), .LEDR_link_f(
        west_in_f), .LEDR_link_b(west_in_b_ACK_), .bundled_ch_f(west_hpu_f), 
        .bundled_ch_b(west_hpu_b_ACK_) );
  LEDR2bundled_1_000000000_1 resource_in_latch ( .preset(preset), 
        .LEDR_link_f(resource_in_f), .LEDR_link_b(resource_in_b_ACK_), 
        .bundled_ch_f(resource_hpu_f), .bundled_ch_b(resource_hpu_b_ACK_) );
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

