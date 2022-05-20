package argo

import blackbox.TdmControllerWrapper
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class TdmControllerSpec extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "TDM Controller master"

  def compareOutputs(dut: TdmControllerWrapper): Unit = {
    val cio = dut.io.chisel
    val vio = dut.io.verilog

    cio.config.expect(vio.config.peek())
    cio.stblEn.expect(vio.stblEn.peek())
    cio.stblIdx.expect(vio.stblIdx.peek())
    cio.periodBoundary.expect(vio.periodBoundary.peek())
    cio.periodCnt.expect(vio.periodCnt.peek())
    cio.masterRun.expect(vio.masterRun.peek())
  }

  it should "toggle the masterRun signal" in {
    test(new TdmControllerWrapper(true)).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)) {dut =>
      dut.io.in.config.en.poke(true.B)
      dut.io.in.sel.poke(true.B)
      dut.io.in.config.wr.poke(true.B)
      dut.io.in.config.addr.poke(0x4.U)
      dut.io.in.config.wrData.poke(1.U)
      //After 3 cc, we should see masterRun output high
      dut.io.chisel.masterRun.expect(false.B)
      dut.clock.step(3)
      compareOutputs(dut)
      dut.io.chisel.masterRun.expect(true.B)

      //Disabling the 'en' signal should still cause masterRun to be high
      dut.io.in.config.en.poke(false.B)
      for(_ <- 0 until 10) {
        dut.clock.step()
        compareOutputs(dut)
        dut.io.chisel.masterRun.expect(true.B)
      }
      //Writing 0 and re-enabling should disable masterRun after 3 cc
      dut.io.in.config.en.poke(true.B)
      dut.io.in.config.wrData.poke(0.U)
      dut.clock.step(3)
      compareOutputs(dut)
      dut.io.chisel.masterRun.expect(false.B)
    }
  }

  it should "increment stblIdx and wrap around when running" in {
    test(new TdmControllerWrapper(true)).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)) {dut =>
      dut.io.in.run.poke(true.B)
      dut.io.in.t2n.poke(4.U)
      dut.io.in.stblMaxp1.poke(6.U)
      dut.io.in.stblMin.poke(0.U)

      for(_ <- 0 until 100) {
        dut.clock.step()
        compareOutputs(dut)
      }
    }
  }

  it should "disallow reading addresses larger than 4" in {
    test(new TdmControllerWrapper(true)).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)) {dut =>
      dut.io.in.config.en.poke(true.B)
      dut.io.in.sel.poke(true.B)
      dut.io.in.config.wr.poke(false.B)

      val addr = scala.util.Random.shuffle(Seq(0, 1, 2, 3, 4, 5, 6, 10, 20, 42))
      for(a <- addr) {
        dut.io.in.config.addr.poke(a)
        dut.clock.step()
        compareOutputs(dut)
        dut.io.chisel.config.error.expect((a >= 5).B)
      }
    }
  }

  it should "disallow writing other addresses than 4" in {
    test(new TdmControllerWrapper(true)).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)) {dut =>
      dut.io.in.config.en.poke(true.B)
      dut.io.in.sel.poke(true.B)
      dut.io.in.config.wr.poke(true.B)

      val addr = scala.util.Random.shuffle(Seq(0, 1, 2, 3, 4, 5, 6, 10, 20, 42))
      for(a <- addr) {
        dut.io.in.config.addr.poke(a)
        dut.clock.step()
        compareOutputs(dut)
        dut.io.chisel.config.error.expect((a != 4).B)
      }
    }
  }

  behavior of "TDM controller slave"

  it should "not toggle masterRun" in {
    test(new TdmControllerWrapper(false)).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)) {dut =>
      dut.io.in.config.en.poke(true.B)
      dut.io.in.sel.poke(true.B)
      dut.io.in.config.wr.poke(true.B)
      dut.io.in.config.addr.poke(0x4.U)
      dut.io.in.config.wrData.poke(1.U)
      //After 3 cc, we should NOT see masterRun output high
      dut.io.chisel.masterRun.expect(false.B)
      dut.clock.step(3)
      compareOutputs(dut)
      dut.io.chisel.masterRun.expect(false.B)

      //Disabling the 'en' signal should still cause masterRun to be low
      dut.io.in.config.en.poke(false.B)
      for(_ <- 0 until 10) {
        dut.clock.step()
        compareOutputs(dut)
        dut.io.chisel.masterRun.expect(false.B)
      }
      //Writing 0 and re-enabling should disable masterRun after 3 cc
      dut.io.in.config.en.poke(true.B)
      dut.io.in.config.wrData.poke(0.U)
      dut.clock.step(3)
      compareOutputs(dut)
      dut.io.chisel.masterRun.expect(false.B)
    }
  }
}
