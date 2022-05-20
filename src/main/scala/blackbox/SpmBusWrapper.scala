package blackbox

import chisel3._
import argo.SpmBus
import argo.ArgoBundles._
import argo.ArgoTypes._

class SpmBusWrapper extends Module {
  val io = IO(new Bundle {
    val in = Input(new Bundle{
      val spmSlv = new MemoryIfSlave
      val txSpm = new MemoryIfMaster
      val rxSpm = new MemoryIfMaster
    })
    val chisel = Output(new Bundle {
      val spm = new MemoryIfMaster
      val txSpmSlv = new MemoryIfSlave
    })
    val verilog = Output(new Bundle {
      val spm = new MemoryIfMaster
      val txSpmSlv = new MemoryIfSlave
    })
  })

  val c = Module(new SpmBus)  //Chisel version
  val v = Module(new spm_bus) //Verilog version
  //Inputs
  c.io.spmSlv := io.in.spmSlv
  c.io.txSpm := io.in.txSpm
  c.io.rxSpm := io.in.rxSpm

  v.io.clk := this.clock.asBool
  v.io.reset := this.reset.asBool
  v.io.spm_slv_error := io.in.spmSlv.error
  v.io.spm_slv_rdata := io.in.spmSlv.rdData
  v.io.tx_spm_en := io.in.txSpm.en.asUInt
  v.io.tx_spm_wr := io.in.txSpm.wr
  v.io.tx_spm_addr := io.in.txSpm.addr
  v.io.tx_spm_wdata := io.in.txSpm.wrData
  v.io.rx_spm_en := io.in.rxSpm.en.asUInt
  v.io.rx_spm_wr := io.in.rxSpm.wr
  v.io.rx_spm_addr := io.in.rxSpm.addr
  v.io.rx_spm_wdata := io.in.rxSpm.wrData
  
  //Outputs
  io.chisel.spm := c.io.spm
  io.chisel.txSpmSlv := c.io.txSpmSlv

  io.verilog.spm.wr := v.io.spm_wr
  io.verilog.spm.en(0) := v.io.spm_en(0)
  io.verilog.spm.en(1) := v.io.spm_en(1)
  io.verilog.spm.wrData := v.io.spm_wdata
  io.verilog.spm.addr := v.io.spm_addr
  io.verilog.txSpmSlv.rdData := v.io.tx_spm_slv_rdata
  io.verilog.txSpmSlv.error := v.io.tx_spm_slv_error
}
