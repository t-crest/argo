package argo

import blackbox.McControllerWrapper
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import argo.ArgoTypes._

class McControllerSpec extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "Mode change controller"

  def compareOutputs(dut: McControllerWrapper): Unit = {
    val cio = dut.io.chisel
    val vio = dut.io.verilog

    cio.config.expect(vio.config.peek())
    cio.stblMin.expect(vio.stblMin.peek())
    cio.stblMaxp1.expect(vio.stblMaxp1.peek())
    cio.mc.expect(vio.mc.peek())
    cio.mcIdx.expect(vio.mcIdx.peek())
    cio.mcP.expect(vio.mcP.peek())
  }

  def stepCompare(dut: McControllerWrapper): Unit = {
    dut.clock.step()
    compareOutputs(dut)
  }

  it should "change and read the value of MODE_CHANGE_IDX" in {
    test(new McControllerWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      //to change MODE_CHANGE_IDX, we write to address "0"
      //When local_mode_change_idx=true, that changes mode_change_idx_reg
        //localMcIdx=true whenever we write to that address
      //if run=1 while we write, that moves us to state waitMc where we wait for a period boundary
      //on a boundary, we set mc_next=1 and go to modechange state
      //in that state, out.mc should be true
      //on the next period boundary, the global mode change idx should go high, modifying mode_idx_reg

      //First, attempt to read the current value of MODE_IDX_reg
      dut.io.in.periodBoundary.poke(false.B)
      dut.io.in.run.poke(true.B)
      dut.io.in.sel.poke(true.B)
      dut.io.in.config.en.poke(true.B)
      dut.io.in.config.wr.poke(false.B)
      dut.io.in.config.addr.poke(0.U)
      dut.io.in.config.wrData.poke(1.U)
      stepCompare(dut)
      dut.io.chisel.config.rdData.expect(0.U)

      //Now, attempt to write it
      dut.io.in.config.wr.poke(true.B)
      stepCompare(dut)

      //Disengage writing
      dut.io.in.sel.poke(false.B)
      //value of mcIdx should have updated
      dut.io.chisel.mcIdx.expect(1.U)
      stepCompare(dut)

      //Run for a couple of cc keeping periodBoundary low, don't expect any changes
      for(_ <- 0 until 5) {
        stepCompare(dut)
        dut.io.chisel.mc.expect(false.B)
        dut.io.chisel.config.rdData.expect(0.U)
      }

      //Now, take periodBoundary high for one cc, we expect to move into state sModeChange where out.mc=1
      dut.io.in.periodBoundary.poke(true.B)
      stepCompare(dut)

      dut.io.in.periodBoundary.poke(false.B)
      dut.io.chisel.mc.expect(true.B)

      //Again, run for a couple of cc to verify that things are the same
      for(_ <- 0 until 5) {
        stepCompare(dut)
        dut.io.chisel.mc.expect(true.B)
        dut.io.chisel.config.rdData.expect(0.U)
      }

      //Take periodBoundary high again. This should update MODE_IDX_reg and disable out.mc
      dut.io.in.periodBoundary.poke(true.B)
      stepCompare(dut)
      dut.io.in.periodBoundary.poke(false.B)
      dut.io.chisel.mc.expect(false.B)

      //We still expect rdData to be 0 as we haven't specifically read it yet
      dut.io.chisel.config.rdData.expect(0.U)

      //Attempt to read it
      dut.io.in.sel.poke(true.B)
      dut.io.in.config.wr.poke(false.B)
      stepCompare(dut)
      dut.io.chisel.config.rdData.expect(1.U)
    }
  }

  it should "generate an error when reading other addresses than 0" in {
    test(new McControllerWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      dut.io.in.config.en.poke(true.B)
      dut.io.in.config.wr.poke(false.B)
      dut.io.in.sel.poke(true.B)

      //Generates random positive values between 2^(CPKT_ADDR_WIDTH) (exclusive) and 1 (inclusive)
      val addr = Seq.fill(5)(scala.util.Random.nextInt((1 << CPKT_ADDR_WIDTH)-1) + 1)
      for(a <- addr) {
        println(s"Poking address $a")
        dut.io.in.config.addr.poke(a.U)
        stepCompare(dut)
        dut.io.chisel.config.error.expect(true.B)
      }

    }
  }

  it should "not generate an error when writing to an address that maps to a mcTblAddr" in {
    test(new McControllerWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)) { dut =>

      //mcTblAddr is the input address - 2. If within range [0;2^MCTBL_IDX_WIDTH[ it deasserts the error signal
      //since MCTBL_IDX_WIDTH=2, addresses [2;5] should deassert the error signal
      val addr = Seq(0,1,2,3,4,5,6)
      val badAddr = Seq(1,6)
      dut.io.in.config.en.poke(true.B)
      dut.io.in.config.wr.poke(true.B)
      dut.io.in.sel.poke(true.B)

      for(a <- addr) {
        println(s"Poking address $a, expecting ${badAddr.contains(a)}")
        dut.io.in.config.addr.poke(a.U)
        stepCompare(dut)
        dut.io.chisel.config.error.expect(badAddr.contains(a).B)
      }
    }
  }

  it should "generate an error when writing other addresses than 0 that do not map to a mcTblAddr" in {
    test(new McControllerWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      dut.io.in.config.en.poke(true.B)
      dut.io.in.config.wr.poke(true.B)
      dut.io.in.sel.poke(true.B)

      //mcTblAddr is the input address - 2. If within range [0;2^MCTBL_IDX_WIDTH[ it deasserts the error signal
      //since MCTBL_IDX_WIDTH=2, addresses [2;5] should deassert the error signal
      //We wish to attempt an address >=6, as this should generate an error

      //Generates random positive values between 2^(CPKT_ADDR_WIDTH) (exclusive) and 6 (inclusive)
      val addr = Seq.fill(5)(scala.util.Random.nextInt((1 << CPKT_ADDR_WIDTH)-6) + 6)
      for(a <- addr) {
        println(s"Poking address $a")
        dut.io.in.config.addr.poke(a.U)
        stepCompare(dut)
        dut.io.chisel.config.error.expect(true.B)
      }
    }
  }

  it should "write mode change registers" in {
    test(new McControllerWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      //To write the mode-change registers, we write to one of addresses [2:5] which map to mode index [0:3]
      //This is transferred to mode_reg, and read into stblMinNext and stblMaxp1Next

      //On period boundary, stbl_min/max are updated
      dut.io.in.periodBoundary.poke(false.B)
      dut.io.in.config.en.poke(true.B)
      dut.io.in.sel.poke(true.B)
      dut.io.in.config.wr.poke(true.B)
      dut.io.in.config.addr.poke(2.U) //corresponds to mode 0, the initial value of mcIdx

      //We expect stbl min/max to start at 0
      dut.io.chisel.stblMin.expect(0.U)
      dut.io.chisel.stblMaxp1.expect(0.U)
      val wrData = 42 | (84 << HALF_WORD_WIDTH) //min=42 in lower bits, max=84 in upper bits

      dut.io.in.config.wrData.poke(wrData.U)
      stepCompare(dut)
      dut.io.in.sel.poke(false.B) //Disable further writes

      //Loop for a couple of cc, we don't expect stbl min/max to change
      for(_ <- 0 until 5) {
        stepCompare(dut)
        dut.io.chisel.stblMin.expect(0.U)
        dut.io.chisel.stblMaxp1.expect(0.U)
      }

      //Toggle the period boundary.
      //We expect stblMin to update combinationally but stblMax to update with the register
      dut.io.in.periodBoundary.poke(true.B)

      dut.io.chisel.stblMin.expect(42.U)
      dut.io.chisel.stblMaxp1.expect(0.U)
      compareOutputs(dut)
      stepCompare(dut)
      dut.io.in.periodBoundary.poke(false.B)

      //We expect min to stay constant, max should now have updated as well
      for(_ <- 0 until 5) {
        dut.io.chisel.stblMin.expect(42.U)
        dut.io.chisel.stblMaxp1.expect(84.U)
        stepCompare(dut)
      }
    }
  }

  it should "update the value of mcCnt" in {
    test(new McControllerWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      //the internal register mcCnt is updated whenever we write to the mc controller
      //the value becomes 2+tdm.periodCount
      dut.io.in.periodBoundary.poke(false.B)
      dut.io.in.config.en.poke(true.B)
      dut.io.in.sel.poke(true.B)
      dut.io.in.config.wr.poke(true.B)
      dut.io.in.config.addr.poke(0.U)

      for(i <- 0 until 4) {
        println(s"Poking $i, expecting ${(i+2) & 0x3}")
        dut.io.in.mcPCnt.poke(i.U)
        stepCompare(dut)
        dut.io.chisel.mcP.expect(((i+2) & 0x3).U)
      }
    }
  }
}
