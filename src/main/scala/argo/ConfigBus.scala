package argo

import chisel3._
import chisel3.util._
import ArgoTypes._
import ArgoBundles._
import ocp.OcpBundles._
import ocp.OcpTypes._

/**
 * Argo 2.0 Configuration Bus Arbiter
 *
 * This module arbitrates access to the configuration ports on the various modules in the
 * [[NetworkInterface]]. Priority is given to the config unit (data received from the [[RxUnit]]).
 * The Config Unit can only write twice in 3 clock cycles, so the OCP port will always be
 * given access sometimes
 */
class ConfigBus extends Module {
  val io = IO(new Bundle{
    val supervisor = Input(Bool())
    val ocp = new Bundle {
      val m = Input(new OcpIOMaster)
      val s = Output(new OcpIOSlave)
    }
    val configIn = Input(new ConfigIfMaster)
    val configOut = Output(new ConfigIfMaster)
    val slaves = Input(new Bundle {
      val tdm = new ConfigIfSlave
      val schedTable = new ConfigIfSlave
      val dma = new ConfigIfSlave
      val mc = new ConfigIfSlave
      val irq = new ConfigIfSlave
    })
    val sel = Output(new Bundle {
      val tdm = Bool()
      val schedTable = Bool()
      val dma = Bool()
      val mc = Bool()
      val irq = Bool()
    })
  })

  /*
--------------------------------------------------------------------------------
-- Signals for config bus
--
--      OCP interface              Config unit
--                  \             /
--                  _\|         |/_
--                   -------------
--                   |  Arbiter  |
--                   -------------
--                  /   |     |   \
--                 /    |     |    \
--                /     |     |     \
--               /      |     |      \
--              /       |     |       \
--            |/_      \|/   \|/      _\|
--
--     TDM ctrl   Sched tbl   DMA tbl   IRQ FIFO
--------------------------------------------------------------------------------
   */
  //16 - 2 - 3 = 11

  val bankId = WireDefault(io.configIn.addr(HEADER_FIELD_WIDTH-HEADER_CTRL_WIDTH-1,HEADER_FIELD_WIDTH-HEADER_CTRL_WIDTH-CPKT_BANK_WIDTH))
  val ocpResp = RegInit(OCP_RESP_NULL.U(OCP_RESP_WIDTH.W))
  val prevBankId = RegNext(bankId, 0.U(CPKT_BANK_WIDTH.W))

  /* Assignment */
  //Default values, some of these may be overwritten below
  io.ocp.s.SResp := ocpResp
  io.ocp.s.SData := io.slaves.dma.rdData
  io.ocp.s.SCmdAccept := false.B

  io.configOut.addr := io.configIn.addr
  io.configOut.en := io.configIn.en
  io.configOut.wr := io.configIn.wr
  io.configOut.wrData := io.configIn.wrData

  /* Logic */
  //Based on current bankId, select which memory unit to select
  io.sel.tdm := bankId === TDM_BANK.U(CPKT_BANK_WIDTH.W)
  io.sel.irq := bankId === IRQ_BANK.U(CPKT_BANK_WIDTH.W)
  io.sel.schedTable := bankId === SCHED_BANK.U(CPKT_BANK_WIDTH.W)
  io.sel.dma := bankId === DMA_BANK.U(CPKT_BANK_WIDTH.W)
  io.sel.mc := bankId === MC_BANK.U(CPKT_BANK_WIDTH.W)

  //If there is no request from config unit and there is a request from OCP, handle it
  when(!io.configIn.en && io.ocp.m.MCmd =/= OCP_CMD_IDLE.U) {
    ocpResp := OCP_RESP_DVA.U(OCP_RESP_WIDTH.W)
    io.ocp.s.SCmdAccept := true.B
    io.configOut.wrData := io.ocp.m.MData
    bankId := io.ocp.m.MAddr(HEADER_FIELD_WIDTH-HEADER_CTRL_WIDTH+2-1,
      HEADER_FIELD_WIDTH-HEADER_CTRL_WIDTH-CPKT_BANK_WIDTH+2)
    io.configOut.addr := io.ocp.m.MAddr(HEADER_FIELD_WIDTH-HEADER_CTRL_WIDTH+2-1, 2)
    io.configOut.en := true.B
    io.configOut.wr := false.B

    //If OCP request is a write and processor is in supervisor mode
    when(io.ocp.m.MCmd =/= OCP_CMD_IDLE.U && io.supervisor) {
      when(io.ocp.m.MCmd === OCP_CMD_WR.U) {
        io.configOut.wr := true.B
      }
    } .otherwise {
      ocpResp := OCP_RESP_DVA.U(OCP_RESP_WIDTH.W)
    }
  }

  //Reset OCP response when master signals acknowledgement
  when(ocpResp =/= OCP_RESP_NULL.U(OCP_RESP_WIDTH.W) && io.ocp.m.MRespAccept) {
    ocpResp := OCP_RESP_NULL.U(OCP_RESP_WIDTH.W)
  }

  //Below has been commented out from VHDL version. Re-enable if necessary
//  when(io.slaves.getElements.map(_.asTypeOf(new ConfigIfSlave).error).reduce(_||_)) { //If any one the error signals is high
//    io.ocp.s.SResp := OCP_RESP_ERR.U(OCP_RESP_WIDTH.W)
//  }

  //Select data based on previous value of bank id
  switch(prevBankId) {
    is(DMA_BANK.U(CPKT_BANK_WIDTH.W)) { io.ocp.s.SData := io.slaves.dma.rdData}
    is(SCHED_BANK.U(CPKT_BANK_WIDTH.W)) {io.ocp.s.SData := io.slaves.schedTable.rdData}
    is(TDM_BANK.U(CPKT_BANK_WIDTH.W)) {io.ocp.s.SData := io.slaves.tdm.rdData}
    is(MC_BANK.U(CPKT_BANK_WIDTH.W)) {io.ocp.s.SData := io.slaves.mc.rdData}
    is(IRQ_BANK.U(CPKT_BANK_WIDTH.W)) {io.ocp.s.SData := io.slaves.irq.rdData}
  }
}
