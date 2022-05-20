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
  wire [13:0] n1_o;
  wire [1:0] n2_o;
  wire n3_o;
  wire [63:0] n4_o;
  wire [13:0] n6_o;
  wire n7_o;
  wire n8_o;
  wire [31:0] n9_o;
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
  wire n13_o;
  wire n14_o;
  wire n15_o;
  wire n16_o;
  wire n17_o;
  wire n18_o;
  wire n19_o;
  wire n20_o;
  wire n21_o;
  wire n22_o;
  wire n23_o;
  wire n24_o;
  wire n25_o;
  wire n26_o;
  wire n27_o;
  wire n28_o;
  wire n29_o;
  wire n30_o;
  wire [31:0] n31_o;
  wire [31:0] n32_o;
  wire n33_o;
  wire n34_o;
  localparam [1:0] n37_o = 2'b00;
  wire [13:0] n42_o;
  wire [13:0] n43_o;
  wire [2:0] n45_o;
  wire [2:0] n47_o;
  wire [2:0] n49_o;
  wire n51_o;
  wire [13:0] n53_o;
  wire n54_o;
  wire n55_o;
  wire [31:0] n58_o;
  wire n59_o;
  wire n60_o;
  wire n61_o;
  wire [31:0] n62_o;
  wire n65_o;
  wire [2:0] n68_o;
  wire n70_o;
  localparam [1:0] n71_o = 2'b11;
  wire n73_o;
  wire n74_o;
  wire [2:0] n77_o;
  wire n79_o;
  wire n82_o;
  wire n83_o;
  wire [2:0] n86_o;
  wire n88_o;
  wire n92_o;
  wire [31:0] n95_o;
  wire n97_o;
  wire [5:0] n98_o;
  wire n99_o;
  wire n100_o;
  reg n102_o;
  wire n103_o;
  wire n104_o;
  reg n106_o;
  reg n108_o;
  reg [31:0] n110_o;
  reg n113_o;
  reg n115_o;
  reg [13:0] n117_o;
  reg n121_o;
  reg n125_o;
  reg n130_o;
  reg [13:0] n133_o;
  reg [13:0] n135_o;
  reg [2:0] n139_o;
  wire [13:0] n145_o;
  wire [13:0] n146_o;
  reg [13:0] n149_q;
  wire [31:0] n153_o;
  wire [31:0] n157_o;
  reg [31:0] n158_q;
  wire [13:0] n163_o;
  wire [2:0] n165_o;
  reg [13:0] n169_q;
  reg [2:0] n170_q;
  wire n174_o;
  wire n175_o;
  wire n176_o;
  wire n177_o;
  wire n178_o;
  wire n179_o;
  wire n180_o;
  wire n181_o;
  wire n183_o;
  wire n185_o;
  reg n188_q;
  wire [80:0] n189_o;
  wire [47:0] n190_o;
  assign spm_addr = n1_o;
  assign spm_en = n2_o;
  assign spm_wr = n3_o;
  assign spm_wdata = n4_o;
  assign config_addr = n6_o;
  assign config_en = n7_o;
  assign config_wr = n8_o;
  assign config_wdata = n9_o;
  assign irq_fifo_data = n117_o;
  assign irq_fifo_data_valid = n34_o;
  assign irq_fifo_irq_valid = n121_o;
  assign n1_o = n189_o[13:0];
  assign n2_o = n189_o[15:14];
  assign n3_o = n189_o[16];
  assign n4_o = n189_o[80:17];
  assign n6_o = n190_o[13:0];
  assign n7_o = n190_o[14];
  assign n8_o = n190_o[15];
  assign n9_o = n190_o[47:16];
  /* ni/rx_unit.vhd:63:16  */
  assign new_pkt = n18_o; // (signal)
  /* ni/rx_unit.vhd:63:25  */
  assign new_data_pkt = n21_o; // (signal)
  /* ni/rx_unit.vhd:63:39  */
  assign new_config_pkt = n26_o; // (signal)
  /* ni/rx_unit.vhd:63:55  */
  assign new_irq_pkt = n30_o; // (signal)
  /* ni/rx_unit.vhd:64:16  */
  assign wdata_high_en = n125_o; // (signal)
  /* ni/rx_unit.vhd:64:45  */
  assign addr_load = n130_o; // (signal)
  /* ni/rx_unit.vhd:64:56  */
  assign lst_data_pkt = n188_q; // (signal)
  /* ni/rx_unit.vhd:65:16  */
  assign addr = n149_q; // (signal)
  /* ni/rx_unit.vhd:65:22  */
  assign next_addr = n133_o; // (signal)
  /* ni/rx_unit.vhd:65:33  */
  assign int_addr = n169_q; // (signal)
  /* ni/rx_unit.vhd:65:43  */
  assign next_int_addr = n135_o; // (signal)
  /* ni/rx_unit.vhd:67:8  */
  assign wdata_high = n158_q; // (signal)
  /* ni/rx_unit.vhd:71:16  */
  assign state = n170_q; // (signal)
  /* ni/rx_unit.vhd:71:23  */
  assign next_state = n139_o; // (signal)
  /* ni/rx_unit.vhd:75:26  */
  assign n13_o = pkt_in[34];
  /* ni/rx_unit.vhd:75:53  */
  assign n14_o = pkt_in[33];
  /* ni/rx_unit.vhd:75:43  */
  assign n15_o = n13_o & n14_o;
  /* ni/rx_unit.vhd:75:85  */
  assign n16_o = pkt_in[32];
  /* ni/rx_unit.vhd:75:75  */
  assign n17_o = ~n16_o;
  /* ni/rx_unit.vhd:75:70  */
  assign n18_o = n15_o & n17_o;
  /* ni/rx_unit.vhd:78:48  */
  assign n19_o = pkt_in[30];
  /* ni/rx_unit.vhd:78:38  */
  assign n20_o = ~n19_o;
  /* ni/rx_unit.vhd:78:33  */
  assign n21_o = new_pkt & n20_o;
  /* ni/rx_unit.vhd:81:49  */
  assign n22_o = pkt_in[31];
  /* ni/rx_unit.vhd:81:39  */
  assign n23_o = ~n22_o;
  /* ni/rx_unit.vhd:81:35  */
  assign n24_o = new_pkt & n23_o;
  /* ni/rx_unit.vhd:81:106  */
  assign n25_o = pkt_in[30];
  /* ni/rx_unit.vhd:81:96  */
  assign n26_o = n24_o & n25_o;
  /* ni/rx_unit.vhd:84:42  */
  assign n27_o = pkt_in[31];
  /* ni/rx_unit.vhd:84:32  */
  assign n28_o = new_pkt & n27_o;
  /* ni/rx_unit.vhd:84:98  */
  assign n29_o = pkt_in[30];
  /* ni/rx_unit.vhd:84:88  */
  assign n30_o = n28_o & n29_o;
  /* ni/rx_unit.vhd:87:62  */
  assign n31_o = pkt_in[31:0];
  /* ni/rx_unit.vhd:89:65  */
  assign n32_o = pkt_in[31:0];
  /* ni/rx_unit.vhd:96:55  */
  assign n33_o = pkt_in[32];
  /* ni/rx_unit.vhd:96:45  */
  assign n34_o = lst_data_pkt & n33_o;
  /* ni/rx_unit.vhd:113:43  */
  assign n42_o = int_addr + 14'b00000000000001;
  /* ni/rx_unit.vhd:117:65  */
  assign n43_o = pkt_in[29:16];
  /* ni/rx_unit.vhd:122:33  */
  assign n45_o = new_irq_pkt ? 3'b101 : state;
  /* ni/rx_unit.vhd:120:33  */
  assign n47_o = new_config_pkt ? 3'b100 : n45_o;
  /* ni/rx_unit.vhd:118:33  */
  assign n49_o = new_data_pkt ? 3'b010 : n47_o;
  /* ni/rx_unit.vhd:115:25  */
  assign n51_o = state == 3'b000;
  /* ni/rx_unit.vhd:127:55  */
  assign n53_o = addr + 14'b00000000000001;
  /* ni/rx_unit.vhd:128:43  */
  assign n54_o = pkt_in[32];
  /* ni/rx_unit.vhd:128:60  */
  assign n55_o = ~n54_o;
  /* ni/rx_unit.vhd:134:107  */
  assign n58_o = pkt_in[31:0];
  assign n59_o = n37_o[0];
  /* ni/rx_unit.vhd:128:33  */
  assign n60_o = n55_o ? n59_o : 1'b1;
  /* ni/rx_unit.vhd:128:33  */
  assign n61_o = n55_o ? 1'b0 : 1'b1;
  /* ni/rx_unit.vhd:128:33  */
  assign n62_o = n55_o ? wdata_high : n58_o;
  /* ni/rx_unit.vhd:128:33  */
  assign n65_o = n55_o ? 1'b1 : 1'b0;
  /* ni/rx_unit.vhd:128:33  */
  assign n68_o = n55_o ? 3'b001 : 3'b000;
  /* ni/rx_unit.vhd:126:25  */
  assign n70_o = state == 3'b010;
  /* ni/rx_unit.vhd:143:43  */
  assign n73_o = pkt_in[32];
  /* ni/rx_unit.vhd:143:60  */
  assign n74_o = ~n73_o;
  /* ni/rx_unit.vhd:143:33  */
  assign n77_o = n74_o ? 3'b010 : 3'b000;
  /* ni/rx_unit.vhd:138:25  */
  assign n79_o = state == 3'b001;
  /* ni/rx_unit.vhd:153:43  */
  assign n82_o = pkt_in[32];
  /* ni/rx_unit.vhd:153:60  */
  assign n83_o = ~n82_o;
  /* ni/rx_unit.vhd:153:33  */
  assign n86_o = n83_o ? 3'b011 : 3'b000;
  /* ni/rx_unit.vhd:150:25  */
  assign n88_o = state == 3'b100;
  /* ni/rx_unit.vhd:159:25  */
  assign n92_o = state == 3'b011;
  /* ni/rx_unit.vhd:169:99  */
  assign n95_o = pkt_in[31:0];
  /* ni/rx_unit.vhd:165:25  */
  assign n97_o = state == 3'b101;
  assign n98_o = {n97_o, n92_o, n88_o, n79_o, n70_o, n51_o};
  assign n99_o = n71_o[0];
  assign n100_o = n37_o[0];
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n98_o)
      6'b100000: n102_o <= 1'b1;
      6'b010000: n102_o <= n100_o;
      6'b001000: n102_o <= n100_o;
      6'b000100: n102_o <= n99_o;
      6'b000010: n102_o <= n60_o;
      6'b000001: n102_o <= n100_o;
      default: n102_o <= 1'bX;
    endcase
  assign n103_o = n71_o[1];
  assign n104_o = n37_o[1];
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n98_o)
      6'b100000: n106_o <= n104_o;
      6'b010000: n106_o <= n104_o;
      6'b001000: n106_o <= n104_o;
      6'b000100: n106_o <= n103_o;
      6'b000010: n106_o <= n104_o;
      6'b000001: n106_o <= n104_o;
      default: n106_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n98_o)
      6'b100000: n108_o <= 1'b1;
      6'b010000: n108_o <= 1'b0;
      6'b001000: n108_o <= 1'b0;
      6'b000100: n108_o <= 1'b1;
      6'b000010: n108_o <= n61_o;
      6'b000001: n108_o <= 1'b0;
      default: n108_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n98_o)
      6'b100000: n110_o <= n95_o;
      6'b010000: n110_o <= wdata_high;
      6'b001000: n110_o <= wdata_high;
      6'b000100: n110_o <= wdata_high;
      6'b000010: n110_o <= n62_o;
      6'b000001: n110_o <= wdata_high;
      default: n110_o <= 32'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n98_o)
      6'b100000: n113_o <= 1'b0;
      6'b010000: n113_o <= 1'b1;
      6'b001000: n113_o <= 1'b1;
      6'b000100: n113_o <= 1'b0;
      6'b000010: n113_o <= 1'b0;
      6'b000001: n113_o <= 1'b0;
      default: n113_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n98_o)
      6'b100000: n115_o <= 1'b0;
      6'b010000: n115_o <= 1'b1;
      6'b001000: n115_o <= 1'b1;
      6'b000100: n115_o <= 1'b0;
      6'b000010: n115_o <= 1'b0;
      6'b000001: n115_o <= 1'b0;
      default: n115_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n98_o)
      6'b100000: n117_o <= addr;
      6'b010000: n117_o <= addr;
      6'b001000: n117_o <= addr;
      6'b000100: n117_o <= int_addr;
      6'b000010: n117_o <= addr;
      6'b000001: n117_o <= addr;
      default: n117_o <= 14'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n98_o)
      6'b100000: n121_o <= 1'b1;
      6'b010000: n121_o <= 1'b0;
      6'b001000: n121_o <= 1'b0;
      6'b000100: n121_o <= 1'b0;
      6'b000010: n121_o <= 1'b0;
      6'b000001: n121_o <= 1'b0;
      default: n121_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n98_o)
      6'b100000: n125_o <= 1'b0;
      6'b010000: n125_o <= 1'b0;
      6'b001000: n125_o <= 1'b0;
      6'b000100: n125_o <= 1'b0;
      6'b000010: n125_o <= n65_o;
      6'b000001: n125_o <= 1'b0;
      default: n125_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n98_o)
      6'b100000: n130_o <= 1'b0;
      6'b010000: n130_o <= 1'b0;
      6'b001000: n130_o <= 1'b0;
      6'b000100: n130_o <= 1'b0;
      6'b000010: n130_o <= 1'b0;
      6'b000001: n130_o <= 1'b1;
      default: n130_o <= 1'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n98_o)
      6'b100000: n133_o <= addr;
      6'b010000: n133_o <= addr;
      6'b001000: n133_o <= addr;
      6'b000100: n133_o <= next_int_addr;
      6'b000010: n133_o <= addr;
      6'b000001: n133_o <= addr;
      default: n133_o <= 14'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n98_o)
      6'b100000: n135_o <= n42_o;
      6'b010000: n135_o <= n42_o;
      6'b001000: n135_o <= n42_o;
      6'b000100: n135_o <= n42_o;
      6'b000010: n135_o <= n53_o;
      6'b000001: n135_o <= n43_o;
      default: n135_o <= 14'bX;
    endcase
  /* ni/rx_unit.vhd:114:17  */
  always @*
    case (n98_o)
      6'b100000: n139_o <= 3'b000;
      6'b010000: n139_o <= 3'b000;
      6'b001000: n139_o <= n86_o;
      6'b000100: n139_o <= n77_o;
      6'b000010: n139_o <= n68_o;
      6'b000001: n139_o <= n49_o;
      default: n139_o <= 3'bX;
    endcase
  /* ni/rx_unit.vhd:180:56  */
  assign n145_o = pkt_in[29:16];
  /* ni/rx_unit.vhd:179:25  */
  assign n146_o = addr_load ? n145_o : next_addr;
  /* ni/rx_unit.vhd:178:17  */
  always @(posedge clk)
    n149_q <= n146_o;
  /* ni/rx_unit.vhd:192:62  */
  assign n153_o = pkt_in[31:0];
  /* ni/rx_unit.vhd:190:17  */
  assign n157_o = wdata_high_en ? n153_o : wdata_high;
  /* ni/rx_unit.vhd:190:17  */
  always @(posedge clk)
    n158_q <= n157_o;
  /* ni/rx_unit.vhd:201:25  */
  assign n163_o = reset ? 14'b00000000000000 : next_int_addr;
  /* ni/rx_unit.vhd:201:25  */
  assign n165_o = reset ? 3'b000 : next_state;
  /* ni/rx_unit.vhd:200:17  */
  always @(posedge clk)
    n169_q <= n163_o;
  /* ni/rx_unit.vhd:200:17  */
  always @(posedge clk)
    n170_q <= n165_o;
  /* ni/rx_unit.vhd:217:77  */
  assign n174_o = pkt_in[31];
  /* ni/rx_unit.vhd:217:67  */
  assign n175_o = new_data_pkt & n174_o;
  /* ni/rx_unit.vhd:217:49  */
  assign n176_o = ~n175_o;
  /* ni/rx_unit.vhd:217:135  */
  assign n177_o = pkt_in[32];
  /* ni/rx_unit.vhd:217:125  */
  assign n178_o = n176_o & n177_o;
  /* ni/rx_unit.vhd:217:43  */
  assign n179_o = reset | n178_o;
  /* ni/rx_unit.vhd:219:56  */
  assign n180_o = pkt_in[31];
  /* ni/rx_unit.vhd:219:46  */
  assign n181_o = new_data_pkt & n180_o;
  /* ni/rx_unit.vhd:219:25  */
  assign n183_o = n181_o ? 1'b1 : lst_data_pkt;
  /* ni/rx_unit.vhd:217:25  */
  assign n185_o = n179_o ? 1'b0 : n183_o;
  /* ni/rx_unit.vhd:216:17  */
  always @(posedge clk)
    n188_q <= n185_o;
  /* ni/rx_unit.vhd:216:17  */
  assign n189_o = {n110_o, n31_o, n108_o, n106_o, n102_o, addr};
  assign n190_o = {n32_o, n115_o, n113_o, int_addr};
endmodule

