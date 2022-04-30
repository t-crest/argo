module TDM_controller_s
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
  wire run_reg;
  localparam n9_o = 1'b0;
  wire n14_o;
  wire n15_o;
  wire n16_o;
  wire n17_o;
  wire [10:0] n18_o;
  wire [30:0] n19_o;
  wire n21_o;
  wire n23_o;
  wire n25_o;
  wire n27_o;
  localparam [31:0] n28_o = 32'b00000000000000000000000000000000;
  wire [30:0] n29_o;
  wire n31_o;
  wire [4:0] n32_o;
  wire n33_o;
  wire n34_o;
  wire n35_o;
  wire n36_o;
  wire n37_o;
  reg n38_o;
  wire [8:0] n39_o;
  wire [8:0] n40_o;
  wire [8:0] n41_o;
  wire [8:0] n42_o;
  wire [8:0] n43_o;
  wire [8:0] n44_o;
  reg [8:0] n45_o;
  wire [21:0] n46_o;
  wire [21:0] n47_o;
  wire [21:0] n48_o;
  wire [21:0] n49_o;
  wire [21:0] n50_o;
  reg [21:0] n51_o;
  reg n57_o;
  wire [10:0] n58_o;
  wire [30:0] n59_o;
  wire n61_o;
  reg n64_o;
  wire [31:0] n65_o;
  wire [31:0] n66_o;
  wire n69_o;
  wire n70_o;
  wire n75_o;
  wire [7:0] n79_o;
  wire n82_o;
  wire n84_o;
  wire [4:0] n85_o;
  wire n87_o;
  wire n88_o;
  wire n90_o;
  wire n91_o;
  wire n92_o;
  wire n93_o;
  wire n94_o;
  wire n95_o;
  wire n96_o;
  wire n99_o;
  wire n100_o;
  wire n101_o;
  wire n102_o;
  wire n103_o;
  wire n105_o;
  wire n106_o;
  wire [7:0] n107_o;
  wire n111_o;
  wire [31:0] n113_o;
  wire n115_o;
  wire n116_o;
  reg n123_q;
  reg [31:0] n124_q;
  reg n125_q;
  reg n126_q;
  wire [1:0] n135_o;
  wire [1:0] n136_o;
  wire [1:0] n138_o;
  reg [1:0] n141_q;
  wire [3:0] n145_o;
  wire [3:0] n146_o;
  wire [3:0] n148_o;
  reg [3:0] n151_q;
  wire [7:0] n154_o;
  wire [7:0] n156_o;
  reg [7:0] n159_q;
  wire [32:0] n161_o;
  assign master_run = n9_o;
  assign config_slv_rdata = n3_o;
  assign config_slv_error = n4_o;
  assign stbl_idx = stbl_idx_next;
  assign stbl_idx_en = stbl_idx_en_sig;
  assign period_boundary = period_boundary_sig;
  assign mc_p_cnt = mc_p_cnt_reg;
  assign n1_o = {config_wdata, config_wr, config_en, config_addr};
  assign n3_o = n161_o[31:0];
  assign n4_o = n161_o[32];
  /* ni/TDM_controller_s.vhd:84:10  */
  assign tdm_s_cnt_reg = 10'b0000000000; // (signal)
  /* ni/TDM_controller_s.vhd:85:10  */
  assign tdm_p_cnt_reg = 32'b00000000000000000000000000000000; // (signal)
  /* ni/TDM_controller_s.vhd:87:10  */
  assign stbl_idx_reg = n159_q; // (signal)
  /* ni/TDM_controller_s.vhd:88:10  */
  assign stbl_idx_next = n107_o; // (signal)
  /* ni/TDM_controller_s.vhd:89:10  */
  assign time2next_reg = n151_q; // (signal)
  /* ni/TDM_controller_s.vhd:165:42  */
  assign clock_cnt_lo_reg = 32'b00000000000000000000000000000000; // (signal)
  /* ni/TDM_controller_s.vhd:95:10  */
  assign mc_p_cnt_reg = n141_q; // (signal)
  /* ni/TDM_controller_s.vhd:105:10  */
  assign read_reg = n124_q; // (signal)
  /* ni/TDM_controller_s.vhd:105:20  */
  assign read_next = n66_o; // (signal)
  /* ni/TDM_controller_s.vhd:106:10  */
  assign clock_delay_reg = 32'b00000000000000000000000000000000; // (signal)
  /* ni/TDM_controller_s.vhd:108:10  */
  assign period_boundary_sig = n105_o; // (signal)
  /* ni/TDM_controller_s.vhd:109:10  */
  assign stbl_idx_reset = n103_o; // (signal)
  /* ni/TDM_controller_s.vhd:109:26  */
  assign stbl_idx_en_sig = n96_o; // (signal)
  /* ni/TDM_controller_s.vhd:109:43  */
  assign t2n_ld_reg = n125_q; // (signal)
  /* ni/TDM_controller_s.vhd:110:10  */
  assign stbl_idx_inc = n79_o; // (signal)
  /* ni/TDM_controller_s.vhd:112:10  */
  assign config_slv_error_next = n75_o; // (signal)
  /* ni/TDM_controller_s.vhd:117:10  */
  assign run_reg = n126_q; // (signal)
  /* ni/TDM_controller_s.vhd:154:30  */
  assign n14_o = n1_o[14];
  /* ni/TDM_controller_s.vhd:154:19  */
  assign n15_o = sel & n14_o;
  /* ni/TDM_controller_s.vhd:156:17  */
  assign n16_o = n1_o[15];
  /* ni/TDM_controller_s.vhd:156:20  */
  assign n17_o = ~n16_o;
  /* ni/TDM_controller_s.vhd:157:37  */
  assign n18_o = n1_o[10:0];
  /* ni/TDM_controller_s.vhd:157:15  */
  assign n19_o = {20'b0, n18_o};  //  uext
  /* ni/TDM_controller_s.vhd:158:11  */
  assign n21_o = n19_o == 31'b0000000000000000000000000000000;
  /* ni/TDM_controller_s.vhd:160:11  */
  assign n23_o = n19_o == 31'b0000000000000000000000000000001;
  /* ni/TDM_controller_s.vhd:162:11  */
  assign n25_o = n19_o == 31'b0000000000000000000000000000010;
  /* ni/TDM_controller_s.vhd:164:11  */
  assign n27_o = n19_o == 31'b0000000000000000000000000000011;
  assign n29_o = n28_o[31:1];
  /* ni/TDM_controller_s.vhd:167:11  */
  assign n31_o = n19_o == 31'b0000000000000000000000000000100;
  assign n32_o = {n31_o, n27_o, n25_o, n23_o, n21_o};
  assign n33_o = tdm_s_cnt_reg[0];
  assign n34_o = tdm_p_cnt_reg[0];
  assign n35_o = clock_delay_reg[0];
  assign n36_o = clock_cnt_lo_reg[0];
  assign n37_o = tdm_p_cnt_reg[0];
  /* ni/TDM_controller_s.vhd:157:9  */
  always @*
    case (n32_o)
      5'b10000: n38_o <= run;
      5'b01000: n38_o <= n36_o;
      5'b00100: n38_o <= n35_o;
      5'b00010: n38_o <= n34_o;
      5'b00001: n38_o <= n33_o;
      default: n38_o <= n37_o;
    endcase
  assign n39_o = tdm_s_cnt_reg[9:1];
  assign n40_o = tdm_p_cnt_reg[9:1];
  assign n41_o = clock_delay_reg[9:1];
  assign n42_o = clock_cnt_lo_reg[9:1];
  assign n43_o = n29_o[8:0];
  assign n44_o = tdm_p_cnt_reg[9:1];
  /* ni/TDM_controller_s.vhd:157:9  */
  always @*
    case (n32_o)
      5'b10000: n45_o <= n43_o;
      5'b01000: n45_o <= n42_o;
      5'b00100: n45_o <= n41_o;
      5'b00010: n45_o <= n40_o;
      5'b00001: n45_o <= n39_o;
      default: n45_o <= n44_o;
    endcase
  assign n46_o = tdm_p_cnt_reg[31:10];
  assign n47_o = clock_delay_reg[31:10];
  assign n48_o = clock_cnt_lo_reg[31:10];
  assign n49_o = n29_o[30:9];
  assign n50_o = tdm_p_cnt_reg[31:10];
  /* ni/TDM_controller_s.vhd:157:9  */
  always @*
    case (n32_o)
      5'b10000: n51_o <= n49_o;
      5'b01000: n51_o <= n48_o;
      5'b00100: n51_o <= n47_o;
      5'b00010: n51_o <= n46_o;
      5'b00001: n51_o <= n50_o;
      default: n51_o <= n50_o;
    endcase
  /* ni/TDM_controller_s.vhd:157:9  */
  always @*
    case (n32_o)
      5'b10000: n57_o <= 1'b0;
      5'b01000: n57_o <= 1'b0;
      5'b00100: n57_o <= 1'b0;
      5'b00010: n57_o <= 1'b0;
      5'b00001: n57_o <= 1'b0;
      default: n57_o <= 1'b1;
    endcase
  /* ni/TDM_controller_s.vhd:174:37  */
  assign n58_o = n1_o[10:0];
  /* ni/TDM_controller_s.vhd:174:15  */
  assign n59_o = {20'b0, n58_o};  //  uext
  /* ni/TDM_controller_s.vhd:175:11  */
  assign n61_o = n59_o == 31'b0000000000000000000000000000100;
  /* ni/TDM_controller_s.vhd:174:9  */
  always @*
    case (n61_o)
      1'b1: n64_o <= 1'b0;
      default: n64_o <= 1'b1;
    endcase
  assign n65_o = {n51_o, n45_o, n38_o};
  /* ni/TDM_controller_s.vhd:154:5  */
  assign n66_o = n70_o ? n65_o : tdm_p_cnt_reg;
  /* ni/TDM_controller_s.vhd:156:7  */
  assign n69_o = n17_o ? n57_o : n64_o;
  /* ni/TDM_controller_s.vhd:154:5  */
  assign n70_o = n15_o & n17_o;
  /* ni/TDM_controller_s.vhd:154:5  */
  assign n75_o = n15_o ? n69_o : 1'b0;
  /* ni/TDM_controller_s.vhd:194:32  */
  assign n79_o = stbl_idx_reg + 8'b00000001;
  /* ni/TDM_controller_s.vhd:198:49  */
  assign n82_o = time2next_reg == 4'b0001;
  /* ni/TDM_controller_s.vhd:198:74  */
  assign n84_o = time2next_reg == 4'b0000;
  /* ni/TDM_controller_s.vhd:198:97  */
  assign n85_o = {1'b0, time2next_reg};  //  uext
  /* ni/TDM_controller_s.vhd:198:97  */
  assign n87_o = n85_o == 5'b11111;
  /* ni/TDM_controller_s.vhd:198:79  */
  assign n88_o = n84_o | n87_o;
  /* ni/TDM_controller_s.vhd:198:118  */
  assign n90_o = t2n == 4'b0000;
  /* ni/TDM_controller_s.vhd:198:109  */
  assign n91_o = n88_o & n90_o;
  /* ni/TDM_controller_s.vhd:198:54  */
  assign n92_o = n82_o | n91_o;
  /* ni/TDM_controller_s.vhd:198:134  */
  assign n93_o = run != run_reg;
  /* ni/TDM_controller_s.vhd:198:125  */
  assign n94_o = n92_o | n93_o;
  /* ni/TDM_controller_s.vhd:198:147  */
  assign n95_o = n94_o & run;
  /* ni/TDM_controller_s.vhd:198:26  */
  assign n96_o = n95_o ? 1'b1 : 1'b0;
  /* ni/TDM_controller_s.vhd:201:46  */
  assign n99_o = stbl_idx_inc == stbl_maxp1;
  /* ni/TDM_controller_s.vhd:201:69  */
  assign n100_o = run != run_reg;
  /* ni/TDM_controller_s.vhd:201:60  */
  assign n101_o = n99_o | n100_o;
  /* ni/TDM_controller_s.vhd:201:82  */
  assign n102_o = n101_o & run;
  /* ni/TDM_controller_s.vhd:201:25  */
  assign n103_o = n102_o ? 1'b1 : 1'b0;
  /* ni/TDM_controller_s.vhd:205:41  */
  assign n105_o = stbl_idx_reset & stbl_idx_en_sig;
  /* ni/TDM_controller_s.vhd:208:53  */
  assign n106_o = ~stbl_idx_reset;
  /* ni/TDM_controller_s.vhd:208:33  */
  assign n107_o = n106_o ? stbl_idx_inc : stbl_min;
  /* ni/TDM_controller_s.vhd:220:7  */
  assign n111_o = reset ? 1'b0 : config_slv_error_next;
  /* ni/TDM_controller_s.vhd:220:7  */
  assign n113_o = reset ? 32'b00000000000000000000000000000000 : read_next;
  /* ni/TDM_controller_s.vhd:220:7  */
  assign n115_o = reset ? 1'b1 : stbl_idx_en_sig;
  /* ni/TDM_controller_s.vhd:220:7  */
  assign n116_o = reset ? run_reg : run;
  /* ni/TDM_controller_s.vhd:219:5  */
  always @(posedge clk)
    n123_q <= n111_o;
  /* ni/TDM_controller_s.vhd:219:5  */
  always @(posedge clk)
    n124_q <= n113_o;
  /* ni/TDM_controller_s.vhd:219:5  */
  always @(posedge clk)
    n125_q <= n115_o;
  /* ni/TDM_controller_s.vhd:219:5  */
  always @(posedge clk)
    n126_q <= n116_o;
  /* ni/TDM_controller_s.vhd:336:40  */
  assign n135_o = mc_p_cnt_reg + 2'b01;
  /* ni/TDM_controller_s.vhd:335:9  */
  assign n136_o = period_boundary_sig ? n135_o : mc_p_cnt_reg;
  /* ni/TDM_controller_s.vhd:332:7  */
  assign n138_o = reset ? 2'b00 : n136_o;
  /* ni/TDM_controller_s.vhd:331:5  */
  always @(posedge clk)
    n141_q <= n138_o;
  /* ni/TDM_controller_s.vhd:354:42  */
  assign n145_o = time2next_reg - 4'b0001;
  /* ni/TDM_controller_s.vhd:351:9  */
  assign n146_o = t2n_ld_reg ? t2n : n145_o;
  /* ni/TDM_controller_s.vhd:348:7  */
  assign n148_o = reset ? 4'b0000 : n146_o;
  /* ni/TDM_controller_s.vhd:347:5  */
  always @(posedge clk)
    n151_q <= n148_o;
  /* ni/TDM_controller_s.vhd:369:9  */
  assign n154_o = stbl_idx_en_sig ? stbl_idx_next : stbl_idx_reg;
  /* ni/TDM_controller_s.vhd:365:7  */
  assign n156_o = reset ? 8'b00000000 : n154_o;
  /* ni/TDM_controller_s.vhd:364:5  */
  always @(posedge clk)
    n159_q <= n156_o;
  assign n161_o = {n123_q, read_reg};
endmodule

