package blackbox

import chisel3._
import chisel3.util.HasBlackBoxResource
import argo.ArgoTypes._
import ocp.OcpTypes._

class config_bus extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clk = Input(Bool())
    val reset = Input(Bool())
    val ocp_config_m_MCmd = Input(UInt(OCP_CMD_WIDTH.W))
    val ocp_config_m_MAddr = Input(UInt(OCP_ADDR_WIDTH.W))
    val ocp_config_m_MData = Input(UInt(OCP_DATA_WIDTH.W))
    val ocp_config_m_MByteEn = Input(UInt(OCP_BYTE_WIDTH.W))
    val ocp_config_m_MRespAccept = Input(Bool())
    val supervisor = Input(Bool())

    val config_unit_addr = Input(UInt(MEM_ADDR_WIDTH.W))
    val config_unit_en = Input(Bool())
    val config_unit_wr = Input(Bool())
    val config_unit_wdata = Input(UInt(WORD_WIDTH.W))

    val TDM_ctrl_rdata = Input(UInt(WORD_WIDTH.W))
    val TDM_ctrl_error = Input(Bool())
    val sched_tbl_rdata = Input(UInt(WORD_WIDTH.W))
    val sched_tbl_error = Input(Bool())
    val DMA_tbl_rdata = Input(UInt(WORD_WIDTH.W))
    val DMA_tbl_error = Input(Bool())
    val MC_ctrl_rdata = Input(UInt(WORD_WIDTH.W))
    val MC_ctrl_error = Input(Bool())
    val irq_unit_fifo_rdata = Input(UInt(WORD_WIDTH.W))
    val irq_unit_fifo_error = Input(Bool())

    val ocp_config_s_SResp = Output(UInt(OCP_RESP_WIDTH.W))
    val ocp_config_s_SData = Output(UInt(WORD_WIDTH.W))
    val ocp_config_s_SCmdAccept = Output(Bool())
    val config_addr = Output(UInt(MEM_ADDR_WIDTH.W))
    val config_en = Output(Bool())
    val config_wr = Output(Bool())
    val config_wdata = Output(UInt(WORD_WIDTH.W))
    val TDM_ctrl_sel = Output(Bool())
    val sched_tbl_sel = Output(Bool())
    val DMA_tbl_sel = Output(Bool())
    val MC_ctrl_sel = Output(Bool())
    val irq_unit_fifo_sel = Output(Bool())
  })
  addResource("/config_bus.v")
}
