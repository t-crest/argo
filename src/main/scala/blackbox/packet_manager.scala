package blackbox

import chisel3._
import argo.ArgoTypes._
import chisel3.util.HasBlackBoxResource

class packet_manager extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clk = Input(Bool())
    val reset = Input(Bool())
    val config_addr = Input(UInt(MEM_ADDR_WIDTH.W))
    val config_en = Input(Bool())
    val config_wr = Input(Bool())
    val config_wdata = Input(UInt(WORD_WIDTH.W))
    val sel = Input(Bool())
    val spm_slv_rdata = Input(UInt(DWORD_WIDTH.W))
    val spm_slv_error = Input(Bool())
    val dma_num = Input(UInt(DMATBL_IDX_WIDTH.W))
    val dma_en = Input(Bool())
    val route = Input(UInt(HEADER_ROUTE_WIDTH.W))
    val mc = Input(Bool())
    val mc_idx = Input(UInt(2.W))
    val mc_p = Input(UInt(2.W))
    val pkt_len = Input(UInt(STBL_PKT_LEN_WIDTH.W))
    val config_slv_rdata = Output(UInt(WORD_WIDTH.W))
    val config_slv_error = Output(Bool())
    val spm_addr = Output(UInt(MEM_ADDR_WIDTH.W))
    val spm_en = Output(UInt(2.W))
    val spm_wr = Output(Bool())
    val spm_wdata = Output(UInt(DWORD_WIDTH.W))
    val pkt_out = Output(UInt(LINK_WIDTH.W))
  })
  addResource("/packet_manager.v")
}
