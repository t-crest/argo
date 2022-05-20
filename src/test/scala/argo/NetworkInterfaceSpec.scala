package argo

import blackbox.NetworkInterfaceWrapper
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class NetworkInterfaceSpec extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "Network Interface"

  def compareOutputs(dut: NetworkInterfaceWrapper): Unit = {
    val vio = dut.io.verilog
    val cio = dut.io.chisel

    cio.spm.expect(vio.spm.peek())
    cio.ocp.expect(vio.ocp.peek())
    cio.pkt.expect(vio.pkt.peek())
    cio.configIrq.expect(vio.configIrq.peek())
    cio.dataIrq.expect(vio.dataIrq.peek())
    cio.masterRun.expect(vio.masterRun.peek())
  }

  def stepCompare(dut: NetworkInterfaceWrapper): Unit = {
    dut.clock.step()
    compareOutputs(dut)
  }

  it should "compile" in {
    test(new NetworkInterfaceWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      for(_ <- 0 until 5) {
        stepCompare(dut)
      }
    }
  }
}
