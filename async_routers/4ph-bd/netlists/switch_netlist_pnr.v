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
   HS65_LS_IVX9 U1 (.Z(n2), 
	.A(r));
   HS65_LS_IVX9 U2 (.Z(N1), 
	.A(qn));
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

   sr_latch_0_0 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_IVX9 U3 (.Z(n1), 
	.A(preset));
   HS65_LS_OAI21X3 U4 (.Z(reset), 
	.C(n1), 
	.B(a), 
	.A(b));
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
   wire N0;
   wire n1;

   assign Rout = Aout ;
   assign lt_en = N0 ;

   c_gate_0_0 gate (.preset(preset), 
	.a(n1), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 U1 (.Z(n1), 
	.A(Ain));
   HS65_LS_IVX9 U2 (.Z(N0), 
	.A(Aout));
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
   wire FE_OFN39_N3;
   wire lt_en;
   wire N3;

   HS65_LS_BFX9 FE_OFC39_N3 (.Z(FE_OFN39_N3), 
	.A(N3));
   latch_controller_1_0 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(FE_OFN39_N3), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHQX18 \data_reg[33]  (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(\left_in[DATA][33] ));
   HS65_LS_LDHQX18 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHQX18 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3), 
	.D(\left_in[DATA][0] ));
   HS65_LS_LDHQX18 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(\left_in[DATA][32] ));
   HS65_LS_OR2X18 U3 (.Z(N3), 
	.B(preset), 
	.A(lt_en));
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
   wire FE_OFN52_n42;
   wire FE_OCP_RBN8_n35;
   wire FE_OCP_RBN7_n35;
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
   wire n42;

   assign data_out[33] = data_in[33] ;
   assign data_out[32] = data_in[32] ;

   HS65_LS_BFX7 FE_OFC52_n42 (.Z(FE_OFN52_n42), 
	.A(n42));
   HS65_LS_BFX7 FE_OCP_RBC8_n35 (.Z(FE_OCP_RBN8_n35), 
	.A(n35));
   HS65_LS_CNIVX3 FE_OCP_RBC7_n35 (.Z(FE_OCP_RBN7_n35), 
	.A(n35));
   HS65_LS_LDHQX9 \sel_reg[4]  (.Q(sel[4]), 
	.G(N20), 
	.D(N19));
   HS65_LS_LDHQX18 \sel_reg[3]  (.Q(sel[3]), 
	.G(N20), 
	.D(N18));
   HS65_LS_LDHQX18 \sel_reg[2]  (.Q(sel[2]), 
	.G(N20), 
	.D(N17));
   HS65_LS_LDHQX18 \sel_reg[1]  (.Q(sel[1]), 
	.G(N20), 
	.D(N16));
   HS65_LS_LDHQX18 \sel_reg[0]  (.Q(sel[0]), 
	.G(N20), 
	.D(1'b0));
   HS65_LS_NOR2X5 U4 (.Z(N19), 
	.B(n42), 
	.A(n36));
   HS65_LS_NAND2X7 U5 (.Z(n37), 
	.B(n35), 
	.A(n36));
   HS65_LS_IVX9 U6 (.Z(n38), 
	.A(FE_OCP_RBN7_n35));
   HS65_LS_IVX9 U7 (.Z(n1), 
	.A(FE_OCP_RBN7_n35));
   HS65_LS_OAI22X6 U10 (.Z(data_out[6]), 
	.D(n27), 
	.C(n1), 
	.B(n25), 
	.A(FE_OCP_RBN7_n35));
   HS65_LS_OAI22X6 U11 (.Z(data_out[7]), 
	.D(n26), 
	.C(n1), 
	.B(n42), 
	.A(n24));
   HS65_LS_OAI22X6 U12 (.Z(data_out[0]), 
	.D(n33), 
	.C(FE_OCP_RBN8_n35), 
	.B(n31), 
	.A(FE_OFN52_n42));
   HS65_LS_OAI22X6 U13 (.Z(data_out[1]), 
	.D(n32), 
	.C(n38), 
	.B(n30), 
	.A(n42));
   HS65_LS_OAI22X6 U14 (.Z(data_out[2]), 
	.D(n31), 
	.C(n1), 
	.B(n29), 
	.A(FE_OFN52_n42));
   HS65_LS_OAI22X6 U15 (.Z(data_out[3]), 
	.D(n30), 
	.C(n1), 
	.B(n28), 
	.A(n42));
   HS65_LS_OAI22X6 U16 (.Z(data_out[4]), 
	.D(n29), 
	.C(n1), 
	.B(n27), 
	.A(FE_OFN52_n42));
   HS65_LS_OAI22X6 U17 (.Z(data_out[5]), 
	.D(n28), 
	.C(n38), 
	.B(n26), 
	.A(n42));
   HS65_LS_OAI22X6 U18 (.Z(data_out[8]), 
	.D(n25), 
	.C(n1), 
	.B(n23), 
	.A(FE_OFN52_n42));
   HS65_LS_OAI22X6 U19 (.Z(data_out[9]), 
	.D(n24), 
	.C(n1), 
	.B(n22), 
	.A(FE_OFN52_n42));
   HS65_LS_OAI22X6 U20 (.Z(data_out[10]), 
	.D(n23), 
	.C(FE_OCP_RBN8_n35), 
	.B(n21), 
	.A(FE_OFN52_n42));
   HS65_LS_OAI22X6 U21 (.Z(data_out[11]), 
	.D(n22), 
	.C(FE_OCP_RBN8_n35), 
	.B(n20), 
	.A(FE_OFN52_n42));
   HS65_LS_OAI22X6 U22 (.Z(data_out[12]), 
	.D(n21), 
	.C(FE_OCP_RBN8_n35), 
	.B(n19), 
	.A(FE_OFN52_n42));
   HS65_LS_OAI22X6 U23 (.Z(data_out[13]), 
	.D(n20), 
	.C(FE_OCP_RBN8_n35), 
	.B(n18), 
	.A(FE_OFN52_n42));
   HS65_LS_OAI22X6 U24 (.Z(data_out[14]), 
	.D(n19), 
	.C(FE_OCP_RBN8_n35), 
	.B(n17), 
	.A(FE_OFN52_n42));
   HS65_LS_OAI22X6 U25 (.Z(data_out[15]), 
	.D(n18), 
	.C(n38), 
	.B(n16), 
	.A(FE_OFN52_n42));
   HS65_LS_OAI22X6 U26 (.Z(data_out[16]), 
	.D(n17), 
	.C(n38), 
	.B(n15), 
	.A(FE_OFN52_n42));
   HS65_LS_OAI22X6 U27 (.Z(data_out[17]), 
	.D(n16), 
	.C(n38), 
	.B(n14), 
	.A(FE_OFN52_n42));
   HS65_LS_OAI22X6 U28 (.Z(data_out[18]), 
	.D(n15), 
	.C(n38), 
	.B(n13), 
	.A(FE_OFN52_n42));
   HS65_LS_OAI22X6 U29 (.Z(data_out[19]), 
	.D(n14), 
	.C(n38), 
	.B(n12), 
	.A(FE_OFN52_n42));
   HS65_LS_OAI22X6 U30 (.Z(data_out[20]), 
	.D(n13), 
	.C(n38), 
	.B(n11), 
	.A(n42));
   HS65_LS_OAI22X6 U31 (.Z(data_out[21]), 
	.D(n12), 
	.C(n38), 
	.B(n10), 
	.A(FE_OFN52_n42));
   HS65_LS_OAI22X6 U32 (.Z(data_out[22]), 
	.D(n11), 
	.C(n38), 
	.B(n9), 
	.A(n42));
   HS65_LS_OAI22X6 U33 (.Z(data_out[23]), 
	.D(n10), 
	.C(n38), 
	.B(n8), 
	.A(FE_OFN52_n42));
   HS65_LS_OAI22X6 U34 (.Z(data_out[24]), 
	.D(n9), 
	.C(n38), 
	.B(n7), 
	.A(n42));
   HS65_LS_OAI22X6 U35 (.Z(data_out[25]), 
	.D(n8), 
	.C(n1), 
	.B(n6), 
	.A(FE_OFN52_n42));
   HS65_LS_OAI22X6 U36 (.Z(data_out[26]), 
	.D(n7), 
	.C(n1), 
	.B(n5), 
	.A(n42));
   HS65_LS_OAI22X6 U37 (.Z(data_out[27]), 
	.D(n6), 
	.C(n1), 
	.B(n4), 
	.A(FE_OFN52_n42));
   HS65_LS_OAI22X6 U38 (.Z(data_out[28]), 
	.D(n5), 
	.C(n1), 
	.B(n3), 
	.A(n42));
   HS65_LS_OAI22X6 U39 (.Z(data_out[29]), 
	.D(n4), 
	.C(n1), 
	.B(n2), 
	.A(FE_OFN52_n42));
   HS65_LS_NOR3X7 U41 (.Z(N18), 
	.C(n37), 
	.B(n33), 
	.A(n32));
   HS65_LS_NAND2X7 U42 (.Z(n36), 
	.B(n33), 
	.A(n32));
   HS65_LS_CNIVX48 U43 (.Z(n42), 
	.A(n35));
   HS65_LS_NOR2X6 U44 (.Z(data_out[30]), 
	.B(n3), 
	.A(FE_OCP_RBN8_n35));
   HS65_LS_NOR2X6 U45 (.Z(data_out[31]), 
	.B(n2), 
	.A(FE_OCP_RBN8_n35));
   HS65_LS_CNIVX21 U46 (.Z(n32), 
	.A(data_in[1]));
   HS65_LS_NOR2AX19 U47 (.Z(n35), 
	.B(data_in[32]), 
	.A(data_in[33]));
   HS65_LS_CNIVX27 U48 (.Z(n33), 
	.A(data_in[0]));
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
   HS65_LS_IVX9 U77 (.Z(n4), 
	.A(data_in[29]));
   HS65_LS_IVX9 U78 (.Z(n3), 
	.A(data_in[30]));
   HS65_LS_IVX9 U79 (.Z(n2), 
	.A(data_in[31]));
   HS65_LS_NOR2X6 U80 (.Z(N16), 
	.B(n37), 
	.A(data_in[1]));
   HS65_LS_NOR2X3 U81 (.Z(N17), 
	.B(n37), 
	.A(data_in[0]));
   HS65_LS_NOR2AX3 U82 (.Z(N20), 
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
   wire N0;
   wire n2;

   assign Rout = Aout ;
   assign lt_en = N0 ;

   c_gate_0_5 gate (.preset(preset), 
	.a(n2), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 I_0 (.Z(N0), 
	.A(Aout));
   HS65_LS_IVX9 U1 (.Z(n2), 
	.A(Ain));
endmodule

module channel_latch_1_xxxxxxxxx_5 (
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
   wire FE_OFN34_N3;
   wire lt_en;
   wire N3;

   HS65_LS_BFX9 FE_OFC34_N3 (.Z(FE_OFN34_N3), 
	.A(N3));
   latch_controller_1_5 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX18 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(N3), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHQX18 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHQX18 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(N3), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHQX18 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHQX18 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(FE_OFN34_N3), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHQX18 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHQX18 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(FE_OFN34_N3), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHQX18 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHQX18 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(FE_OFN34_N3), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHQX18 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHQX18 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(FE_OFN34_N3), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHQX18 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHQX18 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(FE_OFN34_N3), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHQX18 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHQX18 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(FE_OFN34_N3), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHQX18 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHQX18 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(FE_OFN34_N3), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHQX18 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(FE_OFN34_N3), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHQX18 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(FE_OFN34_N3), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHQX18 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(FE_OFN34_N3), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHQX18 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(FE_OFN34_N3), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHQX18 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(FE_OFN34_N3), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHQX18 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHQX18 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(FE_OFN34_N3), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHQX18 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHQX18 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(FE_OFN34_N3), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHQX18 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHQX18 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(FE_OFN34_N3), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHQX18 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHQX18 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(FE_OFN34_N3), 
	.D(\left_in[DATA][0] ));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(N3), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHQX9 \data_reg[33]  (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(\left_in[DATA][33] ));
   HS65_LS_LDHQX9 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(\left_in[DATA][32] ));
   HS65_LS_OR2X18 U3 (.Z(N3), 
	.B(preset), 
	.A(lt_en));
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
   wire data_in_valid;
   wire req_n;
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
   wire N0;
   wire n1;

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
   channel_latch_1_xxxxxxxxx_5 token_latch (.preset(preset), 
	.left_in({ n1,
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
   HS65_LS_IVX9 I_1 (.Z(req_n), 
	.A(\chan_in_f[REQ] ));
   HS65_LS_IVX9 I_0 (.Z(N0), 
	.A(\chan_in_b[ACK] ));
   HS65_LS_AND2X4 U1 (.Z(data_in_valid), 
	.B(N0), 
	.A(\chan_in_f[REQ] ));
   HS65_LS_IVX9 U2 (.Z(n1), 
	.A(req_n));
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
   wire FE_OFN51_FE_OCPN4_FE_OFN0_n19;
   wire FE_OCPN22_n32;
   wire FE_OCPN4_FE_OFN0_n19;
   wire FE_OCPN3_FE_OFN0_n19;
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
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n32;
   wire n33;

   assign data_out[33] = data_in[33] ;
   assign data_out[32] = data_in[32] ;

   HS65_LS_BFX7 FE_OFC51_FE_OCPN4_FE_OFN0_n19 (.Z(FE_OFN51_FE_OCPN4_FE_OFN0_n19), 
	.A(FE_OCPN4_FE_OFN0_n19));
   HS65_LS_NAND2X14 FE_RC_47_0 (.Z(n21), 
	.B(n20), 
	.A(n19));
   HS65_LS_NOR4ABX2 FE_RC_46_0 (.Z(N21), 
	.D(n22), 
	.C(n17), 
	.B(n19), 
	.A(n20));
   HS65_LS_BFX7 FE_OCPC22_n32 (.Z(FE_OCPN22_n32), 
	.A(n32));
   HS65_LS_BFX106 FE_OCPC4_FE_OFN0_n19 (.Z(FE_OCPN4_FE_OFN0_n19), 
	.A(FE_OCPN3_FE_OFN0_n19));
   HS65_LS_BFX7 FE_OCPC3_FE_OFN0_n19 (.Z(FE_OCPN3_FE_OFN0_n19), 
	.A(n19));
   HS65_LS_LDHQX18 \sel_reg[4]  (.Q(sel[4]), 
	.G(N23), 
	.D(N22));
   HS65_LS_LDHQX9 \sel_reg[3]  (.Q(sel[3]), 
	.G(N23), 
	.D(N21));
   HS65_LS_LDHQX18 \sel_reg[2]  (.Q(sel[2]), 
	.G(N23), 
	.D(1'b0));
   HS65_LS_LDHQX9 \sel_reg[1]  (.Q(sel[1]), 
	.G(N23), 
	.D(N19));
   HS65_LS_LDHQX18 \sel_reg[0]  (.Q(sel[0]), 
	.G(N23), 
	.D(N18));
   HS65_LS_NAND2X7 U3 (.Z(data_out[12]), 
	.B(n24), 
	.A(n23));
   HS65_LS_OR2X9 U4 (.Z(n24), 
	.B(n11), 
	.A(FE_OFN51_FE_OCPN4_FE_OFN0_n19));
   HS65_LS_OR2X9 U11 (.Z(n23), 
	.B(n10), 
	.A(n26));
   HS65_LS_IVX9 U12 (.Z(n25), 
	.A(FE_OCPN4_FE_OFN0_n19));
   HS65_LS_IVX9 U13 (.Z(n26), 
	.A(FE_OCPN4_FE_OFN0_n19));
   HS65_LS_IVX9 U14 (.Z(n27), 
	.A(FE_OCPN4_FE_OFN0_n19));
   HS65_LS_IVX7 U15 (.Z(n33), 
	.A(FE_OCPN4_FE_OFN0_n19));
   HS65_LS_OAI22X6 U16 (.Z(data_out[10]), 
	.D(n12), 
	.C(FE_OFN51_FE_OCPN4_FE_OFN0_n19), 
	.B(n11), 
	.A(n26));
   HS65_LS_AND2X4 U17 (.Z(n29), 
	.B(data_in[29]), 
	.A(n33));
   HS65_LS_OR2X9 U18 (.Z(data_out[29]), 
	.B(n29), 
	.A(n28));
   HS65_LH_AND2X4 U19 (.Z(n28), 
	.B(data_in[31]), 
	.A(FE_OCPN4_FE_OFN0_n19));
   HS65_LH_OAI22X1 U20 (.Z(data_out[6]), 
	.D(n14), 
	.C(FE_OFN51_FE_OCPN4_FE_OFN0_n19), 
	.B(n13), 
	.A(n33));
   HS65_LH_OAI22X1 U21 (.Z(data_out[22]), 
	.D(n6), 
	.C(FE_OCPN4_FE_OFN0_n19), 
	.B(n5), 
	.A(n33));
   HS65_LH_OAI22X1 U22 (.Z(data_out[0]), 
	.D(n17), 
	.C(FE_OFN51_FE_OCPN4_FE_OFN0_n19), 
	.B(n16), 
	.A(n33));
   HS65_LS_OAI22X1 U23 (.Z(data_out[14]), 
	.D(n10), 
	.C(FE_OCPN4_FE_OFN0_n19), 
	.B(n9), 
	.A(n27));
   HS65_LS_OAI22X1 U24 (.Z(data_out[24]), 
	.D(n5), 
	.C(FE_OCPN4_FE_OFN0_n19), 
	.B(n4), 
	.A(n33));
   HS65_LS_OAI22X1 U25 (.Z(data_out[28]), 
	.D(n3), 
	.C(FE_OFN51_FE_OCPN4_FE_OFN0_n19), 
	.B(n2), 
	.A(n26));
   HS65_LS_NOR2X5 U27 (.Z(N22), 
	.B(n20), 
	.A(n32));
   HS65_LS_IVX9 U28 (.Z(n32), 
	.A(n19));
   HS65_LS_OAI22X6 U29 (.Z(data_out[2]), 
	.D(n16), 
	.C(FE_OFN51_FE_OCPN4_FE_OFN0_n19), 
	.B(n15), 
	.A(n27));
   HS65_LS_OAI22X6 U30 (.Z(data_out[4]), 
	.D(n15), 
	.C(FE_OFN51_FE_OCPN4_FE_OFN0_n19), 
	.B(n14), 
	.A(FE_OCPN22_n32));
   HS65_LS_OAI22X6 U31 (.Z(data_out[8]), 
	.D(n13), 
	.C(FE_OFN51_FE_OCPN4_FE_OFN0_n19), 
	.B(n12), 
	.A(n25));
   HS65_LS_OAI22X6 U32 (.Z(data_out[16]), 
	.D(n9), 
	.C(FE_OCPN4_FE_OFN0_n19), 
	.B(n8), 
	.A(n25));
   HS65_LS_OAI22X6 U33 (.Z(data_out[18]), 
	.D(n8), 
	.C(FE_OCPN4_FE_OFN0_n19), 
	.B(n7), 
	.A(n26));
   HS65_LS_OAI22X6 U34 (.Z(data_out[20]), 
	.D(n7), 
	.C(FE_OCPN4_FE_OFN0_n19), 
	.B(n6), 
	.A(FE_OCPN22_n32));
   HS65_LS_OAI22X6 U35 (.Z(data_out[26]), 
	.D(n4), 
	.C(FE_OFN51_FE_OCPN4_FE_OFN0_n19), 
	.B(n3), 
	.A(n27));
   HS65_LS_NOR2AX3 U37 (.Z(N19), 
	.B(n21), 
	.A(n22));
   HS65_LS_NOR2X6 U38 (.Z(data_out[30]), 
	.B(n2), 
	.A(FE_OFN51_FE_OCPN4_FE_OFN0_n19));
   HS65_LS_IVX9 U39 (.Z(n17), 
	.A(data_in[0]));
   HS65_LS_NOR2AX19 U40 (.Z(n19), 
	.B(data_in[32]), 
	.A(data_in[33]));
   HS65_LS_NAND2X7 U41 (.Z(n20), 
	.B(n17), 
	.A(data_in[1]));
   HS65_LS_NOR2X6 U42 (.Z(n22), 
	.B(data_in[1]), 
	.A(n17));
   HS65_LS_IVX9 U43 (.Z(n16), 
	.A(data_in[2]));
   HS65_LS_IVX9 U44 (.Z(n15), 
	.A(data_in[4]));
   HS65_LS_IVX9 U45 (.Z(n14), 
	.A(data_in[6]));
   HS65_LS_IVX9 U46 (.Z(n13), 
	.A(data_in[8]));
   HS65_LS_IVX9 U47 (.Z(n12), 
	.A(data_in[10]));
   HS65_LS_IVX9 U48 (.Z(n11), 
	.A(data_in[12]));
   HS65_LS_IVX9 U49 (.Z(n10), 
	.A(data_in[14]));
   HS65_LS_IVX9 U50 (.Z(n9), 
	.A(data_in[16]));
   HS65_LS_IVX9 U51 (.Z(n8), 
	.A(data_in[18]));
   HS65_LS_IVX9 U52 (.Z(n7), 
	.A(data_in[20]));
   HS65_LS_IVX9 U53 (.Z(n6), 
	.A(data_in[22]));
   HS65_LS_IVX9 U54 (.Z(n5), 
	.A(data_in[24]));
   HS65_LS_IVX9 U55 (.Z(n4), 
	.A(data_in[26]));
   HS65_LS_IVX9 U56 (.Z(n3), 
	.A(data_in[28]));
   HS65_LS_IVX9 U57 (.Z(n2), 
	.A(data_in[30]));
   HS65_LS_NOR2X6 U58 (.Z(N18), 
	.B(n21), 
	.A(data_in[0]));
   HS65_LS_AO22X9 U59 (.Z(data_out[1]), 
	.D(data_in[1]), 
	.C(n26), 
	.B(data_in[3]), 
	.A(FE_OFN51_FE_OCPN4_FE_OFN0_n19));
   HS65_LS_AO22X9 U60 (.Z(data_out[3]), 
	.D(data_in[3]), 
	.C(n25), 
	.B(data_in[5]), 
	.A(FE_OFN51_FE_OCPN4_FE_OFN0_n19));
   HS65_LS_AO22X9 U62 (.Z(data_out[5]), 
	.D(data_in[5]), 
	.C(n25), 
	.B(data_in[7]), 
	.A(FE_OFN51_FE_OCPN4_FE_OFN0_n19));
   HS65_LS_AO22X9 U63 (.Z(data_out[9]), 
	.D(data_in[9]), 
	.C(n27), 
	.B(data_in[11]), 
	.A(FE_OFN51_FE_OCPN4_FE_OFN0_n19));
   HS65_LS_AO22X9 U64 (.Z(data_out[11]), 
	.D(data_in[11]), 
	.C(FE_OCPN22_n32), 
	.B(data_in[13]), 
	.A(FE_OFN51_FE_OCPN4_FE_OFN0_n19));
   HS65_LS_AO22X9 U65 (.Z(data_out[13]), 
	.D(data_in[13]), 
	.C(n25), 
	.B(data_in[15]), 
	.A(FE_OFN51_FE_OCPN4_FE_OFN0_n19));
   HS65_LS_AO22X9 U66 (.Z(data_out[15]), 
	.D(data_in[15]), 
	.C(n26), 
	.B(data_in[17]), 
	.A(FE_OFN51_FE_OCPN4_FE_OFN0_n19));
   HS65_LS_AO22X9 U67 (.Z(data_out[17]), 
	.D(data_in[17]), 
	.C(n27), 
	.B(data_in[19]), 
	.A(FE_OFN51_FE_OCPN4_FE_OFN0_n19));
   HS65_LS_AO22X9 U68 (.Z(data_out[19]), 
	.D(data_in[19]), 
	.C(FE_OCPN22_n32), 
	.B(data_in[21]), 
	.A(FE_OFN51_FE_OCPN4_FE_OFN0_n19));
   HS65_LS_AO22X9 U69 (.Z(data_out[21]), 
	.D(data_in[21]), 
	.C(FE_OCPN22_n32), 
	.B(data_in[23]), 
	.A(FE_OCPN4_FE_OFN0_n19));
   HS65_LS_AO22X9 U70 (.Z(data_out[23]), 
	.D(data_in[23]), 
	.C(n25), 
	.B(data_in[25]), 
	.A(FE_OCPN4_FE_OFN0_n19));
   HS65_LS_AO22X9 U71 (.Z(data_out[25]), 
	.D(data_in[25]), 
	.C(n27), 
	.B(data_in[27]), 
	.A(FE_OCPN4_FE_OFN0_n19));
   HS65_LS_AO22X9 U72 (.Z(data_out[27]), 
	.D(data_in[27]), 
	.C(n26), 
	.B(data_in[29]), 
	.A(FE_OCPN4_FE_OFN0_n19));
   HS65_LS_AO22X9 U73 (.Z(data_out[7]), 
	.D(data_in[7]), 
	.C(n27), 
	.B(FE_OFN51_FE_OCPN4_FE_OFN0_n19), 
	.A(data_in[9]));
   HS65_LS_AND2X4 U74 (.Z(data_out[31]), 
	.B(FE_OCPN22_n32), 
	.A(data_in[31]));
   HS65_LS_NOR2AX6 U75 (.Z(N23), 
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
   HS65_LS_OAI12X18 U4 (.Z(reset), 
	.C(n1), 
	.B(a), 
	.A(b));
   HS65_LS_IVX9 U3 (.Z(n1), 
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
   wire N0;
   wire n2;

   assign Rout = Aout ;
   assign lt_en = N0 ;

   c_gate_0_4 gate (.preset(preset), 
	.a(n2), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 I_0 (.Z(N0), 
	.A(Aout));
   HS65_LS_IVX9 U1 (.Z(n2), 
	.A(Ain));
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
   wire FE_OFN33_N3;
   wire lt_en;
   wire N3;

   HS65_LS_BFX9 FE_OFC33_N3 (.Z(FE_OFN33_N3), 
	.A(N3));
   latch_controller_1_4 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX18 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(N3), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHQX18 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(N3), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHQX18 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(N3), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHQX18 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(N3), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHQX18 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHQX18 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHQX18 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHQX18 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHQX18 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHQX18 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHQX18 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHQX18 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHQX18 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHQX9 \data_reg[33]  (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(\left_in[DATA][33] ));
   HS65_LS_LDHQX9 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(\left_in[DATA][32] ));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHQX18 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHQX18 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHQX18 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHQX18 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHQX18 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHQX18 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHQX18 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHQX18 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][0] ));
   HS65_LS_LDHQX18 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHQX18 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHQX18 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHQX18 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHQX18 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHQX18 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(N3), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHQX18 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(N3), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHQX18 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHQX18 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(FE_OFN33_N3), 
	.D(\left_in[DATA][7] ));
   HS65_LS_OR2X18 U3 (.Z(N3), 
	.B(preset), 
	.A(lt_en));
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
   wire data_in_valid;
   wire req_n;
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
   wire N0;
   wire n1;

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
	.left_in({ n1,
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
   HS65_LS_IVX9 I_1 (.Z(req_n), 
	.A(\chan_in_f[REQ] ));
   HS65_LS_IVX9 I_0 (.Z(N0), 
	.A(\chan_in_b[ACK] ));
   HS65_LS_AND2X4 U1 (.Z(data_in_valid), 
	.B(N0), 
	.A(\chan_in_f[REQ] ));
   HS65_LS_IVX9 U2 (.Z(n1), 
	.A(req_n));
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
   wire FE_OFN50_FE_OCPN6_n41;
   wire FE_RN_12_0;
   wire FE_OCPN6_n41;
   wire FE_OCPN5_n41;
   wire FE_OCPN2_n40;
   wire FE_RN_4_0;
   wire FE_RN_3_0;
   wire FE_RN_2_0;
   wire N15;
   wire N17;
   wire N18;
   wire N19;
   wire N20;
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
   wire n20;
   wire n22;
   wire n1;
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

   assign data_out[33] = data_in[33] ;
   assign data_out[32] = data_in[32] ;

   HS65_LS_BFX9 FE_OFC50_FE_OCPN6_n41 (.Z(FE_OFN50_FE_OCPN6_n41), 
	.A(FE_OCPN6_n41));
   HS65_LS_AND3X18 FE_RC_48_0 (.Z(N17), 
	.C(n41), 
	.B(n20), 
	.A(n22));
   HS65_LS_NAND2X14 FE_RC_43_0 (.Z(FE_RN_12_0), 
	.B(n41), 
	.A(n20));
   HS65_LS_NOR3X4 FE_RC_42_0 (.Z(N18), 
	.C(FE_RN_12_0), 
	.B(n22), 
	.A(n17));
   HS65_LS_BFX106 FE_OCPC6_n41 (.Z(FE_OCPN6_n41), 
	.A(FE_OCPN5_n41));
   HS65_LS_BFX7 FE_OCPC5_n41 (.Z(FE_OCPN5_n41), 
	.A(n41));
   HS65_LS_BFX7 FE_OCPC2_n40 (.Z(FE_OCPN2_n40), 
	.A(n40));
   HS65_LS_IVX9 FE_RC_27_0 (.Z(FE_RN_4_0), 
	.A(data_in[1]));
   HS65_LS_AND2X18 FE_RC_26_0 (.Z(FE_RN_3_0), 
	.B(n20), 
	.A(FE_RN_4_0));
   HS65_LS_IVX9 FE_RC_25_0 (.Z(N15), 
	.A(FE_RN_2_0));
   HS65_LS_NAND2X14 FE_RC_24_0 (.Z(FE_RN_2_0), 
	.B(n41), 
	.A(FE_RN_3_0));
   HS65_LS_LDHQX18 \sel_reg[4]  (.Q(sel[4]), 
	.G(N20), 
	.D(N19));
   HS65_LS_LDHQX18 \sel_reg[3]  (.Q(sel[3]), 
	.G(N20), 
	.D(N18));
   HS65_LS_LDHQX18 \sel_reg[2]  (.Q(sel[2]), 
	.G(N20), 
	.D(N17));
   HS65_LS_LDHQX18 \sel_reg[1]  (.Q(sel[1]), 
	.G(N20), 
	.D(1'b0));
   HS65_LS_LDHQX18 \sel_reg[0]  (.Q(sel[0]), 
	.G(N20), 
	.D(N15));
   HS65_LH_IVX2 U3 (.Z(n1), 
	.A(FE_OCPN2_n40));
   HS65_LS_NAND2X29 U4 (.Z(n40), 
	.B(n25), 
	.A(data_in[33]));
   HS65_LH_AND2X4 U6 (.Z(data_out[31]), 
	.B(data_in[31]), 
	.A(FE_OCPN2_n40));
   HS65_LH_AND2X4 U7 (.Z(data_out[30]), 
	.B(FE_OCPN2_n40), 
	.A(data_in[30]));
   HS65_LS_NOR2AX6 U8 (.Z(N20), 
	.B(data_in[32]), 
	.A(data_valid));
   HS65_LS_MUXI21X2 U12 (.Z(data_out[1]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(n16), 
	.D0(n17));
   HS65_LS_MUXI21X2 U14 (.Z(data_out[7]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(n13), 
	.D0(n14));
   HS65_LS_MUXI21X2 U15 (.Z(data_out[9]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(n12), 
	.D0(n13));
   HS65_LS_MUXI21X2 U16 (.Z(data_out[11]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(n11), 
	.D0(n12));
   HS65_LS_MUXI21X2 U17 (.Z(data_out[13]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(n10), 
	.D0(n11));
   HS65_LS_MUXI21X2 U18 (.Z(data_out[15]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(n9), 
	.D0(n10));
   HS65_LS_MUXI21X2 U19 (.Z(data_out[17]), 
	.S0(n1), 
	.D1(n8), 
	.D0(n9));
   HS65_LS_MUXI21X2 U20 (.Z(data_out[19]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(n7), 
	.D0(n8));
   HS65_LS_MUXI21X2 U21 (.Z(data_out[21]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(n6), 
	.D0(n7));
   HS65_LS_MUXI21X2 U22 (.Z(data_out[23]), 
	.S0(n1), 
	.D1(n5), 
	.D0(n6));
   HS65_LS_MUXI21X2 U23 (.Z(data_out[25]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(n4), 
	.D0(n5));
   HS65_LS_MUXI21X2 U24 (.Z(data_out[27]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(n3), 
	.D0(n4));
   HS65_LS_MUXI21X2 U25 (.Z(data_out[3]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(n15), 
	.D0(n16));
   HS65_LS_MUXI21X2 U26 (.Z(data_out[5]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(n14), 
	.D0(n15));
   HS65_LS_NOR2AX3 U29 (.Z(N19), 
	.B(n20), 
	.A(n41));
   HS65_LS_MUX21X4 U30 (.Z(data_out[28]), 
	.S0(FE_OCPN6_n41), 
	.D1(data_in[30]), 
	.D0(data_in[28]));
   HS65_LS_CNIVX21 U31 (.Z(n17), 
	.A(data_in[1]));
   HS65_LS_NOR2X6 U32 (.Z(n22), 
	.B(data_in[0]), 
	.A(n17));
   HS65_LS_CNNAND2X18 U33 (.Z(n20), 
	.B(n17), 
	.A(data_in[0]));
   HS65_LS_IVX9 U35 (.Z(n16), 
	.A(data_in[3]));
   HS65_LS_IVX9 U36 (.Z(n15), 
	.A(data_in[5]));
   HS65_LS_IVX9 U37 (.Z(n14), 
	.A(data_in[7]));
   HS65_LS_IVX9 U38 (.Z(n13), 
	.A(data_in[9]));
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
   HS65_LS_IVX9 U49 (.Z(n26), 
	.A(data_in[0]));
   HS65_LS_CNIVX21 U50 (.Z(n25), 
	.A(data_in[32]));
   HS65_LS_IVX106 U51 (.Z(n41), 
	.A(n40));
   HS65_LS_MUX21I1X6 U52 (.Z(data_out[0]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(data_in[2]), 
	.D0(n26));
   HS65_LS_IVX9 U53 (.Z(n27), 
	.A(data_in[2]));
   HS65_LS_MUX21I1X6 U54 (.Z(data_out[2]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(data_in[4]), 
	.D0(n27));
   HS65_LS_IVX9 U55 (.Z(n28), 
	.A(data_in[4]));
   HS65_LS_MUX21I1X6 U56 (.Z(data_out[4]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(data_in[6]), 
	.D0(n28));
   HS65_LS_IVX9 U57 (.Z(n29), 
	.A(data_in[6]));
   HS65_LS_MUX21I1X6 U58 (.Z(data_out[6]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(data_in[8]), 
	.D0(n29));
   HS65_LS_IVX9 U59 (.Z(n30), 
	.A(data_in[8]));
   HS65_LS_MUX21I1X6 U60 (.Z(data_out[8]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(data_in[10]), 
	.D0(n30));
   HS65_LS_IVX9 U62 (.Z(n31), 
	.A(data_in[10]));
   HS65_LS_MUX21I1X6 U63 (.Z(data_out[10]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(data_in[12]), 
	.D0(n31));
   HS65_LS_IVX9 U64 (.Z(n32), 
	.A(data_in[12]));
   HS65_LS_MUX21I1X6 U65 (.Z(data_out[12]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(data_in[14]), 
	.D0(n32));
   HS65_LS_IVX9 U66 (.Z(n33), 
	.A(data_in[14]));
   HS65_LS_MUX21I1X6 U67 (.Z(data_out[14]), 
	.S0(FE_OCPN6_n41), 
	.D1(data_in[16]), 
	.D0(n33));
   HS65_LS_IVX9 U68 (.Z(n34), 
	.A(data_in[16]));
   HS65_LS_MUX21I1X6 U69 (.Z(data_out[16]), 
	.S0(FE_OCPN6_n41), 
	.D1(data_in[18]), 
	.D0(n34));
   HS65_LS_IVX9 U70 (.Z(n35), 
	.A(data_in[18]));
   HS65_LS_MUX21I1X6 U71 (.Z(data_out[18]), 
	.S0(FE_OCPN6_n41), 
	.D1(data_in[20]), 
	.D0(n35));
   HS65_LS_IVX9 U72 (.Z(n36), 
	.A(data_in[20]));
   HS65_LS_MUX21I1X6 U73 (.Z(data_out[20]), 
	.S0(FE_OCPN6_n41), 
	.D1(data_in[22]), 
	.D0(n36));
   HS65_LS_IVX9 U74 (.Z(n37), 
	.A(data_in[22]));
   HS65_LS_MUX21I1X6 U75 (.Z(data_out[22]), 
	.S0(FE_OCPN6_n41), 
	.D1(data_in[24]), 
	.D0(n37));
   HS65_LS_IVX9 U76 (.Z(n38), 
	.A(data_in[24]));
   HS65_LS_MUX21I1X6 U77 (.Z(data_out[24]), 
	.S0(FE_OCPN6_n41), 
	.D1(data_in[26]), 
	.D0(n38));
   HS65_LS_IVX9 U78 (.Z(n39), 
	.A(data_in[26]));
   HS65_LS_MUX21I1X6 U79 (.Z(data_out[26]), 
	.S0(FE_OCPN6_n41), 
	.D1(data_in[28]), 
	.D0(n39));
   HS65_LS_MUX21I1X6 U80 (.Z(data_out[29]), 
	.S0(FE_OFN50_FE_OCPN6_n41), 
	.D1(data_in[31]), 
	.D0(n3));
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
   HS65_LS_OAI12X18 U4 (.Z(reset), 
	.C(n1), 
	.B(a), 
	.A(b));
   HS65_LS_IVX9 U3 (.Z(n1), 
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
   wire N0;
   wire n2;

   assign Rout = Aout ;
   assign lt_en = N0 ;

   c_gate_0_3 gate (.preset(preset), 
	.a(n2), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 I_0 (.Z(N0), 
	.A(Aout));
   HS65_LS_IVX9 U1 (.Z(n2), 
	.A(Ain));
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
   wire FE_OFN32_N3;
   wire lt_en;
   wire N3;

   HS65_LS_BFX9 FE_OFC32_N3 (.Z(FE_OFN32_N3), 
	.A(N3));
   latch_controller_1_3 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(FE_OFN32_N3), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(FE_OFN32_N3), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(FE_OFN32_N3), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(FE_OFN32_N3), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(FE_OFN32_N3), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(FE_OFN32_N3), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(FE_OFN32_N3), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(FE_OFN32_N3), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(FE_OFN32_N3), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(FE_OFN32_N3), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(FE_OFN32_N3), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(FE_OFN32_N3), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHQX4 \data_reg[33]  (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(\left_in[DATA][33] ));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHQX9 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(FE_OFN32_N3), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHQX9 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(FE_OFN32_N3), 
	.D(\left_in[DATA][0] ));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(FE_OFN32_N3), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHQX18 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(FE_OFN32_N3), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHQX18 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHQX9 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(\left_in[DATA][32] ));
   HS65_LS_OR2X27 U3 (.Z(N3), 
	.B(preset), 
	.A(lt_en));
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
   wire data_in_valid;
   wire req_n;
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
   wire N0;
   wire n1;

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
	.left_in({ n1,
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
   HS65_LS_IVX9 I_1 (.Z(req_n), 
	.A(\chan_in_f[REQ] ));
   HS65_LS_IVX9 I_0 (.Z(N0), 
	.A(\chan_in_b[ACK] ));
   HS65_LS_AND2X4 U1 (.Z(data_in_valid), 
	.B(N0), 
	.A(\chan_in_f[REQ] ));
   HS65_LS_IVX9 U2 (.Z(n1), 
	.A(req_n));
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
   wire FE_OCP_RBN29_n35;
   wire FE_OCP_RBN28_n35;
   wire FE_OCP_RBN27_n35;
   wire FE_OCP_RBN26_n35;
   wire FE_OCP_RBN25_n35;
   wire FE_OCP_RBN24_n35;
   wire FE_OCP_RBN23_n35;
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
   wire n39;
   wire n40;
   wire n45;

   assign data_out[33] = data_in[33] ;
   assign data_out[32] = data_in[32] ;

   HS65_LS_CNIVX3 FE_OCP_RBC29_n35 (.Z(FE_OCP_RBN29_n35), 
	.A(FE_OCP_RBN26_n35));
   HS65_LS_CNIVX34 FE_OCP_RBC28_n35 (.Z(FE_OCP_RBN28_n35), 
	.A(FE_OCP_RBN26_n35));
   HS65_LS_CNIVX27 FE_OCP_RBC27_n35 (.Z(FE_OCP_RBN27_n35), 
	.A(FE_OCP_RBN26_n35));
   HS65_LS_BFX7 FE_OCP_RBC26_n35 (.Z(FE_OCP_RBN26_n35), 
	.A(n35));
   HS65_LS_CNIVX34 FE_OCP_RBC25_n35 (.Z(FE_OCP_RBN25_n35), 
	.A(n35));
   HS65_LS_BFX7 FE_OCP_RBC24_n35 (.Z(FE_OCP_RBN24_n35), 
	.A(n35));
   HS65_LS_CNIVX27 FE_OCP_RBC23_n35 (.Z(FE_OCP_RBN23_n35), 
	.A(n35));
   HS65_LS_NAND3X25 FE_RC_41_0 (.Z(n37), 
	.C(n35), 
	.B(n38), 
	.A(n36));
   HS65_LS_CNIVX7 FE_RC_4_0 (.Z(n45), 
	.A(FE_OCP_RBN24_n35));
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
   HS65_LS_IVX9 U5 (.Z(n40), 
	.A(n45));
   HS65_LS_IVX9 U6 (.Z(n39), 
	.A(n45));
   HS65_LS_NOR2X6 U9 (.Z(N17), 
	.B(n38), 
	.A(FE_OCP_RBN25_n35));
   HS65_LS_OAI22X6 U10 (.Z(data_out[6]), 
	.D(n27), 
	.C(n39), 
	.B(n25), 
	.A(n45));
   HS65_LS_OAI22X6 U11 (.Z(data_out[7]), 
	.D(n26), 
	.C(n39), 
	.B(FE_OCP_RBN27_n35), 
	.A(n24));
   HS65_LS_OAI22X6 U12 (.Z(data_out[0]), 
	.D(n33), 
	.C(FE_OCP_RBN24_n35), 
	.B(n31), 
	.A(FE_OCP_RBN27_n35));
   HS65_LS_OAI22X6 U13 (.Z(data_out[1]), 
	.D(n32), 
	.C(n40), 
	.B(n30), 
	.A(FE_OCP_RBN27_n35));
   HS65_LS_OAI22X6 U14 (.Z(data_out[2]), 
	.D(n31), 
	.C(n39), 
	.B(n29), 
	.A(FE_OCP_RBN27_n35));
   HS65_LS_OAI22X6 U15 (.Z(data_out[3]), 
	.D(n30), 
	.C(n39), 
	.B(n28), 
	.A(FE_OCP_RBN27_n35));
   HS65_LS_OAI22X6 U16 (.Z(data_out[4]), 
	.D(n29), 
	.C(n39), 
	.B(n27), 
	.A(FE_OCP_RBN28_n35));
   HS65_LS_OAI22X6 U17 (.Z(data_out[5]), 
	.D(n28), 
	.C(n40), 
	.B(n26), 
	.A(FE_OCP_RBN27_n35));
   HS65_LS_OAI22X6 U18 (.Z(data_out[8]), 
	.D(n25), 
	.C(n39), 
	.B(n23), 
	.A(FE_OCP_RBN28_n35));
   HS65_LS_OAI22X6 U19 (.Z(data_out[9]), 
	.D(n24), 
	.C(n39), 
	.B(n22), 
	.A(FE_OCP_RBN27_n35));
   HS65_LS_OAI22X6 U20 (.Z(data_out[10]), 
	.D(n23), 
	.C(FE_OCP_RBN24_n35), 
	.B(n21), 
	.A(FE_OCP_RBN28_n35));
   HS65_LS_OAI22X6 U21 (.Z(data_out[11]), 
	.D(n22), 
	.C(FE_OCP_RBN24_n35), 
	.B(n20), 
	.A(FE_OCP_RBN27_n35));
   HS65_LS_OAI22X6 U22 (.Z(data_out[12]), 
	.D(n21), 
	.C(FE_OCP_RBN24_n35), 
	.B(n19), 
	.A(FE_OCP_RBN28_n35));
   HS65_LS_OAI22X6 U23 (.Z(data_out[13]), 
	.D(n20), 
	.C(FE_OCP_RBN24_n35), 
	.B(n18), 
	.A(FE_OCP_RBN28_n35));
   HS65_LS_OAI22X6 U24 (.Z(data_out[14]), 
	.D(n19), 
	.C(FE_OCP_RBN24_n35), 
	.B(n17), 
	.A(FE_OCP_RBN28_n35));
   HS65_LS_OAI22X6 U25 (.Z(data_out[15]), 
	.D(n18), 
	.C(n40), 
	.B(n16), 
	.A(FE_OCP_RBN28_n35));
   HS65_LS_OAI22X6 U26 (.Z(data_out[16]), 
	.D(n17), 
	.C(n40), 
	.B(n15), 
	.A(FE_OCP_RBN28_n35));
   HS65_LS_OAI22X6 U27 (.Z(data_out[17]), 
	.D(n16), 
	.C(n40), 
	.B(n14), 
	.A(FE_OCP_RBN28_n35));
   HS65_LS_OAI22X6 U28 (.Z(data_out[18]), 
	.D(n15), 
	.C(n40), 
	.B(n13), 
	.A(FE_OCP_RBN27_n35));
   HS65_LS_OAI22X6 U29 (.Z(data_out[19]), 
	.D(n14), 
	.C(n40), 
	.B(n12), 
	.A(FE_OCP_RBN28_n35));
   HS65_LS_OAI22X6 U30 (.Z(data_out[20]), 
	.D(n13), 
	.C(n40), 
	.B(n11), 
	.A(FE_OCP_RBN27_n35));
   HS65_LS_OAI22X6 U31 (.Z(data_out[21]), 
	.D(n12), 
	.C(n40), 
	.B(n10), 
	.A(FE_OCP_RBN28_n35));
   HS65_LS_OAI22X6 U32 (.Z(data_out[22]), 
	.D(n11), 
	.C(n40), 
	.B(n9), 
	.A(FE_OCP_RBN27_n35));
   HS65_LS_OAI22X6 U33 (.Z(data_out[23]), 
	.D(n10), 
	.C(n40), 
	.B(n8), 
	.A(FE_OCP_RBN28_n35));
   HS65_LS_OAI22X6 U34 (.Z(data_out[24]), 
	.D(n9), 
	.C(n40), 
	.B(n7), 
	.A(FE_OCP_RBN27_n35));
   HS65_LS_OAI22X6 U35 (.Z(data_out[25]), 
	.D(n8), 
	.C(n39), 
	.B(n6), 
	.A(FE_OCP_RBN28_n35));
   HS65_LS_OAI22X6 U36 (.Z(data_out[26]), 
	.D(n7), 
	.C(n39), 
	.B(n5), 
	.A(FE_OCP_RBN29_n35));
   HS65_LS_OAI22X6 U37 (.Z(data_out[27]), 
	.D(n6), 
	.C(n39), 
	.B(n4), 
	.A(FE_OCP_RBN28_n35));
   HS65_LS_OAI22X6 U38 (.Z(data_out[28]), 
	.D(n5), 
	.C(n39), 
	.B(n3), 
	.A(FE_OCP_RBN27_n35));
   HS65_LS_OAI22X6 U39 (.Z(data_out[29]), 
	.D(n4), 
	.C(n39), 
	.B(n2), 
	.A(FE_OCP_RBN28_n35));
   HS65_LS_CNNAND2X18 U42 (.Z(n38), 
	.B(n33), 
	.A(n32));
   HS65_LS_NOR2X6 U43 (.Z(N18), 
	.B(n37), 
	.A(n33));
   HS65_LS_NOR2X6 U44 (.Z(N21), 
	.B(FE_OCP_RBN23_n35), 
	.A(n36));
   HS65_LS_NOR2X6 U46 (.Z(data_out[30]), 
	.B(n3), 
	.A(FE_OCP_RBN24_n35));
   HS65_LS_NOR2X6 U47 (.Z(data_out[31]), 
	.B(n2), 
	.A(FE_OCP_RBN24_n35));
   HS65_LS_IVX9 U48 (.Z(n33), 
	.A(data_in[0]));
   HS65_LS_NAND2X5 U49 (.Z(n36), 
	.B(data_in[0]), 
	.A(data_in[1]));
   HS65_LS_NOR2AX25 U50 (.Z(n35), 
	.B(data_in[32]), 
	.A(data_in[33]));
   HS65_LS_IVX9 U51 (.Z(n24), 
	.A(data_in[9]));
   HS65_LS_IVX9 U52 (.Z(n31), 
	.A(data_in[2]));
   HS65_LS_IVX9 U53 (.Z(n30), 
	.A(data_in[3]));
   HS65_LS_IVX9 U54 (.Z(n29), 
	.A(data_in[4]));
   HS65_LS_IVX9 U55 (.Z(n28), 
	.A(data_in[5]));
   HS65_LS_IVX9 U56 (.Z(n27), 
	.A(data_in[6]));
   HS65_LS_IVX9 U57 (.Z(n26), 
	.A(data_in[7]));
   HS65_LS_IVX9 U58 (.Z(n25), 
	.A(data_in[8]));
   HS65_LS_IVX9 U59 (.Z(n23), 
	.A(data_in[10]));
   HS65_LS_IVX9 U60 (.Z(n22), 
	.A(data_in[11]));
   HS65_LS_IVX9 U61 (.Z(n21), 
	.A(data_in[12]));
   HS65_LS_IVX9 U62 (.Z(n20), 
	.A(data_in[13]));
   HS65_LS_IVX9 U63 (.Z(n19), 
	.A(data_in[14]));
   HS65_LS_IVX9 U64 (.Z(n18), 
	.A(data_in[15]));
   HS65_LS_IVX9 U65 (.Z(n17), 
	.A(data_in[16]));
   HS65_LS_IVX9 U66 (.Z(n16), 
	.A(data_in[17]));
   HS65_LS_IVX9 U67 (.Z(n15), 
	.A(data_in[18]));
   HS65_LS_IVX9 U68 (.Z(n14), 
	.A(data_in[19]));
   HS65_LS_IVX9 U69 (.Z(n13), 
	.A(data_in[20]));
   HS65_LS_IVX9 U70 (.Z(n12), 
	.A(data_in[21]));
   HS65_LS_IVX9 U71 (.Z(n11), 
	.A(data_in[22]));
   HS65_LS_IVX9 U72 (.Z(n10), 
	.A(data_in[23]));
   HS65_LS_IVX9 U73 (.Z(n9), 
	.A(data_in[24]));
   HS65_LS_IVX9 U74 (.Z(n8), 
	.A(data_in[25]));
   HS65_LS_IVX9 U75 (.Z(n7), 
	.A(data_in[26]));
   HS65_LS_IVX9 U76 (.Z(n6), 
	.A(data_in[27]));
   HS65_LS_IVX9 U78 (.Z(n5), 
	.A(data_in[28]));
   HS65_LS_IVX9 U79 (.Z(n4), 
	.A(data_in[29]));
   HS65_LS_IVX9 U80 (.Z(n3), 
	.A(data_in[30]));
   HS65_LS_IVX9 U81 (.Z(n2), 
	.A(data_in[31]));
   HS65_LS_IVX9 U82 (.Z(n32), 
	.A(data_in[1]));
   HS65_LS_NOR2X6 U83 (.Z(N19), 
	.B(n37), 
	.A(data_in[0]));
   HS65_LS_NOR2AX3 U84 (.Z(N22), 
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
   HS65_LS_OAI12X18 U4 (.Z(reset), 
	.C(n1), 
	.B(a), 
	.A(b));
   HS65_LS_IVX9 U3 (.Z(n1), 
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
   wire N0;
   wire n2;

   assign Rout = Aout ;
   assign lt_en = N0 ;

   c_gate_0_2 gate (.preset(preset), 
	.a(n2), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 I_0 (.Z(N0), 
	.A(Aout));
   HS65_LS_IVX9 U1 (.Z(n2), 
	.A(Ain));
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
   wire FE_OFN31_N3;
   wire lt_en;
   wire N3;

   HS65_LS_BFX7 FE_OFC31_N3 (.Z(FE_OFN31_N3), 
	.A(N3));
   latch_controller_1_2 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LH_LDHQX4 \data_reg[33]  (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(\left_in[DATA][33] ));
   HS65_LS_LDHQX9 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(\left_in[DATA][32] ));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHQX9 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHQX9 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(FE_OFN31_N3), 
	.D(\left_in[DATA][0] ));
   HS65_LS_OR2X18 U3 (.Z(N3), 
	.B(preset), 
	.A(lt_en));
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
   wire data_in_valid;
   wire req_n;
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
   wire N0;
   wire n1;

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
	.left_in({ n1,
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
   HS65_LS_IVX9 I_1 (.Z(req_n), 
	.A(\chan_in_f[REQ] ));
   HS65_LS_IVX9 I_0 (.Z(N0), 
	.A(\chan_in_b[ACK] ));
   HS65_LS_AND2X4 U1 (.Z(data_in_valid), 
	.B(N0), 
	.A(\chan_in_f[REQ] ));
   HS65_LS_IVX9 U2 (.Z(n1), 
	.A(req_n));
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
   wire FE_OCP_RBN21_n34;
   wire FE_OCP_RBN20_n34;
   wire FE_OCP_RBN19_n34;
   wire FE_OCP_RBN18_n34;
   wire FE_OCP_RBN17_n34;
   wire FE_OCP_RBN16_n34;
   wire FE_OCP_RBN15_n34;
   wire FE_OCP_RBN14_n34;
   wire FE_OCP_RBN13_n34;
   wire FE_OCP_RBN12_n34;
   wire FE_OCP_RBN11_n34;
   wire FE_OCP_RBN10_n34;
   wire FE_OCP_RBN9_n34;
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

   assign data_out[33] = data_in[33] ;
   assign data_out[32] = data_in[32] ;

   HS65_LS_NAND3X19 FE_RC_49_0 (.Z(n35), 
	.C(n34), 
	.B(n36), 
	.A(n37));
   HS65_LS_CNIVX14 FE_OCP_RBC21_n34 (.Z(FE_OCP_RBN21_n34), 
	.A(FE_OCP_RBN13_n34));
   HS65_LS_IVX18 FE_OCP_RBC20_n34 (.Z(FE_OCP_RBN20_n34), 
	.A(FE_OCP_RBN14_n34));
   HS65_LS_CNIVX34 FE_OCP_RBC19_n34 (.Z(FE_OCP_RBN19_n34), 
	.A(FE_OCP_RBN14_n34));
   HS65_LS_CNIVX3 FE_OCP_RBC18_n34 (.Z(FE_OCP_RBN18_n34), 
	.A(FE_OCP_RBN12_n34));
   HS65_LS_CNIVX7 FE_OCP_RBC17_n34 (.Z(FE_OCP_RBN17_n34), 
	.A(FE_OCP_RBN12_n34));
   HS65_LS_CNIVX34 FE_OCP_RBC16_n34 (.Z(FE_OCP_RBN16_n34), 
	.A(FE_OCP_RBN11_n34));
   HS65_LS_CNIVX31 FE_OCP_RBC15_n34 (.Z(FE_OCP_RBN15_n34), 
	.A(FE_OCP_RBN12_n34));
   HS65_LS_BFX7 FE_OCP_RBC14_n34 (.Z(FE_OCP_RBN14_n34), 
	.A(FE_OCP_RBN10_n34));
   HS65_LS_BFX7 FE_OCP_RBC13_n34 (.Z(FE_OCP_RBN13_n34), 
	.A(FE_OCP_RBN10_n34));
   HS65_LS_BFX7 FE_OCP_RBC12_n34 (.Z(FE_OCP_RBN12_n34), 
	.A(n34));
   HS65_LS_BFX7 FE_OCP_RBC11_n34 (.Z(FE_OCP_RBN11_n34), 
	.A(n34));
   HS65_LS_CNIVX34 FE_OCP_RBC10_n34 (.Z(FE_OCP_RBN10_n34), 
	.A(n34));
   HS65_LS_CNIVX31 FE_OCP_RBC9_n34 (.Z(FE_OCP_RBN9_n34), 
	.A(n34));
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
   HS65_LS_NOR2X6 U9 (.Z(N12), 
	.B(n36), 
	.A(FE_OCP_RBN10_n34));
   HS65_LS_OAI22X6 U10 (.Z(data_out[6]), 
	.D(n27), 
	.C(FE_OCP_RBN19_n34), 
	.B(n25), 
	.A(FE_OCP_RBN15_n34));
   HS65_LS_OAI22X6 U11 (.Z(data_out[7]), 
	.D(n26), 
	.C(FE_OCP_RBN19_n34), 
	.B(FE_OCP_RBN15_n34), 
	.A(n24));
   HS65_LS_OAI22X6 U12 (.Z(data_out[0]), 
	.D(n33), 
	.C(FE_OCP_RBN19_n34), 
	.B(n31), 
	.A(FE_OCP_RBN15_n34));
   HS65_LS_OAI22X6 U13 (.Z(data_out[1]), 
	.D(n32), 
	.C(FE_OCP_RBN19_n34), 
	.B(n30), 
	.A(FE_OCP_RBN15_n34));
   HS65_LS_OAI22X6 U14 (.Z(data_out[2]), 
	.D(n31), 
	.C(FE_OCP_RBN19_n34), 
	.B(n29), 
	.A(FE_OCP_RBN15_n34));
   HS65_LS_OAI22X6 U15 (.Z(data_out[3]), 
	.D(n30), 
	.C(FE_OCP_RBN19_n34), 
	.B(n28), 
	.A(FE_OCP_RBN15_n34));
   HS65_LS_OAI22X6 U16 (.Z(data_out[4]), 
	.D(n29), 
	.C(FE_OCP_RBN19_n34), 
	.B(n27), 
	.A(FE_OCP_RBN15_n34));
   HS65_LS_OAI22X6 U17 (.Z(data_out[5]), 
	.D(n28), 
	.C(FE_OCP_RBN19_n34), 
	.B(n26), 
	.A(FE_OCP_RBN15_n34));
   HS65_LS_OAI22X6 U18 (.Z(data_out[8]), 
	.D(n25), 
	.C(FE_OCP_RBN19_n34), 
	.B(n23), 
	.A(FE_OCP_RBN15_n34));
   HS65_LS_OAI22X6 U19 (.Z(data_out[9]), 
	.D(n24), 
	.C(FE_OCP_RBN19_n34), 
	.B(n22), 
	.A(FE_OCP_RBN15_n34));
   HS65_LS_OAI22X6 U20 (.Z(data_out[10]), 
	.D(n23), 
	.C(FE_OCP_RBN19_n34), 
	.B(n21), 
	.A(FE_OCP_RBN15_n34));
   HS65_LS_OAI22X6 U21 (.Z(data_out[11]), 
	.D(n22), 
	.C(FE_OCP_RBN19_n34), 
	.B(n20), 
	.A(FE_OCP_RBN15_n34));
   HS65_LS_OAI22X6 U22 (.Z(data_out[12]), 
	.D(n21), 
	.C(FE_OCP_RBN19_n34), 
	.B(n19), 
	.A(FE_OCP_RBN15_n34));
   HS65_LS_OAI22X6 U23 (.Z(data_out[13]), 
	.D(n20), 
	.C(FE_OCP_RBN19_n34), 
	.B(n18), 
	.A(FE_OCP_RBN15_n34));
   HS65_LS_OAI22X6 U24 (.Z(data_out[14]), 
	.D(n19), 
	.C(FE_OCP_RBN20_n34), 
	.B(n17), 
	.A(FE_OCP_RBN17_n34));
   HS65_LS_OAI22X6 U25 (.Z(data_out[15]), 
	.D(n18), 
	.C(FE_OCP_RBN21_n34), 
	.B(n16), 
	.A(FE_OCP_RBN16_n34));
   HS65_LS_OAI22X6 U26 (.Z(data_out[16]), 
	.D(n17), 
	.C(FE_OCP_RBN20_n34), 
	.B(n15), 
	.A(FE_OCP_RBN17_n34));
   HS65_LS_OAI22X6 U27 (.Z(data_out[17]), 
	.D(n16), 
	.C(FE_OCP_RBN21_n34), 
	.B(n14), 
	.A(FE_OCP_RBN16_n34));
   HS65_LS_OAI22X6 U28 (.Z(data_out[18]), 
	.D(n15), 
	.C(FE_OCP_RBN20_n34), 
	.B(n13), 
	.A(FE_OCP_RBN17_n34));
   HS65_LS_OAI22X6 U29 (.Z(data_out[19]), 
	.D(n14), 
	.C(FE_OCP_RBN21_n34), 
	.B(n12), 
	.A(FE_OCP_RBN16_n34));
   HS65_LS_OAI22X6 U30 (.Z(data_out[20]), 
	.D(n13), 
	.C(FE_OCP_RBN20_n34), 
	.B(n11), 
	.A(FE_OCP_RBN17_n34));
   HS65_LS_OAI22X6 U31 (.Z(data_out[21]), 
	.D(n12), 
	.C(FE_OCP_RBN21_n34), 
	.B(n10), 
	.A(FE_OCP_RBN16_n34));
   HS65_LS_OAI22X6 U32 (.Z(data_out[22]), 
	.D(n11), 
	.C(FE_OCP_RBN20_n34), 
	.B(n9), 
	.A(FE_OCP_RBN17_n34));
   HS65_LS_OAI22X6 U33 (.Z(data_out[23]), 
	.D(n10), 
	.C(FE_OCP_RBN21_n34), 
	.B(n8), 
	.A(FE_OCP_RBN16_n34));
   HS65_LS_OAI22X6 U34 (.Z(data_out[24]), 
	.D(n9), 
	.C(FE_OCP_RBN20_n34), 
	.B(n7), 
	.A(FE_OCP_RBN17_n34));
   HS65_LS_OAI22X6 U35 (.Z(data_out[25]), 
	.D(n8), 
	.C(FE_OCP_RBN21_n34), 
	.B(n6), 
	.A(FE_OCP_RBN16_n34));
   HS65_LS_OAI22X6 U36 (.Z(data_out[26]), 
	.D(n7), 
	.C(FE_OCP_RBN20_n34), 
	.B(n5), 
	.A(FE_OCP_RBN18_n34));
   HS65_LS_OAI22X6 U37 (.Z(data_out[27]), 
	.D(n6), 
	.C(FE_OCP_RBN21_n34), 
	.B(n4), 
	.A(FE_OCP_RBN16_n34));
   HS65_LS_OAI22X6 U38 (.Z(data_out[28]), 
	.D(n5), 
	.C(FE_OCP_RBN20_n34), 
	.B(n3), 
	.A(FE_OCP_RBN18_n34));
   HS65_LS_OAI22X6 U39 (.Z(data_out[29]), 
	.D(n4), 
	.C(FE_OCP_RBN21_n34), 
	.B(n2), 
	.A(FE_OCP_RBN16_n34));
   HS65_LS_NAND2X7 U42 (.Z(n36), 
	.B(n33), 
	.A(n32));
   HS65_LS_NOR2X6 U43 (.Z(N15), 
	.B(n35), 
	.A(n33));
   HS65_LS_NOR2X6 U44 (.Z(N13), 
	.B(FE_OCP_RBN9_n34), 
	.A(n37));
   HS65_LS_NOR2X6 U46 (.Z(data_out[30]), 
	.B(n3), 
	.A(FE_OCP_RBN20_n34));
   HS65_LS_NOR2X6 U47 (.Z(data_out[31]), 
	.B(n2), 
	.A(FE_OCP_RBN21_n34));
   HS65_LS_IVX9 U48 (.Z(n33), 
	.A(data_in[0]));
   HS65_LS_NAND2X7 U49 (.Z(n37), 
	.B(n32), 
	.A(data_in[0]));
   HS65_LS_IVX9 U50 (.Z(n32), 
	.A(data_in[1]));
   HS65_LS_NOR2AX25 U51 (.Z(n34), 
	.B(data_in[32]), 
	.A(data_in[33]));
   HS65_LS_IVX9 U52 (.Z(n24), 
	.A(data_in[9]));
   HS65_LS_IVX9 U53 (.Z(n31), 
	.A(data_in[2]));
   HS65_LS_IVX9 U54 (.Z(n30), 
	.A(data_in[3]));
   HS65_LS_IVX9 U55 (.Z(n29), 
	.A(data_in[4]));
   HS65_LS_IVX9 U56 (.Z(n28), 
	.A(data_in[5]));
   HS65_LS_IVX9 U57 (.Z(n27), 
	.A(data_in[6]));
   HS65_LS_IVX9 U58 (.Z(n26), 
	.A(data_in[7]));
   HS65_LS_IVX9 U59 (.Z(n25), 
	.A(data_in[8]));
   HS65_LS_IVX9 U60 (.Z(n23), 
	.A(data_in[10]));
   HS65_LS_IVX9 U61 (.Z(n22), 
	.A(data_in[11]));
   HS65_LS_IVX9 U62 (.Z(n21), 
	.A(data_in[12]));
   HS65_LS_IVX9 U63 (.Z(n20), 
	.A(data_in[13]));
   HS65_LS_IVX9 U64 (.Z(n19), 
	.A(data_in[14]));
   HS65_LS_IVX9 U65 (.Z(n18), 
	.A(data_in[15]));
   HS65_LS_IVX9 U66 (.Z(n17), 
	.A(data_in[16]));
   HS65_LS_IVX9 U67 (.Z(n16), 
	.A(data_in[17]));
   HS65_LS_IVX9 U68 (.Z(n15), 
	.A(data_in[18]));
   HS65_LS_IVX9 U69 (.Z(n14), 
	.A(data_in[19]));
   HS65_LS_IVX9 U70 (.Z(n13), 
	.A(data_in[20]));
   HS65_LS_IVX9 U71 (.Z(n12), 
	.A(data_in[21]));
   HS65_LS_IVX9 U72 (.Z(n11), 
	.A(data_in[22]));
   HS65_LS_IVX9 U73 (.Z(n10), 
	.A(data_in[23]));
   HS65_LS_IVX9 U74 (.Z(n9), 
	.A(data_in[24]));
   HS65_LS_IVX9 U75 (.Z(n8), 
	.A(data_in[25]));
   HS65_LS_IVX9 U76 (.Z(n7), 
	.A(data_in[26]));
   HS65_LS_IVX9 U77 (.Z(n6), 
	.A(data_in[27]));
   HS65_LS_IVX9 U78 (.Z(n5), 
	.A(data_in[28]));
   HS65_LS_IVX9 U79 (.Z(n4), 
	.A(data_in[29]));
   HS65_LS_IVX9 U80 (.Z(n3), 
	.A(data_in[30]));
   HS65_LS_IVX9 U81 (.Z(n2), 
	.A(data_in[31]));
   HS65_LS_NOR2X6 U82 (.Z(N14), 
	.B(data_in[0]), 
	.A(n35));
   HS65_LS_NOR2AX6 U83 (.Z(N16), 
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
   HS65_LS_OAI12X18 U4 (.Z(reset), 
	.C(n1), 
	.B(a), 
	.A(b));
   HS65_LS_IVX9 U3 (.Z(n1), 
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
   wire N0;
   wire n2;

   assign Rout = Aout ;
   assign lt_en = N0 ;

   c_gate_0_1 gate (.preset(preset), 
	.a(n2), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 I_0 (.Z(N0), 
	.A(Aout));
   HS65_LS_IVX9 U1 (.Z(n2), 
	.A(Ain));
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
   wire FE_OFN30_N3;
   wire lt_en;
   wire N3;

   HS65_LS_BFX9 FE_OFC30_N3 (.Z(FE_OFN30_N3), 
	.A(N3));
   latch_controller_1_1 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LH_LDHQX4 \data_reg[33]  (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(\left_in[DATA][33] ));
   HS65_LS_LDHQX9 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(\left_in[DATA][32] ));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHQX9 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHQX9 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(FE_OFN30_N3), 
	.D(\left_in[DATA][0] ));
   HS65_LS_OR2X18 U3 (.Z(N3), 
	.B(preset), 
	.A(lt_en));
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
   wire data_in_valid;
   wire req_n;
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
   wire N0;
   wire n1;

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
	.left_in({ n1,
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
   HS65_LS_IVX9 I_1 (.Z(req_n), 
	.A(\chan_in_f[REQ] ));
   HS65_LS_IVX9 I_0 (.Z(N0), 
	.A(\chan_in_b[ACK] ));
   HS65_LS_AND2X4 U1 (.Z(data_in_valid), 
	.B(N0), 
	.A(\chan_in_f[REQ] ));
   HS65_LS_IVX9 U2 (.Z(n1), 
	.A(req_n));
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

module c_gate_generic_0_5_0 (
	preset, 
	\input , 
	\output );
   input preset;
   input [4:0] \input ;
   output \output ;

   // Internal wires
   wire set;
   wire reset;
   wire n2;
   wire n3;
   wire n1;

   sr_latch_0_7 latch (.s(set), 
	.r(reset), 
	.q(\output ));
   HS65_LS_OAI13X15 U5 (.Z(reset), 
	.D(n1), 
	.C(\input [0]), 
	.B(\input [1]), 
	.A(n3));
   HS65_LS_IVX9 U3 (.Z(n1), 
	.A(preset));
   HS65_LS_OR3X9 U4 (.Z(n3), 
	.C(\input [2]), 
	.B(\input [4]), 
	.A(\input [3]));
   HS65_LS_NOR4ABX2 U6 (.Z(set), 
	.D(preset), 
	.C(n2), 
	.B(\input [1]), 
	.A(\input [0]));
   HS65_LS_NAND3X5 U7 (.Z(n2), 
	.C(\input [4]), 
	.B(\input [2]), 
	.A(\input [3]));
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

module c_gate_generic_0_5_1 (
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
   wire n4;
   wire n5;

   sr_latch_0_6 latch (.s(set), 
	.r(reset), 
	.q(\output ));
   HS65_LS_OAI31X5 U3 (.Z(reset), 
	.D(n1), 
	.C(\input [0]), 
	.B(\input [1]), 
	.A(n4));
   HS65_LS_IVX9 U4 (.Z(n1), 
	.A(preset));
   HS65_LS_OR3X9 U5 (.Z(n4), 
	.C(\input [2]), 
	.B(\input [4]), 
	.A(\input [3]));
   HS65_LS_NOR4ABX2 U6 (.Z(set), 
	.D(preset), 
	.C(n5), 
	.B(\input [1]), 
	.A(\input [0]));
   HS65_LS_NAND3X5 U7 (.Z(n5), 
	.C(\input [4]), 
	.B(\input [2]), 
	.A(\input [3]));
endmodule

module crossbar_1_0_0 (
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
		\chs_out_b[0][ACK]  } ));
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

   // Internal wires
   wire FE_OFN67_switch_sel_4_;
   wire FE_OFN66_switch_sel_3_;
   wire FE_OFN65_switch_sel_2_;
   wire FE_OFN64_switch_sel_1_;
   wire FE_OFN63_switch_sel_0_;
   wire FE_OFN62_switch_sel_14_;
   wire FE_OFN61_switch_sel_13_;
   wire FE_OFN60_switch_sel_12_;
   wire FE_OFN59_switch_sel_11_;
   wire FE_OFN58_switch_sel_10_;
   wire FE_OFN57_switch_sel_9_;
   wire FE_OFN56_switch_sel_8_;
   wire FE_OFN55_switch_sel_7_;
   wire FE_OFN54_switch_sel_6_;
   wire FE_OFN53_switch_sel_5_;
   wire FE_OFN49_n6;
   wire FE_OFN48_n7;
   wire FE_OFN47_n8;
   wire FE_OFN46_n9;
   wire FE_OFN45_n10;
   wire FE_OFN44_n1;
   wire FE_OFN43_n2;
   wire FE_OFN42_n3;
   wire FE_OFN41_n4;
   wire FE_OFN40_n5;
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
   wire n249;
   wire n250;
   wire n251;
   wire n252;
   wire n253;
   wire n254;
   wire n255;
   wire n256;
   wire n257;
   wire n258;
   wire n259;
   wire n260;
   wire n261;
   wire n262;
   wire n263;
   wire n264;
   wire n265;
   wire n266;
   wire n267;
   wire n268;
   wire n269;
   wire n270;
   wire n271;
   wire n272;
   wire n273;
   wire n274;
   wire n275;
   wire n276;
   wire n277;
   wire n278;
   wire n279;
   wire n280;
   wire n281;
   wire n282;
   wire n283;
   wire n284;
   wire n285;
   wire n286;
   wire n287;
   wire n288;
   wire n289;
   wire n290;
   wire n291;
   wire n292;
   wire n293;
   wire n294;
   wire n295;
   wire n296;
   wire n297;
   wire n298;
   wire n299;
   wire n300;
   wire n301;
   wire n302;
   wire n303;
   wire n304;
   wire n305;
   wire n306;
   wire n307;
   wire n308;
   wire n309;
   wire n310;
   wire n311;
   wire n312;
   wire n313;
   wire n314;
   wire n315;
   wire n316;
   wire n317;
   wire n318;
   wire n319;
   wire n320;
   wire n321;
   wire n322;
   wire n323;
   wire n324;
   wire n325;

   assign \chs_in_b[0][ACK]  = \chs_in_b[4][ACK]  ;
   assign \chs_in_b[1][ACK]  = \chs_in_b[4][ACK]  ;
   assign \chs_in_b[2][ACK]  = \chs_in_b[4][ACK]  ;
   assign \chs_in_b[3][ACK]  = \chs_in_b[4][ACK]  ;
   assign \chs_out_f[0][REQ]  = \chs_out_f[4][REQ]  ;
   assign \chs_out_f[1][REQ]  = \chs_out_f[4][REQ]  ;
   assign \chs_out_f[2][REQ]  = \chs_out_f[4][REQ]  ;
   assign \chs_out_f[3][REQ]  = \chs_out_f[4][REQ]  ;

   HS65_LS_BFX7 FE_OFC67_switch_sel_4_ (.Z(FE_OFN67_switch_sel_4_), 
	.A(\switch_sel[0][4] ));
   HS65_LS_BFX7 FE_OFC66_switch_sel_3_ (.Z(FE_OFN66_switch_sel_3_), 
	.A(\switch_sel[0][3] ));
   HS65_LS_BFX7 FE_OFC65_switch_sel_2_ (.Z(FE_OFN65_switch_sel_2_), 
	.A(\switch_sel[0][2] ));
   HS65_LS_BFX7 FE_OFC64_switch_sel_1_ (.Z(FE_OFN64_switch_sel_1_), 
	.A(\switch_sel[0][1] ));
   HS65_LS_BFX7 FE_OFC63_switch_sel_0_ (.Z(FE_OFN63_switch_sel_0_), 
	.A(\switch_sel[0][0] ));
   HS65_LS_BFX7 FE_OFC62_switch_sel_14_ (.Z(FE_OFN62_switch_sel_14_), 
	.A(\switch_sel[2][4] ));
   HS65_LS_BFX7 FE_OFC61_switch_sel_13_ (.Z(FE_OFN61_switch_sel_13_), 
	.A(\switch_sel[2][3] ));
   HS65_LS_BFX7 FE_OFC60_switch_sel_12_ (.Z(FE_OFN60_switch_sel_12_), 
	.A(\switch_sel[2][2] ));
   HS65_LS_BFX7 FE_OFC59_switch_sel_11_ (.Z(FE_OFN59_switch_sel_11_), 
	.A(\switch_sel[2][1] ));
   HS65_LS_BFX7 FE_OFC58_switch_sel_10_ (.Z(FE_OFN58_switch_sel_10_), 
	.A(\switch_sel[2][0] ));
   HS65_LS_BFX7 FE_OFC57_switch_sel_9_ (.Z(FE_OFN57_switch_sel_9_), 
	.A(\switch_sel[1][4] ));
   HS65_LS_BFX7 FE_OFC56_switch_sel_8_ (.Z(FE_OFN56_switch_sel_8_), 
	.A(\switch_sel[1][3] ));
   HS65_LS_BFX7 FE_OFC55_switch_sel_7_ (.Z(FE_OFN55_switch_sel_7_), 
	.A(\switch_sel[1][2] ));
   HS65_LS_BFX7 FE_OFC54_switch_sel_6_ (.Z(FE_OFN54_switch_sel_6_), 
	.A(\switch_sel[1][1] ));
   HS65_LS_BFX7 FE_OFC53_switch_sel_5_ (.Z(FE_OFN53_switch_sel_5_), 
	.A(\switch_sel[1][0] ));
   HS65_LS_BFX7 FE_OFC49_n6 (.Z(FE_OFN49_n6), 
	.A(n6));
   HS65_LS_BFX7 FE_OFC48_n7 (.Z(FE_OFN48_n7), 
	.A(n7));
   HS65_LS_BFX7 FE_OFC47_n8 (.Z(FE_OFN47_n8), 
	.A(n8));
   HS65_LS_BFX7 FE_OFC46_n9 (.Z(FE_OFN46_n9), 
	.A(n9));
   HS65_LS_BFX9 FE_OFC45_n10 (.Z(FE_OFN45_n10), 
	.A(n10));
   HS65_LS_BFX9 FE_OFC44_n1 (.Z(FE_OFN44_n1), 
	.A(n1));
   HS65_LS_BFX7 FE_OFC43_n2 (.Z(FE_OFN43_n2), 
	.A(n2));
   HS65_LS_BFX7 FE_OFC42_n3 (.Z(FE_OFN42_n3), 
	.A(n3));
   HS65_LS_BFX7 FE_OFC41_n4 (.Z(FE_OFN41_n4), 
	.A(n4));
   HS65_LS_BFX7 FE_OFC40_n5 (.Z(FE_OFN40_n5), 
	.A(n5));
   c_gate_generic_0_5_0 c_sync_req (.preset(preset), 
	.\input ({ \chs_in_f[4][REQ] ,
		\chs_in_f[3][REQ] ,
		\chs_in_f[2][REQ] ,
		\chs_in_f[1][REQ] ,
		\chs_in_f[0][REQ]  }), 
	.\output (\chs_out_f[4][REQ] ));
   c_gate_generic_0_5_1 c_sync_ack (.preset(preset), 
	.\input ({ \chs_out_b[4][ACK] ,
		\chs_out_b[3][ACK] ,
		\chs_out_b[2][ACK] ,
		\chs_out_b[1][ACK] ,
		\chs_out_b[0][ACK]  }), 
	.\output (\chs_in_b[4][ACK] ));
   HS65_LH_NAND2X2 U6 (.Z(n249), 
	.B(\chs_in_f[2][DATA][7] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_NAND2X2 U7 (.Z(n250), 
	.B(\chs_in_f[0][DATA][7] ), 
	.A(\switch_sel[0][1] ));
   HS65_LS_NAND2X5 U8 (.Z(n251), 
	.B(\chs_in_f[1][DATA][7] ), 
	.A(\switch_sel[1][1] ));
   HS65_LS_AND3X18 U9 (.Z(n183), 
	.C(n251), 
	.B(n250), 
	.A(n249));
   HS65_LS_OAI212X5 U10 (.Z(\chs_out_f[1][DATA][7] ), 
	.E(n183), 
	.D(n4), 
	.C(n37), 
	.B(n9), 
	.A(n71));
   HS65_LS_OR2X9 U11 (.Z(n252), 
	.B(n66), 
	.A(FE_OFN49_n6));
   HS65_LS_OR2X9 U12 (.Z(n253), 
	.B(n32), 
	.A(n1));
   HS65_LS_NAND3X5 U13 (.Z(\chs_out_f[4][DATA][12] ), 
	.C(n109), 
	.B(n253), 
	.A(n252));
   HS65_LH_NAND2X2 U14 (.Z(n254), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][12] ));
   HS65_LS_NAND2X7 U15 (.Z(n255), 
	.B(FE_OFN67_switch_sel_4_), 
	.A(\chs_in_f[0][DATA][12] ));
   HS65_LH_NAND2X2 U16 (.Z(n256), 
	.B(\switch_sel[1][4] ), 
	.A(\chs_in_f[1][DATA][12] ));
   HS65_LS_AND3X9 U17 (.Z(n109), 
	.C(n256), 
	.B(n255), 
	.A(n254));
   HS65_LS_AND3X9 U20 (.Z(n104), 
	.C(n276), 
	.B(n275), 
	.A(n274));
   HS65_LS_NAND3X5 U21 (.Z(\chs_out_f[4][DATA][17] ), 
	.C(n104), 
	.B(n273), 
	.A(n272));
   HS65_LS_AOI222X4 U22 (.Z(n112), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][0] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][0] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][0] ));
   HS65_LH_NAND2X2 U23 (.Z(n268), 
	.B(\chs_in_f[0][DATA][7] ), 
	.A(\switch_sel[0][2] ));
   HS65_LS_NAND2X2 U24 (.Z(n269), 
	.B(\chs_in_f[1][DATA][7] ), 
	.A(\switch_sel[1][2] ));
   HS65_LS_NAND2X7 U25 (.Z(n258), 
	.B(\chs_in_f[0][DATA][29] ), 
	.A(FE_OFN65_switch_sel_2_));
   HS65_LH_NAND2X2 U26 (.Z(n259), 
	.B(\chs_in_f[1][DATA][29] ), 
	.A(FE_OFN55_switch_sel_7_));
   HS65_LS_NAND3X5 U27 (.Z(\chs_out_f[2][DATA][29] ), 
	.C(n159), 
	.B(n261), 
	.A(n260));
   HS65_LS_NAND2X2 U28 (.Z(n257), 
	.B(\chs_in_f[2][DATA][29] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_AND3X9 U29 (.Z(n159), 
	.C(n259), 
	.B(n258), 
	.A(n257));
   HS65_LS_OR2X9 U30 (.Z(n260), 
	.B(n8), 
	.A(n49));
   HS65_LS_OR2X9 U31 (.Z(n261), 
	.B(FE_OFN42_n3), 
	.A(n15));
   HS65_LH_NAND2X2 U35 (.Z(n275), 
	.B(FE_OFN67_switch_sel_4_), 
	.A(\chs_in_f[0][DATA][17] ));
   HS65_LH_NAND2X2 U36 (.Z(n264), 
	.B(\chs_in_f[1][DATA][0] ), 
	.A(FE_OFN56_switch_sel_8_));
   HS65_LS_NAND3X5 U37 (.Z(\chs_out_f[3][DATA][0] ), 
	.C(n146), 
	.B(n266), 
	.A(n265));
   HS65_LS_NAND2X2 U38 (.Z(n262), 
	.B(\chs_in_f[2][DATA][0] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_NAND2X7 U39 (.Z(n263), 
	.B(\chs_in_f[0][DATA][0] ), 
	.A(\switch_sel[0][3] ));
   HS65_LS_AND3X9 U40 (.Z(n146), 
	.C(n264), 
	.B(n263), 
	.A(n262));
   HS65_LS_OR2X9 U41 (.Z(n265), 
	.B(FE_OFN48_n7), 
	.A(n78));
   HS65_LS_OR2X9 U42 (.Z(n266), 
	.B(n2), 
	.A(n44));
   HS65_LH_NAND2X2 U43 (.Z(n267), 
	.B(\chs_in_f[2][DATA][7] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AND3X9 U44 (.Z(n149), 
	.C(n269), 
	.B(n268), 
	.A(n267));
   HS65_LS_OR2X9 U45 (.Z(n270), 
	.B(FE_OFN47_n8), 
	.A(n71));
   HS65_LS_OR2X9 U46 (.Z(n271), 
	.B(FE_OFN42_n3), 
	.A(n37));
   HS65_LS_NAND3X5 U47 (.Z(\chs_out_f[2][DATA][7] ), 
	.C(n149), 
	.B(n271), 
	.A(n270));
   HS65_LS_NAND2X4 U50 (.Z(n315), 
	.B(FE_OFN57_switch_sel_9_), 
	.A(\chs_in_f[1][DATA][22] ));
   HS65_LS_NAND2X2 U51 (.Z(n314), 
	.B(FE_OFN67_switch_sel_4_), 
	.A(\chs_in_f[0][DATA][22] ));
   HS65_LS_AND3X9 U52 (.Z(n107), 
	.C(n279), 
	.B(n278), 
	.A(n277));
   HS65_LS_NAND2X4 U53 (.Z(n279), 
	.B(FE_OFN57_switch_sel_9_), 
	.A(\chs_in_f[1][DATA][14] ));
   HS65_LH_NAND2X2 U54 (.Z(n281), 
	.B(\chs_in_f[0][DATA][7] ), 
	.A(\switch_sel[0][3] ));
   HS65_LS_OR2X9 U55 (.Z(n272), 
	.B(n61), 
	.A(FE_OFN49_n6));
   HS65_LS_OR2X9 U56 (.Z(n273), 
	.B(n27), 
	.A(n1));
   HS65_LH_NAND2X2 U57 (.Z(n274), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][17] ));
   HS65_LH_NAND2X2 U58 (.Z(n276), 
	.B(FE_OFN57_switch_sel_9_), 
	.A(\chs_in_f[1][DATA][17] ));
   HS65_LH_AND2X4 U63 (.Z(n296), 
	.B(\switch_sel[0][4] ), 
	.A(\chs_in_f[0][DATA][1] ));
   HS65_LH_NAND2X2 U64 (.Z(n282), 
	.B(\chs_in_f[1][DATA][7] ), 
	.A(\switch_sel[1][3] ));
   HS65_LH_AND2X4 U65 (.Z(n285), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][31] ));
   HS65_LS_AND2X4 U66 (.Z(n286), 
	.B(FE_OFN67_switch_sel_4_), 
	.A(\chs_in_f[0][DATA][31] ));
   HS65_LS_NAND2X2 U67 (.Z(n277), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][14] ));
   HS65_LS_NAND2X7 U68 (.Z(n278), 
	.B(FE_OFN67_switch_sel_4_), 
	.A(\chs_in_f[0][DATA][14] ));
   HS65_LH_NAND2X2 U69 (.Z(n280), 
	.B(\chs_in_f[2][DATA][7] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AND3X9 U70 (.Z(n115), 
	.C(n282), 
	.B(n281), 
	.A(n280));
   HS65_LS_OR2X9 U71 (.Z(n283), 
	.B(n7), 
	.A(n71));
   HS65_LS_OR2X9 U72 (.Z(n284), 
	.B(FE_OFN43_n2), 
	.A(n37));
   HS65_LS_NAND3X5 U73 (.Z(\chs_out_f[3][DATA][7] ), 
	.C(n115), 
	.B(n284), 
	.A(n283));
   HS65_LS_AND2X4 U74 (.Z(n287), 
	.B(FE_OFN57_switch_sel_9_), 
	.A(\chs_in_f[1][DATA][31] ));
   HS65_LS_NOR3X4 U75 (.Z(n88), 
	.C(n287), 
	.B(n286), 
	.A(n285));
   HS65_LS_OAI212X5 U76 (.Z(\chs_out_f[4][DATA][31] ), 
	.E(n88), 
	.D(n13), 
	.C(FE_OFN44_n1), 
	.B(n47), 
	.A(FE_OFN49_n6));
   HS65_LH_NAND2X2 U77 (.Z(n304), 
	.B(\chs_in_f[0][DATA][29] ), 
	.A(FE_OFN64_switch_sel_1_));
   HS65_LS_NAND3X5 U78 (.Z(\chs_out_f[1][DATA][29] ), 
	.C(n193), 
	.B(n307), 
	.A(n306));
   HS65_LS_NAND3X5 U79 (.Z(\chs_out_f[2][DATA][20] ), 
	.C(n168), 
	.B(n312), 
	.A(n311));
   HS65_LS_NAND3X5 U80 (.Z(\chs_out_f[4][DATA][1] ), 
	.C(n101), 
	.B(n294), 
	.A(n293));
   HS65_LS_NAND3X5 U81 (.Z(\chs_out_f[4][DATA][2] ), 
	.C(n90), 
	.B(n289), 
	.A(n288));
   HS65_LS_AND2X4 U82 (.Z(n290), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][2] ));
   HS65_LS_OR2X9 U83 (.Z(n288), 
	.B(n76), 
	.A(FE_OFN49_n6));
   HS65_LS_OR2X9 U84 (.Z(n289), 
	.B(n42), 
	.A(n1));
   HS65_LS_AND2X4 U85 (.Z(n291), 
	.B(\switch_sel[0][4] ), 
	.A(\chs_in_f[0][DATA][2] ));
   HS65_LS_AND2X4 U86 (.Z(n292), 
	.B(\switch_sel[1][4] ), 
	.A(\chs_in_f[1][DATA][2] ));
   HS65_LS_NOR3X4 U87 (.Z(n90), 
	.C(n292), 
	.B(n291), 
	.A(n290));
   HS65_LS_OR2X9 U88 (.Z(n293), 
	.B(n77), 
	.A(FE_OFN49_n6));
   HS65_LS_OR2X9 U89 (.Z(n294), 
	.B(n43), 
	.A(n1));
   HS65_LS_AND2X4 U90 (.Z(n295), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][1] ));
   HS65_LS_AND2X4 U91 (.Z(n297), 
	.B(\switch_sel[1][4] ), 
	.A(\chs_in_f[1][DATA][1] ));
   HS65_LS_NOR3X4 U92 (.Z(n101), 
	.C(n297), 
	.B(n296), 
	.A(n295));
   HS65_LH_NAND2X2 U95 (.Z(n313), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][22] ));
   HS65_LH_NAND2X2 U96 (.Z(n309), 
	.B(\chs_in_f[0][DATA][20] ), 
	.A(\switch_sel[0][2] ));
   HS65_LS_OR2X9 U97 (.Z(n298), 
	.B(n71), 
	.A(FE_OFN49_n6));
   HS65_LS_OR2X9 U98 (.Z(n299), 
	.B(n37), 
	.A(n1));
   HS65_LS_NAND3X6 U99 (.Z(\chs_out_f[4][DATA][7] ), 
	.C(n81), 
	.B(n299), 
	.A(n298));
   HS65_LH_NAND2X2 U100 (.Z(n300), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][7] ));
   HS65_LH_NAND2X2 U101 (.Z(n301), 
	.B(\switch_sel[0][4] ), 
	.A(\chs_in_f[0][DATA][7] ));
   HS65_LS_NAND2X2 U102 (.Z(n302), 
	.B(\switch_sel[1][4] ), 
	.A(\chs_in_f[1][DATA][7] ));
   HS65_LS_AND3X9 U103 (.Z(n81), 
	.C(n302), 
	.B(n301), 
	.A(n300));
   HS65_LH_NAND2X2 U104 (.Z(n303), 
	.B(\chs_in_f[2][DATA][29] ), 
	.A(FE_OFN59_switch_sel_11_));
   HS65_LH_NAND2X2 U105 (.Z(n305), 
	.B(\chs_in_f[1][DATA][29] ), 
	.A(FE_OFN54_switch_sel_6_));
   HS65_LS_AND3X9 U106 (.Z(n193), 
	.C(n305), 
	.B(n304), 
	.A(n303));
   HS65_LS_OR2X9 U107 (.Z(n306), 
	.B(FE_OFN46_n9), 
	.A(n49));
   HS65_LS_OR2X9 U108 (.Z(n307), 
	.B(FE_OFN41_n4), 
	.A(n15));
   HS65_LS_AND3X9 U111 (.Z(n91), 
	.C(n320), 
	.B(n319), 
	.A(n318));
   HS65_LS_OR2X9 U112 (.Z(n316), 
	.B(n49), 
	.A(FE_OFN49_n6));
   HS65_LS_OR2X9 U113 (.Z(n317), 
	.B(n15), 
	.A(FE_OFN44_n1));
   HS65_LS_NAND3X5 U114 (.Z(\chs_out_f[4][DATA][29] ), 
	.C(n91), 
	.B(n317), 
	.A(n316));
   HS65_LH_NAND2X2 U115 (.Z(n319), 
	.B(FE_OFN67_switch_sel_4_), 
	.A(\chs_in_f[0][DATA][29] ));
   HS65_LS_AOI222X2 U116 (.Z(n105), 
	.F(FE_OFN57_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][16] ), 
	.D(FE_OFN67_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][16] ), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][16] ));
   HS65_LS_AOI222X2 U117 (.Z(n111), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][10] ), 
	.D(FE_OFN67_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][10] ), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][10] ));
   HS65_LS_AOI222X2 U118 (.Z(n103), 
	.F(FE_OFN57_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][18] ), 
	.D(FE_OFN67_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][18] ), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][18] ));
   HS65_LS_AOI222X2 U119 (.Z(n106), 
	.F(FE_OFN57_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][15] ), 
	.D(FE_OFN67_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][15] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][15] ));
   HS65_LS_AOI222X2 U120 (.Z(n102), 
	.F(FE_OFN57_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][19] ), 
	.D(FE_OFN67_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][19] ), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][19] ));
   HS65_LS_AOI222X2 U121 (.Z(n110), 
	.F(FE_OFN57_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][11] ), 
	.D(FE_OFN67_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][11] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][11] ));
   HS65_LS_AOI222X2 U122 (.Z(n108), 
	.F(FE_OFN57_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][13] ), 
	.D(FE_OFN67_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][13] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][13] ));
   HS65_LS_AOI222X2 U123 (.Z(n94), 
	.F(FE_OFN57_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][26] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][26] ), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][26] ));
   HS65_LS_AOI222X2 U124 (.Z(n92), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][28] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][28] ), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][28] ));
   HS65_LS_AOI222X2 U125 (.Z(n96), 
	.F(FE_OFN57_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][24] ), 
	.D(FE_OFN67_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][24] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][24] ));
   HS65_LS_AOI222X2 U126 (.Z(n100), 
	.F(FE_OFN57_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][20] ), 
	.D(FE_OFN67_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][20] ), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][20] ));
   HS65_LS_AOI222X2 U127 (.Z(n99), 
	.F(FE_OFN57_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][21] ), 
	.D(FE_OFN67_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][21] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][21] ));
   HS65_LS_AOI222X2 U128 (.Z(n95), 
	.F(FE_OFN57_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][25] ), 
	.D(FE_OFN67_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][25] ), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][25] ));
   HS65_LS_AOI222X2 U129 (.Z(n97), 
	.F(FE_OFN57_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][23] ), 
	.D(FE_OFN67_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][23] ), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][23] ));
   HS65_LS_AOI222X2 U130 (.Z(n93), 
	.F(FE_OFN57_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][27] ), 
	.D(FE_OFN67_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][27] ), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][27] ));
   HS65_LS_AOI222X2 U131 (.Z(n84), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][4] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][4] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][4] ));
   HS65_LS_AOI222X2 U132 (.Z(n82), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][6] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][6] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][6] ));
   HS65_LS_AOI222X2 U133 (.Z(n83), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][5] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][5] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][5] ));
   HS65_LH_NAND2X2 U134 (.Z(n308), 
	.B(\chs_in_f[2][DATA][20] ), 
	.A(\switch_sel[2][2] ));
   HS65_LH_NAND2X2 U135 (.Z(n310), 
	.B(\chs_in_f[1][DATA][20] ), 
	.A(\switch_sel[1][2] ));
   HS65_LS_AND3X9 U136 (.Z(n168), 
	.C(n310), 
	.B(n309), 
	.A(n308));
   HS65_LS_OR2X9 U137 (.Z(n311), 
	.B(FE_OFN47_n8), 
	.A(n58));
   HS65_LS_OR2X9 U138 (.Z(n312), 
	.B(FE_OFN42_n3), 
	.A(n24));
   HS65_LS_AND3X18 U139 (.Z(n98), 
	.C(n315), 
	.B(n314), 
	.A(n313));
   HS65_LS_OAI212X3 U140 (.Z(\chs_out_f[3][DATA][2] ), 
	.E(n124), 
	.D(n2), 
	.C(n42), 
	.B(FE_OFN48_n7), 
	.A(n76));
   HS65_LS_OAI212X3 U141 (.Z(\chs_out_f[3][DATA][22] ), 
	.E(n132), 
	.D(FE_OFN43_n2), 
	.C(n22), 
	.B(n7), 
	.A(n56));
   HS65_LS_OAI212X3 U142 (.Z(\chs_out_f[3][DATA][20] ), 
	.E(n134), 
	.D(FE_OFN43_n2), 
	.C(n24), 
	.B(n7), 
	.A(n58));
   HS65_LH_NAND2X2 U143 (.Z(n324), 
	.B(\chs_in_f[0][DATA][29] ), 
	.A(FE_OFN66_switch_sel_3_));
   HS65_LH_NAND2X2 U144 (.Z(n318), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][29] ));
   HS65_LH_NAND2X2 U145 (.Z(n320), 
	.B(FE_OFN57_switch_sel_9_), 
	.A(\chs_in_f[1][DATA][29] ));
   HS65_LS_AOI222X2 U147 (.Z(n217), 
	.F(\chs_in_f[1][DATA][7] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][7] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][7] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X3 U148 (.Z(\chs_out_f[3][DATA][24] ), 
	.E(n130), 
	.D(FE_OFN43_n2), 
	.C(n20), 
	.B(n7), 
	.A(n54));
   HS65_LS_OAI212X3 U149 (.Z(\chs_out_f[3][DATA][26] ), 
	.E(n128), 
	.D(FE_OFN43_n2), 
	.C(n18), 
	.B(n7), 
	.A(n52));
   HS65_LS_OAI212X3 U150 (.Z(\chs_out_f[3][DATA][28] ), 
	.E(n126), 
	.D(FE_OFN43_n2), 
	.C(n16), 
	.B(n7), 
	.A(n50));
   HS65_LS_OAI212X3 U151 (.Z(\chs_out_f[2][DATA][2] ), 
	.E(n158), 
	.D(n3), 
	.C(n42), 
	.B(FE_OFN47_n8), 
	.A(n76));
   HS65_LS_OAI212X3 U152 (.Z(\chs_out_f[2][DATA][22] ), 
	.E(n166), 
	.D(FE_OFN42_n3), 
	.C(n22), 
	.B(FE_OFN47_n8), 
	.A(n56));
   HS65_LS_OAI212X3 U153 (.Z(\chs_out_f[2][DATA][24] ), 
	.E(n164), 
	.D(n3), 
	.C(n20), 
	.B(n8), 
	.A(n54));
   HS65_LS_OAI212X3 U154 (.Z(\chs_out_f[2][DATA][26] ), 
	.E(n162), 
	.D(FE_OFN42_n3), 
	.C(n18), 
	.B(FE_OFN47_n8), 
	.A(n52));
   HS65_LS_OAI212X3 U155 (.Z(\chs_out_f[2][DATA][28] ), 
	.E(n160), 
	.D(FE_OFN42_n3), 
	.C(n16), 
	.B(FE_OFN47_n8), 
	.A(n50));
   HS65_LS_OAI212X3 U156 (.Z(\chs_out_f[1][DATA][2] ), 
	.E(n192), 
	.D(n4), 
	.C(n42), 
	.B(n9), 
	.A(n76));
   HS65_LS_OAI212X3 U157 (.Z(\chs_out_f[1][DATA][20] ), 
	.E(n202), 
	.D(FE_OFN41_n4), 
	.C(n24), 
	.B(n9), 
	.A(n58));
   HS65_LS_OAI212X3 U158 (.Z(\chs_out_f[1][DATA][22] ), 
	.E(n200), 
	.D(FE_OFN41_n4), 
	.C(n22), 
	.B(n9), 
	.A(n56));
   HS65_LS_OAI212X3 U159 (.Z(\chs_out_f[1][DATA][24] ), 
	.E(n198), 
	.D(FE_OFN41_n4), 
	.C(n20), 
	.B(FE_OFN46_n9), 
	.A(n54));
   HS65_LS_OAI212X3 U160 (.Z(\chs_out_f[1][DATA][26] ), 
	.E(n196), 
	.D(n4), 
	.C(n18), 
	.B(n9), 
	.A(n52));
   HS65_LS_OAI212X3 U161 (.Z(\chs_out_f[1][DATA][28] ), 
	.E(n194), 
	.D(n4), 
	.C(n16), 
	.B(n9), 
	.A(n50));
   HS65_LS_OAI212X3 U162 (.Z(\chs_out_f[3][DATA][10] ), 
	.E(n145), 
	.D(n2), 
	.C(n34), 
	.B(FE_OFN48_n7), 
	.A(n68));
   HS65_LS_OAI212X3 U163 (.Z(\chs_out_f[3][DATA][12] ), 
	.E(n143), 
	.D(n2), 
	.C(n32), 
	.B(FE_OFN48_n7), 
	.A(n66));
   HS65_LS_OAI212X3 U164 (.Z(\chs_out_f[3][DATA][14] ), 
	.E(n141), 
	.D(FE_OFN43_n2), 
	.C(n30), 
	.B(n7), 
	.A(n64));
   HS65_LS_OAI212X3 U165 (.Z(\chs_out_f[3][DATA][16] ), 
	.E(n139), 
	.D(FE_OFN43_n2), 
	.C(n28), 
	.B(n7), 
	.A(n62));
   HS65_LS_OAI212X3 U166 (.Z(\chs_out_f[2][DATA][0] ), 
	.E(n180), 
	.D(n3), 
	.C(n44), 
	.B(FE_OFN47_n8), 
	.A(n78));
   HS65_LS_OAI212X3 U167 (.Z(\chs_out_f[2][DATA][10] ), 
	.E(n179), 
	.D(n3), 
	.C(n34), 
	.B(FE_OFN47_n8), 
	.A(n68));
   HS65_LS_OAI212X3 U168 (.Z(\chs_out_f[2][DATA][12] ), 
	.E(n177), 
	.D(n3), 
	.C(n32), 
	.B(n8), 
	.A(n66));
   HS65_LS_OAI212X3 U169 (.Z(\chs_out_f[2][DATA][14] ), 
	.E(n175), 
	.D(FE_OFN42_n3), 
	.C(n30), 
	.B(n8), 
	.A(n64));
   HS65_LS_OAI212X3 U170 (.Z(\chs_out_f[2][DATA][16] ), 
	.E(n173), 
	.D(FE_OFN42_n3), 
	.C(n28), 
	.B(n8), 
	.A(n62));
   HS65_LS_OAI212X3 U171 (.Z(\chs_out_f[1][DATA][0] ), 
	.E(n214), 
	.D(n4), 
	.C(n44), 
	.B(n9), 
	.A(n78));
   HS65_LS_OAI212X3 U172 (.Z(\chs_out_f[1][DATA][10] ), 
	.E(n213), 
	.D(FE_OFN41_n4), 
	.C(n34), 
	.B(FE_OFN46_n9), 
	.A(n68));
   HS65_LS_OAI212X3 U173 (.Z(\chs_out_f[1][DATA][12] ), 
	.E(n211), 
	.D(FE_OFN41_n4), 
	.C(n32), 
	.B(FE_OFN46_n9), 
	.A(n66));
   HS65_LS_OAI212X3 U174 (.Z(\chs_out_f[1][DATA][14] ), 
	.E(n209), 
	.D(FE_OFN41_n4), 
	.C(n30), 
	.B(FE_OFN46_n9), 
	.A(n64));
   HS65_LS_OAI212X3 U175 (.Z(\chs_out_f[1][DATA][16] ), 
	.E(n207), 
	.D(FE_OFN41_n4), 
	.C(n28), 
	.B(FE_OFN46_n9), 
	.A(n62));
   HS65_LS_OAI212X3 U176 (.Z(\chs_out_f[3][DATA][21] ), 
	.E(n133), 
	.D(FE_OFN43_n2), 
	.C(n23), 
	.B(n7), 
	.A(n57));
   HS65_LS_OAI212X3 U177 (.Z(\chs_out_f[3][DATA][23] ), 
	.E(n131), 
	.D(n2), 
	.C(n21), 
	.B(FE_OFN48_n7), 
	.A(n55));
   HS65_LS_OAI212X3 U178 (.Z(\chs_out_f[3][DATA][25] ), 
	.E(n129), 
	.D(n2), 
	.C(n19), 
	.B(FE_OFN48_n7), 
	.A(n53));
   HS65_LS_OAI212X3 U179 (.Z(\chs_out_f[3][DATA][27] ), 
	.E(n127), 
	.D(FE_OFN43_n2), 
	.C(n17), 
	.B(FE_OFN48_n7), 
	.A(n51));
   HS65_LS_OAI212X3 U180 (.Z(\chs_out_f[2][DATA][21] ), 
	.E(n167), 
	.D(n3), 
	.C(n23), 
	.B(n8), 
	.A(n57));
   HS65_LS_OAI212X3 U181 (.Z(\chs_out_f[2][DATA][23] ), 
	.E(n165), 
	.D(FE_OFN42_n3), 
	.C(n21), 
	.B(n8), 
	.A(n55));
   HS65_LS_OAI212X3 U182 (.Z(\chs_out_f[2][DATA][25] ), 
	.E(n163), 
	.D(FE_OFN42_n3), 
	.C(n19), 
	.B(n8), 
	.A(n53));
   HS65_LS_OAI212X3 U183 (.Z(\chs_out_f[2][DATA][27] ), 
	.E(n161), 
	.D(FE_OFN42_n3), 
	.C(n17), 
	.B(n8), 
	.A(n51));
   HS65_LS_OAI212X3 U184 (.Z(\chs_out_f[1][DATA][21] ), 
	.E(n201), 
	.D(FE_OFN41_n4), 
	.C(n23), 
	.B(FE_OFN46_n9), 
	.A(n57));
   HS65_LS_OAI212X3 U185 (.Z(\chs_out_f[1][DATA][23] ), 
	.E(n199), 
	.D(FE_OFN41_n4), 
	.C(n21), 
	.B(FE_OFN46_n9), 
	.A(n55));
   HS65_LS_OAI212X3 U186 (.Z(\chs_out_f[1][DATA][25] ), 
	.E(n197), 
	.D(FE_OFN41_n4), 
	.C(n19), 
	.B(FE_OFN46_n9), 
	.A(n53));
   HS65_LS_OAI212X3 U187 (.Z(\chs_out_f[1][DATA][27] ), 
	.E(n195), 
	.D(FE_OFN41_n4), 
	.C(n17), 
	.B(FE_OFN46_n9), 
	.A(n51));
   HS65_LS_OAI212X3 U188 (.Z(\chs_out_f[3][DATA][1] ), 
	.E(n135), 
	.D(FE_OFN43_n2), 
	.C(n43), 
	.B(n7), 
	.A(n77));
   HS65_LS_OAI212X3 U189 (.Z(\chs_out_f[3][DATA][11] ), 
	.E(n144), 
	.D(FE_OFN43_n2), 
	.C(n33), 
	.B(n7), 
	.A(n67));
   HS65_LS_OAI212X3 U190 (.Z(\chs_out_f[3][DATA][13] ), 
	.E(n142), 
	.D(FE_OFN43_n2), 
	.C(n31), 
	.B(n7), 
	.A(n65));
   HS65_LS_OAI212X3 U191 (.Z(\chs_out_f[3][DATA][15] ), 
	.E(n140), 
	.D(n2), 
	.C(n29), 
	.B(FE_OFN48_n7), 
	.A(n63));
   HS65_LS_OAI212X3 U192 (.Z(\chs_out_f[3][DATA][17] ), 
	.E(n138), 
	.D(n2), 
	.C(n27), 
	.B(FE_OFN48_n7), 
	.A(n61));
   HS65_LS_OAI212X3 U193 (.Z(\chs_out_f[3][DATA][19] ), 
	.E(n136), 
	.D(n2), 
	.C(n25), 
	.B(FE_OFN48_n7), 
	.A(n59));
   HS65_LS_OAI212X3 U194 (.Z(\chs_out_f[2][DATA][1] ), 
	.E(n169), 
	.D(FE_OFN42_n3), 
	.C(n43), 
	.B(FE_OFN47_n8), 
	.A(n77));
   HS65_LS_OAI212X3 U195 (.Z(\chs_out_f[2][DATA][11] ), 
	.E(n178), 
	.D(n3), 
	.C(n33), 
	.B(n8), 
	.A(n67));
   HS65_LS_OAI212X3 U196 (.Z(\chs_out_f[2][DATA][13] ), 
	.E(n176), 
	.D(n3), 
	.C(n31), 
	.B(n8), 
	.A(n65));
   HS65_LS_OAI212X3 U197 (.Z(\chs_out_f[2][DATA][15] ), 
	.E(n174), 
	.D(n3), 
	.C(n29), 
	.B(n8), 
	.A(n63));
   HS65_LS_OAI212X3 U198 (.Z(\chs_out_f[2][DATA][17] ), 
	.E(n172), 
	.D(n3), 
	.C(n27), 
	.B(n8), 
	.A(n61));
   HS65_LS_OAI212X3 U199 (.Z(\chs_out_f[2][DATA][19] ), 
	.E(n170), 
	.D(FE_OFN42_n3), 
	.C(n25), 
	.B(n8), 
	.A(n59));
   HS65_LS_OAI212X3 U200 (.Z(\chs_out_f[1][DATA][1] ), 
	.E(n203), 
	.D(n4), 
	.C(n43), 
	.B(n9), 
	.A(n77));
   HS65_LS_OAI212X3 U201 (.Z(\chs_out_f[1][DATA][11] ), 
	.E(n212), 
	.D(FE_OFN41_n4), 
	.C(n33), 
	.B(FE_OFN46_n9), 
	.A(n67));
   HS65_LS_OAI212X3 U202 (.Z(\chs_out_f[1][DATA][13] ), 
	.E(n210), 
	.D(FE_OFN41_n4), 
	.C(n31), 
	.B(FE_OFN46_n9), 
	.A(n65));
   HS65_LS_OAI212X3 U203 (.Z(\chs_out_f[1][DATA][15] ), 
	.E(n208), 
	.D(FE_OFN41_n4), 
	.C(n29), 
	.B(FE_OFN46_n9), 
	.A(n63));
   HS65_LS_OAI212X3 U204 (.Z(\chs_out_f[1][DATA][17] ), 
	.E(n206), 
	.D(FE_OFN41_n4), 
	.C(n27), 
	.B(FE_OFN46_n9), 
	.A(n61));
   HS65_LS_OAI212X3 U205 (.Z(\chs_out_f[1][DATA][19] ), 
	.E(n204), 
	.D(FE_OFN41_n4), 
	.C(n25), 
	.B(FE_OFN46_n9), 
	.A(n59));
   HS65_LS_OAI212X3 U206 (.Z(\chs_out_f[3][DATA][18] ), 
	.E(n137), 
	.D(FE_OFN43_n2), 
	.C(n26), 
	.B(n7), 
	.A(n60));
   HS65_LS_OAI212X3 U207 (.Z(\chs_out_f[2][DATA][18] ), 
	.E(n171), 
	.D(FE_OFN42_n3), 
	.C(n26), 
	.B(FE_OFN47_n8), 
	.A(n60));
   HS65_LS_OAI212X3 U208 (.Z(\chs_out_f[1][DATA][18] ), 
	.E(n205), 
	.D(FE_OFN41_n4), 
	.C(n26), 
	.B(n9), 
	.A(n60));
   HS65_LS_AOI222X2 U209 (.Z(n227), 
	.F(\chs_in_f[1][DATA][29] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][29] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][29] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_AOI222X2 U210 (.Z(n248), 
	.F(\chs_in_f[1][DATA][0] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][0] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][0] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_AOI222X2 U211 (.Z(n226), 
	.F(\chs_in_f[1][DATA][2] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][2] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][2] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_AOI222X2 U212 (.Z(n247), 
	.F(\chs_in_f[1][DATA][10] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][10] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][10] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_AOI222X2 U213 (.Z(n245), 
	.F(\chs_in_f[1][DATA][12] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][12] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][12] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_AOI222X2 U214 (.Z(n243), 
	.F(\chs_in_f[1][DATA][14] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][14] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][14] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_AOI222X2 U215 (.Z(n241), 
	.F(\chs_in_f[1][DATA][16] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][16] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][16] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_AOI222X2 U216 (.Z(n236), 
	.F(\chs_in_f[1][DATA][20] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][20] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][20] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_AOI222X2 U217 (.Z(n234), 
	.F(\chs_in_f[1][DATA][22] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][22] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][22] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_AOI222X2 U218 (.Z(n232), 
	.F(\chs_in_f[1][DATA][24] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][24] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][24] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_AOI222X2 U219 (.Z(n230), 
	.F(\chs_in_f[1][DATA][26] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][26] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][26] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_AOI222X2 U220 (.Z(n228), 
	.F(\chs_in_f[1][DATA][28] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][28] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][28] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_AOI222X2 U221 (.Z(n237), 
	.F(\chs_in_f[1][DATA][1] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][1] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][1] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_AOI222X2 U222 (.Z(n246), 
	.F(\chs_in_f[1][DATA][11] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][11] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][11] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_AOI222X2 U223 (.Z(n244), 
	.F(\chs_in_f[1][DATA][13] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][13] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][13] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_AOI222X2 U224 (.Z(n242), 
	.F(\chs_in_f[1][DATA][15] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][15] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][15] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_AOI222X2 U225 (.Z(n240), 
	.F(\chs_in_f[1][DATA][17] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][17] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][17] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_AOI222X2 U226 (.Z(n238), 
	.F(\chs_in_f[1][DATA][19] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][19] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][19] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_AOI222X2 U227 (.Z(n235), 
	.F(\chs_in_f[1][DATA][21] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][21] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][21] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_AOI222X2 U228 (.Z(n233), 
	.F(\chs_in_f[1][DATA][23] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][23] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][23] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_AOI222X2 U229 (.Z(n231), 
	.F(\chs_in_f[1][DATA][25] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][25] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][25] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_AOI222X2 U230 (.Z(n229), 
	.F(\chs_in_f[1][DATA][27] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][27] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][27] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_AOI222X2 U231 (.Z(n225), 
	.F(\chs_in_f[1][DATA][30] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][30] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][30] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_AOI222X2 U232 (.Z(n123), 
	.F(\chs_in_f[1][DATA][30] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][30] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][30] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X2 U233 (.Z(n157), 
	.F(\chs_in_f[1][DATA][30] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][30] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][30] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X2 U234 (.Z(n191), 
	.F(\chs_in_f[1][DATA][30] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][30] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][30] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U235 (.Z(n239), 
	.F(\chs_in_f[1][DATA][18] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][18] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][18] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_AOI222X2 U236 (.Z(n79), 
	.F(\chs_in_f[1][DATA][9] ), 
	.E(\switch_sel[1][4] ), 
	.D(\chs_in_f[0][DATA][9] ), 
	.C(\switch_sel[0][4] ), 
	.B(\chs_in_f[2][DATA][9] ), 
	.A(\switch_sel[2][4] ));
   HS65_LS_OAI212X3 U237 (.Z(\chs_out_f[3][DATA][4] ), 
	.E(n118), 
	.D(n2), 
	.C(n40), 
	.B(FE_OFN48_n7), 
	.A(n74));
   HS65_LS_OAI212X3 U238 (.Z(\chs_out_f[3][DATA][6] ), 
	.E(n116), 
	.D(n2), 
	.C(n38), 
	.B(FE_OFN48_n7), 
	.A(n72));
   HS65_LS_OAI212X3 U239 (.Z(\chs_out_f[3][DATA][8] ), 
	.E(n114), 
	.D(n2), 
	.C(n36), 
	.B(FE_OFN48_n7), 
	.A(n70));
   HS65_LS_OAI212X3 U240 (.Z(\chs_out_f[2][DATA][4] ), 
	.E(n152), 
	.D(n3), 
	.C(n40), 
	.B(FE_OFN47_n8), 
	.A(n74));
   HS65_LS_OAI212X3 U241 (.Z(\chs_out_f[2][DATA][6] ), 
	.E(n150), 
	.D(n3), 
	.C(n38), 
	.B(FE_OFN47_n8), 
	.A(n72));
   HS65_LS_OAI212X3 U242 (.Z(\chs_out_f[2][DATA][8] ), 
	.E(n148), 
	.D(n3), 
	.C(n36), 
	.B(FE_OFN47_n8), 
	.A(n70));
   HS65_LS_OAI212X3 U243 (.Z(\chs_out_f[1][DATA][4] ), 
	.E(n186), 
	.D(n4), 
	.C(n40), 
	.B(n9), 
	.A(n74));
   HS65_LS_OAI212X3 U244 (.Z(\chs_out_f[1][DATA][6] ), 
	.E(n184), 
	.D(n4), 
	.C(n38), 
	.B(n9), 
	.A(n72));
   HS65_LS_OAI212X3 U245 (.Z(\chs_out_f[1][DATA][8] ), 
	.E(n182), 
	.D(FE_OFN41_n4), 
	.C(n36), 
	.B(FE_OFN46_n9), 
	.A(n70));
   HS65_LS_OAI212X3 U246 (.Z(\chs_out_f[3][DATA][3] ), 
	.E(n119), 
	.D(FE_OFN43_n2), 
	.C(n41), 
	.B(n7), 
	.A(n75));
   HS65_LS_OAI212X3 U247 (.Z(\chs_out_f[3][DATA][5] ), 
	.E(n117), 
	.D(FE_OFN43_n2), 
	.C(n39), 
	.B(n7), 
	.A(n73));
   HS65_LS_OAI212X3 U248 (.Z(\chs_out_f[2][DATA][3] ), 
	.E(n153), 
	.D(FE_OFN42_n3), 
	.C(n41), 
	.B(FE_OFN47_n8), 
	.A(n75));
   HS65_LS_OAI212X3 U249 (.Z(\chs_out_f[2][DATA][5] ), 
	.E(n151), 
	.D(FE_OFN42_n3), 
	.C(n39), 
	.B(FE_OFN47_n8), 
	.A(n73));
   HS65_LS_OAI212X3 U250 (.Z(\chs_out_f[1][DATA][3] ), 
	.E(n187), 
	.D(n4), 
	.C(n41), 
	.B(n9), 
	.A(n75));
   HS65_LS_OAI212X3 U251 (.Z(\chs_out_f[1][DATA][5] ), 
	.E(n185), 
	.D(n4), 
	.C(n39), 
	.B(n9), 
	.A(n73));
   HS65_LS_OAI212X3 U252 (.Z(\chs_out_f[0][DATA][9] ), 
	.E(n215), 
	.D(FE_OFN40_n5), 
	.C(n35), 
	.B(FE_OFN45_n10), 
	.A(n69));
   HS65_LS_OAI212X3 U253 (.Z(\chs_out_f[3][DATA][9] ), 
	.E(n113), 
	.D(n2), 
	.C(n35), 
	.B(FE_OFN48_n7), 
	.A(n69));
   HS65_LS_OAI212X3 U254 (.Z(\chs_out_f[2][DATA][9] ), 
	.E(n147), 
	.D(n3), 
	.C(n35), 
	.B(FE_OFN47_n8), 
	.A(n69));
   HS65_LS_OAI212X3 U255 (.Z(\chs_out_f[1][DATA][9] ), 
	.E(n181), 
	.D(n4), 
	.C(n35), 
	.B(n9), 
	.A(n69));
   HS65_LS_AOI222X2 U256 (.Z(n220), 
	.F(\chs_in_f[1][DATA][4] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][4] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][4] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_AOI222X2 U257 (.Z(n218), 
	.F(\chs_in_f[1][DATA][6] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][6] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][6] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_AOI222X2 U258 (.Z(n216), 
	.F(\chs_in_f[1][DATA][8] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][8] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][8] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_AOI222X2 U259 (.Z(n221), 
	.F(\chs_in_f[1][DATA][3] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][3] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][3] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_AOI222X2 U260 (.Z(n219), 
	.F(\chs_in_f[1][DATA][5] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][5] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][5] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X3 U261 (.Z(\chs_out_f[4][DATA][30] ), 
	.E(n89), 
	.D(n14), 
	.C(FE_OFN44_n1), 
	.B(n48), 
	.A(n6));
   HS65_LS_AOI222X2 U262 (.Z(n80), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][8] ), 
	.D(FE_OFN67_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][8] ), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][8] ));
   HS65_LS_AOI222X2 U263 (.Z(n85), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][3] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][3] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][3] ));
   HS65_LS_OR2X9 U264 (.Z(n321), 
	.B(FE_OFN48_n7), 
	.A(n49));
   HS65_LS_OR2X9 U265 (.Z(n322), 
	.B(n2), 
	.A(n15));
   HS65_LS_NAND3X5 U266 (.Z(\chs_out_f[3][DATA][29] ), 
	.C(n125), 
	.B(n322), 
	.A(n321));
   HS65_LH_NAND2X2 U267 (.Z(n323), 
	.B(\chs_in_f[2][DATA][29] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LH_NAND2X2 U268 (.Z(n325), 
	.B(\chs_in_f[1][DATA][29] ), 
	.A(FE_OFN56_switch_sel_8_));
   HS65_LS_AND3X9 U269 (.Z(n125), 
	.C(n325), 
	.B(n324), 
	.A(n323));
   HS65_LS_OAI212X5 U326 (.Z(\chs_out_f[4][DATA][0] ), 
	.E(n112), 
	.D(n44), 
	.C(n1), 
	.B(n78), 
	.A(FE_OFN49_n6));
   HS65_LS_OAI212X5 U327 (.Z(\chs_out_f[4][DATA][3] ), 
	.E(n85), 
	.D(n41), 
	.C(n1), 
	.B(n75), 
	.A(FE_OFN49_n6));
   HS65_LS_OAI212X5 U328 (.Z(\chs_out_f[4][DATA][4] ), 
	.E(n84), 
	.D(n40), 
	.C(n1), 
	.B(n74), 
	.A(FE_OFN49_n6));
   HS65_LS_OAI212X5 U329 (.Z(\chs_out_f[4][DATA][5] ), 
	.E(n83), 
	.D(n39), 
	.C(FE_OFN44_n1), 
	.B(n73), 
	.A(n6));
   HS65_LS_OAI212X5 U330 (.Z(\chs_out_f[4][DATA][6] ), 
	.E(n82), 
	.D(n38), 
	.C(n1), 
	.B(n72), 
	.A(FE_OFN49_n6));
   HS65_LS_OAI212X5 U331 (.Z(\chs_out_f[4][DATA][8] ), 
	.E(n80), 
	.D(n36), 
	.C(n1), 
	.B(n70), 
	.A(FE_OFN49_n6));
   HS65_LS_OAI212X5 U332 (.Z(\chs_out_f[4][DATA][10] ), 
	.E(n111), 
	.D(n34), 
	.C(n1), 
	.B(n68), 
	.A(FE_OFN49_n6));
   HS65_LS_OAI212X5 U333 (.Z(\chs_out_f[4][DATA][11] ), 
	.E(n110), 
	.D(n33), 
	.C(FE_OFN44_n1), 
	.B(n67), 
	.A(n6));
   HS65_LS_OAI212X5 U334 (.Z(\chs_out_f[4][DATA][13] ), 
	.E(n108), 
	.D(n31), 
	.C(FE_OFN44_n1), 
	.B(n65), 
	.A(n6));
   HS65_LS_OAI212X5 U335 (.Z(\chs_out_f[4][DATA][14] ), 
	.E(n107), 
	.D(n30), 
	.C(FE_OFN44_n1), 
	.B(n64), 
	.A(FE_OFN49_n6));
   HS65_LS_OAI212X5 U336 (.Z(\chs_out_f[4][DATA][15] ), 
	.E(n106), 
	.D(n29), 
	.C(FE_OFN44_n1), 
	.B(n63), 
	.A(n6));
   HS65_LS_OAI212X5 U337 (.Z(\chs_out_f[4][DATA][16] ), 
	.E(n105), 
	.D(n28), 
	.C(FE_OFN44_n1), 
	.B(n62), 
	.A(FE_OFN49_n6));
   HS65_LS_OAI212X5 U338 (.Z(\chs_out_f[4][DATA][18] ), 
	.E(n103), 
	.D(n26), 
	.C(FE_OFN44_n1), 
	.B(n60), 
	.A(n6));
   HS65_LS_OAI212X5 U339 (.Z(\chs_out_f[4][DATA][19] ), 
	.E(n102), 
	.D(n25), 
	.C(n1), 
	.B(n59), 
	.A(FE_OFN49_n6));
   HS65_LS_OAI212X5 U340 (.Z(\chs_out_f[4][DATA][20] ), 
	.E(n100), 
	.D(n24), 
	.C(FE_OFN44_n1), 
	.B(n58), 
	.A(n6));
   HS65_LS_OAI212X5 U341 (.Z(\chs_out_f[4][DATA][21] ), 
	.E(n99), 
	.D(n23), 
	.C(FE_OFN44_n1), 
	.B(n57), 
	.A(n6));
   HS65_LS_OAI212X5 U342 (.Z(\chs_out_f[4][DATA][22] ), 
	.E(n98), 
	.D(n22), 
	.C(FE_OFN44_n1), 
	.B(n56), 
	.A(n6));
   HS65_LS_OAI212X5 U343 (.Z(\chs_out_f[4][DATA][23] ), 
	.E(n97), 
	.D(n21), 
	.C(n1), 
	.B(n55), 
	.A(FE_OFN49_n6));
   HS65_LS_OAI212X5 U344 (.Z(\chs_out_f[4][DATA][24] ), 
	.E(n96), 
	.D(n20), 
	.C(FE_OFN44_n1), 
	.B(n54), 
	.A(n6));
   HS65_LS_OAI212X5 U345 (.Z(\chs_out_f[4][DATA][25] ), 
	.E(n95), 
	.D(n19), 
	.C(FE_OFN44_n1), 
	.B(n53), 
	.A(FE_OFN49_n6));
   HS65_LS_OAI212X5 U346 (.Z(\chs_out_f[4][DATA][26] ), 
	.E(n94), 
	.D(n18), 
	.C(FE_OFN44_n1), 
	.B(n52), 
	.A(n6));
   HS65_LS_OAI212X5 U347 (.Z(\chs_out_f[4][DATA][27] ), 
	.E(n93), 
	.D(n17), 
	.C(FE_OFN44_n1), 
	.B(n51), 
	.A(FE_OFN49_n6));
   HS65_LS_OAI212X5 U348 (.Z(\chs_out_f[4][DATA][28] ), 
	.E(n92), 
	.D(n16), 
	.C(FE_OFN44_n1), 
	.B(n50), 
	.A(n6));
   HS65_LS_AOI222X2 U349 (.Z(n89), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][30] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][30] ), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][30] ));
   HS65_LS_OAI212X5 U350 (.Z(\chs_out_f[4][DATA][32] ), 
	.E(n87), 
	.D(n12), 
	.C(FE_OFN44_n1), 
	.B(n46), 
	.A(n6));
   HS65_LS_AOI222X2 U351 (.Z(n87), 
	.F(FE_OFN57_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][32] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][32] ), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][32] ));
   HS65_LS_OAI212X5 U352 (.Z(\chs_out_f[4][DATA][33] ), 
	.E(n86), 
	.D(n11), 
	.C(FE_OFN44_n1), 
	.B(n45), 
	.A(n6));
   HS65_LS_AOI222X2 U353 (.Z(n86), 
	.F(FE_OFN57_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][33] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][33] ), 
	.B(FE_OFN62_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][33] ));
   HS65_LS_AOI222X2 U354 (.Z(n113), 
	.F(\chs_in_f[1][DATA][9] ), 
	.E(FE_OFN56_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][9] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][9] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X2 U355 (.Z(n147), 
	.F(\chs_in_f[1][DATA][9] ), 
	.E(FE_OFN55_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][9] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][9] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_AOI222X2 U356 (.Z(n181), 
	.F(\chs_in_f[1][DATA][9] ), 
	.E(FE_OFN54_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][9] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][9] ), 
	.A(FE_OFN59_switch_sel_11_));
   HS65_LS_AOI222X2 U357 (.Z(n215), 
	.F(\chs_in_f[1][DATA][9] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][9] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][9] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U358 (.Z(\chs_out_f[4][DATA][9] ), 
	.E(n79), 
	.D(n1), 
	.C(n35), 
	.B(FE_OFN49_n6), 
	.A(n69));
   HS65_LS_AOI222X2 U359 (.Z(n124), 
	.F(\chs_in_f[1][DATA][2] ), 
	.E(FE_OFN56_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][2] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][2] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X2 U360 (.Z(n119), 
	.F(\chs_in_f[1][DATA][3] ), 
	.E(FE_OFN56_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][3] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][3] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X2 U361 (.Z(n118), 
	.F(\chs_in_f[1][DATA][4] ), 
	.E(FE_OFN56_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][4] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][4] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X2 U362 (.Z(n117), 
	.F(\chs_in_f[1][DATA][5] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][5] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][5] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X2 U363 (.Z(n116), 
	.F(\chs_in_f[1][DATA][6] ), 
	.E(FE_OFN56_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][6] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][6] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X2 U364 (.Z(n114), 
	.F(\chs_in_f[1][DATA][8] ), 
	.E(FE_OFN56_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][8] ), 
	.C(FE_OFN66_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][8] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LS_AOI222X2 U365 (.Z(n145), 
	.F(\chs_in_f[1][DATA][10] ), 
	.E(FE_OFN56_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][10] ), 
	.C(FE_OFN66_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][10] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LS_AOI222X2 U366 (.Z(n144), 
	.F(\chs_in_f[1][DATA][11] ), 
	.E(FE_OFN56_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][11] ), 
	.C(FE_OFN66_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][11] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X2 U367 (.Z(n143), 
	.F(\chs_in_f[1][DATA][12] ), 
	.E(FE_OFN56_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][12] ), 
	.C(FE_OFN66_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][12] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LS_AOI222X2 U368 (.Z(n142), 
	.F(\chs_in_f[1][DATA][13] ), 
	.E(FE_OFN56_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][13] ), 
	.C(FE_OFN66_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][13] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X2 U369 (.Z(n141), 
	.F(\chs_in_f[1][DATA][14] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][14] ), 
	.C(FE_OFN66_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][14] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LS_AOI222X2 U370 (.Z(n140), 
	.F(\chs_in_f[1][DATA][15] ), 
	.E(FE_OFN56_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][15] ), 
	.C(FE_OFN66_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][15] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X2 U371 (.Z(n139), 
	.F(\chs_in_f[1][DATA][16] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][16] ), 
	.C(FE_OFN66_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][16] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LS_AOI222X2 U372 (.Z(n138), 
	.F(\chs_in_f[1][DATA][17] ), 
	.E(FE_OFN56_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][17] ), 
	.C(FE_OFN66_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][17] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LS_AOI222X2 U373 (.Z(n137), 
	.F(\chs_in_f[1][DATA][18] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][18] ), 
	.C(FE_OFN66_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][18] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LS_AOI222X2 U374 (.Z(n136), 
	.F(\chs_in_f[1][DATA][19] ), 
	.E(FE_OFN56_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][19] ), 
	.C(FE_OFN66_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][19] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LS_AOI222X2 U375 (.Z(n134), 
	.F(\chs_in_f[1][DATA][20] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][20] ), 
	.C(FE_OFN66_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][20] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LS_AOI222X2 U376 (.Z(n133), 
	.F(\chs_in_f[1][DATA][21] ), 
	.E(FE_OFN56_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][21] ), 
	.C(FE_OFN66_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][21] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LS_AOI222X2 U377 (.Z(n132), 
	.F(\chs_in_f[1][DATA][22] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][22] ), 
	.C(FE_OFN66_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][22] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LS_AOI222X2 U378 (.Z(n131), 
	.F(\chs_in_f[1][DATA][23] ), 
	.E(FE_OFN56_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][23] ), 
	.C(FE_OFN66_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][23] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LS_AOI222X2 U379 (.Z(n130), 
	.F(\chs_in_f[1][DATA][24] ), 
	.E(FE_OFN56_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][24] ), 
	.C(FE_OFN66_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][24] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X2 U380 (.Z(n129), 
	.F(\chs_in_f[1][DATA][25] ), 
	.E(FE_OFN56_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][25] ), 
	.C(FE_OFN66_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][25] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LS_AOI222X2 U381 (.Z(n128), 
	.F(\chs_in_f[1][DATA][26] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][26] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][26] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LS_AOI222X2 U382 (.Z(n127), 
	.F(\chs_in_f[1][DATA][27] ), 
	.E(FE_OFN56_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][27] ), 
	.C(FE_OFN66_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][27] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LS_AOI222X2 U383 (.Z(n126), 
	.F(\chs_in_f[1][DATA][28] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][28] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][28] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LS_OAI212X5 U384 (.Z(\chs_out_f[3][DATA][30] ), 
	.E(n123), 
	.D(FE_OFN43_n2), 
	.C(n14), 
	.B(n7), 
	.A(n48));
   HS65_LS_OAI212X5 U385 (.Z(\chs_out_f[3][DATA][31] ), 
	.E(n122), 
	.D(FE_OFN43_n2), 
	.C(n13), 
	.B(FE_OFN48_n7), 
	.A(n47));
   HS65_LS_AOI222X4 U386 (.Z(n122), 
	.F(\chs_in_f[1][DATA][31] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][31] ), 
	.C(FE_OFN66_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][31] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LS_OAI212X5 U387 (.Z(\chs_out_f[3][DATA][32] ), 
	.E(n121), 
	.D(FE_OFN43_n2), 
	.C(n12), 
	.B(n7), 
	.A(n46));
   HS65_LS_AOI222X4 U388 (.Z(n121), 
	.F(\chs_in_f[1][DATA][32] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][32] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][32] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LS_OAI212X5 U389 (.Z(\chs_out_f[3][DATA][33] ), 
	.E(n120), 
	.D(FE_OFN43_n2), 
	.C(n11), 
	.B(n7), 
	.A(n45));
   HS65_LS_AOI222X4 U390 (.Z(n120), 
	.F(\chs_in_f[1][DATA][33] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][33] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][33] ), 
	.A(FE_OFN61_switch_sel_13_));
   HS65_LS_AOI222X2 U391 (.Z(n180), 
	.F(\chs_in_f[1][DATA][0] ), 
	.E(FE_OFN55_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][0] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][0] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_AOI222X2 U392 (.Z(n158), 
	.F(\chs_in_f[1][DATA][2] ), 
	.E(FE_OFN55_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][2] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][2] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_AOI222X2 U393 (.Z(n153), 
	.F(\chs_in_f[1][DATA][3] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][3] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][3] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X2 U394 (.Z(n152), 
	.F(\chs_in_f[1][DATA][4] ), 
	.E(FE_OFN55_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][4] ), 
	.C(FE_OFN65_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][4] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_AOI222X2 U395 (.Z(n151), 
	.F(\chs_in_f[1][DATA][5] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][5] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][5] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X2 U396 (.Z(n150), 
	.F(\chs_in_f[1][DATA][6] ), 
	.E(FE_OFN55_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][6] ), 
	.C(FE_OFN65_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][6] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_AOI222X2 U397 (.Z(n148), 
	.F(\chs_in_f[1][DATA][8] ), 
	.E(FE_OFN55_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][8] ), 
	.C(FE_OFN65_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][8] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_AOI222X2 U398 (.Z(n179), 
	.F(\chs_in_f[1][DATA][10] ), 
	.E(FE_OFN55_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][10] ), 
	.C(FE_OFN65_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][10] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_AOI222X2 U399 (.Z(n178), 
	.F(\chs_in_f[1][DATA][11] ), 
	.E(FE_OFN55_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][11] ), 
	.C(FE_OFN65_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][11] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_AOI222X2 U400 (.Z(n177), 
	.F(\chs_in_f[1][DATA][12] ), 
	.E(FE_OFN55_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][12] ), 
	.C(FE_OFN65_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][12] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_AOI222X2 U401 (.Z(n176), 
	.F(\chs_in_f[1][DATA][13] ), 
	.E(FE_OFN55_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][13] ), 
	.C(FE_OFN65_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][13] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_AOI222X2 U402 (.Z(n175), 
	.F(\chs_in_f[1][DATA][14] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][14] ), 
	.C(FE_OFN65_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][14] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X2 U403 (.Z(n174), 
	.F(\chs_in_f[1][DATA][15] ), 
	.E(FE_OFN55_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][15] ), 
	.C(FE_OFN65_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][15] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_AOI222X2 U404 (.Z(n173), 
	.F(\chs_in_f[1][DATA][16] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][16] ), 
	.C(FE_OFN65_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][16] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X2 U405 (.Z(n172), 
	.F(\chs_in_f[1][DATA][17] ), 
	.E(FE_OFN55_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][17] ), 
	.C(FE_OFN65_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][17] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_AOI222X2 U406 (.Z(n171), 
	.F(\chs_in_f[1][DATA][18] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][18] ), 
	.C(FE_OFN65_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][18] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X2 U407 (.Z(n170), 
	.F(\chs_in_f[1][DATA][19] ), 
	.E(FE_OFN55_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][19] ), 
	.C(FE_OFN65_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][19] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_AOI222X2 U408 (.Z(n167), 
	.F(\chs_in_f[1][DATA][21] ), 
	.E(FE_OFN55_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][21] ), 
	.C(FE_OFN65_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][21] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_AOI222X2 U409 (.Z(n166), 
	.F(\chs_in_f[1][DATA][22] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][22] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][22] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X2 U410 (.Z(n165), 
	.F(\chs_in_f[1][DATA][23] ), 
	.E(FE_OFN55_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][23] ), 
	.C(FE_OFN65_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][23] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_AOI222X2 U411 (.Z(n164), 
	.F(\chs_in_f[1][DATA][24] ), 
	.E(FE_OFN55_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][24] ), 
	.C(FE_OFN65_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][24] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_AOI222X2 U412 (.Z(n163), 
	.F(\chs_in_f[1][DATA][25] ), 
	.E(FE_OFN55_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][25] ), 
	.C(FE_OFN65_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][25] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_AOI222X2 U413 (.Z(n162), 
	.F(\chs_in_f[1][DATA][26] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][26] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][26] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X2 U414 (.Z(n161), 
	.F(\chs_in_f[1][DATA][27] ), 
	.E(FE_OFN55_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][27] ), 
	.C(FE_OFN65_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][27] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_AOI222X2 U415 (.Z(n160), 
	.F(\chs_in_f[1][DATA][28] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][28] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][28] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U416 (.Z(\chs_out_f[2][DATA][30] ), 
	.E(n157), 
	.D(FE_OFN42_n3), 
	.C(n14), 
	.B(FE_OFN47_n8), 
	.A(n48));
   HS65_LS_OAI212X5 U417 (.Z(\chs_out_f[2][DATA][31] ), 
	.E(n156), 
	.D(FE_OFN42_n3), 
	.C(n13), 
	.B(n8), 
	.A(n47));
   HS65_LS_AOI222X4 U418 (.Z(n156), 
	.F(\chs_in_f[1][DATA][31] ), 
	.E(FE_OFN55_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][31] ), 
	.C(FE_OFN65_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][31] ), 
	.A(FE_OFN60_switch_sel_12_));
   HS65_LS_OAI212X5 U419 (.Z(\chs_out_f[2][DATA][32] ), 
	.E(n155), 
	.D(FE_OFN42_n3), 
	.C(n12), 
	.B(FE_OFN47_n8), 
	.A(n46));
   HS65_LS_AOI222X4 U420 (.Z(n155), 
	.F(\chs_in_f[1][DATA][32] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][32] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][32] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U421 (.Z(\chs_out_f[2][DATA][33] ), 
	.E(n154), 
	.D(FE_OFN42_n3), 
	.C(n11), 
	.B(FE_OFN47_n8), 
	.A(n45));
   HS65_LS_AOI222X4 U422 (.Z(n154), 
	.F(\chs_in_f[1][DATA][33] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][33] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][33] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X2 U423 (.Z(n214), 
	.F(\chs_in_f[1][DATA][0] ), 
	.E(FE_OFN54_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][0] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][0] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U424 (.Z(n192), 
	.F(\chs_in_f[1][DATA][2] ), 
	.E(FE_OFN54_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][2] ), 
	.C(FE_OFN64_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][2] ), 
	.A(FE_OFN59_switch_sel_11_));
   HS65_LS_AOI222X2 U425 (.Z(n187), 
	.F(\chs_in_f[1][DATA][3] ), 
	.E(FE_OFN54_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][3] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][3] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U426 (.Z(n186), 
	.F(\chs_in_f[1][DATA][4] ), 
	.E(FE_OFN54_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][4] ), 
	.C(FE_OFN64_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][4] ), 
	.A(FE_OFN59_switch_sel_11_));
   HS65_LS_AOI222X2 U427 (.Z(n185), 
	.F(\chs_in_f[1][DATA][5] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][5] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][5] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U428 (.Z(n184), 
	.F(\chs_in_f[1][DATA][6] ), 
	.E(FE_OFN54_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][6] ), 
	.C(FE_OFN64_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][6] ), 
	.A(FE_OFN59_switch_sel_11_));
   HS65_LS_AOI222X2 U429 (.Z(n182), 
	.F(\chs_in_f[1][DATA][8] ), 
	.E(FE_OFN54_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][8] ), 
	.C(FE_OFN64_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][8] ), 
	.A(FE_OFN59_switch_sel_11_));
   HS65_LS_AOI222X2 U430 (.Z(n213), 
	.F(\chs_in_f[1][DATA][10] ), 
	.E(FE_OFN54_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][10] ), 
	.C(FE_OFN64_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][10] ), 
	.A(FE_OFN59_switch_sel_11_));
   HS65_LS_AOI222X2 U431 (.Z(n212), 
	.F(\chs_in_f[1][DATA][11] ), 
	.E(FE_OFN54_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][11] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][11] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U432 (.Z(n211), 
	.F(\chs_in_f[1][DATA][12] ), 
	.E(FE_OFN54_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][12] ), 
	.C(FE_OFN64_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][12] ), 
	.A(FE_OFN59_switch_sel_11_));
   HS65_LS_AOI222X2 U433 (.Z(n210), 
	.F(\chs_in_f[1][DATA][13] ), 
	.E(FE_OFN54_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][13] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][13] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U434 (.Z(n209), 
	.F(\chs_in_f[1][DATA][14] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][14] ), 
	.C(FE_OFN64_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][14] ), 
	.A(FE_OFN59_switch_sel_11_));
   HS65_LS_AOI222X2 U435 (.Z(n208), 
	.F(\chs_in_f[1][DATA][15] ), 
	.E(FE_OFN54_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][15] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][15] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U436 (.Z(n207), 
	.F(\chs_in_f[1][DATA][16] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][16] ), 
	.C(FE_OFN64_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][16] ), 
	.A(FE_OFN59_switch_sel_11_));
   HS65_LS_AOI222X2 U437 (.Z(n206), 
	.F(\chs_in_f[1][DATA][17] ), 
	.E(FE_OFN54_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][17] ), 
	.C(FE_OFN64_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][17] ), 
	.A(FE_OFN59_switch_sel_11_));
   HS65_LS_AOI222X2 U438 (.Z(n205), 
	.F(\chs_in_f[1][DATA][18] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][18] ), 
	.C(FE_OFN64_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][18] ), 
	.A(FE_OFN59_switch_sel_11_));
   HS65_LS_AOI222X2 U439 (.Z(n204), 
	.F(\chs_in_f[1][DATA][19] ), 
	.E(FE_OFN54_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][19] ), 
	.C(FE_OFN64_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][19] ), 
	.A(FE_OFN59_switch_sel_11_));
   HS65_LS_AOI222X2 U440 (.Z(n202), 
	.F(\chs_in_f[1][DATA][20] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][20] ), 
	.C(FE_OFN64_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][20] ), 
	.A(FE_OFN59_switch_sel_11_));
   HS65_LS_AOI222X2 U441 (.Z(n201), 
	.F(\chs_in_f[1][DATA][21] ), 
	.E(FE_OFN54_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][21] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][21] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U442 (.Z(n200), 
	.F(\chs_in_f[1][DATA][22] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][22] ), 
	.C(FE_OFN64_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][22] ), 
	.A(FE_OFN59_switch_sel_11_));
   HS65_LS_AOI222X2 U443 (.Z(n199), 
	.F(\chs_in_f[1][DATA][23] ), 
	.E(FE_OFN54_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][23] ), 
	.C(FE_OFN64_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][23] ), 
	.A(FE_OFN59_switch_sel_11_));
   HS65_LS_AOI222X2 U444 (.Z(n198), 
	.F(\chs_in_f[1][DATA][24] ), 
	.E(FE_OFN54_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][24] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][24] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U445 (.Z(n197), 
	.F(\chs_in_f[1][DATA][25] ), 
	.E(FE_OFN54_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][25] ), 
	.C(FE_OFN64_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][25] ), 
	.A(FE_OFN59_switch_sel_11_));
   HS65_LS_AOI222X2 U446 (.Z(n196), 
	.F(\chs_in_f[1][DATA][26] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][26] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][26] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U447 (.Z(n195), 
	.F(\chs_in_f[1][DATA][27] ), 
	.E(FE_OFN54_switch_sel_6_), 
	.D(\chs_in_f[0][DATA][27] ), 
	.C(FE_OFN64_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][27] ), 
	.A(FE_OFN59_switch_sel_11_));
   HS65_LS_AOI222X2 U448 (.Z(n194), 
	.F(\chs_in_f[1][DATA][28] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][28] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][28] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_OAI212X5 U449 (.Z(\chs_out_f[1][DATA][30] ), 
	.E(n191), 
	.D(n4), 
	.C(n14), 
	.B(n9), 
	.A(n48));
   HS65_LS_OAI212X5 U450 (.Z(\chs_out_f[1][DATA][31] ), 
	.E(n190), 
	.D(FE_OFN41_n4), 
	.C(n13), 
	.B(FE_OFN46_n9), 
	.A(n47));
   HS65_LS_AOI222X4 U451 (.Z(n190), 
	.F(\chs_in_f[1][DATA][31] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][31] ), 
	.C(FE_OFN64_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][31] ), 
	.A(FE_OFN59_switch_sel_11_));
   HS65_LS_OAI212X5 U452 (.Z(\chs_out_f[1][DATA][32] ), 
	.E(n189), 
	.D(n4), 
	.C(n12), 
	.B(n9), 
	.A(n46));
   HS65_LS_AOI222X4 U453 (.Z(n189), 
	.F(\chs_in_f[1][DATA][32] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][32] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][32] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_OAI212X5 U454 (.Z(\chs_out_f[1][DATA][33] ), 
	.E(n188), 
	.D(n4), 
	.C(n11), 
	.B(n9), 
	.A(n45));
   HS65_LS_AOI222X4 U455 (.Z(n188), 
	.F(\chs_in_f[1][DATA][33] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][33] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][33] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_OAI212X5 U456 (.Z(\chs_out_f[0][DATA][0] ), 
	.E(n248), 
	.D(FE_OFN40_n5), 
	.C(n44), 
	.B(FE_OFN45_n10), 
	.A(n78));
   HS65_LS_OAI212X5 U457 (.Z(\chs_out_f[0][DATA][2] ), 
	.E(n226), 
	.D(FE_OFN40_n5), 
	.C(n42), 
	.B(FE_OFN45_n10), 
	.A(n76));
   HS65_LS_OAI212X5 U458 (.Z(\chs_out_f[0][DATA][3] ), 
	.E(n221), 
	.D(n5), 
	.C(n41), 
	.B(FE_OFN45_n10), 
	.A(n75));
   HS65_LS_OAI212X5 U459 (.Z(\chs_out_f[0][DATA][4] ), 
	.E(n220), 
	.D(FE_OFN40_n5), 
	.C(n40), 
	.B(FE_OFN45_n10), 
	.A(n74));
   HS65_LS_OAI212X5 U460 (.Z(\chs_out_f[0][DATA][5] ), 
	.E(n219), 
	.D(n5), 
	.C(n39), 
	.B(n10), 
	.A(n73));
   HS65_LS_OAI212X5 U461 (.Z(\chs_out_f[0][DATA][6] ), 
	.E(n218), 
	.D(FE_OFN40_n5), 
	.C(n38), 
	.B(FE_OFN45_n10), 
	.A(n72));
   HS65_LS_OAI212X5 U462 (.Z(\chs_out_f[0][DATA][7] ), 
	.E(n217), 
	.D(n5), 
	.C(n37), 
	.B(FE_OFN45_n10), 
	.A(n71));
   HS65_LS_OAI212X5 U463 (.Z(\chs_out_f[0][DATA][8] ), 
	.E(n216), 
	.D(FE_OFN40_n5), 
	.C(n36), 
	.B(FE_OFN45_n10), 
	.A(n70));
   HS65_LS_OAI212X5 U464 (.Z(\chs_out_f[0][DATA][10] ), 
	.E(n247), 
	.D(FE_OFN40_n5), 
	.C(n34), 
	.B(FE_OFN45_n10), 
	.A(n68));
   HS65_LS_OAI212X5 U465 (.Z(\chs_out_f[0][DATA][11] ), 
	.E(n246), 
	.D(FE_OFN40_n5), 
	.C(n33), 
	.B(FE_OFN45_n10), 
	.A(n67));
   HS65_LS_OAI212X5 U466 (.Z(\chs_out_f[0][DATA][12] ), 
	.E(n245), 
	.D(FE_OFN40_n5), 
	.C(n32), 
	.B(FE_OFN45_n10), 
	.A(n66));
   HS65_LS_OAI212X5 U467 (.Z(\chs_out_f[0][DATA][13] ), 
	.E(n244), 
	.D(FE_OFN40_n5), 
	.C(n31), 
	.B(FE_OFN45_n10), 
	.A(n65));
   HS65_LS_OAI212X5 U468 (.Z(\chs_out_f[0][DATA][14] ), 
	.E(n243), 
	.D(n5), 
	.C(n30), 
	.B(n10), 
	.A(n64));
   HS65_LS_OAI212X5 U469 (.Z(\chs_out_f[0][DATA][15] ), 
	.E(n242), 
	.D(FE_OFN40_n5), 
	.C(n29), 
	.B(FE_OFN45_n10), 
	.A(n63));
   HS65_LS_OAI212X5 U470 (.Z(\chs_out_f[0][DATA][16] ), 
	.E(n241), 
	.D(n5), 
	.C(n28), 
	.B(n10), 
	.A(n62));
   HS65_LS_OAI212X5 U471 (.Z(\chs_out_f[0][DATA][17] ), 
	.E(n240), 
	.D(FE_OFN40_n5), 
	.C(n27), 
	.B(FE_OFN45_n10), 
	.A(n61));
   HS65_LS_OAI212X5 U472 (.Z(\chs_out_f[0][DATA][18] ), 
	.E(n239), 
	.D(n5), 
	.C(n26), 
	.B(n10), 
	.A(n60));
   HS65_LS_OAI212X5 U473 (.Z(\chs_out_f[0][DATA][19] ), 
	.E(n238), 
	.D(FE_OFN40_n5), 
	.C(n25), 
	.B(FE_OFN45_n10), 
	.A(n59));
   HS65_LS_OAI212X5 U474 (.Z(\chs_out_f[0][DATA][20] ), 
	.E(n236), 
	.D(n5), 
	.C(n24), 
	.B(n10), 
	.A(n58));
   HS65_LS_OAI212X5 U475 (.Z(\chs_out_f[0][DATA][21] ), 
	.E(n235), 
	.D(FE_OFN40_n5), 
	.C(n23), 
	.B(FE_OFN45_n10), 
	.A(n57));
   HS65_LS_OAI212X5 U476 (.Z(\chs_out_f[0][DATA][22] ), 
	.E(n234), 
	.D(n5), 
	.C(n22), 
	.B(n10), 
	.A(n56));
   HS65_LS_OAI212X5 U477 (.Z(\chs_out_f[0][DATA][23] ), 
	.E(n233), 
	.D(FE_OFN40_n5), 
	.C(n21), 
	.B(FE_OFN45_n10), 
	.A(n55));
   HS65_LS_OAI212X5 U478 (.Z(\chs_out_f[0][DATA][24] ), 
	.E(n232), 
	.D(FE_OFN40_n5), 
	.C(n20), 
	.B(FE_OFN45_n10), 
	.A(n54));
   HS65_LS_OAI212X5 U479 (.Z(\chs_out_f[0][DATA][25] ), 
	.E(n231), 
	.D(FE_OFN40_n5), 
	.C(n19), 
	.B(FE_OFN45_n10), 
	.A(n53));
   HS65_LS_OAI212X5 U480 (.Z(\chs_out_f[0][DATA][26] ), 
	.E(n230), 
	.D(n5), 
	.C(n18), 
	.B(n10), 
	.A(n52));
   HS65_LS_OAI212X5 U481 (.Z(\chs_out_f[0][DATA][27] ), 
	.E(n229), 
	.D(n5), 
	.C(n17), 
	.B(n10), 
	.A(n51));
   HS65_LS_OAI212X5 U482 (.Z(\chs_out_f[0][DATA][28] ), 
	.E(n228), 
	.D(n5), 
	.C(n16), 
	.B(n10), 
	.A(n50));
   HS65_LS_OAI212X5 U483 (.Z(\chs_out_f[0][DATA][29] ), 
	.E(n227), 
	.D(n5), 
	.C(n15), 
	.B(n10), 
	.A(n49));
   HS65_LS_OAI212X5 U484 (.Z(\chs_out_f[0][DATA][30] ), 
	.E(n225), 
	.D(n5), 
	.C(n14), 
	.B(n10), 
	.A(n48));
   HS65_LS_OAI212X5 U485 (.Z(\chs_out_f[0][DATA][31] ), 
	.E(n224), 
	.D(n5), 
	.C(n13), 
	.B(n10), 
	.A(n47));
   HS65_LS_AOI222X4 U486 (.Z(n224), 
	.F(\chs_in_f[1][DATA][31] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][31] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][31] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_OAI212X5 U487 (.Z(\chs_out_f[0][DATA][32] ), 
	.E(n223), 
	.D(n5), 
	.C(n12), 
	.B(n10), 
	.A(n46));
   HS65_LS_AOI222X4 U488 (.Z(n223), 
	.F(\chs_in_f[1][DATA][32] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][32] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][32] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_OAI212X5 U489 (.Z(\chs_out_f[0][DATA][33] ), 
	.E(n222), 
	.D(n5), 
	.C(n11), 
	.B(n10), 
	.A(n45));
   HS65_LS_AOI222X4 U490 (.Z(n222), 
	.F(\chs_in_f[1][DATA][33] ), 
	.E(FE_OFN53_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][33] ), 
	.C(FE_OFN63_switch_sel_0_), 
	.B(\chs_in_f[2][DATA][33] ), 
	.A(FE_OFN58_switch_sel_10_));
   HS65_LS_AOI222X2 U491 (.Z(n135), 
	.F(\chs_in_f[1][DATA][1] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][1] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][1] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X2 U492 (.Z(n169), 
	.F(\chs_in_f[1][DATA][1] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][1] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][1] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X2 U493 (.Z(n203), 
	.F(\chs_in_f[1][DATA][1] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][1] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][1] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_OAI212X5 U494 (.Z(\chs_out_f[0][DATA][1] ), 
	.E(n237), 
	.D(n5), 
	.C(n43), 
	.B(FE_OFN45_n10), 
	.A(n77));
   HS65_LS_IVX9 U495 (.Z(n69), 
	.A(\chs_in_f[3][DATA][9] ));
   HS65_LS_IVX9 U496 (.Z(n78), 
	.A(\chs_in_f[3][DATA][0] ));
   HS65_LS_IVX9 U497 (.Z(n76), 
	.A(\chs_in_f[3][DATA][2] ));
   HS65_LS_IVX9 U498 (.Z(n75), 
	.A(\chs_in_f[3][DATA][3] ));
   HS65_LS_IVX9 U499 (.Z(n74), 
	.A(\chs_in_f[3][DATA][4] ));
   HS65_LS_IVX9 U500 (.Z(n73), 
	.A(\chs_in_f[3][DATA][5] ));
   HS65_LS_IVX9 U501 (.Z(n72), 
	.A(\chs_in_f[3][DATA][6] ));
   HS65_LS_IVX9 U502 (.Z(n71), 
	.A(\chs_in_f[3][DATA][7] ));
   HS65_LS_IVX9 U503 (.Z(n70), 
	.A(\chs_in_f[3][DATA][8] ));
   HS65_LS_IVX9 U504 (.Z(n68), 
	.A(\chs_in_f[3][DATA][10] ));
   HS65_LS_IVX9 U505 (.Z(n67), 
	.A(\chs_in_f[3][DATA][11] ));
   HS65_LS_IVX9 U506 (.Z(n66), 
	.A(\chs_in_f[3][DATA][12] ));
   HS65_LS_IVX9 U507 (.Z(n65), 
	.A(\chs_in_f[3][DATA][13] ));
   HS65_LS_IVX9 U508 (.Z(n64), 
	.A(\chs_in_f[3][DATA][14] ));
   HS65_LS_IVX9 U509 (.Z(n63), 
	.A(\chs_in_f[3][DATA][15] ));
   HS65_LS_IVX9 U510 (.Z(n62), 
	.A(\chs_in_f[3][DATA][16] ));
   HS65_LS_IVX9 U511 (.Z(n61), 
	.A(\chs_in_f[3][DATA][17] ));
   HS65_LS_IVX9 U512 (.Z(n60), 
	.A(\chs_in_f[3][DATA][18] ));
   HS65_LS_IVX9 U513 (.Z(n59), 
	.A(\chs_in_f[3][DATA][19] ));
   HS65_LS_IVX9 U514 (.Z(n58), 
	.A(\chs_in_f[3][DATA][20] ));
   HS65_LS_IVX9 U515 (.Z(n57), 
	.A(\chs_in_f[3][DATA][21] ));
   HS65_LS_IVX9 U516 (.Z(n56), 
	.A(\chs_in_f[3][DATA][22] ));
   HS65_LS_IVX9 U517 (.Z(n55), 
	.A(\chs_in_f[3][DATA][23] ));
   HS65_LS_IVX9 U518 (.Z(n54), 
	.A(\chs_in_f[3][DATA][24] ));
   HS65_LS_IVX9 U519 (.Z(n53), 
	.A(\chs_in_f[3][DATA][25] ));
   HS65_LS_IVX9 U520 (.Z(n52), 
	.A(\chs_in_f[3][DATA][26] ));
   HS65_LS_IVX9 U521 (.Z(n51), 
	.A(\chs_in_f[3][DATA][27] ));
   HS65_LS_IVX9 U522 (.Z(n50), 
	.A(\chs_in_f[3][DATA][28] ));
   HS65_LS_IVX9 U523 (.Z(n49), 
	.A(\chs_in_f[3][DATA][29] ));
   HS65_LS_IVX9 U524 (.Z(n48), 
	.A(\chs_in_f[3][DATA][30] ));
   HS65_LS_IVX9 U525 (.Z(n47), 
	.A(\chs_in_f[3][DATA][31] ));
   HS65_LS_IVX9 U526 (.Z(n46), 
	.A(\chs_in_f[3][DATA][32] ));
   HS65_LS_IVX9 U527 (.Z(n45), 
	.A(\chs_in_f[3][DATA][33] ));
   HS65_LS_IVX9 U528 (.Z(n35), 
	.A(\chs_in_f[4][DATA][9] ));
   HS65_LS_IVX9 U529 (.Z(n44), 
	.A(\chs_in_f[4][DATA][0] ));
   HS65_LS_IVX9 U530 (.Z(n42), 
	.A(\chs_in_f[4][DATA][2] ));
   HS65_LS_IVX9 U531 (.Z(n41), 
	.A(\chs_in_f[4][DATA][3] ));
   HS65_LS_IVX9 U532 (.Z(n40), 
	.A(\chs_in_f[4][DATA][4] ));
   HS65_LS_IVX9 U533 (.Z(n39), 
	.A(\chs_in_f[4][DATA][5] ));
   HS65_LS_IVX9 U534 (.Z(n38), 
	.A(\chs_in_f[4][DATA][6] ));
   HS65_LS_IVX9 U535 (.Z(n37), 
	.A(\chs_in_f[4][DATA][7] ));
   HS65_LS_IVX9 U536 (.Z(n36), 
	.A(\chs_in_f[4][DATA][8] ));
   HS65_LS_IVX9 U537 (.Z(n34), 
	.A(\chs_in_f[4][DATA][10] ));
   HS65_LS_IVX9 U538 (.Z(n33), 
	.A(\chs_in_f[4][DATA][11] ));
   HS65_LS_IVX9 U539 (.Z(n32), 
	.A(\chs_in_f[4][DATA][12] ));
   HS65_LS_IVX9 U540 (.Z(n31), 
	.A(\chs_in_f[4][DATA][13] ));
   HS65_LS_IVX9 U541 (.Z(n30), 
	.A(\chs_in_f[4][DATA][14] ));
   HS65_LS_IVX9 U542 (.Z(n29), 
	.A(\chs_in_f[4][DATA][15] ));
   HS65_LS_IVX9 U543 (.Z(n28), 
	.A(\chs_in_f[4][DATA][16] ));
   HS65_LS_IVX9 U544 (.Z(n27), 
	.A(\chs_in_f[4][DATA][17] ));
   HS65_LS_IVX9 U545 (.Z(n26), 
	.A(\chs_in_f[4][DATA][18] ));
   HS65_LS_IVX9 U546 (.Z(n25), 
	.A(\chs_in_f[4][DATA][19] ));
   HS65_LS_IVX9 U547 (.Z(n24), 
	.A(\chs_in_f[4][DATA][20] ));
   HS65_LS_IVX9 U548 (.Z(n23), 
	.A(\chs_in_f[4][DATA][21] ));
   HS65_LS_IVX9 U549 (.Z(n22), 
	.A(\chs_in_f[4][DATA][22] ));
   HS65_LS_IVX9 U550 (.Z(n21), 
	.A(\chs_in_f[4][DATA][23] ));
   HS65_LS_IVX9 U551 (.Z(n20), 
	.A(\chs_in_f[4][DATA][24] ));
   HS65_LS_IVX9 U552 (.Z(n19), 
	.A(\chs_in_f[4][DATA][25] ));
   HS65_LS_IVX9 U553 (.Z(n18), 
	.A(\chs_in_f[4][DATA][26] ));
   HS65_LS_IVX9 U554 (.Z(n17), 
	.A(\chs_in_f[4][DATA][27] ));
   HS65_LS_IVX9 U555 (.Z(n16), 
	.A(\chs_in_f[4][DATA][28] ));
   HS65_LS_IVX9 U556 (.Z(n15), 
	.A(\chs_in_f[4][DATA][29] ));
   HS65_LS_IVX9 U557 (.Z(n14), 
	.A(\chs_in_f[4][DATA][30] ));
   HS65_LS_IVX9 U558 (.Z(n13), 
	.A(\chs_in_f[4][DATA][31] ));
   HS65_LS_IVX9 U559 (.Z(n12), 
	.A(\chs_in_f[4][DATA][32] ));
   HS65_LS_IVX9 U560 (.Z(n11), 
	.A(\chs_in_f[4][DATA][33] ));
   HS65_LS_IVX9 U561 (.Z(n77), 
	.A(\chs_in_f[3][DATA][1] ));
   HS65_LS_IVX9 U562 (.Z(n43), 
	.A(\chs_in_f[4][DATA][1] ));
   HS65_LS_IVX9 U563 (.Z(n2), 
	.A(\switch_sel[4][3] ));
   HS65_LS_IVX9 U564 (.Z(n7), 
	.A(\switch_sel[3][3] ));
   HS65_LS_IVX9 U565 (.Z(n3), 
	.A(\switch_sel[4][2] ));
   HS65_LS_IVX9 U566 (.Z(n8), 
	.A(\switch_sel[3][2] ));
   HS65_LS_IVX9 U567 (.Z(n4), 
	.A(\switch_sel[4][1] ));
   HS65_LS_IVX9 U568 (.Z(n9), 
	.A(\switch_sel[3][1] ));
   HS65_LS_IVX9 U569 (.Z(n5), 
	.A(\switch_sel[4][0] ));
   HS65_LS_IVX9 U570 (.Z(n10), 
	.A(\switch_sel[3][0] ));
   HS65_LS_IVX9 U571 (.Z(n6), 
	.A(\switch_sel[3][4] ));
   HS65_LS_IVX9 U572 (.Z(n1), 
	.A(\switch_sel[4][4] ));
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

   HS65_LS_AND2X27 C8 (.Z(q), 
	.B(N1), 
	.A(n2));
   HS65_LS_IVX9 U1 (.Z(n2), 
	.A(r));
   HS65_LS_IVX9 U2 (.Z(N1), 
	.A(qn));
   HS65_LS_NOR2X6 U3 (.Z(qn), 
	.B(q), 
	.A(s));
endmodule

module c_gate_1_0 (
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

   sr_latch_1_0 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_NOR3X4 U3 (.Z(reset), 
	.C(b), 
	.B(preset), 
	.A(a));
   HS65_LS_AO12X9 U4 (.Z(set), 
	.C(preset), 
	.B(b), 
	.A(a));
endmodule

module latch_controller_0_0 (
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
   wire n2;

   assign Rout = Aout ;

   c_gate_1_0 gate (.preset(preset), 
	.a(n2), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 U1 (.Z(lt_en), 
	.A(Aout));
   HS65_LS_IVX9 U2 (.Z(n2), 
	.A(Ain));
endmodule

module channel_latch_0_000000000_0 (
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
   wire n1;
   wire n2;

   latch_controller_0_0 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHRQX9 \data_reg[33]  (.RN(n2), 
	.Q(\right_out[DATA][33] ), 
	.G(lt_en), 
	.D(\left_in[DATA][33] ));
   HS65_LS_LDHRQX9 \data_reg[32]  (.RN(n1), 
	.Q(\right_out[DATA][32] ), 
	.G(lt_en), 
	.D(\left_in[DATA][32] ));
   HS65_LS_LDHRQX9 \data_reg[31]  (.RN(n2), 
	.Q(\right_out[DATA][31] ), 
	.G(lt_en), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHRQX9 \data_reg[30]  (.RN(n1), 
	.Q(\right_out[DATA][30] ), 
	.G(lt_en), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHRQX9 \data_reg[29]  (.RN(n2), 
	.Q(\right_out[DATA][29] ), 
	.G(lt_en), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHRQX9 \data_reg[28]  (.RN(n1), 
	.Q(\right_out[DATA][28] ), 
	.G(lt_en), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHRQX9 \data_reg[27]  (.RN(n2), 
	.Q(\right_out[DATA][27] ), 
	.G(lt_en), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHRQX9 \data_reg[26]  (.RN(n1), 
	.Q(\right_out[DATA][26] ), 
	.G(lt_en), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHRQX9 \data_reg[25]  (.RN(n2), 
	.Q(\right_out[DATA][25] ), 
	.G(lt_en), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHRQX9 \data_reg[24]  (.RN(n1), 
	.Q(\right_out[DATA][24] ), 
	.G(lt_en), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHRQX9 \data_reg[23]  (.RN(n2), 
	.Q(\right_out[DATA][23] ), 
	.G(lt_en), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHRQX9 \data_reg[22]  (.RN(n2), 
	.Q(\right_out[DATA][22] ), 
	.G(lt_en), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHRQX9 \data_reg[21]  (.RN(n2), 
	.Q(\right_out[DATA][21] ), 
	.G(lt_en), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHRQX9 \data_reg[20]  (.RN(n2), 
	.Q(\right_out[DATA][20] ), 
	.G(lt_en), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHRQX9 \data_reg[19]  (.RN(n2), 
	.Q(\right_out[DATA][19] ), 
	.G(lt_en), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHRQX9 \data_reg[18]  (.RN(n2), 
	.Q(\right_out[DATA][18] ), 
	.G(lt_en), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHRQX9 \data_reg[17]  (.RN(n2), 
	.Q(\right_out[DATA][17] ), 
	.G(lt_en), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHRQX9 \data_reg[16]  (.RN(n2), 
	.Q(\right_out[DATA][16] ), 
	.G(lt_en), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHRQX9 \data_reg[15]  (.RN(n2), 
	.Q(\right_out[DATA][15] ), 
	.G(lt_en), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHRQX9 \data_reg[14]  (.RN(n2), 
	.Q(\right_out[DATA][14] ), 
	.G(lt_en), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHRQX9 \data_reg[13]  (.RN(n2), 
	.Q(\right_out[DATA][13] ), 
	.G(lt_en), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHRQX9 \data_reg[12]  (.RN(n2), 
	.Q(\right_out[DATA][12] ), 
	.G(lt_en), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHRQX9 \data_reg[11]  (.RN(n1), 
	.Q(\right_out[DATA][11] ), 
	.G(lt_en), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHRQX9 \data_reg[10]  (.RN(n1), 
	.Q(\right_out[DATA][10] ), 
	.G(lt_en), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHRQX9 \data_reg[9]  (.RN(n1), 
	.Q(\right_out[DATA][9] ), 
	.G(lt_en), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHRQX9 \data_reg[8]  (.RN(n1), 
	.Q(\right_out[DATA][8] ), 
	.G(lt_en), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHRQX9 \data_reg[7]  (.RN(n1), 
	.Q(\right_out[DATA][7] ), 
	.G(lt_en), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHRQX9 \data_reg[6]  (.RN(n1), 
	.Q(\right_out[DATA][6] ), 
	.G(lt_en), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHRQX9 \data_reg[5]  (.RN(n1), 
	.Q(\right_out[DATA][5] ), 
	.G(lt_en), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHRQX9 \data_reg[4]  (.RN(n1), 
	.Q(\right_out[DATA][4] ), 
	.G(lt_en), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHRQX9 \data_reg[3]  (.RN(n1), 
	.Q(\right_out[DATA][3] ), 
	.G(lt_en), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHRQX9 \data_reg[2]  (.RN(n1), 
	.Q(\right_out[DATA][2] ), 
	.G(lt_en), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHRQX9 \data_reg[1]  (.RN(n1), 
	.Q(\right_out[DATA][1] ), 
	.G(lt_en), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHRQX9 \data_reg[0]  (.RN(n1), 
	.Q(\right_out[DATA][0] ), 
	.G(lt_en), 
	.D(\left_in[DATA][0] ));
   HS65_LS_CNIVX103 U4 (.Z(n1), 
	.A(preset));
   HS65_LS_CNIVX124 U6 (.Z(n2), 
	.A(preset));
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

module c_gate_1_1 (
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

   sr_latch_1_1 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_NOR3X4 U3 (.Z(reset), 
	.C(b), 
	.B(preset), 
	.A(a));
   HS65_LS_AO12X9 U4 (.Z(set), 
	.C(preset), 
	.B(b), 
	.A(a));
endmodule

module latch_controller_0_1 (
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
   wire n1;

   assign Rout = Aout ;

   c_gate_1_1 gate (.preset(preset), 
	.a(n1), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 U1 (.Z(lt_en), 
	.A(Aout));
   HS65_LS_IVX9 U2 (.Z(n1), 
	.A(Ain));
endmodule

module channel_latch_0_000000000_1 (
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
   wire n1;
   wire n2;

   latch_controller_0_1 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHRQX9 \data_reg[33]  (.RN(n2), 
	.Q(\right_out[DATA][33] ), 
	.G(lt_en), 
	.D(\left_in[DATA][33] ));
   HS65_LS_LDHRQX9 \data_reg[32]  (.RN(n1), 
	.Q(\right_out[DATA][32] ), 
	.G(lt_en), 
	.D(\left_in[DATA][32] ));
   HS65_LS_LDHRQX9 \data_reg[31]  (.RN(n2), 
	.Q(\right_out[DATA][31] ), 
	.G(lt_en), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHRQX9 \data_reg[30]  (.RN(n1), 
	.Q(\right_out[DATA][30] ), 
	.G(lt_en), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHRQX9 \data_reg[29]  (.RN(n2), 
	.Q(\right_out[DATA][29] ), 
	.G(lt_en), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHRQX9 \data_reg[28]  (.RN(n1), 
	.Q(\right_out[DATA][28] ), 
	.G(lt_en), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHRQX9 \data_reg[27]  (.RN(n2), 
	.Q(\right_out[DATA][27] ), 
	.G(lt_en), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHRQX9 \data_reg[26]  (.RN(n1), 
	.Q(\right_out[DATA][26] ), 
	.G(lt_en), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHRQX9 \data_reg[25]  (.RN(n2), 
	.Q(\right_out[DATA][25] ), 
	.G(lt_en), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHRQX9 \data_reg[24]  (.RN(n1), 
	.Q(\right_out[DATA][24] ), 
	.G(lt_en), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHRQX9 \data_reg[23]  (.RN(n2), 
	.Q(\right_out[DATA][23] ), 
	.G(lt_en), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHRQX9 \data_reg[22]  (.RN(n2), 
	.Q(\right_out[DATA][22] ), 
	.G(lt_en), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHRQX9 \data_reg[21]  (.RN(n2), 
	.Q(\right_out[DATA][21] ), 
	.G(lt_en), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHRQX9 \data_reg[20]  (.RN(n2), 
	.Q(\right_out[DATA][20] ), 
	.G(lt_en), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHRQX9 \data_reg[19]  (.RN(n2), 
	.Q(\right_out[DATA][19] ), 
	.G(lt_en), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHRQX9 \data_reg[18]  (.RN(n2), 
	.Q(\right_out[DATA][18] ), 
	.G(lt_en), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHRQX9 \data_reg[17]  (.RN(n2), 
	.Q(\right_out[DATA][17] ), 
	.G(lt_en), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHRQX9 \data_reg[16]  (.RN(n2), 
	.Q(\right_out[DATA][16] ), 
	.G(lt_en), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHRQX9 \data_reg[15]  (.RN(n2), 
	.Q(\right_out[DATA][15] ), 
	.G(lt_en), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHRQX9 \data_reg[14]  (.RN(n2), 
	.Q(\right_out[DATA][14] ), 
	.G(lt_en), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHRQX9 \data_reg[13]  (.RN(n2), 
	.Q(\right_out[DATA][13] ), 
	.G(lt_en), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHRQX9 \data_reg[12]  (.RN(n2), 
	.Q(\right_out[DATA][12] ), 
	.G(lt_en), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHRQX9 \data_reg[11]  (.RN(n1), 
	.Q(\right_out[DATA][11] ), 
	.G(lt_en), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHRQX9 \data_reg[10]  (.RN(n1), 
	.Q(\right_out[DATA][10] ), 
	.G(lt_en), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHRQX9 \data_reg[9]  (.RN(n1), 
	.Q(\right_out[DATA][9] ), 
	.G(lt_en), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHRQX9 \data_reg[8]  (.RN(n1), 
	.Q(\right_out[DATA][8] ), 
	.G(lt_en), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHRQX9 \data_reg[7]  (.RN(n1), 
	.Q(\right_out[DATA][7] ), 
	.G(lt_en), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHRQX9 \data_reg[6]  (.RN(n1), 
	.Q(\right_out[DATA][6] ), 
	.G(lt_en), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHRQX9 \data_reg[5]  (.RN(n1), 
	.Q(\right_out[DATA][5] ), 
	.G(lt_en), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHRQX9 \data_reg[4]  (.RN(n1), 
	.Q(\right_out[DATA][4] ), 
	.G(lt_en), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHRQX9 \data_reg[3]  (.RN(n1), 
	.Q(\right_out[DATA][3] ), 
	.G(lt_en), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHRQX9 \data_reg[2]  (.RN(n1), 
	.Q(\right_out[DATA][2] ), 
	.G(lt_en), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHRQX9 \data_reg[1]  (.RN(n1), 
	.Q(\right_out[DATA][1] ), 
	.G(lt_en), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHRQX9 \data_reg[0]  (.RN(n1), 
	.Q(\right_out[DATA][0] ), 
	.G(lt_en), 
	.D(\left_in[DATA][0] ));
   HS65_LS_CNIVX103 U4 (.Z(n1), 
	.A(preset));
   HS65_LS_CNIVX103 U6 (.Z(n2), 
	.A(preset));
endmodule

module sr_latch_1_2 (
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

module c_gate_1_2 (
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

   sr_latch_1_2 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_NOR3X4 U3 (.Z(reset), 
	.C(b), 
	.B(preset), 
	.A(a));
   HS65_LS_AO12X9 U4 (.Z(set), 
	.C(preset), 
	.B(b), 
	.A(a));
endmodule

module latch_controller_0_2 (
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
   wire n1;

   assign Rout = Aout ;

   c_gate_1_2 gate (.preset(preset), 
	.a(n1), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 U1 (.Z(lt_en), 
	.A(Aout));
   HS65_LS_IVX9 U2 (.Z(n1), 
	.A(Ain));
endmodule

module channel_latch_0_000000000_2 (
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
   wire n1;
   wire n2;

   latch_controller_0_2 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHRQX9 \data_reg[33]  (.RN(n2), 
	.Q(\right_out[DATA][33] ), 
	.G(lt_en), 
	.D(\left_in[DATA][33] ));
   HS65_LS_LDHRQX9 \data_reg[32]  (.RN(n1), 
	.Q(\right_out[DATA][32] ), 
	.G(lt_en), 
	.D(\left_in[DATA][32] ));
   HS65_LS_LDHRQX9 \data_reg[31]  (.RN(n2), 
	.Q(\right_out[DATA][31] ), 
	.G(lt_en), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHRQX9 \data_reg[30]  (.RN(n1), 
	.Q(\right_out[DATA][30] ), 
	.G(lt_en), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHRQX9 \data_reg[29]  (.RN(n2), 
	.Q(\right_out[DATA][29] ), 
	.G(lt_en), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHRQX9 \data_reg[28]  (.RN(n1), 
	.Q(\right_out[DATA][28] ), 
	.G(lt_en), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHRQX9 \data_reg[27]  (.RN(n2), 
	.Q(\right_out[DATA][27] ), 
	.G(lt_en), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHRQX9 \data_reg[26]  (.RN(n1), 
	.Q(\right_out[DATA][26] ), 
	.G(lt_en), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHRQX9 \data_reg[25]  (.RN(n2), 
	.Q(\right_out[DATA][25] ), 
	.G(lt_en), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHRQX9 \data_reg[24]  (.RN(n1), 
	.Q(\right_out[DATA][24] ), 
	.G(lt_en), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHRQX9 \data_reg[23]  (.RN(n2), 
	.Q(\right_out[DATA][23] ), 
	.G(lt_en), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHRQX9 \data_reg[22]  (.RN(n2), 
	.Q(\right_out[DATA][22] ), 
	.G(lt_en), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHRQX9 \data_reg[21]  (.RN(n2), 
	.Q(\right_out[DATA][21] ), 
	.G(lt_en), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHRQX9 \data_reg[20]  (.RN(n2), 
	.Q(\right_out[DATA][20] ), 
	.G(lt_en), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHRQX9 \data_reg[19]  (.RN(n2), 
	.Q(\right_out[DATA][19] ), 
	.G(lt_en), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHRQX9 \data_reg[18]  (.RN(n2), 
	.Q(\right_out[DATA][18] ), 
	.G(lt_en), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHRQX9 \data_reg[17]  (.RN(n2), 
	.Q(\right_out[DATA][17] ), 
	.G(lt_en), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHRQX9 \data_reg[16]  (.RN(n2), 
	.Q(\right_out[DATA][16] ), 
	.G(lt_en), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHRQX9 \data_reg[15]  (.RN(n2), 
	.Q(\right_out[DATA][15] ), 
	.G(lt_en), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHRQX9 \data_reg[14]  (.RN(n2), 
	.Q(\right_out[DATA][14] ), 
	.G(lt_en), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHRQX9 \data_reg[13]  (.RN(n2), 
	.Q(\right_out[DATA][13] ), 
	.G(lt_en), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHRQX9 \data_reg[12]  (.RN(n2), 
	.Q(\right_out[DATA][12] ), 
	.G(lt_en), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHRQX9 \data_reg[11]  (.RN(n1), 
	.Q(\right_out[DATA][11] ), 
	.G(lt_en), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHRQX9 \data_reg[10]  (.RN(n1), 
	.Q(\right_out[DATA][10] ), 
	.G(lt_en), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHRQX9 \data_reg[9]  (.RN(n1), 
	.Q(\right_out[DATA][9] ), 
	.G(lt_en), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHRQX9 \data_reg[8]  (.RN(n1), 
	.Q(\right_out[DATA][8] ), 
	.G(lt_en), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHRQX9 \data_reg[7]  (.RN(n1), 
	.Q(\right_out[DATA][7] ), 
	.G(lt_en), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHRQX9 \data_reg[6]  (.RN(n1), 
	.Q(\right_out[DATA][6] ), 
	.G(lt_en), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHRQX9 \data_reg[5]  (.RN(n1), 
	.Q(\right_out[DATA][5] ), 
	.G(lt_en), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHRQX9 \data_reg[4]  (.RN(n1), 
	.Q(\right_out[DATA][4] ), 
	.G(lt_en), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHRQX9 \data_reg[3]  (.RN(n1), 
	.Q(\right_out[DATA][3] ), 
	.G(lt_en), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHRQX9 \data_reg[2]  (.RN(n1), 
	.Q(\right_out[DATA][2] ), 
	.G(lt_en), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHRQX9 \data_reg[1]  (.RN(n1), 
	.Q(\right_out[DATA][1] ), 
	.G(lt_en), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHRQX9 \data_reg[0]  (.RN(n1), 
	.Q(\right_out[DATA][0] ), 
	.G(lt_en), 
	.D(\left_in[DATA][0] ));
   HS65_LS_CNIVX103 U4 (.Z(n1), 
	.A(preset));
   HS65_LS_CNIVX103 U6 (.Z(n2), 
	.A(preset));
endmodule

module sr_latch_1_3 (
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

module c_gate_1_3 (
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

   sr_latch_1_3 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_NOR3X4 U3 (.Z(reset), 
	.C(b), 
	.B(preset), 
	.A(a));
   HS65_LS_AO12X9 U4 (.Z(set), 
	.C(preset), 
	.B(b), 
	.A(a));
endmodule

module latch_controller_0_3 (
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
   wire n1;

   assign Rout = Aout ;

   c_gate_1_3 gate (.preset(preset), 
	.a(n1), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 U1 (.Z(lt_en), 
	.A(Aout));
   HS65_LS_IVX9 U2 (.Z(n1), 
	.A(Ain));
endmodule

module channel_latch_0_000000000_3 (
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
   wire n1;
   wire n2;

   latch_controller_0_3 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHRQX9 \data_reg[33]  (.RN(n2), 
	.Q(\right_out[DATA][33] ), 
	.G(lt_en), 
	.D(\left_in[DATA][33] ));
   HS65_LS_LDHRQX9 \data_reg[32]  (.RN(n1), 
	.Q(\right_out[DATA][32] ), 
	.G(lt_en), 
	.D(\left_in[DATA][32] ));
   HS65_LS_LDHRQX9 \data_reg[31]  (.RN(n2), 
	.Q(\right_out[DATA][31] ), 
	.G(lt_en), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHRQX9 \data_reg[30]  (.RN(n1), 
	.Q(\right_out[DATA][30] ), 
	.G(lt_en), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHRQX9 \data_reg[29]  (.RN(n2), 
	.Q(\right_out[DATA][29] ), 
	.G(lt_en), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHRQX9 \data_reg[28]  (.RN(n1), 
	.Q(\right_out[DATA][28] ), 
	.G(lt_en), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHRQX9 \data_reg[27]  (.RN(n2), 
	.Q(\right_out[DATA][27] ), 
	.G(lt_en), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHRQX9 \data_reg[26]  (.RN(n1), 
	.Q(\right_out[DATA][26] ), 
	.G(lt_en), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHRQX9 \data_reg[25]  (.RN(n2), 
	.Q(\right_out[DATA][25] ), 
	.G(lt_en), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHRQX9 \data_reg[24]  (.RN(n1), 
	.Q(\right_out[DATA][24] ), 
	.G(lt_en), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHRQX9 \data_reg[23]  (.RN(n2), 
	.Q(\right_out[DATA][23] ), 
	.G(lt_en), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHRQX9 \data_reg[22]  (.RN(n2), 
	.Q(\right_out[DATA][22] ), 
	.G(lt_en), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHRQX9 \data_reg[21]  (.RN(n2), 
	.Q(\right_out[DATA][21] ), 
	.G(lt_en), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHRQX9 \data_reg[20]  (.RN(n2), 
	.Q(\right_out[DATA][20] ), 
	.G(lt_en), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHRQX9 \data_reg[19]  (.RN(n2), 
	.Q(\right_out[DATA][19] ), 
	.G(lt_en), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHRQX9 \data_reg[18]  (.RN(n2), 
	.Q(\right_out[DATA][18] ), 
	.G(lt_en), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHRQX9 \data_reg[17]  (.RN(n2), 
	.Q(\right_out[DATA][17] ), 
	.G(lt_en), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHRQX9 \data_reg[16]  (.RN(n2), 
	.Q(\right_out[DATA][16] ), 
	.G(lt_en), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHRQX9 \data_reg[15]  (.RN(n2), 
	.Q(\right_out[DATA][15] ), 
	.G(lt_en), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHRQX9 \data_reg[14]  (.RN(n2), 
	.Q(\right_out[DATA][14] ), 
	.G(lt_en), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHRQX9 \data_reg[13]  (.RN(n2), 
	.Q(\right_out[DATA][13] ), 
	.G(lt_en), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHRQX9 \data_reg[12]  (.RN(n2), 
	.Q(\right_out[DATA][12] ), 
	.G(lt_en), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHRQX9 \data_reg[11]  (.RN(n1), 
	.Q(\right_out[DATA][11] ), 
	.G(lt_en), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHRQX9 \data_reg[10]  (.RN(n1), 
	.Q(\right_out[DATA][10] ), 
	.G(lt_en), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHRQX9 \data_reg[9]  (.RN(n1), 
	.Q(\right_out[DATA][9] ), 
	.G(lt_en), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHRQX9 \data_reg[8]  (.RN(n1), 
	.Q(\right_out[DATA][8] ), 
	.G(lt_en), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHRQX9 \data_reg[7]  (.RN(n1), 
	.Q(\right_out[DATA][7] ), 
	.G(lt_en), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHRQX9 \data_reg[6]  (.RN(n1), 
	.Q(\right_out[DATA][6] ), 
	.G(lt_en), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHRQX9 \data_reg[5]  (.RN(n1), 
	.Q(\right_out[DATA][5] ), 
	.G(lt_en), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHRQX9 \data_reg[4]  (.RN(n1), 
	.Q(\right_out[DATA][4] ), 
	.G(lt_en), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHRQX9 \data_reg[3]  (.RN(n1), 
	.Q(\right_out[DATA][3] ), 
	.G(lt_en), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHRQX9 \data_reg[2]  (.RN(n1), 
	.Q(\right_out[DATA][2] ), 
	.G(lt_en), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHRQX9 \data_reg[1]  (.RN(n1), 
	.Q(\right_out[DATA][1] ), 
	.G(lt_en), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHRQX9 \data_reg[0]  (.RN(n1), 
	.Q(\right_out[DATA][0] ), 
	.G(lt_en), 
	.D(\left_in[DATA][0] ));
   HS65_LS_CNIVX103 U4 (.Z(n1), 
	.A(preset));
   HS65_LS_CNIVX124 U6 (.Z(n2), 
	.A(preset));
endmodule

module sr_latch_1_4 (
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

module c_gate_1_4 (
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

   sr_latch_1_4 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_NOR3X4 U3 (.Z(reset), 
	.C(b), 
	.B(preset), 
	.A(a));
   HS65_LS_AO12X9 U4 (.Z(set), 
	.C(preset), 
	.B(b), 
	.A(a));
endmodule

module latch_controller_0_4 (
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
   wire n1;

   assign Rout = Aout ;

   c_gate_1_4 gate (.preset(preset), 
	.a(n1), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 U1 (.Z(lt_en), 
	.A(Aout));
   HS65_LS_IVX9 U2 (.Z(n1), 
	.A(Ain));
endmodule

module channel_latch_0_000000000_4 (
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
   wire n1;
   wire n2;

   latch_controller_0_4 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHRQX9 \data_reg[33]  (.RN(n2), 
	.Q(\right_out[DATA][33] ), 
	.G(lt_en), 
	.D(\left_in[DATA][33] ));
   HS65_LS_LDHRQX9 \data_reg[32]  (.RN(n1), 
	.Q(\right_out[DATA][32] ), 
	.G(lt_en), 
	.D(\left_in[DATA][32] ));
   HS65_LS_LDHRQX9 \data_reg[31]  (.RN(n2), 
	.Q(\right_out[DATA][31] ), 
	.G(lt_en), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHRQX9 \data_reg[30]  (.RN(n1), 
	.Q(\right_out[DATA][30] ), 
	.G(lt_en), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHRQX9 \data_reg[29]  (.RN(n2), 
	.Q(\right_out[DATA][29] ), 
	.G(lt_en), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHRQX9 \data_reg[28]  (.RN(n1), 
	.Q(\right_out[DATA][28] ), 
	.G(lt_en), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHRQX9 \data_reg[27]  (.RN(n2), 
	.Q(\right_out[DATA][27] ), 
	.G(lt_en), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHRQX9 \data_reg[26]  (.RN(n1), 
	.Q(\right_out[DATA][26] ), 
	.G(lt_en), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHRQX9 \data_reg[25]  (.RN(n2), 
	.Q(\right_out[DATA][25] ), 
	.G(lt_en), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHRQX9 \data_reg[24]  (.RN(n1), 
	.Q(\right_out[DATA][24] ), 
	.G(lt_en), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHRQX9 \data_reg[23]  (.RN(n2), 
	.Q(\right_out[DATA][23] ), 
	.G(lt_en), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHRQX9 \data_reg[22]  (.RN(n2), 
	.Q(\right_out[DATA][22] ), 
	.G(lt_en), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHRQX9 \data_reg[21]  (.RN(n2), 
	.Q(\right_out[DATA][21] ), 
	.G(lt_en), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHRQX9 \data_reg[20]  (.RN(n2), 
	.Q(\right_out[DATA][20] ), 
	.G(lt_en), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHRQX9 \data_reg[19]  (.RN(n2), 
	.Q(\right_out[DATA][19] ), 
	.G(lt_en), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHRQX9 \data_reg[18]  (.RN(n2), 
	.Q(\right_out[DATA][18] ), 
	.G(lt_en), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHRQX9 \data_reg[17]  (.RN(n2), 
	.Q(\right_out[DATA][17] ), 
	.G(lt_en), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHRQX9 \data_reg[16]  (.RN(n2), 
	.Q(\right_out[DATA][16] ), 
	.G(lt_en), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHRQX9 \data_reg[15]  (.RN(n2), 
	.Q(\right_out[DATA][15] ), 
	.G(lt_en), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHRQX9 \data_reg[14]  (.RN(n2), 
	.Q(\right_out[DATA][14] ), 
	.G(lt_en), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHRQX9 \data_reg[13]  (.RN(n2), 
	.Q(\right_out[DATA][13] ), 
	.G(lt_en), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHRQX9 \data_reg[12]  (.RN(n2), 
	.Q(\right_out[DATA][12] ), 
	.G(lt_en), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHRQX9 \data_reg[11]  (.RN(n1), 
	.Q(\right_out[DATA][11] ), 
	.G(lt_en), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHRQX9 \data_reg[10]  (.RN(n1), 
	.Q(\right_out[DATA][10] ), 
	.G(lt_en), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHRQX9 \data_reg[9]  (.RN(n1), 
	.Q(\right_out[DATA][9] ), 
	.G(lt_en), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHRQX9 \data_reg[8]  (.RN(n1), 
	.Q(\right_out[DATA][8] ), 
	.G(lt_en), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHRQX9 \data_reg[7]  (.RN(n1), 
	.Q(\right_out[DATA][7] ), 
	.G(lt_en), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHRQX9 \data_reg[6]  (.RN(n1), 
	.Q(\right_out[DATA][6] ), 
	.G(lt_en), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHRQX9 \data_reg[5]  (.RN(n1), 
	.Q(\right_out[DATA][5] ), 
	.G(lt_en), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHRQX9 \data_reg[4]  (.RN(n1), 
	.Q(\right_out[DATA][4] ), 
	.G(lt_en), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHRQX9 \data_reg[3]  (.RN(n1), 
	.Q(\right_out[DATA][3] ), 
	.G(lt_en), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHRQX9 \data_reg[2]  (.RN(n1), 
	.Q(\right_out[DATA][2] ), 
	.G(lt_en), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHRQX9 \data_reg[1]  (.RN(n1), 
	.Q(\right_out[DATA][1] ), 
	.G(lt_en), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHRQX9 \data_reg[0]  (.RN(n1), 
	.Q(\right_out[DATA][0] ), 
	.G(lt_en), 
	.D(\left_in[DATA][0] ));
   HS65_LS_CNIVX124 U4 (.Z(n1), 
	.A(preset));
   HS65_LS_CNIVX124 U6 (.Z(n2), 
	.A(preset));
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
	.latches_out_f ( { \latches_out_f[4][REQ] , 
		\latches_out_f[4][DATA][33] , 
		\latches_out_f[4][DATA][32] , 
		\latches_out_f[4][DATA][31] , 
		\latches_out_f[4][DATA][30] , 
		\latches_out_f[4][DATA][29] , 
		\latches_out_f[4][DATA][28] , 
		\latches_out_f[4][DATA][27] , 
		\latches_out_f[4][DATA][26] , 
		\latches_out_f[4][DATA][25] , 
		\latches_out_f[4][DATA][24] , 
		\latches_out_f[4][DATA][23] , 
		\latches_out_f[4][DATA][22] , 
		\latches_out_f[4][DATA][21] , 
		\latches_out_f[4][DATA][20] , 
		\latches_out_f[4][DATA][19] , 
		\latches_out_f[4][DATA][18] , 
		\latches_out_f[4][DATA][17] , 
		\latches_out_f[4][DATA][16] , 
		\latches_out_f[4][DATA][15] , 
		\latches_out_f[4][DATA][14] , 
		\latches_out_f[4][DATA][13] , 
		\latches_out_f[4][DATA][12] , 
		\latches_out_f[4][DATA][11] , 
		\latches_out_f[4][DATA][10] , 
		\latches_out_f[4][DATA][9] , 
		\latches_out_f[4][DATA][8] , 
		\latches_out_f[4][DATA][7] , 
		\latches_out_f[4][DATA][6] , 
		\latches_out_f[4][DATA][5] , 
		\latches_out_f[4][DATA][4] , 
		\latches_out_f[4][DATA][3] , 
		\latches_out_f[4][DATA][2] , 
		\latches_out_f[4][DATA][1] , 
		\latches_out_f[4][DATA][0] , 
		\latches_out_f[3][REQ] , 
		\latches_out_f[3][DATA][33] , 
		\latches_out_f[3][DATA][32] , 
		\latches_out_f[3][DATA][31] , 
		\latches_out_f[3][DATA][30] , 
		\latches_out_f[3][DATA][29] , 
		\latches_out_f[3][DATA][28] , 
		\latches_out_f[3][DATA][27] , 
		\latches_out_f[3][DATA][26] , 
		\latches_out_f[3][DATA][25] , 
		\latches_out_f[3][DATA][24] , 
		\latches_out_f[3][DATA][23] , 
		\latches_out_f[3][DATA][22] , 
		\latches_out_f[3][DATA][21] , 
		\latches_out_f[3][DATA][20] , 
		\latches_out_f[3][DATA][19] , 
		\latches_out_f[3][DATA][18] , 
		\latches_out_f[3][DATA][17] , 
		\latches_out_f[3][DATA][16] , 
		\latches_out_f[3][DATA][15] , 
		\latches_out_f[3][DATA][14] , 
		\latches_out_f[3][DATA][13] , 
		\latches_out_f[3][DATA][12] , 
		\latches_out_f[3][DATA][11] , 
		\latches_out_f[3][DATA][10] , 
		\latches_out_f[3][DATA][9] , 
		\latches_out_f[3][DATA][8] , 
		\latches_out_f[3][DATA][7] , 
		\latches_out_f[3][DATA][6] , 
		\latches_out_f[3][DATA][5] , 
		\latches_out_f[3][DATA][4] , 
		\latches_out_f[3][DATA][3] , 
		\latches_out_f[3][DATA][2] , 
		\latches_out_f[3][DATA][1] , 
		\latches_out_f[3][DATA][0] , 
		\latches_out_f[2][REQ] , 
		\latches_out_f[2][DATA][33] , 
		\latches_out_f[2][DATA][32] , 
		\latches_out_f[2][DATA][31] , 
		\latches_out_f[2][DATA][30] , 
		\latches_out_f[2][DATA][29] , 
		\latches_out_f[2][DATA][28] , 
		\latches_out_f[2][DATA][27] , 
		\latches_out_f[2][DATA][26] , 
		\latches_out_f[2][DATA][25] , 
		\latches_out_f[2][DATA][24] , 
		\latches_out_f[2][DATA][23] , 
		\latches_out_f[2][DATA][22] , 
		\latches_out_f[2][DATA][21] , 
		\latches_out_f[2][DATA][20] , 
		\latches_out_f[2][DATA][19] , 
		\latches_out_f[2][DATA][18] , 
		\latches_out_f[2][DATA][17] , 
		\latches_out_f[2][DATA][16] , 
		\latches_out_f[2][DATA][15] , 
		\latches_out_f[2][DATA][14] , 
		\latches_out_f[2][DATA][13] , 
		\latches_out_f[2][DATA][12] , 
		\latches_out_f[2][DATA][11] , 
		\latches_out_f[2][DATA][10] , 
		\latches_out_f[2][DATA][9] , 
		\latches_out_f[2][DATA][8] , 
		\latches_out_f[2][DATA][7] , 
		\latches_out_f[2][DATA][6] , 
		\latches_out_f[2][DATA][5] , 
		\latches_out_f[2][DATA][4] , 
		\latches_out_f[2][DATA][3] , 
		\latches_out_f[2][DATA][2] , 
		\latches_out_f[2][DATA][1] , 
		\latches_out_f[2][DATA][0] , 
		\latches_out_f[1][REQ] , 
		\latches_out_f[1][DATA][33] , 
		\latches_out_f[1][DATA][32] , 
		\latches_out_f[1][DATA][31] , 
		\latches_out_f[1][DATA][30] , 
		\latches_out_f[1][DATA][29] , 
		\latches_out_f[1][DATA][28] , 
		\latches_out_f[1][DATA][27] , 
		\latches_out_f[1][DATA][26] , 
		\latches_out_f[1][DATA][25] , 
		\latches_out_f[1][DATA][24] , 
		\latches_out_f[1][DATA][23] , 
		\latches_out_f[1][DATA][22] , 
		\latches_out_f[1][DATA][21] , 
		\latches_out_f[1][DATA][20] , 
		\latches_out_f[1][DATA][19] , 
		\latches_out_f[1][DATA][18] , 
		\latches_out_f[1][DATA][17] , 
		\latches_out_f[1][DATA][16] , 
		\latches_out_f[1][DATA][15] , 
		\latches_out_f[1][DATA][14] , 
		\latches_out_f[1][DATA][13] , 
		\latches_out_f[1][DATA][12] , 
		\latches_out_f[1][DATA][11] , 
		\latches_out_f[1][DATA][10] , 
		\latches_out_f[1][DATA][9] , 
		\latches_out_f[1][DATA][8] , 
		\latches_out_f[1][DATA][7] , 
		\latches_out_f[1][DATA][6] , 
		\latches_out_f[1][DATA][5] , 
		\latches_out_f[1][DATA][4] , 
		\latches_out_f[1][DATA][3] , 
		\latches_out_f[1][DATA][2] , 
		\latches_out_f[1][DATA][1] , 
		\latches_out_f[1][DATA][0] , 
		\latches_out_f[0][REQ] , 
		\latches_out_f[0][DATA][33] , 
		\latches_out_f[0][DATA][32] , 
		\latches_out_f[0][DATA][31] , 
		\latches_out_f[0][DATA][30] , 
		\latches_out_f[0][DATA][29] , 
		\latches_out_f[0][DATA][28] , 
		\latches_out_f[0][DATA][27] , 
		\latches_out_f[0][DATA][26] , 
		\latches_out_f[0][DATA][25] , 
		\latches_out_f[0][DATA][24] , 
		\latches_out_f[0][DATA][23] , 
		\latches_out_f[0][DATA][22] , 
		\latches_out_f[0][DATA][21] , 
		\latches_out_f[0][DATA][20] , 
		\latches_out_f[0][DATA][19] , 
		\latches_out_f[0][DATA][18] , 
		\latches_out_f[0][DATA][17] , 
		\latches_out_f[0][DATA][16] , 
		\latches_out_f[0][DATA][15] , 
		\latches_out_f[0][DATA][14] , 
		\latches_out_f[0][DATA][13] , 
		\latches_out_f[0][DATA][12] , 
		\latches_out_f[0][DATA][11] , 
		\latches_out_f[0][DATA][10] , 
		\latches_out_f[0][DATA][9] , 
		\latches_out_f[0][DATA][8] , 
		\latches_out_f[0][DATA][7] , 
		\latches_out_f[0][DATA][6] , 
		\latches_out_f[0][DATA][5] , 
		\latches_out_f[0][DATA][4] , 
		\latches_out_f[0][DATA][3] , 
		\latches_out_f[0][DATA][2] , 
		\latches_out_f[0][DATA][1] , 
		\latches_out_f[0][DATA][0]  } ), 
	.latches_out_b ( { \latches_out_b[4][ACK] , 
		\latches_out_b[3][ACK] , 
		\latches_out_b[2][ACK] , 
		\latches_out_b[1][ACK] , 
		\latches_out_b[0][ACK]  } ));
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
   output \latches_out_f[4][REQ] ;
   output \latches_out_f[4][DATA][33] ;
   output \latches_out_f[4][DATA][32] ;
   output \latches_out_f[4][DATA][31] ;
   output \latches_out_f[4][DATA][30] ;
   output \latches_out_f[4][DATA][29] ;
   output \latches_out_f[4][DATA][28] ;
   output \latches_out_f[4][DATA][27] ;
   output \latches_out_f[4][DATA][26] ;
   output \latches_out_f[4][DATA][25] ;
   output \latches_out_f[4][DATA][24] ;
   output \latches_out_f[4][DATA][23] ;
   output \latches_out_f[4][DATA][22] ;
   output \latches_out_f[4][DATA][21] ;
   output \latches_out_f[4][DATA][20] ;
   output \latches_out_f[4][DATA][19] ;
   output \latches_out_f[4][DATA][18] ;
   output \latches_out_f[4][DATA][17] ;
   output \latches_out_f[4][DATA][16] ;
   output \latches_out_f[4][DATA][15] ;
   output \latches_out_f[4][DATA][14] ;
   output \latches_out_f[4][DATA][13] ;
   output \latches_out_f[4][DATA][12] ;
   output \latches_out_f[4][DATA][11] ;
   output \latches_out_f[4][DATA][10] ;
   output \latches_out_f[4][DATA][9] ;
   output \latches_out_f[4][DATA][8] ;
   output \latches_out_f[4][DATA][7] ;
   output \latches_out_f[4][DATA][6] ;
   output \latches_out_f[4][DATA][5] ;
   output \latches_out_f[4][DATA][4] ;
   output \latches_out_f[4][DATA][3] ;
   output \latches_out_f[4][DATA][2] ;
   output \latches_out_f[4][DATA][1] ;
   output \latches_out_f[4][DATA][0] ;
   output \latches_out_f[3][REQ] ;
   output \latches_out_f[3][DATA][33] ;
   output \latches_out_f[3][DATA][32] ;
   output \latches_out_f[3][DATA][31] ;
   output \latches_out_f[3][DATA][30] ;
   output \latches_out_f[3][DATA][29] ;
   output \latches_out_f[3][DATA][28] ;
   output \latches_out_f[3][DATA][27] ;
   output \latches_out_f[3][DATA][26] ;
   output \latches_out_f[3][DATA][25] ;
   output \latches_out_f[3][DATA][24] ;
   output \latches_out_f[3][DATA][23] ;
   output \latches_out_f[3][DATA][22] ;
   output \latches_out_f[3][DATA][21] ;
   output \latches_out_f[3][DATA][20] ;
   output \latches_out_f[3][DATA][19] ;
   output \latches_out_f[3][DATA][18] ;
   output \latches_out_f[3][DATA][17] ;
   output \latches_out_f[3][DATA][16] ;
   output \latches_out_f[3][DATA][15] ;
   output \latches_out_f[3][DATA][14] ;
   output \latches_out_f[3][DATA][13] ;
   output \latches_out_f[3][DATA][12] ;
   output \latches_out_f[3][DATA][11] ;
   output \latches_out_f[3][DATA][10] ;
   output \latches_out_f[3][DATA][9] ;
   output \latches_out_f[3][DATA][8] ;
   output \latches_out_f[3][DATA][7] ;
   output \latches_out_f[3][DATA][6] ;
   output \latches_out_f[3][DATA][5] ;
   output \latches_out_f[3][DATA][4] ;
   output \latches_out_f[3][DATA][3] ;
   output \latches_out_f[3][DATA][2] ;
   output \latches_out_f[3][DATA][1] ;
   output \latches_out_f[3][DATA][0] ;
   output \latches_out_f[2][REQ] ;
   output \latches_out_f[2][DATA][33] ;
   output \latches_out_f[2][DATA][32] ;
   output \latches_out_f[2][DATA][31] ;
   output \latches_out_f[2][DATA][30] ;
   output \latches_out_f[2][DATA][29] ;
   output \latches_out_f[2][DATA][28] ;
   output \latches_out_f[2][DATA][27] ;
   output \latches_out_f[2][DATA][26] ;
   output \latches_out_f[2][DATA][25] ;
   output \latches_out_f[2][DATA][24] ;
   output \latches_out_f[2][DATA][23] ;
   output \latches_out_f[2][DATA][22] ;
   output \latches_out_f[2][DATA][21] ;
   output \latches_out_f[2][DATA][20] ;
   output \latches_out_f[2][DATA][19] ;
   output \latches_out_f[2][DATA][18] ;
   output \latches_out_f[2][DATA][17] ;
   output \latches_out_f[2][DATA][16] ;
   output \latches_out_f[2][DATA][15] ;
   output \latches_out_f[2][DATA][14] ;
   output \latches_out_f[2][DATA][13] ;
   output \latches_out_f[2][DATA][12] ;
   output \latches_out_f[2][DATA][11] ;
   output \latches_out_f[2][DATA][10] ;
   output \latches_out_f[2][DATA][9] ;
   output \latches_out_f[2][DATA][8] ;
   output \latches_out_f[2][DATA][7] ;
   output \latches_out_f[2][DATA][6] ;
   output \latches_out_f[2][DATA][5] ;
   output \latches_out_f[2][DATA][4] ;
   output \latches_out_f[2][DATA][3] ;
   output \latches_out_f[2][DATA][2] ;
   output \latches_out_f[2][DATA][1] ;
   output \latches_out_f[2][DATA][0] ;
   output \latches_out_f[1][REQ] ;
   output \latches_out_f[1][DATA][33] ;
   output \latches_out_f[1][DATA][32] ;
   output \latches_out_f[1][DATA][31] ;
   output \latches_out_f[1][DATA][30] ;
   output \latches_out_f[1][DATA][29] ;
   output \latches_out_f[1][DATA][28] ;
   output \latches_out_f[1][DATA][27] ;
   output \latches_out_f[1][DATA][26] ;
   output \latches_out_f[1][DATA][25] ;
   output \latches_out_f[1][DATA][24] ;
   output \latches_out_f[1][DATA][23] ;
   output \latches_out_f[1][DATA][22] ;
   output \latches_out_f[1][DATA][21] ;
   output \latches_out_f[1][DATA][20] ;
   output \latches_out_f[1][DATA][19] ;
   output \latches_out_f[1][DATA][18] ;
   output \latches_out_f[1][DATA][17] ;
   output \latches_out_f[1][DATA][16] ;
   output \latches_out_f[1][DATA][15] ;
   output \latches_out_f[1][DATA][14] ;
   output \latches_out_f[1][DATA][13] ;
   output \latches_out_f[1][DATA][12] ;
   output \latches_out_f[1][DATA][11] ;
   output \latches_out_f[1][DATA][10] ;
   output \latches_out_f[1][DATA][9] ;
   output \latches_out_f[1][DATA][8] ;
   output \latches_out_f[1][DATA][7] ;
   output \latches_out_f[1][DATA][6] ;
   output \latches_out_f[1][DATA][5] ;
   output \latches_out_f[1][DATA][4] ;
   output \latches_out_f[1][DATA][3] ;
   output \latches_out_f[1][DATA][2] ;
   output \latches_out_f[1][DATA][1] ;
   output \latches_out_f[1][DATA][0] ;
   output \latches_out_f[0][REQ] ;
   output \latches_out_f[0][DATA][33] ;
   output \latches_out_f[0][DATA][32] ;
   output \latches_out_f[0][DATA][31] ;
   output \latches_out_f[0][DATA][30] ;
   output \latches_out_f[0][DATA][29] ;
   output \latches_out_f[0][DATA][28] ;
   output \latches_out_f[0][DATA][27] ;
   output \latches_out_f[0][DATA][26] ;
   output \latches_out_f[0][DATA][25] ;
   output \latches_out_f[0][DATA][24] ;
   output \latches_out_f[0][DATA][23] ;
   output \latches_out_f[0][DATA][22] ;
   output \latches_out_f[0][DATA][21] ;
   output \latches_out_f[0][DATA][20] ;
   output \latches_out_f[0][DATA][19] ;
   output \latches_out_f[0][DATA][18] ;
   output \latches_out_f[0][DATA][17] ;
   output \latches_out_f[0][DATA][16] ;
   output \latches_out_f[0][DATA][15] ;
   output \latches_out_f[0][DATA][14] ;
   output \latches_out_f[0][DATA][13] ;
   output \latches_out_f[0][DATA][12] ;
   output \latches_out_f[0][DATA][11] ;
   output \latches_out_f[0][DATA][10] ;
   output \latches_out_f[0][DATA][9] ;
   output \latches_out_f[0][DATA][8] ;
   output \latches_out_f[0][DATA][7] ;
   output \latches_out_f[0][DATA][6] ;
   output \latches_out_f[0][DATA][5] ;
   output \latches_out_f[0][DATA][4] ;
   output \latches_out_f[0][DATA][3] ;
   output \latches_out_f[0][DATA][2] ;
   output \latches_out_f[0][DATA][1] ;
   output \latches_out_f[0][DATA][0] ;
   input \latches_out_b[4][ACK] ;
   input \latches_out_b[3][ACK] ;
   input \latches_out_b[2][ACK] ;
   input \latches_out_b[1][ACK] ;
   input \latches_out_b[0][ACK] ;

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

   crossbar_1_0_0 crossbar (.preset(preset), 
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
		\latches_in_b[0][ACK]  }));
   channel_latch_0_000000000_0 ch_latch_4 (.preset(preset), 
	.left_in({ \latches_in_f[4][REQ] ,
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
	.left_out(\latches_in_b[4][ACK] ), 
	.right_out({ \latches_out_f[4][REQ] ,
		\latches_out_f[4][DATA][33] ,
		\latches_out_f[4][DATA][32] ,
		\latches_out_f[4][DATA][31] ,
		\latches_out_f[4][DATA][30] ,
		\latches_out_f[4][DATA][29] ,
		\latches_out_f[4][DATA][28] ,
		\latches_out_f[4][DATA][27] ,
		\latches_out_f[4][DATA][26] ,
		\latches_out_f[4][DATA][25] ,
		\latches_out_f[4][DATA][24] ,
		\latches_out_f[4][DATA][23] ,
		\latches_out_f[4][DATA][22] ,
		\latches_out_f[4][DATA][21] ,
		\latches_out_f[4][DATA][20] ,
		\latches_out_f[4][DATA][19] ,
		\latches_out_f[4][DATA][18] ,
		\latches_out_f[4][DATA][17] ,
		\latches_out_f[4][DATA][16] ,
		\latches_out_f[4][DATA][15] ,
		\latches_out_f[4][DATA][14] ,
		\latches_out_f[4][DATA][13] ,
		\latches_out_f[4][DATA][12] ,
		\latches_out_f[4][DATA][11] ,
		\latches_out_f[4][DATA][10] ,
		\latches_out_f[4][DATA][9] ,
		\latches_out_f[4][DATA][8] ,
		\latches_out_f[4][DATA][7] ,
		\latches_out_f[4][DATA][6] ,
		\latches_out_f[4][DATA][5] ,
		\latches_out_f[4][DATA][4] ,
		\latches_out_f[4][DATA][3] ,
		\latches_out_f[4][DATA][2] ,
		\latches_out_f[4][DATA][1] ,
		\latches_out_f[4][DATA][0]  }), 
	.right_in(\latches_out_b[4][ACK] ));
   channel_latch_0_000000000_4 ch_latch_3 (.preset(preset), 
	.left_in({ \latches_in_f[3][REQ] ,
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
	.left_out(\latches_in_b[3][ACK] ), 
	.right_out({ \latches_out_f[3][REQ] ,
		\latches_out_f[3][DATA][33] ,
		\latches_out_f[3][DATA][32] ,
		\latches_out_f[3][DATA][31] ,
		\latches_out_f[3][DATA][30] ,
		\latches_out_f[3][DATA][29] ,
		\latches_out_f[3][DATA][28] ,
		\latches_out_f[3][DATA][27] ,
		\latches_out_f[3][DATA][26] ,
		\latches_out_f[3][DATA][25] ,
		\latches_out_f[3][DATA][24] ,
		\latches_out_f[3][DATA][23] ,
		\latches_out_f[3][DATA][22] ,
		\latches_out_f[3][DATA][21] ,
		\latches_out_f[3][DATA][20] ,
		\latches_out_f[3][DATA][19] ,
		\latches_out_f[3][DATA][18] ,
		\latches_out_f[3][DATA][17] ,
		\latches_out_f[3][DATA][16] ,
		\latches_out_f[3][DATA][15] ,
		\latches_out_f[3][DATA][14] ,
		\latches_out_f[3][DATA][13] ,
		\latches_out_f[3][DATA][12] ,
		\latches_out_f[3][DATA][11] ,
		\latches_out_f[3][DATA][10] ,
		\latches_out_f[3][DATA][9] ,
		\latches_out_f[3][DATA][8] ,
		\latches_out_f[3][DATA][7] ,
		\latches_out_f[3][DATA][6] ,
		\latches_out_f[3][DATA][5] ,
		\latches_out_f[3][DATA][4] ,
		\latches_out_f[3][DATA][3] ,
		\latches_out_f[3][DATA][2] ,
		\latches_out_f[3][DATA][1] ,
		\latches_out_f[3][DATA][0]  }), 
	.right_in(\latches_out_b[3][ACK] ));
   channel_latch_0_000000000_3 ch_latch_2 (.preset(preset), 
	.left_in({ \latches_in_f[2][REQ] ,
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
	.left_out(\latches_in_b[2][ACK] ), 
	.right_out({ \latches_out_f[2][REQ] ,
		\latches_out_f[2][DATA][33] ,
		\latches_out_f[2][DATA][32] ,
		\latches_out_f[2][DATA][31] ,
		\latches_out_f[2][DATA][30] ,
		\latches_out_f[2][DATA][29] ,
		\latches_out_f[2][DATA][28] ,
		\latches_out_f[2][DATA][27] ,
		\latches_out_f[2][DATA][26] ,
		\latches_out_f[2][DATA][25] ,
		\latches_out_f[2][DATA][24] ,
		\latches_out_f[2][DATA][23] ,
		\latches_out_f[2][DATA][22] ,
		\latches_out_f[2][DATA][21] ,
		\latches_out_f[2][DATA][20] ,
		\latches_out_f[2][DATA][19] ,
		\latches_out_f[2][DATA][18] ,
		\latches_out_f[2][DATA][17] ,
		\latches_out_f[2][DATA][16] ,
		\latches_out_f[2][DATA][15] ,
		\latches_out_f[2][DATA][14] ,
		\latches_out_f[2][DATA][13] ,
		\latches_out_f[2][DATA][12] ,
		\latches_out_f[2][DATA][11] ,
		\latches_out_f[2][DATA][10] ,
		\latches_out_f[2][DATA][9] ,
		\latches_out_f[2][DATA][8] ,
		\latches_out_f[2][DATA][7] ,
		\latches_out_f[2][DATA][6] ,
		\latches_out_f[2][DATA][5] ,
		\latches_out_f[2][DATA][4] ,
		\latches_out_f[2][DATA][3] ,
		\latches_out_f[2][DATA][2] ,
		\latches_out_f[2][DATA][1] ,
		\latches_out_f[2][DATA][0]  }), 
	.right_in(\latches_out_b[2][ACK] ));
   channel_latch_0_000000000_2 ch_latch_1 (.preset(preset), 
	.left_in({ \latches_in_f[1][REQ] ,
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
	.left_out(\latches_in_b[1][ACK] ), 
	.right_out({ \latches_out_f[1][REQ] ,
		\latches_out_f[1][DATA][33] ,
		\latches_out_f[1][DATA][32] ,
		\latches_out_f[1][DATA][31] ,
		\latches_out_f[1][DATA][30] ,
		\latches_out_f[1][DATA][29] ,
		\latches_out_f[1][DATA][28] ,
		\latches_out_f[1][DATA][27] ,
		\latches_out_f[1][DATA][26] ,
		\latches_out_f[1][DATA][25] ,
		\latches_out_f[1][DATA][24] ,
		\latches_out_f[1][DATA][23] ,
		\latches_out_f[1][DATA][22] ,
		\latches_out_f[1][DATA][21] ,
		\latches_out_f[1][DATA][20] ,
		\latches_out_f[1][DATA][19] ,
		\latches_out_f[1][DATA][18] ,
		\latches_out_f[1][DATA][17] ,
		\latches_out_f[1][DATA][16] ,
		\latches_out_f[1][DATA][15] ,
		\latches_out_f[1][DATA][14] ,
		\latches_out_f[1][DATA][13] ,
		\latches_out_f[1][DATA][12] ,
		\latches_out_f[1][DATA][11] ,
		\latches_out_f[1][DATA][10] ,
		\latches_out_f[1][DATA][9] ,
		\latches_out_f[1][DATA][8] ,
		\latches_out_f[1][DATA][7] ,
		\latches_out_f[1][DATA][6] ,
		\latches_out_f[1][DATA][5] ,
		\latches_out_f[1][DATA][4] ,
		\latches_out_f[1][DATA][3] ,
		\latches_out_f[1][DATA][2] ,
		\latches_out_f[1][DATA][1] ,
		\latches_out_f[1][DATA][0]  }), 
	.right_in(\latches_out_b[1][ACK] ));
   channel_latch_0_000000000_1 ch_latch_0 (.preset(preset), 
	.left_in({ \latches_in_f[0][REQ] ,
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
	.left_out(\latches_in_b[0][ACK] ), 
	.right_out({ \latches_out_f[0][REQ] ,
		\latches_out_f[0][DATA][33] ,
		\latches_out_f[0][DATA][32] ,
		\latches_out_f[0][DATA][31] ,
		\latches_out_f[0][DATA][30] ,
		\latches_out_f[0][DATA][29] ,
		\latches_out_f[0][DATA][28] ,
		\latches_out_f[0][DATA][27] ,
		\latches_out_f[0][DATA][26] ,
		\latches_out_f[0][DATA][25] ,
		\latches_out_f[0][DATA][24] ,
		\latches_out_f[0][DATA][23] ,
		\latches_out_f[0][DATA][22] ,
		\latches_out_f[0][DATA][21] ,
		\latches_out_f[0][DATA][20] ,
		\latches_out_f[0][DATA][19] ,
		\latches_out_f[0][DATA][18] ,
		\latches_out_f[0][DATA][17] ,
		\latches_out_f[0][DATA][16] ,
		\latches_out_f[0][DATA][15] ,
		\latches_out_f[0][DATA][14] ,
		\latches_out_f[0][DATA][13] ,
		\latches_out_f[0][DATA][12] ,
		\latches_out_f[0][DATA][11] ,
		\latches_out_f[0][DATA][10] ,
		\latches_out_f[0][DATA][9] ,
		\latches_out_f[0][DATA][8] ,
		\latches_out_f[0][DATA][7] ,
		\latches_out_f[0][DATA][6] ,
		\latches_out_f[0][DATA][5] ,
		\latches_out_f[0][DATA][4] ,
		\latches_out_f[0][DATA][3] ,
		\latches_out_f[0][DATA][2] ,
		\latches_out_f[0][DATA][1] ,
		\latches_out_f[0][DATA][0]  }), 
	.right_in(\latches_out_b[0][ACK] ));
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

   sr_latch_0_8 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_IVX9 U3 (.Z(n1), 
	.A(preset));
   HS65_LS_OAI21X3 U4 (.Z(reset), 
	.C(n1), 
	.B(a), 
	.A(b));
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
   wire N0;
   wire n2;

   assign Rout = Aout ;
   assign lt_en = N0 ;

   c_gate_0_6 gate (.preset(preset), 
	.a(n2), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 U1 (.Z(n2), 
	.A(Ain));
   HS65_LS_IVX9 U2 (.Z(N0), 
	.A(Aout));
endmodule

module channel_latch_1_xxxxxxxxx_6 (
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
   wire FE_OFN35_N3;
   wire lt_en;
   wire N3;

   HS65_LS_BFX7 FE_OFC35_N3 (.Z(FE_OFN35_N3), 
	.A(N3));
   latch_controller_1_6 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX18 \data_reg[33]  (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(\left_in[DATA][33] ));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(FE_OFN35_N3), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(FE_OFN35_N3), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(FE_OFN35_N3), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(FE_OFN35_N3), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(FE_OFN35_N3), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(FE_OFN35_N3), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(FE_OFN35_N3), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(FE_OFN35_N3), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(FE_OFN35_N3), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(FE_OFN35_N3), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(FE_OFN35_N3), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(FE_OFN35_N3), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(FE_OFN35_N3), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(FE_OFN35_N3), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(FE_OFN35_N3), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(FE_OFN35_N3), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHQX18 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHQX18 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3), 
	.D(\left_in[DATA][0] ));
   HS65_LS_LDHQX18 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(\left_in[DATA][32] ));
   HS65_LS_OR2X18 U3 (.Z(N3), 
	.B(preset), 
	.A(lt_en));
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

   sr_latch_0_9 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_IVX9 U3 (.Z(n1), 
	.A(preset));
   HS65_LS_OAI21X3 U4 (.Z(reset), 
	.C(n1), 
	.B(a), 
	.A(b));
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
   wire N0;
   wire n2;

   assign Rout = Aout ;
   assign lt_en = N0 ;

   c_gate_0_7 gate (.preset(preset), 
	.a(n2), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 U1 (.Z(n2), 
	.A(Ain));
   HS65_LS_IVX9 U2 (.Z(N0), 
	.A(Aout));
endmodule

module channel_latch_1_xxxxxxxxx_7 (
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
   wire FE_OFN36_N3;
   wire lt_en;
   wire N3;

   HS65_LS_BFX7 FE_OFC36_N3 (.Z(FE_OFN36_N3), 
	.A(N3));
   latch_controller_1_7 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX9 \data_reg[33]  (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(\left_in[DATA][33] ));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(FE_OFN36_N3), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(FE_OFN36_N3), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(FE_OFN36_N3), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(FE_OFN36_N3), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(FE_OFN36_N3), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(FE_OFN36_N3), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(FE_OFN36_N3), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(FE_OFN36_N3), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(FE_OFN36_N3), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(FE_OFN36_N3), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(FE_OFN36_N3), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(FE_OFN36_N3), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(FE_OFN36_N3), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(FE_OFN36_N3), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(FE_OFN36_N3), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(FE_OFN36_N3), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(FE_OFN36_N3), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(FE_OFN36_N3), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(FE_OFN36_N3), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHQX18 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHQX18 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3), 
	.D(\left_in[DATA][0] ));
   HS65_LS_LDHQX18 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(\left_in[DATA][32] ));
   HS65_LS_OR2X9 U3 (.Z(N3), 
	.B(preset), 
	.A(lt_en));
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

   sr_latch_0_10 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_IVX9 U3 (.Z(n1), 
	.A(preset));
   HS65_LS_OAI21X3 U4 (.Z(reset), 
	.C(n1), 
	.B(a), 
	.A(b));
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
   wire N0;
   wire n2;

   assign Rout = Aout ;
   assign lt_en = N0 ;

   c_gate_0_8 gate (.preset(preset), 
	.a(n2), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 U1 (.Z(n2), 
	.A(Ain));
   HS65_LS_IVX9 U2 (.Z(N0), 
	.A(Aout));
endmodule

module channel_latch_1_xxxxxxxxx_8 (
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
   wire FE_OFN37_N3;
   wire lt_en;
   wire N3;

   HS65_LS_BFX7 FE_OFC37_N3 (.Z(FE_OFN37_N3), 
	.A(N3));
   latch_controller_1_8 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX27 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(\left_in[DATA][32] ));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(FE_OFN37_N3), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(FE_OFN37_N3), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(FE_OFN37_N3), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(FE_OFN37_N3), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(FE_OFN37_N3), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(FE_OFN37_N3), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(FE_OFN37_N3), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(FE_OFN37_N3), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(FE_OFN37_N3), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(FE_OFN37_N3), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(FE_OFN37_N3), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(FE_OFN37_N3), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(FE_OFN37_N3), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(FE_OFN37_N3), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(FE_OFN37_N3), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(FE_OFN37_N3), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHQX18 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHQX18 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3), 
	.D(\left_in[DATA][0] ));
   HS65_LS_LDHQX18 \data_reg[33]  (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(\left_in[DATA][33] ));
   HS65_LS_OR2X18 U3 (.Z(N3), 
	.B(preset), 
	.A(lt_en));
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

   sr_latch_0_11 latch (.s(set), 
	.r(reset), 
	.q(c));
   HS65_LS_IVX9 U3 (.Z(n1), 
	.A(preset));
   HS65_LS_OAI21X3 U4 (.Z(reset), 
	.C(n1), 
	.B(a), 
	.A(b));
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
   wire N0;
   wire n2;

   assign Rout = Aout ;
   assign lt_en = N0 ;

   c_gate_0_9 gate (.preset(preset), 
	.a(n2), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 U1 (.Z(n2), 
	.A(Ain));
   HS65_LS_IVX9 U2 (.Z(N0), 
	.A(Aout));
endmodule

module channel_latch_1_xxxxxxxxx_9 (
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
   wire FE_OFN38_N3;
   wire lt_en;
   wire N3;

   HS65_LS_BFX7 FE_OFC38_N3 (.Z(FE_OFN38_N3), 
	.A(N3));
   latch_controller_1_9 controller (.preset(preset), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX18 \data_reg[33]  (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(\left_in[DATA][33] ));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(\left_in[DATA][30] ));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(N3), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHQX18 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3), 
	.D(\left_in[DATA][0] ));
   HS65_LS_LDHQX18 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(\left_in[DATA][1] ));
   HS65_LH_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(FE_OFN38_N3), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHQX9 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(\left_in[DATA][32] ));
   HS65_LS_OR2X18 U3 (.Z(N3), 
	.B(preset), 
	.A(lt_en));
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

   channel_latch_1_xxxxxxxxx_0 north_in_latch (.preset(preset), 
	.left_in({ north_in_f[34],
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
	.left_out(north_in_b_ACK), 
	.right_out({ north_hpu_f[34],
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
	.right_in(north_hpu_b_ACK));
   channel_latch_1_xxxxxxxxx_9 south_in_latch (.preset(preset), 
	.left_in({ south_in_f[34],
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
	.left_out(south_in_b_ACK), 
	.right_out({ south_hpu_f[34],
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
	.right_in(south_hpu_b_ACK));
   channel_latch_1_xxxxxxxxx_8 east_in_latch (.preset(preset), 
	.left_in({ east_in_f[34],
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
	.left_out(east_in_b_ACK), 
	.right_out({ east_hpu_f[34],
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
	.right_in(east_hpu_b_ACK));
   channel_latch_1_xxxxxxxxx_7 west_in_latch (.preset(preset), 
	.left_in({ west_in_f[34],
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
	.left_out(west_in_b_ACK), 
	.right_out({ west_hpu_f[34],
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
	.right_in(west_hpu_b_ACK));
   channel_latch_1_xxxxxxxxx_6 resource_in_latch (.preset(preset), 
	.left_in({ resource_in_f[34],
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
	.left_out(resource_in_b_ACK), 
	.right_out({ resource_hpu_f[34],
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
	.right_in(resource_hpu_b_ACK));
   hpu_0_0 north_hpu (.preset(preset), 
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
   hpu_0_2 south_hpu (.preset(preset), 
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
		switch_sel[10] }));
   hpu_0_1 east_hpu (.preset(preset), 
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
   hpu_0_3 west_hpu (.preset(preset), 
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
   hpu_1_x resource_hpu (.preset(preset), 
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
   crossbar_stage_x0_y0 xbar_with_latches (.preset(preset), 
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
	.latches_out_f({ resource_out_f[34],
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
		north_out_b_ACK }));
endmodule

