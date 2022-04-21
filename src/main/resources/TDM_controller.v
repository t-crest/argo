module TDM_controller
  (input  clk,
   input  reset,
   input  run,
   input  [13:0] config_addr,
   input  config_en,
   input  config_wr,
   input  [31:0] config_wdata,
   input  sel,
   input  [3:0] t2n,
   input  [7:0] stbl_min,
   input  [7:0] stbl_maxp1,
   output master_run,
   output [31:0] config_slv_rdata,
   output config_slv_error,
   output [7:0] stbl_idx,
   output stbl_idx_en,
   output period_boundary,
   output [1:0] mc_p_cnt);
  wire [47:0] n1_o;
  wire [31:0] n3_o;
  wire n4_o;
  wire [9:0] tdm_s_cnt_reg;
  wire [31:0] tdm_p_cnt_reg;
  wire [7:0] stbl_idx_reg;
  wire [7:0] stbl_idx_next;
  wire [3:0] time2next_reg;
  wire [31:0] clock_cnt_lo_reg;
  wire master_run_next;
  wire [1:0] mc_p_cnt_reg;
  wire [31:0] read_reg;
  wire [31:0] read_next;
  wire [31:0] clock_delay_reg;
  wire period_boundary_sig;
  wire stbl_idx_reset;
  wire stbl_idx_en_sig;
  wire t2n_ld_reg;
  wire [7:0] stbl_idx_inc;
  wire config_slv_error_next;
  wire [2:0] master_run_reg;
  wire run_reg;
  wire n9_o;
  wire [1:0] n13_o;
  wire [2:0] n14_o;
  wire [2:0] n16_o;
  reg [2:0] n19_q;
  wire n23_o;
  wire n24_o;
  wire n25_o;
  wire n26_o;
  wire n27_o;
  wire [10:0] n28_o;
  wire [30:0] n29_o;
  wire n31_o;
  wire n33_o;
  wire n35_o;
  wire n37_o;
  localparam [31:0] n38_o = 32'b00000000000000000000000000000000;
  wire [30:0] n39_o;
  wire n41_o;
  wire [4:0] n42_o;
  wire n43_o;
  wire n44_o;
  wire n45_o;
  wire n46_o;
  wire n47_o;
  reg n48_o;
  wire [8:0] n49_o;
  wire [8:0] n50_o;
  wire [8:0] n51_o;
  wire [8:0] n52_o;
  wire [8:0] n53_o;
  wire [8:0] n54_o;
  reg [8:0] n55_o;
  wire [21:0] n56_o;
  wire [21:0] n57_o;
  wire [21:0] n58_o;
  wire [21:0] n59_o;
  wire [21:0] n60_o;
  reg [21:0] n61_o;
  reg n67_o;
  wire [10:0] n68_o;
  wire [30:0] n69_o;
  wire n70_o;
  wire n72_o;
  reg n73_o;
  reg n76_o;
  wire n77_o;
  wire [31:0] n78_o;
  wire [31:0] n79_o;
  wire n82_o;
  wire n83_o;
  wire n84_o;
  wire n89_o;
  wire [7:0] n93_o;
  wire n96_o;
  wire n98_o;
  wire [4:0] n99_o;
  wire n101_o;
  wire n102_o;
  wire n104_o;
  wire n105_o;
  wire n106_o;
  wire n107_o;
  wire n108_o;
  wire n109_o;
  wire n110_o;
  wire n113_o;
  wire n114_o;
  wire n115_o;
  wire n116_o;
  wire n117_o;
  wire n119_o;
  wire n120_o;
  wire [7:0] n121_o;
  wire n125_o;
  wire [31:0] n127_o;
  wire n129_o;
  wire n130_o;
  reg n137_q;
  reg [31:0] n138_q;
  reg n139_q;
  reg n140_q;
  wire [1:0] n149_o;
  wire [1:0] n150_o;
  wire [1:0] n152_o;
  reg [1:0] n155_q;
  wire [3:0] n159_o;
  wire [3:0] n160_o;
  wire [3:0] n162_o;
  reg [3:0] n165_q;
  wire [7:0] n168_o;
  wire [7:0] n170_o;
  reg [7:0] n173_q;
  wire [32:0] n174_o;
  assign master_run = n9_o;
  assign config_slv_rdata = n3_o;
  assign config_slv_error = n4_o;
  assign stbl_idx = stbl_idx_next;
  assign stbl_idx_en = stbl_idx_en_sig;
  assign period_boundary = period_boundary_sig;
  assign mc_p_cnt = mc_p_cnt_reg;
  assign n1_o = {config_wdata, config_wr, config_en, config_addr};
  assign n3_o = n174_o[31:0];
  assign n4_o = n174_o[32];
  /* ni/TDM_controller.vhd:84:10  */
  assign tdm_s_cnt_reg = 10'b0000000000; // (signal)
  /* ni/TDM_controller.vhd:85:10  */
  assign tdm_p_cnt_reg = 32'b00000000000000000000000000000000; // (signal)
  /* ni/TDM_controller.vhd:87:10  */
  assign stbl_idx_reg = n173_q; // (signal)
  /* ni/TDM_controller.vhd:88:10  */
  assign stbl_idx_next = n121_o; // (signal)
  /* ni/TDM_controller.vhd:89:10  */
  assign time2next_reg = n165_q; // (signal)
  /* ni/TDM_controller.vhd:165:42  */
  assign clock_cnt_lo_reg = 32'b00000000000000000000000000000000; // (signal)
  /* ni/TDM_controller.vhd:93:10  */
  assign master_run_next = n83_o; // (signal)
  /* ni/TDM_controller.vhd:95:10  */
  assign mc_p_cnt_reg = n155_q; // (signal)
  /* ni/TDM_controller.vhd:105:10  */
  assign read_reg = n138_q; // (signal)
  /* ni/TDM_controller.vhd:105:20  */
  assign read_next = n79_o; // (signal)
  /* ni/TDM_controller.vhd:106:10  */
  assign clock_delay_reg = 32'b00000000000000000000000000000000; // (signal)
  /* ni/TDM_controller.vhd:108:10  */
  assign period_boundary_sig = n119_o; // (signal)
  /* ni/TDM_controller.vhd:109:10  */
  assign stbl_idx_reset = n117_o; // (signal)
  /* ni/TDM_controller.vhd:109:26  */
  assign stbl_idx_en_sig = n110_o; // (signal)
  /* ni/TDM_controller.vhd:109:43  */
  assign t2n_ld_reg = n139_q; // (signal)
  /* ni/TDM_controller.vhd:110:10  */
  assign stbl_idx_inc = n93_o; // (signal)
  /* ni/TDM_controller.vhd:112:10  */
  assign config_slv_error_next = n89_o; // (signal)
  /* ni/TDM_controller.vhd:115:10  */
  assign master_run_reg = n19_q; // (signal)
  /* ni/TDM_controller.vhd:117:10  */
  assign run_reg = n140_q; // (signal)
  /* ni/TDM_controller.vhd:124:33  */
  assign n9_o = master_run_reg[2];
  /* ni/TDM_controller.vhd:131:43  */
  assign n13_o = master_run_reg[1:0];
  /* ni/TDM_controller.vhd:131:76  */
  assign n14_o = {n13_o, master_run_next};
  /* ni/TDM_controller.vhd:128:9  */
  assign n16_o = reset ? 3'b000 : n14_o;
  /* ni/TDM_controller.vhd:127:7  */
  always @(posedge clk)
    n19_q <= n16_o;
  /* ni/TDM_controller.vhd:153:41  */
  assign n23_o = master_run_reg[0];
  /* ni/TDM_controller.vhd:154:30  */
  assign n24_o = n1_o[14];
  /* ni/TDM_controller.vhd:154:19  */
  assign n25_o = sel & n24_o;
  /* ni/TDM_controller.vhd:156:17  */
  assign n26_o = n1_o[15];
  /* ni/TDM_controller.vhd:156:20  */
  assign n27_o = ~n26_o;
  /* ni/TDM_controller.vhd:157:37  */
  assign n28_o = n1_o[10:0];
  /* ni/TDM_controller.vhd:157:15  */
  assign n29_o = {20'b0, n28_o};  //  uext
  /* ni/TDM_controller.vhd:158:11  */
  assign n31_o = n29_o == 31'b0000000000000000000000000000000;
  /* ni/TDM_controller.vhd:160:11  */
  assign n33_o = n29_o == 31'b0000000000000000000000000000001;
  /* ni/TDM_controller.vhd:162:11  */
  assign n35_o = n29_o == 31'b0000000000000000000000000000010;
  /* ni/TDM_controller.vhd:164:11  */
  assign n37_o = n29_o == 31'b0000000000000000000000000000011;
  assign n39_o = n38_o[31:1];
  /* ni/TDM_controller.vhd:167:11  */
  assign n41_o = n29_o == 31'b0000000000000000000000000000100;
  assign n42_o = {n41_o, n37_o, n35_o, n33_o, n31_o};
  assign n43_o = tdm_s_cnt_reg[0];
  assign n44_o = tdm_p_cnt_reg[0];
  assign n45_o = clock_delay_reg[0];
  assign n46_o = clock_cnt_lo_reg[0];
  assign n47_o = tdm_p_cnt_reg[0];
  /* ni/TDM_controller.vhd:157:9  */
  always @*
    case (n42_o)
      5'b10000: n48_o <= run;
      5'b01000: n48_o <= n46_o;
      5'b00100: n48_o <= n45_o;
      5'b00010: n48_o <= n44_o;
      5'b00001: n48_o <= n43_o;
      default: n48_o <= n47_o;
    endcase
  assign n49_o = tdm_s_cnt_reg[9:1];
  assign n50_o = tdm_p_cnt_reg[9:1];
  assign n51_o = clock_delay_reg[9:1];
  assign n52_o = clock_cnt_lo_reg[9:1];
  assign n53_o = n39_o[8:0];
  assign n54_o = tdm_p_cnt_reg[9:1];
  /* ni/TDM_controller.vhd:157:9  */
  always @*
    case (n42_o)
      5'b10000: n55_o <= n53_o;
      5'b01000: n55_o <= n52_o;
      5'b00100: n55_o <= n51_o;
      5'b00010: n55_o <= n50_o;
      5'b00001: n55_o <= n49_o;
      default: n55_o <= n54_o;
    endcase
  assign n56_o = tdm_p_cnt_reg[31:10];
  assign n57_o = clock_delay_reg[31:10];
  assign n58_o = clock_cnt_lo_reg[31:10];
  assign n59_o = n39_o[30:9];
  assign n60_o = tdm_p_cnt_reg[31:10];
  /* ni/TDM_controller.vhd:157:9  */
  always @*
    case (n42_o)
      5'b10000: n61_o <= n59_o;
      5'b01000: n61_o <= n58_o;
      5'b00100: n61_o <= n57_o;
      5'b00010: n61_o <= n56_o;
      5'b00001: n61_o <= n60_o;
      default: n61_o <= n60_o;
    endcase
  /* ni/TDM_controller.vhd:157:9  */
  always @*
    case (n42_o)
      5'b10000: n67_o <= 1'b0;
      5'b01000: n67_o <= 1'b0;
      5'b00100: n67_o <= 1'b0;
      5'b00010: n67_o <= 1'b0;
      5'b00001: n67_o <= 1'b0;
      default: n67_o <= 1'b1;
    endcase
  /* ni/TDM_controller.vhd:174:37  */
  assign n68_o = n1_o[10:0];
  /* ni/TDM_controller.vhd:174:15  */
  assign n69_o = {20'b0, n68_o};  //  uext
  /* ni/TDM_controller.vhd:177:63  */
  assign n70_o = n1_o[16];
  /* ni/TDM_controller.vhd:175:11  */
  assign n72_o = n69_o == 31'b0000000000000000000000000000100;
  /* ni/TDM_controller.vhd:174:9  */
  always @*
    case (n72_o)
      1'b1: n73_o <= n70_o;
      default: n73_o <= n23_o;
    endcase
  /* ni/TDM_controller.vhd:174:9  */
  always @*
    case (n72_o)
      1'b1: n76_o <= 1'b0;
      default: n76_o <= 1'b1;
    endcase
  /* ni/TDM_controller.vhd:156:7  */
  assign n77_o = n27_o ? n23_o : n73_o;
  assign n78_o = {n61_o, n55_o, n48_o};
  /* ni/TDM_controller.vhd:154:5  */
  assign n79_o = n84_o ? n78_o : tdm_p_cnt_reg;
  /* ni/TDM_controller.vhd:156:7  */
  assign n82_o = n27_o ? n67_o : n76_o;
  /* ni/TDM_controller.vhd:154:5  */
  assign n83_o = n25_o ? n77_o : n23_o;
  /* ni/TDM_controller.vhd:154:5  */
  assign n84_o = n25_o & n27_o;
  /* ni/TDM_controller.vhd:154:5  */
  assign n89_o = n25_o ? n82_o : 1'b0;
  /* ni/TDM_controller.vhd:194:32  */
  assign n93_o = stbl_idx_reg + 8'b00000001;
  /* ni/TDM_controller.vhd:198:49  */
  assign n96_o = time2next_reg == 4'b0001;
  /* ni/TDM_controller.vhd:198:74  */
  assign n98_o = time2next_reg == 4'b0000;
  /* ni/TDM_controller.vhd:198:97  */
  assign n99_o = {1'b0, time2next_reg};  //  uext
  /* ni/TDM_controller.vhd:198:97  */
  assign n101_o = n99_o == 5'b11111;
  /* ni/TDM_controller.vhd:198:79  */
  assign n102_o = n98_o | n101_o;
  /* ni/TDM_controller.vhd:198:118  */
  assign n104_o = t2n == 4'b0000;
  /* ni/TDM_controller.vhd:198:109  */
  assign n105_o = n102_o & n104_o;
  /* ni/TDM_controller.vhd:198:54  */
  assign n106_o = n96_o | n105_o;
  /* ni/TDM_controller.vhd:198:134  */
  assign n107_o = run != run_reg;
  /* ni/TDM_controller.vhd:198:125  */
  assign n108_o = n106_o | n107_o;
  /* ni/TDM_controller.vhd:198:147  */
  assign n109_o = n108_o & run;
  /* ni/TDM_controller.vhd:198:26  */
  assign n110_o = n109_o ? 1'b1 : 1'b0;
  /* ni/TDM_controller.vhd:201:46  */
  assign n113_o = stbl_idx_inc == stbl_maxp1;
  /* ni/TDM_controller.vhd:201:69  */
  assign n114_o = run != run_reg;
  /* ni/TDM_controller.vhd:201:60  */
  assign n115_o = n113_o | n114_o;
  /* ni/TDM_controller.vhd:201:82  */
  assign n116_o = n115_o & run;
  /* ni/TDM_controller.vhd:201:25  */
  assign n117_o = n116_o ? 1'b1 : 1'b0;
  /* ni/TDM_controller.vhd:205:41  */
  assign n119_o = stbl_idx_reset & stbl_idx_en_sig;
  /* ni/TDM_controller.vhd:208:53  */
  assign n120_o = ~stbl_idx_reset;
  /* ni/TDM_controller.vhd:208:33  */
  assign n121_o = n120_o ? stbl_idx_inc : stbl_min;
  /* ni/TDM_controller.vhd:220:7  */
  assign n125_o = reset ? 1'b0 : config_slv_error_next;
  /* ni/TDM_controller.vhd:220:7  */
  assign n127_o = reset ? 32'b00000000000000000000000000000000 : read_next;
  /* ni/TDM_controller.vhd:220:7  */
  assign n129_o = reset ? 1'b1 : stbl_idx_en_sig;
  /* ni/TDM_controller.vhd:220:7  */
  assign n130_o = reset ? run_reg : run;
  /* ni/TDM_controller.vhd:219:5  */
  always @(posedge clk)
    n137_q <= n125_o;
  /* ni/TDM_controller.vhd:219:5  */
  always @(posedge clk)
    n138_q <= n127_o;
  /* ni/TDM_controller.vhd:219:5  */
  always @(posedge clk)
    n139_q <= n129_o;
  /* ni/TDM_controller.vhd:219:5  */
  always @(posedge clk)
    n140_q <= n130_o;
  /* ni/TDM_controller.vhd:336:40  */
  assign n149_o = mc_p_cnt_reg + 2'b01;
  /* ni/TDM_controller.vhd:335:9  */
  assign n150_o = period_boundary_sig ? n149_o : mc_p_cnt_reg;
  /* ni/TDM_controller.vhd:332:7  */
  assign n152_o = reset ? 2'b00 : n150_o;
  /* ni/TDM_controller.vhd:331:5  */
  always @(posedge clk)
    n155_q <= n152_o;
  /* ni/TDM_controller.vhd:354:42  */
  assign n159_o = time2next_reg - 4'b0001;
  /* ni/TDM_controller.vhd:351:9  */
  assign n160_o = t2n_ld_reg ? t2n : n159_o;
  /* ni/TDM_controller.vhd:348:7  */
  assign n162_o = reset ? 4'b0000 : n160_o;
  /* ni/TDM_controller.vhd:347:5  */
  always @(posedge clk)
    n165_q <= n162_o;
  /* ni/TDM_controller.vhd:369:9  */
  assign n168_o = stbl_idx_en_sig ? stbl_idx_next : stbl_idx_reg;
  /* ni/TDM_controller.vhd:365:7  */
  assign n170_o = reset ? 8'b00000000 : n168_o;
  /* ni/TDM_controller.vhd:364:5  */
  always @(posedge clk)
    n173_q <= n170_o;
  /* ni/TDM_controller.vhd:364:5  */
  assign n174_o = {n137_q, read_reg};
endmodule

