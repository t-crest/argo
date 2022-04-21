package argo

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import blackbox.ConfigBusWrapper
import ArgoTypes._
import ocp.OcpTypes.{OCP_CMD_RD, OCP_CMD_WR}

class ConfigBusSpec extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "Configuration bus"

  def compareOutputs(dut: ConfigBusWrapper): Unit = {
    val vio = dut.io.verilog
    val cio = dut.io.chisel

    cio.config.expect(vio.config.peek())
    cio.ocp.expect(vio.ocp.peek())
    cio.sel.dma.expect(vio.sel.dma.peek())
    cio.sel.irq.expect(vio.sel.irq.peek())
    cio.sel.mc.expect(vio.sel.mc.peek())
    cio.sel.tdm.expect(vio.sel.tdm.peek())
    cio.sel.schedTable.expect(vio.sel.schedTable.peek())
  }

  it should "enable the correct bank based on bank id on config bus" in {
    test(new ConfigBusWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      //bank ID is placed at bits [13:11]
      val shamt = HEADER_FIELD_WIDTH-HEADER_CTRL_WIDTH-CPKT_BANK_WIDTH
      dut.io.in.config.en.poke(false.B)

      dut.io.in.slaves.dma.rdData.poke(10.U)
      dut.io.in.slaves.schedTable.rdData.poke(20.U)
      dut.io.in.slaves.tdm.rdData.poke(30.U)
      dut.io.in.slaves.mc.rdData.poke(40.U)
      dut.io.in.slaves.irq.rdData.poke(50.U)

      compareOutputs(dut)
      dut.clock.step()

      dut.io.in.config.addr.poke(DMA_BANK << shamt)
      //The value of sel should propagate immediately
      dut.io.chisel.sel.dma.expect(true.B)
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.ocp.SData.expect(10.U)

      dut.io.in.config.addr.poke(SCHED_BANK << shamt)
      //The value of sel should propagate immediately
      dut.io.chisel.sel.schedTable.expect(true.B)
      dut.io.chisel.sel.dma.expect(false.B)
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.ocp.SData.expect(20.U)

      dut.io.in.config.addr.poke(TDM_BANK << shamt)
      //The value of sel should propagate immediately
      dut.io.chisel.sel.tdm.expect(true.B)
      dut.io.chisel.sel.schedTable.expect(false.B)
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.ocp.SData.expect(30.U)

      dut.io.in.config.addr.poke(MC_BANK << shamt)
      //The value of sel should propagate immediately
      dut.io.chisel.sel.mc.expect(true.B)
      dut.io.chisel.sel.tdm.expect(false.B)
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.ocp.SData.expect(40.U)

      dut.io.in.config.addr.poke(IRQ_BANK << shamt)
      //The value of sel should propagate immediately
      dut.io.chisel.sel.irq.expect(true.B)
      dut.io.chisel.sel.mc.expect(false.B)
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.ocp.SData.expect(50.U)

      //When poking invalid bank numbers and PERF_BANK, it should forward DMA data
      dut.io.in.config.addr.poke(PERF_BANK << shamt)
      dut.io.chisel.sel.irq.expect(false.B)
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.ocp.SData.expect(10.U)
    }
  }

  it should "enable the correct bank based on bank id on OCP bus" in {
    test(new ConfigBusWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      //bank ID is placed at bits [15:13] on OCP bus
      val shamt = HEADER_FIELD_WIDTH-HEADER_CTRL_WIDTH-CPKT_BANK_WIDTH+2
      dut.io.in.config.en.poke(false.B)
      dut.io.in.ocp.MCmd.poke(OCP_CMD_RD.U)

      dut.io.in.slaves.dma.rdData.poke(10.U)
      dut.io.in.slaves.schedTable.rdData.poke(20.U)
      dut.io.in.slaves.tdm.rdData.poke(30.U)
      dut.io.in.slaves.mc.rdData.poke(40.U)
      dut.io.in.slaves.irq.rdData.poke(50.U)

      compareOutputs(dut)
      dut.clock.step()

      dut.io.in.ocp.MAddr.poke(DMA_BANK << shamt)
      //The value of sel should propagate immediately
      dut.io.chisel.sel.dma.expect(true.B)
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.ocp.SData.expect(10.U)

      dut.io.in.ocp.MAddr.poke(SCHED_BANK << shamt)
      //The value of sel should propagate immediately
      dut.io.chisel.sel.schedTable.expect(true.B)
      dut.io.chisel.sel.dma.expect(false.B)
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.ocp.SData.expect(20.U)

      dut.io.in.ocp.MAddr.poke(TDM_BANK << shamt)
      //The value of sel should propagate immediately
      dut.io.chisel.sel.tdm.expect(true.B)
      dut.io.chisel.sel.schedTable.expect(false.B)
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.ocp.SData.expect(30.U)

      dut.io.in.ocp.MAddr.poke(MC_BANK << shamt)
      //The value of sel should propagate immediately
      dut.io.chisel.sel.mc.expect(true.B)
      dut.io.chisel.sel.tdm.expect(false.B)
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.ocp.SData.expect(40.U)

      dut.io.in.ocp.MAddr.poke(IRQ_BANK << shamt)
      //The value of sel should propagate immediately
      dut.io.chisel.sel.irq.expect(true.B)
      dut.io.chisel.sel.mc.expect(false.B)
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.ocp.SData.expect(50.U)

      //When poking invalid bank numbers and PERF_BANK, it should forward DMA data
      dut.io.in.ocp.MAddr.poke(PERF_BANK << shamt)
      dut.io.chisel.sel.irq.expect(false.B)
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.ocp.SData.expect(10.U)
    }
  }

  it should "only set configOut.wr high if in supervisor mode" in {
    test(new ConfigBusWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      //When supervisor=0, it should keep wr=0 when OCP_CMD is WR
      dut.io.in.config.en.poke(false.B)
      dut.io.in.supervisor.poke(false.B)
      dut.io.in.ocp.MCmd.poke(OCP_CMD_WR.U)

      dut.io.chisel.config.wr.expect(false.B)
      compareOutputs(dut)
      dut.clock.step()
      dut.io.chisel.config.wr.expect(false.B)
      compareOutputs(dut)

      //When supervisor=1, it should set wr=1 only when OCP_CDM is WR
      dut.io.in.supervisor.poke(true.B)
      dut.io.chisel.config.wr.expect(true.B)
      compareOutputs(dut)
      dut.clock.step()
      dut.io.chisel.config.wr.expect(true.B)
      compareOutputs(dut)

      dut.io.in.ocp.MCmd.poke(OCP_CMD_RD.U)
      dut.io.chisel.config.wr.expect(false.B)
      compareOutputs(dut)
      dut.clock.step()
      dut.io.chisel.config.wr.expect(false.B)
      compareOutputs(dut)
    }
  }

  it should "correctly forward config bus requests" in {
    test(new ConfigBusWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      //Attempt to access a number of random addresses
      val addr = Array.fill(10)(scala.util.Random.nextInt(1 << MEM_ADDR_WIDTH))
      val en = Array.fill(10)(scala.util.Random.nextBoolean())
      val wr = Array.fill(10)(scala.util.Random.nextBoolean())
      val wrData = Array.fill(10)(math.abs(scala.util.Random.nextInt()))

      for(i <- 0 until 10) {
        dut.io.in.config.en.poke(en(i).B)
        dut.io.in.config.wr.poke(wr(i).B)
        dut.io.in.config.addr.poke(addr(i).U)
        dut.io.in.config.wrData.poke(wrData(i).U)
        dut.clock.step()
        compareOutputs(dut)
      }
    }
  }

  it should "correctly forward OCP bus requests" in {
    test(new ConfigBusWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      //Attempt to access a number of random addresses
      val addr = Array.fill(10)(scala.util.Random.nextInt(1 << MEM_ADDR_WIDTH))
      val wrData = Array.fill(10)(math.abs(scala.util.Random.nextInt()))

      dut.io.in.config.en.poke(false.B)
      dut.io.in.ocp.MCmd.poke(OCP_CMD_RD)
      for(i <- 0 until 10) {
        dut.io.in.ocp.MAddr.poke(addr(i).U)
        dut.io.in.ocp.MData.poke(wrData(i).U)
        dut.clock.step()
        compareOutputs(dut)
      }
    }
  }

  it should "prioritize config bus over OCP bus" in {
    test(new ConfigBusWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      dut.io.in.supervisor.poke(true.B)

      dut.io.in.ocp.MCmd.poke(OCP_CMD_WR)
      dut.io.in.ocp.MAddr.poke(7.U)
      dut.io.in.ocp.MData.poke(42.U)

      dut.io.in.config.en.poke(true.B)
      dut.io.in.config.wr.poke(false.B)
      dut.io.in.config.addr.poke(1.U)
      dut.io.in.config.wrData.poke(82.U)

      dut.clock.step()
      compareOutputs(dut)
      //Prioritizing config bus, we should see 82 on the config output
      dut.io.chisel.config.wrData.expect(82.U)

      //Disabling config.en we should see the OCP command
      dut.io.in.config.en.poke(false.B)
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.config.wrData.expect(42.U)
    }
  }

  it should "correctly perform OCP signalling" in {
    test(new ConfigBusWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>

    }
  }

}
