package blackbox

import argo.ArgoTypes._
import ocp.OcpTypes._
import chisel3._
import chisel3.util.HasBlackBoxResource

class network_interface(val master: Boolean = false) extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clk = Input(Bool())
    val reset = Input(Bool())
    val run = Input(Bool())
    val supervisor = Input(Bool())
    val ocp_config_m_MCmd = Input(UInt(OCP_CMD_WIDTH.W))
    val ocp_config_m_MAddr = Input(UInt(OCP_ADDR_WIDTH.W))
    val ocp_config_m_MData = Input(UInt(OCP_DATA_WIDTH.W))
    val ocp_config_m_MByteEn = Input(UInt(OCP_BYTE_WIDTH.W))
    val ocp_config_m_MRespAccept = Input(Bool())
    val spm_slv_rdata = Input(UInt(DWORD_WIDTH.W))
    val spm_slv_error = Input(Bool())
    val pkt_in = Input(UInt(LINK_WIDTH.W))
    val master_run = Output(Bool())
    val ocp_config_s_SResp = Output(UInt(OCP_RESP_WIDTH.W))
    val ocp_config_s_SData = Output(UInt(OCP_DATA_WIDTH.W))
    val ocp_config_s_SCmdAccept = Output(Bool())
    val data_irq = Output(Bool())
    val config_irq = Output(Bool())
    val spm_addr = Output(UInt(MEM_ADDR_WIDTH.W))
    val spm_en = Output(UInt(2.W))
    val spm_wr = Output(Bool())
    val spm_wdata = Output(UInt(DWORD_WIDTH.W))
    val pkt_out = Output(UInt(LINK_WIDTH.W))
  })
  if(this.master) {
    addResource("/network_interface_m.v")
  } else {
    addResource("/network_interface.v")
  }
}
