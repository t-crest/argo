module select_element_0 (
	preset, 
	\input , 
	true, 
	false, 
	sel);
   input preset;
   input \input ;
   output true;
   output false;
   input sel;

   // Internal wires
   wire n1;
   wire n2;
   wire n3;

   HS65_LS_LDHRQX9 true_latch_out_reg (.RN(n3), 
	.Q(true), 
	.G(sel), 
	.D(n1));
   HS65_LS_LDLRQX9 false_latch_out_reg (.RN(n3), 
	.Q(false), 
	.GN(sel), 
	.D(n2));
   HS65_LSS_XOR2X6 U3 (.Z(n1), 
	.B(false), 
	.A(\input ));
   HS65_LS_IVX9 U4 (.Z(n3), 
	.A(preset));
   HS65_LSS_XOR2X6 U5 (.Z(n2), 
	.B(true), 
	.A(\input ));
endmodule

module sr_latch_0_0 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire N1;
   wire n2;

   HS65_LS_AND2X27 C8 (.Z(q), 
	.B(N1), 
	.A(n2));
   HS65_LS_IVX9 U1 (.Z(N1), 
	.A(qn));
   HS65_LS_IVX9 U2 (.Z(n2), 
	.A(r));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_0_0 (
	preset, 
	a, 
	b, 
	c);
   input preset;
   input a;
   input b;
   output c;

   // Internal wires
   wire set;
   wire reset;
   wire n1;

   HS65_LS_OAI12X12 FE_RC_155_0 (.Z(reset), 
	.C(n1), 
	.B(b), 
	.A(a));
   sr_latch_0_0 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_IVX9 U4 (.Z(n1), 
	.A(preset));
   HS65_LS_AND3X9 U5 (.Z(set), 
	.C(a), 
	.B(n1), 
	.A(b));
endmodule

module sr_latch_0_19 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire N1;
   wire n1;

   HS65_LS_AND2X18 C8 (.Z(q), 
	.B(N1), 
	.A(n1));
   HS65_LS_IVX9 U1 (.Z(n1), 
	.A(r));
   HS65_LS_NOR2X6 U2 (.Z(qn), 
	.B(q), 
	.A(s));
   HS65_LS_IVX9 U3 (.Z(N1), 
	.A(qn));
endmodule

module c_gate_generic_0_33_0 (
	preset, 
	\input , 
	\output , 
	FE_OFN999_preset);
   input preset;
   input [32:0] \input ;
   output \output ;
   input FE_OFN999_preset;

   // Internal wires
   wire FE_RN_555_0;
   wire FE_RN_554_0;
   wire FE_RN_553_0;
   wire FE_RN_552_0;
   wire FE_RN_551_0;
   wire FE_RN_550_0;
   wire FE_RN_549_0;
   wire FE_RN_548_0;
   wire FE_RN_547_0;
   wire FE_RN_546_0;
   wire FE_RN_349_0;
   wire FE_RN_348_0;
   wire FE_RN_347_0;
   wire FE_RN_346_0;
   wire FE_RN_345_0;
   wire FE_RN_344_0;
   wire FE_RN_343_0;
   wire FE_RN_342_0;
   wire FE_RN_341_0;
   wire FE_RN_340_0;
   wire FE_RN_339_0;
   wire FE_RN_338_0;
   wire FE_RN_144_0;
   wire FE_RN_143_0;
   wire FE_RN_49_0;
   wire FE_RN_48_0;
   wire FE_RN_47_0;
   wire FE_RN_46_0;
   wire set;
   wire reset;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n1;

   HS65_LS_CNNAND2X18 FE_RC_780_0 (.Z(FE_RN_555_0), 
	.B(FE_RN_46_0), 
	.A(FE_RN_47_0));
   HS65_LS_CNNAND2X18 FE_RC_779_0 (.Z(FE_RN_554_0), 
	.B(n16), 
	.A(n12));
   HS65_LS_CNNOR2X24 FE_RC_778_0 (.Z(FE_RN_553_0), 
	.B(\input [19]), 
	.A(\input [1]));
   HS65_LS_NAND3X25 FE_RC_777_0 (.Z(FE_RN_552_0), 
	.C(FE_RN_553_0), 
	.B(n9), 
	.A(n8));
   HS65_LS_NOR3X18 FE_RC_776_0 (.Z(FE_RN_551_0), 
	.C(FE_RN_552_0), 
	.B(FE_RN_554_0), 
	.A(FE_RN_555_0));
   HS65_LS_CNNAND2X18 FE_RC_775_0 (.Z(FE_RN_550_0), 
	.B(n11), 
	.A(n10));
   HS65_LS_CNNAND2X18 FE_RC_774_0 (.Z(FE_RN_549_0), 
	.B(FE_RN_49_0), 
	.A(FE_RN_48_0));
   HS65_LS_CNNOR2X24 FE_RC_773_0 (.Z(FE_RN_548_0), 
	.B(\input [22]), 
	.A(\input [23]));
   HS65_LS_NAND3X25 FE_RC_772_0 (.Z(FE_RN_547_0), 
	.C(FE_RN_548_0), 
	.B(n7), 
	.A(n6));
   HS65_LS_NOR3X18 FE_RC_771_0 (.Z(FE_RN_546_0), 
	.C(FE_RN_547_0), 
	.B(FE_RN_549_0), 
	.A(FE_RN_550_0));
   HS65_LS_CNNAND2X18 FE_RC_770_0 (.Z(n29), 
	.B(FE_RN_551_0), 
	.A(FE_RN_546_0));
   HS65_LS_CNNAND2X18 FE_RC_515_0 (.Z(FE_RN_349_0), 
	.B(n2), 
	.A(FE_RN_143_0));
   HS65_LS_CNNAND2X18 FE_RC_514_0 (.Z(FE_RN_348_0), 
	.B(n3), 
	.A(FE_RN_144_0));
   HS65_LS_CNNOR2X24 FE_RC_513_0 (.Z(FE_RN_347_0), 
	.B(\input [26]), 
	.A(\input [27]));
   HS65_LS_CNNOR2X24 FE_RC_512_0 (.Z(FE_RN_346_0), 
	.B(\input [24]), 
	.A(\input [25]));
   HS65_LS_CNNAND2X18 FE_RC_511_0 (.Z(FE_RN_345_0), 
	.B(FE_RN_346_0), 
	.A(FE_RN_347_0));
   HS65_LS_NOR3X18 FE_RC_510_0 (.Z(FE_RN_344_0), 
	.C(FE_RN_345_0), 
	.B(FE_RN_348_0), 
	.A(FE_RN_349_0));
   HS65_LS_CNNAND2AX18 FE_RC_509_0 (.Z(FE_RN_343_0), 
	.B(n15), 
	.A(\input [8]));
   HS65_LS_CNNOR2X15 FE_RC_508_0 (.Z(FE_RN_342_0), 
	.B(\input [9]), 
	.A(\input [7]));
   HS65_LS_CNNAND2X18 FE_RC_507_0 (.Z(FE_RN_341_0), 
	.B(FE_RN_342_0), 
	.A(n14));
   HS65_LS_CNNOR2X15 FE_RC_506_0 (.Z(FE_RN_340_0), 
	.B(\input [2]), 
	.A(\input [30]));
   HS65_LS_NAND3X13 FE_RC_505_0 (.Z(FE_RN_339_0), 
	.C(FE_RN_340_0), 
	.B(n4), 
	.A(n5));
   HS65_LS_NOR3X13 FE_RC_504_0 (.Z(FE_RN_338_0), 
	.C(FE_RN_339_0), 
	.B(FE_RN_343_0), 
	.A(FE_RN_341_0));
   HS65_LS_NAND2X14 FE_RC_503_0 (.Z(n28), 
	.B(FE_RN_338_0), 
	.A(FE_RN_344_0));
   HS65_LS_OAI12X12 FE_RC_282_0 (.Z(reset), 
	.C(n1), 
	.B(n29), 
	.A(n28));
   HS65_LS_CNIVX21 FE_RC_261_0 (.Z(FE_RN_144_0), 
	.A(\input [4]));
   HS65_LS_CNIVX21 FE_RC_260_0 (.Z(FE_RN_143_0), 
	.A(\input [3]));
   HS65_LS_CNIVX27 FE_RC_120_0 (.Z(FE_RN_49_0), 
	.A(\input [16]));
   HS65_LS_CNIVX27 FE_RC_119_0 (.Z(FE_RN_48_0), 
	.A(\input [15]));
   HS65_LS_CNIVX27 FE_RC_117_0 (.Z(FE_RN_47_0), 
	.A(\input [12]));
   HS65_LS_CNIVX21 FE_RC_116_0 (.Z(FE_RN_46_0), 
	.A(\input [11]));
   sr_latch_0_19 latch (.s(set), 
	.r(reset), 
	.q(\output ));
   HS65_LH_NOR4ABX2 U3 (.Z(n17), 
	.D(n6), 
	.C(n7), 
	.B(\input [22]), 
	.A(\input [23]));
   HS65_LH_NOR4ABX2 U5 (.Z(n25), 
	.D(n4), 
	.C(n3), 
	.B(\input [30]), 
	.A(\input [2]));
   HS65_LS_CNIVX27 U15 (.Z(n9), 
	.A(\input [17]));
   HS65_LS_CNIVX34 U16 (.Z(n7), 
	.A(\input [20]));
   HS65_LS_CNIVX27 U18 (.Z(n5), 
	.A(\input [28]));
   HS65_LS_CNIVX27 U19 (.Z(n8), 
	.A(\input [18]));
   HS65_LS_CNIVX34 U20 (.Z(n6), 
	.A(\input [21]));
   HS65_LS_CNIVX27 U21 (.Z(n4), 
	.A(\input [29]));
   HS65_LS_CNIVX34 U22 (.Z(n15), 
	.A(\input [5]));
   HS65_LS_CNIVX27 U23 (.Z(n14), 
	.A(\input [6]));
   HS65_LS_CNIVX34 U24 (.Z(n11), 
	.A(\input [13]));
   HS65_LS_CNIVX27 U25 (.Z(n3), 
	.A(\input [31]));
   HS65_LS_CNIVX27 U26 (.Z(n12), 
	.A(\input [10]));
   HS65_LS_CNIVX34 U27 (.Z(n16), 
	.A(\input [0]));
   HS65_LS_CNIVX27 U28 (.Z(n10), 
	.A(\input [14]));
   HS65_LS_CNIVX27 U29 (.Z(n2), 
	.A(\input [32]));
   HS65_LS_NOR3X4 U31 (.Z(n21), 
	.C(n16), 
	.B(FE_OFN999_preset), 
	.A(n12));
   HS65_LS_NOR4ABX2 U32 (.Z(set), 
	.D(n20), 
	.C(n19), 
	.B(n18), 
	.A(n17));
   HS65_LS_NOR3AX2 U33 (.Z(n26), 
	.C(n5), 
	.B(n27), 
	.A(\input [27]));
   HS65_LS_IVX9 U34 (.Z(n1), 
	.A(preset));
   HS65_LS_NOR4ABX2 U35 (.Z(n18), 
	.D(n8), 
	.C(n9), 
	.B(\input [19]), 
	.A(\input [1]));
   HS65_LS_NAND4ABX3 U36 (.Z(n19), 
	.D(n26), 
	.C(n25), 
	.B(n24), 
	.A(n23));
   HS65_LS_NOR4ABX2 U37 (.Z(n22), 
	.D(n10), 
	.C(n11), 
	.B(\input [15]), 
	.A(\input [16]));
   HS65_LS_NAND3X5 U38 (.Z(n27), 
	.C(\input [26]), 
	.B(\input [24]), 
	.A(\input [25]));
   HS65_LS_NAND4ABX3 U39 (.Z(n23), 
	.D(\input [4]), 
	.C(\input [3]), 
	.B(n15), 
	.A(n2));
   HS65_LS_NAND4ABX3 U40 (.Z(n24), 
	.D(\input [8]), 
	.C(\input [7]), 
	.B(n13), 
	.A(n14));
   HS65_LS_NAND4X9 U41 (.Z(n20), 
	.D(n22), 
	.C(n21), 
	.B(\input [12]), 
	.A(\input [11]));
   HS65_LS_IVX9 U42 (.Z(n13), 
	.A(\input [9]));
endmodule

module sr_latch_0_10 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire FE_PHN1437_n1;
   wire FE_PHN1416_n1;
   wire N1;
   wire n1;

   HS65_LS_BFX7 FE_PHC1437_n1 (.Z(FE_PHN1437_n1), 
	.A(n1));
   HS65_LH_DLYIC2X9 FE_PHC1416_n1 (.Z(FE_PHN1416_n1), 
	.A(FE_PHN1437_n1));
   HS65_LH_AND2X4 C8 (.Z(q), 
	.B(N1), 
	.A(FE_PHN1416_n1));
   HS65_LH_IVX62 U1 (.Z(n1), 
	.A(r));
   HS65_LS_IVX9 U2 (.Z(N1), 
	.A(qn));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_0_10 (
	preset, 
	a, 
	b, 
	c);
   input preset;
   input a;
   input b;
   output c;

   // Internal wires
   wire set;
   wire reset;
   wire n1;

   sr_latch_0_10 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_OAI12X3 U3 (.Z(reset), 
	.C(n1), 
	.B(a), 
	.A(b));
   HS65_LS_IVX9 U4 (.Z(n1), 
	.A(preset));
   HS65_LS_AND3X9 U5 (.Z(set), 
	.C(a), 
	.B(n1), 
	.A(b));
endmodule

module latch_controller_1_0 (
	preset, 
	Rin, 
	Aout, 
	Rout, 
	Ain, 
	lt_en);
   input preset;
   input Rin;
   output Aout;
   output Rout;
   input Ain;
   output lt_en;

   // Internal wires
   wire FE_PHN1398_d;
   wire not_Ain;
   wire d;

   HS65_LH_DLYIC4X9 FE_PHC1398_d (.Z(FE_PHN1398_d), 
	.A(d));
   c_gate_0_10 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Rout));
   HS65_LS_IVX9 I_1 (.Z(Aout), 
	.A(FE_PHN1398_d));
   HS65_LS_IVX9 I_0 (.Z(not_Ain), 
	.A(Ain));
   HS65_LH_IVX2 I_2 (.Z(d), 
	.A(Rout));
   HS65_LSS_XOR2X6 U5 (.Z(lt_en), 
	.B(Ain), 
	.A(Rout));
endmodule

module LEDR2bundled_1_000000000_0 (
	preset, 
	.LEDR_link_f ( { \LEDR_link_f[TOKEN_T] , 
		\LEDR_link_f[TOKEN_PARITY] , 
		\LEDR_link_f[PHIT][32] , 
		\LEDR_link_f[PHIT][31] , 
		\LEDR_link_f[PHIT][30] , 
		\LEDR_link_f[PHIT][29] , 
		\LEDR_link_f[PHIT][28] , 
		\LEDR_link_f[PHIT][27] , 
		\LEDR_link_f[PHIT][26] , 
		\LEDR_link_f[PHIT][25] , 
		\LEDR_link_f[PHIT][24] , 
		\LEDR_link_f[PHIT][23] , 
		\LEDR_link_f[PHIT][22] , 
		\LEDR_link_f[PHIT][21] , 
		\LEDR_link_f[PHIT][20] , 
		\LEDR_link_f[PHIT][19] , 
		\LEDR_link_f[PHIT][18] , 
		\LEDR_link_f[PHIT][17] , 
		\LEDR_link_f[PHIT][16] , 
		\LEDR_link_f[PHIT][15] , 
		\LEDR_link_f[PHIT][14] , 
		\LEDR_link_f[PHIT][13] , 
		\LEDR_link_f[PHIT][12] , 
		\LEDR_link_f[PHIT][11] , 
		\LEDR_link_f[PHIT][10] , 
		\LEDR_link_f[PHIT][9] , 
		\LEDR_link_f[PHIT][8] , 
		\LEDR_link_f[PHIT][7] , 
		\LEDR_link_f[PHIT][6] , 
		\LEDR_link_f[PHIT][5] , 
		\LEDR_link_f[PHIT][4] , 
		\LEDR_link_f[PHIT][3] , 
		\LEDR_link_f[PHIT][2] , 
		\LEDR_link_f[PHIT][1] , 
		\LEDR_link_f[PHIT][0] , 
		\LEDR_link_f[PHIT_PARITY][32] , 
		\LEDR_link_f[PHIT_PARITY][31] , 
		\LEDR_link_f[PHIT_PARITY][30] , 
		\LEDR_link_f[PHIT_PARITY][29] , 
		\LEDR_link_f[PHIT_PARITY][28] , 
		\LEDR_link_f[PHIT_PARITY][27] , 
		\LEDR_link_f[PHIT_PARITY][26] , 
		\LEDR_link_f[PHIT_PARITY][25] , 
		\LEDR_link_f[PHIT_PARITY][24] , 
		\LEDR_link_f[PHIT_PARITY][23] , 
		\LEDR_link_f[PHIT_PARITY][22] , 
		\LEDR_link_f[PHIT_PARITY][21] , 
		\LEDR_link_f[PHIT_PARITY][20] , 
		\LEDR_link_f[PHIT_PARITY][19] , 
		\LEDR_link_f[PHIT_PARITY][18] , 
		\LEDR_link_f[PHIT_PARITY][17] , 
		\LEDR_link_f[PHIT_PARITY][16] , 
		\LEDR_link_f[PHIT_PARITY][15] , 
		\LEDR_link_f[PHIT_PARITY][14] , 
		\LEDR_link_f[PHIT_PARITY][13] , 
		\LEDR_link_f[PHIT_PARITY][12] , 
		\LEDR_link_f[PHIT_PARITY][11] , 
		\LEDR_link_f[PHIT_PARITY][10] , 
		\LEDR_link_f[PHIT_PARITY][9] , 
		\LEDR_link_f[PHIT_PARITY][8] , 
		\LEDR_link_f[PHIT_PARITY][7] , 
		\LEDR_link_f[PHIT_PARITY][6] , 
		\LEDR_link_f[PHIT_PARITY][5] , 
		\LEDR_link_f[PHIT_PARITY][4] , 
		\LEDR_link_f[PHIT_PARITY][3] , 
		\LEDR_link_f[PHIT_PARITY][2] , 
		\LEDR_link_f[PHIT_PARITY][1] , 
		\LEDR_link_f[PHIT_PARITY][0]  } ), 
	.LEDR_link_b ( \LEDR_link_b[ACK]  ), 
	.bundled_ch_f ( { \bundled_ch_f[REQ] , 
		\bundled_ch_f[DATA][33] , 
		\bundled_ch_f[DATA][32] , 
		\bundled_ch_f[DATA][31] , 
		\bundled_ch_f[DATA][30] , 
		\bundled_ch_f[DATA][29] , 
		\bundled_ch_f[DATA][28] , 
		\bundled_ch_f[DATA][27] , 
		\bundled_ch_f[DATA][26] , 
		\bundled_ch_f[DATA][25] , 
		\bundled_ch_f[DATA][24] , 
		\bundled_ch_f[DATA][23] , 
		\bundled_ch_f[DATA][22] , 
		\bundled_ch_f[DATA][21] , 
		\bundled_ch_f[DATA][20] , 
		\bundled_ch_f[DATA][19] , 
		\bundled_ch_f[DATA][18] , 
		\bundled_ch_f[DATA][17] , 
		\bundled_ch_f[DATA][16] , 
		\bundled_ch_f[DATA][15] , 
		\bundled_ch_f[DATA][14] , 
		\bundled_ch_f[DATA][13] , 
		\bundled_ch_f[DATA][12] , 
		\bundled_ch_f[DATA][11] , 
		\bundled_ch_f[DATA][10] , 
		\bundled_ch_f[DATA][9] , 
		\bundled_ch_f[DATA][8] , 
		\bundled_ch_f[DATA][7] , 
		\bundled_ch_f[DATA][6] , 
		\bundled_ch_f[DATA][5] , 
		\bundled_ch_f[DATA][4] , 
		\bundled_ch_f[DATA][3] , 
		\bundled_ch_f[DATA][2] , 
		\bundled_ch_f[DATA][1] , 
		\bundled_ch_f[DATA][0]  } ), 
	.bundled_ch_b ( \bundled_ch_b[ACK]  ), 
	FE_OFN1_preset, 
	FE_OFN997_preset, 
	FE_OFN998_preset, 
	FE_OFN999_preset);
   input preset;
   input \LEDR_link_f[TOKEN_T] ;
   input \LEDR_link_f[TOKEN_PARITY] ;
   input \LEDR_link_f[PHIT][32] ;
   input \LEDR_link_f[PHIT][31] ;
   input \LEDR_link_f[PHIT][30] ;
   input \LEDR_link_f[PHIT][29] ;
   input \LEDR_link_f[PHIT][28] ;
   input \LEDR_link_f[PHIT][27] ;
   input \LEDR_link_f[PHIT][26] ;
   input \LEDR_link_f[PHIT][25] ;
   input \LEDR_link_f[PHIT][24] ;
   input \LEDR_link_f[PHIT][23] ;
   input \LEDR_link_f[PHIT][22] ;
   input \LEDR_link_f[PHIT][21] ;
   input \LEDR_link_f[PHIT][20] ;
   input \LEDR_link_f[PHIT][19] ;
   input \LEDR_link_f[PHIT][18] ;
   input \LEDR_link_f[PHIT][17] ;
   input \LEDR_link_f[PHIT][16] ;
   input \LEDR_link_f[PHIT][15] ;
   input \LEDR_link_f[PHIT][14] ;
   input \LEDR_link_f[PHIT][13] ;
   input \LEDR_link_f[PHIT][12] ;
   input \LEDR_link_f[PHIT][11] ;
   input \LEDR_link_f[PHIT][10] ;
   input \LEDR_link_f[PHIT][9] ;
   input \LEDR_link_f[PHIT][8] ;
   input \LEDR_link_f[PHIT][7] ;
   input \LEDR_link_f[PHIT][6] ;
   input \LEDR_link_f[PHIT][5] ;
   input \LEDR_link_f[PHIT][4] ;
   input \LEDR_link_f[PHIT][3] ;
   input \LEDR_link_f[PHIT][2] ;
   input \LEDR_link_f[PHIT][1] ;
   input \LEDR_link_f[PHIT][0] ;
   input \LEDR_link_f[PHIT_PARITY][32] ;
   input \LEDR_link_f[PHIT_PARITY][31] ;
   input \LEDR_link_f[PHIT_PARITY][30] ;
   input \LEDR_link_f[PHIT_PARITY][29] ;
   input \LEDR_link_f[PHIT_PARITY][28] ;
   input \LEDR_link_f[PHIT_PARITY][27] ;
   input \LEDR_link_f[PHIT_PARITY][26] ;
   input \LEDR_link_f[PHIT_PARITY][25] ;
   input \LEDR_link_f[PHIT_PARITY][24] ;
   input \LEDR_link_f[PHIT_PARITY][23] ;
   input \LEDR_link_f[PHIT_PARITY][22] ;
   input \LEDR_link_f[PHIT_PARITY][21] ;
   input \LEDR_link_f[PHIT_PARITY][20] ;
   input \LEDR_link_f[PHIT_PARITY][19] ;
   input \LEDR_link_f[PHIT_PARITY][18] ;
   input \LEDR_link_f[PHIT_PARITY][17] ;
   input \LEDR_link_f[PHIT_PARITY][16] ;
   input \LEDR_link_f[PHIT_PARITY][15] ;
   input \LEDR_link_f[PHIT_PARITY][14] ;
   input \LEDR_link_f[PHIT_PARITY][13] ;
   input \LEDR_link_f[PHIT_PARITY][12] ;
   input \LEDR_link_f[PHIT_PARITY][11] ;
   input \LEDR_link_f[PHIT_PARITY][10] ;
   input \LEDR_link_f[PHIT_PARITY][9] ;
   input \LEDR_link_f[PHIT_PARITY][8] ;
   input \LEDR_link_f[PHIT_PARITY][7] ;
   input \LEDR_link_f[PHIT_PARITY][6] ;
   input \LEDR_link_f[PHIT_PARITY][5] ;
   input \LEDR_link_f[PHIT_PARITY][4] ;
   input \LEDR_link_f[PHIT_PARITY][3] ;
   input \LEDR_link_f[PHIT_PARITY][2] ;
   input \LEDR_link_f[PHIT_PARITY][1] ;
   input \LEDR_link_f[PHIT_PARITY][0] ;
   output \LEDR_link_b[ACK] ;
   output \bundled_ch_f[REQ] ;
   output \bundled_ch_f[DATA][33] ;
   output \bundled_ch_f[DATA][32] ;
   output \bundled_ch_f[DATA][31] ;
   output \bundled_ch_f[DATA][30] ;
   output \bundled_ch_f[DATA][29] ;
   output \bundled_ch_f[DATA][28] ;
   output \bundled_ch_f[DATA][27] ;
   output \bundled_ch_f[DATA][26] ;
   output \bundled_ch_f[DATA][25] ;
   output \bundled_ch_f[DATA][24] ;
   output \bundled_ch_f[DATA][23] ;
   output \bundled_ch_f[DATA][22] ;
   output \bundled_ch_f[DATA][21] ;
   output \bundled_ch_f[DATA][20] ;
   output \bundled_ch_f[DATA][19] ;
   output \bundled_ch_f[DATA][18] ;
   output \bundled_ch_f[DATA][17] ;
   output \bundled_ch_f[DATA][16] ;
   output \bundled_ch_f[DATA][15] ;
   output \bundled_ch_f[DATA][14] ;
   output \bundled_ch_f[DATA][13] ;
   output \bundled_ch_f[DATA][12] ;
   output \bundled_ch_f[DATA][11] ;
   output \bundled_ch_f[DATA][10] ;
   output \bundled_ch_f[DATA][9] ;
   output \bundled_ch_f[DATA][8] ;
   output \bundled_ch_f[DATA][7] ;
   output \bundled_ch_f[DATA][6] ;
   output \bundled_ch_f[DATA][5] ;
   output \bundled_ch_f[DATA][4] ;
   output \bundled_ch_f[DATA][3] ;
   output \bundled_ch_f[DATA][2] ;
   output \bundled_ch_f[DATA][1] ;
   output \bundled_ch_f[DATA][0] ;
   input \bundled_ch_b[ACK] ;
   input FE_OFN1_preset;
   input FE_OFN997_preset;
   input FE_OFN998_preset;
   input FE_OFN999_preset;

   // Internal wires
   wire FE_PHN1414_north_in_f_67_;
   wire FE_OCPN1069_north_in_f_53_;
   wire FE_OCPN1067_north_in_f_45_;
   wire FE_OCPN1066_north_in_f_44_;
   wire FE_OCPN1065_north_in_f_43_;
   wire FE_OCPN1060_north_in_f_33_;
   wire FE_OCPN633_north_in_f_49_;
   wire FE_OCPN632_north_in_f_48_;
   wire FE_OCPN414_north_in_f_60_;
   wire FE_OCPN413_north_in_f_58_;
   wire FE_OCPN412_north_in_f_57_;
   wire FE_OCPN404_north_in_f_47_;
   wire FE_OCPN403_north_in_f_46_;
   wire FE_OCPN368_north_in_f_63_;
   wire FE_OCPN367_north_in_f_61_;
   wire FE_OCPN366_north_in_f_59_;
   wire FE_OCPN352_north_in_f_41_;
   wire FE_OCPN351_north_in_f_40_;
   wire FE_OCPN350_north_in_f_39_;
   wire FE_OCPN254_north_in_f_50_;
   wire FE_OCPN241_north_in_f_37_;
   wire FE_OCPN93_north_in_f_65_;
   wire FE_OCPN92_north_in_f_64_;
   wire FE_OCPN90_north_in_f_62_;
   wire FE_OCPN79_north_in_f_51_;
   wire FE_OCPN64_north_in_f_36_;
   wire token_phase;
   wire full_phase;
   wire empty_phase;
   wire data_phase;
   wire data_cd_phase;
   wire req_in;
   wire latch_enable;
   wire N3;
   wire N4;
   wire N5;
   wire N6;
   wire N7;
   wire N8;
   wire N9;
   wire N10;
   wire N11;
   wire N12;
   wire N13;
   wire N14;
   wire N15;
   wire N16;
   wire N17;
   wire N18;
   wire N19;
   wire N20;
   wire N21;
   wire N22;
   wire N23;
   wire N24;
   wire N25;
   wire N26;
   wire N27;
   wire N28;
   wire N29;
   wire N30;
   wire N31;
   wire N32;
   wire N33;
   wire N34;
   wire N35;
   wire N36;
   wire n2;
   wire n1;
   wire [32:0] data_cd;

   HS65_LS_BFX7 FE_PHC1414_north_in_f_67_ (.Z(FE_PHN1414_north_in_f_67_), 
	.A(\LEDR_link_f[TOKEN_T] ));
   HS65_LS_BFX7 FE_OCPC1069_north_in_f_53_ (.Z(FE_OCPN1069_north_in_f_53_), 
	.A(\LEDR_link_f[PHIT][20] ));
   HS65_LS_BFX7 FE_OCPC1067_north_in_f_45_ (.Z(FE_OCPN1067_north_in_f_45_), 
	.A(\LEDR_link_f[PHIT][12] ));
   HS65_LS_BFX7 FE_OCPC1066_north_in_f_44_ (.Z(FE_OCPN1066_north_in_f_44_), 
	.A(\LEDR_link_f[PHIT][11] ));
   HS65_LS_BFX7 FE_OCPC1065_north_in_f_43_ (.Z(FE_OCPN1065_north_in_f_43_), 
	.A(\LEDR_link_f[PHIT][10] ));
   HS65_LS_BFX7 FE_OCPC1060_north_in_f_33_ (.Z(FE_OCPN1060_north_in_f_33_), 
	.A(\LEDR_link_f[PHIT][0] ));
   HS65_LS_BFX7 FE_OCPC633_north_in_f_49_ (.Z(FE_OCPN633_north_in_f_49_), 
	.A(\LEDR_link_f[PHIT][16] ));
   HS65_LS_BFX7 FE_OCPC632_north_in_f_48_ (.Z(FE_OCPN632_north_in_f_48_), 
	.A(\LEDR_link_f[PHIT][15] ));
   HS65_LS_BFX7 FE_OCPC414_north_in_f_60_ (.Z(FE_OCPN414_north_in_f_60_), 
	.A(\LEDR_link_f[PHIT][27] ));
   HS65_LS_BFX7 FE_OCPC413_north_in_f_58_ (.Z(FE_OCPN413_north_in_f_58_), 
	.A(\LEDR_link_f[PHIT][25] ));
   HS65_LS_BFX7 FE_OCPC412_north_in_f_57_ (.Z(FE_OCPN412_north_in_f_57_), 
	.A(\LEDR_link_f[PHIT][24] ));
   HS65_LS_BFX7 FE_OCPC404_north_in_f_47_ (.Z(FE_OCPN404_north_in_f_47_), 
	.A(\LEDR_link_f[PHIT][14] ));
   HS65_LS_BFX7 FE_OCPC403_north_in_f_46_ (.Z(FE_OCPN403_north_in_f_46_), 
	.A(\LEDR_link_f[PHIT][13] ));
   HS65_LS_BFX7 FE_OCPC368_north_in_f_63_ (.Z(FE_OCPN368_north_in_f_63_), 
	.A(\LEDR_link_f[PHIT][30] ));
   HS65_LS_BFX7 FE_OCPC367_north_in_f_61_ (.Z(FE_OCPN367_north_in_f_61_), 
	.A(\LEDR_link_f[PHIT][28] ));
   HS65_LS_BFX7 FE_OCPC366_north_in_f_59_ (.Z(FE_OCPN366_north_in_f_59_), 
	.A(\LEDR_link_f[PHIT][26] ));
   HS65_LS_BFX7 FE_OCPC352_north_in_f_41_ (.Z(FE_OCPN352_north_in_f_41_), 
	.A(\LEDR_link_f[PHIT][8] ));
   HS65_LS_BFX7 FE_OCPC351_north_in_f_40_ (.Z(FE_OCPN351_north_in_f_40_), 
	.A(\LEDR_link_f[PHIT][7] ));
   HS65_LS_BFX7 FE_OCPC350_north_in_f_39_ (.Z(FE_OCPN350_north_in_f_39_), 
	.A(\LEDR_link_f[PHIT][6] ));
   HS65_LS_BFX7 FE_OCPC254_north_in_f_50_ (.Z(FE_OCPN254_north_in_f_50_), 
	.A(\LEDR_link_f[PHIT][17] ));
   HS65_LS_BFX7 FE_OCPC241_north_in_f_37_ (.Z(FE_OCPN241_north_in_f_37_), 
	.A(\LEDR_link_f[PHIT][4] ));
   HS65_LS_BFX7 FE_OCPC93_north_in_f_65_ (.Z(FE_OCPN93_north_in_f_65_), 
	.A(\LEDR_link_f[PHIT][32] ));
   HS65_LS_BFX7 FE_OCPC92_north_in_f_64_ (.Z(FE_OCPN92_north_in_f_64_), 
	.A(\LEDR_link_f[PHIT][31] ));
   HS65_LS_BFX7 FE_OCPC90_north_in_f_62_ (.Z(FE_OCPN90_north_in_f_62_), 
	.A(\LEDR_link_f[PHIT][29] ));
   HS65_LS_BFX7 FE_OCPC79_north_in_f_51_ (.Z(FE_OCPN79_north_in_f_51_), 
	.A(\LEDR_link_f[PHIT][18] ));
   HS65_LS_BFX7 FE_OCPC64_north_in_f_36_ (.Z(FE_OCPN64_north_in_f_36_), 
	.A(\LEDR_link_f[PHIT][3] ));
   HS65_LSS_XOR2X23 FE_RC_57_0 (.Z(data_cd[7]), 
	.B(\LEDR_link_f[PHIT][7] ), 
	.A(\LEDR_link_f[PHIT_PARITY][7] ));
   HS65_LSS_XOR2X23 FE_RC_56_0 (.Z(data_cd[9]), 
	.B(\LEDR_link_f[PHIT][9] ), 
	.A(\LEDR_link_f[PHIT_PARITY][9] ));
   HS65_LSS_XOR2X23 FE_RC_55_0 (.Z(data_cd[1]), 
	.B(\LEDR_link_f[PHIT][1] ), 
	.A(\LEDR_link_f[PHIT_PARITY][1] ));
   HS65_LSS_XOR2X23 FE_RC_54_0 (.Z(data_cd[23]), 
	.B(\LEDR_link_f[PHIT][23] ), 
	.A(\LEDR_link_f[PHIT_PARITY][23] ));
   HS65_LSS_XOR2X23 FE_RC_53_0 (.Z(data_cd[30]), 
	.B(\LEDR_link_f[PHIT][30] ), 
	.A(\LEDR_link_f[PHIT_PARITY][30] ));
   HS65_LSS_XOR2X23 FE_RC_52_0 (.Z(data_cd[22]), 
	.B(\LEDR_link_f[PHIT][22] ), 
	.A(\LEDR_link_f[PHIT_PARITY][22] ));
   select_element_0 select_element (.preset(preset), 
	.\input (token_phase), 
	.true(full_phase), 
	.false(empty_phase), 
	.sel(\LEDR_link_f[TOKEN_T] ));
   c_gate_0_0 data_cd_c (.preset(FE_OFN1_preset), 
	.a(full_phase), 
	.b(data_phase), 
	.c(data_cd_phase));
   c_gate_generic_0_33_0 data_ch (.preset(FE_OFN1_preset), 
	.\input ({ data_cd[32],
		data_cd[31],
		data_cd[30],
		data_cd[29],
		data_cd[28],
		data_cd[27],
		data_cd[26],
		data_cd[25],
		data_cd[24],
		data_cd[23],
		data_cd[22],
		data_cd[21],
		data_cd[20],
		data_cd[19],
		data_cd[18],
		data_cd[17],
		data_cd[16],
		data_cd[15],
		data_cd[14],
		data_cd[13],
		data_cd[12],
		data_cd[11],
		data_cd[10],
		data_cd[9],
		data_cd[8],
		data_cd[7],
		data_cd[6],
		data_cd[5],
		data_cd[4],
		data_cd[3],
		data_cd[2],
		data_cd[1],
		data_cd[0] }), 
	.\output (data_phase), 
	.FE_OFN999_preset(FE_OFN999_preset));
   latch_controller_1_0 latch_controller (.preset(FE_OFN1_preset), 
	.Rin(req_in), 
	.Aout(\LEDR_link_b[ACK] ), 
	.Rout(\bundled_ch_f[REQ] ), 
	.Ain(\bundled_ch_b[ACK] ), 
	.lt_en(latch_enable));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][31]  (.Q(\bundled_ch_f[DATA][31] ), 
	.G(N3), 
	.D(N35));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][30]  (.Q(\bundled_ch_f[DATA][30] ), 
	.G(N3), 
	.D(N34));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][29]  (.Q(\bundled_ch_f[DATA][29] ), 
	.G(N3), 
	.D(N33));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][28]  (.Q(\bundled_ch_f[DATA][28] ), 
	.G(N3), 
	.D(N32));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][27]  (.Q(\bundled_ch_f[DATA][27] ), 
	.G(N3), 
	.D(N31));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][26]  (.Q(\bundled_ch_f[DATA][26] ), 
	.G(N3), 
	.D(N30));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][25]  (.Q(\bundled_ch_f[DATA][25] ), 
	.G(N3), 
	.D(N29));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][24]  (.Q(\bundled_ch_f[DATA][24] ), 
	.G(N3), 
	.D(N28));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][23]  (.Q(\bundled_ch_f[DATA][23] ), 
	.G(N3), 
	.D(N27));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][22]  (.Q(\bundled_ch_f[DATA][22] ), 
	.G(N3), 
	.D(N26));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][21]  (.Q(\bundled_ch_f[DATA][21] ), 
	.G(N3), 
	.D(N25));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][20]  (.Q(\bundled_ch_f[DATA][20] ), 
	.G(N3), 
	.D(N24));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][19]  (.Q(\bundled_ch_f[DATA][19] ), 
	.G(N3), 
	.D(N23));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][18]  (.Q(\bundled_ch_f[DATA][18] ), 
	.G(N3), 
	.D(N22));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][17]  (.Q(\bundled_ch_f[DATA][17] ), 
	.G(N3), 
	.D(N21));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][16]  (.Q(\bundled_ch_f[DATA][16] ), 
	.G(N3), 
	.D(N20));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][15]  (.Q(\bundled_ch_f[DATA][15] ), 
	.G(N3), 
	.D(N19));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][14]  (.Q(\bundled_ch_f[DATA][14] ), 
	.G(N3), 
	.D(N18));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][13]  (.Q(\bundled_ch_f[DATA][13] ), 
	.G(N3), 
	.D(N17));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][12]  (.Q(\bundled_ch_f[DATA][12] ), 
	.G(N3), 
	.D(N16));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][11]  (.Q(\bundled_ch_f[DATA][11] ), 
	.G(N3), 
	.D(N15));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][10]  (.Q(\bundled_ch_f[DATA][10] ), 
	.G(N3), 
	.D(N14));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][9]  (.Q(\bundled_ch_f[DATA][9] ), 
	.G(N3), 
	.D(N13));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][8]  (.Q(\bundled_ch_f[DATA][8] ), 
	.G(N3), 
	.D(N12));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][7]  (.Q(\bundled_ch_f[DATA][7] ), 
	.G(N3), 
	.D(N11));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][6]  (.Q(\bundled_ch_f[DATA][6] ), 
	.G(N3), 
	.D(N10));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][5]  (.Q(\bundled_ch_f[DATA][5] ), 
	.G(N3), 
	.D(N9));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][4]  (.Q(\bundled_ch_f[DATA][4] ), 
	.G(N3), 
	.D(N8));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][3]  (.Q(\bundled_ch_f[DATA][3] ), 
	.G(N3), 
	.D(N7));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][2]  (.Q(\bundled_ch_f[DATA][2] ), 
	.G(N3), 
	.D(N6));
   HS65_LS_LDLRQX35 \bundled_ch_f_reg[DATA][33]  (.RN(n1), 
	.Q(\bundled_ch_f[DATA][33] ), 
	.GN(latch_enable), 
	.D(FE_PHN1414_north_in_f_67_));
   HS65_LS_LDHQX18 \bundled_ch_f_reg[DATA][1]  (.Q(\bundled_ch_f[DATA][1] ), 
	.G(N3), 
	.D(N5));
   HS65_LS_LDHQX18 \bundled_ch_f_reg[DATA][0]  (.Q(\bundled_ch_f[DATA][0] ), 
	.G(N3), 
	.D(N4));
   HS65_LS_LDHQX35 \bundled_ch_f_reg[DATA][32]  (.Q(\bundled_ch_f[DATA][32] ), 
	.G(N3), 
	.D(N36));
   HS65_LSS_XOR2X23 U4 (.Z(data_cd[4]), 
	.B(\LEDR_link_f[PHIT][4] ), 
	.A(\LEDR_link_f[PHIT_PARITY][4] ));
   HS65_LSS_XOR2X23 U5 (.Z(data_cd[3]), 
	.B(\LEDR_link_f[PHIT][3] ), 
	.A(\LEDR_link_f[PHIT_PARITY][3] ));
   HS65_LSS_XOR2X23 U6 (.Z(data_cd[8]), 
	.B(\LEDR_link_f[PHIT][8] ), 
	.A(\LEDR_link_f[PHIT_PARITY][8] ));
   HS65_LSS_XOR2X23 U8 (.Z(data_cd[16]), 
	.B(\LEDR_link_f[PHIT][16] ), 
	.A(\LEDR_link_f[PHIT_PARITY][16] ));
   HS65_LSS_XOR2X23 U9 (.Z(data_cd[15]), 
	.B(\LEDR_link_f[PHIT][15] ), 
	.A(\LEDR_link_f[PHIT_PARITY][15] ));
   HS65_LSS_XOR2X23 U10 (.Z(data_cd[25]), 
	.B(\LEDR_link_f[PHIT][25] ), 
	.A(\LEDR_link_f[PHIT_PARITY][25] ));
   HS65_LSS_XOR2X23 U11 (.Z(data_cd[24]), 
	.B(\LEDR_link_f[PHIT][24] ), 
	.A(\LEDR_link_f[PHIT_PARITY][24] ));
   HS65_LSS_XOR2X23 U12 (.Z(data_cd[26]), 
	.B(\LEDR_link_f[PHIT][26] ), 
	.A(\LEDR_link_f[PHIT_PARITY][26] ));
   HS65_LSS_XOR2X23 U13 (.Z(data_cd[12]), 
	.B(\LEDR_link_f[PHIT][12] ), 
	.A(\LEDR_link_f[PHIT_PARITY][12] ));
   HS65_LSS_XOR2X23 U16 (.Z(data_cd[2]), 
	.B(\LEDR_link_f[PHIT][2] ), 
	.A(\LEDR_link_f[PHIT_PARITY][2] ));
   HS65_LSS_XOR2X23 U18 (.Z(data_cd[19]), 
	.B(\LEDR_link_f[PHIT][19] ), 
	.A(\LEDR_link_f[PHIT_PARITY][19] ));
   HS65_LSS_XOR2X23 U20 (.Z(data_cd[11]), 
	.B(\LEDR_link_f[PHIT][11] ), 
	.A(\LEDR_link_f[PHIT_PARITY][11] ));
   HS65_LSS_XOR2X23 U21 (.Z(data_cd[27]), 
	.B(\LEDR_link_f[PHIT][27] ), 
	.A(\LEDR_link_f[PHIT_PARITY][27] ));
   HS65_LSS_XOR2X23 U22 (.Z(data_cd[0]), 
	.B(\LEDR_link_f[PHIT][0] ), 
	.A(\LEDR_link_f[PHIT_PARITY][0] ));
   HS65_LSS_XOR2X23 U23 (.Z(data_cd[10]), 
	.B(\LEDR_link_f[PHIT][10] ), 
	.A(\LEDR_link_f[PHIT_PARITY][10] ));
   HS65_LSS_XOR2X23 U24 (.Z(data_cd[13]), 
	.B(\LEDR_link_f[PHIT][13] ), 
	.A(\LEDR_link_f[PHIT_PARITY][13] ));
   HS65_LSS_XOR2X23 U25 (.Z(data_cd[14]), 
	.B(\LEDR_link_f[PHIT][14] ), 
	.A(\LEDR_link_f[PHIT_PARITY][14] ));
   HS65_LSS_XOR2X23 U26 (.Z(data_cd[17]), 
	.B(\LEDR_link_f[PHIT][17] ), 
	.A(\LEDR_link_f[PHIT_PARITY][17] ));
   HS65_LSS_XOR2X23 U27 (.Z(data_cd[18]), 
	.B(\LEDR_link_f[PHIT][18] ), 
	.A(\LEDR_link_f[PHIT_PARITY][18] ));
   HS65_LSS_XOR2X23 U28 (.Z(data_cd[20]), 
	.B(\LEDR_link_f[PHIT][20] ), 
	.A(\LEDR_link_f[PHIT_PARITY][20] ));
   HS65_LSS_XOR2X23 U29 (.Z(data_cd[21]), 
	.B(\LEDR_link_f[PHIT][21] ), 
	.A(\LEDR_link_f[PHIT_PARITY][21] ));
   HS65_LSS_XOR2X23 U30 (.Z(data_cd[28]), 
	.B(\LEDR_link_f[PHIT][28] ), 
	.A(\LEDR_link_f[PHIT_PARITY][28] ));
   HS65_LSS_XOR2X23 U31 (.Z(data_cd[29]), 
	.B(\LEDR_link_f[PHIT][29] ), 
	.A(\LEDR_link_f[PHIT_PARITY][29] ));
   HS65_LSS_XOR2X23 U32 (.Z(data_cd[31]), 
	.B(\LEDR_link_f[PHIT][31] ), 
	.A(\LEDR_link_f[PHIT_PARITY][31] ));
   HS65_LSS_XOR2X23 U33 (.Z(data_cd[32]), 
	.B(\LEDR_link_f[PHIT][32] ), 
	.A(\LEDR_link_f[PHIT_PARITY][32] ));
   HS65_LSS_XOR2X23 U34 (.Z(data_cd[5]), 
	.B(\LEDR_link_f[PHIT][5] ), 
	.A(\LEDR_link_f[PHIT_PARITY][5] ));
   HS65_LSS_XOR2X23 U35 (.Z(data_cd[6]), 
	.B(\LEDR_link_f[PHIT][6] ), 
	.A(\LEDR_link_f[PHIT_PARITY][6] ));
   HS65_LSS_XNOR2X6 U36 (.Z(token_phase), 
	.B(\LEDR_link_f[TOKEN_PARITY] ), 
	.A(n2));
   HS65_LS_IVX9 U37 (.Z(n1), 
	.A(preset));
   HS65_LS_IVX9 U38 (.Z(n2), 
	.A(\LEDR_link_f[TOKEN_T] ));
   HS65_LS_NOR2AX3 U39 (.Z(N4), 
	.B(FE_OFN998_preset), 
	.A(FE_OCPN1060_north_in_f_33_));
   HS65_LS_NOR2AX3 U40 (.Z(N5), 
	.B(FE_OFN997_preset), 
	.A(\LEDR_link_f[PHIT][1] ));
   HS65_LS_NOR2AX3 U41 (.Z(N6), 
	.B(FE_OFN1_preset), 
	.A(\LEDR_link_f[PHIT][2] ));
   HS65_LS_NOR2AX3 U42 (.Z(N7), 
	.B(FE_OFN997_preset), 
	.A(FE_OCPN64_north_in_f_36_));
   HS65_LS_NOR2AX3 U43 (.Z(N8), 
	.B(FE_OFN1_preset), 
	.A(FE_OCPN241_north_in_f_37_));
   HS65_LS_NOR2AX3 U44 (.Z(N10), 
	.B(FE_OFN1_preset), 
	.A(FE_OCPN350_north_in_f_39_));
   HS65_LS_NOR2AX3 U45 (.Z(N28), 
	.B(FE_OFN1_preset), 
	.A(FE_OCPN412_north_in_f_57_));
   HS65_LS_NOR2AX3 U46 (.Z(N29), 
	.B(FE_OFN1_preset), 
	.A(FE_OCPN413_north_in_f_58_));
   HS65_LS_NOR2AX3 U47 (.Z(N30), 
	.B(FE_OFN1_preset), 
	.A(FE_OCPN366_north_in_f_59_));
   HS65_LS_NOR2AX3 U48 (.Z(N31), 
	.B(FE_OFN1_preset), 
	.A(FE_OCPN414_north_in_f_60_));
   HS65_LS_NOR2AX3 U49 (.Z(N32), 
	.B(FE_OFN1_preset), 
	.A(FE_OCPN367_north_in_f_61_));
   HS65_LS_NOR2AX3 U50 (.Z(N33), 
	.B(preset), 
	.A(FE_OCPN90_north_in_f_62_));
   HS65_LS_NOR2AX3 U51 (.Z(N34), 
	.B(FE_OFN1_preset), 
	.A(FE_OCPN368_north_in_f_63_));
   HS65_LS_NOR2AX3 U52 (.Z(N35), 
	.B(FE_OFN1_preset), 
	.A(FE_OCPN92_north_in_f_64_));
   HS65_LS_NOR2AX3 U53 (.Z(N36), 
	.B(FE_OFN1_preset), 
	.A(FE_OCPN93_north_in_f_65_));
   HS65_LS_NOR2AX3 U54 (.Z(N9), 
	.B(FE_OFN997_preset), 
	.A(\LEDR_link_f[PHIT][5] ));
   HS65_LS_NOR2AX3 U55 (.Z(N11), 
	.B(FE_OFN997_preset), 
	.A(FE_OCPN351_north_in_f_40_));
   HS65_LS_NOR2AX3 U56 (.Z(N12), 
	.B(FE_OFN997_preset), 
	.A(FE_OCPN352_north_in_f_41_));
   HS65_LS_NOR2AX3 U57 (.Z(N13), 
	.B(FE_OFN997_preset), 
	.A(\LEDR_link_f[PHIT][9] ));
   HS65_LS_NOR2AX3 U58 (.Z(N14), 
	.B(FE_OFN998_preset), 
	.A(FE_OCPN1065_north_in_f_43_));
   HS65_LS_NOR2AX3 U59 (.Z(N15), 
	.B(FE_OFN998_preset), 
	.A(FE_OCPN1066_north_in_f_44_));
   HS65_LS_NOR2AX3 U60 (.Z(N16), 
	.B(FE_OFN998_preset), 
	.A(FE_OCPN1067_north_in_f_45_));
   HS65_LS_NOR2AX3 U61 (.Z(N17), 
	.B(FE_OFN998_preset), 
	.A(FE_OCPN403_north_in_f_46_));
   HS65_LS_NOR2AX3 U62 (.Z(N18), 
	.B(FE_OFN998_preset), 
	.A(FE_OCPN404_north_in_f_47_));
   HS65_LS_NOR2AX3 U63 (.Z(N19), 
	.B(FE_OFN999_preset), 
	.A(FE_OCPN632_north_in_f_48_));
   HS65_LS_NOR2AX3 U64 (.Z(N20), 
	.B(FE_OFN999_preset), 
	.A(FE_OCPN633_north_in_f_49_));
   HS65_LS_NOR2AX3 U65 (.Z(N21), 
	.B(FE_OFN998_preset), 
	.A(FE_OCPN254_north_in_f_50_));
   HS65_LS_NOR2AX3 U66 (.Z(N22), 
	.B(FE_OFN998_preset), 
	.A(FE_OCPN79_north_in_f_51_));
   HS65_LS_NOR2AX3 U67 (.Z(N23), 
	.B(FE_OFN998_preset), 
	.A(\LEDR_link_f[PHIT][19] ));
   HS65_LS_NOR2AX3 U68 (.Z(N24), 
	.B(FE_OFN998_preset), 
	.A(FE_OCPN1069_north_in_f_53_));
   HS65_LS_NOR2AX3 U69 (.Z(N25), 
	.B(FE_OFN998_preset), 
	.A(\LEDR_link_f[PHIT][21] ));
   HS65_LS_NOR2AX3 U70 (.Z(N26), 
	.B(FE_OFN998_preset), 
	.A(\LEDR_link_f[PHIT][22] ));
   HS65_LS_NOR2AX3 U71 (.Z(N27), 
	.B(FE_OFN998_preset), 
	.A(\LEDR_link_f[PHIT][23] ));
   HS65_LS_OAI21X3 U72 (.Z(N3), 
	.C(n1), 
	.B(n2), 
	.A(latch_enable));
   HS65_LS_XOR2X18 U73 (.Z(req_in), 
	.B(data_cd_phase), 
	.A(empty_phase));
endmodule

module hpu_comb_0_0 (
	data_valid, 
	data_in, 
	data_out, 
	sel);
   input data_valid;
   input [33:0] data_in;
   output [33:0] data_out;
   output [4:0] sel;

   // Internal wires
   wire FE_OCPUNCON1234_FE_OFN7_n42;
   wire FE_OFN7_n42;
   wire N16;
   wire N17;
   wire N18;
   wire N19;
   wire N20;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n35;
   wire n36;
   wire n37;
   wire n1;
   wire n38;

   assign data_out[33] = data_in[33] ;
   assign data_out[32] = data_in[32] ;

   HS65_LS_BFX142 FE_OCPUNCOC1234_FE_OFN7_n42 (.Z(FE_OCPUNCON1234_FE_OFN7_n42), 
	.A(FE_OFN7_n42));
   HS65_LS_CNIVX55 FE_RC_1171_0 (.Z(FE_OFN7_n42), 
	.A(n35));
   HS65_LS_LDHQX18 \sel_reg[4]  (.Q(sel[4]), 
	.G(N20), 
	.D(N19));
   HS65_LS_LDHQX9 \sel_reg[3]  (.Q(sel[3]), 
	.G(N20), 
	.D(N18));
   HS65_LS_LDHQX9 \sel_reg[2]  (.Q(sel[2]), 
	.G(N20), 
	.D(N17));
   HS65_LS_LDHQX9 \sel_reg[1]  (.Q(sel[1]), 
	.G(N20), 
	.D(N16));
   HS65_LS_LDHQX9 \sel_reg[0]  (.Q(sel[0]), 
	.G(N20), 
	.D(1'b0));
   HS65_LS_CNNOR2AX15 U4 (.Z(n35), 
	.B(data_in[32]), 
	.A(data_in[33]));
   HS65_LS_NAND2X7 U5 (.Z(n37), 
	.B(n36), 
	.A(n38));
   HS65_LS_IVX106 U6 (.Z(n38), 
	.A(FE_OCPUNCON1234_FE_OFN7_n42));
   HS65_LS_IVX9 U7 (.Z(n1), 
	.A(FE_OFN7_n42));
   HS65_LS_NOR2X6 U10 (.Z(N19), 
	.B(n36), 
	.A(FE_OFN7_n42));
   HS65_LS_OAI22X6 U11 (.Z(data_out[6]), 
	.D(n27), 
	.C(n1), 
	.B(n25), 
	.A(FE_OFN7_n42));
   HS65_LS_OAI22X6 U12 (.Z(data_out[7]), 
	.D(n26), 
	.C(n1), 
	.B(FE_OCPUNCON1234_FE_OFN7_n42), 
	.A(n24));
   HS65_LS_OAI22X6 U13 (.Z(data_out[0]), 
	.D(n33), 
	.C(n1), 
	.B(n31), 
	.A(FE_OFN7_n42));
   HS65_LS_OAI22X6 U14 (.Z(data_out[1]), 
	.D(n32), 
	.C(n38), 
	.B(n30), 
	.A(FE_OCPUNCON1234_FE_OFN7_n42));
   HS65_LS_OAI22X6 U15 (.Z(data_out[2]), 
	.D(n31), 
	.C(n1), 
	.B(n29), 
	.A(FE_OFN7_n42));
   HS65_LS_OAI22X6 U16 (.Z(data_out[3]), 
	.D(n30), 
	.C(n1), 
	.B(n28), 
	.A(FE_OCPUNCON1234_FE_OFN7_n42));
   HS65_LS_OAI22X6 U17 (.Z(data_out[4]), 
	.D(n29), 
	.C(n1), 
	.B(n27), 
	.A(FE_OFN7_n42));
   HS65_LS_OAI22X6 U18 (.Z(data_out[5]), 
	.D(n28), 
	.C(n38), 
	.B(n26), 
	.A(FE_OCPUNCON1234_FE_OFN7_n42));
   HS65_LS_OAI22X6 U19 (.Z(data_out[8]), 
	.D(n25), 
	.C(n1), 
	.B(n23), 
	.A(FE_OFN7_n42));
   HS65_LS_OAI22X6 U20 (.Z(data_out[9]), 
	.D(n24), 
	.C(n1), 
	.B(n22), 
	.A(FE_OCPUNCON1234_FE_OFN7_n42));
   HS65_LS_OAI22X6 U21 (.Z(data_out[10]), 
	.D(n23), 
	.C(n1), 
	.B(n21), 
	.A(FE_OCPUNCON1234_FE_OFN7_n42));
   HS65_LS_OAI22X6 U22 (.Z(data_out[11]), 
	.D(n22), 
	.C(n1), 
	.B(n20), 
	.A(FE_OCPUNCON1234_FE_OFN7_n42));
   HS65_LS_OAI22X6 U23 (.Z(data_out[12]), 
	.D(n21), 
	.C(n1), 
	.B(n19), 
	.A(FE_OCPUNCON1234_FE_OFN7_n42));
   HS65_LS_OAI22X6 U24 (.Z(data_out[13]), 
	.D(n20), 
	.C(n1), 
	.B(n18), 
	.A(FE_OCPUNCON1234_FE_OFN7_n42));
   HS65_LS_OAI22X6 U25 (.Z(data_out[14]), 
	.D(n19), 
	.C(n1), 
	.B(n17), 
	.A(FE_OCPUNCON1234_FE_OFN7_n42));
   HS65_LS_OAI22X6 U26 (.Z(data_out[15]), 
	.D(n18), 
	.C(n38), 
	.B(n16), 
	.A(FE_OCPUNCON1234_FE_OFN7_n42));
   HS65_LS_OAI22X6 U27 (.Z(data_out[16]), 
	.D(n17), 
	.C(n38), 
	.B(n15), 
	.A(FE_OCPUNCON1234_FE_OFN7_n42));
   HS65_LS_OAI22X6 U28 (.Z(data_out[17]), 
	.D(n16), 
	.C(n38), 
	.B(n14), 
	.A(FE_OCPUNCON1234_FE_OFN7_n42));
   HS65_LS_OAI22X6 U29 (.Z(data_out[18]), 
	.D(n15), 
	.C(n38), 
	.B(n13), 
	.A(FE_OCPUNCON1234_FE_OFN7_n42));
   HS65_LS_OAI22X6 U30 (.Z(data_out[19]), 
	.D(n14), 
	.C(n38), 
	.B(n12), 
	.A(FE_OCPUNCON1234_FE_OFN7_n42));
   HS65_LS_OAI22X6 U31 (.Z(data_out[20]), 
	.D(n13), 
	.C(n38), 
	.B(n11), 
	.A(FE_OCPUNCON1234_FE_OFN7_n42));
   HS65_LS_OAI22X6 U32 (.Z(data_out[21]), 
	.D(n12), 
	.C(n38), 
	.B(n10), 
	.A(FE_OCPUNCON1234_FE_OFN7_n42));
   HS65_LS_OAI22X6 U33 (.Z(data_out[22]), 
	.D(n11), 
	.C(n38), 
	.B(n9), 
	.A(FE_OCPUNCON1234_FE_OFN7_n42));
   HS65_LS_OAI22X6 U34 (.Z(data_out[23]), 
	.D(n10), 
	.C(n38), 
	.B(n8), 
	.A(FE_OCPUNCON1234_FE_OFN7_n42));
   HS65_LS_OAI22X6 U35 (.Z(data_out[24]), 
	.D(n9), 
	.C(n38), 
	.B(n7), 
	.A(FE_OFN7_n42));
   HS65_LS_OAI22X6 U36 (.Z(data_out[25]), 
	.D(n8), 
	.C(n1), 
	.B(n6), 
	.A(FE_OFN7_n42));
   HS65_LS_OAI22X6 U37 (.Z(data_out[26]), 
	.D(n7), 
	.C(n1), 
	.B(n5), 
	.A(FE_OFN7_n42));
   HS65_LS_OAI22X6 U38 (.Z(data_out[27]), 
	.D(n6), 
	.C(n1), 
	.B(n4), 
	.A(FE_OFN7_n42));
   HS65_LS_OAI22X6 U39 (.Z(data_out[28]), 
	.D(n5), 
	.C(n1), 
	.B(n3), 
	.A(FE_OFN7_n42));
   HS65_LS_OAI22X6 U40 (.Z(data_out[29]), 
	.D(n4), 
	.C(n1), 
	.B(n2), 
	.A(FE_OFN7_n42));
   HS65_LS_NOR3X4 U41 (.Z(N18), 
	.C(n37), 
	.B(n33), 
	.A(n32));
   HS65_LS_NAND2X7 U42 (.Z(n36), 
	.B(n33), 
	.A(n32));
   HS65_LS_NOR2X6 U43 (.Z(data_out[30]), 
	.B(n3), 
	.A(n1));
   HS65_LS_NOR2X6 U44 (.Z(data_out[31]), 
	.B(n2), 
	.A(n1));
   HS65_LS_CNIVX21 U46 (.Z(n32), 
	.A(data_in[1]));
   HS65_LS_CNIVX21 U47 (.Z(n33), 
	.A(data_in[0]));
   HS65_LS_IVX9 U48 (.Z(n24), 
	.A(data_in[9]));
   HS65_LS_IVX9 U49 (.Z(n31), 
	.A(data_in[2]));
   HS65_LS_IVX9 U50 (.Z(n30), 
	.A(data_in[3]));
   HS65_LS_IVX9 U51 (.Z(n29), 
	.A(data_in[4]));
   HS65_LS_IVX9 U52 (.Z(n28), 
	.A(data_in[5]));
   HS65_LS_IVX9 U53 (.Z(n27), 
	.A(data_in[6]));
   HS65_LS_IVX9 U54 (.Z(n26), 
	.A(data_in[7]));
   HS65_LS_IVX9 U55 (.Z(n25), 
	.A(data_in[8]));
   HS65_LS_IVX9 U56 (.Z(n23), 
	.A(data_in[10]));
   HS65_LS_IVX9 U57 (.Z(n22), 
	.A(data_in[11]));
   HS65_LS_IVX9 U58 (.Z(n21), 
	.A(data_in[12]));
   HS65_LS_IVX9 U59 (.Z(n20), 
	.A(data_in[13]));
   HS65_LS_IVX9 U60 (.Z(n19), 
	.A(data_in[14]));
   HS65_LS_IVX9 U61 (.Z(n18), 
	.A(data_in[15]));
   HS65_LS_IVX9 U62 (.Z(n17), 
	.A(data_in[16]));
   HS65_LS_IVX9 U63 (.Z(n16), 
	.A(data_in[17]));
   HS65_LS_IVX9 U64 (.Z(n15), 
	.A(data_in[18]));
   HS65_LS_IVX9 U65 (.Z(n14), 
	.A(data_in[19]));
   HS65_LS_IVX9 U66 (.Z(n13), 
	.A(data_in[20]));
   HS65_LS_IVX9 U67 (.Z(n12), 
	.A(data_in[21]));
   HS65_LS_IVX9 U68 (.Z(n11), 
	.A(data_in[22]));
   HS65_LS_IVX9 U69 (.Z(n10), 
	.A(data_in[23]));
   HS65_LS_IVX9 U70 (.Z(n9), 
	.A(data_in[24]));
   HS65_LS_IVX9 U71 (.Z(n8), 
	.A(data_in[25]));
   HS65_LS_IVX9 U72 (.Z(n7), 
	.A(data_in[26]));
   HS65_LS_IVX9 U73 (.Z(n6), 
	.A(data_in[27]));
   HS65_LS_IVX9 U74 (.Z(n5), 
	.A(data_in[28]));
   HS65_LS_IVX9 U75 (.Z(n4), 
	.A(data_in[29]));
   HS65_LS_IVX9 U77 (.Z(n3), 
	.A(data_in[30]));
   HS65_LS_IVX9 U78 (.Z(n2), 
	.A(data_in[31]));
   HS65_LS_NOR2X3 U79 (.Z(N16), 
	.B(n37), 
	.A(data_in[1]));
   HS65_LS_NOR2X3 U80 (.Z(N17), 
	.B(n37), 
	.A(data_in[0]));
   HS65_LS_NOR2AX6 U81 (.Z(N20), 
	.B(data_in[32]), 
	.A(data_valid));
endmodule

module sr_latch_0_5 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire N1;
   wire n1;

   HS65_LS_AND2X4 C8 (.Z(q), 
	.B(N1), 
	.A(n1));
   HS65_LS_IVX9 U1 (.Z(N1), 
	.A(qn));
   HS65_LS_IVX9 U2 (.Z(n1), 
	.A(r));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_0_5 (
	preset, 
	a, 
	b, 
	c);
   input preset;
   input a;
   input b;
   output c;

   // Internal wires
   wire set;
   wire reset;
   wire n1;

   sr_latch_0_5 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_OAI21X3 U3 (.Z(reset), 
	.C(n1), 
	.B(a), 
	.A(b));
   HS65_LS_IVX9 U4 (.Z(n1), 
	.A(preset));
   HS65_LS_AND3X9 U5 (.Z(set), 
	.C(a), 
	.B(n1), 
	.A(b));
endmodule

module latch_controller_1_5 (
	preset, 
	Rin, 
	Aout, 
	Rout, 
	Ain, 
	lt_en);
   input preset;
   input Rin;
   output Aout;
   output Rout;
   input Ain;
   output lt_en;

   // Internal wires
   wire FE_PHN1425_d;
   wire FE_PHN1395_d;
   wire not_Ain;
   wire d;

   HS65_LH_BFX9 FE_PHC1425_d (.Z(FE_PHN1395_d), 
	.A(FE_PHN1425_d));
   HS65_LH_DLYIC4X9 FE_PHC1395_d (.Z(FE_PHN1425_d), 
	.A(d));
   c_gate_0_5 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Rout));
   HS65_LS_IVX9 I_0 (.Z(not_Ain), 
	.A(Ain));
   HS65_LS_IVX9 I_2 (.Z(d), 
	.A(Rout));
   HS65_LS_IVX9 I_1 (.Z(Aout), 
	.A(FE_PHN1395_d));
   HS65_LSS_XOR2X6 U11 (.Z(lt_en), 
	.B(Ain), 
	.A(Rout));
endmodule

module channel_latch_1_xxxxxxxxx_0 (
	preset, 
	.left_in ( { \left_in[REQ] , 
		\left_in[DATA][33] , 
		\left_in[DATA][32] , 
		\left_in[DATA][31] , 
		\left_in[DATA][30] , 
		\left_in[DATA][29] , 
		\left_in[DATA][28] , 
		\left_in[DATA][27] , 
		\left_in[DATA][26] , 
		\left_in[DATA][25] , 
		\left_in[DATA][24] , 
		\left_in[DATA][23] , 
		\left_in[DATA][22] , 
		\left_in[DATA][21] , 
		\left_in[DATA][20] , 
		\left_in[DATA][19] , 
		\left_in[DATA][18] , 
		\left_in[DATA][17] , 
		\left_in[DATA][16] , 
		\left_in[DATA][15] , 
		\left_in[DATA][14] , 
		\left_in[DATA][13] , 
		\left_in[DATA][12] , 
		\left_in[DATA][11] , 
		\left_in[DATA][10] , 
		\left_in[DATA][9] , 
		\left_in[DATA][8] , 
		\left_in[DATA][7] , 
		\left_in[DATA][6] , 
		\left_in[DATA][5] , 
		\left_in[DATA][4] , 
		\left_in[DATA][3] , 
		\left_in[DATA][2] , 
		\left_in[DATA][1] , 
		\left_in[DATA][0]  } ), 
	.left_out ( \left_out[ACK]  ), 
	.right_out ( { \right_out[REQ] , 
		\right_out[DATA][33] , 
		\right_out[DATA][32] , 
		\right_out[DATA][31] , 
		\right_out[DATA][30] , 
		\right_out[DATA][29] , 
		\right_out[DATA][28] , 
		\right_out[DATA][27] , 
		\right_out[DATA][26] , 
		\right_out[DATA][25] , 
		\right_out[DATA][24] , 
		\right_out[DATA][23] , 
		\right_out[DATA][22] , 
		\right_out[DATA][21] , 
		\right_out[DATA][20] , 
		\right_out[DATA][19] , 
		\right_out[DATA][18] , 
		\right_out[DATA][17] , 
		\right_out[DATA][16] , 
		\right_out[DATA][15] , 
		\right_out[DATA][14] , 
		\right_out[DATA][13] , 
		\right_out[DATA][12] , 
		\right_out[DATA][11] , 
		\right_out[DATA][10] , 
		\right_out[DATA][9] , 
		\right_out[DATA][8] , 
		\right_out[DATA][7] , 
		\right_out[DATA][6] , 
		\right_out[DATA][5] , 
		\right_out[DATA][4] , 
		\right_out[DATA][3] , 
		\right_out[DATA][2] , 
		\right_out[DATA][1] , 
		\right_out[DATA][0]  } ), 
	.right_in ( \right_in[ACK]  ));
   input preset;
   input \left_in[REQ] ;
   input \left_in[DATA][33] ;
   input \left_in[DATA][32] ;
   input \left_in[DATA][31] ;
   input \left_in[DATA][30] ;
   input \left_in[DATA][29] ;
   input \left_in[DATA][28] ;
   input \left_in[DATA][27] ;
   input \left_in[DATA][26] ;
   input \left_in[DATA][25] ;
   input \left_in[DATA][24] ;
   input \left_in[DATA][23] ;
   input \left_in[DATA][22] ;
   input \left_in[DATA][21] ;
   input \left_in[DATA][20] ;
   input \left_in[DATA][19] ;
   input \left_in[DATA][18] ;
   input \left_in[DATA][17] ;
   input \left_in[DATA][16] ;
   input \left_in[DATA][15] ;
   input \left_in[DATA][14] ;
   input \left_in[DATA][13] ;
   input \left_in[DATA][12] ;
   input \left_in[DATA][11] ;
   input \left_in[DATA][10] ;
   input \left_in[DATA][9] ;
   input \left_in[DATA][8] ;
   input \left_in[DATA][7] ;
   input \left_in[DATA][6] ;
   input \left_in[DATA][5] ;
   input \left_in[DATA][4] ;
   input \left_in[DATA][3] ;
   input \left_in[DATA][2] ;
   input \left_in[DATA][1] ;
   input \left_in[DATA][0] ;
   output \left_out[ACK] ;
   output \right_out[REQ] ;
   output \right_out[DATA][33] ;
   output \right_out[DATA][32] ;
   output \right_out[DATA][31] ;
   output \right_out[DATA][30] ;
   output \right_out[DATA][29] ;
   output \right_out[DATA][28] ;
   output \right_out[DATA][27] ;
   output \right_out[DATA][26] ;
   output \right_out[DATA][25] ;
   output \right_out[DATA][24] ;
   output \right_out[DATA][23] ;
   output \right_out[DATA][22] ;
   output \right_out[DATA][21] ;
   output \right_out[DATA][20] ;
   output \right_out[DATA][19] ;
   output \right_out[DATA][18] ;
   output \right_out[DATA][17] ;
   output \right_out[DATA][16] ;
   output \right_out[DATA][15] ;
   output \right_out[DATA][14] ;
   output \right_out[DATA][13] ;
   output \right_out[DATA][12] ;
   output \right_out[DATA][11] ;
   output \right_out[DATA][10] ;
   output \right_out[DATA][9] ;
   output \right_out[DATA][8] ;
   output \right_out[DATA][7] ;
   output \right_out[DATA][6] ;
   output \right_out[DATA][5] ;
   output \right_out[DATA][4] ;
   output \right_out[DATA][3] ;
   output \right_out[DATA][2] ;
   output \right_out[DATA][1] ;
   output \right_out[DATA][0] ;
   input \right_in[ACK] ;

   // Internal wires
   wire lt_en;
   wire N3;

   latch_controller_1_5 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX9 \data_reg[33]  (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(\left_in[DATA][33] ));
   HS65_LS_LDHQX9 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(\left_in[DATA][32] ));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(N3), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(N3), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(N3), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(N3), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(N3), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(N3), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(N3), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(N3), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(N3), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(N3), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(N3), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(N3), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(N3), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(N3), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(N3), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHQX9 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHQX9 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3), 
	.D(\left_in[DATA][0] ));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(\left_in[DATA][9] ));
   HS65_LS_NAND2AX7 U3 (.Z(N3), 
	.B(lt_en), 
	.A(preset));
endmodule

module hpu_0_0 (
	preset, 
	.chan_in_f ( { \chan_in_f[REQ] , 
		\chan_in_f[DATA][33] , 
		\chan_in_f[DATA][32] , 
		\chan_in_f[DATA][31] , 
		\chan_in_f[DATA][30] , 
		\chan_in_f[DATA][29] , 
		\chan_in_f[DATA][28] , 
		\chan_in_f[DATA][27] , 
		\chan_in_f[DATA][26] , 
		\chan_in_f[DATA][25] , 
		\chan_in_f[DATA][24] , 
		\chan_in_f[DATA][23] , 
		\chan_in_f[DATA][22] , 
		\chan_in_f[DATA][21] , 
		\chan_in_f[DATA][20] , 
		\chan_in_f[DATA][19] , 
		\chan_in_f[DATA][18] , 
		\chan_in_f[DATA][17] , 
		\chan_in_f[DATA][16] , 
		\chan_in_f[DATA][15] , 
		\chan_in_f[DATA][14] , 
		\chan_in_f[DATA][13] , 
		\chan_in_f[DATA][12] , 
		\chan_in_f[DATA][11] , 
		\chan_in_f[DATA][10] , 
		\chan_in_f[DATA][9] , 
		\chan_in_f[DATA][8] , 
		\chan_in_f[DATA][7] , 
		\chan_in_f[DATA][6] , 
		\chan_in_f[DATA][5] , 
		\chan_in_f[DATA][4] , 
		\chan_in_f[DATA][3] , 
		\chan_in_f[DATA][2] , 
		\chan_in_f[DATA][1] , 
		\chan_in_f[DATA][0]  } ), 
	.chan_in_b ( \chan_in_b[ACK]  ), 
	.chan_out_f ( { \chan_out_f[REQ] , 
		\chan_out_f[DATA][33] , 
		\chan_out_f[DATA][32] , 
		\chan_out_f[DATA][31] , 
		\chan_out_f[DATA][30] , 
		\chan_out_f[DATA][29] , 
		\chan_out_f[DATA][28] , 
		\chan_out_f[DATA][27] , 
		\chan_out_f[DATA][26] , 
		\chan_out_f[DATA][25] , 
		\chan_out_f[DATA][24] , 
		\chan_out_f[DATA][23] , 
		\chan_out_f[DATA][22] , 
		\chan_out_f[DATA][21] , 
		\chan_out_f[DATA][20] , 
		\chan_out_f[DATA][19] , 
		\chan_out_f[DATA][18] , 
		\chan_out_f[DATA][17] , 
		\chan_out_f[DATA][16] , 
		\chan_out_f[DATA][15] , 
		\chan_out_f[DATA][14] , 
		\chan_out_f[DATA][13] , 
		\chan_out_f[DATA][12] , 
		\chan_out_f[DATA][11] , 
		\chan_out_f[DATA][10] , 
		\chan_out_f[DATA][9] , 
		\chan_out_f[DATA][8] , 
		\chan_out_f[DATA][7] , 
		\chan_out_f[DATA][6] , 
		\chan_out_f[DATA][5] , 
		\chan_out_f[DATA][4] , 
		\chan_out_f[DATA][3] , 
		\chan_out_f[DATA][2] , 
		\chan_out_f[DATA][1] , 
		\chan_out_f[DATA][0]  } ), 
	.chan_out_b ( \chan_out_b[ACK]  ), 
	sel);
   input preset;
   input \chan_in_f[REQ] ;
   input \chan_in_f[DATA][33] ;
   input \chan_in_f[DATA][32] ;
   input \chan_in_f[DATA][31] ;
   input \chan_in_f[DATA][30] ;
   input \chan_in_f[DATA][29] ;
   input \chan_in_f[DATA][28] ;
   input \chan_in_f[DATA][27] ;
   input \chan_in_f[DATA][26] ;
   input \chan_in_f[DATA][25] ;
   input \chan_in_f[DATA][24] ;
   input \chan_in_f[DATA][23] ;
   input \chan_in_f[DATA][22] ;
   input \chan_in_f[DATA][21] ;
   input \chan_in_f[DATA][20] ;
   input \chan_in_f[DATA][19] ;
   input \chan_in_f[DATA][18] ;
   input \chan_in_f[DATA][17] ;
   input \chan_in_f[DATA][16] ;
   input \chan_in_f[DATA][15] ;
   input \chan_in_f[DATA][14] ;
   input \chan_in_f[DATA][13] ;
   input \chan_in_f[DATA][12] ;
   input \chan_in_f[DATA][11] ;
   input \chan_in_f[DATA][10] ;
   input \chan_in_f[DATA][9] ;
   input \chan_in_f[DATA][8] ;
   input \chan_in_f[DATA][7] ;
   input \chan_in_f[DATA][6] ;
   input \chan_in_f[DATA][5] ;
   input \chan_in_f[DATA][4] ;
   input \chan_in_f[DATA][3] ;
   input \chan_in_f[DATA][2] ;
   input \chan_in_f[DATA][1] ;
   input \chan_in_f[DATA][0] ;
   output \chan_in_b[ACK] ;
   output \chan_out_f[REQ] ;
   output \chan_out_f[DATA][33] ;
   output \chan_out_f[DATA][32] ;
   output \chan_out_f[DATA][31] ;
   output \chan_out_f[DATA][30] ;
   output \chan_out_f[DATA][29] ;
   output \chan_out_f[DATA][28] ;
   output \chan_out_f[DATA][27] ;
   output \chan_out_f[DATA][26] ;
   output \chan_out_f[DATA][25] ;
   output \chan_out_f[DATA][24] ;
   output \chan_out_f[DATA][23] ;
   output \chan_out_f[DATA][22] ;
   output \chan_out_f[DATA][21] ;
   output \chan_out_f[DATA][20] ;
   output \chan_out_f[DATA][19] ;
   output \chan_out_f[DATA][18] ;
   output \chan_out_f[DATA][17] ;
   output \chan_out_f[DATA][16] ;
   output \chan_out_f[DATA][15] ;
   output \chan_out_f[DATA][14] ;
   output \chan_out_f[DATA][13] ;
   output \chan_out_f[DATA][12] ;
   output \chan_out_f[DATA][11] ;
   output \chan_out_f[DATA][10] ;
   output \chan_out_f[DATA][9] ;
   output \chan_out_f[DATA][8] ;
   output \chan_out_f[DATA][7] ;
   output \chan_out_f[DATA][6] ;
   output \chan_out_f[DATA][5] ;
   output \chan_out_f[DATA][4] ;
   output \chan_out_f[DATA][3] ;
   output \chan_out_f[DATA][2] ;
   output \chan_out_f[DATA][1] ;
   output \chan_out_f[DATA][0] ;
   input \chan_out_b[ACK] ;
   output [4:0] sel;

   // Internal wires
   wire FE_PHN1473_req_n;
   wire FE_PHN1464_req_n;
   wire FE_PHN1426_req_n;
   wire \chan_internal_f[REQ] ;
   wire \chan_internal_f[DATA][33] ;
   wire \chan_internal_f[DATA][32] ;
   wire \chan_internal_f[DATA][31] ;
   wire \chan_internal_f[DATA][30] ;
   wire \chan_internal_f[DATA][29] ;
   wire \chan_internal_f[DATA][28] ;
   wire \chan_internal_f[DATA][27] ;
   wire \chan_internal_f[DATA][26] ;
   wire \chan_internal_f[DATA][25] ;
   wire \chan_internal_f[DATA][24] ;
   wire \chan_internal_f[DATA][23] ;
   wire \chan_internal_f[DATA][22] ;
   wire \chan_internal_f[DATA][21] ;
   wire \chan_internal_f[DATA][20] ;
   wire \chan_internal_f[DATA][19] ;
   wire \chan_internal_f[DATA][18] ;
   wire \chan_internal_f[DATA][17] ;
   wire \chan_internal_f[DATA][16] ;
   wire \chan_internal_f[DATA][15] ;
   wire \chan_internal_f[DATA][14] ;
   wire \chan_internal_f[DATA][13] ;
   wire \chan_internal_f[DATA][12] ;
   wire \chan_internal_f[DATA][11] ;
   wire \chan_internal_f[DATA][10] ;
   wire \chan_internal_f[DATA][9] ;
   wire \chan_internal_f[DATA][8] ;
   wire \chan_internal_f[DATA][7] ;
   wire \chan_internal_f[DATA][6] ;
   wire \chan_internal_f[DATA][5] ;
   wire \chan_internal_f[DATA][4] ;
   wire \chan_internal_f[DATA][3] ;
   wire \chan_internal_f[DATA][2] ;
   wire \chan_internal_f[DATA][1] ;
   wire \chan_internal_f[DATA][0] ;
   wire data_in_valid;
   wire req_n;

   HS65_LH_BFX7 FE_PHC1473_req_n (.Z(FE_PHN1473_req_n), 
	.A(FE_PHN1426_req_n));
   HS65_LH_BFX9 FE_PHC1464_req_n (.Z(FE_PHN1464_req_n), 
	.A(FE_PHN1473_req_n));
   HS65_LS_BFX7 FE_PHC1426_req_n (.Z(FE_PHN1426_req_n), 
	.A(req_n));
   hpu_comb_0_0 hpu_combinatorial (.data_valid(data_in_valid), 
	.data_in({ \chan_in_f[DATA][33] ,
		\chan_in_f[DATA][32] ,
		\chan_in_f[DATA][31] ,
		\chan_in_f[DATA][30] ,
		\chan_in_f[DATA][29] ,
		\chan_in_f[DATA][28] ,
		\chan_in_f[DATA][27] ,
		\chan_in_f[DATA][26] ,
		\chan_in_f[DATA][25] ,
		\chan_in_f[DATA][24] ,
		\chan_in_f[DATA][23] ,
		\chan_in_f[DATA][22] ,
		\chan_in_f[DATA][21] ,
		\chan_in_f[DATA][20] ,
		\chan_in_f[DATA][19] ,
		\chan_in_f[DATA][18] ,
		\chan_in_f[DATA][17] ,
		\chan_in_f[DATA][16] ,
		\chan_in_f[DATA][15] ,
		\chan_in_f[DATA][14] ,
		\chan_in_f[DATA][13] ,
		\chan_in_f[DATA][12] ,
		\chan_in_f[DATA][11] ,
		\chan_in_f[DATA][10] ,
		\chan_in_f[DATA][9] ,
		\chan_in_f[DATA][8] ,
		\chan_in_f[DATA][7] ,
		\chan_in_f[DATA][6] ,
		\chan_in_f[DATA][5] ,
		\chan_in_f[DATA][4] ,
		\chan_in_f[DATA][3] ,
		\chan_in_f[DATA][2] ,
		\chan_in_f[DATA][1] ,
		\chan_in_f[DATA][0]  }), 
	.data_out({ \chan_internal_f[DATA][33] ,
		\chan_internal_f[DATA][32] ,
		\chan_internal_f[DATA][31] ,
		\chan_internal_f[DATA][30] ,
		\chan_internal_f[DATA][29] ,
		\chan_internal_f[DATA][28] ,
		\chan_internal_f[DATA][27] ,
		\chan_internal_f[DATA][26] ,
		\chan_internal_f[DATA][25] ,
		\chan_internal_f[DATA][24] ,
		\chan_internal_f[DATA][23] ,
		\chan_internal_f[DATA][22] ,
		\chan_internal_f[DATA][21] ,
		\chan_internal_f[DATA][20] ,
		\chan_internal_f[DATA][19] ,
		\chan_internal_f[DATA][18] ,
		\chan_internal_f[DATA][17] ,
		\chan_internal_f[DATA][16] ,
		\chan_internal_f[DATA][15] ,
		\chan_internal_f[DATA][14] ,
		\chan_internal_f[DATA][13] ,
		\chan_internal_f[DATA][12] ,
		\chan_internal_f[DATA][11] ,
		\chan_internal_f[DATA][10] ,
		\chan_internal_f[DATA][9] ,
		\chan_internal_f[DATA][8] ,
		\chan_internal_f[DATA][7] ,
		\chan_internal_f[DATA][6] ,
		\chan_internal_f[DATA][5] ,
		\chan_internal_f[DATA][4] ,
		\chan_internal_f[DATA][3] ,
		\chan_internal_f[DATA][2] ,
		\chan_internal_f[DATA][1] ,
		\chan_internal_f[DATA][0]  }), 
	.sel({ sel[4],
		sel[3],
		sel[2],
		sel[1],
		sel[0] }));
   channel_latch_1_xxxxxxxxx_0 token_latch (.preset(preset), 
	.left_in({ \chan_internal_f[REQ] ,
		\chan_internal_f[DATA][33] ,
		\chan_internal_f[DATA][32] ,
		\chan_internal_f[DATA][31] ,
		\chan_internal_f[DATA][30] ,
		\chan_internal_f[DATA][29] ,
		\chan_internal_f[DATA][28] ,
		\chan_internal_f[DATA][27] ,
		\chan_internal_f[DATA][26] ,
		\chan_internal_f[DATA][25] ,
		\chan_internal_f[DATA][24] ,
		\chan_internal_f[DATA][23] ,
		\chan_internal_f[DATA][22] ,
		\chan_internal_f[DATA][21] ,
		\chan_internal_f[DATA][20] ,
		\chan_internal_f[DATA][19] ,
		\chan_internal_f[DATA][18] ,
		\chan_internal_f[DATA][17] ,
		\chan_internal_f[DATA][16] ,
		\chan_internal_f[DATA][15] ,
		\chan_internal_f[DATA][14] ,
		\chan_internal_f[DATA][13] ,
		\chan_internal_f[DATA][12] ,
		\chan_internal_f[DATA][11] ,
		\chan_internal_f[DATA][10] ,
		\chan_internal_f[DATA][9] ,
		\chan_internal_f[DATA][8] ,
		\chan_internal_f[DATA][7] ,
		\chan_internal_f[DATA][6] ,
		\chan_internal_f[DATA][5] ,
		\chan_internal_f[DATA][4] ,
		\chan_internal_f[DATA][3] ,
		\chan_internal_f[DATA][2] ,
		\chan_internal_f[DATA][1] ,
		\chan_internal_f[DATA][0]  }), 
	.left_out(\chan_in_b[ACK] ), 
	.right_out({ \chan_out_f[REQ] ,
		\chan_out_f[DATA][33] ,
		\chan_out_f[DATA][32] ,
		\chan_out_f[DATA][31] ,
		\chan_out_f[DATA][30] ,
		\chan_out_f[DATA][29] ,
		\chan_out_f[DATA][28] ,
		\chan_out_f[DATA][27] ,
		\chan_out_f[DATA][26] ,
		\chan_out_f[DATA][25] ,
		\chan_out_f[DATA][24] ,
		\chan_out_f[DATA][23] ,
		\chan_out_f[DATA][22] ,
		\chan_out_f[DATA][21] ,
		\chan_out_f[DATA][20] ,
		\chan_out_f[DATA][19] ,
		\chan_out_f[DATA][18] ,
		\chan_out_f[DATA][17] ,
		\chan_out_f[DATA][16] ,
		\chan_out_f[DATA][15] ,
		\chan_out_f[DATA][14] ,
		\chan_out_f[DATA][13] ,
		\chan_out_f[DATA][12] ,
		\chan_out_f[DATA][11] ,
		\chan_out_f[DATA][10] ,
		\chan_out_f[DATA][9] ,
		\chan_out_f[DATA][8] ,
		\chan_out_f[DATA][7] ,
		\chan_out_f[DATA][6] ,
		\chan_out_f[DATA][5] ,
		\chan_out_f[DATA][4] ,
		\chan_out_f[DATA][3] ,
		\chan_out_f[DATA][2] ,
		\chan_out_f[DATA][1] ,
		\chan_out_f[DATA][0]  }), 
	.right_in(\chan_out_b[ACK] ));
   HS65_LS_IVX9 I_1 (.Z(\chan_internal_f[REQ] ), 
	.A(FE_PHN1464_req_n));
   HS65_LH_IVX2 I_0 (.Z(req_n), 
	.A(\chan_in_f[REQ] ));
   HS65_LSS_XOR2X6 U7 (.Z(data_in_valid), 
	.B(\chan_in_b[ACK] ), 
	.A(\chan_internal_f[REQ] ));
endmodule

module hpu_comb_0_2 (
	data_valid, 
	data_in, 
	data_out, 
	sel);
   input data_valid;
   input [33:0] data_in;
   output [33:0] data_out;
   output [4:0] sel;

   // Internal wires
   wire FE_OFN1018_n19;
   wire FE_OFN4_n19;
   wire N18;
   wire N19;
   wire N21;
   wire N22;
   wire N23;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;

   assign data_out[33] = data_in[33] ;
   assign data_out[32] = data_in[32] ;

   HS65_LS_BFX71 FE_OFC1018_n19 (.Z(FE_OFN1018_n19), 
	.A(FE_OFN4_n19));
   HS65_LS_BFX71 FE_OFC4_n19 (.Z(FE_OFN4_n19), 
	.A(n19));
   HS65_LS_LDHQX18 \sel_reg[4]  (.Q(sel[4]), 
	.G(N23), 
	.D(N22));
   HS65_LS_LDHQX9 \sel_reg[3]  (.Q(sel[3]), 
	.G(N23), 
	.D(N21));
   HS65_LS_LDHQX9 \sel_reg[2]  (.Q(sel[2]), 
	.G(N23), 
	.D(1'b0));
   HS65_LS_LDHQX9 \sel_reg[1]  (.Q(sel[1]), 
	.G(N23), 
	.D(N19));
   HS65_LS_LDHQX9 \sel_reg[0]  (.Q(sel[0]), 
	.G(N23), 
	.D(N18));
   HS65_LS_AO22X4 U4 (.Z(data_out[5]), 
	.D(data_in[5]), 
	.C(n24), 
	.B(data_in[7]), 
	.A(FE_OFN4_n19));
   HS65_LS_AO22X4 U5 (.Z(data_out[11]), 
	.D(data_in[11]), 
	.C(n24), 
	.B(data_in[13]), 
	.A(FE_OFN4_n19));
   HS65_LS_AO22X4 U6 (.Z(data_out[29]), 
	.D(data_in[29]), 
	.C(n23), 
	.B(data_in[31]), 
	.A(FE_OFN1018_n19));
   HS65_LS_CNIVX41 U8 (.Z(n24), 
	.A(FE_OFN1018_n19));
   HS65_LS_IVX9 U9 (.Z(n23), 
	.A(FE_OFN1018_n19));
   HS65_LS_OAI22X6 U10 (.Z(data_out[0]), 
	.D(n17), 
	.C(FE_OFN4_n19), 
	.B(n16), 
	.A(n24));
   HS65_LS_OAI22X6 U11 (.Z(data_out[2]), 
	.D(n16), 
	.C(FE_OFN4_n19), 
	.B(n15), 
	.A(n23));
   HS65_LS_OAI22X6 U12 (.Z(data_out[4]), 
	.D(n15), 
	.C(FE_OFN4_n19), 
	.B(n14), 
	.A(n23));
   HS65_LS_OAI22X6 U13 (.Z(data_out[6]), 
	.D(n14), 
	.C(FE_OFN4_n19), 
	.B(n13), 
	.A(n23));
   HS65_LS_OAI22X6 U14 (.Z(data_out[8]), 
	.D(n13), 
	.C(FE_OFN4_n19), 
	.B(n12), 
	.A(n23));
   HS65_LS_OAI22X6 U15 (.Z(data_out[10]), 
	.D(n12), 
	.C(FE_OFN4_n19), 
	.B(n11), 
	.A(n24));
   HS65_LS_OAI22X6 U16 (.Z(data_out[12]), 
	.D(n11), 
	.C(FE_OFN4_n19), 
	.B(n10), 
	.A(n24));
   HS65_LS_OAI22X6 U17 (.Z(data_out[14]), 
	.D(n10), 
	.C(FE_OFN1018_n19), 
	.B(n9), 
	.A(n23));
   HS65_LS_OAI22X6 U18 (.Z(data_out[16]), 
	.D(n9), 
	.C(FE_OFN1018_n19), 
	.B(n8), 
	.A(n23));
   HS65_LS_OAI22X6 U19 (.Z(data_out[18]), 
	.D(n8), 
	.C(FE_OFN1018_n19), 
	.B(n7), 
	.A(n23));
   HS65_LS_OAI22X6 U20 (.Z(data_out[20]), 
	.D(n7), 
	.C(FE_OFN1018_n19), 
	.B(n6), 
	.A(n23));
   HS65_LS_OAI22X6 U21 (.Z(data_out[22]), 
	.D(n6), 
	.C(FE_OFN1018_n19), 
	.B(n5), 
	.A(n23));
   HS65_LS_OAI22X6 U22 (.Z(data_out[24]), 
	.D(n5), 
	.C(FE_OFN1018_n19), 
	.B(n4), 
	.A(n23));
   HS65_LS_OAI22X6 U23 (.Z(data_out[26]), 
	.D(n4), 
	.C(FE_OFN1018_n19), 
	.B(n3), 
	.A(n23));
   HS65_LS_OAI22X6 U24 (.Z(data_out[28]), 
	.D(n3), 
	.C(FE_OFN1018_n19), 
	.B(n2), 
	.A(n23));
   HS65_LS_NAND2X7 U25 (.Z(n21), 
	.B(n20), 
	.A(FE_OFN4_n19));
   HS65_LS_NOR3X4 U26 (.Z(N21), 
	.C(n22), 
	.B(n17), 
	.A(n21));
   HS65_LS_NOR2AX3 U28 (.Z(N19), 
	.B(n21), 
	.A(n22));
   HS65_LS_NOR2X6 U29 (.Z(N22), 
	.B(n20), 
	.A(n24));
   HS65_LS_NOR2X6 U31 (.Z(data_out[30]), 
	.B(n2), 
	.A(FE_OFN1018_n19));
   HS65_LS_IVX9 U32 (.Z(n17), 
	.A(data_in[0]));
   HS65_LS_NAND2X7 U33 (.Z(n20), 
	.B(n17), 
	.A(data_in[1]));
   HS65_LS_NOR2X6 U34 (.Z(n22), 
	.B(data_in[1]), 
	.A(n17));
   HS65_LS_IVX9 U35 (.Z(n16), 
	.A(data_in[2]));
   HS65_LS_IVX9 U36 (.Z(n15), 
	.A(data_in[4]));
   HS65_LS_IVX9 U37 (.Z(n14), 
	.A(data_in[6]));
   HS65_LS_IVX9 U38 (.Z(n13), 
	.A(data_in[8]));
   HS65_LS_IVX9 U39 (.Z(n12), 
	.A(data_in[10]));
   HS65_LS_IVX9 U40 (.Z(n11), 
	.A(data_in[12]));
   HS65_LS_IVX9 U41 (.Z(n10), 
	.A(data_in[14]));
   HS65_LS_IVX9 U42 (.Z(n9), 
	.A(data_in[16]));
   HS65_LS_IVX9 U43 (.Z(n8), 
	.A(data_in[18]));
   HS65_LS_IVX9 U44 (.Z(n7), 
	.A(data_in[20]));
   HS65_LS_IVX9 U45 (.Z(n6), 
	.A(data_in[22]));
   HS65_LS_IVX9 U46 (.Z(n5), 
	.A(data_in[24]));
   HS65_LS_IVX9 U47 (.Z(n4), 
	.A(data_in[26]));
   HS65_LS_IVX9 U48 (.Z(n3), 
	.A(data_in[28]));
   HS65_LS_IVX9 U49 (.Z(n2), 
	.A(data_in[30]));
   HS65_LS_NOR2AX19 U50 (.Z(n19), 
	.B(data_in[32]), 
	.A(data_in[33]));
   HS65_LS_NOR2X3 U51 (.Z(N18), 
	.B(n21), 
	.A(data_in[0]));
   HS65_LS_AO22X9 U52 (.Z(data_out[1]), 
	.D(data_in[1]), 
	.C(n24), 
	.B(data_in[3]), 
	.A(FE_OFN4_n19));
   HS65_LS_AO22X9 U53 (.Z(data_out[3]), 
	.D(data_in[3]), 
	.C(n24), 
	.B(data_in[5]), 
	.A(FE_OFN4_n19));
   HS65_LS_AO22X9 U54 (.Z(data_out[9]), 
	.D(data_in[9]), 
	.C(n24), 
	.B(data_in[11]), 
	.A(FE_OFN4_n19));
   HS65_LS_AO22X9 U55 (.Z(data_out[13]), 
	.D(data_in[13]), 
	.C(n24), 
	.B(data_in[15]), 
	.A(FE_OFN1018_n19));
   HS65_LS_AO22X9 U56 (.Z(data_out[15]), 
	.D(data_in[15]), 
	.C(n24), 
	.B(data_in[17]), 
	.A(FE_OFN1018_n19));
   HS65_LS_AO22X9 U57 (.Z(data_out[17]), 
	.D(data_in[17]), 
	.C(n24), 
	.B(data_in[19]), 
	.A(FE_OFN1018_n19));
   HS65_LS_AO22X9 U58 (.Z(data_out[19]), 
	.D(data_in[19]), 
	.C(n24), 
	.B(data_in[21]), 
	.A(FE_OFN1018_n19));
   HS65_LS_AO22X9 U59 (.Z(data_out[21]), 
	.D(data_in[21]), 
	.C(n24), 
	.B(data_in[23]), 
	.A(FE_OFN1018_n19));
   HS65_LS_AO22X9 U60 (.Z(data_out[23]), 
	.D(data_in[23]), 
	.C(n24), 
	.B(data_in[25]), 
	.A(FE_OFN1018_n19));
   HS65_LS_AO22X9 U62 (.Z(data_out[25]), 
	.D(data_in[25]), 
	.C(n24), 
	.B(data_in[27]), 
	.A(FE_OFN1018_n19));
   HS65_LS_AO22X9 U63 (.Z(data_out[27]), 
	.D(data_in[27]), 
	.C(n24), 
	.B(data_in[29]), 
	.A(FE_OFN1018_n19));
   HS65_LS_AO22X9 U64 (.Z(data_out[7]), 
	.D(data_in[7]), 
	.C(n23), 
	.B(FE_OFN4_n19), 
	.A(data_in[9]));
   HS65_LS_AND2X4 U65 (.Z(data_out[31]), 
	.B(n23), 
	.A(data_in[31]));
   HS65_LS_NOR2AX3 U66 (.Z(N23), 
	.B(data_in[32]), 
	.A(data_valid));
endmodule

module sr_latch_0_4 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire N1;
   wire n1;

   HS65_LS_AND2X4 C8 (.Z(q), 
	.B(N1), 
	.A(n1));
   HS65_LS_IVX9 U1 (.Z(N1), 
	.A(qn));
   HS65_LS_IVX9 U2 (.Z(n1), 
	.A(r));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_0_4 (
	preset, 
	a, 
	b, 
	c);
   input preset;
   input a;
   input b;
   output c;

   // Internal wires
   wire set;
   wire reset;
   wire n1;

   sr_latch_0_4 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_OAI21X3 U3 (.Z(reset), 
	.C(n1), 
	.B(a), 
	.A(b));
   HS65_LS_IVX9 U4 (.Z(n1), 
	.A(preset));
   HS65_LS_AND3X9 U5 (.Z(set), 
	.C(a), 
	.B(n1), 
	.A(b));
endmodule

module latch_controller_1_4 (
	preset, 
	Rin, 
	Aout, 
	Rout, 
	Ain, 
	lt_en);
   input preset;
   input Rin;
   output Aout;
   output Rout;
   input Ain;
   output lt_en;

   // Internal wires
   wire FE_PHN1440_d;
   wire FE_PHN1433_d;
   wire not_Ain;
   wire d;

   HS65_LH_BFX7 FE_PHC1440_d (.Z(FE_PHN1433_d), 
	.A(FE_PHN1440_d));
   HS65_LH_DLYIC4X9 FE_PHC1433_d (.Z(FE_PHN1440_d), 
	.A(d));
   c_gate_0_4 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Rout));
   HS65_LS_IVX9 I_0 (.Z(not_Ain), 
	.A(Ain));
   HS65_LS_IVX9 I_2 (.Z(d), 
	.A(Rout));
   HS65_LS_IVX9 I_1 (.Z(Aout), 
	.A(FE_PHN1433_d));
   HS65_LSS_XOR2X6 U11 (.Z(lt_en), 
	.B(Ain), 
	.A(Rout));
endmodule

module channel_latch_1_xxxxxxxxx_4 (
	preset, 
	.left_in ( { \left_in[REQ] , 
		\left_in[DATA][33] , 
		\left_in[DATA][32] , 
		\left_in[DATA][31] , 
		\left_in[DATA][30] , 
		\left_in[DATA][29] , 
		\left_in[DATA][28] , 
		\left_in[DATA][27] , 
		\left_in[DATA][26] , 
		\left_in[DATA][25] , 
		\left_in[DATA][24] , 
		\left_in[DATA][23] , 
		\left_in[DATA][22] , 
		\left_in[DATA][21] , 
		\left_in[DATA][20] , 
		\left_in[DATA][19] , 
		\left_in[DATA][18] , 
		\left_in[DATA][17] , 
		\left_in[DATA][16] , 
		\left_in[DATA][15] , 
		\left_in[DATA][14] , 
		\left_in[DATA][13] , 
		\left_in[DATA][12] , 
		\left_in[DATA][11] , 
		\left_in[DATA][10] , 
		\left_in[DATA][9] , 
		\left_in[DATA][8] , 
		\left_in[DATA][7] , 
		\left_in[DATA][6] , 
		\left_in[DATA][5] , 
		\left_in[DATA][4] , 
		\left_in[DATA][3] , 
		\left_in[DATA][2] , 
		\left_in[DATA][1] , 
		\left_in[DATA][0]  } ), 
	.left_out ( \left_out[ACK]  ), 
	.right_out ( { \right_out[REQ] , 
		\right_out[DATA][33] , 
		\right_out[DATA][32] , 
		\right_out[DATA][31] , 
		\right_out[DATA][30] , 
		\right_out[DATA][29] , 
		\right_out[DATA][28] , 
		\right_out[DATA][27] , 
		\right_out[DATA][26] , 
		\right_out[DATA][25] , 
		\right_out[DATA][24] , 
		\right_out[DATA][23] , 
		\right_out[DATA][22] , 
		\right_out[DATA][21] , 
		\right_out[DATA][20] , 
		\right_out[DATA][19] , 
		\right_out[DATA][18] , 
		\right_out[DATA][17] , 
		\right_out[DATA][16] , 
		\right_out[DATA][15] , 
		\right_out[DATA][14] , 
		\right_out[DATA][13] , 
		\right_out[DATA][12] , 
		\right_out[DATA][11] , 
		\right_out[DATA][10] , 
		\right_out[DATA][9] , 
		\right_out[DATA][8] , 
		\right_out[DATA][7] , 
		\right_out[DATA][6] , 
		\right_out[DATA][5] , 
		\right_out[DATA][4] , 
		\right_out[DATA][3] , 
		\right_out[DATA][2] , 
		\right_out[DATA][1] , 
		\right_out[DATA][0]  } ), 
	.right_in ( \right_in[ACK]  ), 
	FE_OFN0_preset);
   input preset;
   input \left_in[REQ] ;
   input \left_in[DATA][33] ;
   input \left_in[DATA][32] ;
   input \left_in[DATA][31] ;
   input \left_in[DATA][30] ;
   input \left_in[DATA][29] ;
   input \left_in[DATA][28] ;
   input \left_in[DATA][27] ;
   input \left_in[DATA][26] ;
   input \left_in[DATA][25] ;
   input \left_in[DATA][24] ;
   input \left_in[DATA][23] ;
   input \left_in[DATA][22] ;
   input \left_in[DATA][21] ;
   input \left_in[DATA][20] ;
   input \left_in[DATA][19] ;
   input \left_in[DATA][18] ;
   input \left_in[DATA][17] ;
   input \left_in[DATA][16] ;
   input \left_in[DATA][15] ;
   input \left_in[DATA][14] ;
   input \left_in[DATA][13] ;
   input \left_in[DATA][12] ;
   input \left_in[DATA][11] ;
   input \left_in[DATA][10] ;
   input \left_in[DATA][9] ;
   input \left_in[DATA][8] ;
   input \left_in[DATA][7] ;
   input \left_in[DATA][6] ;
   input \left_in[DATA][5] ;
   input \left_in[DATA][4] ;
   input \left_in[DATA][3] ;
   input \left_in[DATA][2] ;
   input \left_in[DATA][1] ;
   input \left_in[DATA][0] ;
   output \left_out[ACK] ;
   output \right_out[REQ] ;
   output \right_out[DATA][33] ;
   output \right_out[DATA][32] ;
   output \right_out[DATA][31] ;
   output \right_out[DATA][30] ;
   output \right_out[DATA][29] ;
   output \right_out[DATA][28] ;
   output \right_out[DATA][27] ;
   output \right_out[DATA][26] ;
   output \right_out[DATA][25] ;
   output \right_out[DATA][24] ;
   output \right_out[DATA][23] ;
   output \right_out[DATA][22] ;
   output \right_out[DATA][21] ;
   output \right_out[DATA][20] ;
   output \right_out[DATA][19] ;
   output \right_out[DATA][18] ;
   output \right_out[DATA][17] ;
   output \right_out[DATA][16] ;
   output \right_out[DATA][15] ;
   output \right_out[DATA][14] ;
   output \right_out[DATA][13] ;
   output \right_out[DATA][12] ;
   output \right_out[DATA][11] ;
   output \right_out[DATA][10] ;
   output \right_out[DATA][9] ;
   output \right_out[DATA][8] ;
   output \right_out[DATA][7] ;
   output \right_out[DATA][6] ;
   output \right_out[DATA][5] ;
   output \right_out[DATA][4] ;
   output \right_out[DATA][3] ;
   output \right_out[DATA][2] ;
   output \right_out[DATA][1] ;
   output \right_out[DATA][0] ;
   input \right_in[ACK] ;
   input FE_OFN0_preset;

   // Internal wires
   wire lt_en;
   wire N3;

   latch_controller_1_4 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHQX9 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(\left_in[DATA][32] ));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(N3), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(N3), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(N3), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(N3), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(N3), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(N3), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(N3), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(N3), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(N3), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(N3), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(N3), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(N3), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(N3), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(N3), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(N3), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHQX9 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHQX9 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3), 
	.D(\left_in[DATA][0] ));
   HS65_LS_LDHQX4 \data_reg[33]  (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(\left_in[DATA][33] ));
   HS65_LS_NAND2AX7 U3 (.Z(N3), 
	.B(lt_en), 
	.A(FE_OFN0_preset));
endmodule

module hpu_0_2 (
	preset, 
	.chan_in_f ( { \chan_in_f[REQ] , 
		\chan_in_f[DATA][33] , 
		\chan_in_f[DATA][32] , 
		\chan_in_f[DATA][31] , 
		\chan_in_f[DATA][30] , 
		\chan_in_f[DATA][29] , 
		\chan_in_f[DATA][28] , 
		\chan_in_f[DATA][27] , 
		\chan_in_f[DATA][26] , 
		\chan_in_f[DATA][25] , 
		\chan_in_f[DATA][24] , 
		\chan_in_f[DATA][23] , 
		\chan_in_f[DATA][22] , 
		\chan_in_f[DATA][21] , 
		\chan_in_f[DATA][20] , 
		\chan_in_f[DATA][19] , 
		\chan_in_f[DATA][18] , 
		\chan_in_f[DATA][17] , 
		\chan_in_f[DATA][16] , 
		\chan_in_f[DATA][15] , 
		\chan_in_f[DATA][14] , 
		\chan_in_f[DATA][13] , 
		\chan_in_f[DATA][12] , 
		\chan_in_f[DATA][11] , 
		\chan_in_f[DATA][10] , 
		\chan_in_f[DATA][9] , 
		\chan_in_f[DATA][8] , 
		\chan_in_f[DATA][7] , 
		\chan_in_f[DATA][6] , 
		\chan_in_f[DATA][5] , 
		\chan_in_f[DATA][4] , 
		\chan_in_f[DATA][3] , 
		\chan_in_f[DATA][2] , 
		\chan_in_f[DATA][1] , 
		\chan_in_f[DATA][0]  } ), 
	.chan_in_b ( \chan_in_b[ACK]  ), 
	.chan_out_f ( { \chan_out_f[REQ] , 
		\chan_out_f[DATA][33] , 
		\chan_out_f[DATA][32] , 
		\chan_out_f[DATA][31] , 
		\chan_out_f[DATA][30] , 
		\chan_out_f[DATA][29] , 
		\chan_out_f[DATA][28] , 
		\chan_out_f[DATA][27] , 
		\chan_out_f[DATA][26] , 
		\chan_out_f[DATA][25] , 
		\chan_out_f[DATA][24] , 
		\chan_out_f[DATA][23] , 
		\chan_out_f[DATA][22] , 
		\chan_out_f[DATA][21] , 
		\chan_out_f[DATA][20] , 
		\chan_out_f[DATA][19] , 
		\chan_out_f[DATA][18] , 
		\chan_out_f[DATA][17] , 
		\chan_out_f[DATA][16] , 
		\chan_out_f[DATA][15] , 
		\chan_out_f[DATA][14] , 
		\chan_out_f[DATA][13] , 
		\chan_out_f[DATA][12] , 
		\chan_out_f[DATA][11] , 
		\chan_out_f[DATA][10] , 
		\chan_out_f[DATA][9] , 
		\chan_out_f[DATA][8] , 
		\chan_out_f[DATA][7] , 
		\chan_out_f[DATA][6] , 
		\chan_out_f[DATA][5] , 
		\chan_out_f[DATA][4] , 
		\chan_out_f[DATA][3] , 
		\chan_out_f[DATA][2] , 
		\chan_out_f[DATA][1] , 
		\chan_out_f[DATA][0]  } ), 
	.chan_out_b ( \chan_out_b[ACK]  ), 
	sel, 
	FE_OFN0_preset);
   input preset;
   input \chan_in_f[REQ] ;
   input \chan_in_f[DATA][33] ;
   input \chan_in_f[DATA][32] ;
   input \chan_in_f[DATA][31] ;
   input \chan_in_f[DATA][30] ;
   input \chan_in_f[DATA][29] ;
   input \chan_in_f[DATA][28] ;
   input \chan_in_f[DATA][27] ;
   input \chan_in_f[DATA][26] ;
   input \chan_in_f[DATA][25] ;
   input \chan_in_f[DATA][24] ;
   input \chan_in_f[DATA][23] ;
   input \chan_in_f[DATA][22] ;
   input \chan_in_f[DATA][21] ;
   input \chan_in_f[DATA][20] ;
   input \chan_in_f[DATA][19] ;
   input \chan_in_f[DATA][18] ;
   input \chan_in_f[DATA][17] ;
   input \chan_in_f[DATA][16] ;
   input \chan_in_f[DATA][15] ;
   input \chan_in_f[DATA][14] ;
   input \chan_in_f[DATA][13] ;
   input \chan_in_f[DATA][12] ;
   input \chan_in_f[DATA][11] ;
   input \chan_in_f[DATA][10] ;
   input \chan_in_f[DATA][9] ;
   input \chan_in_f[DATA][8] ;
   input \chan_in_f[DATA][7] ;
   input \chan_in_f[DATA][6] ;
   input \chan_in_f[DATA][5] ;
   input \chan_in_f[DATA][4] ;
   input \chan_in_f[DATA][3] ;
   input \chan_in_f[DATA][2] ;
   input \chan_in_f[DATA][1] ;
   input \chan_in_f[DATA][0] ;
   output \chan_in_b[ACK] ;
   output \chan_out_f[REQ] ;
   output \chan_out_f[DATA][33] ;
   output \chan_out_f[DATA][32] ;
   output \chan_out_f[DATA][31] ;
   output \chan_out_f[DATA][30] ;
   output \chan_out_f[DATA][29] ;
   output \chan_out_f[DATA][28] ;
   output \chan_out_f[DATA][27] ;
   output \chan_out_f[DATA][26] ;
   output \chan_out_f[DATA][25] ;
   output \chan_out_f[DATA][24] ;
   output \chan_out_f[DATA][23] ;
   output \chan_out_f[DATA][22] ;
   output \chan_out_f[DATA][21] ;
   output \chan_out_f[DATA][20] ;
   output \chan_out_f[DATA][19] ;
   output \chan_out_f[DATA][18] ;
   output \chan_out_f[DATA][17] ;
   output \chan_out_f[DATA][16] ;
   output \chan_out_f[DATA][15] ;
   output \chan_out_f[DATA][14] ;
   output \chan_out_f[DATA][13] ;
   output \chan_out_f[DATA][12] ;
   output \chan_out_f[DATA][11] ;
   output \chan_out_f[DATA][10] ;
   output \chan_out_f[DATA][9] ;
   output \chan_out_f[DATA][8] ;
   output \chan_out_f[DATA][7] ;
   output \chan_out_f[DATA][6] ;
   output \chan_out_f[DATA][5] ;
   output \chan_out_f[DATA][4] ;
   output \chan_out_f[DATA][3] ;
   output \chan_out_f[DATA][2] ;
   output \chan_out_f[DATA][1] ;
   output \chan_out_f[DATA][0] ;
   input \chan_out_b[ACK] ;
   output [4:0] sel;
   input FE_OFN0_preset;

   // Internal wires
   wire FE_PHN1462_req_n;
   wire FE_PHN1418_req_n;
   wire \chan_internal_f[REQ] ;
   wire \chan_internal_f[DATA][33] ;
   wire \chan_internal_f[DATA][32] ;
   wire \chan_internal_f[DATA][31] ;
   wire \chan_internal_f[DATA][30] ;
   wire \chan_internal_f[DATA][29] ;
   wire \chan_internal_f[DATA][28] ;
   wire \chan_internal_f[DATA][27] ;
   wire \chan_internal_f[DATA][26] ;
   wire \chan_internal_f[DATA][25] ;
   wire \chan_internal_f[DATA][24] ;
   wire \chan_internal_f[DATA][23] ;
   wire \chan_internal_f[DATA][22] ;
   wire \chan_internal_f[DATA][21] ;
   wire \chan_internal_f[DATA][20] ;
   wire \chan_internal_f[DATA][19] ;
   wire \chan_internal_f[DATA][18] ;
   wire \chan_internal_f[DATA][17] ;
   wire \chan_internal_f[DATA][16] ;
   wire \chan_internal_f[DATA][15] ;
   wire \chan_internal_f[DATA][14] ;
   wire \chan_internal_f[DATA][13] ;
   wire \chan_internal_f[DATA][12] ;
   wire \chan_internal_f[DATA][11] ;
   wire \chan_internal_f[DATA][10] ;
   wire \chan_internal_f[DATA][9] ;
   wire \chan_internal_f[DATA][8] ;
   wire \chan_internal_f[DATA][7] ;
   wire \chan_internal_f[DATA][6] ;
   wire \chan_internal_f[DATA][5] ;
   wire \chan_internal_f[DATA][4] ;
   wire \chan_internal_f[DATA][3] ;
   wire \chan_internal_f[DATA][2] ;
   wire \chan_internal_f[DATA][1] ;
   wire \chan_internal_f[DATA][0] ;
   wire data_in_valid;
   wire req_n;

   HS65_LS_BFX7 FE_PHC1462_req_n (.Z(FE_PHN1462_req_n), 
	.A(req_n));
   HS65_LH_BFX7 FE_PHC1418_req_n (.Z(FE_PHN1418_req_n), 
	.A(FE_PHN1462_req_n));
   hpu_comb_0_2 hpu_combinatorial (.data_valid(data_in_valid), 
	.data_in({ \chan_in_f[DATA][33] ,
		\chan_in_f[DATA][32] ,
		\chan_in_f[DATA][31] ,
		\chan_in_f[DATA][30] ,
		\chan_in_f[DATA][29] ,
		\chan_in_f[DATA][28] ,
		\chan_in_f[DATA][27] ,
		\chan_in_f[DATA][26] ,
		\chan_in_f[DATA][25] ,
		\chan_in_f[DATA][24] ,
		\chan_in_f[DATA][23] ,
		\chan_in_f[DATA][22] ,
		\chan_in_f[DATA][21] ,
		\chan_in_f[DATA][20] ,
		\chan_in_f[DATA][19] ,
		\chan_in_f[DATA][18] ,
		\chan_in_f[DATA][17] ,
		\chan_in_f[DATA][16] ,
		\chan_in_f[DATA][15] ,
		\chan_in_f[DATA][14] ,
		\chan_in_f[DATA][13] ,
		\chan_in_f[DATA][12] ,
		\chan_in_f[DATA][11] ,
		\chan_in_f[DATA][10] ,
		\chan_in_f[DATA][9] ,
		\chan_in_f[DATA][8] ,
		\chan_in_f[DATA][7] ,
		\chan_in_f[DATA][6] ,
		\chan_in_f[DATA][5] ,
		\chan_in_f[DATA][4] ,
		\chan_in_f[DATA][3] ,
		\chan_in_f[DATA][2] ,
		\chan_in_f[DATA][1] ,
		\chan_in_f[DATA][0]  }), 
	.data_out({ \chan_internal_f[DATA][33] ,
		\chan_internal_f[DATA][32] ,
		\chan_internal_f[DATA][31] ,
		\chan_internal_f[DATA][30] ,
		\chan_internal_f[DATA][29] ,
		\chan_internal_f[DATA][28] ,
		\chan_internal_f[DATA][27] ,
		\chan_internal_f[DATA][26] ,
		\chan_internal_f[DATA][25] ,
		\chan_internal_f[DATA][24] ,
		\chan_internal_f[DATA][23] ,
		\chan_internal_f[DATA][22] ,
		\chan_internal_f[DATA][21] ,
		\chan_internal_f[DATA][20] ,
		\chan_internal_f[DATA][19] ,
		\chan_internal_f[DATA][18] ,
		\chan_internal_f[DATA][17] ,
		\chan_internal_f[DATA][16] ,
		\chan_internal_f[DATA][15] ,
		\chan_internal_f[DATA][14] ,
		\chan_internal_f[DATA][13] ,
		\chan_internal_f[DATA][12] ,
		\chan_internal_f[DATA][11] ,
		\chan_internal_f[DATA][10] ,
		\chan_internal_f[DATA][9] ,
		\chan_internal_f[DATA][8] ,
		\chan_internal_f[DATA][7] ,
		\chan_internal_f[DATA][6] ,
		\chan_internal_f[DATA][5] ,
		\chan_internal_f[DATA][4] ,
		\chan_internal_f[DATA][3] ,
		\chan_internal_f[DATA][2] ,
		\chan_internal_f[DATA][1] ,
		\chan_internal_f[DATA][0]  }), 
	.sel({ sel[4],
		sel[3],
		sel[2],
		sel[1],
		sel[0] }));
   channel_latch_1_xxxxxxxxx_4 token_latch (.preset(preset), 
	.left_in({ \chan_internal_f[REQ] ,
		\chan_internal_f[DATA][33] ,
		\chan_internal_f[DATA][32] ,
		\chan_internal_f[DATA][31] ,
		\chan_internal_f[DATA][30] ,
		\chan_internal_f[DATA][29] ,
		\chan_internal_f[DATA][28] ,
		\chan_internal_f[DATA][27] ,
		\chan_internal_f[DATA][26] ,
		\chan_internal_f[DATA][25] ,
		\chan_internal_f[DATA][24] ,
		\chan_internal_f[DATA][23] ,
		\chan_internal_f[DATA][22] ,
		\chan_internal_f[DATA][21] ,
		\chan_internal_f[DATA][20] ,
		\chan_internal_f[DATA][19] ,
		\chan_internal_f[DATA][18] ,
		\chan_internal_f[DATA][17] ,
		\chan_internal_f[DATA][16] ,
		\chan_internal_f[DATA][15] ,
		\chan_internal_f[DATA][14] ,
		\chan_internal_f[DATA][13] ,
		\chan_internal_f[DATA][12] ,
		\chan_internal_f[DATA][11] ,
		\chan_internal_f[DATA][10] ,
		\chan_internal_f[DATA][9] ,
		\chan_internal_f[DATA][8] ,
		\chan_internal_f[DATA][7] ,
		\chan_internal_f[DATA][6] ,
		\chan_internal_f[DATA][5] ,
		\chan_internal_f[DATA][4] ,
		\chan_internal_f[DATA][3] ,
		\chan_internal_f[DATA][2] ,
		\chan_internal_f[DATA][1] ,
		\chan_internal_f[DATA][0]  }), 
	.left_out(\chan_in_b[ACK] ), 
	.right_out({ \chan_out_f[REQ] ,
		\chan_out_f[DATA][33] ,
		\chan_out_f[DATA][32] ,
		\chan_out_f[DATA][31] ,
		\chan_out_f[DATA][30] ,
		\chan_out_f[DATA][29] ,
		\chan_out_f[DATA][28] ,
		\chan_out_f[DATA][27] ,
		\chan_out_f[DATA][26] ,
		\chan_out_f[DATA][25] ,
		\chan_out_f[DATA][24] ,
		\chan_out_f[DATA][23] ,
		\chan_out_f[DATA][22] ,
		\chan_out_f[DATA][21] ,
		\chan_out_f[DATA][20] ,
		\chan_out_f[DATA][19] ,
		\chan_out_f[DATA][18] ,
		\chan_out_f[DATA][17] ,
		\chan_out_f[DATA][16] ,
		\chan_out_f[DATA][15] ,
		\chan_out_f[DATA][14] ,
		\chan_out_f[DATA][13] ,
		\chan_out_f[DATA][12] ,
		\chan_out_f[DATA][11] ,
		\chan_out_f[DATA][10] ,
		\chan_out_f[DATA][9] ,
		\chan_out_f[DATA][8] ,
		\chan_out_f[DATA][7] ,
		\chan_out_f[DATA][6] ,
		\chan_out_f[DATA][5] ,
		\chan_out_f[DATA][4] ,
		\chan_out_f[DATA][3] ,
		\chan_out_f[DATA][2] ,
		\chan_out_f[DATA][1] ,
		\chan_out_f[DATA][0]  }), 
	.right_in(\chan_out_b[ACK] ), 
	.FE_OFN0_preset(FE_OFN0_preset));
   HS65_LS_IVX9 I_1 (.Z(\chan_internal_f[REQ] ), 
	.A(FE_PHN1418_req_n));
   HS65_LH_IVX2 I_0 (.Z(req_n), 
	.A(\chan_in_f[REQ] ));
   HS65_LSS_XOR2X6 U7 (.Z(data_in_valid), 
	.B(\chan_in_b[ACK] ), 
	.A(\chan_internal_f[REQ] ));
endmodule

module hpu_comb_0_1 (
	data_valid, 
	data_in, 
	data_out, 
	sel);
   input data_valid;
   input [33:0] data_in;
   output [33:0] data_out;
   output [4:0] sel;

   // Internal wires
   wire FE_OFN1017_n19;
   wire FE_OFN3_n19;
   wire N15;
   wire N17;
   wire N18;
   wire N19;
   wire N20;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;

   assign data_out[33] = data_in[33] ;
   assign data_out[32] = data_in[32] ;

   HS65_LS_BFX7 FE_OFC1017_n19 (.Z(FE_OFN1017_n19), 
	.A(FE_OFN3_n19));
   HS65_LS_BFX71 FE_OFC3_n19 (.Z(FE_OFN3_n19), 
	.A(n19));
   HS65_LS_LDHQX18 \sel_reg[4]  (.Q(sel[4]), 
	.G(N20), 
	.D(N19));
   HS65_LS_LDHQX9 \sel_reg[3]  (.Q(sel[3]), 
	.G(N20), 
	.D(N18));
   HS65_LS_LDHQX9 \sel_reg[2]  (.Q(sel[2]), 
	.G(N20), 
	.D(N17));
   HS65_LS_LDHQX9 \sel_reg[1]  (.Q(sel[1]), 
	.G(N20), 
	.D(1'b0));
   HS65_LS_LDHQX9 \sel_reg[0]  (.Q(sel[0]), 
	.G(N20), 
	.D(N15));
   HS65_LS_AO22X4 U4 (.Z(data_out[18]), 
	.D(data_in[18]), 
	.C(n24), 
	.B(data_in[20]), 
	.A(FE_OFN1017_n19));
   HS65_LS_AO22X4 U5 (.Z(data_out[22]), 
	.D(data_in[22]), 
	.C(n24), 
	.B(data_in[24]), 
	.A(FE_OFN1017_n19));
   HS65_LS_AO22X4 U6 (.Z(data_out[24]), 
	.D(data_in[24]), 
	.C(n24), 
	.B(data_in[26]), 
	.A(FE_OFN3_n19));
   HS65_LS_CNIVX27 U8 (.Z(n24), 
	.A(FE_OFN3_n19));
   HS65_LS_IVX9 U9 (.Z(n23), 
	.A(FE_OFN1017_n19));
   HS65_LS_OAI22X6 U10 (.Z(data_out[7]), 
	.D(n14), 
	.C(FE_OFN1017_n19), 
	.B(n24), 
	.A(n13));
   HS65_LS_OAI22X6 U11 (.Z(data_out[1]), 
	.D(n17), 
	.C(FE_OFN1017_n19), 
	.B(n16), 
	.A(n23));
   HS65_LS_OAI22X6 U12 (.Z(data_out[3]), 
	.D(n16), 
	.C(FE_OFN1017_n19), 
	.B(n15), 
	.A(n23));
   HS65_LS_OAI22X6 U13 (.Z(data_out[5]), 
	.D(n15), 
	.C(FE_OFN1017_n19), 
	.B(n14), 
	.A(n23));
   HS65_LS_OAI22X6 U14 (.Z(data_out[9]), 
	.D(n13), 
	.C(FE_OFN1017_n19), 
	.B(n12), 
	.A(n23));
   HS65_LS_OAI22X6 U15 (.Z(data_out[11]), 
	.D(n12), 
	.C(FE_OFN1017_n19), 
	.B(n11), 
	.A(n23));
   HS65_LS_OAI22X6 U16 (.Z(data_out[13]), 
	.D(n11), 
	.C(FE_OFN1017_n19), 
	.B(n10), 
	.A(n23));
   HS65_LS_OAI22X6 U17 (.Z(data_out[15]), 
	.D(n10), 
	.C(FE_OFN1017_n19), 
	.B(n9), 
	.A(n23));
   HS65_LS_OAI22X6 U18 (.Z(data_out[17]), 
	.D(n9), 
	.C(FE_OFN1017_n19), 
	.B(n8), 
	.A(n23));
   HS65_LS_OAI22X6 U19 (.Z(data_out[19]), 
	.D(n8), 
	.C(FE_OFN1017_n19), 
	.B(n7), 
	.A(n23));
   HS65_LS_OAI22X6 U20 (.Z(data_out[21]), 
	.D(n7), 
	.C(FE_OFN1017_n19), 
	.B(n6), 
	.A(n23));
   HS65_LS_OAI22X6 U21 (.Z(data_out[23]), 
	.D(n6), 
	.C(FE_OFN1017_n19), 
	.B(n5), 
	.A(n23));
   HS65_LS_OAI22X6 U22 (.Z(data_out[25]), 
	.D(n5), 
	.C(FE_OFN3_n19), 
	.B(n4), 
	.A(n24));
   HS65_LS_OAI22X6 U23 (.Z(data_out[27]), 
	.D(n4), 
	.C(FE_OFN3_n19), 
	.B(n3), 
	.A(n23));
   HS65_LS_OAI22X6 U24 (.Z(data_out[29]), 
	.D(n3), 
	.C(FE_OFN3_n19), 
	.B(n2), 
	.A(n24));
   HS65_LS_NAND2X7 U25 (.Z(n21), 
	.B(n20), 
	.A(FE_OFN3_n19));
   HS65_LS_NOR3X4 U26 (.Z(N18), 
	.C(n22), 
	.B(n17), 
	.A(n21));
   HS65_LS_NOR2AX3 U28 (.Z(N17), 
	.B(n21), 
	.A(n22));
   HS65_LS_NOR2X6 U29 (.Z(N19), 
	.B(n20), 
	.A(n24));
   HS65_LS_NOR2X6 U31 (.Z(data_out[31]), 
	.B(n2), 
	.A(FE_OFN3_n19));
   HS65_LS_IVX9 U32 (.Z(n17), 
	.A(data_in[1]));
   HS65_LS_NAND2X7 U33 (.Z(n20), 
	.B(n17), 
	.A(data_in[0]));
   HS65_LS_NOR2X6 U34 (.Z(n22), 
	.B(data_in[0]), 
	.A(n17));
   HS65_LS_IVX9 U35 (.Z(n13), 
	.A(data_in[9]));
   HS65_LS_IVX9 U36 (.Z(n16), 
	.A(data_in[3]));
   HS65_LS_IVX9 U37 (.Z(n15), 
	.A(data_in[5]));
   HS65_LS_IVX9 U38 (.Z(n14), 
	.A(data_in[7]));
   HS65_LS_IVX9 U39 (.Z(n12), 
	.A(data_in[11]));
   HS65_LS_IVX9 U40 (.Z(n11), 
	.A(data_in[13]));
   HS65_LS_IVX9 U41 (.Z(n10), 
	.A(data_in[15]));
   HS65_LS_IVX9 U42 (.Z(n9), 
	.A(data_in[17]));
   HS65_LS_IVX9 U43 (.Z(n8), 
	.A(data_in[19]));
   HS65_LS_IVX9 U44 (.Z(n7), 
	.A(data_in[21]));
   HS65_LS_IVX9 U45 (.Z(n6), 
	.A(data_in[23]));
   HS65_LS_IVX9 U46 (.Z(n5), 
	.A(data_in[25]));
   HS65_LS_IVX9 U47 (.Z(n4), 
	.A(data_in[27]));
   HS65_LS_IVX9 U48 (.Z(n3), 
	.A(data_in[29]));
   HS65_LS_IVX9 U49 (.Z(n2), 
	.A(data_in[31]));
   HS65_LS_NOR2AX19 U50 (.Z(n19), 
	.B(data_in[32]), 
	.A(data_in[33]));
   HS65_LS_NOR2X6 U51 (.Z(N15), 
	.B(n21), 
	.A(data_in[1]));
   HS65_LS_AO22X9 U52 (.Z(data_out[0]), 
	.D(data_in[0]), 
	.C(n24), 
	.B(data_in[2]), 
	.A(FE_OFN3_n19));
   HS65_LS_AO22X9 U53 (.Z(data_out[2]), 
	.D(data_in[2]), 
	.C(n24), 
	.B(data_in[4]), 
	.A(FE_OFN3_n19));
   HS65_LS_AO22X9 U54 (.Z(data_out[4]), 
	.D(data_in[4]), 
	.C(n24), 
	.B(data_in[6]), 
	.A(FE_OFN3_n19));
   HS65_LS_AO22X9 U55 (.Z(data_out[6]), 
	.D(data_in[6]), 
	.C(n24), 
	.B(data_in[8]), 
	.A(FE_OFN3_n19));
   HS65_LS_AO22X9 U56 (.Z(data_out[8]), 
	.D(data_in[8]), 
	.C(n24), 
	.B(data_in[10]), 
	.A(FE_OFN3_n19));
   HS65_LS_AO22X9 U57 (.Z(data_out[14]), 
	.D(data_in[14]), 
	.C(n24), 
	.B(data_in[16]), 
	.A(FE_OFN1017_n19));
   HS65_LS_AO22X9 U58 (.Z(data_out[16]), 
	.D(data_in[16]), 
	.C(n24), 
	.B(data_in[18]), 
	.A(FE_OFN1017_n19));
   HS65_LS_AO22X9 U59 (.Z(data_out[20]), 
	.D(data_in[20]), 
	.C(n24), 
	.B(data_in[22]), 
	.A(FE_OFN1017_n19));
   HS65_LS_AO22X9 U60 (.Z(data_out[26]), 
	.D(data_in[26]), 
	.C(n24), 
	.B(data_in[28]), 
	.A(FE_OFN3_n19));
   HS65_LS_AO22X9 U62 (.Z(data_out[28]), 
	.D(data_in[28]), 
	.C(n24), 
	.B(data_in[30]), 
	.A(FE_OFN3_n19));
   HS65_LS_AO22X9 U63 (.Z(data_out[10]), 
	.D(data_in[10]), 
	.C(n23), 
	.B(data_in[12]), 
	.A(FE_OFN1017_n19));
   HS65_LS_AO22X9 U64 (.Z(data_out[12]), 
	.D(data_in[12]), 
	.C(n23), 
	.B(data_in[14]), 
	.A(FE_OFN1017_n19));
   HS65_LS_AND2X4 U65 (.Z(data_out[30]), 
	.B(n23), 
	.A(data_in[30]));
   HS65_LS_NOR2AX3 U66 (.Z(N20), 
	.B(data_in[32]), 
	.A(data_valid));
endmodule

module sr_latch_0_3 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire N1;
   wire n1;

   HS65_LS_AND2X4 C8 (.Z(q), 
	.B(N1), 
	.A(n1));
   HS65_LS_IVX9 U1 (.Z(N1), 
	.A(qn));
   HS65_LS_IVX9 U2 (.Z(n1), 
	.A(r));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_0_3 (
	preset, 
	a, 
	b, 
	c);
   input preset;
   input a;
   input b;
   output c;

   // Internal wires
   wire set;
   wire reset;
   wire n1;

   sr_latch_0_3 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_OAI21X3 U3 (.Z(reset), 
	.C(n1), 
	.B(a), 
	.A(b));
   HS65_LS_IVX9 U4 (.Z(n1), 
	.A(preset));
   HS65_LS_AND3X9 U5 (.Z(set), 
	.C(a), 
	.B(n1), 
	.A(b));
endmodule

module latch_controller_1_3 (
	preset, 
	Rin, 
	Aout, 
	Rout, 
	Ain, 
	lt_en);
   input preset;
   input Rin;
   output Aout;
   output Rout;
   input Ain;
   output lt_en;

   // Internal wires
   wire FE_PHN1438_d;
   wire FE_PHN1432_d;
   wire not_Ain;
   wire d;

   HS65_LH_BFX7 FE_PHC1438_d (.Z(FE_PHN1432_d), 
	.A(FE_PHN1438_d));
   HS65_LH_DLYIC4X9 FE_PHC1432_d (.Z(FE_PHN1438_d), 
	.A(d));
   c_gate_0_3 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Rout));
   HS65_LS_IVX9 I_0 (.Z(not_Ain), 
	.A(Ain));
   HS65_LS_IVX9 I_2 (.Z(d), 
	.A(Rout));
   HS65_LS_IVX9 I_1 (.Z(Aout), 
	.A(FE_PHN1432_d));
   HS65_LSS_XOR2X6 U11 (.Z(lt_en), 
	.B(Ain), 
	.A(Rout));
endmodule

module channel_latch_1_xxxxxxxxx_3 (
	preset, 
	.left_in ( { \left_in[REQ] , 
		\left_in[DATA][33] , 
		\left_in[DATA][32] , 
		\left_in[DATA][31] , 
		\left_in[DATA][30] , 
		\left_in[DATA][29] , 
		\left_in[DATA][28] , 
		\left_in[DATA][27] , 
		\left_in[DATA][26] , 
		\left_in[DATA][25] , 
		\left_in[DATA][24] , 
		\left_in[DATA][23] , 
		\left_in[DATA][22] , 
		\left_in[DATA][21] , 
		\left_in[DATA][20] , 
		\left_in[DATA][19] , 
		\left_in[DATA][18] , 
		\left_in[DATA][17] , 
		\left_in[DATA][16] , 
		\left_in[DATA][15] , 
		\left_in[DATA][14] , 
		\left_in[DATA][13] , 
		\left_in[DATA][12] , 
		\left_in[DATA][11] , 
		\left_in[DATA][10] , 
		\left_in[DATA][9] , 
		\left_in[DATA][8] , 
		\left_in[DATA][7] , 
		\left_in[DATA][6] , 
		\left_in[DATA][5] , 
		\left_in[DATA][4] , 
		\left_in[DATA][3] , 
		\left_in[DATA][2] , 
		\left_in[DATA][1] , 
		\left_in[DATA][0]  } ), 
	.left_out ( \left_out[ACK]  ), 
	.right_out ( { \right_out[REQ] , 
		\right_out[DATA][33] , 
		\right_out[DATA][32] , 
		\right_out[DATA][31] , 
		\right_out[DATA][30] , 
		\right_out[DATA][29] , 
		\right_out[DATA][28] , 
		\right_out[DATA][27] , 
		\right_out[DATA][26] , 
		\right_out[DATA][25] , 
		\right_out[DATA][24] , 
		\right_out[DATA][23] , 
		\right_out[DATA][22] , 
		\right_out[DATA][21] , 
		\right_out[DATA][20] , 
		\right_out[DATA][19] , 
		\right_out[DATA][18] , 
		\right_out[DATA][17] , 
		\right_out[DATA][16] , 
		\right_out[DATA][15] , 
		\right_out[DATA][14] , 
		\right_out[DATA][13] , 
		\right_out[DATA][12] , 
		\right_out[DATA][11] , 
		\right_out[DATA][10] , 
		\right_out[DATA][9] , 
		\right_out[DATA][8] , 
		\right_out[DATA][7] , 
		\right_out[DATA][6] , 
		\right_out[DATA][5] , 
		\right_out[DATA][4] , 
		\right_out[DATA][3] , 
		\right_out[DATA][2] , 
		\right_out[DATA][1] , 
		\right_out[DATA][0]  } ), 
	.right_in ( \right_in[ACK]  ));
   input preset;
   input \left_in[REQ] ;
   input \left_in[DATA][33] ;
   input \left_in[DATA][32] ;
   input \left_in[DATA][31] ;
   input \left_in[DATA][30] ;
   input \left_in[DATA][29] ;
   input \left_in[DATA][28] ;
   input \left_in[DATA][27] ;
   input \left_in[DATA][26] ;
   input \left_in[DATA][25] ;
   input \left_in[DATA][24] ;
   input \left_in[DATA][23] ;
   input \left_in[DATA][22] ;
   input \left_in[DATA][21] ;
   input \left_in[DATA][20] ;
   input \left_in[DATA][19] ;
   input \left_in[DATA][18] ;
   input \left_in[DATA][17] ;
   input \left_in[DATA][16] ;
   input \left_in[DATA][15] ;
   input \left_in[DATA][14] ;
   input \left_in[DATA][13] ;
   input \left_in[DATA][12] ;
   input \left_in[DATA][11] ;
   input \left_in[DATA][10] ;
   input \left_in[DATA][9] ;
   input \left_in[DATA][8] ;
   input \left_in[DATA][7] ;
   input \left_in[DATA][6] ;
   input \left_in[DATA][5] ;
   input \left_in[DATA][4] ;
   input \left_in[DATA][3] ;
   input \left_in[DATA][2] ;
   input \left_in[DATA][1] ;
   input \left_in[DATA][0] ;
   output \left_out[ACK] ;
   output \right_out[REQ] ;
   output \right_out[DATA][33] ;
   output \right_out[DATA][32] ;
   output \right_out[DATA][31] ;
   output \right_out[DATA][30] ;
   output \right_out[DATA][29] ;
   output \right_out[DATA][28] ;
   output \right_out[DATA][27] ;
   output \right_out[DATA][26] ;
   output \right_out[DATA][25] ;
   output \right_out[DATA][24] ;
   output \right_out[DATA][23] ;
   output \right_out[DATA][22] ;
   output \right_out[DATA][21] ;
   output \right_out[DATA][20] ;
   output \right_out[DATA][19] ;
   output \right_out[DATA][18] ;
   output \right_out[DATA][17] ;
   output \right_out[DATA][16] ;
   output \right_out[DATA][15] ;
   output \right_out[DATA][14] ;
   output \right_out[DATA][13] ;
   output \right_out[DATA][12] ;
   output \right_out[DATA][11] ;
   output \right_out[DATA][10] ;
   output \right_out[DATA][9] ;
   output \right_out[DATA][8] ;
   output \right_out[DATA][7] ;
   output \right_out[DATA][6] ;
   output \right_out[DATA][5] ;
   output \right_out[DATA][4] ;
   output \right_out[DATA][3] ;
   output \right_out[DATA][2] ;
   output \right_out[DATA][1] ;
   output \right_out[DATA][0] ;
   input \right_in[ACK] ;

   // Internal wires
   wire lt_en;
   wire N3;

   latch_controller_1_3 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHQX9 \data_reg[33]  (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(\left_in[DATA][33] ));
   HS65_LS_LDHQX9 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(\left_in[DATA][32] ));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(N3), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(N3), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(N3), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(N3), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(N3), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(N3), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(N3), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(N3), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(N3), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(N3), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(N3), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(N3), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(N3), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(N3), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(N3), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHQX9 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHQX9 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3), 
	.D(\left_in[DATA][0] ));
   HS65_LS_NAND2AX7 U3 (.Z(N3), 
	.B(lt_en), 
	.A(preset));
endmodule

module hpu_0_1 (
	preset, 
	.chan_in_f ( { \chan_in_f[REQ] , 
		\chan_in_f[DATA][33] , 
		\chan_in_f[DATA][32] , 
		\chan_in_f[DATA][31] , 
		\chan_in_f[DATA][30] , 
		\chan_in_f[DATA][29] , 
		\chan_in_f[DATA][28] , 
		\chan_in_f[DATA][27] , 
		\chan_in_f[DATA][26] , 
		\chan_in_f[DATA][25] , 
		\chan_in_f[DATA][24] , 
		\chan_in_f[DATA][23] , 
		\chan_in_f[DATA][22] , 
		\chan_in_f[DATA][21] , 
		\chan_in_f[DATA][20] , 
		\chan_in_f[DATA][19] , 
		\chan_in_f[DATA][18] , 
		\chan_in_f[DATA][17] , 
		\chan_in_f[DATA][16] , 
		\chan_in_f[DATA][15] , 
		\chan_in_f[DATA][14] , 
		\chan_in_f[DATA][13] , 
		\chan_in_f[DATA][12] , 
		\chan_in_f[DATA][11] , 
		\chan_in_f[DATA][10] , 
		\chan_in_f[DATA][9] , 
		\chan_in_f[DATA][8] , 
		\chan_in_f[DATA][7] , 
		\chan_in_f[DATA][6] , 
		\chan_in_f[DATA][5] , 
		\chan_in_f[DATA][4] , 
		\chan_in_f[DATA][3] , 
		\chan_in_f[DATA][2] , 
		\chan_in_f[DATA][1] , 
		\chan_in_f[DATA][0]  } ), 
	.chan_in_b ( \chan_in_b[ACK]  ), 
	.chan_out_f ( { \chan_out_f[REQ] , 
		\chan_out_f[DATA][33] , 
		\chan_out_f[DATA][32] , 
		\chan_out_f[DATA][31] , 
		\chan_out_f[DATA][30] , 
		\chan_out_f[DATA][29] , 
		\chan_out_f[DATA][28] , 
		\chan_out_f[DATA][27] , 
		\chan_out_f[DATA][26] , 
		\chan_out_f[DATA][25] , 
		\chan_out_f[DATA][24] , 
		\chan_out_f[DATA][23] , 
		\chan_out_f[DATA][22] , 
		\chan_out_f[DATA][21] , 
		\chan_out_f[DATA][20] , 
		\chan_out_f[DATA][19] , 
		\chan_out_f[DATA][18] , 
		\chan_out_f[DATA][17] , 
		\chan_out_f[DATA][16] , 
		\chan_out_f[DATA][15] , 
		\chan_out_f[DATA][14] , 
		\chan_out_f[DATA][13] , 
		\chan_out_f[DATA][12] , 
		\chan_out_f[DATA][11] , 
		\chan_out_f[DATA][10] , 
		\chan_out_f[DATA][9] , 
		\chan_out_f[DATA][8] , 
		\chan_out_f[DATA][7] , 
		\chan_out_f[DATA][6] , 
		\chan_out_f[DATA][5] , 
		\chan_out_f[DATA][4] , 
		\chan_out_f[DATA][3] , 
		\chan_out_f[DATA][2] , 
		\chan_out_f[DATA][1] , 
		\chan_out_f[DATA][0]  } ), 
	.chan_out_b ( \chan_out_b[ACK]  ), 
	sel);
   input preset;
   input \chan_in_f[REQ] ;
   input \chan_in_f[DATA][33] ;
   input \chan_in_f[DATA][32] ;
   input \chan_in_f[DATA][31] ;
   input \chan_in_f[DATA][30] ;
   input \chan_in_f[DATA][29] ;
   input \chan_in_f[DATA][28] ;
   input \chan_in_f[DATA][27] ;
   input \chan_in_f[DATA][26] ;
   input \chan_in_f[DATA][25] ;
   input \chan_in_f[DATA][24] ;
   input \chan_in_f[DATA][23] ;
   input \chan_in_f[DATA][22] ;
   input \chan_in_f[DATA][21] ;
   input \chan_in_f[DATA][20] ;
   input \chan_in_f[DATA][19] ;
   input \chan_in_f[DATA][18] ;
   input \chan_in_f[DATA][17] ;
   input \chan_in_f[DATA][16] ;
   input \chan_in_f[DATA][15] ;
   input \chan_in_f[DATA][14] ;
   input \chan_in_f[DATA][13] ;
   input \chan_in_f[DATA][12] ;
   input \chan_in_f[DATA][11] ;
   input \chan_in_f[DATA][10] ;
   input \chan_in_f[DATA][9] ;
   input \chan_in_f[DATA][8] ;
   input \chan_in_f[DATA][7] ;
   input \chan_in_f[DATA][6] ;
   input \chan_in_f[DATA][5] ;
   input \chan_in_f[DATA][4] ;
   input \chan_in_f[DATA][3] ;
   input \chan_in_f[DATA][2] ;
   input \chan_in_f[DATA][1] ;
   input \chan_in_f[DATA][0] ;
   output \chan_in_b[ACK] ;
   output \chan_out_f[REQ] ;
   output \chan_out_f[DATA][33] ;
   output \chan_out_f[DATA][32] ;
   output \chan_out_f[DATA][31] ;
   output \chan_out_f[DATA][30] ;
   output \chan_out_f[DATA][29] ;
   output \chan_out_f[DATA][28] ;
   output \chan_out_f[DATA][27] ;
   output \chan_out_f[DATA][26] ;
   output \chan_out_f[DATA][25] ;
   output \chan_out_f[DATA][24] ;
   output \chan_out_f[DATA][23] ;
   output \chan_out_f[DATA][22] ;
   output \chan_out_f[DATA][21] ;
   output \chan_out_f[DATA][20] ;
   output \chan_out_f[DATA][19] ;
   output \chan_out_f[DATA][18] ;
   output \chan_out_f[DATA][17] ;
   output \chan_out_f[DATA][16] ;
   output \chan_out_f[DATA][15] ;
   output \chan_out_f[DATA][14] ;
   output \chan_out_f[DATA][13] ;
   output \chan_out_f[DATA][12] ;
   output \chan_out_f[DATA][11] ;
   output \chan_out_f[DATA][10] ;
   output \chan_out_f[DATA][9] ;
   output \chan_out_f[DATA][8] ;
   output \chan_out_f[DATA][7] ;
   output \chan_out_f[DATA][6] ;
   output \chan_out_f[DATA][5] ;
   output \chan_out_f[DATA][4] ;
   output \chan_out_f[DATA][3] ;
   output \chan_out_f[DATA][2] ;
   output \chan_out_f[DATA][1] ;
   output \chan_out_f[DATA][0] ;
   input \chan_out_b[ACK] ;
   output [4:0] sel;

   // Internal wires
   wire FE_PHN1465_req_n;
   wire FE_PHN1402_req_n;
   wire \chan_internal_f[REQ] ;
   wire \chan_internal_f[DATA][33] ;
   wire \chan_internal_f[DATA][32] ;
   wire \chan_internal_f[DATA][31] ;
   wire \chan_internal_f[DATA][30] ;
   wire \chan_internal_f[DATA][29] ;
   wire \chan_internal_f[DATA][28] ;
   wire \chan_internal_f[DATA][27] ;
   wire \chan_internal_f[DATA][26] ;
   wire \chan_internal_f[DATA][25] ;
   wire \chan_internal_f[DATA][24] ;
   wire \chan_internal_f[DATA][23] ;
   wire \chan_internal_f[DATA][22] ;
   wire \chan_internal_f[DATA][21] ;
   wire \chan_internal_f[DATA][20] ;
   wire \chan_internal_f[DATA][19] ;
   wire \chan_internal_f[DATA][18] ;
   wire \chan_internal_f[DATA][17] ;
   wire \chan_internal_f[DATA][16] ;
   wire \chan_internal_f[DATA][15] ;
   wire \chan_internal_f[DATA][14] ;
   wire \chan_internal_f[DATA][13] ;
   wire \chan_internal_f[DATA][12] ;
   wire \chan_internal_f[DATA][11] ;
   wire \chan_internal_f[DATA][10] ;
   wire \chan_internal_f[DATA][9] ;
   wire \chan_internal_f[DATA][8] ;
   wire \chan_internal_f[DATA][7] ;
   wire \chan_internal_f[DATA][6] ;
   wire \chan_internal_f[DATA][5] ;
   wire \chan_internal_f[DATA][4] ;
   wire \chan_internal_f[DATA][3] ;
   wire \chan_internal_f[DATA][2] ;
   wire \chan_internal_f[DATA][1] ;
   wire \chan_internal_f[DATA][0] ;
   wire data_in_valid;
   wire req_n;

   HS65_LS_BFX7 FE_PHC1465_req_n (.Z(FE_PHN1465_req_n), 
	.A(FE_PHN1402_req_n));
   HS65_LH_DLYIC2X4 FE_PHC1402_req_n (.Z(FE_PHN1402_req_n), 
	.A(req_n));
   hpu_comb_0_1 hpu_combinatorial (.data_valid(data_in_valid), 
	.data_in({ \chan_in_f[DATA][33] ,
		\chan_in_f[DATA][32] ,
		\chan_in_f[DATA][31] ,
		\chan_in_f[DATA][30] ,
		\chan_in_f[DATA][29] ,
		\chan_in_f[DATA][28] ,
		\chan_in_f[DATA][27] ,
		\chan_in_f[DATA][26] ,
		\chan_in_f[DATA][25] ,
		\chan_in_f[DATA][24] ,
		\chan_in_f[DATA][23] ,
		\chan_in_f[DATA][22] ,
		\chan_in_f[DATA][21] ,
		\chan_in_f[DATA][20] ,
		\chan_in_f[DATA][19] ,
		\chan_in_f[DATA][18] ,
		\chan_in_f[DATA][17] ,
		\chan_in_f[DATA][16] ,
		\chan_in_f[DATA][15] ,
		\chan_in_f[DATA][14] ,
		\chan_in_f[DATA][13] ,
		\chan_in_f[DATA][12] ,
		\chan_in_f[DATA][11] ,
		\chan_in_f[DATA][10] ,
		\chan_in_f[DATA][9] ,
		\chan_in_f[DATA][8] ,
		\chan_in_f[DATA][7] ,
		\chan_in_f[DATA][6] ,
		\chan_in_f[DATA][5] ,
		\chan_in_f[DATA][4] ,
		\chan_in_f[DATA][3] ,
		\chan_in_f[DATA][2] ,
		\chan_in_f[DATA][1] ,
		\chan_in_f[DATA][0]  }), 
	.data_out({ \chan_internal_f[DATA][33] ,
		\chan_internal_f[DATA][32] ,
		\chan_internal_f[DATA][31] ,
		\chan_internal_f[DATA][30] ,
		\chan_internal_f[DATA][29] ,
		\chan_internal_f[DATA][28] ,
		\chan_internal_f[DATA][27] ,
		\chan_internal_f[DATA][26] ,
		\chan_internal_f[DATA][25] ,
		\chan_internal_f[DATA][24] ,
		\chan_internal_f[DATA][23] ,
		\chan_internal_f[DATA][22] ,
		\chan_internal_f[DATA][21] ,
		\chan_internal_f[DATA][20] ,
		\chan_internal_f[DATA][19] ,
		\chan_internal_f[DATA][18] ,
		\chan_internal_f[DATA][17] ,
		\chan_internal_f[DATA][16] ,
		\chan_internal_f[DATA][15] ,
		\chan_internal_f[DATA][14] ,
		\chan_internal_f[DATA][13] ,
		\chan_internal_f[DATA][12] ,
		\chan_internal_f[DATA][11] ,
		\chan_internal_f[DATA][10] ,
		\chan_internal_f[DATA][9] ,
		\chan_internal_f[DATA][8] ,
		\chan_internal_f[DATA][7] ,
		\chan_internal_f[DATA][6] ,
		\chan_internal_f[DATA][5] ,
		\chan_internal_f[DATA][4] ,
		\chan_internal_f[DATA][3] ,
		\chan_internal_f[DATA][2] ,
		\chan_internal_f[DATA][1] ,
		\chan_internal_f[DATA][0]  }), 
	.sel({ sel[4],
		sel[3],
		sel[2],
		sel[1],
		sel[0] }));
   channel_latch_1_xxxxxxxxx_3 token_latch (.preset(preset), 
	.left_in({ \chan_internal_f[REQ] ,
		\chan_internal_f[DATA][33] ,
		\chan_internal_f[DATA][32] ,
		\chan_internal_f[DATA][31] ,
		\chan_internal_f[DATA][30] ,
		\chan_internal_f[DATA][29] ,
		\chan_internal_f[DATA][28] ,
		\chan_internal_f[DATA][27] ,
		\chan_internal_f[DATA][26] ,
		\chan_internal_f[DATA][25] ,
		\chan_internal_f[DATA][24] ,
		\chan_internal_f[DATA][23] ,
		\chan_internal_f[DATA][22] ,
		\chan_internal_f[DATA][21] ,
		\chan_internal_f[DATA][20] ,
		\chan_internal_f[DATA][19] ,
		\chan_internal_f[DATA][18] ,
		\chan_internal_f[DATA][17] ,
		\chan_internal_f[DATA][16] ,
		\chan_internal_f[DATA][15] ,
		\chan_internal_f[DATA][14] ,
		\chan_internal_f[DATA][13] ,
		\chan_internal_f[DATA][12] ,
		\chan_internal_f[DATA][11] ,
		\chan_internal_f[DATA][10] ,
		\chan_internal_f[DATA][9] ,
		\chan_internal_f[DATA][8] ,
		\chan_internal_f[DATA][7] ,
		\chan_internal_f[DATA][6] ,
		\chan_internal_f[DATA][5] ,
		\chan_internal_f[DATA][4] ,
		\chan_internal_f[DATA][3] ,
		\chan_internal_f[DATA][2] ,
		\chan_internal_f[DATA][1] ,
		\chan_internal_f[DATA][0]  }), 
	.left_out(\chan_in_b[ACK] ), 
	.right_out({ \chan_out_f[REQ] ,
		\chan_out_f[DATA][33] ,
		\chan_out_f[DATA][32] ,
		\chan_out_f[DATA][31] ,
		\chan_out_f[DATA][30] ,
		\chan_out_f[DATA][29] ,
		\chan_out_f[DATA][28] ,
		\chan_out_f[DATA][27] ,
		\chan_out_f[DATA][26] ,
		\chan_out_f[DATA][25] ,
		\chan_out_f[DATA][24] ,
		\chan_out_f[DATA][23] ,
		\chan_out_f[DATA][22] ,
		\chan_out_f[DATA][21] ,
		\chan_out_f[DATA][20] ,
		\chan_out_f[DATA][19] ,
		\chan_out_f[DATA][18] ,
		\chan_out_f[DATA][17] ,
		\chan_out_f[DATA][16] ,
		\chan_out_f[DATA][15] ,
		\chan_out_f[DATA][14] ,
		\chan_out_f[DATA][13] ,
		\chan_out_f[DATA][12] ,
		\chan_out_f[DATA][11] ,
		\chan_out_f[DATA][10] ,
		\chan_out_f[DATA][9] ,
		\chan_out_f[DATA][8] ,
		\chan_out_f[DATA][7] ,
		\chan_out_f[DATA][6] ,
		\chan_out_f[DATA][5] ,
		\chan_out_f[DATA][4] ,
		\chan_out_f[DATA][3] ,
		\chan_out_f[DATA][2] ,
		\chan_out_f[DATA][1] ,
		\chan_out_f[DATA][0]  }), 
	.right_in(\chan_out_b[ACK] ));
   HS65_LS_IVX9 I_1 (.Z(\chan_internal_f[REQ] ), 
	.A(FE_PHN1465_req_n));
   HS65_LH_IVX2 I_0 (.Z(req_n), 
	.A(\chan_in_f[REQ] ));
   HS65_LSS_XOR2X6 U7 (.Z(data_in_valid), 
	.B(\chan_in_b[ACK] ), 
	.A(\chan_internal_f[REQ] ));
endmodule

module hpu_comb_0_3 (
	data_valid, 
	data_in, 
	data_out, 
	sel);
   input data_valid;
   input [33:0] data_in;
   output [33:0] data_out;
   output [4:0] sel;

   // Internal wires
   wire FE_OFN1016_n43;
   wire FE_OFN6_n43;
   wire N17;
   wire N18;
   wire N19;
   wire N21;
   wire N22;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n1;
   wire n39;
   wire n43;

   assign data_out[33] = data_in[33] ;
   assign data_out[32] = data_in[32] ;

   HS65_LS_BFX142 FE_OFC1016_n43 (.Z(FE_OFN1016_n43), 
	.A(FE_OFN6_n43));
   HS65_LS_BFX106 FE_OFC6_n43 (.Z(FE_OFN6_n43), 
	.A(n43));
   HS65_LS_LDHQX9 \sel_reg[4]  (.Q(sel[4]), 
	.G(N22), 
	.D(N21));
   HS65_LS_LDHQX9 \sel_reg[3]  (.Q(sel[3]), 
	.G(N22), 
	.D(1'b0));
   HS65_LS_LDHQX9 \sel_reg[2]  (.Q(sel[2]), 
	.G(N22), 
	.D(N19));
   HS65_LS_LDHQX9 \sel_reg[1]  (.Q(sel[1]), 
	.G(N22), 
	.D(N18));
   HS65_LS_LDHQX9 \sel_reg[0]  (.Q(sel[0]), 
	.G(N22), 
	.D(N17));
   HS65_LS_CNNOR2AX15 U4 (.Z(n35), 
	.B(data_in[32]), 
	.A(data_in[33]));
   HS65_LS_IVX106 U5 (.Z(n39), 
	.A(FE_OFN1016_n43));
   HS65_LS_IVX9 U6 (.Z(n1), 
	.A(FE_OFN1016_n43));
   HS65_LS_NOR2X3 U9 (.Z(N17), 
	.B(n38), 
	.A(FE_OFN1016_n43));
   HS65_LS_OAI22X6 U10 (.Z(data_out[6]), 
	.D(n27), 
	.C(n1), 
	.B(n25), 
	.A(FE_OFN6_n43));
   HS65_LS_OAI22X6 U11 (.Z(data_out[7]), 
	.D(n26), 
	.C(n1), 
	.B(FE_OFN1016_n43), 
	.A(n24));
   HS65_LS_OAI22X6 U12 (.Z(data_out[0]), 
	.D(n33), 
	.C(n1), 
	.B(n31), 
	.A(FE_OFN6_n43));
   HS65_LS_OAI22X6 U13 (.Z(data_out[1]), 
	.D(n32), 
	.C(n39), 
	.B(n30), 
	.A(FE_OFN6_n43));
   HS65_LS_OAI22X6 U14 (.Z(data_out[2]), 
	.D(n31), 
	.C(n1), 
	.B(n29), 
	.A(FE_OFN6_n43));
   HS65_LS_OAI22X6 U15 (.Z(data_out[3]), 
	.D(n30), 
	.C(n1), 
	.B(n28), 
	.A(FE_OFN6_n43));
   HS65_LS_OAI22X6 U16 (.Z(data_out[4]), 
	.D(n29), 
	.C(n1), 
	.B(n27), 
	.A(FE_OFN6_n43));
   HS65_LS_OAI22X6 U17 (.Z(data_out[5]), 
	.D(n28), 
	.C(n39), 
	.B(n26), 
	.A(FE_OFN6_n43));
   HS65_LS_OAI22X6 U18 (.Z(data_out[8]), 
	.D(n25), 
	.C(n1), 
	.B(n23), 
	.A(FE_OFN6_n43));
   HS65_LS_OAI22X6 U19 (.Z(data_out[9]), 
	.D(n24), 
	.C(n1), 
	.B(n22), 
	.A(FE_OFN1016_n43));
   HS65_LS_OAI22X6 U20 (.Z(data_out[10]), 
	.D(n23), 
	.C(n1), 
	.B(n21), 
	.A(FE_OFN1016_n43));
   HS65_LS_OAI22X6 U21 (.Z(data_out[11]), 
	.D(n22), 
	.C(n1), 
	.B(n20), 
	.A(FE_OFN1016_n43));
   HS65_LS_OAI22X6 U22 (.Z(data_out[12]), 
	.D(n21), 
	.C(n1), 
	.B(n19), 
	.A(FE_OFN1016_n43));
   HS65_LS_OAI22X6 U23 (.Z(data_out[13]), 
	.D(n20), 
	.C(n1), 
	.B(n18), 
	.A(FE_OFN1016_n43));
   HS65_LS_OAI22X6 U24 (.Z(data_out[14]), 
	.D(n19), 
	.C(n1), 
	.B(n17), 
	.A(FE_OFN1016_n43));
   HS65_LS_OAI22X6 U25 (.Z(data_out[15]), 
	.D(n18), 
	.C(n39), 
	.B(n16), 
	.A(FE_OFN1016_n43));
   HS65_LS_OAI22X6 U26 (.Z(data_out[16]), 
	.D(n17), 
	.C(n39), 
	.B(n15), 
	.A(FE_OFN1016_n43));
   HS65_LS_OAI22X6 U27 (.Z(data_out[17]), 
	.D(n16), 
	.C(n39), 
	.B(n14), 
	.A(FE_OFN1016_n43));
   HS65_LS_OAI22X6 U28 (.Z(data_out[18]), 
	.D(n15), 
	.C(n39), 
	.B(n13), 
	.A(FE_OFN1016_n43));
   HS65_LS_OAI22X6 U29 (.Z(data_out[19]), 
	.D(n14), 
	.C(n39), 
	.B(n12), 
	.A(FE_OFN1016_n43));
   HS65_LS_OAI22X6 U30 (.Z(data_out[20]), 
	.D(n13), 
	.C(n39), 
	.B(n11), 
	.A(FE_OFN1016_n43));
   HS65_LS_OAI22X6 U31 (.Z(data_out[21]), 
	.D(n12), 
	.C(n39), 
	.B(n10), 
	.A(FE_OFN1016_n43));
   HS65_LS_OAI22X6 U32 (.Z(data_out[22]), 
	.D(n11), 
	.C(n39), 
	.B(n9), 
	.A(FE_OFN1016_n43));
   HS65_LS_OAI22X6 U33 (.Z(data_out[23]), 
	.D(n10), 
	.C(n39), 
	.B(n8), 
	.A(FE_OFN1016_n43));
   HS65_LS_OAI22X6 U34 (.Z(data_out[24]), 
	.D(n9), 
	.C(n39), 
	.B(n7), 
	.A(FE_OFN6_n43));
   HS65_LS_OAI22X6 U35 (.Z(data_out[25]), 
	.D(n8), 
	.C(n1), 
	.B(n6), 
	.A(FE_OFN6_n43));
   HS65_LS_OAI22X6 U36 (.Z(data_out[26]), 
	.D(n7), 
	.C(n1), 
	.B(n5), 
	.A(FE_OFN6_n43));
   HS65_LS_OAI22X6 U37 (.Z(data_out[27]), 
	.D(n6), 
	.C(n1), 
	.B(n4), 
	.A(FE_OFN6_n43));
   HS65_LS_OAI22X6 U38 (.Z(data_out[28]), 
	.D(n5), 
	.C(n1), 
	.B(n3), 
	.A(FE_OFN6_n43));
   HS65_LS_OAI22X6 U39 (.Z(data_out[29]), 
	.D(n4), 
	.C(n1), 
	.B(n2), 
	.A(FE_OFN6_n43));
   HS65_LS_NAND3X6 U40 (.Z(n37), 
	.C(n39), 
	.B(n36), 
	.A(n38));
   HS65_LS_NAND2X7 U41 (.Z(n38), 
	.B(n33), 
	.A(n32));
   HS65_LS_NOR2X6 U42 (.Z(N18), 
	.B(n37), 
	.A(n33));
   HS65_LS_NOR2X6 U43 (.Z(N21), 
	.B(n36), 
	.A(FE_OFN1016_n43));
   HS65_LS_NOR2X6 U44 (.Z(data_out[30]), 
	.B(n3), 
	.A(n1));
   HS65_LS_NOR2X6 U45 (.Z(data_out[31]), 
	.B(n2), 
	.A(n1));
   HS65_LS_CNIVX21 U46 (.Z(n43), 
	.A(n35));
   HS65_LS_CNIVX27 U47 (.Z(n33), 
	.A(data_in[0]));
   HS65_LS_NAND2X7 U48 (.Z(n36), 
	.B(data_in[0]), 
	.A(data_in[1]));
   HS65_LS_IVX9 U49 (.Z(n24), 
	.A(data_in[9]));
   HS65_LS_IVX9 U50 (.Z(n31), 
	.A(data_in[2]));
   HS65_LS_IVX9 U51 (.Z(n30), 
	.A(data_in[3]));
   HS65_LS_IVX9 U52 (.Z(n29), 
	.A(data_in[4]));
   HS65_LS_IVX9 U53 (.Z(n28), 
	.A(data_in[5]));
   HS65_LS_IVX9 U54 (.Z(n27), 
	.A(data_in[6]));
   HS65_LS_IVX9 U55 (.Z(n26), 
	.A(data_in[7]));
   HS65_LS_IVX9 U56 (.Z(n25), 
	.A(data_in[8]));
   HS65_LS_IVX9 U57 (.Z(n23), 
	.A(data_in[10]));
   HS65_LS_IVX9 U58 (.Z(n22), 
	.A(data_in[11]));
   HS65_LS_IVX9 U59 (.Z(n21), 
	.A(data_in[12]));
   HS65_LS_IVX9 U60 (.Z(n20), 
	.A(data_in[13]));
   HS65_LS_IVX9 U61 (.Z(n19), 
	.A(data_in[14]));
   HS65_LS_IVX9 U62 (.Z(n18), 
	.A(data_in[15]));
   HS65_LS_IVX9 U63 (.Z(n17), 
	.A(data_in[16]));
   HS65_LS_IVX9 U64 (.Z(n16), 
	.A(data_in[17]));
   HS65_LS_IVX9 U65 (.Z(n15), 
	.A(data_in[18]));
   HS65_LS_IVX9 U66 (.Z(n14), 
	.A(data_in[19]));
   HS65_LS_IVX9 U67 (.Z(n13), 
	.A(data_in[20]));
   HS65_LS_IVX9 U68 (.Z(n12), 
	.A(data_in[21]));
   HS65_LS_IVX9 U69 (.Z(n11), 
	.A(data_in[22]));
   HS65_LS_IVX9 U70 (.Z(n10), 
	.A(data_in[23]));
   HS65_LS_IVX9 U71 (.Z(n9), 
	.A(data_in[24]));
   HS65_LS_IVX9 U72 (.Z(n8), 
	.A(data_in[25]));
   HS65_LS_IVX9 U73 (.Z(n7), 
	.A(data_in[26]));
   HS65_LS_IVX9 U74 (.Z(n6), 
	.A(data_in[27]));
   HS65_LS_IVX9 U75 (.Z(n5), 
	.A(data_in[28]));
   HS65_LS_IVX9 U76 (.Z(n4), 
	.A(data_in[29]));
   HS65_LS_IVX9 U78 (.Z(n3), 
	.A(data_in[30]));
   HS65_LS_IVX9 U79 (.Z(n2), 
	.A(data_in[31]));
   HS65_LS_CNIVX14 U80 (.Z(n32), 
	.A(data_in[1]));
   HS65_LS_NOR2X5 U81 (.Z(N19), 
	.B(n37), 
	.A(data_in[0]));
   HS65_LS_NOR2AX3 U82 (.Z(N22), 
	.B(data_in[32]), 
	.A(data_valid));
endmodule

module sr_latch_0_2 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire N1;
   wire n1;

   HS65_LS_AND2X4 C8 (.Z(q), 
	.B(N1), 
	.A(n1));
   HS65_LS_IVX9 U1 (.Z(N1), 
	.A(qn));
   HS65_LS_IVX9 U2 (.Z(n1), 
	.A(r));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_0_2 (
	preset, 
	a, 
	b, 
	c);
   input preset;
   input a;
   input b;
   output c;

   // Internal wires
   wire set;
   wire reset;
   wire n1;

   sr_latch_0_2 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_OAI21X3 U3 (.Z(reset), 
	.C(n1), 
	.B(a), 
	.A(b));
   HS65_LS_IVX9 U4 (.Z(n1), 
	.A(preset));
   HS65_LS_AND3X9 U5 (.Z(set), 
	.C(a), 
	.B(n1), 
	.A(b));
endmodule

module latch_controller_1_2 (
	preset, 
	Rin, 
	Aout, 
	Rout, 
	Ain, 
	lt_en);
   input preset;
   input Rin;
   output Aout;
   output Rout;
   input Ain;
   output lt_en;

   // Internal wires
   wire FE_PHN1439_d;
   wire FE_PHN1434_d;
   wire not_Ain;
   wire d;

   HS65_LH_BFX7 FE_PHC1439_d (.Z(FE_PHN1434_d), 
	.A(FE_PHN1439_d));
   HS65_LH_DLYIC4X9 FE_PHC1434_d (.Z(FE_PHN1439_d), 
	.A(d));
   c_gate_0_2 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Rout));
   HS65_LS_IVX9 I_0 (.Z(not_Ain), 
	.A(Ain));
   HS65_LS_IVX9 I_2 (.Z(d), 
	.A(Rout));
   HS65_LS_IVX9 I_1 (.Z(Aout), 
	.A(FE_PHN1434_d));
   HS65_LSS_XOR2X6 U11 (.Z(lt_en), 
	.B(Ain), 
	.A(Rout));
endmodule

module channel_latch_1_xxxxxxxxx_2 (
	preset, 
	.left_in ( { \left_in[REQ] , 
		\left_in[DATA][33] , 
		\left_in[DATA][32] , 
		\left_in[DATA][31] , 
		\left_in[DATA][30] , 
		\left_in[DATA][29] , 
		\left_in[DATA][28] , 
		\left_in[DATA][27] , 
		\left_in[DATA][26] , 
		\left_in[DATA][25] , 
		\left_in[DATA][24] , 
		\left_in[DATA][23] , 
		\left_in[DATA][22] , 
		\left_in[DATA][21] , 
		\left_in[DATA][20] , 
		\left_in[DATA][19] , 
		\left_in[DATA][18] , 
		\left_in[DATA][17] , 
		\left_in[DATA][16] , 
		\left_in[DATA][15] , 
		\left_in[DATA][14] , 
		\left_in[DATA][13] , 
		\left_in[DATA][12] , 
		\left_in[DATA][11] , 
		\left_in[DATA][10] , 
		\left_in[DATA][9] , 
		\left_in[DATA][8] , 
		\left_in[DATA][7] , 
		\left_in[DATA][6] , 
		\left_in[DATA][5] , 
		\left_in[DATA][4] , 
		\left_in[DATA][3] , 
		\left_in[DATA][2] , 
		\left_in[DATA][1] , 
		\left_in[DATA][0]  } ), 
	.left_out ( \left_out[ACK]  ), 
	.right_out ( { \right_out[REQ] , 
		\right_out[DATA][33] , 
		\right_out[DATA][32] , 
		\right_out[DATA][31] , 
		\right_out[DATA][30] , 
		\right_out[DATA][29] , 
		\right_out[DATA][28] , 
		\right_out[DATA][27] , 
		\right_out[DATA][26] , 
		\right_out[DATA][25] , 
		\right_out[DATA][24] , 
		\right_out[DATA][23] , 
		\right_out[DATA][22] , 
		\right_out[DATA][21] , 
		\right_out[DATA][20] , 
		\right_out[DATA][19] , 
		\right_out[DATA][18] , 
		\right_out[DATA][17] , 
		\right_out[DATA][16] , 
		\right_out[DATA][15] , 
		\right_out[DATA][14] , 
		\right_out[DATA][13] , 
		\right_out[DATA][12] , 
		\right_out[DATA][11] , 
		\right_out[DATA][10] , 
		\right_out[DATA][9] , 
		\right_out[DATA][8] , 
		\right_out[DATA][7] , 
		\right_out[DATA][6] , 
		\right_out[DATA][5] , 
		\right_out[DATA][4] , 
		\right_out[DATA][3] , 
		\right_out[DATA][2] , 
		\right_out[DATA][1] , 
		\right_out[DATA][0]  } ), 
	.right_in ( \right_in[ACK]  ));
   input preset;
   input \left_in[REQ] ;
   input \left_in[DATA][33] ;
   input \left_in[DATA][32] ;
   input \left_in[DATA][31] ;
   input \left_in[DATA][30] ;
   input \left_in[DATA][29] ;
   input \left_in[DATA][28] ;
   input \left_in[DATA][27] ;
   input \left_in[DATA][26] ;
   input \left_in[DATA][25] ;
   input \left_in[DATA][24] ;
   input \left_in[DATA][23] ;
   input \left_in[DATA][22] ;
   input \left_in[DATA][21] ;
   input \left_in[DATA][20] ;
   input \left_in[DATA][19] ;
   input \left_in[DATA][18] ;
   input \left_in[DATA][17] ;
   input \left_in[DATA][16] ;
   input \left_in[DATA][15] ;
   input \left_in[DATA][14] ;
   input \left_in[DATA][13] ;
   input \left_in[DATA][12] ;
   input \left_in[DATA][11] ;
   input \left_in[DATA][10] ;
   input \left_in[DATA][9] ;
   input \left_in[DATA][8] ;
   input \left_in[DATA][7] ;
   input \left_in[DATA][6] ;
   input \left_in[DATA][5] ;
   input \left_in[DATA][4] ;
   input \left_in[DATA][3] ;
   input \left_in[DATA][2] ;
   input \left_in[DATA][1] ;
   input \left_in[DATA][0] ;
   output \left_out[ACK] ;
   output \right_out[REQ] ;
   output \right_out[DATA][33] ;
   output \right_out[DATA][32] ;
   output \right_out[DATA][31] ;
   output \right_out[DATA][30] ;
   output \right_out[DATA][29] ;
   output \right_out[DATA][28] ;
   output \right_out[DATA][27] ;
   output \right_out[DATA][26] ;
   output \right_out[DATA][25] ;
   output \right_out[DATA][24] ;
   output \right_out[DATA][23] ;
   output \right_out[DATA][22] ;
   output \right_out[DATA][21] ;
   output \right_out[DATA][20] ;
   output \right_out[DATA][19] ;
   output \right_out[DATA][18] ;
   output \right_out[DATA][17] ;
   output \right_out[DATA][16] ;
   output \right_out[DATA][15] ;
   output \right_out[DATA][14] ;
   output \right_out[DATA][13] ;
   output \right_out[DATA][12] ;
   output \right_out[DATA][11] ;
   output \right_out[DATA][10] ;
   output \right_out[DATA][9] ;
   output \right_out[DATA][8] ;
   output \right_out[DATA][7] ;
   output \right_out[DATA][6] ;
   output \right_out[DATA][5] ;
   output \right_out[DATA][4] ;
   output \right_out[DATA][3] ;
   output \right_out[DATA][2] ;
   output \right_out[DATA][1] ;
   output \right_out[DATA][0] ;
   input \right_in[ACK] ;

   // Internal wires
   wire lt_en;
   wire N3;

   latch_controller_1_2 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX9 \data_reg[33]  (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(\left_in[DATA][33] ));
   HS65_LS_LDHQX9 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(\left_in[DATA][32] ));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(N3), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(N3), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(N3), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(N3), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(N3), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(N3), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(N3), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(N3), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(N3), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(N3), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(N3), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(N3), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(N3), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(N3), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(N3), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHQX9 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHQX9 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3), 
	.D(\left_in[DATA][0] ));
   HS65_LS_NAND2AX7 U3 (.Z(N3), 
	.B(lt_en), 
	.A(preset));
endmodule

module hpu_0_3 (
	preset, 
	.chan_in_f ( { \chan_in_f[REQ] , 
		\chan_in_f[DATA][33] , 
		\chan_in_f[DATA][32] , 
		\chan_in_f[DATA][31] , 
		\chan_in_f[DATA][30] , 
		\chan_in_f[DATA][29] , 
		\chan_in_f[DATA][28] , 
		\chan_in_f[DATA][27] , 
		\chan_in_f[DATA][26] , 
		\chan_in_f[DATA][25] , 
		\chan_in_f[DATA][24] , 
		\chan_in_f[DATA][23] , 
		\chan_in_f[DATA][22] , 
		\chan_in_f[DATA][21] , 
		\chan_in_f[DATA][20] , 
		\chan_in_f[DATA][19] , 
		\chan_in_f[DATA][18] , 
		\chan_in_f[DATA][17] , 
		\chan_in_f[DATA][16] , 
		\chan_in_f[DATA][15] , 
		\chan_in_f[DATA][14] , 
		\chan_in_f[DATA][13] , 
		\chan_in_f[DATA][12] , 
		\chan_in_f[DATA][11] , 
		\chan_in_f[DATA][10] , 
		\chan_in_f[DATA][9] , 
		\chan_in_f[DATA][8] , 
		\chan_in_f[DATA][7] , 
		\chan_in_f[DATA][6] , 
		\chan_in_f[DATA][5] , 
		\chan_in_f[DATA][4] , 
		\chan_in_f[DATA][3] , 
		\chan_in_f[DATA][2] , 
		\chan_in_f[DATA][1] , 
		\chan_in_f[DATA][0]  } ), 
	.chan_in_b ( \chan_in_b[ACK]  ), 
	.chan_out_f ( { \chan_out_f[REQ] , 
		\chan_out_f[DATA][33] , 
		\chan_out_f[DATA][32] , 
		\chan_out_f[DATA][31] , 
		\chan_out_f[DATA][30] , 
		\chan_out_f[DATA][29] , 
		\chan_out_f[DATA][28] , 
		\chan_out_f[DATA][27] , 
		\chan_out_f[DATA][26] , 
		\chan_out_f[DATA][25] , 
		\chan_out_f[DATA][24] , 
		\chan_out_f[DATA][23] , 
		\chan_out_f[DATA][22] , 
		\chan_out_f[DATA][21] , 
		\chan_out_f[DATA][20] , 
		\chan_out_f[DATA][19] , 
		\chan_out_f[DATA][18] , 
		\chan_out_f[DATA][17] , 
		\chan_out_f[DATA][16] , 
		\chan_out_f[DATA][15] , 
		\chan_out_f[DATA][14] , 
		\chan_out_f[DATA][13] , 
		\chan_out_f[DATA][12] , 
		\chan_out_f[DATA][11] , 
		\chan_out_f[DATA][10] , 
		\chan_out_f[DATA][9] , 
		\chan_out_f[DATA][8] , 
		\chan_out_f[DATA][7] , 
		\chan_out_f[DATA][6] , 
		\chan_out_f[DATA][5] , 
		\chan_out_f[DATA][4] , 
		\chan_out_f[DATA][3] , 
		\chan_out_f[DATA][2] , 
		\chan_out_f[DATA][1] , 
		\chan_out_f[DATA][0]  } ), 
	.chan_out_b ( \chan_out_b[ACK]  ), 
	sel);
   input preset;
   input \chan_in_f[REQ] ;
   input \chan_in_f[DATA][33] ;
   input \chan_in_f[DATA][32] ;
   input \chan_in_f[DATA][31] ;
   input \chan_in_f[DATA][30] ;
   input \chan_in_f[DATA][29] ;
   input \chan_in_f[DATA][28] ;
   input \chan_in_f[DATA][27] ;
   input \chan_in_f[DATA][26] ;
   input \chan_in_f[DATA][25] ;
   input \chan_in_f[DATA][24] ;
   input \chan_in_f[DATA][23] ;
   input \chan_in_f[DATA][22] ;
   input \chan_in_f[DATA][21] ;
   input \chan_in_f[DATA][20] ;
   input \chan_in_f[DATA][19] ;
   input \chan_in_f[DATA][18] ;
   input \chan_in_f[DATA][17] ;
   input \chan_in_f[DATA][16] ;
   input \chan_in_f[DATA][15] ;
   input \chan_in_f[DATA][14] ;
   input \chan_in_f[DATA][13] ;
   input \chan_in_f[DATA][12] ;
   input \chan_in_f[DATA][11] ;
   input \chan_in_f[DATA][10] ;
   input \chan_in_f[DATA][9] ;
   input \chan_in_f[DATA][8] ;
   input \chan_in_f[DATA][7] ;
   input \chan_in_f[DATA][6] ;
   input \chan_in_f[DATA][5] ;
   input \chan_in_f[DATA][4] ;
   input \chan_in_f[DATA][3] ;
   input \chan_in_f[DATA][2] ;
   input \chan_in_f[DATA][1] ;
   input \chan_in_f[DATA][0] ;
   output \chan_in_b[ACK] ;
   output \chan_out_f[REQ] ;
   output \chan_out_f[DATA][33] ;
   output \chan_out_f[DATA][32] ;
   output \chan_out_f[DATA][31] ;
   output \chan_out_f[DATA][30] ;
   output \chan_out_f[DATA][29] ;
   output \chan_out_f[DATA][28] ;
   output \chan_out_f[DATA][27] ;
   output \chan_out_f[DATA][26] ;
   output \chan_out_f[DATA][25] ;
   output \chan_out_f[DATA][24] ;
   output \chan_out_f[DATA][23] ;
   output \chan_out_f[DATA][22] ;
   output \chan_out_f[DATA][21] ;
   output \chan_out_f[DATA][20] ;
   output \chan_out_f[DATA][19] ;
   output \chan_out_f[DATA][18] ;
   output \chan_out_f[DATA][17] ;
   output \chan_out_f[DATA][16] ;
   output \chan_out_f[DATA][15] ;
   output \chan_out_f[DATA][14] ;
   output \chan_out_f[DATA][13] ;
   output \chan_out_f[DATA][12] ;
   output \chan_out_f[DATA][11] ;
   output \chan_out_f[DATA][10] ;
   output \chan_out_f[DATA][9] ;
   output \chan_out_f[DATA][8] ;
   output \chan_out_f[DATA][7] ;
   output \chan_out_f[DATA][6] ;
   output \chan_out_f[DATA][5] ;
   output \chan_out_f[DATA][4] ;
   output \chan_out_f[DATA][3] ;
   output \chan_out_f[DATA][2] ;
   output \chan_out_f[DATA][1] ;
   output \chan_out_f[DATA][0] ;
   input \chan_out_b[ACK] ;
   output [4:0] sel;

   // Internal wires
   wire FE_PHN1461_req_n;
   wire FE_PHN1424_west_hpu_b_ACK;
   wire FE_PHN1423_req_n;
   wire \chan_internal_f[REQ] ;
   wire \chan_internal_f[DATA][33] ;
   wire \chan_internal_f[DATA][32] ;
   wire \chan_internal_f[DATA][31] ;
   wire \chan_internal_f[DATA][30] ;
   wire \chan_internal_f[DATA][29] ;
   wire \chan_internal_f[DATA][28] ;
   wire \chan_internal_f[DATA][27] ;
   wire \chan_internal_f[DATA][26] ;
   wire \chan_internal_f[DATA][25] ;
   wire \chan_internal_f[DATA][24] ;
   wire \chan_internal_f[DATA][23] ;
   wire \chan_internal_f[DATA][22] ;
   wire \chan_internal_f[DATA][21] ;
   wire \chan_internal_f[DATA][20] ;
   wire \chan_internal_f[DATA][19] ;
   wire \chan_internal_f[DATA][18] ;
   wire \chan_internal_f[DATA][17] ;
   wire \chan_internal_f[DATA][16] ;
   wire \chan_internal_f[DATA][15] ;
   wire \chan_internal_f[DATA][14] ;
   wire \chan_internal_f[DATA][13] ;
   wire \chan_internal_f[DATA][12] ;
   wire \chan_internal_f[DATA][11] ;
   wire \chan_internal_f[DATA][10] ;
   wire \chan_internal_f[DATA][9] ;
   wire \chan_internal_f[DATA][8] ;
   wire \chan_internal_f[DATA][7] ;
   wire \chan_internal_f[DATA][6] ;
   wire \chan_internal_f[DATA][5] ;
   wire \chan_internal_f[DATA][4] ;
   wire \chan_internal_f[DATA][3] ;
   wire \chan_internal_f[DATA][2] ;
   wire \chan_internal_f[DATA][1] ;
   wire \chan_internal_f[DATA][0] ;
   wire data_in_valid;
   wire req_n;

   HS65_LH_BFX9 FE_PHC1461_req_n (.Z(FE_PHN1461_req_n), 
	.A(FE_PHN1423_req_n));
   HS65_LS_BFX7 FE_PHC1424_west_hpu_b_ACK (.Z(\chan_in_b[ACK] ), 
	.A(FE_PHN1424_west_hpu_b_ACK));
   HS65_LS_BFX7 FE_PHC1423_req_n (.Z(FE_PHN1423_req_n), 
	.A(req_n));
   hpu_comb_0_3 hpu_combinatorial (.data_valid(data_in_valid), 
	.data_in({ \chan_in_f[DATA][33] ,
		\chan_in_f[DATA][32] ,
		\chan_in_f[DATA][31] ,
		\chan_in_f[DATA][30] ,
		\chan_in_f[DATA][29] ,
		\chan_in_f[DATA][28] ,
		\chan_in_f[DATA][27] ,
		\chan_in_f[DATA][26] ,
		\chan_in_f[DATA][25] ,
		\chan_in_f[DATA][24] ,
		\chan_in_f[DATA][23] ,
		\chan_in_f[DATA][22] ,
		\chan_in_f[DATA][21] ,
		\chan_in_f[DATA][20] ,
		\chan_in_f[DATA][19] ,
		\chan_in_f[DATA][18] ,
		\chan_in_f[DATA][17] ,
		\chan_in_f[DATA][16] ,
		\chan_in_f[DATA][15] ,
		\chan_in_f[DATA][14] ,
		\chan_in_f[DATA][13] ,
		\chan_in_f[DATA][12] ,
		\chan_in_f[DATA][11] ,
		\chan_in_f[DATA][10] ,
		\chan_in_f[DATA][9] ,
		\chan_in_f[DATA][8] ,
		\chan_in_f[DATA][7] ,
		\chan_in_f[DATA][6] ,
		\chan_in_f[DATA][5] ,
		\chan_in_f[DATA][4] ,
		\chan_in_f[DATA][3] ,
		\chan_in_f[DATA][2] ,
		\chan_in_f[DATA][1] ,
		\chan_in_f[DATA][0]  }), 
	.data_out({ \chan_internal_f[DATA][33] ,
		\chan_internal_f[DATA][32] ,
		\chan_internal_f[DATA][31] ,
		\chan_internal_f[DATA][30] ,
		\chan_internal_f[DATA][29] ,
		\chan_internal_f[DATA][28] ,
		\chan_internal_f[DATA][27] ,
		\chan_internal_f[DATA][26] ,
		\chan_internal_f[DATA][25] ,
		\chan_internal_f[DATA][24] ,
		\chan_internal_f[DATA][23] ,
		\chan_internal_f[DATA][22] ,
		\chan_internal_f[DATA][21] ,
		\chan_internal_f[DATA][20] ,
		\chan_internal_f[DATA][19] ,
		\chan_internal_f[DATA][18] ,
		\chan_internal_f[DATA][17] ,
		\chan_internal_f[DATA][16] ,
		\chan_internal_f[DATA][15] ,
		\chan_internal_f[DATA][14] ,
		\chan_internal_f[DATA][13] ,
		\chan_internal_f[DATA][12] ,
		\chan_internal_f[DATA][11] ,
		\chan_internal_f[DATA][10] ,
		\chan_internal_f[DATA][9] ,
		\chan_internal_f[DATA][8] ,
		\chan_internal_f[DATA][7] ,
		\chan_internal_f[DATA][6] ,
		\chan_internal_f[DATA][5] ,
		\chan_internal_f[DATA][4] ,
		\chan_internal_f[DATA][3] ,
		\chan_internal_f[DATA][2] ,
		\chan_internal_f[DATA][1] ,
		\chan_internal_f[DATA][0]  }), 
	.sel({ sel[4],
		sel[3],
		sel[2],
		sel[1],
		sel[0] }));
   channel_latch_1_xxxxxxxxx_2 token_latch (.preset(preset), 
	.left_in({ \chan_internal_f[REQ] ,
		\chan_internal_f[DATA][33] ,
		\chan_internal_f[DATA][32] ,
		\chan_internal_f[DATA][31] ,
		\chan_internal_f[DATA][30] ,
		\chan_internal_f[DATA][29] ,
		\chan_internal_f[DATA][28] ,
		\chan_internal_f[DATA][27] ,
		\chan_internal_f[DATA][26] ,
		\chan_internal_f[DATA][25] ,
		\chan_internal_f[DATA][24] ,
		\chan_internal_f[DATA][23] ,
		\chan_internal_f[DATA][22] ,
		\chan_internal_f[DATA][21] ,
		\chan_internal_f[DATA][20] ,
		\chan_internal_f[DATA][19] ,
		\chan_internal_f[DATA][18] ,
		\chan_internal_f[DATA][17] ,
		\chan_internal_f[DATA][16] ,
		\chan_internal_f[DATA][15] ,
		\chan_internal_f[DATA][14] ,
		\chan_internal_f[DATA][13] ,
		\chan_internal_f[DATA][12] ,
		\chan_internal_f[DATA][11] ,
		\chan_internal_f[DATA][10] ,
		\chan_internal_f[DATA][9] ,
		\chan_internal_f[DATA][8] ,
		\chan_internal_f[DATA][7] ,
		\chan_internal_f[DATA][6] ,
		\chan_internal_f[DATA][5] ,
		\chan_internal_f[DATA][4] ,
		\chan_internal_f[DATA][3] ,
		\chan_internal_f[DATA][2] ,
		\chan_internal_f[DATA][1] ,
		\chan_internal_f[DATA][0]  }), 
	.left_out(FE_PHN1424_west_hpu_b_ACK), 
	.right_out({ \chan_out_f[REQ] ,
		\chan_out_f[DATA][33] ,
		\chan_out_f[DATA][32] ,
		\chan_out_f[DATA][31] ,
		\chan_out_f[DATA][30] ,
		\chan_out_f[DATA][29] ,
		\chan_out_f[DATA][28] ,
		\chan_out_f[DATA][27] ,
		\chan_out_f[DATA][26] ,
		\chan_out_f[DATA][25] ,
		\chan_out_f[DATA][24] ,
		\chan_out_f[DATA][23] ,
		\chan_out_f[DATA][22] ,
		\chan_out_f[DATA][21] ,
		\chan_out_f[DATA][20] ,
		\chan_out_f[DATA][19] ,
		\chan_out_f[DATA][18] ,
		\chan_out_f[DATA][17] ,
		\chan_out_f[DATA][16] ,
		\chan_out_f[DATA][15] ,
		\chan_out_f[DATA][14] ,
		\chan_out_f[DATA][13] ,
		\chan_out_f[DATA][12] ,
		\chan_out_f[DATA][11] ,
		\chan_out_f[DATA][10] ,
		\chan_out_f[DATA][9] ,
		\chan_out_f[DATA][8] ,
		\chan_out_f[DATA][7] ,
		\chan_out_f[DATA][6] ,
		\chan_out_f[DATA][5] ,
		\chan_out_f[DATA][4] ,
		\chan_out_f[DATA][3] ,
		\chan_out_f[DATA][2] ,
		\chan_out_f[DATA][1] ,
		\chan_out_f[DATA][0]  }), 
	.right_in(\chan_out_b[ACK] ));
   HS65_LS_IVX9 I_1 (.Z(\chan_internal_f[REQ] ), 
	.A(FE_PHN1461_req_n));
   HS65_LH_IVX2 I_0 (.Z(req_n), 
	.A(\chan_in_f[REQ] ));
   HS65_LSS_XOR2X6 U7 (.Z(data_in_valid), 
	.B(FE_PHN1424_west_hpu_b_ACK), 
	.A(\chan_internal_f[REQ] ));
endmodule

module hpu_comb_1_x (
	data_valid, 
	data_in, 
	data_out, 
	sel);
   input data_valid;
   input [33:0] data_in;
   output [33:0] data_out;
   output [4:0] sel;

   // Internal wires
   wire FE_OFN1015_n42;
   wire FE_OFN5_n42;
   wire N12;
   wire N13;
   wire N14;
   wire N15;
   wire N16;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n1;
   wire n38;

   assign data_out[33] = data_in[33] ;
   assign data_out[32] = data_in[32] ;

   HS65_LS_CNIVX55 FE_RC_1390_0 (.Z(FE_OFN5_n42), 
	.A(n34));
   HS65_LS_BFX142 FE_OFC1015_n42 (.Z(FE_OFN1015_n42), 
	.A(FE_OFN5_n42));
   HS65_LS_LDHQX9 \sel_reg[4]  (.Q(sel[4]), 
	.G(N16), 
	.D(1'b0));
   HS65_LS_LDHQX9 \sel_reg[3]  (.Q(sel[3]), 
	.G(N16), 
	.D(N15));
   HS65_LS_LDHQX9 \sel_reg[2]  (.Q(sel[2]), 
	.G(N16), 
	.D(N14));
   HS65_LS_LDHQX9 \sel_reg[1]  (.Q(sel[1]), 
	.G(N16), 
	.D(N13));
   HS65_LS_LDHQX9 \sel_reg[0]  (.Q(sel[0]), 
	.G(N16), 
	.D(N12));
   HS65_LS_NOR2AX13 U4 (.Z(n34), 
	.B(data_in[32]), 
	.A(data_in[33]));
   HS65_LS_IVX106 U5 (.Z(n38), 
	.A(FE_OFN1015_n42));
   HS65_LS_IVX9 U6 (.Z(n1), 
	.A(FE_OFN1015_n42));
   HS65_LS_NOR2X6 U9 (.Z(N12), 
	.B(n36), 
	.A(FE_OFN1015_n42));
   HS65_LS_OAI22X6 U10 (.Z(data_out[6]), 
	.D(n27), 
	.C(n1), 
	.B(n25), 
	.A(FE_OFN5_n42));
   HS65_LS_OAI22X6 U11 (.Z(data_out[7]), 
	.D(n26), 
	.C(n1), 
	.B(FE_OFN1015_n42), 
	.A(n24));
   HS65_LS_OAI22X6 U12 (.Z(data_out[0]), 
	.D(n33), 
	.C(n1), 
	.B(n31), 
	.A(FE_OFN5_n42));
   HS65_LS_OAI22X6 U13 (.Z(data_out[1]), 
	.D(n32), 
	.C(n38), 
	.B(n30), 
	.A(FE_OFN5_n42));
   HS65_LS_OAI22X6 U14 (.Z(data_out[2]), 
	.D(n31), 
	.C(n1), 
	.B(n29), 
	.A(FE_OFN5_n42));
   HS65_LS_OAI22X6 U15 (.Z(data_out[3]), 
	.D(n30), 
	.C(n1), 
	.B(n28), 
	.A(FE_OFN5_n42));
   HS65_LS_OAI22X6 U16 (.Z(data_out[4]), 
	.D(n29), 
	.C(n1), 
	.B(n27), 
	.A(FE_OFN5_n42));
   HS65_LS_OAI22X6 U17 (.Z(data_out[5]), 
	.D(n28), 
	.C(n38), 
	.B(n26), 
	.A(FE_OFN5_n42));
   HS65_LS_OAI22X6 U18 (.Z(data_out[8]), 
	.D(n25), 
	.C(n1), 
	.B(n23), 
	.A(FE_OFN5_n42));
   HS65_LS_OAI22X6 U19 (.Z(data_out[9]), 
	.D(n24), 
	.C(n1), 
	.B(n22), 
	.A(FE_OFN1015_n42));
   HS65_LS_OAI22X6 U20 (.Z(data_out[10]), 
	.D(n23), 
	.C(n1), 
	.B(n21), 
	.A(FE_OFN1015_n42));
   HS65_LS_OAI22X6 U21 (.Z(data_out[11]), 
	.D(n22), 
	.C(n1), 
	.B(n20), 
	.A(FE_OFN1015_n42));
   HS65_LS_OAI22X6 U22 (.Z(data_out[12]), 
	.D(n21), 
	.C(n1), 
	.B(n19), 
	.A(FE_OFN1015_n42));
   HS65_LS_OAI22X6 U23 (.Z(data_out[13]), 
	.D(n20), 
	.C(n1), 
	.B(n18), 
	.A(FE_OFN1015_n42));
   HS65_LS_OAI22X6 U24 (.Z(data_out[14]), 
	.D(n19), 
	.C(n1), 
	.B(n17), 
	.A(FE_OFN1015_n42));
   HS65_LS_OAI22X6 U25 (.Z(data_out[15]), 
	.D(n18), 
	.C(n38), 
	.B(n16), 
	.A(FE_OFN1015_n42));
   HS65_LS_OAI22X6 U26 (.Z(data_out[16]), 
	.D(n17), 
	.C(n38), 
	.B(n15), 
	.A(FE_OFN1015_n42));
   HS65_LS_OAI22X6 U27 (.Z(data_out[17]), 
	.D(n16), 
	.C(n38), 
	.B(n14), 
	.A(FE_OFN1015_n42));
   HS65_LS_OAI22X6 U28 (.Z(data_out[18]), 
	.D(n15), 
	.C(n38), 
	.B(n13), 
	.A(FE_OFN1015_n42));
   HS65_LS_OAI22X6 U29 (.Z(data_out[19]), 
	.D(n14), 
	.C(n38), 
	.B(n12), 
	.A(FE_OFN1015_n42));
   HS65_LS_OAI22X6 U30 (.Z(data_out[20]), 
	.D(n13), 
	.C(n38), 
	.B(n11), 
	.A(FE_OFN1015_n42));
   HS65_LS_OAI22X6 U31 (.Z(data_out[21]), 
	.D(n12), 
	.C(n38), 
	.B(n10), 
	.A(FE_OFN1015_n42));
   HS65_LS_OAI22X6 U32 (.Z(data_out[22]), 
	.D(n11), 
	.C(n38), 
	.B(n9), 
	.A(FE_OFN1015_n42));
   HS65_LS_OAI22X6 U33 (.Z(data_out[23]), 
	.D(n10), 
	.C(n38), 
	.B(n8), 
	.A(FE_OFN1015_n42));
   HS65_LS_OAI22X6 U34 (.Z(data_out[24]), 
	.D(n9), 
	.C(n38), 
	.B(n7), 
	.A(FE_OFN5_n42));
   HS65_LS_OAI22X6 U35 (.Z(data_out[25]), 
	.D(n8), 
	.C(n1), 
	.B(n6), 
	.A(FE_OFN5_n42));
   HS65_LS_OAI22X6 U36 (.Z(data_out[26]), 
	.D(n7), 
	.C(n1), 
	.B(n5), 
	.A(FE_OFN5_n42));
   HS65_LS_OAI22X6 U37 (.Z(data_out[27]), 
	.D(n6), 
	.C(n1), 
	.B(n4), 
	.A(FE_OFN5_n42));
   HS65_LS_OAI22X6 U38 (.Z(data_out[28]), 
	.D(n5), 
	.C(n1), 
	.B(n3), 
	.A(FE_OFN5_n42));
   HS65_LS_OAI22X6 U39 (.Z(data_out[29]), 
	.D(n4), 
	.C(n1), 
	.B(n2), 
	.A(FE_OFN5_n42));
   HS65_LS_NAND3X6 U40 (.Z(n35), 
	.C(n38), 
	.B(n37), 
	.A(n36));
   HS65_LS_NAND2X7 U41 (.Z(n36), 
	.B(n33), 
	.A(n32));
   HS65_LS_NOR2X6 U42 (.Z(N15), 
	.B(n35), 
	.A(n33));
   HS65_LS_NOR2X6 U43 (.Z(N13), 
	.B(n37), 
	.A(FE_OFN1015_n42));
   HS65_LS_NOR2X6 U44 (.Z(data_out[30]), 
	.B(n3), 
	.A(n1));
   HS65_LS_NOR2X6 U45 (.Z(data_out[31]), 
	.B(n2), 
	.A(n1));
   HS65_LS_IVX9 U47 (.Z(n33), 
	.A(data_in[0]));
   HS65_LS_NAND2X7 U48 (.Z(n37), 
	.B(n32), 
	.A(data_in[0]));
   HS65_LS_IVX9 U49 (.Z(n32), 
	.A(data_in[1]));
   HS65_LS_IVX9 U50 (.Z(n24), 
	.A(data_in[9]));
   HS65_LS_IVX9 U51 (.Z(n31), 
	.A(data_in[2]));
   HS65_LS_IVX9 U52 (.Z(n30), 
	.A(data_in[3]));
   HS65_LS_IVX9 U53 (.Z(n29), 
	.A(data_in[4]));
   HS65_LS_IVX9 U54 (.Z(n28), 
	.A(data_in[5]));
   HS65_LS_IVX9 U55 (.Z(n27), 
	.A(data_in[6]));
   HS65_LS_IVX9 U56 (.Z(n26), 
	.A(data_in[7]));
   HS65_LS_IVX9 U57 (.Z(n25), 
	.A(data_in[8]));
   HS65_LS_IVX9 U58 (.Z(n23), 
	.A(data_in[10]));
   HS65_LS_IVX9 U59 (.Z(n22), 
	.A(data_in[11]));
   HS65_LS_IVX9 U60 (.Z(n21), 
	.A(data_in[12]));
   HS65_LS_IVX9 U61 (.Z(n20), 
	.A(data_in[13]));
   HS65_LS_IVX9 U62 (.Z(n19), 
	.A(data_in[14]));
   HS65_LS_IVX9 U63 (.Z(n18), 
	.A(data_in[15]));
   HS65_LS_IVX9 U64 (.Z(n17), 
	.A(data_in[16]));
   HS65_LS_IVX9 U65 (.Z(n16), 
	.A(data_in[17]));
   HS65_LS_IVX9 U66 (.Z(n15), 
	.A(data_in[18]));
   HS65_LS_IVX9 U67 (.Z(n14), 
	.A(data_in[19]));
   HS65_LS_IVX9 U68 (.Z(n13), 
	.A(data_in[20]));
   HS65_LS_IVX9 U69 (.Z(n12), 
	.A(data_in[21]));
   HS65_LS_IVX9 U70 (.Z(n11), 
	.A(data_in[22]));
   HS65_LS_IVX9 U71 (.Z(n10), 
	.A(data_in[23]));
   HS65_LS_IVX9 U72 (.Z(n9), 
	.A(data_in[24]));
   HS65_LS_IVX9 U73 (.Z(n8), 
	.A(data_in[25]));
   HS65_LS_IVX9 U74 (.Z(n7), 
	.A(data_in[26]));
   HS65_LS_IVX9 U75 (.Z(n6), 
	.A(data_in[27]));
   HS65_LS_IVX9 U76 (.Z(n5), 
	.A(data_in[28]));
   HS65_LS_IVX9 U77 (.Z(n4), 
	.A(data_in[29]));
   HS65_LS_IVX9 U78 (.Z(n3), 
	.A(data_in[30]));
   HS65_LS_IVX9 U79 (.Z(n2), 
	.A(data_in[31]));
   HS65_LS_NOR2X6 U80 (.Z(N14), 
	.B(n35), 
	.A(data_in[0]));
   HS65_LS_NOR2AX3 U81 (.Z(N16), 
	.B(data_in[32]), 
	.A(data_valid));
endmodule

module sr_latch_0_1 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire N1;
   wire n1;

   HS65_LS_AND2X4 C8 (.Z(q), 
	.B(N1), 
	.A(n1));
   HS65_LS_IVX9 U1 (.Z(N1), 
	.A(qn));
   HS65_LS_IVX9 U2 (.Z(n1), 
	.A(r));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_0_1 (
	preset, 
	a, 
	b, 
	c);
   input preset;
   input a;
   input b;
   output c;

   // Internal wires
   wire set;
   wire reset;
   wire n1;

   sr_latch_0_1 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_OAI21X3 U3 (.Z(reset), 
	.C(n1), 
	.B(a), 
	.A(b));
   HS65_LS_IVX9 U4 (.Z(n1), 
	.A(preset));
   HS65_LS_AND3X9 U5 (.Z(set), 
	.C(a), 
	.B(n1), 
	.A(b));
endmodule

module latch_controller_1_1 (
	preset, 
	Rin, 
	Aout, 
	Rout, 
	Ain, 
	lt_en);
   input preset;
   input Rin;
   output Aout;
   output Rout;
   input Ain;
   output lt_en;

   // Internal wires
   wire FE_PHN1430_d;
   wire FE_PHN1396_d;
   wire not_Ain;
   wire d;

   HS65_LH_BFX9 FE_PHC1430_d (.Z(FE_PHN1396_d), 
	.A(FE_PHN1430_d));
   HS65_LH_DLYIC4X9 FE_PHC1396_d (.Z(FE_PHN1430_d), 
	.A(d));
   c_gate_0_1 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Rout));
   HS65_LS_IVX9 I_0 (.Z(not_Ain), 
	.A(Ain));
   HS65_LS_IVX9 I_2 (.Z(d), 
	.A(Rout));
   HS65_LS_IVX9 I_1 (.Z(Aout), 
	.A(FE_PHN1396_d));
   HS65_LSS_XOR2X6 U11 (.Z(lt_en), 
	.B(Ain), 
	.A(Rout));
endmodule

module channel_latch_1_xxxxxxxxx_1 (
	preset, 
	.left_in ( { \left_in[REQ] , 
		\left_in[DATA][33] , 
		\left_in[DATA][32] , 
		\left_in[DATA][31] , 
		\left_in[DATA][30] , 
		\left_in[DATA][29] , 
		\left_in[DATA][28] , 
		\left_in[DATA][27] , 
		\left_in[DATA][26] , 
		\left_in[DATA][25] , 
		\left_in[DATA][24] , 
		\left_in[DATA][23] , 
		\left_in[DATA][22] , 
		\left_in[DATA][21] , 
		\left_in[DATA][20] , 
		\left_in[DATA][19] , 
		\left_in[DATA][18] , 
		\left_in[DATA][17] , 
		\left_in[DATA][16] , 
		\left_in[DATA][15] , 
		\left_in[DATA][14] , 
		\left_in[DATA][13] , 
		\left_in[DATA][12] , 
		\left_in[DATA][11] , 
		\left_in[DATA][10] , 
		\left_in[DATA][9] , 
		\left_in[DATA][8] , 
		\left_in[DATA][7] , 
		\left_in[DATA][6] , 
		\left_in[DATA][5] , 
		\left_in[DATA][4] , 
		\left_in[DATA][3] , 
		\left_in[DATA][2] , 
		\left_in[DATA][1] , 
		\left_in[DATA][0]  } ), 
	.left_out ( \left_out[ACK]  ), 
	.right_out ( { \right_out[REQ] , 
		\right_out[DATA][33] , 
		\right_out[DATA][32] , 
		\right_out[DATA][31] , 
		\right_out[DATA][30] , 
		\right_out[DATA][29] , 
		\right_out[DATA][28] , 
		\right_out[DATA][27] , 
		\right_out[DATA][26] , 
		\right_out[DATA][25] , 
		\right_out[DATA][24] , 
		\right_out[DATA][23] , 
		\right_out[DATA][22] , 
		\right_out[DATA][21] , 
		\right_out[DATA][20] , 
		\right_out[DATA][19] , 
		\right_out[DATA][18] , 
		\right_out[DATA][17] , 
		\right_out[DATA][16] , 
		\right_out[DATA][15] , 
		\right_out[DATA][14] , 
		\right_out[DATA][13] , 
		\right_out[DATA][12] , 
		\right_out[DATA][11] , 
		\right_out[DATA][10] , 
		\right_out[DATA][9] , 
		\right_out[DATA][8] , 
		\right_out[DATA][7] , 
		\right_out[DATA][6] , 
		\right_out[DATA][5] , 
		\right_out[DATA][4] , 
		\right_out[DATA][3] , 
		\right_out[DATA][2] , 
		\right_out[DATA][1] , 
		\right_out[DATA][0]  } ), 
	.right_in ( \right_in[ACK]  ));
   input preset;
   input \left_in[REQ] ;
   input \left_in[DATA][33] ;
   input \left_in[DATA][32] ;
   input \left_in[DATA][31] ;
   input \left_in[DATA][30] ;
   input \left_in[DATA][29] ;
   input \left_in[DATA][28] ;
   input \left_in[DATA][27] ;
   input \left_in[DATA][26] ;
   input \left_in[DATA][25] ;
   input \left_in[DATA][24] ;
   input \left_in[DATA][23] ;
   input \left_in[DATA][22] ;
   input \left_in[DATA][21] ;
   input \left_in[DATA][20] ;
   input \left_in[DATA][19] ;
   input \left_in[DATA][18] ;
   input \left_in[DATA][17] ;
   input \left_in[DATA][16] ;
   input \left_in[DATA][15] ;
   input \left_in[DATA][14] ;
   input \left_in[DATA][13] ;
   input \left_in[DATA][12] ;
   input \left_in[DATA][11] ;
   input \left_in[DATA][10] ;
   input \left_in[DATA][9] ;
   input \left_in[DATA][8] ;
   input \left_in[DATA][7] ;
   input \left_in[DATA][6] ;
   input \left_in[DATA][5] ;
   input \left_in[DATA][4] ;
   input \left_in[DATA][3] ;
   input \left_in[DATA][2] ;
   input \left_in[DATA][1] ;
   input \left_in[DATA][0] ;
   output \left_out[ACK] ;
   output \right_out[REQ] ;
   output \right_out[DATA][33] ;
   output \right_out[DATA][32] ;
   output \right_out[DATA][31] ;
   output \right_out[DATA][30] ;
   output \right_out[DATA][29] ;
   output \right_out[DATA][28] ;
   output \right_out[DATA][27] ;
   output \right_out[DATA][26] ;
   output \right_out[DATA][25] ;
   output \right_out[DATA][24] ;
   output \right_out[DATA][23] ;
   output \right_out[DATA][22] ;
   output \right_out[DATA][21] ;
   output \right_out[DATA][20] ;
   output \right_out[DATA][19] ;
   output \right_out[DATA][18] ;
   output \right_out[DATA][17] ;
   output \right_out[DATA][16] ;
   output \right_out[DATA][15] ;
   output \right_out[DATA][14] ;
   output \right_out[DATA][13] ;
   output \right_out[DATA][12] ;
   output \right_out[DATA][11] ;
   output \right_out[DATA][10] ;
   output \right_out[DATA][9] ;
   output \right_out[DATA][8] ;
   output \right_out[DATA][7] ;
   output \right_out[DATA][6] ;
   output \right_out[DATA][5] ;
   output \right_out[DATA][4] ;
   output \right_out[DATA][3] ;
   output \right_out[DATA][2] ;
   output \right_out[DATA][1] ;
   output \right_out[DATA][0] ;
   input \right_in[ACK] ;

   // Internal wires
   wire lt_en;
   wire N3;

   latch_controller_1_1 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX9 \data_reg[33]  (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(\left_in[DATA][33] ));
   HS65_LS_LDHQX9 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(\left_in[DATA][32] ));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(N3), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(N3), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(N3), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(N3), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(N3), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(N3), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(N3), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(N3), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(N3), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(N3), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(N3), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(N3), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(N3), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(N3), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(N3), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHQX9 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHQX9 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3), 
	.D(\left_in[DATA][0] ));
   HS65_LS_NAND2AX7 U3 (.Z(N3), 
	.B(lt_en), 
	.A(preset));
endmodule

module hpu_1_x (
	preset, 
	.chan_in_f ( { \chan_in_f[REQ] , 
		\chan_in_f[DATA][33] , 
		\chan_in_f[DATA][32] , 
		\chan_in_f[DATA][31] , 
		\chan_in_f[DATA][30] , 
		\chan_in_f[DATA][29] , 
		\chan_in_f[DATA][28] , 
		\chan_in_f[DATA][27] , 
		\chan_in_f[DATA][26] , 
		\chan_in_f[DATA][25] , 
		\chan_in_f[DATA][24] , 
		\chan_in_f[DATA][23] , 
		\chan_in_f[DATA][22] , 
		\chan_in_f[DATA][21] , 
		\chan_in_f[DATA][20] , 
		\chan_in_f[DATA][19] , 
		\chan_in_f[DATA][18] , 
		\chan_in_f[DATA][17] , 
		\chan_in_f[DATA][16] , 
		\chan_in_f[DATA][15] , 
		\chan_in_f[DATA][14] , 
		\chan_in_f[DATA][13] , 
		\chan_in_f[DATA][12] , 
		\chan_in_f[DATA][11] , 
		\chan_in_f[DATA][10] , 
		\chan_in_f[DATA][9] , 
		\chan_in_f[DATA][8] , 
		\chan_in_f[DATA][7] , 
		\chan_in_f[DATA][6] , 
		\chan_in_f[DATA][5] , 
		\chan_in_f[DATA][4] , 
		\chan_in_f[DATA][3] , 
		\chan_in_f[DATA][2] , 
		\chan_in_f[DATA][1] , 
		\chan_in_f[DATA][0]  } ), 
	.chan_in_b ( \chan_in_b[ACK]  ), 
	.chan_out_f ( { \chan_out_f[REQ] , 
		\chan_out_f[DATA][33] , 
		\chan_out_f[DATA][32] , 
		\chan_out_f[DATA][31] , 
		\chan_out_f[DATA][30] , 
		\chan_out_f[DATA][29] , 
		\chan_out_f[DATA][28] , 
		\chan_out_f[DATA][27] , 
		\chan_out_f[DATA][26] , 
		\chan_out_f[DATA][25] , 
		\chan_out_f[DATA][24] , 
		\chan_out_f[DATA][23] , 
		\chan_out_f[DATA][22] , 
		\chan_out_f[DATA][21] , 
		\chan_out_f[DATA][20] , 
		\chan_out_f[DATA][19] , 
		\chan_out_f[DATA][18] , 
		\chan_out_f[DATA][17] , 
		\chan_out_f[DATA][16] , 
		\chan_out_f[DATA][15] , 
		\chan_out_f[DATA][14] , 
		\chan_out_f[DATA][13] , 
		\chan_out_f[DATA][12] , 
		\chan_out_f[DATA][11] , 
		\chan_out_f[DATA][10] , 
		\chan_out_f[DATA][9] , 
		\chan_out_f[DATA][8] , 
		\chan_out_f[DATA][7] , 
		\chan_out_f[DATA][6] , 
		\chan_out_f[DATA][5] , 
		\chan_out_f[DATA][4] , 
		\chan_out_f[DATA][3] , 
		\chan_out_f[DATA][2] , 
		\chan_out_f[DATA][1] , 
		\chan_out_f[DATA][0]  } ), 
	.chan_out_b ( \chan_out_b[ACK]  ), 
	sel);
   input preset;
   input \chan_in_f[REQ] ;
   input \chan_in_f[DATA][33] ;
   input \chan_in_f[DATA][32] ;
   input \chan_in_f[DATA][31] ;
   input \chan_in_f[DATA][30] ;
   input \chan_in_f[DATA][29] ;
   input \chan_in_f[DATA][28] ;
   input \chan_in_f[DATA][27] ;
   input \chan_in_f[DATA][26] ;
   input \chan_in_f[DATA][25] ;
   input \chan_in_f[DATA][24] ;
   input \chan_in_f[DATA][23] ;
   input \chan_in_f[DATA][22] ;
   input \chan_in_f[DATA][21] ;
   input \chan_in_f[DATA][20] ;
   input \chan_in_f[DATA][19] ;
   input \chan_in_f[DATA][18] ;
   input \chan_in_f[DATA][17] ;
   input \chan_in_f[DATA][16] ;
   input \chan_in_f[DATA][15] ;
   input \chan_in_f[DATA][14] ;
   input \chan_in_f[DATA][13] ;
   input \chan_in_f[DATA][12] ;
   input \chan_in_f[DATA][11] ;
   input \chan_in_f[DATA][10] ;
   input \chan_in_f[DATA][9] ;
   input \chan_in_f[DATA][8] ;
   input \chan_in_f[DATA][7] ;
   input \chan_in_f[DATA][6] ;
   input \chan_in_f[DATA][5] ;
   input \chan_in_f[DATA][4] ;
   input \chan_in_f[DATA][3] ;
   input \chan_in_f[DATA][2] ;
   input \chan_in_f[DATA][1] ;
   input \chan_in_f[DATA][0] ;
   output \chan_in_b[ACK] ;
   output \chan_out_f[REQ] ;
   output \chan_out_f[DATA][33] ;
   output \chan_out_f[DATA][32] ;
   output \chan_out_f[DATA][31] ;
   output \chan_out_f[DATA][30] ;
   output \chan_out_f[DATA][29] ;
   output \chan_out_f[DATA][28] ;
   output \chan_out_f[DATA][27] ;
   output \chan_out_f[DATA][26] ;
   output \chan_out_f[DATA][25] ;
   output \chan_out_f[DATA][24] ;
   output \chan_out_f[DATA][23] ;
   output \chan_out_f[DATA][22] ;
   output \chan_out_f[DATA][21] ;
   output \chan_out_f[DATA][20] ;
   output \chan_out_f[DATA][19] ;
   output \chan_out_f[DATA][18] ;
   output \chan_out_f[DATA][17] ;
   output \chan_out_f[DATA][16] ;
   output \chan_out_f[DATA][15] ;
   output \chan_out_f[DATA][14] ;
   output \chan_out_f[DATA][13] ;
   output \chan_out_f[DATA][12] ;
   output \chan_out_f[DATA][11] ;
   output \chan_out_f[DATA][10] ;
   output \chan_out_f[DATA][9] ;
   output \chan_out_f[DATA][8] ;
   output \chan_out_f[DATA][7] ;
   output \chan_out_f[DATA][6] ;
   output \chan_out_f[DATA][5] ;
   output \chan_out_f[DATA][4] ;
   output \chan_out_f[DATA][3] ;
   output \chan_out_f[DATA][2] ;
   output \chan_out_f[DATA][1] ;
   output \chan_out_f[DATA][0] ;
   input \chan_out_b[ACK] ;
   output [4:0] sel;

   // Internal wires
   wire FE_PHN1469_req_n;
   wire FE_PHN1463_req_n;
   wire FE_PHN1429_req_n;
   wire \chan_internal_f[REQ] ;
   wire \chan_internal_f[DATA][33] ;
   wire \chan_internal_f[DATA][32] ;
   wire \chan_internal_f[DATA][31] ;
   wire \chan_internal_f[DATA][30] ;
   wire \chan_internal_f[DATA][29] ;
   wire \chan_internal_f[DATA][28] ;
   wire \chan_internal_f[DATA][27] ;
   wire \chan_internal_f[DATA][26] ;
   wire \chan_internal_f[DATA][25] ;
   wire \chan_internal_f[DATA][24] ;
   wire \chan_internal_f[DATA][23] ;
   wire \chan_internal_f[DATA][22] ;
   wire \chan_internal_f[DATA][21] ;
   wire \chan_internal_f[DATA][20] ;
   wire \chan_internal_f[DATA][19] ;
   wire \chan_internal_f[DATA][18] ;
   wire \chan_internal_f[DATA][17] ;
   wire \chan_internal_f[DATA][16] ;
   wire \chan_internal_f[DATA][15] ;
   wire \chan_internal_f[DATA][14] ;
   wire \chan_internal_f[DATA][13] ;
   wire \chan_internal_f[DATA][12] ;
   wire \chan_internal_f[DATA][11] ;
   wire \chan_internal_f[DATA][10] ;
   wire \chan_internal_f[DATA][9] ;
   wire \chan_internal_f[DATA][8] ;
   wire \chan_internal_f[DATA][7] ;
   wire \chan_internal_f[DATA][6] ;
   wire \chan_internal_f[DATA][5] ;
   wire \chan_internal_f[DATA][4] ;
   wire \chan_internal_f[DATA][3] ;
   wire \chan_internal_f[DATA][2] ;
   wire \chan_internal_f[DATA][1] ;
   wire \chan_internal_f[DATA][0] ;
   wire data_in_valid;
   wire req_n;

   HS65_LS_BFX7 FE_PHC1469_req_n (.Z(FE_PHN1469_req_n), 
	.A(FE_PHN1429_req_n));
   HS65_LS_BFX7 FE_PHC1463_req_n (.Z(FE_PHN1463_req_n), 
	.A(FE_PHN1469_req_n));
   HS65_LS_BFX7 FE_PHC1429_req_n (.Z(FE_PHN1429_req_n), 
	.A(req_n));
   hpu_comb_1_x hpu_combinatorial (.data_valid(data_in_valid), 
	.data_in({ \chan_in_f[DATA][33] ,
		\chan_in_f[DATA][32] ,
		\chan_in_f[DATA][31] ,
		\chan_in_f[DATA][30] ,
		\chan_in_f[DATA][29] ,
		\chan_in_f[DATA][28] ,
		\chan_in_f[DATA][27] ,
		\chan_in_f[DATA][26] ,
		\chan_in_f[DATA][25] ,
		\chan_in_f[DATA][24] ,
		\chan_in_f[DATA][23] ,
		\chan_in_f[DATA][22] ,
		\chan_in_f[DATA][21] ,
		\chan_in_f[DATA][20] ,
		\chan_in_f[DATA][19] ,
		\chan_in_f[DATA][18] ,
		\chan_in_f[DATA][17] ,
		\chan_in_f[DATA][16] ,
		\chan_in_f[DATA][15] ,
		\chan_in_f[DATA][14] ,
		\chan_in_f[DATA][13] ,
		\chan_in_f[DATA][12] ,
		\chan_in_f[DATA][11] ,
		\chan_in_f[DATA][10] ,
		\chan_in_f[DATA][9] ,
		\chan_in_f[DATA][8] ,
		\chan_in_f[DATA][7] ,
		\chan_in_f[DATA][6] ,
		\chan_in_f[DATA][5] ,
		\chan_in_f[DATA][4] ,
		\chan_in_f[DATA][3] ,
		\chan_in_f[DATA][2] ,
		\chan_in_f[DATA][1] ,
		\chan_in_f[DATA][0]  }), 
	.data_out({ \chan_internal_f[DATA][33] ,
		\chan_internal_f[DATA][32] ,
		\chan_internal_f[DATA][31] ,
		\chan_internal_f[DATA][30] ,
		\chan_internal_f[DATA][29] ,
		\chan_internal_f[DATA][28] ,
		\chan_internal_f[DATA][27] ,
		\chan_internal_f[DATA][26] ,
		\chan_internal_f[DATA][25] ,
		\chan_internal_f[DATA][24] ,
		\chan_internal_f[DATA][23] ,
		\chan_internal_f[DATA][22] ,
		\chan_internal_f[DATA][21] ,
		\chan_internal_f[DATA][20] ,
		\chan_internal_f[DATA][19] ,
		\chan_internal_f[DATA][18] ,
		\chan_internal_f[DATA][17] ,
		\chan_internal_f[DATA][16] ,
		\chan_internal_f[DATA][15] ,
		\chan_internal_f[DATA][14] ,
		\chan_internal_f[DATA][13] ,
		\chan_internal_f[DATA][12] ,
		\chan_internal_f[DATA][11] ,
		\chan_internal_f[DATA][10] ,
		\chan_internal_f[DATA][9] ,
		\chan_internal_f[DATA][8] ,
		\chan_internal_f[DATA][7] ,
		\chan_internal_f[DATA][6] ,
		\chan_internal_f[DATA][5] ,
		\chan_internal_f[DATA][4] ,
		\chan_internal_f[DATA][3] ,
		\chan_internal_f[DATA][2] ,
		\chan_internal_f[DATA][1] ,
		\chan_internal_f[DATA][0]  }), 
	.sel({ sel[4],
		sel[3],
		sel[2],
		sel[1],
		sel[0] }));
   channel_latch_1_xxxxxxxxx_1 token_latch (.preset(preset), 
	.left_in({ \chan_internal_f[REQ] ,
		\chan_internal_f[DATA][33] ,
		\chan_internal_f[DATA][32] ,
		\chan_internal_f[DATA][31] ,
		\chan_internal_f[DATA][30] ,
		\chan_internal_f[DATA][29] ,
		\chan_internal_f[DATA][28] ,
		\chan_internal_f[DATA][27] ,
		\chan_internal_f[DATA][26] ,
		\chan_internal_f[DATA][25] ,
		\chan_internal_f[DATA][24] ,
		\chan_internal_f[DATA][23] ,
		\chan_internal_f[DATA][22] ,
		\chan_internal_f[DATA][21] ,
		\chan_internal_f[DATA][20] ,
		\chan_internal_f[DATA][19] ,
		\chan_internal_f[DATA][18] ,
		\chan_internal_f[DATA][17] ,
		\chan_internal_f[DATA][16] ,
		\chan_internal_f[DATA][15] ,
		\chan_internal_f[DATA][14] ,
		\chan_internal_f[DATA][13] ,
		\chan_internal_f[DATA][12] ,
		\chan_internal_f[DATA][11] ,
		\chan_internal_f[DATA][10] ,
		\chan_internal_f[DATA][9] ,
		\chan_internal_f[DATA][8] ,
		\chan_internal_f[DATA][7] ,
		\chan_internal_f[DATA][6] ,
		\chan_internal_f[DATA][5] ,
		\chan_internal_f[DATA][4] ,
		\chan_internal_f[DATA][3] ,
		\chan_internal_f[DATA][2] ,
		\chan_internal_f[DATA][1] ,
		\chan_internal_f[DATA][0]  }), 
	.left_out(\chan_in_b[ACK] ), 
	.right_out({ \chan_out_f[REQ] ,
		\chan_out_f[DATA][33] ,
		\chan_out_f[DATA][32] ,
		\chan_out_f[DATA][31] ,
		\chan_out_f[DATA][30] ,
		\chan_out_f[DATA][29] ,
		\chan_out_f[DATA][28] ,
		\chan_out_f[DATA][27] ,
		\chan_out_f[DATA][26] ,
		\chan_out_f[DATA][25] ,
		\chan_out_f[DATA][24] ,
		\chan_out_f[DATA][23] ,
		\chan_out_f[DATA][22] ,
		\chan_out_f[DATA][21] ,
		\chan_out_f[DATA][20] ,
		\chan_out_f[DATA][19] ,
		\chan_out_f[DATA][18] ,
		\chan_out_f[DATA][17] ,
		\chan_out_f[DATA][16] ,
		\chan_out_f[DATA][15] ,
		\chan_out_f[DATA][14] ,
		\chan_out_f[DATA][13] ,
		\chan_out_f[DATA][12] ,
		\chan_out_f[DATA][11] ,
		\chan_out_f[DATA][10] ,
		\chan_out_f[DATA][9] ,
		\chan_out_f[DATA][8] ,
		\chan_out_f[DATA][7] ,
		\chan_out_f[DATA][6] ,
		\chan_out_f[DATA][5] ,
		\chan_out_f[DATA][4] ,
		\chan_out_f[DATA][3] ,
		\chan_out_f[DATA][2] ,
		\chan_out_f[DATA][1] ,
		\chan_out_f[DATA][0]  }), 
	.right_in(\chan_out_b[ACK] ));
   HS65_LS_IVX9 I_1 (.Z(\chan_internal_f[REQ] ), 
	.A(FE_PHN1463_req_n));
   HS65_LH_IVX2 I_0 (.Z(req_n), 
	.A(\chan_in_f[REQ] ));
   HS65_LSS_XOR2X6 U7 (.Z(data_in_valid), 
	.B(\chan_in_b[ACK] ), 
	.A(\chan_internal_f[REQ] ));
endmodule

module sr_latch_1_0 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire N1;
   wire n2;

   HS65_LH_AND2X4 C8 (.Z(q), 
	.B(N1), 
	.A(n2));
   HS65_LS_NOR2X6 U1 (.Z(qn), 
	.B(q), 
	.A(s));
   HS65_LS_IVX9 U2 (.Z(n2), 
	.A(r));
   HS65_LS_IVX9 U3 (.Z(N1), 
	.A(qn));
endmodule

module c_gate_generic_1_5_0 (
	preset, 
	\input , 
	\output );
   input preset;
   input [4:0] \input ;
   output \output ;

   // Internal wires
   wire set;
   wire reset;
   wire n1;
   wire n2;
   wire n3;

   sr_latch_1_0 latch (.s(set), 
	.r(reset), 
	.q(\output ));
   HS65_LS_NOR4ABX2 U3 (.Z(reset), 
	.D(\input [1]), 
	.C(\input [2]), 
	.B(n3), 
	.A(n1));
   HS65_LS_NOR3X4 U4 (.Z(n3), 
	.C(\input [4]), 
	.B(preset), 
	.A(\input [3]));
   HS65_LS_AO31X9 U5 (.Z(set), 
	.D(preset), 
	.C(\input [4]), 
	.B(\input [3]), 
	.A(n2));
   HS65_LS_AND3X9 U6 (.Z(n2), 
	.C(\input [2]), 
	.B(\input [0]), 
	.A(\input [1]));
   HS65_LS_IVX9 U7 (.Z(n1), 
	.A(\input [0]));
endmodule

module sr_latch_1_1 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire N1;
   wire n1;

   HS65_LS_AND2X9 C8 (.Z(q), 
	.B(N1), 
	.A(n1));
   HS65_LS_IVX9 U1 (.Z(N1), 
	.A(qn));
   HS65_LS_IVX9 U2 (.Z(n1), 
	.A(r));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_generic_1_5_1 (
	preset, 
	\input , 
	\output );
   input preset;
   input [4:0] \input ;
   output \output ;

   // Internal wires
   wire set;
   wire reset;
   wire n4;
   wire n5;
   wire n6;

   sr_latch_1_1 latch (.s(set), 
	.r(reset), 
	.q(\output ));
   HS65_LS_NOR4ABX2 U3 (.Z(reset), 
	.D(\input [1]), 
	.C(\input [2]), 
	.B(n4), 
	.A(n6));
   HS65_LS_IVX9 U4 (.Z(n6), 
	.A(\input [0]));
   HS65_LS_NOR3X4 U5 (.Z(n4), 
	.C(\input [4]), 
	.B(preset), 
	.A(\input [3]));
   HS65_LS_AO31X9 U6 (.Z(set), 
	.D(preset), 
	.C(\input [4]), 
	.B(\input [3]), 
	.A(n5));
   HS65_LS_AND3X9 U7 (.Z(n5), 
	.C(\input [2]), 
	.B(\input [0]), 
	.A(\input [1]));
endmodule

module crossbar_x0_y0 (
	preset, 
	.switch_sel ( { \switch_sel[4][4] , 
		\switch_sel[4][3] , 
		\switch_sel[4][2] , 
		\switch_sel[4][1] , 
		\switch_sel[4][0] , 
		\switch_sel[3][4] , 
		\switch_sel[3][3] , 
		\switch_sel[3][2] , 
		\switch_sel[3][1] , 
		\switch_sel[3][0] , 
		\switch_sel[2][4] , 
		\switch_sel[2][3] , 
		\switch_sel[2][2] , 
		\switch_sel[2][1] , 
		\switch_sel[2][0] , 
		\switch_sel[1][4] , 
		\switch_sel[1][3] , 
		\switch_sel[1][2] , 
		\switch_sel[1][1] , 
		\switch_sel[1][0] , 
		\switch_sel[0][4] , 
		\switch_sel[0][3] , 
		\switch_sel[0][2] , 
		\switch_sel[0][1] , 
		\switch_sel[0][0]  } ), 
	.chs_in_f ( { \chs_in_f[4][REQ] , 
		\chs_in_f[4][DATA][33] , 
		\chs_in_f[4][DATA][32] , 
		\chs_in_f[4][DATA][31] , 
		\chs_in_f[4][DATA][30] , 
		\chs_in_f[4][DATA][29] , 
		\chs_in_f[4][DATA][28] , 
		\chs_in_f[4][DATA][27] , 
		\chs_in_f[4][DATA][26] , 
		\chs_in_f[4][DATA][25] , 
		\chs_in_f[4][DATA][24] , 
		\chs_in_f[4][DATA][23] , 
		\chs_in_f[4][DATA][22] , 
		\chs_in_f[4][DATA][21] , 
		\chs_in_f[4][DATA][20] , 
		\chs_in_f[4][DATA][19] , 
		\chs_in_f[4][DATA][18] , 
		\chs_in_f[4][DATA][17] , 
		\chs_in_f[4][DATA][16] , 
		\chs_in_f[4][DATA][15] , 
		\chs_in_f[4][DATA][14] , 
		\chs_in_f[4][DATA][13] , 
		\chs_in_f[4][DATA][12] , 
		\chs_in_f[4][DATA][11] , 
		\chs_in_f[4][DATA][10] , 
		\chs_in_f[4][DATA][9] , 
		\chs_in_f[4][DATA][8] , 
		\chs_in_f[4][DATA][7] , 
		\chs_in_f[4][DATA][6] , 
		\chs_in_f[4][DATA][5] , 
		\chs_in_f[4][DATA][4] , 
		\chs_in_f[4][DATA][3] , 
		\chs_in_f[4][DATA][2] , 
		\chs_in_f[4][DATA][1] , 
		\chs_in_f[4][DATA][0] , 
		\chs_in_f[3][REQ] , 
		\chs_in_f[3][DATA][33] , 
		\chs_in_f[3][DATA][32] , 
		\chs_in_f[3][DATA][31] , 
		\chs_in_f[3][DATA][30] , 
		\chs_in_f[3][DATA][29] , 
		\chs_in_f[3][DATA][28] , 
		\chs_in_f[3][DATA][27] , 
		\chs_in_f[3][DATA][26] , 
		\chs_in_f[3][DATA][25] , 
		\chs_in_f[3][DATA][24] , 
		\chs_in_f[3][DATA][23] , 
		\chs_in_f[3][DATA][22] , 
		\chs_in_f[3][DATA][21] , 
		\chs_in_f[3][DATA][20] , 
		\chs_in_f[3][DATA][19] , 
		\chs_in_f[3][DATA][18] , 
		\chs_in_f[3][DATA][17] , 
		\chs_in_f[3][DATA][16] , 
		\chs_in_f[3][DATA][15] , 
		\chs_in_f[3][DATA][14] , 
		\chs_in_f[3][DATA][13] , 
		\chs_in_f[3][DATA][12] , 
		\chs_in_f[3][DATA][11] , 
		\chs_in_f[3][DATA][10] , 
		\chs_in_f[3][DATA][9] , 
		\chs_in_f[3][DATA][8] , 
		\chs_in_f[3][DATA][7] , 
		\chs_in_f[3][DATA][6] , 
		\chs_in_f[3][DATA][5] , 
		\chs_in_f[3][DATA][4] , 
		\chs_in_f[3][DATA][3] , 
		\chs_in_f[3][DATA][2] , 
		\chs_in_f[3][DATA][1] , 
		\chs_in_f[3][DATA][0] , 
		\chs_in_f[2][REQ] , 
		\chs_in_f[2][DATA][33] , 
		\chs_in_f[2][DATA][32] , 
		\chs_in_f[2][DATA][31] , 
		\chs_in_f[2][DATA][30] , 
		\chs_in_f[2][DATA][29] , 
		\chs_in_f[2][DATA][28] , 
		\chs_in_f[2][DATA][27] , 
		\chs_in_f[2][DATA][26] , 
		\chs_in_f[2][DATA][25] , 
		\chs_in_f[2][DATA][24] , 
		\chs_in_f[2][DATA][23] , 
		\chs_in_f[2][DATA][22] , 
		\chs_in_f[2][DATA][21] , 
		\chs_in_f[2][DATA][20] , 
		\chs_in_f[2][DATA][19] , 
		\chs_in_f[2][DATA][18] , 
		\chs_in_f[2][DATA][17] , 
		\chs_in_f[2][DATA][16] , 
		\chs_in_f[2][DATA][15] , 
		\chs_in_f[2][DATA][14] , 
		\chs_in_f[2][DATA][13] , 
		\chs_in_f[2][DATA][12] , 
		\chs_in_f[2][DATA][11] , 
		\chs_in_f[2][DATA][10] , 
		\chs_in_f[2][DATA][9] , 
		\chs_in_f[2][DATA][8] , 
		\chs_in_f[2][DATA][7] , 
		\chs_in_f[2][DATA][6] , 
		\chs_in_f[2][DATA][5] , 
		\chs_in_f[2][DATA][4] , 
		\chs_in_f[2][DATA][3] , 
		\chs_in_f[2][DATA][2] , 
		\chs_in_f[2][DATA][1] , 
		\chs_in_f[2][DATA][0] , 
		\chs_in_f[1][REQ] , 
		\chs_in_f[1][DATA][33] , 
		\chs_in_f[1][DATA][32] , 
		\chs_in_f[1][DATA][31] , 
		\chs_in_f[1][DATA][30] , 
		\chs_in_f[1][DATA][29] , 
		\chs_in_f[1][DATA][28] , 
		\chs_in_f[1][DATA][27] , 
		\chs_in_f[1][DATA][26] , 
		\chs_in_f[1][DATA][25] , 
		\chs_in_f[1][DATA][24] , 
		\chs_in_f[1][DATA][23] , 
		\chs_in_f[1][DATA][22] , 
		\chs_in_f[1][DATA][21] , 
		\chs_in_f[1][DATA][20] , 
		\chs_in_f[1][DATA][19] , 
		\chs_in_f[1][DATA][18] , 
		\chs_in_f[1][DATA][17] , 
		\chs_in_f[1][DATA][16] , 
		\chs_in_f[1][DATA][15] , 
		\chs_in_f[1][DATA][14] , 
		\chs_in_f[1][DATA][13] , 
		\chs_in_f[1][DATA][12] , 
		\chs_in_f[1][DATA][11] , 
		\chs_in_f[1][DATA][10] , 
		\chs_in_f[1][DATA][9] , 
		\chs_in_f[1][DATA][8] , 
		\chs_in_f[1][DATA][7] , 
		\chs_in_f[1][DATA][6] , 
		\chs_in_f[1][DATA][5] , 
		\chs_in_f[1][DATA][4] , 
		\chs_in_f[1][DATA][3] , 
		\chs_in_f[1][DATA][2] , 
		\chs_in_f[1][DATA][1] , 
		\chs_in_f[1][DATA][0] , 
		\chs_in_f[0][REQ] , 
		\chs_in_f[0][DATA][33] , 
		\chs_in_f[0][DATA][32] , 
		\chs_in_f[0][DATA][31] , 
		\chs_in_f[0][DATA][30] , 
		\chs_in_f[0][DATA][29] , 
		\chs_in_f[0][DATA][28] , 
		\chs_in_f[0][DATA][27] , 
		\chs_in_f[0][DATA][26] , 
		\chs_in_f[0][DATA][25] , 
		\chs_in_f[0][DATA][24] , 
		\chs_in_f[0][DATA][23] , 
		\chs_in_f[0][DATA][22] , 
		\chs_in_f[0][DATA][21] , 
		\chs_in_f[0][DATA][20] , 
		\chs_in_f[0][DATA][19] , 
		\chs_in_f[0][DATA][18] , 
		\chs_in_f[0][DATA][17] , 
		\chs_in_f[0][DATA][16] , 
		\chs_in_f[0][DATA][15] , 
		\chs_in_f[0][DATA][14] , 
		\chs_in_f[0][DATA][13] , 
		\chs_in_f[0][DATA][12] , 
		\chs_in_f[0][DATA][11] , 
		\chs_in_f[0][DATA][10] , 
		\chs_in_f[0][DATA][9] , 
		\chs_in_f[0][DATA][8] , 
		\chs_in_f[0][DATA][7] , 
		\chs_in_f[0][DATA][6] , 
		\chs_in_f[0][DATA][5] , 
		\chs_in_f[0][DATA][4] , 
		\chs_in_f[0][DATA][3] , 
		\chs_in_f[0][DATA][2] , 
		\chs_in_f[0][DATA][1] , 
		\chs_in_f[0][DATA][0]  } ), 
	.chs_in_b ( { \chs_in_b[4][ACK] , 
		\chs_in_b[3][ACK] , 
		\chs_in_b[2][ACK] , 
		\chs_in_b[1][ACK] , 
		\chs_in_b[0][ACK]  } ), 
	.chs_out_f ( { \chs_out_f[4][REQ] , 
		\chs_out_f[4][DATA][33] , 
		\chs_out_f[4][DATA][32] , 
		\chs_out_f[4][DATA][31] , 
		\chs_out_f[4][DATA][30] , 
		\chs_out_f[4][DATA][29] , 
		\chs_out_f[4][DATA][28] , 
		\chs_out_f[4][DATA][27] , 
		\chs_out_f[4][DATA][26] , 
		\chs_out_f[4][DATA][25] , 
		\chs_out_f[4][DATA][24] , 
		\chs_out_f[4][DATA][23] , 
		\chs_out_f[4][DATA][22] , 
		\chs_out_f[4][DATA][21] , 
		\chs_out_f[4][DATA][20] , 
		\chs_out_f[4][DATA][19] , 
		\chs_out_f[4][DATA][18] , 
		\chs_out_f[4][DATA][17] , 
		\chs_out_f[4][DATA][16] , 
		\chs_out_f[4][DATA][15] , 
		\chs_out_f[4][DATA][14] , 
		\chs_out_f[4][DATA][13] , 
		\chs_out_f[4][DATA][12] , 
		\chs_out_f[4][DATA][11] , 
		\chs_out_f[4][DATA][10] , 
		\chs_out_f[4][DATA][9] , 
		\chs_out_f[4][DATA][8] , 
		\chs_out_f[4][DATA][7] , 
		\chs_out_f[4][DATA][6] , 
		\chs_out_f[4][DATA][5] , 
		\chs_out_f[4][DATA][4] , 
		\chs_out_f[4][DATA][3] , 
		\chs_out_f[4][DATA][2] , 
		\chs_out_f[4][DATA][1] , 
		\chs_out_f[4][DATA][0] , 
		\chs_out_f[3][REQ] , 
		\chs_out_f[3][DATA][33] , 
		\chs_out_f[3][DATA][32] , 
		\chs_out_f[3][DATA][31] , 
		\chs_out_f[3][DATA][30] , 
		\chs_out_f[3][DATA][29] , 
		\chs_out_f[3][DATA][28] , 
		\chs_out_f[3][DATA][27] , 
		\chs_out_f[3][DATA][26] , 
		\chs_out_f[3][DATA][25] , 
		\chs_out_f[3][DATA][24] , 
		\chs_out_f[3][DATA][23] , 
		\chs_out_f[3][DATA][22] , 
		\chs_out_f[3][DATA][21] , 
		\chs_out_f[3][DATA][20] , 
		\chs_out_f[3][DATA][19] , 
		\chs_out_f[3][DATA][18] , 
		\chs_out_f[3][DATA][17] , 
		\chs_out_f[3][DATA][16] , 
		\chs_out_f[3][DATA][15] , 
		\chs_out_f[3][DATA][14] , 
		\chs_out_f[3][DATA][13] , 
		\chs_out_f[3][DATA][12] , 
		\chs_out_f[3][DATA][11] , 
		\chs_out_f[3][DATA][10] , 
		\chs_out_f[3][DATA][9] , 
		\chs_out_f[3][DATA][8] , 
		\chs_out_f[3][DATA][7] , 
		\chs_out_f[3][DATA][6] , 
		\chs_out_f[3][DATA][5] , 
		\chs_out_f[3][DATA][4] , 
		\chs_out_f[3][DATA][3] , 
		\chs_out_f[3][DATA][2] , 
		\chs_out_f[3][DATA][1] , 
		\chs_out_f[3][DATA][0] , 
		\chs_out_f[2][REQ] , 
		\chs_out_f[2][DATA][33] , 
		\chs_out_f[2][DATA][32] , 
		\chs_out_f[2][DATA][31] , 
		\chs_out_f[2][DATA][30] , 
		\chs_out_f[2][DATA][29] , 
		\chs_out_f[2][DATA][28] , 
		\chs_out_f[2][DATA][27] , 
		\chs_out_f[2][DATA][26] , 
		\chs_out_f[2][DATA][25] , 
		\chs_out_f[2][DATA][24] , 
		\chs_out_f[2][DATA][23] , 
		\chs_out_f[2][DATA][22] , 
		\chs_out_f[2][DATA][21] , 
		\chs_out_f[2][DATA][20] , 
		\chs_out_f[2][DATA][19] , 
		\chs_out_f[2][DATA][18] , 
		\chs_out_f[2][DATA][17] , 
		\chs_out_f[2][DATA][16] , 
		\chs_out_f[2][DATA][15] , 
		\chs_out_f[2][DATA][14] , 
		\chs_out_f[2][DATA][13] , 
		\chs_out_f[2][DATA][12] , 
		\chs_out_f[2][DATA][11] , 
		\chs_out_f[2][DATA][10] , 
		\chs_out_f[2][DATA][9] , 
		\chs_out_f[2][DATA][8] , 
		\chs_out_f[2][DATA][7] , 
		\chs_out_f[2][DATA][6] , 
		\chs_out_f[2][DATA][5] , 
		\chs_out_f[2][DATA][4] , 
		\chs_out_f[2][DATA][3] , 
		\chs_out_f[2][DATA][2] , 
		\chs_out_f[2][DATA][1] , 
		\chs_out_f[2][DATA][0] , 
		\chs_out_f[1][REQ] , 
		\chs_out_f[1][DATA][33] , 
		\chs_out_f[1][DATA][32] , 
		\chs_out_f[1][DATA][31] , 
		\chs_out_f[1][DATA][30] , 
		\chs_out_f[1][DATA][29] , 
		\chs_out_f[1][DATA][28] , 
		\chs_out_f[1][DATA][27] , 
		\chs_out_f[1][DATA][26] , 
		\chs_out_f[1][DATA][25] , 
		\chs_out_f[1][DATA][24] , 
		\chs_out_f[1][DATA][23] , 
		\chs_out_f[1][DATA][22] , 
		\chs_out_f[1][DATA][21] , 
		\chs_out_f[1][DATA][20] , 
		\chs_out_f[1][DATA][19] , 
		\chs_out_f[1][DATA][18] , 
		\chs_out_f[1][DATA][17] , 
		\chs_out_f[1][DATA][16] , 
		\chs_out_f[1][DATA][15] , 
		\chs_out_f[1][DATA][14] , 
		\chs_out_f[1][DATA][13] , 
		\chs_out_f[1][DATA][12] , 
		\chs_out_f[1][DATA][11] , 
		\chs_out_f[1][DATA][10] , 
		\chs_out_f[1][DATA][9] , 
		\chs_out_f[1][DATA][8] , 
		\chs_out_f[1][DATA][7] , 
		\chs_out_f[1][DATA][6] , 
		\chs_out_f[1][DATA][5] , 
		\chs_out_f[1][DATA][4] , 
		\chs_out_f[1][DATA][3] , 
		\chs_out_f[1][DATA][2] , 
		\chs_out_f[1][DATA][1] , 
		\chs_out_f[1][DATA][0] , 
		\chs_out_f[0][REQ] , 
		\chs_out_f[0][DATA][33] , 
		\chs_out_f[0][DATA][32] , 
		\chs_out_f[0][DATA][31] , 
		\chs_out_f[0][DATA][30] , 
		\chs_out_f[0][DATA][29] , 
		\chs_out_f[0][DATA][28] , 
		\chs_out_f[0][DATA][27] , 
		\chs_out_f[0][DATA][26] , 
		\chs_out_f[0][DATA][25] , 
		\chs_out_f[0][DATA][24] , 
		\chs_out_f[0][DATA][23] , 
		\chs_out_f[0][DATA][22] , 
		\chs_out_f[0][DATA][21] , 
		\chs_out_f[0][DATA][20] , 
		\chs_out_f[0][DATA][19] , 
		\chs_out_f[0][DATA][18] , 
		\chs_out_f[0][DATA][17] , 
		\chs_out_f[0][DATA][16] , 
		\chs_out_f[0][DATA][15] , 
		\chs_out_f[0][DATA][14] , 
		\chs_out_f[0][DATA][13] , 
		\chs_out_f[0][DATA][12] , 
		\chs_out_f[0][DATA][11] , 
		\chs_out_f[0][DATA][10] , 
		\chs_out_f[0][DATA][9] , 
		\chs_out_f[0][DATA][8] , 
		\chs_out_f[0][DATA][7] , 
		\chs_out_f[0][DATA][6] , 
		\chs_out_f[0][DATA][5] , 
		\chs_out_f[0][DATA][4] , 
		\chs_out_f[0][DATA][3] , 
		\chs_out_f[0][DATA][2] , 
		\chs_out_f[0][DATA][1] , 
		\chs_out_f[0][DATA][0]  } ), 
	.chs_out_b ( { \chs_out_b[4][ACK] , 
		\chs_out_b[3][ACK] , 
		\chs_out_b[2][ACK] , 
		\chs_out_b[1][ACK] , 
		\chs_out_b[0][ACK]  } ), 
	FE_OFN1003_preset);
   input preset;
   input \switch_sel[4][4] ;
   input \switch_sel[4][3] ;
   input \switch_sel[4][2] ;
   input \switch_sel[4][1] ;
   input \switch_sel[4][0] ;
   input \switch_sel[3][4] ;
   input \switch_sel[3][3] ;
   input \switch_sel[3][2] ;
   input \switch_sel[3][1] ;
   input \switch_sel[3][0] ;
   input \switch_sel[2][4] ;
   input \switch_sel[2][3] ;
   input \switch_sel[2][2] ;
   input \switch_sel[2][1] ;
   input \switch_sel[2][0] ;
   input \switch_sel[1][4] ;
   input \switch_sel[1][3] ;
   input \switch_sel[1][2] ;
   input \switch_sel[1][1] ;
   input \switch_sel[1][0] ;
   input \switch_sel[0][4] ;
   input \switch_sel[0][3] ;
   input \switch_sel[0][2] ;
   input \switch_sel[0][1] ;
   input \switch_sel[0][0] ;
   input \chs_in_f[4][REQ] ;
   input \chs_in_f[4][DATA][33] ;
   input \chs_in_f[4][DATA][32] ;
   input \chs_in_f[4][DATA][31] ;
   input \chs_in_f[4][DATA][30] ;
   input \chs_in_f[4][DATA][29] ;
   input \chs_in_f[4][DATA][28] ;
   input \chs_in_f[4][DATA][27] ;
   input \chs_in_f[4][DATA][26] ;
   input \chs_in_f[4][DATA][25] ;
   input \chs_in_f[4][DATA][24] ;
   input \chs_in_f[4][DATA][23] ;
   input \chs_in_f[4][DATA][22] ;
   input \chs_in_f[4][DATA][21] ;
   input \chs_in_f[4][DATA][20] ;
   input \chs_in_f[4][DATA][19] ;
   input \chs_in_f[4][DATA][18] ;
   input \chs_in_f[4][DATA][17] ;
   input \chs_in_f[4][DATA][16] ;
   input \chs_in_f[4][DATA][15] ;
   input \chs_in_f[4][DATA][14] ;
   input \chs_in_f[4][DATA][13] ;
   input \chs_in_f[4][DATA][12] ;
   input \chs_in_f[4][DATA][11] ;
   input \chs_in_f[4][DATA][10] ;
   input \chs_in_f[4][DATA][9] ;
   input \chs_in_f[4][DATA][8] ;
   input \chs_in_f[4][DATA][7] ;
   input \chs_in_f[4][DATA][6] ;
   input \chs_in_f[4][DATA][5] ;
   input \chs_in_f[4][DATA][4] ;
   input \chs_in_f[4][DATA][3] ;
   input \chs_in_f[4][DATA][2] ;
   input \chs_in_f[4][DATA][1] ;
   input \chs_in_f[4][DATA][0] ;
   input \chs_in_f[3][REQ] ;
   input \chs_in_f[3][DATA][33] ;
   input \chs_in_f[3][DATA][32] ;
   input \chs_in_f[3][DATA][31] ;
   input \chs_in_f[3][DATA][30] ;
   input \chs_in_f[3][DATA][29] ;
   input \chs_in_f[3][DATA][28] ;
   input \chs_in_f[3][DATA][27] ;
   input \chs_in_f[3][DATA][26] ;
   input \chs_in_f[3][DATA][25] ;
   input \chs_in_f[3][DATA][24] ;
   input \chs_in_f[3][DATA][23] ;
   input \chs_in_f[3][DATA][22] ;
   input \chs_in_f[3][DATA][21] ;
   input \chs_in_f[3][DATA][20] ;
   input \chs_in_f[3][DATA][19] ;
   input \chs_in_f[3][DATA][18] ;
   input \chs_in_f[3][DATA][17] ;
   input \chs_in_f[3][DATA][16] ;
   input \chs_in_f[3][DATA][15] ;
   input \chs_in_f[3][DATA][14] ;
   input \chs_in_f[3][DATA][13] ;
   input \chs_in_f[3][DATA][12] ;
   input \chs_in_f[3][DATA][11] ;
   input \chs_in_f[3][DATA][10] ;
   input \chs_in_f[3][DATA][9] ;
   input \chs_in_f[3][DATA][8] ;
   input \chs_in_f[3][DATA][7] ;
   input \chs_in_f[3][DATA][6] ;
   input \chs_in_f[3][DATA][5] ;
   input \chs_in_f[3][DATA][4] ;
   input \chs_in_f[3][DATA][3] ;
   input \chs_in_f[3][DATA][2] ;
   input \chs_in_f[3][DATA][1] ;
   input \chs_in_f[3][DATA][0] ;
   input \chs_in_f[2][REQ] ;
   input \chs_in_f[2][DATA][33] ;
   input \chs_in_f[2][DATA][32] ;
   input \chs_in_f[2][DATA][31] ;
   input \chs_in_f[2][DATA][30] ;
   input \chs_in_f[2][DATA][29] ;
   input \chs_in_f[2][DATA][28] ;
   input \chs_in_f[2][DATA][27] ;
   input \chs_in_f[2][DATA][26] ;
   input \chs_in_f[2][DATA][25] ;
   input \chs_in_f[2][DATA][24] ;
   input \chs_in_f[2][DATA][23] ;
   input \chs_in_f[2][DATA][22] ;
   input \chs_in_f[2][DATA][21] ;
   input \chs_in_f[2][DATA][20] ;
   input \chs_in_f[2][DATA][19] ;
   input \chs_in_f[2][DATA][18] ;
   input \chs_in_f[2][DATA][17] ;
   input \chs_in_f[2][DATA][16] ;
   input \chs_in_f[2][DATA][15] ;
   input \chs_in_f[2][DATA][14] ;
   input \chs_in_f[2][DATA][13] ;
   input \chs_in_f[2][DATA][12] ;
   input \chs_in_f[2][DATA][11] ;
   input \chs_in_f[2][DATA][10] ;
   input \chs_in_f[2][DATA][9] ;
   input \chs_in_f[2][DATA][8] ;
   input \chs_in_f[2][DATA][7] ;
   input \chs_in_f[2][DATA][6] ;
   input \chs_in_f[2][DATA][5] ;
   input \chs_in_f[2][DATA][4] ;
   input \chs_in_f[2][DATA][3] ;
   input \chs_in_f[2][DATA][2] ;
   input \chs_in_f[2][DATA][1] ;
   input \chs_in_f[2][DATA][0] ;
   input \chs_in_f[1][REQ] ;
   input \chs_in_f[1][DATA][33] ;
   input \chs_in_f[1][DATA][32] ;
   input \chs_in_f[1][DATA][31] ;
   input \chs_in_f[1][DATA][30] ;
   input \chs_in_f[1][DATA][29] ;
   input \chs_in_f[1][DATA][28] ;
   input \chs_in_f[1][DATA][27] ;
   input \chs_in_f[1][DATA][26] ;
   input \chs_in_f[1][DATA][25] ;
   input \chs_in_f[1][DATA][24] ;
   input \chs_in_f[1][DATA][23] ;
   input \chs_in_f[1][DATA][22] ;
   input \chs_in_f[1][DATA][21] ;
   input \chs_in_f[1][DATA][20] ;
   input \chs_in_f[1][DATA][19] ;
   input \chs_in_f[1][DATA][18] ;
   input \chs_in_f[1][DATA][17] ;
   input \chs_in_f[1][DATA][16] ;
   input \chs_in_f[1][DATA][15] ;
   input \chs_in_f[1][DATA][14] ;
   input \chs_in_f[1][DATA][13] ;
   input \chs_in_f[1][DATA][12] ;
   input \chs_in_f[1][DATA][11] ;
   input \chs_in_f[1][DATA][10] ;
   input \chs_in_f[1][DATA][9] ;
   input \chs_in_f[1][DATA][8] ;
   input \chs_in_f[1][DATA][7] ;
   input \chs_in_f[1][DATA][6] ;
   input \chs_in_f[1][DATA][5] ;
   input \chs_in_f[1][DATA][4] ;
   input \chs_in_f[1][DATA][3] ;
   input \chs_in_f[1][DATA][2] ;
   input \chs_in_f[1][DATA][1] ;
   input \chs_in_f[1][DATA][0] ;
   input \chs_in_f[0][REQ] ;
   input \chs_in_f[0][DATA][33] ;
   input \chs_in_f[0][DATA][32] ;
   input \chs_in_f[0][DATA][31] ;
   input \chs_in_f[0][DATA][30] ;
   input \chs_in_f[0][DATA][29] ;
   input \chs_in_f[0][DATA][28] ;
   input \chs_in_f[0][DATA][27] ;
   input \chs_in_f[0][DATA][26] ;
   input \chs_in_f[0][DATA][25] ;
   input \chs_in_f[0][DATA][24] ;
   input \chs_in_f[0][DATA][23] ;
   input \chs_in_f[0][DATA][22] ;
   input \chs_in_f[0][DATA][21] ;
   input \chs_in_f[0][DATA][20] ;
   input \chs_in_f[0][DATA][19] ;
   input \chs_in_f[0][DATA][18] ;
   input \chs_in_f[0][DATA][17] ;
   input \chs_in_f[0][DATA][16] ;
   input \chs_in_f[0][DATA][15] ;
   input \chs_in_f[0][DATA][14] ;
   input \chs_in_f[0][DATA][13] ;
   input \chs_in_f[0][DATA][12] ;
   input \chs_in_f[0][DATA][11] ;
   input \chs_in_f[0][DATA][10] ;
   input \chs_in_f[0][DATA][9] ;
   input \chs_in_f[0][DATA][8] ;
   input \chs_in_f[0][DATA][7] ;
   input \chs_in_f[0][DATA][6] ;
   input \chs_in_f[0][DATA][5] ;
   input \chs_in_f[0][DATA][4] ;
   input \chs_in_f[0][DATA][3] ;
   input \chs_in_f[0][DATA][2] ;
   input \chs_in_f[0][DATA][1] ;
   input \chs_in_f[0][DATA][0] ;
   output \chs_in_b[4][ACK] ;
   output \chs_in_b[3][ACK] ;
   output \chs_in_b[2][ACK] ;
   output \chs_in_b[1][ACK] ;
   output \chs_in_b[0][ACK] ;
   output \chs_out_f[4][REQ] ;
   output \chs_out_f[4][DATA][33] ;
   output \chs_out_f[4][DATA][32] ;
   output \chs_out_f[4][DATA][31] ;
   output \chs_out_f[4][DATA][30] ;
   output \chs_out_f[4][DATA][29] ;
   output \chs_out_f[4][DATA][28] ;
   output \chs_out_f[4][DATA][27] ;
   output \chs_out_f[4][DATA][26] ;
   output \chs_out_f[4][DATA][25] ;
   output \chs_out_f[4][DATA][24] ;
   output \chs_out_f[4][DATA][23] ;
   output \chs_out_f[4][DATA][22] ;
   output \chs_out_f[4][DATA][21] ;
   output \chs_out_f[4][DATA][20] ;
   output \chs_out_f[4][DATA][19] ;
   output \chs_out_f[4][DATA][18] ;
   output \chs_out_f[4][DATA][17] ;
   output \chs_out_f[4][DATA][16] ;
   output \chs_out_f[4][DATA][15] ;
   output \chs_out_f[4][DATA][14] ;
   output \chs_out_f[4][DATA][13] ;
   output \chs_out_f[4][DATA][12] ;
   output \chs_out_f[4][DATA][11] ;
   output \chs_out_f[4][DATA][10] ;
   output \chs_out_f[4][DATA][9] ;
   output \chs_out_f[4][DATA][8] ;
   output \chs_out_f[4][DATA][7] ;
   output \chs_out_f[4][DATA][6] ;
   output \chs_out_f[4][DATA][5] ;
   output \chs_out_f[4][DATA][4] ;
   output \chs_out_f[4][DATA][3] ;
   output \chs_out_f[4][DATA][2] ;
   output \chs_out_f[4][DATA][1] ;
   output \chs_out_f[4][DATA][0] ;
   output \chs_out_f[3][REQ] ;
   output \chs_out_f[3][DATA][33] ;
   output \chs_out_f[3][DATA][32] ;
   output \chs_out_f[3][DATA][31] ;
   output \chs_out_f[3][DATA][30] ;
   output \chs_out_f[3][DATA][29] ;
   output \chs_out_f[3][DATA][28] ;
   output \chs_out_f[3][DATA][27] ;
   output \chs_out_f[3][DATA][26] ;
   output \chs_out_f[3][DATA][25] ;
   output \chs_out_f[3][DATA][24] ;
   output \chs_out_f[3][DATA][23] ;
   output \chs_out_f[3][DATA][22] ;
   output \chs_out_f[3][DATA][21] ;
   output \chs_out_f[3][DATA][20] ;
   output \chs_out_f[3][DATA][19] ;
   output \chs_out_f[3][DATA][18] ;
   output \chs_out_f[3][DATA][17] ;
   output \chs_out_f[3][DATA][16] ;
   output \chs_out_f[3][DATA][15] ;
   output \chs_out_f[3][DATA][14] ;
   output \chs_out_f[3][DATA][13] ;
   output \chs_out_f[3][DATA][12] ;
   output \chs_out_f[3][DATA][11] ;
   output \chs_out_f[3][DATA][10] ;
   output \chs_out_f[3][DATA][9] ;
   output \chs_out_f[3][DATA][8] ;
   output \chs_out_f[3][DATA][7] ;
   output \chs_out_f[3][DATA][6] ;
   output \chs_out_f[3][DATA][5] ;
   output \chs_out_f[3][DATA][4] ;
   output \chs_out_f[3][DATA][3] ;
   output \chs_out_f[3][DATA][2] ;
   output \chs_out_f[3][DATA][1] ;
   output \chs_out_f[3][DATA][0] ;
   output \chs_out_f[2][REQ] ;
   output \chs_out_f[2][DATA][33] ;
   output \chs_out_f[2][DATA][32] ;
   output \chs_out_f[2][DATA][31] ;
   output \chs_out_f[2][DATA][30] ;
   output \chs_out_f[2][DATA][29] ;
   output \chs_out_f[2][DATA][28] ;
   output \chs_out_f[2][DATA][27] ;
   output \chs_out_f[2][DATA][26] ;
   output \chs_out_f[2][DATA][25] ;
   output \chs_out_f[2][DATA][24] ;
   output \chs_out_f[2][DATA][23] ;
   output \chs_out_f[2][DATA][22] ;
   output \chs_out_f[2][DATA][21] ;
   output \chs_out_f[2][DATA][20] ;
   output \chs_out_f[2][DATA][19] ;
   output \chs_out_f[2][DATA][18] ;
   output \chs_out_f[2][DATA][17] ;
   output \chs_out_f[2][DATA][16] ;
   output \chs_out_f[2][DATA][15] ;
   output \chs_out_f[2][DATA][14] ;
   output \chs_out_f[2][DATA][13] ;
   output \chs_out_f[2][DATA][12] ;
   output \chs_out_f[2][DATA][11] ;
   output \chs_out_f[2][DATA][10] ;
   output \chs_out_f[2][DATA][9] ;
   output \chs_out_f[2][DATA][8] ;
   output \chs_out_f[2][DATA][7] ;
   output \chs_out_f[2][DATA][6] ;
   output \chs_out_f[2][DATA][5] ;
   output \chs_out_f[2][DATA][4] ;
   output \chs_out_f[2][DATA][3] ;
   output \chs_out_f[2][DATA][2] ;
   output \chs_out_f[2][DATA][1] ;
   output \chs_out_f[2][DATA][0] ;
   output \chs_out_f[1][REQ] ;
   output \chs_out_f[1][DATA][33] ;
   output \chs_out_f[1][DATA][32] ;
   output \chs_out_f[1][DATA][31] ;
   output \chs_out_f[1][DATA][30] ;
   output \chs_out_f[1][DATA][29] ;
   output \chs_out_f[1][DATA][28] ;
   output \chs_out_f[1][DATA][27] ;
   output \chs_out_f[1][DATA][26] ;
   output \chs_out_f[1][DATA][25] ;
   output \chs_out_f[1][DATA][24] ;
   output \chs_out_f[1][DATA][23] ;
   output \chs_out_f[1][DATA][22] ;
   output \chs_out_f[1][DATA][21] ;
   output \chs_out_f[1][DATA][20] ;
   output \chs_out_f[1][DATA][19] ;
   output \chs_out_f[1][DATA][18] ;
   output \chs_out_f[1][DATA][17] ;
   output \chs_out_f[1][DATA][16] ;
   output \chs_out_f[1][DATA][15] ;
   output \chs_out_f[1][DATA][14] ;
   output \chs_out_f[1][DATA][13] ;
   output \chs_out_f[1][DATA][12] ;
   output \chs_out_f[1][DATA][11] ;
   output \chs_out_f[1][DATA][10] ;
   output \chs_out_f[1][DATA][9] ;
   output \chs_out_f[1][DATA][8] ;
   output \chs_out_f[1][DATA][7] ;
   output \chs_out_f[1][DATA][6] ;
   output \chs_out_f[1][DATA][5] ;
   output \chs_out_f[1][DATA][4] ;
   output \chs_out_f[1][DATA][3] ;
   output \chs_out_f[1][DATA][2] ;
   output \chs_out_f[1][DATA][1] ;
   output \chs_out_f[1][DATA][0] ;
   output \chs_out_f[0][REQ] ;
   output \chs_out_f[0][DATA][33] ;
   output \chs_out_f[0][DATA][32] ;
   output \chs_out_f[0][DATA][31] ;
   output \chs_out_f[0][DATA][30] ;
   output \chs_out_f[0][DATA][29] ;
   output \chs_out_f[0][DATA][28] ;
   output \chs_out_f[0][DATA][27] ;
   output \chs_out_f[0][DATA][26] ;
   output \chs_out_f[0][DATA][25] ;
   output \chs_out_f[0][DATA][24] ;
   output \chs_out_f[0][DATA][23] ;
   output \chs_out_f[0][DATA][22] ;
   output \chs_out_f[0][DATA][21] ;
   output \chs_out_f[0][DATA][20] ;
   output \chs_out_f[0][DATA][19] ;
   output \chs_out_f[0][DATA][18] ;
   output \chs_out_f[0][DATA][17] ;
   output \chs_out_f[0][DATA][16] ;
   output \chs_out_f[0][DATA][15] ;
   output \chs_out_f[0][DATA][14] ;
   output \chs_out_f[0][DATA][13] ;
   output \chs_out_f[0][DATA][12] ;
   output \chs_out_f[0][DATA][11] ;
   output \chs_out_f[0][DATA][10] ;
   output \chs_out_f[0][DATA][9] ;
   output \chs_out_f[0][DATA][8] ;
   output \chs_out_f[0][DATA][7] ;
   output \chs_out_f[0][DATA][6] ;
   output \chs_out_f[0][DATA][5] ;
   output \chs_out_f[0][DATA][4] ;
   output \chs_out_f[0][DATA][3] ;
   output \chs_out_f[0][DATA][2] ;
   output \chs_out_f[0][DATA][1] ;
   output \chs_out_f[0][DATA][0] ;
   input \chs_out_b[4][ACK] ;
   input \chs_out_b[3][ACK] ;
   input \chs_out_b[2][ACK] ;
   input \chs_out_b[1][ACK] ;
   input \chs_out_b[0][ACK] ;
   input FE_OFN1003_preset;

   // Internal wires
   wire FE_PHN1409_del;
   wire FE_OFN1034_switch_sel_4_;
   wire FE_OFN1033_switch_sel_3_;
   wire FE_OFN1032_switch_sel_2_;
   wire FE_OFN1031_switch_sel_1_;
   wire FE_OFN1030_switch_sel_0_;
   wire FE_OFN1029_switch_sel_14_;
   wire FE_OFN1028_switch_sel_13_;
   wire FE_OFN1027_switch_sel_12_;
   wire FE_OFN1026_switch_sel_11_;
   wire FE_OFN1025_switch_sel_10_;
   wire FE_OFN1024_switch_sel_9_;
   wire FE_OFN1023_switch_sel_8_;
   wire FE_OFN1022_switch_sel_7_;
   wire FE_OFN1021_switch_sel_6_;
   wire FE_OFN1020_switch_sel_5_;
   wire FE_OFN1014_n6;
   wire FE_OFN1013_n7;
   wire FE_OFN1012_n8;
   wire FE_OFN1011_n9;
   wire FE_OFN1010_n10;
   wire FE_OFN1009_n1;
   wire FE_OFN1008_n2;
   wire FE_OFN1007_n3;
   wire FE_OFN1006_n4;
   wire FE_OFN1005_n5;
   wire synced_req;
   wire del;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n70;
   wire n71;
   wire n72;
   wire n73;
   wire n74;
   wire n75;
   wire n76;
   wire n77;
   wire n78;
   wire n79;
   wire n80;
   wire n81;
   wire n82;
   wire n83;
   wire n84;
   wire n85;
   wire n86;
   wire n87;
   wire n88;
   wire n89;
   wire n90;
   wire n91;
   wire n92;
   wire n93;
   wire n94;
   wire n95;
   wire n96;
   wire n97;
   wire n98;
   wire n99;
   wire n100;
   wire n101;
   wire n102;
   wire n103;
   wire n104;
   wire n105;
   wire n106;
   wire n107;
   wire n108;
   wire n109;
   wire n110;
   wire n111;
   wire n112;
   wire n113;
   wire n114;
   wire n115;
   wire n116;
   wire n117;
   wire n118;
   wire n119;
   wire n120;
   wire n121;
   wire n122;
   wire n123;
   wire n124;
   wire n125;
   wire n126;
   wire n127;
   wire n128;
   wire n129;
   wire n130;
   wire n131;
   wire n132;
   wire n133;
   wire n134;
   wire n135;
   wire n136;
   wire n137;
   wire n138;
   wire n139;
   wire n140;
   wire n141;
   wire n142;
   wire n143;
   wire n144;
   wire n145;
   wire n146;
   wire n147;
   wire n148;
   wire n149;
   wire n150;
   wire n151;
   wire n152;
   wire n153;
   wire n154;
   wire n155;
   wire n156;
   wire n157;
   wire n158;
   wire n159;
   wire n160;
   wire n161;
   wire n162;
   wire n163;
   wire n164;
   wire n165;
   wire n166;
   wire n167;
   wire n168;
   wire n169;
   wire n170;
   wire n171;
   wire n172;
   wire n173;
   wire n174;
   wire n175;
   wire n176;
   wire n177;
   wire n178;
   wire n179;
   wire n180;
   wire n181;
   wire n182;
   wire n183;
   wire n184;
   wire n185;
   wire n186;
   wire n187;
   wire n188;
   wire n189;
   wire n190;
   wire n191;
   wire n192;
   wire n193;
   wire n194;
   wire n195;
   wire n196;
   wire n197;
   wire n198;
   wire n199;
   wire n200;
   wire n201;
   wire n202;
   wire n203;
   wire n204;
   wire n205;
   wire n206;
   wire n207;
   wire n208;
   wire n209;
   wire n210;
   wire n211;
   wire n212;
   wire n213;
   wire n214;
   wire n215;
   wire n216;
   wire n217;
   wire n218;
   wire n219;
   wire n220;
   wire n221;
   wire n222;
   wire n223;
   wire n224;
   wire n225;
   wire n226;
   wire n227;
   wire n228;
   wire n229;
   wire n230;
   wire n231;
   wire n232;
   wire n233;
   wire n234;
   wire n235;
   wire n236;
   wire n237;
   wire n238;
   wire n239;
   wire n240;
   wire n241;
   wire n242;
   wire n243;
   wire n244;
   wire n245;
   wire n246;
   wire n247;
   wire n248;

   assign \chs_in_b[0][ACK]  = \chs_in_b[4][ACK]  ;
   assign \chs_in_b[1][ACK]  = \chs_in_b[4][ACK]  ;
   assign \chs_in_b[2][ACK]  = \chs_in_b[4][ACK]  ;
   assign \chs_in_b[3][ACK]  = \chs_in_b[4][ACK]  ;
   assign \chs_out_f[0][REQ]  = \chs_out_f[4][REQ]  ;
   assign \chs_out_f[1][REQ]  = \chs_out_f[4][REQ]  ;
   assign \chs_out_f[2][REQ]  = \chs_out_f[4][REQ]  ;
   assign \chs_out_f[3][REQ]  = \chs_out_f[4][REQ]  ;

   HS65_LH_DLYIC4X9 FE_PHC1409_del (.Z(FE_PHN1409_del), 
	.A(del));
   HS65_LS_BFX7 FE_OFC1034_switch_sel_4_ (.Z(FE_OFN1034_switch_sel_4_), 
	.A(\switch_sel[0][4] ));
   HS65_LS_BFX7 FE_OFC1033_switch_sel_3_ (.Z(FE_OFN1033_switch_sel_3_), 
	.A(\switch_sel[0][3] ));
   HS65_LS_BFX7 FE_OFC1032_switch_sel_2_ (.Z(FE_OFN1032_switch_sel_2_), 
	.A(\switch_sel[0][2] ));
   HS65_LS_BFX7 FE_OFC1031_switch_sel_1_ (.Z(FE_OFN1031_switch_sel_1_), 
	.A(\switch_sel[0][1] ));
   HS65_LS_BFX7 FE_OFC1030_switch_sel_0_ (.Z(FE_OFN1030_switch_sel_0_), 
	.A(\switch_sel[0][0] ));
   HS65_LS_BFX7 FE_OFC1029_switch_sel_14_ (.Z(FE_OFN1029_switch_sel_14_), 
	.A(\switch_sel[2][4] ));
   HS65_LS_BFX7 FE_OFC1028_switch_sel_13_ (.Z(FE_OFN1028_switch_sel_13_), 
	.A(\switch_sel[2][3] ));
   HS65_LS_BFX7 FE_OFC1027_switch_sel_12_ (.Z(FE_OFN1027_switch_sel_12_), 
	.A(\switch_sel[2][2] ));
   HS65_LS_BFX7 FE_OFC1026_switch_sel_11_ (.Z(FE_OFN1026_switch_sel_11_), 
	.A(\switch_sel[2][1] ));
   HS65_LS_BFX7 FE_OFC1025_switch_sel_10_ (.Z(FE_OFN1025_switch_sel_10_), 
	.A(\switch_sel[2][0] ));
   HS65_LS_BFX7 FE_OFC1024_switch_sel_9_ (.Z(FE_OFN1024_switch_sel_9_), 
	.A(\switch_sel[1][4] ));
   HS65_LS_BFX7 FE_OFC1023_switch_sel_8_ (.Z(FE_OFN1023_switch_sel_8_), 
	.A(\switch_sel[1][3] ));
   HS65_LS_BFX7 FE_OFC1022_switch_sel_7_ (.Z(FE_OFN1022_switch_sel_7_), 
	.A(\switch_sel[1][2] ));
   HS65_LS_BFX7 FE_OFC1021_switch_sel_6_ (.Z(FE_OFN1021_switch_sel_6_), 
	.A(\switch_sel[1][1] ));
   HS65_LS_BFX7 FE_OFC1020_switch_sel_5_ (.Z(FE_OFN1020_switch_sel_5_), 
	.A(\switch_sel[1][0] ));
   HS65_LS_BFX7 FE_OFC1014_n6 (.Z(FE_OFN1014_n6), 
	.A(n6));
   HS65_LS_BFX7 FE_OFC1013_n7 (.Z(FE_OFN1013_n7), 
	.A(n7));
   HS65_LS_BFX7 FE_OFC1012_n8 (.Z(FE_OFN1012_n8), 
	.A(n8));
   HS65_LS_BFX7 FE_OFC1011_n9 (.Z(FE_OFN1011_n9), 
	.A(n9));
   HS65_LS_BFX7 FE_OFC1010_n10 (.Z(FE_OFN1010_n10), 
	.A(n10));
   HS65_LS_BFX9 FE_OFC1009_n1 (.Z(FE_OFN1009_n1), 
	.A(n1));
   HS65_LS_BFX7 FE_OFC1008_n2 (.Z(FE_OFN1008_n2), 
	.A(n2));
   HS65_LS_BFX7 FE_OFC1007_n3 (.Z(FE_OFN1007_n3), 
	.A(n3));
   HS65_LS_BFX7 FE_OFC1006_n4 (.Z(FE_OFN1006_n4), 
	.A(n4));
   HS65_LS_BFX7 FE_OFC1005_n5 (.Z(FE_OFN1005_n5), 
	.A(n5));
   c_gate_generic_1_5_0 c_sync_req (.preset(FE_OFN1003_preset), 
	.\input ({ \chs_in_f[4][REQ] ,
		\chs_in_f[3][REQ] ,
		\chs_in_f[2][REQ] ,
		\chs_in_f[1][REQ] ,
		\chs_in_f[0][REQ]  }), 
	.\output (synced_req));
   c_gate_generic_1_5_1 c_sync_ack (.preset(preset), 
	.\input ({ \chs_out_b[4][ACK] ,
		\chs_out_b[3][ACK] ,
		\chs_out_b[2][ACK] ,
		\chs_out_b[1][ACK] ,
		\chs_out_b[0][ACK]  }), 
	.\output (\chs_in_b[4][ACK] ));
   HS65_LS_IVX9 I_1 (.Z(\chs_out_f[4][REQ] ), 
	.A(FE_PHN1409_del));
   HS65_LH_IVX2 I_0 (.Z(del), 
	.A(synced_req));
   HS65_LS_OAI212X5 U85 (.Z(\chs_out_f[4][DATA][33] ), 
	.E(n86), 
	.D(n11), 
	.C(n1), 
	.B(n45), 
	.A(n6));
   HS65_LS_AOI222X2 U86 (.Z(n86), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][33] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][33] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][33] ));
   HS65_LS_OAI212X5 U87 (.Z(\chs_out_f[3][DATA][33] ), 
	.E(n120), 
	.D(n2), 
	.C(n11), 
	.B(n7), 
	.A(n45));
   HS65_LS_AOI222X2 U88 (.Z(n120), 
	.F(\chs_in_f[1][DATA][33] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][33] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][33] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_OAI212X5 U89 (.Z(\chs_out_f[2][DATA][33] ), 
	.E(n154), 
	.D(FE_OFN1007_n3), 
	.C(n11), 
	.B(n8), 
	.A(n45));
   HS65_LS_AOI222X2 U90 (.Z(n154), 
	.F(\chs_in_f[1][DATA][33] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][33] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][33] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U91 (.Z(\chs_out_f[1][DATA][33] ), 
	.E(n188), 
	.D(FE_OFN1006_n4), 
	.C(n11), 
	.B(FE_OFN1011_n9), 
	.A(n45));
   HS65_LS_AOI222X2 U92 (.Z(n188), 
	.F(\chs_in_f[1][DATA][33] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][33] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][33] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_OAI212X5 U93 (.Z(\chs_out_f[0][DATA][33] ), 
	.E(n222), 
	.D(FE_OFN1005_n5), 
	.C(n11), 
	.B(n10), 
	.A(n45));
   HS65_LS_AOI222X2 U94 (.Z(n222), 
	.F(\chs_in_f[1][DATA][33] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][33] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][33] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U95 (.Z(\chs_out_f[4][DATA][0] ), 
	.E(n112), 
	.D(n44), 
	.C(n1), 
	.B(n78), 
	.A(n6));
   HS65_LS_AOI222X2 U96 (.Z(n112), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][0] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][0] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][0] ));
   HS65_LS_OAI212X5 U97 (.Z(\chs_out_f[4][DATA][1] ), 
	.E(n101), 
	.D(n43), 
	.C(FE_OFN1009_n1), 
	.B(n77), 
	.A(n6));
   HS65_LS_AOI222X2 U98 (.Z(n101), 
	.F(FE_OFN1024_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][1] ), 
	.D(FE_OFN1034_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][1] ), 
	.B(FE_OFN1029_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][1] ));
   HS65_LS_OAI212X5 U99 (.Z(\chs_out_f[4][DATA][2] ), 
	.E(n90), 
	.D(n42), 
	.C(n1), 
	.B(n76), 
	.A(n6));
   HS65_LS_AOI222X2 U100 (.Z(n90), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][2] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][2] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][2] ));
   HS65_LS_OAI212X5 U101 (.Z(\chs_out_f[4][DATA][3] ), 
	.E(n85), 
	.D(n41), 
	.C(FE_OFN1009_n1), 
	.B(n75), 
	.A(FE_OFN1014_n6));
   HS65_LS_AOI222X2 U102 (.Z(n85), 
	.F(FE_OFN1024_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][3] ), 
	.D(FE_OFN1034_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][3] ), 
	.B(FE_OFN1029_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][3] ));
   HS65_LS_OAI212X5 U103 (.Z(\chs_out_f[4][DATA][4] ), 
	.E(n84), 
	.D(n40), 
	.C(n1), 
	.B(n74), 
	.A(n6));
   HS65_LS_AOI222X2 U104 (.Z(n84), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][4] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][4] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][4] ));
   HS65_LS_OAI212X5 U105 (.Z(\chs_out_f[4][DATA][5] ), 
	.E(n83), 
	.D(n39), 
	.C(FE_OFN1009_n1), 
	.B(n73), 
	.A(n6));
   HS65_LS_AOI222X2 U106 (.Z(n83), 
	.F(FE_OFN1024_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][5] ), 
	.D(FE_OFN1034_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][5] ), 
	.B(FE_OFN1029_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][5] ));
   HS65_LS_OAI212X5 U107 (.Z(\chs_out_f[4][DATA][6] ), 
	.E(n82), 
	.D(n38), 
	.C(FE_OFN1009_n1), 
	.B(n72), 
	.A(n6));
   HS65_LS_AOI222X2 U108 (.Z(n82), 
	.F(FE_OFN1024_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][6] ), 
	.D(FE_OFN1034_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][6] ), 
	.B(FE_OFN1029_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][6] ));
   HS65_LS_OAI212X5 U109 (.Z(\chs_out_f[4][DATA][7] ), 
	.E(n81), 
	.D(n37), 
	.C(FE_OFN1009_n1), 
	.B(n71), 
	.A(FE_OFN1014_n6));
   HS65_LS_AOI222X2 U110 (.Z(n81), 
	.F(FE_OFN1024_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][7] ), 
	.D(FE_OFN1034_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][7] ), 
	.B(FE_OFN1029_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][7] ));
   HS65_LS_OAI212X5 U111 (.Z(\chs_out_f[4][DATA][8] ), 
	.E(n80), 
	.D(n36), 
	.C(n1), 
	.B(n70), 
	.A(n6));
   HS65_LS_AOI222X2 U112 (.Z(n80), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][8] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][8] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][8] ));
   HS65_LS_OAI212X5 U113 (.Z(\chs_out_f[4][DATA][10] ), 
	.E(n111), 
	.D(n34), 
	.C(FE_OFN1009_n1), 
	.B(n68), 
	.A(FE_OFN1014_n6));
   HS65_LS_AOI222X2 U114 (.Z(n111), 
	.F(FE_OFN1024_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][10] ), 
	.D(FE_OFN1034_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][10] ), 
	.B(FE_OFN1029_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][10] ));
   HS65_LS_OAI212X5 U115 (.Z(\chs_out_f[4][DATA][11] ), 
	.E(n110), 
	.D(n33), 
	.C(FE_OFN1009_n1), 
	.B(n67), 
	.A(FE_OFN1014_n6));
   HS65_LS_AOI222X2 U116 (.Z(n110), 
	.F(FE_OFN1024_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][11] ), 
	.D(FE_OFN1034_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][11] ), 
	.B(FE_OFN1029_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][11] ));
   HS65_LS_OAI212X5 U117 (.Z(\chs_out_f[4][DATA][12] ), 
	.E(n109), 
	.D(n32), 
	.C(FE_OFN1009_n1), 
	.B(n66), 
	.A(FE_OFN1014_n6));
   HS65_LS_AOI222X2 U118 (.Z(n109), 
	.F(FE_OFN1024_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][12] ), 
	.D(FE_OFN1034_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][12] ), 
	.B(FE_OFN1029_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][12] ));
   HS65_LS_OAI212X5 U119 (.Z(\chs_out_f[4][DATA][13] ), 
	.E(n108), 
	.D(n31), 
	.C(FE_OFN1009_n1), 
	.B(n65), 
	.A(FE_OFN1014_n6));
   HS65_LS_AOI222X2 U120 (.Z(n108), 
	.F(FE_OFN1024_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][13] ), 
	.D(FE_OFN1034_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][13] ), 
	.B(FE_OFN1029_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][13] ));
   HS65_LS_OAI212X5 U121 (.Z(\chs_out_f[4][DATA][14] ), 
	.E(n107), 
	.D(n30), 
	.C(FE_OFN1009_n1), 
	.B(n64), 
	.A(FE_OFN1014_n6));
   HS65_LS_AOI222X2 U122 (.Z(n107), 
	.F(FE_OFN1024_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][14] ), 
	.D(FE_OFN1034_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][14] ), 
	.B(FE_OFN1029_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][14] ));
   HS65_LS_OAI212X5 U123 (.Z(\chs_out_f[4][DATA][15] ), 
	.E(n106), 
	.D(n29), 
	.C(FE_OFN1009_n1), 
	.B(n63), 
	.A(FE_OFN1014_n6));
   HS65_LS_AOI222X2 U124 (.Z(n106), 
	.F(FE_OFN1024_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][15] ), 
	.D(FE_OFN1034_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][15] ), 
	.B(FE_OFN1029_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][15] ));
   HS65_LS_OAI212X5 U125 (.Z(\chs_out_f[4][DATA][16] ), 
	.E(n105), 
	.D(n28), 
	.C(FE_OFN1009_n1), 
	.B(n62), 
	.A(FE_OFN1014_n6));
   HS65_LS_AOI222X2 U126 (.Z(n105), 
	.F(FE_OFN1024_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][16] ), 
	.D(FE_OFN1034_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][16] ), 
	.B(FE_OFN1029_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][16] ));
   HS65_LS_OAI212X5 U127 (.Z(\chs_out_f[4][DATA][17] ), 
	.E(n104), 
	.D(n27), 
	.C(FE_OFN1009_n1), 
	.B(n61), 
	.A(FE_OFN1014_n6));
   HS65_LS_AOI222X2 U128 (.Z(n104), 
	.F(FE_OFN1024_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][17] ), 
	.D(FE_OFN1034_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][17] ), 
	.B(FE_OFN1029_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][17] ));
   HS65_LS_OAI212X5 U129 (.Z(\chs_out_f[4][DATA][18] ), 
	.E(n103), 
	.D(n26), 
	.C(FE_OFN1009_n1), 
	.B(n60), 
	.A(FE_OFN1014_n6));
   HS65_LS_AOI222X2 U130 (.Z(n103), 
	.F(FE_OFN1024_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][18] ), 
	.D(FE_OFN1034_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][18] ), 
	.B(FE_OFN1029_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][18] ));
   HS65_LS_OAI212X5 U131 (.Z(\chs_out_f[4][DATA][19] ), 
	.E(n102), 
	.D(n25), 
	.C(FE_OFN1009_n1), 
	.B(n59), 
	.A(FE_OFN1014_n6));
   HS65_LS_AOI222X2 U132 (.Z(n102), 
	.F(FE_OFN1024_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][19] ), 
	.D(FE_OFN1034_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][19] ), 
	.B(FE_OFN1029_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][19] ));
   HS65_LS_OAI212X5 U133 (.Z(\chs_out_f[4][DATA][20] ), 
	.E(n100), 
	.D(n24), 
	.C(FE_OFN1009_n1), 
	.B(n58), 
	.A(FE_OFN1014_n6));
   HS65_LS_AOI222X2 U134 (.Z(n100), 
	.F(FE_OFN1024_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][20] ), 
	.D(FE_OFN1034_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][20] ), 
	.B(FE_OFN1029_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][20] ));
   HS65_LS_OAI212X5 U135 (.Z(\chs_out_f[4][DATA][21] ), 
	.E(n99), 
	.D(n23), 
	.C(FE_OFN1009_n1), 
	.B(n57), 
	.A(FE_OFN1014_n6));
   HS65_LS_AOI222X2 U136 (.Z(n99), 
	.F(FE_OFN1024_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][21] ), 
	.D(FE_OFN1034_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][21] ), 
	.B(FE_OFN1029_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][21] ));
   HS65_LS_OAI212X5 U137 (.Z(\chs_out_f[4][DATA][22] ), 
	.E(n98), 
	.D(n22), 
	.C(FE_OFN1009_n1), 
	.B(n56), 
	.A(FE_OFN1014_n6));
   HS65_LS_AOI222X2 U138 (.Z(n98), 
	.F(FE_OFN1024_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][22] ), 
	.D(FE_OFN1034_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][22] ), 
	.B(FE_OFN1029_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][22] ));
   HS65_LS_OAI212X5 U139 (.Z(\chs_out_f[4][DATA][23] ), 
	.E(n97), 
	.D(n21), 
	.C(FE_OFN1009_n1), 
	.B(n55), 
	.A(FE_OFN1014_n6));
   HS65_LS_AOI222X2 U140 (.Z(n97), 
	.F(FE_OFN1024_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][23] ), 
	.D(FE_OFN1034_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][23] ), 
	.B(FE_OFN1029_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][23] ));
   HS65_LS_OAI212X5 U141 (.Z(\chs_out_f[4][DATA][24] ), 
	.E(n96), 
	.D(n20), 
	.C(n1), 
	.B(n54), 
	.A(n6));
   HS65_LS_AOI222X2 U142 (.Z(n96), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][24] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][24] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][24] ));
   HS65_LS_OAI212X5 U143 (.Z(\chs_out_f[4][DATA][25] ), 
	.E(n95), 
	.D(n19), 
	.C(n1), 
	.B(n53), 
	.A(n6));
   HS65_LS_AOI222X2 U144 (.Z(n95), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][25] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][25] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][25] ));
   HS65_LS_OAI212X5 U145 (.Z(\chs_out_f[4][DATA][26] ), 
	.E(n94), 
	.D(n18), 
	.C(n1), 
	.B(n52), 
	.A(n6));
   HS65_LS_AOI222X2 U146 (.Z(n94), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][26] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][26] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][26] ));
   HS65_LS_OAI212X5 U147 (.Z(\chs_out_f[4][DATA][27] ), 
	.E(n93), 
	.D(n17), 
	.C(n1), 
	.B(n51), 
	.A(n6));
   HS65_LS_AOI222X2 U148 (.Z(n93), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][27] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][27] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][27] ));
   HS65_LS_OAI212X5 U149 (.Z(\chs_out_f[4][DATA][28] ), 
	.E(n92), 
	.D(n16), 
	.C(n1), 
	.B(n50), 
	.A(n6));
   HS65_LS_AOI222X2 U150 (.Z(n92), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][28] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][28] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][28] ));
   HS65_LS_OAI212X5 U151 (.Z(\chs_out_f[4][DATA][29] ), 
	.E(n91), 
	.D(n15), 
	.C(n1), 
	.B(n49), 
	.A(n6));
   HS65_LS_AOI222X2 U152 (.Z(n91), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][29] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][29] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][29] ));
   HS65_LS_OAI212X5 U153 (.Z(\chs_out_f[4][DATA][30] ), 
	.E(n89), 
	.D(n14), 
	.C(n1), 
	.B(n48), 
	.A(n6));
   HS65_LS_AOI222X2 U154 (.Z(n89), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][30] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][30] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][30] ));
   HS65_LS_OAI212X5 U155 (.Z(\chs_out_f[4][DATA][31] ), 
	.E(n88), 
	.D(n13), 
	.C(n1), 
	.B(n47), 
	.A(n6));
   HS65_LS_AOI222X2 U156 (.Z(n88), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][31] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][31] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][31] ));
   HS65_LS_OAI212X5 U157 (.Z(\chs_out_f[4][DATA][32] ), 
	.E(n87), 
	.D(n12), 
	.C(n1), 
	.B(n46), 
	.A(n6));
   HS65_LS_AOI222X2 U158 (.Z(n87), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][32] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][32] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][32] ));
   HS65_LS_OAI212X5 U159 (.Z(\chs_out_f[3][DATA][9] ), 
	.E(n113), 
	.D(FE_OFN1008_n2), 
	.C(n35), 
	.B(FE_OFN1013_n7), 
	.A(n69));
   HS65_LS_AOI222X2 U160 (.Z(n113), 
	.F(\chs_in_f[1][DATA][9] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][9] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][9] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U161 (.Z(\chs_out_f[2][DATA][9] ), 
	.E(n147), 
	.D(n3), 
	.C(n35), 
	.B(FE_OFN1012_n8), 
	.A(n69));
   HS65_LS_AOI222X2 U162 (.Z(n147), 
	.F(\chs_in_f[1][DATA][9] ), 
	.E(FE_OFN1022_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][9] ), 
	.C(FE_OFN1032_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][9] ), 
	.A(FE_OFN1027_switch_sel_12_));
   HS65_LS_OAI212X5 U163 (.Z(\chs_out_f[1][DATA][9] ), 
	.E(n181), 
	.D(n4), 
	.C(n35), 
	.B(n9), 
	.A(n69));
   HS65_LS_AOI222X2 U164 (.Z(n181), 
	.F(\chs_in_f[1][DATA][9] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][9] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][9] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U165 (.Z(\chs_out_f[0][DATA][9] ), 
	.E(n215), 
	.D(n5), 
	.C(n35), 
	.B(FE_OFN1010_n10), 
	.A(n69));
   HS65_LS_AOI222X2 U166 (.Z(n215), 
	.F(\chs_in_f[1][DATA][9] ), 
	.E(FE_OFN1020_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][9] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][9] ), 
	.A(FE_OFN1025_switch_sel_10_));
   HS65_LS_OAI212X5 U167 (.Z(\chs_out_f[4][DATA][9] ), 
	.E(n79), 
	.D(FE_OFN1009_n1), 
	.C(n35), 
	.B(FE_OFN1014_n6), 
	.A(n69));
   HS65_LS_AOI222X2 U168 (.Z(n79), 
	.F(\chs_in_f[1][DATA][9] ), 
	.E(FE_OFN1024_switch_sel_9_), 
	.D(\chs_in_f[0][DATA][9] ), 
	.C(FE_OFN1034_switch_sel_4_), 
	.B(\chs_in_f[2][DATA][9] ), 
	.A(FE_OFN1029_switch_sel_14_));
   HS65_LS_OAI212X5 U169 (.Z(\chs_out_f[3][DATA][0] ), 
	.E(n146), 
	.D(n2), 
	.C(n44), 
	.B(n7), 
	.A(n78));
   HS65_LS_AOI222X2 U170 (.Z(n146), 
	.F(\chs_in_f[1][DATA][0] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][0] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][0] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_OAI212X5 U171 (.Z(\chs_out_f[3][DATA][1] ), 
	.E(n135), 
	.D(n2), 
	.C(n43), 
	.B(FE_OFN1013_n7), 
	.A(n77));
   HS65_LS_AOI222X2 U172 (.Z(n135), 
	.F(\chs_in_f[1][DATA][1] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][1] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][1] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U173 (.Z(\chs_out_f[3][DATA][2] ), 
	.E(n124), 
	.D(n2), 
	.C(n42), 
	.B(n7), 
	.A(n76));
   HS65_LS_AOI222X2 U174 (.Z(n124), 
	.F(\chs_in_f[1][DATA][2] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][2] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][2] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_OAI212X5 U175 (.Z(\chs_out_f[3][DATA][10] ), 
	.E(n145), 
	.D(FE_OFN1008_n2), 
	.C(n34), 
	.B(FE_OFN1013_n7), 
	.A(n68));
   HS65_LS_AOI222X2 U176 (.Z(n145), 
	.F(\chs_in_f[1][DATA][10] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][10] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][10] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U177 (.Z(\chs_out_f[3][DATA][11] ), 
	.E(n144), 
	.D(FE_OFN1008_n2), 
	.C(n33), 
	.B(FE_OFN1013_n7), 
	.A(n67));
   HS65_LS_AOI222X2 U178 (.Z(n144), 
	.F(\chs_in_f[1][DATA][11] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][11] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][11] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U179 (.Z(\chs_out_f[3][DATA][12] ), 
	.E(n143), 
	.D(FE_OFN1008_n2), 
	.C(n32), 
	.B(FE_OFN1013_n7), 
	.A(n66));
   HS65_LS_AOI222X2 U180 (.Z(n143), 
	.F(\chs_in_f[1][DATA][12] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][12] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][12] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U181 (.Z(\chs_out_f[3][DATA][13] ), 
	.E(n142), 
	.D(FE_OFN1008_n2), 
	.C(n31), 
	.B(FE_OFN1013_n7), 
	.A(n65));
   HS65_LS_AOI222X2 U182 (.Z(n142), 
	.F(\chs_in_f[1][DATA][13] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][13] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][13] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U183 (.Z(\chs_out_f[3][DATA][14] ), 
	.E(n141), 
	.D(FE_OFN1008_n2), 
	.C(n30), 
	.B(FE_OFN1013_n7), 
	.A(n64));
   HS65_LS_AOI222X2 U184 (.Z(n141), 
	.F(\chs_in_f[1][DATA][14] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][14] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][14] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U185 (.Z(\chs_out_f[3][DATA][15] ), 
	.E(n140), 
	.D(FE_OFN1008_n2), 
	.C(n29), 
	.B(FE_OFN1013_n7), 
	.A(n63));
   HS65_LS_AOI222X2 U186 (.Z(n140), 
	.F(\chs_in_f[1][DATA][15] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][15] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][15] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U187 (.Z(\chs_out_f[3][DATA][16] ), 
	.E(n139), 
	.D(FE_OFN1008_n2), 
	.C(n28), 
	.B(FE_OFN1013_n7), 
	.A(n62));
   HS65_LS_AOI222X2 U188 (.Z(n139), 
	.F(\chs_in_f[1][DATA][16] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][16] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][16] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U189 (.Z(\chs_out_f[3][DATA][17] ), 
	.E(n138), 
	.D(FE_OFN1008_n2), 
	.C(n27), 
	.B(FE_OFN1013_n7), 
	.A(n61));
   HS65_LS_AOI222X2 U190 (.Z(n138), 
	.F(\chs_in_f[1][DATA][17] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][17] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][17] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U191 (.Z(\chs_out_f[3][DATA][18] ), 
	.E(n137), 
	.D(FE_OFN1008_n2), 
	.C(n26), 
	.B(FE_OFN1013_n7), 
	.A(n60));
   HS65_LS_AOI222X2 U192 (.Z(n137), 
	.F(\chs_in_f[1][DATA][18] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][18] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][18] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U193 (.Z(\chs_out_f[3][DATA][19] ), 
	.E(n136), 
	.D(FE_OFN1008_n2), 
	.C(n25), 
	.B(FE_OFN1013_n7), 
	.A(n59));
   HS65_LS_AOI222X2 U194 (.Z(n136), 
	.F(\chs_in_f[1][DATA][19] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][19] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][19] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U195 (.Z(\chs_out_f[3][DATA][20] ), 
	.E(n134), 
	.D(FE_OFN1008_n2), 
	.C(n24), 
	.B(FE_OFN1013_n7), 
	.A(n58));
   HS65_LS_AOI222X2 U196 (.Z(n134), 
	.F(\chs_in_f[1][DATA][20] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][20] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][20] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U197 (.Z(\chs_out_f[3][DATA][21] ), 
	.E(n133), 
	.D(FE_OFN1008_n2), 
	.C(n23), 
	.B(FE_OFN1013_n7), 
	.A(n57));
   HS65_LS_AOI222X2 U198 (.Z(n133), 
	.F(\chs_in_f[1][DATA][21] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][21] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][21] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U199 (.Z(\chs_out_f[3][DATA][22] ), 
	.E(n132), 
	.D(FE_OFN1008_n2), 
	.C(n22), 
	.B(FE_OFN1013_n7), 
	.A(n56));
   HS65_LS_AOI222X2 U200 (.Z(n132), 
	.F(\chs_in_f[1][DATA][22] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][22] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][22] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U201 (.Z(\chs_out_f[3][DATA][23] ), 
	.E(n131), 
	.D(FE_OFN1008_n2), 
	.C(n21), 
	.B(FE_OFN1013_n7), 
	.A(n55));
   HS65_LS_AOI222X2 U202 (.Z(n131), 
	.F(\chs_in_f[1][DATA][23] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][23] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][23] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U203 (.Z(\chs_out_f[3][DATA][24] ), 
	.E(n130), 
	.D(n2), 
	.C(n20), 
	.B(n7), 
	.A(n54));
   HS65_LS_AOI222X2 U204 (.Z(n130), 
	.F(\chs_in_f[1][DATA][24] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][24] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][24] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_OAI212X5 U205 (.Z(\chs_out_f[3][DATA][25] ), 
	.E(n129), 
	.D(n2), 
	.C(n19), 
	.B(n7), 
	.A(n53));
   HS65_LS_AOI222X2 U206 (.Z(n129), 
	.F(\chs_in_f[1][DATA][25] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][25] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][25] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_OAI212X5 U207 (.Z(\chs_out_f[3][DATA][26] ), 
	.E(n128), 
	.D(n2), 
	.C(n18), 
	.B(n7), 
	.A(n52));
   HS65_LS_AOI222X2 U208 (.Z(n128), 
	.F(\chs_in_f[1][DATA][26] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][26] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][26] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_OAI212X5 U209 (.Z(\chs_out_f[3][DATA][27] ), 
	.E(n127), 
	.D(n2), 
	.C(n17), 
	.B(n7), 
	.A(n51));
   HS65_LS_AOI222X2 U210 (.Z(n127), 
	.F(\chs_in_f[1][DATA][27] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][27] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][27] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_OAI212X5 U211 (.Z(\chs_out_f[3][DATA][28] ), 
	.E(n126), 
	.D(n2), 
	.C(n16), 
	.B(n7), 
	.A(n50));
   HS65_LS_AOI222X2 U212 (.Z(n126), 
	.F(\chs_in_f[1][DATA][28] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][28] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][28] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_OAI212X5 U213 (.Z(\chs_out_f[3][DATA][29] ), 
	.E(n125), 
	.D(n2), 
	.C(n15), 
	.B(n7), 
	.A(n49));
   HS65_LS_AOI222X2 U214 (.Z(n125), 
	.F(\chs_in_f[1][DATA][29] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][29] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][29] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_OAI212X5 U215 (.Z(\chs_out_f[3][DATA][30] ), 
	.E(n123), 
	.D(n2), 
	.C(n14), 
	.B(n7), 
	.A(n48));
   HS65_LS_AOI222X2 U216 (.Z(n123), 
	.F(\chs_in_f[1][DATA][30] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][30] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][30] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_OAI212X5 U217 (.Z(\chs_out_f[3][DATA][31] ), 
	.E(n122), 
	.D(n2), 
	.C(n13), 
	.B(n7), 
	.A(n47));
   HS65_LS_AOI222X2 U218 (.Z(n122), 
	.F(\chs_in_f[1][DATA][31] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][31] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][31] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_OAI212X5 U219 (.Z(\chs_out_f[3][DATA][32] ), 
	.E(n121), 
	.D(n2), 
	.C(n12), 
	.B(n7), 
	.A(n46));
   HS65_LS_AOI222X2 U220 (.Z(n121), 
	.F(\chs_in_f[1][DATA][32] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][32] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][32] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_OAI212X5 U221 (.Z(\chs_out_f[2][DATA][0] ), 
	.E(n180), 
	.D(FE_OFN1007_n3), 
	.C(n44), 
	.B(n8), 
	.A(n78));
   HS65_LS_AOI222X2 U222 (.Z(n180), 
	.F(\chs_in_f[1][DATA][0] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][0] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][0] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U223 (.Z(\chs_out_f[2][DATA][1] ), 
	.E(n169), 
	.D(FE_OFN1007_n3), 
	.C(n43), 
	.B(n8), 
	.A(n77));
   HS65_LS_AOI222X2 U224 (.Z(n169), 
	.F(\chs_in_f[1][DATA][1] ), 
	.E(FE_OFN1022_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][1] ), 
	.C(FE_OFN1032_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][1] ), 
	.A(FE_OFN1027_switch_sel_12_));
   HS65_LS_OAI212X5 U225 (.Z(\chs_out_f[2][DATA][2] ), 
	.E(n158), 
	.D(FE_OFN1007_n3), 
	.C(n42), 
	.B(n8), 
	.A(n76));
   HS65_LS_AOI222X2 U226 (.Z(n158), 
	.F(\chs_in_f[1][DATA][2] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][2] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][2] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U227 (.Z(\chs_out_f[2][DATA][10] ), 
	.E(n179), 
	.D(n3), 
	.C(n34), 
	.B(FE_OFN1012_n8), 
	.A(n68));
   HS65_LS_AOI222X2 U228 (.Z(n179), 
	.F(\chs_in_f[1][DATA][10] ), 
	.E(FE_OFN1022_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][10] ), 
	.C(FE_OFN1032_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][10] ), 
	.A(FE_OFN1027_switch_sel_12_));
   HS65_LS_OAI212X5 U229 (.Z(\chs_out_f[2][DATA][11] ), 
	.E(n178), 
	.D(n3), 
	.C(n33), 
	.B(FE_OFN1012_n8), 
	.A(n67));
   HS65_LS_AOI222X2 U230 (.Z(n178), 
	.F(\chs_in_f[1][DATA][11] ), 
	.E(FE_OFN1022_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][11] ), 
	.C(FE_OFN1032_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][11] ), 
	.A(FE_OFN1027_switch_sel_12_));
   HS65_LS_OAI212X5 U231 (.Z(\chs_out_f[2][DATA][12] ), 
	.E(n177), 
	.D(n3), 
	.C(n32), 
	.B(FE_OFN1012_n8), 
	.A(n66));
   HS65_LS_AOI222X2 U232 (.Z(n177), 
	.F(\chs_in_f[1][DATA][12] ), 
	.E(FE_OFN1022_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][12] ), 
	.C(FE_OFN1032_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][12] ), 
	.A(FE_OFN1027_switch_sel_12_));
   HS65_LS_OAI212X5 U233 (.Z(\chs_out_f[2][DATA][13] ), 
	.E(n176), 
	.D(n3), 
	.C(n31), 
	.B(FE_OFN1012_n8), 
	.A(n65));
   HS65_LS_AOI222X2 U234 (.Z(n176), 
	.F(\chs_in_f[1][DATA][13] ), 
	.E(FE_OFN1022_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][13] ), 
	.C(FE_OFN1032_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][13] ), 
	.A(FE_OFN1027_switch_sel_12_));
   HS65_LS_OAI212X5 U235 (.Z(\chs_out_f[2][DATA][14] ), 
	.E(n175), 
	.D(n3), 
	.C(n30), 
	.B(FE_OFN1012_n8), 
	.A(n64));
   HS65_LS_AOI222X2 U236 (.Z(n175), 
	.F(\chs_in_f[1][DATA][14] ), 
	.E(FE_OFN1022_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][14] ), 
	.C(FE_OFN1032_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][14] ), 
	.A(FE_OFN1027_switch_sel_12_));
   HS65_LS_OAI212X5 U237 (.Z(\chs_out_f[2][DATA][15] ), 
	.E(n174), 
	.D(n3), 
	.C(n29), 
	.B(FE_OFN1012_n8), 
	.A(n63));
   HS65_LS_AOI222X2 U238 (.Z(n174), 
	.F(\chs_in_f[1][DATA][15] ), 
	.E(FE_OFN1022_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][15] ), 
	.C(FE_OFN1032_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][15] ), 
	.A(FE_OFN1027_switch_sel_12_));
   HS65_LS_OAI212X5 U239 (.Z(\chs_out_f[2][DATA][16] ), 
	.E(n173), 
	.D(n3), 
	.C(n28), 
	.B(FE_OFN1012_n8), 
	.A(n62));
   HS65_LS_AOI222X2 U240 (.Z(n173), 
	.F(\chs_in_f[1][DATA][16] ), 
	.E(FE_OFN1022_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][16] ), 
	.C(FE_OFN1032_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][16] ), 
	.A(FE_OFN1027_switch_sel_12_));
   HS65_LS_OAI212X5 U241 (.Z(\chs_out_f[2][DATA][17] ), 
	.E(n172), 
	.D(n3), 
	.C(n27), 
	.B(FE_OFN1012_n8), 
	.A(n61));
   HS65_LS_AOI222X2 U242 (.Z(n172), 
	.F(\chs_in_f[1][DATA][17] ), 
	.E(FE_OFN1022_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][17] ), 
	.C(FE_OFN1032_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][17] ), 
	.A(FE_OFN1027_switch_sel_12_));
   HS65_LS_OAI212X5 U243 (.Z(\chs_out_f[2][DATA][18] ), 
	.E(n171), 
	.D(n3), 
	.C(n26), 
	.B(FE_OFN1012_n8), 
	.A(n60));
   HS65_LS_AOI222X2 U244 (.Z(n171), 
	.F(\chs_in_f[1][DATA][18] ), 
	.E(FE_OFN1022_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][18] ), 
	.C(FE_OFN1032_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][18] ), 
	.A(FE_OFN1027_switch_sel_12_));
   HS65_LS_OAI212X5 U245 (.Z(\chs_out_f[2][DATA][19] ), 
	.E(n170), 
	.D(n3), 
	.C(n25), 
	.B(FE_OFN1012_n8), 
	.A(n59));
   HS65_LS_AOI222X2 U246 (.Z(n170), 
	.F(\chs_in_f[1][DATA][19] ), 
	.E(FE_OFN1022_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][19] ), 
	.C(FE_OFN1032_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][19] ), 
	.A(FE_OFN1027_switch_sel_12_));
   HS65_LS_OAI212X5 U247 (.Z(\chs_out_f[2][DATA][20] ), 
	.E(n168), 
	.D(n3), 
	.C(n24), 
	.B(FE_OFN1012_n8), 
	.A(n58));
   HS65_LS_AOI222X2 U248 (.Z(n168), 
	.F(\chs_in_f[1][DATA][20] ), 
	.E(FE_OFN1022_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][20] ), 
	.C(FE_OFN1032_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][20] ), 
	.A(FE_OFN1027_switch_sel_12_));
   HS65_LS_OAI212X5 U249 (.Z(\chs_out_f[2][DATA][21] ), 
	.E(n167), 
	.D(n3), 
	.C(n23), 
	.B(FE_OFN1012_n8), 
	.A(n57));
   HS65_LS_AOI222X2 U250 (.Z(n167), 
	.F(\chs_in_f[1][DATA][21] ), 
	.E(FE_OFN1022_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][21] ), 
	.C(FE_OFN1032_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][21] ), 
	.A(FE_OFN1027_switch_sel_12_));
   HS65_LS_OAI212X5 U251 (.Z(\chs_out_f[2][DATA][22] ), 
	.E(n166), 
	.D(n3), 
	.C(n22), 
	.B(FE_OFN1012_n8), 
	.A(n56));
   HS65_LS_AOI222X2 U252 (.Z(n166), 
	.F(\chs_in_f[1][DATA][22] ), 
	.E(FE_OFN1022_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][22] ), 
	.C(FE_OFN1032_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][22] ), 
	.A(FE_OFN1027_switch_sel_12_));
   HS65_LS_OAI212X5 U253 (.Z(\chs_out_f[2][DATA][23] ), 
	.E(n165), 
	.D(FE_OFN1007_n3), 
	.C(n21), 
	.B(FE_OFN1012_n8), 
	.A(n55));
   HS65_LS_AOI222X2 U254 (.Z(n165), 
	.F(\chs_in_f[1][DATA][23] ), 
	.E(FE_OFN1022_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][23] ), 
	.C(FE_OFN1032_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][23] ), 
	.A(FE_OFN1027_switch_sel_12_));
   HS65_LS_OAI212X5 U255 (.Z(\chs_out_f[2][DATA][24] ), 
	.E(n164), 
	.D(FE_OFN1007_n3), 
	.C(n20), 
	.B(n8), 
	.A(n54));
   HS65_LS_AOI222X2 U256 (.Z(n164), 
	.F(\chs_in_f[1][DATA][24] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][24] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][24] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U257 (.Z(\chs_out_f[2][DATA][25] ), 
	.E(n163), 
	.D(FE_OFN1007_n3), 
	.C(n19), 
	.B(n8), 
	.A(n53));
   HS65_LS_AOI222X2 U258 (.Z(n163), 
	.F(\chs_in_f[1][DATA][25] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][25] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][25] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U259 (.Z(\chs_out_f[2][DATA][26] ), 
	.E(n162), 
	.D(FE_OFN1007_n3), 
	.C(n18), 
	.B(n8), 
	.A(n52));
   HS65_LS_AOI222X2 U260 (.Z(n162), 
	.F(\chs_in_f[1][DATA][26] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][26] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][26] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U261 (.Z(\chs_out_f[2][DATA][27] ), 
	.E(n161), 
	.D(FE_OFN1007_n3), 
	.C(n17), 
	.B(n8), 
	.A(n51));
   HS65_LS_AOI222X2 U262 (.Z(n161), 
	.F(\chs_in_f[1][DATA][27] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][27] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][27] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U263 (.Z(\chs_out_f[2][DATA][28] ), 
	.E(n160), 
	.D(FE_OFN1007_n3), 
	.C(n16), 
	.B(n8), 
	.A(n50));
   HS65_LS_AOI222X2 U264 (.Z(n160), 
	.F(\chs_in_f[1][DATA][28] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][28] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][28] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U265 (.Z(\chs_out_f[2][DATA][29] ), 
	.E(n159), 
	.D(FE_OFN1007_n3), 
	.C(n15), 
	.B(n8), 
	.A(n49));
   HS65_LS_AOI222X2 U266 (.Z(n159), 
	.F(\chs_in_f[1][DATA][29] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][29] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][29] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U267 (.Z(\chs_out_f[2][DATA][30] ), 
	.E(n157), 
	.D(FE_OFN1007_n3), 
	.C(n14), 
	.B(n8), 
	.A(n48));
   HS65_LS_AOI222X2 U268 (.Z(n157), 
	.F(\chs_in_f[1][DATA][30] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][30] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][30] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U269 (.Z(\chs_out_f[2][DATA][31] ), 
	.E(n156), 
	.D(FE_OFN1007_n3), 
	.C(n13), 
	.B(n8), 
	.A(n47));
   HS65_LS_AOI222X2 U270 (.Z(n156), 
	.F(\chs_in_f[1][DATA][31] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][31] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][31] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U271 (.Z(\chs_out_f[2][DATA][32] ), 
	.E(n155), 
	.D(FE_OFN1007_n3), 
	.C(n12), 
	.B(n8), 
	.A(n46));
   HS65_LS_AOI222X2 U272 (.Z(n155), 
	.F(\chs_in_f[1][DATA][32] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][32] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][32] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U273 (.Z(\chs_out_f[1][DATA][0] ), 
	.E(n214), 
	.D(FE_OFN1006_n4), 
	.C(n44), 
	.B(FE_OFN1011_n9), 
	.A(n78));
   HS65_LS_AOI222X2 U274 (.Z(n214), 
	.F(\chs_in_f[1][DATA][0] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][0] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][0] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_OAI212X5 U275 (.Z(\chs_out_f[1][DATA][1] ), 
	.E(n203), 
	.D(FE_OFN1006_n4), 
	.C(n43), 
	.B(FE_OFN1011_n9), 
	.A(n77));
   HS65_LS_AOI222X2 U276 (.Z(n203), 
	.F(\chs_in_f[1][DATA][1] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][1] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][1] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U277 (.Z(\chs_out_f[1][DATA][2] ), 
	.E(n192), 
	.D(FE_OFN1006_n4), 
	.C(n42), 
	.B(FE_OFN1011_n9), 
	.A(n76));
   HS65_LS_AOI222X2 U278 (.Z(n192), 
	.F(\chs_in_f[1][DATA][2] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][2] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][2] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_OAI212X5 U279 (.Z(\chs_out_f[1][DATA][10] ), 
	.E(n213), 
	.D(n4), 
	.C(n34), 
	.B(n9), 
	.A(n68));
   HS65_LS_AOI222X2 U280 (.Z(n213), 
	.F(\chs_in_f[1][DATA][10] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][10] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][10] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U281 (.Z(\chs_out_f[1][DATA][11] ), 
	.E(n212), 
	.D(n4), 
	.C(n33), 
	.B(n9), 
	.A(n67));
   HS65_LS_AOI222X2 U282 (.Z(n212), 
	.F(\chs_in_f[1][DATA][11] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][11] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][11] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U283 (.Z(\chs_out_f[1][DATA][12] ), 
	.E(n211), 
	.D(n4), 
	.C(n32), 
	.B(n9), 
	.A(n66));
   HS65_LS_AOI222X2 U284 (.Z(n211), 
	.F(\chs_in_f[1][DATA][12] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][12] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][12] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U285 (.Z(\chs_out_f[1][DATA][13] ), 
	.E(n210), 
	.D(n4), 
	.C(n31), 
	.B(n9), 
	.A(n65));
   HS65_LS_AOI222X2 U286 (.Z(n210), 
	.F(\chs_in_f[1][DATA][13] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][13] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][13] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U287 (.Z(\chs_out_f[1][DATA][14] ), 
	.E(n209), 
	.D(n4), 
	.C(n30), 
	.B(n9), 
	.A(n64));
   HS65_LS_AOI222X2 U288 (.Z(n209), 
	.F(\chs_in_f[1][DATA][14] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][14] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][14] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U289 (.Z(\chs_out_f[1][DATA][15] ), 
	.E(n208), 
	.D(n4), 
	.C(n29), 
	.B(n9), 
	.A(n63));
   HS65_LS_AOI222X2 U290 (.Z(n208), 
	.F(\chs_in_f[1][DATA][15] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][15] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][15] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U291 (.Z(\chs_out_f[1][DATA][16] ), 
	.E(n207), 
	.D(n4), 
	.C(n28), 
	.B(n9), 
	.A(n62));
   HS65_LS_AOI222X2 U292 (.Z(n207), 
	.F(\chs_in_f[1][DATA][16] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][16] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][16] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U293 (.Z(\chs_out_f[1][DATA][17] ), 
	.E(n206), 
	.D(n4), 
	.C(n27), 
	.B(n9), 
	.A(n61));
   HS65_LS_AOI222X2 U294 (.Z(n206), 
	.F(\chs_in_f[1][DATA][17] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][17] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][17] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U295 (.Z(\chs_out_f[1][DATA][18] ), 
	.E(n205), 
	.D(n4), 
	.C(n26), 
	.B(n9), 
	.A(n60));
   HS65_LS_AOI222X2 U296 (.Z(n205), 
	.F(\chs_in_f[1][DATA][18] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][18] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][18] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U297 (.Z(\chs_out_f[1][DATA][19] ), 
	.E(n204), 
	.D(n4), 
	.C(n25), 
	.B(n9), 
	.A(n59));
   HS65_LS_AOI222X2 U298 (.Z(n204), 
	.F(\chs_in_f[1][DATA][19] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][19] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][19] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U299 (.Z(\chs_out_f[1][DATA][20] ), 
	.E(n202), 
	.D(n4), 
	.C(n24), 
	.B(n9), 
	.A(n58));
   HS65_LS_AOI222X2 U300 (.Z(n202), 
	.F(\chs_in_f[1][DATA][20] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][20] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][20] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U301 (.Z(\chs_out_f[1][DATA][21] ), 
	.E(n201), 
	.D(n4), 
	.C(n23), 
	.B(n9), 
	.A(n57));
   HS65_LS_AOI222X2 U302 (.Z(n201), 
	.F(\chs_in_f[1][DATA][21] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][21] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][21] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U303 (.Z(\chs_out_f[1][DATA][22] ), 
	.E(n200), 
	.D(n4), 
	.C(n22), 
	.B(FE_OFN1011_n9), 
	.A(n56));
   HS65_LS_AOI222X2 U304 (.Z(n200), 
	.F(\chs_in_f[1][DATA][22] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][22] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][22] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U305 (.Z(\chs_out_f[1][DATA][23] ), 
	.E(n199), 
	.D(FE_OFN1006_n4), 
	.C(n21), 
	.B(FE_OFN1011_n9), 
	.A(n55));
   HS65_LS_AOI222X2 U306 (.Z(n199), 
	.F(\chs_in_f[1][DATA][23] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][23] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][23] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U307 (.Z(\chs_out_f[1][DATA][24] ), 
	.E(n198), 
	.D(FE_OFN1006_n4), 
	.C(n20), 
	.B(FE_OFN1011_n9), 
	.A(n54));
   HS65_LS_AOI222X2 U308 (.Z(n198), 
	.F(\chs_in_f[1][DATA][24] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][24] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][24] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_OAI212X5 U309 (.Z(\chs_out_f[1][DATA][25] ), 
	.E(n197), 
	.D(FE_OFN1006_n4), 
	.C(n19), 
	.B(FE_OFN1011_n9), 
	.A(n53));
   HS65_LS_AOI222X2 U310 (.Z(n197), 
	.F(\chs_in_f[1][DATA][25] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][25] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][25] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_OAI212X5 U311 (.Z(\chs_out_f[1][DATA][26] ), 
	.E(n196), 
	.D(FE_OFN1006_n4), 
	.C(n18), 
	.B(FE_OFN1011_n9), 
	.A(n52));
   HS65_LS_AOI222X2 U312 (.Z(n196), 
	.F(\chs_in_f[1][DATA][26] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][26] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][26] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_OAI212X5 U313 (.Z(\chs_out_f[1][DATA][27] ), 
	.E(n195), 
	.D(FE_OFN1006_n4), 
	.C(n17), 
	.B(FE_OFN1011_n9), 
	.A(n51));
   HS65_LS_AOI222X2 U314 (.Z(n195), 
	.F(\chs_in_f[1][DATA][27] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][27] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][27] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_OAI212X5 U315 (.Z(\chs_out_f[1][DATA][28] ), 
	.E(n194), 
	.D(FE_OFN1006_n4), 
	.C(n16), 
	.B(FE_OFN1011_n9), 
	.A(n50));
   HS65_LS_AOI222X2 U316 (.Z(n194), 
	.F(\chs_in_f[1][DATA][28] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][28] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][28] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_OAI212X5 U317 (.Z(\chs_out_f[1][DATA][29] ), 
	.E(n193), 
	.D(FE_OFN1006_n4), 
	.C(n15), 
	.B(FE_OFN1011_n9), 
	.A(n49));
   HS65_LS_AOI222X2 U318 (.Z(n193), 
	.F(\chs_in_f[1][DATA][29] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][29] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][29] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_OAI212X5 U319 (.Z(\chs_out_f[1][DATA][30] ), 
	.E(n191), 
	.D(FE_OFN1006_n4), 
	.C(n14), 
	.B(FE_OFN1011_n9), 
	.A(n48));
   HS65_LS_AOI222X2 U320 (.Z(n191), 
	.F(\chs_in_f[1][DATA][30] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][30] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][30] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_OAI212X5 U321 (.Z(\chs_out_f[1][DATA][31] ), 
	.E(n190), 
	.D(FE_OFN1006_n4), 
	.C(n13), 
	.B(FE_OFN1011_n9), 
	.A(n47));
   HS65_LS_AOI222X2 U322 (.Z(n190), 
	.F(\chs_in_f[1][DATA][31] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][31] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][31] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_OAI212X5 U323 (.Z(\chs_out_f[1][DATA][32] ), 
	.E(n189), 
	.D(FE_OFN1006_n4), 
	.C(n12), 
	.B(FE_OFN1011_n9), 
	.A(n46));
   HS65_LS_AOI222X2 U324 (.Z(n189), 
	.F(\chs_in_f[1][DATA][32] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][32] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][32] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_OAI212X5 U325 (.Z(\chs_out_f[0][DATA][0] ), 
	.E(n248), 
	.D(FE_OFN1005_n5), 
	.C(n44), 
	.B(n10), 
	.A(n78));
   HS65_LS_AOI222X2 U326 (.Z(n248), 
	.F(\chs_in_f[1][DATA][0] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][0] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][0] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U327 (.Z(\chs_out_f[0][DATA][1] ), 
	.E(n237), 
	.D(FE_OFN1005_n5), 
	.C(n43), 
	.B(n10), 
	.A(n77));
   HS65_LS_AOI222X2 U328 (.Z(n237), 
	.F(\chs_in_f[1][DATA][1] ), 
	.E(FE_OFN1020_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][1] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][1] ), 
	.A(FE_OFN1025_switch_sel_10_));
   HS65_LS_OAI212X5 U329 (.Z(\chs_out_f[0][DATA][2] ), 
	.E(n226), 
	.D(FE_OFN1005_n5), 
	.C(n42), 
	.B(n10), 
	.A(n76));
   HS65_LS_AOI222X2 U330 (.Z(n226), 
	.F(\chs_in_f[1][DATA][2] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][2] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][2] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U331 (.Z(\chs_out_f[0][DATA][10] ), 
	.E(n247), 
	.D(n5), 
	.C(n34), 
	.B(FE_OFN1010_n10), 
	.A(n68));
   HS65_LS_AOI222X2 U332 (.Z(n247), 
	.F(\chs_in_f[1][DATA][10] ), 
	.E(FE_OFN1020_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][10] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][10] ), 
	.A(FE_OFN1025_switch_sel_10_));
   HS65_LS_OAI212X5 U333 (.Z(\chs_out_f[0][DATA][11] ), 
	.E(n246), 
	.D(n5), 
	.C(n33), 
	.B(FE_OFN1010_n10), 
	.A(n67));
   HS65_LS_AOI222X2 U334 (.Z(n246), 
	.F(\chs_in_f[1][DATA][11] ), 
	.E(FE_OFN1020_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][11] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][11] ), 
	.A(FE_OFN1025_switch_sel_10_));
   HS65_LS_OAI212X5 U335 (.Z(\chs_out_f[0][DATA][12] ), 
	.E(n245), 
	.D(n5), 
	.C(n32), 
	.B(FE_OFN1010_n10), 
	.A(n66));
   HS65_LS_AOI222X2 U336 (.Z(n245), 
	.F(\chs_in_f[1][DATA][12] ), 
	.E(FE_OFN1020_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][12] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][12] ), 
	.A(FE_OFN1025_switch_sel_10_));
   HS65_LS_OAI212X5 U337 (.Z(\chs_out_f[0][DATA][13] ), 
	.E(n244), 
	.D(n5), 
	.C(n31), 
	.B(FE_OFN1010_n10), 
	.A(n65));
   HS65_LS_AOI222X2 U338 (.Z(n244), 
	.F(\chs_in_f[1][DATA][13] ), 
	.E(FE_OFN1020_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][13] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][13] ), 
	.A(FE_OFN1025_switch_sel_10_));
   HS65_LS_OAI212X5 U339 (.Z(\chs_out_f[0][DATA][14] ), 
	.E(n243), 
	.D(n5), 
	.C(n30), 
	.B(FE_OFN1010_n10), 
	.A(n64));
   HS65_LS_AOI222X2 U340 (.Z(n243), 
	.F(\chs_in_f[1][DATA][14] ), 
	.E(FE_OFN1020_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][14] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][14] ), 
	.A(FE_OFN1025_switch_sel_10_));
   HS65_LS_OAI212X5 U341 (.Z(\chs_out_f[0][DATA][15] ), 
	.E(n242), 
	.D(n5), 
	.C(n29), 
	.B(FE_OFN1010_n10), 
	.A(n63));
   HS65_LS_AOI222X2 U342 (.Z(n242), 
	.F(\chs_in_f[1][DATA][15] ), 
	.E(FE_OFN1020_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][15] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][15] ), 
	.A(FE_OFN1025_switch_sel_10_));
   HS65_LS_OAI212X5 U343 (.Z(\chs_out_f[0][DATA][16] ), 
	.E(n241), 
	.D(n5), 
	.C(n28), 
	.B(FE_OFN1010_n10), 
	.A(n62));
   HS65_LS_AOI222X2 U344 (.Z(n241), 
	.F(\chs_in_f[1][DATA][16] ), 
	.E(FE_OFN1020_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][16] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][16] ), 
	.A(FE_OFN1025_switch_sel_10_));
   HS65_LS_OAI212X5 U345 (.Z(\chs_out_f[0][DATA][17] ), 
	.E(n240), 
	.D(n5), 
	.C(n27), 
	.B(FE_OFN1010_n10), 
	.A(n61));
   HS65_LS_AOI222X2 U346 (.Z(n240), 
	.F(\chs_in_f[1][DATA][17] ), 
	.E(FE_OFN1020_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][17] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][17] ), 
	.A(FE_OFN1025_switch_sel_10_));
   HS65_LS_OAI212X5 U347 (.Z(\chs_out_f[0][DATA][18] ), 
	.E(n239), 
	.D(n5), 
	.C(n26), 
	.B(FE_OFN1010_n10), 
	.A(n60));
   HS65_LS_AOI222X2 U348 (.Z(n239), 
	.F(\chs_in_f[1][DATA][18] ), 
	.E(FE_OFN1020_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][18] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][18] ), 
	.A(FE_OFN1025_switch_sel_10_));
   HS65_LS_OAI212X5 U349 (.Z(\chs_out_f[0][DATA][19] ), 
	.E(n238), 
	.D(n5), 
	.C(n25), 
	.B(FE_OFN1010_n10), 
	.A(n59));
   HS65_LS_AOI222X2 U350 (.Z(n238), 
	.F(\chs_in_f[1][DATA][19] ), 
	.E(FE_OFN1020_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][19] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][19] ), 
	.A(FE_OFN1025_switch_sel_10_));
   HS65_LS_OAI212X5 U351 (.Z(\chs_out_f[0][DATA][20] ), 
	.E(n236), 
	.D(n5), 
	.C(n24), 
	.B(FE_OFN1010_n10), 
	.A(n58));
   HS65_LS_AOI222X2 U352 (.Z(n236), 
	.F(\chs_in_f[1][DATA][20] ), 
	.E(FE_OFN1020_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][20] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][20] ), 
	.A(FE_OFN1025_switch_sel_10_));
   HS65_LS_OAI212X5 U353 (.Z(\chs_out_f[0][DATA][21] ), 
	.E(n235), 
	.D(FE_OFN1005_n5), 
	.C(n23), 
	.B(FE_OFN1010_n10), 
	.A(n57));
   HS65_LS_AOI222X2 U354 (.Z(n235), 
	.F(\chs_in_f[1][DATA][21] ), 
	.E(FE_OFN1020_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][21] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][21] ), 
	.A(FE_OFN1025_switch_sel_10_));
   HS65_LS_OAI212X5 U355 (.Z(\chs_out_f[0][DATA][22] ), 
	.E(n234), 
	.D(n5), 
	.C(n22), 
	.B(FE_OFN1010_n10), 
	.A(n56));
   HS65_LS_AOI222X2 U356 (.Z(n234), 
	.F(\chs_in_f[1][DATA][22] ), 
	.E(FE_OFN1020_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][22] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][22] ), 
	.A(FE_OFN1025_switch_sel_10_));
   HS65_LS_OAI212X5 U357 (.Z(\chs_out_f[0][DATA][23] ), 
	.E(n233), 
	.D(n5), 
	.C(n21), 
	.B(FE_OFN1010_n10), 
	.A(n55));
   HS65_LS_AOI222X2 U358 (.Z(n233), 
	.F(\chs_in_f[1][DATA][23] ), 
	.E(FE_OFN1020_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][23] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][23] ), 
	.A(FE_OFN1025_switch_sel_10_));
   HS65_LS_OAI212X5 U359 (.Z(\chs_out_f[0][DATA][24] ), 
	.E(n232), 
	.D(FE_OFN1005_n5), 
	.C(n20), 
	.B(n10), 
	.A(n54));
   HS65_LS_AOI222X2 U360 (.Z(n232), 
	.F(\chs_in_f[1][DATA][24] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][24] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][24] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U361 (.Z(\chs_out_f[0][DATA][25] ), 
	.E(n231), 
	.D(FE_OFN1005_n5), 
	.C(n19), 
	.B(n10), 
	.A(n53));
   HS65_LS_AOI222X2 U362 (.Z(n231), 
	.F(\chs_in_f[1][DATA][25] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][25] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][25] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U363 (.Z(\chs_out_f[0][DATA][26] ), 
	.E(n230), 
	.D(FE_OFN1005_n5), 
	.C(n18), 
	.B(n10), 
	.A(n52));
   HS65_LS_AOI222X2 U364 (.Z(n230), 
	.F(\chs_in_f[1][DATA][26] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][26] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][26] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U365 (.Z(\chs_out_f[0][DATA][27] ), 
	.E(n229), 
	.D(FE_OFN1005_n5), 
	.C(n17), 
	.B(n10), 
	.A(n51));
   HS65_LS_AOI222X2 U366 (.Z(n229), 
	.F(\chs_in_f[1][DATA][27] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][27] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][27] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U367 (.Z(\chs_out_f[0][DATA][28] ), 
	.E(n228), 
	.D(FE_OFN1005_n5), 
	.C(n16), 
	.B(n10), 
	.A(n50));
   HS65_LS_AOI222X2 U368 (.Z(n228), 
	.F(\chs_in_f[1][DATA][28] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][28] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][28] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U369 (.Z(\chs_out_f[0][DATA][29] ), 
	.E(n227), 
	.D(FE_OFN1005_n5), 
	.C(n15), 
	.B(n10), 
	.A(n49));
   HS65_LS_AOI222X2 U370 (.Z(n227), 
	.F(\chs_in_f[1][DATA][29] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][29] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][29] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U371 (.Z(\chs_out_f[0][DATA][30] ), 
	.E(n225), 
	.D(FE_OFN1005_n5), 
	.C(n14), 
	.B(n10), 
	.A(n48));
   HS65_LS_AOI222X2 U372 (.Z(n225), 
	.F(\chs_in_f[1][DATA][30] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][30] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][30] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U373 (.Z(\chs_out_f[0][DATA][31] ), 
	.E(n224), 
	.D(FE_OFN1005_n5), 
	.C(n13), 
	.B(n10), 
	.A(n47));
   HS65_LS_AOI222X2 U374 (.Z(n224), 
	.F(\chs_in_f[1][DATA][31] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][31] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][31] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U375 (.Z(\chs_out_f[0][DATA][32] ), 
	.E(n223), 
	.D(FE_OFN1005_n5), 
	.C(n12), 
	.B(n10), 
	.A(n46));
   HS65_LS_AOI222X2 U376 (.Z(n223), 
	.F(\chs_in_f[1][DATA][32] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][32] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][32] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U377 (.Z(\chs_out_f[3][DATA][3] ), 
	.E(n119), 
	.D(FE_OFN1008_n2), 
	.C(n41), 
	.B(FE_OFN1013_n7), 
	.A(n75));
   HS65_LS_AOI222X2 U378 (.Z(n119), 
	.F(\chs_in_f[1][DATA][3] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][3] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][3] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U379 (.Z(\chs_out_f[3][DATA][4] ), 
	.E(n118), 
	.D(n2), 
	.C(n40), 
	.B(n7), 
	.A(n74));
   HS65_LS_AOI222X2 U380 (.Z(n118), 
	.F(\chs_in_f[1][DATA][4] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][4] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][4] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_OAI212X5 U381 (.Z(\chs_out_f[3][DATA][5] ), 
	.E(n117), 
	.D(n2), 
	.C(n39), 
	.B(n7), 
	.A(n73));
   HS65_LS_AOI222X2 U382 (.Z(n117), 
	.F(\chs_in_f[1][DATA][5] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][5] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][5] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U383 (.Z(\chs_out_f[3][DATA][6] ), 
	.E(n116), 
	.D(FE_OFN1008_n2), 
	.C(n38), 
	.B(FE_OFN1013_n7), 
	.A(n72));
   HS65_LS_AOI222X2 U384 (.Z(n116), 
	.F(\chs_in_f[1][DATA][6] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][6] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][6] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U385 (.Z(\chs_out_f[3][DATA][7] ), 
	.E(n115), 
	.D(FE_OFN1008_n2), 
	.C(n37), 
	.B(FE_OFN1013_n7), 
	.A(n71));
   HS65_LS_AOI222X2 U386 (.Z(n115), 
	.F(\chs_in_f[1][DATA][7] ), 
	.E(FE_OFN1023_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][7] ), 
	.C(FE_OFN1033_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][7] ), 
	.A(FE_OFN1028_switch_sel_13_));
   HS65_LS_OAI212X5 U387 (.Z(\chs_out_f[3][DATA][8] ), 
	.E(n114), 
	.D(n2), 
	.C(n36), 
	.B(n7), 
	.A(n70));
   HS65_LS_AOI222X2 U388 (.Z(n114), 
	.F(\chs_in_f[1][DATA][8] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][8] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][8] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_OAI212X5 U389 (.Z(\chs_out_f[2][DATA][3] ), 
	.E(n153), 
	.D(FE_OFN1007_n3), 
	.C(n41), 
	.B(n8), 
	.A(n75));
   HS65_LS_AOI222X2 U390 (.Z(n153), 
	.F(\chs_in_f[1][DATA][3] ), 
	.E(FE_OFN1022_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][3] ), 
	.C(FE_OFN1032_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][3] ), 
	.A(FE_OFN1027_switch_sel_12_));
   HS65_LS_OAI212X5 U391 (.Z(\chs_out_f[2][DATA][4] ), 
	.E(n152), 
	.D(FE_OFN1007_n3), 
	.C(n40), 
	.B(n8), 
	.A(n74));
   HS65_LS_AOI222X2 U392 (.Z(n152), 
	.F(\chs_in_f[1][DATA][4] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][4] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][4] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U393 (.Z(\chs_out_f[2][DATA][5] ), 
	.E(n151), 
	.D(FE_OFN1007_n3), 
	.C(n39), 
	.B(n8), 
	.A(n73));
   HS65_LS_AOI222X2 U394 (.Z(n151), 
	.F(\chs_in_f[1][DATA][5] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][5] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][5] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U395 (.Z(\chs_out_f[2][DATA][6] ), 
	.E(n150), 
	.D(FE_OFN1007_n3), 
	.C(n38), 
	.B(n8), 
	.A(n72));
   HS65_LS_AOI222X2 U396 (.Z(n150), 
	.F(\chs_in_f[1][DATA][6] ), 
	.E(FE_OFN1022_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][6] ), 
	.C(FE_OFN1032_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][6] ), 
	.A(FE_OFN1027_switch_sel_12_));
   HS65_LS_OAI212X5 U397 (.Z(\chs_out_f[2][DATA][7] ), 
	.E(n149), 
	.D(n3), 
	.C(n37), 
	.B(FE_OFN1012_n8), 
	.A(n71));
   HS65_LS_AOI222X2 U398 (.Z(n149), 
	.F(\chs_in_f[1][DATA][7] ), 
	.E(FE_OFN1022_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][7] ), 
	.C(FE_OFN1032_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][7] ), 
	.A(FE_OFN1027_switch_sel_12_));
   HS65_LS_OAI212X5 U399 (.Z(\chs_out_f[2][DATA][8] ), 
	.E(n148), 
	.D(FE_OFN1007_n3), 
	.C(n36), 
	.B(n8), 
	.A(n70));
   HS65_LS_AOI222X2 U400 (.Z(n148), 
	.F(\chs_in_f[1][DATA][8] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][8] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][8] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U401 (.Z(\chs_out_f[1][DATA][3] ), 
	.E(n187), 
	.D(FE_OFN1006_n4), 
	.C(n41), 
	.B(n9), 
	.A(n75));
   HS65_LS_AOI222X2 U402 (.Z(n187), 
	.F(\chs_in_f[1][DATA][3] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][3] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][3] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U403 (.Z(\chs_out_f[1][DATA][4] ), 
	.E(n186), 
	.D(FE_OFN1006_n4), 
	.C(n40), 
	.B(FE_OFN1011_n9), 
	.A(n74));
   HS65_LS_AOI222X2 U404 (.Z(n186), 
	.F(\chs_in_f[1][DATA][4] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][4] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][4] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_OAI212X5 U405 (.Z(\chs_out_f[1][DATA][5] ), 
	.E(n185), 
	.D(FE_OFN1006_n4), 
	.C(n39), 
	.B(FE_OFN1011_n9), 
	.A(n73));
   HS65_LS_AOI222X2 U406 (.Z(n185), 
	.F(\chs_in_f[1][DATA][5] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][5] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][5] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U407 (.Z(\chs_out_f[1][DATA][6] ), 
	.E(n184), 
	.D(FE_OFN1006_n4), 
	.C(n38), 
	.B(FE_OFN1011_n9), 
	.A(n72));
   HS65_LS_AOI222X2 U408 (.Z(n184), 
	.F(\chs_in_f[1][DATA][6] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][6] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][6] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U409 (.Z(\chs_out_f[1][DATA][7] ), 
	.E(n183), 
	.D(n4), 
	.C(n37), 
	.B(n9), 
	.A(n71));
   HS65_LS_AOI222X2 U410 (.Z(n183), 
	.F(\chs_in_f[1][DATA][7] ), 
	.E(FE_OFN1021_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][7] ), 
	.C(FE_OFN1031_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][7] ), 
	.A(FE_OFN1026_switch_sel_11_));
   HS65_LS_OAI212X5 U411 (.Z(\chs_out_f[1][DATA][8] ), 
	.E(n182), 
	.D(FE_OFN1006_n4), 
	.C(n36), 
	.B(FE_OFN1011_n9), 
	.A(n70));
   HS65_LS_AOI222X2 U412 (.Z(n182), 
	.F(\chs_in_f[1][DATA][8] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][8] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][8] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_OAI212X5 U413 (.Z(\chs_out_f[0][DATA][3] ), 
	.E(n221), 
	.D(FE_OFN1005_n5), 
	.C(n41), 
	.B(FE_OFN1010_n10), 
	.A(n75));
   HS65_LS_AOI222X2 U414 (.Z(n221), 
	.F(\chs_in_f[1][DATA][3] ), 
	.E(FE_OFN1020_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][3] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][3] ), 
	.A(FE_OFN1025_switch_sel_10_));
   HS65_LS_OAI212X5 U415 (.Z(\chs_out_f[0][DATA][4] ), 
	.E(n220), 
	.D(FE_OFN1005_n5), 
	.C(n40), 
	.B(n10), 
	.A(n74));
   HS65_LS_AOI222X2 U416 (.Z(n220), 
	.F(\chs_in_f[1][DATA][4] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][4] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][4] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U417 (.Z(\chs_out_f[0][DATA][5] ), 
	.E(n219), 
	.D(FE_OFN1005_n5), 
	.C(n39), 
	.B(n10), 
	.A(n73));
   HS65_LS_AOI222X2 U418 (.Z(n219), 
	.F(\chs_in_f[1][DATA][5] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][5] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][5] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U419 (.Z(\chs_out_f[0][DATA][6] ), 
	.E(n218), 
	.D(FE_OFN1005_n5), 
	.C(n38), 
	.B(FE_OFN1010_n10), 
	.A(n72));
   HS65_LS_AOI222X2 U420 (.Z(n218), 
	.F(\chs_in_f[1][DATA][6] ), 
	.E(FE_OFN1020_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][6] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][6] ), 
	.A(FE_OFN1025_switch_sel_10_));
   HS65_LS_OAI212X5 U421 (.Z(\chs_out_f[0][DATA][7] ), 
	.E(n217), 
	.D(FE_OFN1005_n5), 
	.C(n37), 
	.B(FE_OFN1010_n10), 
	.A(n71));
   HS65_LS_AOI222X2 U422 (.Z(n217), 
	.F(\chs_in_f[1][DATA][7] ), 
	.E(FE_OFN1020_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][7] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][7] ), 
	.A(FE_OFN1025_switch_sel_10_));
   HS65_LS_OAI212X5 U423 (.Z(\chs_out_f[0][DATA][8] ), 
	.E(n216), 
	.D(FE_OFN1005_n5), 
	.C(n36), 
	.B(n10), 
	.A(n70));
   HS65_LS_AOI222X2 U424 (.Z(n216), 
	.F(\chs_in_f[1][DATA][8] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][8] ), 
	.C(FE_OFN1030_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][8] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_IVX9 U425 (.Z(n69), 
	.A(\chs_in_f[3][DATA][9] ));
   HS65_LS_IVX9 U426 (.Z(n78), 
	.A(\chs_in_f[3][DATA][0] ));
   HS65_LS_IVX9 U427 (.Z(n77), 
	.A(\chs_in_f[3][DATA][1] ));
   HS65_LS_IVX9 U428 (.Z(n76), 
	.A(\chs_in_f[3][DATA][2] ));
   HS65_LS_IVX9 U429 (.Z(n75), 
	.A(\chs_in_f[3][DATA][3] ));
   HS65_LS_IVX9 U430 (.Z(n74), 
	.A(\chs_in_f[3][DATA][4] ));
   HS65_LS_IVX9 U431 (.Z(n73), 
	.A(\chs_in_f[3][DATA][5] ));
   HS65_LS_IVX9 U432 (.Z(n72), 
	.A(\chs_in_f[3][DATA][6] ));
   HS65_LS_IVX9 U433 (.Z(n71), 
	.A(\chs_in_f[3][DATA][7] ));
   HS65_LS_IVX9 U434 (.Z(n70), 
	.A(\chs_in_f[3][DATA][8] ));
   HS65_LS_IVX9 U435 (.Z(n68), 
	.A(\chs_in_f[3][DATA][10] ));
   HS65_LS_IVX9 U436 (.Z(n67), 
	.A(\chs_in_f[3][DATA][11] ));
   HS65_LS_IVX9 U437 (.Z(n66), 
	.A(\chs_in_f[3][DATA][12] ));
   HS65_LS_IVX9 U438 (.Z(n65), 
	.A(\chs_in_f[3][DATA][13] ));
   HS65_LS_IVX9 U439 (.Z(n64), 
	.A(\chs_in_f[3][DATA][14] ));
   HS65_LS_IVX9 U440 (.Z(n63), 
	.A(\chs_in_f[3][DATA][15] ));
   HS65_LS_IVX9 U441 (.Z(n62), 
	.A(\chs_in_f[3][DATA][16] ));
   HS65_LS_IVX9 U442 (.Z(n61), 
	.A(\chs_in_f[3][DATA][17] ));
   HS65_LS_IVX9 U443 (.Z(n60), 
	.A(\chs_in_f[3][DATA][18] ));
   HS65_LS_IVX9 U444 (.Z(n59), 
	.A(\chs_in_f[3][DATA][19] ));
   HS65_LS_IVX9 U445 (.Z(n58), 
	.A(\chs_in_f[3][DATA][20] ));
   HS65_LS_IVX9 U446 (.Z(n57), 
	.A(\chs_in_f[3][DATA][21] ));
   HS65_LS_IVX9 U447 (.Z(n56), 
	.A(\chs_in_f[3][DATA][22] ));
   HS65_LS_IVX9 U448 (.Z(n55), 
	.A(\chs_in_f[3][DATA][23] ));
   HS65_LS_IVX9 U449 (.Z(n54), 
	.A(\chs_in_f[3][DATA][24] ));
   HS65_LS_IVX9 U450 (.Z(n53), 
	.A(\chs_in_f[3][DATA][25] ));
   HS65_LS_IVX9 U451 (.Z(n52), 
	.A(\chs_in_f[3][DATA][26] ));
   HS65_LS_IVX9 U452 (.Z(n51), 
	.A(\chs_in_f[3][DATA][27] ));
   HS65_LS_IVX9 U453 (.Z(n50), 
	.A(\chs_in_f[3][DATA][28] ));
   HS65_LS_IVX9 U454 (.Z(n49), 
	.A(\chs_in_f[3][DATA][29] ));
   HS65_LS_IVX9 U455 (.Z(n48), 
	.A(\chs_in_f[3][DATA][30] ));
   HS65_LS_IVX9 U456 (.Z(n47), 
	.A(\chs_in_f[3][DATA][31] ));
   HS65_LS_IVX9 U457 (.Z(n46), 
	.A(\chs_in_f[3][DATA][32] ));
   HS65_LS_IVX9 U458 (.Z(n45), 
	.A(\chs_in_f[3][DATA][33] ));
   HS65_LS_IVX9 U459 (.Z(n35), 
	.A(\chs_in_f[4][DATA][9] ));
   HS65_LS_IVX9 U460 (.Z(n44), 
	.A(\chs_in_f[4][DATA][0] ));
   HS65_LS_IVX9 U461 (.Z(n43), 
	.A(\chs_in_f[4][DATA][1] ));
   HS65_LS_IVX9 U462 (.Z(n42), 
	.A(\chs_in_f[4][DATA][2] ));
   HS65_LS_IVX9 U463 (.Z(n41), 
	.A(\chs_in_f[4][DATA][3] ));
   HS65_LS_IVX9 U464 (.Z(n40), 
	.A(\chs_in_f[4][DATA][4] ));
   HS65_LS_IVX9 U465 (.Z(n39), 
	.A(\chs_in_f[4][DATA][5] ));
   HS65_LS_IVX9 U466 (.Z(n38), 
	.A(\chs_in_f[4][DATA][6] ));
   HS65_LS_IVX9 U467 (.Z(n37), 
	.A(\chs_in_f[4][DATA][7] ));
   HS65_LS_IVX9 U468 (.Z(n36), 
	.A(\chs_in_f[4][DATA][8] ));
   HS65_LS_IVX9 U469 (.Z(n34), 
	.A(\chs_in_f[4][DATA][10] ));
   HS65_LS_IVX9 U470 (.Z(n33), 
	.A(\chs_in_f[4][DATA][11] ));
   HS65_LS_IVX9 U471 (.Z(n32), 
	.A(\chs_in_f[4][DATA][12] ));
   HS65_LS_IVX9 U472 (.Z(n31), 
	.A(\chs_in_f[4][DATA][13] ));
   HS65_LS_IVX9 U473 (.Z(n30), 
	.A(\chs_in_f[4][DATA][14] ));
   HS65_LS_IVX9 U474 (.Z(n29), 
	.A(\chs_in_f[4][DATA][15] ));
   HS65_LS_IVX9 U475 (.Z(n28), 
	.A(\chs_in_f[4][DATA][16] ));
   HS65_LS_IVX9 U476 (.Z(n27), 
	.A(\chs_in_f[4][DATA][17] ));
   HS65_LS_IVX9 U477 (.Z(n26), 
	.A(\chs_in_f[4][DATA][18] ));
   HS65_LS_IVX9 U478 (.Z(n25), 
	.A(\chs_in_f[4][DATA][19] ));
   HS65_LS_IVX9 U479 (.Z(n24), 
	.A(\chs_in_f[4][DATA][20] ));
   HS65_LS_IVX9 U480 (.Z(n23), 
	.A(\chs_in_f[4][DATA][21] ));
   HS65_LS_IVX9 U481 (.Z(n22), 
	.A(\chs_in_f[4][DATA][22] ));
   HS65_LS_IVX9 U482 (.Z(n21), 
	.A(\chs_in_f[4][DATA][23] ));
   HS65_LS_IVX9 U483 (.Z(n20), 
	.A(\chs_in_f[4][DATA][24] ));
   HS65_LS_IVX9 U484 (.Z(n19), 
	.A(\chs_in_f[4][DATA][25] ));
   HS65_LS_IVX9 U485 (.Z(n18), 
	.A(\chs_in_f[4][DATA][26] ));
   HS65_LS_IVX9 U486 (.Z(n17), 
	.A(\chs_in_f[4][DATA][27] ));
   HS65_LS_IVX9 U487 (.Z(n16), 
	.A(\chs_in_f[4][DATA][28] ));
   HS65_LS_IVX9 U488 (.Z(n15), 
	.A(\chs_in_f[4][DATA][29] ));
   HS65_LS_IVX9 U489 (.Z(n14), 
	.A(\chs_in_f[4][DATA][30] ));
   HS65_LS_IVX9 U490 (.Z(n13), 
	.A(\chs_in_f[4][DATA][31] ));
   HS65_LS_IVX9 U491 (.Z(n12), 
	.A(\chs_in_f[4][DATA][32] ));
   HS65_LS_IVX9 U492 (.Z(n11), 
	.A(\chs_in_f[4][DATA][33] ));
   HS65_LS_IVX9 U493 (.Z(n2), 
	.A(\switch_sel[4][3] ));
   HS65_LS_IVX9 U494 (.Z(n7), 
	.A(\switch_sel[3][3] ));
   HS65_LS_IVX9 U495 (.Z(n3), 
	.A(\switch_sel[4][2] ));
   HS65_LS_IVX9 U496 (.Z(n8), 
	.A(\switch_sel[3][2] ));
   HS65_LS_IVX9 U497 (.Z(n4), 
	.A(\switch_sel[4][1] ));
   HS65_LS_IVX9 U498 (.Z(n9), 
	.A(\switch_sel[3][1] ));
   HS65_LS_IVX9 U499 (.Z(n5), 
	.A(\switch_sel[4][0] ));
   HS65_LS_IVX9 U500 (.Z(n10), 
	.A(\switch_sel[3][0] ));
   HS65_LS_IVX9 U501 (.Z(n6), 
	.A(\switch_sel[3][4] ));
   HS65_LS_IVX9 U502 (.Z(n1), 
	.A(\switch_sel[4][4] ));
endmodule

module bundled2LEDR_0 (
	preset, 
	.bundled_ch_f ( { \bundled_ch_f[REQ] , 
		\bundled_ch_f[DATA][33] , 
		\bundled_ch_f[DATA][32] , 
		\bundled_ch_f[DATA][31] , 
		\bundled_ch_f[DATA][30] , 
		\bundled_ch_f[DATA][29] , 
		\bundled_ch_f[DATA][28] , 
		\bundled_ch_f[DATA][27] , 
		\bundled_ch_f[DATA][26] , 
		\bundled_ch_f[DATA][25] , 
		\bundled_ch_f[DATA][24] , 
		\bundled_ch_f[DATA][23] , 
		\bundled_ch_f[DATA][22] , 
		\bundled_ch_f[DATA][21] , 
		\bundled_ch_f[DATA][20] , 
		\bundled_ch_f[DATA][19] , 
		\bundled_ch_f[DATA][18] , 
		\bundled_ch_f[DATA][17] , 
		\bundled_ch_f[DATA][16] , 
		\bundled_ch_f[DATA][15] , 
		\bundled_ch_f[DATA][14] , 
		\bundled_ch_f[DATA][13] , 
		\bundled_ch_f[DATA][12] , 
		\bundled_ch_f[DATA][11] , 
		\bundled_ch_f[DATA][10] , 
		\bundled_ch_f[DATA][9] , 
		\bundled_ch_f[DATA][8] , 
		\bundled_ch_f[DATA][7] , 
		\bundled_ch_f[DATA][6] , 
		\bundled_ch_f[DATA][5] , 
		\bundled_ch_f[DATA][4] , 
		\bundled_ch_f[DATA][3] , 
		\bundled_ch_f[DATA][2] , 
		\bundled_ch_f[DATA][1] , 
		\bundled_ch_f[DATA][0]  } ), 
	.bundled_ch_b ( \bundled_ch_b[ACK]  ), 
	.LEDR_link_f ( { \LEDR_link_f[TOKEN_T] , 
		\LEDR_link_f[TOKEN_PARITY] , 
		\LEDR_link_f[PHIT][32] , 
		\LEDR_link_f[PHIT][31] , 
		\LEDR_link_f[PHIT][30] , 
		\LEDR_link_f[PHIT][29] , 
		\LEDR_link_f[PHIT][28] , 
		\LEDR_link_f[PHIT][27] , 
		\LEDR_link_f[PHIT][26] , 
		\LEDR_link_f[PHIT][25] , 
		\LEDR_link_f[PHIT][24] , 
		\LEDR_link_f[PHIT][23] , 
		\LEDR_link_f[PHIT][22] , 
		\LEDR_link_f[PHIT][21] , 
		\LEDR_link_f[PHIT][20] , 
		\LEDR_link_f[PHIT][19] , 
		\LEDR_link_f[PHIT][18] , 
		\LEDR_link_f[PHIT][17] , 
		\LEDR_link_f[PHIT][16] , 
		\LEDR_link_f[PHIT][15] , 
		\LEDR_link_f[PHIT][14] , 
		\LEDR_link_f[PHIT][13] , 
		\LEDR_link_f[PHIT][12] , 
		\LEDR_link_f[PHIT][11] , 
		\LEDR_link_f[PHIT][10] , 
		\LEDR_link_f[PHIT][9] , 
		\LEDR_link_f[PHIT][8] , 
		\LEDR_link_f[PHIT][7] , 
		\LEDR_link_f[PHIT][6] , 
		\LEDR_link_f[PHIT][5] , 
		\LEDR_link_f[PHIT][4] , 
		\LEDR_link_f[PHIT][3] , 
		\LEDR_link_f[PHIT][2] , 
		\LEDR_link_f[PHIT][1] , 
		\LEDR_link_f[PHIT][0] , 
		\LEDR_link_f[PHIT_PARITY][32] , 
		\LEDR_link_f[PHIT_PARITY][31] , 
		\LEDR_link_f[PHIT_PARITY][30] , 
		\LEDR_link_f[PHIT_PARITY][29] , 
		\LEDR_link_f[PHIT_PARITY][28] , 
		\LEDR_link_f[PHIT_PARITY][27] , 
		\LEDR_link_f[PHIT_PARITY][26] , 
		\LEDR_link_f[PHIT_PARITY][25] , 
		\LEDR_link_f[PHIT_PARITY][24] , 
		\LEDR_link_f[PHIT_PARITY][23] , 
		\LEDR_link_f[PHIT_PARITY][22] , 
		\LEDR_link_f[PHIT_PARITY][21] , 
		\LEDR_link_f[PHIT_PARITY][20] , 
		\LEDR_link_f[PHIT_PARITY][19] , 
		\LEDR_link_f[PHIT_PARITY][18] , 
		\LEDR_link_f[PHIT_PARITY][17] , 
		\LEDR_link_f[PHIT_PARITY][16] , 
		\LEDR_link_f[PHIT_PARITY][15] , 
		\LEDR_link_f[PHIT_PARITY][14] , 
		\LEDR_link_f[PHIT_PARITY][13] , 
		\LEDR_link_f[PHIT_PARITY][12] , 
		\LEDR_link_f[PHIT_PARITY][11] , 
		\LEDR_link_f[PHIT_PARITY][10] , 
		\LEDR_link_f[PHIT_PARITY][9] , 
		\LEDR_link_f[PHIT_PARITY][8] , 
		\LEDR_link_f[PHIT_PARITY][7] , 
		\LEDR_link_f[PHIT_PARITY][6] , 
		\LEDR_link_f[PHIT_PARITY][5] , 
		\LEDR_link_f[PHIT_PARITY][4] , 
		\LEDR_link_f[PHIT_PARITY][3] , 
		\LEDR_link_f[PHIT_PARITY][2] , 
		\LEDR_link_f[PHIT_PARITY][1] , 
		\LEDR_link_f[PHIT_PARITY][0]  } ), 
	.LEDR_link_b ( \LEDR_link_b[ACK]  ), 
	FE_OFN0_preset, 
	FE_OFN2_preset, 
	FE_OFN1038_preset);
   input preset;
   input \bundled_ch_f[REQ] ;
   input \bundled_ch_f[DATA][33] ;
   input \bundled_ch_f[DATA][32] ;
   input \bundled_ch_f[DATA][31] ;
   input \bundled_ch_f[DATA][30] ;
   input \bundled_ch_f[DATA][29] ;
   input \bundled_ch_f[DATA][28] ;
   input \bundled_ch_f[DATA][27] ;
   input \bundled_ch_f[DATA][26] ;
   input \bundled_ch_f[DATA][25] ;
   input \bundled_ch_f[DATA][24] ;
   input \bundled_ch_f[DATA][23] ;
   input \bundled_ch_f[DATA][22] ;
   input \bundled_ch_f[DATA][21] ;
   input \bundled_ch_f[DATA][20] ;
   input \bundled_ch_f[DATA][19] ;
   input \bundled_ch_f[DATA][18] ;
   input \bundled_ch_f[DATA][17] ;
   input \bundled_ch_f[DATA][16] ;
   input \bundled_ch_f[DATA][15] ;
   input \bundled_ch_f[DATA][14] ;
   input \bundled_ch_f[DATA][13] ;
   input \bundled_ch_f[DATA][12] ;
   input \bundled_ch_f[DATA][11] ;
   input \bundled_ch_f[DATA][10] ;
   input \bundled_ch_f[DATA][9] ;
   input \bundled_ch_f[DATA][8] ;
   input \bundled_ch_f[DATA][7] ;
   input \bundled_ch_f[DATA][6] ;
   input \bundled_ch_f[DATA][5] ;
   input \bundled_ch_f[DATA][4] ;
   input \bundled_ch_f[DATA][3] ;
   input \bundled_ch_f[DATA][2] ;
   input \bundled_ch_f[DATA][1] ;
   input \bundled_ch_f[DATA][0] ;
   output \bundled_ch_b[ACK] ;
   output \LEDR_link_f[TOKEN_T] ;
   output \LEDR_link_f[TOKEN_PARITY] ;
   output \LEDR_link_f[PHIT][32] ;
   output \LEDR_link_f[PHIT][31] ;
   output \LEDR_link_f[PHIT][30] ;
   output \LEDR_link_f[PHIT][29] ;
   output \LEDR_link_f[PHIT][28] ;
   output \LEDR_link_f[PHIT][27] ;
   output \LEDR_link_f[PHIT][26] ;
   output \LEDR_link_f[PHIT][25] ;
   output \LEDR_link_f[PHIT][24] ;
   output \LEDR_link_f[PHIT][23] ;
   output \LEDR_link_f[PHIT][22] ;
   output \LEDR_link_f[PHIT][21] ;
   output \LEDR_link_f[PHIT][20] ;
   output \LEDR_link_f[PHIT][19] ;
   output \LEDR_link_f[PHIT][18] ;
   output \LEDR_link_f[PHIT][17] ;
   output \LEDR_link_f[PHIT][16] ;
   output \LEDR_link_f[PHIT][15] ;
   output \LEDR_link_f[PHIT][14] ;
   output \LEDR_link_f[PHIT][13] ;
   output \LEDR_link_f[PHIT][12] ;
   output \LEDR_link_f[PHIT][11] ;
   output \LEDR_link_f[PHIT][10] ;
   output \LEDR_link_f[PHIT][9] ;
   output \LEDR_link_f[PHIT][8] ;
   output \LEDR_link_f[PHIT][7] ;
   output \LEDR_link_f[PHIT][6] ;
   output \LEDR_link_f[PHIT][5] ;
   output \LEDR_link_f[PHIT][4] ;
   output \LEDR_link_f[PHIT][3] ;
   output \LEDR_link_f[PHIT][2] ;
   output \LEDR_link_f[PHIT][1] ;
   output \LEDR_link_f[PHIT][0] ;
   output \LEDR_link_f[PHIT_PARITY][32] ;
   output \LEDR_link_f[PHIT_PARITY][31] ;
   output \LEDR_link_f[PHIT_PARITY][30] ;
   output \LEDR_link_f[PHIT_PARITY][29] ;
   output \LEDR_link_f[PHIT_PARITY][28] ;
   output \LEDR_link_f[PHIT_PARITY][27] ;
   output \LEDR_link_f[PHIT_PARITY][26] ;
   output \LEDR_link_f[PHIT_PARITY][25] ;
   output \LEDR_link_f[PHIT_PARITY][24] ;
   output \LEDR_link_f[PHIT_PARITY][23] ;
   output \LEDR_link_f[PHIT_PARITY][22] ;
   output \LEDR_link_f[PHIT_PARITY][21] ;
   output \LEDR_link_f[PHIT_PARITY][20] ;
   output \LEDR_link_f[PHIT_PARITY][19] ;
   output \LEDR_link_f[PHIT_PARITY][18] ;
   output \LEDR_link_f[PHIT_PARITY][17] ;
   output \LEDR_link_f[PHIT_PARITY][16] ;
   output \LEDR_link_f[PHIT_PARITY][15] ;
   output \LEDR_link_f[PHIT_PARITY][14] ;
   output \LEDR_link_f[PHIT_PARITY][13] ;
   output \LEDR_link_f[PHIT_PARITY][12] ;
   output \LEDR_link_f[PHIT_PARITY][11] ;
   output \LEDR_link_f[PHIT_PARITY][10] ;
   output \LEDR_link_f[PHIT_PARITY][9] ;
   output \LEDR_link_f[PHIT_PARITY][8] ;
   output \LEDR_link_f[PHIT_PARITY][7] ;
   output \LEDR_link_f[PHIT_PARITY][6] ;
   output \LEDR_link_f[PHIT_PARITY][5] ;
   output \LEDR_link_f[PHIT_PARITY][4] ;
   output \LEDR_link_f[PHIT_PARITY][3] ;
   output \LEDR_link_f[PHIT_PARITY][2] ;
   output \LEDR_link_f[PHIT_PARITY][1] ;
   output \LEDR_link_f[PHIT_PARITY][0] ;
   input \LEDR_link_b[ACK] ;
   input FE_OFN0_preset;
   input FE_OFN2_preset;
   input FE_OFN1038_preset;

   // Internal wires
   wire FE_PHN1444_FE_OCPN1195_preset;
   wire FE_PHN1442_FE_OCPN1195_preset;
   wire clk;
   wire type_out;
   wire enabled_clk;
   wire N2;
   wire data_phase;
   wire N5;
   wire N6;
   wire n1;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire [32:0] data_parity;

   HS65_LH_BFX7 FE_PHC1444_FE_OCPN1195_preset (.Z(FE_PHN1444_FE_OCPN1195_preset), 
	.A(preset));
   HS65_LH_DLYIC2X9 FE_PHC1442_FE_OCPN1195_preset (.Z(FE_PHN1442_FE_OCPN1195_preset), 
	.A(FE_PHN1444_FE_OCPN1195_preset));
   HS65_LS_DFPRQX4 type_out_reg (.RN(n7), 
	.Q(type_out), 
	.D(\bundled_ch_f[DATA][33] ), 
	.CP(clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_T]  (.RN(n5), 
	.Q(\LEDR_link_f[TOKEN_T] ), 
	.D(\bundled_ch_f[DATA][33] ), 
	.CP(clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_PARITY]  (.RN(n5), 
	.Q(\LEDR_link_f[TOKEN_PARITY] ), 
	.D(N2), 
	.CP(clk));
   HS65_LSS_DFPSQX18 data_phase_reg (.SN(n8), 
	.Q(data_phase), 
	.D(n4), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][32]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][32] ), 
	.D(\bundled_ch_f[DATA][32] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][31]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][31] ), 
	.D(\bundled_ch_f[DATA][31] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][30]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][30] ), 
	.D(\bundled_ch_f[DATA][30] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][29]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][29] ), 
	.D(\bundled_ch_f[DATA][29] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][28]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][28] ), 
	.D(\bundled_ch_f[DATA][28] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][27]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][27] ), 
	.D(\bundled_ch_f[DATA][27] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][26]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][26] ), 
	.D(\bundled_ch_f[DATA][26] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][25]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][25] ), 
	.D(\bundled_ch_f[DATA][25] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][24]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][24] ), 
	.D(\bundled_ch_f[DATA][24] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][23]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][23] ), 
	.D(\bundled_ch_f[DATA][23] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][22]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][22] ), 
	.D(\bundled_ch_f[DATA][22] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][21]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][21] ), 
	.D(\bundled_ch_f[DATA][21] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][20]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][20] ), 
	.D(\bundled_ch_f[DATA][20] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][19]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][19] ), 
	.D(\bundled_ch_f[DATA][19] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][18]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][18] ), 
	.D(\bundled_ch_f[DATA][18] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][17]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][17] ), 
	.D(\bundled_ch_f[DATA][17] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][16]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][16] ), 
	.D(\bundled_ch_f[DATA][16] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][15]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][15] ), 
	.D(\bundled_ch_f[DATA][15] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][14]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][14] ), 
	.D(\bundled_ch_f[DATA][14] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][13]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][13] ), 
	.D(\bundled_ch_f[DATA][13] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][12]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][12] ), 
	.D(\bundled_ch_f[DATA][12] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][11]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][11] ), 
	.D(\bundled_ch_f[DATA][11] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][10]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][10] ), 
	.D(\bundled_ch_f[DATA][10] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][9]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][9] ), 
	.D(\bundled_ch_f[DATA][9] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][8]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][8] ), 
	.D(\bundled_ch_f[DATA][8] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][7]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][7] ), 
	.D(\bundled_ch_f[DATA][7] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][6]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][6] ), 
	.D(\bundled_ch_f[DATA][6] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][5]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][5] ), 
	.D(\bundled_ch_f[DATA][5] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][4]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][4] ), 
	.D(\bundled_ch_f[DATA][4] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][3]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][3] ), 
	.D(\bundled_ch_f[DATA][3] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][2]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][2] ), 
	.D(\bundled_ch_f[DATA][2] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][1]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][1] ), 
	.D(\bundled_ch_f[DATA][1] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][0]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT][0] ), 
	.D(\bundled_ch_f[DATA][0] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][32]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][32] ), 
	.D(data_parity[32]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][31]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][31] ), 
	.D(data_parity[31]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][30]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][30] ), 
	.D(data_parity[30]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][29]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][29] ), 
	.D(data_parity[29]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][28]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][28] ), 
	.D(data_parity[28]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][27]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][27] ), 
	.D(data_parity[27]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][26]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][26] ), 
	.D(data_parity[26]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][25]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][25] ), 
	.D(data_parity[25]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][24]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][24] ), 
	.D(data_parity[24]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][23]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][23] ), 
	.D(data_parity[23]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][22]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][22] ), 
	.D(data_parity[22]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][21]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][21] ), 
	.D(data_parity[21]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][20]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][20] ), 
	.D(data_parity[20]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][19]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][19] ), 
	.D(data_parity[19]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][18]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][18] ), 
	.D(data_parity[18]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][17]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][17] ), 
	.D(data_parity[17]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][16]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][16] ), 
	.D(data_parity[16]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][15]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][15] ), 
	.D(data_parity[15]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][14]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][14] ), 
	.D(data_parity[14]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][13]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][13] ), 
	.D(data_parity[13]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][12]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][12] ), 
	.D(data_parity[12]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][11]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][11] ), 
	.D(data_parity[11]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][10]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][10] ), 
	.D(data_parity[10]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][9]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][9] ), 
	.D(data_parity[9]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][8]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][8] ), 
	.D(data_parity[8]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][7]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][7] ), 
	.D(data_parity[7]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][6]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT_PARITY][6] ), 
	.D(data_parity[6]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][5]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][5] ), 
	.D(data_parity[5]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][4]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][4] ), 
	.D(data_parity[4]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][3]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][3] ), 
	.D(data_parity[3]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][2]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][2] ), 
	.D(data_parity[2]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][1]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT_PARITY][1] ), 
	.D(data_parity[1]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][0]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT_PARITY][0] ), 
	.D(data_parity[0]), 
	.CP(enabled_clk));
   HS65_LS_LDHQX9 ack_reg (.Q(\bundled_ch_b[ACK] ), 
	.G(N5), 
	.D(N6));
   HS65_LSS_XOR2X6 C214 (.Z(clk), 
	.B(\bundled_ch_b[ACK] ), 
	.A(\LEDR_link_b[ACK] ));
   HS65_LS_AND2X9 C215 (.Z(enabled_clk), 
	.B(type_out), 
	.A(clk));
   HS65_LS_IVX9 U5 (.Z(n1), 
	.A(n4));
   HS65_LSS_XOR2X6 U7 (.Z(N2), 
	.B(\bundled_ch_f[DATA][33] ), 
	.A(\bundled_ch_f[REQ] ));
   HS65_LS_IVX9 U9 (.Z(n4), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U10 (.Z(data_parity[0]), 
	.B(\bundled_ch_f[DATA][0] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U11 (.Z(data_parity[1]), 
	.B(\bundled_ch_f[DATA][1] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U12 (.Z(data_parity[2]), 
	.B(\bundled_ch_f[DATA][2] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U13 (.Z(data_parity[3]), 
	.B(\bundled_ch_f[DATA][3] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U14 (.Z(data_parity[4]), 
	.B(\bundled_ch_f[DATA][4] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U15 (.Z(data_parity[5]), 
	.B(\bundled_ch_f[DATA][5] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U16 (.Z(data_parity[6]), 
	.B(\bundled_ch_f[DATA][6] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U17 (.Z(data_parity[7]), 
	.B(\bundled_ch_f[DATA][7] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U18 (.Z(data_parity[8]), 
	.B(\bundled_ch_f[DATA][8] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U19 (.Z(data_parity[10]), 
	.B(\bundled_ch_f[DATA][10] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U20 (.Z(data_parity[11]), 
	.B(\bundled_ch_f[DATA][11] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U21 (.Z(data_parity[12]), 
	.B(\bundled_ch_f[DATA][12] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U22 (.Z(data_parity[13]), 
	.B(\bundled_ch_f[DATA][13] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U23 (.Z(data_parity[14]), 
	.B(\bundled_ch_f[DATA][14] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U24 (.Z(data_parity[15]), 
	.B(\bundled_ch_f[DATA][15] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U25 (.Z(data_parity[16]), 
	.B(\bundled_ch_f[DATA][16] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U26 (.Z(data_parity[17]), 
	.B(\bundled_ch_f[DATA][17] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U27 (.Z(data_parity[18]), 
	.B(\bundled_ch_f[DATA][18] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U28 (.Z(data_parity[19]), 
	.B(\bundled_ch_f[DATA][19] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U29 (.Z(data_parity[20]), 
	.B(\bundled_ch_f[DATA][20] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U30 (.Z(data_parity[21]), 
	.B(\bundled_ch_f[DATA][21] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U31 (.Z(data_parity[22]), 
	.B(\bundled_ch_f[DATA][22] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U32 (.Z(data_parity[23]), 
	.B(\bundled_ch_f[DATA][23] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U33 (.Z(data_parity[24]), 
	.B(\bundled_ch_f[DATA][24] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U34 (.Z(data_parity[25]), 
	.B(\bundled_ch_f[DATA][25] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U35 (.Z(data_parity[26]), 
	.B(\bundled_ch_f[DATA][26] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U36 (.Z(data_parity[27]), 
	.B(\bundled_ch_f[DATA][27] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U37 (.Z(data_parity[28]), 
	.B(\bundled_ch_f[DATA][28] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U38 (.Z(data_parity[29]), 
	.B(\bundled_ch_f[DATA][29] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U39 (.Z(data_parity[30]), 
	.B(\bundled_ch_f[DATA][30] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U40 (.Z(data_parity[31]), 
	.B(\bundled_ch_f[DATA][31] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U41 (.Z(data_parity[32]), 
	.B(\bundled_ch_f[DATA][32] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U42 (.Z(data_parity[9]), 
	.B(\bundled_ch_f[DATA][9] ), 
	.A(n1));
   HS65_LS_IVX9 U43 (.Z(n6), 
	.A(FE_OFN2_preset));
   HS65_LS_IVX9 U44 (.Z(n5), 
	.A(FE_OFN0_preset));
   HS65_LS_IVX9 U45 (.Z(n7), 
	.A(FE_OFN2_preset));
   HS65_LS_IVX9 U46 (.Z(n9), 
	.A(FE_OFN2_preset));
   HS65_LS_IVX9 U47 (.Z(n8), 
	.A(FE_OFN1038_preset));
   HS65_LS_NOR2AX3 U48 (.Z(N6), 
	.B(preset), 
	.A(\bundled_ch_f[REQ] ));
   HS65_LS_NAND2AX7 U49 (.Z(N5), 
	.B(clk), 
	.A(FE_PHN1442_FE_OCPN1195_preset));
endmodule

module bundled2LEDR_1 (
	preset, 
	.bundled_ch_f ( { \bundled_ch_f[REQ] , 
		\bundled_ch_f[DATA][33] , 
		\bundled_ch_f[DATA][32] , 
		\bundled_ch_f[DATA][31] , 
		\bundled_ch_f[DATA][30] , 
		\bundled_ch_f[DATA][29] , 
		\bundled_ch_f[DATA][28] , 
		\bundled_ch_f[DATA][27] , 
		\bundled_ch_f[DATA][26] , 
		\bundled_ch_f[DATA][25] , 
		\bundled_ch_f[DATA][24] , 
		\bundled_ch_f[DATA][23] , 
		\bundled_ch_f[DATA][22] , 
		\bundled_ch_f[DATA][21] , 
		\bundled_ch_f[DATA][20] , 
		\bundled_ch_f[DATA][19] , 
		\bundled_ch_f[DATA][18] , 
		\bundled_ch_f[DATA][17] , 
		\bundled_ch_f[DATA][16] , 
		\bundled_ch_f[DATA][15] , 
		\bundled_ch_f[DATA][14] , 
		\bundled_ch_f[DATA][13] , 
		\bundled_ch_f[DATA][12] , 
		\bundled_ch_f[DATA][11] , 
		\bundled_ch_f[DATA][10] , 
		\bundled_ch_f[DATA][9] , 
		\bundled_ch_f[DATA][8] , 
		\bundled_ch_f[DATA][7] , 
		\bundled_ch_f[DATA][6] , 
		\bundled_ch_f[DATA][5] , 
		\bundled_ch_f[DATA][4] , 
		\bundled_ch_f[DATA][3] , 
		\bundled_ch_f[DATA][2] , 
		\bundled_ch_f[DATA][1] , 
		\bundled_ch_f[DATA][0]  } ), 
	.bundled_ch_b ( \bundled_ch_b[ACK]  ), 
	.LEDR_link_f ( { \LEDR_link_f[TOKEN_T] , 
		\LEDR_link_f[TOKEN_PARITY] , 
		\LEDR_link_f[PHIT][32] , 
		\LEDR_link_f[PHIT][31] , 
		\LEDR_link_f[PHIT][30] , 
		\LEDR_link_f[PHIT][29] , 
		\LEDR_link_f[PHIT][28] , 
		\LEDR_link_f[PHIT][27] , 
		\LEDR_link_f[PHIT][26] , 
		\LEDR_link_f[PHIT][25] , 
		\LEDR_link_f[PHIT][24] , 
		\LEDR_link_f[PHIT][23] , 
		\LEDR_link_f[PHIT][22] , 
		\LEDR_link_f[PHIT][21] , 
		\LEDR_link_f[PHIT][20] , 
		\LEDR_link_f[PHIT][19] , 
		\LEDR_link_f[PHIT][18] , 
		\LEDR_link_f[PHIT][17] , 
		\LEDR_link_f[PHIT][16] , 
		\LEDR_link_f[PHIT][15] , 
		\LEDR_link_f[PHIT][14] , 
		\LEDR_link_f[PHIT][13] , 
		\LEDR_link_f[PHIT][12] , 
		\LEDR_link_f[PHIT][11] , 
		\LEDR_link_f[PHIT][10] , 
		\LEDR_link_f[PHIT][9] , 
		\LEDR_link_f[PHIT][8] , 
		\LEDR_link_f[PHIT][7] , 
		\LEDR_link_f[PHIT][6] , 
		\LEDR_link_f[PHIT][5] , 
		\LEDR_link_f[PHIT][4] , 
		\LEDR_link_f[PHIT][3] , 
		\LEDR_link_f[PHIT][2] , 
		\LEDR_link_f[PHIT][1] , 
		\LEDR_link_f[PHIT][0] , 
		\LEDR_link_f[PHIT_PARITY][32] , 
		\LEDR_link_f[PHIT_PARITY][31] , 
		\LEDR_link_f[PHIT_PARITY][30] , 
		\LEDR_link_f[PHIT_PARITY][29] , 
		\LEDR_link_f[PHIT_PARITY][28] , 
		\LEDR_link_f[PHIT_PARITY][27] , 
		\LEDR_link_f[PHIT_PARITY][26] , 
		\LEDR_link_f[PHIT_PARITY][25] , 
		\LEDR_link_f[PHIT_PARITY][24] , 
		\LEDR_link_f[PHIT_PARITY][23] , 
		\LEDR_link_f[PHIT_PARITY][22] , 
		\LEDR_link_f[PHIT_PARITY][21] , 
		\LEDR_link_f[PHIT_PARITY][20] , 
		\LEDR_link_f[PHIT_PARITY][19] , 
		\LEDR_link_f[PHIT_PARITY][18] , 
		\LEDR_link_f[PHIT_PARITY][17] , 
		\LEDR_link_f[PHIT_PARITY][16] , 
		\LEDR_link_f[PHIT_PARITY][15] , 
		\LEDR_link_f[PHIT_PARITY][14] , 
		\LEDR_link_f[PHIT_PARITY][13] , 
		\LEDR_link_f[PHIT_PARITY][12] , 
		\LEDR_link_f[PHIT_PARITY][11] , 
		\LEDR_link_f[PHIT_PARITY][10] , 
		\LEDR_link_f[PHIT_PARITY][9] , 
		\LEDR_link_f[PHIT_PARITY][8] , 
		\LEDR_link_f[PHIT_PARITY][7] , 
		\LEDR_link_f[PHIT_PARITY][6] , 
		\LEDR_link_f[PHIT_PARITY][5] , 
		\LEDR_link_f[PHIT_PARITY][4] , 
		\LEDR_link_f[PHIT_PARITY][3] , 
		\LEDR_link_f[PHIT_PARITY][2] , 
		\LEDR_link_f[PHIT_PARITY][1] , 
		\LEDR_link_f[PHIT_PARITY][0]  } ), 
	.LEDR_link_b ( \LEDR_link_b[ACK]  ), 
	FE_OFN0_preset, 
	FE_OFN2_preset, 
	FE_PHN1407_FE_OFN1003_preset, 
	FE_PHN1448_FE_OFN1003_preset);
   input preset;
   input \bundled_ch_f[REQ] ;
   input \bundled_ch_f[DATA][33] ;
   input \bundled_ch_f[DATA][32] ;
   input \bundled_ch_f[DATA][31] ;
   input \bundled_ch_f[DATA][30] ;
   input \bundled_ch_f[DATA][29] ;
   input \bundled_ch_f[DATA][28] ;
   input \bundled_ch_f[DATA][27] ;
   input \bundled_ch_f[DATA][26] ;
   input \bundled_ch_f[DATA][25] ;
   input \bundled_ch_f[DATA][24] ;
   input \bundled_ch_f[DATA][23] ;
   input \bundled_ch_f[DATA][22] ;
   input \bundled_ch_f[DATA][21] ;
   input \bundled_ch_f[DATA][20] ;
   input \bundled_ch_f[DATA][19] ;
   input \bundled_ch_f[DATA][18] ;
   input \bundled_ch_f[DATA][17] ;
   input \bundled_ch_f[DATA][16] ;
   input \bundled_ch_f[DATA][15] ;
   input \bundled_ch_f[DATA][14] ;
   input \bundled_ch_f[DATA][13] ;
   input \bundled_ch_f[DATA][12] ;
   input \bundled_ch_f[DATA][11] ;
   input \bundled_ch_f[DATA][10] ;
   input \bundled_ch_f[DATA][9] ;
   input \bundled_ch_f[DATA][8] ;
   input \bundled_ch_f[DATA][7] ;
   input \bundled_ch_f[DATA][6] ;
   input \bundled_ch_f[DATA][5] ;
   input \bundled_ch_f[DATA][4] ;
   input \bundled_ch_f[DATA][3] ;
   input \bundled_ch_f[DATA][2] ;
   input \bundled_ch_f[DATA][1] ;
   input \bundled_ch_f[DATA][0] ;
   output \bundled_ch_b[ACK] ;
   output \LEDR_link_f[TOKEN_T] ;
   output \LEDR_link_f[TOKEN_PARITY] ;
   output \LEDR_link_f[PHIT][32] ;
   output \LEDR_link_f[PHIT][31] ;
   output \LEDR_link_f[PHIT][30] ;
   output \LEDR_link_f[PHIT][29] ;
   output \LEDR_link_f[PHIT][28] ;
   output \LEDR_link_f[PHIT][27] ;
   output \LEDR_link_f[PHIT][26] ;
   output \LEDR_link_f[PHIT][25] ;
   output \LEDR_link_f[PHIT][24] ;
   output \LEDR_link_f[PHIT][23] ;
   output \LEDR_link_f[PHIT][22] ;
   output \LEDR_link_f[PHIT][21] ;
   output \LEDR_link_f[PHIT][20] ;
   output \LEDR_link_f[PHIT][19] ;
   output \LEDR_link_f[PHIT][18] ;
   output \LEDR_link_f[PHIT][17] ;
   output \LEDR_link_f[PHIT][16] ;
   output \LEDR_link_f[PHIT][15] ;
   output \LEDR_link_f[PHIT][14] ;
   output \LEDR_link_f[PHIT][13] ;
   output \LEDR_link_f[PHIT][12] ;
   output \LEDR_link_f[PHIT][11] ;
   output \LEDR_link_f[PHIT][10] ;
   output \LEDR_link_f[PHIT][9] ;
   output \LEDR_link_f[PHIT][8] ;
   output \LEDR_link_f[PHIT][7] ;
   output \LEDR_link_f[PHIT][6] ;
   output \LEDR_link_f[PHIT][5] ;
   output \LEDR_link_f[PHIT][4] ;
   output \LEDR_link_f[PHIT][3] ;
   output \LEDR_link_f[PHIT][2] ;
   output \LEDR_link_f[PHIT][1] ;
   output \LEDR_link_f[PHIT][0] ;
   output \LEDR_link_f[PHIT_PARITY][32] ;
   output \LEDR_link_f[PHIT_PARITY][31] ;
   output \LEDR_link_f[PHIT_PARITY][30] ;
   output \LEDR_link_f[PHIT_PARITY][29] ;
   output \LEDR_link_f[PHIT_PARITY][28] ;
   output \LEDR_link_f[PHIT_PARITY][27] ;
   output \LEDR_link_f[PHIT_PARITY][26] ;
   output \LEDR_link_f[PHIT_PARITY][25] ;
   output \LEDR_link_f[PHIT_PARITY][24] ;
   output \LEDR_link_f[PHIT_PARITY][23] ;
   output \LEDR_link_f[PHIT_PARITY][22] ;
   output \LEDR_link_f[PHIT_PARITY][21] ;
   output \LEDR_link_f[PHIT_PARITY][20] ;
   output \LEDR_link_f[PHIT_PARITY][19] ;
   output \LEDR_link_f[PHIT_PARITY][18] ;
   output \LEDR_link_f[PHIT_PARITY][17] ;
   output \LEDR_link_f[PHIT_PARITY][16] ;
   output \LEDR_link_f[PHIT_PARITY][15] ;
   output \LEDR_link_f[PHIT_PARITY][14] ;
   output \LEDR_link_f[PHIT_PARITY][13] ;
   output \LEDR_link_f[PHIT_PARITY][12] ;
   output \LEDR_link_f[PHIT_PARITY][11] ;
   output \LEDR_link_f[PHIT_PARITY][10] ;
   output \LEDR_link_f[PHIT_PARITY][9] ;
   output \LEDR_link_f[PHIT_PARITY][8] ;
   output \LEDR_link_f[PHIT_PARITY][7] ;
   output \LEDR_link_f[PHIT_PARITY][6] ;
   output \LEDR_link_f[PHIT_PARITY][5] ;
   output \LEDR_link_f[PHIT_PARITY][4] ;
   output \LEDR_link_f[PHIT_PARITY][3] ;
   output \LEDR_link_f[PHIT_PARITY][2] ;
   output \LEDR_link_f[PHIT_PARITY][1] ;
   output \LEDR_link_f[PHIT_PARITY][0] ;
   input \LEDR_link_b[ACK] ;
   input FE_OFN0_preset;
   input FE_OFN2_preset;
   input FE_PHN1407_FE_OFN1003_preset;
   input FE_PHN1448_FE_OFN1003_preset;

   // Internal wires
   wire FE_PHN1459_FE_OFN1003_preset;
   wire FE_PHN1457_FE_OFN1003_preset;
   wire FE_PHN1455_FE_OFN1003_preset;
   wire FE_OFN1043_n7;
   wire clk;
   wire type_out;
   wire enabled_clk;
   wire N2;
   wire data_phase;
   wire N5;
   wire N6;
   wire n1;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire [32:0] data_parity;

   HS65_LH_BFX7 FE_PHC1459_FE_OFN1003_preset (.Z(FE_PHN1459_FE_OFN1003_preset), 
	.A(FE_PHN1455_FE_OFN1003_preset));
   HS65_LH_DLYIC2X9 FE_PHC1457_FE_OFN1003_preset (.Z(FE_PHN1457_FE_OFN1003_preset), 
	.A(FE_PHN1459_FE_OFN1003_preset));
   HS65_LH_DLYIC6X9 FE_PHC1455_FE_OFN1003_preset (.Z(FE_PHN1455_FE_OFN1003_preset), 
	.A(FE_PHN1407_FE_OFN1003_preset));
   HS65_LS_BFX7 FE_OFC1043_n7 (.Z(FE_OFN1043_n7), 
	.A(n7));
   HS65_LS_DFPRQX4 type_out_reg (.RN(n7), 
	.Q(type_out), 
	.D(\bundled_ch_f[DATA][33] ), 
	.CP(clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_T]  (.RN(n5), 
	.Q(\LEDR_link_f[TOKEN_T] ), 
	.D(\bundled_ch_f[DATA][33] ), 
	.CP(clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_PARITY]  (.RN(n5), 
	.Q(\LEDR_link_f[TOKEN_PARITY] ), 
	.D(N2), 
	.CP(clk));
   HS65_LS_DFPSQX9 data_phase_reg (.SN(n8), 
	.Q(data_phase), 
	.D(n4), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][32]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][32] ), 
	.D(\bundled_ch_f[DATA][32] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][31]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][31] ), 
	.D(\bundled_ch_f[DATA][31] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][30]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][30] ), 
	.D(\bundled_ch_f[DATA][30] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][29]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][29] ), 
	.D(\bundled_ch_f[DATA][29] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][28]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][28] ), 
	.D(\bundled_ch_f[DATA][28] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][27]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][27] ), 
	.D(\bundled_ch_f[DATA][27] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][26]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][26] ), 
	.D(\bundled_ch_f[DATA][26] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][25]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][25] ), 
	.D(\bundled_ch_f[DATA][25] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][24]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][24] ), 
	.D(\bundled_ch_f[DATA][24] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][23]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][23] ), 
	.D(\bundled_ch_f[DATA][23] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][22]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][22] ), 
	.D(\bundled_ch_f[DATA][22] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][21]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][21] ), 
	.D(\bundled_ch_f[DATA][21] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][20]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][20] ), 
	.D(\bundled_ch_f[DATA][20] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][19]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][19] ), 
	.D(\bundled_ch_f[DATA][19] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][18]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][18] ), 
	.D(\bundled_ch_f[DATA][18] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][17]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][17] ), 
	.D(\bundled_ch_f[DATA][17] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][16]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][16] ), 
	.D(\bundled_ch_f[DATA][16] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][15]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][15] ), 
	.D(\bundled_ch_f[DATA][15] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][14]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][14] ), 
	.D(\bundled_ch_f[DATA][14] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][13]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][13] ), 
	.D(\bundled_ch_f[DATA][13] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][12]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][12] ), 
	.D(\bundled_ch_f[DATA][12] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][11]  (.RN(FE_OFN1043_n7), 
	.Q(\LEDR_link_f[PHIT][11] ), 
	.D(\bundled_ch_f[DATA][11] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][10]  (.RN(FE_OFN1043_n7), 
	.Q(\LEDR_link_f[PHIT][10] ), 
	.D(\bundled_ch_f[DATA][10] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][9]  (.RN(FE_OFN1043_n7), 
	.Q(\LEDR_link_f[PHIT][9] ), 
	.D(\bundled_ch_f[DATA][9] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][8]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][8] ), 
	.D(\bundled_ch_f[DATA][8] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][7]  (.RN(FE_OFN1043_n7), 
	.Q(\LEDR_link_f[PHIT][7] ), 
	.D(\bundled_ch_f[DATA][7] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][6]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][6] ), 
	.D(\bundled_ch_f[DATA][6] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][5]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][5] ), 
	.D(\bundled_ch_f[DATA][5] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][4]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][4] ), 
	.D(\bundled_ch_f[DATA][4] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][3]  (.RN(FE_OFN1043_n7), 
	.Q(\LEDR_link_f[PHIT][3] ), 
	.D(\bundled_ch_f[DATA][3] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][2]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][2] ), 
	.D(\bundled_ch_f[DATA][2] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][1]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][1] ), 
	.D(\bundled_ch_f[DATA][1] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][0]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT][0] ), 
	.D(\bundled_ch_f[DATA][0] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][32]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][32] ), 
	.D(data_parity[32]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][31]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][31] ), 
	.D(data_parity[31]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][30]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][30] ), 
	.D(data_parity[30]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][29]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][29] ), 
	.D(data_parity[29]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][28]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][28] ), 
	.D(data_parity[28]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][27]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][27] ), 
	.D(data_parity[27]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][26]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][26] ), 
	.D(data_parity[26]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][25]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][25] ), 
	.D(data_parity[25]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][24]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][24] ), 
	.D(data_parity[24]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][23]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][23] ), 
	.D(data_parity[23]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][22]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][22] ), 
	.D(data_parity[22]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][21]  (.RN(FE_OFN1043_n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][21] ), 
	.D(data_parity[21]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][20]  (.RN(FE_OFN1043_n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][20] ), 
	.D(data_parity[20]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][19]  (.RN(FE_OFN1043_n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][19] ), 
	.D(data_parity[19]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][18]  (.RN(FE_OFN1043_n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][18] ), 
	.D(data_parity[18]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][17]  (.RN(FE_OFN1043_n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][17] ), 
	.D(data_parity[17]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][16]  (.RN(FE_OFN1043_n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][16] ), 
	.D(data_parity[16]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][15]  (.RN(FE_OFN1043_n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][15] ), 
	.D(data_parity[15]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][14]  (.RN(FE_OFN1043_n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][14] ), 
	.D(data_parity[14]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][13]  (.RN(FE_OFN1043_n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][13] ), 
	.D(data_parity[13]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][12]  (.RN(FE_OFN1043_n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][12] ), 
	.D(data_parity[12]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][11]  (.RN(FE_OFN1043_n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][11] ), 
	.D(data_parity[11]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][10]  (.RN(FE_OFN1043_n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][10] ), 
	.D(data_parity[10]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][9]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][9] ), 
	.D(data_parity[9]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][8]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT_PARITY][8] ), 
	.D(data_parity[8]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][7]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][7] ), 
	.D(data_parity[7]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][6]  (.RN(FE_OFN1043_n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][6] ), 
	.D(data_parity[6]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][5]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT_PARITY][5] ), 
	.D(data_parity[5]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][4]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][4] ), 
	.D(data_parity[4]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][3]  (.RN(FE_OFN1043_n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][3] ), 
	.D(data_parity[3]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][2]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][2] ), 
	.D(data_parity[2]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][1]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][1] ), 
	.D(data_parity[1]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][0]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT_PARITY][0] ), 
	.D(data_parity[0]), 
	.CP(enabled_clk));
   HS65_LS_LDHQX9 ack_reg (.Q(\bundled_ch_b[ACK] ), 
	.G(N5), 
	.D(N6));
   HS65_LSS_XOR2X6 C214 (.Z(clk), 
	.B(\bundled_ch_b[ACK] ), 
	.A(\LEDR_link_b[ACK] ));
   HS65_LS_AND2X9 C215 (.Z(enabled_clk), 
	.B(type_out), 
	.A(clk));
   HS65_LS_IVX9 U5 (.Z(n1), 
	.A(n4));
   HS65_LSS_XOR2X6 U7 (.Z(N2), 
	.B(\bundled_ch_f[DATA][33] ), 
	.A(\bundled_ch_f[REQ] ));
   HS65_LS_IVX9 U9 (.Z(n4), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U10 (.Z(data_parity[9]), 
	.B(\bundled_ch_f[DATA][9] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U11 (.Z(data_parity[0]), 
	.B(\bundled_ch_f[DATA][0] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U12 (.Z(data_parity[1]), 
	.B(\bundled_ch_f[DATA][1] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U13 (.Z(data_parity[2]), 
	.B(\bundled_ch_f[DATA][2] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U14 (.Z(data_parity[10]), 
	.B(\bundled_ch_f[DATA][10] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U15 (.Z(data_parity[11]), 
	.B(\bundled_ch_f[DATA][11] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U16 (.Z(data_parity[12]), 
	.B(\bundled_ch_f[DATA][12] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U17 (.Z(data_parity[13]), 
	.B(\bundled_ch_f[DATA][13] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U18 (.Z(data_parity[14]), 
	.B(\bundled_ch_f[DATA][14] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U19 (.Z(data_parity[15]), 
	.B(\bundled_ch_f[DATA][15] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U20 (.Z(data_parity[16]), 
	.B(\bundled_ch_f[DATA][16] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U21 (.Z(data_parity[17]), 
	.B(\bundled_ch_f[DATA][17] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U22 (.Z(data_parity[18]), 
	.B(\bundled_ch_f[DATA][18] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U23 (.Z(data_parity[19]), 
	.B(\bundled_ch_f[DATA][19] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U24 (.Z(data_parity[20]), 
	.B(\bundled_ch_f[DATA][20] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U25 (.Z(data_parity[21]), 
	.B(\bundled_ch_f[DATA][21] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U26 (.Z(data_parity[22]), 
	.B(\bundled_ch_f[DATA][22] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U27 (.Z(data_parity[23]), 
	.B(\bundled_ch_f[DATA][23] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U28 (.Z(data_parity[24]), 
	.B(\bundled_ch_f[DATA][24] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U29 (.Z(data_parity[25]), 
	.B(\bundled_ch_f[DATA][25] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U30 (.Z(data_parity[26]), 
	.B(\bundled_ch_f[DATA][26] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U31 (.Z(data_parity[27]), 
	.B(\bundled_ch_f[DATA][27] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U32 (.Z(data_parity[28]), 
	.B(\bundled_ch_f[DATA][28] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U33 (.Z(data_parity[29]), 
	.B(\bundled_ch_f[DATA][29] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U34 (.Z(data_parity[30]), 
	.B(\bundled_ch_f[DATA][30] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U35 (.Z(data_parity[31]), 
	.B(\bundled_ch_f[DATA][31] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U36 (.Z(data_parity[32]), 
	.B(\bundled_ch_f[DATA][32] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U37 (.Z(data_parity[3]), 
	.B(\bundled_ch_f[DATA][3] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U38 (.Z(data_parity[4]), 
	.B(\bundled_ch_f[DATA][4] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U39 (.Z(data_parity[5]), 
	.B(\bundled_ch_f[DATA][5] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U40 (.Z(data_parity[6]), 
	.B(\bundled_ch_f[DATA][6] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U41 (.Z(data_parity[7]), 
	.B(\bundled_ch_f[DATA][7] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U42 (.Z(data_parity[8]), 
	.B(\bundled_ch_f[DATA][8] ), 
	.A(data_phase));
   HS65_LS_IVX9 U43 (.Z(n6), 
	.A(FE_OFN2_preset));
   HS65_LS_IVX9 U44 (.Z(n5), 
	.A(FE_OFN0_preset));
   HS65_LS_IVX9 U45 (.Z(n7), 
	.A(FE_OFN2_preset));
   HS65_LS_IVX9 U47 (.Z(n8), 
	.A(preset));
   HS65_LS_NOR2AX3 U48 (.Z(N6), 
	.B(FE_PHN1448_FE_OFN1003_preset), 
	.A(\bundled_ch_f[REQ] ));
   HS65_LS_NAND2AX7 U49 (.Z(N5), 
	.B(clk), 
	.A(FE_PHN1457_FE_OFN1003_preset));
endmodule

module bundled2LEDR_2 (
	preset, 
	.bundled_ch_f ( { \bundled_ch_f[REQ] , 
		\bundled_ch_f[DATA][33] , 
		\bundled_ch_f[DATA][32] , 
		\bundled_ch_f[DATA][31] , 
		\bundled_ch_f[DATA][30] , 
		\bundled_ch_f[DATA][29] , 
		\bundled_ch_f[DATA][28] , 
		\bundled_ch_f[DATA][27] , 
		\bundled_ch_f[DATA][26] , 
		\bundled_ch_f[DATA][25] , 
		\bundled_ch_f[DATA][24] , 
		\bundled_ch_f[DATA][23] , 
		\bundled_ch_f[DATA][22] , 
		\bundled_ch_f[DATA][21] , 
		\bundled_ch_f[DATA][20] , 
		\bundled_ch_f[DATA][19] , 
		\bundled_ch_f[DATA][18] , 
		\bundled_ch_f[DATA][17] , 
		\bundled_ch_f[DATA][16] , 
		\bundled_ch_f[DATA][15] , 
		\bundled_ch_f[DATA][14] , 
		\bundled_ch_f[DATA][13] , 
		\bundled_ch_f[DATA][12] , 
		\bundled_ch_f[DATA][11] , 
		\bundled_ch_f[DATA][10] , 
		\bundled_ch_f[DATA][9] , 
		\bundled_ch_f[DATA][8] , 
		\bundled_ch_f[DATA][7] , 
		\bundled_ch_f[DATA][6] , 
		\bundled_ch_f[DATA][5] , 
		\bundled_ch_f[DATA][4] , 
		\bundled_ch_f[DATA][3] , 
		\bundled_ch_f[DATA][2] , 
		\bundled_ch_f[DATA][1] , 
		\bundled_ch_f[DATA][0]  } ), 
	.bundled_ch_b ( \bundled_ch_b[ACK]  ), 
	.LEDR_link_f ( { \LEDR_link_f[TOKEN_T] , 
		\LEDR_link_f[TOKEN_PARITY] , 
		\LEDR_link_f[PHIT][32] , 
		\LEDR_link_f[PHIT][31] , 
		\LEDR_link_f[PHIT][30] , 
		\LEDR_link_f[PHIT][29] , 
		\LEDR_link_f[PHIT][28] , 
		\LEDR_link_f[PHIT][27] , 
		\LEDR_link_f[PHIT][26] , 
		\LEDR_link_f[PHIT][25] , 
		\LEDR_link_f[PHIT][24] , 
		\LEDR_link_f[PHIT][23] , 
		\LEDR_link_f[PHIT][22] , 
		\LEDR_link_f[PHIT][21] , 
		\LEDR_link_f[PHIT][20] , 
		\LEDR_link_f[PHIT][19] , 
		\LEDR_link_f[PHIT][18] , 
		\LEDR_link_f[PHIT][17] , 
		\LEDR_link_f[PHIT][16] , 
		\LEDR_link_f[PHIT][15] , 
		\LEDR_link_f[PHIT][14] , 
		\LEDR_link_f[PHIT][13] , 
		\LEDR_link_f[PHIT][12] , 
		\LEDR_link_f[PHIT][11] , 
		\LEDR_link_f[PHIT][10] , 
		\LEDR_link_f[PHIT][9] , 
		\LEDR_link_f[PHIT][8] , 
		\LEDR_link_f[PHIT][7] , 
		\LEDR_link_f[PHIT][6] , 
		\LEDR_link_f[PHIT][5] , 
		\LEDR_link_f[PHIT][4] , 
		\LEDR_link_f[PHIT][3] , 
		\LEDR_link_f[PHIT][2] , 
		\LEDR_link_f[PHIT][1] , 
		\LEDR_link_f[PHIT][0] , 
		\LEDR_link_f[PHIT_PARITY][32] , 
		\LEDR_link_f[PHIT_PARITY][31] , 
		\LEDR_link_f[PHIT_PARITY][30] , 
		\LEDR_link_f[PHIT_PARITY][29] , 
		\LEDR_link_f[PHIT_PARITY][28] , 
		\LEDR_link_f[PHIT_PARITY][27] , 
		\LEDR_link_f[PHIT_PARITY][26] , 
		\LEDR_link_f[PHIT_PARITY][25] , 
		\LEDR_link_f[PHIT_PARITY][24] , 
		\LEDR_link_f[PHIT_PARITY][23] , 
		\LEDR_link_f[PHIT_PARITY][22] , 
		\LEDR_link_f[PHIT_PARITY][21] , 
		\LEDR_link_f[PHIT_PARITY][20] , 
		\LEDR_link_f[PHIT_PARITY][19] , 
		\LEDR_link_f[PHIT_PARITY][18] , 
		\LEDR_link_f[PHIT_PARITY][17] , 
		\LEDR_link_f[PHIT_PARITY][16] , 
		\LEDR_link_f[PHIT_PARITY][15] , 
		\LEDR_link_f[PHIT_PARITY][14] , 
		\LEDR_link_f[PHIT_PARITY][13] , 
		\LEDR_link_f[PHIT_PARITY][12] , 
		\LEDR_link_f[PHIT_PARITY][11] , 
		\LEDR_link_f[PHIT_PARITY][10] , 
		\LEDR_link_f[PHIT_PARITY][9] , 
		\LEDR_link_f[PHIT_PARITY][8] , 
		\LEDR_link_f[PHIT_PARITY][7] , 
		\LEDR_link_f[PHIT_PARITY][6] , 
		\LEDR_link_f[PHIT_PARITY][5] , 
		\LEDR_link_f[PHIT_PARITY][4] , 
		\LEDR_link_f[PHIT_PARITY][3] , 
		\LEDR_link_f[PHIT_PARITY][2] , 
		\LEDR_link_f[PHIT_PARITY][1] , 
		\LEDR_link_f[PHIT_PARITY][0]  } ), 
	.LEDR_link_b ( \LEDR_link_b[ACK]  ), 
	FE_OFN2_preset);
   input preset;
   input \bundled_ch_f[REQ] ;
   input \bundled_ch_f[DATA][33] ;
   input \bundled_ch_f[DATA][32] ;
   input \bundled_ch_f[DATA][31] ;
   input \bundled_ch_f[DATA][30] ;
   input \bundled_ch_f[DATA][29] ;
   input \bundled_ch_f[DATA][28] ;
   input \bundled_ch_f[DATA][27] ;
   input \bundled_ch_f[DATA][26] ;
   input \bundled_ch_f[DATA][25] ;
   input \bundled_ch_f[DATA][24] ;
   input \bundled_ch_f[DATA][23] ;
   input \bundled_ch_f[DATA][22] ;
   input \bundled_ch_f[DATA][21] ;
   input \bundled_ch_f[DATA][20] ;
   input \bundled_ch_f[DATA][19] ;
   input \bundled_ch_f[DATA][18] ;
   input \bundled_ch_f[DATA][17] ;
   input \bundled_ch_f[DATA][16] ;
   input \bundled_ch_f[DATA][15] ;
   input \bundled_ch_f[DATA][14] ;
   input \bundled_ch_f[DATA][13] ;
   input \bundled_ch_f[DATA][12] ;
   input \bundled_ch_f[DATA][11] ;
   input \bundled_ch_f[DATA][10] ;
   input \bundled_ch_f[DATA][9] ;
   input \bundled_ch_f[DATA][8] ;
   input \bundled_ch_f[DATA][7] ;
   input \bundled_ch_f[DATA][6] ;
   input \bundled_ch_f[DATA][5] ;
   input \bundled_ch_f[DATA][4] ;
   input \bundled_ch_f[DATA][3] ;
   input \bundled_ch_f[DATA][2] ;
   input \bundled_ch_f[DATA][1] ;
   input \bundled_ch_f[DATA][0] ;
   output \bundled_ch_b[ACK] ;
   output \LEDR_link_f[TOKEN_T] ;
   output \LEDR_link_f[TOKEN_PARITY] ;
   output \LEDR_link_f[PHIT][32] ;
   output \LEDR_link_f[PHIT][31] ;
   output \LEDR_link_f[PHIT][30] ;
   output \LEDR_link_f[PHIT][29] ;
   output \LEDR_link_f[PHIT][28] ;
   output \LEDR_link_f[PHIT][27] ;
   output \LEDR_link_f[PHIT][26] ;
   output \LEDR_link_f[PHIT][25] ;
   output \LEDR_link_f[PHIT][24] ;
   output \LEDR_link_f[PHIT][23] ;
   output \LEDR_link_f[PHIT][22] ;
   output \LEDR_link_f[PHIT][21] ;
   output \LEDR_link_f[PHIT][20] ;
   output \LEDR_link_f[PHIT][19] ;
   output \LEDR_link_f[PHIT][18] ;
   output \LEDR_link_f[PHIT][17] ;
   output \LEDR_link_f[PHIT][16] ;
   output \LEDR_link_f[PHIT][15] ;
   output \LEDR_link_f[PHIT][14] ;
   output \LEDR_link_f[PHIT][13] ;
   output \LEDR_link_f[PHIT][12] ;
   output \LEDR_link_f[PHIT][11] ;
   output \LEDR_link_f[PHIT][10] ;
   output \LEDR_link_f[PHIT][9] ;
   output \LEDR_link_f[PHIT][8] ;
   output \LEDR_link_f[PHIT][7] ;
   output \LEDR_link_f[PHIT][6] ;
   output \LEDR_link_f[PHIT][5] ;
   output \LEDR_link_f[PHIT][4] ;
   output \LEDR_link_f[PHIT][3] ;
   output \LEDR_link_f[PHIT][2] ;
   output \LEDR_link_f[PHIT][1] ;
   output \LEDR_link_f[PHIT][0] ;
   output \LEDR_link_f[PHIT_PARITY][32] ;
   output \LEDR_link_f[PHIT_PARITY][31] ;
   output \LEDR_link_f[PHIT_PARITY][30] ;
   output \LEDR_link_f[PHIT_PARITY][29] ;
   output \LEDR_link_f[PHIT_PARITY][28] ;
   output \LEDR_link_f[PHIT_PARITY][27] ;
   output \LEDR_link_f[PHIT_PARITY][26] ;
   output \LEDR_link_f[PHIT_PARITY][25] ;
   output \LEDR_link_f[PHIT_PARITY][24] ;
   output \LEDR_link_f[PHIT_PARITY][23] ;
   output \LEDR_link_f[PHIT_PARITY][22] ;
   output \LEDR_link_f[PHIT_PARITY][21] ;
   output \LEDR_link_f[PHIT_PARITY][20] ;
   output \LEDR_link_f[PHIT_PARITY][19] ;
   output \LEDR_link_f[PHIT_PARITY][18] ;
   output \LEDR_link_f[PHIT_PARITY][17] ;
   output \LEDR_link_f[PHIT_PARITY][16] ;
   output \LEDR_link_f[PHIT_PARITY][15] ;
   output \LEDR_link_f[PHIT_PARITY][14] ;
   output \LEDR_link_f[PHIT_PARITY][13] ;
   output \LEDR_link_f[PHIT_PARITY][12] ;
   output \LEDR_link_f[PHIT_PARITY][11] ;
   output \LEDR_link_f[PHIT_PARITY][10] ;
   output \LEDR_link_f[PHIT_PARITY][9] ;
   output \LEDR_link_f[PHIT_PARITY][8] ;
   output \LEDR_link_f[PHIT_PARITY][7] ;
   output \LEDR_link_f[PHIT_PARITY][6] ;
   output \LEDR_link_f[PHIT_PARITY][5] ;
   output \LEDR_link_f[PHIT_PARITY][4] ;
   output \LEDR_link_f[PHIT_PARITY][3] ;
   output \LEDR_link_f[PHIT_PARITY][2] ;
   output \LEDR_link_f[PHIT_PARITY][1] ;
   output \LEDR_link_f[PHIT_PARITY][0] ;
   input \LEDR_link_b[ACK] ;
   input FE_OFN2_preset;

   // Internal wires
   wire FE_PHN1454_FE_OFN1003_preset;
   wire FE_PHN1453_FE_OFN1003_preset;
   wire FE_PHN1452_FE_OFN1003_preset;
   wire FE_PHN1451_FE_OFN1003_preset;
   wire FE_PHN1449_FE_OFN1003_preset;
   wire FE_PHN1443_FE_OFN1003_preset;
   wire FE_PHN1421_FE_OFN1003_preset;
   wire FE_OFN1042_n9;
   wire clk;
   wire type_out;
   wire enabled_clk;
   wire N2;
   wire data_phase;
   wire N5;
   wire N6;
   wire n1;
   wire n4;
   wire n5;
   wire n7;
   wire n8;
   wire n9;
   wire [32:0] data_parity;

   HS65_LH_DLYIC2X9 FE_PHC1454_FE_OFN1003_preset (.Z(FE_PHN1454_FE_OFN1003_preset), 
	.A(FE_PHN1421_FE_OFN1003_preset));
   HS65_LH_BFX2 FE_PHC1453_FE_OFN1003_preset (.Z(FE_PHN1453_FE_OFN1003_preset), 
	.A(preset));
   HS65_LH_BFX2 FE_PHC1452_FE_OFN1003_preset (.Z(FE_PHN1452_FE_OFN1003_preset), 
	.A(FE_PHN1453_FE_OFN1003_preset));
   HS65_LH_BFX2 FE_PHC1451_FE_OFN1003_preset (.Z(FE_PHN1451_FE_OFN1003_preset), 
	.A(FE_PHN1452_FE_OFN1003_preset));
   HS65_LH_DLYIC6X9 FE_PHC1449_FE_OFN1003_preset (.Z(FE_PHN1449_FE_OFN1003_preset), 
	.A(FE_PHN1451_FE_OFN1003_preset));
   HS65_LH_BFX2 FE_PHC1443_FE_OFN1003_preset (.Z(FE_PHN1443_FE_OFN1003_preset), 
	.A(FE_PHN1449_FE_OFN1003_preset));
   HS65_LH_BFX2 FE_PHC1421_FE_OFN1003_preset (.Z(FE_PHN1421_FE_OFN1003_preset), 
	.A(FE_PHN1443_FE_OFN1003_preset));
   HS65_LS_BFX7 FE_OFC1042_n9 (.Z(FE_OFN1042_n9), 
	.A(n9));
   HS65_LS_DFPRQX4 type_out_reg (.RN(n7), 
	.Q(type_out), 
	.D(\bundled_ch_f[DATA][33] ), 
	.CP(clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_T]  (.RN(n5), 
	.Q(\LEDR_link_f[TOKEN_T] ), 
	.D(\bundled_ch_f[DATA][33] ), 
	.CP(clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_PARITY]  (.RN(n5), 
	.Q(\LEDR_link_f[TOKEN_PARITY] ), 
	.D(N2), 
	.CP(clk));
   HS65_LSS_DFPSQX18 data_phase_reg (.SN(n8), 
	.Q(data_phase), 
	.D(n4), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][32]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][32] ), 
	.D(\bundled_ch_f[DATA][32] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][31]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][31] ), 
	.D(\bundled_ch_f[DATA][31] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][30]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][30] ), 
	.D(\bundled_ch_f[DATA][30] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][29]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][29] ), 
	.D(\bundled_ch_f[DATA][29] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][28]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][28] ), 
	.D(\bundled_ch_f[DATA][28] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][27]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][27] ), 
	.D(\bundled_ch_f[DATA][27] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][26]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][26] ), 
	.D(\bundled_ch_f[DATA][26] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][25]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][25] ), 
	.D(\bundled_ch_f[DATA][25] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][24]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][24] ), 
	.D(\bundled_ch_f[DATA][24] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][23]  (.RN(FE_OFN1042_n9), 
	.Q(\LEDR_link_f[PHIT][23] ), 
	.D(\bundled_ch_f[DATA][23] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][22]  (.RN(FE_OFN1042_n9), 
	.Q(\LEDR_link_f[PHIT][22] ), 
	.D(\bundled_ch_f[DATA][22] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][21]  (.RN(FE_OFN1042_n9), 
	.Q(\LEDR_link_f[PHIT][21] ), 
	.D(\bundled_ch_f[DATA][21] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][20]  (.RN(FE_OFN1042_n9), 
	.Q(\LEDR_link_f[PHIT][20] ), 
	.D(\bundled_ch_f[DATA][20] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][19]  (.RN(FE_OFN1042_n9), 
	.Q(\LEDR_link_f[PHIT][19] ), 
	.D(\bundled_ch_f[DATA][19] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][18]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT][18] ), 
	.D(\bundled_ch_f[DATA][18] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][17]  (.RN(FE_OFN1042_n9), 
	.Q(\LEDR_link_f[PHIT][17] ), 
	.D(\bundled_ch_f[DATA][17] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][16]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT][16] ), 
	.D(\bundled_ch_f[DATA][16] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][15]  (.RN(FE_OFN1042_n9), 
	.Q(\LEDR_link_f[PHIT][15] ), 
	.D(\bundled_ch_f[DATA][15] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][14]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT][14] ), 
	.D(\bundled_ch_f[DATA][14] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][13]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT][13] ), 
	.D(\bundled_ch_f[DATA][13] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][12]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT][12] ), 
	.D(\bundled_ch_f[DATA][12] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][11]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][11] ), 
	.D(\bundled_ch_f[DATA][11] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][10]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][10] ), 
	.D(\bundled_ch_f[DATA][10] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][9]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][9] ), 
	.D(\bundled_ch_f[DATA][9] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][8]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][8] ), 
	.D(\bundled_ch_f[DATA][8] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][7]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][7] ), 
	.D(\bundled_ch_f[DATA][7] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][6]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][6] ), 
	.D(\bundled_ch_f[DATA][6] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][5]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][5] ), 
	.D(\bundled_ch_f[DATA][5] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][4]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][4] ), 
	.D(\bundled_ch_f[DATA][4] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][3]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][3] ), 
	.D(\bundled_ch_f[DATA][3] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][2]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][2] ), 
	.D(\bundled_ch_f[DATA][2] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][1]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][1] ), 
	.D(\bundled_ch_f[DATA][1] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][0]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT][0] ), 
	.D(\bundled_ch_f[DATA][0] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][32]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][32] ), 
	.D(data_parity[32]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][31]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][31] ), 
	.D(data_parity[31]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][30]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][30] ), 
	.D(data_parity[30]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][29]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][29] ), 
	.D(data_parity[29]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][28]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][28] ), 
	.D(data_parity[28]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][27]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][27] ), 
	.D(data_parity[27]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][26]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][26] ), 
	.D(data_parity[26]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][25]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][25] ), 
	.D(data_parity[25]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][24]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][24] ), 
	.D(data_parity[24]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][23]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][23] ), 
	.D(data_parity[23]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][22]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][22] ), 
	.D(data_parity[22]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][21]  (.RN(FE_OFN1042_n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][21] ), 
	.D(data_parity[21]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][20]  (.RN(FE_OFN1042_n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][20] ), 
	.D(data_parity[20]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][19]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][19] ), 
	.D(data_parity[19]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][18]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][18] ), 
	.D(data_parity[18]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][17]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][17] ), 
	.D(data_parity[17]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][16]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][16] ), 
	.D(data_parity[16]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][15]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][15] ), 
	.D(data_parity[15]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][14]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][14] ), 
	.D(data_parity[14]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][13]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][13] ), 
	.D(data_parity[13]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][12]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][12] ), 
	.D(data_parity[12]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][11]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][11] ), 
	.D(data_parity[11]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][10]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][10] ), 
	.D(data_parity[10]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][9]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][9] ), 
	.D(data_parity[9]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][8]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT_PARITY][8] ), 
	.D(data_parity[8]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][7]  (.RN(FE_OFN1042_n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][7] ), 
	.D(data_parity[7]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][6]  (.RN(FE_OFN1042_n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][6] ), 
	.D(data_parity[6]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][5]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT_PARITY][5] ), 
	.D(data_parity[5]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][4]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][4] ), 
	.D(data_parity[4]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][3]  (.RN(FE_OFN1042_n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][3] ), 
	.D(data_parity[3]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][2]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][2] ), 
	.D(data_parity[2]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][1]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][1] ), 
	.D(data_parity[1]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][0]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT_PARITY][0] ), 
	.D(data_parity[0]), 
	.CP(enabled_clk));
   HS65_LS_LDHQX9 ack_reg (.Q(\bundled_ch_b[ACK] ), 
	.G(N5), 
	.D(N6));
   HS65_LSS_XOR2X6 C214 (.Z(clk), 
	.B(\bundled_ch_b[ACK] ), 
	.A(\LEDR_link_b[ACK] ));
   HS65_LS_AND2X9 C215 (.Z(enabled_clk), 
	.B(type_out), 
	.A(clk));
   HS65_LS_IVX9 U5 (.Z(n1), 
	.A(n4));
   HS65_LSS_XOR2X6 U7 (.Z(N2), 
	.B(\bundled_ch_f[DATA][33] ), 
	.A(\bundled_ch_f[REQ] ));
   HS65_LS_IVX9 U9 (.Z(n4), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U10 (.Z(data_parity[9]), 
	.B(\bundled_ch_f[DATA][9] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U11 (.Z(data_parity[0]), 
	.B(\bundled_ch_f[DATA][0] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U12 (.Z(data_parity[1]), 
	.B(\bundled_ch_f[DATA][1] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U13 (.Z(data_parity[2]), 
	.B(\bundled_ch_f[DATA][2] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U14 (.Z(data_parity[10]), 
	.B(\bundled_ch_f[DATA][10] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U15 (.Z(data_parity[11]), 
	.B(\bundled_ch_f[DATA][11] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U16 (.Z(data_parity[12]), 
	.B(\bundled_ch_f[DATA][12] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U17 (.Z(data_parity[13]), 
	.B(\bundled_ch_f[DATA][13] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U18 (.Z(data_parity[14]), 
	.B(\bundled_ch_f[DATA][14] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U19 (.Z(data_parity[15]), 
	.B(\bundled_ch_f[DATA][15] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U20 (.Z(data_parity[16]), 
	.B(\bundled_ch_f[DATA][16] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U21 (.Z(data_parity[17]), 
	.B(\bundled_ch_f[DATA][17] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U22 (.Z(data_parity[18]), 
	.B(\bundled_ch_f[DATA][18] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U23 (.Z(data_parity[19]), 
	.B(\bundled_ch_f[DATA][19] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U24 (.Z(data_parity[20]), 
	.B(\bundled_ch_f[DATA][20] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U25 (.Z(data_parity[21]), 
	.B(\bundled_ch_f[DATA][21] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U26 (.Z(data_parity[22]), 
	.B(\bundled_ch_f[DATA][22] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U27 (.Z(data_parity[23]), 
	.B(\bundled_ch_f[DATA][23] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U28 (.Z(data_parity[24]), 
	.B(\bundled_ch_f[DATA][24] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U29 (.Z(data_parity[25]), 
	.B(\bundled_ch_f[DATA][25] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U30 (.Z(data_parity[26]), 
	.B(\bundled_ch_f[DATA][26] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U31 (.Z(data_parity[27]), 
	.B(\bundled_ch_f[DATA][27] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U32 (.Z(data_parity[28]), 
	.B(\bundled_ch_f[DATA][28] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U33 (.Z(data_parity[29]), 
	.B(\bundled_ch_f[DATA][29] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U34 (.Z(data_parity[30]), 
	.B(\bundled_ch_f[DATA][30] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U35 (.Z(data_parity[31]), 
	.B(\bundled_ch_f[DATA][31] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U36 (.Z(data_parity[32]), 
	.B(\bundled_ch_f[DATA][32] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U37 (.Z(data_parity[3]), 
	.B(\bundled_ch_f[DATA][3] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U38 (.Z(data_parity[4]), 
	.B(\bundled_ch_f[DATA][4] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U39 (.Z(data_parity[5]), 
	.B(\bundled_ch_f[DATA][5] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U40 (.Z(data_parity[6]), 
	.B(\bundled_ch_f[DATA][6] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U41 (.Z(data_parity[7]), 
	.B(\bundled_ch_f[DATA][7] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U42 (.Z(data_parity[8]), 
	.B(\bundled_ch_f[DATA][8] ), 
	.A(data_phase));
   HS65_LS_IVX9 U44 (.Z(n5), 
	.A(preset));
   HS65_LS_IVX9 U45 (.Z(n7), 
	.A(FE_OFN2_preset));
   HS65_LS_IVX9 U46 (.Z(n9), 
	.A(FE_OFN2_preset));
   HS65_LS_IVX9 U47 (.Z(n8), 
	.A(FE_OFN2_preset));
   HS65_LS_NOR2AX3 U48 (.Z(N6), 
	.B(preset), 
	.A(\bundled_ch_f[REQ] ));
   HS65_LS_NAND2AX7 U49 (.Z(N5), 
	.B(clk), 
	.A(FE_PHN1454_FE_OFN1003_preset));
endmodule

module bundled2LEDR_3 (
	preset, 
	.bundled_ch_f ( { \bundled_ch_f[REQ] , 
		\bundled_ch_f[DATA][33] , 
		\bundled_ch_f[DATA][32] , 
		\bundled_ch_f[DATA][31] , 
		\bundled_ch_f[DATA][30] , 
		\bundled_ch_f[DATA][29] , 
		\bundled_ch_f[DATA][28] , 
		\bundled_ch_f[DATA][27] , 
		\bundled_ch_f[DATA][26] , 
		\bundled_ch_f[DATA][25] , 
		\bundled_ch_f[DATA][24] , 
		\bundled_ch_f[DATA][23] , 
		\bundled_ch_f[DATA][22] , 
		\bundled_ch_f[DATA][21] , 
		\bundled_ch_f[DATA][20] , 
		\bundled_ch_f[DATA][19] , 
		\bundled_ch_f[DATA][18] , 
		\bundled_ch_f[DATA][17] , 
		\bundled_ch_f[DATA][16] , 
		\bundled_ch_f[DATA][15] , 
		\bundled_ch_f[DATA][14] , 
		\bundled_ch_f[DATA][13] , 
		\bundled_ch_f[DATA][12] , 
		\bundled_ch_f[DATA][11] , 
		\bundled_ch_f[DATA][10] , 
		\bundled_ch_f[DATA][9] , 
		\bundled_ch_f[DATA][8] , 
		\bundled_ch_f[DATA][7] , 
		\bundled_ch_f[DATA][6] , 
		\bundled_ch_f[DATA][5] , 
		\bundled_ch_f[DATA][4] , 
		\bundled_ch_f[DATA][3] , 
		\bundled_ch_f[DATA][2] , 
		\bundled_ch_f[DATA][1] , 
		\bundled_ch_f[DATA][0]  } ), 
	.bundled_ch_b ( \bundled_ch_b[ACK]  ), 
	.LEDR_link_f ( { \LEDR_link_f[TOKEN_T] , 
		\LEDR_link_f[TOKEN_PARITY] , 
		\LEDR_link_f[PHIT][32] , 
		\LEDR_link_f[PHIT][31] , 
		\LEDR_link_f[PHIT][30] , 
		\LEDR_link_f[PHIT][29] , 
		\LEDR_link_f[PHIT][28] , 
		\LEDR_link_f[PHIT][27] , 
		\LEDR_link_f[PHIT][26] , 
		\LEDR_link_f[PHIT][25] , 
		\LEDR_link_f[PHIT][24] , 
		\LEDR_link_f[PHIT][23] , 
		\LEDR_link_f[PHIT][22] , 
		\LEDR_link_f[PHIT][21] , 
		\LEDR_link_f[PHIT][20] , 
		\LEDR_link_f[PHIT][19] , 
		\LEDR_link_f[PHIT][18] , 
		\LEDR_link_f[PHIT][17] , 
		\LEDR_link_f[PHIT][16] , 
		\LEDR_link_f[PHIT][15] , 
		\LEDR_link_f[PHIT][14] , 
		\LEDR_link_f[PHIT][13] , 
		\LEDR_link_f[PHIT][12] , 
		\LEDR_link_f[PHIT][11] , 
		\LEDR_link_f[PHIT][10] , 
		\LEDR_link_f[PHIT][9] , 
		\LEDR_link_f[PHIT][8] , 
		\LEDR_link_f[PHIT][7] , 
		\LEDR_link_f[PHIT][6] , 
		\LEDR_link_f[PHIT][5] , 
		\LEDR_link_f[PHIT][4] , 
		\LEDR_link_f[PHIT][3] , 
		\LEDR_link_f[PHIT][2] , 
		\LEDR_link_f[PHIT][1] , 
		\LEDR_link_f[PHIT][0] , 
		\LEDR_link_f[PHIT_PARITY][32] , 
		\LEDR_link_f[PHIT_PARITY][31] , 
		\LEDR_link_f[PHIT_PARITY][30] , 
		\LEDR_link_f[PHIT_PARITY][29] , 
		\LEDR_link_f[PHIT_PARITY][28] , 
		\LEDR_link_f[PHIT_PARITY][27] , 
		\LEDR_link_f[PHIT_PARITY][26] , 
		\LEDR_link_f[PHIT_PARITY][25] , 
		\LEDR_link_f[PHIT_PARITY][24] , 
		\LEDR_link_f[PHIT_PARITY][23] , 
		\LEDR_link_f[PHIT_PARITY][22] , 
		\LEDR_link_f[PHIT_PARITY][21] , 
		\LEDR_link_f[PHIT_PARITY][20] , 
		\LEDR_link_f[PHIT_PARITY][19] , 
		\LEDR_link_f[PHIT_PARITY][18] , 
		\LEDR_link_f[PHIT_PARITY][17] , 
		\LEDR_link_f[PHIT_PARITY][16] , 
		\LEDR_link_f[PHIT_PARITY][15] , 
		\LEDR_link_f[PHIT_PARITY][14] , 
		\LEDR_link_f[PHIT_PARITY][13] , 
		\LEDR_link_f[PHIT_PARITY][12] , 
		\LEDR_link_f[PHIT_PARITY][11] , 
		\LEDR_link_f[PHIT_PARITY][10] , 
		\LEDR_link_f[PHIT_PARITY][9] , 
		\LEDR_link_f[PHIT_PARITY][8] , 
		\LEDR_link_f[PHIT_PARITY][7] , 
		\LEDR_link_f[PHIT_PARITY][6] , 
		\LEDR_link_f[PHIT_PARITY][5] , 
		\LEDR_link_f[PHIT_PARITY][4] , 
		\LEDR_link_f[PHIT_PARITY][3] , 
		\LEDR_link_f[PHIT_PARITY][2] , 
		\LEDR_link_f[PHIT_PARITY][1] , 
		\LEDR_link_f[PHIT_PARITY][0]  } ), 
	.LEDR_link_b ( \LEDR_link_b[ACK]  ), 
	FE_OFN2_preset);
   input preset;
   input \bundled_ch_f[REQ] ;
   input \bundled_ch_f[DATA][33] ;
   input \bundled_ch_f[DATA][32] ;
   input \bundled_ch_f[DATA][31] ;
   input \bundled_ch_f[DATA][30] ;
   input \bundled_ch_f[DATA][29] ;
   input \bundled_ch_f[DATA][28] ;
   input \bundled_ch_f[DATA][27] ;
   input \bundled_ch_f[DATA][26] ;
   input \bundled_ch_f[DATA][25] ;
   input \bundled_ch_f[DATA][24] ;
   input \bundled_ch_f[DATA][23] ;
   input \bundled_ch_f[DATA][22] ;
   input \bundled_ch_f[DATA][21] ;
   input \bundled_ch_f[DATA][20] ;
   input \bundled_ch_f[DATA][19] ;
   input \bundled_ch_f[DATA][18] ;
   input \bundled_ch_f[DATA][17] ;
   input \bundled_ch_f[DATA][16] ;
   input \bundled_ch_f[DATA][15] ;
   input \bundled_ch_f[DATA][14] ;
   input \bundled_ch_f[DATA][13] ;
   input \bundled_ch_f[DATA][12] ;
   input \bundled_ch_f[DATA][11] ;
   input \bundled_ch_f[DATA][10] ;
   input \bundled_ch_f[DATA][9] ;
   input \bundled_ch_f[DATA][8] ;
   input \bundled_ch_f[DATA][7] ;
   input \bundled_ch_f[DATA][6] ;
   input \bundled_ch_f[DATA][5] ;
   input \bundled_ch_f[DATA][4] ;
   input \bundled_ch_f[DATA][3] ;
   input \bundled_ch_f[DATA][2] ;
   input \bundled_ch_f[DATA][1] ;
   input \bundled_ch_f[DATA][0] ;
   output \bundled_ch_b[ACK] ;
   output \LEDR_link_f[TOKEN_T] ;
   output \LEDR_link_f[TOKEN_PARITY] ;
   output \LEDR_link_f[PHIT][32] ;
   output \LEDR_link_f[PHIT][31] ;
   output \LEDR_link_f[PHIT][30] ;
   output \LEDR_link_f[PHIT][29] ;
   output \LEDR_link_f[PHIT][28] ;
   output \LEDR_link_f[PHIT][27] ;
   output \LEDR_link_f[PHIT][26] ;
   output \LEDR_link_f[PHIT][25] ;
   output \LEDR_link_f[PHIT][24] ;
   output \LEDR_link_f[PHIT][23] ;
   output \LEDR_link_f[PHIT][22] ;
   output \LEDR_link_f[PHIT][21] ;
   output \LEDR_link_f[PHIT][20] ;
   output \LEDR_link_f[PHIT][19] ;
   output \LEDR_link_f[PHIT][18] ;
   output \LEDR_link_f[PHIT][17] ;
   output \LEDR_link_f[PHIT][16] ;
   output \LEDR_link_f[PHIT][15] ;
   output \LEDR_link_f[PHIT][14] ;
   output \LEDR_link_f[PHIT][13] ;
   output \LEDR_link_f[PHIT][12] ;
   output \LEDR_link_f[PHIT][11] ;
   output \LEDR_link_f[PHIT][10] ;
   output \LEDR_link_f[PHIT][9] ;
   output \LEDR_link_f[PHIT][8] ;
   output \LEDR_link_f[PHIT][7] ;
   output \LEDR_link_f[PHIT][6] ;
   output \LEDR_link_f[PHIT][5] ;
   output \LEDR_link_f[PHIT][4] ;
   output \LEDR_link_f[PHIT][3] ;
   output \LEDR_link_f[PHIT][2] ;
   output \LEDR_link_f[PHIT][1] ;
   output \LEDR_link_f[PHIT][0] ;
   output \LEDR_link_f[PHIT_PARITY][32] ;
   output \LEDR_link_f[PHIT_PARITY][31] ;
   output \LEDR_link_f[PHIT_PARITY][30] ;
   output \LEDR_link_f[PHIT_PARITY][29] ;
   output \LEDR_link_f[PHIT_PARITY][28] ;
   output \LEDR_link_f[PHIT_PARITY][27] ;
   output \LEDR_link_f[PHIT_PARITY][26] ;
   output \LEDR_link_f[PHIT_PARITY][25] ;
   output \LEDR_link_f[PHIT_PARITY][24] ;
   output \LEDR_link_f[PHIT_PARITY][23] ;
   output \LEDR_link_f[PHIT_PARITY][22] ;
   output \LEDR_link_f[PHIT_PARITY][21] ;
   output \LEDR_link_f[PHIT_PARITY][20] ;
   output \LEDR_link_f[PHIT_PARITY][19] ;
   output \LEDR_link_f[PHIT_PARITY][18] ;
   output \LEDR_link_f[PHIT_PARITY][17] ;
   output \LEDR_link_f[PHIT_PARITY][16] ;
   output \LEDR_link_f[PHIT_PARITY][15] ;
   output \LEDR_link_f[PHIT_PARITY][14] ;
   output \LEDR_link_f[PHIT_PARITY][13] ;
   output \LEDR_link_f[PHIT_PARITY][12] ;
   output \LEDR_link_f[PHIT_PARITY][11] ;
   output \LEDR_link_f[PHIT_PARITY][10] ;
   output \LEDR_link_f[PHIT_PARITY][9] ;
   output \LEDR_link_f[PHIT_PARITY][8] ;
   output \LEDR_link_f[PHIT_PARITY][7] ;
   output \LEDR_link_f[PHIT_PARITY][6] ;
   output \LEDR_link_f[PHIT_PARITY][5] ;
   output \LEDR_link_f[PHIT_PARITY][4] ;
   output \LEDR_link_f[PHIT_PARITY][3] ;
   output \LEDR_link_f[PHIT_PARITY][2] ;
   output \LEDR_link_f[PHIT_PARITY][1] ;
   output \LEDR_link_f[PHIT_PARITY][0] ;
   input \LEDR_link_b[ACK] ;
   input FE_OFN2_preset;

   // Internal wires
   wire FE_PHN1460_FE_OFN1003_preset;
   wire FE_PHN1458_FE_OFN1003_preset;
   wire FE_PHN1456_FE_OFN1003_preset;
   wire FE_PHN1450_FE_OFN1003_preset;
   wire FE_PHN1447_FE_OFN1003_preset;
   wire FE_PHN1445_FE_OFN1003_preset;
   wire FE_PHN1435_FE_OFN1003_preset;
   wire FE_PHN1427_FE_OFN1003_preset;
   wire FE_OFN1041_n8;
   wire clk;
   wire type_out;
   wire enabled_clk;
   wire N2;
   wire data_phase;
   wire N5;
   wire N6;
   wire n1;
   wire n4;
   wire n5;
   wire n7;
   wire n8;
   wire n9;
   wire [32:0] data_parity;

   HS65_LH_BFX9 FE_PHC1460_FE_OFN1003_preset (.Z(FE_PHN1460_FE_OFN1003_preset), 
	.A(FE_PHN1456_FE_OFN1003_preset));
   HS65_LH_BFX2 FE_PHC1458_FE_OFN1003_preset (.Z(FE_PHN1458_FE_OFN1003_preset), 
	.A(FE_PHN1460_FE_OFN1003_preset));
   HS65_LH_DLYIC6X9 FE_PHC1456_FE_OFN1003_preset (.Z(FE_PHN1456_FE_OFN1003_preset), 
	.A(FE_PHN1447_FE_OFN1003_preset));
   HS65_LH_BFX2 FE_PHC1450_FE_OFN1003_preset (.Z(FE_PHN1450_FE_OFN1003_preset), 
	.A(preset));
   HS65_LH_BFX2 FE_PHC1447_FE_OFN1003_preset (.Z(FE_PHN1447_FE_OFN1003_preset), 
	.A(FE_PHN1450_FE_OFN1003_preset));
   HS65_LH_BFX2 FE_PHC1445_FE_OFN1003_preset (.Z(FE_PHN1445_FE_OFN1003_preset), 
	.A(FE_PHN1458_FE_OFN1003_preset));
   HS65_LH_BFX2 FE_PHC1435_FE_OFN1003_preset (.Z(FE_PHN1435_FE_OFN1003_preset), 
	.A(FE_PHN1445_FE_OFN1003_preset));
   HS65_LH_BFX2 FE_PHC1427_FE_OFN1003_preset (.Z(FE_PHN1427_FE_OFN1003_preset), 
	.A(FE_PHN1435_FE_OFN1003_preset));
   HS65_LS_BFX7 FE_OFC1041_n8 (.Z(FE_OFN1041_n8), 
	.A(n8));
   HS65_LS_DFPRQX4 type_out_reg (.RN(n7), 
	.Q(type_out), 
	.D(\bundled_ch_f[DATA][33] ), 
	.CP(clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_T]  (.RN(n5), 
	.Q(\LEDR_link_f[TOKEN_T] ), 
	.D(\bundled_ch_f[DATA][33] ), 
	.CP(clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_PARITY]  (.RN(n5), 
	.Q(\LEDR_link_f[TOKEN_PARITY] ), 
	.D(N2), 
	.CP(clk));
   HS65_LSS_DFPSQX18 data_phase_reg (.SN(FE_OFN1041_n8), 
	.Q(data_phase), 
	.D(n4), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][32]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][32] ), 
	.D(\bundled_ch_f[DATA][32] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][31]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][31] ), 
	.D(\bundled_ch_f[DATA][31] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][30]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][30] ), 
	.D(\bundled_ch_f[DATA][30] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][29]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][29] ), 
	.D(\bundled_ch_f[DATA][29] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][28]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][28] ), 
	.D(\bundled_ch_f[DATA][28] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][27]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][27] ), 
	.D(\bundled_ch_f[DATA][27] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][26]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][26] ), 
	.D(\bundled_ch_f[DATA][26] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][25]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][25] ), 
	.D(\bundled_ch_f[DATA][25] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][24]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][24] ), 
	.D(\bundled_ch_f[DATA][24] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][23]  (.RN(FE_OFN1041_n8), 
	.Q(\LEDR_link_f[PHIT][23] ), 
	.D(\bundled_ch_f[DATA][23] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][22]  (.RN(FE_OFN1041_n8), 
	.Q(\LEDR_link_f[PHIT][22] ), 
	.D(\bundled_ch_f[DATA][22] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][21]  (.RN(FE_OFN1041_n8), 
	.Q(\LEDR_link_f[PHIT][21] ), 
	.D(\bundled_ch_f[DATA][21] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][20]  (.RN(FE_OFN1041_n8), 
	.Q(\LEDR_link_f[PHIT][20] ), 
	.D(\bundled_ch_f[DATA][20] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][19]  (.RN(FE_OFN1041_n8), 
	.Q(\LEDR_link_f[PHIT][19] ), 
	.D(\bundled_ch_f[DATA][19] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][18]  (.RN(FE_OFN1041_n8), 
	.Q(\LEDR_link_f[PHIT][18] ), 
	.D(\bundled_ch_f[DATA][18] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][17]  (.RN(FE_OFN1041_n8), 
	.Q(\LEDR_link_f[PHIT][17] ), 
	.D(\bundled_ch_f[DATA][17] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][16]  (.RN(FE_OFN1041_n8), 
	.Q(\LEDR_link_f[PHIT][16] ), 
	.D(\bundled_ch_f[DATA][16] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][15]  (.RN(FE_OFN1041_n8), 
	.Q(\LEDR_link_f[PHIT][15] ), 
	.D(\bundled_ch_f[DATA][15] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][14]  (.RN(FE_OFN1041_n8), 
	.Q(\LEDR_link_f[PHIT][14] ), 
	.D(\bundled_ch_f[DATA][14] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][13]  (.RN(FE_OFN1041_n8), 
	.Q(\LEDR_link_f[PHIT][13] ), 
	.D(\bundled_ch_f[DATA][13] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][12]  (.RN(FE_OFN1041_n8), 
	.Q(\LEDR_link_f[PHIT][12] ), 
	.D(\bundled_ch_f[DATA][12] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][11]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][11] ), 
	.D(\bundled_ch_f[DATA][11] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][10]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][10] ), 
	.D(\bundled_ch_f[DATA][10] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][9]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][9] ), 
	.D(\bundled_ch_f[DATA][9] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][8]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][8] ), 
	.D(\bundled_ch_f[DATA][8] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][7]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][7] ), 
	.D(\bundled_ch_f[DATA][7] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][6]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][6] ), 
	.D(\bundled_ch_f[DATA][6] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][5]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][5] ), 
	.D(\bundled_ch_f[DATA][5] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][4]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][4] ), 
	.D(\bundled_ch_f[DATA][4] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][3]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][3] ), 
	.D(\bundled_ch_f[DATA][3] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][2]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][2] ), 
	.D(\bundled_ch_f[DATA][2] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][1]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][1] ), 
	.D(\bundled_ch_f[DATA][1] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][0]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT][0] ), 
	.D(\bundled_ch_f[DATA][0] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][32]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][32] ), 
	.D(data_parity[32]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][31]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][31] ), 
	.D(data_parity[31]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][30]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][30] ), 
	.D(data_parity[30]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][29]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][29] ), 
	.D(data_parity[29]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][28]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][28] ), 
	.D(data_parity[28]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][27]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][27] ), 
	.D(data_parity[27]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][26]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][26] ), 
	.D(data_parity[26]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][25]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][25] ), 
	.D(data_parity[25]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][24]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][24] ), 
	.D(data_parity[24]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][23]  (.RN(FE_OFN1041_n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][23] ), 
	.D(data_parity[23]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][22]  (.RN(FE_OFN1041_n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][22] ), 
	.D(data_parity[22]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][21]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][21] ), 
	.D(data_parity[21]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][20]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][20] ), 
	.D(data_parity[20]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][19]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][19] ), 
	.D(data_parity[19]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][18]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][18] ), 
	.D(data_parity[18]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][17]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][17] ), 
	.D(data_parity[17]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][16]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][16] ), 
	.D(data_parity[16]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][15]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][15] ), 
	.D(data_parity[15]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][14]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][14] ), 
	.D(data_parity[14]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][13]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][13] ), 
	.D(data_parity[13]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][12]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][12] ), 
	.D(data_parity[12]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][11]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][11] ), 
	.D(data_parity[11]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][10]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][10] ), 
	.D(data_parity[10]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][9]  (.RN(FE_OFN1041_n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][9] ), 
	.D(data_parity[9]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][8]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT_PARITY][8] ), 
	.D(data_parity[8]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][7]  (.RN(FE_OFN1041_n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][7] ), 
	.D(data_parity[7]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][6]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][6] ), 
	.D(data_parity[6]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][5]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT_PARITY][5] ), 
	.D(data_parity[5]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][4]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][4] ), 
	.D(data_parity[4]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][3]  (.RN(n9), 
	.Q(\LEDR_link_f[PHIT_PARITY][3] ), 
	.D(data_parity[3]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][2]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][2] ), 
	.D(data_parity[2]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][1]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][1] ), 
	.D(data_parity[1]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][0]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT_PARITY][0] ), 
	.D(data_parity[0]), 
	.CP(enabled_clk));
   HS65_LS_LDHQX9 ack_reg (.Q(\bundled_ch_b[ACK] ), 
	.G(N5), 
	.D(N6));
   HS65_LSS_XOR2X6 C214 (.Z(clk), 
	.B(\bundled_ch_b[ACK] ), 
	.A(\LEDR_link_b[ACK] ));
   HS65_LS_AND2X9 C215 (.Z(enabled_clk), 
	.B(type_out), 
	.A(clk));
   HS65_LS_IVX9 U5 (.Z(n1), 
	.A(n4));
   HS65_LSS_XOR2X6 U7 (.Z(N2), 
	.B(\bundled_ch_f[DATA][33] ), 
	.A(\bundled_ch_f[REQ] ));
   HS65_LS_IVX9 U9 (.Z(n4), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U10 (.Z(data_parity[9]), 
	.B(\bundled_ch_f[DATA][9] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U11 (.Z(data_parity[0]), 
	.B(\bundled_ch_f[DATA][0] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U12 (.Z(data_parity[1]), 
	.B(\bundled_ch_f[DATA][1] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U13 (.Z(data_parity[2]), 
	.B(\bundled_ch_f[DATA][2] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U14 (.Z(data_parity[10]), 
	.B(\bundled_ch_f[DATA][10] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U15 (.Z(data_parity[11]), 
	.B(\bundled_ch_f[DATA][11] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U16 (.Z(data_parity[12]), 
	.B(\bundled_ch_f[DATA][12] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U17 (.Z(data_parity[13]), 
	.B(\bundled_ch_f[DATA][13] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U18 (.Z(data_parity[14]), 
	.B(\bundled_ch_f[DATA][14] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U19 (.Z(data_parity[15]), 
	.B(\bundled_ch_f[DATA][15] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U20 (.Z(data_parity[16]), 
	.B(\bundled_ch_f[DATA][16] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U21 (.Z(data_parity[17]), 
	.B(\bundled_ch_f[DATA][17] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U22 (.Z(data_parity[18]), 
	.B(\bundled_ch_f[DATA][18] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U23 (.Z(data_parity[19]), 
	.B(\bundled_ch_f[DATA][19] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U24 (.Z(data_parity[20]), 
	.B(\bundled_ch_f[DATA][20] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U25 (.Z(data_parity[21]), 
	.B(\bundled_ch_f[DATA][21] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U26 (.Z(data_parity[22]), 
	.B(\bundled_ch_f[DATA][22] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U27 (.Z(data_parity[23]), 
	.B(\bundled_ch_f[DATA][23] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U28 (.Z(data_parity[24]), 
	.B(\bundled_ch_f[DATA][24] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U29 (.Z(data_parity[25]), 
	.B(\bundled_ch_f[DATA][25] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U30 (.Z(data_parity[26]), 
	.B(\bundled_ch_f[DATA][26] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U31 (.Z(data_parity[27]), 
	.B(\bundled_ch_f[DATA][27] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U32 (.Z(data_parity[28]), 
	.B(\bundled_ch_f[DATA][28] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U33 (.Z(data_parity[29]), 
	.B(\bundled_ch_f[DATA][29] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U34 (.Z(data_parity[30]), 
	.B(\bundled_ch_f[DATA][30] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U35 (.Z(data_parity[31]), 
	.B(\bundled_ch_f[DATA][31] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U36 (.Z(data_parity[32]), 
	.B(\bundled_ch_f[DATA][32] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U37 (.Z(data_parity[3]), 
	.B(\bundled_ch_f[DATA][3] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U38 (.Z(data_parity[4]), 
	.B(\bundled_ch_f[DATA][4] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U39 (.Z(data_parity[5]), 
	.B(\bundled_ch_f[DATA][5] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U40 (.Z(data_parity[6]), 
	.B(\bundled_ch_f[DATA][6] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U41 (.Z(data_parity[7]), 
	.B(\bundled_ch_f[DATA][7] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U42 (.Z(data_parity[8]), 
	.B(\bundled_ch_f[DATA][8] ), 
	.A(data_phase));
   HS65_LS_IVX9 U44 (.Z(n5), 
	.A(preset));
   HS65_LS_IVX9 U45 (.Z(n7), 
	.A(FE_OFN2_preset));
   HS65_LS_IVX9 U46 (.Z(n9), 
	.A(FE_OFN2_preset));
   HS65_LS_IVX9 U47 (.Z(n8), 
	.A(FE_OFN2_preset));
   HS65_LS_NOR2AX3 U48 (.Z(N6), 
	.B(preset), 
	.A(\bundled_ch_f[REQ] ));
   HS65_LS_NAND2AX7 U49 (.Z(N5), 
	.B(clk), 
	.A(FE_PHN1427_FE_OFN1003_preset));
endmodule

module bundled2LEDR_4 (
	preset, 
	.bundled_ch_f ( { \bundled_ch_f[REQ] , 
		\bundled_ch_f[DATA][33] , 
		\bundled_ch_f[DATA][32] , 
		\bundled_ch_f[DATA][31] , 
		\bundled_ch_f[DATA][30] , 
		\bundled_ch_f[DATA][29] , 
		\bundled_ch_f[DATA][28] , 
		\bundled_ch_f[DATA][27] , 
		\bundled_ch_f[DATA][26] , 
		\bundled_ch_f[DATA][25] , 
		\bundled_ch_f[DATA][24] , 
		\bundled_ch_f[DATA][23] , 
		\bundled_ch_f[DATA][22] , 
		\bundled_ch_f[DATA][21] , 
		\bundled_ch_f[DATA][20] , 
		\bundled_ch_f[DATA][19] , 
		\bundled_ch_f[DATA][18] , 
		\bundled_ch_f[DATA][17] , 
		\bundled_ch_f[DATA][16] , 
		\bundled_ch_f[DATA][15] , 
		\bundled_ch_f[DATA][14] , 
		\bundled_ch_f[DATA][13] , 
		\bundled_ch_f[DATA][12] , 
		\bundled_ch_f[DATA][11] , 
		\bundled_ch_f[DATA][10] , 
		\bundled_ch_f[DATA][9] , 
		\bundled_ch_f[DATA][8] , 
		\bundled_ch_f[DATA][7] , 
		\bundled_ch_f[DATA][6] , 
		\bundled_ch_f[DATA][5] , 
		\bundled_ch_f[DATA][4] , 
		\bundled_ch_f[DATA][3] , 
		\bundled_ch_f[DATA][2] , 
		\bundled_ch_f[DATA][1] , 
		\bundled_ch_f[DATA][0]  } ), 
	.bundled_ch_b ( \bundled_ch_b[ACK]  ), 
	.LEDR_link_f ( { \LEDR_link_f[TOKEN_T] , 
		\LEDR_link_f[TOKEN_PARITY] , 
		\LEDR_link_f[PHIT][32] , 
		\LEDR_link_f[PHIT][31] , 
		\LEDR_link_f[PHIT][30] , 
		\LEDR_link_f[PHIT][29] , 
		\LEDR_link_f[PHIT][28] , 
		\LEDR_link_f[PHIT][27] , 
		\LEDR_link_f[PHIT][26] , 
		\LEDR_link_f[PHIT][25] , 
		\LEDR_link_f[PHIT][24] , 
		\LEDR_link_f[PHIT][23] , 
		\LEDR_link_f[PHIT][22] , 
		\LEDR_link_f[PHIT][21] , 
		\LEDR_link_f[PHIT][20] , 
		\LEDR_link_f[PHIT][19] , 
		\LEDR_link_f[PHIT][18] , 
		\LEDR_link_f[PHIT][17] , 
		\LEDR_link_f[PHIT][16] , 
		\LEDR_link_f[PHIT][15] , 
		\LEDR_link_f[PHIT][14] , 
		\LEDR_link_f[PHIT][13] , 
		\LEDR_link_f[PHIT][12] , 
		\LEDR_link_f[PHIT][11] , 
		\LEDR_link_f[PHIT][10] , 
		\LEDR_link_f[PHIT][9] , 
		\LEDR_link_f[PHIT][8] , 
		\LEDR_link_f[PHIT][7] , 
		\LEDR_link_f[PHIT][6] , 
		\LEDR_link_f[PHIT][5] , 
		\LEDR_link_f[PHIT][4] , 
		\LEDR_link_f[PHIT][3] , 
		\LEDR_link_f[PHIT][2] , 
		\LEDR_link_f[PHIT][1] , 
		\LEDR_link_f[PHIT][0] , 
		\LEDR_link_f[PHIT_PARITY][32] , 
		\LEDR_link_f[PHIT_PARITY][31] , 
		\LEDR_link_f[PHIT_PARITY][30] , 
		\LEDR_link_f[PHIT_PARITY][29] , 
		\LEDR_link_f[PHIT_PARITY][28] , 
		\LEDR_link_f[PHIT_PARITY][27] , 
		\LEDR_link_f[PHIT_PARITY][26] , 
		\LEDR_link_f[PHIT_PARITY][25] , 
		\LEDR_link_f[PHIT_PARITY][24] , 
		\LEDR_link_f[PHIT_PARITY][23] , 
		\LEDR_link_f[PHIT_PARITY][22] , 
		\LEDR_link_f[PHIT_PARITY][21] , 
		\LEDR_link_f[PHIT_PARITY][20] , 
		\LEDR_link_f[PHIT_PARITY][19] , 
		\LEDR_link_f[PHIT_PARITY][18] , 
		\LEDR_link_f[PHIT_PARITY][17] , 
		\LEDR_link_f[PHIT_PARITY][16] , 
		\LEDR_link_f[PHIT_PARITY][15] , 
		\LEDR_link_f[PHIT_PARITY][14] , 
		\LEDR_link_f[PHIT_PARITY][13] , 
		\LEDR_link_f[PHIT_PARITY][12] , 
		\LEDR_link_f[PHIT_PARITY][11] , 
		\LEDR_link_f[PHIT_PARITY][10] , 
		\LEDR_link_f[PHIT_PARITY][9] , 
		\LEDR_link_f[PHIT_PARITY][8] , 
		\LEDR_link_f[PHIT_PARITY][7] , 
		\LEDR_link_f[PHIT_PARITY][6] , 
		\LEDR_link_f[PHIT_PARITY][5] , 
		\LEDR_link_f[PHIT_PARITY][4] , 
		\LEDR_link_f[PHIT_PARITY][3] , 
		\LEDR_link_f[PHIT_PARITY][2] , 
		\LEDR_link_f[PHIT_PARITY][1] , 
		\LEDR_link_f[PHIT_PARITY][0]  } ), 
	.LEDR_link_b ( \LEDR_link_b[ACK]  ), 
	FE_OFN0_preset, 
	FE_OFN2_preset, 
	FE_OFN1038_preset, 
	FE_PHN1408_FE_OCPN1195_preset);
   input preset;
   input \bundled_ch_f[REQ] ;
   input \bundled_ch_f[DATA][33] ;
   input \bundled_ch_f[DATA][32] ;
   input \bundled_ch_f[DATA][31] ;
   input \bundled_ch_f[DATA][30] ;
   input \bundled_ch_f[DATA][29] ;
   input \bundled_ch_f[DATA][28] ;
   input \bundled_ch_f[DATA][27] ;
   input \bundled_ch_f[DATA][26] ;
   input \bundled_ch_f[DATA][25] ;
   input \bundled_ch_f[DATA][24] ;
   input \bundled_ch_f[DATA][23] ;
   input \bundled_ch_f[DATA][22] ;
   input \bundled_ch_f[DATA][21] ;
   input \bundled_ch_f[DATA][20] ;
   input \bundled_ch_f[DATA][19] ;
   input \bundled_ch_f[DATA][18] ;
   input \bundled_ch_f[DATA][17] ;
   input \bundled_ch_f[DATA][16] ;
   input \bundled_ch_f[DATA][15] ;
   input \bundled_ch_f[DATA][14] ;
   input \bundled_ch_f[DATA][13] ;
   input \bundled_ch_f[DATA][12] ;
   input \bundled_ch_f[DATA][11] ;
   input \bundled_ch_f[DATA][10] ;
   input \bundled_ch_f[DATA][9] ;
   input \bundled_ch_f[DATA][8] ;
   input \bundled_ch_f[DATA][7] ;
   input \bundled_ch_f[DATA][6] ;
   input \bundled_ch_f[DATA][5] ;
   input \bundled_ch_f[DATA][4] ;
   input \bundled_ch_f[DATA][3] ;
   input \bundled_ch_f[DATA][2] ;
   input \bundled_ch_f[DATA][1] ;
   input \bundled_ch_f[DATA][0] ;
   output \bundled_ch_b[ACK] ;
   output \LEDR_link_f[TOKEN_T] ;
   output \LEDR_link_f[TOKEN_PARITY] ;
   output \LEDR_link_f[PHIT][32] ;
   output \LEDR_link_f[PHIT][31] ;
   output \LEDR_link_f[PHIT][30] ;
   output \LEDR_link_f[PHIT][29] ;
   output \LEDR_link_f[PHIT][28] ;
   output \LEDR_link_f[PHIT][27] ;
   output \LEDR_link_f[PHIT][26] ;
   output \LEDR_link_f[PHIT][25] ;
   output \LEDR_link_f[PHIT][24] ;
   output \LEDR_link_f[PHIT][23] ;
   output \LEDR_link_f[PHIT][22] ;
   output \LEDR_link_f[PHIT][21] ;
   output \LEDR_link_f[PHIT][20] ;
   output \LEDR_link_f[PHIT][19] ;
   output \LEDR_link_f[PHIT][18] ;
   output \LEDR_link_f[PHIT][17] ;
   output \LEDR_link_f[PHIT][16] ;
   output \LEDR_link_f[PHIT][15] ;
   output \LEDR_link_f[PHIT][14] ;
   output \LEDR_link_f[PHIT][13] ;
   output \LEDR_link_f[PHIT][12] ;
   output \LEDR_link_f[PHIT][11] ;
   output \LEDR_link_f[PHIT][10] ;
   output \LEDR_link_f[PHIT][9] ;
   output \LEDR_link_f[PHIT][8] ;
   output \LEDR_link_f[PHIT][7] ;
   output \LEDR_link_f[PHIT][6] ;
   output \LEDR_link_f[PHIT][5] ;
   output \LEDR_link_f[PHIT][4] ;
   output \LEDR_link_f[PHIT][3] ;
   output \LEDR_link_f[PHIT][2] ;
   output \LEDR_link_f[PHIT][1] ;
   output \LEDR_link_f[PHIT][0] ;
   output \LEDR_link_f[PHIT_PARITY][32] ;
   output \LEDR_link_f[PHIT_PARITY][31] ;
   output \LEDR_link_f[PHIT_PARITY][30] ;
   output \LEDR_link_f[PHIT_PARITY][29] ;
   output \LEDR_link_f[PHIT_PARITY][28] ;
   output \LEDR_link_f[PHIT_PARITY][27] ;
   output \LEDR_link_f[PHIT_PARITY][26] ;
   output \LEDR_link_f[PHIT_PARITY][25] ;
   output \LEDR_link_f[PHIT_PARITY][24] ;
   output \LEDR_link_f[PHIT_PARITY][23] ;
   output \LEDR_link_f[PHIT_PARITY][22] ;
   output \LEDR_link_f[PHIT_PARITY][21] ;
   output \LEDR_link_f[PHIT_PARITY][20] ;
   output \LEDR_link_f[PHIT_PARITY][19] ;
   output \LEDR_link_f[PHIT_PARITY][18] ;
   output \LEDR_link_f[PHIT_PARITY][17] ;
   output \LEDR_link_f[PHIT_PARITY][16] ;
   output \LEDR_link_f[PHIT_PARITY][15] ;
   output \LEDR_link_f[PHIT_PARITY][14] ;
   output \LEDR_link_f[PHIT_PARITY][13] ;
   output \LEDR_link_f[PHIT_PARITY][12] ;
   output \LEDR_link_f[PHIT_PARITY][11] ;
   output \LEDR_link_f[PHIT_PARITY][10] ;
   output \LEDR_link_f[PHIT_PARITY][9] ;
   output \LEDR_link_f[PHIT_PARITY][8] ;
   output \LEDR_link_f[PHIT_PARITY][7] ;
   output \LEDR_link_f[PHIT_PARITY][6] ;
   output \LEDR_link_f[PHIT_PARITY][5] ;
   output \LEDR_link_f[PHIT_PARITY][4] ;
   output \LEDR_link_f[PHIT_PARITY][3] ;
   output \LEDR_link_f[PHIT_PARITY][2] ;
   output \LEDR_link_f[PHIT_PARITY][1] ;
   output \LEDR_link_f[PHIT_PARITY][0] ;
   input \LEDR_link_b[ACK] ;
   input FE_OFN0_preset;
   input FE_OFN2_preset;
   input FE_OFN1038_preset;
   input FE_PHN1408_FE_OCPN1195_preset;

   // Internal wires
   wire FE_OFN1040_n6;
   wire clk;
   wire type_out;
   wire enabled_clk;
   wire N2;
   wire data_phase;
   wire N5;
   wire N6;
   wire n1;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire [32:0] data_parity;

   HS65_LS_BFX7 FE_OFC1040_n6 (.Z(FE_OFN1040_n6), 
	.A(n6));
   HS65_LS_DFPRQX4 type_out_reg (.RN(n7), 
	.Q(type_out), 
	.D(\bundled_ch_f[DATA][33] ), 
	.CP(clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_T]  (.RN(n5), 
	.Q(\LEDR_link_f[TOKEN_T] ), 
	.D(\bundled_ch_f[DATA][33] ), 
	.CP(clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[TOKEN_PARITY]  (.RN(n5), 
	.Q(\LEDR_link_f[TOKEN_PARITY] ), 
	.D(N2), 
	.CP(clk));
   HS65_LSS_DFPSQX18 data_phase_reg (.SN(n8), 
	.Q(data_phase), 
	.D(n4), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][32]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][32] ), 
	.D(\bundled_ch_f[DATA][32] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][31]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][31] ), 
	.D(\bundled_ch_f[DATA][31] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][30]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][30] ), 
	.D(\bundled_ch_f[DATA][30] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][29]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][29] ), 
	.D(\bundled_ch_f[DATA][29] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][28]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][28] ), 
	.D(\bundled_ch_f[DATA][28] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][27]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][27] ), 
	.D(\bundled_ch_f[DATA][27] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][26]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][26] ), 
	.D(\bundled_ch_f[DATA][26] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][25]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][25] ), 
	.D(\bundled_ch_f[DATA][25] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][24]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT][24] ), 
	.D(\bundled_ch_f[DATA][24] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][23]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][23] ), 
	.D(\bundled_ch_f[DATA][23] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][22]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][22] ), 
	.D(\bundled_ch_f[DATA][22] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][21]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][21] ), 
	.D(\bundled_ch_f[DATA][21] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][20]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT][20] ), 
	.D(\bundled_ch_f[DATA][20] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][19]  (.RN(FE_OFN1040_n6), 
	.Q(\LEDR_link_f[PHIT][19] ), 
	.D(\bundled_ch_f[DATA][19] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][18]  (.RN(FE_OFN1040_n6), 
	.Q(\LEDR_link_f[PHIT][18] ), 
	.D(\bundled_ch_f[DATA][18] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][17]  (.RN(FE_OFN1040_n6), 
	.Q(\LEDR_link_f[PHIT][17] ), 
	.D(\bundled_ch_f[DATA][17] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][16]  (.RN(FE_OFN1040_n6), 
	.Q(\LEDR_link_f[PHIT][16] ), 
	.D(\bundled_ch_f[DATA][16] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][15]  (.RN(FE_OFN1040_n6), 
	.Q(\LEDR_link_f[PHIT][15] ), 
	.D(\bundled_ch_f[DATA][15] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][14]  (.RN(FE_OFN1040_n6), 
	.Q(\LEDR_link_f[PHIT][14] ), 
	.D(\bundled_ch_f[DATA][14] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][13]  (.RN(FE_OFN1040_n6), 
	.Q(\LEDR_link_f[PHIT][13] ), 
	.D(\bundled_ch_f[DATA][13] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][12]  (.RN(FE_OFN1040_n6), 
	.Q(\LEDR_link_f[PHIT][12] ), 
	.D(\bundled_ch_f[DATA][12] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][11]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][11] ), 
	.D(\bundled_ch_f[DATA][11] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][10]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][10] ), 
	.D(\bundled_ch_f[DATA][10] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][9]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][9] ), 
	.D(\bundled_ch_f[DATA][9] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][8]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][8] ), 
	.D(\bundled_ch_f[DATA][8] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][7]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][7] ), 
	.D(\bundled_ch_f[DATA][7] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][6]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][6] ), 
	.D(\bundled_ch_f[DATA][6] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][5]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][5] ), 
	.D(\bundled_ch_f[DATA][5] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][4]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][4] ), 
	.D(\bundled_ch_f[DATA][4] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][3]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][3] ), 
	.D(\bundled_ch_f[DATA][3] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][2]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][2] ), 
	.D(\bundled_ch_f[DATA][2] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][1]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT][1] ), 
	.D(\bundled_ch_f[DATA][1] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT][0]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT][0] ), 
	.D(\bundled_ch_f[DATA][0] ), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][32]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][32] ), 
	.D(data_parity[32]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][31]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][31] ), 
	.D(data_parity[31]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][30]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][30] ), 
	.D(data_parity[30]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][29]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][29] ), 
	.D(data_parity[29]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][28]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][28] ), 
	.D(data_parity[28]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][27]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][27] ), 
	.D(data_parity[27]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][26]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][26] ), 
	.D(data_parity[26]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][25]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][25] ), 
	.D(data_parity[25]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][24]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][24] ), 
	.D(data_parity[24]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][23]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][23] ), 
	.D(data_parity[23]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][22]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][22] ), 
	.D(data_parity[22]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][21]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][21] ), 
	.D(data_parity[21]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][20]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][20] ), 
	.D(data_parity[20]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][19]  (.RN(FE_OFN1040_n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][19] ), 
	.D(data_parity[19]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][18]  (.RN(FE_OFN1040_n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][18] ), 
	.D(data_parity[18]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][17]  (.RN(FE_OFN1040_n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][17] ), 
	.D(data_parity[17]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][16]  (.RN(FE_OFN1040_n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][16] ), 
	.D(data_parity[16]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][15]  (.RN(FE_OFN1040_n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][15] ), 
	.D(data_parity[15]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][14]  (.RN(FE_OFN1040_n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][14] ), 
	.D(data_parity[14]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][13]  (.RN(FE_OFN1040_n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][13] ), 
	.D(data_parity[13]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][12]  (.RN(FE_OFN1040_n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][12] ), 
	.D(data_parity[12]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][11]  (.RN(FE_OFN1040_n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][11] ), 
	.D(data_parity[11]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][10]  (.RN(FE_OFN1040_n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][10] ), 
	.D(data_parity[10]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][9]  (.RN(FE_OFN1040_n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][9] ), 
	.D(data_parity[9]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][8]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT_PARITY][8] ), 
	.D(data_parity[8]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][7]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][7] ), 
	.D(data_parity[7]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][6]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][6] ), 
	.D(data_parity[6]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][5]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT_PARITY][5] ), 
	.D(data_parity[5]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][4]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][4] ), 
	.D(data_parity[4]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][3]  (.RN(n6), 
	.Q(\LEDR_link_f[PHIT_PARITY][3] ), 
	.D(data_parity[3]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][2]  (.RN(n8), 
	.Q(\LEDR_link_f[PHIT_PARITY][2] ), 
	.D(data_parity[2]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][1]  (.RN(n7), 
	.Q(\LEDR_link_f[PHIT_PARITY][1] ), 
	.D(data_parity[1]), 
	.CP(enabled_clk));
   HS65_LS_DFPRQX4 \LEDR_link_f_reg[PHIT_PARITY][0]  (.RN(n5), 
	.Q(\LEDR_link_f[PHIT_PARITY][0] ), 
	.D(data_parity[0]), 
	.CP(enabled_clk));
   HS65_LS_LDHQX9 ack_reg (.Q(\bundled_ch_b[ACK] ), 
	.G(N5), 
	.D(N6));
   HS65_LSS_XOR2X6 C214 (.Z(clk), 
	.B(\bundled_ch_b[ACK] ), 
	.A(\LEDR_link_b[ACK] ));
   HS65_LS_AND2X9 C215 (.Z(enabled_clk), 
	.B(type_out), 
	.A(clk));
   HS65_LS_IVX9 U5 (.Z(n1), 
	.A(n4));
   HS65_LSS_XOR2X6 U7 (.Z(N2), 
	.B(\bundled_ch_f[DATA][33] ), 
	.A(\bundled_ch_f[REQ] ));
   HS65_LS_IVX9 U9 (.Z(n4), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U10 (.Z(data_parity[9]), 
	.B(\bundled_ch_f[DATA][9] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U11 (.Z(data_parity[0]), 
	.B(\bundled_ch_f[DATA][0] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U12 (.Z(data_parity[1]), 
	.B(\bundled_ch_f[DATA][1] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U13 (.Z(data_parity[2]), 
	.B(\bundled_ch_f[DATA][2] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U14 (.Z(data_parity[10]), 
	.B(\bundled_ch_f[DATA][10] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U15 (.Z(data_parity[11]), 
	.B(\bundled_ch_f[DATA][11] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U16 (.Z(data_parity[12]), 
	.B(\bundled_ch_f[DATA][12] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U17 (.Z(data_parity[13]), 
	.B(\bundled_ch_f[DATA][13] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U18 (.Z(data_parity[14]), 
	.B(\bundled_ch_f[DATA][14] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U19 (.Z(data_parity[15]), 
	.B(\bundled_ch_f[DATA][15] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U20 (.Z(data_parity[16]), 
	.B(\bundled_ch_f[DATA][16] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U21 (.Z(data_parity[17]), 
	.B(\bundled_ch_f[DATA][17] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U22 (.Z(data_parity[18]), 
	.B(\bundled_ch_f[DATA][18] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U23 (.Z(data_parity[19]), 
	.B(\bundled_ch_f[DATA][19] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U24 (.Z(data_parity[20]), 
	.B(\bundled_ch_f[DATA][20] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U25 (.Z(data_parity[21]), 
	.B(\bundled_ch_f[DATA][21] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U26 (.Z(data_parity[22]), 
	.B(\bundled_ch_f[DATA][22] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U27 (.Z(data_parity[23]), 
	.B(\bundled_ch_f[DATA][23] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U28 (.Z(data_parity[24]), 
	.B(\bundled_ch_f[DATA][24] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U29 (.Z(data_parity[25]), 
	.B(\bundled_ch_f[DATA][25] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U30 (.Z(data_parity[26]), 
	.B(\bundled_ch_f[DATA][26] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U31 (.Z(data_parity[27]), 
	.B(\bundled_ch_f[DATA][27] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U32 (.Z(data_parity[28]), 
	.B(\bundled_ch_f[DATA][28] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U33 (.Z(data_parity[29]), 
	.B(\bundled_ch_f[DATA][29] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U34 (.Z(data_parity[30]), 
	.B(\bundled_ch_f[DATA][30] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U35 (.Z(data_parity[31]), 
	.B(\bundled_ch_f[DATA][31] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U36 (.Z(data_parity[32]), 
	.B(\bundled_ch_f[DATA][32] ), 
	.A(n1));
   HS65_LSS_XOR2X6 U37 (.Z(data_parity[3]), 
	.B(\bundled_ch_f[DATA][3] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U38 (.Z(data_parity[4]), 
	.B(\bundled_ch_f[DATA][4] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U39 (.Z(data_parity[5]), 
	.B(\bundled_ch_f[DATA][5] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U40 (.Z(data_parity[6]), 
	.B(\bundled_ch_f[DATA][6] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U41 (.Z(data_parity[7]), 
	.B(\bundled_ch_f[DATA][7] ), 
	.A(data_phase));
   HS65_LSS_XOR2X6 U42 (.Z(data_parity[8]), 
	.B(\bundled_ch_f[DATA][8] ), 
	.A(data_phase));
   HS65_LS_IVX9 U43 (.Z(n6), 
	.A(FE_OFN2_preset));
   HS65_LS_IVX9 U44 (.Z(n5), 
	.A(FE_OFN0_preset));
   HS65_LS_IVX9 U45 (.Z(n7), 
	.A(FE_OFN2_preset));
   HS65_LS_IVX9 U47 (.Z(n8), 
	.A(FE_OFN1038_preset));
   HS65_LS_NOR2AX3 U48 (.Z(N6), 
	.B(preset), 
	.A(\bundled_ch_f[REQ] ));
   HS65_LS_NAND2AX7 U49 (.Z(N5), 
	.B(clk), 
	.A(FE_PHN1408_FE_OCPN1195_preset));
endmodule

module crossbar_stage_x0_y0 (
	preset, 
	.switch_sel ( { \switch_sel[4][4] , 
		\switch_sel[4][3] , 
		\switch_sel[4][2] , 
		\switch_sel[4][1] , 
		\switch_sel[4][0] , 
		\switch_sel[3][4] , 
		\switch_sel[3][3] , 
		\switch_sel[3][2] , 
		\switch_sel[3][1] , 
		\switch_sel[3][0] , 
		\switch_sel[2][4] , 
		\switch_sel[2][3] , 
		\switch_sel[2][2] , 
		\switch_sel[2][1] , 
		\switch_sel[2][0] , 
		\switch_sel[1][4] , 
		\switch_sel[1][3] , 
		\switch_sel[1][2] , 
		\switch_sel[1][1] , 
		\switch_sel[1][0] , 
		\switch_sel[0][4] , 
		\switch_sel[0][3] , 
		\switch_sel[0][2] , 
		\switch_sel[0][1] , 
		\switch_sel[0][0]  } ), 
	.chs_in_f ( { \chs_in_f[4][REQ] , 
		\chs_in_f[4][DATA][33] , 
		\chs_in_f[4][DATA][32] , 
		\chs_in_f[4][DATA][31] , 
		\chs_in_f[4][DATA][30] , 
		\chs_in_f[4][DATA][29] , 
		\chs_in_f[4][DATA][28] , 
		\chs_in_f[4][DATA][27] , 
		\chs_in_f[4][DATA][26] , 
		\chs_in_f[4][DATA][25] , 
		\chs_in_f[4][DATA][24] , 
		\chs_in_f[4][DATA][23] , 
		\chs_in_f[4][DATA][22] , 
		\chs_in_f[4][DATA][21] , 
		\chs_in_f[4][DATA][20] , 
		\chs_in_f[4][DATA][19] , 
		\chs_in_f[4][DATA][18] , 
		\chs_in_f[4][DATA][17] , 
		\chs_in_f[4][DATA][16] , 
		\chs_in_f[4][DATA][15] , 
		\chs_in_f[4][DATA][14] , 
		\chs_in_f[4][DATA][13] , 
		\chs_in_f[4][DATA][12] , 
		\chs_in_f[4][DATA][11] , 
		\chs_in_f[4][DATA][10] , 
		\chs_in_f[4][DATA][9] , 
		\chs_in_f[4][DATA][8] , 
		\chs_in_f[4][DATA][7] , 
		\chs_in_f[4][DATA][6] , 
		\chs_in_f[4][DATA][5] , 
		\chs_in_f[4][DATA][4] , 
		\chs_in_f[4][DATA][3] , 
		\chs_in_f[4][DATA][2] , 
		\chs_in_f[4][DATA][1] , 
		\chs_in_f[4][DATA][0] , 
		\chs_in_f[3][REQ] , 
		\chs_in_f[3][DATA][33] , 
		\chs_in_f[3][DATA][32] , 
		\chs_in_f[3][DATA][31] , 
		\chs_in_f[3][DATA][30] , 
		\chs_in_f[3][DATA][29] , 
		\chs_in_f[3][DATA][28] , 
		\chs_in_f[3][DATA][27] , 
		\chs_in_f[3][DATA][26] , 
		\chs_in_f[3][DATA][25] , 
		\chs_in_f[3][DATA][24] , 
		\chs_in_f[3][DATA][23] , 
		\chs_in_f[3][DATA][22] , 
		\chs_in_f[3][DATA][21] , 
		\chs_in_f[3][DATA][20] , 
		\chs_in_f[3][DATA][19] , 
		\chs_in_f[3][DATA][18] , 
		\chs_in_f[3][DATA][17] , 
		\chs_in_f[3][DATA][16] , 
		\chs_in_f[3][DATA][15] , 
		\chs_in_f[3][DATA][14] , 
		\chs_in_f[3][DATA][13] , 
		\chs_in_f[3][DATA][12] , 
		\chs_in_f[3][DATA][11] , 
		\chs_in_f[3][DATA][10] , 
		\chs_in_f[3][DATA][9] , 
		\chs_in_f[3][DATA][8] , 
		\chs_in_f[3][DATA][7] , 
		\chs_in_f[3][DATA][6] , 
		\chs_in_f[3][DATA][5] , 
		\chs_in_f[3][DATA][4] , 
		\chs_in_f[3][DATA][3] , 
		\chs_in_f[3][DATA][2] , 
		\chs_in_f[3][DATA][1] , 
		\chs_in_f[3][DATA][0] , 
		\chs_in_f[2][REQ] , 
		\chs_in_f[2][DATA][33] , 
		\chs_in_f[2][DATA][32] , 
		\chs_in_f[2][DATA][31] , 
		\chs_in_f[2][DATA][30] , 
		\chs_in_f[2][DATA][29] , 
		\chs_in_f[2][DATA][28] , 
		\chs_in_f[2][DATA][27] , 
		\chs_in_f[2][DATA][26] , 
		\chs_in_f[2][DATA][25] , 
		\chs_in_f[2][DATA][24] , 
		\chs_in_f[2][DATA][23] , 
		\chs_in_f[2][DATA][22] , 
		\chs_in_f[2][DATA][21] , 
		\chs_in_f[2][DATA][20] , 
		\chs_in_f[2][DATA][19] , 
		\chs_in_f[2][DATA][18] , 
		\chs_in_f[2][DATA][17] , 
		\chs_in_f[2][DATA][16] , 
		\chs_in_f[2][DATA][15] , 
		\chs_in_f[2][DATA][14] , 
		\chs_in_f[2][DATA][13] , 
		\chs_in_f[2][DATA][12] , 
		\chs_in_f[2][DATA][11] , 
		\chs_in_f[2][DATA][10] , 
		\chs_in_f[2][DATA][9] , 
		\chs_in_f[2][DATA][8] , 
		\chs_in_f[2][DATA][7] , 
		\chs_in_f[2][DATA][6] , 
		\chs_in_f[2][DATA][5] , 
		\chs_in_f[2][DATA][4] , 
		\chs_in_f[2][DATA][3] , 
		\chs_in_f[2][DATA][2] , 
		\chs_in_f[2][DATA][1] , 
		\chs_in_f[2][DATA][0] , 
		\chs_in_f[1][REQ] , 
		\chs_in_f[1][DATA][33] , 
		\chs_in_f[1][DATA][32] , 
		\chs_in_f[1][DATA][31] , 
		\chs_in_f[1][DATA][30] , 
		\chs_in_f[1][DATA][29] , 
		\chs_in_f[1][DATA][28] , 
		\chs_in_f[1][DATA][27] , 
		\chs_in_f[1][DATA][26] , 
		\chs_in_f[1][DATA][25] , 
		\chs_in_f[1][DATA][24] , 
		\chs_in_f[1][DATA][23] , 
		\chs_in_f[1][DATA][22] , 
		\chs_in_f[1][DATA][21] , 
		\chs_in_f[1][DATA][20] , 
		\chs_in_f[1][DATA][19] , 
		\chs_in_f[1][DATA][18] , 
		\chs_in_f[1][DATA][17] , 
		\chs_in_f[1][DATA][16] , 
		\chs_in_f[1][DATA][15] , 
		\chs_in_f[1][DATA][14] , 
		\chs_in_f[1][DATA][13] , 
		\chs_in_f[1][DATA][12] , 
		\chs_in_f[1][DATA][11] , 
		\chs_in_f[1][DATA][10] , 
		\chs_in_f[1][DATA][9] , 
		\chs_in_f[1][DATA][8] , 
		\chs_in_f[1][DATA][7] , 
		\chs_in_f[1][DATA][6] , 
		\chs_in_f[1][DATA][5] , 
		\chs_in_f[1][DATA][4] , 
		\chs_in_f[1][DATA][3] , 
		\chs_in_f[1][DATA][2] , 
		\chs_in_f[1][DATA][1] , 
		\chs_in_f[1][DATA][0] , 
		\chs_in_f[0][REQ] , 
		\chs_in_f[0][DATA][33] , 
		\chs_in_f[0][DATA][32] , 
		\chs_in_f[0][DATA][31] , 
		\chs_in_f[0][DATA][30] , 
		\chs_in_f[0][DATA][29] , 
		\chs_in_f[0][DATA][28] , 
		\chs_in_f[0][DATA][27] , 
		\chs_in_f[0][DATA][26] , 
		\chs_in_f[0][DATA][25] , 
		\chs_in_f[0][DATA][24] , 
		\chs_in_f[0][DATA][23] , 
		\chs_in_f[0][DATA][22] , 
		\chs_in_f[0][DATA][21] , 
		\chs_in_f[0][DATA][20] , 
		\chs_in_f[0][DATA][19] , 
		\chs_in_f[0][DATA][18] , 
		\chs_in_f[0][DATA][17] , 
		\chs_in_f[0][DATA][16] , 
		\chs_in_f[0][DATA][15] , 
		\chs_in_f[0][DATA][14] , 
		\chs_in_f[0][DATA][13] , 
		\chs_in_f[0][DATA][12] , 
		\chs_in_f[0][DATA][11] , 
		\chs_in_f[0][DATA][10] , 
		\chs_in_f[0][DATA][9] , 
		\chs_in_f[0][DATA][8] , 
		\chs_in_f[0][DATA][7] , 
		\chs_in_f[0][DATA][6] , 
		\chs_in_f[0][DATA][5] , 
		\chs_in_f[0][DATA][4] , 
		\chs_in_f[0][DATA][3] , 
		\chs_in_f[0][DATA][2] , 
		\chs_in_f[0][DATA][1] , 
		\chs_in_f[0][DATA][0]  } ), 
	.chs_in_b ( { \chs_in_b[4][ACK] , 
		\chs_in_b[3][ACK] , 
		\chs_in_b[2][ACK] , 
		\chs_in_b[1][ACK] , 
		\chs_in_b[0][ACK]  } ), 
	.latches_out_f ( { \latches_out_f[4][TOKEN_T] , 
		\latches_out_f[4][TOKEN_PARITY] , 
		\latches_out_f[4][PHIT][32] , 
		\latches_out_f[4][PHIT][31] , 
		\latches_out_f[4][PHIT][30] , 
		\latches_out_f[4][PHIT][29] , 
		\latches_out_f[4][PHIT][28] , 
		\latches_out_f[4][PHIT][27] , 
		\latches_out_f[4][PHIT][26] , 
		\latches_out_f[4][PHIT][25] , 
		\latches_out_f[4][PHIT][24] , 
		\latches_out_f[4][PHIT][23] , 
		\latches_out_f[4][PHIT][22] , 
		\latches_out_f[4][PHIT][21] , 
		\latches_out_f[4][PHIT][20] , 
		\latches_out_f[4][PHIT][19] , 
		\latches_out_f[4][PHIT][18] , 
		\latches_out_f[4][PHIT][17] , 
		\latches_out_f[4][PHIT][16] , 
		\latches_out_f[4][PHIT][15] , 
		\latches_out_f[4][PHIT][14] , 
		\latches_out_f[4][PHIT][13] , 
		\latches_out_f[4][PHIT][12] , 
		\latches_out_f[4][PHIT][11] , 
		\latches_out_f[4][PHIT][10] , 
		\latches_out_f[4][PHIT][9] , 
		\latches_out_f[4][PHIT][8] , 
		\latches_out_f[4][PHIT][7] , 
		\latches_out_f[4][PHIT][6] , 
		\latches_out_f[4][PHIT][5] , 
		\latches_out_f[4][PHIT][4] , 
		\latches_out_f[4][PHIT][3] , 
		\latches_out_f[4][PHIT][2] , 
		\latches_out_f[4][PHIT][1] , 
		\latches_out_f[4][PHIT][0] , 
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
		\latches_out_f[4][PHIT_PARITY][0] , 
		\latches_out_f[3][TOKEN_T] , 
		\latches_out_f[3][TOKEN_PARITY] , 
		\latches_out_f[3][PHIT][32] , 
		\latches_out_f[3][PHIT][31] , 
		\latches_out_f[3][PHIT][30] , 
		\latches_out_f[3][PHIT][29] , 
		\latches_out_f[3][PHIT][28] , 
		\latches_out_f[3][PHIT][27] , 
		\latches_out_f[3][PHIT][26] , 
		\latches_out_f[3][PHIT][25] , 
		\latches_out_f[3][PHIT][24] , 
		\latches_out_f[3][PHIT][23] , 
		\latches_out_f[3][PHIT][22] , 
		\latches_out_f[3][PHIT][21] , 
		\latches_out_f[3][PHIT][20] , 
		\latches_out_f[3][PHIT][19] , 
		\latches_out_f[3][PHIT][18] , 
		\latches_out_f[3][PHIT][17] , 
		\latches_out_f[3][PHIT][16] , 
		\latches_out_f[3][PHIT][15] , 
		\latches_out_f[3][PHIT][14] , 
		\latches_out_f[3][PHIT][13] , 
		\latches_out_f[3][PHIT][12] , 
		\latches_out_f[3][PHIT][11] , 
		\latches_out_f[3][PHIT][10] , 
		\latches_out_f[3][PHIT][9] , 
		\latches_out_f[3][PHIT][8] , 
		\latches_out_f[3][PHIT][7] , 
		\latches_out_f[3][PHIT][6] , 
		\latches_out_f[3][PHIT][5] , 
		\latches_out_f[3][PHIT][4] , 
		\latches_out_f[3][PHIT][3] , 
		\latches_out_f[3][PHIT][2] , 
		\latches_out_f[3][PHIT][1] , 
		\latches_out_f[3][PHIT][0] , 
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
		\latches_out_f[3][PHIT_PARITY][0] , 
		\latches_out_f[2][TOKEN_T] , 
		\latches_out_f[2][TOKEN_PARITY] , 
		\latches_out_f[2][PHIT][32] , 
		\latches_out_f[2][PHIT][31] , 
		\latches_out_f[2][PHIT][30] , 
		\latches_out_f[2][PHIT][29] , 
		\latches_out_f[2][PHIT][28] , 
		\latches_out_f[2][PHIT][27] , 
		\latches_out_f[2][PHIT][26] , 
		\latches_out_f[2][PHIT][25] , 
		\latches_out_f[2][PHIT][24] , 
		\latches_out_f[2][PHIT][23] , 
		\latches_out_f[2][PHIT][22] , 
		\latches_out_f[2][PHIT][21] , 
		\latches_out_f[2][PHIT][20] , 
		\latches_out_f[2][PHIT][19] , 
		\latches_out_f[2][PHIT][18] , 
		\latches_out_f[2][PHIT][17] , 
		\latches_out_f[2][PHIT][16] , 
		\latches_out_f[2][PHIT][15] , 
		\latches_out_f[2][PHIT][14] , 
		\latches_out_f[2][PHIT][13] , 
		\latches_out_f[2][PHIT][12] , 
		\latches_out_f[2][PHIT][11] , 
		\latches_out_f[2][PHIT][10] , 
		\latches_out_f[2][PHIT][9] , 
		\latches_out_f[2][PHIT][8] , 
		\latches_out_f[2][PHIT][7] , 
		\latches_out_f[2][PHIT][6] , 
		\latches_out_f[2][PHIT][5] , 
		\latches_out_f[2][PHIT][4] , 
		\latches_out_f[2][PHIT][3] , 
		\latches_out_f[2][PHIT][2] , 
		\latches_out_f[2][PHIT][1] , 
		\latches_out_f[2][PHIT][0] , 
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
		\latches_out_f[2][PHIT_PARITY][0] , 
		\latches_out_f[1][TOKEN_T] , 
		\latches_out_f[1][TOKEN_PARITY] , 
		\latches_out_f[1][PHIT][32] , 
		\latches_out_f[1][PHIT][31] , 
		\latches_out_f[1][PHIT][30] , 
		\latches_out_f[1][PHIT][29] , 
		\latches_out_f[1][PHIT][28] , 
		\latches_out_f[1][PHIT][27] , 
		\latches_out_f[1][PHIT][26] , 
		\latches_out_f[1][PHIT][25] , 
		\latches_out_f[1][PHIT][24] , 
		\latches_out_f[1][PHIT][23] , 
		\latches_out_f[1][PHIT][22] , 
		\latches_out_f[1][PHIT][21] , 
		\latches_out_f[1][PHIT][20] , 
		\latches_out_f[1][PHIT][19] , 
		\latches_out_f[1][PHIT][18] , 
		\latches_out_f[1][PHIT][17] , 
		\latches_out_f[1][PHIT][16] , 
		\latches_out_f[1][PHIT][15] , 
		\latches_out_f[1][PHIT][14] , 
		\latches_out_f[1][PHIT][13] , 
		\latches_out_f[1][PHIT][12] , 
		\latches_out_f[1][PHIT][11] , 
		\latches_out_f[1][PHIT][10] , 
		\latches_out_f[1][PHIT][9] , 
		\latches_out_f[1][PHIT][8] , 
		\latches_out_f[1][PHIT][7] , 
		\latches_out_f[1][PHIT][6] , 
		\latches_out_f[1][PHIT][5] , 
		\latches_out_f[1][PHIT][4] , 
		\latches_out_f[1][PHIT][3] , 
		\latches_out_f[1][PHIT][2] , 
		\latches_out_f[1][PHIT][1] , 
		\latches_out_f[1][PHIT][0] , 
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
		\latches_out_f[1][PHIT_PARITY][0] , 
		\latches_out_f[0][TOKEN_T] , 
		\latches_out_f[0][TOKEN_PARITY] , 
		\latches_out_f[0][PHIT][32] , 
		\latches_out_f[0][PHIT][31] , 
		\latches_out_f[0][PHIT][30] , 
		\latches_out_f[0][PHIT][29] , 
		\latches_out_f[0][PHIT][28] , 
		\latches_out_f[0][PHIT][27] , 
		\latches_out_f[0][PHIT][26] , 
		\latches_out_f[0][PHIT][25] , 
		\latches_out_f[0][PHIT][24] , 
		\latches_out_f[0][PHIT][23] , 
		\latches_out_f[0][PHIT][22] , 
		\latches_out_f[0][PHIT][21] , 
		\latches_out_f[0][PHIT][20] , 
		\latches_out_f[0][PHIT][19] , 
		\latches_out_f[0][PHIT][18] , 
		\latches_out_f[0][PHIT][17] , 
		\latches_out_f[0][PHIT][16] , 
		\latches_out_f[0][PHIT][15] , 
		\latches_out_f[0][PHIT][14] , 
		\latches_out_f[0][PHIT][13] , 
		\latches_out_f[0][PHIT][12] , 
		\latches_out_f[0][PHIT][11] , 
		\latches_out_f[0][PHIT][10] , 
		\latches_out_f[0][PHIT][9] , 
		\latches_out_f[0][PHIT][8] , 
		\latches_out_f[0][PHIT][7] , 
		\latches_out_f[0][PHIT][6] , 
		\latches_out_f[0][PHIT][5] , 
		\latches_out_f[0][PHIT][4] , 
		\latches_out_f[0][PHIT][3] , 
		\latches_out_f[0][PHIT][2] , 
		\latches_out_f[0][PHIT][1] , 
		\latches_out_f[0][PHIT][0] , 
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
		\latches_out_f[0][PHIT_PARITY][0]  } ), 
	.latches_out_b ( { \latches_out_b[4][ACK] , 
		\latches_out_b[3][ACK] , 
		\latches_out_b[2][ACK] , 
		\latches_out_b[1][ACK] , 
		\latches_out_b[0][ACK]  } ), 
	FE_OFN0_preset, 
	FE_OFN2_preset, 
	FE_OFN1003_preset, 
	FE_OFN1038_preset, 
	FE_PHN1407_FE_OFN1003_preset, 
	FE_PHN1408_FE_OCPN1195_preset, 
	FE_PHN1436_FE_OCPN1195_preset, 
	FE_PHN1448_FE_OFN1003_preset);
   input preset;
   input \switch_sel[4][4] ;
   input \switch_sel[4][3] ;
   input \switch_sel[4][2] ;
   input \switch_sel[4][1] ;
   input \switch_sel[4][0] ;
   input \switch_sel[3][4] ;
   input \switch_sel[3][3] ;
   input \switch_sel[3][2] ;
   input \switch_sel[3][1] ;
   input \switch_sel[3][0] ;
   input \switch_sel[2][4] ;
   input \switch_sel[2][3] ;
   input \switch_sel[2][2] ;
   input \switch_sel[2][1] ;
   input \switch_sel[2][0] ;
   input \switch_sel[1][4] ;
   input \switch_sel[1][3] ;
   input \switch_sel[1][2] ;
   input \switch_sel[1][1] ;
   input \switch_sel[1][0] ;
   input \switch_sel[0][4] ;
   input \switch_sel[0][3] ;
   input \switch_sel[0][2] ;
   input \switch_sel[0][1] ;
   input \switch_sel[0][0] ;
   input \chs_in_f[4][REQ] ;
   input \chs_in_f[4][DATA][33] ;
   input \chs_in_f[4][DATA][32] ;
   input \chs_in_f[4][DATA][31] ;
   input \chs_in_f[4][DATA][30] ;
   input \chs_in_f[4][DATA][29] ;
   input \chs_in_f[4][DATA][28] ;
   input \chs_in_f[4][DATA][27] ;
   input \chs_in_f[4][DATA][26] ;
   input \chs_in_f[4][DATA][25] ;
   input \chs_in_f[4][DATA][24] ;
   input \chs_in_f[4][DATA][23] ;
   input \chs_in_f[4][DATA][22] ;
   input \chs_in_f[4][DATA][21] ;
   input \chs_in_f[4][DATA][20] ;
   input \chs_in_f[4][DATA][19] ;
   input \chs_in_f[4][DATA][18] ;
   input \chs_in_f[4][DATA][17] ;
   input \chs_in_f[4][DATA][16] ;
   input \chs_in_f[4][DATA][15] ;
   input \chs_in_f[4][DATA][14] ;
   input \chs_in_f[4][DATA][13] ;
   input \chs_in_f[4][DATA][12] ;
   input \chs_in_f[4][DATA][11] ;
   input \chs_in_f[4][DATA][10] ;
   input \chs_in_f[4][DATA][9] ;
   input \chs_in_f[4][DATA][8] ;
   input \chs_in_f[4][DATA][7] ;
   input \chs_in_f[4][DATA][6] ;
   input \chs_in_f[4][DATA][5] ;
   input \chs_in_f[4][DATA][4] ;
   input \chs_in_f[4][DATA][3] ;
   input \chs_in_f[4][DATA][2] ;
   input \chs_in_f[4][DATA][1] ;
   input \chs_in_f[4][DATA][0] ;
   input \chs_in_f[3][REQ] ;
   input \chs_in_f[3][DATA][33] ;
   input \chs_in_f[3][DATA][32] ;
   input \chs_in_f[3][DATA][31] ;
   input \chs_in_f[3][DATA][30] ;
   input \chs_in_f[3][DATA][29] ;
   input \chs_in_f[3][DATA][28] ;
   input \chs_in_f[3][DATA][27] ;
   input \chs_in_f[3][DATA][26] ;
   input \chs_in_f[3][DATA][25] ;
   input \chs_in_f[3][DATA][24] ;
   input \chs_in_f[3][DATA][23] ;
   input \chs_in_f[3][DATA][22] ;
   input \chs_in_f[3][DATA][21] ;
   input \chs_in_f[3][DATA][20] ;
   input \chs_in_f[3][DATA][19] ;
   input \chs_in_f[3][DATA][18] ;
   input \chs_in_f[3][DATA][17] ;
   input \chs_in_f[3][DATA][16] ;
   input \chs_in_f[3][DATA][15] ;
   input \chs_in_f[3][DATA][14] ;
   input \chs_in_f[3][DATA][13] ;
   input \chs_in_f[3][DATA][12] ;
   input \chs_in_f[3][DATA][11] ;
   input \chs_in_f[3][DATA][10] ;
   input \chs_in_f[3][DATA][9] ;
   input \chs_in_f[3][DATA][8] ;
   input \chs_in_f[3][DATA][7] ;
   input \chs_in_f[3][DATA][6] ;
   input \chs_in_f[3][DATA][5] ;
   input \chs_in_f[3][DATA][4] ;
   input \chs_in_f[3][DATA][3] ;
   input \chs_in_f[3][DATA][2] ;
   input \chs_in_f[3][DATA][1] ;
   input \chs_in_f[3][DATA][0] ;
   input \chs_in_f[2][REQ] ;
   input \chs_in_f[2][DATA][33] ;
   input \chs_in_f[2][DATA][32] ;
   input \chs_in_f[2][DATA][31] ;
   input \chs_in_f[2][DATA][30] ;
   input \chs_in_f[2][DATA][29] ;
   input \chs_in_f[2][DATA][28] ;
   input \chs_in_f[2][DATA][27] ;
   input \chs_in_f[2][DATA][26] ;
   input \chs_in_f[2][DATA][25] ;
   input \chs_in_f[2][DATA][24] ;
   input \chs_in_f[2][DATA][23] ;
   input \chs_in_f[2][DATA][22] ;
   input \chs_in_f[2][DATA][21] ;
   input \chs_in_f[2][DATA][20] ;
   input \chs_in_f[2][DATA][19] ;
   input \chs_in_f[2][DATA][18] ;
   input \chs_in_f[2][DATA][17] ;
   input \chs_in_f[2][DATA][16] ;
   input \chs_in_f[2][DATA][15] ;
   input \chs_in_f[2][DATA][14] ;
   input \chs_in_f[2][DATA][13] ;
   input \chs_in_f[2][DATA][12] ;
   input \chs_in_f[2][DATA][11] ;
   input \chs_in_f[2][DATA][10] ;
   input \chs_in_f[2][DATA][9] ;
   input \chs_in_f[2][DATA][8] ;
   input \chs_in_f[2][DATA][7] ;
   input \chs_in_f[2][DATA][6] ;
   input \chs_in_f[2][DATA][5] ;
   input \chs_in_f[2][DATA][4] ;
   input \chs_in_f[2][DATA][3] ;
   input \chs_in_f[2][DATA][2] ;
   input \chs_in_f[2][DATA][1] ;
   input \chs_in_f[2][DATA][0] ;
   input \chs_in_f[1][REQ] ;
   input \chs_in_f[1][DATA][33] ;
   input \chs_in_f[1][DATA][32] ;
   input \chs_in_f[1][DATA][31] ;
   input \chs_in_f[1][DATA][30] ;
   input \chs_in_f[1][DATA][29] ;
   input \chs_in_f[1][DATA][28] ;
   input \chs_in_f[1][DATA][27] ;
   input \chs_in_f[1][DATA][26] ;
   input \chs_in_f[1][DATA][25] ;
   input \chs_in_f[1][DATA][24] ;
   input \chs_in_f[1][DATA][23] ;
   input \chs_in_f[1][DATA][22] ;
   input \chs_in_f[1][DATA][21] ;
   input \chs_in_f[1][DATA][20] ;
   input \chs_in_f[1][DATA][19] ;
   input \chs_in_f[1][DATA][18] ;
   input \chs_in_f[1][DATA][17] ;
   input \chs_in_f[1][DATA][16] ;
   input \chs_in_f[1][DATA][15] ;
   input \chs_in_f[1][DATA][14] ;
   input \chs_in_f[1][DATA][13] ;
   input \chs_in_f[1][DATA][12] ;
   input \chs_in_f[1][DATA][11] ;
   input \chs_in_f[1][DATA][10] ;
   input \chs_in_f[1][DATA][9] ;
   input \chs_in_f[1][DATA][8] ;
   input \chs_in_f[1][DATA][7] ;
   input \chs_in_f[1][DATA][6] ;
   input \chs_in_f[1][DATA][5] ;
   input \chs_in_f[1][DATA][4] ;
   input \chs_in_f[1][DATA][3] ;
   input \chs_in_f[1][DATA][2] ;
   input \chs_in_f[1][DATA][1] ;
   input \chs_in_f[1][DATA][0] ;
   input \chs_in_f[0][REQ] ;
   input \chs_in_f[0][DATA][33] ;
   input \chs_in_f[0][DATA][32] ;
   input \chs_in_f[0][DATA][31] ;
   input \chs_in_f[0][DATA][30] ;
   input \chs_in_f[0][DATA][29] ;
   input \chs_in_f[0][DATA][28] ;
   input \chs_in_f[0][DATA][27] ;
   input \chs_in_f[0][DATA][26] ;
   input \chs_in_f[0][DATA][25] ;
   input \chs_in_f[0][DATA][24] ;
   input \chs_in_f[0][DATA][23] ;
   input \chs_in_f[0][DATA][22] ;
   input \chs_in_f[0][DATA][21] ;
   input \chs_in_f[0][DATA][20] ;
   input \chs_in_f[0][DATA][19] ;
   input \chs_in_f[0][DATA][18] ;
   input \chs_in_f[0][DATA][17] ;
   input \chs_in_f[0][DATA][16] ;
   input \chs_in_f[0][DATA][15] ;
   input \chs_in_f[0][DATA][14] ;
   input \chs_in_f[0][DATA][13] ;
   input \chs_in_f[0][DATA][12] ;
   input \chs_in_f[0][DATA][11] ;
   input \chs_in_f[0][DATA][10] ;
   input \chs_in_f[0][DATA][9] ;
   input \chs_in_f[0][DATA][8] ;
   input \chs_in_f[0][DATA][7] ;
   input \chs_in_f[0][DATA][6] ;
   input \chs_in_f[0][DATA][5] ;
   input \chs_in_f[0][DATA][4] ;
   input \chs_in_f[0][DATA][3] ;
   input \chs_in_f[0][DATA][2] ;
   input \chs_in_f[0][DATA][1] ;
   input \chs_in_f[0][DATA][0] ;
   output \chs_in_b[4][ACK] ;
   output \chs_in_b[3][ACK] ;
   output \chs_in_b[2][ACK] ;
   output \chs_in_b[1][ACK] ;
   output \chs_in_b[0][ACK] ;
   output \latches_out_f[4][TOKEN_T] ;
   output \latches_out_f[4][TOKEN_PARITY] ;
   output \latches_out_f[4][PHIT][32] ;
   output \latches_out_f[4][PHIT][31] ;
   output \latches_out_f[4][PHIT][30] ;
   output \latches_out_f[4][PHIT][29] ;
   output \latches_out_f[4][PHIT][28] ;
   output \latches_out_f[4][PHIT][27] ;
   output \latches_out_f[4][PHIT][26] ;
   output \latches_out_f[4][PHIT][25] ;
   output \latches_out_f[4][PHIT][24] ;
   output \latches_out_f[4][PHIT][23] ;
   output \latches_out_f[4][PHIT][22] ;
   output \latches_out_f[4][PHIT][21] ;
   output \latches_out_f[4][PHIT][20] ;
   output \latches_out_f[4][PHIT][19] ;
   output \latches_out_f[4][PHIT][18] ;
   output \latches_out_f[4][PHIT][17] ;
   output \latches_out_f[4][PHIT][16] ;
   output \latches_out_f[4][PHIT][15] ;
   output \latches_out_f[4][PHIT][14] ;
   output \latches_out_f[4][PHIT][13] ;
   output \latches_out_f[4][PHIT][12] ;
   output \latches_out_f[4][PHIT][11] ;
   output \latches_out_f[4][PHIT][10] ;
   output \latches_out_f[4][PHIT][9] ;
   output \latches_out_f[4][PHIT][8] ;
   output \latches_out_f[4][PHIT][7] ;
   output \latches_out_f[4][PHIT][6] ;
   output \latches_out_f[4][PHIT][5] ;
   output \latches_out_f[4][PHIT][4] ;
   output \latches_out_f[4][PHIT][3] ;
   output \latches_out_f[4][PHIT][2] ;
   output \latches_out_f[4][PHIT][1] ;
   output \latches_out_f[4][PHIT][0] ;
   output \latches_out_f[4][PHIT_PARITY][32] ;
   output \latches_out_f[4][PHIT_PARITY][31] ;
   output \latches_out_f[4][PHIT_PARITY][30] ;
   output \latches_out_f[4][PHIT_PARITY][29] ;
   output \latches_out_f[4][PHIT_PARITY][28] ;
   output \latches_out_f[4][PHIT_PARITY][27] ;
   output \latches_out_f[4][PHIT_PARITY][26] ;
   output \latches_out_f[4][PHIT_PARITY][25] ;
   output \latches_out_f[4][PHIT_PARITY][24] ;
   output \latches_out_f[4][PHIT_PARITY][23] ;
   output \latches_out_f[4][PHIT_PARITY][22] ;
   output \latches_out_f[4][PHIT_PARITY][21] ;
   output \latches_out_f[4][PHIT_PARITY][20] ;
   output \latches_out_f[4][PHIT_PARITY][19] ;
   output \latches_out_f[4][PHIT_PARITY][18] ;
   output \latches_out_f[4][PHIT_PARITY][17] ;
   output \latches_out_f[4][PHIT_PARITY][16] ;
   output \latches_out_f[4][PHIT_PARITY][15] ;
   output \latches_out_f[4][PHIT_PARITY][14] ;
   output \latches_out_f[4][PHIT_PARITY][13] ;
   output \latches_out_f[4][PHIT_PARITY][12] ;
   output \latches_out_f[4][PHIT_PARITY][11] ;
   output \latches_out_f[4][PHIT_PARITY][10] ;
   output \latches_out_f[4][PHIT_PARITY][9] ;
   output \latches_out_f[4][PHIT_PARITY][8] ;
   output \latches_out_f[4][PHIT_PARITY][7] ;
   output \latches_out_f[4][PHIT_PARITY][6] ;
   output \latches_out_f[4][PHIT_PARITY][5] ;
   output \latches_out_f[4][PHIT_PARITY][4] ;
   output \latches_out_f[4][PHIT_PARITY][3] ;
   output \latches_out_f[4][PHIT_PARITY][2] ;
   output \latches_out_f[4][PHIT_PARITY][1] ;
   output \latches_out_f[4][PHIT_PARITY][0] ;
   output \latches_out_f[3][TOKEN_T] ;
   output \latches_out_f[3][TOKEN_PARITY] ;
   output \latches_out_f[3][PHIT][32] ;
   output \latches_out_f[3][PHIT][31] ;
   output \latches_out_f[3][PHIT][30] ;
   output \latches_out_f[3][PHIT][29] ;
   output \latches_out_f[3][PHIT][28] ;
   output \latches_out_f[3][PHIT][27] ;
   output \latches_out_f[3][PHIT][26] ;
   output \latches_out_f[3][PHIT][25] ;
   output \latches_out_f[3][PHIT][24] ;
   output \latches_out_f[3][PHIT][23] ;
   output \latches_out_f[3][PHIT][22] ;
   output \latches_out_f[3][PHIT][21] ;
   output \latches_out_f[3][PHIT][20] ;
   output \latches_out_f[3][PHIT][19] ;
   output \latches_out_f[3][PHIT][18] ;
   output \latches_out_f[3][PHIT][17] ;
   output \latches_out_f[3][PHIT][16] ;
   output \latches_out_f[3][PHIT][15] ;
   output \latches_out_f[3][PHIT][14] ;
   output \latches_out_f[3][PHIT][13] ;
   output \latches_out_f[3][PHIT][12] ;
   output \latches_out_f[3][PHIT][11] ;
   output \latches_out_f[3][PHIT][10] ;
   output \latches_out_f[3][PHIT][9] ;
   output \latches_out_f[3][PHIT][8] ;
   output \latches_out_f[3][PHIT][7] ;
   output \latches_out_f[3][PHIT][6] ;
   output \latches_out_f[3][PHIT][5] ;
   output \latches_out_f[3][PHIT][4] ;
   output \latches_out_f[3][PHIT][3] ;
   output \latches_out_f[3][PHIT][2] ;
   output \latches_out_f[3][PHIT][1] ;
   output \latches_out_f[3][PHIT][0] ;
   output \latches_out_f[3][PHIT_PARITY][32] ;
   output \latches_out_f[3][PHIT_PARITY][31] ;
   output \latches_out_f[3][PHIT_PARITY][30] ;
   output \latches_out_f[3][PHIT_PARITY][29] ;
   output \latches_out_f[3][PHIT_PARITY][28] ;
   output \latches_out_f[3][PHIT_PARITY][27] ;
   output \latches_out_f[3][PHIT_PARITY][26] ;
   output \latches_out_f[3][PHIT_PARITY][25] ;
   output \latches_out_f[3][PHIT_PARITY][24] ;
   output \latches_out_f[3][PHIT_PARITY][23] ;
   output \latches_out_f[3][PHIT_PARITY][22] ;
   output \latches_out_f[3][PHIT_PARITY][21] ;
   output \latches_out_f[3][PHIT_PARITY][20] ;
   output \latches_out_f[3][PHIT_PARITY][19] ;
   output \latches_out_f[3][PHIT_PARITY][18] ;
   output \latches_out_f[3][PHIT_PARITY][17] ;
   output \latches_out_f[3][PHIT_PARITY][16] ;
   output \latches_out_f[3][PHIT_PARITY][15] ;
   output \latches_out_f[3][PHIT_PARITY][14] ;
   output \latches_out_f[3][PHIT_PARITY][13] ;
   output \latches_out_f[3][PHIT_PARITY][12] ;
   output \latches_out_f[3][PHIT_PARITY][11] ;
   output \latches_out_f[3][PHIT_PARITY][10] ;
   output \latches_out_f[3][PHIT_PARITY][9] ;
   output \latches_out_f[3][PHIT_PARITY][8] ;
   output \latches_out_f[3][PHIT_PARITY][7] ;
   output \latches_out_f[3][PHIT_PARITY][6] ;
   output \latches_out_f[3][PHIT_PARITY][5] ;
   output \latches_out_f[3][PHIT_PARITY][4] ;
   output \latches_out_f[3][PHIT_PARITY][3] ;
   output \latches_out_f[3][PHIT_PARITY][2] ;
   output \latches_out_f[3][PHIT_PARITY][1] ;
   output \latches_out_f[3][PHIT_PARITY][0] ;
   output \latches_out_f[2][TOKEN_T] ;
   output \latches_out_f[2][TOKEN_PARITY] ;
   output \latches_out_f[2][PHIT][32] ;
   output \latches_out_f[2][PHIT][31] ;
   output \latches_out_f[2][PHIT][30] ;
   output \latches_out_f[2][PHIT][29] ;
   output \latches_out_f[2][PHIT][28] ;
   output \latches_out_f[2][PHIT][27] ;
   output \latches_out_f[2][PHIT][26] ;
   output \latches_out_f[2][PHIT][25] ;
   output \latches_out_f[2][PHIT][24] ;
   output \latches_out_f[2][PHIT][23] ;
   output \latches_out_f[2][PHIT][22] ;
   output \latches_out_f[2][PHIT][21] ;
   output \latches_out_f[2][PHIT][20] ;
   output \latches_out_f[2][PHIT][19] ;
   output \latches_out_f[2][PHIT][18] ;
   output \latches_out_f[2][PHIT][17] ;
   output \latches_out_f[2][PHIT][16] ;
   output \latches_out_f[2][PHIT][15] ;
   output \latches_out_f[2][PHIT][14] ;
   output \latches_out_f[2][PHIT][13] ;
   output \latches_out_f[2][PHIT][12] ;
   output \latches_out_f[2][PHIT][11] ;
   output \latches_out_f[2][PHIT][10] ;
   output \latches_out_f[2][PHIT][9] ;
   output \latches_out_f[2][PHIT][8] ;
   output \latches_out_f[2][PHIT][7] ;
   output \latches_out_f[2][PHIT][6] ;
   output \latches_out_f[2][PHIT][5] ;
   output \latches_out_f[2][PHIT][4] ;
   output \latches_out_f[2][PHIT][3] ;
   output \latches_out_f[2][PHIT][2] ;
   output \latches_out_f[2][PHIT][1] ;
   output \latches_out_f[2][PHIT][0] ;
   output \latches_out_f[2][PHIT_PARITY][32] ;
   output \latches_out_f[2][PHIT_PARITY][31] ;
   output \latches_out_f[2][PHIT_PARITY][30] ;
   output \latches_out_f[2][PHIT_PARITY][29] ;
   output \latches_out_f[2][PHIT_PARITY][28] ;
   output \latches_out_f[2][PHIT_PARITY][27] ;
   output \latches_out_f[2][PHIT_PARITY][26] ;
   output \latches_out_f[2][PHIT_PARITY][25] ;
   output \latches_out_f[2][PHIT_PARITY][24] ;
   output \latches_out_f[2][PHIT_PARITY][23] ;
   output \latches_out_f[2][PHIT_PARITY][22] ;
   output \latches_out_f[2][PHIT_PARITY][21] ;
   output \latches_out_f[2][PHIT_PARITY][20] ;
   output \latches_out_f[2][PHIT_PARITY][19] ;
   output \latches_out_f[2][PHIT_PARITY][18] ;
   output \latches_out_f[2][PHIT_PARITY][17] ;
   output \latches_out_f[2][PHIT_PARITY][16] ;
   output \latches_out_f[2][PHIT_PARITY][15] ;
   output \latches_out_f[2][PHIT_PARITY][14] ;
   output \latches_out_f[2][PHIT_PARITY][13] ;
   output \latches_out_f[2][PHIT_PARITY][12] ;
   output \latches_out_f[2][PHIT_PARITY][11] ;
   output \latches_out_f[2][PHIT_PARITY][10] ;
   output \latches_out_f[2][PHIT_PARITY][9] ;
   output \latches_out_f[2][PHIT_PARITY][8] ;
   output \latches_out_f[2][PHIT_PARITY][7] ;
   output \latches_out_f[2][PHIT_PARITY][6] ;
   output \latches_out_f[2][PHIT_PARITY][5] ;
   output \latches_out_f[2][PHIT_PARITY][4] ;
   output \latches_out_f[2][PHIT_PARITY][3] ;
   output \latches_out_f[2][PHIT_PARITY][2] ;
   output \latches_out_f[2][PHIT_PARITY][1] ;
   output \latches_out_f[2][PHIT_PARITY][0] ;
   output \latches_out_f[1][TOKEN_T] ;
   output \latches_out_f[1][TOKEN_PARITY] ;
   output \latches_out_f[1][PHIT][32] ;
   output \latches_out_f[1][PHIT][31] ;
   output \latches_out_f[1][PHIT][30] ;
   output \latches_out_f[1][PHIT][29] ;
   output \latches_out_f[1][PHIT][28] ;
   output \latches_out_f[1][PHIT][27] ;
   output \latches_out_f[1][PHIT][26] ;
   output \latches_out_f[1][PHIT][25] ;
   output \latches_out_f[1][PHIT][24] ;
   output \latches_out_f[1][PHIT][23] ;
   output \latches_out_f[1][PHIT][22] ;
   output \latches_out_f[1][PHIT][21] ;
   output \latches_out_f[1][PHIT][20] ;
   output \latches_out_f[1][PHIT][19] ;
   output \latches_out_f[1][PHIT][18] ;
   output \latches_out_f[1][PHIT][17] ;
   output \latches_out_f[1][PHIT][16] ;
   output \latches_out_f[1][PHIT][15] ;
   output \latches_out_f[1][PHIT][14] ;
   output \latches_out_f[1][PHIT][13] ;
   output \latches_out_f[1][PHIT][12] ;
   output \latches_out_f[1][PHIT][11] ;
   output \latches_out_f[1][PHIT][10] ;
   output \latches_out_f[1][PHIT][9] ;
   output \latches_out_f[1][PHIT][8] ;
   output \latches_out_f[1][PHIT][7] ;
   output \latches_out_f[1][PHIT][6] ;
   output \latches_out_f[1][PHIT][5] ;
   output \latches_out_f[1][PHIT][4] ;
   output \latches_out_f[1][PHIT][3] ;
   output \latches_out_f[1][PHIT][2] ;
   output \latches_out_f[1][PHIT][1] ;
   output \latches_out_f[1][PHIT][0] ;
   output \latches_out_f[1][PHIT_PARITY][32] ;
   output \latches_out_f[1][PHIT_PARITY][31] ;
   output \latches_out_f[1][PHIT_PARITY][30] ;
   output \latches_out_f[1][PHIT_PARITY][29] ;
   output \latches_out_f[1][PHIT_PARITY][28] ;
   output \latches_out_f[1][PHIT_PARITY][27] ;
   output \latches_out_f[1][PHIT_PARITY][26] ;
   output \latches_out_f[1][PHIT_PARITY][25] ;
   output \latches_out_f[1][PHIT_PARITY][24] ;
   output \latches_out_f[1][PHIT_PARITY][23] ;
   output \latches_out_f[1][PHIT_PARITY][22] ;
   output \latches_out_f[1][PHIT_PARITY][21] ;
   output \latches_out_f[1][PHIT_PARITY][20] ;
   output \latches_out_f[1][PHIT_PARITY][19] ;
   output \latches_out_f[1][PHIT_PARITY][18] ;
   output \latches_out_f[1][PHIT_PARITY][17] ;
   output \latches_out_f[1][PHIT_PARITY][16] ;
   output \latches_out_f[1][PHIT_PARITY][15] ;
   output \latches_out_f[1][PHIT_PARITY][14] ;
   output \latches_out_f[1][PHIT_PARITY][13] ;
   output \latches_out_f[1][PHIT_PARITY][12] ;
   output \latches_out_f[1][PHIT_PARITY][11] ;
   output \latches_out_f[1][PHIT_PARITY][10] ;
   output \latches_out_f[1][PHIT_PARITY][9] ;
   output \latches_out_f[1][PHIT_PARITY][8] ;
   output \latches_out_f[1][PHIT_PARITY][7] ;
   output \latches_out_f[1][PHIT_PARITY][6] ;
   output \latches_out_f[1][PHIT_PARITY][5] ;
   output \latches_out_f[1][PHIT_PARITY][4] ;
   output \latches_out_f[1][PHIT_PARITY][3] ;
   output \latches_out_f[1][PHIT_PARITY][2] ;
   output \latches_out_f[1][PHIT_PARITY][1] ;
   output \latches_out_f[1][PHIT_PARITY][0] ;
   output \latches_out_f[0][TOKEN_T] ;
   output \latches_out_f[0][TOKEN_PARITY] ;
   output \latches_out_f[0][PHIT][32] ;
   output \latches_out_f[0][PHIT][31] ;
   output \latches_out_f[0][PHIT][30] ;
   output \latches_out_f[0][PHIT][29] ;
   output \latches_out_f[0][PHIT][28] ;
   output \latches_out_f[0][PHIT][27] ;
   output \latches_out_f[0][PHIT][26] ;
   output \latches_out_f[0][PHIT][25] ;
   output \latches_out_f[0][PHIT][24] ;
   output \latches_out_f[0][PHIT][23] ;
   output \latches_out_f[0][PHIT][22] ;
   output \latches_out_f[0][PHIT][21] ;
   output \latches_out_f[0][PHIT][20] ;
   output \latches_out_f[0][PHIT][19] ;
   output \latches_out_f[0][PHIT][18] ;
   output \latches_out_f[0][PHIT][17] ;
   output \latches_out_f[0][PHIT][16] ;
   output \latches_out_f[0][PHIT][15] ;
   output \latches_out_f[0][PHIT][14] ;
   output \latches_out_f[0][PHIT][13] ;
   output \latches_out_f[0][PHIT][12] ;
   output \latches_out_f[0][PHIT][11] ;
   output \latches_out_f[0][PHIT][10] ;
   output \latches_out_f[0][PHIT][9] ;
   output \latches_out_f[0][PHIT][8] ;
   output \latches_out_f[0][PHIT][7] ;
   output \latches_out_f[0][PHIT][6] ;
   output \latches_out_f[0][PHIT][5] ;
   output \latches_out_f[0][PHIT][4] ;
   output \latches_out_f[0][PHIT][3] ;
   output \latches_out_f[0][PHIT][2] ;
   output \latches_out_f[0][PHIT][1] ;
   output \latches_out_f[0][PHIT][0] ;
   output \latches_out_f[0][PHIT_PARITY][32] ;
   output \latches_out_f[0][PHIT_PARITY][31] ;
   output \latches_out_f[0][PHIT_PARITY][30] ;
   output \latches_out_f[0][PHIT_PARITY][29] ;
   output \latches_out_f[0][PHIT_PARITY][28] ;
   output \latches_out_f[0][PHIT_PARITY][27] ;
   output \latches_out_f[0][PHIT_PARITY][26] ;
   output \latches_out_f[0][PHIT_PARITY][25] ;
   output \latches_out_f[0][PHIT_PARITY][24] ;
   output \latches_out_f[0][PHIT_PARITY][23] ;
   output \latches_out_f[0][PHIT_PARITY][22] ;
   output \latches_out_f[0][PHIT_PARITY][21] ;
   output \latches_out_f[0][PHIT_PARITY][20] ;
   output \latches_out_f[0][PHIT_PARITY][19] ;
   output \latches_out_f[0][PHIT_PARITY][18] ;
   output \latches_out_f[0][PHIT_PARITY][17] ;
   output \latches_out_f[0][PHIT_PARITY][16] ;
   output \latches_out_f[0][PHIT_PARITY][15] ;
   output \latches_out_f[0][PHIT_PARITY][14] ;
   output \latches_out_f[0][PHIT_PARITY][13] ;
   output \latches_out_f[0][PHIT_PARITY][12] ;
   output \latches_out_f[0][PHIT_PARITY][11] ;
   output \latches_out_f[0][PHIT_PARITY][10] ;
   output \latches_out_f[0][PHIT_PARITY][9] ;
   output \latches_out_f[0][PHIT_PARITY][8] ;
   output \latches_out_f[0][PHIT_PARITY][7] ;
   output \latches_out_f[0][PHIT_PARITY][6] ;
   output \latches_out_f[0][PHIT_PARITY][5] ;
   output \latches_out_f[0][PHIT_PARITY][4] ;
   output \latches_out_f[0][PHIT_PARITY][3] ;
   output \latches_out_f[0][PHIT_PARITY][2] ;
   output \latches_out_f[0][PHIT_PARITY][1] ;
   output \latches_out_f[0][PHIT_PARITY][0] ;
   input \latches_out_b[4][ACK] ;
   input \latches_out_b[3][ACK] ;
   input \latches_out_b[2][ACK] ;
   input \latches_out_b[1][ACK] ;
   input \latches_out_b[0][ACK] ;
   input FE_OFN0_preset;
   input FE_OFN2_preset;
   input FE_OFN1003_preset;
   input FE_OFN1038_preset;
   input FE_PHN1407_FE_OFN1003_preset;
   input FE_PHN1408_FE_OCPN1195_preset;
   input FE_PHN1436_FE_OCPN1195_preset;
   input FE_PHN1448_FE_OFN1003_preset;

   // Internal wires
   wire \latches_in_f[4][REQ] ;
   wire \latches_in_f[4][DATA][33] ;
   wire \latches_in_f[4][DATA][32] ;
   wire \latches_in_f[4][DATA][31] ;
   wire \latches_in_f[4][DATA][30] ;
   wire \latches_in_f[4][DATA][29] ;
   wire \latches_in_f[4][DATA][28] ;
   wire \latches_in_f[4][DATA][27] ;
   wire \latches_in_f[4][DATA][26] ;
   wire \latches_in_f[4][DATA][25] ;
   wire \latches_in_f[4][DATA][24] ;
   wire \latches_in_f[4][DATA][23] ;
   wire \latches_in_f[4][DATA][22] ;
   wire \latches_in_f[4][DATA][21] ;
   wire \latches_in_f[4][DATA][20] ;
   wire \latches_in_f[4][DATA][19] ;
   wire \latches_in_f[4][DATA][18] ;
   wire \latches_in_f[4][DATA][17] ;
   wire \latches_in_f[4][DATA][16] ;
   wire \latches_in_f[4][DATA][15] ;
   wire \latches_in_f[4][DATA][14] ;
   wire \latches_in_f[4][DATA][13] ;
   wire \latches_in_f[4][DATA][12] ;
   wire \latches_in_f[4][DATA][11] ;
   wire \latches_in_f[4][DATA][10] ;
   wire \latches_in_f[4][DATA][9] ;
   wire \latches_in_f[4][DATA][8] ;
   wire \latches_in_f[4][DATA][7] ;
   wire \latches_in_f[4][DATA][6] ;
   wire \latches_in_f[4][DATA][5] ;
   wire \latches_in_f[4][DATA][4] ;
   wire \latches_in_f[4][DATA][3] ;
   wire \latches_in_f[4][DATA][2] ;
   wire \latches_in_f[4][DATA][1] ;
   wire \latches_in_f[4][DATA][0] ;
   wire \latches_in_f[3][REQ] ;
   wire \latches_in_f[3][DATA][33] ;
   wire \latches_in_f[3][DATA][32] ;
   wire \latches_in_f[3][DATA][31] ;
   wire \latches_in_f[3][DATA][30] ;
   wire \latches_in_f[3][DATA][29] ;
   wire \latches_in_f[3][DATA][28] ;
   wire \latches_in_f[3][DATA][27] ;
   wire \latches_in_f[3][DATA][26] ;
   wire \latches_in_f[3][DATA][25] ;
   wire \latches_in_f[3][DATA][24] ;
   wire \latches_in_f[3][DATA][23] ;
   wire \latches_in_f[3][DATA][22] ;
   wire \latches_in_f[3][DATA][21] ;
   wire \latches_in_f[3][DATA][20] ;
   wire \latches_in_f[3][DATA][19] ;
   wire \latches_in_f[3][DATA][18] ;
   wire \latches_in_f[3][DATA][17] ;
   wire \latches_in_f[3][DATA][16] ;
   wire \latches_in_f[3][DATA][15] ;
   wire \latches_in_f[3][DATA][14] ;
   wire \latches_in_f[3][DATA][13] ;
   wire \latches_in_f[3][DATA][12] ;
   wire \latches_in_f[3][DATA][11] ;
   wire \latches_in_f[3][DATA][10] ;
   wire \latches_in_f[3][DATA][9] ;
   wire \latches_in_f[3][DATA][8] ;
   wire \latches_in_f[3][DATA][7] ;
   wire \latches_in_f[3][DATA][6] ;
   wire \latches_in_f[3][DATA][5] ;
   wire \latches_in_f[3][DATA][4] ;
   wire \latches_in_f[3][DATA][3] ;
   wire \latches_in_f[3][DATA][2] ;
   wire \latches_in_f[3][DATA][1] ;
   wire \latches_in_f[3][DATA][0] ;
   wire \latches_in_f[2][REQ] ;
   wire \latches_in_f[2][DATA][33] ;
   wire \latches_in_f[2][DATA][32] ;
   wire \latches_in_f[2][DATA][31] ;
   wire \latches_in_f[2][DATA][30] ;
   wire \latches_in_f[2][DATA][29] ;
   wire \latches_in_f[2][DATA][28] ;
   wire \latches_in_f[2][DATA][27] ;
   wire \latches_in_f[2][DATA][26] ;
   wire \latches_in_f[2][DATA][25] ;
   wire \latches_in_f[2][DATA][24] ;
   wire \latches_in_f[2][DATA][23] ;
   wire \latches_in_f[2][DATA][22] ;
   wire \latches_in_f[2][DATA][21] ;
   wire \latches_in_f[2][DATA][20] ;
   wire \latches_in_f[2][DATA][19] ;
   wire \latches_in_f[2][DATA][18] ;
   wire \latches_in_f[2][DATA][17] ;
   wire \latches_in_f[2][DATA][16] ;
   wire \latches_in_f[2][DATA][15] ;
   wire \latches_in_f[2][DATA][14] ;
   wire \latches_in_f[2][DATA][13] ;
   wire \latches_in_f[2][DATA][12] ;
   wire \latches_in_f[2][DATA][11] ;
   wire \latches_in_f[2][DATA][10] ;
   wire \latches_in_f[2][DATA][9] ;
   wire \latches_in_f[2][DATA][8] ;
   wire \latches_in_f[2][DATA][7] ;
   wire \latches_in_f[2][DATA][6] ;
   wire \latches_in_f[2][DATA][5] ;
   wire \latches_in_f[2][DATA][4] ;
   wire \latches_in_f[2][DATA][3] ;
   wire \latches_in_f[2][DATA][2] ;
   wire \latches_in_f[2][DATA][1] ;
   wire \latches_in_f[2][DATA][0] ;
   wire \latches_in_f[1][REQ] ;
   wire \latches_in_f[1][DATA][33] ;
   wire \latches_in_f[1][DATA][32] ;
   wire \latches_in_f[1][DATA][31] ;
   wire \latches_in_f[1][DATA][30] ;
   wire \latches_in_f[1][DATA][29] ;
   wire \latches_in_f[1][DATA][28] ;
   wire \latches_in_f[1][DATA][27] ;
   wire \latches_in_f[1][DATA][26] ;
   wire \latches_in_f[1][DATA][25] ;
   wire \latches_in_f[1][DATA][24] ;
   wire \latches_in_f[1][DATA][23] ;
   wire \latches_in_f[1][DATA][22] ;
   wire \latches_in_f[1][DATA][21] ;
   wire \latches_in_f[1][DATA][20] ;
   wire \latches_in_f[1][DATA][19] ;
   wire \latches_in_f[1][DATA][18] ;
   wire \latches_in_f[1][DATA][17] ;
   wire \latches_in_f[1][DATA][16] ;
   wire \latches_in_f[1][DATA][15] ;
   wire \latches_in_f[1][DATA][14] ;
   wire \latches_in_f[1][DATA][13] ;
   wire \latches_in_f[1][DATA][12] ;
   wire \latches_in_f[1][DATA][11] ;
   wire \latches_in_f[1][DATA][10] ;
   wire \latches_in_f[1][DATA][9] ;
   wire \latches_in_f[1][DATA][8] ;
   wire \latches_in_f[1][DATA][7] ;
   wire \latches_in_f[1][DATA][6] ;
   wire \latches_in_f[1][DATA][5] ;
   wire \latches_in_f[1][DATA][4] ;
   wire \latches_in_f[1][DATA][3] ;
   wire \latches_in_f[1][DATA][2] ;
   wire \latches_in_f[1][DATA][1] ;
   wire \latches_in_f[1][DATA][0] ;
   wire \latches_in_f[0][REQ] ;
   wire \latches_in_f[0][DATA][33] ;
   wire \latches_in_f[0][DATA][32] ;
   wire \latches_in_f[0][DATA][31] ;
   wire \latches_in_f[0][DATA][30] ;
   wire \latches_in_f[0][DATA][29] ;
   wire \latches_in_f[0][DATA][28] ;
   wire \latches_in_f[0][DATA][27] ;
   wire \latches_in_f[0][DATA][26] ;
   wire \latches_in_f[0][DATA][25] ;
   wire \latches_in_f[0][DATA][24] ;
   wire \latches_in_f[0][DATA][23] ;
   wire \latches_in_f[0][DATA][22] ;
   wire \latches_in_f[0][DATA][21] ;
   wire \latches_in_f[0][DATA][20] ;
   wire \latches_in_f[0][DATA][19] ;
   wire \latches_in_f[0][DATA][18] ;
   wire \latches_in_f[0][DATA][17] ;
   wire \latches_in_f[0][DATA][16] ;
   wire \latches_in_f[0][DATA][15] ;
   wire \latches_in_f[0][DATA][14] ;
   wire \latches_in_f[0][DATA][13] ;
   wire \latches_in_f[0][DATA][12] ;
   wire \latches_in_f[0][DATA][11] ;
   wire \latches_in_f[0][DATA][10] ;
   wire \latches_in_f[0][DATA][9] ;
   wire \latches_in_f[0][DATA][8] ;
   wire \latches_in_f[0][DATA][7] ;
   wire \latches_in_f[0][DATA][6] ;
   wire \latches_in_f[0][DATA][5] ;
   wire \latches_in_f[0][DATA][4] ;
   wire \latches_in_f[0][DATA][3] ;
   wire \latches_in_f[0][DATA][2] ;
   wire \latches_in_f[0][DATA][1] ;
   wire \latches_in_f[0][DATA][0] ;
   wire \latches_in_b[4][ACK] ;
   wire \latches_in_b[3][ACK] ;
   wire \latches_in_b[2][ACK] ;
   wire \latches_in_b[1][ACK] ;
   wire \latches_in_b[0][ACK] ;

   crossbar_x0_y0 crossbar (.preset(FE_OFN0_preset), 
	.switch_sel({ \switch_sel[4][4] ,
		\switch_sel[4][3] ,
		\switch_sel[4][2] ,
		\switch_sel[4][1] ,
		\switch_sel[4][0] ,
		\switch_sel[3][4] ,
		\switch_sel[3][3] ,
		\switch_sel[3][2] ,
		\switch_sel[3][1] ,
		\switch_sel[3][0] ,
		\switch_sel[2][4] ,
		\switch_sel[2][3] ,
		\switch_sel[2][2] ,
		\switch_sel[2][1] ,
		\switch_sel[2][0] ,
		\switch_sel[1][4] ,
		\switch_sel[1][3] ,
		\switch_sel[1][2] ,
		\switch_sel[1][1] ,
		\switch_sel[1][0] ,
		\switch_sel[0][4] ,
		\switch_sel[0][3] ,
		\switch_sel[0][2] ,
		\switch_sel[0][1] ,
		\switch_sel[0][0]  }), 
	.chs_in_f({ \chs_in_f[4][REQ] ,
		\chs_in_f[4][DATA][33] ,
		\chs_in_f[4][DATA][32] ,
		\chs_in_f[4][DATA][31] ,
		\chs_in_f[4][DATA][30] ,
		\chs_in_f[4][DATA][29] ,
		\chs_in_f[4][DATA][28] ,
		\chs_in_f[4][DATA][27] ,
		\chs_in_f[4][DATA][26] ,
		\chs_in_f[4][DATA][25] ,
		\chs_in_f[4][DATA][24] ,
		\chs_in_f[4][DATA][23] ,
		\chs_in_f[4][DATA][22] ,
		\chs_in_f[4][DATA][21] ,
		\chs_in_f[4][DATA][20] ,
		\chs_in_f[4][DATA][19] ,
		\chs_in_f[4][DATA][18] ,
		\chs_in_f[4][DATA][17] ,
		\chs_in_f[4][DATA][16] ,
		\chs_in_f[4][DATA][15] ,
		\chs_in_f[4][DATA][14] ,
		\chs_in_f[4][DATA][13] ,
		\chs_in_f[4][DATA][12] ,
		\chs_in_f[4][DATA][11] ,
		\chs_in_f[4][DATA][10] ,
		\chs_in_f[4][DATA][9] ,
		\chs_in_f[4][DATA][8] ,
		\chs_in_f[4][DATA][7] ,
		\chs_in_f[4][DATA][6] ,
		\chs_in_f[4][DATA][5] ,
		\chs_in_f[4][DATA][4] ,
		\chs_in_f[4][DATA][3] ,
		\chs_in_f[4][DATA][2] ,
		\chs_in_f[4][DATA][1] ,
		\chs_in_f[4][DATA][0] ,
		\chs_in_f[3][REQ] ,
		\chs_in_f[3][DATA][33] ,
		\chs_in_f[3][DATA][32] ,
		\chs_in_f[3][DATA][31] ,
		\chs_in_f[3][DATA][30] ,
		\chs_in_f[3][DATA][29] ,
		\chs_in_f[3][DATA][28] ,
		\chs_in_f[3][DATA][27] ,
		\chs_in_f[3][DATA][26] ,
		\chs_in_f[3][DATA][25] ,
		\chs_in_f[3][DATA][24] ,
		\chs_in_f[3][DATA][23] ,
		\chs_in_f[3][DATA][22] ,
		\chs_in_f[3][DATA][21] ,
		\chs_in_f[3][DATA][20] ,
		\chs_in_f[3][DATA][19] ,
		\chs_in_f[3][DATA][18] ,
		\chs_in_f[3][DATA][17] ,
		\chs_in_f[3][DATA][16] ,
		\chs_in_f[3][DATA][15] ,
		\chs_in_f[3][DATA][14] ,
		\chs_in_f[3][DATA][13] ,
		\chs_in_f[3][DATA][12] ,
		\chs_in_f[3][DATA][11] ,
		\chs_in_f[3][DATA][10] ,
		\chs_in_f[3][DATA][9] ,
		\chs_in_f[3][DATA][8] ,
		\chs_in_f[3][DATA][7] ,
		\chs_in_f[3][DATA][6] ,
		\chs_in_f[3][DATA][5] ,
		\chs_in_f[3][DATA][4] ,
		\chs_in_f[3][DATA][3] ,
		\chs_in_f[3][DATA][2] ,
		\chs_in_f[3][DATA][1] ,
		\chs_in_f[3][DATA][0] ,
		\chs_in_f[2][REQ] ,
		\chs_in_f[2][DATA][33] ,
		\chs_in_f[2][DATA][32] ,
		\chs_in_f[2][DATA][31] ,
		\chs_in_f[2][DATA][30] ,
		\chs_in_f[2][DATA][29] ,
		\chs_in_f[2][DATA][28] ,
		\chs_in_f[2][DATA][27] ,
		\chs_in_f[2][DATA][26] ,
		\chs_in_f[2][DATA][25] ,
		\chs_in_f[2][DATA][24] ,
		\chs_in_f[2][DATA][23] ,
		\chs_in_f[2][DATA][22] ,
		\chs_in_f[2][DATA][21] ,
		\chs_in_f[2][DATA][20] ,
		\chs_in_f[2][DATA][19] ,
		\chs_in_f[2][DATA][18] ,
		\chs_in_f[2][DATA][17] ,
		\chs_in_f[2][DATA][16] ,
		\chs_in_f[2][DATA][15] ,
		\chs_in_f[2][DATA][14] ,
		\chs_in_f[2][DATA][13] ,
		\chs_in_f[2][DATA][12] ,
		\chs_in_f[2][DATA][11] ,
		\chs_in_f[2][DATA][10] ,
		\chs_in_f[2][DATA][9] ,
		\chs_in_f[2][DATA][8] ,
		\chs_in_f[2][DATA][7] ,
		\chs_in_f[2][DATA][6] ,
		\chs_in_f[2][DATA][5] ,
		\chs_in_f[2][DATA][4] ,
		\chs_in_f[2][DATA][3] ,
		\chs_in_f[2][DATA][2] ,
		\chs_in_f[2][DATA][1] ,
		\chs_in_f[2][DATA][0] ,
		\chs_in_f[1][REQ] ,
		\chs_in_f[1][DATA][33] ,
		\chs_in_f[1][DATA][32] ,
		\chs_in_f[1][DATA][31] ,
		\chs_in_f[1][DATA][30] ,
		\chs_in_f[1][DATA][29] ,
		\chs_in_f[1][DATA][28] ,
		\chs_in_f[1][DATA][27] ,
		\chs_in_f[1][DATA][26] ,
		\chs_in_f[1][DATA][25] ,
		\chs_in_f[1][DATA][24] ,
		\chs_in_f[1][DATA][23] ,
		\chs_in_f[1][DATA][22] ,
		\chs_in_f[1][DATA][21] ,
		\chs_in_f[1][DATA][20] ,
		\chs_in_f[1][DATA][19] ,
		\chs_in_f[1][DATA][18] ,
		\chs_in_f[1][DATA][17] ,
		\chs_in_f[1][DATA][16] ,
		\chs_in_f[1][DATA][15] ,
		\chs_in_f[1][DATA][14] ,
		\chs_in_f[1][DATA][13] ,
		\chs_in_f[1][DATA][12] ,
		\chs_in_f[1][DATA][11] ,
		\chs_in_f[1][DATA][10] ,
		\chs_in_f[1][DATA][9] ,
		\chs_in_f[1][DATA][8] ,
		\chs_in_f[1][DATA][7] ,
		\chs_in_f[1][DATA][6] ,
		\chs_in_f[1][DATA][5] ,
		\chs_in_f[1][DATA][4] ,
		\chs_in_f[1][DATA][3] ,
		\chs_in_f[1][DATA][2] ,
		\chs_in_f[1][DATA][1] ,
		\chs_in_f[1][DATA][0] ,
		\chs_in_f[0][REQ] ,
		\chs_in_f[0][DATA][33] ,
		\chs_in_f[0][DATA][32] ,
		\chs_in_f[0][DATA][31] ,
		\chs_in_f[0][DATA][30] ,
		\chs_in_f[0][DATA][29] ,
		\chs_in_f[0][DATA][28] ,
		\chs_in_f[0][DATA][27] ,
		\chs_in_f[0][DATA][26] ,
		\chs_in_f[0][DATA][25] ,
		\chs_in_f[0][DATA][24] ,
		\chs_in_f[0][DATA][23] ,
		\chs_in_f[0][DATA][22] ,
		\chs_in_f[0][DATA][21] ,
		\chs_in_f[0][DATA][20] ,
		\chs_in_f[0][DATA][19] ,
		\chs_in_f[0][DATA][18] ,
		\chs_in_f[0][DATA][17] ,
		\chs_in_f[0][DATA][16] ,
		\chs_in_f[0][DATA][15] ,
		\chs_in_f[0][DATA][14] ,
		\chs_in_f[0][DATA][13] ,
		\chs_in_f[0][DATA][12] ,
		\chs_in_f[0][DATA][11] ,
		\chs_in_f[0][DATA][10] ,
		\chs_in_f[0][DATA][9] ,
		\chs_in_f[0][DATA][8] ,
		\chs_in_f[0][DATA][7] ,
		\chs_in_f[0][DATA][6] ,
		\chs_in_f[0][DATA][5] ,
		\chs_in_f[0][DATA][4] ,
		\chs_in_f[0][DATA][3] ,
		\chs_in_f[0][DATA][2] ,
		\chs_in_f[0][DATA][1] ,
		\chs_in_f[0][DATA][0]  }), 
	.chs_in_b({ \chs_in_b[4][ACK] ,
		\chs_in_b[3][ACK] ,
		\chs_in_b[2][ACK] ,
		\chs_in_b[1][ACK] ,
		\chs_in_b[0][ACK]  }), 
	.chs_out_f({ \latches_in_f[4][REQ] ,
		\latches_in_f[4][DATA][33] ,
		\latches_in_f[4][DATA][32] ,
		\latches_in_f[4][DATA][31] ,
		\latches_in_f[4][DATA][30] ,
		\latches_in_f[4][DATA][29] ,
		\latches_in_f[4][DATA][28] ,
		\latches_in_f[4][DATA][27] ,
		\latches_in_f[4][DATA][26] ,
		\latches_in_f[4][DATA][25] ,
		\latches_in_f[4][DATA][24] ,
		\latches_in_f[4][DATA][23] ,
		\latches_in_f[4][DATA][22] ,
		\latches_in_f[4][DATA][21] ,
		\latches_in_f[4][DATA][20] ,
		\latches_in_f[4][DATA][19] ,
		\latches_in_f[4][DATA][18] ,
		\latches_in_f[4][DATA][17] ,
		\latches_in_f[4][DATA][16] ,
		\latches_in_f[4][DATA][15] ,
		\latches_in_f[4][DATA][14] ,
		\latches_in_f[4][DATA][13] ,
		\latches_in_f[4][DATA][12] ,
		\latches_in_f[4][DATA][11] ,
		\latches_in_f[4][DATA][10] ,
		\latches_in_f[4][DATA][9] ,
		\latches_in_f[4][DATA][8] ,
		\latches_in_f[4][DATA][7] ,
		\latches_in_f[4][DATA][6] ,
		\latches_in_f[4][DATA][5] ,
		\latches_in_f[4][DATA][4] ,
		\latches_in_f[4][DATA][3] ,
		\latches_in_f[4][DATA][2] ,
		\latches_in_f[4][DATA][1] ,
		\latches_in_f[4][DATA][0] ,
		\latches_in_f[3][REQ] ,
		\latches_in_f[3][DATA][33] ,
		\latches_in_f[3][DATA][32] ,
		\latches_in_f[3][DATA][31] ,
		\latches_in_f[3][DATA][30] ,
		\latches_in_f[3][DATA][29] ,
		\latches_in_f[3][DATA][28] ,
		\latches_in_f[3][DATA][27] ,
		\latches_in_f[3][DATA][26] ,
		\latches_in_f[3][DATA][25] ,
		\latches_in_f[3][DATA][24] ,
		\latches_in_f[3][DATA][23] ,
		\latches_in_f[3][DATA][22] ,
		\latches_in_f[3][DATA][21] ,
		\latches_in_f[3][DATA][20] ,
		\latches_in_f[3][DATA][19] ,
		\latches_in_f[3][DATA][18] ,
		\latches_in_f[3][DATA][17] ,
		\latches_in_f[3][DATA][16] ,
		\latches_in_f[3][DATA][15] ,
		\latches_in_f[3][DATA][14] ,
		\latches_in_f[3][DATA][13] ,
		\latches_in_f[3][DATA][12] ,
		\latches_in_f[3][DATA][11] ,
		\latches_in_f[3][DATA][10] ,
		\latches_in_f[3][DATA][9] ,
		\latches_in_f[3][DATA][8] ,
		\latches_in_f[3][DATA][7] ,
		\latches_in_f[3][DATA][6] ,
		\latches_in_f[3][DATA][5] ,
		\latches_in_f[3][DATA][4] ,
		\latches_in_f[3][DATA][3] ,
		\latches_in_f[3][DATA][2] ,
		\latches_in_f[3][DATA][1] ,
		\latches_in_f[3][DATA][0] ,
		\latches_in_f[2][REQ] ,
		\latches_in_f[2][DATA][33] ,
		\latches_in_f[2][DATA][32] ,
		\latches_in_f[2][DATA][31] ,
		\latches_in_f[2][DATA][30] ,
		\latches_in_f[2][DATA][29] ,
		\latches_in_f[2][DATA][28] ,
		\latches_in_f[2][DATA][27] ,
		\latches_in_f[2][DATA][26] ,
		\latches_in_f[2][DATA][25] ,
		\latches_in_f[2][DATA][24] ,
		\latches_in_f[2][DATA][23] ,
		\latches_in_f[2][DATA][22] ,
		\latches_in_f[2][DATA][21] ,
		\latches_in_f[2][DATA][20] ,
		\latches_in_f[2][DATA][19] ,
		\latches_in_f[2][DATA][18] ,
		\latches_in_f[2][DATA][17] ,
		\latches_in_f[2][DATA][16] ,
		\latches_in_f[2][DATA][15] ,
		\latches_in_f[2][DATA][14] ,
		\latches_in_f[2][DATA][13] ,
		\latches_in_f[2][DATA][12] ,
		\latches_in_f[2][DATA][11] ,
		\latches_in_f[2][DATA][10] ,
		\latches_in_f[2][DATA][9] ,
		\latches_in_f[2][DATA][8] ,
		\latches_in_f[2][DATA][7] ,
		\latches_in_f[2][DATA][6] ,
		\latches_in_f[2][DATA][5] ,
		\latches_in_f[2][DATA][4] ,
		\latches_in_f[2][DATA][3] ,
		\latches_in_f[2][DATA][2] ,
		\latches_in_f[2][DATA][1] ,
		\latches_in_f[2][DATA][0] ,
		\latches_in_f[1][REQ] ,
		\latches_in_f[1][DATA][33] ,
		\latches_in_f[1][DATA][32] ,
		\latches_in_f[1][DATA][31] ,
		\latches_in_f[1][DATA][30] ,
		\latches_in_f[1][DATA][29] ,
		\latches_in_f[1][DATA][28] ,
		\latches_in_f[1][DATA][27] ,
		\latches_in_f[1][DATA][26] ,
		\latches_in_f[1][DATA][25] ,
		\latches_in_f[1][DATA][24] ,
		\latches_in_f[1][DATA][23] ,
		\latches_in_f[1][DATA][22] ,
		\latches_in_f[1][DATA][21] ,
		\latches_in_f[1][DATA][20] ,
		\latches_in_f[1][DATA][19] ,
		\latches_in_f[1][DATA][18] ,
		\latches_in_f[1][DATA][17] ,
		\latches_in_f[1][DATA][16] ,
		\latches_in_f[1][DATA][15] ,
		\latches_in_f[1][DATA][14] ,
		\latches_in_f[1][DATA][13] ,
		\latches_in_f[1][DATA][12] ,
		\latches_in_f[1][DATA][11] ,
		\latches_in_f[1][DATA][10] ,
		\latches_in_f[1][DATA][9] ,
		\latches_in_f[1][DATA][8] ,
		\latches_in_f[1][DATA][7] ,
		\latches_in_f[1][DATA][6] ,
		\latches_in_f[1][DATA][5] ,
		\latches_in_f[1][DATA][4] ,
		\latches_in_f[1][DATA][3] ,
		\latches_in_f[1][DATA][2] ,
		\latches_in_f[1][DATA][1] ,
		\latches_in_f[1][DATA][0] ,
		\latches_in_f[0][REQ] ,
		\latches_in_f[0][DATA][33] ,
		\latches_in_f[0][DATA][32] ,
		\latches_in_f[0][DATA][31] ,
		\latches_in_f[0][DATA][30] ,
		\latches_in_f[0][DATA][29] ,
		\latches_in_f[0][DATA][28] ,
		\latches_in_f[0][DATA][27] ,
		\latches_in_f[0][DATA][26] ,
		\latches_in_f[0][DATA][25] ,
		\latches_in_f[0][DATA][24] ,
		\latches_in_f[0][DATA][23] ,
		\latches_in_f[0][DATA][22] ,
		\latches_in_f[0][DATA][21] ,
		\latches_in_f[0][DATA][20] ,
		\latches_in_f[0][DATA][19] ,
		\latches_in_f[0][DATA][18] ,
		\latches_in_f[0][DATA][17] ,
		\latches_in_f[0][DATA][16] ,
		\latches_in_f[0][DATA][15] ,
		\latches_in_f[0][DATA][14] ,
		\latches_in_f[0][DATA][13] ,
		\latches_in_f[0][DATA][12] ,
		\latches_in_f[0][DATA][11] ,
		\latches_in_f[0][DATA][10] ,
		\latches_in_f[0][DATA][9] ,
		\latches_in_f[0][DATA][8] ,
		\latches_in_f[0][DATA][7] ,
		\latches_in_f[0][DATA][6] ,
		\latches_in_f[0][DATA][5] ,
		\latches_in_f[0][DATA][4] ,
		\latches_in_f[0][DATA][3] ,
		\latches_in_f[0][DATA][2] ,
		\latches_in_f[0][DATA][1] ,
		\latches_in_f[0][DATA][0]  }), 
	.chs_out_b({ \latches_in_b[4][ACK] ,
		\latches_in_b[3][ACK] ,
		\latches_in_b[2][ACK] ,
		\latches_in_b[1][ACK] ,
		\latches_in_b[0][ACK]  }), 
	.FE_OFN1003_preset(FE_OFN1003_preset));
   bundled2LEDR_0 ch_latch_4 (.preset(FE_PHN1408_FE_OCPN1195_preset), 
	.bundled_ch_f({ \latches_in_f[4][REQ] ,
		\latches_in_f[4][DATA][33] ,
		\latches_in_f[4][DATA][32] ,
		\latches_in_f[4][DATA][31] ,
		\latches_in_f[4][DATA][30] ,
		\latches_in_f[4][DATA][29] ,
		\latches_in_f[4][DATA][28] ,
		\latches_in_f[4][DATA][27] ,
		\latches_in_f[4][DATA][26] ,
		\latches_in_f[4][DATA][25] ,
		\latches_in_f[4][DATA][24] ,
		\latches_in_f[4][DATA][23] ,
		\latches_in_f[4][DATA][22] ,
		\latches_in_f[4][DATA][21] ,
		\latches_in_f[4][DATA][20] ,
		\latches_in_f[4][DATA][19] ,
		\latches_in_f[4][DATA][18] ,
		\latches_in_f[4][DATA][17] ,
		\latches_in_f[4][DATA][16] ,
		\latches_in_f[4][DATA][15] ,
		\latches_in_f[4][DATA][14] ,
		\latches_in_f[4][DATA][13] ,
		\latches_in_f[4][DATA][12] ,
		\latches_in_f[4][DATA][11] ,
		\latches_in_f[4][DATA][10] ,
		\latches_in_f[4][DATA][9] ,
		\latches_in_f[4][DATA][8] ,
		\latches_in_f[4][DATA][7] ,
		\latches_in_f[4][DATA][6] ,
		\latches_in_f[4][DATA][5] ,
		\latches_in_f[4][DATA][4] ,
		\latches_in_f[4][DATA][3] ,
		\latches_in_f[4][DATA][2] ,
		\latches_in_f[4][DATA][1] ,
		\latches_in_f[4][DATA][0]  }), 
	.bundled_ch_b(\latches_in_b[4][ACK] ), 
	.LEDR_link_f({ \latches_out_f[4][TOKEN_T] ,
		\latches_out_f[4][TOKEN_PARITY] ,
		\latches_out_f[4][PHIT][32] ,
		\latches_out_f[4][PHIT][31] ,
		\latches_out_f[4][PHIT][30] ,
		\latches_out_f[4][PHIT][29] ,
		\latches_out_f[4][PHIT][28] ,
		\latches_out_f[4][PHIT][27] ,
		\latches_out_f[4][PHIT][26] ,
		\latches_out_f[4][PHIT][25] ,
		\latches_out_f[4][PHIT][24] ,
		\latches_out_f[4][PHIT][23] ,
		\latches_out_f[4][PHIT][22] ,
		\latches_out_f[4][PHIT][21] ,
		\latches_out_f[4][PHIT][20] ,
		\latches_out_f[4][PHIT][19] ,
		\latches_out_f[4][PHIT][18] ,
		\latches_out_f[4][PHIT][17] ,
		\latches_out_f[4][PHIT][16] ,
		\latches_out_f[4][PHIT][15] ,
		\latches_out_f[4][PHIT][14] ,
		\latches_out_f[4][PHIT][13] ,
		\latches_out_f[4][PHIT][12] ,
		\latches_out_f[4][PHIT][11] ,
		\latches_out_f[4][PHIT][10] ,
		\latches_out_f[4][PHIT][9] ,
		\latches_out_f[4][PHIT][8] ,
		\latches_out_f[4][PHIT][7] ,
		\latches_out_f[4][PHIT][6] ,
		\latches_out_f[4][PHIT][5] ,
		\latches_out_f[4][PHIT][4] ,
		\latches_out_f[4][PHIT][3] ,
		\latches_out_f[4][PHIT][2] ,
		\latches_out_f[4][PHIT][1] ,
		\latches_out_f[4][PHIT][0] ,
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
		\latches_out_f[4][PHIT_PARITY][0]  }), 
	.LEDR_link_b(\latches_out_b[4][ACK] ), 
	.FE_OFN0_preset(FE_OFN1003_preset), 
	.FE_OFN2_preset(FE_OFN2_preset), 
	.FE_OFN1038_preset(FE_OFN1038_preset));
   bundled2LEDR_4 ch_latch_3 (.preset(preset), 
	.bundled_ch_f({ \latches_in_f[3][REQ] ,
		\latches_in_f[3][DATA][33] ,
		\latches_in_f[3][DATA][32] ,
		\latches_in_f[3][DATA][31] ,
		\latches_in_f[3][DATA][30] ,
		\latches_in_f[3][DATA][29] ,
		\latches_in_f[3][DATA][28] ,
		\latches_in_f[3][DATA][27] ,
		\latches_in_f[3][DATA][26] ,
		\latches_in_f[3][DATA][25] ,
		\latches_in_f[3][DATA][24] ,
		\latches_in_f[3][DATA][23] ,
		\latches_in_f[3][DATA][22] ,
		\latches_in_f[3][DATA][21] ,
		\latches_in_f[3][DATA][20] ,
		\latches_in_f[3][DATA][19] ,
		\latches_in_f[3][DATA][18] ,
		\latches_in_f[3][DATA][17] ,
		\latches_in_f[3][DATA][16] ,
		\latches_in_f[3][DATA][15] ,
		\latches_in_f[3][DATA][14] ,
		\latches_in_f[3][DATA][13] ,
		\latches_in_f[3][DATA][12] ,
		\latches_in_f[3][DATA][11] ,
		\latches_in_f[3][DATA][10] ,
		\latches_in_f[3][DATA][9] ,
		\latches_in_f[3][DATA][8] ,
		\latches_in_f[3][DATA][7] ,
		\latches_in_f[3][DATA][6] ,
		\latches_in_f[3][DATA][5] ,
		\latches_in_f[3][DATA][4] ,
		\latches_in_f[3][DATA][3] ,
		\latches_in_f[3][DATA][2] ,
		\latches_in_f[3][DATA][1] ,
		\latches_in_f[3][DATA][0]  }), 
	.bundled_ch_b(\latches_in_b[3][ACK] ), 
	.LEDR_link_f({ \latches_out_f[3][TOKEN_T] ,
		\latches_out_f[3][TOKEN_PARITY] ,
		\latches_out_f[3][PHIT][32] ,
		\latches_out_f[3][PHIT][31] ,
		\latches_out_f[3][PHIT][30] ,
		\latches_out_f[3][PHIT][29] ,
		\latches_out_f[3][PHIT][28] ,
		\latches_out_f[3][PHIT][27] ,
		\latches_out_f[3][PHIT][26] ,
		\latches_out_f[3][PHIT][25] ,
		\latches_out_f[3][PHIT][24] ,
		\latches_out_f[3][PHIT][23] ,
		\latches_out_f[3][PHIT][22] ,
		\latches_out_f[3][PHIT][21] ,
		\latches_out_f[3][PHIT][20] ,
		\latches_out_f[3][PHIT][19] ,
		\latches_out_f[3][PHIT][18] ,
		\latches_out_f[3][PHIT][17] ,
		\latches_out_f[3][PHIT][16] ,
		\latches_out_f[3][PHIT][15] ,
		\latches_out_f[3][PHIT][14] ,
		\latches_out_f[3][PHIT][13] ,
		\latches_out_f[3][PHIT][12] ,
		\latches_out_f[3][PHIT][11] ,
		\latches_out_f[3][PHIT][10] ,
		\latches_out_f[3][PHIT][9] ,
		\latches_out_f[3][PHIT][8] ,
		\latches_out_f[3][PHIT][7] ,
		\latches_out_f[3][PHIT][6] ,
		\latches_out_f[3][PHIT][5] ,
		\latches_out_f[3][PHIT][4] ,
		\latches_out_f[3][PHIT][3] ,
		\latches_out_f[3][PHIT][2] ,
		\latches_out_f[3][PHIT][1] ,
		\latches_out_f[3][PHIT][0] ,
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
		\latches_out_f[3][PHIT_PARITY][0]  }), 
	.LEDR_link_b(\latches_out_b[3][ACK] ), 
	.FE_OFN0_preset(FE_OFN1003_preset), 
	.FE_OFN2_preset(FE_OFN2_preset), 
	.FE_OFN1038_preset(FE_OFN1038_preset), 
	.FE_PHN1408_FE_OCPN1195_preset(FE_PHN1436_FE_OCPN1195_preset));
   bundled2LEDR_3 ch_latch_2 (.preset(FE_OFN1003_preset), 
	.bundled_ch_f({ \latches_in_f[2][REQ] ,
		\latches_in_f[2][DATA][33] ,
		\latches_in_f[2][DATA][32] ,
		\latches_in_f[2][DATA][31] ,
		\latches_in_f[2][DATA][30] ,
		\latches_in_f[2][DATA][29] ,
		\latches_in_f[2][DATA][28] ,
		\latches_in_f[2][DATA][27] ,
		\latches_in_f[2][DATA][26] ,
		\latches_in_f[2][DATA][25] ,
		\latches_in_f[2][DATA][24] ,
		\latches_in_f[2][DATA][23] ,
		\latches_in_f[2][DATA][22] ,
		\latches_in_f[2][DATA][21] ,
		\latches_in_f[2][DATA][20] ,
		\latches_in_f[2][DATA][19] ,
		\latches_in_f[2][DATA][18] ,
		\latches_in_f[2][DATA][17] ,
		\latches_in_f[2][DATA][16] ,
		\latches_in_f[2][DATA][15] ,
		\latches_in_f[2][DATA][14] ,
		\latches_in_f[2][DATA][13] ,
		\latches_in_f[2][DATA][12] ,
		\latches_in_f[2][DATA][11] ,
		\latches_in_f[2][DATA][10] ,
		\latches_in_f[2][DATA][9] ,
		\latches_in_f[2][DATA][8] ,
		\latches_in_f[2][DATA][7] ,
		\latches_in_f[2][DATA][6] ,
		\latches_in_f[2][DATA][5] ,
		\latches_in_f[2][DATA][4] ,
		\latches_in_f[2][DATA][3] ,
		\latches_in_f[2][DATA][2] ,
		\latches_in_f[2][DATA][1] ,
		\latches_in_f[2][DATA][0]  }), 
	.bundled_ch_b(\latches_in_b[2][ACK] ), 
	.LEDR_link_f({ \latches_out_f[2][TOKEN_T] ,
		\latches_out_f[2][TOKEN_PARITY] ,
		\latches_out_f[2][PHIT][32] ,
		\latches_out_f[2][PHIT][31] ,
		\latches_out_f[2][PHIT][30] ,
		\latches_out_f[2][PHIT][29] ,
		\latches_out_f[2][PHIT][28] ,
		\latches_out_f[2][PHIT][27] ,
		\latches_out_f[2][PHIT][26] ,
		\latches_out_f[2][PHIT][25] ,
		\latches_out_f[2][PHIT][24] ,
		\latches_out_f[2][PHIT][23] ,
		\latches_out_f[2][PHIT][22] ,
		\latches_out_f[2][PHIT][21] ,
		\latches_out_f[2][PHIT][20] ,
		\latches_out_f[2][PHIT][19] ,
		\latches_out_f[2][PHIT][18] ,
		\latches_out_f[2][PHIT][17] ,
		\latches_out_f[2][PHIT][16] ,
		\latches_out_f[2][PHIT][15] ,
		\latches_out_f[2][PHIT][14] ,
		\latches_out_f[2][PHIT][13] ,
		\latches_out_f[2][PHIT][12] ,
		\latches_out_f[2][PHIT][11] ,
		\latches_out_f[2][PHIT][10] ,
		\latches_out_f[2][PHIT][9] ,
		\latches_out_f[2][PHIT][8] ,
		\latches_out_f[2][PHIT][7] ,
		\latches_out_f[2][PHIT][6] ,
		\latches_out_f[2][PHIT][5] ,
		\latches_out_f[2][PHIT][4] ,
		\latches_out_f[2][PHIT][3] ,
		\latches_out_f[2][PHIT][2] ,
		\latches_out_f[2][PHIT][1] ,
		\latches_out_f[2][PHIT][0] ,
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
		\latches_out_f[2][PHIT_PARITY][0]  }), 
	.LEDR_link_b(\latches_out_b[2][ACK] ), 
	.FE_OFN2_preset(FE_OFN2_preset));
   bundled2LEDR_2 ch_latch_1 (.preset(FE_OFN1003_preset), 
	.bundled_ch_f({ \latches_in_f[1][REQ] ,
		\latches_in_f[1][DATA][33] ,
		\latches_in_f[1][DATA][32] ,
		\latches_in_f[1][DATA][31] ,
		\latches_in_f[1][DATA][30] ,
		\latches_in_f[1][DATA][29] ,
		\latches_in_f[1][DATA][28] ,
		\latches_in_f[1][DATA][27] ,
		\latches_in_f[1][DATA][26] ,
		\latches_in_f[1][DATA][25] ,
		\latches_in_f[1][DATA][24] ,
		\latches_in_f[1][DATA][23] ,
		\latches_in_f[1][DATA][22] ,
		\latches_in_f[1][DATA][21] ,
		\latches_in_f[1][DATA][20] ,
		\latches_in_f[1][DATA][19] ,
		\latches_in_f[1][DATA][18] ,
		\latches_in_f[1][DATA][17] ,
		\latches_in_f[1][DATA][16] ,
		\latches_in_f[1][DATA][15] ,
		\latches_in_f[1][DATA][14] ,
		\latches_in_f[1][DATA][13] ,
		\latches_in_f[1][DATA][12] ,
		\latches_in_f[1][DATA][11] ,
		\latches_in_f[1][DATA][10] ,
		\latches_in_f[1][DATA][9] ,
		\latches_in_f[1][DATA][8] ,
		\latches_in_f[1][DATA][7] ,
		\latches_in_f[1][DATA][6] ,
		\latches_in_f[1][DATA][5] ,
		\latches_in_f[1][DATA][4] ,
		\latches_in_f[1][DATA][3] ,
		\latches_in_f[1][DATA][2] ,
		\latches_in_f[1][DATA][1] ,
		\latches_in_f[1][DATA][0]  }), 
	.bundled_ch_b(\latches_in_b[1][ACK] ), 
	.LEDR_link_f({ \latches_out_f[1][TOKEN_T] ,
		\latches_out_f[1][TOKEN_PARITY] ,
		\latches_out_f[1][PHIT][32] ,
		\latches_out_f[1][PHIT][31] ,
		\latches_out_f[1][PHIT][30] ,
		\latches_out_f[1][PHIT][29] ,
		\latches_out_f[1][PHIT][28] ,
		\latches_out_f[1][PHIT][27] ,
		\latches_out_f[1][PHIT][26] ,
		\latches_out_f[1][PHIT][25] ,
		\latches_out_f[1][PHIT][24] ,
		\latches_out_f[1][PHIT][23] ,
		\latches_out_f[1][PHIT][22] ,
		\latches_out_f[1][PHIT][21] ,
		\latches_out_f[1][PHIT][20] ,
		\latches_out_f[1][PHIT][19] ,
		\latches_out_f[1][PHIT][18] ,
		\latches_out_f[1][PHIT][17] ,
		\latches_out_f[1][PHIT][16] ,
		\latches_out_f[1][PHIT][15] ,
		\latches_out_f[1][PHIT][14] ,
		\latches_out_f[1][PHIT][13] ,
		\latches_out_f[1][PHIT][12] ,
		\latches_out_f[1][PHIT][11] ,
		\latches_out_f[1][PHIT][10] ,
		\latches_out_f[1][PHIT][9] ,
		\latches_out_f[1][PHIT][8] ,
		\latches_out_f[1][PHIT][7] ,
		\latches_out_f[1][PHIT][6] ,
		\latches_out_f[1][PHIT][5] ,
		\latches_out_f[1][PHIT][4] ,
		\latches_out_f[1][PHIT][3] ,
		\latches_out_f[1][PHIT][2] ,
		\latches_out_f[1][PHIT][1] ,
		\latches_out_f[1][PHIT][0] ,
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
		\latches_out_f[1][PHIT_PARITY][0]  }), 
	.LEDR_link_b(\latches_out_b[1][ACK] ), 
	.FE_OFN2_preset(FE_OFN2_preset));
   bundled2LEDR_1 ch_latch_0 (.preset(FE_OFN1038_preset), 
	.bundled_ch_f({ \latches_in_f[0][REQ] ,
		\latches_in_f[0][DATA][33] ,
		\latches_in_f[0][DATA][32] ,
		\latches_in_f[0][DATA][31] ,
		\latches_in_f[0][DATA][30] ,
		\latches_in_f[0][DATA][29] ,
		\latches_in_f[0][DATA][28] ,
		\latches_in_f[0][DATA][27] ,
		\latches_in_f[0][DATA][26] ,
		\latches_in_f[0][DATA][25] ,
		\latches_in_f[0][DATA][24] ,
		\latches_in_f[0][DATA][23] ,
		\latches_in_f[0][DATA][22] ,
		\latches_in_f[0][DATA][21] ,
		\latches_in_f[0][DATA][20] ,
		\latches_in_f[0][DATA][19] ,
		\latches_in_f[0][DATA][18] ,
		\latches_in_f[0][DATA][17] ,
		\latches_in_f[0][DATA][16] ,
		\latches_in_f[0][DATA][15] ,
		\latches_in_f[0][DATA][14] ,
		\latches_in_f[0][DATA][13] ,
		\latches_in_f[0][DATA][12] ,
		\latches_in_f[0][DATA][11] ,
		\latches_in_f[0][DATA][10] ,
		\latches_in_f[0][DATA][9] ,
		\latches_in_f[0][DATA][8] ,
		\latches_in_f[0][DATA][7] ,
		\latches_in_f[0][DATA][6] ,
		\latches_in_f[0][DATA][5] ,
		\latches_in_f[0][DATA][4] ,
		\latches_in_f[0][DATA][3] ,
		\latches_in_f[0][DATA][2] ,
		\latches_in_f[0][DATA][1] ,
		\latches_in_f[0][DATA][0]  }), 
	.bundled_ch_b(\latches_in_b[0][ACK] ), 
	.LEDR_link_f({ \latches_out_f[0][TOKEN_T] ,
		\latches_out_f[0][TOKEN_PARITY] ,
		\latches_out_f[0][PHIT][32] ,
		\latches_out_f[0][PHIT][31] ,
		\latches_out_f[0][PHIT][30] ,
		\latches_out_f[0][PHIT][29] ,
		\latches_out_f[0][PHIT][28] ,
		\latches_out_f[0][PHIT][27] ,
		\latches_out_f[0][PHIT][26] ,
		\latches_out_f[0][PHIT][25] ,
		\latches_out_f[0][PHIT][24] ,
		\latches_out_f[0][PHIT][23] ,
		\latches_out_f[0][PHIT][22] ,
		\latches_out_f[0][PHIT][21] ,
		\latches_out_f[0][PHIT][20] ,
		\latches_out_f[0][PHIT][19] ,
		\latches_out_f[0][PHIT][18] ,
		\latches_out_f[0][PHIT][17] ,
		\latches_out_f[0][PHIT][16] ,
		\latches_out_f[0][PHIT][15] ,
		\latches_out_f[0][PHIT][14] ,
		\latches_out_f[0][PHIT][13] ,
		\latches_out_f[0][PHIT][12] ,
		\latches_out_f[0][PHIT][11] ,
		\latches_out_f[0][PHIT][10] ,
		\latches_out_f[0][PHIT][9] ,
		\latches_out_f[0][PHIT][8] ,
		\latches_out_f[0][PHIT][7] ,
		\latches_out_f[0][PHIT][6] ,
		\latches_out_f[0][PHIT][5] ,
		\latches_out_f[0][PHIT][4] ,
		\latches_out_f[0][PHIT][3] ,
		\latches_out_f[0][PHIT][2] ,
		\latches_out_f[0][PHIT][1] ,
		\latches_out_f[0][PHIT][0] ,
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
		\latches_out_f[0][PHIT_PARITY][0]  }), 
	.LEDR_link_b(\latches_out_b[0][ACK] ), 
	.FE_OFN0_preset(FE_OFN1003_preset), 
	.FE_OFN2_preset(FE_OFN2_preset), 
	.FE_PHN1407_FE_OFN1003_preset(FE_PHN1407_FE_OFN1003_preset), 
	.FE_PHN1448_FE_OFN1003_preset(FE_PHN1448_FE_OFN1003_preset));
endmodule

module select_element_1 (
	preset, 
	\input , 
	true, 
	false, 
	sel);
   input preset;
   input \input ;
   output true;
   output false;
   input sel;

   // Internal wires
   wire n1;
   wire n2;
   wire n3;

   HS65_LS_LDHRQX9 true_latch_out_reg (.RN(n3), 
	.Q(true), 
	.G(sel), 
	.D(n1));
   HS65_LS_LDLRQX9 false_latch_out_reg (.RN(n3), 
	.Q(false), 
	.GN(sel), 
	.D(n2));
   HS65_LSS_XOR2X6 U3 (.Z(n1), 
	.B(false), 
	.A(\input ));
   HS65_LS_IVX9 U4 (.Z(n3), 
	.A(preset));
   HS65_LSS_XOR2X6 U5 (.Z(n2), 
	.B(true), 
	.A(\input ));
endmodule

module sr_latch_0_12 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire N1;
   wire n1;

   HS65_LS_AND2X18 C8 (.Z(q), 
	.B(N1), 
	.A(n1));
   HS65_LS_IVX9 U1 (.Z(N1), 
	.A(qn));
   HS65_LS_IVX9 U2 (.Z(n1), 
	.A(r));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_0_11 (
	preset, 
	a, 
	b, 
	c);
   input preset;
   input a;
   input b;
   output c;

   // Internal wires
   wire set;
   wire reset;
   wire n1;

   HS65_LS_OAI12X12 FE_RC_151_0 (.Z(reset), 
	.C(n1), 
	.B(b), 
	.A(a));
   sr_latch_0_12 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LH_AND3X4 U4 (.Z(set), 
	.C(a), 
	.B(n1), 
	.A(b));
   HS65_LS_IVX9 U5 (.Z(n1), 
	.A(preset));
endmodule

module sr_latch_0_11 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire N1;
   wire n1;

   HS65_LS_AND2X27 C8 (.Z(q), 
	.B(N1), 
	.A(n1));
   HS65_LS_IVX9 U1 (.Z(n1), 
	.A(r));
   HS65_LS_IVX9 U2 (.Z(N1), 
	.A(qn));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_generic_0_33_1 (
	preset, 
	\input , 
	\output , 
	FE_OFN999_preset);
   input preset;
   input [32:0] \input ;
   output \output ;
   input FE_OFN999_preset;

   // Internal wires
   wire FE_RN_1071_0;
   wire FE_RN_889_0;
   wire FE_RN_848_0;
   wire FE_RN_847_0;
   wire FE_RN_846_0;
   wire FE_RN_845_0;
   wire FE_RN_844_0;
   wire FE_RN_843_0;
   wire FE_RN_842_0;
   wire FE_RN_841_0;
   wire FE_RN_840_0;
   wire FE_RN_839_0;
   wire FE_RN_838_0;
   wire FE_RN_837_0;
   wire FE_RN_836_0;
   wire FE_RN_835_0;
   wire FE_RN_834_0;
   wire FE_RN_833_0;
   wire FE_RN_832_0;
   wire FE_RN_831_0;
   wire FE_RN_830_0;
   wire FE_RN_829_0;
   wire FE_RN_828_0;
   wire FE_RN_827_0;
   wire FE_RN_826_0;
   wire FE_RN_825_0;
   wire FE_RN_824_0;
   wire FE_RN_823_0;
   wire set;
   wire reset;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n70;
   wire n71;
   wire n72;
   wire n73;
   wire n74;
   wire n75;

   HS65_LS_CNNAND2X18 FE_RC_1407_0 (.Z(FE_RN_1071_0), 
	.B(FE_RN_830_0), 
	.A(n73));
   HS65_LS_NOR3X13 FE_RC_1406_0 (.Z(FE_RN_825_0), 
	.C(FE_RN_826_0), 
	.B(FE_RN_829_0), 
	.A(FE_RN_1071_0));
   HS65_LS_CNNAND2X18 FE_RC_1169_0 (.Z(FE_RN_889_0), 
	.B(FE_RN_848_0), 
	.A(n69));
   HS65_LS_NOR3X13 FE_RC_1168_0 (.Z(FE_RN_844_0), 
	.C(FE_RN_889_0), 
	.B(FE_RN_846_0), 
	.A(FE_RN_845_0));
   HS65_LS_CNNOR2X24 FE_RC_1123_0 (.Z(FE_RN_848_0), 
	.B(\input [12]), 
	.A(\input [11]));
   HS65_LS_CNNOR2X24 FE_RC_1122_0 (.Z(FE_RN_847_0), 
	.B(\input [22]), 
	.A(\input [23]));
   HS65_LS_CNNAND2X18 FE_RC_1121_0 (.Z(FE_RN_846_0), 
	.B(FE_RN_847_0), 
	.A(n71));
   HS65_LS_CNNAND2X18 FE_RC_1120_0 (.Z(FE_RN_845_0), 
	.B(n65), 
	.A(n61));
   HS65_LS_CNNOR2X24 FE_RC_1118_0 (.Z(FE_RN_843_0), 
	.B(\input [19]), 
	.A(\input [1]));
   HS65_LS_CNNAND2X18 FE_RC_1117_0 (.Z(FE_RN_842_0), 
	.B(FE_RN_843_0), 
	.A(n67));
   HS65_LS_CNNOR2X24 FE_RC_1116_0 (.Z(FE_RN_841_0), 
	.B(\input [16]), 
	.A(\input [15]));
   HS65_LS_CNNAND2X18 FE_RC_1115_0 (.Z(FE_RN_840_0), 
	.B(FE_RN_841_0), 
	.A(n68));
   HS65_LS_NOR4ABX18 FE_RC_1114_0 (.Z(FE_RN_839_0), 
	.D(FE_RN_840_0), 
	.C(FE_RN_842_0), 
	.B(n66), 
	.A(n70));
   HS65_LS_CNNAND2X18 FE_RC_1113_0 (.Z(FE_RN_838_0), 
	.B(FE_RN_839_0), 
	.A(FE_RN_844_0));
   HS65_LS_CNNAND2X18 FE_RC_1112_0 (.Z(FE_RN_837_0), 
	.B(n75), 
	.A(n74));
   HS65_LS_NOR3X18 FE_RC_1111_0 (.Z(FE_RN_836_0), 
	.C(FE_RN_837_0), 
	.B(\input [3]), 
	.A(\input [4]));
   HS65_LS_CNIVX21 FE_RC_1110_0 (.Z(FE_RN_835_0), 
	.A(\input [7]));
   HS65_LS_CNNAND2X24 FE_RC_1109_0 (.Z(FE_RN_834_0), 
	.B(n62), 
	.A(FE_RN_835_0));
   HS65_LS_CNNOR2X24 FE_RC_1108_0 (.Z(FE_RN_833_0), 
	.B(\input [9]), 
	.A(\input [8]));
   HS65_LS_NAND2X29 FE_RC_1107_0 (.Z(FE_RN_832_0), 
	.B(FE_RN_833_0), 
	.A(n63));
   HS65_LS_CNNOR2X15 FE_RC_1106_0 (.Z(FE_RN_831_0), 
	.B(FE_RN_832_0), 
	.A(FE_RN_834_0));
   HS65_LS_CNIVX21 FE_RC_1105_0 (.Z(FE_RN_830_0), 
	.A(\input [30]));
   HS65_LS_CNNAND2AX18 FE_RC_1104_0 (.Z(FE_RN_829_0), 
	.B(n72), 
	.A(\input [2]));
   HS65_LS_CNNOR2X15 FE_RC_1103_0 (.Z(FE_RN_828_0), 
	.B(\input [24]), 
	.A(\input [27]));
   HS65_LS_CNNOR2X24 FE_RC_1102_0 (.Z(FE_RN_827_0), 
	.B(\input [25]), 
	.A(\input [26]));
   HS65_LS_CNNAND2X18 FE_RC_1101_0 (.Z(FE_RN_826_0), 
	.B(FE_RN_827_0), 
	.A(FE_RN_828_0));
   HS65_LS_NAND3X13 FE_RC_1099_0 (.Z(FE_RN_824_0), 
	.C(FE_RN_825_0), 
	.B(FE_RN_831_0), 
	.A(FE_RN_836_0));
   HS65_LS_CNIVX14 FE_RC_1098_0 (.Z(FE_RN_823_0), 
	.A(preset));
   HS65_LS_OAI12X9 FE_RC_1097_0 (.Z(reset), 
	.C(FE_RN_823_0), 
	.B(FE_RN_824_0), 
	.A(FE_RN_838_0));
   sr_latch_0_11 latch (.s(set), 
	.r(reset), 
	.q(\output ));
   HS65_LH_NOR4ABX2 U3 (.Z(n60), 
	.D(n71), 
	.C(n70), 
	.B(\input [22]), 
	.A(\input [23]));
   HS65_LH_NOR4ABX2 U5 (.Z(n52), 
	.D(n73), 
	.C(n74), 
	.B(\input [30]), 
	.A(\input [2]));
   HS65_LS_CNIVX27 U15 (.Z(n68), 
	.A(\input [17]));
   HS65_LS_CNIVX27 U16 (.Z(n70), 
	.A(\input [20]));
   HS65_LS_CNIVX27 U18 (.Z(n72), 
	.A(\input [28]));
   HS65_LS_CNIVX27 U19 (.Z(n69), 
	.A(\input [18]));
   HS65_LS_CNIVX34 U20 (.Z(n71), 
	.A(\input [21]));
   HS65_LS_CNIVX27 U21 (.Z(n73), 
	.A(\input [29]));
   HS65_LS_CNIVX34 U22 (.Z(n62), 
	.A(\input [5]));
   HS65_LS_CNIVX27 U23 (.Z(n63), 
	.A(\input [6]));
   HS65_LS_CNIVX27 U24 (.Z(n66), 
	.A(\input [13]));
   HS65_LS_CNIVX34 U25 (.Z(n74), 
	.A(\input [31]));
   HS65_LS_CNIVX27 U26 (.Z(n65), 
	.A(\input [10]));
   HS65_LS_CNIVX27 U27 (.Z(n61), 
	.A(\input [0]));
   HS65_LS_CNIVX27 U28 (.Z(n67), 
	.A(\input [14]));
   HS65_LS_CNIVX34 U29 (.Z(n75), 
	.A(\input [32]));
   HS65_LS_NOR3X4 U31 (.Z(n56), 
	.C(n61), 
	.B(FE_OFN999_preset), 
	.A(n65));
   HS65_LS_NOR3AX2 U32 (.Z(n51), 
	.C(n72), 
	.B(n50), 
	.A(\input [27]));
   HS65_LS_NOR4ABX2 U34 (.Z(n59), 
	.D(n69), 
	.C(n68), 
	.B(\input [19]), 
	.A(\input [1]));
   HS65_LS_NOR4ABX2 U35 (.Z(set), 
	.D(n57), 
	.C(n58), 
	.B(n59), 
	.A(n60));
   HS65_LS_NAND4ABX3 U36 (.Z(n58), 
	.D(n51), 
	.C(n52), 
	.B(n53), 
	.A(n54));
   HS65_LS_NOR4ABX2 U37 (.Z(n55), 
	.D(n67), 
	.C(n66), 
	.B(\input [15]), 
	.A(\input [16]));
   HS65_LS_NAND3X5 U38 (.Z(n50), 
	.C(\input [26]), 
	.B(\input [24]), 
	.A(\input [25]));
   HS65_LS_NAND4ABX3 U39 (.Z(n54), 
	.D(\input [4]), 
	.C(\input [3]), 
	.B(n62), 
	.A(n75));
   HS65_LS_NAND4ABX3 U40 (.Z(n53), 
	.D(\input [8]), 
	.C(\input [7]), 
	.B(n64), 
	.A(n63));
   HS65_LS_NAND4X9 U41 (.Z(n57), 
	.D(n55), 
	.C(n56), 
	.B(\input [12]), 
	.A(\input [11]));
   HS65_LS_IVX9 U42 (.Z(n64), 
	.A(\input [9]));
endmodule

module sr_latch_0_6 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire FE_PHN1417_n1;
   wire N1;
   wire n1;

   HS65_LH_DLYIC2X9 FE_PHC1417_n1 (.Z(FE_PHN1417_n1), 
	.A(n1));
   HS65_LH_AND2X4 C8 (.Z(q), 
	.B(N1), 
	.A(FE_PHN1417_n1));
   HS65_LH_IVX62 U1 (.Z(n1), 
	.A(r));
   HS65_LS_IVX9 U2 (.Z(N1), 
	.A(qn));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_0_6 (
	preset, 
	a, 
	b, 
	c);
   input preset;
   input a;
   input b;
   output c;

   // Internal wires
   wire set;
   wire reset;
   wire n1;

   sr_latch_0_6 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_OAI12X3 U3 (.Z(reset), 
	.C(n1), 
	.B(a), 
	.A(b));
   HS65_LS_IVX9 U4 (.Z(n1), 
	.A(preset));
   HS65_LS_AND3X9 U5 (.Z(set), 
	.C(a), 
	.B(n1), 
	.A(b));
endmodule

module latch_controller_1_6 (
	preset, 
	Rin, 
	Aout, 
	Rout, 
	Ain, 
	lt_en);
   input preset;
   input Rin;
   output Aout;
   output Rout;
   input Ain;
   output lt_en;

   // Internal wires
   wire FE_PHN1401_d;
   wire not_Ain;
   wire d;

   HS65_LH_DLYIC4X9 FE_PHC1401_d (.Z(FE_PHN1401_d), 
	.A(d));
   c_gate_0_6 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Rout));
   HS65_LS_IVX9 I_1 (.Z(Aout), 
	.A(FE_PHN1401_d));
   HS65_LS_IVX9 I_0 (.Z(not_Ain), 
	.A(Ain));
   HS65_LH_IVX2 I_2 (.Z(d), 
	.A(Rout));
   HS65_LSS_XOR2X6 U5 (.Z(lt_en), 
	.B(Ain), 
	.A(Rout));
endmodule

module LEDR2bundled_1_000000000_1 (
	preset, 
	.LEDR_link_f ( { \LEDR_link_f[TOKEN_T] , 
		\LEDR_link_f[TOKEN_PARITY] , 
		\LEDR_link_f[PHIT][32] , 
		\LEDR_link_f[PHIT][31] , 
		\LEDR_link_f[PHIT][30] , 
		\LEDR_link_f[PHIT][29] , 
		\LEDR_link_f[PHIT][28] , 
		\LEDR_link_f[PHIT][27] , 
		\LEDR_link_f[PHIT][26] , 
		\LEDR_link_f[PHIT][25] , 
		\LEDR_link_f[PHIT][24] , 
		\LEDR_link_f[PHIT][23] , 
		\LEDR_link_f[PHIT][22] , 
		\LEDR_link_f[PHIT][21] , 
		\LEDR_link_f[PHIT][20] , 
		\LEDR_link_f[PHIT][19] , 
		\LEDR_link_f[PHIT][18] , 
		\LEDR_link_f[PHIT][17] , 
		\LEDR_link_f[PHIT][16] , 
		\LEDR_link_f[PHIT][15] , 
		\LEDR_link_f[PHIT][14] , 
		\LEDR_link_f[PHIT][13] , 
		\LEDR_link_f[PHIT][12] , 
		\LEDR_link_f[PHIT][11] , 
		\LEDR_link_f[PHIT][10] , 
		\LEDR_link_f[PHIT][9] , 
		\LEDR_link_f[PHIT][8] , 
		\LEDR_link_f[PHIT][7] , 
		\LEDR_link_f[PHIT][6] , 
		\LEDR_link_f[PHIT][5] , 
		\LEDR_link_f[PHIT][4] , 
		\LEDR_link_f[PHIT][3] , 
		\LEDR_link_f[PHIT][2] , 
		\LEDR_link_f[PHIT][1] , 
		\LEDR_link_f[PHIT][0] , 
		\LEDR_link_f[PHIT_PARITY][32] , 
		\LEDR_link_f[PHIT_PARITY][31] , 
		\LEDR_link_f[PHIT_PARITY][30] , 
		\LEDR_link_f[PHIT_PARITY][29] , 
		\LEDR_link_f[PHIT_PARITY][28] , 
		\LEDR_link_f[PHIT_PARITY][27] , 
		\LEDR_link_f[PHIT_PARITY][26] , 
		\LEDR_link_f[PHIT_PARITY][25] , 
		\LEDR_link_f[PHIT_PARITY][24] , 
		\LEDR_link_f[PHIT_PARITY][23] , 
		\LEDR_link_f[PHIT_PARITY][22] , 
		\LEDR_link_f[PHIT_PARITY][21] , 
		\LEDR_link_f[PHIT_PARITY][20] , 
		\LEDR_link_f[PHIT_PARITY][19] , 
		\LEDR_link_f[PHIT_PARITY][18] , 
		\LEDR_link_f[PHIT_PARITY][17] , 
		\LEDR_link_f[PHIT_PARITY][16] , 
		\LEDR_link_f[PHIT_PARITY][15] , 
		\LEDR_link_f[PHIT_PARITY][14] , 
		\LEDR_link_f[PHIT_PARITY][13] , 
		\LEDR_link_f[PHIT_PARITY][12] , 
		\LEDR_link_f[PHIT_PARITY][11] , 
		\LEDR_link_f[PHIT_PARITY][10] , 
		\LEDR_link_f[PHIT_PARITY][9] , 
		\LEDR_link_f[PHIT_PARITY][8] , 
		\LEDR_link_f[PHIT_PARITY][7] , 
		\LEDR_link_f[PHIT_PARITY][6] , 
		\LEDR_link_f[PHIT_PARITY][5] , 
		\LEDR_link_f[PHIT_PARITY][4] , 
		\LEDR_link_f[PHIT_PARITY][3] , 
		\LEDR_link_f[PHIT_PARITY][2] , 
		\LEDR_link_f[PHIT_PARITY][1] , 
		\LEDR_link_f[PHIT_PARITY][0]  } ), 
	.LEDR_link_b ( \LEDR_link_b[ACK]  ), 
	.bundled_ch_f ( { \bundled_ch_f[REQ] , 
		\bundled_ch_f[DATA][33] , 
		\bundled_ch_f[DATA][32] , 
		\bundled_ch_f[DATA][31] , 
		\bundled_ch_f[DATA][30] , 
		\bundled_ch_f[DATA][29] , 
		\bundled_ch_f[DATA][28] , 
		\bundled_ch_f[DATA][27] , 
		\bundled_ch_f[DATA][26] , 
		\bundled_ch_f[DATA][25] , 
		\bundled_ch_f[DATA][24] , 
		\bundled_ch_f[DATA][23] , 
		\bundled_ch_f[DATA][22] , 
		\bundled_ch_f[DATA][21] , 
		\bundled_ch_f[DATA][20] , 
		\bundled_ch_f[DATA][19] , 
		\bundled_ch_f[DATA][18] , 
		\bundled_ch_f[DATA][17] , 
		\bundled_ch_f[DATA][16] , 
		\bundled_ch_f[DATA][15] , 
		\bundled_ch_f[DATA][14] , 
		\bundled_ch_f[DATA][13] , 
		\bundled_ch_f[DATA][12] , 
		\bundled_ch_f[DATA][11] , 
		\bundled_ch_f[DATA][10] , 
		\bundled_ch_f[DATA][9] , 
		\bundled_ch_f[DATA][8] , 
		\bundled_ch_f[DATA][7] , 
		\bundled_ch_f[DATA][6] , 
		\bundled_ch_f[DATA][5] , 
		\bundled_ch_f[DATA][4] , 
		\bundled_ch_f[DATA][3] , 
		\bundled_ch_f[DATA][2] , 
		\bundled_ch_f[DATA][1] , 
		\bundled_ch_f[DATA][0]  } ), 
	.bundled_ch_b ( \bundled_ch_b[ACK]  ), 
	FE_OFN997_preset, 
	FE_OFN998_preset, 
	FE_OFN999_preset);
   input preset;
   input \LEDR_link_f[TOKEN_T] ;
   input \LEDR_link_f[TOKEN_PARITY] ;
   input \LEDR_link_f[PHIT][32] ;
   input \LEDR_link_f[PHIT][31] ;
   input \LEDR_link_f[PHIT][30] ;
   input \LEDR_link_f[PHIT][29] ;
   input \LEDR_link_f[PHIT][28] ;
   input \LEDR_link_f[PHIT][27] ;
   input \LEDR_link_f[PHIT][26] ;
   input \LEDR_link_f[PHIT][25] ;
   input \LEDR_link_f[PHIT][24] ;
   input \LEDR_link_f[PHIT][23] ;
   input \LEDR_link_f[PHIT][22] ;
   input \LEDR_link_f[PHIT][21] ;
   input \LEDR_link_f[PHIT][20] ;
   input \LEDR_link_f[PHIT][19] ;
   input \LEDR_link_f[PHIT][18] ;
   input \LEDR_link_f[PHIT][17] ;
   input \LEDR_link_f[PHIT][16] ;
   input \LEDR_link_f[PHIT][15] ;
   input \LEDR_link_f[PHIT][14] ;
   input \LEDR_link_f[PHIT][13] ;
   input \LEDR_link_f[PHIT][12] ;
   input \LEDR_link_f[PHIT][11] ;
   input \LEDR_link_f[PHIT][10] ;
   input \LEDR_link_f[PHIT][9] ;
   input \LEDR_link_f[PHIT][8] ;
   input \LEDR_link_f[PHIT][7] ;
   input \LEDR_link_f[PHIT][6] ;
   input \LEDR_link_f[PHIT][5] ;
   input \LEDR_link_f[PHIT][4] ;
   input \LEDR_link_f[PHIT][3] ;
   input \LEDR_link_f[PHIT][2] ;
   input \LEDR_link_f[PHIT][1] ;
   input \LEDR_link_f[PHIT][0] ;
   input \LEDR_link_f[PHIT_PARITY][32] ;
   input \LEDR_link_f[PHIT_PARITY][31] ;
   input \LEDR_link_f[PHIT_PARITY][30] ;
   input \LEDR_link_f[PHIT_PARITY][29] ;
   input \LEDR_link_f[PHIT_PARITY][28] ;
   input \LEDR_link_f[PHIT_PARITY][27] ;
   input \LEDR_link_f[PHIT_PARITY][26] ;
   input \LEDR_link_f[PHIT_PARITY][25] ;
   input \LEDR_link_f[PHIT_PARITY][24] ;
   input \LEDR_link_f[PHIT_PARITY][23] ;
   input \LEDR_link_f[PHIT_PARITY][22] ;
   input \LEDR_link_f[PHIT_PARITY][21] ;
   input \LEDR_link_f[PHIT_PARITY][20] ;
   input \LEDR_link_f[PHIT_PARITY][19] ;
   input \LEDR_link_f[PHIT_PARITY][18] ;
   input \LEDR_link_f[PHIT_PARITY][17] ;
   input \LEDR_link_f[PHIT_PARITY][16] ;
   input \LEDR_link_f[PHIT_PARITY][15] ;
   input \LEDR_link_f[PHIT_PARITY][14] ;
   input \LEDR_link_f[PHIT_PARITY][13] ;
   input \LEDR_link_f[PHIT_PARITY][12] ;
   input \LEDR_link_f[PHIT_PARITY][11] ;
   input \LEDR_link_f[PHIT_PARITY][10] ;
   input \LEDR_link_f[PHIT_PARITY][9] ;
   input \LEDR_link_f[PHIT_PARITY][8] ;
   input \LEDR_link_f[PHIT_PARITY][7] ;
   input \LEDR_link_f[PHIT_PARITY][6] ;
   input \LEDR_link_f[PHIT_PARITY][5] ;
   input \LEDR_link_f[PHIT_PARITY][4] ;
   input \LEDR_link_f[PHIT_PARITY][3] ;
   input \LEDR_link_f[PHIT_PARITY][2] ;
   input \LEDR_link_f[PHIT_PARITY][1] ;
   input \LEDR_link_f[PHIT_PARITY][0] ;
   output \LEDR_link_b[ACK] ;
   output \bundled_ch_f[REQ] ;
   output \bundled_ch_f[DATA][33] ;
   output \bundled_ch_f[DATA][32] ;
   output \bundled_ch_f[DATA][31] ;
   output \bundled_ch_f[DATA][30] ;
   output \bundled_ch_f[DATA][29] ;
   output \bundled_ch_f[DATA][28] ;
   output \bundled_ch_f[DATA][27] ;
   output \bundled_ch_f[DATA][26] ;
   output \bundled_ch_f[DATA][25] ;
   output \bundled_ch_f[DATA][24] ;
   output \bundled_ch_f[DATA][23] ;
   output \bundled_ch_f[DATA][22] ;
   output \bundled_ch_f[DATA][21] ;
   output \bundled_ch_f[DATA][20] ;
   output \bundled_ch_f[DATA][19] ;
   output \bundled_ch_f[DATA][18] ;
   output \bundled_ch_f[DATA][17] ;
   output \bundled_ch_f[DATA][16] ;
   output \bundled_ch_f[DATA][15] ;
   output \bundled_ch_f[DATA][14] ;
   output \bundled_ch_f[DATA][13] ;
   output \bundled_ch_f[DATA][12] ;
   output \bundled_ch_f[DATA][11] ;
   output \bundled_ch_f[DATA][10] ;
   output \bundled_ch_f[DATA][9] ;
   output \bundled_ch_f[DATA][8] ;
   output \bundled_ch_f[DATA][7] ;
   output \bundled_ch_f[DATA][6] ;
   output \bundled_ch_f[DATA][5] ;
   output \bundled_ch_f[DATA][4] ;
   output \bundled_ch_f[DATA][3] ;
   output \bundled_ch_f[DATA][2] ;
   output \bundled_ch_f[DATA][1] ;
   output \bundled_ch_f[DATA][0] ;
   input \bundled_ch_b[ACK] ;
   input FE_OFN997_preset;
   input FE_OFN998_preset;
   input FE_OFN999_preset;

   // Internal wires
   wire FE_PHN1412_resource_in_f_67_;
   wire FE_OCPN1279_resource_in_f_63_;
   wire FE_OCPN1276_resource_in_f_42_;
   wire FE_OCPN1047_resource_in_f_53_;
   wire FE_OCPN1046_resource_in_f_45_;
   wire FE_OCPN902_resource_in_f_37_;
   wire FE_OCPN575_resource_in_f_54_;
   wire FE_OCPN571_resource_in_f_40_;
   wire FE_OCPN495_resource_in_f_33_;
   wire FE_OCPN383_resource_in_f_60_;
   wire FE_OCPN225_resource_in_f_64_;
   wire FE_OCPN218_resource_in_f_48_;
   wire FE_OCPN36_resource_in_f_65_;
   wire FE_OCPN33_resource_in_f_62_;
   wire FE_OCPN32_resource_in_f_61_;
   wire FE_OCPN30_resource_in_f_59_;
   wire FE_OCPN29_resource_in_f_58_;
   wire FE_OCPN28_resource_in_f_57_;
   wire FE_OCPN23_resource_in_f_51_;
   wire FE_OCPN22_resource_in_f_50_;
   wire FE_OCPN21_resource_in_f_49_;
   wire FE_OCPN18_resource_in_f_44_;
   wire FE_OCPN17_resource_in_f_43_;
   wire FE_OCPN15_resource_in_f_41_;
   wire FE_OCPN13_resource_in_f_39_;
   wire FE_OCPN12_resource_in_f_38_;
   wire FE_OCPN10_resource_in_f_36_;
   wire token_phase;
   wire full_phase;
   wire empty_phase;
   wire data_phase;
   wire data_cd_phase;
   wire req_in;
   wire latch_enable;
   wire N3;
   wire N4;
   wire N5;
   wire N6;
   wire N7;
   wire N8;
   wire N9;
   wire N10;
   wire N11;
   wire N12;
   wire N13;
   wire N14;
   wire N15;
   wire N16;
   wire N17;
   wire N18;
   wire N19;
   wire N20;
   wire N21;
   wire N22;
   wire N23;
   wire N24;
   wire N25;
   wire N26;
   wire N27;
   wire N28;
   wire N29;
   wire N30;
   wire N31;
   wire N32;
   wire N33;
   wire N34;
   wire N35;
   wire N36;
   wire n1;
   wire n3;
   wire [32:0] data_cd;

   HS65_LS_BFX7 FE_PHC1412_resource_in_f_67_ (.Z(FE_PHN1412_resource_in_f_67_), 
	.A(\LEDR_link_f[TOKEN_T] ));
   HS65_LS_BFX7 FE_OCPC1279_resource_in_f_63_ (.Z(FE_OCPN1279_resource_in_f_63_), 
	.A(\LEDR_link_f[PHIT][30] ));
   HS65_LS_BFX7 FE_OCPC1276_resource_in_f_42_ (.Z(FE_OCPN1276_resource_in_f_42_), 
	.A(\LEDR_link_f[PHIT][9] ));
   HS65_LS_BFX7 FE_OCPC1047_resource_in_f_53_ (.Z(FE_OCPN1047_resource_in_f_53_), 
	.A(\LEDR_link_f[PHIT][20] ));
   HS65_LS_BFX7 FE_OCPC1046_resource_in_f_45_ (.Z(FE_OCPN1046_resource_in_f_45_), 
	.A(\LEDR_link_f[PHIT][12] ));
   HS65_LS_BFX7 FE_OCPC902_resource_in_f_37_ (.Z(FE_OCPN902_resource_in_f_37_), 
	.A(\LEDR_link_f[PHIT][4] ));
   HS65_LS_BFX7 FE_OCPC575_resource_in_f_54_ (.Z(FE_OCPN575_resource_in_f_54_), 
	.A(\LEDR_link_f[PHIT][21] ));
   HS65_LS_BFX7 FE_OCPC571_resource_in_f_40_ (.Z(FE_OCPN571_resource_in_f_40_), 
	.A(\LEDR_link_f[PHIT][7] ));
   HS65_LS_BFX7 FE_OCPC495_resource_in_f_33_ (.Z(FE_OCPN495_resource_in_f_33_), 
	.A(\LEDR_link_f[PHIT][0] ));
   HS65_LS_BFX7 FE_OCPC383_resource_in_f_60_ (.Z(FE_OCPN383_resource_in_f_60_), 
	.A(\LEDR_link_f[PHIT][27] ));
   HS65_LS_BFX7 FE_OCPC225_resource_in_f_64_ (.Z(FE_OCPN225_resource_in_f_64_), 
	.A(\LEDR_link_f[PHIT][31] ));
   HS65_LS_BFX7 FE_OCPC218_resource_in_f_48_ (.Z(FE_OCPN218_resource_in_f_48_), 
	.A(\LEDR_link_f[PHIT][15] ));
   HS65_LS_BFX7 FE_OCPC36_resource_in_f_65_ (.Z(FE_OCPN36_resource_in_f_65_), 
	.A(\LEDR_link_f[PHIT][32] ));
   HS65_LS_BFX7 FE_OCPC33_resource_in_f_62_ (.Z(FE_OCPN33_resource_in_f_62_), 
	.A(\LEDR_link_f[PHIT][29] ));
   HS65_LS_BFX7 FE_OCPC32_resource_in_f_61_ (.Z(FE_OCPN32_resource_in_f_61_), 
	.A(\LEDR_link_f[PHIT][28] ));
   HS65_LS_BFX7 FE_OCPC30_resource_in_f_59_ (.Z(FE_OCPN30_resource_in_f_59_), 
	.A(\LEDR_link_f[PHIT][26] ));
   HS65_LS_BFX7 FE_OCPC29_resource_in_f_58_ (.Z(FE_OCPN29_resource_in_f_58_), 
	.A(\LEDR_link_f[PHIT][25] ));
   HS65_LS_BFX7 FE_OCPC28_resource_in_f_57_ (.Z(FE_OCPN28_resource_in_f_57_), 
	.A(\LEDR_link_f[PHIT][24] ));
   HS65_LS_BFX7 FE_OCPC23_resource_in_f_51_ (.Z(FE_OCPN23_resource_in_f_51_), 
	.A(\LEDR_link_f[PHIT][18] ));
   HS65_LS_BFX7 FE_OCPC22_resource_in_f_50_ (.Z(FE_OCPN22_resource_in_f_50_), 
	.A(\LEDR_link_f[PHIT][17] ));
   HS65_LS_BFX7 FE_OCPC21_resource_in_f_49_ (.Z(FE_OCPN21_resource_in_f_49_), 
	.A(\LEDR_link_f[PHIT][16] ));
   HS65_LS_BFX7 FE_OCPC18_resource_in_f_44_ (.Z(FE_OCPN18_resource_in_f_44_), 
	.A(\LEDR_link_f[PHIT][11] ));
   HS65_LS_BFX7 FE_OCPC17_resource_in_f_43_ (.Z(FE_OCPN17_resource_in_f_43_), 
	.A(\LEDR_link_f[PHIT][10] ));
   HS65_LS_BFX7 FE_OCPC15_resource_in_f_41_ (.Z(FE_OCPN15_resource_in_f_41_), 
	.A(\LEDR_link_f[PHIT][8] ));
   HS65_LS_BFX7 FE_OCPC13_resource_in_f_39_ (.Z(FE_OCPN13_resource_in_f_39_), 
	.A(\LEDR_link_f[PHIT][6] ));
   HS65_LS_BFX7 FE_OCPC12_resource_in_f_38_ (.Z(FE_OCPN12_resource_in_f_38_), 
	.A(\LEDR_link_f[PHIT][5] ));
   HS65_LS_BFX7 FE_OCPC10_resource_in_f_36_ (.Z(FE_OCPN10_resource_in_f_36_), 
	.A(\LEDR_link_f[PHIT][3] ));
   HS65_LSS_XOR2X23 FE_RC_36_0 (.Z(data_cd[7]), 
	.B(\LEDR_link_f[PHIT][7] ), 
	.A(\LEDR_link_f[PHIT_PARITY][7] ));
   HS65_LSS_XOR2X23 FE_RC_35_0 (.Z(data_cd[9]), 
	.B(\LEDR_link_f[PHIT][9] ), 
	.A(\LEDR_link_f[PHIT_PARITY][9] ));
   HS65_LSS_XOR2X23 FE_RC_34_0 (.Z(data_cd[23]), 
	.B(\LEDR_link_f[PHIT][23] ), 
	.A(\LEDR_link_f[PHIT_PARITY][23] ));
   HS65_LSS_XOR2X23 FE_RC_33_0 (.Z(data_cd[2]), 
	.B(\LEDR_link_f[PHIT][2] ), 
	.A(\LEDR_link_f[PHIT_PARITY][2] ));
   HS65_LSS_XOR2X23 FE_RC_32_0 (.Z(data_cd[30]), 
	.B(\LEDR_link_f[PHIT][30] ), 
	.A(\LEDR_link_f[PHIT_PARITY][30] ));
   HS65_LSS_XOR2X23 FE_RC_31_0 (.Z(data_cd[22]), 
	.B(\LEDR_link_f[PHIT][22] ), 
	.A(\LEDR_link_f[PHIT_PARITY][22] ));
   select_element_1 select_element (.preset(preset), 
	.\input (token_phase), 
	.true(full_phase), 
	.false(empty_phase), 
	.sel(\LEDR_link_f[TOKEN_T] ));
   c_gate_0_11 data_cd_c (.preset(FE_OFN997_preset), 
	.a(full_phase), 
	.b(data_phase), 
	.c(data_cd_phase));
   c_gate_generic_0_33_1 data_ch (.preset(preset), 
	.\input ({ data_cd[32],
		data_cd[31],
		data_cd[30],
		data_cd[29],
		data_cd[28],
		data_cd[27],
		data_cd[26],
		data_cd[25],
		data_cd[24],
		data_cd[23],
		data_cd[22],
		data_cd[21],
		data_cd[20],
		data_cd[19],
		data_cd[18],
		data_cd[17],
		data_cd[16],
		data_cd[15],
		data_cd[14],
		data_cd[13],
		data_cd[12],
		data_cd[11],
		data_cd[10],
		data_cd[9],
		data_cd[8],
		data_cd[7],
		data_cd[6],
		data_cd[5],
		data_cd[4],
		data_cd[3],
		data_cd[2],
		data_cd[1],
		data_cd[0] }), 
	.\output (data_phase), 
	.FE_OFN999_preset(FE_OFN999_preset));
   latch_controller_1_6 latch_controller (.preset(FE_OFN997_preset), 
	.Rin(req_in), 
	.Aout(\LEDR_link_b[ACK] ), 
	.Rout(\bundled_ch_f[REQ] ), 
	.Ain(\bundled_ch_b[ACK] ), 
	.lt_en(latch_enable));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][31]  (.Q(\bundled_ch_f[DATA][31] ), 
	.G(N3), 
	.D(N35));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][30]  (.Q(\bundled_ch_f[DATA][30] ), 
	.G(N3), 
	.D(N34));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][29]  (.Q(\bundled_ch_f[DATA][29] ), 
	.G(N3), 
	.D(N33));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][28]  (.Q(\bundled_ch_f[DATA][28] ), 
	.G(N3), 
	.D(N32));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][27]  (.Q(\bundled_ch_f[DATA][27] ), 
	.G(N3), 
	.D(N31));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][26]  (.Q(\bundled_ch_f[DATA][26] ), 
	.G(N3), 
	.D(N30));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][25]  (.Q(\bundled_ch_f[DATA][25] ), 
	.G(N3), 
	.D(N29));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][24]  (.Q(\bundled_ch_f[DATA][24] ), 
	.G(N3), 
	.D(N28));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][23]  (.Q(\bundled_ch_f[DATA][23] ), 
	.G(N3), 
	.D(N27));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][22]  (.Q(\bundled_ch_f[DATA][22] ), 
	.G(N3), 
	.D(N26));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][21]  (.Q(\bundled_ch_f[DATA][21] ), 
	.G(N3), 
	.D(N25));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][20]  (.Q(\bundled_ch_f[DATA][20] ), 
	.G(N3), 
	.D(N24));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][19]  (.Q(\bundled_ch_f[DATA][19] ), 
	.G(N3), 
	.D(N23));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][18]  (.Q(\bundled_ch_f[DATA][18] ), 
	.G(N3), 
	.D(N22));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][17]  (.Q(\bundled_ch_f[DATA][17] ), 
	.G(N3), 
	.D(N21));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][16]  (.Q(\bundled_ch_f[DATA][16] ), 
	.G(N3), 
	.D(N20));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][15]  (.Q(\bundled_ch_f[DATA][15] ), 
	.G(N3), 
	.D(N19));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][14]  (.Q(\bundled_ch_f[DATA][14] ), 
	.G(N3), 
	.D(N18));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][13]  (.Q(\bundled_ch_f[DATA][13] ), 
	.G(N3), 
	.D(N17));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][12]  (.Q(\bundled_ch_f[DATA][12] ), 
	.G(N3), 
	.D(N16));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][11]  (.Q(\bundled_ch_f[DATA][11] ), 
	.G(N3), 
	.D(N15));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][10]  (.Q(\bundled_ch_f[DATA][10] ), 
	.G(N3), 
	.D(N14));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][9]  (.Q(\bundled_ch_f[DATA][9] ), 
	.G(N3), 
	.D(N13));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][8]  (.Q(\bundled_ch_f[DATA][8] ), 
	.G(N3), 
	.D(N12));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][7]  (.Q(\bundled_ch_f[DATA][7] ), 
	.G(N3), 
	.D(N11));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][6]  (.Q(\bundled_ch_f[DATA][6] ), 
	.G(N3), 
	.D(N10));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][5]  (.Q(\bundled_ch_f[DATA][5] ), 
	.G(N3), 
	.D(N9));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][4]  (.Q(\bundled_ch_f[DATA][4] ), 
	.G(N3), 
	.D(N8));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][3]  (.Q(\bundled_ch_f[DATA][3] ), 
	.G(N3), 
	.D(N7));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][2]  (.Q(\bundled_ch_f[DATA][2] ), 
	.G(N3), 
	.D(N6));
   HS65_LS_LDHQX18 \bundled_ch_f_reg[DATA][1]  (.Q(\bundled_ch_f[DATA][1] ), 
	.G(N3), 
	.D(N5));
   HS65_LS_LDLRQX18 \bundled_ch_f_reg[DATA][33]  (.RN(n1), 
	.Q(\bundled_ch_f[DATA][33] ), 
	.GN(latch_enable), 
	.D(FE_PHN1412_resource_in_f_67_));
   HS65_LS_LDHQX18 \bundled_ch_f_reg[DATA][32]  (.Q(\bundled_ch_f[DATA][32] ), 
	.G(N3), 
	.D(N36));
   HS65_LS_LDHQX18 \bundled_ch_f_reg[DATA][0]  (.Q(\bundled_ch_f[DATA][0] ), 
	.G(N3), 
	.D(N4));
   HS65_LSS_XOR2X23 U4 (.Z(data_cd[4]), 
	.B(\LEDR_link_f[PHIT][4] ), 
	.A(\LEDR_link_f[PHIT_PARITY][4] ));
   HS65_LSS_XOR2X23 U5 (.Z(data_cd[3]), 
	.B(\LEDR_link_f[PHIT][3] ), 
	.A(\LEDR_link_f[PHIT_PARITY][3] ));
   HS65_LSS_XOR2X23 U6 (.Z(data_cd[8]), 
	.B(\LEDR_link_f[PHIT][8] ), 
	.A(\LEDR_link_f[PHIT_PARITY][8] ));
   HS65_LSS_XOR2X23 U8 (.Z(data_cd[16]), 
	.B(\LEDR_link_f[PHIT][16] ), 
	.A(\LEDR_link_f[PHIT_PARITY][16] ));
   HS65_LSS_XOR2X23 U9 (.Z(data_cd[15]), 
	.B(\LEDR_link_f[PHIT][15] ), 
	.A(\LEDR_link_f[PHIT_PARITY][15] ));
   HS65_LSS_XOR2X23 U10 (.Z(data_cd[25]), 
	.B(\LEDR_link_f[PHIT][25] ), 
	.A(\LEDR_link_f[PHIT_PARITY][25] ));
   HS65_LSS_XOR2X23 U11 (.Z(data_cd[24]), 
	.B(\LEDR_link_f[PHIT][24] ), 
	.A(\LEDR_link_f[PHIT_PARITY][24] ));
   HS65_LSS_XOR2X23 U12 (.Z(data_cd[26]), 
	.B(\LEDR_link_f[PHIT][26] ), 
	.A(\LEDR_link_f[PHIT_PARITY][26] ));
   HS65_LSS_XOR2X23 U13 (.Z(data_cd[12]), 
	.B(\LEDR_link_f[PHIT][12] ), 
	.A(\LEDR_link_f[PHIT_PARITY][12] ));
   HS65_LSS_XOR2X23 U14 (.Z(data_cd[1]), 
	.B(\LEDR_link_f[PHIT][1] ), 
	.A(\LEDR_link_f[PHIT_PARITY][1] ));
   HS65_LSS_XOR2X23 U18 (.Z(data_cd[19]), 
	.B(\LEDR_link_f[PHIT][19] ), 
	.A(\LEDR_link_f[PHIT_PARITY][19] ));
   HS65_LSS_XOR2X23 U20 (.Z(data_cd[11]), 
	.B(\LEDR_link_f[PHIT][11] ), 
	.A(\LEDR_link_f[PHIT_PARITY][11] ));
   HS65_LSS_XOR2X23 U21 (.Z(data_cd[27]), 
	.B(\LEDR_link_f[PHIT][27] ), 
	.A(\LEDR_link_f[PHIT_PARITY][27] ));
   HS65_LSS_XOR2X23 U22 (.Z(data_cd[0]), 
	.B(\LEDR_link_f[PHIT][0] ), 
	.A(\LEDR_link_f[PHIT_PARITY][0] ));
   HS65_LSS_XOR2X23 U23 (.Z(data_cd[10]), 
	.B(\LEDR_link_f[PHIT][10] ), 
	.A(\LEDR_link_f[PHIT_PARITY][10] ));
   HS65_LSS_XOR2X23 U24 (.Z(data_cd[13]), 
	.B(\LEDR_link_f[PHIT][13] ), 
	.A(\LEDR_link_f[PHIT_PARITY][13] ));
   HS65_LSS_XOR2X23 U25 (.Z(data_cd[14]), 
	.B(\LEDR_link_f[PHIT][14] ), 
	.A(\LEDR_link_f[PHIT_PARITY][14] ));
   HS65_LSS_XOR2X23 U26 (.Z(data_cd[17]), 
	.B(\LEDR_link_f[PHIT][17] ), 
	.A(\LEDR_link_f[PHIT_PARITY][17] ));
   HS65_LSS_XOR2X23 U27 (.Z(data_cd[18]), 
	.B(\LEDR_link_f[PHIT][18] ), 
	.A(\LEDR_link_f[PHIT_PARITY][18] ));
   HS65_LSS_XOR2X23 U28 (.Z(data_cd[20]), 
	.B(\LEDR_link_f[PHIT][20] ), 
	.A(\LEDR_link_f[PHIT_PARITY][20] ));
   HS65_LSS_XOR2X23 U29 (.Z(data_cd[21]), 
	.B(\LEDR_link_f[PHIT][21] ), 
	.A(\LEDR_link_f[PHIT_PARITY][21] ));
   HS65_LSS_XOR2X23 U30 (.Z(data_cd[28]), 
	.B(\LEDR_link_f[PHIT][28] ), 
	.A(\LEDR_link_f[PHIT_PARITY][28] ));
   HS65_LSS_XOR2X23 U31 (.Z(data_cd[29]), 
	.B(\LEDR_link_f[PHIT][29] ), 
	.A(\LEDR_link_f[PHIT_PARITY][29] ));
   HS65_LSS_XOR2X23 U32 (.Z(data_cd[31]), 
	.B(\LEDR_link_f[PHIT][31] ), 
	.A(\LEDR_link_f[PHIT_PARITY][31] ));
   HS65_LSS_XOR2X23 U33 (.Z(data_cd[32]), 
	.B(\LEDR_link_f[PHIT][32] ), 
	.A(\LEDR_link_f[PHIT_PARITY][32] ));
   HS65_LSS_XOR2X23 U34 (.Z(data_cd[5]), 
	.B(\LEDR_link_f[PHIT][5] ), 
	.A(\LEDR_link_f[PHIT_PARITY][5] ));
   HS65_LSS_XOR2X23 U35 (.Z(data_cd[6]), 
	.B(\LEDR_link_f[PHIT][6] ), 
	.A(\LEDR_link_f[PHIT_PARITY][6] ));
   HS65_LSS_XNOR2X6 U36 (.Z(token_phase), 
	.B(\LEDR_link_f[TOKEN_PARITY] ), 
	.A(n3));
   HS65_LS_IVX9 U37 (.Z(n1), 
	.A(preset));
   HS65_LS_IVX9 U38 (.Z(n3), 
	.A(\LEDR_link_f[TOKEN_T] ));
   HS65_LS_NOR2AX3 U39 (.Z(N4), 
	.B(FE_OFN999_preset), 
	.A(FE_OCPN495_resource_in_f_33_));
   HS65_LS_NOR2AX3 U40 (.Z(N5), 
	.B(FE_OFN999_preset), 
	.A(\LEDR_link_f[PHIT][1] ));
   HS65_LS_NOR2AX3 U41 (.Z(N6), 
	.B(FE_OFN997_preset), 
	.A(\LEDR_link_f[PHIT][2] ));
   HS65_LS_NOR2AX3 U42 (.Z(N7), 
	.B(FE_OFN998_preset), 
	.A(FE_OCPN10_resource_in_f_36_));
   HS65_LS_NOR2AX3 U43 (.Z(N8), 
	.B(FE_OFN997_preset), 
	.A(FE_OCPN902_resource_in_f_37_));
   HS65_LS_NOR2AX3 U44 (.Z(N10), 
	.B(FE_OFN998_preset), 
	.A(FE_OCPN13_resource_in_f_39_));
   HS65_LS_NOR2AX3 U45 (.Z(N28), 
	.B(FE_OFN997_preset), 
	.A(FE_OCPN28_resource_in_f_57_));
   HS65_LS_NOR2AX3 U46 (.Z(N29), 
	.B(FE_OFN997_preset), 
	.A(FE_OCPN29_resource_in_f_58_));
   HS65_LS_NOR2AX3 U47 (.Z(N30), 
	.B(FE_OFN997_preset), 
	.A(FE_OCPN30_resource_in_f_59_));
   HS65_LS_NOR2AX3 U48 (.Z(N31), 
	.B(FE_OFN997_preset), 
	.A(FE_OCPN383_resource_in_f_60_));
   HS65_LS_NOR2AX3 U49 (.Z(N32), 
	.B(FE_OFN997_preset), 
	.A(FE_OCPN32_resource_in_f_61_));
   HS65_LS_NOR2AX3 U50 (.Z(N33), 
	.B(FE_OFN997_preset), 
	.A(FE_OCPN33_resource_in_f_62_));
   HS65_LS_NOR2AX3 U51 (.Z(N34), 
	.B(FE_OFN997_preset), 
	.A(FE_OCPN1279_resource_in_f_63_));
   HS65_LS_NOR2AX3 U52 (.Z(N35), 
	.B(FE_OFN997_preset), 
	.A(FE_OCPN225_resource_in_f_64_));
   HS65_LS_NOR2AX3 U53 (.Z(N36), 
	.B(FE_OFN997_preset), 
	.A(FE_OCPN36_resource_in_f_65_));
   HS65_LS_NOR2AX3 U54 (.Z(N9), 
	.B(FE_OFN998_preset), 
	.A(FE_OCPN12_resource_in_f_38_));
   HS65_LS_NOR2AX3 U55 (.Z(N11), 
	.B(FE_OFN998_preset), 
	.A(FE_OCPN571_resource_in_f_40_));
   HS65_LS_NOR2AX3 U56 (.Z(N12), 
	.B(FE_OFN998_preset), 
	.A(FE_OCPN15_resource_in_f_41_));
   HS65_LS_NOR2AX3 U57 (.Z(N13), 
	.B(FE_OFN998_preset), 
	.A(FE_OCPN1276_resource_in_f_42_));
   HS65_LS_NOR2AX3 U58 (.Z(N14), 
	.B(FE_OFN999_preset), 
	.A(FE_OCPN17_resource_in_f_43_));
   HS65_LS_NOR2AX3 U59 (.Z(N15), 
	.B(FE_OFN999_preset), 
	.A(FE_OCPN18_resource_in_f_44_));
   HS65_LS_NOR2AX3 U60 (.Z(N16), 
	.B(FE_OFN999_preset), 
	.A(FE_OCPN1046_resource_in_f_45_));
   HS65_LS_NOR2AX3 U61 (.Z(N17), 
	.B(FE_OFN999_preset), 
	.A(\LEDR_link_f[PHIT][13] ));
   HS65_LS_NOR2AX3 U62 (.Z(N18), 
	.B(FE_OFN999_preset), 
	.A(\LEDR_link_f[PHIT][14] ));
   HS65_LS_NOR2AX3 U63 (.Z(N19), 
	.B(FE_OFN999_preset), 
	.A(FE_OCPN218_resource_in_f_48_));
   HS65_LS_NOR2AX3 U64 (.Z(N20), 
	.B(FE_OFN999_preset), 
	.A(FE_OCPN21_resource_in_f_49_));
   HS65_LS_NOR2AX3 U65 (.Z(N21), 
	.B(FE_OFN999_preset), 
	.A(FE_OCPN22_resource_in_f_50_));
   HS65_LS_NOR2AX3 U66 (.Z(N22), 
	.B(FE_OFN999_preset), 
	.A(FE_OCPN23_resource_in_f_51_));
   HS65_LS_NOR2AX3 U67 (.Z(N23), 
	.B(FE_OFN999_preset), 
	.A(\LEDR_link_f[PHIT][19] ));
   HS65_LS_NOR2AX3 U68 (.Z(N24), 
	.B(FE_OFN999_preset), 
	.A(FE_OCPN1047_resource_in_f_53_));
   HS65_LS_NOR2AX3 U69 (.Z(N25), 
	.B(FE_OFN999_preset), 
	.A(FE_OCPN575_resource_in_f_54_));
   HS65_LS_NOR2AX3 U70 (.Z(N26), 
	.B(FE_OFN999_preset), 
	.A(\LEDR_link_f[PHIT][22] ));
   HS65_LS_NOR2AX3 U71 (.Z(N27), 
	.B(FE_OFN999_preset), 
	.A(\LEDR_link_f[PHIT][23] ));
   HS65_LS_OAI21X3 U72 (.Z(N3), 
	.C(n1), 
	.B(n3), 
	.A(latch_enable));
   HS65_LS_XOR2X4 U73 (.Z(req_in), 
	.B(data_cd_phase), 
	.A(empty_phase));
endmodule

module select_element_2 (
	preset, 
	\input , 
	true, 
	false, 
	sel);
   input preset;
   input \input ;
   output true;
   output false;
   input sel;

   // Internal wires
   wire n1;
   wire n2;
   wire n3;

   HS65_LS_LDHRQX9 true_latch_out_reg (.RN(n3), 
	.Q(true), 
	.G(sel), 
	.D(n1));
   HS65_LS_LDLRQX9 false_latch_out_reg (.RN(n3), 
	.Q(false), 
	.GN(sel), 
	.D(n2));
   HS65_LSS_XOR2X6 U3 (.Z(n1), 
	.B(false), 
	.A(\input ));
   HS65_LS_IVX9 U4 (.Z(n3), 
	.A(preset));
   HS65_LSS_XOR2X6 U5 (.Z(n2), 
	.B(true), 
	.A(\input ));
endmodule

module sr_latch_0_14 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire FE_OCP_RBN321_reset;
   wire N1;

   HS65_LS_IVX9 FE_OCP_RBC321_reset (.Z(FE_OCP_RBN321_reset), 
	.A(r));
   HS65_LS_AND2X18 C8 (.Z(q), 
	.B(N1), 
	.A(FE_OCP_RBN321_reset));
   HS65_LS_IVX9 U1 (.Z(N1), 
	.A(qn));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_0_12 (
	preset, 
	a, 
	b, 
	c);
   input preset;
   input a;
   input b;
   output c;

   // Internal wires
   wire set;
   wire reset;
   wire n1;

   HS65_LS_OAI12X18 FE_RC_152_0 (.Z(reset), 
	.C(n1), 
	.B(b), 
	.A(a));
   sr_latch_0_14 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LH_AND3X4 U4 (.Z(set), 
	.C(a), 
	.B(n1), 
	.A(b));
   HS65_LS_IVX9 U5 (.Z(n1), 
	.A(preset));
endmodule

module sr_latch_0_13 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire FE_OCP_RBN317_reset;
   wire N1;

   HS65_LS_IVX9 FE_OCP_RBC317_reset (.Z(FE_OCP_RBN317_reset), 
	.A(r));
   HS65_LS_AND2X27 C8 (.Z(q), 
	.B(N1), 
	.A(FE_OCP_RBN317_reset));
   HS65_LS_IVX9 U2 (.Z(N1), 
	.A(qn));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_generic_0_33_2 (
	preset, 
	\input , 
	\output , 
	FE_OFN1002_preset);
   input preset;
   input [32:0] \input ;
   output \output ;
   input FE_OFN1002_preset;

   // Internal wires
   wire FE_RN_545_0;
   wire FE_RN_544_0;
   wire FE_RN_543_0;
   wire FE_RN_542_0;
   wire FE_RN_541_0;
   wire FE_RN_540_0;
   wire FE_RN_539_0;
   wire FE_RN_538_0;
   wire FE_RN_537_0;
   wire FE_RN_536_0;
   wire FE_RN_535_0;
   wire FE_RN_534_0;
   wire FE_RN_533_0;
   wire FE_RN_337_0;
   wire FE_RN_336_0;
   wire FE_RN_335_0;
   wire FE_RN_334_0;
   wire FE_RN_333_0;
   wire FE_RN_332_0;
   wire FE_RN_331_0;
   wire FE_RN_330_0;
   wire FE_RN_329_0;
   wire FE_RN_328_0;
   wire FE_RN_327_0;
   wire FE_RN_137_0;
   wire FE_RN_132_0;
   wire set;
   wire reset;
   wire n1;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n70;
   wire n71;
   wire n72;
   wire n73;
   wire n74;
   wire n75;

   HS65_LS_NAND3X25 FE_RC_1402_0 (.Z(FE_RN_328_0), 
	.C(FE_RN_329_0), 
	.B(n66), 
	.A(n67));
   HS65_LS_OAI12X12 FE_RC_820_0 (.Z(reset), 
	.C(n1), 
	.B(n48), 
	.A(n49));
   HS65_LS_CNOR2X38 FE_RC_769_0 (.Z(FE_RN_545_0), 
	.B(\input [7]), 
	.A(\input [8]));
   HS65_LS_CNNAND2AX18 FE_RC_768_0 (.Z(FE_RN_544_0), 
	.B(n62), 
	.A(\input [9]));
   HS65_LS_CNNOR2X15 FE_RC_767_0 (.Z(FE_RN_543_0), 
	.B(FE_RN_544_0), 
	.A(FE_RN_545_0));
   HS65_LS_CNNAND2X24 FE_RC_766_0 (.Z(FE_RN_542_0), 
	.B(n73), 
	.A(n72));
   HS65_LS_NOR2X19 FE_RC_765_0 (.Z(FE_RN_541_0), 
	.B(\input [27]), 
	.A(\input [24]));
   HS65_LS_NOR2X38 FE_RC_764_0 (.Z(FE_RN_540_0), 
	.B(\input [25]), 
	.A(\input [26]));
   HS65_LS_CNNAND2X18 FE_RC_763_0 (.Z(FE_RN_539_0), 
	.B(FE_RN_540_0), 
	.A(FE_RN_541_0));
   HS65_LS_CNNOR2X15 FE_RC_762_0 (.Z(FE_RN_538_0), 
	.B(FE_RN_539_0), 
	.A(FE_RN_542_0));
   HS65_LS_NAND3X25 FE_RC_761_0 (.Z(FE_RN_537_0), 
	.C(n74), 
	.B(n63), 
	.A(n75));
   HS65_LS_CNNOR2X24 FE_RC_760_0 (.Z(FE_RN_536_0), 
	.B(\input [30]), 
	.A(\input [2]));
   HS65_LS_CNIVX27 FE_RC_759_0 (.Z(FE_RN_535_0), 
	.A(\input [4]));
   HS65_LS_NAND3X25 FE_RC_758_0 (.Z(FE_RN_534_0), 
	.C(FE_RN_536_0), 
	.B(FE_RN_137_0), 
	.A(FE_RN_535_0));
   HS65_LS_CNNOR2X15 FE_RC_757_0 (.Z(FE_RN_533_0), 
	.B(FE_RN_534_0), 
	.A(FE_RN_537_0));
   HS65_LS_NAND3X13 FE_RC_756_0 (.Z(n49), 
	.C(FE_RN_533_0), 
	.B(FE_RN_538_0), 
	.A(FE_RN_543_0));
   HS65_LS_NOR2X50 FE_RC_502_0 (.Z(FE_RN_337_0), 
	.B(\input [1]), 
	.A(\input [19]));
   HS65_LS_NAND3X25 FE_RC_501_0 (.Z(FE_RN_336_0), 
	.C(FE_RN_337_0), 
	.B(n68), 
	.A(n69));
   HS65_LS_NOR2X38 FE_RC_500_0 (.Z(FE_RN_335_0), 
	.B(\input [23]), 
	.A(\input [22]));
   HS65_LS_NAND3X25 FE_RC_499_0 (.Z(FE_RN_334_0), 
	.C(FE_RN_335_0), 
	.B(n71), 
	.A(n70));
   HS65_LS_CNNOR2X24 FE_RC_498_0 (.Z(FE_RN_333_0), 
	.B(FE_RN_334_0), 
	.A(FE_RN_336_0));
   HS65_LS_CNNAND2X18 FE_RC_497_0 (.Z(FE_RN_332_0), 
	.B(n65), 
	.A(FE_RN_132_0));
   HS65_LS_CNIVX27 FE_RC_496_0 (.Z(FE_RN_331_0), 
	.A(\input [11]));
   HS65_LS_CNNAND2X18 FE_RC_495_0 (.Z(FE_RN_330_0), 
	.B(FE_RN_331_0), 
	.A(n61));
   HS65_LS_CNNOR2X24 FE_RC_494_0 (.Z(FE_RN_329_0), 
	.B(\input [16]), 
	.A(\input [15]));
   HS65_LS_NOR3X18 FE_RC_492_0 (.Z(FE_RN_327_0), 
	.C(FE_RN_328_0), 
	.B(FE_RN_330_0), 
	.A(FE_RN_332_0));
   HS65_LS_CNNAND2X24 FE_RC_491_0 (.Z(n48), 
	.B(FE_RN_327_0), 
	.A(FE_RN_333_0));
   HS65_LS_CNIVX27 FE_RC_249_0 (.Z(FE_RN_137_0), 
	.A(\input [3]));
   HS65_LS_CNIVX21 FE_RC_243_0 (.Z(FE_RN_132_0), 
	.A(\input [12]));
   sr_latch_0_13 latch (.s(set), 
	.r(reset), 
	.q(\output ));
   HS65_LH_NOR4ABX2 U3 (.Z(n52), 
	.D(n73), 
	.C(n74), 
	.B(\input [30]), 
	.A(\input [2]));
   HS65_LS_CNIVX34 U14 (.Z(n68), 
	.A(\input [17]));
   HS65_LS_CNIVX27 U15 (.Z(n70), 
	.A(\input [20]));
   HS65_LS_CNIVX34 U17 (.Z(n72), 
	.A(\input [28]));
   HS65_LS_CNIVX34 U18 (.Z(n69), 
	.A(\input [18]));
   HS65_LS_CNIVX34 U19 (.Z(n71), 
	.A(\input [21]));
   HS65_LS_CNIVX27 U20 (.Z(n73), 
	.A(\input [29]));
   HS65_LS_CNIVX21 U21 (.Z(n62), 
	.A(\input [5]));
   HS65_LS_CNIVX31 U22 (.Z(n63), 
	.A(\input [6]));
   HS65_LS_CNIVX27 U23 (.Z(n66), 
	.A(\input [13]));
   HS65_LS_CNIVX31 U24 (.Z(n74), 
	.A(\input [31]));
   HS65_LS_CNIVX27 U25 (.Z(n65), 
	.A(\input [10]));
   HS65_LS_CNIVX27 U26 (.Z(n61), 
	.A(\input [0]));
   HS65_LS_CNIVX27 U27 (.Z(n67), 
	.A(\input [14]));
   HS65_LS_CNIVX27 U28 (.Z(n75), 
	.A(\input [32]));
   HS65_LS_NOR3X4 U30 (.Z(n56), 
	.C(n61), 
	.B(FE_OFN1002_preset), 
	.A(n65));
   HS65_LS_NOR3AX2 U31 (.Z(n51), 
	.C(n72), 
	.B(n50), 
	.A(\input [27]));
   HS65_LS_IVX9 U32 (.Z(n1), 
	.A(preset));
   HS65_LS_NOR4ABX2 U33 (.Z(n60), 
	.D(n71), 
	.C(n70), 
	.B(\input [22]), 
	.A(\input [23]));
   HS65_LS_NOR4ABX2 U34 (.Z(n59), 
	.D(n69), 
	.C(n68), 
	.B(\input [19]), 
	.A(\input [1]));
   HS65_LS_NOR4ABX2 U35 (.Z(set), 
	.D(n57), 
	.C(n58), 
	.B(n59), 
	.A(n60));
   HS65_LS_NAND4ABX3 U36 (.Z(n58), 
	.D(n51), 
	.C(n52), 
	.B(n53), 
	.A(n54));
   HS65_LS_NOR4ABX2 U37 (.Z(n55), 
	.D(n67), 
	.C(n66), 
	.B(\input [15]), 
	.A(\input [16]));
   HS65_LS_NAND3X5 U38 (.Z(n50), 
	.C(\input [26]), 
	.B(\input [24]), 
	.A(\input [25]));
   HS65_LS_NAND4ABX3 U39 (.Z(n54), 
	.D(\input [4]), 
	.C(\input [3]), 
	.B(n62), 
	.A(n75));
   HS65_LS_NAND4ABX3 U40 (.Z(n53), 
	.D(\input [8]), 
	.C(\input [7]), 
	.B(n64), 
	.A(n63));
   HS65_LS_NAND4X9 U41 (.Z(n57), 
	.D(n55), 
	.C(n56), 
	.B(\input [12]), 
	.A(\input [11]));
   HS65_LS_IVX9 U42 (.Z(n64), 
	.A(\input [9]));
endmodule

module sr_latch_0_7 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire FE_PHN1472_n1;
   wire FE_PHN1468_n1;
   wire N1;
   wire n1;

   HS65_LH_BFX9 FE_PHC1472_n1 (.Z(FE_PHN1472_n1), 
	.A(n1));
   HS65_LH_BFX2 FE_PHC1468_n1 (.Z(FE_PHN1468_n1), 
	.A(FE_PHN1472_n1));
   HS65_LH_AND2X4 C8 (.Z(q), 
	.B(N1), 
	.A(FE_PHN1468_n1));
   HS65_LH_IVX62 U1 (.Z(n1), 
	.A(r));
   HS65_LS_IVX9 U2 (.Z(N1), 
	.A(qn));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_0_7 (
	preset, 
	a, 
	b, 
	c);
   input preset;
   input a;
   input b;
   output c;

   // Internal wires
   wire set;
   wire reset;
   wire n1;

   sr_latch_0_7 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_OAI12X3 U3 (.Z(reset), 
	.C(n1), 
	.B(a), 
	.A(b));
   HS65_LS_IVX9 U4 (.Z(n1), 
	.A(preset));
   HS65_LS_AND3X9 U5 (.Z(set), 
	.C(a), 
	.B(n1), 
	.A(b));
endmodule

module latch_controller_1_7 (
	preset, 
	Rin, 
	Aout, 
	Rout, 
	Ain, 
	lt_en);
   input preset;
   input Rin;
   output Aout;
   output Rout;
   input Ain;
   output lt_en;

   // Internal wires
   wire FE_PHN1400_d;
   wire not_Ain;
   wire d;

   HS65_LH_DLYIC4X9 FE_PHC1400_d (.Z(FE_PHN1400_d), 
	.A(d));
   c_gate_0_7 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Rout));
   HS65_LS_IVX9 I_1 (.Z(Aout), 
	.A(FE_PHN1400_d));
   HS65_LS_IVX9 I_0 (.Z(not_Ain), 
	.A(Ain));
   HS65_LH_IVX2 I_2 (.Z(d), 
	.A(Rout));
   HS65_LSS_XOR2X6 U5 (.Z(lt_en), 
	.B(Ain), 
	.A(Rout));
endmodule

module LEDR2bundled_1_000000000_2 (
	preset, 
	.LEDR_link_f ( { \LEDR_link_f[TOKEN_T] , 
		\LEDR_link_f[TOKEN_PARITY] , 
		\LEDR_link_f[PHIT][32] , 
		\LEDR_link_f[PHIT][31] , 
		\LEDR_link_f[PHIT][30] , 
		\LEDR_link_f[PHIT][29] , 
		\LEDR_link_f[PHIT][28] , 
		\LEDR_link_f[PHIT][27] , 
		\LEDR_link_f[PHIT][26] , 
		\LEDR_link_f[PHIT][25] , 
		\LEDR_link_f[PHIT][24] , 
		\LEDR_link_f[PHIT][23] , 
		\LEDR_link_f[PHIT][22] , 
		\LEDR_link_f[PHIT][21] , 
		\LEDR_link_f[PHIT][20] , 
		\LEDR_link_f[PHIT][19] , 
		\LEDR_link_f[PHIT][18] , 
		\LEDR_link_f[PHIT][17] , 
		\LEDR_link_f[PHIT][16] , 
		\LEDR_link_f[PHIT][15] , 
		\LEDR_link_f[PHIT][14] , 
		\LEDR_link_f[PHIT][13] , 
		\LEDR_link_f[PHIT][12] , 
		\LEDR_link_f[PHIT][11] , 
		\LEDR_link_f[PHIT][10] , 
		\LEDR_link_f[PHIT][9] , 
		\LEDR_link_f[PHIT][8] , 
		\LEDR_link_f[PHIT][7] , 
		\LEDR_link_f[PHIT][6] , 
		\LEDR_link_f[PHIT][5] , 
		\LEDR_link_f[PHIT][4] , 
		\LEDR_link_f[PHIT][3] , 
		\LEDR_link_f[PHIT][2] , 
		\LEDR_link_f[PHIT][1] , 
		\LEDR_link_f[PHIT][0] , 
		\LEDR_link_f[PHIT_PARITY][32] , 
		\LEDR_link_f[PHIT_PARITY][31] , 
		\LEDR_link_f[PHIT_PARITY][30] , 
		\LEDR_link_f[PHIT_PARITY][29] , 
		\LEDR_link_f[PHIT_PARITY][28] , 
		\LEDR_link_f[PHIT_PARITY][27] , 
		\LEDR_link_f[PHIT_PARITY][26] , 
		\LEDR_link_f[PHIT_PARITY][25] , 
		\LEDR_link_f[PHIT_PARITY][24] , 
		\LEDR_link_f[PHIT_PARITY][23] , 
		\LEDR_link_f[PHIT_PARITY][22] , 
		\LEDR_link_f[PHIT_PARITY][21] , 
		\LEDR_link_f[PHIT_PARITY][20] , 
		\LEDR_link_f[PHIT_PARITY][19] , 
		\LEDR_link_f[PHIT_PARITY][18] , 
		\LEDR_link_f[PHIT_PARITY][17] , 
		\LEDR_link_f[PHIT_PARITY][16] , 
		\LEDR_link_f[PHIT_PARITY][15] , 
		\LEDR_link_f[PHIT_PARITY][14] , 
		\LEDR_link_f[PHIT_PARITY][13] , 
		\LEDR_link_f[PHIT_PARITY][12] , 
		\LEDR_link_f[PHIT_PARITY][11] , 
		\LEDR_link_f[PHIT_PARITY][10] , 
		\LEDR_link_f[PHIT_PARITY][9] , 
		\LEDR_link_f[PHIT_PARITY][8] , 
		\LEDR_link_f[PHIT_PARITY][7] , 
		\LEDR_link_f[PHIT_PARITY][6] , 
		\LEDR_link_f[PHIT_PARITY][5] , 
		\LEDR_link_f[PHIT_PARITY][4] , 
		\LEDR_link_f[PHIT_PARITY][3] , 
		\LEDR_link_f[PHIT_PARITY][2] , 
		\LEDR_link_f[PHIT_PARITY][1] , 
		\LEDR_link_f[PHIT_PARITY][0]  } ), 
	.LEDR_link_b ( \LEDR_link_b[ACK]  ), 
	.bundled_ch_f ( { \bundled_ch_f[REQ] , 
		\bundled_ch_f[DATA][33] , 
		\bundled_ch_f[DATA][32] , 
		\bundled_ch_f[DATA][31] , 
		\bundled_ch_f[DATA][30] , 
		\bundled_ch_f[DATA][29] , 
		\bundled_ch_f[DATA][28] , 
		\bundled_ch_f[DATA][27] , 
		\bundled_ch_f[DATA][26] , 
		\bundled_ch_f[DATA][25] , 
		\bundled_ch_f[DATA][24] , 
		\bundled_ch_f[DATA][23] , 
		\bundled_ch_f[DATA][22] , 
		\bundled_ch_f[DATA][21] , 
		\bundled_ch_f[DATA][20] , 
		\bundled_ch_f[DATA][19] , 
		\bundled_ch_f[DATA][18] , 
		\bundled_ch_f[DATA][17] , 
		\bundled_ch_f[DATA][16] , 
		\bundled_ch_f[DATA][15] , 
		\bundled_ch_f[DATA][14] , 
		\bundled_ch_f[DATA][13] , 
		\bundled_ch_f[DATA][12] , 
		\bundled_ch_f[DATA][11] , 
		\bundled_ch_f[DATA][10] , 
		\bundled_ch_f[DATA][9] , 
		\bundled_ch_f[DATA][8] , 
		\bundled_ch_f[DATA][7] , 
		\bundled_ch_f[DATA][6] , 
		\bundled_ch_f[DATA][5] , 
		\bundled_ch_f[DATA][4] , 
		\bundled_ch_f[DATA][3] , 
		\bundled_ch_f[DATA][2] , 
		\bundled_ch_f[DATA][1] , 
		\bundled_ch_f[DATA][0]  } ), 
	.bundled_ch_b ( \bundled_ch_b[ACK]  ), 
	FE_OFN2_preset, 
	FE_OFN1000_preset, 
	FE_OFN1002_preset);
   input preset;
   input \LEDR_link_f[TOKEN_T] ;
   input \LEDR_link_f[TOKEN_PARITY] ;
   input \LEDR_link_f[PHIT][32] ;
   input \LEDR_link_f[PHIT][31] ;
   input \LEDR_link_f[PHIT][30] ;
   input \LEDR_link_f[PHIT][29] ;
   input \LEDR_link_f[PHIT][28] ;
   input \LEDR_link_f[PHIT][27] ;
   input \LEDR_link_f[PHIT][26] ;
   input \LEDR_link_f[PHIT][25] ;
   input \LEDR_link_f[PHIT][24] ;
   input \LEDR_link_f[PHIT][23] ;
   input \LEDR_link_f[PHIT][22] ;
   input \LEDR_link_f[PHIT][21] ;
   input \LEDR_link_f[PHIT][20] ;
   input \LEDR_link_f[PHIT][19] ;
   input \LEDR_link_f[PHIT][18] ;
   input \LEDR_link_f[PHIT][17] ;
   input \LEDR_link_f[PHIT][16] ;
   input \LEDR_link_f[PHIT][15] ;
   input \LEDR_link_f[PHIT][14] ;
   input \LEDR_link_f[PHIT][13] ;
   input \LEDR_link_f[PHIT][12] ;
   input \LEDR_link_f[PHIT][11] ;
   input \LEDR_link_f[PHIT][10] ;
   input \LEDR_link_f[PHIT][9] ;
   input \LEDR_link_f[PHIT][8] ;
   input \LEDR_link_f[PHIT][7] ;
   input \LEDR_link_f[PHIT][6] ;
   input \LEDR_link_f[PHIT][5] ;
   input \LEDR_link_f[PHIT][4] ;
   input \LEDR_link_f[PHIT][3] ;
   input \LEDR_link_f[PHIT][2] ;
   input \LEDR_link_f[PHIT][1] ;
   input \LEDR_link_f[PHIT][0] ;
   input \LEDR_link_f[PHIT_PARITY][32] ;
   input \LEDR_link_f[PHIT_PARITY][31] ;
   input \LEDR_link_f[PHIT_PARITY][30] ;
   input \LEDR_link_f[PHIT_PARITY][29] ;
   input \LEDR_link_f[PHIT_PARITY][28] ;
   input \LEDR_link_f[PHIT_PARITY][27] ;
   input \LEDR_link_f[PHIT_PARITY][26] ;
   input \LEDR_link_f[PHIT_PARITY][25] ;
   input \LEDR_link_f[PHIT_PARITY][24] ;
   input \LEDR_link_f[PHIT_PARITY][23] ;
   input \LEDR_link_f[PHIT_PARITY][22] ;
   input \LEDR_link_f[PHIT_PARITY][21] ;
   input \LEDR_link_f[PHIT_PARITY][20] ;
   input \LEDR_link_f[PHIT_PARITY][19] ;
   input \LEDR_link_f[PHIT_PARITY][18] ;
   input \LEDR_link_f[PHIT_PARITY][17] ;
   input \LEDR_link_f[PHIT_PARITY][16] ;
   input \LEDR_link_f[PHIT_PARITY][15] ;
   input \LEDR_link_f[PHIT_PARITY][14] ;
   input \LEDR_link_f[PHIT_PARITY][13] ;
   input \LEDR_link_f[PHIT_PARITY][12] ;
   input \LEDR_link_f[PHIT_PARITY][11] ;
   input \LEDR_link_f[PHIT_PARITY][10] ;
   input \LEDR_link_f[PHIT_PARITY][9] ;
   input \LEDR_link_f[PHIT_PARITY][8] ;
   input \LEDR_link_f[PHIT_PARITY][7] ;
   input \LEDR_link_f[PHIT_PARITY][6] ;
   input \LEDR_link_f[PHIT_PARITY][5] ;
   input \LEDR_link_f[PHIT_PARITY][4] ;
   input \LEDR_link_f[PHIT_PARITY][3] ;
   input \LEDR_link_f[PHIT_PARITY][2] ;
   input \LEDR_link_f[PHIT_PARITY][1] ;
   input \LEDR_link_f[PHIT_PARITY][0] ;
   output \LEDR_link_b[ACK] ;
   output \bundled_ch_f[REQ] ;
   output \bundled_ch_f[DATA][33] ;
   output \bundled_ch_f[DATA][32] ;
   output \bundled_ch_f[DATA][31] ;
   output \bundled_ch_f[DATA][30] ;
   output \bundled_ch_f[DATA][29] ;
   output \bundled_ch_f[DATA][28] ;
   output \bundled_ch_f[DATA][27] ;
   output \bundled_ch_f[DATA][26] ;
   output \bundled_ch_f[DATA][25] ;
   output \bundled_ch_f[DATA][24] ;
   output \bundled_ch_f[DATA][23] ;
   output \bundled_ch_f[DATA][22] ;
   output \bundled_ch_f[DATA][21] ;
   output \bundled_ch_f[DATA][20] ;
   output \bundled_ch_f[DATA][19] ;
   output \bundled_ch_f[DATA][18] ;
   output \bundled_ch_f[DATA][17] ;
   output \bundled_ch_f[DATA][16] ;
   output \bundled_ch_f[DATA][15] ;
   output \bundled_ch_f[DATA][14] ;
   output \bundled_ch_f[DATA][13] ;
   output \bundled_ch_f[DATA][12] ;
   output \bundled_ch_f[DATA][11] ;
   output \bundled_ch_f[DATA][10] ;
   output \bundled_ch_f[DATA][9] ;
   output \bundled_ch_f[DATA][8] ;
   output \bundled_ch_f[DATA][7] ;
   output \bundled_ch_f[DATA][6] ;
   output \bundled_ch_f[DATA][5] ;
   output \bundled_ch_f[DATA][4] ;
   output \bundled_ch_f[DATA][3] ;
   output \bundled_ch_f[DATA][2] ;
   output \bundled_ch_f[DATA][1] ;
   output \bundled_ch_f[DATA][0] ;
   input \bundled_ch_b[ACK] ;
   input FE_OFN2_preset;
   input FE_OFN1000_preset;
   input FE_OFN1002_preset;

   // Internal wires
   wire FE_PHN1413_west_in_f_67_;
   wire FE_OCPN1281_west_in_f_46_;
   wire FE_OCPN1179_west_in_f_42_;
   wire FE_OCPN1053_west_in_f_41_;
   wire FE_OCPN1052_west_in_f_40_;
   wire FE_OCPN232_west_in_f_45_;
   wire FE_OCPN231_west_in_f_44_;
   wire FE_OCPN227_west_in_f_36_;
   wire FE_OCPN57_west_in_f_65_;
   wire FE_OCPN56_west_in_f_64_;
   wire FE_OCPN54_west_in_f_62_;
   wire FE_OCPN53_west_in_f_61_;
   wire FE_OCPN52_west_in_f_49_;
   wire FE_OCPN46_west_in_f_43_;
   wire FE_OCPN42_west_in_f_39_;
   wire FE_OCPN41_west_in_f_38_;
   wire FE_OCPN40_west_in_f_37_;
   wire FE_OCPN37_west_in_f_33_;
   wire token_phase;
   wire full_phase;
   wire empty_phase;
   wire data_phase;
   wire data_cd_phase;
   wire req_in;
   wire latch_enable;
   wire N3;
   wire N4;
   wire N5;
   wire N6;
   wire N7;
   wire N8;
   wire N9;
   wire N10;
   wire N11;
   wire N12;
   wire N13;
   wire N14;
   wire N15;
   wire N16;
   wire N17;
   wire N18;
   wire N19;
   wire N20;
   wire N21;
   wire N22;
   wire N23;
   wire N24;
   wire N25;
   wire N26;
   wire N27;
   wire N28;
   wire N29;
   wire N30;
   wire N31;
   wire N32;
   wire N33;
   wire N34;
   wire N35;
   wire N36;
   wire n1;
   wire n3;
   wire [32:0] data_cd;

   HS65_LS_BFX7 FE_PHC1413_west_in_f_67_ (.Z(FE_PHN1413_west_in_f_67_), 
	.A(\LEDR_link_f[TOKEN_T] ));
   HS65_LS_BFX7 FE_OCPC1281_west_in_f_46_ (.Z(FE_OCPN1281_west_in_f_46_), 
	.A(\LEDR_link_f[PHIT][13] ));
   HS65_LS_BFX7 FE_OCPC1179_west_in_f_42_ (.Z(FE_OCPN1179_west_in_f_42_), 
	.A(\LEDR_link_f[PHIT][9] ));
   HS65_LS_BFX7 FE_OCPC1053_west_in_f_41_ (.Z(FE_OCPN1053_west_in_f_41_), 
	.A(\LEDR_link_f[PHIT][8] ));
   HS65_LS_BFX7 FE_OCPC1052_west_in_f_40_ (.Z(FE_OCPN1052_west_in_f_40_), 
	.A(\LEDR_link_f[PHIT][7] ));
   HS65_LS_BFX7 FE_OCPC232_west_in_f_45_ (.Z(FE_OCPN232_west_in_f_45_), 
	.A(\LEDR_link_f[PHIT][12] ));
   HS65_LS_BFX7 FE_OCPC231_west_in_f_44_ (.Z(FE_OCPN231_west_in_f_44_), 
	.A(\LEDR_link_f[PHIT][11] ));
   HS65_LS_BFX7 FE_OCPC227_west_in_f_36_ (.Z(FE_OCPN227_west_in_f_36_), 
	.A(\LEDR_link_f[PHIT][3] ));
   HS65_LS_BFX7 FE_OCPC57_west_in_f_65_ (.Z(FE_OCPN57_west_in_f_65_), 
	.A(\LEDR_link_f[PHIT][32] ));
   HS65_LS_BFX7 FE_OCPC56_west_in_f_64_ (.Z(FE_OCPN56_west_in_f_64_), 
	.A(\LEDR_link_f[PHIT][31] ));
   HS65_LS_BFX7 FE_OCPC54_west_in_f_62_ (.Z(FE_OCPN54_west_in_f_62_), 
	.A(\LEDR_link_f[PHIT][29] ));
   HS65_LS_BFX7 FE_OCPC53_west_in_f_61_ (.Z(FE_OCPN53_west_in_f_61_), 
	.A(\LEDR_link_f[PHIT][28] ));
   HS65_LS_BFX7 FE_OCPC52_west_in_f_49_ (.Z(FE_OCPN52_west_in_f_49_), 
	.A(\LEDR_link_f[PHIT][16] ));
   HS65_LS_BFX7 FE_OCPC46_west_in_f_43_ (.Z(FE_OCPN46_west_in_f_43_), 
	.A(\LEDR_link_f[PHIT][10] ));
   HS65_LS_BFX7 FE_OCPC42_west_in_f_39_ (.Z(FE_OCPN42_west_in_f_39_), 
	.A(\LEDR_link_f[PHIT][6] ));
   HS65_LS_BFX7 FE_OCPC41_west_in_f_38_ (.Z(FE_OCPN41_west_in_f_38_), 
	.A(\LEDR_link_f[PHIT][5] ));
   HS65_LS_BFX7 FE_OCPC40_west_in_f_37_ (.Z(FE_OCPN40_west_in_f_37_), 
	.A(\LEDR_link_f[PHIT][4] ));
   HS65_LS_BFX7 FE_OCPC37_west_in_f_33_ (.Z(FE_OCPN37_west_in_f_33_), 
	.A(\LEDR_link_f[PHIT][0] ));
   HS65_LSS_XOR2X23 FE_RC_43_0 (.Z(data_cd[8]), 
	.B(\LEDR_link_f[PHIT][8] ), 
	.A(\LEDR_link_f[PHIT_PARITY][8] ));
   HS65_LSS_XOR2X23 FE_RC_42_0 (.Z(data_cd[1]), 
	.B(\LEDR_link_f[PHIT][1] ), 
	.A(\LEDR_link_f[PHIT_PARITY][1] ));
   HS65_LSS_XOR2X23 FE_RC_41_0 (.Z(data_cd[23]), 
	.B(\LEDR_link_f[PHIT][23] ), 
	.A(\LEDR_link_f[PHIT_PARITY][23] ));
   HS65_LSS_XOR2X23 FE_RC_40_0 (.Z(data_cd[2]), 
	.B(\LEDR_link_f[PHIT][2] ), 
	.A(\LEDR_link_f[PHIT_PARITY][2] ));
   HS65_LSS_XOR2X23 FE_RC_39_0 (.Z(data_cd[30]), 
	.B(\LEDR_link_f[PHIT][30] ), 
	.A(\LEDR_link_f[PHIT_PARITY][30] ));
   HS65_LSS_XOR2X23 FE_RC_38_0 (.Z(data_cd[19]), 
	.B(\LEDR_link_f[PHIT][19] ), 
	.A(\LEDR_link_f[PHIT_PARITY][19] ));
   HS65_LSS_XOR2X23 FE_RC_37_0 (.Z(data_cd[22]), 
	.B(\LEDR_link_f[PHIT][22] ), 
	.A(\LEDR_link_f[PHIT_PARITY][22] ));
   HS65_LSS_XOR2X23 FE_RC_1_0 (.Z(data_cd[7]), 
	.B(\LEDR_link_f[PHIT_PARITY][7] ), 
	.A(\LEDR_link_f[PHIT][7] ));
   HS65_LSS_XOR2X23 FE_RC_0_0 (.Z(data_cd[9]), 
	.B(\LEDR_link_f[PHIT][9] ), 
	.A(\LEDR_link_f[PHIT_PARITY][9] ));
   select_element_2 select_element (.preset(preset), 
	.\input (token_phase), 
	.true(full_phase), 
	.false(empty_phase), 
	.sel(\LEDR_link_f[TOKEN_T] ));
   c_gate_0_12 data_cd_c (.preset(FE_OFN2_preset), 
	.a(full_phase), 
	.b(data_phase), 
	.c(data_cd_phase));
   c_gate_generic_0_33_2 data_ch (.preset(FE_OFN1000_preset), 
	.\input ({ data_cd[32],
		data_cd[31],
		data_cd[30],
		data_cd[29],
		data_cd[28],
		data_cd[27],
		data_cd[26],
		data_cd[25],
		data_cd[24],
		data_cd[23],
		data_cd[22],
		data_cd[21],
		data_cd[20],
		data_cd[19],
		data_cd[18],
		data_cd[17],
		data_cd[16],
		data_cd[15],
		data_cd[14],
		data_cd[13],
		data_cd[12],
		data_cd[11],
		data_cd[10],
		data_cd[9],
		data_cd[8],
		data_cd[7],
		data_cd[6],
		data_cd[5],
		data_cd[4],
		data_cd[3],
		data_cd[2],
		data_cd[1],
		data_cd[0] }), 
	.\output (data_phase), 
	.FE_OFN1002_preset(FE_OFN1002_preset));
   latch_controller_1_7 latch_controller (.preset(FE_OFN2_preset), 
	.Rin(req_in), 
	.Aout(\LEDR_link_b[ACK] ), 
	.Rout(\bundled_ch_f[REQ] ), 
	.Ain(\bundled_ch_b[ACK] ), 
	.lt_en(latch_enable));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][31]  (.Q(\bundled_ch_f[DATA][31] ), 
	.G(N3), 
	.D(N35));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][30]  (.Q(\bundled_ch_f[DATA][30] ), 
	.G(N3), 
	.D(N34));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][29]  (.Q(\bundled_ch_f[DATA][29] ), 
	.G(N3), 
	.D(N33));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][28]  (.Q(\bundled_ch_f[DATA][28] ), 
	.G(N3), 
	.D(N32));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][27]  (.Q(\bundled_ch_f[DATA][27] ), 
	.G(N3), 
	.D(N31));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][26]  (.Q(\bundled_ch_f[DATA][26] ), 
	.G(N3), 
	.D(N30));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][25]  (.Q(\bundled_ch_f[DATA][25] ), 
	.G(N3), 
	.D(N29));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][24]  (.Q(\bundled_ch_f[DATA][24] ), 
	.G(N3), 
	.D(N28));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][23]  (.Q(\bundled_ch_f[DATA][23] ), 
	.G(N3), 
	.D(N27));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][22]  (.Q(\bundled_ch_f[DATA][22] ), 
	.G(N3), 
	.D(N26));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][21]  (.Q(\bundled_ch_f[DATA][21] ), 
	.G(N3), 
	.D(N25));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][20]  (.Q(\bundled_ch_f[DATA][20] ), 
	.G(N3), 
	.D(N24));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][19]  (.Q(\bundled_ch_f[DATA][19] ), 
	.G(N3), 
	.D(N23));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][18]  (.Q(\bundled_ch_f[DATA][18] ), 
	.G(N3), 
	.D(N22));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][17]  (.Q(\bundled_ch_f[DATA][17] ), 
	.G(N3), 
	.D(N21));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][16]  (.Q(\bundled_ch_f[DATA][16] ), 
	.G(N3), 
	.D(N20));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][15]  (.Q(\bundled_ch_f[DATA][15] ), 
	.G(N3), 
	.D(N19));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][14]  (.Q(\bundled_ch_f[DATA][14] ), 
	.G(N3), 
	.D(N18));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][13]  (.Q(\bundled_ch_f[DATA][13] ), 
	.G(N3), 
	.D(N17));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][12]  (.Q(\bundled_ch_f[DATA][12] ), 
	.G(N3), 
	.D(N16));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][11]  (.Q(\bundled_ch_f[DATA][11] ), 
	.G(N3), 
	.D(N15));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][10]  (.Q(\bundled_ch_f[DATA][10] ), 
	.G(N3), 
	.D(N14));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][9]  (.Q(\bundled_ch_f[DATA][9] ), 
	.G(N3), 
	.D(N13));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][8]  (.Q(\bundled_ch_f[DATA][8] ), 
	.G(N3), 
	.D(N12));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][7]  (.Q(\bundled_ch_f[DATA][7] ), 
	.G(N3), 
	.D(N11));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][6]  (.Q(\bundled_ch_f[DATA][6] ), 
	.G(N3), 
	.D(N10));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][5]  (.Q(\bundled_ch_f[DATA][5] ), 
	.G(N3), 
	.D(N9));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][4]  (.Q(\bundled_ch_f[DATA][4] ), 
	.G(N3), 
	.D(N8));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][3]  (.Q(\bundled_ch_f[DATA][3] ), 
	.G(N3), 
	.D(N7));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][2]  (.Q(\bundled_ch_f[DATA][2] ), 
	.G(N3), 
	.D(N6));
   HS65_LS_LDLRQX18 \bundled_ch_f_reg[DATA][33]  (.RN(n1), 
	.Q(\bundled_ch_f[DATA][33] ), 
	.GN(latch_enable), 
	.D(FE_PHN1413_west_in_f_67_));
   HS65_LS_LDHQX18 \bundled_ch_f_reg[DATA][1]  (.Q(\bundled_ch_f[DATA][1] ), 
	.G(N3), 
	.D(N5));
   HS65_LS_LDHQX18 \bundled_ch_f_reg[DATA][32]  (.Q(\bundled_ch_f[DATA][32] ), 
	.G(N3), 
	.D(N36));
   HS65_LS_LDHQX18 \bundled_ch_f_reg[DATA][0]  (.Q(\bundled_ch_f[DATA][0] ), 
	.G(N3), 
	.D(N4));
   HS65_LSS_XOR2X23 U4 (.Z(data_cd[4]), 
	.B(\LEDR_link_f[PHIT][4] ), 
	.A(\LEDR_link_f[PHIT_PARITY][4] ));
   HS65_LSS_XOR2X23 U5 (.Z(data_cd[3]), 
	.B(\LEDR_link_f[PHIT][3] ), 
	.A(\LEDR_link_f[PHIT_PARITY][3] ));
   HS65_LSS_XOR2X23 U8 (.Z(data_cd[16]), 
	.B(\LEDR_link_f[PHIT][16] ), 
	.A(\LEDR_link_f[PHIT_PARITY][16] ));
   HS65_LSS_XOR2X23 U9 (.Z(data_cd[15]), 
	.B(\LEDR_link_f[PHIT][15] ), 
	.A(\LEDR_link_f[PHIT_PARITY][15] ));
   HS65_LSS_XOR2X23 U10 (.Z(data_cd[25]), 
	.B(\LEDR_link_f[PHIT][25] ), 
	.A(\LEDR_link_f[PHIT_PARITY][25] ));
   HS65_LSS_XOR2X23 U11 (.Z(data_cd[24]), 
	.B(\LEDR_link_f[PHIT][24] ), 
	.A(\LEDR_link_f[PHIT_PARITY][24] ));
   HS65_LSS_XOR2X23 U12 (.Z(data_cd[26]), 
	.B(\LEDR_link_f[PHIT][26] ), 
	.A(\LEDR_link_f[PHIT_PARITY][26] ));
   HS65_LSS_XOR2X23 U13 (.Z(data_cd[12]), 
	.B(\LEDR_link_f[PHIT][12] ), 
	.A(\LEDR_link_f[PHIT_PARITY][12] ));
   HS65_LSS_XOR2X23 U20 (.Z(data_cd[11]), 
	.B(\LEDR_link_f[PHIT][11] ), 
	.A(\LEDR_link_f[PHIT_PARITY][11] ));
   HS65_LSS_XOR2X23 U21 (.Z(data_cd[27]), 
	.B(\LEDR_link_f[PHIT][27] ), 
	.A(\LEDR_link_f[PHIT_PARITY][27] ));
   HS65_LSS_XOR2X23 U22 (.Z(data_cd[0]), 
	.B(\LEDR_link_f[PHIT][0] ), 
	.A(\LEDR_link_f[PHIT_PARITY][0] ));
   HS65_LSS_XOR2X23 U23 (.Z(data_cd[10]), 
	.B(\LEDR_link_f[PHIT][10] ), 
	.A(\LEDR_link_f[PHIT_PARITY][10] ));
   HS65_LSS_XOR2X23 U24 (.Z(data_cd[13]), 
	.B(\LEDR_link_f[PHIT][13] ), 
	.A(\LEDR_link_f[PHIT_PARITY][13] ));
   HS65_LSS_XOR2X23 U25 (.Z(data_cd[14]), 
	.B(\LEDR_link_f[PHIT][14] ), 
	.A(\LEDR_link_f[PHIT_PARITY][14] ));
   HS65_LSS_XOR2X23 U26 (.Z(data_cd[17]), 
	.B(\LEDR_link_f[PHIT][17] ), 
	.A(\LEDR_link_f[PHIT_PARITY][17] ));
   HS65_LSS_XOR2X23 U27 (.Z(data_cd[18]), 
	.B(\LEDR_link_f[PHIT][18] ), 
	.A(\LEDR_link_f[PHIT_PARITY][18] ));
   HS65_LSS_XOR2X23 U28 (.Z(data_cd[20]), 
	.B(\LEDR_link_f[PHIT][20] ), 
	.A(\LEDR_link_f[PHIT_PARITY][20] ));
   HS65_LSS_XOR2X23 U29 (.Z(data_cd[21]), 
	.B(\LEDR_link_f[PHIT][21] ), 
	.A(\LEDR_link_f[PHIT_PARITY][21] ));
   HS65_LSS_XOR2X23 U30 (.Z(data_cd[28]), 
	.B(\LEDR_link_f[PHIT][28] ), 
	.A(\LEDR_link_f[PHIT_PARITY][28] ));
   HS65_LSS_XOR2X23 U31 (.Z(data_cd[29]), 
	.B(\LEDR_link_f[PHIT][29] ), 
	.A(\LEDR_link_f[PHIT_PARITY][29] ));
   HS65_LSS_XOR2X23 U32 (.Z(data_cd[31]), 
	.B(\LEDR_link_f[PHIT][31] ), 
	.A(\LEDR_link_f[PHIT_PARITY][31] ));
   HS65_LSS_XOR2X23 U33 (.Z(data_cd[32]), 
	.B(\LEDR_link_f[PHIT][32] ), 
	.A(\LEDR_link_f[PHIT_PARITY][32] ));
   HS65_LSS_XOR2X23 U34 (.Z(data_cd[5]), 
	.B(\LEDR_link_f[PHIT][5] ), 
	.A(\LEDR_link_f[PHIT_PARITY][5] ));
   HS65_LSS_XOR2X23 U35 (.Z(data_cd[6]), 
	.B(\LEDR_link_f[PHIT][6] ), 
	.A(\LEDR_link_f[PHIT_PARITY][6] ));
   HS65_LSS_XNOR2X6 U36 (.Z(token_phase), 
	.B(\LEDR_link_f[TOKEN_PARITY] ), 
	.A(n3));
   HS65_LS_IVX9 U37 (.Z(n1), 
	.A(preset));
   HS65_LS_IVX9 U38 (.Z(n3), 
	.A(\LEDR_link_f[TOKEN_T] ));
   HS65_LS_NOR2AX3 U39 (.Z(N4), 
	.B(FE_OFN1002_preset), 
	.A(FE_OCPN37_west_in_f_33_));
   HS65_LS_NOR2AX3 U40 (.Z(N5), 
	.B(FE_OFN1002_preset), 
	.A(\LEDR_link_f[PHIT][1] ));
   HS65_LS_NOR2AX3 U41 (.Z(N6), 
	.B(FE_OFN2_preset), 
	.A(\LEDR_link_f[PHIT][2] ));
   HS65_LS_NOR2AX3 U42 (.Z(N7), 
	.B(FE_OFN1000_preset), 
	.A(FE_OCPN227_west_in_f_36_));
   HS65_LS_NOR2AX3 U43 (.Z(N8), 
	.B(FE_OFN2_preset), 
	.A(FE_OCPN40_west_in_f_37_));
   HS65_LS_NOR2AX3 U44 (.Z(N10), 
	.B(FE_OFN1000_preset), 
	.A(FE_OCPN42_west_in_f_39_));
   HS65_LS_NOR2AX3 U45 (.Z(N28), 
	.B(FE_OFN2_preset), 
	.A(\LEDR_link_f[PHIT][24] ));
   HS65_LS_NOR2AX3 U46 (.Z(N29), 
	.B(FE_OFN2_preset), 
	.A(\LEDR_link_f[PHIT][25] ));
   HS65_LS_NOR2AX3 U47 (.Z(N30), 
	.B(FE_OFN2_preset), 
	.A(\LEDR_link_f[PHIT][26] ));
   HS65_LS_NOR2AX3 U48 (.Z(N31), 
	.B(FE_OFN2_preset), 
	.A(\LEDR_link_f[PHIT][27] ));
   HS65_LS_NOR2AX3 U49 (.Z(N32), 
	.B(FE_OFN2_preset), 
	.A(FE_OCPN53_west_in_f_61_));
   HS65_LS_NOR2AX3 U50 (.Z(N33), 
	.B(preset), 
	.A(FE_OCPN54_west_in_f_62_));
   HS65_LS_NOR2AX3 U51 (.Z(N34), 
	.B(FE_OFN2_preset), 
	.A(\LEDR_link_f[PHIT][30] ));
   HS65_LS_NOR2AX3 U52 (.Z(N35), 
	.B(FE_OFN2_preset), 
	.A(FE_OCPN56_west_in_f_64_));
   HS65_LS_NOR2AX3 U53 (.Z(N36), 
	.B(preset), 
	.A(FE_OCPN57_west_in_f_65_));
   HS65_LS_NOR2AX3 U54 (.Z(N9), 
	.B(FE_OFN1000_preset), 
	.A(FE_OCPN41_west_in_f_38_));
   HS65_LS_NOR2AX3 U55 (.Z(N11), 
	.B(FE_OFN1000_preset), 
	.A(FE_OCPN1052_west_in_f_40_));
   HS65_LS_NOR2AX3 U56 (.Z(N12), 
	.B(FE_OFN1000_preset), 
	.A(FE_OCPN1053_west_in_f_41_));
   HS65_LS_NOR2AX3 U57 (.Z(N13), 
	.B(FE_OFN1000_preset), 
	.A(FE_OCPN1179_west_in_f_42_));
   HS65_LS_NOR2AX3 U58 (.Z(N14), 
	.B(FE_OFN1002_preset), 
	.A(FE_OCPN46_west_in_f_43_));
   HS65_LS_NOR2AX3 U59 (.Z(N15), 
	.B(FE_OFN1002_preset), 
	.A(FE_OCPN231_west_in_f_44_));
   HS65_LS_NOR2AX3 U60 (.Z(N16), 
	.B(FE_OFN1002_preset), 
	.A(FE_OCPN232_west_in_f_45_));
   HS65_LS_NOR2AX3 U61 (.Z(N17), 
	.B(FE_OFN1002_preset), 
	.A(FE_OCPN1281_west_in_f_46_));
   HS65_LS_NOR2AX3 U62 (.Z(N18), 
	.B(FE_OFN1002_preset), 
	.A(\LEDR_link_f[PHIT][14] ));
   HS65_LS_NOR2AX3 U63 (.Z(N19), 
	.B(FE_OFN1002_preset), 
	.A(\LEDR_link_f[PHIT][15] ));
   HS65_LS_NOR2AX3 U64 (.Z(N20), 
	.B(FE_OFN1002_preset), 
	.A(FE_OCPN52_west_in_f_49_));
   HS65_LS_NOR2AX3 U65 (.Z(N21), 
	.B(FE_OFN1002_preset), 
	.A(\LEDR_link_f[PHIT][17] ));
   HS65_LS_NOR2AX3 U66 (.Z(N22), 
	.B(FE_OFN1002_preset), 
	.A(\LEDR_link_f[PHIT][18] ));
   HS65_LS_NOR2AX3 U67 (.Z(N23), 
	.B(FE_OFN1002_preset), 
	.A(\LEDR_link_f[PHIT][19] ));
   HS65_LS_NOR2AX3 U68 (.Z(N24), 
	.B(FE_OFN1002_preset), 
	.A(\LEDR_link_f[PHIT][20] ));
   HS65_LS_NOR2AX3 U69 (.Z(N25), 
	.B(FE_OFN1002_preset), 
	.A(\LEDR_link_f[PHIT][21] ));
   HS65_LS_NOR2AX3 U70 (.Z(N26), 
	.B(FE_OFN1002_preset), 
	.A(\LEDR_link_f[PHIT][22] ));
   HS65_LS_NOR2AX3 U71 (.Z(N27), 
	.B(FE_OFN1002_preset), 
	.A(\LEDR_link_f[PHIT][23] ));
   HS65_LS_OAI21X3 U72 (.Z(N3), 
	.C(n1), 
	.B(n3), 
	.A(latch_enable));
   HS65_LS_XOR2X4 U73 (.Z(req_in), 
	.B(data_cd_phase), 
	.A(empty_phase));
endmodule

module select_element_3 (
	preset, 
	\input , 
	true, 
	false, 
	sel);
   input preset;
   input \input ;
   output true;
   output false;
   input sel;

   // Internal wires
   wire n1;
   wire n2;
   wire n3;

   HS65_LS_LDHRQX9 true_latch_out_reg (.RN(n3), 
	.Q(true), 
	.G(sel), 
	.D(n1));
   HS65_LS_LDLRQX9 false_latch_out_reg (.RN(n3), 
	.Q(false), 
	.GN(sel), 
	.D(n2));
   HS65_LSS_XOR2X6 U3 (.Z(n1), 
	.B(false), 
	.A(\input ));
   HS65_LS_IVX9 U4 (.Z(n3), 
	.A(preset));
   HS65_LSS_XOR2X6 U5 (.Z(n2), 
	.B(true), 
	.A(\input ));
endmodule

module sr_latch_0_16 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire FE_OCP_RBN1327_reset;
   wire N1;

   HS65_LS_IVX9 FE_OCP_RBC1327_reset (.Z(FE_OCP_RBN1327_reset), 
	.A(r));
   HS65_LS_AND2X18 C8 (.Z(q), 
	.B(N1), 
	.A(FE_OCP_RBN1327_reset));
   HS65_LS_IVX9 U1 (.Z(N1), 
	.A(qn));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_0_13 (
	preset, 
	a, 
	b, 
	c);
   input preset;
   input a;
   input b;
   output c;

   // Internal wires
   wire set;
   wire reset;
   wire n1;

   HS65_LS_OAI12X12 FE_RC_153_0 (.Z(reset), 
	.C(n1), 
	.B(b), 
	.A(a));
   sr_latch_0_16 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LH_AND3X4 U4 (.Z(set), 
	.C(a), 
	.B(n1), 
	.A(b));
   HS65_LS_IVX9 U5 (.Z(n1), 
	.A(preset));
endmodule

module sr_latch_0_15 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire FE_OCP_RBN994_reset;
   wire N1;

   HS65_LS_IVX9 FE_OCP_RBC994_reset (.Z(FE_OCP_RBN994_reset), 
	.A(r));
   HS65_LS_AND2X27 C8 (.Z(q), 
	.B(N1), 
	.A(FE_OCP_RBN994_reset));
   HS65_LS_IVX9 U2 (.Z(N1), 
	.A(qn));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_generic_0_33_3 (
	preset, 
	\input , 
	\output , 
	FE_OCP_RBN315_data_cd_20_, 
	FE_OFN1000_preset);
   input preset;
   input [32:0] \input ;
   output \output ;
   input FE_OCP_RBN315_data_cd_20_;
   input FE_OFN1000_preset;

   // Internal wires
   wire FE_RN_694_0;
   wire FE_RN_693_0;
   wire FE_RN_692_0;
   wire FE_RN_691_0;
   wire FE_RN_690_0;
   wire FE_RN_689_0;
   wire FE_RN_688_0;
   wire FE_RN_687_0;
   wire FE_RN_686_0;
   wire FE_RN_685_0;
   wire FE_RN_482_0;
   wire FE_RN_481_0;
   wire FE_RN_480_0;
   wire FE_RN_479_0;
   wire FE_RN_478_0;
   wire FE_RN_477_0;
   wire FE_RN_476_0;
   wire FE_RN_475_0;
   wire FE_RN_474_0;
   wire FE_RN_473_0;
   wire FE_RN_472_0;
   wire FE_RN_471_0;
   wire FE_RN_470_0;
   wire FE_RN_469_0;
   wire FE_RN_468_0;
   wire FE_RN_467_0;
   wire FE_RN_466_0;
   wire set;
   wire reset;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n72;
   wire n73;
   wire n74;
   wire n75;

   HS65_LS_NAND3X13 FE_RC_1442_0 (.Z(FE_RN_469_0), 
	.C(FE_RN_470_0), 
	.B(FE_RN_472_0), 
	.A(FE_RN_471_0));
   HS65_LS_NAND3X25 FE_RC_1403_0 (.Z(FE_RN_477_0), 
	.C(FE_RN_478_0), 
	.B(n73), 
	.A(n72));
   HS65_LS_NAND3X19 FE_RC_1269_0 (.Z(FE_RN_686_0), 
	.C(FE_RN_687_0), 
	.B(n61), 
	.A(n65));
   HS65_LS_OAI12X12 FE_RC_1096_0 (.Z(reset), 
	.C(FE_RN_466_0), 
	.B(FE_RN_467_0), 
	.A(FE_RN_482_0));
   HS65_LS_NOR3X13 FE_RC_1095_0 (.Z(FE_RN_468_0), 
	.C(FE_RN_469_0), 
	.B(FE_RN_473_0), 
	.A(FE_RN_474_0));
   HS65_LS_CNNOR2X15 FE_RC_942_0 (.Z(FE_RN_694_0), 
	.B(\input [19]), 
	.A(\input [1]));
   HS65_LS_NAND3X13 FE_RC_941_0 (.Z(FE_RN_693_0), 
	.C(FE_RN_694_0), 
	.B(n69), 
	.A(n68));
   HS65_LS_CNNOR2X24 FE_RC_940_0 (.Z(FE_RN_692_0), 
	.B(\input [16]), 
	.A(\input [15]));
   HS65_LS_NAND3X25 FE_RC_939_0 (.Z(FE_RN_691_0), 
	.C(FE_RN_692_0), 
	.B(n67), 
	.A(n66));
   HS65_LS_CNNOR2X15 FE_RC_938_0 (.Z(FE_RN_690_0), 
	.B(FE_RN_693_0), 
	.A(FE_RN_691_0));
   HS65_LS_CNNOR2X15 FE_RC_937_0 (.Z(FE_RN_689_0), 
	.B(\input [22]), 
	.A(\input [23]));
   HS65_LS_NAND3X25 FE_RC_936_0 (.Z(FE_RN_688_0), 
	.C(FE_RN_689_0), 
	.B(\input [20]), 
	.A(\input [21]));
   HS65_LS_CNNOR2X15 FE_RC_935_0 (.Z(FE_RN_687_0), 
	.B(\input [12]), 
	.A(\input [11]));
   HS65_LS_CNNOR2X15 FE_RC_933_0 (.Z(FE_RN_685_0), 
	.B(FE_RN_686_0), 
	.A(FE_RN_688_0));
   HS65_LS_NAND2X14 FE_RC_932_0 (.Z(FE_RN_482_0), 
	.B(FE_RN_685_0), 
	.A(FE_RN_690_0));
   HS65_LS_CNNAND2AX18 FE_RC_684_0 (.Z(FE_RN_481_0), 
	.B(n63), 
	.A(\input [7]));
   HS65_LS_CNNOR2X24 FE_RC_683_0 (.Z(FE_RN_480_0), 
	.B(\input [9]), 
	.A(\input [8]));
   HS65_LS_CNNAND2X18 FE_RC_682_0 (.Z(FE_RN_479_0), 
	.B(FE_RN_480_0), 
	.A(n62));
   HS65_LS_CNNOR2X24 FE_RC_681_0 (.Z(FE_RN_478_0), 
	.B(\input [30]), 
	.A(\input [2]));
   HS65_LS_NOR3X18 FE_RC_679_0 (.Z(FE_RN_476_0), 
	.C(FE_RN_477_0), 
	.B(FE_RN_481_0), 
	.A(FE_RN_479_0));
   HS65_LS_CNIVX21 FE_RC_678_0 (.Z(FE_RN_475_0), 
	.A(\input [3]));
   HS65_LS_CNNAND2X18 FE_RC_677_0 (.Z(FE_RN_474_0), 
	.B(n74), 
	.A(FE_RN_475_0));
   HS65_LS_CNNAND2AX18 FE_RC_676_0 (.Z(FE_RN_473_0), 
	.B(n75), 
	.A(\input [4]));
   HS65_LS_CNIVX27 FE_RC_675_0 (.Z(FE_RN_472_0), 
	.A(\input [24]));
   HS65_LS_CNIVX21 FE_RC_674_0 (.Z(FE_RN_471_0), 
	.A(\input [27]));
   HS65_LS_CNNOR2X15 FE_RC_673_0 (.Z(FE_RN_470_0), 
	.B(\input [25]), 
	.A(\input [26]));
   HS65_LS_CNNAND2X18 FE_RC_670_0 (.Z(FE_RN_467_0), 
	.B(FE_RN_468_0), 
	.A(FE_RN_476_0));
   HS65_LS_CNIVX14 FE_RC_669_0 (.Z(FE_RN_466_0), 
	.A(preset));
   HS65_LS_CNIVX31 FE_RC_2_0 (.Z(n72), 
	.A(\input [28]));
   sr_latch_0_15 latch (.s(set), 
	.r(reset), 
	.q(\output ));
   HS65_LS_CNIVX27 U12 (.Z(n68), 
	.A(\input [17]));
   HS65_LS_CNIVX21 U17 (.Z(n69), 
	.A(\input [18]));
   HS65_LS_CNIVX34 U19 (.Z(n73), 
	.A(\input [29]));
   HS65_LS_CNIVX27 U20 (.Z(n62), 
	.A(\input [5]));
   HS65_LS_CNIVX27 U21 (.Z(n63), 
	.A(\input [6]));
   HS65_LS_CNIVX27 U22 (.Z(n66), 
	.A(\input [13]));
   HS65_LS_CNIVX34 U23 (.Z(n74), 
	.A(\input [31]));
   HS65_LS_CNIVX27 U24 (.Z(n65), 
	.A(\input [10]));
   HS65_LS_CNIVX34 U25 (.Z(n61), 
	.A(\input [0]));
   HS65_LS_CNIVX34 U26 (.Z(n67), 
	.A(\input [14]));
   HS65_LS_CNIVX27 U27 (.Z(n75), 
	.A(\input [32]));
   HS65_LS_NOR3X4 U29 (.Z(n56), 
	.C(n61), 
	.B(FE_OFN1000_preset), 
	.A(n65));
   HS65_LS_NOR3AX2 U30 (.Z(n51), 
	.C(n72), 
	.B(n50), 
	.A(\input [27]));
   HS65_LS_NOR4ABX2 U31 (.Z(n52), 
	.D(n73), 
	.C(n74), 
	.B(\input [30]), 
	.A(\input [2]));
   HS65_LS_NOR4ABX2 U33 (.Z(n60), 
	.D(\input [21]), 
	.C(FE_OCP_RBN315_data_cd_20_), 
	.B(\input [22]), 
	.A(\input [23]));
   HS65_LS_NOR4ABX2 U34 (.Z(n59), 
	.D(n69), 
	.C(n68), 
	.B(\input [19]), 
	.A(\input [1]));
   HS65_LS_NOR4ABX2 U35 (.Z(set), 
	.D(n57), 
	.C(n58), 
	.B(n59), 
	.A(n60));
   HS65_LS_NAND4ABX3 U36 (.Z(n58), 
	.D(n51), 
	.C(n52), 
	.B(n53), 
	.A(n54));
   HS65_LS_NOR4ABX2 U37 (.Z(n55), 
	.D(n67), 
	.C(n66), 
	.B(\input [15]), 
	.A(\input [16]));
   HS65_LS_NAND3X5 U38 (.Z(n50), 
	.C(\input [26]), 
	.B(\input [24]), 
	.A(\input [25]));
   HS65_LS_NAND4ABX3 U39 (.Z(n54), 
	.D(\input [4]), 
	.C(\input [3]), 
	.B(n62), 
	.A(n75));
   HS65_LS_NAND4ABX3 U40 (.Z(n53), 
	.D(\input [8]), 
	.C(\input [7]), 
	.B(n64), 
	.A(n63));
   HS65_LS_NAND4X9 U41 (.Z(n57), 
	.D(n55), 
	.C(n56), 
	.B(\input [12]), 
	.A(\input [11]));
   HS65_LS_IVX9 U42 (.Z(n64), 
	.A(\input [9]));
endmodule

module sr_latch_0_8 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire FE_PHN1470_n1;
   wire FE_PHN1466_n1;
   wire N1;
   wire n1;

   HS65_LH_BFX7 FE_PHC1470_n1 (.Z(FE_PHN1470_n1), 
	.A(n1));
   HS65_LH_DLYIC2X9 FE_PHC1466_n1 (.Z(FE_PHN1466_n1), 
	.A(FE_PHN1470_n1));
   HS65_LH_AND2X4 C8 (.Z(q), 
	.B(N1), 
	.A(FE_PHN1466_n1));
   HS65_LH_IVX62 U1 (.Z(n1), 
	.A(r));
   HS65_LS_IVX9 U2 (.Z(N1), 
	.A(qn));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_0_8 (
	preset, 
	a, 
	b, 
	c);
   input preset;
   input a;
   input b;
   output c;

   // Internal wires
   wire set;
   wire reset;
   wire n1;

   sr_latch_0_8 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_OAI12X3 U3 (.Z(reset), 
	.C(n1), 
	.B(a), 
	.A(b));
   HS65_LS_IVX9 U4 (.Z(n1), 
	.A(preset));
   HS65_LS_AND3X9 U5 (.Z(set), 
	.C(a), 
	.B(n1), 
	.A(b));
endmodule

module latch_controller_1_8 (
	preset, 
	Rin, 
	Aout, 
	Rout, 
	Ain, 
	lt_en);
   input preset;
   input Rin;
   output Aout;
   output Rout;
   input Ain;
   output lt_en;

   // Internal wires
   wire FE_PHN1420_east_hpu_b_ACK;
   wire FE_PHN1399_d;
   wire FE_PHN1392_east_hpu_b_ACK;
   wire not_Ain;
   wire d;

   HS65_LH_BFX9 FE_PHC1420_east_hpu_b_ACK (.Z(FE_PHN1420_east_hpu_b_ACK), 
	.A(Ain));
   HS65_LH_DLYIC4X9 FE_PHC1399_d (.Z(FE_PHN1399_d), 
	.A(d));
   HS65_LH_DLYIC2X9 FE_PHC1392_east_hpu_b_ACK (.Z(FE_PHN1392_east_hpu_b_ACK), 
	.A(FE_PHN1420_east_hpu_b_ACK));
   c_gate_0_8 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Rout));
   HS65_LS_IVX9 I_1 (.Z(Aout), 
	.A(FE_PHN1399_d));
   HS65_LS_IVX9 I_0 (.Z(not_Ain), 
	.A(FE_PHN1392_east_hpu_b_ACK));
   HS65_LH_IVX2 I_2 (.Z(d), 
	.A(Rout));
   HS65_LSS_XOR2X6 U5 (.Z(lt_en), 
	.B(Ain), 
	.A(Rout));
endmodule

module LEDR2bundled_1_000000000_3 (
	preset, 
	.LEDR_link_f ( { \LEDR_link_f[TOKEN_T] , 
		\LEDR_link_f[TOKEN_PARITY] , 
		\LEDR_link_f[PHIT][32] , 
		\LEDR_link_f[PHIT][31] , 
		\LEDR_link_f[PHIT][30] , 
		\LEDR_link_f[PHIT][29] , 
		\LEDR_link_f[PHIT][28] , 
		\LEDR_link_f[PHIT][27] , 
		\LEDR_link_f[PHIT][26] , 
		\LEDR_link_f[PHIT][25] , 
		\LEDR_link_f[PHIT][24] , 
		\LEDR_link_f[PHIT][23] , 
		\LEDR_link_f[PHIT][22] , 
		\LEDR_link_f[PHIT][21] , 
		\LEDR_link_f[PHIT][20] , 
		\LEDR_link_f[PHIT][19] , 
		\LEDR_link_f[PHIT][18] , 
		\LEDR_link_f[PHIT][17] , 
		\LEDR_link_f[PHIT][16] , 
		\LEDR_link_f[PHIT][15] , 
		\LEDR_link_f[PHIT][14] , 
		\LEDR_link_f[PHIT][13] , 
		\LEDR_link_f[PHIT][12] , 
		\LEDR_link_f[PHIT][11] , 
		\LEDR_link_f[PHIT][10] , 
		\LEDR_link_f[PHIT][9] , 
		\LEDR_link_f[PHIT][8] , 
		\LEDR_link_f[PHIT][7] , 
		\LEDR_link_f[PHIT][6] , 
		\LEDR_link_f[PHIT][5] , 
		\LEDR_link_f[PHIT][4] , 
		\LEDR_link_f[PHIT][3] , 
		\LEDR_link_f[PHIT][2] , 
		\LEDR_link_f[PHIT][1] , 
		\LEDR_link_f[PHIT][0] , 
		\LEDR_link_f[PHIT_PARITY][32] , 
		\LEDR_link_f[PHIT_PARITY][31] , 
		\LEDR_link_f[PHIT_PARITY][30] , 
		\LEDR_link_f[PHIT_PARITY][29] , 
		\LEDR_link_f[PHIT_PARITY][28] , 
		\LEDR_link_f[PHIT_PARITY][27] , 
		\LEDR_link_f[PHIT_PARITY][26] , 
		\LEDR_link_f[PHIT_PARITY][25] , 
		\LEDR_link_f[PHIT_PARITY][24] , 
		\LEDR_link_f[PHIT_PARITY][23] , 
		\LEDR_link_f[PHIT_PARITY][22] , 
		\LEDR_link_f[PHIT_PARITY][21] , 
		\LEDR_link_f[PHIT_PARITY][20] , 
		\LEDR_link_f[PHIT_PARITY][19] , 
		\LEDR_link_f[PHIT_PARITY][18] , 
		\LEDR_link_f[PHIT_PARITY][17] , 
		\LEDR_link_f[PHIT_PARITY][16] , 
		\LEDR_link_f[PHIT_PARITY][15] , 
		\LEDR_link_f[PHIT_PARITY][14] , 
		\LEDR_link_f[PHIT_PARITY][13] , 
		\LEDR_link_f[PHIT_PARITY][12] , 
		\LEDR_link_f[PHIT_PARITY][11] , 
		\LEDR_link_f[PHIT_PARITY][10] , 
		\LEDR_link_f[PHIT_PARITY][9] , 
		\LEDR_link_f[PHIT_PARITY][8] , 
		\LEDR_link_f[PHIT_PARITY][7] , 
		\LEDR_link_f[PHIT_PARITY][6] , 
		\LEDR_link_f[PHIT_PARITY][5] , 
		\LEDR_link_f[PHIT_PARITY][4] , 
		\LEDR_link_f[PHIT_PARITY][3] , 
		\LEDR_link_f[PHIT_PARITY][2] , 
		\LEDR_link_f[PHIT_PARITY][1] , 
		\LEDR_link_f[PHIT_PARITY][0]  } ), 
	.LEDR_link_b ( \LEDR_link_b[ACK]  ), 
	.bundled_ch_f ( { \bundled_ch_f[REQ] , 
		\bundled_ch_f[DATA][33] , 
		\bundled_ch_f[DATA][32] , 
		\bundled_ch_f[DATA][31] , 
		\bundled_ch_f[DATA][30] , 
		\bundled_ch_f[DATA][29] , 
		\bundled_ch_f[DATA][28] , 
		\bundled_ch_f[DATA][27] , 
		\bundled_ch_f[DATA][26] , 
		\bundled_ch_f[DATA][25] , 
		\bundled_ch_f[DATA][24] , 
		\bundled_ch_f[DATA][23] , 
		\bundled_ch_f[DATA][22] , 
		\bundled_ch_f[DATA][21] , 
		\bundled_ch_f[DATA][20] , 
		\bundled_ch_f[DATA][19] , 
		\bundled_ch_f[DATA][18] , 
		\bundled_ch_f[DATA][17] , 
		\bundled_ch_f[DATA][16] , 
		\bundled_ch_f[DATA][15] , 
		\bundled_ch_f[DATA][14] , 
		\bundled_ch_f[DATA][13] , 
		\bundled_ch_f[DATA][12] , 
		\bundled_ch_f[DATA][11] , 
		\bundled_ch_f[DATA][10] , 
		\bundled_ch_f[DATA][9] , 
		\bundled_ch_f[DATA][8] , 
		\bundled_ch_f[DATA][7] , 
		\bundled_ch_f[DATA][6] , 
		\bundled_ch_f[DATA][5] , 
		\bundled_ch_f[DATA][4] , 
		\bundled_ch_f[DATA][3] , 
		\bundled_ch_f[DATA][2] , 
		\bundled_ch_f[DATA][1] , 
		\bundled_ch_f[DATA][0]  } ), 
	.bundled_ch_b ( \bundled_ch_b[ACK]  ), 
	FE_OFN2_preset, 
	FE_OFN1000_preset, 
	FE_OFN1001_preset, 
	FE_OFN1002_preset, 
	FE_OFN1004_preset);
   input preset;
   input \LEDR_link_f[TOKEN_T] ;
   input \LEDR_link_f[TOKEN_PARITY] ;
   input \LEDR_link_f[PHIT][32] ;
   input \LEDR_link_f[PHIT][31] ;
   input \LEDR_link_f[PHIT][30] ;
   input \LEDR_link_f[PHIT][29] ;
   input \LEDR_link_f[PHIT][28] ;
   input \LEDR_link_f[PHIT][27] ;
   input \LEDR_link_f[PHIT][26] ;
   input \LEDR_link_f[PHIT][25] ;
   input \LEDR_link_f[PHIT][24] ;
   input \LEDR_link_f[PHIT][23] ;
   input \LEDR_link_f[PHIT][22] ;
   input \LEDR_link_f[PHIT][21] ;
   input \LEDR_link_f[PHIT][20] ;
   input \LEDR_link_f[PHIT][19] ;
   input \LEDR_link_f[PHIT][18] ;
   input \LEDR_link_f[PHIT][17] ;
   input \LEDR_link_f[PHIT][16] ;
   input \LEDR_link_f[PHIT][15] ;
   input \LEDR_link_f[PHIT][14] ;
   input \LEDR_link_f[PHIT][13] ;
   input \LEDR_link_f[PHIT][12] ;
   input \LEDR_link_f[PHIT][11] ;
   input \LEDR_link_f[PHIT][10] ;
   input \LEDR_link_f[PHIT][9] ;
   input \LEDR_link_f[PHIT][8] ;
   input \LEDR_link_f[PHIT][7] ;
   input \LEDR_link_f[PHIT][6] ;
   input \LEDR_link_f[PHIT][5] ;
   input \LEDR_link_f[PHIT][4] ;
   input \LEDR_link_f[PHIT][3] ;
   input \LEDR_link_f[PHIT][2] ;
   input \LEDR_link_f[PHIT][1] ;
   input \LEDR_link_f[PHIT][0] ;
   input \LEDR_link_f[PHIT_PARITY][32] ;
   input \LEDR_link_f[PHIT_PARITY][31] ;
   input \LEDR_link_f[PHIT_PARITY][30] ;
   input \LEDR_link_f[PHIT_PARITY][29] ;
   input \LEDR_link_f[PHIT_PARITY][28] ;
   input \LEDR_link_f[PHIT_PARITY][27] ;
   input \LEDR_link_f[PHIT_PARITY][26] ;
   input \LEDR_link_f[PHIT_PARITY][25] ;
   input \LEDR_link_f[PHIT_PARITY][24] ;
   input \LEDR_link_f[PHIT_PARITY][23] ;
   input \LEDR_link_f[PHIT_PARITY][22] ;
   input \LEDR_link_f[PHIT_PARITY][21] ;
   input \LEDR_link_f[PHIT_PARITY][20] ;
   input \LEDR_link_f[PHIT_PARITY][19] ;
   input \LEDR_link_f[PHIT_PARITY][18] ;
   input \LEDR_link_f[PHIT_PARITY][17] ;
   input \LEDR_link_f[PHIT_PARITY][16] ;
   input \LEDR_link_f[PHIT_PARITY][15] ;
   input \LEDR_link_f[PHIT_PARITY][14] ;
   input \LEDR_link_f[PHIT_PARITY][13] ;
   input \LEDR_link_f[PHIT_PARITY][12] ;
   input \LEDR_link_f[PHIT_PARITY][11] ;
   input \LEDR_link_f[PHIT_PARITY][10] ;
   input \LEDR_link_f[PHIT_PARITY][9] ;
   input \LEDR_link_f[PHIT_PARITY][8] ;
   input \LEDR_link_f[PHIT_PARITY][7] ;
   input \LEDR_link_f[PHIT_PARITY][6] ;
   input \LEDR_link_f[PHIT_PARITY][5] ;
   input \LEDR_link_f[PHIT_PARITY][4] ;
   input \LEDR_link_f[PHIT_PARITY][3] ;
   input \LEDR_link_f[PHIT_PARITY][2] ;
   input \LEDR_link_f[PHIT_PARITY][1] ;
   input \LEDR_link_f[PHIT_PARITY][0] ;
   output \LEDR_link_b[ACK] ;
   output \bundled_ch_f[REQ] ;
   output \bundled_ch_f[DATA][33] ;
   output \bundled_ch_f[DATA][32] ;
   output \bundled_ch_f[DATA][31] ;
   output \bundled_ch_f[DATA][30] ;
   output \bundled_ch_f[DATA][29] ;
   output \bundled_ch_f[DATA][28] ;
   output \bundled_ch_f[DATA][27] ;
   output \bundled_ch_f[DATA][26] ;
   output \bundled_ch_f[DATA][25] ;
   output \bundled_ch_f[DATA][24] ;
   output \bundled_ch_f[DATA][23] ;
   output \bundled_ch_f[DATA][22] ;
   output \bundled_ch_f[DATA][21] ;
   output \bundled_ch_f[DATA][20] ;
   output \bundled_ch_f[DATA][19] ;
   output \bundled_ch_f[DATA][18] ;
   output \bundled_ch_f[DATA][17] ;
   output \bundled_ch_f[DATA][16] ;
   output \bundled_ch_f[DATA][15] ;
   output \bundled_ch_f[DATA][14] ;
   output \bundled_ch_f[DATA][13] ;
   output \bundled_ch_f[DATA][12] ;
   output \bundled_ch_f[DATA][11] ;
   output \bundled_ch_f[DATA][10] ;
   output \bundled_ch_f[DATA][9] ;
   output \bundled_ch_f[DATA][8] ;
   output \bundled_ch_f[DATA][7] ;
   output \bundled_ch_f[DATA][6] ;
   output \bundled_ch_f[DATA][5] ;
   output \bundled_ch_f[DATA][4] ;
   output \bundled_ch_f[DATA][3] ;
   output \bundled_ch_f[DATA][2] ;
   output \bundled_ch_f[DATA][1] ;
   output \bundled_ch_f[DATA][0] ;
   input \bundled_ch_b[ACK] ;
   input FE_OFN2_preset;
   input FE_OFN1000_preset;
   input FE_OFN1001_preset;
   input FE_OFN1002_preset;
   input FE_OFN1004_preset;

   // Internal wires
   wire FE_PHN1411_east_in_f_67_;
   wire FE_OCP_RBN315_data_cd_20_;
   wire FE_OCP_RBN314_data_cd_20_;
   wire FE_OCP_RBN313_data_cd_21_;
   wire token_phase;
   wire full_phase;
   wire empty_phase;
   wire data_phase;
   wire data_cd_phase;
   wire req_in;
   wire latch_enable;
   wire N3;
   wire N4;
   wire N5;
   wire N6;
   wire N7;
   wire N8;
   wire N9;
   wire N10;
   wire N11;
   wire N12;
   wire N13;
   wire N14;
   wire N15;
   wire N16;
   wire N17;
   wire N18;
   wire N19;
   wire N20;
   wire N21;
   wire N22;
   wire N23;
   wire N24;
   wire N25;
   wire N26;
   wire N27;
   wire N28;
   wire N29;
   wire N30;
   wire N31;
   wire N32;
   wire N33;
   wire N34;
   wire N35;
   wire N36;
   wire n1;
   wire n3;
   wire [32:0] data_cd;

   HS65_LS_BFX7 FE_PHC1411_east_in_f_67_ (.Z(FE_PHN1411_east_in_f_67_), 
	.A(\LEDR_link_f[TOKEN_T] ));
   HS65_LSS_XOR2X23 FE_RC_735_0 (.Z(data_cd[10]), 
	.B(\LEDR_link_f[PHIT][10] ), 
	.A(\LEDR_link_f[PHIT_PARITY][10] ));
   HS65_LSS_XNOR2X24 FE_RC_593_0 (.Z(FE_OCP_RBN313_data_cd_21_), 
	.B(\LEDR_link_f[PHIT][21] ), 
	.A(\LEDR_link_f[PHIT_PARITY][21] ));
   HS65_LSS_XOR2X23 FE_RC_532_0 (.Z(data_cd[23]), 
	.B(\LEDR_link_f[PHIT][23] ), 
	.A(\LEDR_link_f[PHIT_PARITY][23] ));
   HS65_LS_CNIVX3 FE_OCP_RBC315_data_cd_20_ (.Z(FE_OCP_RBN315_data_cd_20_), 
	.A(data_cd[20]));
   HS65_LS_CNIVX34 FE_OCP_RBC314_data_cd_20_ (.Z(FE_OCP_RBN314_data_cd_20_), 
	.A(data_cd[20]));
   HS65_LSS_XOR2X23 FE_RC_442_0 (.Z(data_cd[6]), 
	.B(\LEDR_link_f[PHIT][6] ), 
	.A(\LEDR_link_f[PHIT_PARITY][6] ));
   HS65_LSS_XOR2X23 FE_RC_430_0 (.Z(data_cd[4]), 
	.B(\LEDR_link_f[PHIT][4] ), 
	.A(\LEDR_link_f[PHIT_PARITY][4] ));
   HS65_LSS_XOR2X23 FE_RC_429_0 (.Z(data_cd[25]), 
	.B(\LEDR_link_f[PHIT][25] ), 
	.A(\LEDR_link_f[PHIT_PARITY][25] ));
   HS65_LSS_XOR2X23 FE_RC_428_0 (.Z(data_cd[26]), 
	.B(\LEDR_link_f[PHIT][26] ), 
	.A(\LEDR_link_f[PHIT_PARITY][26] ));
   HS65_LSS_XOR2X23 FE_RC_427_0 (.Z(data_cd[32]), 
	.B(\LEDR_link_f[PHIT][32] ), 
	.A(\LEDR_link_f[PHIT_PARITY][32] ));
   HS65_LSS_XOR2X23 FE_RC_224_0 (.Z(data_cd[24]), 
	.B(\LEDR_link_f[PHIT][24] ), 
	.A(\LEDR_link_f[PHIT_PARITY][24] ));
   HS65_LSS_XOR2X23 FE_RC_223_0 (.Z(data_cd[27]), 
	.B(\LEDR_link_f[PHIT][27] ), 
	.A(\LEDR_link_f[PHIT_PARITY][27] ));
   HS65_LSS_XOR2X23 FE_RC_49_0 (.Z(data_cd[7]), 
	.B(\LEDR_link_f[PHIT][7] ), 
	.A(\LEDR_link_f[PHIT_PARITY][7] ));
   HS65_LSS_XOR2X23 FE_RC_48_0 (.Z(data_cd[9]), 
	.B(\LEDR_link_f[PHIT][9] ), 
	.A(\LEDR_link_f[PHIT_PARITY][9] ));
   HS65_LSS_XOR2X23 FE_RC_47_0 (.Z(data_cd[2]), 
	.B(\LEDR_link_f[PHIT][2] ), 
	.A(\LEDR_link_f[PHIT_PARITY][2] ));
   HS65_LSS_XOR2X23 FE_RC_46_0 (.Z(data_cd[30]), 
	.B(\LEDR_link_f[PHIT][30] ), 
	.A(\LEDR_link_f[PHIT_PARITY][30] ));
   HS65_LSS_XOR2X23 FE_RC_45_0 (.Z(data_cd[29]), 
	.B(\LEDR_link_f[PHIT][29] ), 
	.A(\LEDR_link_f[PHIT_PARITY][29] ));
   HS65_LSS_XOR2X23 FE_RC_44_0 (.Z(data_cd[31]), 
	.B(\LEDR_link_f[PHIT][31] ), 
	.A(\LEDR_link_f[PHIT_PARITY][31] ));
   select_element_3 select_element (.preset(FE_OFN1004_preset), 
	.\input (token_phase), 
	.true(full_phase), 
	.false(empty_phase), 
	.sel(\LEDR_link_f[TOKEN_T] ));
   c_gate_0_13 data_cd_c (.preset(FE_OFN1004_preset), 
	.a(full_phase), 
	.b(data_phase), 
	.c(data_cd_phase));
   c_gate_generic_0_33_3 data_ch (.preset(FE_OFN2_preset), 
	.\input ({ data_cd[32],
		data_cd[31],
		data_cd[30],
		data_cd[29],
		data_cd[28],
		data_cd[27],
		data_cd[26],
		data_cd[25],
		data_cd[24],
		data_cd[23],
		data_cd[22],
		FE_OCP_RBN313_data_cd_21_,
		FE_OCP_RBN314_data_cd_20_,
		data_cd[19],
		data_cd[18],
		data_cd[17],
		data_cd[16],
		data_cd[15],
		data_cd[14],
		data_cd[13],
		data_cd[12],
		data_cd[11],
		data_cd[10],
		data_cd[9],
		data_cd[8],
		data_cd[7],
		data_cd[6],
		data_cd[5],
		data_cd[4],
		data_cd[3],
		data_cd[2],
		data_cd[1],
		data_cd[0] }), 
	.\output (data_phase), 
	.FE_OCP_RBN315_data_cd_20_(FE_OCP_RBN315_data_cd_20_), 
	.FE_OFN1000_preset(FE_OFN1000_preset));
   latch_controller_1_8 latch_controller (.preset(FE_OFN1004_preset), 
	.Rin(req_in), 
	.Aout(\LEDR_link_b[ACK] ), 
	.Rout(\bundled_ch_f[REQ] ), 
	.Ain(\bundled_ch_b[ACK] ), 
	.lt_en(latch_enable));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][31]  (.Q(\bundled_ch_f[DATA][31] ), 
	.G(N3), 
	.D(N35));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][29]  (.Q(\bundled_ch_f[DATA][29] ), 
	.G(N3), 
	.D(N33));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][27]  (.Q(\bundled_ch_f[DATA][27] ), 
	.G(N3), 
	.D(N31));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][25]  (.Q(\bundled_ch_f[DATA][25] ), 
	.G(N3), 
	.D(N29));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][23]  (.Q(\bundled_ch_f[DATA][23] ), 
	.G(N3), 
	.D(N27));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][21]  (.Q(\bundled_ch_f[DATA][21] ), 
	.G(N3), 
	.D(N25));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][19]  (.Q(\bundled_ch_f[DATA][19] ), 
	.G(N3), 
	.D(N23));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][17]  (.Q(\bundled_ch_f[DATA][17] ), 
	.G(N3), 
	.D(N21));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][15]  (.Q(\bundled_ch_f[DATA][15] ), 
	.G(N3), 
	.D(N19));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][13]  (.Q(\bundled_ch_f[DATA][13] ), 
	.G(N3), 
	.D(N17));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][11]  (.Q(\bundled_ch_f[DATA][11] ), 
	.G(N3), 
	.D(N15));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][9]  (.Q(\bundled_ch_f[DATA][9] ), 
	.G(N3), 
	.D(N13));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][7]  (.Q(\bundled_ch_f[DATA][7] ), 
	.G(N3), 
	.D(N11));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][5]  (.Q(\bundled_ch_f[DATA][5] ), 
	.G(N3), 
	.D(N9));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][3]  (.Q(\bundled_ch_f[DATA][3] ), 
	.G(N3), 
	.D(N7));
   HS65_LS_LDLRQX18 \bundled_ch_f_reg[DATA][33]  (.RN(n1), 
	.Q(\bundled_ch_f[DATA][33] ), 
	.GN(latch_enable), 
	.D(FE_PHN1411_east_in_f_67_));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][28]  (.Q(\bundled_ch_f[DATA][28] ), 
	.G(N3), 
	.D(N32));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][26]  (.Q(\bundled_ch_f[DATA][26] ), 
	.G(N3), 
	.D(N30));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][24]  (.Q(\bundled_ch_f[DATA][24] ), 
	.G(N3), 
	.D(N28));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][22]  (.Q(\bundled_ch_f[DATA][22] ), 
	.G(N3), 
	.D(N26));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][20]  (.Q(\bundled_ch_f[DATA][20] ), 
	.G(N3), 
	.D(N24));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][18]  (.Q(\bundled_ch_f[DATA][18] ), 
	.G(N3), 
	.D(N22));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][16]  (.Q(\bundled_ch_f[DATA][16] ), 
	.G(N3), 
	.D(N20));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][14]  (.Q(\bundled_ch_f[DATA][14] ), 
	.G(N3), 
	.D(N18));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][12]  (.Q(\bundled_ch_f[DATA][12] ), 
	.G(N3), 
	.D(N16));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][10]  (.Q(\bundled_ch_f[DATA][10] ), 
	.G(N3), 
	.D(N14));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][8]  (.Q(\bundled_ch_f[DATA][8] ), 
	.G(N3), 
	.D(N12));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][6]  (.Q(\bundled_ch_f[DATA][6] ), 
	.G(N3), 
	.D(N10));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][4]  (.Q(\bundled_ch_f[DATA][4] ), 
	.G(N3), 
	.D(N8));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][2]  (.Q(\bundled_ch_f[DATA][2] ), 
	.G(N3), 
	.D(N6));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][30]  (.Q(\bundled_ch_f[DATA][30] ), 
	.G(N3), 
	.D(N34));
   HS65_LS_LDHQX18 \bundled_ch_f_reg[DATA][1]  (.Q(\bundled_ch_f[DATA][1] ), 
	.G(N3), 
	.D(N5));
   HS65_LS_LDHQX18 \bundled_ch_f_reg[DATA][32]  (.Q(\bundled_ch_f[DATA][32] ), 
	.G(N3), 
	.D(N36));
   HS65_LS_LDHQX18 \bundled_ch_f_reg[DATA][0]  (.Q(\bundled_ch_f[DATA][0] ), 
	.G(N3), 
	.D(N4));
   HS65_LSS_XOR2X23 U5 (.Z(data_cd[3]), 
	.B(\LEDR_link_f[PHIT][3] ), 
	.A(\LEDR_link_f[PHIT_PARITY][3] ));
   HS65_LSS_XOR2X23 U6 (.Z(data_cd[8]), 
	.B(\LEDR_link_f[PHIT][8] ), 
	.A(\LEDR_link_f[PHIT_PARITY][8] ));
   HS65_LSS_XOR2X23 U8 (.Z(data_cd[16]), 
	.B(\LEDR_link_f[PHIT][16] ), 
	.A(\LEDR_link_f[PHIT_PARITY][16] ));
   HS65_LSS_XOR2X23 U9 (.Z(data_cd[15]), 
	.B(\LEDR_link_f[PHIT][15] ), 
	.A(\LEDR_link_f[PHIT_PARITY][15] ));
   HS65_LSS_XOR2X23 U13 (.Z(data_cd[12]), 
	.B(\LEDR_link_f[PHIT][12] ), 
	.A(\LEDR_link_f[PHIT_PARITY][12] ));
   HS65_LSS_XOR2X23 U14 (.Z(data_cd[1]), 
	.B(\LEDR_link_f[PHIT][1] ), 
	.A(\LEDR_link_f[PHIT_PARITY][1] ));
   HS65_LSS_XOR2X23 U18 (.Z(data_cd[19]), 
	.B(\LEDR_link_f[PHIT][19] ), 
	.A(\LEDR_link_f[PHIT_PARITY][19] ));
   HS65_LSS_XOR2X23 U19 (.Z(data_cd[22]), 
	.B(\LEDR_link_f[PHIT_PARITY][22] ), 
	.A(\LEDR_link_f[PHIT][22] ));
   HS65_LSS_XOR2X23 U20 (.Z(data_cd[11]), 
	.B(\LEDR_link_f[PHIT][11] ), 
	.A(\LEDR_link_f[PHIT_PARITY][11] ));
   HS65_LSS_XOR2X23 U22 (.Z(data_cd[0]), 
	.B(\LEDR_link_f[PHIT][0] ), 
	.A(\LEDR_link_f[PHIT_PARITY][0] ));
   HS65_LSS_XOR2X23 U24 (.Z(data_cd[13]), 
	.B(\LEDR_link_f[PHIT][13] ), 
	.A(\LEDR_link_f[PHIT_PARITY][13] ));
   HS65_LSS_XOR2X23 U25 (.Z(data_cd[14]), 
	.B(\LEDR_link_f[PHIT][14] ), 
	.A(\LEDR_link_f[PHIT_PARITY][14] ));
   HS65_LSS_XOR2X23 U26 (.Z(data_cd[17]), 
	.B(\LEDR_link_f[PHIT][17] ), 
	.A(\LEDR_link_f[PHIT_PARITY][17] ));
   HS65_LSS_XOR2X23 U27 (.Z(data_cd[18]), 
	.B(\LEDR_link_f[PHIT][18] ), 
	.A(\LEDR_link_f[PHIT_PARITY][18] ));
   HS65_LSS_XOR2X23 U28 (.Z(data_cd[20]), 
	.B(\LEDR_link_f[PHIT][20] ), 
	.A(\LEDR_link_f[PHIT_PARITY][20] ));
   HS65_LSS_XOR2X23 U30 (.Z(data_cd[28]), 
	.B(\LEDR_link_f[PHIT][28] ), 
	.A(\LEDR_link_f[PHIT_PARITY][28] ));
   HS65_LSS_XOR2X23 U34 (.Z(data_cd[5]), 
	.B(\LEDR_link_f[PHIT][5] ), 
	.A(\LEDR_link_f[PHIT_PARITY][5] ));
   HS65_LSS_XNOR2X6 U36 (.Z(token_phase), 
	.B(\LEDR_link_f[TOKEN_PARITY] ), 
	.A(n3));
   HS65_LS_IVX9 U37 (.Z(n1), 
	.A(preset));
   HS65_LS_IVX9 U38 (.Z(n3), 
	.A(\LEDR_link_f[TOKEN_T] ));
   HS65_LS_NOR2AX3 U39 (.Z(N4), 
	.B(FE_OFN1000_preset), 
	.A(\LEDR_link_f[PHIT][0] ));
   HS65_LS_NOR2AX3 U40 (.Z(N5), 
	.B(FE_OFN2_preset), 
	.A(\LEDR_link_f[PHIT][1] ));
   HS65_LS_NOR2AX3 U41 (.Z(N6), 
	.B(FE_OFN1004_preset), 
	.A(\LEDR_link_f[PHIT][2] ));
   HS65_LS_NOR2AX3 U42 (.Z(N7), 
	.B(FE_OFN2_preset), 
	.A(\LEDR_link_f[PHIT][3] ));
   HS65_LS_NOR2AX3 U43 (.Z(N8), 
	.B(FE_OFN1004_preset), 
	.A(\LEDR_link_f[PHIT][4] ));
   HS65_LS_NOR2AX3 U44 (.Z(N10), 
	.B(FE_OFN1004_preset), 
	.A(\LEDR_link_f[PHIT][6] ));
   HS65_LS_NOR2AX3 U45 (.Z(N28), 
	.B(FE_OFN1004_preset), 
	.A(\LEDR_link_f[PHIT][24] ));
   HS65_LS_NOR2AX3 U46 (.Z(N29), 
	.B(FE_OFN1004_preset), 
	.A(\LEDR_link_f[PHIT][25] ));
   HS65_LS_NOR2AX3 U47 (.Z(N30), 
	.B(FE_OFN1004_preset), 
	.A(\LEDR_link_f[PHIT][26] ));
   HS65_LS_NOR2AX3 U48 (.Z(N31), 
	.B(FE_OFN1004_preset), 
	.A(\LEDR_link_f[PHIT][27] ));
   HS65_LS_NOR2AX3 U49 (.Z(N32), 
	.B(FE_OFN1004_preset), 
	.A(\LEDR_link_f[PHIT][28] ));
   HS65_LS_NOR2AX3 U50 (.Z(N33), 
	.B(FE_OFN1004_preset), 
	.A(\LEDR_link_f[PHIT][29] ));
   HS65_LS_NOR2AX3 U51 (.Z(N34), 
	.B(FE_OFN1004_preset), 
	.A(\LEDR_link_f[PHIT][30] ));
   HS65_LS_NOR2AX3 U52 (.Z(N35), 
	.B(FE_OFN1004_preset), 
	.A(\LEDR_link_f[PHIT][31] ));
   HS65_LS_NOR2AX3 U53 (.Z(N36), 
	.B(FE_OFN1004_preset), 
	.A(\LEDR_link_f[PHIT][32] ));
   HS65_LS_NOR2AX3 U54 (.Z(N9), 
	.B(FE_OFN2_preset), 
	.A(\LEDR_link_f[PHIT][5] ));
   HS65_LS_NOR2AX3 U55 (.Z(N11), 
	.B(FE_OFN2_preset), 
	.A(\LEDR_link_f[PHIT][7] ));
   HS65_LS_NOR2AX3 U56 (.Z(N12), 
	.B(FE_OFN2_preset), 
	.A(\LEDR_link_f[PHIT][8] ));
   HS65_LS_NOR2AX3 U57 (.Z(N13), 
	.B(FE_OFN1000_preset), 
	.A(\LEDR_link_f[PHIT][9] ));
   HS65_LS_NOR2AX3 U58 (.Z(N14), 
	.B(FE_OFN1000_preset), 
	.A(\LEDR_link_f[PHIT][10] ));
   HS65_LS_NOR2AX3 U59 (.Z(N15), 
	.B(FE_OFN1001_preset), 
	.A(\LEDR_link_f[PHIT][11] ));
   HS65_LS_NOR2AX3 U60 (.Z(N16), 
	.B(FE_OFN1000_preset), 
	.A(\LEDR_link_f[PHIT][12] ));
   HS65_LS_NOR2AX3 U61 (.Z(N17), 
	.B(FE_OFN1002_preset), 
	.A(\LEDR_link_f[PHIT][13] ));
   HS65_LS_NOR2AX3 U62 (.Z(N18), 
	.B(FE_OFN1001_preset), 
	.A(\LEDR_link_f[PHIT][14] ));
   HS65_LS_NOR2AX3 U63 (.Z(N19), 
	.B(FE_OFN1002_preset), 
	.A(\LEDR_link_f[PHIT][15] ));
   HS65_LS_NOR2AX3 U64 (.Z(N20), 
	.B(FE_OFN1000_preset), 
	.A(\LEDR_link_f[PHIT][16] ));
   HS65_LS_NOR2AX3 U65 (.Z(N21), 
	.B(FE_OFN1002_preset), 
	.A(\LEDR_link_f[PHIT][17] ));
   HS65_LS_NOR2AX3 U66 (.Z(N22), 
	.B(FE_OFN1000_preset), 
	.A(\LEDR_link_f[PHIT][18] ));
   HS65_LS_NOR2AX3 U67 (.Z(N23), 
	.B(FE_OFN1000_preset), 
	.A(\LEDR_link_f[PHIT][19] ));
   HS65_LS_NOR2AX3 U68 (.Z(N24), 
	.B(FE_OFN1000_preset), 
	.A(\LEDR_link_f[PHIT][20] ));
   HS65_LS_NOR2AX3 U69 (.Z(N25), 
	.B(FE_OFN1000_preset), 
	.A(\LEDR_link_f[PHIT][21] ));
   HS65_LS_NOR2AX3 U70 (.Z(N26), 
	.B(FE_OFN1000_preset), 
	.A(\LEDR_link_f[PHIT][22] ));
   HS65_LS_NOR2AX3 U71 (.Z(N27), 
	.B(FE_OFN1000_preset), 
	.A(\LEDR_link_f[PHIT][23] ));
   HS65_LS_OAI21X3 U72 (.Z(N3), 
	.C(n1), 
	.B(n3), 
	.A(latch_enable));
   HS65_LSS_XOR2X6 U73 (.Z(req_in), 
	.B(data_cd_phase), 
	.A(empty_phase));
endmodule

module select_element_4 (
	preset, 
	\input , 
	true, 
	false, 
	sel);
   input preset;
   input \input ;
   output true;
   output false;
   input sel;

   // Internal wires
   wire n1;
   wire n2;
   wire n3;

   HS65_LS_LDHRQX9 true_latch_out_reg (.RN(n3), 
	.Q(true), 
	.G(sel), 
	.D(n1));
   HS65_LS_LDLRQX9 false_latch_out_reg (.RN(n3), 
	.Q(false), 
	.GN(sel), 
	.D(n2));
   HS65_LSS_XOR2X6 U3 (.Z(n1), 
	.B(false), 
	.A(\input ));
   HS65_LS_IVX9 U4 (.Z(n3), 
	.A(preset));
   HS65_LSS_XOR2X6 U5 (.Z(n2), 
	.B(true), 
	.A(\input ));
endmodule

module sr_latch_0_18 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire N1;
   wire n1;

   HS65_LS_AND2X18 C8 (.Z(q), 
	.B(N1), 
	.A(n1));
   HS65_LS_IVX9 U1 (.Z(N1), 
	.A(qn));
   HS65_LS_IVX9 U2 (.Z(n1), 
	.A(r));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_0_14 (
	preset, 
	a, 
	b, 
	c);
   input preset;
   input a;
   input b;
   output c;

   // Internal wires
   wire set;
   wire reset;
   wire n1;

   HS65_LS_OAI12X12 FE_RC_154_0 (.Z(reset), 
	.C(n1), 
	.B(b), 
	.A(a));
   sr_latch_0_18 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LH_AND3X4 U4 (.Z(set), 
	.C(a), 
	.B(n1), 
	.A(b));
   HS65_LS_IVX9 U5 (.Z(n1), 
	.A(preset));
endmodule

module sr_latch_0_17 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire N1;
   wire n1;

   HS65_LS_AND2X27 C8 (.Z(q), 
	.B(N1), 
	.A(n1));
   HS65_LS_IVX9 U1 (.Z(n1), 
	.A(r));
   HS65_LS_IVX9 U2 (.Z(N1), 
	.A(qn));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_generic_0_33_4 (
	preset, 
	\input , 
	\output , 
	FE_OCPN1195_preset);
   input preset;
   input [32:0] \input ;
   output \output ;
   input FE_OCPN1195_preset;

   // Internal wires
   wire FE_RN_1150_0;
   wire FE_RN_1149_0;
   wire FE_RN_1148_0;
   wire FE_RN_1147_0;
   wire FE_RN_1146_0;
   wire FE_RN_1145_0;
   wire FE_RN_1144_0;
   wire FE_RN_1143_0;
   wire FE_RN_1142_0;
   wire FE_RN_1141_0;
   wire FE_RN_1140_0;
   wire FE_RN_1139_0;
   wire FE_RN_1138_0;
   wire FE_RN_1137_0;
   wire FE_RN_1136_0;
   wire FE_RN_1135_0;
   wire FE_RN_1134_0;
   wire FE_RN_1133_0;
   wire FE_RN_1132_0;
   wire FE_RN_1131_0;
   wire FE_RN_1130_0;
   wire FE_RN_1129_0;
   wire FE_RN_1128_0;
   wire FE_RN_1127_0;
   wire FE_RN_1126_0;
   wire FE_RN_1125_0;
   wire FE_RN_1124_0;
   wire FE_RN_1123_0;
   wire FE_RN_1122_0;
   wire FE_OFN1035_preset;
   wire FE_OCPN530_data_cd_25_;
   wire set;
   wire reset;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n70;
   wire n71;
   wire n72;
   wire n73;
   wire n74;
   wire n75;

   HS65_LS_CNNAND2X18 FE_RC_1502_0 (.Z(FE_RN_1150_0), 
	.B(n62), 
	.A(n63));
   HS65_LS_CNNOR2X15 FE_RC_1501_0 (.Z(FE_RN_1149_0), 
	.B(\input [7]), 
	.A(\input [8]));
   HS65_LS_NOR2X25 FE_RC_1500_0 (.Z(FE_RN_1148_0), 
	.B(\input [9]), 
	.A(\input [3]));
   HS65_LS_CNNAND2X18 FE_RC_1499_0 (.Z(FE_RN_1147_0), 
	.B(FE_RN_1148_0), 
	.A(FE_RN_1149_0));
   HS65_LS_CNNOR2X15 FE_RC_1498_0 (.Z(FE_RN_1146_0), 
	.B(FE_RN_1147_0), 
	.A(FE_RN_1150_0));
   HS65_LS_NAND2X14 FE_RC_1497_0 (.Z(FE_RN_1145_0), 
	.B(n73), 
	.A(n75));
   HS65_LS_CNNAND2AX18 FE_RC_1496_0 (.Z(FE_RN_1144_0), 
	.B(n74), 
	.A(\input [4]));
   HS65_LS_CNNOR2X15 FE_RC_1495_0 (.Z(FE_RN_1143_0), 
	.B(FE_RN_1144_0), 
	.A(FE_RN_1145_0));
   HS65_LS_NOR2X19 FE_RC_1494_0 (.Z(FE_RN_1142_0), 
	.B(\input [26]), 
	.A(\input [27]));
   HS65_LS_NOR2X19 FE_RC_1493_0 (.Z(FE_RN_1141_0), 
	.B(\input [24]), 
	.A(\input [25]));
   HS65_LS_CNNAND2X18 FE_RC_1492_0 (.Z(FE_RN_1140_0), 
	.B(FE_RN_1141_0), 
	.A(FE_RN_1142_0));
   HS65_LS_CNNOR2X24 FE_RC_1491_0 (.Z(FE_RN_1139_0), 
	.B(\input [2]), 
	.A(\input [30]));
   HS65_LS_NAND2X21 FE_RC_1490_0 (.Z(FE_RN_1138_0), 
	.B(FE_RN_1139_0), 
	.A(n72));
   HS65_LS_CNNOR2X15 FE_RC_1489_0 (.Z(FE_RN_1137_0), 
	.B(FE_RN_1140_0), 
	.A(FE_RN_1138_0));
   HS65_LS_NAND3X13 FE_RC_1488_0 (.Z(FE_RN_1136_0), 
	.C(FE_RN_1137_0), 
	.B(FE_RN_1143_0), 
	.A(FE_RN_1146_0));
   HS65_LS_NAND2X14 FE_RC_1487_0 (.Z(FE_RN_1135_0), 
	.B(n71), 
	.A(n68));
   HS65_LS_CNNOR2X15 FE_RC_1486_0 (.Z(FE_RN_1134_0), 
	.B(\input [22]), 
	.A(\input [23]));
   HS65_LS_CNNAND2X18 FE_RC_1485_0 (.Z(FE_RN_1133_0), 
	.B(FE_RN_1134_0), 
	.A(n70));
   HS65_LS_CNNOR2X24 FE_RC_1484_0 (.Z(FE_RN_1132_0), 
	.B(\input [19]), 
	.A(\input [1]));
   HS65_LS_CNNAND2X18 FE_RC_1483_0 (.Z(FE_RN_1131_0), 
	.B(FE_RN_1132_0), 
	.A(n69));
   HS65_LS_NOR3X26 FE_RC_1482_0 (.Z(FE_RN_1130_0), 
	.C(FE_RN_1133_0), 
	.B(FE_RN_1131_0), 
	.A(FE_RN_1135_0));
   HS65_LS_NAND2X21 FE_RC_1481_0 (.Z(FE_RN_1129_0), 
	.B(n65), 
	.A(n66));
   HS65_LS_CNNOR2X24 FE_RC_1480_0 (.Z(FE_RN_1128_0), 
	.B(\input [15]), 
	.A(\input [16]));
   HS65_LS_CNNAND2X18 FE_RC_1479_0 (.Z(FE_RN_1127_0), 
	.B(FE_RN_1128_0), 
	.A(n67));
   HS65_LS_NOR2X19 FE_RC_1478_0 (.Z(FE_RN_1126_0), 
	.B(\input [11]), 
	.A(\input [12]));
   HS65_LS_CNNAND2X18 FE_RC_1477_0 (.Z(FE_RN_1125_0), 
	.B(FE_RN_1126_0), 
	.A(n61));
   HS65_LS_NOR3X26 FE_RC_1476_0 (.Z(FE_RN_1124_0), 
	.C(FE_RN_1125_0), 
	.B(FE_RN_1127_0), 
	.A(FE_RN_1129_0));
   HS65_LS_CNNAND2X24 FE_RC_1475_0 (.Z(FE_RN_1123_0), 
	.B(FE_RN_1124_0), 
	.A(FE_RN_1130_0));
   HS65_LS_CNIVX7 FE_RC_1474_0 (.Z(FE_RN_1122_0), 
	.A(FE_OFN1035_preset));
   HS65_LS_OAI12X12 FE_RC_1473_0 (.Z(reset), 
	.C(FE_RN_1122_0), 
	.B(FE_RN_1123_0), 
	.A(FE_RN_1136_0));
   HS65_LS_BFX7 FE_OFC1035_preset (.Z(FE_OFN1035_preset), 
	.A(preset));
   HS65_LS_BFX7 FE_OCPC530_data_cd_25_ (.Z(FE_OCPN530_data_cd_25_), 
	.A(\input [25]));
   sr_latch_0_17 latch (.s(set), 
	.r(reset), 
	.q(\output ));
   HS65_LH_NOR4ABX2 U3 (.Z(n52), 
	.D(n73), 
	.C(n74), 
	.B(\input [30]), 
	.A(\input [2]));
   HS65_LS_CNIVX27 U14 (.Z(n68), 
	.A(\input [17]));
   HS65_LS_CNIVX27 U15 (.Z(n70), 
	.A(\input [20]));
   HS65_LS_CNIVX34 U17 (.Z(n72), 
	.A(\input [28]));
   HS65_LS_CNIVX27 U18 (.Z(n69), 
	.A(\input [18]));
   HS65_LS_CNIVX27 U19 (.Z(n71), 
	.A(\input [21]));
   HS65_LS_CNIVX27 U20 (.Z(n73), 
	.A(\input [29]));
   HS65_LS_CNIVX27 U21 (.Z(n62), 
	.A(\input [5]));
   HS65_LS_CNIVX21 U22 (.Z(n63), 
	.A(\input [6]));
   HS65_LS_CNIVX27 U23 (.Z(n66), 
	.A(\input [13]));
   HS65_LS_CNIVX27 U24 (.Z(n74), 
	.A(\input [31]));
   HS65_LS_CNIVX27 U25 (.Z(n65), 
	.A(\input [10]));
   HS65_LS_CNIVX34 U26 (.Z(n61), 
	.A(\input [0]));
   HS65_LS_CNIVX27 U27 (.Z(n67), 
	.A(\input [14]));
   HS65_LS_CNIVX21 U28 (.Z(n75), 
	.A(\input [32]));
   HS65_LS_NOR3X4 U30 (.Z(n56), 
	.C(n61), 
	.B(FE_OCPN1195_preset), 
	.A(n65));
   HS65_LS_NOR3AX2 U31 (.Z(n51), 
	.C(n72), 
	.B(n50), 
	.A(\input [27]));
   HS65_LS_NOR4ABX2 U33 (.Z(n60), 
	.D(n71), 
	.C(n70), 
	.B(\input [22]), 
	.A(\input [23]));
   HS65_LS_NOR4ABX2 U34 (.Z(n59), 
	.D(n69), 
	.C(n68), 
	.B(\input [19]), 
	.A(\input [1]));
   HS65_LS_NOR4ABX2 U35 (.Z(set), 
	.D(n57), 
	.C(n58), 
	.B(n59), 
	.A(n60));
   HS65_LS_NAND4ABX3 U36 (.Z(n58), 
	.D(n51), 
	.C(n52), 
	.B(n53), 
	.A(n54));
   HS65_LS_NOR4ABX2 U37 (.Z(n55), 
	.D(n67), 
	.C(n66), 
	.B(\input [15]), 
	.A(\input [16]));
   HS65_LS_NAND3X5 U38 (.Z(n50), 
	.C(\input [26]), 
	.B(\input [24]), 
	.A(FE_OCPN530_data_cd_25_));
   HS65_LS_NAND4ABX3 U39 (.Z(n54), 
	.D(\input [4]), 
	.C(\input [3]), 
	.B(n62), 
	.A(n75));
   HS65_LS_NAND4ABX3 U40 (.Z(n53), 
	.D(\input [8]), 
	.C(\input [7]), 
	.B(n64), 
	.A(n63));
   HS65_LS_NAND4X9 U41 (.Z(n57), 
	.D(n55), 
	.C(n56), 
	.B(\input [12]), 
	.A(\input [11]));
   HS65_LS_IVX9 U42 (.Z(n64), 
	.A(\input [9]));
endmodule

module sr_latch_0_9 (
	s, 
	r, 
	q, 
	qn);
   input s;
   input r;
   output q;
   output qn;

   // Internal wires
   wire FE_PHN1471_n1;
   wire FE_PHN1467_n1;
   wire N1;
   wire n1;

   HS65_LH_BFX7 FE_PHC1471_n1 (.Z(FE_PHN1471_n1), 
	.A(n1));
   HS65_LH_DLYIC2X9 FE_PHC1467_n1 (.Z(FE_PHN1467_n1), 
	.A(FE_PHN1471_n1));
   HS65_LH_AND2X4 C8 (.Z(q), 
	.B(N1), 
	.A(FE_PHN1467_n1));
   HS65_LH_IVX62 U1 (.Z(n1), 
	.A(r));
   HS65_LS_IVX9 U2 (.Z(N1), 
	.A(qn));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_0_9 (
	preset, 
	a, 
	b, 
	c);
   input preset;
   input a;
   input b;
   output c;

   // Internal wires
   wire set;
   wire reset;
   wire n1;

   sr_latch_0_9 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_OAI12X3 U3 (.Z(reset), 
	.C(n1), 
	.B(a), 
	.A(b));
   HS65_LS_IVX9 U4 (.Z(n1), 
	.A(preset));
   HS65_LS_AND3X9 U5 (.Z(set), 
	.C(a), 
	.B(n1), 
	.A(b));
endmodule

module latch_controller_1_9 (
	preset, 
	Rin, 
	Aout, 
	Rout, 
	Ain, 
	lt_en);
   input preset;
   input Rin;
   output Aout;
   output Rout;
   input Ain;
   output lt_en;

   // Internal wires
   wire FE_PHN1431_d;
   wire FE_PHN1415_south_hpu_b_ACK;
   wire FE_PHN1397_d;
   wire FE_PHN1393_south_hpu_b_ACK;
   wire not_Ain;
   wire d;

   HS65_LH_BFX9 FE_PHC1431_d (.Z(d), 
	.A(FE_PHN1431_d));
   HS65_LH_BFX9 FE_PHC1415_south_hpu_b_ACK (.Z(FE_PHN1415_south_hpu_b_ACK), 
	.A(Ain));
   HS65_LH_DLYIC4X9 FE_PHC1397_d (.Z(FE_PHN1431_d), 
	.A(FE_PHN1397_d));
   HS65_LH_DLYIC2X9 FE_PHC1393_south_hpu_b_ACK (.Z(FE_PHN1393_south_hpu_b_ACK), 
	.A(FE_PHN1415_south_hpu_b_ACK));
   c_gate_0_9 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Rout));
   HS65_LS_IVX9 I_1 (.Z(Aout), 
	.A(d));
   HS65_LS_IVX9 I_0 (.Z(not_Ain), 
	.A(FE_PHN1393_south_hpu_b_ACK));
   HS65_LH_IVX2 I_2 (.Z(FE_PHN1397_d), 
	.A(Rout));
   HS65_LSS_XOR2X6 U5 (.Z(lt_en), 
	.B(Ain), 
	.A(Rout));
endmodule

module LEDR2bundled_1_000000000_4 (
	preset, 
	.LEDR_link_f ( { \LEDR_link_f[TOKEN_T] , 
		\LEDR_link_f[TOKEN_PARITY] , 
		\LEDR_link_f[PHIT][32] , 
		\LEDR_link_f[PHIT][31] , 
		\LEDR_link_f[PHIT][30] , 
		\LEDR_link_f[PHIT][29] , 
		\LEDR_link_f[PHIT][28] , 
		\LEDR_link_f[PHIT][27] , 
		\LEDR_link_f[PHIT][26] , 
		\LEDR_link_f[PHIT][25] , 
		\LEDR_link_f[PHIT][24] , 
		\LEDR_link_f[PHIT][23] , 
		\LEDR_link_f[PHIT][22] , 
		\LEDR_link_f[PHIT][21] , 
		\LEDR_link_f[PHIT][20] , 
		\LEDR_link_f[PHIT][19] , 
		\LEDR_link_f[PHIT][18] , 
		\LEDR_link_f[PHIT][17] , 
		\LEDR_link_f[PHIT][16] , 
		\LEDR_link_f[PHIT][15] , 
		\LEDR_link_f[PHIT][14] , 
		\LEDR_link_f[PHIT][13] , 
		\LEDR_link_f[PHIT][12] , 
		\LEDR_link_f[PHIT][11] , 
		\LEDR_link_f[PHIT][10] , 
		\LEDR_link_f[PHIT][9] , 
		\LEDR_link_f[PHIT][8] , 
		\LEDR_link_f[PHIT][7] , 
		\LEDR_link_f[PHIT][6] , 
		\LEDR_link_f[PHIT][5] , 
		\LEDR_link_f[PHIT][4] , 
		\LEDR_link_f[PHIT][3] , 
		\LEDR_link_f[PHIT][2] , 
		\LEDR_link_f[PHIT][1] , 
		\LEDR_link_f[PHIT][0] , 
		\LEDR_link_f[PHIT_PARITY][32] , 
		\LEDR_link_f[PHIT_PARITY][31] , 
		\LEDR_link_f[PHIT_PARITY][30] , 
		\LEDR_link_f[PHIT_PARITY][29] , 
		\LEDR_link_f[PHIT_PARITY][28] , 
		\LEDR_link_f[PHIT_PARITY][27] , 
		\LEDR_link_f[PHIT_PARITY][26] , 
		\LEDR_link_f[PHIT_PARITY][25] , 
		\LEDR_link_f[PHIT_PARITY][24] , 
		\LEDR_link_f[PHIT_PARITY][23] , 
		\LEDR_link_f[PHIT_PARITY][22] , 
		\LEDR_link_f[PHIT_PARITY][21] , 
		\LEDR_link_f[PHIT_PARITY][20] , 
		\LEDR_link_f[PHIT_PARITY][19] , 
		\LEDR_link_f[PHIT_PARITY][18] , 
		\LEDR_link_f[PHIT_PARITY][17] , 
		\LEDR_link_f[PHIT_PARITY][16] , 
		\LEDR_link_f[PHIT_PARITY][15] , 
		\LEDR_link_f[PHIT_PARITY][14] , 
		\LEDR_link_f[PHIT_PARITY][13] , 
		\LEDR_link_f[PHIT_PARITY][12] , 
		\LEDR_link_f[PHIT_PARITY][11] , 
		\LEDR_link_f[PHIT_PARITY][10] , 
		\LEDR_link_f[PHIT_PARITY][9] , 
		\LEDR_link_f[PHIT_PARITY][8] , 
		\LEDR_link_f[PHIT_PARITY][7] , 
		\LEDR_link_f[PHIT_PARITY][6] , 
		\LEDR_link_f[PHIT_PARITY][5] , 
		\LEDR_link_f[PHIT_PARITY][4] , 
		\LEDR_link_f[PHIT_PARITY][3] , 
		\LEDR_link_f[PHIT_PARITY][2] , 
		\LEDR_link_f[PHIT_PARITY][1] , 
		\LEDR_link_f[PHIT_PARITY][0]  } ), 
	.LEDR_link_b ( \LEDR_link_b[ACK]  ), 
	.bundled_ch_f ( { \bundled_ch_f[REQ] , 
		\bundled_ch_f[DATA][33] , 
		\bundled_ch_f[DATA][32] , 
		\bundled_ch_f[DATA][31] , 
		\bundled_ch_f[DATA][30] , 
		\bundled_ch_f[DATA][29] , 
		\bundled_ch_f[DATA][28] , 
		\bundled_ch_f[DATA][27] , 
		\bundled_ch_f[DATA][26] , 
		\bundled_ch_f[DATA][25] , 
		\bundled_ch_f[DATA][24] , 
		\bundled_ch_f[DATA][23] , 
		\bundled_ch_f[DATA][22] , 
		\bundled_ch_f[DATA][21] , 
		\bundled_ch_f[DATA][20] , 
		\bundled_ch_f[DATA][19] , 
		\bundled_ch_f[DATA][18] , 
		\bundled_ch_f[DATA][17] , 
		\bundled_ch_f[DATA][16] , 
		\bundled_ch_f[DATA][15] , 
		\bundled_ch_f[DATA][14] , 
		\bundled_ch_f[DATA][13] , 
		\bundled_ch_f[DATA][12] , 
		\bundled_ch_f[DATA][11] , 
		\bundled_ch_f[DATA][10] , 
		\bundled_ch_f[DATA][9] , 
		\bundled_ch_f[DATA][8] , 
		\bundled_ch_f[DATA][7] , 
		\bundled_ch_f[DATA][6] , 
		\bundled_ch_f[DATA][5] , 
		\bundled_ch_f[DATA][4] , 
		\bundled_ch_f[DATA][3] , 
		\bundled_ch_f[DATA][2] , 
		\bundled_ch_f[DATA][1] , 
		\bundled_ch_f[DATA][0]  } ), 
	.bundled_ch_b ( \bundled_ch_b[ACK]  ), 
	FE_OFN1036_preset, 
	FE_OFN1037_preset, 
	FE_OCPN1195_preset, 
	FE_PHN1408_FE_OCPN1195_preset);
   input preset;
   input \LEDR_link_f[TOKEN_T] ;
   input \LEDR_link_f[TOKEN_PARITY] ;
   input \LEDR_link_f[PHIT][32] ;
   input \LEDR_link_f[PHIT][31] ;
   input \LEDR_link_f[PHIT][30] ;
   input \LEDR_link_f[PHIT][29] ;
   input \LEDR_link_f[PHIT][28] ;
   input \LEDR_link_f[PHIT][27] ;
   input \LEDR_link_f[PHIT][26] ;
   input \LEDR_link_f[PHIT][25] ;
   input \LEDR_link_f[PHIT][24] ;
   input \LEDR_link_f[PHIT][23] ;
   input \LEDR_link_f[PHIT][22] ;
   input \LEDR_link_f[PHIT][21] ;
   input \LEDR_link_f[PHIT][20] ;
   input \LEDR_link_f[PHIT][19] ;
   input \LEDR_link_f[PHIT][18] ;
   input \LEDR_link_f[PHIT][17] ;
   input \LEDR_link_f[PHIT][16] ;
   input \LEDR_link_f[PHIT][15] ;
   input \LEDR_link_f[PHIT][14] ;
   input \LEDR_link_f[PHIT][13] ;
   input \LEDR_link_f[PHIT][12] ;
   input \LEDR_link_f[PHIT][11] ;
   input \LEDR_link_f[PHIT][10] ;
   input \LEDR_link_f[PHIT][9] ;
   input \LEDR_link_f[PHIT][8] ;
   input \LEDR_link_f[PHIT][7] ;
   input \LEDR_link_f[PHIT][6] ;
   input \LEDR_link_f[PHIT][5] ;
   input \LEDR_link_f[PHIT][4] ;
   input \LEDR_link_f[PHIT][3] ;
   input \LEDR_link_f[PHIT][2] ;
   input \LEDR_link_f[PHIT][1] ;
   input \LEDR_link_f[PHIT][0] ;
   input \LEDR_link_f[PHIT_PARITY][32] ;
   input \LEDR_link_f[PHIT_PARITY][31] ;
   input \LEDR_link_f[PHIT_PARITY][30] ;
   input \LEDR_link_f[PHIT_PARITY][29] ;
   input \LEDR_link_f[PHIT_PARITY][28] ;
   input \LEDR_link_f[PHIT_PARITY][27] ;
   input \LEDR_link_f[PHIT_PARITY][26] ;
   input \LEDR_link_f[PHIT_PARITY][25] ;
   input \LEDR_link_f[PHIT_PARITY][24] ;
   input \LEDR_link_f[PHIT_PARITY][23] ;
   input \LEDR_link_f[PHIT_PARITY][22] ;
   input \LEDR_link_f[PHIT_PARITY][21] ;
   input \LEDR_link_f[PHIT_PARITY][20] ;
   input \LEDR_link_f[PHIT_PARITY][19] ;
   input \LEDR_link_f[PHIT_PARITY][18] ;
   input \LEDR_link_f[PHIT_PARITY][17] ;
   input \LEDR_link_f[PHIT_PARITY][16] ;
   input \LEDR_link_f[PHIT_PARITY][15] ;
   input \LEDR_link_f[PHIT_PARITY][14] ;
   input \LEDR_link_f[PHIT_PARITY][13] ;
   input \LEDR_link_f[PHIT_PARITY][12] ;
   input \LEDR_link_f[PHIT_PARITY][11] ;
   input \LEDR_link_f[PHIT_PARITY][10] ;
   input \LEDR_link_f[PHIT_PARITY][9] ;
   input \LEDR_link_f[PHIT_PARITY][8] ;
   input \LEDR_link_f[PHIT_PARITY][7] ;
   input \LEDR_link_f[PHIT_PARITY][6] ;
   input \LEDR_link_f[PHIT_PARITY][5] ;
   input \LEDR_link_f[PHIT_PARITY][4] ;
   input \LEDR_link_f[PHIT_PARITY][3] ;
   input \LEDR_link_f[PHIT_PARITY][2] ;
   input \LEDR_link_f[PHIT_PARITY][1] ;
   input \LEDR_link_f[PHIT_PARITY][0] ;
   output \LEDR_link_b[ACK] ;
   output \bundled_ch_f[REQ] ;
   output \bundled_ch_f[DATA][33] ;
   output \bundled_ch_f[DATA][32] ;
   output \bundled_ch_f[DATA][31] ;
   output \bundled_ch_f[DATA][30] ;
   output \bundled_ch_f[DATA][29] ;
   output \bundled_ch_f[DATA][28] ;
   output \bundled_ch_f[DATA][27] ;
   output \bundled_ch_f[DATA][26] ;
   output \bundled_ch_f[DATA][25] ;
   output \bundled_ch_f[DATA][24] ;
   output \bundled_ch_f[DATA][23] ;
   output \bundled_ch_f[DATA][22] ;
   output \bundled_ch_f[DATA][21] ;
   output \bundled_ch_f[DATA][20] ;
   output \bundled_ch_f[DATA][19] ;
   output \bundled_ch_f[DATA][18] ;
   output \bundled_ch_f[DATA][17] ;
   output \bundled_ch_f[DATA][16] ;
   output \bundled_ch_f[DATA][15] ;
   output \bundled_ch_f[DATA][14] ;
   output \bundled_ch_f[DATA][13] ;
   output \bundled_ch_f[DATA][12] ;
   output \bundled_ch_f[DATA][11] ;
   output \bundled_ch_f[DATA][10] ;
   output \bundled_ch_f[DATA][9] ;
   output \bundled_ch_f[DATA][8] ;
   output \bundled_ch_f[DATA][7] ;
   output \bundled_ch_f[DATA][6] ;
   output \bundled_ch_f[DATA][5] ;
   output \bundled_ch_f[DATA][4] ;
   output \bundled_ch_f[DATA][3] ;
   output \bundled_ch_f[DATA][2] ;
   output \bundled_ch_f[DATA][1] ;
   output \bundled_ch_f[DATA][0] ;
   input \bundled_ch_b[ACK] ;
   input FE_OFN1036_preset;
   input FE_OFN1037_preset;
   input FE_OCPN1195_preset;
   input FE_PHN1408_FE_OCPN1195_preset;

   // Internal wires
   wire FE_PHN1410_south_in_f_67_;
   wire FE_OCPN1194_preset;
   wire FE_OFN1039_preset;
   wire token_phase;
   wire full_phase;
   wire empty_phase;
   wire data_phase;
   wire data_cd_phase;
   wire req_in;
   wire latch_enable;
   wire N3;
   wire N4;
   wire N5;
   wire N6;
   wire N7;
   wire N8;
   wire N9;
   wire N10;
   wire N11;
   wire N12;
   wire N13;
   wire N14;
   wire N15;
   wire N16;
   wire N17;
   wire N18;
   wire N19;
   wire N20;
   wire N21;
   wire N22;
   wire N23;
   wire N24;
   wire N25;
   wire N26;
   wire N27;
   wire N28;
   wire N29;
   wire N30;
   wire N31;
   wire N32;
   wire N33;
   wire N34;
   wire N35;
   wire N36;
   wire n1;
   wire n3;
   wire [32:0] data_cd;

   HS65_LS_BFX7 FE_PHC1410_south_in_f_67_ (.Z(FE_PHN1410_south_in_f_67_), 
	.A(\LEDR_link_f[TOKEN_T] ));
   HS65_LS_BFX18 FE_OCPC1194_preset (.Z(FE_OCPN1194_preset), 
	.A(preset));
   HS65_LS_BFX9 FE_OFC1039_preset (.Z(FE_OFN1039_preset), 
	.A(FE_OFN1037_preset));
   HS65_LSS_XOR2X23 FE_RC_535_0 (.Z(data_cd[19]), 
	.B(\LEDR_link_f[PHIT][19] ), 
	.A(\LEDR_link_f[PHIT_PARITY][19] ));
   HS65_LSS_XOR2X23 FE_RC_534_0 (.Z(data_cd[17]), 
	.B(\LEDR_link_f[PHIT][17] ), 
	.A(\LEDR_link_f[PHIT_PARITY][17] ));
   HS65_LSS_XOR2X23 FE_RC_533_0 (.Z(data_cd[18]), 
	.B(\LEDR_link_f[PHIT][18] ), 
	.A(\LEDR_link_f[PHIT_PARITY][18] ));
   HS65_LSS_XOR2X23 FE_RC_226_0 (.Z(data_cd[8]), 
	.B(\LEDR_link_f[PHIT][8] ), 
	.A(\LEDR_link_f[PHIT_PARITY][8] ));
   HS65_LSS_XOR2X23 FE_RC_225_0 (.Z(data_cd[31]), 
	.B(\LEDR_link_f[PHIT][31] ), 
	.A(\LEDR_link_f[PHIT_PARITY][31] ));
   HS65_LSS_XOR2X23 FE_RC_51_0 (.Z(data_cd[7]), 
	.B(\LEDR_link_f[PHIT][7] ), 
	.A(\LEDR_link_f[PHIT_PARITY][7] ));
   HS65_LSS_XOR2X23 FE_RC_50_0 (.Z(data_cd[9]), 
	.B(\LEDR_link_f[PHIT][9] ), 
	.A(\LEDR_link_f[PHIT_PARITY][9] ));
   select_element_4 select_element (.preset(FE_PHN1408_FE_OCPN1195_preset), 
	.\input (token_phase), 
	.true(full_phase), 
	.false(empty_phase), 
	.sel(\LEDR_link_f[TOKEN_T] ));
   c_gate_0_14 data_cd_c (.preset(FE_PHN1408_FE_OCPN1195_preset), 
	.a(full_phase), 
	.b(data_phase), 
	.c(data_cd_phase));
   c_gate_generic_0_33_4 data_ch (.preset(preset), 
	.\input ({ data_cd[32],
		data_cd[31],
		data_cd[30],
		data_cd[29],
		data_cd[28],
		data_cd[27],
		data_cd[26],
		data_cd[25],
		data_cd[24],
		data_cd[23],
		data_cd[22],
		data_cd[21],
		data_cd[20],
		data_cd[19],
		data_cd[18],
		data_cd[17],
		data_cd[16],
		data_cd[15],
		data_cd[14],
		data_cd[13],
		data_cd[12],
		data_cd[11],
		data_cd[10],
		data_cd[9],
		data_cd[8],
		data_cd[7],
		data_cd[6],
		data_cd[5],
		data_cd[4],
		data_cd[3],
		data_cd[2],
		data_cd[1],
		data_cd[0] }), 
	.\output (data_phase), 
	.FE_OCPN1195_preset(FE_OCPN1195_preset));
   latch_controller_1_9 latch_controller (.preset(FE_PHN1408_FE_OCPN1195_preset), 
	.Rin(req_in), 
	.Aout(\LEDR_link_b[ACK] ), 
	.Rout(\bundled_ch_f[REQ] ), 
	.Ain(\bundled_ch_b[ACK] ), 
	.lt_en(latch_enable));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][30]  (.Q(\bundled_ch_f[DATA][30] ), 
	.G(N3), 
	.D(N34));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][28]  (.Q(\bundled_ch_f[DATA][28] ), 
	.G(N3), 
	.D(N32));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][26]  (.Q(\bundled_ch_f[DATA][26] ), 
	.G(N3), 
	.D(N30));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][24]  (.Q(\bundled_ch_f[DATA][24] ), 
	.G(N3), 
	.D(N28));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][22]  (.Q(\bundled_ch_f[DATA][22] ), 
	.G(N3), 
	.D(N26));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][20]  (.Q(\bundled_ch_f[DATA][20] ), 
	.G(N3), 
	.D(N24));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][18]  (.Q(\bundled_ch_f[DATA][18] ), 
	.G(N3), 
	.D(N22));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][16]  (.Q(\bundled_ch_f[DATA][16] ), 
	.G(N3), 
	.D(N20));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][14]  (.Q(\bundled_ch_f[DATA][14] ), 
	.G(N3), 
	.D(N18));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][12]  (.Q(\bundled_ch_f[DATA][12] ), 
	.G(N3), 
	.D(N16));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][10]  (.Q(\bundled_ch_f[DATA][10] ), 
	.G(N3), 
	.D(N14));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][8]  (.Q(\bundled_ch_f[DATA][8] ), 
	.G(N3), 
	.D(N12));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][6]  (.Q(\bundled_ch_f[DATA][6] ), 
	.G(N3), 
	.D(N10));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][4]  (.Q(\bundled_ch_f[DATA][4] ), 
	.G(N3), 
	.D(N8));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][2]  (.Q(\bundled_ch_f[DATA][2] ), 
	.G(N3), 
	.D(N6));
   HS65_LS_LDLRQX18 \bundled_ch_f_reg[DATA][33]  (.RN(n1), 
	.Q(\bundled_ch_f[DATA][33] ), 
	.GN(latch_enable), 
	.D(FE_PHN1410_south_in_f_67_));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][29]  (.Q(\bundled_ch_f[DATA][29] ), 
	.G(N3), 
	.D(N33));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][27]  (.Q(\bundled_ch_f[DATA][27] ), 
	.G(N3), 
	.D(N31));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][25]  (.Q(\bundled_ch_f[DATA][25] ), 
	.G(N3), 
	.D(N29));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][23]  (.Q(\bundled_ch_f[DATA][23] ), 
	.G(N3), 
	.D(N27));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][21]  (.Q(\bundled_ch_f[DATA][21] ), 
	.G(N3), 
	.D(N25));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][19]  (.Q(\bundled_ch_f[DATA][19] ), 
	.G(N3), 
	.D(N23));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][17]  (.Q(\bundled_ch_f[DATA][17] ), 
	.G(N3), 
	.D(N21));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][15]  (.Q(\bundled_ch_f[DATA][15] ), 
	.G(N3), 
	.D(N19));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][13]  (.Q(\bundled_ch_f[DATA][13] ), 
	.G(N3), 
	.D(N17));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][11]  (.Q(\bundled_ch_f[DATA][11] ), 
	.G(N3), 
	.D(N15));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][7]  (.Q(\bundled_ch_f[DATA][7] ), 
	.G(N3), 
	.D(N11));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][5]  (.Q(\bundled_ch_f[DATA][5] ), 
	.G(N3), 
	.D(N9));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][3]  (.Q(\bundled_ch_f[DATA][3] ), 
	.G(N3), 
	.D(N7));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][9]  (.Q(\bundled_ch_f[DATA][9] ), 
	.G(N3), 
	.D(N13));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][31]  (.Q(\bundled_ch_f[DATA][31] ), 
	.G(N3), 
	.D(N35));
   HS65_LS_LDHQX9 \bundled_ch_f_reg[DATA][0]  (.Q(\bundled_ch_f[DATA][0] ), 
	.G(N3), 
	.D(N4));
   HS65_LS_LDHQX18 \bundled_ch_f_reg[DATA][32]  (.Q(\bundled_ch_f[DATA][32] ), 
	.G(N3), 
	.D(N36));
   HS65_LS_LDHQX18 \bundled_ch_f_reg[DATA][1]  (.Q(\bundled_ch_f[DATA][1] ), 
	.G(N3), 
	.D(N5));
   HS65_LSS_XOR2X23 U4 (.Z(data_cd[4]), 
	.B(\LEDR_link_f[PHIT][4] ), 
	.A(\LEDR_link_f[PHIT_PARITY][4] ));
   HS65_LSS_XOR2X23 U5 (.Z(data_cd[3]), 
	.B(\LEDR_link_f[PHIT][3] ), 
	.A(\LEDR_link_f[PHIT_PARITY][3] ));
   HS65_LSS_XOR2X23 U8 (.Z(data_cd[16]), 
	.B(\LEDR_link_f[PHIT][16] ), 
	.A(\LEDR_link_f[PHIT_PARITY][16] ));
   HS65_LSS_XOR2X23 U9 (.Z(data_cd[15]), 
	.B(\LEDR_link_f[PHIT][15] ), 
	.A(\LEDR_link_f[PHIT_PARITY][15] ));
   HS65_LSS_XOR2X23 U10 (.Z(data_cd[25]), 
	.B(\LEDR_link_f[PHIT][25] ), 
	.A(\LEDR_link_f[PHIT_PARITY][25] ));
   HS65_LSS_XOR2X23 U11 (.Z(data_cd[24]), 
	.B(\LEDR_link_f[PHIT][24] ), 
	.A(\LEDR_link_f[PHIT_PARITY][24] ));
   HS65_LSS_XOR2X23 U12 (.Z(data_cd[26]), 
	.B(\LEDR_link_f[PHIT][26] ), 
	.A(\LEDR_link_f[PHIT_PARITY][26] ));
   HS65_LSS_XOR2X23 U13 (.Z(data_cd[12]), 
	.B(\LEDR_link_f[PHIT][12] ), 
	.A(\LEDR_link_f[PHIT_PARITY][12] ));
   HS65_LSS_XOR2X23 U14 (.Z(data_cd[1]), 
	.B(\LEDR_link_f[PHIT][1] ), 
	.A(\LEDR_link_f[PHIT_PARITY][1] ));
   HS65_LSS_XOR2X23 U15 (.Z(data_cd[23]), 
	.B(\LEDR_link_f[PHIT][23] ), 
	.A(\LEDR_link_f[PHIT_PARITY][23] ));
   HS65_LSS_XOR2X23 U16 (.Z(data_cd[2]), 
	.B(\LEDR_link_f[PHIT][2] ), 
	.A(\LEDR_link_f[PHIT_PARITY][2] ));
   HS65_LSS_XOR2X23 U17 (.Z(data_cd[30]), 
	.B(\LEDR_link_f[PHIT][30] ), 
	.A(\LEDR_link_f[PHIT_PARITY][30] ));
   HS65_LSS_XOR2X23 U19 (.Z(data_cd[22]), 
	.B(\LEDR_link_f[PHIT][22] ), 
	.A(\LEDR_link_f[PHIT_PARITY][22] ));
   HS65_LSS_XOR2X23 U20 (.Z(data_cd[11]), 
	.B(\LEDR_link_f[PHIT][11] ), 
	.A(\LEDR_link_f[PHIT_PARITY][11] ));
   HS65_LSS_XOR2X23 U21 (.Z(data_cd[27]), 
	.B(\LEDR_link_f[PHIT][27] ), 
	.A(\LEDR_link_f[PHIT_PARITY][27] ));
   HS65_LSS_XOR2X23 U22 (.Z(data_cd[0]), 
	.B(\LEDR_link_f[PHIT][0] ), 
	.A(\LEDR_link_f[PHIT_PARITY][0] ));
   HS65_LSS_XOR2X23 U23 (.Z(data_cd[10]), 
	.B(\LEDR_link_f[PHIT][10] ), 
	.A(\LEDR_link_f[PHIT_PARITY][10] ));
   HS65_LSS_XOR2X23 U24 (.Z(data_cd[13]), 
	.B(\LEDR_link_f[PHIT][13] ), 
	.A(\LEDR_link_f[PHIT_PARITY][13] ));
   HS65_LSS_XOR2X23 U25 (.Z(data_cd[14]), 
	.B(\LEDR_link_f[PHIT][14] ), 
	.A(\LEDR_link_f[PHIT_PARITY][14] ));
   HS65_LSS_XOR2X23 U28 (.Z(data_cd[20]), 
	.B(\LEDR_link_f[PHIT][20] ), 
	.A(\LEDR_link_f[PHIT_PARITY][20] ));
   HS65_LSS_XOR2X23 U29 (.Z(data_cd[21]), 
	.B(\LEDR_link_f[PHIT][21] ), 
	.A(\LEDR_link_f[PHIT_PARITY][21] ));
   HS65_LSS_XOR2X23 U30 (.Z(data_cd[28]), 
	.B(\LEDR_link_f[PHIT][28] ), 
	.A(\LEDR_link_f[PHIT_PARITY][28] ));
   HS65_LSS_XOR2X23 U31 (.Z(data_cd[29]), 
	.B(\LEDR_link_f[PHIT][29] ), 
	.A(\LEDR_link_f[PHIT_PARITY][29] ));
   HS65_LSS_XOR2X23 U33 (.Z(data_cd[32]), 
	.B(\LEDR_link_f[PHIT][32] ), 
	.A(\LEDR_link_f[PHIT_PARITY][32] ));
   HS65_LSS_XOR2X23 U34 (.Z(data_cd[5]), 
	.B(\LEDR_link_f[PHIT][5] ), 
	.A(\LEDR_link_f[PHIT_PARITY][5] ));
   HS65_LSS_XOR2X23 U35 (.Z(data_cd[6]), 
	.B(\LEDR_link_f[PHIT][6] ), 
	.A(\LEDR_link_f[PHIT_PARITY][6] ));
   HS65_LSS_XNOR2X6 U36 (.Z(token_phase), 
	.B(\LEDR_link_f[TOKEN_PARITY] ), 
	.A(n3));
   HS65_LS_IVX9 U37 (.Z(n1), 
	.A(FE_OFN1036_preset));
   HS65_LS_IVX9 U38 (.Z(n3), 
	.A(\LEDR_link_f[TOKEN_T] ));
   HS65_LS_NOR2AX3 U39 (.Z(N4), 
	.B(FE_OFN1036_preset), 
	.A(\LEDR_link_f[PHIT][0] ));
   HS65_LS_NOR2AX3 U40 (.Z(N5), 
	.B(FE_OCPN1195_preset), 
	.A(\LEDR_link_f[PHIT][1] ));
   HS65_LS_NOR2AX3 U41 (.Z(N6), 
	.B(preset), 
	.A(\LEDR_link_f[PHIT][2] ));
   HS65_LS_NOR2AX3 U42 (.Z(N7), 
	.B(FE_OCPN1195_preset), 
	.A(\LEDR_link_f[PHIT][3] ));
   HS65_LS_NOR2AX3 U43 (.Z(N8), 
	.B(FE_OCPN1195_preset), 
	.A(\LEDR_link_f[PHIT][4] ));
   HS65_LS_NOR2AX3 U44 (.Z(N10), 
	.B(FE_OFN1036_preset), 
	.A(\LEDR_link_f[PHIT][6] ));
   HS65_LS_NOR2AX3 U45 (.Z(N28), 
	.B(FE_OFN1039_preset), 
	.A(\LEDR_link_f[PHIT][24] ));
   HS65_LS_NOR2AX3 U46 (.Z(N29), 
	.B(FE_OFN1039_preset), 
	.A(\LEDR_link_f[PHIT][25] ));
   HS65_LS_NOR2AX3 U47 (.Z(N30), 
	.B(FE_OFN1039_preset), 
	.A(\LEDR_link_f[PHIT][26] ));
   HS65_LS_NOR2AX3 U48 (.Z(N31), 
	.B(FE_OCPN1194_preset), 
	.A(\LEDR_link_f[PHIT][27] ));
   HS65_LS_NOR2AX3 U49 (.Z(N32), 
	.B(FE_OFN1039_preset), 
	.A(\LEDR_link_f[PHIT][28] ));
   HS65_LS_NOR2AX3 U50 (.Z(N33), 
	.B(FE_OFN1037_preset), 
	.A(\LEDR_link_f[PHIT][29] ));
   HS65_LS_NOR2AX3 U51 (.Z(N34), 
	.B(FE_OFN1037_preset), 
	.A(\LEDR_link_f[PHIT][30] ));
   HS65_LS_NOR2AX3 U52 (.Z(N35), 
	.B(FE_OFN1039_preset), 
	.A(\LEDR_link_f[PHIT][31] ));
   HS65_LS_NOR2AX3 U53 (.Z(N36), 
	.B(FE_OFN1036_preset), 
	.A(\LEDR_link_f[PHIT][32] ));
   HS65_LS_NOR2AX3 U54 (.Z(N9), 
	.B(FE_OCPN1195_preset), 
	.A(\LEDR_link_f[PHIT][5] ));
   HS65_LS_NOR2AX3 U55 (.Z(N11), 
	.B(FE_OCPN1194_preset), 
	.A(\LEDR_link_f[PHIT][7] ));
   HS65_LS_NOR2AX3 U56 (.Z(N12), 
	.B(FE_OCPN1195_preset), 
	.A(\LEDR_link_f[PHIT][8] ));
   HS65_LS_NOR2AX3 U57 (.Z(N13), 
	.B(FE_OFN1036_preset), 
	.A(\LEDR_link_f[PHIT][9] ));
   HS65_LS_NOR2AX3 U58 (.Z(N14), 
	.B(FE_OCPN1194_preset), 
	.A(\LEDR_link_f[PHIT][10] ));
   HS65_LS_NOR2AX3 U59 (.Z(N15), 
	.B(FE_OCPN1194_preset), 
	.A(\LEDR_link_f[PHIT][11] ));
   HS65_LS_NOR2AX3 U60 (.Z(N16), 
	.B(FE_OCPN1195_preset), 
	.A(\LEDR_link_f[PHIT][12] ));
   HS65_LS_NOR2AX3 U61 (.Z(N17), 
	.B(FE_OCPN1194_preset), 
	.A(\LEDR_link_f[PHIT][13] ));
   HS65_LS_NOR2AX3 U62 (.Z(N18), 
	.B(FE_OCPN1194_preset), 
	.A(\LEDR_link_f[PHIT][14] ));
   HS65_LS_NOR2AX3 U63 (.Z(N19), 
	.B(FE_OCPN1194_preset), 
	.A(\LEDR_link_f[PHIT][15] ));
   HS65_LS_NOR2AX3 U64 (.Z(N20), 
	.B(FE_OCPN1194_preset), 
	.A(\LEDR_link_f[PHIT][16] ));
   HS65_LS_NOR2AX3 U65 (.Z(N21), 
	.B(FE_OCPN1194_preset), 
	.A(\LEDR_link_f[PHIT][17] ));
   HS65_LS_NOR2AX3 U66 (.Z(N22), 
	.B(FE_OFN1039_preset), 
	.A(\LEDR_link_f[PHIT][18] ));
   HS65_LS_NOR2AX3 U67 (.Z(N23), 
	.B(FE_OFN1039_preset), 
	.A(\LEDR_link_f[PHIT][19] ));
   HS65_LS_NOR2AX3 U68 (.Z(N24), 
	.B(FE_OFN1039_preset), 
	.A(\LEDR_link_f[PHIT][20] ));
   HS65_LS_NOR2AX3 U69 (.Z(N25), 
	.B(FE_OFN1039_preset), 
	.A(\LEDR_link_f[PHIT][21] ));
   HS65_LS_NOR2AX3 U70 (.Z(N26), 
	.B(FE_OFN1039_preset), 
	.A(\LEDR_link_f[PHIT][22] ));
   HS65_LS_NOR2AX3 U71 (.Z(N27), 
	.B(FE_OFN1039_preset), 
	.A(\LEDR_link_f[PHIT][23] ));
   HS65_LS_OAI21X3 U72 (.Z(N3), 
	.C(n1), 
	.B(n3), 
	.A(latch_enable));
   HS65_LSS_XOR2X6 U73 (.Z(req_in), 
	.B(data_cd_phase), 
	.A(empty_phase));
endmodule

module noc_switch_x0_y0 (
	preset, 
	north_in_f, 
	east_in_f, 
	south_in_f, 
	west_in_f, 
	resource_in_f, 
	north_out_f, 
	east_out_f, 
	south_out_f, 
	west_out_f, 
	resource_out_f, 
	north_in_b_ACK, 
	east_in_b_ACK, 
	south_in_b_ACK, 
	west_in_b_ACK, 
	resource_in_b_ACK, 
	north_out_b_ACK, 
	east_out_b_ACK, 
	south_out_b_ACK, 
	west_out_b_ACK, 
	resource_out_b_ACK);
   input preset;
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
   output north_in_b_ACK;
   output east_in_b_ACK;
   output south_in_b_ACK;
   output west_in_b_ACK;
   output resource_in_b_ACK;
   input north_out_b_ACK;
   input east_out_b_ACK;
   input south_out_b_ACK;
   input west_out_b_ACK;
   input resource_out_b_ACK;

   // Internal wires
   wire FE_PHN1448_FE_OFN1003_preset;
   wire FE_PHN1446_FE_OCPN1195_preset;
   wire FE_PHN1441_FE_OFN1003_preset;
   wire FE_PHN1436_FE_OCPN1195_preset;
   wire FE_PHN1428_FE_OCPN1195_preset;
   wire FE_PHN1422_FE_OCPN1195_preset;
   wire FE_PHN1408_FE_OCPN1195_preset;
   wire FE_PHN1407_FE_OFN1003_preset;
   wire FE_PHN1394_west_hpu_b_ACK;
   wire FE_OCPN1195_preset;
   wire FE_OCPN1193_preset;
   wire FE_OFN1038_preset;
   wire FE_OFN1037_preset;
   wire FE_OFN1004_preset;
   wire FE_OFN1003_preset;
   wire FE_OFN1002_preset;
   wire FE_OFN1001_preset;
   wire FE_OFN1000_preset;
   wire FE_OFN999_preset;
   wire FE_OFN998_preset;
   wire FE_OFN997_preset;
   wire FE_OFN2_preset;
   wire FE_OFN1_preset;
   wire FE_OFN0_preset;
   wire north_hpu_b_ACK;
   wire south_hpu_b_ACK;
   wire east_hpu_b_ACK;
   wire west_hpu_b_ACK;
   wire resource_hpu_b_ACK;
   wire chs_in_b_4__ACK;
   wire chs_in_b_3__ACK;
   wire chs_in_b_2__ACK;
   wire chs_in_b_1__ACK;
   wire chs_in_b_0__ACK;
   wire [34:0] north_hpu_f;
   wire [34:0] south_hpu_f;
   wire [34:0] east_hpu_f;
   wire [34:0] west_hpu_f;
   wire [34:0] resource_hpu_f;
   wire [174:0] chs_in_f;
   wire [24:0] switch_sel;

   HS65_LH_BFX7 FE_PHC1448_FE_OFN1003_preset (.Z(FE_PHN1448_FE_OFN1003_preset), 
	.A(FE_OFN1003_preset));
   HS65_LH_BFX9 FE_PHC1446_FE_OCPN1195_preset (.Z(FE_PHN1446_FE_OCPN1195_preset), 
	.A(FE_PHN1408_FE_OCPN1195_preset));
   HS65_LH_BFX2 FE_PHC1441_FE_OFN1003_preset (.Z(FE_PHN1441_FE_OFN1003_preset), 
	.A(FE_PHN1448_FE_OFN1003_preset));
   HS65_LH_BFX2 FE_PHC1436_FE_OCPN1195_preset (.Z(FE_PHN1436_FE_OCPN1195_preset), 
	.A(FE_PHN1446_FE_OCPN1195_preset));
   HS65_LH_BFX9 FE_PHC1428_FE_OCPN1195_preset (.Z(FE_PHN1428_FE_OCPN1195_preset), 
	.A(FE_OCPN1195_preset));
   HS65_LH_DLYIC4X9 FE_PHC1422_FE_OCPN1195_preset (.Z(FE_PHN1422_FE_OCPN1195_preset), 
	.A(FE_PHN1428_FE_OCPN1195_preset));
   HS65_LH_DLYIC6X9 FE_PHC1408_FE_OCPN1195_preset (.Z(FE_PHN1408_FE_OCPN1195_preset), 
	.A(FE_PHN1422_FE_OCPN1195_preset));
   HS65_LS_DLYIC4X9 FE_PHC1407_FE_OFN1003_preset (.Z(FE_PHN1407_FE_OFN1003_preset), 
	.A(FE_PHN1441_FE_OFN1003_preset));
   HS65_LH_BFX2 FE_PHC1394_west_hpu_b_ACK (.Z(FE_PHN1394_west_hpu_b_ACK), 
	.A(west_hpu_b_ACK));
   HS65_LS_BFX49 FE_OCPC1195_preset (.Z(FE_OCPN1195_preset), 
	.A(FE_OCPN1193_preset));
   HS65_LS_BFX7 FE_OCPC1193_preset (.Z(FE_OCPN1193_preset), 
	.A(preset));
   HS65_LS_BFX44 FE_OFC1038_preset (.Z(FE_OFN1038_preset), 
	.A(FE_OFN1037_preset));
   HS65_LS_BFX18 FE_OFC1037_preset (.Z(FE_OFN1037_preset), 
	.A(preset));
   HS65_LS_BFX27 FE_OFC1004_preset (.Z(FE_OFN1004_preset), 
	.A(FE_OFN1003_preset));
   HS65_LS_BFX18 FE_OFC1003_preset (.Z(FE_OFN1003_preset), 
	.A(FE_OFN0_preset));
   HS65_LS_BFX9 FE_OFC1002_preset (.Z(FE_OFN1002_preset), 
	.A(FE_OFN1001_preset));
   HS65_LS_BFX9 FE_OFC1001_preset (.Z(FE_OFN1001_preset), 
	.A(FE_OFN1000_preset));
   HS65_LS_BFX9 FE_OFC1000_preset (.Z(FE_OFN1000_preset), 
	.A(FE_OFN2_preset));
   HS65_LS_BFX7 FE_OFC999_preset (.Z(FE_OFN999_preset), 
	.A(FE_OFN998_preset));
   HS65_LS_BFX9 FE_OFC998_preset (.Z(FE_OFN998_preset), 
	.A(FE_OFN997_preset));
   HS65_LS_BFX9 FE_OFC997_preset (.Z(FE_OFN997_preset), 
	.A(FE_OFN1_preset));
   HS65_LS_BFX9 FE_OFC2_preset (.Z(FE_OFN2_preset), 
	.A(FE_OFN1004_preset));
   HS65_LS_BFX71 FE_OFC1_preset (.Z(FE_OFN1_preset), 
	.A(FE_OFN1038_preset));
   HS65_LS_BFX9 FE_OFC0_preset (.Z(FE_OFN0_preset), 
	.A(preset));
   LEDR2bundled_1_000000000_0 north_in_latch (.preset(FE_OFN1038_preset), 
	.LEDR_link_f({ north_in_f[67],
		north_in_f[66],
		north_in_f[65],
		north_in_f[64],
		north_in_f[63],
		north_in_f[62],
		north_in_f[61],
		north_in_f[60],
		north_in_f[59],
		north_in_f[58],
		north_in_f[57],
		north_in_f[56],
		north_in_f[55],
		north_in_f[54],
		north_in_f[53],
		north_in_f[52],
		north_in_f[51],
		north_in_f[50],
		north_in_f[49],
		north_in_f[48],
		north_in_f[47],
		north_in_f[46],
		north_in_f[45],
		north_in_f[44],
		north_in_f[43],
		north_in_f[42],
		north_in_f[41],
		north_in_f[40],
		north_in_f[39],
		north_in_f[38],
		north_in_f[37],
		north_in_f[36],
		north_in_f[35],
		north_in_f[34],
		north_in_f[33],
		north_in_f[32],
		north_in_f[31],
		north_in_f[30],
		north_in_f[29],
		north_in_f[28],
		north_in_f[27],
		north_in_f[26],
		north_in_f[25],
		north_in_f[24],
		north_in_f[23],
		north_in_f[22],
		north_in_f[21],
		north_in_f[20],
		north_in_f[19],
		north_in_f[18],
		north_in_f[17],
		north_in_f[16],
		north_in_f[15],
		north_in_f[14],
		north_in_f[13],
		north_in_f[12],
		north_in_f[11],
		north_in_f[10],
		north_in_f[9],
		north_in_f[8],
		north_in_f[7],
		north_in_f[6],
		north_in_f[5],
		north_in_f[4],
		north_in_f[3],
		north_in_f[2],
		north_in_f[1],
		north_in_f[0] }), 
	.LEDR_link_b(north_in_b_ACK), 
	.bundled_ch_f({ north_hpu_f[34],
		north_hpu_f[33],
		north_hpu_f[32],
		north_hpu_f[31],
		north_hpu_f[30],
		north_hpu_f[29],
		north_hpu_f[28],
		north_hpu_f[27],
		north_hpu_f[26],
		north_hpu_f[25],
		north_hpu_f[24],
		north_hpu_f[23],
		north_hpu_f[22],
		north_hpu_f[21],
		north_hpu_f[20],
		north_hpu_f[19],
		north_hpu_f[18],
		north_hpu_f[17],
		north_hpu_f[16],
		north_hpu_f[15],
		north_hpu_f[14],
		north_hpu_f[13],
		north_hpu_f[12],
		north_hpu_f[11],
		north_hpu_f[10],
		north_hpu_f[9],
		north_hpu_f[8],
		north_hpu_f[7],
		north_hpu_f[6],
		north_hpu_f[5],
		north_hpu_f[4],
		north_hpu_f[3],
		north_hpu_f[2],
		north_hpu_f[1],
		north_hpu_f[0] }), 
	.bundled_ch_b(north_hpu_b_ACK), 
	.FE_OFN1_preset(FE_OFN1_preset), 
	.FE_OFN997_preset(FE_OFN997_preset), 
	.FE_OFN998_preset(FE_OFN998_preset), 
	.FE_OFN999_preset(FE_OFN999_preset));
   LEDR2bundled_1_000000000_4 south_in_latch (.preset(FE_OCPN1193_preset), 
	.LEDR_link_f({ south_in_f[67],
		south_in_f[66],
		south_in_f[65],
		south_in_f[64],
		south_in_f[63],
		south_in_f[62],
		south_in_f[61],
		south_in_f[60],
		south_in_f[59],
		south_in_f[58],
		south_in_f[57],
		south_in_f[56],
		south_in_f[55],
		south_in_f[54],
		south_in_f[53],
		south_in_f[52],
		south_in_f[51],
		south_in_f[50],
		south_in_f[49],
		south_in_f[48],
		south_in_f[47],
		south_in_f[46],
		south_in_f[45],
		south_in_f[44],
		south_in_f[43],
		south_in_f[42],
		south_in_f[41],
		south_in_f[40],
		south_in_f[39],
		south_in_f[38],
		south_in_f[37],
		south_in_f[36],
		south_in_f[35],
		south_in_f[34],
		south_in_f[33],
		south_in_f[32],
		south_in_f[31],
		south_in_f[30],
		south_in_f[29],
		south_in_f[28],
		south_in_f[27],
		south_in_f[26],
		south_in_f[25],
		south_in_f[24],
		south_in_f[23],
		south_in_f[22],
		south_in_f[21],
		south_in_f[20],
		south_in_f[19],
		south_in_f[18],
		south_in_f[17],
		south_in_f[16],
		south_in_f[15],
		south_in_f[14],
		south_in_f[13],
		south_in_f[12],
		south_in_f[11],
		south_in_f[10],
		south_in_f[9],
		south_in_f[8],
		south_in_f[7],
		south_in_f[6],
		south_in_f[5],
		south_in_f[4],
		south_in_f[3],
		south_in_f[2],
		south_in_f[1],
		south_in_f[0] }), 
	.LEDR_link_b(south_in_b_ACK), 
	.bundled_ch_f({ south_hpu_f[34],
		south_hpu_f[33],
		south_hpu_f[32],
		south_hpu_f[31],
		south_hpu_f[30],
		south_hpu_f[29],
		south_hpu_f[28],
		south_hpu_f[27],
		south_hpu_f[26],
		south_hpu_f[25],
		south_hpu_f[24],
		south_hpu_f[23],
		south_hpu_f[22],
		south_hpu_f[21],
		south_hpu_f[20],
		south_hpu_f[19],
		south_hpu_f[18],
		south_hpu_f[17],
		south_hpu_f[16],
		south_hpu_f[15],
		south_hpu_f[14],
		south_hpu_f[13],
		south_hpu_f[12],
		south_hpu_f[11],
		south_hpu_f[10],
		south_hpu_f[9],
		south_hpu_f[8],
		south_hpu_f[7],
		south_hpu_f[6],
		south_hpu_f[5],
		south_hpu_f[4],
		south_hpu_f[3],
		south_hpu_f[2],
		south_hpu_f[1],
		south_hpu_f[0] }), 
	.bundled_ch_b(south_hpu_b_ACK), 
	.FE_OFN1036_preset(FE_OCPN1195_preset), 
	.FE_OFN1037_preset(FE_OFN1037_preset), 
	.FE_OCPN1195_preset(FE_OCPN1195_preset), 
	.FE_PHN1408_FE_OCPN1195_preset(FE_PHN1436_FE_OCPN1195_preset));
   LEDR2bundled_1_000000000_3 east_in_latch (.preset(FE_OFN1003_preset), 
	.LEDR_link_f({ east_in_f[67],
		east_in_f[66],
		east_in_f[65],
		east_in_f[64],
		east_in_f[63],
		east_in_f[62],
		east_in_f[61],
		east_in_f[60],
		east_in_f[59],
		east_in_f[58],
		east_in_f[57],
		east_in_f[56],
		east_in_f[55],
		east_in_f[54],
		east_in_f[53],
		east_in_f[52],
		east_in_f[51],
		east_in_f[50],
		east_in_f[49],
		east_in_f[48],
		east_in_f[47],
		east_in_f[46],
		east_in_f[45],
		east_in_f[44],
		east_in_f[43],
		east_in_f[42],
		east_in_f[41],
		east_in_f[40],
		east_in_f[39],
		east_in_f[38],
		east_in_f[37],
		east_in_f[36],
		east_in_f[35],
		east_in_f[34],
		east_in_f[33],
		east_in_f[32],
		east_in_f[31],
		east_in_f[30],
		east_in_f[29],
		east_in_f[28],
		east_in_f[27],
		east_in_f[26],
		east_in_f[25],
		east_in_f[24],
		east_in_f[23],
		east_in_f[22],
		east_in_f[21],
		east_in_f[20],
		east_in_f[19],
		east_in_f[18],
		east_in_f[17],
		east_in_f[16],
		east_in_f[15],
		east_in_f[14],
		east_in_f[13],
		east_in_f[12],
		east_in_f[11],
		east_in_f[10],
		east_in_f[9],
		east_in_f[8],
		east_in_f[7],
		east_in_f[6],
		east_in_f[5],
		east_in_f[4],
		east_in_f[3],
		east_in_f[2],
		east_in_f[1],
		east_in_f[0] }), 
	.LEDR_link_b(east_in_b_ACK), 
	.bundled_ch_f({ east_hpu_f[34],
		east_hpu_f[33],
		east_hpu_f[32],
		east_hpu_f[31],
		east_hpu_f[30],
		east_hpu_f[29],
		east_hpu_f[28],
		east_hpu_f[27],
		east_hpu_f[26],
		east_hpu_f[25],
		east_hpu_f[24],
		east_hpu_f[23],
		east_hpu_f[22],
		east_hpu_f[21],
		east_hpu_f[20],
		east_hpu_f[19],
		east_hpu_f[18],
		east_hpu_f[17],
		east_hpu_f[16],
		east_hpu_f[15],
		east_hpu_f[14],
		east_hpu_f[13],
		east_hpu_f[12],
		east_hpu_f[11],
		east_hpu_f[10],
		east_hpu_f[9],
		east_hpu_f[8],
		east_hpu_f[7],
		east_hpu_f[6],
		east_hpu_f[5],
		east_hpu_f[4],
		east_hpu_f[3],
		east_hpu_f[2],
		east_hpu_f[1],
		east_hpu_f[0] }), 
	.bundled_ch_b(east_hpu_b_ACK), 
	.FE_OFN2_preset(FE_OFN2_preset), 
	.FE_OFN1000_preset(FE_OFN1000_preset), 
	.FE_OFN1001_preset(FE_OFN1001_preset), 
	.FE_OFN1002_preset(FE_OFN1002_preset), 
	.FE_OFN1004_preset(FE_OFN1004_preset));
   LEDR2bundled_1_000000000_2 west_in_latch (.preset(FE_OFN1004_preset), 
	.LEDR_link_f({ west_in_f[67],
		west_in_f[66],
		west_in_f[65],
		west_in_f[64],
		west_in_f[63],
		west_in_f[62],
		west_in_f[61],
		west_in_f[60],
		west_in_f[59],
		west_in_f[58],
		west_in_f[57],
		west_in_f[56],
		west_in_f[55],
		west_in_f[54],
		west_in_f[53],
		west_in_f[52],
		west_in_f[51],
		west_in_f[50],
		west_in_f[49],
		west_in_f[48],
		west_in_f[47],
		west_in_f[46],
		west_in_f[45],
		west_in_f[44],
		west_in_f[43],
		west_in_f[42],
		west_in_f[41],
		west_in_f[40],
		west_in_f[39],
		west_in_f[38],
		west_in_f[37],
		west_in_f[36],
		west_in_f[35],
		west_in_f[34],
		west_in_f[33],
		west_in_f[32],
		west_in_f[31],
		west_in_f[30],
		west_in_f[29],
		west_in_f[28],
		west_in_f[27],
		west_in_f[26],
		west_in_f[25],
		west_in_f[24],
		west_in_f[23],
		west_in_f[22],
		west_in_f[21],
		west_in_f[20],
		west_in_f[19],
		west_in_f[18],
		west_in_f[17],
		west_in_f[16],
		west_in_f[15],
		west_in_f[14],
		west_in_f[13],
		west_in_f[12],
		west_in_f[11],
		west_in_f[10],
		west_in_f[9],
		west_in_f[8],
		west_in_f[7],
		west_in_f[6],
		west_in_f[5],
		west_in_f[4],
		west_in_f[3],
		west_in_f[2],
		west_in_f[1],
		west_in_f[0] }), 
	.LEDR_link_b(west_in_b_ACK), 
	.bundled_ch_f({ west_hpu_f[34],
		west_hpu_f[33],
		west_hpu_f[32],
		west_hpu_f[31],
		west_hpu_f[30],
		west_hpu_f[29],
		west_hpu_f[28],
		west_hpu_f[27],
		west_hpu_f[26],
		west_hpu_f[25],
		west_hpu_f[24],
		west_hpu_f[23],
		west_hpu_f[22],
		west_hpu_f[21],
		west_hpu_f[20],
		west_hpu_f[19],
		west_hpu_f[18],
		west_hpu_f[17],
		west_hpu_f[16],
		west_hpu_f[15],
		west_hpu_f[14],
		west_hpu_f[13],
		west_hpu_f[12],
		west_hpu_f[11],
		west_hpu_f[10],
		west_hpu_f[9],
		west_hpu_f[8],
		west_hpu_f[7],
		west_hpu_f[6],
		west_hpu_f[5],
		west_hpu_f[4],
		west_hpu_f[3],
		west_hpu_f[2],
		west_hpu_f[1],
		west_hpu_f[0] }), 
	.bundled_ch_b(FE_PHN1394_west_hpu_b_ACK), 
	.FE_OFN2_preset(FE_OFN2_preset), 
	.FE_OFN1000_preset(FE_OFN1000_preset), 
	.FE_OFN1002_preset(FE_OFN1002_preset));
   LEDR2bundled_1_000000000_1 resource_in_latch (.preset(FE_OFN1_preset), 
	.LEDR_link_f({ resource_in_f[67],
		resource_in_f[66],
		resource_in_f[65],
		resource_in_f[64],
		resource_in_f[63],
		resource_in_f[62],
		resource_in_f[61],
		resource_in_f[60],
		resource_in_f[59],
		resource_in_f[58],
		resource_in_f[57],
		resource_in_f[56],
		resource_in_f[55],
		resource_in_f[54],
		resource_in_f[53],
		resource_in_f[52],
		resource_in_f[51],
		resource_in_f[50],
		resource_in_f[49],
		resource_in_f[48],
		resource_in_f[47],
		resource_in_f[46],
		resource_in_f[45],
		resource_in_f[44],
		resource_in_f[43],
		resource_in_f[42],
		resource_in_f[41],
		resource_in_f[40],
		resource_in_f[39],
		resource_in_f[38],
		resource_in_f[37],
		resource_in_f[36],
		resource_in_f[35],
		resource_in_f[34],
		resource_in_f[33],
		resource_in_f[32],
		resource_in_f[31],
		resource_in_f[30],
		resource_in_f[29],
		resource_in_f[28],
		resource_in_f[27],
		resource_in_f[26],
		resource_in_f[25],
		resource_in_f[24],
		resource_in_f[23],
		resource_in_f[22],
		resource_in_f[21],
		resource_in_f[20],
		resource_in_f[19],
		resource_in_f[18],
		resource_in_f[17],
		resource_in_f[16],
		resource_in_f[15],
		resource_in_f[14],
		resource_in_f[13],
		resource_in_f[12],
		resource_in_f[11],
		resource_in_f[10],
		resource_in_f[9],
		resource_in_f[8],
		resource_in_f[7],
		resource_in_f[6],
		resource_in_f[5],
		resource_in_f[4],
		resource_in_f[3],
		resource_in_f[2],
		resource_in_f[1],
		resource_in_f[0] }), 
	.LEDR_link_b(resource_in_b_ACK), 
	.bundled_ch_f({ resource_hpu_f[34],
		resource_hpu_f[33],
		resource_hpu_f[32],
		resource_hpu_f[31],
		resource_hpu_f[30],
		resource_hpu_f[29],
		resource_hpu_f[28],
		resource_hpu_f[27],
		resource_hpu_f[26],
		resource_hpu_f[25],
		resource_hpu_f[24],
		resource_hpu_f[23],
		resource_hpu_f[22],
		resource_hpu_f[21],
		resource_hpu_f[20],
		resource_hpu_f[19],
		resource_hpu_f[18],
		resource_hpu_f[17],
		resource_hpu_f[16],
		resource_hpu_f[15],
		resource_hpu_f[14],
		resource_hpu_f[13],
		resource_hpu_f[12],
		resource_hpu_f[11],
		resource_hpu_f[10],
		resource_hpu_f[9],
		resource_hpu_f[8],
		resource_hpu_f[7],
		resource_hpu_f[6],
		resource_hpu_f[5],
		resource_hpu_f[4],
		resource_hpu_f[3],
		resource_hpu_f[2],
		resource_hpu_f[1],
		resource_hpu_f[0] }), 
	.bundled_ch_b(resource_hpu_b_ACK), 
	.FE_OFN997_preset(FE_OFN997_preset), 
	.FE_OFN998_preset(FE_OFN998_preset), 
	.FE_OFN999_preset(FE_OFN999_preset));
   hpu_0_0 north_hpu (.preset(FE_OFN1038_preset), 
	.chan_in_f({ north_hpu_f[34],
		north_hpu_f[33],
		north_hpu_f[32],
		north_hpu_f[31],
		north_hpu_f[30],
		north_hpu_f[29],
		north_hpu_f[28],
		north_hpu_f[27],
		north_hpu_f[26],
		north_hpu_f[25],
		north_hpu_f[24],
		north_hpu_f[23],
		north_hpu_f[22],
		north_hpu_f[21],
		north_hpu_f[20],
		north_hpu_f[19],
		north_hpu_f[18],
		north_hpu_f[17],
		north_hpu_f[16],
		north_hpu_f[15],
		north_hpu_f[14],
		north_hpu_f[13],
		north_hpu_f[12],
		north_hpu_f[11],
		north_hpu_f[10],
		north_hpu_f[9],
		north_hpu_f[8],
		north_hpu_f[7],
		north_hpu_f[6],
		north_hpu_f[5],
		north_hpu_f[4],
		north_hpu_f[3],
		north_hpu_f[2],
		north_hpu_f[1],
		north_hpu_f[0] }), 
	.chan_in_b(north_hpu_b_ACK), 
	.chan_out_f({ chs_in_f[34],
		chs_in_f[33],
		chs_in_f[32],
		chs_in_f[31],
		chs_in_f[30],
		chs_in_f[29],
		chs_in_f[28],
		chs_in_f[27],
		chs_in_f[26],
		chs_in_f[25],
		chs_in_f[24],
		chs_in_f[23],
		chs_in_f[22],
		chs_in_f[21],
		chs_in_f[20],
		chs_in_f[19],
		chs_in_f[18],
		chs_in_f[17],
		chs_in_f[16],
		chs_in_f[15],
		chs_in_f[14],
		chs_in_f[13],
		chs_in_f[12],
		chs_in_f[11],
		chs_in_f[10],
		chs_in_f[9],
		chs_in_f[8],
		chs_in_f[7],
		chs_in_f[6],
		chs_in_f[5],
		chs_in_f[4],
		chs_in_f[3],
		chs_in_f[2],
		chs_in_f[1],
		chs_in_f[0] }), 
	.chan_out_b(chs_in_b_0__ACK), 
	.sel({ switch_sel[4],
		switch_sel[3],
		switch_sel[2],
		switch_sel[1],
		switch_sel[0] }));
   hpu_0_2 south_hpu (.preset(FE_OCPN1195_preset), 
	.chan_in_f({ south_hpu_f[34],
		south_hpu_f[33],
		south_hpu_f[32],
		south_hpu_f[31],
		south_hpu_f[30],
		south_hpu_f[29],
		south_hpu_f[28],
		south_hpu_f[27],
		south_hpu_f[26],
		south_hpu_f[25],
		south_hpu_f[24],
		south_hpu_f[23],
		south_hpu_f[22],
		south_hpu_f[21],
		south_hpu_f[20],
		south_hpu_f[19],
		south_hpu_f[18],
		south_hpu_f[17],
		south_hpu_f[16],
		south_hpu_f[15],
		south_hpu_f[14],
		south_hpu_f[13],
		south_hpu_f[12],
		south_hpu_f[11],
		south_hpu_f[10],
		south_hpu_f[9],
		south_hpu_f[8],
		south_hpu_f[7],
		south_hpu_f[6],
		south_hpu_f[5],
		south_hpu_f[4],
		south_hpu_f[3],
		south_hpu_f[2],
		south_hpu_f[1],
		south_hpu_f[0] }), 
	.chan_in_b(south_hpu_b_ACK), 
	.chan_out_f({ chs_in_f[104],
		chs_in_f[103],
		chs_in_f[102],
		chs_in_f[101],
		chs_in_f[100],
		chs_in_f[99],
		chs_in_f[98],
		chs_in_f[97],
		chs_in_f[96],
		chs_in_f[95],
		chs_in_f[94],
		chs_in_f[93],
		chs_in_f[92],
		chs_in_f[91],
		chs_in_f[90],
		chs_in_f[89],
		chs_in_f[88],
		chs_in_f[87],
		chs_in_f[86],
		chs_in_f[85],
		chs_in_f[84],
		chs_in_f[83],
		chs_in_f[82],
		chs_in_f[81],
		chs_in_f[80],
		chs_in_f[79],
		chs_in_f[78],
		chs_in_f[77],
		chs_in_f[76],
		chs_in_f[75],
		chs_in_f[74],
		chs_in_f[73],
		chs_in_f[72],
		chs_in_f[71],
		chs_in_f[70] }), 
	.chan_out_b(chs_in_b_2__ACK), 
	.sel({ switch_sel[14],
		switch_sel[13],
		switch_sel[12],
		switch_sel[11],
		switch_sel[10] }), 
	.FE_OFN0_preset(FE_PHN1407_FE_OFN1003_preset));
   hpu_0_1 east_hpu (.preset(FE_OFN1003_preset), 
	.chan_in_f({ east_hpu_f[34],
		east_hpu_f[33],
		east_hpu_f[32],
		east_hpu_f[31],
		east_hpu_f[30],
		east_hpu_f[29],
		east_hpu_f[28],
		east_hpu_f[27],
		east_hpu_f[26],
		east_hpu_f[25],
		east_hpu_f[24],
		east_hpu_f[23],
		east_hpu_f[22],
		east_hpu_f[21],
		east_hpu_f[20],
		east_hpu_f[19],
		east_hpu_f[18],
		east_hpu_f[17],
		east_hpu_f[16],
		east_hpu_f[15],
		east_hpu_f[14],
		east_hpu_f[13],
		east_hpu_f[12],
		east_hpu_f[11],
		east_hpu_f[10],
		east_hpu_f[9],
		east_hpu_f[8],
		east_hpu_f[7],
		east_hpu_f[6],
		east_hpu_f[5],
		east_hpu_f[4],
		east_hpu_f[3],
		east_hpu_f[2],
		east_hpu_f[1],
		east_hpu_f[0] }), 
	.chan_in_b(east_hpu_b_ACK), 
	.chan_out_f({ chs_in_f[69],
		chs_in_f[68],
		chs_in_f[67],
		chs_in_f[66],
		chs_in_f[65],
		chs_in_f[64],
		chs_in_f[63],
		chs_in_f[62],
		chs_in_f[61],
		chs_in_f[60],
		chs_in_f[59],
		chs_in_f[58],
		chs_in_f[57],
		chs_in_f[56],
		chs_in_f[55],
		chs_in_f[54],
		chs_in_f[53],
		chs_in_f[52],
		chs_in_f[51],
		chs_in_f[50],
		chs_in_f[49],
		chs_in_f[48],
		chs_in_f[47],
		chs_in_f[46],
		chs_in_f[45],
		chs_in_f[44],
		chs_in_f[43],
		chs_in_f[42],
		chs_in_f[41],
		chs_in_f[40],
		chs_in_f[39],
		chs_in_f[38],
		chs_in_f[37],
		chs_in_f[36],
		chs_in_f[35] }), 
	.chan_out_b(chs_in_b_1__ACK), 
	.sel({ switch_sel[9],
		switch_sel[8],
		switch_sel[7],
		switch_sel[6],
		switch_sel[5] }));
   hpu_0_3 west_hpu (.preset(FE_OFN1003_preset), 
	.chan_in_f({ west_hpu_f[34],
		west_hpu_f[33],
		west_hpu_f[32],
		west_hpu_f[31],
		west_hpu_f[30],
		west_hpu_f[29],
		west_hpu_f[28],
		west_hpu_f[27],
		west_hpu_f[26],
		west_hpu_f[25],
		west_hpu_f[24],
		west_hpu_f[23],
		west_hpu_f[22],
		west_hpu_f[21],
		west_hpu_f[20],
		west_hpu_f[19],
		west_hpu_f[18],
		west_hpu_f[17],
		west_hpu_f[16],
		west_hpu_f[15],
		west_hpu_f[14],
		west_hpu_f[13],
		west_hpu_f[12],
		west_hpu_f[11],
		west_hpu_f[10],
		west_hpu_f[9],
		west_hpu_f[8],
		west_hpu_f[7],
		west_hpu_f[6],
		west_hpu_f[5],
		west_hpu_f[4],
		west_hpu_f[3],
		west_hpu_f[2],
		west_hpu_f[1],
		west_hpu_f[0] }), 
	.chan_in_b(west_hpu_b_ACK), 
	.chan_out_f({ chs_in_f[139],
		chs_in_f[138],
		chs_in_f[137],
		chs_in_f[136],
		chs_in_f[135],
		chs_in_f[134],
		chs_in_f[133],
		chs_in_f[132],
		chs_in_f[131],
		chs_in_f[130],
		chs_in_f[129],
		chs_in_f[128],
		chs_in_f[127],
		chs_in_f[126],
		chs_in_f[125],
		chs_in_f[124],
		chs_in_f[123],
		chs_in_f[122],
		chs_in_f[121],
		chs_in_f[120],
		chs_in_f[119],
		chs_in_f[118],
		chs_in_f[117],
		chs_in_f[116],
		chs_in_f[115],
		chs_in_f[114],
		chs_in_f[113],
		chs_in_f[112],
		chs_in_f[111],
		chs_in_f[110],
		chs_in_f[109],
		chs_in_f[108],
		chs_in_f[107],
		chs_in_f[106],
		chs_in_f[105] }), 
	.chan_out_b(chs_in_b_3__ACK), 
	.sel({ switch_sel[19],
		switch_sel[18],
		switch_sel[17],
		switch_sel[16],
		switch_sel[15] }));
   hpu_1_x resource_hpu (.preset(FE_OFN1038_preset), 
	.chan_in_f({ resource_hpu_f[34],
		resource_hpu_f[33],
		resource_hpu_f[32],
		resource_hpu_f[31],
		resource_hpu_f[30],
		resource_hpu_f[29],
		resource_hpu_f[28],
		resource_hpu_f[27],
		resource_hpu_f[26],
		resource_hpu_f[25],
		resource_hpu_f[24],
		resource_hpu_f[23],
		resource_hpu_f[22],
		resource_hpu_f[21],
		resource_hpu_f[20],
		resource_hpu_f[19],
		resource_hpu_f[18],
		resource_hpu_f[17],
		resource_hpu_f[16],
		resource_hpu_f[15],
		resource_hpu_f[14],
		resource_hpu_f[13],
		resource_hpu_f[12],
		resource_hpu_f[11],
		resource_hpu_f[10],
		resource_hpu_f[9],
		resource_hpu_f[8],
		resource_hpu_f[7],
		resource_hpu_f[6],
		resource_hpu_f[5],
		resource_hpu_f[4],
		resource_hpu_f[3],
		resource_hpu_f[2],
		resource_hpu_f[1],
		resource_hpu_f[0] }), 
	.chan_in_b(resource_hpu_b_ACK), 
	.chan_out_f({ chs_in_f[174],
		chs_in_f[173],
		chs_in_f[172],
		chs_in_f[171],
		chs_in_f[170],
		chs_in_f[169],
		chs_in_f[168],
		chs_in_f[167],
		chs_in_f[166],
		chs_in_f[165],
		chs_in_f[164],
		chs_in_f[163],
		chs_in_f[162],
		chs_in_f[161],
		chs_in_f[160],
		chs_in_f[159],
		chs_in_f[158],
		chs_in_f[157],
		chs_in_f[156],
		chs_in_f[155],
		chs_in_f[154],
		chs_in_f[153],
		chs_in_f[152],
		chs_in_f[151],
		chs_in_f[150],
		chs_in_f[149],
		chs_in_f[148],
		chs_in_f[147],
		chs_in_f[146],
		chs_in_f[145],
		chs_in_f[144],
		chs_in_f[143],
		chs_in_f[142],
		chs_in_f[141],
		chs_in_f[140] }), 
	.chan_out_b(chs_in_b_4__ACK), 
	.sel({ switch_sel[24],
		switch_sel[23],
		switch_sel[22],
		switch_sel[21],
		switch_sel[20] }));
   crossbar_stage_x0_y0 xbar_with_latches (.preset(FE_OCPN1195_preset), 
	.switch_sel({ switch_sel[24],
		switch_sel[23],
		switch_sel[22],
		switch_sel[21],
		switch_sel[20],
		switch_sel[19],
		switch_sel[18],
		switch_sel[17],
		switch_sel[16],
		switch_sel[15],
		switch_sel[14],
		switch_sel[13],
		switch_sel[12],
		switch_sel[11],
		switch_sel[10],
		switch_sel[9],
		switch_sel[8],
		switch_sel[7],
		switch_sel[6],
		switch_sel[5],
		switch_sel[4],
		switch_sel[3],
		switch_sel[2],
		switch_sel[1],
		switch_sel[0] }), 
	.chs_in_f({ chs_in_f[174],
		chs_in_f[173],
		chs_in_f[172],
		chs_in_f[171],
		chs_in_f[170],
		chs_in_f[169],
		chs_in_f[168],
		chs_in_f[167],
		chs_in_f[166],
		chs_in_f[165],
		chs_in_f[164],
		chs_in_f[163],
		chs_in_f[162],
		chs_in_f[161],
		chs_in_f[160],
		chs_in_f[159],
		chs_in_f[158],
		chs_in_f[157],
		chs_in_f[156],
		chs_in_f[155],
		chs_in_f[154],
		chs_in_f[153],
		chs_in_f[152],
		chs_in_f[151],
		chs_in_f[150],
		chs_in_f[149],
		chs_in_f[148],
		chs_in_f[147],
		chs_in_f[146],
		chs_in_f[145],
		chs_in_f[144],
		chs_in_f[143],
		chs_in_f[142],
		chs_in_f[141],
		chs_in_f[140],
		chs_in_f[139],
		chs_in_f[138],
		chs_in_f[137],
		chs_in_f[136],
		chs_in_f[135],
		chs_in_f[134],
		chs_in_f[133],
		chs_in_f[132],
		chs_in_f[131],
		chs_in_f[130],
		chs_in_f[129],
		chs_in_f[128],
		chs_in_f[127],
		chs_in_f[126],
		chs_in_f[125],
		chs_in_f[124],
		chs_in_f[123],
		chs_in_f[122],
		chs_in_f[121],
		chs_in_f[120],
		chs_in_f[119],
		chs_in_f[118],
		chs_in_f[117],
		chs_in_f[116],
		chs_in_f[115],
		chs_in_f[114],
		chs_in_f[113],
		chs_in_f[112],
		chs_in_f[111],
		chs_in_f[110],
		chs_in_f[109],
		chs_in_f[108],
		chs_in_f[107],
		chs_in_f[106],
		chs_in_f[105],
		chs_in_f[104],
		chs_in_f[103],
		chs_in_f[102],
		chs_in_f[101],
		chs_in_f[100],
		chs_in_f[99],
		chs_in_f[98],
		chs_in_f[97],
		chs_in_f[96],
		chs_in_f[95],
		chs_in_f[94],
		chs_in_f[93],
		chs_in_f[92],
		chs_in_f[91],
		chs_in_f[90],
		chs_in_f[89],
		chs_in_f[88],
		chs_in_f[87],
		chs_in_f[86],
		chs_in_f[85],
		chs_in_f[84],
		chs_in_f[83],
		chs_in_f[82],
		chs_in_f[81],
		chs_in_f[80],
		chs_in_f[79],
		chs_in_f[78],
		chs_in_f[77],
		chs_in_f[76],
		chs_in_f[75],
		chs_in_f[74],
		chs_in_f[73],
		chs_in_f[72],
		chs_in_f[71],
		chs_in_f[70],
		chs_in_f[69],
		chs_in_f[68],
		chs_in_f[67],
		chs_in_f[66],
		chs_in_f[65],
		chs_in_f[64],
		chs_in_f[63],
		chs_in_f[62],
		chs_in_f[61],
		chs_in_f[60],
		chs_in_f[59],
		chs_in_f[58],
		chs_in_f[57],
		chs_in_f[56],
		chs_in_f[55],
		chs_in_f[54],
		chs_in_f[53],
		chs_in_f[52],
		chs_in_f[51],
		chs_in_f[50],
		chs_in_f[49],
		chs_in_f[48],
		chs_in_f[47],
		chs_in_f[46],
		chs_in_f[45],
		chs_in_f[44],
		chs_in_f[43],
		chs_in_f[42],
		chs_in_f[41],
		chs_in_f[40],
		chs_in_f[39],
		chs_in_f[38],
		chs_in_f[37],
		chs_in_f[36],
		chs_in_f[35],
		chs_in_f[34],
		chs_in_f[33],
		chs_in_f[32],
		chs_in_f[31],
		chs_in_f[30],
		chs_in_f[29],
		chs_in_f[28],
		chs_in_f[27],
		chs_in_f[26],
		chs_in_f[25],
		chs_in_f[24],
		chs_in_f[23],
		chs_in_f[22],
		chs_in_f[21],
		chs_in_f[20],
		chs_in_f[19],
		chs_in_f[18],
		chs_in_f[17],
		chs_in_f[16],
		chs_in_f[15],
		chs_in_f[14],
		chs_in_f[13],
		chs_in_f[12],
		chs_in_f[11],
		chs_in_f[10],
		chs_in_f[9],
		chs_in_f[8],
		chs_in_f[7],
		chs_in_f[6],
		chs_in_f[5],
		chs_in_f[4],
		chs_in_f[3],
		chs_in_f[2],
		chs_in_f[1],
		chs_in_f[0] }), 
	.chs_in_b({ chs_in_b_4__ACK,
		chs_in_b_3__ACK,
		chs_in_b_2__ACK,
		chs_in_b_1__ACK,
		chs_in_b_0__ACK }), 
	.latches_out_f({ resource_out_f[67],
		resource_out_f[66],
		resource_out_f[65],
		resource_out_f[64],
		resource_out_f[63],
		resource_out_f[62],
		resource_out_f[61],
		resource_out_f[60],
		resource_out_f[59],
		resource_out_f[58],
		resource_out_f[57],
		resource_out_f[56],
		resource_out_f[55],
		resource_out_f[54],
		resource_out_f[53],
		resource_out_f[52],
		resource_out_f[51],
		resource_out_f[50],
		resource_out_f[49],
		resource_out_f[48],
		resource_out_f[47],
		resource_out_f[46],
		resource_out_f[45],
		resource_out_f[44],
		resource_out_f[43],
		resource_out_f[42],
		resource_out_f[41],
		resource_out_f[40],
		resource_out_f[39],
		resource_out_f[38],
		resource_out_f[37],
		resource_out_f[36],
		resource_out_f[35],
		resource_out_f[34],
		resource_out_f[33],
		resource_out_f[32],
		resource_out_f[31],
		resource_out_f[30],
		resource_out_f[29],
		resource_out_f[28],
		resource_out_f[27],
		resource_out_f[26],
		resource_out_f[25],
		resource_out_f[24],
		resource_out_f[23],
		resource_out_f[22],
		resource_out_f[21],
		resource_out_f[20],
		resource_out_f[19],
		resource_out_f[18],
		resource_out_f[17],
		resource_out_f[16],
		resource_out_f[15],
		resource_out_f[14],
		resource_out_f[13],
		resource_out_f[12],
		resource_out_f[11],
		resource_out_f[10],
		resource_out_f[9],
		resource_out_f[8],
		resource_out_f[7],
		resource_out_f[6],
		resource_out_f[5],
		resource_out_f[4],
		resource_out_f[3],
		resource_out_f[2],
		resource_out_f[1],
		resource_out_f[0],
		west_out_f[67],
		west_out_f[66],
		west_out_f[65],
		west_out_f[64],
		west_out_f[63],
		west_out_f[62],
		west_out_f[61],
		west_out_f[60],
		west_out_f[59],
		west_out_f[58],
		west_out_f[57],
		west_out_f[56],
		west_out_f[55],
		west_out_f[54],
		west_out_f[53],
		west_out_f[52],
		west_out_f[51],
		west_out_f[50],
		west_out_f[49],
		west_out_f[48],
		west_out_f[47],
		west_out_f[46],
		west_out_f[45],
		west_out_f[44],
		west_out_f[43],
		west_out_f[42],
		west_out_f[41],
		west_out_f[40],
		west_out_f[39],
		west_out_f[38],
		west_out_f[37],
		west_out_f[36],
		west_out_f[35],
		west_out_f[34],
		west_out_f[33],
		west_out_f[32],
		west_out_f[31],
		west_out_f[30],
		west_out_f[29],
		west_out_f[28],
		west_out_f[27],
		west_out_f[26],
		west_out_f[25],
		west_out_f[24],
		west_out_f[23],
		west_out_f[22],
		west_out_f[21],
		west_out_f[20],
		west_out_f[19],
		west_out_f[18],
		west_out_f[17],
		west_out_f[16],
		west_out_f[15],
		west_out_f[14],
		west_out_f[13],
		west_out_f[12],
		west_out_f[11],
		west_out_f[10],
		west_out_f[9],
		west_out_f[8],
		west_out_f[7],
		west_out_f[6],
		west_out_f[5],
		west_out_f[4],
		west_out_f[3],
		west_out_f[2],
		west_out_f[1],
		west_out_f[0],
		south_out_f[67],
		south_out_f[66],
		south_out_f[65],
		south_out_f[64],
		south_out_f[63],
		south_out_f[62],
		south_out_f[61],
		south_out_f[60],
		south_out_f[59],
		south_out_f[58],
		south_out_f[57],
		south_out_f[56],
		south_out_f[55],
		south_out_f[54],
		south_out_f[53],
		south_out_f[52],
		south_out_f[51],
		south_out_f[50],
		south_out_f[49],
		south_out_f[48],
		south_out_f[47],
		south_out_f[46],
		south_out_f[45],
		south_out_f[44],
		south_out_f[43],
		south_out_f[42],
		south_out_f[41],
		south_out_f[40],
		south_out_f[39],
		south_out_f[38],
		south_out_f[37],
		south_out_f[36],
		south_out_f[35],
		south_out_f[34],
		south_out_f[33],
		south_out_f[32],
		south_out_f[31],
		south_out_f[30],
		south_out_f[29],
		south_out_f[28],
		south_out_f[27],
		south_out_f[26],
		south_out_f[25],
		south_out_f[24],
		south_out_f[23],
		south_out_f[22],
		south_out_f[21],
		south_out_f[20],
		south_out_f[19],
		south_out_f[18],
		south_out_f[17],
		south_out_f[16],
		south_out_f[15],
		south_out_f[14],
		south_out_f[13],
		south_out_f[12],
		south_out_f[11],
		south_out_f[10],
		south_out_f[9],
		south_out_f[8],
		south_out_f[7],
		south_out_f[6],
		south_out_f[5],
		south_out_f[4],
		south_out_f[3],
		south_out_f[2],
		south_out_f[1],
		south_out_f[0],
		east_out_f[67],
		east_out_f[66],
		east_out_f[65],
		east_out_f[64],
		east_out_f[63],
		east_out_f[62],
		east_out_f[61],
		east_out_f[60],
		east_out_f[59],
		east_out_f[58],
		east_out_f[57],
		east_out_f[56],
		east_out_f[55],
		east_out_f[54],
		east_out_f[53],
		east_out_f[52],
		east_out_f[51],
		east_out_f[50],
		east_out_f[49],
		east_out_f[48],
		east_out_f[47],
		east_out_f[46],
		east_out_f[45],
		east_out_f[44],
		east_out_f[43],
		east_out_f[42],
		east_out_f[41],
		east_out_f[40],
		east_out_f[39],
		east_out_f[38],
		east_out_f[37],
		east_out_f[36],
		east_out_f[35],
		east_out_f[34],
		east_out_f[33],
		east_out_f[32],
		east_out_f[31],
		east_out_f[30],
		east_out_f[29],
		east_out_f[28],
		east_out_f[27],
		east_out_f[26],
		east_out_f[25],
		east_out_f[24],
		east_out_f[23],
		east_out_f[22],
		east_out_f[21],
		east_out_f[20],
		east_out_f[19],
		east_out_f[18],
		east_out_f[17],
		east_out_f[16],
		east_out_f[15],
		east_out_f[14],
		east_out_f[13],
		east_out_f[12],
		east_out_f[11],
		east_out_f[10],
		east_out_f[9],
		east_out_f[8],
		east_out_f[7],
		east_out_f[6],
		east_out_f[5],
		east_out_f[4],
		east_out_f[3],
		east_out_f[2],
		east_out_f[1],
		east_out_f[0],
		north_out_f[67],
		north_out_f[66],
		north_out_f[65],
		north_out_f[64],
		north_out_f[63],
		north_out_f[62],
		north_out_f[61],
		north_out_f[60],
		north_out_f[59],
		north_out_f[58],
		north_out_f[57],
		north_out_f[56],
		north_out_f[55],
		north_out_f[54],
		north_out_f[53],
		north_out_f[52],
		north_out_f[51],
		north_out_f[50],
		north_out_f[49],
		north_out_f[48],
		north_out_f[47],
		north_out_f[46],
		north_out_f[45],
		north_out_f[44],
		north_out_f[43],
		north_out_f[42],
		north_out_f[41],
		north_out_f[40],
		north_out_f[39],
		north_out_f[38],
		north_out_f[37],
		north_out_f[36],
		north_out_f[35],
		north_out_f[34],
		north_out_f[33],
		north_out_f[32],
		north_out_f[31],
		north_out_f[30],
		north_out_f[29],
		north_out_f[28],
		north_out_f[27],
		north_out_f[26],
		north_out_f[25],
		north_out_f[24],
		north_out_f[23],
		north_out_f[22],
		north_out_f[21],
		north_out_f[20],
		north_out_f[19],
		north_out_f[18],
		north_out_f[17],
		north_out_f[16],
		north_out_f[15],
		north_out_f[14],
		north_out_f[13],
		north_out_f[12],
		north_out_f[11],
		north_out_f[10],
		north_out_f[9],
		north_out_f[8],
		north_out_f[7],
		north_out_f[6],
		north_out_f[5],
		north_out_f[4],
		north_out_f[3],
		north_out_f[2],
		north_out_f[1],
		north_out_f[0] }), 
	.latches_out_b({ resource_out_b_ACK,
		west_out_b_ACK,
		south_out_b_ACK,
		east_out_b_ACK,
		north_out_b_ACK }), 
	.FE_OFN0_preset(FE_OFN0_preset), 
	.FE_OFN2_preset(FE_OFN1001_preset), 
	.FE_OFN1003_preset(FE_OFN1003_preset), 
	.FE_OFN1038_preset(FE_OFN1038_preset), 
	.FE_PHN1407_FE_OFN1003_preset(FE_PHN1407_FE_OFN1003_preset), 
	.FE_PHN1408_FE_OCPN1195_preset(FE_PHN1408_FE_OCPN1195_preset), 
	.FE_PHN1436_FE_OCPN1195_preset(FE_PHN1436_FE_OCPN1195_preset), 
	.FE_PHN1448_FE_OFN1003_preset(FE_PHN1448_FE_OFN1003_preset));
endmodule

