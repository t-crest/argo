package blackbox

import argo.NetworkInterface
import argo.ArgoTypes._
import argo.ArgoBundles.{MemoryIfMaster, MemoryIfSlave}
import chisel3._
import ocp.OcpBundles.{OcpIOMaster, OcpIOSlave}

class NetworkInterfaceWrapper(master: Boolean = true) extends Module {
  val io = IO(new Bundle {
    val in = Input(new Bundle {
      val run = Bool()
      val supervisor = Bool()
      val ocp = new OcpIOMaster
      val spm = new MemoryIfSlave
      val pkt = UInt(LINK_WIDTH.W)
    })
    val chisel = Output(new Bundle {
      val masterRun = Bool()
      val ocp = new OcpIOSlave
      val dataIrq = Bool()
      val configIrq = Bool()
      val spm = new MemoryIfMaster
      val pkt = UInt(LINK_WIDTH.W)
    })
    val verilog = Output(new Bundle {
      val masterRun = Bool()
      val ocp = new OcpIOSlave
      val dataIrq = Bool()
      val configIrq = Bool()
      val spm = new MemoryIfMaster
      val pkt = UInt(LINK_WIDTH.W)
    })
  })

  val c = Module(new NetworkInterface(master))
  val v = Module(new network_interface(master))

  //Inputs
  c.io.run := io.in.run
  c.io.supervisor := io.in.supervisor
  c.io.ocp.in := io.in.ocp
  c.io.spm.in := io.in.spm
  c.io.pkt.in := io.in.pkt

  v.io.clk := this.clock.asBool
  v.io.reset := this.reset.asBool
  v.io.run := io.in.run
  v.io.supervisor := io.in.supervisor
  v.io.ocp_config_m_MCmd := io.in.ocp.MCmd
  v.io.ocp_config_m_MAddr := io.in.ocp.MAddr
  v.io.ocp_config_m_MData := io.in.ocp.MData
  v.io.ocp_config_m_MByteEn := io.in.ocp.MByteEn
  v.io.ocp_config_m_MRespAccept := io.in.ocp.MRespAccept
  v.io.spm_slv_rdata := io.in.spm.rdData
  v.io.spm_slv_error := io.in.spm.error
  v.io.pkt_in := io.in.pkt

  //Outputs
  io.chisel.masterRun := c.io.masterRun
  io.chisel.ocp := c.io.ocp.out
  io.chisel.spm := c.io.spm.out
  io.chisel.pkt := c.io.pkt.out
  io.chisel.configIrq := c.io.irq.config
  io.chisel.dataIrq := c.io.irq.data

  io.verilog.masterRun := v.io.master_run
  io.verilog.ocp.SResp := v.io.ocp_config_s_SResp
  io.verilog.ocp.SCmdAccept := v.io.ocp_config_s_SCmdAccept
  io.verilog.ocp.SData := v.io.ocp_config_s_SData
  io.verilog.spm.wr := v.io.spm_wr
  io.verilog.spm.en(0) := v.io.spm_en(0)
  io.verilog.spm.en(1) := v.io.spm_en(1)
  io.verilog.spm.addr := v.io.spm_addr
  io.verilog.spm.wrData := v.io.spm_wdata
  io.verilog.pkt := v.io.pkt_out
  io.verilog.configIrq := v.io.config_irq
  io.verilog.dataIrq := v.io.data_irq
}
