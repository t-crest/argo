module MC_controller
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
  wire [1:0] state;
  wire [1:0] next_state;
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
  wire mc_reg;
  wire mc_next;
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
  wire n32_o;
  wire [1:0] n33_o;
  reg [1:0] n34_o;
  reg [1:0] n35_o;
  reg n38_o;
  reg n41_o;
  wire n43_o;
  wire [1:0] n45_o;
  wire [7:0] n47_o;
  wire [1:0] n50_o;
  wire [7:0] n52_o;
  wire [63:0] n54_o;
  wire n56_o;
  wire [1:0] n57_o;
  wire [1:0] n58_o;
  wire [63:0] n59_o;
  wire n61_o;
  wire n62_o;
  wire [1:0] n63_o;
  wire [1:0] n64_o;
  wire [1:0] n65_o;
  wire [1:0] n66_o;
  wire [63:0] n67_o;
  wire n69_o;
  wire n72_o;
  wire n75_o;
  wire [29:0] n76_o;
  wire [1:0] n79_o;
  wire n81_o;
  wire [1:0] n83_o;
  wire n85_o;
  wire [1:0] n87_o;
  wire n89_o;
  wire n91_o;
  wire [1:0] n93_o;
  wire n96_o;
  wire n98_o;
  wire n100_o;
  wire [2:0] n101_o;
  reg [1:0] n103_o;
  reg n106_o;
  reg n109_o;
  wire [7:0] n114_o;
  wire [7:0] n118_o;
  wire [7:0] n120_o;
  wire n125_o;
  wire [1:0] n127_o;
  wire [1:0] n129_o;
  wire [31:0] n131_o;
  wire n133_o;
  reg n141_q;
  reg [1:0] n142_q;
  reg [1:0] n143_q;
  reg [31:0] n144_q;
  reg n145_q;
  wire [63:0] n149_o;
  reg [63:0] n152_q;
  wire [1:0] n155_o;
  wire [1:0] n157_o;
  reg [1:0] n160_q;
  wire [1:0] n163_o;
  wire [1:0] n165_o;
  reg [1:0] n168_q;
  wire [7:0] n171_o;
  wire [7:0] n174_o;
  reg [7:0] n180_q;
  wire [7:0] n184_o;
  wire [7:0] n186_o;
  reg [7:0] n189_q;
  wire [31:0] n190_o;
  wire [32:0] n192_o;
  wire n193_o;
  wire n194_o;
  wire n195_o;
  wire n196_o;
  wire n197_o;
  wire n198_o;
  wire n199_o;
  wire n200_o;
  wire [7:0] n201_o;
  wire [7:0] n202_o;
  wire [7:0] n203_o;
  wire [7:0] n204_o;
  wire [7:0] n205_o;
  wire [7:0] n206_o;
  wire [7:0] n207_o;
  wire [7:0] n208_o;
  wire [7:0] n209_o;
  wire [7:0] n210_o;
  wire [7:0] n211_o;
  wire [7:0] n212_o;
  wire [63:0] n213_o;
  wire n214_o;
  wire n215_o;
  wire n216_o;
  wire n217_o;
  wire n218_o;
  wire n219_o;
  wire n220_o;
  wire n221_o;
  wire [7:0] n222_o;
  wire [7:0] n223_o;
  wire [7:0] n224_o;
  wire [7:0] n225_o;
  wire [7:0] n226_o;
  wire [7:0] n227_o;
  wire [7:0] n228_o;
  wire [7:0] n229_o;
  wire [7:0] n230_o;
  wire [7:0] n231_o;
  wire [7:0] n232_o;
  wire [7:0] n233_o;
  wire [63:0] n234_o;
  wire [15:0] n235_o;
  wire [15:0] n236_o;
  wire [15:0] n237_o;
  wire [15:0] n238_o;
  wire [1:0] n239_o;
  reg [15:0] n240_o;
  wire [15:0] n241_o;
  wire [15:0] n242_o;
  wire [15:0] n243_o;
  wire [15:0] n244_o;
  wire [1:0] n245_o;
  reg [15:0] n246_o;
  assign config_slv_rdata = n2_o;
  assign config_slv_error = n3_o;
  assign stbl_min = n120_o;
  assign stbl_maxp1 = n189_q;
  assign mc = mc_reg;
  assign mc_idx = mode_change_idx_reg;
  assign mc_p = mode_change_cnt_reg;
  assign n0_o = {config_wdata, config_wr, config_en, config_addr};
  assign n2_o = n192_o[31:0];
  assign n3_o = n192_o[32];
  /* ni/MC_controller.vhd:84:10  */
  assign state = n142_q; // (signal)
  /* ni/MC_controller.vhd:84:17  */
  assign next_state = n103_o; // (signal)
  /* ni/MC_controller.vhd:86:10  */
  assign stbl_min_next = n114_o; // (signal)
  /* ni/MC_controller.vhd:86:25  */
  assign stbl_maxp1_next = n118_o; // (signal)
  /* ni/MC_controller.vhd:87:10  */
  assign mode_change_idx_reg = n160_q; // (signal)
  /* ni/MC_controller.vhd:87:31  */
  assign mode_change_idx_next = n65_o; // (signal)
  /* ni/MC_controller.vhd:88:10  */
  assign mode_idx_reg = n168_q; // (signal)
  /* ni/MC_controller.vhd:90:10  */
  assign mode_change_cnt_reg = n143_q; // (signal)
  /* ni/MC_controller.vhd:90:31  */
  assign mode_change_cnt_next = n66_o; // (signal)
  /* ni/MC_controller.vhd:90:53  */
  assign mode_change_cnt_int = n79_o; // (signal)
  /* ni/MC_controller.vhd:92:10  */
  assign mode_reg = n152_q; // (signal)
  /* ni/MC_controller.vhd:92:20  */
  assign mode_next = n67_o; // (signal)
  /* ni/MC_controller.vhd:94:10  */
  assign global_mode_change_idx = n106_o; // (signal)
  /* ni/MC_controller.vhd:94:34  */
  assign local_mode_change_idx = n69_o; // (signal)
  /* ni/MC_controller.vhd:96:10  */
  assign config_slv_error_next = n72_o; // (signal)
  /* ni/MC_controller.vhd:98:10  */
  assign read_reg = n144_q; // (signal)
  /* ni/MC_controller.vhd:98:20  */
  assign read_next = n190_o; // (signal)
  /* ni/MC_controller.vhd:100:10  */
  assign mc_reg = n145_q; // (signal)
  /* ni/MC_controller.vhd:100:18  */
  assign mc_next = n109_o; // (signal)
  /* ni/MC_controller.vhd:101:10  */
  assign stbl_min_reg = n180_q; // (signal)
  /* ni/MC_controller.vhd:103:10  */
  assign mc_tbl_addr = n14_o; // (signal)
  /* ni/MC_controller.vhd:124:31  */
  assign n12_o = n0_o[10:0];
  /* ni/MC_controller.vhd:124:60  */
  assign n14_o = n12_o - 11'b00000000010;
  /* ni/MC_controller.vhd:126:30  */
  assign n15_o = n0_o[14];
  /* ni/MC_controller.vhd:126:19  */
  assign n16_o = sel & n15_o;
  /* ni/MC_controller.vhd:128:17  */
  assign n17_o = n0_o[15];
  /* ni/MC_controller.vhd:128:20  */
  assign n18_o = ~n17_o;
  /* ni/MC_controller.vhd:129:26  */
  assign n19_o = n0_o[10:0];
  /* ni/MC_controller.vhd:131:11  */
  assign n21_o = n19_o == 11'b00000000000;
  /* ni/MC_controller.vhd:129:9  */
  always @*
    case (n21_o)
      1'b1: n24_o <= 1'b0;
    endcase
  assign n25_o = read_reg[1:0];
  /* ni/MC_controller.vhd:129:9  */
  always @*
    case (n21_o)
      1'b1: n26_o <= mode_idx_reg;
    endcase
  /* ni/MC_controller.vhd:144:26  */
  assign n27_o = n0_o[10:0];
  /* ni/MC_controller.vhd:147:58  */
  assign n28_o = n0_o[17:16];
  /* ni/MC_controller.vhd:146:11  */
  assign n30_o = n27_o == 11'b00000000000;
  /* ni/MC_controller.vhd:151:8  */
  assign n32_o = n27_o == 11'b00000000001;
  assign n33_o = {n32_o, n30_o};
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n33_o)
      2'b10: n34_o <= mode_change_idx_reg;
      2'b01: n34_o <= n28_o;
    endcase
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n33_o)
      2'b10: n35_o <= mode_change_cnt_reg;
      2'b01: n35_o <= mode_change_cnt_int;
    endcase
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n33_o)
      2'b10: n38_o <= 1'b0;
      2'b01: n38_o <= 1'b1;
    endcase
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n33_o)
      2'b10: n41_o <= 1'b0;
      2'b01: n41_o <= 1'b0;
    endcase
  /* ni/MC_controller.vhd:158:24  */
  assign n43_o = $unsigned(mc_tbl_addr) < $unsigned(11'b00000000100);
  /* ni/MC_controller.vhd:160:22  */
  assign n45_o = mc_tbl_addr[1:0];  // trunc
  /* ni/MC_controller.vhd:160:76  */
  assign n47_o = n0_o[23:16];
  /* ni/MC_controller.vhd:161:22  */
  assign n50_o = mc_tbl_addr[1:0];  // trunc
  /* ni/MC_controller.vhd:161:76  */
  assign n52_o = n0_o[39:32];
  /* ni/MC_controller.vhd:158:9  */
  assign n54_o = n43_o ? n234_o : mode_reg;
  /* ni/MC_controller.vhd:158:9  */
  assign n56_o = n43_o ? 1'b0 : n41_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n57_o = n18_o ? mode_change_idx_reg : n34_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n58_o = n18_o ? mode_change_cnt_reg : n35_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n59_o = n18_o ? mode_reg : n54_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n61_o = n18_o ? 1'b0 : n38_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n62_o = n18_o ? n24_o : n56_o;
  assign n63_o = read_reg[1:0];
  /* ni/MC_controller.vhd:126:5  */
  assign n64_o = n75_o ? n26_o : n63_o;
  /* ni/MC_controller.vhd:126:5  */
  assign n65_o = n16_o ? n57_o : mode_change_idx_reg;
  /* ni/MC_controller.vhd:126:5  */
  assign n66_o = n16_o ? n58_o : mode_change_cnt_reg;
  /* ni/MC_controller.vhd:126:5  */
  assign n67_o = n16_o ? n59_o : mode_reg;
  /* ni/MC_controller.vhd:126:5  */
  assign n69_o = n16_o ? n61_o : 1'b0;
  /* ni/MC_controller.vhd:126:5  */
  assign n72_o = n16_o ? n62_o : 1'b0;
  /* ni/MC_controller.vhd:126:5  */
  assign n75_o = n16_o & n18_o;
  assign n76_o = read_reg[31:2];
  /* ni/MC_controller.vhd:179:37  */
  assign n79_o = mc_p_cnt + 2'b10;
  /* ni/MC_controller.vhd:190:42  */
  assign n81_o = local_mode_change_idx & run;
  /* ni/MC_controller.vhd:190:11  */
  assign n83_o = n81_o ? 2'b01 : state;
  /* ni/MC_controller.vhd:189:9  */
  assign n85_o = state == 2'b00;
  /* ni/MC_controller.vhd:194:11  */
  assign n87_o = period_boundary ? 2'b10 : state;
  /* ni/MC_controller.vhd:194:11  */
  assign n89_o = period_boundary ? 1'b1 : mc_reg;
  /* ni/MC_controller.vhd:193:9  */
  assign n91_o = state == 2'b01;
  /* ni/MC_controller.vhd:199:11  */
  assign n93_o = period_boundary ? 2'b00 : state;
  /* ni/MC_controller.vhd:199:11  */
  assign n96_o = period_boundary ? 1'b1 : 1'b0;
  /* ni/MC_controller.vhd:199:11  */
  assign n98_o = period_boundary ? 1'b0 : mc_reg;
  /* ni/MC_controller.vhd:198:9  */
  assign n100_o = state == 2'b10;
  assign n101_o = {n100_o, n91_o, n85_o};
  /* ni/MC_controller.vhd:187:7  */
  always @*
    case (n101_o)
      3'b100: n103_o <= n93_o;
      3'b010: n103_o <= n87_o;
      3'b001: n103_o <= n83_o;
    endcase
  /* ni/MC_controller.vhd:187:7  */
  always @*
    case (n101_o)
      3'b100: n106_o <= n96_o;
      3'b010: n106_o <= 1'b0;
      3'b001: n106_o <= 1'b0;
    endcase
  /* ni/MC_controller.vhd:187:7  */
  always @*
    case (n101_o)
      3'b100: n109_o <= n98_o;
      3'b010: n109_o <= n89_o;
      3'b001: n109_o <= mc_reg;
    endcase
  /* ni/MC_controller.vhd:257:57  */
  assign n114_o = n240_o[7:0];
  /* ni/MC_controller.vhd:258:59  */
  assign n118_o = n246_o[15:8];
  /* ni/MC_controller.vhd:268:5  */
  assign n120_o = period_boundary ? stbl_min_next : stbl_min_reg;
  /* ni/MC_controller.vhd:281:7  */
  assign n125_o = reset ? 1'b0 : config_slv_error_next;
  /* ni/MC_controller.vhd:281:7  */
  assign n127_o = reset ? 2'b00 : next_state;
  /* ni/MC_controller.vhd:281:7  */
  assign n129_o = reset ? 2'b00 : mode_change_cnt_next;
  /* ni/MC_controller.vhd:281:7  */
  assign n131_o = reset ? 32'b00000000000000000000000000000000 : read_next;
  /* ni/MC_controller.vhd:281:7  */
  assign n133_o = reset ? 1'b0 : mc_next;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n141_q <= n125_o;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n142_q <= n127_o;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n143_q <= n129_o;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n144_q <= n131_o;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n145_q <= n133_o;
  /* ni/MC_controller.vhd:302:7  */
  assign n149_o = reset ? 64'b0000000000000000000000000000000000000000000000000000000000000000 : mode_next;
  /* ni/MC_controller.vhd:301:5  */
  always @(posedge clk)
    n152_q <= n149_o;
  /* ni/MC_controller.vhd:324:9  */
  assign n155_o = local_mode_change_idx ? mode_change_idx_next : mode_change_idx_reg;
  /* ni/MC_controller.vhd:321:7  */
  assign n157_o = reset ? 2'b00 : n155_o;
  /* ni/MC_controller.vhd:320:5  */
  always @(posedge clk)
    n160_q <= n157_o;
  /* ni/MC_controller.vhd:338:9  */
  assign n163_o = global_mode_change_idx ? mode_change_idx_reg : mode_idx_reg;
  /* ni/MC_controller.vhd:335:7  */
  assign n165_o = reset ? 2'b00 : n163_o;
  /* ni/MC_controller.vhd:334:5  */
  always @(posedge clk)
    n168_q <= n165_o;
  /* ni/MC_controller.vhd:354:9  */
  assign n171_o = period_boundary ? stbl_min_next : stbl_min_reg;
  /* ni/MC_controller.vhd:350:7  */
  assign n174_o = reset ? 8'b00000000 : n171_o;
  /* ni/MC_controller.vhd:349:5  */
  always @(posedge clk)
    n180_q <= n174_o;
  /* ni/MC_controller.vhd:373:9  */
  assign n184_o = period_boundary ? stbl_maxp1_next : n189_q;
  /* ni/MC_controller.vhd:370:7  */
  assign n186_o = reset ? 8'b00000000 : n184_o;
  /* ni/MC_controller.vhd:369:5  */
  always @(posedge clk)
    n189_q <= n186_o;
  /* ni/MC_controller.vhd:369:5  */
  assign n190_o = {n76_o, n64_o};
  assign n192_o = {n141_q, read_reg};
  /* ni/MC_controller.vhd:160:13  */
  assign n193_o = n45_o[1];
  /* ni/MC_controller.vhd:160:13  */
  assign n194_o = ~n193_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n195_o = n45_o[0];
  /* ni/MC_controller.vhd:160:13  */
  assign n196_o = ~n195_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n197_o = n194_o & n196_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n198_o = n194_o & n195_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n199_o = n193_o & n196_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n200_o = n193_o & n195_o;
  /* ni/MC_controller.vhd:367:3  */
  assign n201_o = mode_reg[7:0];
  /* ni/MC_controller.vhd:160:13  */
  assign n202_o = n197_o ? n47_o : n201_o;
  assign n203_o = mode_reg[15:8];
  /* ni/MC_controller.vhd:350:7  */
  assign n204_o = mode_reg[23:16];
  /* ni/MC_controller.vhd:160:13  */
  assign n205_o = n198_o ? n47_o : n204_o;
  /* ni/MC_controller.vhd:354:9  */
  assign n206_o = mode_reg[31:24];
  /* ni/MC_controller.vhd:347:3  */
  assign n207_o = mode_reg[39:32];
  /* ni/MC_controller.vhd:160:13  */
  assign n208_o = n199_o ? n47_o : n207_o;
  /* ni/MC_controller.vhd:332:3  */
  assign n209_o = mode_reg[47:40];
  assign n210_o = mode_reg[55:48];
  /* ni/MC_controller.vhd:160:13  */
  assign n211_o = n200_o ? n47_o : n210_o;
  assign n212_o = mode_reg[63:56];
  /* ni/MC_controller.vhd:299:3  */
  assign n213_o = {n212_o, n211_o, n209_o, n208_o, n206_o, n205_o, n203_o, n202_o};
  /* ni/MC_controller.vhd:161:13  */
  assign n214_o = n50_o[1];
  /* ni/MC_controller.vhd:161:13  */
  assign n215_o = ~n214_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n216_o = n50_o[0];
  /* ni/MC_controller.vhd:161:13  */
  assign n217_o = ~n216_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n218_o = n215_o & n217_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n219_o = n215_o & n216_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n220_o = n214_o & n217_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n221_o = n214_o & n216_o;
  /* ni/MC_controller.vhd:257:31  */
  assign n222_o = n213_o[7:0];
  assign n223_o = n213_o[15:8];
  /* ni/MC_controller.vhd:161:13  */
  assign n224_o = n218_o ? n52_o : n223_o;
  /* ni/MC_controller.vhd:182:5  */
  assign n225_o = n213_o[23:16];
  assign n226_o = n213_o[31:24];
  /* ni/MC_controller.vhd:161:13  */
  assign n227_o = n219_o ? n52_o : n226_o;
  assign n228_o = n213_o[39:32];
  assign n229_o = n213_o[47:40];
  /* ni/MC_controller.vhd:161:13  */
  assign n230_o = n220_o ? n52_o : n229_o;
  /* ni/MC_controller.vhd:160:23  */
  assign n231_o = n213_o[55:48];
  assign n232_o = n213_o[63:56];
  /* ni/MC_controller.vhd:161:13  */
  assign n233_o = n221_o ? n52_o : n232_o;
  /* ni/MC_controller.vhd:101:55  */
  assign n234_o = {n233_o, n231_o, n230_o, n228_o, n227_o, n225_o, n224_o, n222_o};
  /* ni/MC_controller.vhd:161:23  */
  assign n235_o = mode_reg[15:0];
  /* ni/MC_controller.vhd:161:13  */
  assign n236_o = mode_reg[31:16];
  /* ni/MC_controller.vhd:101:40  */
  assign n237_o = mode_reg[47:32];
  /* ni/MC_controller.vhd:101:24  */
  assign n238_o = mode_reg[63:48];
  /* ni/MC_controller.vhd:257:30  */
  assign n239_o = mode_idx_reg[1:0];
  /* ni/MC_controller.vhd:257:30  */
  always @*
    case (n239_o)
      2'b00: n240_o <= n235_o;
      2'b01: n240_o <= n236_o;
      2'b10: n240_o <= n237_o;
      2'b11: n240_o <= n238_o;
    endcase
  /* ni/MC_controller.vhd:257:31  */
  assign n241_o = mode_reg[15:0];
  /* ni/MC_controller.vhd:257:30  */
  assign n242_o = mode_reg[31:16];
  assign n243_o = mode_reg[47:32];
  assign n244_o = mode_reg[63:48];
  /* ni/MC_controller.vhd:258:32  */
  assign n245_o = mode_idx_reg[1:0];
  /* ni/MC_controller.vhd:258:32  */
  always @*
    case (n245_o)
      2'b00: n246_o <= n241_o;
      2'b01: n246_o <= n242_o;
      2'b10: n246_o <= n243_o;
      2'b11: n246_o <= n244_o;
    endcase
endmodule

