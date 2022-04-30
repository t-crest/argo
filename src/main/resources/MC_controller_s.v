module MC_controller_s
  (input  clk,
   input  reset,
   input  run,
   input  [13:0] config_addr,
   input  config_en,
   input  config_wr,
   input  [31:0] config_wdata,
   input  sel,
   input  period_boundary,
   input  [1:0] mc_p_cnt,
   output [31:0] config_slv_rdata,
   output config_slv_error,
   output [7:0] stbl_min,
   output [7:0] stbl_maxp1,
   output mc,
   output [1:0] mc_idx,
   output [1:0] mc_p);
  wire [47:0] n0_o;
  wire [31:0] n2_o;
  wire n3_o;
  wire [7:0] stbl_min_next;
  wire [7:0] stbl_maxp1_next;
  wire [1:0] mode_change_idx_reg;
  wire [1:0] mode_change_idx_next;
  wire [1:0] mode_idx_reg;
  wire [1:0] mode_change_cnt_reg;
  wire [1:0] mode_change_cnt_next;
  wire [1:0] mode_change_cnt_int;
  wire [63:0] mode_reg;
  wire [63:0] mode_next;
  wire global_mode_change_idx;
  wire local_mode_change_idx;
  wire config_slv_error_next;
  wire [31:0] read_reg;
  wire [31:0] read_next;
  wire mode_changed_reg;
  wire [7:0] stbl_min_reg;
  wire [10:0] mc_tbl_addr;
  wire [10:0] n12_o;
  wire [10:0] n14_o;
  wire n15_o;
  wire n16_o;
  wire n17_o;
  wire n18_o;
  wire [10:0] n19_o;
  wire n21_o;
  reg n24_o;
  wire [1:0] n25_o;
  reg [1:0] n26_o;
  wire [10:0] n27_o;
  wire [1:0] n28_o;
  wire n30_o;
  reg [1:0] n31_o;
  reg [1:0] n32_o;
  reg n35_o;
  reg n38_o;
  wire n40_o;
  wire [1:0] n42_o;
  wire [7:0] n44_o;
  wire [1:0] n47_o;
  wire [7:0] n49_o;
  wire [63:0] n51_o;
  wire n53_o;
  wire [1:0] n54_o;
  wire [1:0] n55_o;
  wire [63:0] n56_o;
  wire n58_o;
  wire n59_o;
  wire [1:0] n60_o;
  wire [1:0] n61_o;
  wire [1:0] n62_o;
  wire [1:0] n63_o;
  wire [63:0] n64_o;
  wire n66_o;
  wire n69_o;
  wire n72_o;
  wire [29:0] n73_o;
  localparam n75_o = 1'b0;
  localparam [1:0] n76_o = 2'b00;
  wire [1:0] n77_o;
  localparam [1:0] n78_o = 2'b00;
  wire n82_o;
  wire n84_o;
  wire n86_o;
  reg n89_q;
  wire n91_o;
  wire n94_o;
  wire n96_o;
  wire [7:0] n102_o;
  wire [7:0] n106_o;
  wire [7:0] n108_o;
  wire n113_o;
  wire [1:0] n117_o;
  wire [31:0] n119_o;
  reg n129_q;
  reg [1:0] n131_q;
  reg [31:0] n132_q;
  wire [63:0] n137_o;
  reg [63:0] n140_q;
  wire [1:0] n143_o;
  wire [1:0] n145_o;
  reg [1:0] n148_q;
  wire [1:0] n151_o;
  wire [1:0] n153_o;
  reg [1:0] n156_q;
  wire [7:0] n159_o;
  wire [7:0] n162_o;
  reg [7:0] n168_q;
  wire [7:0] n172_o;
  wire [7:0] n174_o;
  reg [7:0] n177_q;
  wire [31:0] n179_o;
  wire [32:0] n181_o;
  wire n182_o;
  wire n183_o;
  wire n184_o;
  wire n185_o;
  wire n186_o;
  wire n187_o;
  wire n188_o;
  wire n189_o;
  wire [7:0] n190_o;
  wire [7:0] n191_o;
  wire [7:0] n192_o;
  wire [7:0] n193_o;
  wire [7:0] n194_o;
  wire [7:0] n195_o;
  wire [7:0] n196_o;
  wire [7:0] n197_o;
  wire [7:0] n198_o;
  wire [7:0] n199_o;
  wire [7:0] n200_o;
  wire [7:0] n201_o;
  wire [63:0] n202_o;
  wire n203_o;
  wire n204_o;
  wire n205_o;
  wire n206_o;
  wire n207_o;
  wire n208_o;
  wire n209_o;
  wire n210_o;
  wire [7:0] n211_o;
  wire [7:0] n212_o;
  wire [7:0] n213_o;
  wire [7:0] n214_o;
  wire [7:0] n215_o;
  wire [7:0] n216_o;
  wire [7:0] n217_o;
  wire [7:0] n218_o;
  wire [7:0] n219_o;
  wire [7:0] n220_o;
  wire [7:0] n221_o;
  wire [7:0] n222_o;
  wire [63:0] n223_o;
  wire [15:0] n224_o;
  wire [15:0] n225_o;
  wire [15:0] n226_o;
  wire [15:0] n227_o;
  wire [1:0] n228_o;
  reg [15:0] n229_o;
  wire [15:0] n230_o;
  wire [15:0] n231_o;
  wire [15:0] n232_o;
  wire [15:0] n233_o;
  wire [1:0] n234_o;
  reg [15:0] n235_o;
  assign config_slv_rdata = n2_o;
  assign config_slv_error = n3_o;
  assign stbl_min = n108_o;
  assign stbl_maxp1 = n177_q;
  assign mc = n75_o;
  assign mc_idx = n76_o;
  assign mc_p = n78_o;
  assign n0_o = {config_wdata, config_wr, config_en, config_addr};
  assign n2_o = n181_o[31:0];
  assign n3_o = n181_o[32];
  /* ni/MC_controller_s.vhd:86:10  */
  assign stbl_min_next = n102_o; // (signal)
  /* ni/MC_controller_s.vhd:86:25  */
  assign stbl_maxp1_next = n106_o; // (signal)
  /* ni/MC_controller_s.vhd:87:10  */
  assign mode_change_idx_reg = n148_q; // (signal)
  /* ni/MC_controller_s.vhd:87:31  */
  assign mode_change_idx_next = n62_o; // (signal)
  /* ni/MC_controller_s.vhd:88:10  */
  assign mode_idx_reg = n156_q; // (signal)
  /* ni/MC_controller_s.vhd:90:10  */
  assign mode_change_cnt_reg = n131_q; // (signal)
  /* ni/MC_controller_s.vhd:90:31  */
  assign mode_change_cnt_next = n63_o; // (signal)
  /* ni/MC_controller_s.vhd:90:53  */
  assign mode_change_cnt_int = n77_o; // (signal)
  /* ni/MC_controller_s.vhd:92:10  */
  assign mode_reg = n140_q; // (signal)
  /* ni/MC_controller_s.vhd:92:20  */
  assign mode_next = n64_o; // (signal)
  /* ni/MC_controller_s.vhd:94:10  */
  assign global_mode_change_idx = n96_o; // (signal)
  /* ni/MC_controller_s.vhd:94:34  */
  assign local_mode_change_idx = n66_o; // (signal)
  /* ni/MC_controller_s.vhd:96:10  */
  assign config_slv_error_next = n69_o; // (signal)
  /* ni/MC_controller_s.vhd:98:10  */
  assign read_reg = n132_q; // (signal)
  /* ni/MC_controller_s.vhd:98:20  */
  assign read_next = n179_o; // (signal)
  /* ni/MC_controller_s.vhd:100:27  */
  assign mode_changed_reg = n89_q; // (signal)
  /* ni/MC_controller_s.vhd:101:10  */
  assign stbl_min_reg = n168_q; // (signal)
  /* ni/MC_controller_s.vhd:103:10  */
  assign mc_tbl_addr = n14_o; // (signal)
  /* ni/MC_controller_s.vhd:124:31  */
  assign n12_o = n0_o[10:0];
  /* ni/MC_controller_s.vhd:124:60  */
  assign n14_o = n12_o - 11'b00000000010;
  /* ni/MC_controller_s.vhd:126:30  */
  assign n15_o = n0_o[14];
  /* ni/MC_controller_s.vhd:126:19  */
  assign n16_o = sel & n15_o;
  /* ni/MC_controller_s.vhd:128:17  */
  assign n17_o = n0_o[15];
  /* ni/MC_controller_s.vhd:128:20  */
  assign n18_o = ~n17_o;
  /* ni/MC_controller_s.vhd:129:26  */
  assign n19_o = n0_o[10:0];
  /* ni/MC_controller_s.vhd:131:11  */
  assign n21_o = n19_o == 11'b00000000000;
  /* ni/MC_controller_s.vhd:129:9  */
  always @*
    case (n21_o)
      1'b1: n24_o <= 1'b0;
      default: n24_o <= 1'b1;
    endcase
  assign n25_o = read_reg[1:0];
  /* ni/MC_controller_s.vhd:129:9  */
  always @*
    case (n21_o)
      1'b1: n26_o <= mode_idx_reg;
      default: n26_o <= n25_o;
    endcase
  /* ni/MC_controller_s.vhd:144:26  */
  assign n27_o = n0_o[10:0];
  /* ni/MC_controller_s.vhd:147:58  */
  assign n28_o = n0_o[17:16];
  /* ni/MC_controller_s.vhd:146:11  */
  assign n30_o = n27_o == 11'b00000000000;
  /* ni/MC_controller_s.vhd:144:9  */
  always @*
    case (n30_o)
      1'b1: n31_o <= n28_o;
      default: n31_o <= mode_change_idx_reg;
    endcase
  /* ni/MC_controller_s.vhd:144:9  */
  always @*
    case (n30_o)
      1'b1: n32_o <= mode_change_cnt_int;
      default: n32_o <= mode_change_cnt_reg;
    endcase
  /* ni/MC_controller_s.vhd:144:9  */
  always @*
    case (n30_o)
      1'b1: n35_o <= 1'b1;
      default: n35_o <= 1'b0;
    endcase
  /* ni/MC_controller_s.vhd:144:9  */
  always @*
    case (n30_o)
      1'b1: n38_o <= 1'b0;
      default: n38_o <= 1'b1;
    endcase
  /* ni/MC_controller_s.vhd:158:24  */
  assign n40_o = $unsigned(mc_tbl_addr) < $unsigned(11'b00000000100);
  /* ni/MC_controller_s.vhd:160:22  */
  assign n42_o = mc_tbl_addr[1:0];  // trunc
  /* ni/MC_controller_s.vhd:160:76  */
  assign n44_o = n0_o[23:16];
  /* ni/MC_controller_s.vhd:161:22  */
  assign n47_o = mc_tbl_addr[1:0];  // trunc
  /* ni/MC_controller_s.vhd:161:76  */
  assign n49_o = n0_o[39:32];
  /* ni/MC_controller_s.vhd:158:9  */
  assign n51_o = n40_o ? n223_o : mode_reg;
  /* ni/MC_controller_s.vhd:158:9  */
  assign n53_o = n40_o ? 1'b0 : n38_o;
  /* ni/MC_controller_s.vhd:128:7  */
  assign n54_o = n18_o ? mode_change_idx_reg : n31_o;
  /* ni/MC_controller_s.vhd:128:7  */
  assign n55_o = n18_o ? mode_change_cnt_reg : n32_o;
  /* ni/MC_controller_s.vhd:128:7  */
  assign n56_o = n18_o ? mode_reg : n51_o;
  /* ni/MC_controller_s.vhd:128:7  */
  assign n58_o = n18_o ? 1'b0 : n35_o;
  /* ni/MC_controller_s.vhd:128:7  */
  assign n59_o = n18_o ? n24_o : n53_o;
  assign n60_o = read_reg[1:0];
  /* ni/MC_controller_s.vhd:126:5  */
  assign n61_o = n72_o ? n26_o : n60_o;
  /* ni/MC_controller_s.vhd:126:5  */
  assign n62_o = n16_o ? n54_o : mode_change_idx_reg;
  /* ni/MC_controller_s.vhd:126:5  */
  assign n63_o = n16_o ? n55_o : mode_change_cnt_reg;
  /* ni/MC_controller_s.vhd:126:5  */
  assign n64_o = n16_o ? n56_o : mode_reg;
  /* ni/MC_controller_s.vhd:126:5  */
  assign n66_o = n16_o ? n58_o : 1'b0;
  /* ni/MC_controller_s.vhd:126:5  */
  assign n69_o = n16_o ? n59_o : 1'b0;
  /* ni/MC_controller_s.vhd:126:5  */
  assign n72_o = n16_o & n18_o;
  assign n73_o = read_reg[31:2];
  /* ni/MC_controller_s.vhd:212:49  */
  assign n77_o = n0_o[33:32];
  /* ni/MC_controller_s.vhd:223:11  */
  assign n82_o = global_mode_change_idx ? 1'b0 : mode_changed_reg;
  /* ni/MC_controller_s.vhd:221:11  */
  assign n84_o = local_mode_change_idx ? 1'b1 : n82_o;
  /* ni/MC_controller_s.vhd:218:9  */
  assign n86_o = reset ? 1'b0 : n84_o;
  /* ni/MC_controller_s.vhd:217:7  */
  always @(posedge clk)
    n89_q <= n86_o;
  /* ni/MC_controller_s.vhd:235:32  */
  assign n91_o = mode_change_cnt_reg == mc_p_cnt;
  /* ni/MC_controller_s.vhd:235:9  */
  assign n94_o = n91_o ? 1'b1 : 1'b0;
  /* ni/MC_controller_s.vhd:234:7  */
  assign n96_o = mode_changed_reg ? n94_o : 1'b0;
  /* ni/MC_controller_s.vhd:257:57  */
  assign n102_o = n229_o[7:0];
  /* ni/MC_controller_s.vhd:258:59  */
  assign n106_o = n235_o[15:8];
  /* ni/MC_controller_s.vhd:268:5  */
  assign n108_o = period_boundary ? stbl_min_next : stbl_min_reg;
  /* ni/MC_controller_s.vhd:281:7  */
  assign n113_o = reset ? 1'b0 : config_slv_error_next;
  /* ni/MC_controller_s.vhd:281:7  */
  assign n117_o = reset ? 2'b00 : mode_change_cnt_next;
  /* ni/MC_controller_s.vhd:281:7  */
  assign n119_o = reset ? 32'b00000000000000000000000000000000 : read_next;
  /* ni/MC_controller_s.vhd:280:5  */
  always @(posedge clk)
    n129_q <= n113_o;
  /* ni/MC_controller_s.vhd:280:5  */
  always @(posedge clk)
    n131_q <= n117_o;
  /* ni/MC_controller_s.vhd:280:5  */
  always @(posedge clk)
    n132_q <= n119_o;
  /* ni/MC_controller_s.vhd:302:7  */
  assign n137_o = reset ? 64'b0000000000000000000000000000000000000000000000000000000000000000 : mode_next;
  /* ni/MC_controller_s.vhd:301:5  */
  always @(posedge clk)
    n140_q <= n137_o;
  /* ni/MC_controller_s.vhd:324:9  */
  assign n143_o = local_mode_change_idx ? mode_change_idx_next : mode_change_idx_reg;
  /* ni/MC_controller_s.vhd:321:7  */
  assign n145_o = reset ? 2'b00 : n143_o;
  /* ni/MC_controller_s.vhd:320:5  */
  always @(posedge clk)
    n148_q <= n145_o;
  /* ni/MC_controller_s.vhd:338:9  */
  assign n151_o = global_mode_change_idx ? mode_change_idx_reg : mode_idx_reg;
  /* ni/MC_controller_s.vhd:335:7  */
  assign n153_o = reset ? 2'b00 : n151_o;
  /* ni/MC_controller_s.vhd:334:5  */
  always @(posedge clk)
    n156_q <= n153_o;
  /* ni/MC_controller_s.vhd:354:9  */
  assign n159_o = period_boundary ? stbl_min_next : stbl_min_reg;
  /* ni/MC_controller_s.vhd:350:7  */
  assign n162_o = reset ? 8'b00000000 : n159_o;
  /* ni/MC_controller_s.vhd:349:5  */
  always @(posedge clk)
    n168_q <= n162_o;
  /* ni/MC_controller_s.vhd:373:9  */
  assign n172_o = period_boundary ? stbl_maxp1_next : n177_q;
  /* ni/MC_controller_s.vhd:370:7  */
  assign n174_o = reset ? 8'b00000000 : n172_o;
  /* ni/MC_controller_s.vhd:369:5  */
  always @(posedge clk)
    n177_q <= n174_o;
  assign n179_o = {n73_o, n61_o};
  assign n181_o = {n129_q, read_reg};
  /* ni/MC_controller_s.vhd:160:13  */
  assign n182_o = n42_o[1];
  /* ni/MC_controller_s.vhd:160:13  */
  assign n183_o = ~n182_o;
  /* ni/MC_controller_s.vhd:160:13  */
  assign n184_o = n42_o[0];
  /* ni/MC_controller_s.vhd:160:13  */
  assign n185_o = ~n184_o;
  /* ni/MC_controller_s.vhd:160:13  */
  assign n186_o = n183_o & n185_o;
  /* ni/MC_controller_s.vhd:160:13  */
  assign n187_o = n183_o & n184_o;
  /* ni/MC_controller_s.vhd:160:13  */
  assign n188_o = n182_o & n185_o;
  /* ni/MC_controller_s.vhd:160:13  */
  assign n189_o = n182_o & n184_o;
  assign n190_o = mode_reg[7:0];
  /* ni/MC_controller_s.vhd:160:13  */
  assign n191_o = n186_o ? n44_o : n190_o;
  /* ni/MC_controller_s.vhd:349:5  */
  assign n192_o = mode_reg[15:8];
  assign n193_o = mode_reg[23:16];
  /* ni/MC_controller_s.vhd:160:13  */
  assign n194_o = n187_o ? n44_o : n193_o;
  assign n195_o = mode_reg[31:24];
  /* ni/MC_controller_s.vhd:354:9  */
  assign n196_o = mode_reg[39:32];
  /* ni/MC_controller_s.vhd:160:13  */
  assign n197_o = n188_o ? n44_o : n196_o;
  assign n198_o = mode_reg[47:40];
  /* ni/MC_controller_s.vhd:332:3  */
  assign n199_o = mode_reg[55:48];
  /* ni/MC_controller_s.vhd:160:13  */
  assign n200_o = n189_o ? n44_o : n199_o;
  /* ni/MC_controller_s.vhd:318:3  */
  assign n201_o = mode_reg[63:56];
  assign n202_o = {n201_o, n200_o, n198_o, n197_o, n195_o, n194_o, n192_o, n191_o};
  /* ni/MC_controller_s.vhd:161:13  */
  assign n203_o = n47_o[1];
  /* ni/MC_controller_s.vhd:161:13  */
  assign n204_o = ~n203_o;
  /* ni/MC_controller_s.vhd:161:13  */
  assign n205_o = n47_o[0];
  /* ni/MC_controller_s.vhd:161:13  */
  assign n206_o = ~n205_o;
  /* ni/MC_controller_s.vhd:161:13  */
  assign n207_o = n204_o & n206_o;
  /* ni/MC_controller_s.vhd:161:13  */
  assign n208_o = n204_o & n205_o;
  /* ni/MC_controller_s.vhd:161:13  */
  assign n209_o = n203_o & n206_o;
  /* ni/MC_controller_s.vhd:161:13  */
  assign n210_o = n203_o & n205_o;
  assign n211_o = n202_o[7:0];
  /* ni/MC_controller_s.vhd:281:7  */
  assign n212_o = n202_o[15:8];
  /* ni/MC_controller_s.vhd:161:13  */
  assign n213_o = n207_o ? n49_o : n212_o;
  /* ni/MC_controller_s.vhd:278:3  */
  assign n214_o = n202_o[23:16];
  assign n215_o = n202_o[31:24];
  /* ni/MC_controller_s.vhd:161:13  */
  assign n216_o = n208_o ? n49_o : n215_o;
  /* ni/MC_controller_s.vhd:258:33  */
  assign n217_o = n202_o[39:32];
  /* ni/MC_controller_s.vhd:257:31  */
  assign n218_o = n202_o[47:40];
  /* ni/MC_controller_s.vhd:161:13  */
  assign n219_o = n209_o ? n49_o : n218_o;
  assign n220_o = n202_o[55:48];
  /* ni/MC_controller_s.vhd:231:5  */
  assign n221_o = n202_o[63:56];
  /* ni/MC_controller_s.vhd:161:13  */
  assign n222_o = n210_o ? n49_o : n221_o;
  /* ni/MC_controller_s.vhd:215:5  */
  assign n223_o = {n222_o, n220_o, n219_o, n217_o, n216_o, n214_o, n213_o, n211_o};
  /* ni/MC_controller_s.vhd:161:23  */
  assign n224_o = mode_reg[15:0];
  /* ni/MC_controller_s.vhd:161:13  */
  assign n225_o = mode_reg[31:16];
  assign n226_o = mode_reg[47:32];
  assign n227_o = mode_reg[63:48];
  /* ni/MC_controller_s.vhd:257:30  */
  assign n228_o = mode_idx_reg[1:0];
  /* ni/MC_controller_s.vhd:257:30  */
  always @*
    case (n228_o)
      2'b00: n229_o <= n224_o;
      2'b01: n229_o <= n225_o;
      2'b10: n229_o <= n226_o;
      2'b11: n229_o <= n227_o;
    endcase
  /* ni/MC_controller_s.vhd:257:31  */
  assign n230_o = mode_reg[15:0];
  /* ni/MC_controller_s.vhd:257:30  */
  assign n231_o = mode_reg[31:16];
  /* ni/MC_controller_s.vhd:161:23  */
  assign n232_o = mode_reg[47:32];
  /* ni/MC_controller_s.vhd:160:23  */
  assign n233_o = mode_reg[63:48];
  /* ni/MC_controller_s.vhd:258:32  */
  assign n234_o = mode_idx_reg[1:0];
  /* ni/MC_controller_s.vhd:258:32  */
  always @*
    case (n234_o)
      2'b00: n235_o <= n230_o;
      2'b01: n235_o <= n231_o;
      2'b10: n235_o <= n232_o;
      2'b11: n235_o <= n233_o;
    endcase
endmodule

