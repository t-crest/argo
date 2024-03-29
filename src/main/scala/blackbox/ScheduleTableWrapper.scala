package blackbox

import chisel3._
import argo.ArgoBundles._
import argo.ArgoTypes._
import argo.ScheduleTable

class ScheduleTableWrapper extends Module {
  val io = IO(new Bundle {
    val in = new Bundle {
      val config = Input(new ConfigIfMaster)
      val sel = Input(Bool())
      val tdm = Flipped(new TdmControlSchedTblIO)
    }
    val chisel = Output(new Bundle {
      val config = new ConfigIfSlave
      val pktman = new SchedTblPacketManIO
      val t2n = Output(UInt(STBL_T2N_WIDTH.W))
    })
    val verilog = Output(new Bundle {
      val config = new ConfigIfSlave
      val pktman = new SchedTblPacketManIO
      val t2n = Output(UInt(STBL_T2N_WIDTH.W))
    })
  })
  val c = Module(new ScheduleTable)
  val v = Module(new schedule_table)

  //Inputs
  c.io.config.m := io.in.config
  c.io.config.sel := io.in.sel
  c.io.tdm <> io.in.tdm

  v.io.clk := this.clock.asBool
  v.io.reset := this.reset.asBool
  v.io.config_addr := io.in.config.addr
  v.io.config_en := io.in.config.en
  v.io.config_wdata := io.in.config.wrData
  v.io.config_wr := io.in.config.wr
  v.io.sel := io.in.sel
  v.io.stbl_idx := io.in.tdm.idx
  v.io.stbl_idx_en := io.in.tdm.en

  //Outputs
  io.chisel.config := c.io.config.s
  io.chisel.pktman := c.io.pktman
  io.chisel.t2n := c.io.tdm.t2n

  io.verilog.config.rdData := v.io.config_slv_rdata
  io.verilog.config.error := v.io.config_slv_error
  io.verilog.pktman.dmaNum := v.io.dma_num
  io.verilog.pktman.dmaEn := v.io.dma_en
  io.verilog.pktman.pktLen := v.io.pkt_len
  io.verilog.t2n := v.io.t2n
  io.verilog.pktman.route := v.io.route

}
