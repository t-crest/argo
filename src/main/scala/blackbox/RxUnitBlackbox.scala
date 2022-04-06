package blackbox

import argo.ArgoBundles.{ConfigIfMaster, IrqFifoInput, MemoryIfMaster}
import argo.ArgoTypes.{DWORD_WIDTH, LINK_WIDTH, MEM_ADDR_WIDTH, WORD_WIDTH}
import chisel3._
import chisel3.util.HasBlackBoxResource

/**
 * A blackbox around the Verilog version of rx_unit.vhd generated with GHDL
 */
class RxUnitBlackbox extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clk = Input(Bool())
    val reset = Input(Bool())
    val pkt_in = Input(UInt(LINK_WIDTH.W))
    val spm_addr = Output(UInt(MEM_ADDR_WIDTH.W))
    val spm_en = Output(UInt(2.W))
    val spm_wr = Output(Bool())
    val spm_wdata = Output(UInt(DWORD_WIDTH.W))
    val config_addr = Output(UInt(MEM_ADDR_WIDTH.W))
    val config_en = Output(Bool())
    val config_wr = Output(Bool())
    val config_wdata = Output(UInt(WORD_WIDTH.W))
    val irq_fifo_data = Output(UInt(MEM_ADDR_WIDTH.W))
    val irq_fifo_data_valid = Output(Bool())
    val irq_fifo_irq_valid = Output(Bool())
  })
  addResource("/rx_unit.v")
}
