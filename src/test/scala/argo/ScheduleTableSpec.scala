package argo

import chisel3._
import chisel3.experimental.BundleLiterals._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import blackbox.ScheduleTableWrapper
import ArgoBundles._
import ArgoTypes._

class ScheduleTableSpec extends AnyFlatSpec with  ChiselScalatestTester{
  behavior of "Schedule Table"

  def compareOutputs(dut: ScheduleTableWrapper): Unit = {
    val vio = dut.io.verilog
    val cio = dut.io.chisel

    cio.config.expect(vio.config.peek())
    cio.pktman.expect(vio.pktman.peek())
  }

  it should "change stbl output when data is written in on the config bus" in {
    test(new ScheduleTableWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>

      val wrData = (new SchedTableContents).Lit(
        _.route -> 0.U, _.dma -> 1.U, _.t2n -> 2.U, _.pktLen -> 3.U
      ).litValue
      dut.io.in.sel.poke(true.B)
      dut.io.in.config.en.poke(true.B)
      dut.io.in.config.wr.poke(true.B)
      dut.io.in.config.addr.poke(4)
      dut.io.in.config.wrData.poke(wrData.U)

      dut.clock.step()
      dut.io.in.sel.poke(false.B)
      dut.io.in.config.en.poke(false.B)

      dut.clock.step()
      //At this point we should see some outputs on the slave bus
      compareOutputs(dut)
      dut.io.chisel.config.rdData.expect(wrData.U)

      //but the packet manager outputs should not have changed
      dut.io.chisel.pktman.dmaNum.expect(0.U)

      dut.io.in.tdm.stblEn.poke(true.B)
      dut.io.in.tdm.stblIdx.poke(4.U)
      dut.clock.step()
      //Now the stbl outputs should also have changed
      compareOutputs(dut)
      dut.io.chisel.pktman.dmaNum.expect(1.U)

      dut.clock.step()
    }
  }

  it should "set pktman.en=false when current dma value is all ones when tdmEn=true" in {
    test(new ScheduleTableWrapper).withAnnotations(Seq(WriteVcdAnnotation)) {dut =>

    }
  }

  it should "generate an error if the config address is too high" in {
    test(new ScheduleTableWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      dut.io.in.config.addr.poke(1 << CPKT_ADDR_WIDTH-1)
      dut.io.in.sel.poke(true.B)
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.config.error.expect(true.B)
    }
  }
}
