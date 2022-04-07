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
  wire [64:0] n0_o;
  wire [13:0] n2_o;
  wire [1:0] n3_o;
  wire n4_o;
  wire [63:0] n5_o;
  wire [63:0] n7_o;
  wire n8_o;
  wire [80:0] n9_o;
  wire [80:0] n10_o;
  wire [80:0] rx_spm_buff;
  wire n13_o;
  wire n14_o;
  wire n15_o;
  wire n16_o;
  wire n17_o;
  wire n18_o;
  wire n19_o;
  wire n20_o;
  wire n21_o;
  wire [80:0] n22_o;
  wire [80:0] n23_o;
  wire [80:0] n24_o;
  wire n30_o;
  wire n31_o;
  wire n32_o;
  wire n33_o;
  wire n34_o;
  wire n35_o;
  wire n36_o;
  wire n37_o;
  wire n38_o;
  wire n39_o;
  wire n40_o;
  wire [13:0] n41_o;
  wire [63:0] n42_o;
  wire [80:0] n43_o;
  wire [13:0] n44_o;
  wire [13:0] n45_o;
  wire [13:0] n46_o;
  wire [1:0] n47_o;
  wire [1:0] n48_o;
  wire [64:0] n49_o;
  wire [64:0] n50_o;
  wire [64:0] n51_o;
  wire [80:0] n52_o;
  reg [80:0] n55_q;
  assign spm_addr = n2_o;
  assign spm_en = n3_o;
  assign spm_wr = n4_o;
  assign spm_wdata = n5_o;
  assign tx_spm_slv_rdata = n7_o;
  assign tx_spm_slv_error = n8_o;
  assign n0_o = {spm_slv_error, spm_slv_rdata};
  assign n2_o = n24_o[13:0];
  assign n3_o = n24_o[15:14];
  assign n4_o = n24_o[16];
  assign n5_o = n24_o[80:17];
  assign n7_o = n0_o[63:0];
  assign n8_o = n0_o[64];
  assign n9_o = {tx_spm_wdata, tx_spm_wr, tx_spm_en, tx_spm_addr};
  assign n10_o = {rx_spm_wdata, rx_spm_wr, rx_spm_en, rx_spm_addr};
  /* ni/spm_bus.vhd:58:16  */
  assign rx_spm_buff = n55_q; // (signal)
  /* ni/spm_bus.vhd:65:31  */
  assign n13_o = n9_o[14];
  /* ni/spm_bus.vhd:65:55  */
  assign n14_o = n9_o[15];
  /* ni/spm_bus.vhd:65:42  */
  assign n15_o = n13_o | n14_o;
  /* ni/spm_bus.vhd:68:44  */
  assign n16_o = rx_spm_buff[14];
  /* ni/spm_bus.vhd:68:73  */
  assign n17_o = rx_spm_buff[15];
  /* ni/spm_bus.vhd:68:55  */
  assign n18_o = n16_o | n17_o;
  /* ni/spm_bus.vhd:71:47  */
  assign n19_o = n10_o[14];
  /* ni/spm_bus.vhd:71:71  */
  assign n20_o = n10_o[15];
  /* ni/spm_bus.vhd:71:58  */
  assign n21_o = n19_o | n20_o;
  /* ni/spm_bus.vhd:71:33  */
  assign n22_o = n21_o ? n10_o : n9_o;
  /* ni/spm_bus.vhd:68:25  */
  assign n23_o = n18_o ? rx_spm_buff : n22_o;
  /* ni/spm_bus.vhd:65:17  */
  assign n24_o = n15_o ? n9_o : n23_o;
  /* ni/spm_bus.vhd:87:63  */
  assign n30_o = n10_o[14];
  /* ni/spm_bus.vhd:87:81  */
  assign n31_o = n9_o[14];
  /* ni/spm_bus.vhd:87:97  */
  assign n32_o = n9_o[15];
  /* ni/spm_bus.vhd:87:85  */
  assign n33_o = n31_o | n32_o;
  /* ni/spm_bus.vhd:87:67  */
  assign n34_o = n30_o & n33_o;
  /* ni/spm_bus.vhd:88:63  */
  assign n35_o = n10_o[15];
  /* ni/spm_bus.vhd:88:81  */
  assign n36_o = n9_o[14];
  /* ni/spm_bus.vhd:88:97  */
  assign n37_o = n9_o[15];
  /* ni/spm_bus.vhd:88:85  */
  assign n38_o = n36_o | n37_o;
  /* ni/spm_bus.vhd:88:67  */
  assign n39_o = n35_o & n38_o;
  /* ni/spm_bus.vhd:89:61  */
  assign n40_o = n10_o[16];
  /* ni/spm_bus.vhd:90:61  */
  assign n41_o = n10_o[13:0];
  /* ni/spm_bus.vhd:91:61  */
  assign n42_o = n10_o[80:17];
  assign n43_o = {n42_o, n40_o, n39_o, n34_o, n41_o};
  assign n44_o = n43_o[13:0];
  assign n45_o = rx_spm_buff[13:0];
  /* ni/spm_bus.vhd:84:25  */
  assign n46_o = reset ? n45_o : n44_o;
  assign n47_o = n43_o[15:14];
  /* ni/spm_bus.vhd:84:25  */
  assign n48_o = reset ? 2'b00 : n47_o;
  assign n49_o = n43_o[80:16];
  assign n50_o = rx_spm_buff[80:16];
  /* ni/spm_bus.vhd:84:25  */
  assign n51_o = reset ? n50_o : n49_o;
  assign n52_o = {n51_o, n48_o, n46_o};
  /* ni/spm_bus.vhd:83:17  */
  always @(posedge clk)
    n55_q <= n52_o;
endmodule

