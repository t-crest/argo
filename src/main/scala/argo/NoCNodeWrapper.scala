package argo

import chisel3._
import ocp.OcpTypes._
import argo.ArgoTypes._

/**
 * A wrapper module around the [[NoCNode]] from Argo, for interoperability with the NoCNodeWrapper already
 * defined in ~/t-crest/patmos/hardware/src/main/scala/argo/NoCNodeWrapper
 */
class NoCNodeWrapper(val master: Boolean = false) extends RawModule {

  override def desiredName: String = if(this.master) {
    "NoCNodeWrapper_m"
  } else {
    "NoCNodeWrapper_s"
  }
  val clk = IO(Input(Bool()))
  val reset = IO(Input(Bool()))
  val irq = IO(Output(UInt(2.W)))
  val run = IO(Input(Bool()))
  val supervisor = IO(Input(Bool()))
  val masterRun = IO(Output(Bool()))
  val proc_M_Cmd = IO(Input(UInt(OCP_CMD_WIDTH.W)))
  val proc_M_Addr = IO(Input(UInt(OCP_ADDR_WIDTH.W)))
  val proc_M_Data = IO(Input(UInt(OCP_DATA_WIDTH.W)))
  val proc_M_ByteEn = IO(Input(UInt(OCP_BYTE_WIDTH.W)))
  val proc_M_RespAccept = IO(Input(Bool()))
  val proc_S_Resp = IO(Output(UInt(OCP_RESP_WIDTH.W)))
  val proc_S_Data = IO(Output(UInt(OCP_DATA_WIDTH.W)))
  val proc_S_CmdAccept = IO(Output(Bool()))
  
  val spm_M_Addr = IO(Output(UInt((HEADER_FIELD_WIDTH-HEADER_CTRL_WIDTH).W)))
  val spm_M_En = IO(Output(UInt(2.W)))
  val spm_M_Wr = IO(Output(Bool()))
  val spm_M_Data = IO(Output(UInt(DWORD_WIDTH.W)))
  val spm_S_Data = IO(Input(UInt(DWORD_WIDTH.W)))
  val spm_S_Error = IO(Input(Bool()))
  
  val north_in_f_req = IO(Input(Bool()))
  val north_in_f_data = IO(Input(UInt(LINK_WIDTH.W)))
  val north_in_b_ack = IO(Output(Bool()))
  val east_in_f_req = IO(Input(Bool()))
  val east_in_f_data = IO(Input(UInt(LINK_WIDTH.W)))
  val east_in_b_ack = IO(Output(Bool()))
  val south_in_f_req = IO(Input(Bool()))
  val south_in_f_data = IO(Input(UInt(LINK_WIDTH.W)))
  val south_in_b_ack = IO(Output(Bool()))
  val west_in_f_req = IO(Input(Bool()))
  val west_in_f_data = IO(Input(UInt(LINK_WIDTH.W)))
  val west_in_b_ack = IO(Output(Bool()))
  
  val north_out_f_req = IO(Output(Bool()))
  val north_out_f_data = IO(Output(UInt(LINK_WIDTH.W)))
  val north_out_b_ack = IO(Input(Bool()))
  val east_out_f_req = IO(Output(Bool()))
  val east_out_f_data = IO(Output(UInt(LINK_WIDTH.W)))
  val east_out_b_ack = IO(Input(Bool()))
  val south_out_f_req = IO(Output(Bool()))
  val south_out_f_data = IO(Output(UInt(LINK_WIDTH.W)))
  val south_out_b_ack = IO(Input(Bool()))
  val west_out_f_req = IO(Output(Bool()))
  val west_out_f_data = IO(Output(UInt(LINK_WIDTH.W)))
  val west_out_b_ack = IO(Input(Bool()))
  
  val nn = withClockAndReset(this.clk.asClock, this.reset){Module(new NoCNode(master))}
  
  //Inputs
  nn.io.run := this.run
  nn.io.supervisor := this.supervisor
  nn.io.ocp.in.MRespAccept := this.proc_M_RespAccept
  nn.io.ocp.in.MCmd := this.proc_M_Cmd
  nn.io.ocp.in.MAddr := this.proc_M_Addr
  nn.io.ocp.in.MData := this.proc_M_Data
  nn.io.ocp.in.MByteEn := this.proc_M_ByteEn
  
  nn.io.spm.in.rdData := this.spm_S_Data
  nn.io.spm.in.error := this.spm_S_Error
  
  nn.io.channelIn.north.req := this.north_in_f_req
  nn.io.channelIn.north.data := this.north_in_f_data
  nn.io.channelIn.east.req := this.east_in_f_req
  nn.io.channelIn.east.data := this.east_in_f_data
  nn.io.channelIn.south.req := this.south_in_f_req
  nn.io.channelIn.south.data := this.south_in_f_data
  nn.io.channelIn.west.req := this.west_in_f_req
  nn.io.channelIn.west.data := this.west_in_f_data
  
  nn.io.channelOut.north.ack := this.north_out_b_ack
  nn.io.channelOut.south.ack := this.south_out_b_ack
  nn.io.channelOut.east.ack := this.east_out_b_ack
  nn.io.channelOut.west.ack := this.east_out_b_ack
  
  //Outputs
  this.irq := nn.io.irq
  this.masterRun := nn.io.masterRun
  this.proc_S_Data := nn.io.ocp.out.SData
  this.proc_S_Resp := nn.io.ocp.out.SResp
  this.proc_S_CmdAccept := nn.io.ocp.out.SCmdAccept
  
  this.spm_M_Wr := nn.io.spm.out.wr
  this.spm_M_En := nn.io.spm.out.en.asUInt
  this.spm_M_Data := nn.io.spm.out.wrData
  this.spm_M_Addr := nn.io.spm.out.addr
  
  this.north_in_b_ack := nn.io.channelIn.north.ack
  this.south_in_b_ack := nn.io.channelIn.south.ack
  this.east_in_b_ack := nn.io.channelIn.east.ack
  this.west_in_b_ack := nn.io.channelIn.west.ack
  
  this.north_out_f_req := nn.io.channelOut.north.req
  this.north_out_f_data := nn.io.channelOut.north.data
  this.south_out_f_req := nn.io.channelOut.south.req
  this.south_out_f_data := nn.io.channelOut.south.data
  this.east_out_f_req := nn.io.channelOut.east.req
  this.east_out_f_data := nn.io.channelOut.east.data
  this.west_out_f_req := nn.io.channelOut.west.req
  this.west_out_f_data := nn.io.channelOut.west.data
}
