package blackbox

import chisel3._
import chisel3.util.HasBlackBoxResource
import argo.ArgoTypes._

class MC_controller(val master: Boolean) extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clk = Input(Bool())
    val reset = Input(Bool())
    val run = Input(Bool())
    val config_addr = Input(UInt(MEM_ADDR_WIDTH.W))
    val config_en = Input(Bool())
    val config_wr = Input(Bool())
    val config_wdata = Input(UInt(WORD_WIDTH.W))
    val sel = Input(Bool())
    val period_boundary = Input(Bool())
    val mc_p_cnt = Input(UInt(2.W))

    val config_slv_rdata = Output(UInt(WORD_WIDTH.W))
    val config_slv_error = Output(Bool())
    val stbl_min = Output(UInt(STBL_IDX_WIDTH.W))
    val stbl_maxp1 = Output(UInt(STBL_IDX_WIDTH.W))
    val mc = Output(Bool())
    val mc_idx = Output(UInt(2.W))
    val mc_p = Output(UInt(2.W))
  })

  override def desiredName: String = if(this.master) {
    "MC_controller"
  } else {
    "MC_controller_s"
  }
  println(s"MC controller, master=$master")
  if (this.master) {
    addResource("/MC_controller.v")
  } else {
    addResource("/MC_controller_s.v")
  }
}
