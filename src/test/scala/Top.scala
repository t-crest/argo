import argo._
import chisel3.RawModule
import chisel3.stage.ChiselStage
import org.scalatest.flatspec.AnyFlatSpec

class Top extends AnyFlatSpec {
  behavior of "Compilation"

  def compile(gen: => RawModule): Unit = {
    (new ChiselStage).emitVerilog(gen, Array("-td", "gen"))
  }

  it should "compile RX unit" in {
    compile(new RxUnit)
  }
}
