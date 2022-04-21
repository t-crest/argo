package blackbox

import chisel3._
import chisel3.util.HasBlackBoxResource

import argo.ArgoTypes._

class TDM_controller extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clk = Input(Bool())
    val reset = Input(Bool())
    val run = Input(Bool())
    val config_addr = Input(UInt(MEM_ADDR_WIDTH.W))
    val config_en = Input(Bool())
    val config_wr = Input(Bool())
    val config_wdata = Input(UInt(WORD_WIDTH.W))
    val sel = Input(Bool())
    val t2n = Input(UInt(STBL_T2N_WIDTH.W))
    val stbl_min = Input(UInt(STBL_IDX_WIDTH.W))
    val stbl_maxp1 = Input(UInt(STBL_IDX_WIDTH.W))
    val master_run = Output(Bool())
    val config_slv_rdata = Output(UInt(WORD_WIDTH.W))
    val config_slv_error = Output(Bool())
    val stbl_idx = Output(UInt(STBL_IDX_WIDTH.W))
    val stbl_idx_en = Output(Bool())
    val period_boundary = Output(Bool())
    val mc_p_cnt = Output(UInt(2.W))
  })
  addResource("/TDM_controller.v")
}
