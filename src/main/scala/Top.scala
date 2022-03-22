import chisel3._
import chisel3.stage.ChiselStage

object Top extends App {
  (new ChiselStage).emitVerilog(new argo.RxUnit, Array("-td", "gen"))
}
