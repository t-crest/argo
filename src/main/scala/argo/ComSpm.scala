package argo

import argo.ArgoTypes._
import argo.ArgoBundles.{MemoryIfMaster, MemoryIfSlave}
import chisel3._
import chisel3.util.Cat
import ocp.OcpBundles.{OcpCoreMaster, OcpCoreSlave}
import ocp.OcpTypes._

/**
 * Communication scratchpad memory
 */
class ComSpm extends RawModule {
  val io = IO(new Bundle {
    val pClk = Input(Clock())
    val nClk = Input(Clock())
    val reset = Input(Bool())
    val ocp = new Bundle {
      val in = Input(new OcpCoreMaster)
      val out = Output(new OcpCoreSlave)
    }
    val spm = new Bundle {
      val in = Input(new MemoryIfMaster)
      val out = Output(new MemoryIfSlave)
    }
  })

  //We require a lot of TDP's for this
  val highSpm = Seq.fill(4)(Module(new DualPortRam(SPM_IDX_SIZE-3, UInt((WORD_WIDTH/4).W))))
  val lowSpm = Seq.fill(4)(Module(new DualPortRam(SPM_IDX_SIZE-3, UInt((WORD_WIDTH/4).W))))

  //highSpm reads into SDAta_h, lowSpm into SData_h
  val selectLow = WireDefault(false.B)
  val selectHigh = WireDefault(false.B)
  val wrH = WireDefault(false.B)
  val wrL = WireDefault(false.B)

  val SdataHigh = Wire(Vec(4, UInt((WORD_WIDTH/4).W)))
  val SdataLow = Wire(Vec(4, UInt((WORD_WIDTH/4).W)))
  val evenRead = Wire(Vec(4, UInt((WORD_WIDTH/4).W)))
  val oddRead = Wire(Vec(4, UInt((WORD_WIDTH/4).W)))

  val hEn = Wire(Vec(4, Bool()))
  val lEn = Wire(Vec(4, Bool()))

  val evenWr = Wire(Bool())
  val oddWr = Wire(Bool())
  val evenWord = Wire(UInt(WORD_WIDTH.W))
  val oddWord = Wire(UInt(WORD_WIDTH.W))
  val evenAddr = Wire(UInt((SPM_IDX_SIZE-3).W))

  val selectHighReg = withClockAndReset(io.pClk, io.reset) {RegNext(selectHigh, false.B)}
  val selectLowReg = withClockAndReset(io.pClk, io.reset) {RegNext(selectLow, false.B)}
  val MCmd = withClockAndReset(io.pClk, io.reset) {RegNext(io.ocp.in.MCmd, 0.U(OCP_CMD_WIDTH.W))}
  val addrReg = withClock(io.nClk) {RegNext(io.spm.in.addr(0))}

  //Default outputs
  io.ocp.out.SData := 0.U
  io.ocp.out.SResp := OCP_RESP_NULL.U
  io.spm.out.error := false.B //Not connected in VHDL version
  when(addrReg) {
    io.spm.out.rdData := Cat(oddRead.asUInt, evenRead.asUInt)
  } .otherwise {
    io.spm.out.rdData := Cat(evenRead.asUInt, oddRead.asUInt)
  }

  //Assignments
  for(i <- 0 until 4) {
    hEn(i) := io.ocp.in.MByteEn(i) && wrH
    lEn(i) := io.ocp.in.MByteEn(i) && wrL
  }

  //Chip select
  when(io.ocp.in.MAddr(2)) {
    selectLow := true.B
  } .otherwise {
    selectHigh := true.B
  }

  //Write signals
  when(io.ocp.in.MCmd(0)) {
    when(selectHigh) { //TODO can probably just assign wrH/wrL to their select signals
      wrH := true.B
    } .elsewhen(selectLow) {
      wrL := true.B
    }
  }
  when(io.spm.in.addr(0)) {
    evenAddr := io.spm.in.addr(SPM_IDX_SIZE-3,1) + 1.U
    evenWord := io.spm.in.wrData(WORD_WIDTH-1, 0)
    evenWr := io.spm.in.wr && io.spm.in.en(1)
    oddWord := io.spm.in.wrData(DWORD_WIDTH-1, WORD_WIDTH)
    oddWr := io.spm.in.wr && io.spm.in.en(0)
  } .otherwise {
    evenAddr := io.spm.in.addr(SPM_IDX_SIZE-3, 1)
    evenWord := io.spm.in.wrData(DWORD_WIDTH-1, WORD_WIDTH)
    evenWr := io.spm.in.wr && io.spm.in.en(0)
    oddWord := io.spm.in.wrData(WORD_WIDTH-1, 0)
    oddWr := io.spm.in.wr && io.spm.in.en(1)
  }

  //Data input mux
  when(MCmd(1)) {
    when(selectHighReg) {
      io.ocp.out.SData := SdataHigh.asUInt
    } .elsewhen(selectLowReg) {
      io.ocp.out.SData := SdataLow.asUInt
    }
    io.ocp.out.SResp := OCP_RESP_DVA.U
  }
  when(MCmd(0)) {
    io.ocp.out.SResp := OCP_RESP_DVA.U
  }

  //Assign inputs on RAMs
  for(i <- 0 until 4) {
    highSpm(i).io.port1.clk := io.pClk
    highSpm(i).io.port1.we := hEn(i)
    highSpm(i).io.port1.addr := io.ocp.in.MAddr(SPM_IDX_SIZE-1, 3)
    highSpm(i).io.port1.wrData := io.ocp.in.MData((i+1)*8 -1, i*8)
    SdataHigh(i) := highSpm(i).io.port1.rdData

    highSpm(i).io.port2.clk := io.nClk
    highSpm(i).io.port2.we := evenWr
    highSpm(i).io.port2.addr := evenAddr
    highSpm(i).io.port2.wrData := evenWord((i+1)*8-1, i*8)
    evenRead(i) := highSpm(i).io.port2.rdData


    lowSpm(i).io.port1.clk := io.pClk
    lowSpm(i).io.port1.we := lEn(i)
    lowSpm(i).io.port1.addr := io.ocp.in.MAddr(SPM_IDX_SIZE-1, 3)
    lowSpm(i).io.port1.wrData := io.ocp.in.MData((i+1)*8-1, i*8)
    SdataLow(i) := lowSpm(i).io.port1.rdData

    lowSpm(i).io.port2.clk := io.nClk
    lowSpm(i).io.port2.we := oddWr
    lowSpm(i).io.port2.addr := io.spm.in.addr(SPM_IDX_SIZE-3, 1)
    lowSpm(i).io.port2.wrData := oddWord((i+1)*8-1, i*8)
    oddRead(i) := lowSpm(i).io.port2.rdData
  }

}
