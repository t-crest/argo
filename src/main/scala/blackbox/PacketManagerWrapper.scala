package blackbox

import argo.ArgoBundles._
import argo.ArgoTypes._
import argo.PacketManager
import chisel3._

class PacketManagerWrapper extends Module {
  val io = IO(new Bundle {
    val in = Input(new Bundle {
      val config = new ConfigIfMaster
      val sel = Bool()
      val spm = new MemoryIfSlave
      val schedTbl = Flipped(new SchedTblPacketManIO)
      val mc = Flipped(new ModeChangePacketManIO)
    })
    val chisel = Output(new Bundle {
      val config = new ConfigIfSlave
      val spm = new MemoryIfMaster
      val pktOut = UInt(LINK_WIDTH.W)
    })
    val verilog = Output(new Bundle {
      val config = new ConfigIfSlave
      val spm = new MemoryIfMaster
      val pktOut = UInt(LINK_WIDTH.W)
    })
  })

  val c = Module(new PacketManager)
  val v = Module(new packet_manager)

  //Inputs
  c.io.config.m := io.in.config
  c.io.config.sel := io.in.sel
  c.io.spm.in := io.in.spm
  c.io.schedTbl := io.in.schedTbl
  c.io.mc := io.in.mc

  v.io.clk := this.clock.asBool
  v.io.reset := this.reset.asBool
  v.io.config_wr := io.in.config.wr
  v.io.config_en := io.in.config.en
  v.io.config_wdata := io.in.config.wrData
  v.io.sel := io.in.sel
  v.io.config_addr := io.in.config.addr
  v.io.spm_slv_error := io.in.spm.error
  v.io.spm_slv_rdata := io.in.spm.rdData
  v.io.dma_num := io.in.schedTbl.dmaNum
  v.io.dma_en := io.in.schedTbl.dmaEn
  v.io.route := io.in.schedTbl.route
  v.io.pkt_len := io.in.schedTbl.pktLen
  v.io.mc := io.in.mc.mc
  v.io.mc_idx := io.in.mc.mcIdx
  v.io.mc_p := io.in.mc.mcP

  //Outputs
  io.chisel.config := c.io.config.s
  io.chisel.spm := c.io.spm.out
  io.chisel.pktOut := c.io.pktOut

  io.verilog.config.rdData := v.io.config_slv_rdata
  io.verilog.config.error := v.io.config_slv_error
  io.verilog.spm.addr := v.io.spm_addr
  io.verilog.spm.en(1) := v.io.spm_en(1)
  io.verilog.spm.en(0) := v.io.spm_en(0)
  io.verilog.spm.wr := v.io.spm_wr
  io.verilog.spm.wrData := v.io.spm_wdata
  io.verilog.pktOut := v.io.pkt_out
}
