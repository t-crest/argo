import chisel3._
import chisel3.stage.ChiselStage
import argo._
import blackbox._


object Top extends App {
  (new ChiselStage).emitVerilog(new IrqFifoWrapper, Array("-td", "gen"))
}
