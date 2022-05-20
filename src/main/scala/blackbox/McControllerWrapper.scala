package blackbox

import chisel3._
import argo.McController
import argo.ArgoBundles._
import argo.ArgoTypes._

class McControllerWrapper(val master: Boolean) extends Module {
  val io = IO(new Bundle {
    val in = Input(new Bundle {
      val config = new ConfigIfMaster
      val sel = Bool()
      val run = Bool()
      val periodBoundary = Bool()
      val mcPCnt = UInt(2.W)
    })
    val chisel = Output(new Bundle {
      val config = new ConfigIfSlave
      val stblMin = UInt(STBL_IDX_WIDTH.W)
      val stblMaxp1 = UInt(STBL_IDX_WIDTH.W)
      val mc = Bool()
      val mcIdx = UInt(2.W)
      val mcP = UInt(2.W)
    })
    val verilog = Output(new Bundle {
      val config = new ConfigIfSlave
      val stblMin = UInt(STBL_IDX_WIDTH.W)
      val stblMaxp1 = UInt(STBL_IDX_WIDTH.W)
      val mc = Bool()
      val mcIdx = UInt(2.W)
      val mcP = UInt(2.W)
    })
  })

  val v = Module(new MC_controller(master))
  val c = Module(new McController(master))

  //Inputs
  c.io.run := io.in.run
  c.io.config.m := io.in.config
  c.io.config.sel := io.in.sel
  c.io.tdm.periodBoundary := io.in.periodBoundary
  c.io.tdm.periodCnt := io.in.mcPCnt

  v.io.clk := this.clock.asBool
  v.io.reset := this.reset.asBool
  v.io.run := io.in.run
  v.io.config_addr := io.in.config.addr
  v.io.config_en := io.in.config.en
  v.io.config_wr := io.in.config.wr
  v.io.config_wdata := io.in.config.wrData
  v.io.sel := io.in.sel
  v.io.period_boundary := io.in.periodBoundary
  v.io.mc_p_cnt := io.in.mcPCnt


  //Outputs
  io.chisel.config := c.io.config.s
  io.chisel.stblMin := c.io.tdm.stblMin
  io.chisel.stblMaxp1 := c.io.tdm.stblMaxp1
  io.chisel.mc := c.io.pktman.mc
  io.chisel.mcIdx := c.io.pktman.mcIdx
  io.chisel.mcP := c.io.pktman.mcP

  io.verilog.config.rdData := v.io.config_slv_rdata
  io.verilog.config.error := v.io.config_slv_error
  io.verilog.stblMin := v.io.stbl_min
  io.verilog.stblMaxp1 := v.io.stbl_maxp1
  io.verilog.mc := v.io.mc
  io.verilog.mcIdx := v.io.mc_idx
  io.verilog.mcP := v.io.mc_p
}
