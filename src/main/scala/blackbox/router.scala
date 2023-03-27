package blackbox

import argo.ArgoTypes.LINK_WIDTH
import chisel3._
import chisel3.util.HasBlackBoxResource

class router extends BlackBox with HasBlackBoxResource{
  val io = IO(new Bundle {
    val clk = Input(Bool())
    val reset = Input(Bool())
    val inPort_f = Input(UInt((5*(LINK_WIDTH+1)).W))
    val outPort_b = Input(UInt(5.W))
    val inPort_b = Output(UInt(5.W))
    val outPort_f = Output(UInt((5*(LINK_WIDTH+1)).W))
  })
  addResource("/router.v")
}
