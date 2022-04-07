package blackbox

import chisel3._
import chisel3.util.HasBlackBoxResource
import argo.ArgoTypes._

/**
 * A blackbox around the Verilog version of irq_fifo.vhd generated with GHDL
 */
class irq_fifo extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clk = Input(Bool())
    val reset = Input(Bool())
    val config_addr =Input(UInt(MEM_ADDR_WIDTH.W))
    val config_en = Input(Bool())
    val config_wr = Input(Bool())
    val config_wdata = Input(UInt(WORD_WIDTH.W))
    val sel = Input(Bool())
    val irq_data_fifo_data_valid = Input(Bool())
    val irq_irq_fifo_data_valid = Input(Bool())
    val irq_data_fifo_data = Input(UInt(IRQ_DATA_WIDTH.W))
    val config_slv_rdata = Output(UInt(WORD_WIDTH.W))
    val config_slv_error = Output(Bool())
    val irq_irq_sig = Output(Bool())
    val irq_data_sig = Output(Bool())
  })
  addResource("/irq_fifo.v")
}
