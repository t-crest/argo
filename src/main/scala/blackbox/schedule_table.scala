package blackbox

import chisel3._
import chisel3.util.HasBlackBoxResource
import argo.ArgoTypes._

class schedule_table extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clk = Input(Bool())
    val reset = Input(Bool())
    val config_addr = Input(UInt(MEM_ADDR_WIDTH.W))
    val config_en = Input(Bool())
    val config_wr = Input(Bool())
    val config_wdata = Input(UInt(WORD_WIDTH.W))
    val sel = Input(Bool())
    val stbl_idx = Input(UInt(STBL_IDX_WIDTH.W))
    val stbl_idx_en = Input(Bool())

    val config_slv_rdata = Output(UInt(WORD_WIDTH.W))
    val config_slv_error = Output(Bool())
    val route = Output(UInt(HEADER_ROUTE_WIDTH.W))
    val pkt_len = Output(UInt(STBL_PKT_LEN_WIDTH.W))
    val t2n = Output(UInt(STBL_T2N_WIDTH.W))
    val dma_num = Output(UInt(DMATBL_IDX_WIDTH.W))
    val dma_en = Output(Bool())
  })
  addResource("/schedule_table.v")
}
