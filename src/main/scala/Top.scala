import chisel3._
import chisel3.stage.ChiselStage
import argo._
import blackbox.{rx_unit, RxUnitWrapper}


object Top extends App {
  (new ChiselStage).emitVerilog(new RxUnitWrapper, Array("-td", "gen"))
}
