module HPU
  (input  clk,
   input  reset,
   input  inLine_req,
   input  [34:0] inLine_data,
   output outLine_req,
   output [34:0] outLine_data,
   output [3:0] sel);
  wire [35:0] n0_o;
  wire n2_o;
  wire [34:0] n3_o;
  wire vld;
  wire sop;
  wire eop;
  wire [1:0] dest;
  wire [3:0] selint;
  wire [3:0] selintnext;
  wire [3:0] decodedsel;
  wire [34:0] outint;
  wire n5_o;
  wire n6_o;
  wire n7_o;
  wire [1:0] n8_o;
  wire n11_o;
  wire n12_o;
  wire n16_o;
  wire n17_o;
  wire n21_o;
  wire n22_o;
  wire n26_o;
  wire n27_o;
  wire [3:0] n29_o;
  wire n30_o;
  wire n31_o;
  wire n32_o;
  wire n33_o;
  wire [3:0] n34_o;
  wire [3:0] n35_o;
  wire n36_o;
  wire n37_o;
  wire n38_o;
  wire [3:0] n39_o;
  wire [15:0] n40_o;
  wire [18:0] n42_o;
  wire [20:0] n44_o;
  wire [13:0] n45_o;
  wire [34:0] n46_o;
  wire [34:0] n47_o;
  wire [34:0] n48_o;
  reg [3:0] n56_q;
  wire [3:0] n58_o;
  wire [35:0] n60_o;
  assign outLine_req = n2_o;
  assign outLine_data = n3_o;
  assign sel = n39_o;
  assign n0_o = {inLine_data, inLine_req};
  assign n2_o = n60_o[0];
  assign n3_o = n60_o[35:1];
  /* routers/synchronous/hpu.vhd:56:16  */
  assign vld = n5_o; // (signal)
  /* routers/synchronous/hpu.vhd:57:16  */
  assign sop = n6_o; // (signal)
  /* routers/synchronous/hpu.vhd:59:16  */
  assign eop = n7_o; // (signal)
  /* routers/synchronous/hpu.vhd:60:16  */
  assign dest = n8_o; // (signal)
  /* routers/synchronous/hpu.vhd:62:16  */
  assign selint = n56_q; // (signal)
  /* routers/synchronous/hpu.vhd:62:24  */
  assign selintnext = n29_o; // (signal)
  /* routers/synchronous/hpu.vhd:63:16  */
  assign decodedsel = n58_o; // (signal)
  /* routers/synchronous/hpu.vhd:64:16  */
  assign outint = n47_o; // (signal)
  /* routers/synchronous/hpu.vhd:66:27  */
  assign n5_o = n0_o[35];
  /* routers/synchronous/hpu.vhd:67:27  */
  assign n6_o = n0_o[34];
  /* routers/synchronous/hpu.vhd:69:27  */
  assign n7_o = n0_o[33];
  /* routers/synchronous/hpu.vhd:70:28  */
  assign n8_o = n0_o[2:1];
  /* routers/synchronous/hpu.vhd:74:40  */
  assign n11_o = dest == 2'b00;
  /* routers/synchronous/hpu.vhd:74:30  */
  assign n12_o = n11_o ? 1'b1 : 1'b0;
  /* routers/synchronous/hpu.vhd:75:40  */
  assign n16_o = dest == 2'b01;
  /* routers/synchronous/hpu.vhd:75:30  */
  assign n17_o = n16_o ? 1'b1 : 1'b0;
  /* routers/synchronous/hpu.vhd:76:40  */
  assign n21_o = dest == 2'b10;
  /* routers/synchronous/hpu.vhd:76:30  */
  assign n22_o = n21_o ? 1'b1 : 1'b0;
  /* routers/synchronous/hpu.vhd:77:40  */
  assign n26_o = dest == 2'b11;
  /* routers/synchronous/hpu.vhd:77:30  */
  assign n27_o = n26_o ? 1'b1 : 1'b0;
  /* routers/synchronous/hpu.vhd:79:34  */
  assign n29_o = sop ? decodedsel : n35_o;
  /* routers/synchronous/hpu.vhd:79:86  */
  assign n30_o = vld | eop;
  /* routers/synchronous/hpu.vhd:79:86  */
  assign n31_o = vld | eop;
  /* routers/synchronous/hpu.vhd:79:86  */
  assign n32_o = vld | eop;
  /* routers/synchronous/hpu.vhd:79:86  */
  assign n33_o = vld | eop;
  assign n34_o = {n33_o, n32_o, n31_o, n30_o};
  /* routers/synchronous/hpu.vhd:79:62  */
  assign n35_o = selint & n34_o;
  /* routers/synchronous/hpu.vhd:80:38  */
  assign n36_o = eop | vld;
  /* routers/synchronous/hpu.vhd:80:57  */
  assign n37_o = ~sop;
  /* routers/synchronous/hpu.vhd:80:50  */
  assign n38_o = n36_o & n37_o;
  /* routers/synchronous/hpu.vhd:80:23  */
  assign n39_o = n38_o ? selint : selintnext;
  /* routers/synchronous/hpu.vhd:81:38  */
  assign n40_o = n0_o[32:17];
  /* routers/synchronous/hpu.vhd:81:25  */
  assign n42_o = {3'b110, n40_o};
  /* routers/synchronous/hpu.vhd:81:53  */
  assign n44_o = {n42_o, 2'b00};
  /* routers/synchronous/hpu.vhd:81:73  */
  assign n45_o = n0_o[16:3];
  /* routers/synchronous/hpu.vhd:81:60  */
  assign n46_o = {n44_o, n45_o};
  /* routers/synchronous/hpu.vhd:81:87  */
  assign n47_o = sop ? n46_o : n48_o;
  /* routers/synchronous/hpu.vhd:81:114  */
  assign n48_o = n0_o[35:1];
  /* routers/synchronous/hpu.vhd:87:17  */
  always @(posedge clk or posedge reset)
    if (reset)
      n56_q <= 4'b0000;
    else
      n56_q <= selintnext;
  assign n58_o = {n27_o, n22_o, n17_o, n12_o};
  assign n60_o = {outint, 1'bZ};
endmodule

