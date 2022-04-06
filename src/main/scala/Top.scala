import chisel3._
import chisel3.stage.ChiselStage
import argo._
import blackbox.{RxUnitBlackbox, RxUnitWrapper}


object Top extends App {
  (new ChiselStage).emitVerilog(new RxUnitWrapper, Array("-td", "gen"))
}
