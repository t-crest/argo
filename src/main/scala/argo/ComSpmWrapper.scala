package argo

import chisel3._
import ocp.OcpTypes._
import argo.ArgoTypes._

class ComSpmWrapper extends RawModule {
  val clk = IO(Input(Clock()))
  val reset = IO(Input(Bool()))
  val ocp_M_Cmd = IO(Input(UInt(OCP_CMD_WIDTH.W)))
  val ocp_M_Addr = IO(Input(UInt(OCP_ADDR_WIDTH.W)))
  val ocp_M_Data = IO(Input(UInt(OCP_DATA_WIDTH.W)))
  val ocp_M_ByteEn = IO(Input(UInt(OCP_BYTE_WIDTH.W)))
  val ocp_S_Resp = IO(Output(UInt(OCP_RESP_WIDTH.W)))
  val ocp_S_Data = IO(Output(UInt(OCP_DATA_WIDTH.W)))
  
  val spm_M_Addr = IO(Input(UInt((HEADER_FIELD_WIDTH-HEADER_CTRL_WIDTH).W)))
  val spm_M_En = IO(Input(UInt(2.W)))
  val spm_M_Wr = IO(Input(Bool()))
  val spm_M_Data = IO(Input(UInt(DWORD_WIDTH.W)))
  val spm_S_Data = IO(Output(UInt(DWORD_WIDTH.W)))
  val spm_S_Error = IO(Output(Bool()))

  override def desiredName: String = s"ComSpmWrapper_$SPM_IDX_SIZE"
  val cs = Module(new ComSpm)

  cs.io.pClk := this.clk
  cs.io.nClk := this.clk
  cs.io.reset := this.reset
  cs.io.spm.in.wrData := this.spm_M_Data
  cs.io.spm.in.addr := this.spm_M_Addr
  cs.io.spm.in.wr := this.spm_M_Wr
  cs.io.spm.in.en := VecInit(this.spm_M_En.asBools)
  cs.io.ocp.in.MAddr := this.ocp_M_Addr
  cs.io.ocp.in.MData := this.ocp_M_Data
  cs.io.ocp.in.MByteEn := this.ocp_M_ByteEn
  cs.io.ocp.in.MCmd := this.ocp_M_Cmd

  this.ocp_S_Resp := cs.io.ocp.out.SResp
  this.ocp_S_Data := cs.io.ocp.out.SData

  this.spm_S_Data := cs.io.spm.out.rdData
  this.spm_S_Error := cs.io.spm.out.error
}
