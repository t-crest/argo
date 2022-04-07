package blackbox

import chisel3._
import argo.ArgoBundles._
import argo.IrqFIFO

class IrqFifoWrapper extends Module {
  val io = IO(new Bundle {
    val in = new Bundle {
      val irq = Input(new IrqFifoInput)
      val config = Input(new ConfigIfMaster)
      val sel = Input(Bool())
    }
    val chisel = new Bundle {
      val irq = Output(new IrqFifoOutput)
      val config = Output(new ConfigIfSlave)
    }
    val verilog = new Bundle {
      val irq = Output(new IrqFifoOutput)
      val config = Output(new ConfigIfSlave)
    }
  })

  val v = Module(new irq_fifo)
  val c = Module(new IrqFIFO)

  //Assign inputs
  v.io.clk := this.clock.asBool
  v.io.reset := this.reset.asBool
  v.io.config_addr := io.in.config.addr
  v.io.config_en := io.in.config.en
  v.io.config_wr := io.in.config.wr
  v.io.config_wdata := io.in.config.wrData
  v.io.sel := io.in.sel
  v.io.irq_data_fifo_data_valid := io.in.irq.dataValid
  v.io.irq_irq_fifo_data_valid := io.in.irq.irqValid
  v.io.irq_data_fifo_data := io.in.irq.data

  c.io.irqIn := io.in.irq
  c.io.config.m := io.in.config
  c.io.sel := io.in.sel

  //Assign outputs
  io.verilog.config.rdData :=  v.io.config_slv_rdata
  io.verilog.config.error := v.io.config_slv_error
  io.verilog.irq.irqSig := v.io.irq_irq_sig
  io.verilog.irq.dataSig := v.io.irq_data_sig

  io.chisel.irq := c.io.irqOut
  io.chisel.config := c.io.config.s
}
