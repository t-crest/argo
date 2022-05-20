package blackbox

import argo.ArgoBundles.{ConfigIfMaster, ConfigIfSlave}
import chisel3._
import argo._
import ocp.OcpBundles.{OcpIOMaster, OcpIOSlave}
class ConfigBusWrapper extends Module {
  val io = IO(new Bundle {
    val in = Input(new Bundle {
      val supervisor = Bool()
      val ocp = new OcpIOMaster
      val config = new ConfigIfMaster
      val slaves = new Bundle {
        val tdm = new ConfigIfSlave
        val schedTable = new ConfigIfSlave
        val pktman = new ConfigIfSlave
        val mc = new ConfigIfSlave
        val irq = new ConfigIfSlave
      }
    })
    val chisel = Output(new Bundle {
      val ocp = new OcpIOSlave
      val config = new ConfigIfMaster
      val sel = new Bundle {
        val tdm = Bool()
        val schedTable = Bool()
        val pktman = Bool()
        val mc = Bool()
        val irq = Bool()
      }
    })
    val verilog = Output(new Bundle {
      val ocp = new OcpIOSlave
      val config = new ConfigIfMaster
      val sel = new Bundle {
        val tdm = Bool()
        val schedTable = Bool()
        val pktman = Bool()
        val mc = Bool()
        val irq = Bool()
      }
    })
  })

  val c = Module(new ConfigBus)
  val v = Module(new config_bus)

  //Inputs
  c.io.supervisor := io.in.supervisor
  c.io.ocp.m := io.in.ocp
  c.io.configIn := io.in.config
  c.io.slaves := io.in.slaves

  v.io.clk := this.clock.asBool
  v.io.reset := this.reset.asBool
  v.io.ocp_config_m_MCmd := io.in.ocp.MCmd
  v.io.ocp_config_m_MAddr := io.in.ocp.MAddr
  v.io.ocp_config_m_MData := io.in.ocp.MData
  v.io.ocp_config_m_MByteEn := io.in.ocp.MByteEn
  v.io.ocp_config_m_MRespAccept := io.in.ocp.MRespAccept
  v.io.supervisor := io.in.supervisor
  v.io.config_unit_addr := io.in.config.addr
  v.io.config_unit_en := io.in.config.en
  v.io.config_unit_wr := io.in.config.wr
  v.io.config_unit_wdata := io.in.config.wrData
  v.io.TDM_ctrl_error := io.in.slaves.tdm.error
  v.io.TDM_ctrl_rdata := io.in.slaves.tdm.rdData
  v.io.sched_tbl_error := io.in.slaves.schedTable.error
  v.io.sched_tbl_rdata := io.in.slaves.schedTable.rdData
  v.io.DMA_tbl_error := io.in.slaves.pktman.error
  v.io.DMA_tbl_rdata := io.in.slaves.pktman.rdData
  v.io.MC_ctrl_error := io.in.slaves.mc.error
  v.io.MC_ctrl_rdata := io.in.slaves.mc.rdData
  v.io.irq_unit_fifo_error := io.in.slaves.irq.error
  v.io.irq_unit_fifo_rdata := io.in.slaves.irq.rdData

  //Outputs
  io.chisel.ocp := c.io.ocp.s
  io.chisel.sel := c.io.sel
  io.chisel.config := c.io.configOut

  io.verilog.ocp.SResp := v.io.ocp_config_s_SResp
  io.verilog.ocp.SData := v.io.ocp_config_s_SData
  io.verilog.ocp.SCmdAccept := v.io.ocp_config_s_SCmdAccept
  io.verilog.config.addr := v.io.config_addr
  io.verilog.config.en := v.io.config_en
  io.verilog.config.wr := v.io.config_wr
  io.verilog.config.wrData := v.io.config_wdata
  io.verilog.sel.tdm := v.io.TDM_ctrl_sel
  io.verilog.sel.schedTable := v.io.sched_tbl_sel
  io.verilog.sel.pktman := v.io.DMA_tbl_sel
  io.verilog.sel.mc := v.io.MC_ctrl_sel
  io.verilog.sel.irq := v.io.irq_unit_fifo_sel
}
