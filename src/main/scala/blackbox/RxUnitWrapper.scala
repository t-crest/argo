package blackbox

import argo.ArgoBundles._
import argo.ArgoTypes.LINK_WIDTH
import argo.RxUnit
import chisel3._

/**
 * A wrapper around the Chisel and Blackbox version of the Rx Unit, for testing purposes
 */
class RxUnitWrapper extends Module {
  val io = IO(new Bundle {
    val in = new Bundle {
      /** Input packet from router */
      val pkt = Input(UInt(LINK_WIDTH.W))
    }
    val chisel = new Bundle {
      /** Outputs to SPM */
      val spm = Output(new MemoryIfMaster)
      /** Outputs to internal MEM bus */
      val config = Output(new ConfigIfMaster)
      /** Signals to IRQ FIFO */
      val irq = Output(new IrqFifoInput)
    }
    val verilog = new Bundle {
      /** Outputs to SPM */
      val spm = Output(new MemoryIfMaster)
      /** Outputs to internal MEM bus */
      val config = Output(new ConfigIfMaster)
      /** Signals to IRQ FIFO */
      val irq = Output(new IrqFifoInput)
    }
  })

  val Chisel = Module(new RxUnit)
  val Verilog = Module(new RxUnitBlackbox)
  Chisel.io.pkt := io.in.pkt

  io.chisel.spm := Chisel.io.spm
  io.chisel.config := Chisel.io.config
  io.chisel.irq := Chisel.io.irq

  Verilog.io.clk := this.clock.asBool
  Verilog.io.reset := this.reset.asBool
  Verilog.io.pkt_in := io.in.pkt

  io.verilog.spm.addr := Verilog.io.spm_addr
  io.verilog.spm.en := Verilog.io.spm_en.asBools
  io.verilog.spm.wr := Verilog.io.spm_wr
  io.verilog.spm.wrData := Verilog.io.spm_wdata

  io.verilog.config.en := Verilog.io.config_en
  io.verilog.config.wr := Verilog.io.config_wr
  io.verilog.config.wrData := Verilog.io.config_wdata
  io.verilog.config.addr := Verilog.io.config_addr

  io.verilog.irq.data := Verilog.io.irq_fifo_data
  io.verilog.irq.dataValid := Verilog.io.irq_fifo_data_valid
  io.verilog.irq.irqValid := Verilog.io.irq_fifo_irq_valid
}
