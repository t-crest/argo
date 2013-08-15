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

   HS65_LS_AND2X4 C8 (.Z(q), 
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
   wire not_Ain;

   assign Rout = Aout ;

   c_gate_0_0 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 I_0 (.Z(not_Ain), 
	.A(Ain));
   HS65_LSS_XOR2X6 U1 (.Z(lt_en), 
	.B(Ain), 
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
   wire FE_PHN319_preset;
   wire FE_PHN314_preset;
   wire FE_PHN307_preset;
   wire FE_PHN269_preset;
   wire FE_PHN190_N4;
   wire FE_PHN182_north_in_f_32_;
   wire FE_PHN162_north_in_f_25_;
   wire FE_PHN158_north_in_f_27_;
   wire FE_PHN157_north_in_f_23_;
   wire FE_PHN156_north_in_f_29_;
   wire FE_PHN152_north_in_f_21_;
   wire FE_PHN151_north_in_f_17_;
   wire FE_PHN150_north_in_f_15_;
   wire FE_PHN149_north_in_f_9_;
   wire FE_PHN148_north_in_f_19_;
   wire FE_PHN147_north_in_f_13_;
   wire FE_PHN146_north_in_f_11_;
   wire FE_PHN144_north_in_f_31_;
   wire FE_PHN133_north_in_f_1_;
   wire FE_PHN132_north_in_f_0_;
   wire FE_PHN129_north_in_f_2_;
   wire FE_PHN125_north_in_f_4_;
   wire FE_PHN124_north_in_f_30_;
   wire FE_PHN123_north_in_f_28_;
   wire FE_PHN122_north_in_f_26_;
   wire FE_PHN119_north_in_f_6_;
   wire FE_PHN118_north_in_f_7_;
   wire FE_PHN116_north_in_f_5_;
   wire FE_PHN115_north_in_f_3_;
   wire FE_PHN108_north_in_f_8_;
   wire FE_PHN104_north_in_f_24_;
   wire FE_PHN103_north_in_f_22_;
   wire FE_PHN102_north_in_f_20_;
   wire FE_PHN101_north_in_f_18_;
   wire FE_PHN100_north_in_f_12_;
   wire FE_PHN99_north_in_f_14_;
   wire FE_PHN98_north_in_f_10_;
   wire FE_PHN97_north_in_f_16_;
   wire FE_PHN59_N4;
   wire lt_en__CASCADE_L1_N0;
   wire N0;
   wire lt_en;
   wire N3;
   wire N4;
   wire n1;
   wire n2;
   wire n3;
   wire n4;

   assign N0 = preset ;

   HS65_LH_BFX7 FE_PHC319_preset (.Z(FE_PHN319_preset), 
	.A(N0));
   HS65_LH_BFX9 FE_PHC314_preset (.Z(FE_PHN314_preset), 
	.A(N0));
   HS65_LH_BFX7 FE_PHC307_preset (.Z(FE_PHN307_preset), 
	.A(FE_PHN319_preset));
   HS65_LH_DLYIC4X9 FE_PHC269_preset (.Z(FE_PHN269_preset), 
	.A(FE_PHN307_preset));
   HS65_LH_BFX7 FE_PHC190_N4 (.Z(FE_PHN190_N4), 
	.A(FE_PHN59_N4));
   HS65_LH_DLYIC6X4 FE_PHC182_north_in_f_32_ (.Z(FE_PHN182_north_in_f_32_), 
	.A(\left_in[DATA][32] ));
   HS65_LH_DLYIC6X7 FE_PHC162_north_in_f_25_ (.Z(FE_PHN162_north_in_f_25_), 
	.A(\left_in[DATA][25] ));
   HS65_LH_DLYIC6X7 FE_PHC158_north_in_f_27_ (.Z(FE_PHN158_north_in_f_27_), 
	.A(\left_in[DATA][27] ));
   HS65_LH_DLYIC6X7 FE_PHC157_north_in_f_23_ (.Z(FE_PHN157_north_in_f_23_), 
	.A(\left_in[DATA][23] ));
   HS65_LH_DLYIC6X7 FE_PHC156_north_in_f_29_ (.Z(FE_PHN156_north_in_f_29_), 
	.A(\left_in[DATA][29] ));
   HS65_LH_DLYIC6X4 FE_PHC152_north_in_f_21_ (.Z(FE_PHN152_north_in_f_21_), 
	.A(\left_in[DATA][21] ));
   HS65_LH_DLYIC6X7 FE_PHC151_north_in_f_17_ (.Z(FE_PHN151_north_in_f_17_), 
	.A(\left_in[DATA][17] ));
   HS65_LH_DLYIC6X4 FE_PHC150_north_in_f_15_ (.Z(FE_PHN150_north_in_f_15_), 
	.A(\left_in[DATA][15] ));
   HS65_LH_DLYIC6X7 FE_PHC149_north_in_f_9_ (.Z(FE_PHN149_north_in_f_9_), 
	.A(\left_in[DATA][9] ));
   HS65_LH_DLYIC6X7 FE_PHC148_north_in_f_19_ (.Z(FE_PHN148_north_in_f_19_), 
	.A(\left_in[DATA][19] ));
   HS65_LH_DLYIC6X7 FE_PHC147_north_in_f_13_ (.Z(FE_PHN147_north_in_f_13_), 
	.A(\left_in[DATA][13] ));
   HS65_LH_DLYIC6X7 FE_PHC146_north_in_f_11_ (.Z(FE_PHN146_north_in_f_11_), 
	.A(\left_in[DATA][11] ));
   HS65_LH_DLYIC6X7 FE_PHC144_north_in_f_31_ (.Z(FE_PHN144_north_in_f_31_), 
	.A(\left_in[DATA][31] ));
   HS65_LH_DLYIC6X7 FE_PHC133_north_in_f_1_ (.Z(FE_PHN133_north_in_f_1_), 
	.A(\left_in[DATA][1] ));
   HS65_LH_DLYIC6X7 FE_PHC132_north_in_f_0_ (.Z(FE_PHN132_north_in_f_0_), 
	.A(\left_in[DATA][0] ));
   HS65_LH_DLYIC6X7 FE_PHC129_north_in_f_2_ (.Z(FE_PHN129_north_in_f_2_), 
	.A(\left_in[DATA][2] ));
   HS65_LH_DLYIC6X9 FE_PHC125_north_in_f_4_ (.Z(FE_PHN125_north_in_f_4_), 
	.A(\left_in[DATA][4] ));
   HS65_LH_DLYIC6X7 FE_PHC124_north_in_f_30_ (.Z(FE_PHN124_north_in_f_30_), 
	.A(\left_in[DATA][30] ));
   HS65_LH_DLYIC6X9 FE_PHC123_north_in_f_28_ (.Z(FE_PHN123_north_in_f_28_), 
	.A(\left_in[DATA][28] ));
   HS65_LH_DLYIC6X7 FE_PHC122_north_in_f_26_ (.Z(FE_PHN122_north_in_f_26_), 
	.A(\left_in[DATA][26] ));
   HS65_LH_DLYIC6X7 FE_PHC119_north_in_f_6_ (.Z(FE_PHN119_north_in_f_6_), 
	.A(\left_in[DATA][6] ));
   HS65_LH_DLYIC6X7 FE_PHC118_north_in_f_7_ (.Z(FE_PHN118_north_in_f_7_), 
	.A(\left_in[DATA][7] ));
   HS65_LH_DLYIC6X7 FE_PHC116_north_in_f_5_ (.Z(FE_PHN116_north_in_f_5_), 
	.A(\left_in[DATA][5] ));
   HS65_LH_DLYIC6X7 FE_PHC115_north_in_f_3_ (.Z(FE_PHN115_north_in_f_3_), 
	.A(\left_in[DATA][3] ));
   HS65_LH_DLYIC6X7 FE_PHC108_north_in_f_8_ (.Z(FE_PHN108_north_in_f_8_), 
	.A(\left_in[DATA][8] ));
   HS65_LH_DLYIC6X7 FE_PHC104_north_in_f_24_ (.Z(FE_PHN104_north_in_f_24_), 
	.A(\left_in[DATA][24] ));
   HS65_LH_DLYIC6X7 FE_PHC103_north_in_f_22_ (.Z(FE_PHN103_north_in_f_22_), 
	.A(\left_in[DATA][22] ));
   HS65_LH_DLYIC6X9 FE_PHC102_north_in_f_20_ (.Z(FE_PHN102_north_in_f_20_), 
	.A(\left_in[DATA][20] ));
   HS65_LH_DLYIC6X7 FE_PHC101_north_in_f_18_ (.Z(FE_PHN101_north_in_f_18_), 
	.A(\left_in[DATA][18] ));
   HS65_LH_DLYIC6X7 FE_PHC100_north_in_f_12_ (.Z(FE_PHN100_north_in_f_12_), 
	.A(\left_in[DATA][12] ));
   HS65_LH_DLYIC6X7 FE_PHC99_north_in_f_14_ (.Z(FE_PHN99_north_in_f_14_), 
	.A(\left_in[DATA][14] ));
   HS65_LH_DLYIC6X7 FE_PHC98_north_in_f_10_ (.Z(FE_PHN98_north_in_f_10_), 
	.A(\left_in[DATA][10] ));
   HS65_LH_DLYIC6X9 FE_PHC97_north_in_f_16_ (.Z(FE_PHN97_north_in_f_16_), 
	.A(\left_in[DATA][16] ));
   HS65_LH_DLYIC4X9 FE_PHC59_N4 (.Z(FE_PHN59_N4), 
	.A(N4));
   HS65_LS_BFX7 lt_en__CASCADE_L1_I0 (.Z(lt_en__CASCADE_L1_N0), 
	.A(lt_en));
   latch_controller_1_0 controller (.preset(N0), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX18 type_out_reg (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(FE_PHN190_N4));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(N3), 
	.D(FE_PHN144_north_in_f_31_));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(FE_PHN124_north_in_f_30_));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(N3), 
	.D(FE_PHN156_north_in_f_29_));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(FE_PHN123_north_in_f_28_));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(N3), 
	.D(FE_PHN158_north_in_f_27_));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(FE_PHN122_north_in_f_26_));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(N3), 
	.D(FE_PHN162_north_in_f_25_));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(FE_PHN104_north_in_f_24_));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(N3), 
	.D(FE_PHN157_north_in_f_23_));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(FE_PHN103_north_in_f_22_));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(N3), 
	.D(FE_PHN152_north_in_f_21_));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(FE_PHN102_north_in_f_20_));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(N3), 
	.D(FE_PHN148_north_in_f_19_));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3), 
	.D(FE_PHN101_north_in_f_18_));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(N3), 
	.D(FE_PHN151_north_in_f_17_));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3), 
	.D(FE_PHN97_north_in_f_16_));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(N3), 
	.D(FE_PHN150_north_in_f_15_));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3), 
	.D(FE_PHN99_north_in_f_14_));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3), 
	.D(FE_PHN147_north_in_f_13_));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(N3), 
	.D(FE_PHN100_north_in_f_12_));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3), 
	.D(FE_PHN146_north_in_f_11_));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(N3), 
	.D(FE_PHN98_north_in_f_10_));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(FE_PHN149_north_in_f_9_));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(N3), 
	.D(FE_PHN108_north_in_f_8_));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(FE_PHN118_north_in_f_7_));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(N3), 
	.D(FE_PHN119_north_in_f_6_));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(FE_PHN116_north_in_f_5_));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(N3), 
	.D(FE_PHN125_north_in_f_4_));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(FE_PHN115_north_in_f_3_));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(N3), 
	.D(FE_PHN129_north_in_f_2_));
   HS65_LS_LDHQX9 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(FE_PHN133_north_in_f_1_));
   HS65_LS_LDHQX9 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3), 
	.D(FE_PHN132_north_in_f_0_));
   HS65_LS_AND2X4 U5 (.Z(n1), 
	.B(FE_PHN269_preset), 
	.A(1'b1));
   HS65_LS_AND2X4 U6 (.Z(n2), 
	.B(n4), 
	.A(n3));
   HS65_LS_OR2X9 U7 (.Z(N3), 
	.B(n2), 
	.A(n1));
   HS65_LS_LDHQX18 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(FE_PHN182_north_in_f_32_));
   HS65_LS_IVX9 U3 (.Z(n4), 
	.A(FE_PHN314_preset));
   HS65_LS_NOR2AX3 U4 (.Z(N4), 
	.B(N0), 
	.A(\left_in[DATA][33] ));
   HS65_LS_IVX9 U8 (.Z(n3), 
	.A(lt_en__CASCADE_L1_N0));
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
   wire FE_OFN34_n42;
   wire FE_OFN20_n38;
   wire FE_OFN19_n37;
   wire FE_OFN18_n39;
   wire FE_OFN6_n42;
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
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n42;
   wire n43;

   assign data_out[33] = data_in[33] ;
   assign data_out[32] = data_in[32] ;
   assign sel[0] = 1'b0 ;

   HS65_LS_BFX142 FE_OFC34_n42 (.Z(FE_OFN34_n42), 
	.A(FE_OFN6_n42));
   HS65_LS_BFX53 FE_OFC20_n38 (.Z(FE_OFN20_n38), 
	.A(n38));
   HS65_LS_BFX53 FE_OFC19_n37 (.Z(FE_OFN19_n37), 
	.A(n37));
   HS65_LS_BFX53 FE_OFC18_n39 (.Z(FE_OFN18_n39), 
	.A(n39));
   HS65_LS_BFX71 FE_OFC6_n42 (.Z(FE_OFN6_n42), 
	.A(n42));
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
	.D(N16));
   HS65_LS_NOR2AX19 U5 (.Z(n34), 
	.B(data_in[32]), 
	.A(data_in[33]));
   HS65_LS_IVX9 U6 (.Z(n38), 
	.A(n43));
   HS65_LS_IVX9 U7 (.Z(n37), 
	.A(n43));
   HS65_LS_IVX9 U9 (.Z(n39), 
	.A(n43));
   HS65_LS_NAND2X7 U11 (.Z(n36), 
	.B(n35), 
	.A(FE_OFN18_n39));
   HS65_LS_NOR2X6 U12 (.Z(N19), 
	.B(n35), 
	.A(FE_OFN6_n42));
   HS65_LS_OAI22X6 U13 (.Z(data_out[6]), 
	.D(n27), 
	.C(FE_OFN19_n37), 
	.B(n25), 
	.A(n43));
   HS65_LS_OAI22X6 U14 (.Z(data_out[7]), 
	.D(n26), 
	.C(FE_OFN19_n37), 
	.B(FE_OFN34_n42), 
	.A(n24));
   HS65_LS_OAI22X6 U15 (.Z(data_out[0]), 
	.D(n33), 
	.C(FE_OFN18_n39), 
	.B(n31), 
	.A(FE_OFN6_n42));
   HS65_LS_OAI22X6 U16 (.Z(data_out[1]), 
	.D(n32), 
	.C(FE_OFN20_n38), 
	.B(n30), 
	.A(FE_OFN6_n42));
   HS65_LS_OAI22X6 U17 (.Z(data_out[2]), 
	.D(n31), 
	.C(FE_OFN19_n37), 
	.B(n29), 
	.A(FE_OFN6_n42));
   HS65_LS_OAI22X6 U18 (.Z(data_out[3]), 
	.D(n30), 
	.C(FE_OFN19_n37), 
	.B(n28), 
	.A(FE_OFN6_n42));
   HS65_LS_OAI22X6 U19 (.Z(data_out[4]), 
	.D(n29), 
	.C(FE_OFN19_n37), 
	.B(n27), 
	.A(FE_OFN6_n42));
   HS65_LS_OAI22X6 U20 (.Z(data_out[5]), 
	.D(n28), 
	.C(FE_OFN20_n38), 
	.B(n26), 
	.A(FE_OFN34_n42));
   HS65_LS_OAI22X6 U21 (.Z(data_out[8]), 
	.D(n25), 
	.C(FE_OFN19_n37), 
	.B(n23), 
	.A(FE_OFN34_n42));
   HS65_LS_OAI22X6 U22 (.Z(data_out[9]), 
	.D(n24), 
	.C(FE_OFN19_n37), 
	.B(n22), 
	.A(FE_OFN34_n42));
   HS65_LS_OAI22X4 U23 (.Z(data_out[10]), 
	.D(n23), 
	.C(FE_OFN18_n39), 
	.B(n21), 
	.A(FE_OFN34_n42));
   HS65_LS_OAI22X6 U24 (.Z(data_out[11]), 
	.D(n22), 
	.C(FE_OFN18_n39), 
	.B(n20), 
	.A(FE_OFN34_n42));
   HS65_LS_OAI22X6 U25 (.Z(data_out[12]), 
	.D(n21), 
	.C(FE_OFN18_n39), 
	.B(n19), 
	.A(FE_OFN34_n42));
   HS65_LS_OAI22X6 U26 (.Z(data_out[13]), 
	.D(n20), 
	.C(FE_OFN18_n39), 
	.B(n18), 
	.A(FE_OFN34_n42));
   HS65_LS_OAI22X6 U27 (.Z(data_out[14]), 
	.D(n19), 
	.C(FE_OFN18_n39), 
	.B(n17), 
	.A(FE_OFN34_n42));
   HS65_LS_OAI22X6 U28 (.Z(data_out[15]), 
	.D(n18), 
	.C(FE_OFN20_n38), 
	.B(n16), 
	.A(FE_OFN34_n42));
   HS65_LS_OAI22X6 U29 (.Z(data_out[16]), 
	.D(n17), 
	.C(FE_OFN20_n38), 
	.B(n15), 
	.A(FE_OFN34_n42));
   HS65_LS_OAI22X6 U30 (.Z(data_out[17]), 
	.D(n16), 
	.C(FE_OFN20_n38), 
	.B(n14), 
	.A(FE_OFN34_n42));
   HS65_LS_OAI22X6 U31 (.Z(data_out[18]), 
	.D(n15), 
	.C(FE_OFN20_n38), 
	.B(n13), 
	.A(FE_OFN34_n42));
   HS65_LS_OAI22X6 U32 (.Z(data_out[19]), 
	.D(n14), 
	.C(FE_OFN20_n38), 
	.B(n12), 
	.A(FE_OFN34_n42));
   HS65_LS_OAI22X6 U33 (.Z(data_out[20]), 
	.D(n13), 
	.C(FE_OFN20_n38), 
	.B(n11), 
	.A(FE_OFN34_n42));
   HS65_LS_OAI22X6 U34 (.Z(data_out[21]), 
	.D(n12), 
	.C(FE_OFN20_n38), 
	.B(n10), 
	.A(FE_OFN6_n42));
   HS65_LS_OAI22X6 U35 (.Z(data_out[22]), 
	.D(n11), 
	.C(FE_OFN20_n38), 
	.B(n9), 
	.A(FE_OFN34_n42));
   HS65_LS_OAI22X6 U36 (.Z(data_out[23]), 
	.D(n10), 
	.C(FE_OFN20_n38), 
	.B(n8), 
	.A(FE_OFN6_n42));
   HS65_LS_OAI22X6 U37 (.Z(data_out[24]), 
	.D(n9), 
	.C(FE_OFN20_n38), 
	.B(n7), 
	.A(FE_OFN34_n42));
   HS65_LS_OAI22X6 U38 (.Z(data_out[25]), 
	.D(n8), 
	.C(FE_OFN19_n37), 
	.B(n6), 
	.A(FE_OFN6_n42));
   HS65_LS_OAI22X6 U39 (.Z(data_out[26]), 
	.D(n7), 
	.C(FE_OFN19_n37), 
	.B(n5), 
	.A(FE_OFN34_n42));
   HS65_LS_OAI22X6 U40 (.Z(data_out[27]), 
	.D(n6), 
	.C(FE_OFN19_n37), 
	.B(n4), 
	.A(FE_OFN6_n42));
   HS65_LS_OAI22X4 U41 (.Z(data_out[28]), 
	.D(n5), 
	.C(FE_OFN19_n37), 
	.B(n3), 
	.A(FE_OFN34_n42));
   HS65_LS_OAI22X6 U42 (.Z(data_out[29]), 
	.D(n4), 
	.C(FE_OFN19_n37), 
	.B(n2), 
	.A(FE_OFN6_n42));
   HS65_LS_IVX9 U43 (.Z(n43), 
	.A(n34));
   HS65_LS_CNIVX7 U44 (.Z(n42), 
	.A(n34));
   HS65_LS_NOR2X6 U45 (.Z(data_out[30]), 
	.B(n3), 
	.A(FE_OFN18_n39));
   HS65_LS_NOR2X6 U46 (.Z(data_out[31]), 
	.B(n2), 
	.A(FE_OFN18_n39));
   HS65_LS_NOR3X4 U47 (.Z(N18), 
	.C(n33), 
	.B(n32), 
	.A(n36));
   HS65_LS_NAND2X7 U48 (.Z(n35), 
	.B(n33), 
	.A(n32));
   HS65_LS_IVX9 U49 (.Z(n32), 
	.A(data_in[1]));
   HS65_LS_IVX9 U50 (.Z(n33), 
	.A(data_in[0]));
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
   HS65_LS_IVX9 U77 (.Z(n5), 
	.A(data_in[28]));
   HS65_LS_IVX9 U78 (.Z(n4), 
	.A(data_in[29]));
   HS65_LS_IVX9 U79 (.Z(n3), 
	.A(data_in[30]));
   HS65_LS_IVX9 U80 (.Z(n2), 
	.A(data_in[31]));
   HS65_LS_NOR2AX6 U81 (.Z(N20), 
	.B(data_in[32]), 
	.A(data_valid));
   HS65_LS_NOR2X6 U82 (.Z(N16), 
	.B(n36), 
	.A(data_in[1]));
   HS65_LS_NOR2X6 U83 (.Z(N17), 
	.B(n36), 
	.A(data_in[0]));
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

   HS65_LH_AND2X4 C8 (.Z(q), 
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
   wire not_Ain;

   assign Rout = Aout ;

   c_gate_0_5 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 I_0 (.Z(not_Ain), 
	.A(Ain));
   HS65_LSS_XOR2X6 U1 (.Z(lt_en), 
	.B(Ain), 
	.A(Aout));
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
   wire FE_PHN327_preset;
   wire FE_PHN301_preset;
   wire N0;
   wire lt_en;
   wire N3;
   wire N4;
   wire n4;
   wire n5;
   wire n6;
   wire n7;

   assign N0 = preset ;

   HS65_LH_BFX9 FE_PHC327_preset (.Z(FE_PHN327_preset), 
	.A(N0));
   HS65_LH_DLYIC4X9 FE_PHC301_preset (.Z(FE_PHN301_preset), 
	.A(N0));
   latch_controller_1_5 controller (.preset(N0), 
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
	.G(N3), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHQX18 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHQX18 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(N3), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHQX18 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHQX18 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(N3), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHQX18 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHQX18 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(N3), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHQX18 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHQX18 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(N3), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHQX18 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHQX18 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(N3), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHQX18 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHQX18 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(N3), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHQX18 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHQX18 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(N3), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHQX18 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHQX18 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(N3), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHQX18 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHQX18 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(N3), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHQX18 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHQX18 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(\left_in[DATA][32] ));
   HS65_LS_LDHQX9 type_out_reg (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(N4));
   HS65_LS_AND2X4 U5 (.Z(n7), 
	.B(FE_PHN327_preset), 
	.A(1'b1));
   HS65_LS_AND2X4 U6 (.Z(n6), 
	.B(n4), 
	.A(n5));
   HS65_LS_OR2X9 U7 (.Z(N3), 
	.B(n6), 
	.A(n7));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(N3), 
	.D(\left_in[DATA][31] ));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(\left_in[DATA][30] ));
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
   HS65_LS_LDHQX9 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3), 
	.D(\left_in[DATA][0] ));
   HS65_LH_NOR2AX3 U3 (.Z(N4), 
	.B(N0), 
	.A(\left_in[DATA][33] ));
   HS65_LS_IVX9 U4 (.Z(n4), 
	.A(FE_PHN301_preset));
   HS65_LS_IVX9 U8 (.Z(n5), 
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
   wire FE_PHN63_req_n;
   wire n10;
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

   assign sel[0] = 1'b0 ;

   HS65_LS_DLYIC4X9 FE_PHC63_req_n (.Z(FE_PHN63_req_n), 
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
		n10 }));
   channel_latch_1_xxxxxxxxx_5 token_latch (.preset(preset), 
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
   HS65_LS_IVX9 I_0 (.Z(req_n), 
	.A(\chan_in_f[REQ] ));
   HS65_LS_IVX9 I_1 (.Z(\chan_internal_f[REQ] ), 
	.A(FE_PHN63_req_n));
   HS65_LSS_XOR2X6 U9 (.Z(data_in_valid), 
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
   wire FE_OFN33_n18;
   wire FE_OFN3_n18;
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
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;

   assign data_out[33] = data_in[33] ;
   assign data_out[32] = data_in[32] ;
   assign sel[2] = 1'b0 ;

   HS65_LS_BFX106 FE_OFC33_n18 (.Z(FE_OFN33_n18), 
	.A(FE_OFN3_n18));
   HS65_LS_BFX106 FE_OFC3_n18 (.Z(FE_OFN3_n18), 
	.A(n18));
   HS65_LS_LDHQX18 \sel_reg[4]  (.Q(sel[4]), 
	.G(N23), 
	.D(N22));
   HS65_LS_LDHQX18 \sel_reg[3]  (.Q(sel[3]), 
	.G(N23), 
	.D(N21));
   HS65_LS_LDHQX18 \sel_reg[1]  (.Q(sel[1]), 
	.G(N23), 
	.D(N19));
   HS65_LS_LDHQX18 \sel_reg[0]  (.Q(sel[0]), 
	.G(N23), 
	.D(N18));
   HS65_LS_AO22X4 U5 (.Z(data_out[5]), 
	.D(data_in[5]), 
	.C(n23), 
	.B(data_in[7]), 
	.A(FE_OFN3_n18));
   HS65_LS_AO22X4 U6 (.Z(data_out[11]), 
	.D(data_in[11]), 
	.C(n23), 
	.B(data_in[13]), 
	.A(FE_OFN3_n18));
   HS65_LS_NAND2X5 U7 (.Z(n20), 
	.B(n19), 
	.A(FE_OFN3_n18));
   HS65_LS_CNIVX82 U9 (.Z(n23), 
	.A(FE_OFN33_n18));
   HS65_LS_CNIVX82 U10 (.Z(n22), 
	.A(FE_OFN33_n18));
   HS65_LS_IVX9 U11 (.Z(n24), 
	.A(FE_OFN3_n18));
   HS65_LS_OAI22X6 U12 (.Z(data_out[0]), 
	.D(n17), 
	.C(FE_OFN33_n18), 
	.B(n16), 
	.A(n23));
   HS65_LS_OAI22X6 U13 (.Z(data_out[2]), 
	.D(n16), 
	.C(FE_OFN33_n18), 
	.B(n15), 
	.A(n22));
   HS65_LS_OAI22X6 U14 (.Z(data_out[4]), 
	.D(n15), 
	.C(FE_OFN33_n18), 
	.B(n14), 
	.A(n22));
   HS65_LS_OAI22X6 U15 (.Z(data_out[6]), 
	.D(n14), 
	.C(FE_OFN33_n18), 
	.B(n13), 
	.A(n22));
   HS65_LS_OAI22X6 U16 (.Z(data_out[8]), 
	.D(n13), 
	.C(FE_OFN33_n18), 
	.B(n12), 
	.A(n22));
   HS65_LS_OAI22X6 U17 (.Z(data_out[10]), 
	.D(n12), 
	.C(FE_OFN33_n18), 
	.B(n11), 
	.A(n23));
   HS65_LS_OAI22X6 U18 (.Z(data_out[12]), 
	.D(n11), 
	.C(FE_OFN33_n18), 
	.B(n10), 
	.A(n23));
   HS65_LS_OAI22X6 U19 (.Z(data_out[14]), 
	.D(n10), 
	.C(FE_OFN33_n18), 
	.B(n9), 
	.A(n22));
   HS65_LS_OAI22X6 U20 (.Z(data_out[16]), 
	.D(n9), 
	.C(FE_OFN33_n18), 
	.B(n8), 
	.A(n22));
   HS65_LS_OAI22X6 U21 (.Z(data_out[18]), 
	.D(n8), 
	.C(FE_OFN33_n18), 
	.B(n7), 
	.A(n22));
   HS65_LS_OAI22X6 U22 (.Z(data_out[20]), 
	.D(n7), 
	.C(FE_OFN33_n18), 
	.B(n6), 
	.A(n22));
   HS65_LS_OAI22X6 U23 (.Z(data_out[22]), 
	.D(n6), 
	.C(FE_OFN33_n18), 
	.B(n5), 
	.A(n22));
   HS65_LS_OAI22X6 U24 (.Z(data_out[24]), 
	.D(n5), 
	.C(FE_OFN33_n18), 
	.B(n4), 
	.A(n22));
   HS65_LS_OAI22X6 U25 (.Z(data_out[26]), 
	.D(n4), 
	.C(FE_OFN33_n18), 
	.B(n3), 
	.A(n22));
   HS65_LS_OAI22X6 U26 (.Z(data_out[28]), 
	.D(n3), 
	.C(FE_OFN33_n18), 
	.B(n2), 
	.A(n22));
   HS65_LS_NOR2X6 U29 (.Z(data_out[30]), 
	.B(n2), 
	.A(FE_OFN33_n18));
   HS65_LS_NOR3X4 U30 (.Z(N21), 
	.C(n21), 
	.B(n17), 
	.A(n20));
   HS65_LS_NOR2AX3 U31 (.Z(N19), 
	.B(n20), 
	.A(n21));
   HS65_LS_NOR2X6 U32 (.Z(N22), 
	.B(n19), 
	.A(n23));
   HS65_LS_IVX9 U33 (.Z(n17), 
	.A(data_in[0]));
   HS65_LS_IVX9 U34 (.Z(n16), 
	.A(data_in[2]));
   HS65_LS_IVX9 U35 (.Z(n15), 
	.A(data_in[4]));
   HS65_LS_IVX9 U36 (.Z(n14), 
	.A(data_in[6]));
   HS65_LS_IVX9 U37 (.Z(n13), 
	.A(data_in[8]));
   HS65_LS_IVX9 U38 (.Z(n12), 
	.A(data_in[10]));
   HS65_LS_IVX9 U39 (.Z(n11), 
	.A(data_in[12]));
   HS65_LS_IVX9 U40 (.Z(n10), 
	.A(data_in[14]));
   HS65_LS_IVX9 U41 (.Z(n9), 
	.A(data_in[16]));
   HS65_LS_IVX9 U42 (.Z(n8), 
	.A(data_in[18]));
   HS65_LS_IVX9 U43 (.Z(n7), 
	.A(data_in[20]));
   HS65_LS_IVX9 U44 (.Z(n6), 
	.A(data_in[22]));
   HS65_LS_IVX9 U45 (.Z(n5), 
	.A(data_in[24]));
   HS65_LS_IVX9 U46 (.Z(n4), 
	.A(data_in[26]));
   HS65_LS_IVX9 U47 (.Z(n3), 
	.A(data_in[28]));
   HS65_LS_IVX9 U48 (.Z(n2), 
	.A(data_in[30]));
   HS65_LS_NOR2AX19 U49 (.Z(n18), 
	.B(data_in[32]), 
	.A(data_in[33]));
   HS65_LS_AO22X9 U50 (.Z(data_out[1]), 
	.D(data_in[1]), 
	.C(n23), 
	.B(data_in[3]), 
	.A(FE_OFN3_n18));
   HS65_LS_AO22X9 U51 (.Z(data_out[3]), 
	.D(data_in[3]), 
	.C(n23), 
	.B(data_in[5]), 
	.A(FE_OFN3_n18));
   HS65_LS_AO22X9 U52 (.Z(data_out[9]), 
	.D(data_in[9]), 
	.C(n23), 
	.B(data_in[11]), 
	.A(FE_OFN3_n18));
   HS65_LS_AO22X9 U53 (.Z(data_out[13]), 
	.D(data_in[13]), 
	.C(n23), 
	.B(data_in[15]), 
	.A(FE_OFN3_n18));
   HS65_LS_AO22X9 U54 (.Z(data_out[15]), 
	.D(data_in[15]), 
	.C(n23), 
	.B(data_in[17]), 
	.A(FE_OFN3_n18));
   HS65_LS_AO22X9 U55 (.Z(data_out[17]), 
	.D(data_in[17]), 
	.C(n23), 
	.B(data_in[19]), 
	.A(FE_OFN3_n18));
   HS65_LS_AO22X9 U56 (.Z(data_out[19]), 
	.D(data_in[19]), 
	.C(n23), 
	.B(data_in[21]), 
	.A(FE_OFN3_n18));
   HS65_LS_AO22X9 U57 (.Z(data_out[21]), 
	.D(data_in[21]), 
	.C(n23), 
	.B(data_in[23]), 
	.A(FE_OFN3_n18));
   HS65_LS_AO22X9 U58 (.Z(data_out[23]), 
	.D(data_in[23]), 
	.C(n23), 
	.B(data_in[25]), 
	.A(FE_OFN3_n18));
   HS65_LS_AO22X9 U59 (.Z(data_out[25]), 
	.D(data_in[25]), 
	.C(n23), 
	.B(data_in[27]), 
	.A(FE_OFN3_n18));
   HS65_LS_AO22X9 U60 (.Z(data_out[27]), 
	.D(data_in[27]), 
	.C(n23), 
	.B(data_in[29]), 
	.A(FE_OFN3_n18));
   HS65_LS_AO22X9 U61 (.Z(data_out[7]), 
	.D(data_in[7]), 
	.C(n24), 
	.B(FE_OFN3_n18), 
	.A(data_in[9]));
   HS65_LS_AO22X9 U62 (.Z(data_out[29]), 
	.D(data_in[29]), 
	.C(n24), 
	.B(data_in[31]), 
	.A(FE_OFN3_n18));
   HS65_LS_AND2X4 U63 (.Z(data_out[31]), 
	.B(n24), 
	.A(data_in[31]));
   HS65_LS_NAND2X7 U64 (.Z(n19), 
	.B(n17), 
	.A(data_in[1]));
   HS65_LS_NOR2X6 U65 (.Z(n21), 
	.B(data_in[1]), 
	.A(n17));
   HS65_LS_NOR2AX3 U66 (.Z(N23), 
	.B(data_in[32]), 
	.A(data_valid));
   HS65_LS_NOR2X6 U67 (.Z(N18), 
	.B(n20), 
	.A(data_in[0]));
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

   HS65_LH_AND2X4 C8 (.Z(q), 
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
   wire not_Ain;

   assign Rout = Aout ;

   c_gate_0_4 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 I_0 (.Z(not_Ain), 
	.A(Ain));
   HS65_LSS_XOR2X6 U1 (.Z(lt_en), 
	.B(Ain), 
	.A(Aout));
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
   wire FE_PHN325_preset;
   wire FE_PHN322_preset;
   wire FE_PHN313_preset;
   wire FE_PHN299_preset;
   wire lt_en__CASCADE_L1_N0;
   wire N0;
   wire lt_en;
   wire N3;
   wire N4;
   wire n4;
   wire n5;
   wire n6;
   wire n7;

   assign N0 = preset ;

   HS65_LH_BFX9 FE_PHC325_preset (.Z(FE_PHN325_preset), 
	.A(N0));
   HS65_LS_BFX7 FE_PHC322_preset (.Z(FE_PHN322_preset), 
	.A(N0));
   HS65_LH_BFX4 FE_PHC313_preset (.Z(FE_PHN313_preset), 
	.A(N0));
   HS65_LH_DLYIC4X4 FE_PHC299_preset (.Z(FE_PHN299_preset), 
	.A(FE_PHN325_preset));
   HS65_LS_BFX9 lt_en__CASCADE_L1_I0 (.Z(lt_en__CASCADE_L1_N0), 
	.A(lt_en));
   latch_controller_1_4 controller (.preset(N0), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX18 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(N3), 
	.D(\left_in[DATA][29] ));
   HS65_LS_LDHQX18 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHQX18 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(\left_in[DATA][32] ));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(N3), 
	.D(\left_in[DATA][31] ));
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
	.G(N3), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(N3), 
	.D(\left_in[DATA][12] ));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(N3), 
	.D(\left_in[DATA][10] ));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(N3), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(N3), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(N3), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(N3), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHQX9 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3), 
	.D(\left_in[DATA][0] ));
   HS65_LS_LDHQX9 type_out_reg (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(N4));
   HS65_LS_AND2X4 U5 (.Z(n7), 
	.B(FE_PHN313_preset), 
	.A(1'b1));
   HS65_LS_AND2X4 U6 (.Z(n6), 
	.B(n4), 
	.A(n5));
   HS65_LS_OR2X9 U7 (.Z(N3), 
	.B(n6), 
	.A(n7));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3), 
	.D(\left_in[DATA][11] ));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(N3), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(N3), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(N3), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(N3), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(N3), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(N3), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(N3), 
	.D(\left_in[DATA][15] ));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3), 
	.D(\left_in[DATA][13] ));
   HS65_LS_LDHQX9 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(\left_in[DATA][9] ));
   HS65_LS_NOR2AX3 U3 (.Z(N4), 
	.B(FE_PHN322_preset), 
	.A(\left_in[DATA][33] ));
   HS65_LS_IVX9 U4 (.Z(n4), 
	.A(FE_PHN299_preset));
   HS65_LS_IVX9 U8 (.Z(n5), 
	.A(lt_en__CASCADE_L1_N0));
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
   wire FE_PHN364_req_n;
   wire FE_PHN363_req_n;
   wire FE_PHN362_req_n;
   wire n10;
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

   assign sel[2] = 1'b0 ;

   HS65_LH_BFX9 FE_PHC364_req_n (.Z(FE_PHN364_req_n), 
	.A(FE_PHN363_req_n));
   HS65_LS_BFX7 FE_PHC363_req_n (.Z(FE_PHN363_req_n), 
	.A(FE_PHN362_req_n));
   HS65_LH_DLYIC2X7 FE_PHC362_req_n (.Z(FE_PHN362_req_n), 
	.A(req_n));
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
		n10,
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
	.right_in(\chan_out_b[ACK] ));
   HS65_LS_IVX9 I_0 (.Z(req_n), 
	.A(\chan_in_f[REQ] ));
   HS65_LS_IVX9 I_1 (.Z(\chan_internal_f[REQ] ), 
	.A(FE_PHN364_req_n));
   HS65_LSS_XOR2X6 U9 (.Z(data_in_valid), 
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
   wire FE_OFN32_n18;
   wire FE_OFN2_n18;
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
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;

   assign data_out[33] = data_in[33] ;
   assign data_out[32] = data_in[32] ;
   assign sel[1] = 1'b0 ;

   HS65_LS_OAI22X11 FE_RC_684_0 (.Z(data_out[21]), 
	.D(n22), 
	.C(n6), 
	.B(FE_OFN2_n18), 
	.A(n7));
   HS65_LS_BFX106 FE_OFC32_n18 (.Z(FE_OFN32_n18), 
	.A(FE_OFN2_n18));
   HS65_LS_BFX106 FE_OFC2_n18 (.Z(FE_OFN2_n18), 
	.A(n18));
   HS65_LS_LDHQX18 \sel_reg[4]  (.Q(sel[4]), 
	.G(N20), 
	.D(N19));
   HS65_LS_LDHQX18 \sel_reg[3]  (.Q(sel[3]), 
	.G(N20), 
	.D(N18));
   HS65_LS_LDHQX18 \sel_reg[2]  (.Q(sel[2]), 
	.G(N20), 
	.D(N17));
   HS65_LS_LDHQX18 \sel_reg[0]  (.Q(sel[0]), 
	.G(N20), 
	.D(N15));
   HS65_LS_NOR2X5 U5 (.Z(N19), 
	.B(n19), 
	.A(n23));
   HS65_LS_CNIVX82 U7 (.Z(n23), 
	.A(FE_OFN32_n18));
   HS65_LS_CNIVX82 U8 (.Z(n22), 
	.A(FE_OFN2_n18));
   HS65_LS_IVX9 U9 (.Z(n24), 
	.A(FE_OFN32_n18));
   HS65_LS_OAI22X6 U10 (.Z(data_out[7]), 
	.D(n14), 
	.C(FE_OFN2_n18), 
	.B(n23), 
	.A(n13));
   HS65_LS_OAI22X6 U11 (.Z(data_out[1]), 
	.D(n17), 
	.C(FE_OFN2_n18), 
	.B(n16), 
	.A(n22));
   HS65_LS_OAI22X6 U12 (.Z(data_out[3]), 
	.D(n16), 
	.C(FE_OFN2_n18), 
	.B(n15), 
	.A(n22));
   HS65_LS_OAI22X6 U13 (.Z(data_out[5]), 
	.D(n15), 
	.C(FE_OFN2_n18), 
	.B(n14), 
	.A(n22));
   HS65_LS_OAI22X6 U14 (.Z(data_out[9]), 
	.D(n13), 
	.C(FE_OFN2_n18), 
	.B(n12), 
	.A(n22));
   HS65_LS_OAI22X6 U15 (.Z(data_out[11]), 
	.D(n12), 
	.C(FE_OFN2_n18), 
	.B(n11), 
	.A(n22));
   HS65_LS_OAI22X6 U16 (.Z(data_out[13]), 
	.D(n11), 
	.C(FE_OFN2_n18), 
	.B(n10), 
	.A(n22));
   HS65_LS_OAI22X6 U17 (.Z(data_out[15]), 
	.D(n10), 
	.C(FE_OFN2_n18), 
	.B(n9), 
	.A(n22));
   HS65_LS_OAI22X6 U18 (.Z(data_out[17]), 
	.D(n9), 
	.C(FE_OFN2_n18), 
	.B(n8), 
	.A(n22));
   HS65_LS_OAI22X6 U19 (.Z(data_out[19]), 
	.D(n8), 
	.C(FE_OFN2_n18), 
	.B(n7), 
	.A(n22));
   HS65_LS_OAI22X6 U21 (.Z(data_out[23]), 
	.D(n6), 
	.C(FE_OFN2_n18), 
	.B(n5), 
	.A(n22));
   HS65_LS_OAI22X6 U22 (.Z(data_out[25]), 
	.D(n5), 
	.C(FE_OFN2_n18), 
	.B(n4), 
	.A(n23));
   HS65_LS_OAI22X6 U23 (.Z(data_out[27]), 
	.D(n4), 
	.C(FE_OFN2_n18), 
	.B(n3), 
	.A(n22));
   HS65_LS_OAI22X6 U24 (.Z(data_out[29]), 
	.D(n3), 
	.C(FE_OFN2_n18), 
	.B(n2), 
	.A(n23));
   HS65_LS_NOR2X6 U27 (.Z(data_out[31]), 
	.B(n2), 
	.A(FE_OFN2_n18));
   HS65_LS_NAND2X7 U28 (.Z(n20), 
	.B(n19), 
	.A(FE_OFN2_n18));
   HS65_LS_NOR3X4 U29 (.Z(N18), 
	.C(n21), 
	.B(n17), 
	.A(n20));
   HS65_LS_NOR2AX3 U30 (.Z(N17), 
	.B(n20), 
	.A(n21));
   HS65_LS_IVX9 U31 (.Z(n17), 
	.A(data_in[1]));
   HS65_LS_IVX9 U32 (.Z(n13), 
	.A(data_in[9]));
   HS65_LS_IVX9 U33 (.Z(n16), 
	.A(data_in[3]));
   HS65_LS_IVX9 U34 (.Z(n15), 
	.A(data_in[5]));
   HS65_LS_IVX9 U35 (.Z(n14), 
	.A(data_in[7]));
   HS65_LS_IVX9 U36 (.Z(n12), 
	.A(data_in[11]));
   HS65_LS_IVX9 U37 (.Z(n11), 
	.A(data_in[13]));
   HS65_LS_IVX9 U38 (.Z(n10), 
	.A(data_in[15]));
   HS65_LS_IVX9 U39 (.Z(n9), 
	.A(data_in[17]));
   HS65_LS_IVX9 U40 (.Z(n8), 
	.A(data_in[19]));
   HS65_LS_IVX9 U41 (.Z(n7), 
	.A(data_in[21]));
   HS65_LS_IVX9 U42 (.Z(n6), 
	.A(data_in[23]));
   HS65_LS_IVX9 U43 (.Z(n5), 
	.A(data_in[25]));
   HS65_LS_IVX9 U44 (.Z(n4), 
	.A(data_in[27]));
   HS65_LS_IVX9 U45 (.Z(n3), 
	.A(data_in[29]));
   HS65_LS_IVX9 U46 (.Z(n2), 
	.A(data_in[31]));
   HS65_LS_NOR2AX19 U47 (.Z(n18), 
	.B(data_in[32]), 
	.A(data_in[33]));
   HS65_LS_AO22X9 U48 (.Z(data_out[0]), 
	.D(data_in[0]), 
	.C(n23), 
	.B(data_in[2]), 
	.A(FE_OFN32_n18));
   HS65_LS_AO22X9 U49 (.Z(data_out[2]), 
	.D(data_in[2]), 
	.C(n23), 
	.B(data_in[4]), 
	.A(FE_OFN32_n18));
   HS65_LS_AO22X9 U50 (.Z(data_out[4]), 
	.D(data_in[4]), 
	.C(n23), 
	.B(data_in[6]), 
	.A(FE_OFN32_n18));
   HS65_LS_AO22X9 U51 (.Z(data_out[6]), 
	.D(data_in[6]), 
	.C(n23), 
	.B(data_in[8]), 
	.A(FE_OFN32_n18));
   HS65_LS_AO22X9 U52 (.Z(data_out[8]), 
	.D(data_in[8]), 
	.C(n23), 
	.B(data_in[10]), 
	.A(FE_OFN32_n18));
   HS65_LS_AO22X9 U53 (.Z(data_out[14]), 
	.D(data_in[14]), 
	.C(n23), 
	.B(data_in[16]), 
	.A(FE_OFN32_n18));
   HS65_LS_AO22X9 U54 (.Z(data_out[16]), 
	.D(data_in[16]), 
	.C(n23), 
	.B(data_in[18]), 
	.A(FE_OFN32_n18));
   HS65_LS_AO22X9 U55 (.Z(data_out[18]), 
	.D(data_in[18]), 
	.C(n23), 
	.B(data_in[20]), 
	.A(FE_OFN32_n18));
   HS65_LS_AO22X9 U56 (.Z(data_out[20]), 
	.D(data_in[20]), 
	.C(n23), 
	.B(data_in[22]), 
	.A(FE_OFN32_n18));
   HS65_LS_AO22X9 U57 (.Z(data_out[22]), 
	.D(data_in[22]), 
	.C(n23), 
	.B(data_in[24]), 
	.A(FE_OFN32_n18));
   HS65_LS_AO22X9 U58 (.Z(data_out[24]), 
	.D(data_in[24]), 
	.C(n23), 
	.B(data_in[26]), 
	.A(FE_OFN32_n18));
   HS65_LS_AO22X9 U59 (.Z(data_out[26]), 
	.D(data_in[26]), 
	.C(n23), 
	.B(data_in[28]), 
	.A(FE_OFN32_n18));
   HS65_LS_AO22X9 U60 (.Z(data_out[28]), 
	.D(data_in[28]), 
	.C(n23), 
	.B(data_in[30]), 
	.A(FE_OFN32_n18));
   HS65_LS_AO22X9 U61 (.Z(data_out[10]), 
	.D(data_in[10]), 
	.C(n24), 
	.B(data_in[12]), 
	.A(FE_OFN32_n18));
   HS65_LS_AO22X9 U62 (.Z(data_out[12]), 
	.D(data_in[12]), 
	.C(n24), 
	.B(data_in[14]), 
	.A(FE_OFN32_n18));
   HS65_LS_AND2X4 U63 (.Z(data_out[30]), 
	.B(n24), 
	.A(data_in[30]));
   HS65_LS_NAND2X7 U64 (.Z(n19), 
	.B(n17), 
	.A(data_in[0]));
   HS65_LS_NOR2X6 U65 (.Z(n21), 
	.B(data_in[0]), 
	.A(n17));
   HS65_LS_NOR2AX3 U66 (.Z(N20), 
	.B(data_in[32]), 
	.A(data_valid));
   HS65_LS_NOR2X6 U67 (.Z(N15), 
	.B(n20), 
	.A(data_in[1]));
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

   HS65_LH_AND2X4 C8 (.Z(q), 
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
   wire not_Ain;

   assign Rout = Aout ;

   c_gate_0_3 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 I_0 (.Z(not_Ain), 
	.A(Ain));
   HS65_LSS_XOR2X6 U1 (.Z(lt_en), 
	.B(Ain), 
	.A(Aout));
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
   wire FE_PHN337_preset;
   wire FE_PHN324_preset;
   wire FE_PHN317_preset;
   wire FE_PHN300_preset;
   wire lt_en__CASCADE_L2_N0;
   wire lt_en__CASCADE_L1_N0;
   wire N0;
   wire lt_en;
   wire N3;
   wire N4;
   wire n4;
   wire n5;
   wire n6;
   wire n7;

   assign N0 = preset ;

   HS65_LH_BFX9 FE_PHC337_preset (.Z(FE_PHN337_preset), 
	.A(N0));
   HS65_LS_BFX7 FE_PHC324_preset (.Z(FE_PHN324_preset), 
	.A(N0));
   HS65_LH_BFX9 FE_PHC317_preset (.Z(FE_PHN317_preset), 
	.A(N0));
   HS65_LH_DLYIC4X4 FE_PHC300_preset (.Z(FE_PHN300_preset), 
	.A(FE_PHN337_preset));
   HS65_LS_IVX9 lt_en__CASCADE_L2_I0 (.Z(lt_en__CASCADE_L2_N0), 
	.A(lt_en__CASCADE_L1_N0));
   HS65_LS_IVX9 lt_en__CASCADE_L1_I0 (.Z(lt_en__CASCADE_L1_N0), 
	.A(lt_en));
   latch_controller_1_3 controller (.preset(N0), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX18 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(\left_in[DATA][28] ));
   HS65_LS_LDHQX18 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(\left_in[DATA][26] ));
   HS65_LS_LDHQX18 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(\left_in[DATA][24] ));
   HS65_LS_LDHQX18 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(\left_in[DATA][22] ));
   HS65_LS_LDHQX18 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(\left_in[DATA][20] ));
   HS65_LS_LDHQX18 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3), 
	.D(\left_in[DATA][18] ));
   HS65_LS_LDHQX18 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3), 
	.D(\left_in[DATA][16] ));
   HS65_LS_LDHQX18 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3), 
	.D(\left_in[DATA][14] ));
   HS65_LS_LDHQX18 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(N3), 
	.D(\left_in[DATA][8] ));
   HS65_LS_LDHQX18 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(N3), 
	.D(\left_in[DATA][6] ));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(N3), 
	.D(\left_in[DATA][4] ));
   HS65_LS_LDHQX18 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(N3), 
	.D(\left_in[DATA][2] ));
   HS65_LS_LDHQX18 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3), 
	.D(\left_in[DATA][0] ));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(\left_in[DATA][9] ));
   HS65_LS_LDHQX18 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
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
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(N3), 
	.D(\left_in[DATA][27] ));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(N3), 
	.D(\left_in[DATA][25] ));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(N3), 
	.D(\left_in[DATA][23] ));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(N3), 
	.D(\left_in[DATA][21] ));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(N3), 
	.D(\left_in[DATA][19] ));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(N3), 
	.D(\left_in[DATA][17] ));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(N3), 
	.D(\left_in[DATA][15] ));
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
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(\left_in[DATA][7] ));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(\left_in[DATA][5] ));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(\left_in[DATA][3] ));
   HS65_LS_LDHQX9 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(\left_in[DATA][1] ));
   HS65_LS_LDHQX9 type_out_reg (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(N4));
   HS65_LS_AND2X4 U5 (.Z(n7), 
	.B(FE_PHN317_preset), 
	.A(1'b1));
   HS65_LS_AND2X4 U6 (.Z(n6), 
	.B(n4), 
	.A(n5));
   HS65_LS_OR2X9 U7 (.Z(N3), 
	.B(n6), 
	.A(n7));
   HS65_LS_NOR2AX3 U3 (.Z(N4), 
	.B(FE_PHN324_preset), 
	.A(\left_in[DATA][33] ));
   HS65_LS_IVX9 U4 (.Z(n4), 
	.A(FE_PHN300_preset));
   HS65_LS_IVX9 U8 (.Z(n5), 
	.A(lt_en__CASCADE_L2_N0));
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
   wire FE_PHN62_req_n;
   wire n10;
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

   assign sel[1] = 1'b0 ;

   HS65_LS_DLYIC4X9 FE_PHC62_req_n (.Z(FE_PHN62_req_n), 
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
		n10,
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
   HS65_LS_IVX9 I_0 (.Z(req_n), 
	.A(\chan_in_f[REQ] ));
   HS65_LS_IVX9 I_1 (.Z(\chan_internal_f[REQ] ), 
	.A(FE_PHN62_req_n));
   HS65_LSS_XOR2X6 U9 (.Z(data_in_valid), 
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
   wire FE_OFN31_n43;
   wire FE_OFN30_n38;
   wire FE_OFN17_n39;
   wire FE_OFN5_n43;
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
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n43;
   wire n44;

   assign data_out[33] = data_in[33] ;
   assign data_out[32] = data_in[32] ;
   assign sel[3] = 1'b0 ;

   HS65_LS_BFX142 FE_OFC31_n43 (.Z(FE_OFN31_n43), 
	.A(FE_OFN5_n43));
   HS65_LS_BFX71 FE_OFC30_n38 (.Z(FE_OFN30_n38), 
	.A(n38));
   HS65_LS_BFX53 FE_OFC17_n39 (.Z(FE_OFN17_n39), 
	.A(n39));
   HS65_LS_BFX71 FE_OFC5_n43 (.Z(FE_OFN5_n43), 
	.A(n43));
   HS65_LS_LDHQX9 \sel_reg[4]  (.Q(sel[4]), 
	.G(N22), 
	.D(N21));
   HS65_LS_LDHQX9 \sel_reg[2]  (.Q(sel[2]), 
	.G(N22), 
	.D(N19));
   HS65_LS_LDHQX9 \sel_reg[1]  (.Q(sel[1]), 
	.G(N22), 
	.D(N18));
   HS65_LS_LDHQX9 \sel_reg[0]  (.Q(sel[0]), 
	.G(N22), 
	.D(N17));
   HS65_LS_NOR2AX19 U5 (.Z(n34), 
	.B(data_in[32]), 
	.A(data_in[33]));
   HS65_LS_IVX9 U6 (.Z(n39), 
	.A(n44));
   HS65_LS_CNIVX34 U7 (.Z(n38), 
	.A(n44));
   HS65_LS_NOR2X6 U11 (.Z(N17), 
	.B(n37), 
	.A(FE_OFN31_n43));
   HS65_LS_OAI22X6 U12 (.Z(data_out[6]), 
	.D(n27), 
	.C(FE_OFN30_n38), 
	.B(n25), 
	.A(n44));
   HS65_LS_OAI22X6 U13 (.Z(data_out[7]), 
	.D(n26), 
	.C(FE_OFN30_n38), 
	.B(FE_OFN5_n43), 
	.A(n24));
   HS65_LS_OAI22X6 U14 (.Z(data_out[0]), 
	.D(n33), 
	.C(n38), 
	.B(n31), 
	.A(FE_OFN31_n43));
   HS65_LS_OAI22X6 U15 (.Z(data_out[1]), 
	.D(n32), 
	.C(FE_OFN17_n39), 
	.B(n30), 
	.A(FE_OFN5_n43));
   HS65_LS_OAI22X6 U16 (.Z(data_out[2]), 
	.D(n31), 
	.C(n38), 
	.B(n29), 
	.A(FE_OFN31_n43));
   HS65_LS_OAI22X6 U17 (.Z(data_out[3]), 
	.D(n30), 
	.C(n38), 
	.B(n28), 
	.A(FE_OFN5_n43));
   HS65_LS_OAI22X6 U18 (.Z(data_out[4]), 
	.D(n29), 
	.C(n38), 
	.B(n27), 
	.A(FE_OFN31_n43));
   HS65_LS_OAI22X6 U19 (.Z(data_out[5]), 
	.D(n28), 
	.C(FE_OFN17_n39), 
	.B(n26), 
	.A(FE_OFN5_n43));
   HS65_LS_OAI22X6 U20 (.Z(data_out[8]), 
	.D(n25), 
	.C(FE_OFN30_n38), 
	.B(n23), 
	.A(FE_OFN5_n43));
   HS65_LS_OAI22X6 U21 (.Z(data_out[9]), 
	.D(n24), 
	.C(FE_OFN30_n38), 
	.B(n22), 
	.A(FE_OFN5_n43));
   HS65_LS_OAI22X6 U22 (.Z(data_out[10]), 
	.D(n23), 
	.C(FE_OFN30_n38), 
	.B(n21), 
	.A(FE_OFN31_n43));
   HS65_LS_OAI22X6 U23 (.Z(data_out[11]), 
	.D(n22), 
	.C(FE_OFN30_n38), 
	.B(n20), 
	.A(FE_OFN31_n43));
   HS65_LS_OAI22X6 U24 (.Z(data_out[12]), 
	.D(n21), 
	.C(FE_OFN30_n38), 
	.B(n19), 
	.A(FE_OFN31_n43));
   HS65_LS_OAI22X6 U25 (.Z(data_out[13]), 
	.D(n20), 
	.C(FE_OFN30_n38), 
	.B(n18), 
	.A(FE_OFN31_n43));
   HS65_LS_OAI22X6 U26 (.Z(data_out[14]), 
	.D(n19), 
	.C(FE_OFN30_n38), 
	.B(n17), 
	.A(FE_OFN31_n43));
   HS65_LS_OAI22X6 U27 (.Z(data_out[15]), 
	.D(n18), 
	.C(FE_OFN17_n39), 
	.B(n16), 
	.A(FE_OFN31_n43));
   HS65_LS_OAI22X6 U28 (.Z(data_out[16]), 
	.D(n17), 
	.C(FE_OFN17_n39), 
	.B(n15), 
	.A(FE_OFN31_n43));
   HS65_LS_OAI22X6 U29 (.Z(data_out[17]), 
	.D(n16), 
	.C(FE_OFN17_n39), 
	.B(n14), 
	.A(FE_OFN31_n43));
   HS65_LS_OAI22X6 U30 (.Z(data_out[18]), 
	.D(n15), 
	.C(FE_OFN17_n39), 
	.B(n13), 
	.A(FE_OFN31_n43));
   HS65_LS_OAI22X6 U31 (.Z(data_out[19]), 
	.D(n14), 
	.C(FE_OFN17_n39), 
	.B(n12), 
	.A(FE_OFN31_n43));
   HS65_LS_OAI22X6 U32 (.Z(data_out[20]), 
	.D(n13), 
	.C(FE_OFN17_n39), 
	.B(n11), 
	.A(FE_OFN31_n43));
   HS65_LS_OAI22X6 U33 (.Z(data_out[21]), 
	.D(n12), 
	.C(FE_OFN17_n39), 
	.B(n10), 
	.A(FE_OFN5_n43));
   HS65_LS_OAI22X6 U34 (.Z(data_out[22]), 
	.D(n11), 
	.C(FE_OFN17_n39), 
	.B(n9), 
	.A(FE_OFN31_n43));
   HS65_LS_OAI22X6 U35 (.Z(data_out[23]), 
	.D(n10), 
	.C(FE_OFN17_n39), 
	.B(n8), 
	.A(FE_OFN5_n43));
   HS65_LS_OAI22X6 U36 (.Z(data_out[24]), 
	.D(n9), 
	.C(FE_OFN17_n39), 
	.B(n7), 
	.A(FE_OFN31_n43));
   HS65_LS_OAI22X6 U37 (.Z(data_out[25]), 
	.D(n8), 
	.C(n38), 
	.B(n6), 
	.A(FE_OFN5_n43));
   HS65_LS_OAI22X6 U38 (.Z(data_out[26]), 
	.D(n7), 
	.C(n38), 
	.B(n5), 
	.A(FE_OFN31_n43));
   HS65_LS_OAI22X6 U39 (.Z(data_out[27]), 
	.D(n6), 
	.C(n38), 
	.B(n4), 
	.A(FE_OFN5_n43));
   HS65_LS_OAI22X6 U40 (.Z(data_out[28]), 
	.D(n5), 
	.C(n38), 
	.B(n3), 
	.A(FE_OFN31_n43));
   HS65_LS_OAI22X6 U41 (.Z(data_out[29]), 
	.D(n4), 
	.C(n38), 
	.B(n2), 
	.A(FE_OFN5_n43));
   HS65_LS_IVX9 U42 (.Z(n44), 
	.A(n34));
   HS65_LS_IVX9 U43 (.Z(n43), 
	.A(n34));
   HS65_LS_NOR2X6 U44 (.Z(data_out[30]), 
	.B(n3), 
	.A(n38));
   HS65_LS_NOR2X6 U45 (.Z(data_out[31]), 
	.B(n2), 
	.A(n38));
   HS65_LS_NAND3X5 U46 (.Z(n36), 
	.C(FE_OFN30_n38), 
	.B(n35), 
	.A(n37));
   HS65_LS_NAND2X7 U47 (.Z(n37), 
	.B(n33), 
	.A(n32));
   HS65_LS_NOR2X6 U48 (.Z(N18), 
	.B(n36), 
	.A(n33));
   HS65_LS_NOR2X6 U49 (.Z(N21), 
	.B(n35), 
	.A(FE_OFN31_n43));
   HS65_LS_IVX9 U50 (.Z(n33), 
	.A(data_in[0]));
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
   HS65_LS_IVX9 U77 (.Z(n5), 
	.A(data_in[28]));
   HS65_LS_IVX9 U78 (.Z(n4), 
	.A(data_in[29]));
   HS65_LS_IVX9 U79 (.Z(n3), 
	.A(data_in[30]));
   HS65_LS_IVX9 U80 (.Z(n2), 
	.A(data_in[31]));
   HS65_LS_IVX9 U81 (.Z(n32), 
	.A(data_in[1]));
   HS65_LS_NAND2X7 U82 (.Z(n35), 
	.B(data_in[0]), 
	.A(data_in[1]));
   HS65_LS_NOR2AX6 U83 (.Z(N22), 
	.B(data_in[32]), 
	.A(data_valid));
   HS65_LS_NOR2X6 U84 (.Z(N19), 
	.B(n36), 
	.A(data_in[0]));
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

   HS65_LH_AND2X4 C8 (.Z(q), 
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
   wire not_Ain;

   assign Rout = Aout ;

   c_gate_0_2 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 I_0 (.Z(not_Ain), 
	.A(Ain));
   HS65_LSS_XOR2X6 U1 (.Z(lt_en), 
	.B(Ain), 
	.A(Aout));
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
   wire FE_PHN340_preset;
   wire FE_PHN321_preset;
   wire FE_PHN312_preset;
   wire FE_PHN298_preset;
   wire lt_en__CASCADE_L1_N0;
   wire N0;
   wire lt_en;
   wire N3;
   wire N4;
   wire n4;
   wire n5;
   wire n6;
   wire n7;

   assign N0 = preset ;

   HS65_LS_BFX7 FE_PHC340_preset (.Z(FE_PHN340_preset), 
	.A(N0));
   HS65_LS_BFX7 FE_PHC321_preset (.Z(FE_PHN321_preset), 
	.A(N0));
   HS65_LH_BFX4 FE_PHC312_preset (.Z(FE_PHN312_preset), 
	.A(FE_PHN340_preset));
   HS65_LH_DLYIC4X7 FE_PHC298_preset (.Z(FE_PHN298_preset), 
	.A(N0));
   HS65_LS_BFX9 lt_en__CASCADE_L1_I0 (.Z(lt_en__CASCADE_L1_N0), 
	.A(lt_en));
   latch_controller_1_2 controller (.preset(N0), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX18 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
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
   HS65_LS_LDHQX9 type_out_reg (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(N4));
   HS65_LS_AND2X4 U5 (.Z(n7), 
	.B(FE_PHN312_preset), 
	.A(1'b1));
   HS65_LS_AND2X4 U6 (.Z(n6), 
	.B(n4), 
	.A(n5));
   HS65_LS_OR2X9 U7 (.Z(N3), 
	.B(n6), 
	.A(n7));
   HS65_LS_NOR2AX3 U3 (.Z(N4), 
	.B(FE_PHN321_preset), 
	.A(\left_in[DATA][33] ));
   HS65_LS_IVX9 U4 (.Z(n4), 
	.A(FE_PHN298_preset));
   HS65_LS_IVX9 U8 (.Z(n5), 
	.A(lt_en__CASCADE_L1_N0));
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
   wire FE_PHN64_req_n;
   wire n10;
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

   assign sel[3] = 1'b0 ;

   HS65_LS_DLYIC4X9 FE_PHC64_req_n (.Z(FE_PHN64_req_n), 
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
		n10,
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
   HS65_LS_IVX9 I_0 (.Z(req_n), 
	.A(\chan_in_f[REQ] ));
   HS65_LS_IVX9 I_1 (.Z(\chan_internal_f[REQ] ), 
	.A(FE_PHN64_req_n));
   HS65_LSS_XOR2X6 U9 (.Z(data_in_valid), 
	.B(\chan_in_b[ACK] ), 
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
   wire FE_OFN29_n43;
   wire FE_OFN4_n43;
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
   wire n38;
   wire n39;
   wire n40;
   wire n43;
   wire n44;

   assign data_out[33] = data_in[33] ;
   assign data_out[32] = data_in[32] ;
   assign sel[4] = 1'b0 ;

   HS65_LS_OAI22X6 FE_RC_721_0 (.Z(data_out[0]), 
	.D(n40), 
	.C(n33), 
	.B(FE_OFN29_n43), 
	.A(n31));
   HS65_LS_OAI22X6 FE_RC_714_0 (.Z(data_out[10]), 
	.D(n40), 
	.C(n23), 
	.B(FE_OFN29_n43), 
	.A(n21));
   HS65_LS_OAI22X6 FE_RC_673_0 (.Z(data_out[13]), 
	.D(n40), 
	.C(n20), 
	.B(FE_OFN4_n43), 
	.A(n18));
   HS65_LS_BFX71 FE_OFC29_n43 (.Z(FE_OFN29_n43), 
	.A(FE_OFN4_n43));
   HS65_LS_BFX53 FE_OFC4_n43 (.Z(FE_OFN4_n43), 
	.A(n43));
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
   HS65_LS_NOR2AX19 U5 (.Z(n34), 
	.B(data_in[32]), 
	.A(data_in[33]));
   HS65_LS_CNIVX34 U6 (.Z(n39), 
	.A(n44));
   HS65_LS_IVX9 U7 (.Z(n38), 
	.A(n44));
   HS65_LS_IVX9 U9 (.Z(n40), 
	.A(n44));
   HS65_LS_NOR2X6 U11 (.Z(N12), 
	.B(n36), 
	.A(FE_OFN29_n43));
   HS65_LS_OAI22X6 U12 (.Z(data_out[6]), 
	.D(n27), 
	.C(n38), 
	.B(n25), 
	.A(n44));
   HS65_LS_OAI22X6 U13 (.Z(data_out[7]), 
	.D(n26), 
	.C(n38), 
	.B(FE_OFN29_n43), 
	.A(n24));
   HS65_LS_OAI22X6 U15 (.Z(data_out[1]), 
	.D(n32), 
	.C(n39), 
	.B(n30), 
	.A(FE_OFN29_n43));
   HS65_LS_OAI22X6 U16 (.Z(data_out[2]), 
	.D(n31), 
	.C(n38), 
	.B(n29), 
	.A(FE_OFN29_n43));
   HS65_LS_OAI22X6 U17 (.Z(data_out[3]), 
	.D(n30), 
	.C(n38), 
	.B(n28), 
	.A(FE_OFN29_n43));
   HS65_LS_OAI22X6 U18 (.Z(data_out[4]), 
	.D(n29), 
	.C(n38), 
	.B(n27), 
	.A(FE_OFN29_n43));
   HS65_LS_OAI22X6 U19 (.Z(data_out[5]), 
	.D(n28), 
	.C(n39), 
	.B(n26), 
	.A(FE_OFN29_n43));
   HS65_LS_OAI22X6 U20 (.Z(data_out[8]), 
	.D(n25), 
	.C(n38), 
	.B(n23), 
	.A(FE_OFN29_n43));
   HS65_LS_OAI22X6 U21 (.Z(data_out[9]), 
	.D(n24), 
	.C(n38), 
	.B(n22), 
	.A(FE_OFN4_n43));
   HS65_LS_OAI22X6 U23 (.Z(data_out[11]), 
	.D(n22), 
	.C(n40), 
	.B(n20), 
	.A(FE_OFN4_n43));
   HS65_LS_OAI22X6 U24 (.Z(data_out[12]), 
	.D(n21), 
	.C(n40), 
	.B(n19), 
	.A(FE_OFN29_n43));
   HS65_LS_OAI22X6 U26 (.Z(data_out[14]), 
	.D(n19), 
	.C(n40), 
	.B(n17), 
	.A(FE_OFN29_n43));
   HS65_LS_OAI22X6 U27 (.Z(data_out[15]), 
	.D(n18), 
	.C(n39), 
	.B(n16), 
	.A(FE_OFN4_n43));
   HS65_LS_OAI22X6 U28 (.Z(data_out[16]), 
	.D(n17), 
	.C(n39), 
	.B(n15), 
	.A(FE_OFN29_n43));
   HS65_LS_OAI22X6 U29 (.Z(data_out[17]), 
	.D(n16), 
	.C(n39), 
	.B(n14), 
	.A(FE_OFN4_n43));
   HS65_LS_OAI22X6 U30 (.Z(data_out[18]), 
	.D(n15), 
	.C(n39), 
	.B(n13), 
	.A(FE_OFN29_n43));
   HS65_LS_OAI22X6 U31 (.Z(data_out[19]), 
	.D(n14), 
	.C(n39), 
	.B(n12), 
	.A(FE_OFN4_n43));
   HS65_LS_OAI22X6 U32 (.Z(data_out[20]), 
	.D(n13), 
	.C(n39), 
	.B(n11), 
	.A(FE_OFN29_n43));
   HS65_LS_OAI22X6 U33 (.Z(data_out[21]), 
	.D(n12), 
	.C(n39), 
	.B(n10), 
	.A(FE_OFN4_n43));
   HS65_LS_OAI22X6 U34 (.Z(data_out[22]), 
	.D(n11), 
	.C(n39), 
	.B(n9), 
	.A(FE_OFN29_n43));
   HS65_LS_OAI22X6 U35 (.Z(data_out[23]), 
	.D(n10), 
	.C(n39), 
	.B(n8), 
	.A(FE_OFN4_n43));
   HS65_LS_OAI22X6 U36 (.Z(data_out[24]), 
	.D(n9), 
	.C(n39), 
	.B(n7), 
	.A(FE_OFN29_n43));
   HS65_LS_OAI22X6 U37 (.Z(data_out[25]), 
	.D(n8), 
	.C(n38), 
	.B(n6), 
	.A(FE_OFN4_n43));
   HS65_LS_OAI22X6 U38 (.Z(data_out[26]), 
	.D(n7), 
	.C(n38), 
	.B(n5), 
	.A(FE_OFN29_n43));
   HS65_LS_OAI22X6 U39 (.Z(data_out[27]), 
	.D(n6), 
	.C(n38), 
	.B(n4), 
	.A(FE_OFN4_n43));
   HS65_LS_OAI22X6 U40 (.Z(data_out[28]), 
	.D(n5), 
	.C(n38), 
	.B(n3), 
	.A(FE_OFN29_n43));
   HS65_LS_OAI22X6 U41 (.Z(data_out[29]), 
	.D(n4), 
	.C(n38), 
	.B(n2), 
	.A(FE_OFN4_n43));
   HS65_LS_IVX9 U42 (.Z(n44), 
	.A(n34));
   HS65_LS_IVX9 U43 (.Z(n43), 
	.A(n34));
   HS65_LS_NOR2X6 U44 (.Z(data_out[30]), 
	.B(n3), 
	.A(n40));
   HS65_LS_NOR2X6 U45 (.Z(data_out[31]), 
	.B(n2), 
	.A(n40));
   HS65_LS_NAND3X5 U46 (.Z(n35), 
	.C(n40), 
	.B(n37), 
	.A(n36));
   HS65_LS_NAND2X7 U47 (.Z(n36), 
	.B(n33), 
	.A(n32));
   HS65_LS_NOR2X6 U48 (.Z(N15), 
	.B(n35), 
	.A(n33));
   HS65_LS_NOR2X6 U49 (.Z(N13), 
	.B(n37), 
	.A(FE_OFN29_n43));
   HS65_LS_IVX9 U50 (.Z(n33), 
	.A(data_in[0]));
   HS65_LS_IVX9 U51 (.Z(n32), 
	.A(data_in[1]));
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
   HS65_LS_NAND2X7 U82 (.Z(n37), 
	.B(n32), 
	.A(data_in[0]));
   HS65_LS_NOR2AX3 U83 (.Z(N16), 
	.B(data_in[32]), 
	.A(data_valid));
   HS65_LS_NOR2X6 U84 (.Z(N14), 
	.B(n35), 
	.A(data_in[0]));
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
   wire not_Ain;

   assign Rout = Aout ;

   c_gate_0_1 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Aout));
   HS65_LH_IVX2 I_0 (.Z(not_Ain), 
	.A(Ain));
   HS65_LSS_XOR2X6 U1 (.Z(lt_en), 
	.B(Ain), 
	.A(Aout));
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
   wire FE_PHN336_preset;
   wire FE_PHN329_preset;
   wire FE_PHN328_preset;
   wire FE_PHN309_preset;
   wire FE_PHN305_preset;
   wire FE_PHN303_preset;
   wire FE_PHN186_preset;
   wire lt_en__CASCADE_L3_N0;
   wire lt_en__CASCADE_L2_N0;
   wire lt_en__CASCADE_L1_N0;
   wire N0;
   wire lt_en;
   wire N3;
   wire N4;
   wire n4;
   wire n5;
   wire n6;
   wire n7;

   assign N0 = preset ;

   HS65_LS_BFX7 FE_PHC336_preset (.Z(FE_PHN336_preset), 
	.A(N0));
   HS65_LS_BFX7 FE_PHC329_preset (.Z(FE_PHN329_preset), 
	.A(N0));
   HS65_LH_BFX9 FE_PHC328_preset (.Z(FE_PHN328_preset), 
	.A(N0));
   HS65_LH_BFX2 FE_PHC309_preset (.Z(FE_PHN309_preset), 
	.A(FE_PHN336_preset));
   HS65_LH_BFX4 FE_PHC305_preset (.Z(FE_PHN305_preset), 
	.A(FE_PHN309_preset));
   HS65_LH_DLYIC2X9 FE_PHC303_preset (.Z(FE_PHN303_preset), 
	.A(FE_PHN328_preset));
   HS65_LH_DLYIC4X9 FE_PHC186_preset (.Z(FE_PHN186_preset), 
	.A(FE_PHN305_preset));
   HS65_LS_BFX9 lt_en__CASCADE_L3_I0 (.Z(lt_en__CASCADE_L3_N0), 
	.A(lt_en__CASCADE_L2_N0));
   HS65_LS_BFX9 lt_en__CASCADE_L2_I0 (.Z(lt_en__CASCADE_L2_N0), 
	.A(lt_en__CASCADE_L1_N0));
   HS65_LS_BFX9 lt_en__CASCADE_L1_I0 (.Z(lt_en__CASCADE_L1_N0), 
	.A(lt_en));
   latch_controller_1_1 controller (.preset(N0), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX18 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
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
   HS65_LS_LDHQX9 type_out_reg (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(N4));
   HS65_LS_AND2X4 U5 (.Z(n7), 
	.B(FE_PHN303_preset), 
	.A(1'b1));
   HS65_LS_AND2X4 U6 (.Z(n6), 
	.B(n4), 
	.A(n5));
   HS65_LS_OR2X9 U7 (.Z(N3), 
	.B(n6), 
	.A(n7));
   HS65_LS_NOR2AX3 U3 (.Z(N4), 
	.B(FE_PHN329_preset), 
	.A(\left_in[DATA][33] ));
   HS65_LS_IVX9 U4 (.Z(n4), 
	.A(FE_PHN186_preset));
   HS65_LS_IVX9 U8 (.Z(n5), 
	.A(lt_en__CASCADE_L3_N0));
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
   wire FE_PHN365_req_n;
   wire FE_PHN191_req_n;
   wire FE_PHN61_req_n;
   wire n10;
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

   assign sel[4] = 1'b0 ;

   HS65_LS_BFX7 FE_PHC365_req_n (.Z(FE_PHN365_req_n), 
	.A(req_n));
   HS65_LH_BFX7 FE_PHC191_req_n (.Z(FE_PHN191_req_n), 
	.A(FE_PHN365_req_n));
   HS65_LH_DLYIC2X7 FE_PHC61_req_n (.Z(FE_PHN61_req_n), 
	.A(FE_PHN191_req_n));
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
	.sel({ n10,
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
   HS65_LS_IVX9 I_0 (.Z(req_n), 
	.A(\chan_in_f[REQ] ));
   HS65_LS_IVX9 I_1 (.Z(\chan_internal_f[REQ] ), 
	.A(FE_PHN61_req_n));
   HS65_LSS_XOR2X6 U9 (.Z(data_in_valid), 
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

   HS65_LS_AND2X4 C8 (.Z(q), 
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
   HS65_LS_IVX9 U4 (.Z(n1), 
	.A(\input [0]));
   HS65_LS_NOR3X4 U5 (.Z(n3), 
	.C(\input [4]), 
	.B(preset), 
	.A(\input [3]));
   HS65_LS_AO31X9 U6 (.Z(set), 
	.D(preset), 
	.C(\input [4]), 
	.B(\input [3]), 
	.A(n2));
   HS65_LS_AND3X9 U7 (.Z(n2), 
	.C(\input [2]), 
	.B(\input [0]), 
	.A(\input [1]));
endmodule

module sr_latch_1_6 (
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

   sr_latch_1_6 latch (.s(set), 
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
   wire FE_RN_644_0;
   wire FE_RN_643_0;
   wire FE_RN_642_0;
   wire FE_RN_641_0;
   wire FE_RN_640_0;
   wire FE_RN_639_0;
   wire FE_RN_638_0;
   wire FE_RN_637_0;
   wire FE_RN_636_0;
   wire FE_RN_635_0;
   wire FE_RN_634_0;
   wire FE_RN_633_0;
   wire FE_RN_632_0;
   wire FE_RN_631_0;
   wire FE_RN_630_0;
   wire FE_RN_625_0;
   wire FE_RN_624_0;
   wire FE_RN_618_0;
   wire FE_RN_617_0;
   wire FE_RN_616_0;
   wire FE_RN_615_0;
   wire FE_RN_613_0;
   wire FE_RN_612_0;
   wire FE_RN_603_0;
   wire FE_RN_602_0;
   wire FE_RN_600_0;
   wire FE_RN_579_0;
   wire FE_RN_578_0;
   wire FE_RN_566_0;
   wire FE_RN_564_0;
   wire FE_RN_492_0;
   wire FE_RN_491_0;
   wire FE_RN_490_0;
   wire FE_RN_486_0;
   wire FE_RN_485_0;
   wire FE_RN_484_0;
   wire FE_RN_483_0;
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
   wire FE_RN_470_0;
   wire FE_RN_469_0;
   wire FE_RN_468_0;
   wire FE_RN_467_0;
   wire FE_RN_466_0;
   wire FE_RN_465_0;
   wire FE_RN_464_0;
   wire FE_RN_463_0;
   wire FE_RN_462_0;
   wire FE_RN_461_0;
   wire FE_RN_460_0;
   wire FE_RN_459_0;
   wire FE_RN_458_0;
   wire FE_RN_457_0;
   wire FE_RN_456_0;
   wire FE_RN_455_0;
   wire FE_RN_454_0;
   wire FE_RN_453_0;
   wire FE_RN_452_0;
   wire FE_RN_451_0;
   wire FE_RN_449_0;
   wire FE_RN_448_0;
   wire FE_RN_447_0;
   wire FE_RN_446_0;
   wire FE_RN_445_0;
   wire FE_RN_444_0;
   wire FE_RN_443_0;
   wire FE_RN_442_0;
   wire FE_RN_441_0;
   wire FE_RN_440_0;
   wire FE_RN_439_0;
   wire FE_RN_438_0;
   wire FE_RN_437_0;
   wire FE_RN_436_0;
   wire FE_RN_435_0;
   wire FE_RN_434_0;
   wire FE_RN_433_0;
   wire FE_RN_432_0;
   wire FE_RN_431_0;
   wire FE_RN_430_0;
   wire FE_RN_429_0;
   wire FE_RN_428_0;
   wire FE_RN_427_0;
   wire FE_RN_426_0;
   wire FE_RN_425_0;
   wire FE_RN_424_0;
   wire FE_RN_423_0;
   wire FE_RN_422_0;
   wire FE_RN_421_0;
   wire FE_RN_420_0;
   wire FE_RN_419_0;
   wire FE_RN_418_0;
   wire FE_RN_417_0;
   wire FE_RN_416_0;
   wire FE_RN_415_0;
   wire FE_RN_414_0;
   wire FE_RN_413_0;
   wire FE_RN_412_0;
   wire FE_RN_411_0;
   wire FE_RN_410_0;
   wire FE_RN_409_0;
   wire FE_RN_408_0;
   wire FE_RN_407_0;
   wire FE_RN_406_0;
   wire FE_RN_405_0;
   wire FE_RN_404_0;
   wire FE_RN_403_0;
   wire FE_RN_402_0;
   wire FE_RN_401_0;
   wire FE_RN_400_0;
   wire FE_RN_399_0;
   wire FE_RN_398_0;
   wire FE_RN_397_0;
   wire FE_RN_396_0;
   wire FE_RN_395_0;
   wire FE_RN_394_0;
   wire FE_RN_393_0;
   wire FE_RN_392_0;
   wire FE_RN_391_0;
   wire FE_RN_390_0;
   wire FE_RN_389_0;
   wire FE_RN_388_0;
   wire FE_RN_387_0;
   wire FE_RN_386_0;
   wire FE_RN_385_0;
   wire FE_RN_384_0;
   wire FE_RN_383_0;
   wire FE_RN_382_0;
   wire FE_RN_381_0;
   wire FE_RN_380_0;
   wire FE_RN_379_0;
   wire FE_RN_378_0;
   wire FE_RN_377_0;
   wire FE_RN_376_0;
   wire FE_RN_375_0;
   wire FE_RN_371_0;
   wire FE_RN_370_0;
   wire FE_RN_369_0;
   wire FE_RN_368_0;
   wire FE_RN_367_0;
   wire FE_RN_366_0;
   wire FE_RN_365_0;
   wire FE_RN_364_0;
   wire FE_RN_363_0;
   wire FE_RN_362_0;
   wire FE_RN_361_0;
   wire FE_RN_360_0;
   wire FE_RN_359_0;
   wire FE_RN_358_0;
   wire FE_RN_357_0;
   wire FE_RN_356_0;
   wire FE_RN_355_0;
   wire FE_RN_354_0;
   wire FE_RN_353_0;
   wire FE_RN_351_0;
   wire FE_RN_350_0;
   wire FE_RN_349_0;
   wire FE_RN_348_0;
   wire FE_RN_347_0;
   wire FE_RN_346_0;
   wire FE_RN_345_0;
   wire FE_RN_344_0;
   wire FE_RN_343_0;
   wire FE_RN_342_0;
   wire FE_RN_335_0;
   wire FE_RN_332_0;
   wire FE_RN_328_0;
   wire FE_RN_327_0;
   wire FE_RN_326_0;
   wire FE_RN_324_0;
   wire FE_RN_323_0;
   wire FE_RN_322_0;
   wire FE_RN_321_0;
   wire FE_RN_320_0;
   wire FE_RN_319_0;
   wire FE_RN_318_0;
   wire FE_RN_317_0;
   wire FE_RN_316_0;
   wire FE_RN_315_0;
   wire FE_RN_314_0;
   wire FE_RN_313_0;
   wire FE_RN_312_0;
   wire FE_RN_311_0;
   wire FE_RN_310_0;
   wire FE_RN_309_0;
   wire FE_RN_289_0;
   wire FE_RN_288_0;
   wire FE_RN_287_0;
   wire FE_RN_286_0;
   wire FE_RN_285_0;
   wire FE_RN_284_0;
   wire FE_RN_283_0;
   wire FE_RN_282_0;
   wire FE_RN_281_0;
   wire FE_RN_280_0;
   wire FE_RN_279_0;
   wire FE_RN_278_0;
   wire FE_RN_277_0;
   wire FE_RN_276_0;
   wire FE_RN_275_0;
   wire FE_RN_274_0;
   wire FE_RN_273_0;
   wire FE_RN_272_0;
   wire FE_RN_271_0;
   wire FE_RN_270_0;
   wire FE_RN_269_0;
   wire FE_RN_268_0;
   wire FE_RN_267_0;
   wire FE_RN_266_0;
   wire FE_RN_265_0;
   wire FE_RN_264_0;
   wire FE_RN_263_0;
   wire FE_RN_262_0;
   wire FE_RN_261_0;
   wire FE_RN_260_0;
   wire FE_RN_259_0;
   wire FE_RN_258_0;
   wire FE_RN_257_0;
   wire FE_RN_256_0;
   wire FE_RN_255_0;
   wire FE_RN_254_0;
   wire FE_RN_253_0;
   wire FE_RN_252_0;
   wire FE_RN_251_0;
   wire FE_RN_250_0;
   wire FE_RN_249_0;
   wire FE_RN_248_0;
   wire FE_RN_247_0;
   wire FE_RN_246_0;
   wire FE_RN_245_0;
   wire FE_RN_244_0;
   wire FE_RN_243_0;
   wire FE_RN_242_0;
   wire FE_RN_241_0;
   wire FE_RN_240_0;
   wire FE_RN_239_0;
   wire FE_RN_238_0;
   wire FE_RN_237_0;
   wire FE_RN_236_0;
   wire FE_RN_235_0;
   wire FE_RN_233_0;
   wire FE_RN_232_0;
   wire FE_RN_231_0;
   wire FE_RN_230_0;
   wire FE_RN_229_0;
   wire FE_RN_228_0;
   wire FE_RN_227_0;
   wire FE_RN_226_0;
   wire FE_RN_225_0;
   wire FE_RN_224_0;
   wire FE_RN_223_0;
   wire FE_RN_222_0;
   wire FE_RN_221_0;
   wire FE_RN_220_0;
   wire FE_RN_219_0;
   wire FE_RN_218_0;
   wire FE_RN_217_0;
   wire FE_RN_214_0;
   wire FE_RN_213_0;
   wire FE_RN_212_0;
   wire FE_RN_211_0;
   wire FE_RN_210_0;
   wire FE_RN_208_0;
   wire FE_RN_207_0;
   wire FE_RN_206_0;
   wire FE_RN_205_0;
   wire FE_RN_204_0;
   wire FE_RN_203_0;
   wire FE_RN_202_0;
   wire FE_RN_201_0;
   wire FE_RN_200_0;
   wire FE_RN_199_0;
   wire FE_RN_198_0;
   wire FE_RN_197_0;
   wire FE_RN_196_0;
   wire FE_RN_195_0;
   wire FE_RN_194_0;
   wire FE_RN_193_0;
   wire FE_RN_192_0;
   wire FE_RN_190_0;
   wire FE_RN_181_0;
   wire FE_RN_180_0;
   wire FE_RN_179_0;
   wire FE_RN_178_0;
   wire FE_RN_177_0;
   wire FE_RN_176_0;
   wire FE_RN_175_0;
   wire FE_RN_174_0;
   wire FE_RN_173_0;
   wire FE_RN_172_0;
   wire FE_RN_171_0;
   wire FE_RN_170_0;
   wire FE_RN_169_0;
   wire FE_RN_168_0;
   wire FE_RN_167_0;
   wire FE_RN_166_0;
   wire FE_RN_165_0;
   wire FE_RN_164_0;
   wire FE_RN_163_0;
   wire FE_RN_162_0;
   wire FE_RN_161_0;
   wire FE_RN_160_0;
   wire FE_RN_159_0;
   wire FE_RN_158_0;
   wire FE_RN_157_0;
   wire FE_RN_146_0;
   wire FE_RN_142_0;
   wire FE_RN_141_0;
   wire FE_RN_140_0;
   wire FE_RN_139_0;
   wire FE_RN_126_0;
   wire FE_RN_125_0;
   wire FE_RN_124_0;
   wire FE_RN_123_0;
   wire FE_RN_101_0;
   wire FE_RN_100_0;
   wire FE_RN_99_0;
   wire FE_RN_97_0;
   wire FE_RN_16_0;
   wire FE_RN_1_0;
   wire FE_RN_0_0;
   wire FE_OFN50_switch_sel_4_;
   wire FE_OFN49_switch_sel_3_;
   wire FE_OFN48_switch_sel_2_;
   wire FE_OFN47_switch_sel_1_;
   wire FE_OFN46_switch_sel_1_;
   wire FE_OFN45_switch_sel_14_;
   wire FE_OFN44_switch_sel_14_;
   wire FE_OFN43_switch_sel_13_;
   wire FE_OFN42_switch_sel_11_;
   wire FE_OFN41_switch_sel_10_;
   wire FE_OFN40_switch_sel_9_;
   wire FE_OFN39_switch_sel_8_;
   wire FE_OFN38_switch_sel_7_;
   wire FE_OFN37_switch_sel_5_;
   wire FE_OFN36_n1;
   wire FE_OFN35_n7;
   wire FE_OFN28_n6;
   wire FE_OFN27_n8;
   wire FE_OFN26_n9;
   wire FE_OFN25_n10;
   wire FE_OFN24_n2;
   wire FE_OFN23_n3;
   wire FE_OFN22_n4;
   wire FE_OFN21_n5;
   wire FE_OFN1_n7;
   wire FE_OFN0_n1;
   wire synced_req;
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
   wire n153;
   wire n154;
   wire n155;
   wire n156;
   wire n157;
   wire n158;
   wire n159;
   wire n160;
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
   wire n220;
   wire n221;
   wire n222;
   wire n224;
   wire n225;
   wire n226;
   wire n227;
   wire n228;
   wire n229;
   wire n230;
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
   assign \chs_out_f[0][REQ]  = synced_req ;
   assign \chs_out_f[1][REQ]  = synced_req ;
   assign \chs_out_f[2][REQ]  = synced_req ;
   assign \chs_out_f[3][REQ]  = synced_req ;
   assign \chs_out_f[4][REQ]  = synced_req ;

   HS65_LS_IVX9 FE_RC_952_0 (.Z(FE_RN_644_0), 
	.A(\chs_in_f[1][DATA][18] ));
   HS65_LS_CNIVX14 FE_RC_951_0 (.Z(FE_RN_643_0), 
	.A(\switch_sel[1][4] ));
   HS65_LS_AOI22X6 FE_RC_950_0 (.Z(FE_RN_642_0), 
	.D(FE_OFN45_switch_sel_14_), 
	.C(\chs_in_f[2][DATA][18] ), 
	.B(\switch_sel[0][4] ), 
	.A(\chs_in_f[0][DATA][18] ));
   HS65_LS_CNIVX14 FE_RC_949_0 (.Z(FE_RN_641_0), 
	.A(FE_OFN36_n1));
   HS65_LS_CNIVX7 FE_RC_948_0 (.Z(FE_RN_640_0), 
	.A(n26));
   HS65_LS_CNIVX14 FE_RC_947_0 (.Z(FE_RN_639_0), 
	.A(FE_OFN28_n6));
   HS65_LS_NOR2AX13 FE_RC_946_0 (.Z(FE_RN_638_0), 
	.B(n60), 
	.A(FE_RN_639_0));
   HS65_LS_AOI21X12 FE_RC_945_0 (.Z(FE_RN_637_0), 
	.C(FE_RN_638_0), 
	.B(FE_RN_640_0), 
	.A(FE_RN_641_0));
   HS65_LS_OAI211X5 FE_RC_944_0 (.Z(\chs_out_f[4][DATA][18] ), 
	.D(FE_RN_637_0), 
	.C(FE_RN_642_0), 
	.B(FE_RN_643_0), 
	.A(FE_RN_644_0));
   HS65_LS_CNIVX14 FE_RC_943_0 (.Z(FE_RN_636_0), 
	.A(FE_OFN36_n1));
   HS65_LS_CNIVX7 FE_RC_942_0 (.Z(FE_RN_635_0), 
	.A(n40));
   HS65_LS_NOR2X13 FE_RC_941_0 (.Z(FE_RN_634_0), 
	.B(n74), 
	.A(FE_OFN28_n6));
   HS65_LS_AOI21X12 FE_RC_940_0 (.Z(FE_RN_633_0), 
	.C(FE_RN_634_0), 
	.B(FE_RN_635_0), 
	.A(FE_RN_636_0));
   HS65_LS_CNIVX14 FE_RC_939_0 (.Z(FE_RN_632_0), 
	.A(\switch_sel[0][4] ));
   HS65_LS_CNNOR2AX15 FE_RC_938_0 (.Z(FE_RN_631_0), 
	.B(FE_RN_632_0), 
	.A(\chs_in_f[0][DATA][4] ));
   HS65_LS_AOI212X9 FE_RC_937_0 (.Z(FE_RN_630_0), 
	.E(FE_RN_631_0), 
	.D(\switch_sel[1][4] ), 
	.C(\chs_in_f[1][DATA][4] ), 
	.B(FE_OFN45_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][4] ));
   HS65_LS_NAND2X11 FE_RC_936_0 (.Z(\chs_out_f[4][DATA][4] ), 
	.B(FE_RN_630_0), 
	.A(FE_RN_633_0));
   HS65_LS_AO22X18 FE_RC_930_0 (.Z(FE_RN_625_0), 
	.D(\chs_in_f[2][DATA][29] ), 
	.C(\switch_sel[2][3] ), 
	.B(\chs_in_f[0][DATA][29] ), 
	.A(\switch_sel[0][3] ));
   HS65_LS_AOI12X6 FE_RC_929_0 (.Z(FE_RN_624_0), 
	.C(FE_RN_625_0), 
	.B(\switch_sel[1][3] ), 
	.A(\chs_in_f[1][DATA][29] ));
   HS65_LS_OAI212X5 FE_RC_928_0 (.Z(\chs_out_f[3][DATA][29] ), 
	.E(FE_RN_624_0), 
	.D(n15), 
	.C(FE_OFN24_n2), 
	.B(FE_OFN35_n7), 
	.A(n49));
   HS65_LS_AO22X18 FE_RC_923_0 (.Z(FE_RN_618_0), 
	.D(\chs_in_f[0][DATA][26] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][26] ), 
	.A(1'b0));
   HS65_LS_AOI12X12 FE_RC_922_0 (.Z(FE_RN_617_0), 
	.C(FE_RN_618_0), 
	.B(FE_OFN38_switch_sel_7_), 
	.A(\chs_in_f[1][DATA][26] ));
   HS65_LS_OAI212X5 FE_RC_921_0 (.Z(\chs_out_f[2][DATA][26] ), 
	.E(FE_RN_617_0), 
	.D(n18), 
	.C(FE_OFN23_n3), 
	.B(n52), 
	.A(n8));
   HS65_LS_CNIVX14 FE_RC_920_0 (.Z(FE_RN_616_0), 
	.A(FE_OFN27_n8));
   HS65_LS_NAND2AX21 FE_RC_919_0 (.Z(FE_RN_615_0), 
	.B(FE_RN_616_0), 
	.A(n51));
   HS65_LS_AO22X9 FE_RC_918_0 (.Z(FE_RN_613_0), 
	.D(\chs_in_f[0][DATA][27] ), 
	.C(FE_OFN48_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][27] ), 
	.A(1'b0));
   HS65_LS_AOI12X6 FE_RC_917_0 (.Z(FE_RN_612_0), 
	.C(FE_RN_613_0), 
	.B(\switch_sel[1][2] ), 
	.A(\chs_in_f[1][DATA][27] ));
   HS65_LS_OAI112X8 FE_RC_916_0 (.Z(\chs_out_f[2][DATA][27] ), 
	.D(FE_RN_612_0), 
	.C(FE_RN_615_0), 
	.B(n17), 
	.A(FE_OFN23_n3));
   HS65_LS_CNIVX14 FE_RC_907_0 (.Z(FE_RN_603_0), 
	.A(FE_OFN25_n10));
   HS65_LS_NAND2AX21 FE_RC_906_0 (.Z(FE_RN_602_0), 
	.B(FE_RN_603_0), 
	.A(n53));
   HS65_LS_AOI222X2 FE_RC_905_0 (.Z(FE_RN_600_0), 
	.F(\switch_sel[2][0] ), 
	.E(\chs_in_f[2][DATA][25] ), 
	.D(\switch_sel[1][0] ), 
	.C(\chs_in_f[1][DATA][25] ), 
	.B(\chs_in_f[0][DATA][25] ), 
	.A(1'b0));
   HS65_LS_OAI112X8 FE_RC_904_0 (.Z(\chs_out_f[0][DATA][25] ), 
	.D(FE_RN_600_0), 
	.C(FE_RN_602_0), 
	.B(n19), 
	.A(n5));
   HS65_LS_AO22X9 FE_RC_884_0 (.Z(FE_RN_579_0), 
	.D(\switch_sel[0][2] ), 
	.C(\chs_in_f[0][DATA][4] ), 
	.B(\chs_in_f[2][DATA][4] ), 
	.A(1'b0));
   HS65_LS_AOI12X12 FE_RC_883_0 (.Z(FE_RN_578_0), 
	.C(FE_RN_579_0), 
	.B(\switch_sel[1][2] ), 
	.A(\chs_in_f[1][DATA][4] ));
   HS65_LS_OAI212X10 FE_RC_882_0 (.Z(\chs_out_f[2][DATA][4] ), 
	.E(FE_RN_578_0), 
	.D(n40), 
	.C(FE_OFN23_n3), 
	.B(FE_OFN27_n8), 
	.A(n74));
   HS65_LS_AOI222X4 FE_RC_871_0 (.Z(FE_RN_566_0), 
	.F(\switch_sel[2][1] ), 
	.E(\chs_in_f[2][DATA][31] ), 
	.D(\switch_sel[0][1] ), 
	.C(\chs_in_f[0][DATA][31] ), 
	.B(\chs_in_f[1][DATA][31] ), 
	.A(1'b0));
   HS65_LS_OAI212X5 FE_RC_870_0 (.Z(\chs_out_f[1][DATA][31] ), 
	.E(FE_RN_566_0), 
	.D(n13), 
	.C(FE_OFN22_n4), 
	.B(n47), 
	.A(FE_OFN26_n9));
   HS65_LS_AOI222X4 FE_RC_869_0 (.Z(FE_RN_564_0), 
	.F(\switch_sel[1][0] ), 
	.E(\chs_in_f[1][DATA][32] ), 
	.D(\switch_sel[2][0] ), 
	.C(\chs_in_f[2][DATA][32] ), 
	.B(\chs_in_f[0][DATA][32] ), 
	.A(1'b0));
   HS65_LS_OAI212X5 FE_RC_868_0 (.Z(\chs_out_f[0][DATA][32] ), 
	.E(FE_RN_564_0), 
	.D(n5), 
	.C(n12), 
	.B(FE_OFN25_n10), 
	.A(n46));
   HS65_LS_CNIVX14 FE_RC_664_0 (.Z(FE_RN_492_0), 
	.A(n9));
   HS65_LS_CNIVX7 FE_RC_663_0 (.Z(FE_RN_491_0), 
	.A(n72));
   HS65_LS_NAND2X11 FE_RC_662_0 (.Z(FE_RN_490_0), 
	.B(FE_RN_491_0), 
	.A(FE_RN_492_0));
   HS65_LS_OAI211X5 FE_RC_661_0 (.Z(\chs_out_f[1][DATA][6] ), 
	.D(n184), 
	.C(FE_RN_490_0), 
	.B(n38), 
	.A(n4));
   HS65_LS_CNIVX7 FE_RC_656_0 (.Z(FE_RN_486_0), 
	.A(n4));
   HS65_LS_NOR2AX13 FE_RC_655_0 (.Z(FE_RN_485_0), 
	.B(n34), 
	.A(FE_RN_486_0));
   HS65_LS_NOR2X13 FE_RC_654_0 (.Z(FE_RN_484_0), 
	.B(n68), 
	.A(n9));
   HS65_LS_NOR2X13 FE_RC_653_0 (.Z(FE_RN_483_0), 
	.B(FE_RN_484_0), 
	.A(FE_RN_485_0));
   HS65_LS_NAND2X7 FE_RC_652_0 (.Z(\chs_out_f[1][DATA][10] ), 
	.B(n213), 
	.A(FE_RN_483_0));
   HS65_LS_CNIVX14 FE_RC_651_0 (.Z(FE_RN_482_0), 
	.A(n4));
   HS65_LS_CNIVX14 FE_RC_650_0 (.Z(FE_RN_481_0), 
	.A(n32));
   HS65_LS_CNIVX7 FE_RC_649_0 (.Z(FE_RN_480_0), 
	.A(n9));
   HS65_LS_NOR2AX13 FE_RC_648_0 (.Z(FE_RN_479_0), 
	.B(n66), 
	.A(FE_RN_480_0));
   HS65_LS_AOI21X9 FE_RC_647_0 (.Z(FE_RN_478_0), 
	.C(FE_RN_479_0), 
	.B(FE_RN_481_0), 
	.A(FE_RN_482_0));
   HS65_LS_NAND2X7 FE_RC_646_0 (.Z(\chs_out_f[1][DATA][12] ), 
	.B(n211), 
	.A(FE_RN_478_0));
   HS65_LS_OAI22X8 FE_RC_645_0 (.Z(FE_RN_477_0), 
	.D(n72), 
	.C(FE_OFN28_n6), 
	.B(n38), 
	.A(FE_OFN36_n1));
   HS65_LS_NAND2AX7 FE_RC_644_0 (.Z(\chs_out_f[4][DATA][6] ), 
	.B(n82), 
	.A(FE_RN_477_0));
   HS65_LS_CNIVX14 FE_RC_643_0 (.Z(FE_RN_476_0), 
	.A(FE_OFN36_n1));
   HS65_LS_CNIVX7 FE_RC_642_0 (.Z(FE_RN_475_0), 
	.A(n30));
   HS65_LS_CNIVX14 FE_RC_641_0 (.Z(FE_RN_474_0), 
	.A(FE_OFN28_n6));
   HS65_LS_NOR2AX13 FE_RC_640_0 (.Z(FE_RN_473_0), 
	.B(n64), 
	.A(FE_RN_474_0));
   HS65_LS_AOI21X9 FE_RC_639_0 (.Z(FE_RN_472_0), 
	.C(FE_RN_473_0), 
	.B(FE_RN_475_0), 
	.A(FE_RN_476_0));
   HS65_LS_NAND2X5 FE_RC_638_0 (.Z(\chs_out_f[4][DATA][14] ), 
	.B(n107), 
	.A(FE_RN_472_0));
   HS65_LS_OAI22X6 FE_RC_635_0 (.Z(FE_RN_470_0), 
	.D(n56), 
	.C(FE_OFN28_n6), 
	.B(n22), 
	.A(FE_OFN36_n1));
   HS65_LS_NAND2AX7 FE_RC_634_0 (.Z(\chs_out_f[4][DATA][22] ), 
	.B(n98), 
	.A(FE_RN_470_0));
   HS65_LS_CNIVX7 FE_RC_633_0 (.Z(FE_RN_469_0), 
	.A(n4));
   HS65_LS_NOR2AX13 FE_RC_632_0 (.Z(FE_RN_468_0), 
	.B(n39), 
	.A(FE_RN_469_0));
   HS65_LS_CNIVX7 FE_RC_631_0 (.Z(FE_RN_467_0), 
	.A(n9));
   HS65_LS_NOR2AX13 FE_RC_630_0 (.Z(FE_RN_466_0), 
	.B(n73), 
	.A(FE_RN_467_0));
   HS65_LS_NOR2X9 FE_RC_629_0 (.Z(FE_RN_465_0), 
	.B(FE_RN_466_0), 
	.A(FE_RN_468_0));
   HS65_LS_NAND2X7 FE_RC_628_0 (.Z(\chs_out_f[1][DATA][5] ), 
	.B(n185), 
	.A(FE_RN_465_0));
   HS65_LS_OAI22X11 FE_RC_627_0 (.Z(FE_RN_464_0), 
	.D(n35), 
	.C(n4), 
	.B(n69), 
	.A(n9));
   HS65_LS_NAND2AX7 FE_RC_626_0 (.Z(\chs_out_f[1][DATA][9] ), 
	.B(n181), 
	.A(FE_RN_464_0));
   HS65_LS_OAI22X6 FE_RC_625_0 (.Z(FE_RN_463_0), 
	.D(n67), 
	.C(n9), 
	.B(n33), 
	.A(n4));
   HS65_LS_NAND2AX7 FE_RC_624_0 (.Z(\chs_out_f[1][DATA][11] ), 
	.B(n212), 
	.A(FE_RN_463_0));
   HS65_LS_CNIVX7 FE_RC_623_0 (.Z(FE_RN_462_0), 
	.A(n4));
   HS65_LS_NOR2AX13 FE_RC_622_0 (.Z(FE_RN_461_0), 
	.B(n31), 
	.A(FE_RN_462_0));
   HS65_LS_CNIVX7 FE_RC_621_0 (.Z(FE_RN_460_0), 
	.A(n9));
   HS65_LS_NOR2AX13 FE_RC_620_0 (.Z(FE_RN_459_0), 
	.B(n65), 
	.A(FE_RN_460_0));
   HS65_LS_NOR2X9 FE_RC_619_0 (.Z(FE_RN_458_0), 
	.B(FE_RN_459_0), 
	.A(FE_RN_461_0));
   HS65_LS_NAND2X5 FE_RC_618_0 (.Z(\chs_out_f[1][DATA][13] ), 
	.B(n210), 
	.A(FE_RN_458_0));
   HS65_LS_OAI22X6 FE_RC_617_0 (.Z(FE_RN_457_0), 
	.D(n63), 
	.C(n9), 
	.B(n4), 
	.A(n29));
   HS65_LS_NAND2AX4 FE_RC_616_0 (.Z(\chs_out_f[1][DATA][15] ), 
	.B(n208), 
	.A(FE_RN_457_0));
   HS65_LS_OAI22X6 FE_RC_615_0 (.Z(FE_RN_456_0), 
	.D(n61), 
	.C(n9), 
	.B(n4), 
	.A(n27));
   HS65_LS_NAND2AX7 FE_RC_614_0 (.Z(\chs_out_f[1][DATA][17] ), 
	.B(n206), 
	.A(FE_RN_456_0));
   HS65_LS_CNIVX7 FE_RC_613_0 (.Z(FE_RN_455_0), 
	.A(n25));
   HS65_LS_CNIVX14 FE_RC_612_0 (.Z(FE_RN_454_0), 
	.A(n4));
   HS65_LS_CNIVX14 FE_RC_611_0 (.Z(FE_RN_453_0), 
	.A(n9));
   HS65_LS_NOR2AX13 FE_RC_610_0 (.Z(FE_RN_452_0), 
	.B(n59), 
	.A(FE_RN_453_0));
   HS65_LS_AOI21X9 FE_RC_609_0 (.Z(FE_RN_451_0), 
	.C(FE_RN_452_0), 
	.B(FE_RN_454_0), 
	.A(FE_RN_455_0));
   HS65_LS_NAND2X5 FE_RC_608_0 (.Z(\chs_out_f[1][DATA][19] ), 
	.B(n204), 
	.A(FE_RN_451_0));
   HS65_LS_CNIVX14 FE_RC_605_0 (.Z(FE_RN_449_0), 
	.A(FE_OFN36_n1));
   HS65_LS_CNIVX7 FE_RC_604_0 (.Z(FE_RN_448_0), 
	.A(n16));
   HS65_LS_CNIVX14 FE_RC_603_0 (.Z(FE_RN_447_0), 
	.A(FE_OFN28_n6));
   HS65_LS_NOR2AX13 FE_RC_602_0 (.Z(FE_RN_446_0), 
	.B(n50), 
	.A(FE_RN_447_0));
   HS65_LS_AOI21X9 FE_RC_601_0 (.Z(FE_RN_445_0), 
	.C(FE_RN_446_0), 
	.B(FE_RN_448_0), 
	.A(FE_RN_449_0));
   HS65_LS_NAND2X5 FE_RC_600_0 (.Z(\chs_out_f[4][DATA][28] ), 
	.B(n92), 
	.A(FE_RN_445_0));
   HS65_LS_CNIVX14 FE_RC_599_0 (.Z(FE_RN_444_0), 
	.A(FE_OFN36_n1));
   HS65_LS_CNIVX7 FE_RC_598_0 (.Z(FE_RN_443_0), 
	.A(n14));
   HS65_LS_CNIVX14 FE_RC_597_0 (.Z(FE_RN_442_0), 
	.A(FE_OFN28_n6));
   HS65_LS_NOR2AX19 FE_RC_596_0 (.Z(FE_RN_441_0), 
	.B(n48), 
	.A(FE_RN_442_0));
   HS65_LS_AOI21X9 FE_RC_595_0 (.Z(FE_RN_440_0), 
	.C(FE_RN_441_0), 
	.B(FE_RN_443_0), 
	.A(FE_RN_444_0));
   HS65_LS_NAND2X7 FE_RC_594_0 (.Z(\chs_out_f[4][DATA][30] ), 
	.B(n89), 
	.A(FE_RN_440_0));
   HS65_LS_CNIVX14 FE_RC_593_0 (.Z(FE_RN_439_0), 
	.A(FE_OFN26_n9));
   HS65_LS_NOR2AX13 FE_RC_592_0 (.Z(FE_RN_438_0), 
	.B(n77), 
	.A(FE_RN_439_0));
   HS65_LS_CNIVX14 FE_RC_591_0 (.Z(FE_RN_437_0), 
	.A(FE_OFN22_n4));
   HS65_LS_NOR2AX13 FE_RC_590_0 (.Z(FE_RN_436_0), 
	.B(n43), 
	.A(FE_RN_437_0));
   HS65_LS_NOR2X13 FE_RC_589_0 (.Z(FE_RN_435_0), 
	.B(FE_RN_436_0), 
	.A(FE_RN_438_0));
   HS65_LS_NAND2X7 FE_RC_588_0 (.Z(\chs_out_f[1][DATA][1] ), 
	.B(n203), 
	.A(FE_RN_435_0));
   HS65_LS_CNIVX7 FE_RC_587_0 (.Z(FE_RN_434_0), 
	.A(n75));
   HS65_LS_CNIVX14 FE_RC_586_0 (.Z(FE_RN_433_0), 
	.A(n9));
   HS65_LS_CNIVX14 FE_RC_585_0 (.Z(FE_RN_432_0), 
	.A(n4));
   HS65_LS_NOR2AX13 FE_RC_584_0 (.Z(FE_RN_431_0), 
	.B(n41), 
	.A(FE_RN_432_0));
   HS65_LS_AOI21X12 FE_RC_583_0 (.Z(FE_RN_430_0), 
	.C(FE_RN_431_0), 
	.B(FE_RN_433_0), 
	.A(FE_RN_434_0));
   HS65_LS_NAND2X7 FE_RC_582_0 (.Z(\chs_out_f[1][DATA][3] ), 
	.B(n187), 
	.A(FE_RN_430_0));
   HS65_LS_CNIVX14 FE_RC_581_0 (.Z(FE_RN_429_0), 
	.A(FE_OFN36_n1));
   HS65_LS_CNIVX14 FE_RC_580_0 (.Z(FE_RN_428_0), 
	.A(n12));
   HS65_LS_CNIVX14 FE_RC_579_0 (.Z(FE_RN_427_0), 
	.A(FE_OFN28_n6));
   HS65_LS_NOR2AX13 FE_RC_578_0 (.Z(FE_RN_426_0), 
	.B(n46), 
	.A(FE_RN_427_0));
   HS65_LS_AOI21X9 FE_RC_577_0 (.Z(FE_RN_425_0), 
	.C(FE_RN_426_0), 
	.B(FE_RN_428_0), 
	.A(FE_RN_429_0));
   HS65_LS_NAND2X7 FE_RC_576_0 (.Z(\chs_out_f[4][DATA][32] ), 
	.B(n87), 
	.A(FE_RN_425_0));
   HS65_LS_OAI22X6 FE_RC_575_0 (.Z(FE_RN_424_0), 
	.D(n68), 
	.C(n10), 
	.B(n34), 
	.A(FE_OFN21_n5));
   HS65_LS_NAND2AX7 FE_RC_574_0 (.Z(\chs_out_f[0][DATA][10] ), 
	.B(n247), 
	.A(FE_RN_424_0));
   HS65_LS_CNIVX14 FE_RC_573_0 (.Z(FE_RN_423_0), 
	.A(n32));
   HS65_LS_CNIVX7 FE_RC_572_0 (.Z(FE_RN_422_0), 
	.A(FE_OFN21_n5));
   HS65_LS_CNIVX7 FE_RC_571_0 (.Z(FE_RN_421_0), 
	.A(n10));
   HS65_LS_NOR2AX13 FE_RC_570_0 (.Z(FE_RN_420_0), 
	.B(n66), 
	.A(FE_RN_421_0));
   HS65_LS_AOI21X9 FE_RC_569_0 (.Z(FE_RN_419_0), 
	.C(FE_RN_420_0), 
	.B(FE_RN_422_0), 
	.A(FE_RN_423_0));
   HS65_LS_NAND2X7 FE_RC_568_0 (.Z(\chs_out_f[0][DATA][12] ), 
	.B(n245), 
	.A(FE_RN_419_0));
   HS65_LS_OAI22X6 FE_RC_567_0 (.Z(FE_RN_418_0), 
	.D(n65), 
	.C(FE_OFN25_n10), 
	.B(n31), 
	.A(n5));
   HS65_LS_NAND2AX7 FE_RC_566_0 (.Z(\chs_out_f[0][DATA][13] ), 
	.B(n244), 
	.A(FE_RN_418_0));
   HS65_LS_OAI22X6 FE_RC_565_0 (.Z(FE_RN_417_0), 
	.D(n63), 
	.C(FE_OFN25_n10), 
	.B(n5), 
	.A(n29));
   HS65_LS_NAND2AX7 FE_RC_564_0 (.Z(\chs_out_f[0][DATA][15] ), 
	.B(n242), 
	.A(FE_RN_417_0));
   HS65_LS_NOR2X6 FE_RC_563_0 (.Z(FE_RN_416_0), 
	.B(n5), 
	.A(n27));
   HS65_LS_CNIVX7 FE_RC_562_0 (.Z(FE_RN_415_0), 
	.A(FE_OFN25_n10));
   HS65_LS_NOR2AX13 FE_RC_561_0 (.Z(FE_RN_414_0), 
	.B(n61), 
	.A(FE_RN_415_0));
   HS65_LS_NOR2X9 FE_RC_560_0 (.Z(FE_RN_413_0), 
	.B(FE_RN_414_0), 
	.A(FE_RN_416_0));
   HS65_LS_NAND2X7 FE_RC_559_0 (.Z(\chs_out_f[0][DATA][17] ), 
	.B(n240), 
	.A(FE_RN_413_0));
   HS65_LS_OAI22X6 FE_RC_558_0 (.Z(FE_RN_412_0), 
	.D(n59), 
	.C(FE_OFN25_n10), 
	.B(n5), 
	.A(n25));
   HS65_LS_NAND2AX7 FE_RC_557_0 (.Z(\chs_out_f[0][DATA][19] ), 
	.B(n238), 
	.A(FE_RN_412_0));
   HS65_LS_CNIVX14 FE_RC_556_0 (.Z(FE_RN_411_0), 
	.A(n5));
   HS65_LS_NOR2AX13 FE_RC_555_0 (.Z(FE_RN_410_0), 
	.B(n23), 
	.A(FE_RN_411_0));
   HS65_LS_CNIVX7 FE_RC_554_0 (.Z(FE_RN_409_0), 
	.A(FE_OFN25_n10));
   HS65_LS_NOR2AX13 FE_RC_553_0 (.Z(FE_RN_408_0), 
	.B(n57), 
	.A(FE_RN_409_0));
   HS65_LS_NOR2X13 FE_RC_552_0 (.Z(FE_RN_407_0), 
	.B(FE_RN_408_0), 
	.A(FE_RN_410_0));
   HS65_LS_NAND2X5 FE_RC_551_0 (.Z(\chs_out_f[0][DATA][21] ), 
	.B(n235), 
	.A(FE_RN_407_0));
   HS65_LS_OAI22X6 FE_RC_550_0 (.Z(FE_RN_406_0), 
	.D(n55), 
	.C(FE_OFN25_n10), 
	.B(n21), 
	.A(n5));
   HS65_LS_NAND2AX7 FE_RC_549_0 (.Z(\chs_out_f[0][DATA][23] ), 
	.B(n233), 
	.A(FE_RN_406_0));
   HS65_LS_OR2X9 FE_RC_548_0 (.Z(FE_RN_405_0), 
	.B(n7), 
	.A(n72));
   HS65_LS_OAI211X4 FE_RC_547_0 (.Z(\chs_out_f[3][DATA][6] ), 
	.D(n116), 
	.C(FE_RN_405_0), 
	.B(n38), 
	.A(FE_OFN24_n2));
   HS65_LS_OR2X9 FE_RC_546_0 (.Z(FE_RN_404_0), 
	.B(n7), 
	.A(n71));
   HS65_LS_OAI211X5 FE_RC_545_0 (.Z(\chs_out_f[3][DATA][7] ), 
	.D(n115), 
	.C(FE_RN_404_0), 
	.B(n37), 
	.A(FE_OFN24_n2));
   HS65_LS_OR2X9 FE_RC_544_0 (.Z(FE_RN_403_0), 
	.B(n7), 
	.A(n70));
   HS65_LS_OAI211X4 FE_RC_543_0 (.Z(\chs_out_f[3][DATA][8] ), 
	.D(n114), 
	.C(FE_RN_403_0), 
	.B(n36), 
	.A(FE_OFN24_n2));
   HS65_LS_CNIVX7 FE_RC_542_0 (.Z(FE_RN_402_0), 
	.A(n68));
   HS65_LS_CNIVX7 FE_RC_541_0 (.Z(FE_RN_401_0), 
	.A(FE_OFN1_n7));
   HS65_LS_CNIVX7 FE_RC_540_0 (.Z(FE_RN_400_0), 
	.A(n2));
   HS65_LS_NOR2AX13 FE_RC_539_0 (.Z(FE_RN_399_0), 
	.B(n34), 
	.A(FE_RN_400_0));
   HS65_LS_AOI21X9 FE_RC_538_0 (.Z(FE_RN_398_0), 
	.C(FE_RN_399_0), 
	.B(FE_RN_401_0), 
	.A(FE_RN_402_0));
   HS65_LS_NAND2X7 FE_RC_537_0 (.Z(\chs_out_f[3][DATA][10] ), 
	.B(n145), 
	.A(FE_RN_398_0));
   HS65_LS_CNIVX7 FE_RC_536_0 (.Z(FE_RN_397_0), 
	.A(n66));
   HS65_LS_CNIVX7 FE_RC_535_0 (.Z(FE_RN_396_0), 
	.A(FE_OFN35_n7));
   HS65_LS_CNIVX7 FE_RC_534_0 (.Z(FE_RN_395_0), 
	.A(n2));
   HS65_LS_NOR2AX13 FE_RC_533_0 (.Z(FE_RN_394_0), 
	.B(n32), 
	.A(FE_RN_395_0));
   HS65_LS_AOI21X6 FE_RC_532_0 (.Z(FE_RN_393_0), 
	.C(FE_RN_394_0), 
	.B(FE_RN_396_0), 
	.A(FE_RN_397_0));
   HS65_LS_NAND2X7 FE_RC_531_0 (.Z(\chs_out_f[3][DATA][12] ), 
	.B(n143), 
	.A(FE_RN_393_0));
   HS65_LS_OAI22X6 FE_RC_530_0 (.Z(FE_RN_392_0), 
	.D(n30), 
	.C(n2), 
	.B(FE_OFN35_n7), 
	.A(n64));
   HS65_LS_NAND2AX7 FE_RC_529_0 (.Z(\chs_out_f[3][DATA][14] ), 
	.B(n141), 
	.A(FE_RN_392_0));
   HS65_LS_CNIVX7 FE_RC_528_0 (.Z(FE_RN_391_0), 
	.A(n62));
   HS65_LS_CNIVX7 FE_RC_527_0 (.Z(FE_RN_390_0), 
	.A(FE_OFN35_n7));
   HS65_LS_CNIVX14 FE_RC_526_0 (.Z(FE_RN_389_0), 
	.A(n2));
   HS65_LS_NOR2AX13 FE_RC_525_0 (.Z(FE_RN_388_0), 
	.B(n28), 
	.A(FE_RN_389_0));
   HS65_LS_AOI21X9 FE_RC_524_0 (.Z(FE_RN_387_0), 
	.C(FE_RN_388_0), 
	.B(FE_RN_390_0), 
	.A(FE_RN_391_0));
   HS65_LS_NAND2X7 FE_RC_523_0 (.Z(\chs_out_f[3][DATA][16] ), 
	.B(n139), 
	.A(FE_RN_387_0));
   HS65_LS_OAI22X6 FE_RC_522_0 (.Z(FE_RN_386_0), 
	.D(n26), 
	.C(n2), 
	.B(FE_OFN35_n7), 
	.A(n60));
   HS65_LS_NAND2AX7 FE_RC_521_0 (.Z(\chs_out_f[3][DATA][18] ), 
	.B(n137), 
	.A(FE_RN_386_0));
   HS65_LS_OAI22X6 FE_RC_520_0 (.Z(FE_RN_385_0), 
	.D(n22), 
	.C(n2), 
	.B(FE_OFN35_n7), 
	.A(n56));
   HS65_LS_NAND2AX4 FE_RC_519_0 (.Z(\chs_out_f[3][DATA][22] ), 
	.B(n132), 
	.A(FE_RN_385_0));
   HS65_LS_CNIVX7 FE_RC_518_0 (.Z(FE_RN_384_0), 
	.A(n3));
   HS65_LS_NOR2AX13 FE_RC_517_0 (.Z(FE_RN_383_0), 
	.B(n39), 
	.A(FE_RN_384_0));
   HS65_LS_CNIVX7 FE_RC_516_0 (.Z(FE_RN_382_0), 
	.A(FE_OFN27_n8));
   HS65_LS_NOR2AX13 FE_RC_515_0 (.Z(FE_RN_381_0), 
	.B(n73), 
	.A(FE_RN_382_0));
   HS65_LS_NOR2X13 FE_RC_514_0 (.Z(FE_RN_380_0), 
	.B(FE_RN_381_0), 
	.A(FE_RN_383_0));
   HS65_LS_NAND2X7 FE_RC_513_0 (.Z(\chs_out_f[2][DATA][5] ), 
	.B(n151), 
	.A(FE_RN_380_0));
   HS65_LS_CNIVX14 FE_RC_512_0 (.Z(FE_RN_379_0), 
	.A(FE_OFN27_n8));
   HS65_LS_CNIVX14 FE_RC_511_0 (.Z(FE_RN_378_0), 
	.A(n72));
   HS65_LS_NAND2X7 FE_RC_510_0 (.Z(FE_RN_377_0), 
	.B(FE_RN_378_0), 
	.A(FE_RN_379_0));
   HS65_LS_OAI211X4 FE_RC_509_0 (.Z(\chs_out_f[2][DATA][6] ), 
	.D(n150), 
	.C(FE_RN_377_0), 
	.B(n38), 
	.A(n3));
   HS65_LS_CNIVX7 FE_RC_508_0 (.Z(FE_RN_376_0), 
	.A(n71));
   HS65_LS_NAND2AX7 FE_RC_507_0 (.Z(FE_RN_375_0), 
	.B(FE_RN_376_0), 
	.A(FE_OFN27_n8));
   HS65_LS_OAI211X5 FE_RC_506_0 (.Z(\chs_out_f[2][DATA][7] ), 
	.D(n149), 
	.C(FE_RN_375_0), 
	.B(n37), 
	.A(n3));
   HS65_LS_OAI212X5 FE_RC_501_0 (.Z(\chs_out_f[2][DATA][9] ), 
	.E(n147), 
	.D(n35), 
	.C(n3), 
	.B(n69), 
	.A(FE_OFN27_n8));
   HS65_LS_OAI22X11 FE_RC_500_0 (.Z(FE_RN_371_0), 
	.D(n68), 
	.C(n8), 
	.B(n34), 
	.A(n3));
   HS65_LS_NAND2AX7 FE_RC_499_0 (.Z(\chs_out_f[2][DATA][10] ), 
	.B(n179), 
	.A(FE_RN_371_0));
   HS65_LS_CNIVX7 FE_RC_498_0 (.Z(FE_RN_370_0), 
	.A(n3));
   HS65_LS_NOR2AX13 FE_RC_497_0 (.Z(FE_RN_369_0), 
	.B(n33), 
	.A(FE_RN_370_0));
   HS65_LS_CNIVX7 FE_RC_496_0 (.Z(FE_RN_368_0), 
	.A(n8));
   HS65_LS_NOR2AX13 FE_RC_495_0 (.Z(FE_RN_367_0), 
	.B(n67), 
	.A(FE_RN_368_0));
   HS65_LS_NOR2X13 FE_RC_494_0 (.Z(FE_RN_366_0), 
	.B(FE_RN_367_0), 
	.A(FE_RN_369_0));
   HS65_LS_NAND2X7 FE_RC_493_0 (.Z(\chs_out_f[2][DATA][11] ), 
	.B(n178), 
	.A(FE_RN_366_0));
   HS65_LS_OAI22X11 FE_RC_492_0 (.Z(FE_RN_365_0), 
	.D(n66), 
	.C(n8), 
	.B(n3), 
	.A(n32));
   HS65_LS_NAND2AX7 FE_RC_491_0 (.Z(\chs_out_f[2][DATA][12] ), 
	.B(n177), 
	.A(FE_RN_365_0));
   HS65_LS_OR2X35 FE_RC_490_0 (.Z(FE_RN_364_0), 
	.B(n31), 
	.A(n3));
   HS65_LS_OAI211X5 FE_RC_489_0 (.Z(\chs_out_f[2][DATA][13] ), 
	.D(n176), 
	.C(FE_RN_364_0), 
	.B(n65), 
	.A(n8));
   HS65_LS_OAI22X11 FE_RC_488_0 (.Z(FE_RN_363_0), 
	.D(n64), 
	.C(n8), 
	.B(n30), 
	.A(FE_OFN23_n3));
   HS65_LS_NAND2AX7 FE_RC_487_0 (.Z(\chs_out_f[2][DATA][14] ), 
	.B(n175), 
	.A(FE_RN_363_0));
   HS65_LS_CNIVX14 FE_RC_486_0 (.Z(FE_RN_362_0), 
	.A(FE_OFN23_n3));
   HS65_LS_NOR2AX19 FE_RC_485_0 (.Z(FE_RN_361_0), 
	.B(n28), 
	.A(FE_RN_362_0));
   HS65_LS_CNIVX7 FE_RC_484_0 (.Z(FE_RN_360_0), 
	.A(n8));
   HS65_LS_NOR2AX13 FE_RC_483_0 (.Z(FE_RN_359_0), 
	.B(n62), 
	.A(FE_RN_360_0));
   HS65_LS_NOR2X9 FE_RC_482_0 (.Z(FE_RN_358_0), 
	.B(FE_RN_359_0), 
	.A(FE_RN_361_0));
   HS65_LS_NAND2X7 FE_RC_481_0 (.Z(\chs_out_f[2][DATA][16] ), 
	.B(n173), 
	.A(FE_RN_358_0));
   HS65_LS_CNIVX14 FE_RC_480_0 (.Z(FE_RN_357_0), 
	.A(n3));
   HS65_LS_CNIVX7 FE_RC_479_0 (.Z(FE_RN_356_0), 
	.A(n27));
   HS65_LS_CNIVX7 FE_RC_478_0 (.Z(FE_RN_355_0), 
	.A(n8));
   HS65_LS_NOR2AX13 FE_RC_477_0 (.Z(FE_RN_354_0), 
	.B(n61), 
	.A(FE_RN_355_0));
   HS65_LS_AOI21X9 FE_RC_476_0 (.Z(FE_RN_353_0), 
	.C(FE_RN_354_0), 
	.B(FE_RN_356_0), 
	.A(FE_RN_357_0));
   HS65_LS_NAND2X5 FE_RC_475_0 (.Z(\chs_out_f[2][DATA][17] ), 
	.B(n172), 
	.A(FE_RN_353_0));
   HS65_LS_CNIVX14 FE_RC_472_0 (.Z(FE_RN_351_0), 
	.A(n3));
   HS65_LS_CNIVX7 FE_RC_471_0 (.Z(FE_RN_350_0), 
	.A(n25));
   HS65_LS_CNIVX7 FE_RC_470_0 (.Z(FE_RN_349_0), 
	.A(n8));
   HS65_LS_NOR2AX19 FE_RC_469_0 (.Z(FE_RN_348_0), 
	.B(n59), 
	.A(FE_RN_349_0));
   HS65_LS_AOI21X12 FE_RC_468_0 (.Z(FE_RN_347_0), 
	.C(FE_RN_348_0), 
	.B(FE_RN_350_0), 
	.A(FE_RN_351_0));
   HS65_LS_NAND2X7 FE_RC_467_0 (.Z(\chs_out_f[2][DATA][19] ), 
	.B(n170), 
	.A(FE_RN_347_0));
   HS65_LS_CNIVX14 FE_RC_466_0 (.Z(FE_RN_346_0), 
	.A(FE_OFN23_n3));
   HS65_LS_NOR2AX13 FE_RC_465_0 (.Z(FE_RN_345_0), 
	.B(n24), 
	.A(FE_RN_346_0));
   HS65_LS_CNIVX14 FE_RC_464_0 (.Z(FE_RN_344_0), 
	.A(n8));
   HS65_LS_NOR2AX13 FE_RC_463_0 (.Z(FE_RN_343_0), 
	.B(n58), 
	.A(FE_RN_344_0));
   HS65_LS_NOR2X13 FE_RC_462_0 (.Z(FE_RN_342_0), 
	.B(FE_RN_343_0), 
	.A(FE_RN_345_0));
   HS65_LS_NAND2X7 FE_RC_461_0 (.Z(\chs_out_f[2][DATA][20] ), 
	.B(n168), 
	.A(FE_RN_342_0));
   HS65_LS_OAI212X5 FE_RC_460_0 (.Z(\chs_out_f[2][DATA][22] ), 
	.E(n166), 
	.D(n22), 
	.C(FE_OFN23_n3), 
	.B(n56), 
	.A(n8));
   HS65_LS_AND2X4 FE_RC_454_0 (.Z(FE_RN_335_0), 
	.B(\chs_in_f[1][DATA][8] ), 
	.A(1'b0));
   HS65_LS_AOI212X4 FE_RC_453_0 (.Z(n182), 
	.E(FE_RN_335_0), 
	.D(\chs_in_f[2][DATA][8] ), 
	.C(\switch_sel[2][1] ), 
	.B(\chs_in_f[0][DATA][8] ), 
	.A(FE_OFN47_switch_sel_1_));
   HS65_LS_OAI22X11 FE_RC_450_0 (.Z(FE_RN_332_0), 
	.D(n64), 
	.C(FE_OFN26_n9), 
	.B(n30), 
	.A(FE_OFN22_n4));
   HS65_LS_NAND2AX7 FE_RC_449_0 (.Z(\chs_out_f[1][DATA][14] ), 
	.B(n209), 
	.A(FE_RN_332_0));
   HS65_LS_CNIVX3 FE_RC_442_0 (.Z(FE_RN_328_0), 
	.A(n70));
   HS65_LS_NAND2AX7 FE_RC_441_0 (.Z(FE_RN_327_0), 
	.B(FE_RN_328_0), 
	.A(n10));
   HS65_LS_OAI211X5 FE_RC_440_0 (.Z(\chs_out_f[0][DATA][8] ), 
	.D(n216), 
	.C(FE_RN_327_0), 
	.B(n36), 
	.A(FE_OFN21_n5));
   HS65_LS_OAI22X6 FE_RC_438_0 (.Z(FE_RN_326_0), 
	.D(n71), 
	.C(n6), 
	.B(n37), 
	.A(FE_OFN0_n1));
   HS65_LS_NAND2AX7 FE_RC_437_0 (.Z(\chs_out_f[4][DATA][7] ), 
	.B(n81), 
	.A(FE_RN_326_0));
   HS65_LS_CNIVX7 FE_RC_434_0 (.Z(FE_RN_324_0), 
	.A(n1));
   HS65_LS_CNIVX7 FE_RC_433_0 (.Z(FE_RN_323_0), 
	.A(n34));
   HS65_LS_CNIVX7 FE_RC_432_0 (.Z(FE_RN_322_0), 
	.A(n6));
   HS65_LS_NOR2AX13 FE_RC_431_0 (.Z(FE_RN_321_0), 
	.B(n68), 
	.A(FE_RN_322_0));
   HS65_LS_AOI21X9 FE_RC_430_0 (.Z(FE_RN_320_0), 
	.C(FE_RN_321_0), 
	.B(FE_RN_323_0), 
	.A(FE_RN_324_0));
   HS65_LS_NAND2X7 FE_RC_429_0 (.Z(\chs_out_f[4][DATA][10] ), 
	.B(n111), 
	.A(FE_RN_320_0));
   HS65_LS_CNIVX7 FE_RC_428_0 (.Z(FE_RN_319_0), 
	.A(n1));
   HS65_LS_CNIVX14 FE_RC_427_0 (.Z(FE_RN_318_0), 
	.A(n32));
   HS65_LS_CNIVX7 FE_RC_426_0 (.Z(FE_RN_317_0), 
	.A(n6));
   HS65_LS_NOR2AX13 FE_RC_425_0 (.Z(FE_RN_316_0), 
	.B(n66), 
	.A(FE_RN_317_0));
   HS65_LS_AOI21X9 FE_RC_424_0 (.Z(FE_RN_315_0), 
	.C(FE_RN_316_0), 
	.B(FE_RN_318_0), 
	.A(FE_RN_319_0));
   HS65_LS_NAND2X7 FE_RC_423_0 (.Z(\chs_out_f[4][DATA][12] ), 
	.B(n109), 
	.A(FE_RN_315_0));
   HS65_LS_AOI222X4 FE_RC_421_0 (.Z(n105), 
	.F(\chs_in_f[2][DATA][16] ), 
	.E(FE_OFN45_switch_sel_14_), 
	.D(\chs_in_f[1][DATA][16] ), 
	.C(\switch_sel[1][4] ), 
	.B(\chs_in_f[0][DATA][16] ), 
	.A(\switch_sel[0][4] ));
   HS65_LS_AOI222X9 FE_RC_419_0 (.Z(n100), 
	.F(\chs_in_f[2][DATA][20] ), 
	.E(FE_OFN45_switch_sel_14_), 
	.D(\chs_in_f[1][DATA][20] ), 
	.C(\switch_sel[1][4] ), 
	.B(\chs_in_f[0][DATA][20] ), 
	.A(\switch_sel[0][4] ));
   HS65_LS_OAI22X6 FE_RC_417_0 (.Z(FE_RN_314_0), 
	.D(n39), 
	.C(FE_OFN24_n2), 
	.B(n7), 
	.A(n73));
   HS65_LS_NAND2AX4 FE_RC_416_0 (.Z(\chs_out_f[3][DATA][5] ), 
	.B(n117), 
	.A(FE_RN_314_0));
   HS65_LS_OR2X9 FE_RC_415_0 (.Z(FE_RN_313_0), 
	.B(n7), 
	.A(n69));
   HS65_LS_OAI211X5 FE_RC_414_0 (.Z(\chs_out_f[3][DATA][9] ), 
	.D(n113), 
	.C(FE_RN_313_0), 
	.B(n35), 
	.A(FE_OFN24_n2));
   HS65_LS_OAI22X6 FE_RC_413_0 (.Z(FE_RN_312_0), 
	.D(n33), 
	.C(n2), 
	.B(n7), 
	.A(n67));
   HS65_LS_NAND2AX7 FE_RC_412_0 (.Z(\chs_out_f[3][DATA][11] ), 
	.B(n144), 
	.A(FE_RN_312_0));
   HS65_LS_OAI22X6 FE_RC_411_0 (.Z(FE_RN_311_0), 
	.D(n31), 
	.C(n2), 
	.B(n7), 
	.A(n65));
   HS65_LS_NAND2AX7 FE_RC_410_0 (.Z(\chs_out_f[3][DATA][13] ), 
	.B(n142), 
	.A(FE_RN_311_0));
   HS65_LS_OAI22X6 FE_RC_409_0 (.Z(FE_RN_310_0), 
	.D(n2), 
	.C(n25), 
	.B(n7), 
	.A(n59));
   HS65_LS_NAND2AX7 FE_RC_408_0 (.Z(\chs_out_f[3][DATA][19] ), 
	.B(n136), 
	.A(FE_RN_310_0));
   HS65_LS_OAI22X6 FE_RC_407_0 (.Z(FE_RN_309_0), 
	.D(n23), 
	.C(FE_OFN24_n2), 
	.B(n7), 
	.A(n57));
   HS65_LS_NAND2AX7 FE_RC_406_0 (.Z(\chs_out_f[3][DATA][21] ), 
	.B(n133), 
	.A(FE_RN_309_0));
   HS65_LS_CNIVX7 FE_RC_386_0 (.Z(FE_RN_289_0), 
	.A(FE_OFN25_n10));
   HS65_LS_NOR2AX13 FE_RC_385_0 (.Z(FE_RN_288_0), 
	.B(n69), 
	.A(FE_RN_289_0));
   HS65_LS_CNIVX7 FE_RC_384_0 (.Z(FE_RN_287_0), 
	.A(FE_OFN21_n5));
   HS65_LS_NOR2AX13 FE_RC_383_0 (.Z(FE_RN_286_0), 
	.B(n35), 
	.A(FE_RN_287_0));
   HS65_LS_NOR2X9 FE_RC_382_0 (.Z(FE_RN_285_0), 
	.B(FE_RN_286_0), 
	.A(FE_RN_288_0));
   HS65_LS_NAND2X7 FE_RC_381_0 (.Z(\chs_out_f[0][DATA][9] ), 
	.B(n215), 
	.A(FE_RN_285_0));
   HS65_LS_OAI22X6 FE_RC_380_0 (.Z(FE_RN_284_0), 
	.D(n6), 
	.C(n73), 
	.B(n39), 
	.A(FE_OFN0_n1));
   HS65_LS_NAND2AX7 FE_RC_379_0 (.Z(\chs_out_f[4][DATA][5] ), 
	.B(n83), 
	.A(FE_RN_284_0));
   HS65_LS_CNIVX7 FE_RC_378_0 (.Z(FE_RN_283_0), 
	.A(n35));
   HS65_LS_CNIVX7 FE_RC_377_0 (.Z(FE_RN_282_0), 
	.A(n1));
   HS65_LS_CNIVX7 FE_RC_376_0 (.Z(FE_RN_281_0), 
	.A(n6));
   HS65_LS_NOR2AX13 FE_RC_375_0 (.Z(FE_RN_280_0), 
	.B(n69), 
	.A(FE_RN_281_0));
   HS65_LS_AOI21X6 FE_RC_374_0 (.Z(FE_RN_279_0), 
	.C(FE_RN_280_0), 
	.B(FE_RN_282_0), 
	.A(FE_RN_283_0));
   HS65_LS_NAND2X7 FE_RC_373_0 (.Z(\chs_out_f[4][DATA][9] ), 
	.B(n79), 
	.A(FE_RN_279_0));
   HS65_LS_OAI22X6 FE_RC_372_0 (.Z(FE_RN_278_0), 
	.D(n6), 
	.C(n67), 
	.B(n33), 
	.A(n1));
   HS65_LS_NAND2AX7 FE_RC_371_0 (.Z(\chs_out_f[4][DATA][11] ), 
	.B(n110), 
	.A(FE_RN_278_0));
   HS65_LS_CNIVX7 FE_RC_370_0 (.Z(FE_RN_277_0), 
	.A(n1));
   HS65_LS_CNIVX7 FE_RC_369_0 (.Z(FE_RN_276_0), 
	.A(n31));
   HS65_LS_CNIVX7 FE_RC_368_0 (.Z(FE_RN_275_0), 
	.A(n6));
   HS65_LS_NOR2AX13 FE_RC_367_0 (.Z(FE_RN_274_0), 
	.B(n65), 
	.A(FE_RN_275_0));
   HS65_LS_AOI21X6 FE_RC_366_0 (.Z(FE_RN_273_0), 
	.C(FE_RN_274_0), 
	.B(FE_RN_276_0), 
	.A(FE_RN_277_0));
   HS65_LS_NAND2X7 FE_RC_365_0 (.Z(\chs_out_f[4][DATA][13] ), 
	.B(n108), 
	.A(FE_RN_273_0));
   HS65_LS_CNIVX14 FE_RC_364_0 (.Z(FE_RN_272_0), 
	.A(n1));
   HS65_LS_CNIVX7 FE_RC_363_0 (.Z(FE_RN_271_0), 
	.A(n29));
   HS65_LS_CNIVX7 FE_RC_362_0 (.Z(FE_RN_270_0), 
	.A(n6));
   HS65_LS_NOR2AX13 FE_RC_361_0 (.Z(FE_RN_269_0), 
	.B(n63), 
	.A(FE_RN_270_0));
   HS65_LS_AOI21X12 FE_RC_360_0 (.Z(FE_RN_268_0), 
	.C(FE_RN_269_0), 
	.B(FE_RN_271_0), 
	.A(FE_RN_272_0));
   HS65_LS_NAND2X7 FE_RC_359_0 (.Z(\chs_out_f[4][DATA][15] ), 
	.B(n106), 
	.A(FE_RN_268_0));
   HS65_LS_OAI22X6 FE_RC_358_0 (.Z(FE_RN_267_0), 
	.D(n59), 
	.C(n6), 
	.B(n25), 
	.A(n1));
   HS65_LS_NAND2AX7 FE_RC_357_0 (.Z(\chs_out_f[4][DATA][19] ), 
	.B(n102), 
	.A(FE_RN_267_0));
   HS65_LS_OAI22X6 FE_RC_356_0 (.Z(FE_RN_266_0), 
	.D(n57), 
	.C(n6), 
	.B(n23), 
	.A(FE_OFN0_n1));
   HS65_LS_NAND2AX7 FE_RC_355_0 (.Z(\chs_out_f[4][DATA][21] ), 
	.B(n99), 
	.A(FE_RN_266_0));
   HS65_LS_CNIVX7 FE_RC_354_0 (.Z(FE_RN_265_0), 
	.A(n45));
   HS65_LS_CNIVX14 FE_RC_353_0 (.Z(FE_RN_264_0), 
	.A(n7));
   HS65_LS_CNIVX14 FE_RC_352_0 (.Z(FE_RN_263_0), 
	.A(FE_OFN24_n2));
   HS65_LS_NOR2AX13 FE_RC_351_0 (.Z(FE_RN_262_0), 
	.B(n11), 
	.A(FE_RN_263_0));
   HS65_LS_AOI21X6 FE_RC_350_0 (.Z(FE_RN_261_0), 
	.C(FE_RN_262_0), 
	.B(FE_RN_264_0), 
	.A(FE_RN_265_0));
   HS65_LS_NAND2X7 FE_RC_349_0 (.Z(\chs_out_f[3][DATA][33] ), 
	.B(n120), 
	.A(FE_RN_261_0));
   HS65_LS_OR2X9 FE_RC_348_0 (.Z(FE_RN_260_0), 
	.B(FE_OFN35_n7), 
	.A(n76));
   HS65_LS_OAI211X8 FE_RC_347_0 (.Z(\chs_out_f[3][DATA][2] ), 
	.D(FE_RN_260_0), 
	.C(n124), 
	.B(n42), 
	.A(FE_OFN24_n2));
   HS65_LS_OR2X9 FE_RC_346_0 (.Z(FE_RN_259_0), 
	.B(FE_OFN35_n7), 
	.A(n74));
   HS65_LS_OAI211X5 FE_RC_345_0 (.Z(\chs_out_f[3][DATA][4] ), 
	.D(n118), 
	.C(FE_RN_259_0), 
	.B(n40), 
	.A(FE_OFN24_n2));
   HS65_LS_OAI212X5 FE_RC_344_0 (.Z(\chs_out_f[3][DATA][26] ), 
	.E(n128), 
	.D(n18), 
	.C(n2), 
	.B(FE_OFN35_n7), 
	.A(n52));
   HS65_LS_OR2X9 FE_RC_343_0 (.Z(FE_RN_258_0), 
	.B(FE_OFN35_n7), 
	.A(n50));
   HS65_LS_OAI211X5 FE_RC_342_0 (.Z(\chs_out_f[3][DATA][28] ), 
	.D(FE_RN_258_0), 
	.C(n126), 
	.B(n16), 
	.A(n2));
   HS65_LS_CNIVX7 FE_RC_340_0 (.Z(FE_RN_257_0), 
	.A(n48));
   HS65_LS_CNIVX14 FE_RC_339_0 (.Z(FE_RN_256_0), 
	.A(FE_OFN35_n7));
   HS65_LS_CNIVX14 FE_RC_338_0 (.Z(FE_RN_255_0), 
	.A(n2));
   HS65_LS_NOR2AX13 FE_RC_337_0 (.Z(FE_RN_254_0), 
	.B(n14), 
	.A(FE_RN_255_0));
   HS65_LS_AOI21X9 FE_RC_336_0 (.Z(FE_RN_253_0), 
	.C(FE_RN_254_0), 
	.B(FE_RN_256_0), 
	.A(FE_RN_257_0));
   HS65_LS_NAND2X7 FE_RC_335_0 (.Z(\chs_out_f[3][DATA][30] ), 
	.B(n123), 
	.A(FE_RN_253_0));
   HS65_LS_OAI22X11 FE_RC_334_0 (.Z(FE_RN_252_0), 
	.D(n12), 
	.C(FE_OFN24_n2), 
	.B(FE_OFN35_n7), 
	.A(n46));
   HS65_LS_NAND2AX7 FE_RC_333_0 (.Z(\chs_out_f[3][DATA][32] ), 
	.B(n121), 
	.A(FE_RN_252_0));
   HS65_LS_CNIVX14 FE_RC_332_0 (.Z(FE_RN_251_0), 
	.A(FE_OFN27_n8));
   HS65_LS_CNNAND2AX18 FE_RC_331_0 (.Z(FE_RN_250_0), 
	.B(FE_RN_251_0), 
	.A(n78));
   HS65_LS_OAI211X5 FE_RC_330_0 (.Z(\chs_out_f[2][DATA][0] ), 
	.D(n180), 
	.C(FE_RN_250_0), 
	.B(n44), 
	.A(FE_OFN23_n3));
   HS65_LS_CNIVX14 FE_RC_329_0 (.Z(FE_RN_249_0), 
	.A(FE_OFN27_n8));
   HS65_LS_NOR2AX13 FE_RC_328_0 (.Z(FE_RN_248_0), 
	.B(n77), 
	.A(FE_RN_249_0));
   HS65_LS_CNIVX14 FE_RC_327_0 (.Z(FE_RN_247_0), 
	.A(FE_OFN23_n3));
   HS65_LS_NOR2AX13 FE_RC_326_0 (.Z(FE_RN_246_0), 
	.B(n43), 
	.A(FE_RN_247_0));
   HS65_LS_NOR2X13 FE_RC_325_0 (.Z(FE_RN_245_0), 
	.B(FE_RN_246_0), 
	.A(FE_RN_248_0));
   HS65_LS_NAND2X7 FE_RC_324_0 (.Z(\chs_out_f[2][DATA][1] ), 
	.B(n169), 
	.A(FE_RN_245_0));
   HS65_LS_CNIVX14 FE_RC_323_0 (.Z(FE_RN_244_0), 
	.A(FE_OFN27_n8));
   HS65_LS_CNNAND2AX18 FE_RC_322_0 (.Z(FE_RN_243_0), 
	.B(FE_RN_244_0), 
	.A(n76));
   HS65_LS_OAI112X11 FE_RC_321_0 (.Z(\chs_out_f[2][DATA][2] ), 
	.D(n158), 
	.C(FE_RN_243_0), 
	.B(n42), 
	.A(FE_OFN23_n3));
   HS65_LS_CNIVX14 FE_RC_320_0 (.Z(FE_RN_242_0), 
	.A(FE_OFN27_n8));
   HS65_LS_CNIVX7 FE_RC_319_0 (.Z(FE_RN_241_0), 
	.A(n75));
   HS65_LS_NAND2X7 FE_RC_318_0 (.Z(FE_RN_240_0), 
	.B(FE_RN_241_0), 
	.A(FE_RN_242_0));
   HS65_LS_OAI112X5 FE_RC_317_0 (.Z(\chs_out_f[2][DATA][3] ), 
	.D(FE_RN_240_0), 
	.C(n153), 
	.B(n41), 
	.A(n3));
   HS65_LS_CNIVX14 FE_RC_316_0 (.Z(FE_RN_239_0), 
	.A(FE_OFN27_n8));
   HS65_LS_NOR2AX13 FE_RC_315_0 (.Z(FE_RN_238_0), 
	.B(n55), 
	.A(FE_RN_239_0));
   HS65_LS_CNIVX7 FE_RC_314_0 (.Z(FE_RN_237_0), 
	.A(FE_OFN23_n3));
   HS65_LS_NOR2AX13 FE_RC_313_0 (.Z(FE_RN_236_0), 
	.B(n21), 
	.A(FE_RN_237_0));
   HS65_LS_NOR2X13 FE_RC_312_0 (.Z(FE_RN_235_0), 
	.B(FE_RN_236_0), 
	.A(FE_RN_238_0));
   HS65_LS_NAND2X5 FE_RC_311_0 (.Z(\chs_out_f[2][DATA][23] ), 
	.B(n165), 
	.A(FE_RN_235_0));
   HS65_LS_OAI212X5 FE_RC_308_0 (.Z(\chs_out_f[2][DATA][25] ), 
	.E(n163), 
	.D(n19), 
	.C(FE_OFN23_n3), 
	.B(n53), 
	.A(FE_OFN27_n8));
   HS65_LS_CNIVX14 FE_RC_305_0 (.Z(FE_RN_233_0), 
	.A(n8));
   HS65_LS_NAND2AX21 FE_RC_304_0 (.Z(FE_RN_232_0), 
	.B(FE_RN_233_0), 
	.A(n50));
   HS65_LS_OAI112X8 FE_RC_303_0 (.Z(\chs_out_f[2][DATA][28] ), 
	.D(n160), 
	.C(FE_RN_232_0), 
	.B(n16), 
	.A(FE_OFN23_n3));
   HS65_LS_CNIVX14 FE_RC_302_0 (.Z(FE_RN_231_0), 
	.A(FE_OFN27_n8));
   HS65_LS_NAND2AX21 FE_RC_301_0 (.Z(FE_RN_230_0), 
	.B(FE_RN_231_0), 
	.A(n49));
   HS65_LS_OAI112X4 FE_RC_300_0 (.Z(\chs_out_f[2][DATA][29] ), 
	.D(n159), 
	.C(FE_RN_230_0), 
	.B(n15), 
	.A(FE_OFN23_n3));
   HS65_LS_CNIVX14 FE_RC_299_0 (.Z(FE_RN_229_0), 
	.A(n8));
   HS65_LS_IVX9 FE_RC_298_0 (.Z(FE_RN_228_0), 
	.A(n48));
   HS65_LS_CNIVX14 FE_RC_297_0 (.Z(FE_RN_227_0), 
	.A(FE_OFN23_n3));
   HS65_LS_NOR2AX13 FE_RC_296_0 (.Z(FE_RN_226_0), 
	.B(n14), 
	.A(FE_RN_227_0));
   HS65_LS_AOI21X9 FE_RC_295_0 (.Z(FE_RN_225_0), 
	.C(FE_RN_226_0), 
	.B(FE_RN_228_0), 
	.A(FE_RN_229_0));
   HS65_LS_NAND2X7 FE_RC_294_0 (.Z(\chs_out_f[2][DATA][30] ), 
	.B(n157), 
	.A(FE_RN_225_0));
   HS65_LS_CNIVX14 FE_RC_293_0 (.Z(FE_RN_224_0), 
	.A(FE_OFN27_n8));
   HS65_LS_NOR2AX13 FE_RC_292_0 (.Z(FE_RN_223_0), 
	.B(n46), 
	.A(FE_RN_224_0));
   HS65_LS_CNIVX7 FE_RC_291_0 (.Z(FE_RN_222_0), 
	.A(FE_OFN23_n3));
   HS65_LS_NOR2AX13 FE_RC_290_0 (.Z(FE_RN_221_0), 
	.B(n12), 
	.A(FE_RN_222_0));
   HS65_LS_CNNOR2X15 FE_RC_289_0 (.Z(FE_RN_220_0), 
	.B(FE_RN_221_0), 
	.A(FE_RN_223_0));
   HS65_LS_NAND2X7 FE_RC_288_0 (.Z(\chs_out_f[2][DATA][32] ), 
	.B(n155), 
	.A(FE_RN_220_0));
   HS65_LS_OAI22X11 FE_RC_287_0 (.Z(FE_RN_219_0), 
	.D(n11), 
	.C(FE_OFN22_n4), 
	.B(n45), 
	.A(FE_OFN26_n9));
   HS65_LS_NAND2AX7 FE_RC_286_0 (.Z(\chs_out_f[1][DATA][33] ), 
	.B(n188), 
	.A(FE_RN_219_0));
   HS65_LS_OAI212X5 FE_RC_285_0 (.Z(\chs_out_f[1][DATA][2] ), 
	.E(n192), 
	.D(n42), 
	.C(FE_OFN22_n4), 
	.B(n76), 
	.A(FE_OFN26_n9));
   HS65_LS_CNIVX14 FE_RC_284_0 (.Z(FE_RN_218_0), 
	.A(FE_OFN26_n9));
   HS65_LS_NAND2AX21 FE_RC_283_0 (.Z(FE_RN_217_0), 
	.B(FE_RN_218_0), 
	.A(n74));
   HS65_LS_OAI211X4 FE_RC_282_0 (.Z(\chs_out_f[1][DATA][4] ), 
	.D(n186), 
	.C(FE_RN_217_0), 
	.B(n40), 
	.A(FE_OFN22_n4));
   HS65_LS_OAI212X5 FE_RC_281_0 (.Z(\chs_out_f[1][DATA][26] ), 
	.E(n196), 
	.D(n18), 
	.C(FE_OFN22_n4), 
	.B(n52), 
	.A(FE_OFN26_n9));
   HS65_LS_OAI212X5 FE_RC_277_0 (.Z(\chs_out_f[1][DATA][29] ), 
	.E(n193), 
	.D(n15), 
	.C(FE_OFN22_n4), 
	.B(n49), 
	.A(FE_OFN26_n9));
   HS65_LS_CNIVX14 FE_RC_276_0 (.Z(FE_RN_214_0), 
	.A(FE_OFN26_n9));
   HS65_LS_CNIVX7 FE_RC_275_0 (.Z(FE_RN_213_0), 
	.A(n48));
   HS65_LS_CNIVX14 FE_RC_274_0 (.Z(FE_RN_212_0), 
	.A(FE_OFN22_n4));
   HS65_LS_NOR2AX13 FE_RC_273_0 (.Z(FE_RN_211_0), 
	.B(n14), 
	.A(FE_RN_212_0));
   HS65_LS_AOI21X9 FE_RC_272_0 (.Z(FE_RN_210_0), 
	.C(FE_RN_211_0), 
	.B(FE_RN_213_0), 
	.A(FE_RN_214_0));
   HS65_LS_NAND2X7 FE_RC_271_0 (.Z(\chs_out_f[1][DATA][30] ), 
	.B(n191), 
	.A(FE_RN_210_0));
   HS65_LS_AOI222X9 FE_RC_268_0 (.Z(n112), 
	.F(\chs_in_f[2][DATA][0] ), 
	.E(FE_OFN45_switch_sel_14_), 
	.D(\chs_in_f[0][DATA][0] ), 
	.C(\switch_sel[0][4] ), 
	.B(\chs_in_f[1][DATA][0] ), 
	.A(\switch_sel[1][4] ));
   HS65_LS_IVX9 FE_RC_267_0 (.Z(FE_RN_208_0), 
	.A(\switch_sel[0][4] ));
   HS65_LS_CNNOR2AX15 FE_RC_266_0 (.Z(FE_RN_207_0), 
	.B(FE_RN_208_0), 
	.A(\chs_in_f[0][DATA][2] ));
   HS65_LS_AOI212X4 FE_RC_265_0 (.Z(n90), 
	.E(FE_RN_207_0), 
	.D(\chs_in_f[2][DATA][2] ), 
	.C(FE_OFN45_switch_sel_14_), 
	.B(\chs_in_f[1][DATA][2] ), 
	.A(\switch_sel[1][4] ));
   HS65_LS_CNIVX14 FE_RC_261_0 (.Z(FE_RN_206_0), 
	.A(FE_OFN36_n1));
   HS65_LS_CNIVX7 FE_RC_260_0 (.Z(FE_RN_205_0), 
	.A(n15));
   HS65_LS_CNIVX14 FE_RC_259_0 (.Z(FE_RN_204_0), 
	.A(FE_OFN28_n6));
   HS65_LS_NOR2AX13 FE_RC_258_0 (.Z(FE_RN_203_0), 
	.B(n49), 
	.A(FE_RN_204_0));
   HS65_LS_AOI21X9 FE_RC_257_0 (.Z(FE_RN_202_0), 
	.C(FE_RN_203_0), 
	.B(FE_RN_205_0), 
	.A(FE_RN_206_0));
   HS65_LS_NAND2X7 FE_RC_256_0 (.Z(\chs_out_f[4][DATA][29] ), 
	.B(n91), 
	.A(FE_RN_202_0));
   HS65_LS_CNIVX7 FE_RC_254_0 (.Z(FE_RN_201_0), 
	.A(n77));
   HS65_LS_CNIVX14 FE_RC_253_0 (.Z(FE_RN_200_0), 
	.A(FE_OFN35_n7));
   HS65_LS_CNIVX14 FE_RC_252_0 (.Z(FE_RN_199_0), 
	.A(FE_OFN24_n2));
   HS65_LS_NOR2AX13 FE_RC_251_0 (.Z(FE_RN_198_0), 
	.B(n43), 
	.A(FE_RN_199_0));
   HS65_LS_AOI21X9 FE_RC_250_0 (.Z(FE_RN_197_0), 
	.C(FE_RN_198_0), 
	.B(FE_RN_200_0), 
	.A(FE_RN_201_0));
   HS65_LS_NAND2X5 FE_RC_249_0 (.Z(\chs_out_f[3][DATA][1] ), 
	.B(n135), 
	.A(FE_RN_197_0));
   HS65_LS_CNIVX7 FE_RC_248_0 (.Z(FE_RN_196_0), 
	.A(n75));
   HS65_LS_CNIVX14 FE_RC_247_0 (.Z(FE_RN_195_0), 
	.A(FE_OFN35_n7));
   HS65_LS_CNIVX14 FE_RC_246_0 (.Z(FE_RN_194_0), 
	.A(FE_OFN24_n2));
   HS65_LS_NOR2AX13 FE_RC_245_0 (.Z(FE_RN_193_0), 
	.B(n41), 
	.A(FE_RN_194_0));
   HS65_LS_AOI21X12 FE_RC_244_0 (.Z(FE_RN_192_0), 
	.C(FE_RN_193_0), 
	.B(FE_RN_195_0), 
	.A(FE_RN_196_0));
   HS65_LS_NAND2X7 FE_RC_243_0 (.Z(\chs_out_f[3][DATA][3] ), 
	.B(n119), 
	.A(FE_RN_192_0));
   HS65_LS_OR2X9 FE_RC_240_0 (.Z(FE_RN_190_0), 
	.B(FE_OFN35_n7), 
	.A(n53));
   HS65_LS_OAI211X4 FE_RC_239_0 (.Z(\chs_out_f[3][DATA][25] ), 
	.D(n129), 
	.C(FE_RN_190_0), 
	.B(n19), 
	.A(FE_OFN24_n2));
   HS65_LS_OAI212X5 FE_RC_238_0 (.Z(\chs_out_f[3][DATA][27] ), 
	.E(n127), 
	.D(n17), 
	.C(FE_OFN24_n2), 
	.B(FE_OFN35_n7), 
	.A(n51));
   HS65_LS_CNIVX7 FE_RC_229_0 (.Z(FE_RN_181_0), 
	.A(FE_OFN26_n9));
   HS65_LS_NOR2AX19 FE_RC_228_0 (.Z(FE_RN_180_0), 
	.B(n55), 
	.A(FE_RN_181_0));
   HS65_LS_CNIVX7 FE_RC_227_0 (.Z(FE_RN_179_0), 
	.A(FE_OFN22_n4));
   HS65_LS_NOR2AX13 FE_RC_226_0 (.Z(FE_RN_178_0), 
	.B(n21), 
	.A(FE_RN_179_0));
   HS65_LS_NOR2X19 FE_RC_225_0 (.Z(FE_RN_177_0), 
	.B(FE_RN_178_0), 
	.A(FE_RN_180_0));
   HS65_LS_NAND2X7 FE_RC_224_0 (.Z(\chs_out_f[1][DATA][23] ), 
	.B(n199), 
	.A(FE_RN_177_0));
   HS65_LS_CNIVX14 FE_RC_223_0 (.Z(FE_RN_176_0), 
	.A(FE_OFN26_n9));
   HS65_LS_NAND2AX21 FE_RC_222_0 (.Z(FE_RN_175_0), 
	.B(FE_RN_176_0), 
	.A(n53));
   HS65_LS_OAI211X3 FE_RC_221_0 (.Z(\chs_out_f[1][DATA][25] ), 
	.D(n197), 
	.C(FE_RN_175_0), 
	.B(n19), 
	.A(FE_OFN22_n4));
   HS65_LS_OAI212X5 FE_RC_220_0 (.Z(\chs_out_f[1][DATA][27] ), 
	.E(n195), 
	.D(n17), 
	.C(FE_OFN22_n4), 
	.B(n51), 
	.A(FE_OFN26_n9));
   HS65_LS_CNIVX7 FE_RC_219_0 (.Z(FE_RN_174_0), 
	.A(n75));
   HS65_LS_CNIVX14 FE_RC_218_0 (.Z(FE_RN_173_0), 
	.A(n10));
   HS65_LS_CNIVX7 FE_RC_217_0 (.Z(FE_RN_172_0), 
	.A(FE_OFN21_n5));
   HS65_LS_NOR2AX13 FE_RC_216_0 (.Z(FE_RN_171_0), 
	.B(n41), 
	.A(FE_RN_172_0));
   HS65_LS_AOI21X9 FE_RC_215_0 (.Z(FE_RN_170_0), 
	.C(FE_RN_171_0), 
	.B(FE_RN_173_0), 
	.A(FE_RN_174_0));
   HS65_LS_NAND2X7 FE_RC_214_0 (.Z(\chs_out_f[0][DATA][3] ), 
	.B(n221), 
	.A(FE_RN_170_0));
   HS65_LS_OAI22X6 FE_RC_213_0 (.Z(FE_RN_169_0), 
	.D(n77), 
	.C(FE_OFN28_n6), 
	.B(n43), 
	.A(FE_OFN36_n1));
   HS65_LS_NAND2AX4 FE_RC_212_0 (.Z(\chs_out_f[4][DATA][1] ), 
	.B(n101), 
	.A(FE_RN_169_0));
   HS65_LS_OAI22X6 FE_RC_211_0 (.Z(FE_RN_168_0), 
	.D(n75), 
	.C(FE_OFN28_n6), 
	.B(n41), 
	.A(FE_OFN36_n1));
   HS65_LS_NAND2AX7 FE_RC_210_0 (.Z(\chs_out_f[4][DATA][3] ), 
	.B(n85), 
	.A(FE_RN_168_0));
   HS65_LS_OAI22X6 FE_RC_209_0 (.Z(FE_RN_167_0), 
	.D(n55), 
	.C(n6), 
	.B(n21), 
	.A(FE_OFN0_n1));
   HS65_LS_NAND2AX7 FE_RC_208_0 (.Z(\chs_out_f[4][DATA][23] ), 
	.B(n97), 
	.A(FE_RN_167_0));
   HS65_LS_CNIVX14 FE_RC_207_0 (.Z(FE_RN_166_0), 
	.A(FE_OFN36_n1));
   HS65_LS_CNIVX7 FE_RC_206_0 (.Z(FE_RN_165_0), 
	.A(n19));
   HS65_LS_CNIVX14 FE_RC_205_0 (.Z(FE_RN_164_0), 
	.A(FE_OFN28_n6));
   HS65_LS_NOR2AX13 FE_RC_204_0 (.Z(FE_RN_163_0), 
	.B(n53), 
	.A(FE_RN_164_0));
   HS65_LS_AOI21X9 FE_RC_203_0 (.Z(FE_RN_162_0), 
	.C(FE_RN_163_0), 
	.B(FE_RN_165_0), 
	.A(FE_RN_166_0));
   HS65_LS_NAND2X5 FE_RC_202_0 (.Z(\chs_out_f[4][DATA][25] ), 
	.B(n95), 
	.A(FE_RN_162_0));
   HS65_LS_CNIVX14 FE_RC_201_0 (.Z(FE_RN_161_0), 
	.A(FE_OFN36_n1));
   HS65_LS_CNIVX7 FE_RC_200_0 (.Z(FE_RN_160_0), 
	.A(n17));
   HS65_LS_CNIVX14 FE_RC_199_0 (.Z(FE_RN_159_0), 
	.A(FE_OFN28_n6));
   HS65_LS_NOR2AX13 FE_RC_198_0 (.Z(FE_RN_158_0), 
	.B(n51), 
	.A(FE_RN_159_0));
   HS65_LS_AOI21X9 FE_RC_197_0 (.Z(FE_RN_157_0), 
	.C(FE_RN_158_0), 
	.B(FE_RN_160_0), 
	.A(FE_RN_161_0));
   HS65_LS_NAND2X5 FE_RC_196_0 (.Z(\chs_out_f[4][DATA][27] ), 
	.B(n93), 
	.A(FE_RN_157_0));
   HS65_LS_AND2X4 FE_RC_184_0 (.Z(FE_RN_146_0), 
	.B(\chs_in_f[0][DATA][11] ), 
	.A(1'b0));
   HS65_LS_AOI212X4 FE_RC_183_0 (.Z(n246), 
	.E(FE_RN_146_0), 
	.D(\chs_in_f[2][DATA][11] ), 
	.C(FE_OFN41_switch_sel_10_), 
	.B(\chs_in_f[1][DATA][11] ), 
	.A(FE_OFN37_switch_sel_5_));
   HS65_LS_NAND2X7 FE_RC_179_0 (.Z(FE_RN_142_0), 
	.B(\chs_in_f[2][DATA][15] ), 
	.A(1'b0));
   HS65_LS_CNIVX14 FE_RC_178_0 (.Z(FE_RN_141_0), 
	.A(FE_OFN48_switch_sel_2_));
   HS65_LS_CNNAND2AX18 FE_RC_177_0 (.Z(FE_RN_140_0), 
	.B(\chs_in_f[0][DATA][15] ), 
	.A(FE_RN_141_0));
   HS65_LS_NAND2X14 FE_RC_176_0 (.Z(FE_RN_139_0), 
	.B(FE_RN_140_0), 
	.A(FE_RN_142_0));
   HS65_LS_AOI12X9 FE_RC_175_0 (.Z(n174), 
	.C(FE_RN_139_0), 
	.B(\chs_in_f[1][DATA][15] ), 
	.A(FE_OFN38_switch_sel_7_));
   HS65_LS_NAND2X7 FE_RC_163_0 (.Z(FE_RN_126_0), 
	.B(\chs_in_f[2][DATA][21] ), 
	.A(1'b0));
   HS65_LS_CNIVX14 FE_RC_162_0 (.Z(FE_RN_125_0), 
	.A(FE_OFN48_switch_sel_2_));
   HS65_LS_CNNAND2AX18 FE_RC_161_0 (.Z(FE_RN_124_0), 
	.B(\chs_in_f[0][DATA][21] ), 
	.A(FE_RN_125_0));
   HS65_LS_NAND2X14 FE_RC_160_0 (.Z(FE_RN_123_0), 
	.B(FE_RN_124_0), 
	.A(FE_RN_126_0));
   HS65_LS_AOI12X6 FE_RC_159_0 (.Z(n167), 
	.C(FE_RN_123_0), 
	.B(\chs_in_f[1][DATA][21] ), 
	.A(\switch_sel[1][2] ));
   HS65_LS_OAI22X6 FE_RC_134_0 (.Z(FE_RN_101_0), 
	.D(n57), 
	.C(n9), 
	.B(n4), 
	.A(n23));
   HS65_LS_NAND2AX7 FE_RC_133_0 (.Z(\chs_out_f[1][DATA][21] ), 
	.B(n201), 
	.A(FE_RN_101_0));
   HS65_LS_CNIVX7 FE_RC_125_0 (.Z(FE_RN_100_0), 
	.A(FE_OFN49_switch_sel_3_));
   HS65_LS_CNNOR2AX15 FE_RC_124_0 (.Z(FE_RN_99_0), 
	.B(FE_RN_100_0), 
	.A(\chs_in_f[0][DATA][24] ));
   HS65_LS_AOI212X4 FE_RC_123_0 (.Z(n130), 
	.E(FE_RN_99_0), 
	.D(\chs_in_f[2][DATA][24] ), 
	.C(FE_OFN43_switch_sel_13_), 
	.B(\chs_in_f[1][DATA][24] ), 
	.A(FE_OFN39_switch_sel_8_));
   HS65_LS_AND2X4 FE_RC_119_0 (.Z(FE_RN_97_0), 
	.B(\chs_in_f[2][DATA][33] ), 
	.A(1'b0));
   HS65_LS_AOI212X4 FE_RC_118_0 (.Z(n154), 
	.E(FE_RN_97_0), 
	.D(\chs_in_f[1][DATA][33] ), 
	.C(\switch_sel[1][2] ), 
	.B(\chs_in_f[0][DATA][33] ), 
	.A(FE_OFN48_switch_sel_2_));
   HS65_LS_AND2X4 FE_RC_24_0 (.Z(FE_RN_16_0), 
	.B(\chs_in_f[2][DATA][31] ), 
	.A(1'b0));
   HS65_LS_AOI212X4 FE_RC_23_0 (.Z(n156), 
	.E(FE_RN_16_0), 
	.D(\chs_in_f[1][DATA][31] ), 
	.C(\switch_sel[1][2] ), 
	.B(\chs_in_f[0][DATA][31] ), 
	.A(\switch_sel[0][2] ));
   HS65_LS_OR2X9 FE_RC_3_0 (.Z(FE_RN_1_0), 
	.B(n39), 
	.A(FE_OFN21_n5));
   HS65_LS_AOI22X6 FE_RC_2_0 (.Z(FE_RN_0_0), 
	.D(FE_OFN41_switch_sel_10_), 
	.C(\chs_in_f[2][DATA][5] ), 
	.B(FE_OFN37_switch_sel_5_), 
	.A(\chs_in_f[1][DATA][5] ));
   HS65_LS_OAI211X5 FE_RC_1_0 (.Z(\chs_out_f[0][DATA][5] ), 
	.D(FE_RN_0_0), 
	.C(FE_RN_1_0), 
	.B(n73), 
	.A(n10));
   HS65_LS_BFX7 FE_OFC50_switch_sel_4_ (.Z(FE_OFN50_switch_sel_4_), 
	.A(\switch_sel[0][4] ));
   HS65_LS_BFX7 FE_OFC49_switch_sel_3_ (.Z(FE_OFN49_switch_sel_3_), 
	.A(\switch_sel[0][3] ));
   HS65_LS_BFX9 FE_OFC48_switch_sel_2_ (.Z(FE_OFN48_switch_sel_2_), 
	.A(\switch_sel[0][2] ));
   HS65_LS_BFX7 FE_OFC47_switch_sel_1_ (.Z(FE_OFN47_switch_sel_1_), 
	.A(FE_OFN46_switch_sel_1_));
   HS65_LS_BFX7 FE_OFC46_switch_sel_1_ (.Z(FE_OFN46_switch_sel_1_), 
	.A(\switch_sel[0][1] ));
   HS65_LS_BFX7 FE_OFC45_switch_sel_14_ (.Z(FE_OFN45_switch_sel_14_), 
	.A(FE_OFN44_switch_sel_14_));
   HS65_LS_BFX7 FE_OFC44_switch_sel_14_ (.Z(FE_OFN44_switch_sel_14_), 
	.A(\switch_sel[2][4] ));
   HS65_LS_BFX7 FE_OFC43_switch_sel_13_ (.Z(FE_OFN43_switch_sel_13_), 
	.A(\switch_sel[2][3] ));
   HS65_LS_BFX7 FE_OFC42_switch_sel_11_ (.Z(FE_OFN42_switch_sel_11_), 
	.A(\switch_sel[2][1] ));
   HS65_LS_BFX7 FE_OFC41_switch_sel_10_ (.Z(FE_OFN41_switch_sel_10_), 
	.A(\switch_sel[2][0] ));
   HS65_LS_BFX7 FE_OFC40_switch_sel_9_ (.Z(FE_OFN40_switch_sel_9_), 
	.A(\switch_sel[1][4] ));
   HS65_LS_BFX7 FE_OFC39_switch_sel_8_ (.Z(FE_OFN39_switch_sel_8_), 
	.A(\switch_sel[1][3] ));
   HS65_LS_BFX9 FE_OFC38_switch_sel_7_ (.Z(FE_OFN38_switch_sel_7_), 
	.A(\switch_sel[1][2] ));
   HS65_LS_BFX7 FE_OFC37_switch_sel_5_ (.Z(FE_OFN37_switch_sel_5_), 
	.A(\switch_sel[1][0] ));
   HS65_LS_BFX9 FE_OFC36_n1 (.Z(FE_OFN36_n1), 
	.A(FE_OFN0_n1));
   HS65_LS_BFX9 FE_OFC35_n7 (.Z(FE_OFN35_n7), 
	.A(FE_OFN1_n7));
   HS65_LS_BFX9 FE_OFC28_n6 (.Z(FE_OFN28_n6), 
	.A(n6));
   HS65_LS_BFX9 FE_OFC27_n8 (.Z(FE_OFN27_n8), 
	.A(n8));
   HS65_LS_BFX9 FE_OFC26_n9 (.Z(FE_OFN26_n9), 
	.A(n9));
   HS65_LS_BFX7 FE_OFC25_n10 (.Z(FE_OFN25_n10), 
	.A(n10));
   HS65_LS_BFX9 FE_OFC24_n2 (.Z(FE_OFN24_n2), 
	.A(n2));
   HS65_LS_BFX9 FE_OFC23_n3 (.Z(FE_OFN23_n3), 
	.A(n3));
   HS65_LS_BFX9 FE_OFC22_n4 (.Z(FE_OFN22_n4), 
	.A(n4));
   HS65_LS_BFX7 FE_OFC21_n5 (.Z(FE_OFN21_n5), 
	.A(n5));
   HS65_LS_BFX9 FE_OFC1_n7 (.Z(FE_OFN1_n7), 
	.A(n7));
   HS65_LS_BFX9 FE_OFC0_n1 (.Z(FE_OFN0_n1), 
	.A(n1));
   c_gate_generic_1_5_0 c_sync_req (.preset(preset), 
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
   HS65_LS_OAI212X5 U2 (.Z(\chs_out_f[4][DATA][33] ), 
	.E(n86), 
	.D(n11), 
	.C(FE_OFN0_n1), 
	.B(n45), 
	.A(n6));
   HS65_LS_OAI212X5 U3 (.Z(\chs_out_f[4][DATA][31] ), 
	.E(n88), 
	.D(n13), 
	.C(FE_OFN36_n1), 
	.B(n47), 
	.A(FE_OFN28_n6));
   HS65_LS_AOI222X2 U5 (.Z(n86), 
	.F(FE_OFN40_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][33] ), 
	.D(FE_OFN50_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][33] ), 
	.B(FE_OFN44_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][33] ));
   HS65_LS_AOI222X4 U6 (.Z(n88), 
	.F(FE_OFN40_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][31] ), 
	.D(FE_OFN50_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][31] ), 
	.B(FE_OFN44_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][31] ));
   HS65_LS_AOI222X2 U7 (.Z(n87), 
	.F(FE_OFN40_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][32] ), 
	.D(FE_OFN50_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][32] ), 
	.B(FE_OFN44_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][32] ));
   HS65_LS_AOI222X2 U8 (.Z(n81), 
	.F(FE_OFN40_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][7] ), 
	.D(FE_OFN50_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][7] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][7] ));
   HS65_LS_AOI222X2 U9 (.Z(n188), 
	.F(\chs_in_f[1][DATA][33] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][33] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][33] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X4 U11 (.Z(n189), 
	.F(\chs_in_f[1][DATA][32] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][32] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][32] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U12 (.Z(n222), 
	.F(\chs_in_f[1][DATA][33] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][33] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][33] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_AOI222X2 U13 (.Z(n224), 
	.F(\chs_in_f[1][DATA][31] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][31] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][31] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U81 (.Z(\chs_out_f[0][DATA][0] ), 
	.E(n248), 
	.D(n5), 
	.C(n44), 
	.B(FE_OFN25_n10), 
	.A(n78));
   HS65_LS_AOI222X2 U82 (.Z(n248), 
	.F(\chs_in_f[1][DATA][0] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][0] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][0] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U83 (.Z(\chs_out_f[0][DATA][2] ), 
	.E(n226), 
	.D(n5), 
	.C(n42), 
	.B(FE_OFN25_n10), 
	.A(n76));
   HS65_LS_AOI222X4 U84 (.Z(n226), 
	.F(\chs_in_f[1][DATA][2] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][2] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][2] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_AOI222X2 U86 (.Z(n247), 
	.F(\chs_in_f[1][DATA][10] ), 
	.E(FE_OFN37_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][10] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][10] ), 
	.A(FE_OFN41_switch_sel_10_));
   HS65_LS_AOI222X2 U88 (.Z(n245), 
	.F(\chs_in_f[1][DATA][12] ), 
	.E(FE_OFN37_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][12] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][12] ), 
	.A(FE_OFN41_switch_sel_10_));
   HS65_LS_OAI212X5 U89 (.Z(\chs_out_f[0][DATA][14] ), 
	.E(n243), 
	.D(FE_OFN21_n5), 
	.C(n30), 
	.B(n10), 
	.A(n64));
   HS65_LS_AOI222X4 U90 (.Z(n243), 
	.F(\chs_in_f[1][DATA][14] ), 
	.E(FE_OFN37_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][14] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][14] ), 
	.A(FE_OFN41_switch_sel_10_));
   HS65_LS_OAI212X5 U91 (.Z(\chs_out_f[0][DATA][16] ), 
	.E(n241), 
	.D(FE_OFN21_n5), 
	.C(n28), 
	.B(n10), 
	.A(n62));
   HS65_LS_AOI222X4 U92 (.Z(n241), 
	.F(\chs_in_f[1][DATA][16] ), 
	.E(FE_OFN37_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][16] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][16] ), 
	.A(FE_OFN41_switch_sel_10_));
   HS65_LS_OAI212X5 U93 (.Z(\chs_out_f[0][DATA][18] ), 
	.E(n239), 
	.D(FE_OFN21_n5), 
	.C(n26), 
	.B(n10), 
	.A(n60));
   HS65_LS_AOI222X2 U94 (.Z(n239), 
	.F(\chs_in_f[1][DATA][18] ), 
	.E(FE_OFN37_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][18] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][18] ), 
	.A(FE_OFN41_switch_sel_10_));
   HS65_LS_OAI212X5 U95 (.Z(\chs_out_f[0][DATA][20] ), 
	.E(n236), 
	.D(FE_OFN21_n5), 
	.C(n24), 
	.B(n10), 
	.A(n58));
   HS65_LS_AOI222X4 U96 (.Z(n236), 
	.F(\chs_in_f[1][DATA][20] ), 
	.E(FE_OFN37_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][20] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][20] ), 
	.A(FE_OFN41_switch_sel_10_));
   HS65_LS_OAI212X5 U97 (.Z(\chs_out_f[0][DATA][22] ), 
	.E(n234), 
	.D(FE_OFN21_n5), 
	.C(n22), 
	.B(n10), 
	.A(n56));
   HS65_LS_AOI222X4 U98 (.Z(n234), 
	.F(\chs_in_f[1][DATA][22] ), 
	.E(FE_OFN37_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][22] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][22] ), 
	.A(FE_OFN41_switch_sel_10_));
   HS65_LS_OAI212X5 U99 (.Z(\chs_out_f[0][DATA][24] ), 
	.E(n232), 
	.D(FE_OFN21_n5), 
	.C(n20), 
	.B(n10), 
	.A(n54));
   HS65_LS_AOI222X4 U100 (.Z(n232), 
	.F(\chs_in_f[1][DATA][24] ), 
	.E(FE_OFN37_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][24] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][24] ), 
	.A(FE_OFN41_switch_sel_10_));
   HS65_LS_OAI212X5 U101 (.Z(\chs_out_f[0][DATA][26] ), 
	.E(n230), 
	.D(FE_OFN21_n5), 
	.C(n18), 
	.B(n10), 
	.A(n52));
   HS65_LS_AOI222X4 U102 (.Z(n230), 
	.F(\chs_in_f[1][DATA][26] ), 
	.E(FE_OFN37_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][26] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][26] ), 
	.A(FE_OFN41_switch_sel_10_));
   HS65_LS_OAI212X5 U103 (.Z(\chs_out_f[0][DATA][28] ), 
	.E(n228), 
	.D(FE_OFN21_n5), 
	.C(n16), 
	.B(n10), 
	.A(n50));
   HS65_LS_AOI222X4 U104 (.Z(n228), 
	.F(\chs_in_f[1][DATA][28] ), 
	.E(FE_OFN37_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][28] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][28] ), 
	.A(FE_OFN41_switch_sel_10_));
   HS65_LS_OAI212X5 U105 (.Z(\chs_out_f[0][DATA][29] ), 
	.E(n227), 
	.D(n5), 
	.C(n15), 
	.B(FE_OFN25_n10), 
	.A(n49));
   HS65_LS_AOI222X2 U106 (.Z(n227), 
	.F(\chs_in_f[1][DATA][29] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][29] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][29] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U107 (.Z(\chs_out_f[0][DATA][30] ), 
	.E(n225), 
	.D(FE_OFN21_n5), 
	.C(n14), 
	.B(n10), 
	.A(n48));
   HS65_LS_AOI222X4 U108 (.Z(n225), 
	.F(\chs_in_f[1][DATA][30] ), 
	.E(FE_OFN37_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][30] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][30] ), 
	.A(FE_OFN41_switch_sel_10_));
   HS65_LS_OAI212X5 U109 (.Z(\chs_out_f[0][DATA][1] ), 
	.E(n237), 
	.D(n5), 
	.C(n43), 
	.B(FE_OFN25_n10), 
	.A(n77));
   HS65_LS_AOI222X4 U110 (.Z(n237), 
	.F(\chs_in_f[1][DATA][1] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][1] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][1] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U111 (.Z(\chs_out_f[0][DATA][11] ), 
	.E(n246), 
	.D(n5), 
	.C(n33), 
	.B(FE_OFN25_n10), 
	.A(n67));
   HS65_LS_AOI222X2 U114 (.Z(n244), 
	.F(\chs_in_f[1][DATA][13] ), 
	.E(FE_OFN37_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][13] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][13] ), 
	.A(FE_OFN41_switch_sel_10_));
   HS65_LS_AOI222X2 U116 (.Z(n242), 
	.F(\chs_in_f[1][DATA][15] ), 
	.E(FE_OFN37_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][15] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][15] ), 
	.A(FE_OFN41_switch_sel_10_));
   HS65_LS_AOI222X2 U118 (.Z(n240), 
	.F(\chs_in_f[1][DATA][17] ), 
	.E(FE_OFN37_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][17] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][17] ), 
	.A(FE_OFN41_switch_sel_10_));
   HS65_LS_AOI222X2 U120 (.Z(n238), 
	.F(\chs_in_f[1][DATA][19] ), 
	.E(FE_OFN37_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][19] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][19] ), 
	.A(FE_OFN41_switch_sel_10_));
   HS65_LS_AOI222X2 U122 (.Z(n235), 
	.F(\chs_in_f[1][DATA][21] ), 
	.E(FE_OFN37_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][21] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][21] ), 
	.A(FE_OFN41_switch_sel_10_));
   HS65_LS_AOI222X2 U124 (.Z(n233), 
	.F(\chs_in_f[1][DATA][23] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][23] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][23] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U127 (.Z(\chs_out_f[0][DATA][27] ), 
	.E(n229), 
	.D(n5), 
	.C(n17), 
	.B(FE_OFN25_n10), 
	.A(n51));
   HS65_LS_AOI222X4 U128 (.Z(n229), 
	.F(\chs_in_f[1][DATA][27] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][27] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][27] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_IVX9 U129 (.Z(n69), 
	.A(\chs_in_f[3][DATA][9] ));
   HS65_LS_IVX9 U130 (.Z(n45), 
	.A(\chs_in_f[3][DATA][33] ));
   HS65_LS_CNIVX21 U131 (.Z(n78), 
	.A(\chs_in_f[3][DATA][0] ));
   HS65_LS_IVX9 U132 (.Z(n77), 
	.A(\chs_in_f[3][DATA][1] ));
   HS65_LS_IVX9 U133 (.Z(n76), 
	.A(\chs_in_f[3][DATA][2] ));
   HS65_LS_IVX9 U134 (.Z(n75), 
	.A(\chs_in_f[3][DATA][3] ));
   HS65_LS_IVX9 U135 (.Z(n74), 
	.A(\chs_in_f[3][DATA][4] ));
   HS65_LS_IVX9 U136 (.Z(n73), 
	.A(\chs_in_f[3][DATA][5] ));
   HS65_LS_CNIVX21 U137 (.Z(n72), 
	.A(\chs_in_f[3][DATA][6] ));
   HS65_LS_IVX9 U138 (.Z(n71), 
	.A(\chs_in_f[3][DATA][7] ));
   HS65_LS_IVX9 U139 (.Z(n70), 
	.A(\chs_in_f[3][DATA][8] ));
   HS65_LS_IVX9 U140 (.Z(n68), 
	.A(\chs_in_f[3][DATA][10] ));
   HS65_LS_IVX9 U141 (.Z(n67), 
	.A(\chs_in_f[3][DATA][11] ));
   HS65_LS_IVX9 U142 (.Z(n66), 
	.A(\chs_in_f[3][DATA][12] ));
   HS65_LS_IVX9 U143 (.Z(n65), 
	.A(\chs_in_f[3][DATA][13] ));
   HS65_LS_IVX9 U144 (.Z(n64), 
	.A(\chs_in_f[3][DATA][14] ));
   HS65_LS_IVX9 U145 (.Z(n63), 
	.A(\chs_in_f[3][DATA][15] ));
   HS65_LS_IVX9 U146 (.Z(n62), 
	.A(\chs_in_f[3][DATA][16] ));
   HS65_LS_IVX9 U147 (.Z(n61), 
	.A(\chs_in_f[3][DATA][17] ));
   HS65_LS_CNIVX21 U148 (.Z(n60), 
	.A(\chs_in_f[3][DATA][18] ));
   HS65_LS_IVX9 U149 (.Z(n59), 
	.A(\chs_in_f[3][DATA][19] ));
   HS65_LS_IVX9 U150 (.Z(n58), 
	.A(\chs_in_f[3][DATA][20] ));
   HS65_LS_IVX9 U151 (.Z(n57), 
	.A(\chs_in_f[3][DATA][21] ));
   HS65_LS_IVX9 U152 (.Z(n56), 
	.A(\chs_in_f[3][DATA][22] ));
   HS65_LS_IVX9 U153 (.Z(n55), 
	.A(\chs_in_f[3][DATA][23] ));
   HS65_LS_CNIVX21 U154 (.Z(n54), 
	.A(\chs_in_f[3][DATA][24] ));
   HS65_LS_IVX9 U155 (.Z(n53), 
	.A(\chs_in_f[3][DATA][25] ));
   HS65_LS_IVX9 U156 (.Z(n52), 
	.A(\chs_in_f[3][DATA][26] ));
   HS65_LS_IVX9 U157 (.Z(n51), 
	.A(\chs_in_f[3][DATA][27] ));
   HS65_LS_IVX9 U158 (.Z(n50), 
	.A(\chs_in_f[3][DATA][28] ));
   HS65_LS_IVX9 U159 (.Z(n49), 
	.A(\chs_in_f[3][DATA][29] ));
   HS65_LS_IVX9 U160 (.Z(n48), 
	.A(\chs_in_f[3][DATA][30] ));
   HS65_LS_IVX9 U161 (.Z(n47), 
	.A(\chs_in_f[3][DATA][31] ));
   HS65_LS_CNIVX27 U162 (.Z(n46), 
	.A(\chs_in_f[3][DATA][32] ));
   HS65_LS_IVX9 U163 (.Z(n35), 
	.A(\chs_in_f[4][DATA][9] ));
   HS65_LS_IVX9 U164 (.Z(n11), 
	.A(\chs_in_f[4][DATA][33] ));
   HS65_LS_IVX9 U165 (.Z(n44), 
	.A(\chs_in_f[4][DATA][0] ));
   HS65_LS_IVX9 U166 (.Z(n43), 
	.A(\chs_in_f[4][DATA][1] ));
   HS65_LS_IVX9 U167 (.Z(n42), 
	.A(\chs_in_f[4][DATA][2] ));
   HS65_LS_IVX9 U168 (.Z(n41), 
	.A(\chs_in_f[4][DATA][3] ));
   HS65_LS_IVX9 U169 (.Z(n40), 
	.A(\chs_in_f[4][DATA][4] ));
   HS65_LS_IVX9 U170 (.Z(n39), 
	.A(\chs_in_f[4][DATA][5] ));
   HS65_LS_IVX9 U171 (.Z(n38), 
	.A(\chs_in_f[4][DATA][6] ));
   HS65_LS_IVX9 U172 (.Z(n37), 
	.A(\chs_in_f[4][DATA][7] ));
   HS65_LS_IVX9 U173 (.Z(n36), 
	.A(\chs_in_f[4][DATA][8] ));
   HS65_LS_IVX9 U174 (.Z(n34), 
	.A(\chs_in_f[4][DATA][10] ));
   HS65_LS_IVX9 U175 (.Z(n33), 
	.A(\chs_in_f[4][DATA][11] ));
   HS65_LS_CNIVX14 U176 (.Z(n32), 
	.A(\chs_in_f[4][DATA][12] ));
   HS65_LS_IVX9 U177 (.Z(n31), 
	.A(\chs_in_f[4][DATA][13] ));
   HS65_LS_IVX9 U178 (.Z(n30), 
	.A(\chs_in_f[4][DATA][14] ));
   HS65_LS_IVX9 U179 (.Z(n29), 
	.A(\chs_in_f[4][DATA][15] ));
   HS65_LS_IVX9 U180 (.Z(n28), 
	.A(\chs_in_f[4][DATA][16] ));
   HS65_LS_IVX9 U181 (.Z(n27), 
	.A(\chs_in_f[4][DATA][17] ));
   HS65_LS_IVX9 U182 (.Z(n26), 
	.A(\chs_in_f[4][DATA][18] ));
   HS65_LS_IVX9 U183 (.Z(n25), 
	.A(\chs_in_f[4][DATA][19] ));
   HS65_LS_IVX9 U184 (.Z(n24), 
	.A(\chs_in_f[4][DATA][20] ));
   HS65_LS_IVX9 U185 (.Z(n23), 
	.A(\chs_in_f[4][DATA][21] ));
   HS65_LS_IVX9 U186 (.Z(n22), 
	.A(\chs_in_f[4][DATA][22] ));
   HS65_LS_IVX9 U187 (.Z(n21), 
	.A(\chs_in_f[4][DATA][23] ));
   HS65_LS_CNIVX21 U188 (.Z(n20), 
	.A(\chs_in_f[4][DATA][24] ));
   HS65_LS_IVX9 U189 (.Z(n19), 
	.A(\chs_in_f[4][DATA][25] ));
   HS65_LS_IVX9 U190 (.Z(n18), 
	.A(\chs_in_f[4][DATA][26] ));
   HS65_LS_IVX9 U191 (.Z(n17), 
	.A(\chs_in_f[4][DATA][27] ));
   HS65_LS_IVX9 U192 (.Z(n16), 
	.A(\chs_in_f[4][DATA][28] ));
   HS65_LS_IVX9 U193 (.Z(n15), 
	.A(\chs_in_f[4][DATA][29] ));
   HS65_LS_IVX9 U194 (.Z(n14), 
	.A(\chs_in_f[4][DATA][30] ));
   HS65_LS_IVX9 U195 (.Z(n13), 
	.A(\chs_in_f[4][DATA][31] ));
   HS65_LS_CNIVX41 U196 (.Z(n12), 
	.A(\chs_in_f[4][DATA][32] ));
   HS65_LS_AOI222X4 U198 (.Z(n116), 
	.F(\chs_in_f[1][DATA][6] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][6] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][6] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X2 U200 (.Z(n115), 
	.F(\chs_in_f[1][DATA][7] ), 
	.E(FE_OFN39_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][7] ), 
	.C(FE_OFN49_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][7] ), 
	.A(FE_OFN43_switch_sel_13_));
   HS65_LS_AOI222X4 U202 (.Z(n114), 
	.F(\chs_in_f[1][DATA][8] ), 
	.E(FE_OFN39_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][8] ), 
	.C(FE_OFN49_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][8] ), 
	.A(FE_OFN43_switch_sel_13_));
   HS65_LS_AOI222X4 U204 (.Z(n145), 
	.F(\chs_in_f[1][DATA][10] ), 
	.E(FE_OFN39_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][10] ), 
	.C(FE_OFN49_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][10] ), 
	.A(FE_OFN43_switch_sel_13_));
   HS65_LS_AOI222X9 U206 (.Z(n143), 
	.F(\chs_in_f[1][DATA][12] ), 
	.E(FE_OFN39_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][12] ), 
	.C(FE_OFN49_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][12] ), 
	.A(FE_OFN43_switch_sel_13_));
   HS65_LS_AOI222X4 U208 (.Z(n141), 
	.F(\chs_in_f[1][DATA][14] ), 
	.E(FE_OFN39_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][14] ), 
	.C(FE_OFN49_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][14] ), 
	.A(FE_OFN43_switch_sel_13_));
   HS65_LS_AOI222X4 U210 (.Z(n139), 
	.F(\chs_in_f[1][DATA][16] ), 
	.E(FE_OFN39_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][16] ), 
	.C(FE_OFN49_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][16] ), 
	.A(FE_OFN43_switch_sel_13_));
   HS65_LS_AOI222X4 U212 (.Z(n137), 
	.F(\chs_in_f[1][DATA][18] ), 
	.E(FE_OFN39_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][18] ), 
	.C(FE_OFN49_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][18] ), 
	.A(FE_OFN43_switch_sel_13_));
   HS65_LS_OAI212X5 U213 (.Z(\chs_out_f[3][DATA][20] ), 
	.E(n134), 
	.D(n2), 
	.C(n24), 
	.B(FE_OFN35_n7), 
	.A(n58));
   HS65_LS_AOI222X4 U214 (.Z(n134), 
	.F(\chs_in_f[1][DATA][20] ), 
	.E(FE_OFN39_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][20] ), 
	.C(FE_OFN49_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][20] ), 
	.A(FE_OFN43_switch_sel_13_));
   HS65_LS_AOI222X4 U216 (.Z(n132), 
	.F(\chs_in_f[1][DATA][22] ), 
	.E(FE_OFN39_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][22] ), 
	.C(FE_OFN49_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][22] ), 
	.A(FE_OFN43_switch_sel_13_));
   HS65_LS_AOI222X4 U218 (.Z(n151), 
	.F(\chs_in_f[1][DATA][5] ), 
	.E(FE_OFN38_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][5] ), 
	.C(FE_OFN48_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][5] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X2 U220 (.Z(n150), 
	.F(\chs_in_f[1][DATA][6] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][6] ), 
	.C(FE_OFN48_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][6] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X9 U222 (.Z(n149), 
	.F(\chs_in_f[1][DATA][7] ), 
	.E(FE_OFN38_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][7] ), 
	.C(FE_OFN48_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][7] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U223 (.Z(\chs_out_f[2][DATA][8] ), 
	.E(n148), 
	.D(n3), 
	.C(n36), 
	.B(FE_OFN27_n8), 
	.A(n70));
   HS65_LS_AOI222X2 U224 (.Z(n148), 
	.F(\chs_in_f[1][DATA][8] ), 
	.E(FE_OFN38_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][8] ), 
	.C(FE_OFN48_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][8] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X9 U226 (.Z(n147), 
	.F(\chs_in_f[1][DATA][9] ), 
	.E(FE_OFN38_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][9] ), 
	.C(FE_OFN48_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][9] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X9 U228 (.Z(n179), 
	.F(\chs_in_f[1][DATA][10] ), 
	.E(FE_OFN38_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][10] ), 
	.C(FE_OFN48_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][10] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X4 U230 (.Z(n178), 
	.F(\chs_in_f[1][DATA][11] ), 
	.E(FE_OFN38_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][11] ), 
	.C(FE_OFN48_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][11] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X9 U232 (.Z(n177), 
	.F(\chs_in_f[1][DATA][12] ), 
	.E(FE_OFN38_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][12] ), 
	.C(FE_OFN48_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][12] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X9 U234 (.Z(n176), 
	.F(\chs_in_f[1][DATA][13] ), 
	.E(FE_OFN38_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][13] ), 
	.C(FE_OFN48_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][13] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X4 U236 (.Z(n175), 
	.F(\chs_in_f[1][DATA][14] ), 
	.E(FE_OFN38_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][14] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][14] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U237 (.Z(\chs_out_f[2][DATA][15] ), 
	.E(n174), 
	.D(n3), 
	.C(n29), 
	.B(n8), 
	.A(n63));
   HS65_LS_AOI222X4 U240 (.Z(n173), 
	.F(\chs_in_f[1][DATA][16] ), 
	.E(FE_OFN38_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][16] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][16] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X4 U242 (.Z(n172), 
	.F(\chs_in_f[1][DATA][17] ), 
	.E(FE_OFN38_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][17] ), 
	.C(FE_OFN48_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][17] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U243 (.Z(\chs_out_f[2][DATA][18] ), 
	.E(n171), 
	.D(FE_OFN23_n3), 
	.C(n26), 
	.B(n8), 
	.A(n60));
   HS65_LS_AOI222X9 U244 (.Z(n171), 
	.F(\chs_in_f[1][DATA][18] ), 
	.E(FE_OFN38_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][18] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][18] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X4 U246 (.Z(n170), 
	.F(\chs_in_f[1][DATA][19] ), 
	.E(FE_OFN38_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][19] ), 
	.C(FE_OFN48_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][19] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X4 U248 (.Z(n168), 
	.F(\chs_in_f[1][DATA][20] ), 
	.E(FE_OFN38_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][20] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][20] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U249 (.Z(\chs_out_f[2][DATA][21] ), 
	.E(n167), 
	.D(n3), 
	.C(n23), 
	.B(FE_OFN27_n8), 
	.A(n57));
   HS65_LS_AOI222X9 U252 (.Z(n166), 
	.F(\chs_in_f[1][DATA][22] ), 
	.E(FE_OFN38_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][22] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][22] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X4 U254 (.Z(n184), 
	.F(\chs_in_f[1][DATA][6] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][6] ), 
	.C(FE_OFN47_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][6] ), 
	.A(FE_OFN42_switch_sel_11_));
   HS65_LS_OAI212X5 U255 (.Z(\chs_out_f[1][DATA][7] ), 
	.E(n183), 
	.D(n4), 
	.C(n37), 
	.B(n9), 
	.A(n71));
   HS65_LS_AOI222X2 U256 (.Z(n183), 
	.F(\chs_in_f[1][DATA][7] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][7] ), 
	.C(FE_OFN47_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][7] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_OAI212X5 U257 (.Z(\chs_out_f[1][DATA][8] ), 
	.E(n182), 
	.D(n4), 
	.C(n36), 
	.B(n9), 
	.A(n70));
   HS65_LS_AOI222X4 U260 (.Z(n213), 
	.F(\chs_in_f[1][DATA][10] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][10] ), 
	.C(FE_OFN47_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][10] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X4 U262 (.Z(n211), 
	.F(\chs_in_f[1][DATA][12] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][12] ), 
	.C(FE_OFN47_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][12] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X4 U264 (.Z(n209), 
	.F(\chs_in_f[1][DATA][14] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][14] ), 
	.C(FE_OFN46_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][14] ), 
	.A(FE_OFN42_switch_sel_11_));
   HS65_LS_OAI212X5 U265 (.Z(\chs_out_f[1][DATA][16] ), 
	.E(n207), 
	.D(FE_OFN22_n4), 
	.C(n28), 
	.B(FE_OFN26_n9), 
	.A(n62));
   HS65_LS_AOI222X4 U266 (.Z(n207), 
	.F(\chs_in_f[1][DATA][16] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][16] ), 
	.C(FE_OFN46_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][16] ), 
	.A(FE_OFN42_switch_sel_11_));
   HS65_LS_OAI212X5 U267 (.Z(\chs_out_f[1][DATA][18] ), 
	.E(n205), 
	.D(FE_OFN22_n4), 
	.C(n26), 
	.B(FE_OFN26_n9), 
	.A(n60));
   HS65_LS_AOI222X4 U268 (.Z(n205), 
	.F(\chs_in_f[1][DATA][18] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][18] ), 
	.C(FE_OFN46_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][18] ), 
	.A(FE_OFN42_switch_sel_11_));
   HS65_LS_OAI212X5 U269 (.Z(\chs_out_f[1][DATA][20] ), 
	.E(n202), 
	.D(FE_OFN22_n4), 
	.C(n24), 
	.B(FE_OFN26_n9), 
	.A(n58));
   HS65_LS_AOI222X4 U270 (.Z(n202), 
	.F(\chs_in_f[1][DATA][20] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][20] ), 
	.C(FE_OFN46_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][20] ), 
	.A(FE_OFN42_switch_sel_11_));
   HS65_LS_OAI212X5 U271 (.Z(\chs_out_f[1][DATA][22] ), 
	.E(n200), 
	.D(FE_OFN22_n4), 
	.C(n22), 
	.B(FE_OFN26_n9), 
	.A(n56));
   HS65_LS_AOI222X4 U272 (.Z(n200), 
	.F(\chs_in_f[1][DATA][22] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][22] ), 
	.C(FE_OFN46_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][22] ), 
	.A(FE_OFN42_switch_sel_11_));
   HS65_LS_OAI212X5 U273 (.Z(\chs_out_f[0][DATA][6] ), 
	.E(n218), 
	.D(FE_OFN21_n5), 
	.C(n38), 
	.B(n10), 
	.A(n72));
   HS65_LS_AOI222X9 U274 (.Z(n218), 
	.F(\chs_in_f[1][DATA][6] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][6] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][6] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U275 (.Z(\chs_out_f[0][DATA][7] ), 
	.E(n217), 
	.D(FE_OFN21_n5), 
	.C(n37), 
	.B(n10), 
	.A(n71));
   HS65_LS_AOI222X2 U276 (.Z(n217), 
	.F(\chs_in_f[1][DATA][7] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][7] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][7] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_AOI222X4 U278 (.Z(n216), 
	.F(\chs_in_f[1][DATA][8] ), 
	.E(FE_OFN37_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][8] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][8] ), 
	.A(FE_OFN41_switch_sel_10_));
   HS65_LS_AOI222X4 U280 (.Z(n82), 
	.F(FE_OFN40_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][6] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][6] ), 
	.B(FE_OFN45_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][6] ));
   HS65_LS_OAI212X5 U282 (.Z(\chs_out_f[4][DATA][8] ), 
	.E(n80), 
	.D(n36), 
	.C(n1), 
	.B(n70), 
	.A(n6));
   HS65_LS_AOI222X4 U283 (.Z(n80), 
	.F(FE_OFN40_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][8] ), 
	.D(FE_OFN50_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][8] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][8] ));
   HS65_LS_AOI222X4 U285 (.Z(n111), 
	.F(FE_OFN40_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][10] ), 
	.D(FE_OFN50_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][10] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][10] ));
   HS65_LS_AOI222X4 U287 (.Z(n109), 
	.F(FE_OFN40_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][12] ), 
	.D(FE_OFN50_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][12] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][12] ));
   HS65_LS_AOI222X4 U289 (.Z(n107), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][14] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][14] ), 
	.B(FE_OFN45_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][14] ));
   HS65_LS_OAI212X5 U290 (.Z(\chs_out_f[4][DATA][16] ), 
	.E(n105), 
	.D(n28), 
	.C(FE_OFN36_n1), 
	.B(n62), 
	.A(FE_OFN28_n6));
   HS65_LS_OAI212X5 U294 (.Z(\chs_out_f[4][DATA][20] ), 
	.E(n100), 
	.D(n24), 
	.C(FE_OFN36_n1), 
	.B(n58), 
	.A(FE_OFN28_n6));
   HS65_LS_AOI222X4 U297 (.Z(n98), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][22] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][22] ), 
	.B(FE_OFN45_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][22] ));
   HS65_LS_AOI222X2 U299 (.Z(n117), 
	.F(\chs_in_f[1][DATA][5] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][5] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][5] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X4 U301 (.Z(n113), 
	.F(\chs_in_f[1][DATA][9] ), 
	.E(FE_OFN39_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][9] ), 
	.C(FE_OFN49_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][9] ), 
	.A(FE_OFN43_switch_sel_13_));
   HS65_LS_AOI222X4 U303 (.Z(n144), 
	.F(\chs_in_f[1][DATA][11] ), 
	.E(FE_OFN39_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][11] ), 
	.C(FE_OFN49_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][11] ), 
	.A(FE_OFN43_switch_sel_13_));
   HS65_LS_AOI222X2 U305 (.Z(n142), 
	.F(\chs_in_f[1][DATA][13] ), 
	.E(FE_OFN39_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][13] ), 
	.C(FE_OFN49_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][13] ), 
	.A(FE_OFN43_switch_sel_13_));
   HS65_LS_OAI212X5 U306 (.Z(\chs_out_f[3][DATA][15] ), 
	.E(n140), 
	.D(n2), 
	.C(n29), 
	.B(n7), 
	.A(n63));
   HS65_LS_AOI222X2 U307 (.Z(n140), 
	.F(\chs_in_f[1][DATA][15] ), 
	.E(FE_OFN39_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][15] ), 
	.C(FE_OFN49_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][15] ), 
	.A(FE_OFN43_switch_sel_13_));
   HS65_LS_OAI212X5 U308 (.Z(\chs_out_f[3][DATA][17] ), 
	.E(n138), 
	.D(n2), 
	.C(n27), 
	.B(n7), 
	.A(n61));
   HS65_LS_AOI222X2 U309 (.Z(n138), 
	.F(\chs_in_f[1][DATA][17] ), 
	.E(FE_OFN39_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][17] ), 
	.C(FE_OFN49_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][17] ), 
	.A(FE_OFN43_switch_sel_13_));
   HS65_LS_AOI222X2 U311 (.Z(n136), 
	.F(\chs_in_f[1][DATA][19] ), 
	.E(FE_OFN39_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][19] ), 
	.C(FE_OFN49_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][19] ), 
	.A(FE_OFN43_switch_sel_13_));
   HS65_LS_AOI222X4 U313 (.Z(n133), 
	.F(\chs_in_f[1][DATA][21] ), 
	.E(FE_OFN39_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][21] ), 
	.C(FE_OFN49_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][21] ), 
	.A(FE_OFN43_switch_sel_13_));
   HS65_LS_AOI222X2 U315 (.Z(n185), 
	.F(\chs_in_f[1][DATA][5] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][5] ), 
	.C(FE_OFN47_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][5] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U317 (.Z(n181), 
	.F(\chs_in_f[1][DATA][9] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][9] ), 
	.C(FE_OFN47_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][9] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U319 (.Z(n212), 
	.F(\chs_in_f[1][DATA][11] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][11] ), 
	.C(FE_OFN47_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][11] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U321 (.Z(n210), 
	.F(\chs_in_f[1][DATA][13] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][13] ), 
	.C(FE_OFN47_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][13] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U323 (.Z(n208), 
	.F(\chs_in_f[1][DATA][15] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][15] ), 
	.C(FE_OFN47_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][15] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U325 (.Z(n206), 
	.F(\chs_in_f[1][DATA][17] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][17] ), 
	.C(FE_OFN47_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][17] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U327 (.Z(n204), 
	.F(\chs_in_f[1][DATA][19] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][19] ), 
	.C(FE_OFN47_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][19] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U329 (.Z(n201), 
	.F(\chs_in_f[1][DATA][21] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][21] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][21] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X4 U333 (.Z(n215), 
	.F(\chs_in_f[1][DATA][9] ), 
	.E(FE_OFN37_switch_sel_5_), 
	.D(\chs_in_f[0][DATA][9] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][9] ), 
	.A(FE_OFN41_switch_sel_10_));
   HS65_LS_AOI222X2 U335 (.Z(n83), 
	.F(FE_OFN40_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][5] ), 
	.D(FE_OFN50_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][5] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][5] ));
   HS65_LS_AOI222X2 U337 (.Z(n79), 
	.F(\chs_in_f[1][DATA][9] ), 
	.E(FE_OFN40_switch_sel_9_), 
	.D(\chs_in_f[0][DATA][9] ), 
	.C(FE_OFN50_switch_sel_4_), 
	.B(\chs_in_f[2][DATA][9] ), 
	.A(\switch_sel[2][4] ));
   HS65_LS_AOI222X2 U339 (.Z(n110), 
	.F(FE_OFN40_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][11] ), 
	.D(FE_OFN50_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][11] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][11] ));
   HS65_LS_AOI222X2 U341 (.Z(n108), 
	.F(FE_OFN40_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][13] ), 
	.D(FE_OFN50_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][13] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][13] ));
   HS65_LS_AOI222X4 U343 (.Z(n106), 
	.F(FE_OFN40_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][15] ), 
	.D(FE_OFN50_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][15] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][15] ));
   HS65_LS_OAI212X5 U344 (.Z(\chs_out_f[4][DATA][17] ), 
	.E(n104), 
	.D(n27), 
	.C(n1), 
	.B(n61), 
	.A(n6));
   HS65_LS_AOI222X2 U345 (.Z(n104), 
	.F(FE_OFN40_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][17] ), 
	.D(FE_OFN50_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][17] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][17] ));
   HS65_LS_AOI222X2 U347 (.Z(n102), 
	.F(FE_OFN40_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][19] ), 
	.D(FE_OFN50_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][19] ), 
	.B(\switch_sel[2][4] ), 
	.A(\chs_in_f[2][DATA][19] ));
   HS65_LS_AOI222X2 U349 (.Z(n99), 
	.F(FE_OFN40_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][21] ), 
	.D(FE_OFN50_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][21] ), 
	.B(FE_OFN44_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][21] ));
   HS65_LS_AOI222X2 U351 (.Z(n120), 
	.F(\chs_in_f[1][DATA][33] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][33] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][33] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_OAI212X5 U352 (.Z(\chs_out_f[3][DATA][0] ), 
	.E(n146), 
	.D(FE_OFN24_n2), 
	.C(n44), 
	.B(FE_OFN35_n7), 
	.A(n78));
   HS65_LS_AOI222X4 U353 (.Z(n146), 
	.F(\chs_in_f[1][DATA][0] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][0] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][0] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X4 U355 (.Z(n124), 
	.F(\chs_in_f[1][DATA][2] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][2] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][2] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X4 U357 (.Z(n118), 
	.F(\chs_in_f[1][DATA][4] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][4] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][4] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_OAI212X5 U358 (.Z(\chs_out_f[3][DATA][24] ), 
	.E(n130), 
	.D(n2), 
	.C(n20), 
	.B(FE_OFN35_n7), 
	.A(n54));
   HS65_LS_AOI222X4 U361 (.Z(n128), 
	.F(\chs_in_f[1][DATA][26] ), 
	.E(FE_OFN39_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][26] ), 
	.C(FE_OFN49_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][26] ), 
	.A(FE_OFN43_switch_sel_13_));
   HS65_LS_AOI222X4 U363 (.Z(n126), 
	.F(\chs_in_f[1][DATA][28] ), 
	.E(FE_OFN39_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][28] ), 
	.C(FE_OFN49_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][28] ), 
	.A(FE_OFN43_switch_sel_13_));
   HS65_LS_AOI222X4 U367 (.Z(n123), 
	.F(\chs_in_f[1][DATA][30] ), 
	.E(FE_OFN39_switch_sel_8_), 
	.D(\chs_in_f[0][DATA][30] ), 
	.C(FE_OFN49_switch_sel_3_), 
	.B(\chs_in_f[2][DATA][30] ), 
	.A(FE_OFN43_switch_sel_13_));
   HS65_LS_OAI212X5 U368 (.Z(\chs_out_f[3][DATA][31] ), 
	.E(n122), 
	.D(FE_OFN24_n2), 
	.C(n13), 
	.B(FE_OFN35_n7), 
	.A(n47));
   HS65_LS_AOI222X2 U369 (.Z(n122), 
	.F(\chs_in_f[1][DATA][31] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][31] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][31] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X2 U371 (.Z(n121), 
	.F(\chs_in_f[1][DATA][32] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][32] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][32] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_OAI212X5 U372 (.Z(\chs_out_f[2][DATA][33] ), 
	.E(n154), 
	.D(FE_OFN23_n3), 
	.C(n11), 
	.B(FE_OFN27_n8), 
	.A(n45));
   HS65_LS_AOI222X4 U375 (.Z(n180), 
	.F(\chs_in_f[1][DATA][0] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][0] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][0] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X2 U377 (.Z(n169), 
	.F(\chs_in_f[1][DATA][1] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][1] ), 
	.C(FE_OFN48_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][1] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X4 U379 (.Z(n158), 
	.F(\chs_in_f[1][DATA][2] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][2] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][2] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X2 U381 (.Z(n153), 
	.F(\chs_in_f[1][DATA][3] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][3] ), 
	.C(FE_OFN48_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][3] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X2 U385 (.Z(n165), 
	.F(\chs_in_f[1][DATA][23] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][23] ), 
	.C(FE_OFN48_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][23] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U386 (.Z(\chs_out_f[2][DATA][24] ), 
	.E(n164), 
	.D(FE_OFN23_n3), 
	.C(n20), 
	.B(n8), 
	.A(n54));
   HS65_LS_AOI222X4 U387 (.Z(n164), 
	.F(\chs_in_f[1][DATA][24] ), 
	.E(FE_OFN38_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][24] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][24] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X2 U389 (.Z(n163), 
	.F(\chs_in_f[1][DATA][25] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][25] ), 
	.C(FE_OFN48_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][25] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X4 U395 (.Z(n160), 
	.F(\chs_in_f[1][DATA][28] ), 
	.E(FE_OFN38_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][28] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][28] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X2 U397 (.Z(n159), 
	.F(\chs_in_f[1][DATA][29] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][29] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][29] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_AOI222X4 U399 (.Z(n157), 
	.F(\chs_in_f[1][DATA][30] ), 
	.E(FE_OFN38_switch_sel_7_), 
	.D(\chs_in_f[0][DATA][30] ), 
	.C(\switch_sel[0][2] ), 
	.B(\chs_in_f[2][DATA][30] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U400 (.Z(\chs_out_f[2][DATA][31] ), 
	.E(n156), 
	.D(FE_OFN23_n3), 
	.C(n13), 
	.B(FE_OFN27_n8), 
	.A(n47));
   HS65_LS_AOI222X2 U403 (.Z(n155), 
	.F(\chs_in_f[1][DATA][32] ), 
	.E(\switch_sel[1][2] ), 
	.D(\chs_in_f[0][DATA][32] ), 
	.C(FE_OFN48_switch_sel_2_), 
	.B(\chs_in_f[2][DATA][32] ), 
	.A(\switch_sel[2][2] ));
   HS65_LS_OAI212X5 U405 (.Z(\chs_out_f[1][DATA][0] ), 
	.E(n214), 
	.D(FE_OFN22_n4), 
	.C(n44), 
	.B(FE_OFN26_n9), 
	.A(n78));
   HS65_LS_AOI222X4 U406 (.Z(n214), 
	.F(\chs_in_f[1][DATA][0] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][0] ), 
	.C(FE_OFN46_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][0] ), 
	.A(FE_OFN42_switch_sel_11_));
   HS65_LS_AOI222X4 U408 (.Z(n192), 
	.F(\chs_in_f[1][DATA][2] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][2] ), 
	.C(FE_OFN46_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][2] ), 
	.A(FE_OFN42_switch_sel_11_));
   HS65_LS_AOI222X4 U410 (.Z(n186), 
	.F(\chs_in_f[1][DATA][4] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][4] ), 
	.C(FE_OFN46_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][4] ), 
	.A(FE_OFN42_switch_sel_11_));
   HS65_LS_OAI212X5 U411 (.Z(\chs_out_f[1][DATA][24] ), 
	.E(n198), 
	.D(FE_OFN22_n4), 
	.C(n20), 
	.B(FE_OFN26_n9), 
	.A(n54));
   HS65_LS_AOI222X4 U412 (.Z(n198), 
	.F(\chs_in_f[1][DATA][24] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][24] ), 
	.C(FE_OFN46_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][24] ), 
	.A(FE_OFN42_switch_sel_11_));
   HS65_LS_AOI222X4 U414 (.Z(n196), 
	.F(\chs_in_f[1][DATA][26] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][26] ), 
	.C(FE_OFN46_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][26] ), 
	.A(FE_OFN42_switch_sel_11_));
   HS65_LS_OAI212X5 U415 (.Z(\chs_out_f[1][DATA][28] ), 
	.E(n194), 
	.D(FE_OFN22_n4), 
	.C(n16), 
	.B(FE_OFN26_n9), 
	.A(n50));
   HS65_LS_AOI222X4 U416 (.Z(n194), 
	.F(\chs_in_f[1][DATA][28] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][28] ), 
	.C(FE_OFN46_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][28] ), 
	.A(FE_OFN42_switch_sel_11_));
   HS65_LS_AOI222X2 U418 (.Z(n193), 
	.F(\chs_in_f[1][DATA][29] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][29] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][29] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X4 U420 (.Z(n191), 
	.F(\chs_in_f[1][DATA][30] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][30] ), 
	.C(FE_OFN46_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][30] ), 
	.A(FE_OFN42_switch_sel_11_));
   HS65_LS_OAI212X5 U422 (.Z(\chs_out_f[1][DATA][32] ), 
	.E(n189), 
	.D(FE_OFN22_n4), 
	.C(n12), 
	.B(FE_OFN26_n9), 
	.A(n46));
   HS65_LS_OAI212X5 U423 (.Z(\chs_out_f[0][DATA][33] ), 
	.E(n222), 
	.D(n5), 
	.C(n11), 
	.B(FE_OFN25_n10), 
	.A(n45));
   HS65_LS_OAI212X5 U424 (.Z(\chs_out_f[0][DATA][4] ), 
	.E(n220), 
	.D(n5), 
	.C(n40), 
	.B(FE_OFN25_n10), 
	.A(n74));
   HS65_LS_AOI222X4 U425 (.Z(n220), 
	.F(\chs_in_f[1][DATA][4] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][4] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][4] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_OAI212X5 U426 (.Z(\chs_out_f[0][DATA][31] ), 
	.E(n224), 
	.D(n5), 
	.C(n13), 
	.B(FE_OFN25_n10), 
	.A(n47));
   HS65_LS_OAI212X5 U428 (.Z(\chs_out_f[4][DATA][0] ), 
	.E(n112), 
	.D(n44), 
	.C(FE_OFN36_n1), 
	.B(n78), 
	.A(FE_OFN28_n6));
   HS65_LS_OAI212X5 U430 (.Z(\chs_out_f[4][DATA][2] ), 
	.E(n90), 
	.D(n42), 
	.C(FE_OFN36_n1), 
	.B(n76), 
	.A(FE_OFN28_n6));
   HS65_LS_OAI212X5 U434 (.Z(\chs_out_f[4][DATA][24] ), 
	.E(n96), 
	.D(n20), 
	.C(FE_OFN36_n1), 
	.B(n54), 
	.A(FE_OFN28_n6));
   HS65_LS_AOI222X9 U435 (.Z(n96), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][24] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][24] ), 
	.B(FE_OFN45_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][24] ));
   HS65_LS_OAI212X5 U436 (.Z(\chs_out_f[4][DATA][26] ), 
	.E(n94), 
	.D(n18), 
	.C(FE_OFN36_n1), 
	.B(n52), 
	.A(FE_OFN28_n6));
   HS65_LS_AOI222X4 U437 (.Z(n94), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][26] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][26] ), 
	.B(FE_OFN45_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][26] ));
   HS65_LS_AOI222X4 U439 (.Z(n92), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][28] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][28] ), 
	.B(FE_OFN45_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][28] ));
   HS65_LS_AOI222X9 U441 (.Z(n91), 
	.F(FE_OFN40_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][29] ), 
	.D(FE_OFN50_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][29] ), 
	.B(FE_OFN44_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][29] ));
   HS65_LS_AOI222X4 U443 (.Z(n89), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][30] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][30] ), 
	.B(FE_OFN45_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][30] ));
   HS65_LS_AOI222X2 U445 (.Z(n135), 
	.F(\chs_in_f[1][DATA][1] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][1] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][1] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X2 U447 (.Z(n119), 
	.F(\chs_in_f[1][DATA][3] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][3] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][3] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_OAI212X5 U448 (.Z(\chs_out_f[3][DATA][23] ), 
	.E(n131), 
	.D(FE_OFN24_n2), 
	.C(n21), 
	.B(n7), 
	.A(n55));
   HS65_LS_AOI222X9 U449 (.Z(n131), 
	.F(\chs_in_f[1][DATA][23] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][23] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][23] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X2 U451 (.Z(n129), 
	.F(\chs_in_f[1][DATA][25] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][25] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][25] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X4 U453 (.Z(n127), 
	.F(\chs_in_f[1][DATA][27] ), 
	.E(\switch_sel[1][3] ), 
	.D(\chs_in_f[0][DATA][27] ), 
	.C(\switch_sel[0][3] ), 
	.B(\chs_in_f[2][DATA][27] ), 
	.A(\switch_sel[2][3] ));
   HS65_LS_AOI222X4 U455 (.Z(n203), 
	.F(\chs_in_f[1][DATA][1] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][1] ), 
	.C(FE_OFN47_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][1] ), 
	.A(FE_OFN42_switch_sel_11_));
   HS65_LS_AOI222X2 U457 (.Z(n187), 
	.F(\chs_in_f[1][DATA][3] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][3] ), 
	.C(FE_OFN47_switch_sel_1_), 
	.B(\chs_in_f[2][DATA][3] ), 
	.A(FE_OFN42_switch_sel_11_));
   HS65_LS_AOI222X2 U459 (.Z(n199), 
	.F(\chs_in_f[1][DATA][23] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][23] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][23] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U461 (.Z(n197), 
	.F(\chs_in_f[1][DATA][25] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][25] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][25] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X9 U463 (.Z(n195), 
	.F(\chs_in_f[1][DATA][27] ), 
	.E(\switch_sel[1][1] ), 
	.D(\chs_in_f[0][DATA][27] ), 
	.C(\switch_sel[0][1] ), 
	.B(\chs_in_f[2][DATA][27] ), 
	.A(\switch_sel[2][1] ));
   HS65_LS_AOI222X2 U465 (.Z(n221), 
	.F(\chs_in_f[1][DATA][3] ), 
	.E(\switch_sel[1][0] ), 
	.D(\chs_in_f[0][DATA][3] ), 
	.C(\switch_sel[0][0] ), 
	.B(\chs_in_f[2][DATA][3] ), 
	.A(\switch_sel[2][0] ));
   HS65_LS_AOI222X2 U467 (.Z(n101), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][1] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][1] ), 
	.B(FE_OFN44_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][1] ));
   HS65_LS_AOI222X2 U469 (.Z(n85), 
	.F(\switch_sel[1][4] ), 
	.E(\chs_in_f[1][DATA][3] ), 
	.D(\switch_sel[0][4] ), 
	.C(\chs_in_f[0][DATA][3] ), 
	.B(FE_OFN44_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][3] ));
   HS65_LS_AOI222X2 U471 (.Z(n97), 
	.F(FE_OFN40_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][23] ), 
	.D(FE_OFN50_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][23] ), 
	.B(FE_OFN44_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][23] ));
   HS65_LS_AOI222X2 U473 (.Z(n95), 
	.F(FE_OFN40_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][25] ), 
	.D(FE_OFN50_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][25] ), 
	.B(FE_OFN44_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][25] ));
   HS65_LS_AOI222X4 U475 (.Z(n93), 
	.F(FE_OFN40_switch_sel_9_), 
	.E(\chs_in_f[1][DATA][27] ), 
	.D(FE_OFN50_switch_sel_4_), 
	.C(\chs_in_f[0][DATA][27] ), 
	.B(FE_OFN44_switch_sel_14_), 
	.A(\chs_in_f[2][DATA][27] ));
   HS65_LS_IVX9 U476 (.Z(n2), 
	.A(\switch_sel[4][3] ));
   HS65_LS_IVX9 U477 (.Z(n8), 
	.A(\switch_sel[3][2] ));
   HS65_LS_IVX9 U478 (.Z(n3), 
	.A(\switch_sel[4][2] ));
   HS65_LS_IVX9 U479 (.Z(n9), 
	.A(\switch_sel[3][1] ));
   HS65_LS_IVX9 U480 (.Z(n4), 
	.A(\switch_sel[4][1] ));
   HS65_LS_IVX9 U481 (.Z(n10), 
	.A(\switch_sel[3][0] ));
   HS65_LS_IVX9 U482 (.Z(n5), 
	.A(\switch_sel[4][0] ));
   HS65_LS_IVX9 U483 (.Z(n6), 
	.A(\switch_sel[3][4] ));
   HS65_LS_IVX9 U496 (.Z(n7), 
	.A(\switch_sel[3][3] ));
   HS65_LS_IVX9 U497 (.Z(n1), 
	.A(\switch_sel[4][4] ));
endmodule

module sr_latch_1_5 (
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

   sr_latch_1_5 latch (.s(set), 
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
   wire n1;

   assign Rout = Aout ;

   c_gate_1_0 gate (.preset(preset), 
	.a(n1), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 U1 (.Z(n1), 
	.A(Ain));
   HS65_LSS_XOR2X6 U2 (.Z(lt_en), 
	.B(Ain), 
	.A(Aout));
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
   wire FE_PHN335_n1;
   wire FE_PHN331_n1;
   wire N3__L1_N1;
   wire N3__L1_N0;
   wire FE_OFN16_n4;
   wire N0;
   wire lt_en;
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
   wire N37;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n6;

   assign N0 = preset ;

   HS65_LS_BFX7 FE_PHC335_n1 (.Z(FE_PHN335_n1), 
	.A(N0));
   HS65_LH_DLYIC2X9 FE_PHC331_n1 (.Z(FE_PHN331_n1), 
	.A(FE_PHN335_n1));
   HS65_LS_BFX9 N3__L1_I1 (.Z(N3__L1_N1), 
	.A(N3));
   HS65_LS_BFX9 N3__L1_I0 (.Z(N3__L1_N0), 
	.A(N3));
   HS65_LS_BFX18 FE_OFC16_n4 (.Z(FE_OFN16_n4), 
	.A(n4));
   latch_controller_0_0 controller (.preset(FE_OFN16_n4), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_AND2X4 U6 (.Z(n1), 
	.B(n4), 
	.A(1'b1));
   HS65_LS_AND2X4 U7 (.Z(n2), 
	.B(n6), 
	.A(n3));
   HS65_LS_OR2X9 U8 (.Z(N3), 
	.B(n2), 
	.A(n1));
   HS65_LS_LDHQX9 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3__L1_N1), 
	.D(N37));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(N3__L1_N1), 
	.D(N36));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3__L1_N1), 
	.D(N35));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(N3__L1_N1), 
	.D(N34));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3__L1_N1), 
	.D(N33));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(N3__L1_N1), 
	.D(N32));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3__L1_N1), 
	.D(N31));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(N3__L1_N1), 
	.D(N30));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3__L1_N1), 
	.D(N29));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(N3__L1_N1), 
	.D(N28));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3__L1_N0), 
	.D(N27));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(N3__L1_N0), 
	.D(N26));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3__L1_N0), 
	.D(N25));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(N3__L1_N0), 
	.D(N24));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3__L1_N0), 
	.D(N23));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(N3__L1_N0), 
	.D(N22));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3__L1_N0), 
	.D(N21));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(N3__L1_N0), 
	.D(N20));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3__L1_N0), 
	.D(N19));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3__L1_N0), 
	.D(N18));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(N3__L1_N0), 
	.D(N17));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3__L1_N0), 
	.D(N16));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(N3__L1_N0), 
	.D(N15));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3__L1_N0), 
	.D(N14));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(N3__L1_N0), 
	.D(N13));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3__L1_N0), 
	.D(N12));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(N3__L1_N0), 
	.D(N11));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3__L1_N0), 
	.D(N10));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(N3__L1_N1), 
	.D(N9));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3__L1_N1), 
	.D(N8));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(N3__L1_N1), 
	.D(N7));
   HS65_LS_LDHQX9 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3__L1_N1), 
	.D(N6));
   HS65_LS_LDHQX9 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3__L1_N1), 
	.D(N5));
   HS65_LS_LDHQX9 type_out_reg (.Q(\right_out[DATA][33] ), 
	.G(N3__L1_N0), 
	.D(N4));
   HS65_LS_IVX9 U3 (.Z(n6), 
	.A(FE_PHN331_n1));
   HS65_LS_IVX9 U4 (.Z(n4), 
	.A(n6));
   HS65_LS_NOR2AX3 U9 (.Z(N11), 
	.B(FE_OFN16_n4), 
	.A(\left_in[DATA][6] ));
   HS65_LS_NOR2AX13 U10 (.Z(N12), 
	.B(FE_OFN16_n4), 
	.A(\left_in[DATA][7] ));
   HS65_LS_CNNOR2AX15 U11 (.Z(N13), 
	.B(FE_OFN16_n4), 
	.A(\left_in[DATA][8] ));
   HS65_LS_NOR2AX3 U12 (.Z(N15), 
	.B(FE_OFN16_n4), 
	.A(\left_in[DATA][10] ));
   HS65_LS_NOR2AX13 U13 (.Z(N17), 
	.B(FE_OFN16_n4), 
	.A(\left_in[DATA][12] ));
   HS65_LS_NOR2AX13 U14 (.Z(N19), 
	.B(FE_OFN16_n4), 
	.A(\left_in[DATA][14] ));
   HS65_LS_NOR2AX13 U15 (.Z(N21), 
	.B(FE_OFN16_n4), 
	.A(\left_in[DATA][16] ));
   HS65_LS_NOR2AX13 U16 (.Z(N23), 
	.B(FE_OFN16_n4), 
	.A(\left_in[DATA][18] ));
   HS65_LS_NOR2AX3 U17 (.Z(N25), 
	.B(FE_OFN16_n4), 
	.A(\left_in[DATA][20] ));
   HS65_LS_NOR2AX13 U18 (.Z(N27), 
	.B(FE_OFN16_n4), 
	.A(\left_in[DATA][22] ));
   HS65_LS_NOR2AX13 U19 (.Z(N10), 
	.B(FE_OFN16_n4), 
	.A(\left_in[DATA][5] ));
   HS65_LS_NOR2AX13 U20 (.Z(N14), 
	.B(FE_OFN16_n4), 
	.A(\left_in[DATA][9] ));
   HS65_LS_NOR2AX19 U21 (.Z(N16), 
	.B(FE_OFN16_n4), 
	.A(\left_in[DATA][11] ));
   HS65_LS_NOR2AX13 U22 (.Z(N18), 
	.B(FE_OFN16_n4), 
	.A(\left_in[DATA][13] ));
   HS65_LS_NOR2AX3 U23 (.Z(N20), 
	.B(FE_OFN16_n4), 
	.A(\left_in[DATA][15] ));
   HS65_LS_NOR2AX13 U24 (.Z(N22), 
	.B(FE_OFN16_n4), 
	.A(\left_in[DATA][17] ));
   HS65_LS_NOR2AX13 U25 (.Z(N24), 
	.B(FE_OFN16_n4), 
	.A(\left_in[DATA][19] ));
   HS65_LS_NOR2AX13 U26 (.Z(N26), 
	.B(FE_OFN16_n4), 
	.A(\left_in[DATA][21] ));
   HS65_LS_CNNOR2AX15 U27 (.Z(N4), 
	.B(n4), 
	.A(\left_in[DATA][33] ));
   HS65_LS_NOR2AX13 U28 (.Z(N5), 
	.B(n4), 
	.A(\left_in[DATA][0] ));
   HS65_LS_NOR2AX3 U29 (.Z(N7), 
	.B(n4), 
	.A(\left_in[DATA][2] ));
   HS65_LS_NOR2AX13 U30 (.Z(N9), 
	.B(n4), 
	.A(\left_in[DATA][4] ));
   HS65_LS_NOR2AX3 U31 (.Z(N29), 
	.B(n4), 
	.A(\left_in[DATA][24] ));
   HS65_LS_CNNOR2AX15 U32 (.Z(N31), 
	.B(n4), 
	.A(\left_in[DATA][26] ));
   HS65_LS_NOR2AX13 U33 (.Z(N33), 
	.B(n4), 
	.A(\left_in[DATA][28] ));
   HS65_LS_NOR2AX3 U34 (.Z(N34), 
	.B(n4), 
	.A(\left_in[DATA][29] ));
   HS65_LS_NOR2AX13 U35 (.Z(N35), 
	.B(n4), 
	.A(\left_in[DATA][30] ));
   HS65_LS_CNNOR2AX15 U36 (.Z(N36), 
	.B(n4), 
	.A(\left_in[DATA][31] ));
   HS65_LS_NOR2AX13 U37 (.Z(N37), 
	.B(n4), 
	.A(\left_in[DATA][32] ));
   HS65_LS_NOR2AX3 U38 (.Z(N6), 
	.B(n4), 
	.A(\left_in[DATA][1] ));
   HS65_LS_NOR2AX13 U39 (.Z(N8), 
	.B(n4), 
	.A(\left_in[DATA][3] ));
   HS65_LS_NOR2AX3 U40 (.Z(N28), 
	.B(n4), 
	.A(\left_in[DATA][23] ));
   HS65_LS_NOR2AX13 U41 (.Z(N30), 
	.B(n4), 
	.A(\left_in[DATA][25] ));
   HS65_LS_NOR2AX13 U42 (.Z(N32), 
	.B(n4), 
	.A(\left_in[DATA][27] ));
   HS65_LS_IVX9 U43 (.Z(n3), 
	.A(lt_en));
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
   wire n2;

   assign Rout = Aout ;

   c_gate_1_1 gate (.preset(preset), 
	.a(n2), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 U1 (.Z(n2), 
	.A(Ain));
   HS65_LSS_XOR2X6 U2 (.Z(lt_en), 
	.B(Ain), 
	.A(Aout));
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
   wire FE_PHN360_n4;
   wire FE_PHN358_n4;
   wire FE_PHN356_n4;
   wire FE_PHN353_n4;
   wire FE_PHN351_n4;
   wire FE_PHN349_n4;
   wire FE_PHN347_n4;
   wire FE_PHN346_n4;
   wire FE_PHN344_n4;
   wire FE_PHN341_n4;
   wire FE_PHN330_n1;
   wire FE_OFN54_n4;
   wire N3__L1_N1;
   wire N3__L1_N0;
   wire N0;
   wire lt_en;
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
   wire N37;
   wire n4;
   wire n6;
   wire n7;
   wire n8;
   wire n9;

   assign N0 = preset ;

   HS65_LS_BFX7 FE_PHC360_n4 (.Z(FE_PHN360_n4), 
	.A(FE_PHN346_n4));
   HS65_LS_BFX7 FE_PHC358_n4 (.Z(FE_PHN358_n4), 
	.A(n4));
   HS65_LH_BFX9 FE_PHC356_n4 (.Z(FE_PHN356_n4), 
	.A(n4));
   HS65_LH_BFX9 FE_PHC353_n4 (.Z(FE_PHN353_n4), 
	.A(n4));
   HS65_LH_DLYIC2X9 FE_PHC351_n4 (.Z(FE_PHN351_n4), 
	.A(n4));
   HS65_LH_DLYIC2X9 FE_PHC349_n4 (.Z(FE_PHN349_n4), 
	.A(FE_PHN358_n4));
   HS65_LH_DLYIC2X9 FE_PHC347_n4 (.Z(FE_PHN347_n4), 
	.A(FE_PHN356_n4));
   HS65_LH_DLYIC2X4 FE_PHC346_n4 (.Z(FE_PHN346_n4), 
	.A(n4));
   HS65_LH_BFX2 FE_PHC344_n4 (.Z(FE_PHN344_n4), 
	.A(FE_PHN353_n4));
   HS65_LS_DLYIC4X9 FE_PHC341_n4 (.Z(FE_PHN341_n4), 
	.A(n4));
   HS65_LH_DLYIC2X9 FE_PHC330_n1 (.Z(FE_PHN330_n1), 
	.A(N0));
   HS65_LS_BFX9 FE_OFC54_n4 (.Z(FE_OFN54_n4), 
	.A(n4));
   HS65_LS_BFX9 N3__L1_I1 (.Z(N3__L1_N1), 
	.A(N3));
   HS65_LS_BFX9 N3__L1_I0 (.Z(N3__L1_N0), 
	.A(N3));
   latch_controller_0_1 controller (.preset(FE_OFN54_n4), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_AND2X4 U6 (.Z(n9), 
	.B(FE_OFN54_n4), 
	.A(1'b1));
   HS65_LS_AND2X4 U7 (.Z(n8), 
	.B(n6), 
	.A(n7));
   HS65_LS_OR2X9 U8 (.Z(N3), 
	.B(n8), 
	.A(n9));
   HS65_LS_LDHQX9 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3__L1_N1), 
	.D(N37));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(N3__L1_N1), 
	.D(N36));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3__L1_N0), 
	.D(N35));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(N3__L1_N1), 
	.D(N34));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3__L1_N0), 
	.D(N33));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(N3__L1_N1), 
	.D(N32));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3__L1_N0), 
	.D(N31));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(N3__L1_N1), 
	.D(N30));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3__L1_N0), 
	.D(N29));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(N3__L1_N1), 
	.D(N28));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3__L1_N0), 
	.D(N27));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(N3__L1_N1), 
	.D(N26));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3__L1_N0), 
	.D(N25));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(N3__L1_N1), 
	.D(N24));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3__L1_N0), 
	.D(N23));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(N3__L1_N1), 
	.D(N22));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3__L1_N0), 
	.D(N21));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(N3__L1_N1), 
	.D(N20));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3__L1_N0), 
	.D(N19));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3__L1_N1), 
	.D(N18));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(N3__L1_N0), 
	.D(N17));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3__L1_N1), 
	.D(N16));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(N3__L1_N0), 
	.D(N15));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3__L1_N1), 
	.D(N14));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(N3__L1_N0), 
	.D(N13));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3__L1_N1), 
	.D(N12));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(N3__L1_N0), 
	.D(N11));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3__L1_N0), 
	.D(N10));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(N3__L1_N0), 
	.D(N9));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3__L1_N0), 
	.D(N8));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(N3__L1_N0), 
	.D(N7));
   HS65_LS_LDHQX9 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3__L1_N1), 
	.D(N6));
   HS65_LS_LDHQX9 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3__L1_N0), 
	.D(N5));
   HS65_LS_LDHQX9 type_out_reg (.Q(\right_out[DATA][33] ), 
	.G(N3__L1_N1), 
	.D(N4));
   HS65_LS_IVX9 U3 (.Z(n6), 
	.A(FE_PHN330_n1));
   HS65_LS_CNIVX41 U4 (.Z(n4), 
	.A(n6));
   HS65_LS_NOR2AX13 U9 (.Z(N5), 
	.B(FE_PHN341_n4), 
	.A(\left_in[DATA][0] ));
   HS65_LS_NOR2AX13 U10 (.Z(N7), 
	.B(FE_PHN341_n4), 
	.A(\left_in[DATA][2] ));
   HS65_LS_NOR2AX13 U11 (.Z(N15), 
	.B(FE_OFN54_n4), 
	.A(\left_in[DATA][10] ));
   HS65_LS_NOR2AX13 U12 (.Z(N17), 
	.B(FE_OFN54_n4), 
	.A(\left_in[DATA][12] ));
   HS65_LS_NOR2AX13 U13 (.Z(N19), 
	.B(FE_PHN341_n4), 
	.A(\left_in[DATA][14] ));
   HS65_LS_NOR2AX13 U14 (.Z(N21), 
	.B(FE_PHN341_n4), 
	.A(\left_in[DATA][16] ));
   HS65_LS_NOR2AX13 U15 (.Z(N23), 
	.B(FE_PHN341_n4), 
	.A(\left_in[DATA][18] ));
   HS65_LS_NOR2AX13 U16 (.Z(N25), 
	.B(FE_PHN341_n4), 
	.A(\left_in[DATA][20] ));
   HS65_LS_NOR2AX13 U17 (.Z(N27), 
	.B(FE_PHN341_n4), 
	.A(\left_in[DATA][22] ));
   HS65_LS_NOR2AX13 U18 (.Z(N29), 
	.B(FE_PHN341_n4), 
	.A(\left_in[DATA][24] ));
   HS65_LS_NOR2AX13 U19 (.Z(N31), 
	.B(FE_PHN341_n4), 
	.A(\left_in[DATA][26] ));
   HS65_LS_NOR2AX13 U20 (.Z(N33), 
	.B(FE_PHN341_n4), 
	.A(\left_in[DATA][28] ));
   HS65_LS_CNNOR2AX15 U21 (.Z(N34), 
	.B(FE_PHN351_n4), 
	.A(\left_in[DATA][29] ));
   HS65_LS_NOR2AX13 U22 (.Z(N35), 
	.B(FE_PHN341_n4), 
	.A(\left_in[DATA][30] ));
   HS65_LS_NOR2AX13 U23 (.Z(N6), 
	.B(FE_PHN341_n4), 
	.A(\left_in[DATA][1] ));
   HS65_LS_NOR2AX13 U24 (.Z(N16), 
	.B(FE_OFN54_n4), 
	.A(\left_in[DATA][11] ));
   HS65_LS_NOR2AX13 U25 (.Z(N18), 
	.B(FE_OFN54_n4), 
	.A(\left_in[DATA][13] ));
   HS65_LS_NOR2AX13 U26 (.Z(N20), 
	.B(FE_OFN54_n4), 
	.A(\left_in[DATA][15] ));
   HS65_LS_NOR2AX13 U27 (.Z(N22), 
	.B(FE_OFN54_n4), 
	.A(\left_in[DATA][17] ));
   HS65_LS_NOR2AX13 U28 (.Z(N24), 
	.B(FE_OFN54_n4), 
	.A(\left_in[DATA][19] ));
   HS65_LS_NOR2AX13 U29 (.Z(N26), 
	.B(FE_OFN54_n4), 
	.A(\left_in[DATA][21] ));
   HS65_LS_NOR2AX13 U30 (.Z(N28), 
	.B(FE_OFN54_n4), 
	.A(\left_in[DATA][23] ));
   HS65_LS_NOR2AX13 U31 (.Z(N30), 
	.B(FE_PHN349_n4), 
	.A(\left_in[DATA][25] ));
   HS65_LS_NOR2AX13 U32 (.Z(N32), 
	.B(FE_PHN347_n4), 
	.A(\left_in[DATA][27] ));
   HS65_LS_NOR2AX19 U33 (.Z(N11), 
	.B(FE_OFN54_n4), 
	.A(\left_in[DATA][6] ));
   HS65_LS_CNNOR2AX15 U34 (.Z(N12), 
	.B(FE_OFN54_n4), 
	.A(\left_in[DATA][7] ));
   HS65_LS_NOR2AX13 U35 (.Z(N13), 
	.B(FE_OFN54_n4), 
	.A(\left_in[DATA][8] ));
   HS65_LS_NOR2AX13 U36 (.Z(N10), 
	.B(FE_OFN54_n4), 
	.A(\left_in[DATA][5] ));
   HS65_LS_NOR2AX13 U37 (.Z(N14), 
	.B(FE_OFN54_n4), 
	.A(\left_in[DATA][9] ));
   HS65_LS_NOR2AX13 U38 (.Z(N4), 
	.B(FE_PHN344_n4), 
	.A(\left_in[DATA][33] ));
   HS65_LS_NOR2AX13 U39 (.Z(N9), 
	.B(FE_PHN341_n4), 
	.A(\left_in[DATA][4] ));
   HS65_LS_NOR2AX13 U40 (.Z(N36), 
	.B(FE_PHN341_n4), 
	.A(\left_in[DATA][31] ));
   HS65_LS_NOR2AX13 U41 (.Z(N37), 
	.B(FE_PHN360_n4), 
	.A(\left_in[DATA][32] ));
   HS65_LS_NOR2AX13 U42 (.Z(N8), 
	.B(FE_OFN54_n4), 
	.A(\left_in[DATA][3] ));
   HS65_LS_IVX9 U43 (.Z(n7), 
	.A(lt_en));
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
   wire n2;

   assign Rout = Aout ;

   c_gate_1_2 gate (.preset(preset), 
	.a(n2), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 U1 (.Z(n2), 
	.A(Ain));
   HS65_LSS_XOR2X6 U2 (.Z(lt_en), 
	.B(Ain), 
	.A(Aout));
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
   wire FE_PHN333_n1;
   wire FE_OFN53_n4;
   wire N3__L1_N1;
   wire N3__L1_N0;
   wire N0;
   wire lt_en;
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
   wire N37;
   wire n4;
   wire n6;
   wire n7;
   wire n8;
   wire n9;

   assign N0 = preset ;

   HS65_LH_DLYIC2X9 FE_PHC333_n1 (.Z(FE_PHN333_n1), 
	.A(N0));
   HS65_LS_BFX18 FE_OFC53_n4 (.Z(FE_OFN53_n4), 
	.A(n4));
   HS65_LS_BFX9 N3__L1_I1 (.Z(N3__L1_N1), 
	.A(N3));
   HS65_LS_BFX9 N3__L1_I0 (.Z(N3__L1_N0), 
	.A(N3));
   latch_controller_0_2 controller (.preset(n4), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_AND2X4 U6 (.Z(n9), 
	.B(n4), 
	.A(1'b1));
   HS65_LS_AND2X4 U7 (.Z(n8), 
	.B(n6), 
	.A(n7));
   HS65_LS_OR2X9 U8 (.Z(N3), 
	.B(n8), 
	.A(n9));
   HS65_LS_LDHQX9 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3__L1_N1), 
	.D(N37));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(N3__L1_N1), 
	.D(N36));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3__L1_N0), 
	.D(N35));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(N3__L1_N1), 
	.D(N34));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3__L1_N0), 
	.D(N33));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(N3__L1_N1), 
	.D(N32));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3__L1_N0), 
	.D(N31));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(N3__L1_N1), 
	.D(N30));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3__L1_N0), 
	.D(N29));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(N3__L1_N1), 
	.D(N28));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3__L1_N0), 
	.D(N27));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(N3__L1_N1), 
	.D(N26));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3__L1_N0), 
	.D(N25));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(N3__L1_N1), 
	.D(N24));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3__L1_N0), 
	.D(N23));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(N3__L1_N1), 
	.D(N22));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3__L1_N0), 
	.D(N21));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(N3__L1_N1), 
	.D(N20));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3__L1_N0), 
	.D(N19));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3__L1_N1), 
	.D(N18));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(N3__L1_N0), 
	.D(N17));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3__L1_N1), 
	.D(N16));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(N3__L1_N0), 
	.D(N15));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3__L1_N1), 
	.D(N14));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(N3__L1_N0), 
	.D(N13));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3__L1_N1), 
	.D(N12));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(N3__L1_N0), 
	.D(N11));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3__L1_N0), 
	.D(N10));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(N3__L1_N0), 
	.D(N9));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3__L1_N0), 
	.D(N8));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(N3__L1_N0), 
	.D(N7));
   HS65_LS_LDHQX9 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3__L1_N1), 
	.D(N6));
   HS65_LS_LDHQX9 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3__L1_N0), 
	.D(N5));
   HS65_LS_LDHQX9 type_out_reg (.Q(\right_out[DATA][33] ), 
	.G(N3__L1_N1), 
	.D(N4));
   HS65_LS_IVX9 U3 (.Z(n6), 
	.A(FE_PHN333_n1));
   HS65_LS_IVX9 U4 (.Z(n4), 
	.A(n6));
   HS65_LS_NOR2AX13 U9 (.Z(N11), 
	.B(n4), 
	.A(\left_in[DATA][6] ));
   HS65_LS_CNNOR2AX15 U10 (.Z(N12), 
	.B(n4), 
	.A(\left_in[DATA][7] ));
   HS65_LS_NOR2AX13 U11 (.Z(N13), 
	.B(n4), 
	.A(\left_in[DATA][8] ));
   HS65_LS_NOR2AX13 U12 (.Z(N15), 
	.B(n4), 
	.A(\left_in[DATA][10] ));
   HS65_LS_NOR2AX13 U13 (.Z(N17), 
	.B(n4), 
	.A(\left_in[DATA][12] ));
   HS65_LS_NOR2AX13 U14 (.Z(N19), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][14] ));
   HS65_LS_NOR2AX13 U15 (.Z(N21), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][16] ));
   HS65_LS_NOR2AX13 U16 (.Z(N23), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][18] ));
   HS65_LS_NOR2AX13 U17 (.Z(N25), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][20] ));
   HS65_LS_CNNOR2AX15 U18 (.Z(N27), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][22] ));
   HS65_LS_NOR2AX13 U19 (.Z(N10), 
	.B(n4), 
	.A(\left_in[DATA][5] ));
   HS65_LS_NOR2AX19 U20 (.Z(N14), 
	.B(n4), 
	.A(\left_in[DATA][9] ));
   HS65_LS_NOR2AX13 U21 (.Z(N16), 
	.B(n4), 
	.A(\left_in[DATA][11] ));
   HS65_LS_NOR2AX13 U22 (.Z(N18), 
	.B(n4), 
	.A(\left_in[DATA][13] ));
   HS65_LS_NOR2AX13 U23 (.Z(N20), 
	.B(n4), 
	.A(\left_in[DATA][15] ));
   HS65_LS_NOR2AX19 U24 (.Z(N22), 
	.B(n4), 
	.A(\left_in[DATA][17] ));
   HS65_LS_NOR2AX13 U25 (.Z(N24), 
	.B(n4), 
	.A(\left_in[DATA][19] ));
   HS65_LS_NOR2AX19 U26 (.Z(N26), 
	.B(n4), 
	.A(\left_in[DATA][21] ));
   HS65_LS_NOR2AX19 U27 (.Z(N4), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][33] ));
   HS65_LS_NOR2AX13 U28 (.Z(N5), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][0] ));
   HS65_LS_NOR2AX13 U29 (.Z(N7), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][2] ));
   HS65_LS_NOR2AX3 U30 (.Z(N9), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][4] ));
   HS65_LS_NOR2AX13 U31 (.Z(N29), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][24] ));
   HS65_LS_CNNOR2AX15 U32 (.Z(N31), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][26] ));
   HS65_LS_NOR2AX13 U33 (.Z(N33), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][28] ));
   HS65_LS_CNNOR2AX15 U34 (.Z(N34), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][29] ));
   HS65_LS_NOR2AX13 U35 (.Z(N35), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][30] ));
   HS65_LS_NOR2AX13 U36 (.Z(N36), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][31] ));
   HS65_LS_NOR2AX13 U37 (.Z(N37), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][32] ));
   HS65_LS_NOR2AX13 U38 (.Z(N6), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][1] ));
   HS65_LS_NOR2AX13 U39 (.Z(N8), 
	.B(n4), 
	.A(\left_in[DATA][3] ));
   HS65_LS_NOR2AX13 U40 (.Z(N28), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][23] ));
   HS65_LS_NOR2AX13 U41 (.Z(N30), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][25] ));
   HS65_LS_NOR2AX13 U42 (.Z(N32), 
	.B(FE_OFN53_n4), 
	.A(\left_in[DATA][27] ));
   HS65_LS_IVX9 U43 (.Z(n7), 
	.A(lt_en));
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
   wire n2;

   assign Rout = Aout ;

   c_gate_1_3 gate (.preset(preset), 
	.a(n2), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 U1 (.Z(n2), 
	.A(Ain));
   HS65_LSS_XOR2X6 U2 (.Z(lt_en), 
	.B(Ain), 
	.A(Aout));
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
   wire FE_PHN332_n1;
   wire FE_OFN52_n4;
   wire N3__L1_N1;
   wire N3__L1_N0;
   wire N0;
   wire lt_en;
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
   wire N37;
   wire n4;
   wire n6;
   wire n7;
   wire n8;
   wire n9;

   assign N0 = preset ;

   HS65_LH_DLYIC2X9 FE_PHC332_n1 (.Z(FE_PHN332_n1), 
	.A(N0));
   HS65_LS_BFX18 FE_OFC52_n4 (.Z(FE_OFN52_n4), 
	.A(n4));
   HS65_LS_BFX9 N3__L1_I1 (.Z(N3__L1_N1), 
	.A(N3));
   HS65_LS_BFX9 N3__L1_I0 (.Z(N3__L1_N0), 
	.A(N3));
   latch_controller_0_3 controller (.preset(n4), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_AND2X4 U6 (.Z(n9), 
	.B(n4), 
	.A(1'b1));
   HS65_LS_AND2X4 U7 (.Z(n8), 
	.B(n6), 
	.A(n7));
   HS65_LS_OR2X9 U8 (.Z(N3), 
	.B(n8), 
	.A(n9));
   HS65_LS_LDHQX9 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3__L1_N1), 
	.D(N37));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(N3__L1_N1), 
	.D(N36));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3__L1_N0), 
	.D(N35));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(N3__L1_N1), 
	.D(N34));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3__L1_N0), 
	.D(N33));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(N3__L1_N1), 
	.D(N32));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3__L1_N1), 
	.D(N31));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(N3__L1_N1), 
	.D(N30));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3__L1_N0), 
	.D(N29));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(N3__L1_N1), 
	.D(N28));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3__L1_N0), 
	.D(N27));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(N3__L1_N1), 
	.D(N26));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3__L1_N0), 
	.D(N25));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(N3__L1_N1), 
	.D(N24));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3__L1_N0), 
	.D(N23));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(N3__L1_N1), 
	.D(N22));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3__L1_N0), 
	.D(N21));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(N3__L1_N0), 
	.D(N20));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3__L1_N0), 
	.D(N19));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3__L1_N0), 
	.D(N18));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(N3__L1_N0), 
	.D(N17));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3__L1_N0), 
	.D(N16));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(N3__L1_N0), 
	.D(N15));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3__L1_N0), 
	.D(N14));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(N3__L1_N0), 
	.D(N13));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3__L1_N0), 
	.D(N12));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(N3__L1_N0), 
	.D(N11));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3__L1_N0), 
	.D(N10));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(N3__L1_N1), 
	.D(N9));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3__L1_N0), 
	.D(N8));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(N3__L1_N1), 
	.D(N7));
   HS65_LS_LDHQX9 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3__L1_N1), 
	.D(N6));
   HS65_LS_LDHQX9 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3__L1_N1), 
	.D(N5));
   HS65_LS_LDHQX9 type_out_reg (.Q(\right_out[DATA][33] ), 
	.G(N3__L1_N1), 
	.D(N4));
   HS65_LS_IVX9 U3 (.Z(n6), 
	.A(FE_PHN332_n1));
   HS65_LS_IVX9 U4 (.Z(n4), 
	.A(n6));
   HS65_LS_NOR2AX13 U9 (.Z(N10), 
	.B(n4), 
	.A(\left_in[DATA][5] ));
   HS65_LS_NOR2AX13 U10 (.Z(N11), 
	.B(n4), 
	.A(\left_in[DATA][6] ));
   HS65_LS_NOR2AX13 U11 (.Z(N12), 
	.B(n4), 
	.A(\left_in[DATA][7] ));
   HS65_LS_CNNOR2AX15 U12 (.Z(N13), 
	.B(n4), 
	.A(\left_in[DATA][8] ));
   HS65_LS_NOR2AX13 U13 (.Z(N14), 
	.B(n4), 
	.A(\left_in[DATA][9] ));
   HS65_LS_NOR2AX13 U14 (.Z(N15), 
	.B(n4), 
	.A(\left_in[DATA][10] ));
   HS65_LS_NOR2AX13 U15 (.Z(N16), 
	.B(n4), 
	.A(\left_in[DATA][11] ));
   HS65_LS_NOR2AX3 U16 (.Z(N17), 
	.B(n4), 
	.A(\left_in[DATA][12] ));
   HS65_LS_NOR2AX13 U17 (.Z(N18), 
	.B(n4), 
	.A(\left_in[DATA][13] ));
   HS65_LS_NOR2AX13 U18 (.Z(N19), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][14] ));
   HS65_LS_NOR2AX13 U19 (.Z(N20), 
	.B(n4), 
	.A(\left_in[DATA][15] ));
   HS65_LS_NOR2AX13 U20 (.Z(N21), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][16] ));
   HS65_LS_NOR2AX13 U21 (.Z(N22), 
	.B(n4), 
	.A(\left_in[DATA][17] ));
   HS65_LS_NOR2AX13 U22 (.Z(N23), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][18] ));
   HS65_LS_NOR2AX13 U23 (.Z(N24), 
	.B(n4), 
	.A(\left_in[DATA][19] ));
   HS65_LS_NOR2AX13 U24 (.Z(N25), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][20] ));
   HS65_LS_NOR2AX13 U25 (.Z(N26), 
	.B(n4), 
	.A(\left_in[DATA][21] ));
   HS65_LS_NOR2AX13 U26 (.Z(N27), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][22] ));
   HS65_LS_NOR2AX13 U27 (.Z(N4), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][33] ));
   HS65_LS_NOR2AX13 U28 (.Z(N5), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][0] ));
   HS65_LS_NOR2AX13 U29 (.Z(N6), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][1] ));
   HS65_LS_NOR2AX13 U30 (.Z(N7), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][2] ));
   HS65_LS_NOR2AX13 U31 (.Z(N8), 
	.B(n4), 
	.A(\left_in[DATA][3] ));
   HS65_LS_NOR2AX13 U32 (.Z(N9), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][4] ));
   HS65_LS_NOR2AX13 U33 (.Z(N28), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][23] ));
   HS65_LS_NOR2AX13 U34 (.Z(N29), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][24] ));
   HS65_LS_NOR2AX13 U35 (.Z(N30), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][25] ));
   HS65_LS_NOR2AX3 U36 (.Z(N31), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][26] ));
   HS65_LS_NOR2AX13 U37 (.Z(N32), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][27] ));
   HS65_LS_NOR2AX13 U38 (.Z(N33), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][28] ));
   HS65_LS_NOR2AX13 U39 (.Z(N34), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][29] ));
   HS65_LS_NOR2AX13 U40 (.Z(N35), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][30] ));
   HS65_LS_NOR2AX13 U41 (.Z(N36), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][31] ));
   HS65_LS_NOR2AX13 U42 (.Z(N37), 
	.B(FE_OFN52_n4), 
	.A(\left_in[DATA][32] ));
   HS65_LS_IVX9 U43 (.Z(n7), 
	.A(lt_en));
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
   wire n2;

   assign Rout = Aout ;

   c_gate_1_4 gate (.preset(preset), 
	.a(n2), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 U1 (.Z(n2), 
	.A(Ain));
   HS65_LSS_XOR2X6 U2 (.Z(lt_en), 
	.B(Ain), 
	.A(Aout));
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
   wire FE_PHN361_FE_OFN14_n4;
   wire FE_PHN359_FE_OFN14_n4;
   wire FE_PHN357_FE_OFN14_n4;
   wire FE_PHN355_FE_OFN14_n4;
   wire FE_PHN354_FE_OFN14_n4;
   wire FE_PHN352_FE_OFN14_n4;
   wire FE_PHN350_FE_OFN14_n4;
   wire FE_PHN348_FE_OFN14_n4;
   wire FE_PHN345_FE_OFN14_n4;
   wire FE_PHN343_FE_OFN14_n4;
   wire FE_PHN342_FE_OFN14_n4;
   wire FE_PHN334_n1;
   wire FE_OFN51_n4;
   wire N3__L1_N1;
   wire N3__L1_N0;
   wire FE_OFN14_n4;
   wire N0;
   wire lt_en;
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
   wire N37;
   wire n4;
   wire n6;
   wire n7;
   wire n8;
   wire n9;

   assign N0 = preset ;

   HS65_LS_BFX7 FE_PHC361_FE_OFN14_n4 (.Z(FE_PHN361_FE_OFN14_n4), 
	.A(FE_PHN343_FE_OFN14_n4));
   HS65_LS_BFX7 FE_PHC359_FE_OFN14_n4 (.Z(FE_PHN359_FE_OFN14_n4), 
	.A(FE_OFN14_n4));
   HS65_LH_BFX2 FE_PHC357_FE_OFN14_n4 (.Z(FE_PHN357_FE_OFN14_n4), 
	.A(FE_PHN359_FE_OFN14_n4));
   HS65_LH_BFX2 FE_PHC355_FE_OFN14_n4 (.Z(FE_PHN355_FE_OFN14_n4), 
	.A(FE_PHN359_FE_OFN14_n4));
   HS65_LH_BFX2 FE_PHC354_FE_OFN14_n4 (.Z(FE_PHN354_FE_OFN14_n4), 
	.A(FE_PHN359_FE_OFN14_n4));
   HS65_LH_BFX2 FE_PHC352_FE_OFN14_n4 (.Z(FE_PHN352_FE_OFN14_n4), 
	.A(FE_PHN359_FE_OFN14_n4));
   HS65_LH_BFX2 FE_PHC350_FE_OFN14_n4 (.Z(FE_PHN350_FE_OFN14_n4), 
	.A(FE_PHN359_FE_OFN14_n4));
   HS65_LH_DLYIC2X9 FE_PHC348_FE_OFN14_n4 (.Z(FE_PHN348_FE_OFN14_n4), 
	.A(FE_PHN359_FE_OFN14_n4));
   HS65_LH_DLYIC2X9 FE_PHC345_FE_OFN14_n4 (.Z(FE_PHN345_FE_OFN14_n4), 
	.A(FE_PHN359_FE_OFN14_n4));
   HS65_LH_BFX9 FE_PHC343_FE_OFN14_n4 (.Z(FE_PHN343_FE_OFN14_n4), 
	.A(FE_OFN14_n4));
   HS65_LH_BFX9 FE_PHC342_FE_OFN14_n4 (.Z(FE_PHN342_FE_OFN14_n4), 
	.A(FE_PHN359_FE_OFN14_n4));
   HS65_LH_BFX9 FE_PHC334_n1 (.Z(FE_PHN334_n1), 
	.A(N0));
   HS65_LS_BFX9 FE_OFC51_n4 (.Z(FE_OFN51_n4), 
	.A(FE_PHN359_FE_OFN14_n4));
   HS65_LS_BFX9 N3__L1_I1 (.Z(N3__L1_N1), 
	.A(N3));
   HS65_LS_BFX9 N3__L1_I0 (.Z(N3__L1_N0), 
	.A(N3));
   HS65_LS_BFX18 FE_OFC14_n4 (.Z(FE_OFN14_n4), 
	.A(n4));
   latch_controller_0_4 controller (.preset(FE_OFN14_n4), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_AND2X4 U6 (.Z(n9), 
	.B(FE_PHN361_FE_OFN14_n4), 
	.A(1'b1));
   HS65_LS_AND2X4 U7 (.Z(n8), 
	.B(n6), 
	.A(n7));
   HS65_LS_OR2X9 U8 (.Z(N3), 
	.B(n8), 
	.A(n9));
   HS65_LS_LDHQX9 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3__L1_N1), 
	.D(N37));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(N3__L1_N1), 
	.D(N36));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3__L1_N0), 
	.D(N35));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(N3__L1_N1), 
	.D(N34));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3__L1_N0), 
	.D(N33));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(N3__L1_N1), 
	.D(N32));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3__L1_N0), 
	.D(N31));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(N3__L1_N1), 
	.D(N30));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3__L1_N0), 
	.D(N29));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(N3__L1_N1), 
	.D(N28));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3__L1_N0), 
	.D(N27));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(N3__L1_N1), 
	.D(N26));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3__L1_N0), 
	.D(N25));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(N3__L1_N1), 
	.D(N24));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3__L1_N0), 
	.D(N23));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(N3__L1_N1), 
	.D(N22));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3__L1_N0), 
	.D(N21));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(N3__L1_N1), 
	.D(N20));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3__L1_N0), 
	.D(N19));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3__L1_N1), 
	.D(N18));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(N3__L1_N0), 
	.D(N17));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3__L1_N1), 
	.D(N16));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(N3__L1_N0), 
	.D(N15));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3__L1_N0), 
	.D(N14));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(N3__L1_N0), 
	.D(N13));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3__L1_N1), 
	.D(N12));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(N3__L1_N0), 
	.D(N11));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3__L1_N0), 
	.D(N10));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(N3__L1_N0), 
	.D(N9));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3__L1_N0), 
	.D(N8));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(N3__L1_N0), 
	.D(N7));
   HS65_LS_LDHQX9 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3__L1_N1), 
	.D(N6));
   HS65_LS_LDHQX9 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3__L1_N0), 
	.D(N5));
   HS65_LS_LDHQX9 type_out_reg (.Q(\right_out[DATA][33] ), 
	.G(N3__L1_N1), 
	.D(N4));
   HS65_LS_IVX9 U3 (.Z(n6), 
	.A(FE_PHN334_n1));
   HS65_LS_IVX7 U4 (.Z(n4), 
	.A(n6));
   HS65_LS_NOR2AX6 U9 (.Z(N11), 
	.B(FE_PHN342_FE_OFN14_n4), 
	.A(\left_in[DATA][6] ));
   HS65_LS_NOR2AX19 U10 (.Z(N12), 
	.B(FE_PHN361_FE_OFN14_n4), 
	.A(\left_in[DATA][7] ));
   HS65_LS_NOR2AX19 U11 (.Z(N13), 
	.B(FE_PHN342_FE_OFN14_n4), 
	.A(\left_in[DATA][8] ));
   HS65_LS_NOR2AX13 U12 (.Z(N15), 
	.B(FE_PHN348_FE_OFN14_n4), 
	.A(\left_in[DATA][10] ));
   HS65_LS_NOR2AX19 U13 (.Z(N17), 
	.B(FE_PHN345_FE_OFN14_n4), 
	.A(\left_in[DATA][12] ));
   HS65_LS_NOR2AX13 U14 (.Z(N19), 
	.B(FE_OFN51_n4), 
	.A(\left_in[DATA][14] ));
   HS65_LS_NOR2AX13 U15 (.Z(N21), 
	.B(FE_OFN51_n4), 
	.A(\left_in[DATA][16] ));
   HS65_LS_NOR2AX13 U16 (.Z(N23), 
	.B(FE_OFN51_n4), 
	.A(\left_in[DATA][18] ));
   HS65_LS_CNNOR2AX15 U17 (.Z(N25), 
	.B(FE_OFN51_n4), 
	.A(\left_in[DATA][20] ));
   HS65_LS_NOR2AX3 U18 (.Z(N27), 
	.B(FE_OFN51_n4), 
	.A(\left_in[DATA][22] ));
   HS65_LS_NOR2AX19 U19 (.Z(N10), 
	.B(FE_PHN342_FE_OFN14_n4), 
	.A(\left_in[DATA][5] ));
   HS65_LS_NOR2AX19 U20 (.Z(N14), 
	.B(FE_PHN342_FE_OFN14_n4), 
	.A(\left_in[DATA][9] ));
   HS65_LS_NOR2AX13 U21 (.Z(N16), 
	.B(FE_PHN355_FE_OFN14_n4), 
	.A(\left_in[DATA][11] ));
   HS65_LS_NOR2AX13 U22 (.Z(N18), 
	.B(FE_PHN357_FE_OFN14_n4), 
	.A(\left_in[DATA][13] ));
   HS65_LS_NOR2AX19 U23 (.Z(N20), 
	.B(FE_PHN352_FE_OFN14_n4), 
	.A(\left_in[DATA][15] ));
   HS65_LS_NOR2AX19 U24 (.Z(N22), 
	.B(FE_PHN354_FE_OFN14_n4), 
	.A(\left_in[DATA][17] ));
   HS65_LS_NOR2AX19 U25 (.Z(N24), 
	.B(FE_PHN350_FE_OFN14_n4), 
	.A(\left_in[DATA][19] ));
   HS65_LS_NOR2AX13 U26 (.Z(N26), 
	.B(FE_PHN361_FE_OFN14_n4), 
	.A(\left_in[DATA][21] ));
   HS65_LS_NOR2AX19 U27 (.Z(N4), 
	.B(FE_PHN361_FE_OFN14_n4), 
	.A(\left_in[DATA][33] ));
   HS65_LS_CNNOR2AX15 U28 (.Z(N5), 
	.B(FE_OFN51_n4), 
	.A(\left_in[DATA][0] ));
   HS65_LS_NOR2AX13 U29 (.Z(N7), 
	.B(FE_OFN51_n4), 
	.A(\left_in[DATA][2] ));
   HS65_LS_NOR2AX13 U30 (.Z(N9), 
	.B(FE_OFN51_n4), 
	.A(\left_in[DATA][4] ));
   HS65_LS_NOR2AX6 U31 (.Z(N29), 
	.B(FE_OFN51_n4), 
	.A(\left_in[DATA][24] ));
   HS65_LS_NOR2AX13 U32 (.Z(N31), 
	.B(FE_OFN51_n4), 
	.A(\left_in[DATA][26] ));
   HS65_LS_NOR2AX13 U33 (.Z(N33), 
	.B(FE_OFN51_n4), 
	.A(\left_in[DATA][28] ));
   HS65_LS_NOR2AX13 U34 (.Z(N34), 
	.B(FE_OFN51_n4), 
	.A(\left_in[DATA][29] ));
   HS65_LS_NOR2AX13 U35 (.Z(N35), 
	.B(FE_OFN51_n4), 
	.A(\left_in[DATA][30] ));
   HS65_LS_CNNOR2AX15 U36 (.Z(N36), 
	.B(FE_OFN51_n4), 
	.A(\left_in[DATA][31] ));
   HS65_LS_NOR2AX13 U37 (.Z(N37), 
	.B(FE_OFN51_n4), 
	.A(\left_in[DATA][32] ));
   HS65_LS_NOR2AX13 U38 (.Z(N6), 
	.B(FE_OFN51_n4), 
	.A(\left_in[DATA][1] ));
   HS65_LS_NOR2AX19 U39 (.Z(N8), 
	.B(FE_PHN342_FE_OFN14_n4), 
	.A(\left_in[DATA][3] ));
   HS65_LS_NOR2AX3 U40 (.Z(N28), 
	.B(FE_PHN361_FE_OFN14_n4), 
	.A(\left_in[DATA][23] ));
   HS65_LS_NOR2AX13 U41 (.Z(N30), 
	.B(FE_OFN51_n4), 
	.A(\left_in[DATA][25] ));
   HS65_LS_NOR2AX13 U42 (.Z(N32), 
	.B(FE_OFN51_n4), 
	.A(\left_in[DATA][27] ));
   HS65_LS_IVX9 U43 (.Z(n7), 
	.A(lt_en));
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
   wire n1;

   crossbar_x0_y0 crossbar (.preset(n1), 
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
   channel_latch_0_000000000_0 ch_latch_4 (.preset(n1), 
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
   channel_latch_0_000000000_4 ch_latch_3 (.preset(n1), 
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
   channel_latch_0_000000000_3 ch_latch_2 (.preset(n1), 
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
   channel_latch_0_000000000_2 ch_latch_1 (.preset(n1), 
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
   channel_latch_0_000000000_1 ch_latch_0 (.preset(n1), 
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
   HS65_LS_BFX106 U1 (.Z(n1), 
	.A(preset));
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

   HS65_LS_AND2X4 C8 (.Z(q), 
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

   sr_latch_0_6 latch (.s(set), 
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
   wire not_Ain;

   assign Rout = Aout ;

   c_gate_0_6 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 I_0 (.Z(not_Ain), 
	.A(Ain));
   HS65_LSS_XOR2X6 U1 (.Z(lt_en), 
	.B(Ain), 
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
   wire FE_PHN339_preset;
   wire FE_PHN326_preset;
   wire FE_PHN323_preset;
   wire FE_PHN310_preset;
   wire FE_PHN304_preset;
   wire FE_PHN302_preset;
   wire FE_PHN297_resource_in_f_1_;
   wire FE_PHN296_resource_in_f_7_;
   wire FE_PHN292_resource_in_f_1_;
   wire FE_PHN291_resource_in_f_7_;
   wire FE_PHN287_resource_in_f_7_;
   wire FE_PHN286_resource_in_f_1_;
   wire FE_PHN285_resource_in_f_17_;
   wire FE_PHN281_resource_in_f_29_;
   wire FE_PHN280_resource_in_f_4_;
   wire FE_PHN279_resource_in_f_8_;
   wire FE_PHN278_resource_in_f_26_;
   wire FE_PHN277_resource_in_f_24_;
   wire FE_PHN276_resource_in_f_25_;
   wire FE_PHN275_resource_in_f_16_;
   wire FE_PHN274_resource_in_f_2_;
   wire FE_PHN273_resource_in_f_30_;
   wire FE_PHN272_resource_in_f_6_;
   wire FE_PHN271_resource_in_f_21_;
   wire FE_PHN270_resource_in_f_19_;
   wire FE_PHN263_resource_in_f_27_;
   wire FE_PHN262_resource_in_f_23_;
   wire FE_PHN261_resource_in_f_29_;
   wire FE_PHN260_resource_in_f_2_;
   wire FE_PHN259_resource_in_f_6_;
   wire FE_PHN258_resource_in_f_4_;
   wire FE_PHN257_resource_in_f_25_;
   wire FE_PHN256_resource_in_f_30_;
   wire FE_PHN255_resource_in_f_28_;
   wire FE_PHN254_resource_in_f_22_;
   wire FE_PHN253_resource_in_f_20_;
   wire FE_PHN252_resource_in_f_8_;
   wire FE_PHN251_resource_in_f_26_;
   wire FE_PHN250_resource_in_f_24_;
   wire FE_PHN249_resource_in_f_16_;
   wire FE_PHN248_resource_in_f_32_;
   wire FE_PHN247_resource_in_f_21_;
   wire FE_PHN246_resource_in_f_19_;
   wire FE_PHN245_resource_in_f_5_;
   wire FE_PHN244_resource_in_f_13_;
   wire FE_PHN243_resource_in_f_11_;
   wire FE_PHN242_resource_in_f_9_;
   wire FE_PHN241_resource_in_f_0_;
   wire FE_PHN240_resource_in_f_3_;
   wire FE_PHN239_resource_in_f_15_;
   wire FE_PHN238_resource_in_f_31_;
   wire FE_PHN236_resource_in_f_14_;
   wire FE_PHN235_resource_in_f_18_;
   wire FE_PHN233_resource_in_f_12_;
   wire FE_PHN232_resource_in_f_10_;
   wire FE_PHN230_resource_in_f_32_;
   wire FE_PHN227_resource_in_f_21_;
   wire FE_PHN226_resource_in_f_19_;
   wire FE_PHN225_resource_in_f_23_;
   wire FE_PHN224_resource_in_f_27_;
   wire FE_PHN223_resource_in_f_29_;
   wire FE_PHN222_resource_in_f_25_;
   wire FE_PHN221_resource_in_f_17_;
   wire FE_PHN220_resource_in_f_31_;
   wire FE_PHN219_resource_in_f_15_;
   wire FE_PHN218_resource_in_f_13_;
   wire FE_PHN217_resource_in_f_11_;
   wire FE_PHN216_resource_in_f_9_;
   wire FE_PHN215_resource_in_f_7_;
   wire FE_PHN214_resource_in_f_1_;
   wire FE_PHN213_resource_in_f_0_;
   wire FE_PHN212_resource_in_f_5_;
   wire FE_PHN211_resource_in_f_3_;
   wire FE_PHN210_resource_in_f_2_;
   wire FE_PHN209_resource_in_f_6_;
   wire FE_PHN208_resource_in_f_4_;
   wire FE_PHN207_resource_in_f_10_;
   wire FE_PHN206_resource_in_f_8_;
   wire FE_PHN205_resource_in_f_14_;
   wire FE_PHN204_resource_in_f_12_;
   wire FE_PHN203_resource_in_f_30_;
   wire FE_PHN202_resource_in_f_28_;
   wire FE_PHN201_resource_in_f_26_;
   wire FE_PHN200_resource_in_f_22_;
   wire FE_PHN199_resource_in_f_20_;
   wire FE_PHN198_resource_in_f_18_;
   wire FE_PHN197_resource_in_f_16_;
   wire FE_PHN196_resource_in_f_24_;
   wire FE_PHN187_N4;
   wire FE_PHN57_N4;
   wire FE_PHN55_preset;
   wire lt_en__CASCADE_L3_N0;
   wire lt_en__CASCADE_L2_N0;
   wire lt_en__CASCADE_L1_N0;
   wire N0;
   wire lt_en;
   wire N3;
   wire N4;
   wire n4;
   wire n5;
   wire n6;
   wire n7;

   assign N0 = preset ;

   HS65_LS_BFX7 FE_PHC339_preset (.Z(FE_PHN339_preset), 
	.A(N0));
   HS65_LH_BFX9 FE_PHC326_preset (.Z(FE_PHN326_preset), 
	.A(N0));
   HS65_LH_BFX9 FE_PHC323_preset (.Z(FE_PHN323_preset), 
	.A(N0));
   HS65_LH_BFX7 FE_PHC310_preset (.Z(FE_PHN310_preset), 
	.A(FE_PHN323_preset));
   HS65_LH_BFX2 FE_PHC304_preset (.Z(FE_PHN304_preset), 
	.A(FE_PHN326_preset));
   HS65_LH_DLYIC2X9 FE_PHC302_preset (.Z(FE_PHN302_preset), 
	.A(FE_PHN310_preset));
   HS65_LS_BFX7 FE_PHC297_resource_in_f_1_ (.Z(FE_PHN297_resource_in_f_1_), 
	.A(FE_PHN292_resource_in_f_1_));
   HS65_LS_BFX7 FE_PHC296_resource_in_f_7_ (.Z(FE_PHN296_resource_in_f_7_), 
	.A(FE_PHN291_resource_in_f_7_));
   HS65_LH_DLYIC2X9 FE_PHC292_resource_in_f_1_ (.Z(FE_PHN292_resource_in_f_1_), 
	.A(FE_PHN214_resource_in_f_1_));
   HS65_LH_DLYIC2X9 FE_PHC291_resource_in_f_7_ (.Z(FE_PHN291_resource_in_f_7_), 
	.A(FE_PHN215_resource_in_f_7_));
   HS65_LH_BFX2 FE_PHC287_resource_in_f_7_ (.Z(FE_PHN287_resource_in_f_7_), 
	.A(FE_PHN296_resource_in_f_7_));
   HS65_LH_BFX2 FE_PHC286_resource_in_f_1_ (.Z(FE_PHN286_resource_in_f_1_), 
	.A(FE_PHN297_resource_in_f_1_));
   HS65_LS_DLYIC4X9 FE_PHC285_resource_in_f_17_ (.Z(FE_PHN285_resource_in_f_17_), 
	.A(FE_PHN221_resource_in_f_17_));
   HS65_LS_BFX7 FE_PHC281_resource_in_f_29_ (.Z(FE_PHN281_resource_in_f_29_), 
	.A(FE_PHN261_resource_in_f_29_));
   HS65_LS_BFX7 FE_PHC280_resource_in_f_4_ (.Z(FE_PHN280_resource_in_f_4_), 
	.A(FE_PHN258_resource_in_f_4_));
   HS65_LS_BFX7 FE_PHC279_resource_in_f_8_ (.Z(FE_PHN279_resource_in_f_8_), 
	.A(FE_PHN252_resource_in_f_8_));
   HS65_LS_BFX7 FE_PHC278_resource_in_f_26_ (.Z(FE_PHN278_resource_in_f_26_), 
	.A(FE_PHN251_resource_in_f_26_));
   HS65_LS_BFX7 FE_PHC277_resource_in_f_24_ (.Z(FE_PHN277_resource_in_f_24_), 
	.A(FE_PHN250_resource_in_f_24_));
   HS65_LS_BFX7 FE_PHC276_resource_in_f_25_ (.Z(FE_PHN276_resource_in_f_25_), 
	.A(FE_PHN257_resource_in_f_25_));
   HS65_LS_BFX7 FE_PHC275_resource_in_f_16_ (.Z(FE_PHN275_resource_in_f_16_), 
	.A(FE_PHN249_resource_in_f_16_));
   HS65_LS_BFX7 FE_PHC274_resource_in_f_2_ (.Z(FE_PHN274_resource_in_f_2_), 
	.A(FE_PHN260_resource_in_f_2_));
   HS65_LS_BFX7 FE_PHC273_resource_in_f_30_ (.Z(FE_PHN273_resource_in_f_30_), 
	.A(FE_PHN256_resource_in_f_30_));
   HS65_LS_BFX7 FE_PHC272_resource_in_f_6_ (.Z(FE_PHN272_resource_in_f_6_), 
	.A(FE_PHN259_resource_in_f_6_));
   HS65_LH_BFX4 FE_PHC271_resource_in_f_21_ (.Z(FE_PHN271_resource_in_f_21_), 
	.A(FE_PHN247_resource_in_f_21_));
   HS65_LH_BFX4 FE_PHC270_resource_in_f_19_ (.Z(FE_PHN270_resource_in_f_19_), 
	.A(FE_PHN246_resource_in_f_19_));
   HS65_LH_BFX4 FE_PHC263_resource_in_f_27_ (.Z(FE_PHN263_resource_in_f_27_), 
	.A(FE_PHN224_resource_in_f_27_));
   HS65_LH_BFX4 FE_PHC262_resource_in_f_23_ (.Z(FE_PHN262_resource_in_f_23_), 
	.A(FE_PHN225_resource_in_f_23_));
   HS65_LH_BFX4 FE_PHC261_resource_in_f_29_ (.Z(FE_PHN261_resource_in_f_29_), 
	.A(FE_PHN223_resource_in_f_29_));
   HS65_LH_BFX4 FE_PHC260_resource_in_f_2_ (.Z(FE_PHN260_resource_in_f_2_), 
	.A(FE_PHN210_resource_in_f_2_));
   HS65_LH_BFX4 FE_PHC259_resource_in_f_6_ (.Z(FE_PHN259_resource_in_f_6_), 
	.A(FE_PHN209_resource_in_f_6_));
   HS65_LH_BFX4 FE_PHC258_resource_in_f_4_ (.Z(FE_PHN258_resource_in_f_4_), 
	.A(FE_PHN208_resource_in_f_4_));
   HS65_LH_BFX4 FE_PHC257_resource_in_f_25_ (.Z(FE_PHN257_resource_in_f_25_), 
	.A(FE_PHN222_resource_in_f_25_));
   HS65_LH_BFX2 FE_PHC256_resource_in_f_30_ (.Z(FE_PHN256_resource_in_f_30_), 
	.A(FE_PHN203_resource_in_f_30_));
   HS65_LH_DLYIC2X9 FE_PHC255_resource_in_f_28_ (.Z(FE_PHN255_resource_in_f_28_), 
	.A(FE_PHN202_resource_in_f_28_));
   HS65_LH_DLYIC2X9 FE_PHC254_resource_in_f_22_ (.Z(FE_PHN254_resource_in_f_22_), 
	.A(FE_PHN200_resource_in_f_22_));
   HS65_LH_DLYIC2X9 FE_PHC253_resource_in_f_20_ (.Z(FE_PHN253_resource_in_f_20_), 
	.A(FE_PHN199_resource_in_f_20_));
   HS65_LH_DLYIC2X9 FE_PHC252_resource_in_f_8_ (.Z(FE_PHN252_resource_in_f_8_), 
	.A(FE_PHN206_resource_in_f_8_));
   HS65_LH_DLYIC2X9 FE_PHC251_resource_in_f_26_ (.Z(FE_PHN251_resource_in_f_26_), 
	.A(FE_PHN201_resource_in_f_26_));
   HS65_LH_DLYIC2X9 FE_PHC250_resource_in_f_24_ (.Z(FE_PHN250_resource_in_f_24_), 
	.A(FE_PHN196_resource_in_f_24_));
   HS65_LH_DLYIC2X9 FE_PHC249_resource_in_f_16_ (.Z(FE_PHN249_resource_in_f_16_), 
	.A(FE_PHN197_resource_in_f_16_));
   HS65_LH_DLYIC4X9 FE_PHC248_resource_in_f_32_ (.Z(FE_PHN248_resource_in_f_32_), 
	.A(FE_PHN230_resource_in_f_32_));
   HS65_LH_DLYIC2X9 FE_PHC247_resource_in_f_21_ (.Z(FE_PHN247_resource_in_f_21_), 
	.A(FE_PHN227_resource_in_f_21_));
   HS65_LH_DLYIC2X9 FE_PHC246_resource_in_f_19_ (.Z(FE_PHN246_resource_in_f_19_), 
	.A(FE_PHN226_resource_in_f_19_));
   HS65_LH_DLYIC4X9 FE_PHC245_resource_in_f_5_ (.Z(FE_PHN245_resource_in_f_5_), 
	.A(FE_PHN212_resource_in_f_5_));
   HS65_LH_DLYIC4X9 FE_PHC244_resource_in_f_13_ (.Z(FE_PHN244_resource_in_f_13_), 
	.A(FE_PHN218_resource_in_f_13_));
   HS65_LH_DLYIC4X9 FE_PHC243_resource_in_f_11_ (.Z(FE_PHN243_resource_in_f_11_), 
	.A(FE_PHN217_resource_in_f_11_));
   HS65_LH_DLYIC4X9 FE_PHC242_resource_in_f_9_ (.Z(FE_PHN242_resource_in_f_9_), 
	.A(FE_PHN216_resource_in_f_9_));
   HS65_LH_DLYIC4X9 FE_PHC241_resource_in_f_0_ (.Z(FE_PHN241_resource_in_f_0_), 
	.A(FE_PHN213_resource_in_f_0_));
   HS65_LH_DLYIC4X9 FE_PHC240_resource_in_f_3_ (.Z(FE_PHN240_resource_in_f_3_), 
	.A(FE_PHN211_resource_in_f_3_));
   HS65_LH_DLYIC4X9 FE_PHC239_resource_in_f_15_ (.Z(FE_PHN239_resource_in_f_15_), 
	.A(FE_PHN219_resource_in_f_15_));
   HS65_LH_DLYIC4X9 FE_PHC238_resource_in_f_31_ (.Z(FE_PHN238_resource_in_f_31_), 
	.A(FE_PHN220_resource_in_f_31_));
   HS65_LH_DLYIC4X9 FE_PHC236_resource_in_f_14_ (.Z(FE_PHN236_resource_in_f_14_), 
	.A(FE_PHN205_resource_in_f_14_));
   HS65_LH_DLYIC4X9 FE_PHC235_resource_in_f_18_ (.Z(FE_PHN235_resource_in_f_18_), 
	.A(FE_PHN198_resource_in_f_18_));
   HS65_LH_DLYIC4X9 FE_PHC233_resource_in_f_12_ (.Z(FE_PHN233_resource_in_f_12_), 
	.A(FE_PHN204_resource_in_f_12_));
   HS65_LH_DLYIC4X9 FE_PHC232_resource_in_f_10_ (.Z(FE_PHN232_resource_in_f_10_), 
	.A(FE_PHN207_resource_in_f_10_));
   HS65_LS_DLYIC4X9 FE_PHC230_resource_in_f_32_ (.Z(FE_PHN230_resource_in_f_32_), 
	.A(\left_in[DATA][32] ));
   HS65_LS_DLYIC4X9 FE_PHC227_resource_in_f_21_ (.Z(FE_PHN227_resource_in_f_21_), 
	.A(\left_in[DATA][21] ));
   HS65_LS_DLYIC4X9 FE_PHC226_resource_in_f_19_ (.Z(FE_PHN226_resource_in_f_19_), 
	.A(\left_in[DATA][19] ));
   HS65_LH_DLYIC4X4 FE_PHC225_resource_in_f_23_ (.Z(FE_PHN225_resource_in_f_23_), 
	.A(\left_in[DATA][23] ));
   HS65_LH_DLYIC4X4 FE_PHC224_resource_in_f_27_ (.Z(FE_PHN224_resource_in_f_27_), 
	.A(\left_in[DATA][27] ));
   HS65_LH_DLYIC4X4 FE_PHC223_resource_in_f_29_ (.Z(FE_PHN223_resource_in_f_29_), 
	.A(\left_in[DATA][29] ));
   HS65_LH_DLYIC4X4 FE_PHC222_resource_in_f_25_ (.Z(FE_PHN222_resource_in_f_25_), 
	.A(\left_in[DATA][25] ));
   HS65_LS_DLYIC4X9 FE_PHC221_resource_in_f_17_ (.Z(FE_PHN221_resource_in_f_17_), 
	.A(\left_in[DATA][17] ));
   HS65_LS_DLYIC4X9 FE_PHC220_resource_in_f_31_ (.Z(FE_PHN220_resource_in_f_31_), 
	.A(\left_in[DATA][31] ));
   HS65_LS_DLYIC4X9 FE_PHC219_resource_in_f_15_ (.Z(FE_PHN219_resource_in_f_15_), 
	.A(\left_in[DATA][15] ));
   HS65_LS_DLYIC4X9 FE_PHC218_resource_in_f_13_ (.Z(FE_PHN218_resource_in_f_13_), 
	.A(\left_in[DATA][13] ));
   HS65_LS_DLYIC4X9 FE_PHC217_resource_in_f_11_ (.Z(FE_PHN217_resource_in_f_11_), 
	.A(\left_in[DATA][11] ));
   HS65_LS_DLYIC4X9 FE_PHC216_resource_in_f_9_ (.Z(FE_PHN216_resource_in_f_9_), 
	.A(\left_in[DATA][9] ));
   HS65_LS_DLYIC4X9 FE_PHC215_resource_in_f_7_ (.Z(FE_PHN215_resource_in_f_7_), 
	.A(\left_in[DATA][7] ));
   HS65_LS_DLYIC4X9 FE_PHC214_resource_in_f_1_ (.Z(FE_PHN214_resource_in_f_1_), 
	.A(\left_in[DATA][1] ));
   HS65_LS_DLYIC4X9 FE_PHC213_resource_in_f_0_ (.Z(FE_PHN213_resource_in_f_0_), 
	.A(\left_in[DATA][0] ));
   HS65_LS_DLYIC4X9 FE_PHC212_resource_in_f_5_ (.Z(FE_PHN212_resource_in_f_5_), 
	.A(\left_in[DATA][5] ));
   HS65_LS_DLYIC4X9 FE_PHC211_resource_in_f_3_ (.Z(FE_PHN211_resource_in_f_3_), 
	.A(\left_in[DATA][3] ));
   HS65_LH_DLYIC4X4 FE_PHC210_resource_in_f_2_ (.Z(FE_PHN210_resource_in_f_2_), 
	.A(\left_in[DATA][2] ));
   HS65_LH_DLYIC4X4 FE_PHC209_resource_in_f_6_ (.Z(FE_PHN209_resource_in_f_6_), 
	.A(\left_in[DATA][6] ));
   HS65_LH_DLYIC4X4 FE_PHC208_resource_in_f_4_ (.Z(FE_PHN208_resource_in_f_4_), 
	.A(\left_in[DATA][4] ));
   HS65_LH_DLYIC2X9 FE_PHC207_resource_in_f_10_ (.Z(FE_PHN207_resource_in_f_10_), 
	.A(\left_in[DATA][10] ));
   HS65_LH_DLYIC4X4 FE_PHC206_resource_in_f_8_ (.Z(FE_PHN206_resource_in_f_8_), 
	.A(\left_in[DATA][8] ));
   HS65_LS_DLYIC4X9 FE_PHC205_resource_in_f_14_ (.Z(FE_PHN205_resource_in_f_14_), 
	.A(\left_in[DATA][14] ));
   HS65_LH_DLYIC2X9 FE_PHC204_resource_in_f_12_ (.Z(FE_PHN204_resource_in_f_12_), 
	.A(\left_in[DATA][12] ));
   HS65_LH_DLYIC4X4 FE_PHC203_resource_in_f_30_ (.Z(FE_PHN203_resource_in_f_30_), 
	.A(\left_in[DATA][30] ));
   HS65_LH_DLYIC4X4 FE_PHC202_resource_in_f_28_ (.Z(FE_PHN202_resource_in_f_28_), 
	.A(\left_in[DATA][28] ));
   HS65_LH_DLYIC4X4 FE_PHC201_resource_in_f_26_ (.Z(FE_PHN201_resource_in_f_26_), 
	.A(\left_in[DATA][26] ));
   HS65_LH_DLYIC4X4 FE_PHC200_resource_in_f_22_ (.Z(FE_PHN200_resource_in_f_22_), 
	.A(\left_in[DATA][22] ));
   HS65_LH_DLYIC4X4 FE_PHC199_resource_in_f_20_ (.Z(FE_PHN199_resource_in_f_20_), 
	.A(\left_in[DATA][20] ));
   HS65_LS_DLYIC4X9 FE_PHC198_resource_in_f_18_ (.Z(FE_PHN198_resource_in_f_18_), 
	.A(\left_in[DATA][18] ));
   HS65_LH_DLYIC4X4 FE_PHC197_resource_in_f_16_ (.Z(FE_PHN197_resource_in_f_16_), 
	.A(\left_in[DATA][16] ));
   HS65_LH_DLYIC4X4 FE_PHC196_resource_in_f_24_ (.Z(FE_PHN196_resource_in_f_24_), 
	.A(\left_in[DATA][24] ));
   HS65_LH_BFX4 FE_PHC187_N4 (.Z(FE_PHN187_N4), 
	.A(FE_PHN57_N4));
   HS65_LH_DLYIC4X9 FE_PHC57_N4 (.Z(FE_PHN57_N4), 
	.A(N4));
   HS65_LH_DLYIC4X9 FE_PHC55_preset (.Z(FE_PHN55_preset), 
	.A(FE_PHN302_preset));
   HS65_LS_BFX7 lt_en__CASCADE_L3_I0 (.Z(lt_en__CASCADE_L3_N0), 
	.A(lt_en__CASCADE_L2_N0));
   HS65_LS_BFX2 lt_en__CASCADE_L2_I0 (.Z(lt_en__CASCADE_L2_N0), 
	.A(lt_en__CASCADE_L1_N0));
   HS65_LS_BFX9 lt_en__CASCADE_L1_I0 (.Z(lt_en__CASCADE_L1_N0), 
	.A(lt_en));
   latch_controller_1_6 controller (.preset(N0), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX18 type_out_reg (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(FE_PHN187_N4));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(N3), 
	.D(FE_PHN238_resource_in_f_31_));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(FE_PHN273_resource_in_f_30_));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(N3), 
	.D(FE_PHN281_resource_in_f_29_));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(FE_PHN255_resource_in_f_28_));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(N3), 
	.D(FE_PHN263_resource_in_f_27_));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(FE_PHN278_resource_in_f_26_));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(N3), 
	.D(FE_PHN276_resource_in_f_25_));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(FE_PHN277_resource_in_f_24_));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(N3), 
	.D(FE_PHN262_resource_in_f_23_));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(FE_PHN254_resource_in_f_22_));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(N3), 
	.D(FE_PHN271_resource_in_f_21_));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(FE_PHN253_resource_in_f_20_));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(N3), 
	.D(FE_PHN270_resource_in_f_19_));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3), 
	.D(FE_PHN235_resource_in_f_18_));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(N3), 
	.D(FE_PHN285_resource_in_f_17_));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3), 
	.D(FE_PHN275_resource_in_f_16_));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(N3), 
	.D(FE_PHN239_resource_in_f_15_));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3), 
	.D(FE_PHN236_resource_in_f_14_));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3), 
	.D(FE_PHN244_resource_in_f_13_));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(N3), 
	.D(FE_PHN233_resource_in_f_12_));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3), 
	.D(FE_PHN243_resource_in_f_11_));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(N3), 
	.D(FE_PHN232_resource_in_f_10_));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(FE_PHN242_resource_in_f_9_));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(N3), 
	.D(FE_PHN279_resource_in_f_8_));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(FE_PHN287_resource_in_f_7_));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(N3), 
	.D(FE_PHN272_resource_in_f_6_));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(FE_PHN245_resource_in_f_5_));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(N3), 
	.D(FE_PHN280_resource_in_f_4_));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(FE_PHN240_resource_in_f_3_));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(N3), 
	.D(FE_PHN274_resource_in_f_2_));
   HS65_LS_LDHQX9 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(FE_PHN286_resource_in_f_1_));
   HS65_LS_LDHQX9 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3), 
	.D(FE_PHN241_resource_in_f_0_));
   HS65_LS_AND2X4 U5 (.Z(n7), 
	.B(FE_PHN55_preset), 
	.A(1'b1));
   HS65_LS_AND2X4 U6 (.Z(n6), 
	.B(n4), 
	.A(n5));
   HS65_LS_OR2X9 U7 (.Z(N3), 
	.B(n6), 
	.A(n7));
   HS65_LS_LDHQX18 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(FE_PHN248_resource_in_f_32_));
   HS65_LS_IVX9 U3 (.Z(n4), 
	.A(FE_PHN304_preset));
   HS65_LS_NOR2AX3 U4 (.Z(N4), 
	.B(FE_PHN339_preset), 
	.A(\left_in[DATA][33] ));
   HS65_LS_IVX9 U8 (.Z(n5), 
	.A(lt_en__CASCADE_L3_N0));
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

   HS65_LS_AND2X4 C8 (.Z(q), 
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

   sr_latch_0_7 latch (.s(set), 
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
   wire not_Ain;

   assign Rout = Aout ;

   c_gate_0_7 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 I_0 (.Z(not_Ain), 
	.A(Ain));
   HS65_LSS_XOR2X6 U1 (.Z(lt_en), 
	.B(Ain), 
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
   wire FE_PHN338_preset;
   wire FE_PHN315_preset;
   wire FE_PHN290_preset;
   wire FE_PHN117_west_in_f_32_;
   wire FE_PHN96_west_in_f_0_;
   wire FE_PHN95_west_in_f_19_;
   wire FE_PHN94_west_in_f_21_;
   wire FE_PHN93_west_in_f_17_;
   wire FE_PHN92_west_in_f_15_;
   wire FE_PHN91_west_in_f_23_;
   wire FE_PHN90_west_in_f_29_;
   wire FE_PHN89_west_in_f_27_;
   wire FE_PHN88_west_in_f_25_;
   wire FE_PHN87_west_in_f_31_;
   wire FE_PHN86_west_in_f_5_;
   wire FE_PHN85_west_in_f_3_;
   wire FE_PHN84_west_in_f_6_;
   wire FE_PHN83_west_in_f_11_;
   wire FE_PHN82_west_in_f_4_;
   wire FE_PHN81_west_in_f_2_;
   wire FE_PHN80_west_in_f_13_;
   wire FE_PHN79_west_in_f_10_;
   wire FE_PHN78_west_in_f_16_;
   wire FE_PHN77_west_in_f_14_;
   wire FE_PHN76_west_in_f_12_;
   wire FE_PHN75_west_in_f_1_;
   wire FE_PHN74_west_in_f_9_;
   wire FE_PHN73_west_in_f_7_;
   wire FE_PHN72_west_in_f_20_;
   wire FE_PHN71_west_in_f_8_;
   wire FE_PHN70_west_in_f_18_;
   wire FE_PHN69_west_in_f_22_;
   wire FE_PHN68_west_in_f_24_;
   wire FE_PHN67_west_in_f_30_;
   wire FE_PHN66_west_in_f_28_;
   wire FE_PHN65_west_in_f_26_;
   wire FE_PHN56_N4;
   wire lt_en__CASCADE_L1_N0;
   wire N0;
   wire lt_en;
   wire N3;
   wire N4;
   wire n4;
   wire n5;
   wire n6;
   wire n7;

   assign N0 = preset ;

   HS65_LS_BFX7 FE_PHC338_preset (.Z(FE_PHN338_preset), 
	.A(N0));
   HS65_LH_BFX9 FE_PHC315_preset (.Z(FE_PHN315_preset), 
	.A(N0));
   HS65_LH_DLYIC4X4 FE_PHC290_preset (.Z(FE_PHN290_preset), 
	.A(FE_PHN338_preset));
   HS65_LH_DLYIC6X4 FE_PHC117_west_in_f_32_ (.Z(FE_PHN117_west_in_f_32_), 
	.A(\left_in[DATA][32] ));
   HS65_LH_DLYIC6X4 FE_PHC96_west_in_f_0_ (.Z(FE_PHN96_west_in_f_0_), 
	.A(\left_in[DATA][0] ));
   HS65_LH_DLYIC6X9 FE_PHC95_west_in_f_19_ (.Z(FE_PHN95_west_in_f_19_), 
	.A(\left_in[DATA][19] ));
   HS65_LH_DLYIC6X9 FE_PHC94_west_in_f_21_ (.Z(FE_PHN94_west_in_f_21_), 
	.A(\left_in[DATA][21] ));
   HS65_LH_DLYIC6X9 FE_PHC93_west_in_f_17_ (.Z(FE_PHN93_west_in_f_17_), 
	.A(\left_in[DATA][17] ));
   HS65_LH_DLYIC6X9 FE_PHC92_west_in_f_15_ (.Z(FE_PHN92_west_in_f_15_), 
	.A(\left_in[DATA][15] ));
   HS65_LH_DLYIC6X9 FE_PHC91_west_in_f_23_ (.Z(FE_PHN91_west_in_f_23_), 
	.A(\left_in[DATA][23] ));
   HS65_LH_DLYIC6X9 FE_PHC90_west_in_f_29_ (.Z(FE_PHN90_west_in_f_29_), 
	.A(\left_in[DATA][29] ));
   HS65_LH_DLYIC6X9 FE_PHC89_west_in_f_27_ (.Z(FE_PHN89_west_in_f_27_), 
	.A(\left_in[DATA][27] ));
   HS65_LH_DLYIC6X9 FE_PHC88_west_in_f_25_ (.Z(FE_PHN88_west_in_f_25_), 
	.A(\left_in[DATA][25] ));
   HS65_LH_DLYIC6X9 FE_PHC87_west_in_f_31_ (.Z(FE_PHN87_west_in_f_31_), 
	.A(\left_in[DATA][31] ));
   HS65_LH_DLYIC6X9 FE_PHC86_west_in_f_5_ (.Z(FE_PHN86_west_in_f_5_), 
	.A(\left_in[DATA][5] ));
   HS65_LH_DLYIC6X9 FE_PHC85_west_in_f_3_ (.Z(FE_PHN85_west_in_f_3_), 
	.A(\left_in[DATA][3] ));
   HS65_LH_DLYIC6X9 FE_PHC84_west_in_f_6_ (.Z(FE_PHN84_west_in_f_6_), 
	.A(\left_in[DATA][6] ));
   HS65_LH_DLYIC6X4 FE_PHC83_west_in_f_11_ (.Z(FE_PHN83_west_in_f_11_), 
	.A(\left_in[DATA][11] ));
   HS65_LH_DLYIC6X9 FE_PHC82_west_in_f_4_ (.Z(FE_PHN82_west_in_f_4_), 
	.A(\left_in[DATA][4] ));
   HS65_LH_DLYIC6X9 FE_PHC81_west_in_f_2_ (.Z(FE_PHN81_west_in_f_2_), 
	.A(\left_in[DATA][2] ));
   HS65_LH_DLYIC6X7 FE_PHC80_west_in_f_13_ (.Z(FE_PHN80_west_in_f_13_), 
	.A(\left_in[DATA][13] ));
   HS65_LH_DLYIC6X9 FE_PHC79_west_in_f_10_ (.Z(FE_PHN79_west_in_f_10_), 
	.A(\left_in[DATA][10] ));
   HS65_LH_DLYIC6X9 FE_PHC78_west_in_f_16_ (.Z(FE_PHN78_west_in_f_16_), 
	.A(\left_in[DATA][16] ));
   HS65_LH_DLYIC6X9 FE_PHC77_west_in_f_14_ (.Z(FE_PHN77_west_in_f_14_), 
	.A(\left_in[DATA][14] ));
   HS65_LH_DLYIC6X9 FE_PHC76_west_in_f_12_ (.Z(FE_PHN76_west_in_f_12_), 
	.A(\left_in[DATA][12] ));
   HS65_LH_DLYIC6X7 FE_PHC75_west_in_f_1_ (.Z(FE_PHN75_west_in_f_1_), 
	.A(\left_in[DATA][1] ));
   HS65_LH_DLYIC6X9 FE_PHC74_west_in_f_9_ (.Z(FE_PHN74_west_in_f_9_), 
	.A(\left_in[DATA][9] ));
   HS65_LH_DLYIC6X9 FE_PHC73_west_in_f_7_ (.Z(FE_PHN73_west_in_f_7_), 
	.A(\left_in[DATA][7] ));
   HS65_LH_DLYIC6X9 FE_PHC72_west_in_f_20_ (.Z(FE_PHN72_west_in_f_20_), 
	.A(\left_in[DATA][20] ));
   HS65_LH_DLYIC6X9 FE_PHC71_west_in_f_8_ (.Z(FE_PHN71_west_in_f_8_), 
	.A(\left_in[DATA][8] ));
   HS65_LH_DLYIC6X9 FE_PHC70_west_in_f_18_ (.Z(FE_PHN70_west_in_f_18_), 
	.A(\left_in[DATA][18] ));
   HS65_LH_DLYIC6X9 FE_PHC69_west_in_f_22_ (.Z(FE_PHN69_west_in_f_22_), 
	.A(\left_in[DATA][22] ));
   HS65_LH_DLYIC6X9 FE_PHC68_west_in_f_24_ (.Z(FE_PHN68_west_in_f_24_), 
	.A(\left_in[DATA][24] ));
   HS65_LH_DLYIC6X9 FE_PHC67_west_in_f_30_ (.Z(FE_PHN67_west_in_f_30_), 
	.A(\left_in[DATA][30] ));
   HS65_LH_DLYIC6X9 FE_PHC66_west_in_f_28_ (.Z(FE_PHN66_west_in_f_28_), 
	.A(\left_in[DATA][28] ));
   HS65_LH_DLYIC6X9 FE_PHC65_west_in_f_26_ (.Z(FE_PHN65_west_in_f_26_), 
	.A(\left_in[DATA][26] ));
   HS65_LH_DLYIC6X4 FE_PHC56_N4 (.Z(FE_PHN56_N4), 
	.A(N4));
   HS65_LS_BFX9 lt_en__CASCADE_L1_I0 (.Z(lt_en__CASCADE_L1_N0), 
	.A(lt_en));
   latch_controller_1_7 controller (.preset(N0), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX18 type_out_reg (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(FE_PHN56_N4));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(N3), 
	.D(FE_PHN87_west_in_f_31_));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(FE_PHN67_west_in_f_30_));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(N3), 
	.D(FE_PHN90_west_in_f_29_));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(FE_PHN66_west_in_f_28_));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(N3), 
	.D(FE_PHN89_west_in_f_27_));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(FE_PHN65_west_in_f_26_));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(N3), 
	.D(FE_PHN88_west_in_f_25_));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(FE_PHN68_west_in_f_24_));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(N3), 
	.D(FE_PHN91_west_in_f_23_));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(FE_PHN69_west_in_f_22_));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(N3), 
	.D(FE_PHN94_west_in_f_21_));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(FE_PHN72_west_in_f_20_));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(N3), 
	.D(FE_PHN95_west_in_f_19_));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3), 
	.D(FE_PHN70_west_in_f_18_));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(N3), 
	.D(FE_PHN93_west_in_f_17_));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3), 
	.D(FE_PHN78_west_in_f_16_));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(N3), 
	.D(FE_PHN92_west_in_f_15_));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3), 
	.D(FE_PHN77_west_in_f_14_));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3), 
	.D(FE_PHN80_west_in_f_13_));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(N3), 
	.D(FE_PHN76_west_in_f_12_));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3), 
	.D(FE_PHN83_west_in_f_11_));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(N3), 
	.D(FE_PHN79_west_in_f_10_));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(FE_PHN74_west_in_f_9_));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(N3), 
	.D(FE_PHN71_west_in_f_8_));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(FE_PHN73_west_in_f_7_));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(N3), 
	.D(FE_PHN84_west_in_f_6_));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(FE_PHN86_west_in_f_5_));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(N3), 
	.D(FE_PHN82_west_in_f_4_));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(FE_PHN85_west_in_f_3_));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(N3), 
	.D(FE_PHN81_west_in_f_2_));
   HS65_LS_LDHQX9 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(FE_PHN75_west_in_f_1_));
   HS65_LS_LDHQX18 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3), 
	.D(FE_PHN96_west_in_f_0_));
   HS65_LS_AND2X4 U5 (.Z(n7), 
	.B(FE_PHN290_preset), 
	.A(1'b1));
   HS65_LS_AND2X4 U6 (.Z(n6), 
	.B(n4), 
	.A(n5));
   HS65_LS_OR2X9 U7 (.Z(N3), 
	.B(n6), 
	.A(n7));
   HS65_LS_LDHQX18 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(FE_PHN117_west_in_f_32_));
   HS65_LS_IVX9 U3 (.Z(n4), 
	.A(FE_PHN315_preset));
   HS65_LS_NOR2AX3 U4 (.Z(N4), 
	.B(N0), 
	.A(\left_in[DATA][33] ));
   HS65_LS_IVX9 U8 (.Z(n5), 
	.A(lt_en__CASCADE_L1_N0));
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

   HS65_LS_AND2X4 C8 (.Z(q), 
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
   wire not_Ain;

   assign Rout = Aout ;

   c_gate_0_8 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 I_0 (.Z(not_Ain), 
	.A(Ain));
   HS65_LSS_XOR2X6 U1 (.Z(lt_en), 
	.B(Ain), 
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
   wire FE_PHN320_preset;
   wire FE_PHN316_preset;
   wire FE_PHN308_preset;
   wire FE_PHN295_preset;
   wire FE_PHN294_east_in_f_21_;
   wire FE_PHN293_east_in_f_19_;
   wire FE_PHN289_east_in_f_21_;
   wire FE_PHN288_east_in_f_19_;
   wire FE_PHN284_east_in_f_17_;
   wire FE_PHN282_east_in_f_23_;
   wire FE_PHN268_east_in_f_23_;
   wire FE_PHN267_east_in_f_21_;
   wire FE_PHN266_east_in_f_19_;
   wire FE_PHN265_east_in_f_17_;
   wire FE_PHN234_east_in_f_32_;
   wire FE_PHN228_east_in_f_32_;
   wire FE_PHN189_N4;
   wire FE_PHN185_east_in_f_25_;
   wire FE_PHN184_east_in_f_29_;
   wire FE_PHN183_east_in_f_31_;
   wire FE_PHN175_east_in_f_27_;
   wire FE_PHN174_east_in_f_13_;
   wire FE_PHN173_east_in_f_11_;
   wire FE_PHN171_east_in_f_5_;
   wire FE_PHN170_east_in_f_1_;
   wire FE_PHN168_east_in_f_3_;
   wire FE_PHN160_east_in_f_15_;
   wire FE_PHN145_east_in_f_9_;
   wire FE_PHN143_east_in_f_7_;
   wire FE_PHN131_east_in_f_8_;
   wire FE_PHN130_east_in_f_0_;
   wire FE_PHN128_east_in_f_6_;
   wire FE_PHN127_east_in_f_4_;
   wire FE_PHN126_east_in_f_2_;
   wire FE_PHN121_east_in_f_12_;
   wire FE_PHN120_east_in_f_10_;
   wire FE_PHN114_east_in_f_20_;
   wire FE_PHN113_east_in_f_18_;
   wire FE_PHN112_east_in_f_16_;
   wire FE_PHN111_east_in_f_14_;
   wire FE_PHN110_east_in_f_22_;
   wire FE_PHN109_east_in_f_24_;
   wire FE_PHN107_east_in_f_30_;
   wire FE_PHN106_east_in_f_28_;
   wire FE_PHN105_east_in_f_26_;
   wire FE_PHN60_N4;
   wire lt_en__CASCADE_L1_N0;
   wire N0;
   wire lt_en;
   wire N3;
   wire N4;
   wire n4;
   wire n5;
   wire n6;
   wire n7;

   assign N0 = preset ;

   HS65_LH_BFX9 FE_PHC320_preset (.Z(FE_PHN320_preset), 
	.A(N0));
   HS65_LH_BFX9 FE_PHC316_preset (.Z(FE_PHN316_preset), 
	.A(N0));
   HS65_LH_BFX7 FE_PHC308_preset (.Z(FE_PHN308_preset), 
	.A(FE_PHN320_preset));
   HS65_LH_DLYIC4X9 FE_PHC295_preset (.Z(FE_PHN295_preset), 
	.A(FE_PHN308_preset));
   HS65_LH_BFX4 FE_PHC294_east_in_f_21_ (.Z(FE_PHN294_east_in_f_21_), 
	.A(FE_PHN289_east_in_f_21_));
   HS65_LH_DLYIC2X9 FE_PHC293_east_in_f_19_ (.Z(FE_PHN293_east_in_f_19_), 
	.A(FE_PHN266_east_in_f_19_));
   HS65_LH_DLYIC2X9 FE_PHC289_east_in_f_21_ (.Z(FE_PHN289_east_in_f_21_), 
	.A(FE_PHN267_east_in_f_21_));
   HS65_LH_BFX2 FE_PHC288_east_in_f_19_ (.Z(FE_PHN288_east_in_f_19_), 
	.A(FE_PHN293_east_in_f_19_));
   HS65_LH_DLYIC4X9 FE_PHC284_east_in_f_17_ (.Z(FE_PHN284_east_in_f_17_), 
	.A(FE_PHN265_east_in_f_17_));
   HS65_LH_DLYIC4X9 FE_PHC282_east_in_f_23_ (.Z(FE_PHN282_east_in_f_23_), 
	.A(FE_PHN268_east_in_f_23_));
   HS65_LH_DLYIC2X9 FE_PHC268_east_in_f_23_ (.Z(FE_PHN268_east_in_f_23_), 
	.A(\left_in[DATA][23] ));
   HS65_LS_DLYIC4X9 FE_PHC267_east_in_f_21_ (.Z(FE_PHN267_east_in_f_21_), 
	.A(\left_in[DATA][21] ));
   HS65_LS_DLYIC4X9 FE_PHC266_east_in_f_19_ (.Z(FE_PHN266_east_in_f_19_), 
	.A(\left_in[DATA][19] ));
   HS65_LS_DLYIC4X9 FE_PHC265_east_in_f_17_ (.Z(FE_PHN265_east_in_f_17_), 
	.A(\left_in[DATA][17] ));
   HS65_LH_DLYIC4X9 FE_PHC234_east_in_f_32_ (.Z(FE_PHN234_east_in_f_32_), 
	.A(FE_PHN228_east_in_f_32_));
   HS65_LH_DLYIC2X9 FE_PHC228_east_in_f_32_ (.Z(FE_PHN228_east_in_f_32_), 
	.A(\left_in[DATA][32] ));
   HS65_LH_BFX9 FE_PHC189_N4 (.Z(FE_PHN189_N4), 
	.A(FE_PHN60_N4));
   HS65_LH_DLYIC6X4 FE_PHC185_east_in_f_25_ (.Z(FE_PHN185_east_in_f_25_), 
	.A(\left_in[DATA][25] ));
   HS65_LH_DLYIC6X4 FE_PHC184_east_in_f_29_ (.Z(FE_PHN184_east_in_f_29_), 
	.A(\left_in[DATA][29] ));
   HS65_LH_DLYIC6X4 FE_PHC183_east_in_f_31_ (.Z(FE_PHN183_east_in_f_31_), 
	.A(\left_in[DATA][31] ));
   HS65_LH_DLYIC6X4 FE_PHC175_east_in_f_27_ (.Z(FE_PHN175_east_in_f_27_), 
	.A(\left_in[DATA][27] ));
   HS65_LH_DLYIC6X4 FE_PHC174_east_in_f_13_ (.Z(FE_PHN174_east_in_f_13_), 
	.A(\left_in[DATA][13] ));
   HS65_LH_DLYIC6X4 FE_PHC173_east_in_f_11_ (.Z(FE_PHN173_east_in_f_11_), 
	.A(\left_in[DATA][11] ));
   HS65_LH_DLYIC6X4 FE_PHC171_east_in_f_5_ (.Z(FE_PHN171_east_in_f_5_), 
	.A(\left_in[DATA][5] ));
   HS65_LH_DLYIC6X4 FE_PHC170_east_in_f_1_ (.Z(FE_PHN170_east_in_f_1_), 
	.A(\left_in[DATA][1] ));
   HS65_LH_DLYIC6X4 FE_PHC168_east_in_f_3_ (.Z(FE_PHN168_east_in_f_3_), 
	.A(\left_in[DATA][3] ));
   HS65_LH_DLYIC6X4 FE_PHC160_east_in_f_15_ (.Z(FE_PHN160_east_in_f_15_), 
	.A(\left_in[DATA][15] ));
   HS65_LH_DLYIC6X4 FE_PHC145_east_in_f_9_ (.Z(FE_PHN145_east_in_f_9_), 
	.A(\left_in[DATA][9] ));
   HS65_LH_DLYIC6X7 FE_PHC143_east_in_f_7_ (.Z(FE_PHN143_east_in_f_7_), 
	.A(\left_in[DATA][7] ));
   HS65_LH_DLYIC6X4 FE_PHC131_east_in_f_8_ (.Z(FE_PHN131_east_in_f_8_), 
	.A(\left_in[DATA][8] ));
   HS65_LH_DLYIC6X4 FE_PHC130_east_in_f_0_ (.Z(FE_PHN130_east_in_f_0_), 
	.A(\left_in[DATA][0] ));
   HS65_LH_DLYIC6X7 FE_PHC128_east_in_f_6_ (.Z(FE_PHN128_east_in_f_6_), 
	.A(\left_in[DATA][6] ));
   HS65_LH_DLYIC6X7 FE_PHC127_east_in_f_4_ (.Z(FE_PHN127_east_in_f_4_), 
	.A(\left_in[DATA][4] ));
   HS65_LH_DLYIC6X7 FE_PHC126_east_in_f_2_ (.Z(FE_PHN126_east_in_f_2_), 
	.A(\left_in[DATA][2] ));
   HS65_LH_DLYIC6X7 FE_PHC121_east_in_f_12_ (.Z(FE_PHN121_east_in_f_12_), 
	.A(\left_in[DATA][12] ));
   HS65_LH_DLYIC6X7 FE_PHC120_east_in_f_10_ (.Z(FE_PHN120_east_in_f_10_), 
	.A(\left_in[DATA][10] ));
   HS65_LH_DLYIC6X7 FE_PHC114_east_in_f_20_ (.Z(FE_PHN114_east_in_f_20_), 
	.A(\left_in[DATA][20] ));
   HS65_LH_DLYIC6X9 FE_PHC113_east_in_f_18_ (.Z(FE_PHN113_east_in_f_18_), 
	.A(\left_in[DATA][18] ));
   HS65_LH_DLYIC6X7 FE_PHC112_east_in_f_16_ (.Z(FE_PHN112_east_in_f_16_), 
	.A(\left_in[DATA][16] ));
   HS65_LH_DLYIC6X9 FE_PHC111_east_in_f_14_ (.Z(FE_PHN111_east_in_f_14_), 
	.A(\left_in[DATA][14] ));
   HS65_LH_DLYIC6X7 FE_PHC110_east_in_f_22_ (.Z(FE_PHN110_east_in_f_22_), 
	.A(\left_in[DATA][22] ));
   HS65_LH_DLYIC6X9 FE_PHC109_east_in_f_24_ (.Z(FE_PHN109_east_in_f_24_), 
	.A(\left_in[DATA][24] ));
   HS65_LH_DLYIC6X7 FE_PHC107_east_in_f_30_ (.Z(FE_PHN107_east_in_f_30_), 
	.A(\left_in[DATA][30] ));
   HS65_LH_DLYIC6X7 FE_PHC106_east_in_f_28_ (.Z(FE_PHN106_east_in_f_28_), 
	.A(\left_in[DATA][28] ));
   HS65_LH_DLYIC6X7 FE_PHC105_east_in_f_26_ (.Z(FE_PHN105_east_in_f_26_), 
	.A(\left_in[DATA][26] ));
   HS65_LH_DLYIC4X9 FE_PHC60_N4 (.Z(FE_PHN60_N4), 
	.A(N4));
   HS65_LS_BFX9 lt_en__CASCADE_L1_I0 (.Z(lt_en__CASCADE_L1_N0), 
	.A(lt_en));
   latch_controller_1_8 controller (.preset(N0), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX18 type_out_reg (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(FE_PHN189_N4));
   HS65_LS_LDHQX18 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(N3), 
	.D(FE_PHN183_east_in_f_31_));
   HS65_LS_LDHQX18 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(N3), 
	.D(FE_PHN184_east_in_f_29_));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(N3), 
	.D(FE_PHN175_east_in_f_27_));
   HS65_LS_LDHQX18 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(N3), 
	.D(FE_PHN185_east_in_f_25_));
   HS65_LS_LDHQX18 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(N3), 
	.D(FE_PHN282_east_in_f_23_));
   HS65_LS_LDHQX18 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(N3), 
	.D(FE_PHN294_east_in_f_21_));
   HS65_LS_LDHQX18 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(N3), 
	.D(FE_PHN288_east_in_f_19_));
   HS65_LS_LDHQX18 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(N3), 
	.D(FE_PHN284_east_in_f_17_));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(N3), 
	.D(FE_PHN160_east_in_f_15_));
   HS65_LS_LDHQX18 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3), 
	.D(FE_PHN174_east_in_f_13_));
   HS65_LS_LDHQX18 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3), 
	.D(FE_PHN173_east_in_f_11_));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(FE_PHN145_east_in_f_9_));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(FE_PHN143_east_in_f_7_));
   HS65_LS_LDHQX18 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(FE_PHN171_east_in_f_5_));
   HS65_LS_LDHQX18 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(FE_PHN168_east_in_f_3_));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(FE_PHN106_east_in_f_28_));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(FE_PHN105_east_in_f_26_));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(FE_PHN109_east_in_f_24_));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(FE_PHN110_east_in_f_22_));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(FE_PHN114_east_in_f_20_));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3), 
	.D(FE_PHN113_east_in_f_18_));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3), 
	.D(FE_PHN112_east_in_f_16_));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3), 
	.D(FE_PHN111_east_in_f_14_));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(N3), 
	.D(FE_PHN121_east_in_f_12_));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(N3), 
	.D(FE_PHN120_east_in_f_10_));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(N3), 
	.D(FE_PHN131_east_in_f_8_));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(N3), 
	.D(FE_PHN128_east_in_f_6_));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(N3), 
	.D(FE_PHN127_east_in_f_4_));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(N3), 
	.D(FE_PHN126_east_in_f_2_));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(FE_PHN107_east_in_f_30_));
   HS65_LS_LDHQX18 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(FE_PHN170_east_in_f_1_));
   HS65_LS_LDHQX9 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3), 
	.D(FE_PHN130_east_in_f_0_));
   HS65_LS_AND2X4 U5 (.Z(n7), 
	.B(FE_PHN295_preset), 
	.A(1'b1));
   HS65_LS_AND2X4 U6 (.Z(n6), 
	.B(n4), 
	.A(n5));
   HS65_LS_OR2X9 U7 (.Z(N3), 
	.B(n6), 
	.A(n7));
   HS65_LS_LDHQX18 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(FE_PHN234_east_in_f_32_));
   HS65_LS_IVX9 U3 (.Z(n4), 
	.A(FE_PHN316_preset));
   HS65_LS_NOR2AX3 U4 (.Z(N4), 
	.B(N0), 
	.A(\left_in[DATA][33] ));
   HS65_LS_IVX9 U8 (.Z(n5), 
	.A(lt_en__CASCADE_L1_N0));
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

   HS65_LS_AND2X4 C8 (.Z(q), 
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
   wire not_Ain;

   assign Rout = Aout ;

   c_gate_0_9 gate (.preset(preset), 
	.a(not_Ain), 
	.b(Rin), 
	.c(Aout));
   HS65_LS_IVX9 I_0 (.Z(not_Ain), 
	.A(Ain));
   HS65_LSS_XOR2X6 U1 (.Z(lt_en), 
	.B(Ain), 
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
   wire FE_PHN318_preset;
   wire FE_PHN311_preset;
   wire FE_PHN306_preset;
   wire FE_PHN283_south_in_f_21_;
   wire FE_PHN264_south_in_f_21_;
   wire FE_PHN237_south_in_f_32_;
   wire FE_PHN231_preset;
   wire FE_PHN229_south_in_f_32_;
   wire FE_PHN195_south_in_f_17_;
   wire FE_PHN194_south_in_f_15_;
   wire FE_PHN193_south_in_f_11_;
   wire FE_PHN192_south_in_f_19_;
   wire FE_PHN188_N4;
   wire FE_PHN181_south_in_f_13_;
   wire FE_PHN180_south_in_f_25_;
   wire FE_PHN179_south_in_f_31_;
   wire FE_PHN178_south_in_f_29_;
   wire FE_PHN177_south_in_f_27_;
   wire FE_PHN176_south_in_f_23_;
   wire FE_PHN172_south_in_f_9_;
   wire FE_PHN169_south_in_f_7_;
   wire FE_PHN167_south_in_f_5_;
   wire FE_PHN166_south_in_f_1_;
   wire FE_PHN165_south_in_f_0_;
   wire FE_PHN164_south_in_f_3_;
   wire FE_PHN163_south_in_f_2_;
   wire FE_PHN161_south_in_f_4_;
   wire FE_PHN159_south_in_f_6_;
   wire FE_PHN155_south_in_f_8_;
   wire FE_PHN154_south_in_f_10_;
   wire FE_PHN153_south_in_f_12_;
   wire FE_PHN142_south_in_f_20_;
   wire FE_PHN141_south_in_f_22_;
   wire FE_PHN140_south_in_f_24_;
   wire FE_PHN139_south_in_f_18_;
   wire FE_PHN138_south_in_f_30_;
   wire FE_PHN137_south_in_f_28_;
   wire FE_PHN136_south_in_f_26_;
   wire FE_PHN135_south_in_f_16_;
   wire FE_PHN134_south_in_f_14_;
   wire FE_PHN58_N4;
   wire lt_en__CASCADE_L1_N0;
   wire N0;
   wire lt_en;
   wire N3;
   wire N4;
   wire n4;
   wire n5;
   wire n6;
   wire n7;

   assign N0 = preset ;

   HS65_LH_BFX4 FE_PHC318_preset (.Z(FE_PHN318_preset), 
	.A(N0));
   HS65_LH_BFX9 FE_PHC311_preset (.Z(FE_PHN311_preset), 
	.A(N0));
   HS65_LH_BFX7 FE_PHC306_preset (.Z(FE_PHN306_preset), 
	.A(FE_PHN318_preset));
   HS65_LH_DLYIC4X9 FE_PHC283_south_in_f_21_ (.Z(FE_PHN283_south_in_f_21_), 
	.A(FE_PHN264_south_in_f_21_));
   HS65_LS_DLYIC4X9 FE_PHC264_south_in_f_21_ (.Z(FE_PHN264_south_in_f_21_), 
	.A(\left_in[DATA][21] ));
   HS65_LH_DLYIC4X9 FE_PHC237_south_in_f_32_ (.Z(FE_PHN237_south_in_f_32_), 
	.A(FE_PHN229_south_in_f_32_));
   HS65_LH_DLYIC4X9 FE_PHC231_preset (.Z(FE_PHN231_preset), 
	.A(FE_PHN306_preset));
   HS65_LS_DLYIC4X9 FE_PHC229_south_in_f_32_ (.Z(FE_PHN229_south_in_f_32_), 
	.A(\left_in[DATA][32] ));
   HS65_LH_DLYIC6X9 FE_PHC195_south_in_f_17_ (.Z(FE_PHN195_south_in_f_17_), 
	.A(\left_in[DATA][17] ));
   HS65_LH_DLYIC6X7 FE_PHC194_south_in_f_15_ (.Z(FE_PHN194_south_in_f_15_), 
	.A(\left_in[DATA][15] ));
   HS65_LH_DLYIC6X7 FE_PHC193_south_in_f_11_ (.Z(FE_PHN193_south_in_f_11_), 
	.A(\left_in[DATA][11] ));
   HS65_LH_DLYIC6X9 FE_PHC192_south_in_f_19_ (.Z(FE_PHN192_south_in_f_19_), 
	.A(\left_in[DATA][19] ));
   HS65_LH_BFX7 FE_PHC188_N4 (.Z(FE_PHN188_N4), 
	.A(FE_PHN58_N4));
   HS65_LH_DLYIC6X4 FE_PHC181_south_in_f_13_ (.Z(FE_PHN181_south_in_f_13_), 
	.A(\left_in[DATA][13] ));
   HS65_LH_DLYIC6X4 FE_PHC180_south_in_f_25_ (.Z(FE_PHN180_south_in_f_25_), 
	.A(\left_in[DATA][25] ));
   HS65_LH_DLYIC6X4 FE_PHC179_south_in_f_31_ (.Z(FE_PHN179_south_in_f_31_), 
	.A(\left_in[DATA][31] ));
   HS65_LH_DLYIC6X4 FE_PHC178_south_in_f_29_ (.Z(FE_PHN178_south_in_f_29_), 
	.A(\left_in[DATA][29] ));
   HS65_LH_DLYIC6X7 FE_PHC177_south_in_f_27_ (.Z(FE_PHN177_south_in_f_27_), 
	.A(\left_in[DATA][27] ));
   HS65_LH_DLYIC6X4 FE_PHC176_south_in_f_23_ (.Z(FE_PHN176_south_in_f_23_), 
	.A(\left_in[DATA][23] ));
   HS65_LH_DLYIC6X7 FE_PHC172_south_in_f_9_ (.Z(FE_PHN172_south_in_f_9_), 
	.A(\left_in[DATA][9] ));
   HS65_LH_DLYIC6X7 FE_PHC169_south_in_f_7_ (.Z(FE_PHN169_south_in_f_7_), 
	.A(\left_in[DATA][7] ));
   HS65_LH_DLYIC6X7 FE_PHC167_south_in_f_5_ (.Z(FE_PHN167_south_in_f_5_), 
	.A(\left_in[DATA][5] ));
   HS65_LH_DLYIC6X7 FE_PHC166_south_in_f_1_ (.Z(FE_PHN166_south_in_f_1_), 
	.A(\left_in[DATA][1] ));
   HS65_LH_DLYIC6X7 FE_PHC165_south_in_f_0_ (.Z(FE_PHN165_south_in_f_0_), 
	.A(\left_in[DATA][0] ));
   HS65_LH_DLYIC6X7 FE_PHC164_south_in_f_3_ (.Z(FE_PHN164_south_in_f_3_), 
	.A(\left_in[DATA][3] ));
   HS65_LH_DLYIC6X4 FE_PHC163_south_in_f_2_ (.Z(FE_PHN163_south_in_f_2_), 
	.A(\left_in[DATA][2] ));
   HS65_LH_DLYIC6X7 FE_PHC161_south_in_f_4_ (.Z(FE_PHN161_south_in_f_4_), 
	.A(\left_in[DATA][4] ));
   HS65_LH_DLYIC6X7 FE_PHC159_south_in_f_6_ (.Z(FE_PHN159_south_in_f_6_), 
	.A(\left_in[DATA][6] ));
   HS65_LH_DLYIC6X4 FE_PHC155_south_in_f_8_ (.Z(FE_PHN155_south_in_f_8_), 
	.A(\left_in[DATA][8] ));
   HS65_LH_DLYIC6X4 FE_PHC154_south_in_f_10_ (.Z(FE_PHN154_south_in_f_10_), 
	.A(\left_in[DATA][10] ));
   HS65_LH_DLYIC6X4 FE_PHC153_south_in_f_12_ (.Z(FE_PHN153_south_in_f_12_), 
	.A(\left_in[DATA][12] ));
   HS65_LH_DLYIC6X7 FE_PHC142_south_in_f_20_ (.Z(FE_PHN142_south_in_f_20_), 
	.A(\left_in[DATA][20] ));
   HS65_LH_DLYIC6X7 FE_PHC141_south_in_f_22_ (.Z(FE_PHN141_south_in_f_22_), 
	.A(\left_in[DATA][22] ));
   HS65_LH_DLYIC6X7 FE_PHC140_south_in_f_24_ (.Z(FE_PHN140_south_in_f_24_), 
	.A(\left_in[DATA][24] ));
   HS65_LH_DLYIC6X7 FE_PHC139_south_in_f_18_ (.Z(FE_PHN139_south_in_f_18_), 
	.A(\left_in[DATA][18] ));
   HS65_LH_DLYIC6X7 FE_PHC138_south_in_f_30_ (.Z(FE_PHN138_south_in_f_30_), 
	.A(\left_in[DATA][30] ));
   HS65_LH_DLYIC6X4 FE_PHC137_south_in_f_28_ (.Z(FE_PHN137_south_in_f_28_), 
	.A(\left_in[DATA][28] ));
   HS65_LH_DLYIC6X7 FE_PHC136_south_in_f_26_ (.Z(FE_PHN136_south_in_f_26_), 
	.A(\left_in[DATA][26] ));
   HS65_LH_DLYIC6X7 FE_PHC135_south_in_f_16_ (.Z(FE_PHN135_south_in_f_16_), 
	.A(\left_in[DATA][16] ));
   HS65_LH_DLYIC6X7 FE_PHC134_south_in_f_14_ (.Z(FE_PHN134_south_in_f_14_), 
	.A(\left_in[DATA][14] ));
   HS65_LH_DLYIC4X9 FE_PHC58_N4 (.Z(FE_PHN58_N4), 
	.A(N4));
   HS65_LS_BFX4 lt_en__CASCADE_L1_I0 (.Z(lt_en__CASCADE_L1_N0), 
	.A(lt_en));
   latch_controller_1_9 controller (.preset(N0), 
	.Rin(\left_in[REQ] ), 
	.Aout(\left_out[ACK] ), 
	.Rout(\right_out[REQ] ), 
	.Ain(\right_in[ACK] ), 
	.lt_en(lt_en));
   HS65_LS_LDHQX18 type_out_reg (.Q(\right_out[DATA][33] ), 
	.G(N3), 
	.D(FE_PHN188_N4));
   HS65_LS_LDHQX9 \data_reg[30]  (.Q(\right_out[DATA][30] ), 
	.G(N3), 
	.D(FE_PHN138_south_in_f_30_));
   HS65_LS_LDHQX9 \data_reg[28]  (.Q(\right_out[DATA][28] ), 
	.G(N3), 
	.D(FE_PHN137_south_in_f_28_));
   HS65_LS_LDHQX9 \data_reg[26]  (.Q(\right_out[DATA][26] ), 
	.G(N3), 
	.D(FE_PHN136_south_in_f_26_));
   HS65_LS_LDHQX9 \data_reg[24]  (.Q(\right_out[DATA][24] ), 
	.G(N3), 
	.D(FE_PHN140_south_in_f_24_));
   HS65_LS_LDHQX9 \data_reg[22]  (.Q(\right_out[DATA][22] ), 
	.G(N3), 
	.D(FE_PHN141_south_in_f_22_));
   HS65_LS_LDHQX9 \data_reg[20]  (.Q(\right_out[DATA][20] ), 
	.G(N3), 
	.D(FE_PHN142_south_in_f_20_));
   HS65_LS_LDHQX9 \data_reg[18]  (.Q(\right_out[DATA][18] ), 
	.G(N3), 
	.D(FE_PHN139_south_in_f_18_));
   HS65_LS_LDHQX9 \data_reg[16]  (.Q(\right_out[DATA][16] ), 
	.G(N3), 
	.D(FE_PHN135_south_in_f_16_));
   HS65_LS_LDHQX9 \data_reg[14]  (.Q(\right_out[DATA][14] ), 
	.G(N3), 
	.D(FE_PHN134_south_in_f_14_));
   HS65_LS_LDHQX9 \data_reg[12]  (.Q(\right_out[DATA][12] ), 
	.G(N3), 
	.D(FE_PHN153_south_in_f_12_));
   HS65_LS_LDHQX9 \data_reg[10]  (.Q(\right_out[DATA][10] ), 
	.G(N3), 
	.D(FE_PHN154_south_in_f_10_));
   HS65_LS_LDHQX9 \data_reg[8]  (.Q(\right_out[DATA][8] ), 
	.G(N3), 
	.D(FE_PHN155_south_in_f_8_));
   HS65_LS_LDHQX9 \data_reg[6]  (.Q(\right_out[DATA][6] ), 
	.G(N3), 
	.D(FE_PHN159_south_in_f_6_));
   HS65_LS_LDHQX9 \data_reg[4]  (.Q(\right_out[DATA][4] ), 
	.G(N3), 
	.D(FE_PHN161_south_in_f_4_));
   HS65_LS_LDHQX9 \data_reg[2]  (.Q(\right_out[DATA][2] ), 
	.G(N3), 
	.D(FE_PHN163_south_in_f_2_));
   HS65_LS_LDHQX9 \data_reg[29]  (.Q(\right_out[DATA][29] ), 
	.G(N3), 
	.D(FE_PHN178_south_in_f_29_));
   HS65_LS_LDHQX9 \data_reg[27]  (.Q(\right_out[DATA][27] ), 
	.G(N3), 
	.D(FE_PHN177_south_in_f_27_));
   HS65_LS_LDHQX9 \data_reg[25]  (.Q(\right_out[DATA][25] ), 
	.G(N3), 
	.D(FE_PHN180_south_in_f_25_));
   HS65_LS_LDHQX9 \data_reg[23]  (.Q(\right_out[DATA][23] ), 
	.G(N3), 
	.D(FE_PHN176_south_in_f_23_));
   HS65_LS_LDHQX9 \data_reg[21]  (.Q(\right_out[DATA][21] ), 
	.G(N3), 
	.D(FE_PHN283_south_in_f_21_));
   HS65_LS_LDHQX9 \data_reg[19]  (.Q(\right_out[DATA][19] ), 
	.G(N3), 
	.D(FE_PHN192_south_in_f_19_));
   HS65_LS_LDHQX9 \data_reg[17]  (.Q(\right_out[DATA][17] ), 
	.G(N3), 
	.D(FE_PHN195_south_in_f_17_));
   HS65_LS_LDHQX9 \data_reg[15]  (.Q(\right_out[DATA][15] ), 
	.G(N3), 
	.D(FE_PHN194_south_in_f_15_));
   HS65_LS_LDHQX9 \data_reg[13]  (.Q(\right_out[DATA][13] ), 
	.G(N3), 
	.D(FE_PHN181_south_in_f_13_));
   HS65_LS_LDHQX9 \data_reg[11]  (.Q(\right_out[DATA][11] ), 
	.G(N3), 
	.D(FE_PHN193_south_in_f_11_));
   HS65_LS_LDHQX9 \data_reg[7]  (.Q(\right_out[DATA][7] ), 
	.G(N3), 
	.D(FE_PHN169_south_in_f_7_));
   HS65_LS_LDHQX9 \data_reg[5]  (.Q(\right_out[DATA][5] ), 
	.G(N3), 
	.D(FE_PHN167_south_in_f_5_));
   HS65_LS_LDHQX9 \data_reg[3]  (.Q(\right_out[DATA][3] ), 
	.G(N3), 
	.D(FE_PHN164_south_in_f_3_));
   HS65_LS_LDHQX9 \data_reg[9]  (.Q(\right_out[DATA][9] ), 
	.G(N3), 
	.D(FE_PHN172_south_in_f_9_));
   HS65_LS_LDHQX9 \data_reg[31]  (.Q(\right_out[DATA][31] ), 
	.G(N3), 
	.D(FE_PHN179_south_in_f_31_));
   HS65_LS_LDHQX9 \data_reg[0]  (.Q(\right_out[DATA][0] ), 
	.G(N3), 
	.D(FE_PHN165_south_in_f_0_));
   HS65_LS_LDHQX9 \data_reg[1]  (.Q(\right_out[DATA][1] ), 
	.G(N3), 
	.D(FE_PHN166_south_in_f_1_));
   HS65_LS_AND2X4 U5 (.Z(n7), 
	.B(FE_PHN231_preset), 
	.A(1'b1));
   HS65_LS_AND2X4 U6 (.Z(n6), 
	.B(n4), 
	.A(n5));
   HS65_LS_OR2X9 U7 (.Z(N3), 
	.B(n6), 
	.A(n7));
   HS65_LS_LDHQX18 \data_reg[32]  (.Q(\right_out[DATA][32] ), 
	.G(N3), 
	.D(FE_PHN237_south_in_f_32_));
   HS65_LS_IVX9 U3 (.Z(n4), 
	.A(FE_PHN311_preset));
   HS65_LS_NOR2AX3 U4 (.Z(N4), 
	.B(N0), 
	.A(\left_in[DATA][33] ));
   HS65_LS_IVX9 U8 (.Z(n5), 
	.A(lt_en__CASCADE_L1_N0));
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
	.switch_sel({ 1'b0,
		switch_sel[23],
		switch_sel[22],
		switch_sel[21],
		switch_sel[20],
		switch_sel[19],
		1'b0,
		switch_sel[17],
		switch_sel[16],
		switch_sel[15],
		switch_sel[14],
		switch_sel[13],
		1'b0,
		switch_sel[11],
		switch_sel[10],
		switch_sel[9],
		switch_sel[8],
		switch_sel[7],
		1'b0,
		switch_sel[5],
		switch_sel[4],
		switch_sel[3],
		switch_sel[2],
		switch_sel[1],
		1'b0 }), 
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

