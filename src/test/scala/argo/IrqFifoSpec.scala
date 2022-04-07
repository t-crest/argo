package argo

import blackbox.IrqFifoWrapper
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class IrqFifoSpec extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "IRQ Fifo"

  def compareOutputs(dut: IrqFifoWrapper): Unit = {
    val cio = dut.io.chisel
    val vio = dut.io.verilog

    cio.irq.irqSig.expect(vio.irq.irqSig.peek())
    cio.irq.dataSig.expect(vio.irq.dataSig.peek())

    cio.config.error.expect(vio.config.error.peek())
    cio.config.rdData.expect(vio.config.rdData.peek())
  }

  it should "compile" in {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      for(i <- 0 until 3) {
        dut.clock.step()
        compareOutputs(dut)
      }

    }
  }
}
