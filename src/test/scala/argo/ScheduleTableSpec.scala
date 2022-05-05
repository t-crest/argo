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
    cio.t2n.expect(vio.t2n.peek())
  }

  it should "change stbl output when data is written in on the config bus" in {
    test(new ScheduleTableWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)) {dut =>

//      val wrData = (new SchedTableContents).Lit(
//        _.route -> 15.U, _.dma -> 1.U, _.t2n -> 3.U, _.pktLen -> 7.U
//      ).litValue
      val dma = 1
      val t2n = 3
      val pktlen = 7
      val route = 15
      val expect = route << HALF_WORD_WIDTH | dma << QUAD_WORD_WIDTH | pktlen << STBL_T2N_WIDTH | t2n
      dut.io.in.sel.poke(true.B)
      dut.io.in.config.en.poke(true.B)
      dut.io.in.config.wr.poke(true.B)
      dut.io.in.config.addr.poke(5)
      dut.io.in.config.wrData.poke(expect.U)

      dut.clock.step()
      dut.io.in.sel.poke(false.B)
      dut.io.in.config.en.poke(false.B)

      dut.clock.step(3)
      //At this point we should see some outputs on the slave bus
      compareOutputs(dut)
      println(s"Expecting $expect (${expect.toBinaryString})")
      dut.io.chisel.config.rdData.expect(expect.U)

      //but the packet manager outputs should not have changed
      dut.io.chisel.pktman.dmaNum.expect(0.U)

      dut.io.in.tdm.en.poke(true.B)
      dut.io.in.tdm.idx.poke(5.U)
      dut.clock.step()
      //Now the stbl outputs should also have changed
      compareOutputs(dut)
      dut.io.chisel.t2n.expect(3.U)
      dut.io.chisel.pktman.dmaNum.expect(1.U)
      dut.io.chisel.pktman.pktLen.expect(7.U)
      dut.io.chisel.pktman.route.expect(15.U)

      dut.clock.step()
    }
  }

  it should "set pktman.en=false when current dma value is all ones when tdmEn=true" in {
    test(new ScheduleTableWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)) {dut =>
      dut.io.in.tdm.en.poke(true.B)

      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.pktman.dmaEn.expect(true.B) //should be true because tdm.en was true on previous cc

      //Write in some data where dma number is all 1's
      val wrData = (new SchedTableContents).Lit(
        _.route -> 0.U, _.dma -> ((1 << DMATBL_IDX_WIDTH)-1).U, _.t2n -> 2.U, _.pktLen -> 3.U
      ).litValue
      dut.io.in.sel.poke(true.B)
      dut.io.in.config.en.poke(true.B)
      dut.io.in.config.wr.poke(true.B)
      dut.io.in.config.wrData.poke(wrData.U)
      dut.clock.step()
      dut.io.in.sel.poke(false.B)
      dut.io.in.config.en.poke(false.B)
      dut.clock.step()
      //At this point we should see some outputs on the slave bus
      compareOutputs(dut)
      //Now, dma read should be all 1's, causing dma en to be false
      dut.io.chisel.pktman.dmaEn.expect(false.B)
      dut.clock.step()

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
