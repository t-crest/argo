package blackbox

import argo.ArgoBundles._
import argo.ArgoTypes._
import argo.TdmController
import chisel3._

class TdmControllerWrapper(val master: Boolean) extends Module {
  val io = IO(new Bundle {
    val in = new Bundle {
      val config = Input(new ConfigIfMaster)
      val sel = Input(Bool())
      val run = Input(Bool())
      val t2n = Input(UInt(STBL_T2N_WIDTH.W))
      val stblMin = Input(UInt(STBL_IDX_WIDTH.W))
      val stblMaxp1 = Input(UInt(STBL_IDX_WIDTH.W))
    }
    val chisel = Output(new Bundle {
      val config = new ConfigIfSlave
      val stblIdx = UInt(STBL_IDX_WIDTH.W)
      val stblEn = Bool()
      val periodBoundary = Bool()
      val periodCnt = UInt(2.W)
      val masterRun = Bool()
    })
    val verilog = Output(new Bundle {
      val config = new ConfigIfSlave
      val stblIdx = UInt(STBL_IDX_WIDTH.W)
      val stblEn = Bool()
      val periodBoundary = Bool()
      val periodCnt = UInt(2.W)
      val masterRun = Bool()
    })
  })

  val v = Module(new TDM_controller(master))
  val c = Module(new TdmController(master))

  //Inputs
  c.io.config.m <> io.in.config
  c.io.config.sel := io.in.sel
  c.io.mc.stblMin := io.in.stblMin
  c.io.mc.stblMaxp1 := io.in.stblMaxp1
  c.io.run := io.in.run
  c.io.stbl.t2n := io.in.t2n

  v.io.clk := this.clock.asBool
  v.io.reset := this.reset.asBool
  v.io.config_addr := io.in.config.addr
  v.io.config_en := io.in.config.en
  v.io.config_wdata := io.in.config.wrData
  v.io.config_wr := io.in.config.wr
  v.io.sel := io.in.sel
  v.io.stbl_min := io.in.stblMin
  v.io.stbl_maxp1 := io.in.stblMaxp1
  v.io.run := io.in.run
  v.io.t2n := io.in.t2n

  //Outputs
  io.chisel.config <> c.io.config.s
  io.chisel.periodCnt := c.io.mc.periodCnt
  io.chisel.periodBoundary := c.io.mc.periodBoundary
  io.chisel.stblIdx := c.io.stbl.idx
  io.chisel.stblEn := c.io.stbl.en
  io.chisel.masterRun := c.io.masterRun

  io.verilog.config.rdData := v.io.config_slv_rdata
  io.verilog.config.error := v.io.config_slv_error
  io.verilog.periodCnt := v.io.mc_p_cnt
  io.verilog.periodBoundary := v.io.period_boundary
  io.verilog.stblIdx := v.io.stbl_idx
  io.verilog.stblEn := v.io.stbl_idx_en
  io.verilog.masterRun := v.io.master_run
}
