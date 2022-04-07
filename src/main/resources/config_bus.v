module config_bus
  (input  clk,
   input  reset,
   input  [2:0] ocp_config_m_MCmd,
   input  [31:0] ocp_config_m_MAddr,
   input  [31:0] ocp_config_m_MData,
   input  [3:0] ocp_config_m_MByteEn,
   input  ocp_config_m_MRespAccept,
   input  supervisor,
   input  [13:0] config_unit_addr,
   input  config_unit_en,
   input  config_unit_wr,
   input  [31:0] config_unit_wdata,
   input  [31:0] TDM_ctrl_rdata,
   input  TDM_ctrl_error,
   input  [31:0] sched_tbl_rdata,
   input  sched_tbl_error,
   input  [31:0] DMA_tbl_rdata,
   input  DMA_tbl_error,
   input  [31:0] MC_ctrl_rdata,
   input  MC_ctrl_error,
   input  [31:0] irq_unit_fifo_rdata,
   input  irq_unit_fifo_error,
   output [1:0] ocp_config_s_SResp,
   output [31:0] ocp_config_s_SData,
   output ocp_config_s_SCmdAccept,
   output [13:0] config_addr,
   output config_en,
   output config_wr,
   output [31:0] config_wdata,
   output TDM_ctrl_sel,
   output sched_tbl_sel,
   output DMA_tbl_sel,
   output MC_ctrl_sel,
   output irq_unit_fifo_sel);
  wire [71:0] n0_o;
  wire [1:0] n2_o;
  wire [31:0] n3_o;
  wire n4_o;
  wire [47:0] n5_o;
  wire [13:0] n7_o;
  wire n8_o;
  wire n9_o;
  wire [31:0] n10_o;
  wire [32:0] n11_o;
  wire [32:0] n13_o;
  wire [32:0] n15_o;
  wire [32:0] n17_o;
  wire [32:0] n19_o;
  wire [1:0] next_ocp_resp;
  wire [1:0] ocp_resp_reg;
  wire [2:0] bank_id;
  wire [2:0] prev_bank_id;
  wire [31:0] n22_o;
  wire [2:0] n24_o;
  wire [13:0] n25_o;
  wire n26_o;
  wire n27_o;
  wire [31:0] n28_o;
  wire n29_o;
  wire n30_o;
  wire [2:0] n31_o;
  wire n33_o;
  wire n34_o;
  wire [31:0] n36_o;
  wire [2:0] n37_o;
  wire [13:0] n38_o;
  wire [2:0] n41_o;
  wire n43_o;
  wire n44_o;
  wire [2:0] n45_o;
  wire n47_o;
  wire n49_o;
  wire n50_o;
  wire n51_o;
  wire [47:0] n52_o;
  wire [47:0] n53_o;
  wire [47:0] n54_o;
  wire [1:0] n56_o;
  wire [2:0] n57_o;
  wire n59_o;
  wire n60_o;
  wire n61_o;
  wire [1:0] n63_o;
  wire n72_o;
  wire n74_o;
  wire n76_o;
  wire n78_o;
  wire n80_o;
  wire n82_o;
  wire [5:0] n83_o;
  reg n86_o;
  reg n90_o;
  reg n94_o;
  reg n98_o;
  reg n102_o;
  wire [31:0] n104_o;
  wire n106_o;
  wire [31:0] n107_o;
  wire n109_o;
  wire [31:0] n110_o;
  wire n112_o;
  wire [31:0] n113_o;
  wire n115_o;
  wire [31:0] n116_o;
  wire n118_o;
  wire n120_o;
  wire [5:0] n121_o;
  reg [31:0] n122_o;
  wire [1:0] n127_o;
  wire [2:0] n129_o;
  reg [1:0] n133_q;
  reg [2:0] n134_q;
  wire [34:0] n135_o;
  assign ocp_config_s_SResp = n2_o;
  assign ocp_config_s_SData = n3_o;
  assign ocp_config_s_SCmdAccept = n4_o;
  assign config_addr = n7_o;
  assign config_en = n8_o;
  assign config_wr = n9_o;
  assign config_wdata = n10_o;
  assign TDM_ctrl_sel = n86_o;
  assign sched_tbl_sel = n90_o;
  assign DMA_tbl_sel = n94_o;
  assign MC_ctrl_sel = n98_o;
  assign irq_unit_fifo_sel = n102_o;
  assign n0_o = {ocp_config_m_MRespAccept, ocp_config_m_MByteEn, ocp_config_m_MData, ocp_config_m_MAddr, ocp_config_m_MCmd};
  assign n2_o = n135_o[1:0];
  assign n3_o = n135_o[33:2];
  assign n4_o = n135_o[34];
  assign n5_o = {config_unit_wdata, config_unit_wr, config_unit_en, config_unit_addr};
  assign n7_o = n54_o[13:0];
  assign n8_o = n54_o[14];
  assign n9_o = n54_o[15];
  assign n10_o = n54_o[47:16];
  assign n11_o = {TDM_ctrl_error, TDM_ctrl_rdata};
  assign n13_o = {sched_tbl_error, sched_tbl_rdata};
  assign n15_o = {DMA_tbl_error, DMA_tbl_rdata};
  assign n17_o = {MC_ctrl_error, MC_ctrl_rdata};
  assign n19_o = {irq_unit_fifo_error, irq_unit_fifo_rdata};
  /* ni/config_bus.vhd:88:8  */
  assign next_ocp_resp = n63_o; // (signal)
  /* ni/config_bus.vhd:88:23  */
  assign ocp_resp_reg = n133_q; // (signal)
  /* ni/config_bus.vhd:89:8  */
  assign bank_id = n57_o; // (signal)
  /* ni/config_bus.vhd:89:17  */
  assign prev_bank_id = n134_q; // (signal)
  /* ni/config_bus.vhd:105:55  */
  assign n22_o = n15_o[31:0];
  /* ni/config_bus.vhd:108:30  */
  assign n24_o = n5_o[13:11];
  /* ni/config_bus.vhd:110:30  */
  assign n25_o = n5_o[13:0];
  /* ni/config_bus.vhd:111:28  */
  assign n26_o = n5_o[14];
  /* ni/config_bus.vhd:112:28  */
  assign n27_o = n5_o[15];
  /* ni/config_bus.vhd:113:31  */
  assign n28_o = n5_o[47:16];
  /* ni/config_bus.vhd:120:18  */
  assign n29_o = n5_o[14];
  /* ni/config_bus.vhd:120:21  */
  assign n30_o = ~n29_o;
  /* ni/config_bus.vhd:120:44  */
  assign n31_o = n0_o[2:0];
  /* ni/config_bus.vhd:120:49  */
  assign n33_o = n31_o != 3'b000;
  /* ni/config_bus.vhd:120:27  */
  assign n34_o = n30_o & n33_o;
  /* ni/config_bus.vhd:124:66  */
  assign n36_o = n0_o[66:35];
  /* ni/config_bus.vhd:126:43  */
  assign n37_o = n0_o[18:16];
  /* ni/config_bus.vhd:129:47  */
  assign n38_o = n0_o[18:5];
  /* ni/config_bus.vhd:134:21  */
  assign n41_o = n0_o[2:0];
  /* ni/config_bus.vhd:134:26  */
  assign n43_o = n41_o != 3'b000;
  /* ni/config_bus.vhd:134:42  */
  assign n44_o = n43_o & supervisor;
  /* ni/config_bus.vhd:135:21  */
  assign n45_o = n0_o[2:0];
  /* ni/config_bus.vhd:135:26  */
  assign n47_o = n45_o == 3'b001;
  /* ni/config_bus.vhd:134:5  */
  assign n49_o = n50_o ? 1'b1 : 1'b0;
  /* ni/config_bus.vhd:134:5  */
  assign n50_o = n44_o & n47_o;
  /* ni/config_bus.vhd:120:3  */
  assign n51_o = n34_o ? 1'b1 : 1'b0;
  assign n52_o = {n36_o, n49_o, 1'b1, n38_o};
  assign n53_o = {n28_o, n27_o, n26_o, n25_o};
  /* ni/config_bus.vhd:120:3  */
  assign n54_o = n34_o ? n52_o : n53_o;
  /* ni/config_bus.vhd:120:3  */
  assign n56_o = n34_o ? 2'b01 : ocp_resp_reg;
  /* ni/config_bus.vhd:120:3  */
  assign n57_o = n34_o ? n37_o : n24_o;
  /* ni/config_bus.vhd:161:20  */
  assign n59_o = ocp_resp_reg != 2'b00;
  /* ni/config_bus.vhd:161:56  */
  assign n60_o = n0_o[71];
  /* ni/config_bus.vhd:161:38  */
  assign n61_o = n59_o & n60_o;
  /* ni/config_bus.vhd:161:3  */
  assign n63_o = n61_o ? 2'b00 : n56_o;
  /* ni/config_bus.vhd:177:5  */
  assign n72_o = bank_id == 3'b000;
  /* ni/config_bus.vhd:179:5  */
  assign n74_o = bank_id == 3'b001;
  /* ni/config_bus.vhd:181:5  */
  assign n76_o = bank_id == 3'b010;
  /* ni/config_bus.vhd:183:5  */
  assign n78_o = bank_id == 3'b011;
  /* ni/config_bus.vhd:185:5  */
  assign n80_o = bank_id == 3'b100;
  /* ni/config_bus.vhd:187:5  */
  assign n82_o = bank_id == 3'b111;
  assign n83_o = {n82_o, n80_o, n78_o, n76_o, n74_o, n72_o};
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n83_o)
      6'b100000: n86_o <= 1'b0;
      6'b010000: n86_o <= 1'b0;
      6'b001000: n86_o <= 1'b0;
      6'b000100: n86_o <= 1'b1;
      6'b000010: n86_o <= 1'b0;
      6'b000001: n86_o <= 1'b0;
    endcase
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n83_o)
      6'b100000: n90_o <= 1'b0;
      6'b010000: n90_o <= 1'b0;
      6'b001000: n90_o <= 1'b0;
      6'b000100: n90_o <= 1'b0;
      6'b000010: n90_o <= 1'b1;
      6'b000001: n90_o <= 1'b0;
    endcase
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n83_o)
      6'b100000: n94_o <= 1'b0;
      6'b010000: n94_o <= 1'b0;
      6'b001000: n94_o <= 1'b0;
      6'b000100: n94_o <= 1'b0;
      6'b000010: n94_o <= 1'b0;
      6'b000001: n94_o <= 1'b1;
    endcase
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n83_o)
      6'b100000: n98_o <= 1'b0;
      6'b010000: n98_o <= 1'b0;
      6'b001000: n98_o <= 1'b1;
      6'b000100: n98_o <= 1'b0;
      6'b000010: n98_o <= 1'b0;
      6'b000001: n98_o <= 1'b0;
    endcase
  /* ni/config_bus.vhd:176:3  */
  always @*
    case (n83_o)
      6'b100000: n102_o <= 1'b0;
      6'b010000: n102_o <= 1'b1;
      6'b001000: n102_o <= 1'b0;
      6'b000100: n102_o <= 1'b0;
      6'b000010: n102_o <= 1'b0;
      6'b000001: n102_o <= 1'b0;
    endcase
  /* ni/config_bus.vhd:194:59  */
  assign n104_o = n15_o[31:0];
  /* ni/config_bus.vhd:193:5  */
  assign n106_o = prev_bank_id == 3'b000;
  /* ni/config_bus.vhd:196:61  */
  assign n107_o = n13_o[31:0];
  /* ni/config_bus.vhd:195:5  */
  assign n109_o = prev_bank_id == 3'b001;
  /* ni/config_bus.vhd:198:60  */
  assign n110_o = n11_o[31:0];
  /* ni/config_bus.vhd:197:5  */
  assign n112_o = prev_bank_id == 3'b010;
  /* ni/config_bus.vhd:200:59  */
  assign n113_o = n17_o[31:0];
  /* ni/config_bus.vhd:199:5  */
  assign n115_o = prev_bank_id == 3'b011;
  /* ni/config_bus.vhd:202:65  */
  assign n116_o = n19_o[31:0];
  /* ni/config_bus.vhd:201:5  */
  assign n118_o = prev_bank_id == 3'b100;
  /* ni/config_bus.vhd:203:5  */
  assign n120_o = prev_bank_id == 3'b111;
  assign n121_o = {n120_o, n118_o, n115_o, n112_o, n109_o, n106_o};
  /* ni/config_bus.vhd:192:3  */
  always @*
    case (n121_o)
      6'b100000: n122_o <= n22_o;
      6'b010000: n122_o <= n116_o;
      6'b001000: n122_o <= n113_o;
      6'b000100: n122_o <= n110_o;
      6'b000010: n122_o <= n107_o;
      6'b000001: n122_o <= n104_o;
    endcase
  /* ni/config_bus.vhd:215:7  */
  assign n127_o = reset ? 2'b00 : next_ocp_resp;
  /* ni/config_bus.vhd:215:7  */
  assign n129_o = reset ? 3'b000 : bank_id;
  /* ni/config_bus.vhd:214:5  */
  always @(posedge clk)
    n133_q <= n127_o;
  /* ni/config_bus.vhd:214:5  */
  always @(posedge clk)
    n134_q <= n129_o;
  /* ni/config_bus.vhd:214:5  */
  assign n135_o = {n51_o, n122_o, ocp_resp_reg};
endmodule

