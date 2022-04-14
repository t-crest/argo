package argo

import chisel3._
import chisel3.util._
import ArgoBundles._
import ArgoTypes._

/**
 * Argo 2.0 TDM Controller
 * The TDM controller generates signals for use in the [[ScheduleTable]], indicating which slot is currently accessed.
 *
 * @author Rasmus Bo Soerensen (rasmus@rbscloud.dk)
 * @author Kasper Juul Hesse Rasmussen, s183735@student.dtu.dk
 * @param master Whether this TDM controller is operating in master or slave mode.
 *               Only one TDM controller in a NOC should be the master
 */
class TdmController(val master: Boolean = true) extends Module {
  val io = IO(new Bundle {
    val config = new Bundle {
      val sel = Input(Bool())
      val m = Input(new ConfigIfMaster)
      val s = Output(new ConfigIfSlave)
    }
    val stbl = new TdmControlSchedTblIO
    val mc = new TdmControlModeChangeIO
    val run = Input(Bool())
    val masterRun = Output(Bool())
  })

  /*
  Addresses of readable/writeable registers inside TDM controller

  Address | Access | Name
  0x00    | R      | TDM_S_CNT
  0x01    | R      | TDM_P_CNT
  0x02    | R      | CLOCK_CNT_HIGH
  0x03    | R      | CLOCK_CNT_LOW
  0x04    | WR     | Master run
   */

  /* Registers */
  val error = RegInit(false.B)
  val readReg = RegInit(0.U(WORD_WIDTH.W))
  val t2nLdReg = RegInit(true.B)
  val runReg = RegNext(io.run)
  /** Delayed version of clockCntHigh, only update when clockCntLow is read */
  val clockDelay = RegInit(0.U(WORD_WIDTH.W))
  val clockCntLow = RegInit(0.U(WORD_WIDTH.W))
  val clockCntHigh = RegInit(0.U(WORD_WIDTH.W))
  val tdmSlotCnt = RegInit(0.U(TDM_S_CNT_WIDTH.W))
  val tdmPeriodCnt = RegInit(0.U(WORD_WIDTH.W))
  /** Internal mode-change period counter. Used for mode changes and boot-up synchronization  */
  val mcPeriodCnt = RegInit(0.U(2.W))
  val stblIdx = RegInit(0.U(STBL_IDX_WIDTH.W))
  val time2next = RegInit(0.U(STBL_IDX_WIDTH.W))
  val t2nLoad = RegInit(true.B)

  val masterRun = RegInit(0.U(3.W))

  //Wires
  val masterRunNext = WireDefault(false.B)
  val latchHighClock = WireDefault(false.B)

  //Schedule table update logic
  //Schedule table index is updated when time2next (from SchedTable) = 1
  // or when time2next-counter is 1
  val stblIdxEn = (((time2next === 1.U) || (((time2next === 0.U) || (time2next === -1.S(STBL_IDX_WIDTH.W).asUInt)) && (!io.stbl.t2n))) || (io.run =/= runReg)) && io.run
  //schedule table idx reset is triggered when index reaches current mode's max value
  val stblIdxReset = ((stblIdx + 1.U === io.mc.stblMaxp1) || (io.run =/= runReg)) && io.run
  //Period boundary signal is high on the last cc of a TDM period
  val periodBoundary = stblIdxReset && stblIdxEn
  //Next value for stblIdx. Defined as separate signal as this also drives the output
  val stblIdxNext = Mux(stblIdxReset, io.mc.stblMin, stblIdx + 1.U)

  /* Logic */
  //time2nextLoad follows stblIdxEn, but has reset=1 such that a new value is loaded upon reset
  t2nLoad := stblIdxEn

  //Internal mode-change period counter
  //Always counts 0-3 and then rolls over
  //Used for mode change and synchronizing to new schedules at boot up
  mcPeriodCnt := Mux(periodBoundary, mcPeriodCnt + 1.U, mcPeriodCnt)

  //Time until next entry in schedule table
  //Decremented on each cc, loads when it reaches 0
  time2next := Mux(t2nLoad, io.stbl.t2n, time2next - 1.U)

  //Schedule table index update
  stblIdx := Mux(stblIdxEn, stblIdxNext, stblIdx)


  //Config bus read/write logic
  //Default assignments here, may get overwritten
  readReg := tdmPeriodCnt
  error := false.B
  masterRunNext := masterRun(0)
  when(io.config.sel && io.config.m.en) {
    val Maddr = io.config.m.addr(CPKT_ADDR_WIDTH-1, 0)
    when(io.config.m.wr) { //Write
      when(Maddr === 4.U) {
        if(this.master) {
          masterRunNext := io.config.m.wrData(0)
        }
      } .otherwise {
        error := true.B
      }
    } .otherwise { //Read
      when(Maddr === 0.U) {
        readReg := tdmSlotCnt
      }.elsewhen(Maddr === 1.U) {
        readReg := tdmPeriodCnt
      }.elsewhen(Maddr === 2.U) {
        readReg := clockDelay
      }.elsewhen(Maddr === 3.U) {
        readReg := clockCntLow
        latchHighClock := true.B
      }.elsewhen(Maddr === 4.U) {
        readReg := io.run
      }.otherwise {
        error := true.B
      }
    }
  }
  /* Conditionally generated logic blocks */
  if(GENERATE_CLK_COUNTER) {
    clockCntLow := clockCntLow + 1.U
    clockCntHigh := Mux(clockCntLow === -1.S(WORD_WIDTH.W).asUInt, clockCntHigh + 1.U, clockCntHigh)
    when(latchHighClock) {
      clockDelay := clockCntHigh
    }
  } else {
    clockCntLow := 0.U
    clockCntHigh := 0.U
    clockDelay := 0.U
  }

  //TDM Slot counter, increments on every clock cycle and
  //resets on a period boundary
  if(GENERATE_SLOT_COUNTER) {
     tdmSlotCnt := Mux(periodBoundary, 0.U, tdmSlotCnt + 1.U)
  } else {
    tdmSlotCnt := 0.U
  }

  //TDM Period counter increments on period boundaries
  if(GENERATE_PERIOD_COUNTER) {
    tdmPeriodCnt := Mux(periodBoundary, tdmPeriodCnt + 1.U, tdmPeriodCnt)
  } else {
    tdmPeriodCnt := 0.U
  }

  //Master/slave run signals
  if(this.master) {
    masterRun := Cat(masterRun(1,0), masterRunNext)
  } else {
    masterRun := 0.U
  }

  //Output assignments
  io.config.s.rdData := readReg
  io.config.s.error := error

  io.masterRun := masterRun

  io.stbl.idx := stblIdxNext
  io.stbl.en := stblIdxEn

  io.mc.periodBoundary := periodBoundary
  io.mc.periodCnt := mcPeriodCnt
}
