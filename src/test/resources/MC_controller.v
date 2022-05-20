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
  wire [1:0] n76_o;
  wire n78_o;
  wire [1:0] n80_o;
  wire n82_o;
  wire [1:0] n84_o;
  wire n86_o;
  wire n88_o;
  wire [1:0] n90_o;
  wire n93_o;
  wire n95_o;
  wire n97_o;
  wire [2:0] n98_o;
  reg [1:0] n100_o;
  reg n103_o;
  reg n106_o;
  wire [7:0] n111_o;
  wire [7:0] n115_o;
  wire [7:0] n117_o;
  wire n122_o;
  wire [1:0] n124_o;
  wire [1:0] n126_o;
  wire [31:0] n128_o;
  wire n130_o;
  reg n138_q;
  reg [1:0] n139_q;
  reg [1:0] n140_q;
  reg [31:0] n141_q;
  reg n142_q;
  wire [63:0] n146_o;
  reg [63:0] n149_q;
  wire [1:0] n152_o;
  wire [1:0] n154_o;
  reg [1:0] n157_q;
  wire [1:0] n160_o;
  wire [1:0] n162_o;
  reg [1:0] n165_q;
  wire [7:0] n168_o;
  wire [7:0] n171_o;
  reg [7:0] n177_q;
  wire [7:0] n181_o;
  wire [7:0] n183_o;
  reg [7:0] n186_q;
  wire [31:0] n187_o;
  wire [32:0] n189_o;
  wire n190_o;
  wire n191_o;
  wire n192_o;
  wire n193_o;
  wire n194_o;
  wire n195_o;
  wire n196_o;
  wire n197_o;
  wire [7:0] n198_o;
  wire [7:0] n199_o;
  wire [7:0] n200_o;
  wire [7:0] n201_o;
  wire [7:0] n202_o;
  wire [7:0] n203_o;
  wire [7:0] n204_o;
  wire [7:0] n205_o;
  wire [7:0] n206_o;
  wire [7:0] n207_o;
  wire [7:0] n208_o;
  wire [7:0] n209_o;
  wire [63:0] n210_o;
  wire n211_o;
  wire n212_o;
  wire n213_o;
  wire n214_o;
  wire n215_o;
  wire n216_o;
  wire n217_o;
  wire n218_o;
  wire [7:0] n219_o;
  wire [7:0] n220_o;
  wire [7:0] n221_o;
  wire [7:0] n222_o;
  wire [7:0] n223_o;
  wire [7:0] n224_o;
  wire [7:0] n225_o;
  wire [7:0] n226_o;
  wire [7:0] n227_o;
  wire [7:0] n228_o;
  wire [7:0] n229_o;
  wire [7:0] n230_o;
  wire [63:0] n231_o;
  wire [15:0] n232_o;
  wire [15:0] n233_o;
  wire [15:0] n234_o;
  wire [15:0] n235_o;
  wire [1:0] n236_o;
  reg [15:0] n237_o;
  wire [15:0] n238_o;
  wire [15:0] n239_o;
  wire [15:0] n240_o;
  wire [15:0] n241_o;
  wire [1:0] n242_o;
  reg [15:0] n243_o;
  assign config_slv_rdata = n2_o;
  assign config_slv_error = n3_o;
  assign stbl_min = n117_o;
  assign stbl_maxp1 = n186_q;
  assign mc = mc_reg;
  assign mc_idx = mode_change_idx_reg;
  assign mc_p = mode_change_cnt_reg;
  assign n0_o = {config_wdata, config_wr, config_en, config_addr};
  assign n2_o = n189_o[31:0];
  assign n3_o = n189_o[32];
  /* ni/MC_controller.vhd:84:10  */
  assign state = n139_q; // (signal)
  /* ni/MC_controller.vhd:84:17  */
  assign next_state = n100_o; // (signal)
  /* ni/MC_controller.vhd:86:10  */
  assign stbl_min_next = n111_o; // (signal)
  /* ni/MC_controller.vhd:86:25  */
  assign stbl_maxp1_next = n115_o; // (signal)
  /* ni/MC_controller.vhd:87:10  */
  assign mode_change_idx_reg = n157_q; // (signal)
  /* ni/MC_controller.vhd:87:31  */
  assign mode_change_idx_next = n62_o; // (signal)
  /* ni/MC_controller.vhd:88:10  */
  assign mode_idx_reg = n165_q; // (signal)
  /* ni/MC_controller.vhd:90:10  */
  assign mode_change_cnt_reg = n140_q; // (signal)
  /* ni/MC_controller.vhd:90:31  */
  assign mode_change_cnt_next = n63_o; // (signal)
  /* ni/MC_controller.vhd:90:53  */
  assign mode_change_cnt_int = n76_o; // (signal)
  /* ni/MC_controller.vhd:92:10  */
  assign mode_reg = n149_q; // (signal)
  /* ni/MC_controller.vhd:92:20  */
  assign mode_next = n64_o; // (signal)
  /* ni/MC_controller.vhd:94:10  */
  assign global_mode_change_idx = n103_o; // (signal)
  /* ni/MC_controller.vhd:94:34  */
  assign local_mode_change_idx = n66_o; // (signal)
  /* ni/MC_controller.vhd:96:10  */
  assign config_slv_error_next = n69_o; // (signal)
  /* ni/MC_controller.vhd:98:10  */
  assign read_reg = n141_q; // (signal)
  /* ni/MC_controller.vhd:98:20  */
  assign read_next = n187_o; // (signal)
  /* ni/MC_controller.vhd:100:10  */
  assign mc_reg = n142_q; // (signal)
  /* ni/MC_controller.vhd:100:18  */
  assign mc_next = n106_o; // (signal)
  /* ni/MC_controller.vhd:101:10  */
  assign stbl_min_reg = n177_q; // (signal)
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
      default: n24_o <= 1'b1;
    endcase
  assign n25_o = read_reg[1:0];
  /* ni/MC_controller.vhd:129:9  */
  always @*
    case (n21_o)
      1'b1: n26_o <= mode_idx_reg;
      default: n26_o <= n25_o;
    endcase
  /* ni/MC_controller.vhd:144:26  */
  assign n27_o = n0_o[10:0];
  /* ni/MC_controller.vhd:147:58  */
  assign n28_o = n0_o[17:16];
  /* ni/MC_controller.vhd:146:11  */
  assign n30_o = n27_o == 11'b00000000000;
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n30_o)
      1'b1: n31_o <= n28_o;
      default: n31_o <= mode_change_idx_reg;
    endcase
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n30_o)
      1'b1: n32_o <= mode_change_cnt_int;
      default: n32_o <= mode_change_cnt_reg;
    endcase
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n30_o)
      1'b1: n35_o <= 1'b1;
      default: n35_o <= 1'b0;
    endcase
  /* ni/MC_controller.vhd:144:9  */
  always @*
    case (n30_o)
      1'b1: n38_o <= 1'b0;
      default: n38_o <= 1'b1;
    endcase
  /* ni/MC_controller.vhd:158:24  */
  assign n40_o = $unsigned(mc_tbl_addr) < $unsigned(11'b00000000100);
  /* ni/MC_controller.vhd:160:22  */
  assign n42_o = mc_tbl_addr[1:0];  // trunc
  /* ni/MC_controller.vhd:160:76  */
  assign n44_o = n0_o[23:16];
  /* ni/MC_controller.vhd:161:22  */
  assign n47_o = mc_tbl_addr[1:0];  // trunc
  /* ni/MC_controller.vhd:161:76  */
  assign n49_o = n0_o[39:32];
  /* ni/MC_controller.vhd:158:9  */
  assign n51_o = n40_o ? n231_o : mode_reg;
  /* ni/MC_controller.vhd:158:9  */
  assign n53_o = n40_o ? 1'b0 : n38_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n54_o = n18_o ? mode_change_idx_reg : n31_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n55_o = n18_o ? mode_change_cnt_reg : n32_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n56_o = n18_o ? mode_reg : n51_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n58_o = n18_o ? 1'b0 : n35_o;
  /* ni/MC_controller.vhd:128:7  */
  assign n59_o = n18_o ? n24_o : n53_o;
  assign n60_o = read_reg[1:0];
  /* ni/MC_controller.vhd:126:5  */
  assign n61_o = n72_o ? n26_o : n60_o;
  /* ni/MC_controller.vhd:126:5  */
  assign n62_o = n16_o ? n54_o : mode_change_idx_reg;
  /* ni/MC_controller.vhd:126:5  */
  assign n63_o = n16_o ? n55_o : mode_change_cnt_reg;
  /* ni/MC_controller.vhd:126:5  */
  assign n64_o = n16_o ? n56_o : mode_reg;
  /* ni/MC_controller.vhd:126:5  */
  assign n66_o = n16_o ? n58_o : 1'b0;
  /* ni/MC_controller.vhd:126:5  */
  assign n69_o = n16_o ? n59_o : 1'b0;
  /* ni/MC_controller.vhd:126:5  */
  assign n72_o = n16_o & n18_o;
  assign n73_o = read_reg[31:2];
  /* ni/MC_controller.vhd:179:37  */
  assign n76_o = mc_p_cnt + 2'b10;
  /* ni/MC_controller.vhd:190:42  */
  assign n78_o = local_mode_change_idx & run;
  /* ni/MC_controller.vhd:190:11  */
  assign n80_o = n78_o ? 2'b01 : state;
  /* ni/MC_controller.vhd:189:9  */
  assign n82_o = state == 2'b00;
  /* ni/MC_controller.vhd:194:11  */
  assign n84_o = period_boundary ? 2'b10 : state;
  /* ni/MC_controller.vhd:194:11  */
  assign n86_o = period_boundary ? 1'b1 : mc_reg;
  /* ni/MC_controller.vhd:193:9  */
  assign n88_o = state == 2'b01;
  /* ni/MC_controller.vhd:199:11  */
  assign n90_o = period_boundary ? 2'b00 : state;
  /* ni/MC_controller.vhd:199:11  */
  assign n93_o = period_boundary ? 1'b1 : 1'b0;
  /* ni/MC_controller.vhd:199:11  */
  assign n95_o = period_boundary ? 1'b0 : mc_reg;
  /* ni/MC_controller.vhd:198:9  */
  assign n97_o = state == 2'b10;
  assign n98_o = {n97_o, n88_o, n82_o};
  /* ni/MC_controller.vhd:187:7  */
  always @*
    case (n98_o)
      3'b100: n100_o <= n90_o;
      3'b010: n100_o <= n84_o;
      3'b001: n100_o <= n80_o;
      default: n100_o <= 2'bX;
    endcase
  /* ni/MC_controller.vhd:187:7  */
  always @*
    case (n98_o)
      3'b100: n103_o <= n93_o;
      3'b010: n103_o <= 1'b0;
      3'b001: n103_o <= 1'b0;
      default: n103_o <= 1'bX;
    endcase
  /* ni/MC_controller.vhd:187:7  */
  always @*
    case (n98_o)
      3'b100: n106_o <= n95_o;
      3'b010: n106_o <= n86_o;
      3'b001: n106_o <= mc_reg;
      default: n106_o <= 1'bX;
    endcase
  /* ni/MC_controller.vhd:257:57  */
  assign n111_o = n237_o[7:0];
  /* ni/MC_controller.vhd:258:59  */
  assign n115_o = n243_o[15:8];
  /* ni/MC_controller.vhd:268:5  */
  assign n117_o = period_boundary ? stbl_min_next : stbl_min_reg;
  /* ni/MC_controller.vhd:281:7  */
  assign n122_o = reset ? 1'b0 : config_slv_error_next;
  /* ni/MC_controller.vhd:281:7  */
  assign n124_o = reset ? 2'b00 : next_state;
  /* ni/MC_controller.vhd:281:7  */
  assign n126_o = reset ? 2'b00 : mode_change_cnt_next;
  /* ni/MC_controller.vhd:281:7  */
  assign n128_o = reset ? 32'b00000000000000000000000000000000 : read_next;
  /* ni/MC_controller.vhd:281:7  */
  assign n130_o = reset ? 1'b0 : mc_next;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n138_q <= n122_o;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n139_q <= n124_o;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n140_q <= n126_o;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n141_q <= n128_o;
  /* ni/MC_controller.vhd:280:5  */
  always @(posedge clk)
    n142_q <= n130_o;
  /* ni/MC_controller.vhd:302:7  */
  assign n146_o = reset ? 64'b0000000000000000000000000000000000000000000000000000000000000000 : mode_next;
  /* ni/MC_controller.vhd:301:5  */
  always @(posedge clk)
    n149_q <= n146_o;
  /* ni/MC_controller.vhd:324:9  */
  assign n152_o = local_mode_change_idx ? mode_change_idx_next : mode_change_idx_reg;
  /* ni/MC_controller.vhd:321:7  */
  assign n154_o = reset ? 2'b00 : n152_o;
  /* ni/MC_controller.vhd:320:5  */
  always @(posedge clk)
    n157_q <= n154_o;
  /* ni/MC_controller.vhd:338:9  */
  assign n160_o = global_mode_change_idx ? mode_change_idx_reg : mode_idx_reg;
  /* ni/MC_controller.vhd:335:7  */
  assign n162_o = reset ? 2'b00 : n160_o;
  /* ni/MC_controller.vhd:334:5  */
  always @(posedge clk)
    n165_q <= n162_o;
  /* ni/MC_controller.vhd:354:9  */
  assign n168_o = period_boundary ? stbl_min_next : stbl_min_reg;
  /* ni/MC_controller.vhd:350:7  */
  assign n171_o = reset ? 8'b00000000 : n168_o;
  /* ni/MC_controller.vhd:349:5  */
  always @(posedge clk)
    n177_q <= n171_o;
  /* ni/MC_controller.vhd:373:9  */
  assign n181_o = period_boundary ? stbl_maxp1_next : n186_q;
  /* ni/MC_controller.vhd:370:7  */
  assign n183_o = reset ? 8'b00000000 : n181_o;
  /* ni/MC_controller.vhd:369:5  */
  always @(posedge clk)
    n186_q <= n183_o;
  /* ni/MC_controller.vhd:369:5  */
  assign n187_o = {n73_o, n61_o};
  assign n189_o = {n138_q, read_reg};
  /* ni/MC_controller.vhd:160:13  */
  assign n190_o = n42_o[1];
  /* ni/MC_controller.vhd:160:13  */
  assign n191_o = ~n190_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n192_o = n42_o[0];
  /* ni/MC_controller.vhd:160:13  */
  assign n193_o = ~n192_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n194_o = n191_o & n193_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n195_o = n191_o & n192_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n196_o = n190_o & n193_o;
  /* ni/MC_controller.vhd:160:13  */
  assign n197_o = n190_o & n192_o;
  /* ni/MC_controller.vhd:367:3  */
  assign n198_o = mode_reg[7:0];
  /* ni/MC_controller.vhd:160:13  */
  assign n199_o = n194_o ? n44_o : n198_o;
  assign n200_o = mode_reg[15:8];
  /* ni/MC_controller.vhd:350:7  */
  assign n201_o = mode_reg[23:16];
  /* ni/MC_controller.vhd:160:13  */
  assign n202_o = n195_o ? n44_o : n201_o;
  /* ni/MC_controller.vhd:354:9  */
  assign n203_o = mode_reg[31:24];
  /* ni/MC_controller.vhd:347:3  */
  assign n204_o = mode_reg[39:32];
  /* ni/MC_controller.vhd:160:13  */
  assign n205_o = n196_o ? n44_o : n204_o;
  /* ni/MC_controller.vhd:332:3  */
  assign n206_o = mode_reg[47:40];
  assign n207_o = mode_reg[55:48];
  /* ni/MC_controller.vhd:160:13  */
  assign n208_o = n197_o ? n44_o : n207_o;
  assign n209_o = mode_reg[63:56];
  /* ni/MC_controller.vhd:299:3  */
  assign n210_o = {n209_o, n208_o, n206_o, n205_o, n203_o, n202_o, n200_o, n199_o};
  /* ni/MC_controller.vhd:161:13  */
  assign n211_o = n47_o[1];
  /* ni/MC_controller.vhd:161:13  */
  assign n212_o = ~n211_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n213_o = n47_o[0];
  /* ni/MC_controller.vhd:161:13  */
  assign n214_o = ~n213_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n215_o = n212_o & n214_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n216_o = n212_o & n213_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n217_o = n211_o & n214_o;
  /* ni/MC_controller.vhd:161:13  */
  assign n218_o = n211_o & n213_o;
  /* ni/MC_controller.vhd:257:31  */
  assign n219_o = n210_o[7:0];
  assign n220_o = n210_o[15:8];
  /* ni/MC_controller.vhd:161:13  */
  assign n221_o = n215_o ? n49_o : n220_o;
  /* ni/MC_controller.vhd:182:5  */
  assign n222_o = n210_o[23:16];
  assign n223_o = n210_o[31:24];
  /* ni/MC_controller.vhd:161:13  */
  assign n224_o = n216_o ? n49_o : n223_o;
  assign n225_o = n210_o[39:32];
  assign n226_o = n210_o[47:40];
  /* ni/MC_controller.vhd:161:13  */
  assign n227_o = n217_o ? n49_o : n226_o;
  /* ni/MC_controller.vhd:160:23  */
  assign n228_o = n210_o[55:48];
  assign n229_o = n210_o[63:56];
  /* ni/MC_controller.vhd:161:13  */
  assign n230_o = n218_o ? n49_o : n229_o;
  /* ni/MC_controller.vhd:101:55  */
  assign n231_o = {n230_o, n228_o, n227_o, n225_o, n224_o, n222_o, n221_o, n219_o};
  /* ni/MC_controller.vhd:161:23  */
  assign n232_o = mode_reg[15:0];
  /* ni/MC_controller.vhd:161:13  */
  assign n233_o = mode_reg[31:16];
  /* ni/MC_controller.vhd:101:40  */
  assign n234_o = mode_reg[47:32];
  /* ni/MC_controller.vhd:101:24  */
  assign n235_o = mode_reg[63:48];
  /* ni/MC_controller.vhd:257:30  */
  assign n236_o = mode_idx_reg[1:0];
  /* ni/MC_controller.vhd:257:30  */
  always @*
    case (n236_o)
      2'b00: n237_o <= n232_o;
      2'b01: n237_o <= n233_o;
      2'b10: n237_o <= n234_o;
      2'b11: n237_o <= n235_o;
    endcase
  /* ni/MC_controller.vhd:257:31  */
  assign n238_o = mode_reg[15:0];
  /* ni/MC_controller.vhd:257:30  */
  assign n239_o = mode_reg[31:16];
  assign n240_o = mode_reg[47:32];
  assign n241_o = mode_reg[63:48];
  /* ni/MC_controller.vhd:258:32  */
  assign n242_o = mode_idx_reg[1:0];
  /* ni/MC_controller.vhd:258:32  */
  always @*
    case (n242_o)
      2'b00: n243_o <= n238_o;
      2'b01: n243_o <= n239_o;
      2'b10: n243_o <= n240_o;
      2'b11: n243_o <= n241_o;
    endcase
endmodule

