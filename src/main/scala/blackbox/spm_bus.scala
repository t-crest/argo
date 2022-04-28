package blackbox

import argo.ArgoTypes._
import chisel3._
import chisel3.util.HasBlackBoxResource

class spm_bus extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clk = Input(Bool())
    val reset = Input(Bool())
    val spm_slv_rdata = Input(UInt(DWORD_WIDTH.W))
    val spm_slv_error = Input(Bool())
    val tx_spm_addr = Input(UInt(MEM_ADDR_WIDTH.W))
    val tx_spm_en = Input(UInt(2.W))
    val tx_spm_wr = Input(Bool())
    val tx_spm_wdata = Input(UInt(DWORD_WIDTH.W))
    val rx_spm_addr = Input(UInt(MEM_ADDR_WIDTH.W))
    val rx_spm_en = Input(UInt(2.W))
    val rx_spm_wr = Input(Bool())
    val rx_spm_wdata = Input(UInt(DWORD_WIDTH.W))
    val spm_addr = Output(UInt(MEM_ADDR_WIDTH.W))
    val spm_en = Output(UInt(2.W))
    val spm_wr = Output(Bool())
    val spm_wdata = Output(UInt(DWORD_WIDTH.W))
    val tx_spm_slv_rdata = Output(UInt(DWORD_WIDTH.W))
    val tx_spm_slv_error = Output(Bool())
  })
  addResource("/spm_bus.v")
}
