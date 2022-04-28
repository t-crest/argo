package argo

import argo.ArgoTypes._
import argo.ArgoBundles.MemoryIfMaster
import blackbox.SpmBusWrapper
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class SpmBusSpec extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "Spm Bus"

  def compareOutputs(dut: SpmBusWrapper): Unit = {
    dut.io.chisel.spm.expect(dut.io.verilog.spm.peek())
    dut.io.chisel.txSpmSlv.expect(dut.io.verilog.txSpmSlv.peek())
  }

  def stepCompare(dut: SpmBusWrapper): Unit = {
    dut.clock.step()
    compareOutputs(dut)
  }

  def pokeRandom(port: MemoryIfMaster): Unit = {
    val wr = scala.util.Random.nextBoolean()
    val addr = scala.util.Random.nextInt(1 << MEM_ADDR_WIDTH)
    val wrData = scala.util.Random.nextLong().abs
    val en0 = scala.util.Random.nextBoolean() //one or both should be true
    val en1 = if(en0) scala.util.Random.nextBoolean() else true


    port.wr.poke(wr.B)
    port.addr.poke(addr.U)
    port.wrData.poke(wrData.U)
    port.en(0).poke(en0)
    port.en(1).poke(en1)
  }

  it should "forward data on txSpm to the output" in {
    test(new SpmBusWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      for(_ <- 0 until 10) {
        pokeRandom(dut.io.in.txSpm)
        stepCompare(dut)
      }

    }
  }

  it should "forward data on rxSpm to the output" in {
    test(new SpmBusWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      for(_ <- 0 until 10) {
        pokeRandom(dut.io.in.rxSpm)
        stepCompare(dut)
      }
    }
  }

  it should "forward data on spmSlv to txSpmSlv" in {
    test(new SpmBusWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      for(_ <- 0 until 10) {
        dut.io.in.spmSlv.rdData.poke(scala.util.Random.nextLong().abs)
        dut.io.in.spmSlv.error.poke(scala.util.Random.nextBoolean().B)
        stepCompare(dut)
      }
    }
  }

  it should "prefer rxSpmBuf to rxSpm" in {
    test(new SpmBusWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      dut.io.in.rxSpm.wr.poke(true.B)
      dut.io.in.rxSpm.wrData.poke(42.U)
      dut.io.in.rxSpm.addr.poke(84.U)
      dut.io.in.rxSpm.en(0).poke(true.B)
      dut.io.in.rxSpm.en(1).poke(false.B)
      dut.io.in.txSpm.en(0).poke(true.B)

      dut.clock.step()
      dut.io.in.txSpm.en(0).poke(false.B)
      dut.io.in.rxSpm.wrData.poke(43.U)

      compareOutputs(dut)
      dut.io.chisel.spm.wrData.expect(42.U)

      stepCompare(dut)
      dut.io.chisel.spm.wrData.expect(43.U)
    }
  }
}
