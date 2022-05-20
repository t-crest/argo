package argo

import chisel3._
import chisel3.util._
import chisel3.experimental.BundleLiterals._
import ArgoTypes._
import ArgoBundles._
import chisel3.util.{Cat, Enum}

class McController(val master: Boolean = true) extends Module {
  val io = IO(new Bundle {
    val run = Input(Bool())
    val config = new Bundle {
      val m = Input(new ConfigIfMaster)
      val sel = Input(Bool())
      val s = Output(new ConfigIfSlave)
    }
    val tdm = Flipped(new TdmControlModeChangeIO)
    val pktman = new ModeChangePacketManIO
  })

  override def desiredName: String = if(master) {
    "McController_m"
  } else {
    "McController_s"
  }
/*
--------------------------------------------------------------------------------
-- Addresses of readable/writable registers (Word based addresses inside the NI)
-- Address  | Access  | Name
--------------------------------------------------------------------------------
-- 0x00     | WR      | MODE_CHANGE_IDX
-- ...      |         | ...
-- 0x02     | WR      | MODE(1)
-- 0x03     | WR      | MODE(2)
-- 0x04     | WR      | MODE(3)
--------------------------------------------------------------------------------
*/
  val sIdle :: sWaitMc :: sModeChange :: Nil = Enum(3)

  //Registers and wires
  val state = RegInit(sIdle)
  val readReg = RegInit(0.U(WORD_WIDTH.W)) //read_reg
  val mcReg = RegInit(false.B) //mc_reg, mc_next
  val error = RegInit(false.B) //config_slv.error
  val mcCnt = RegInit(0.U(2.W)) //mode_change_cnt_reg

  val mcIdx = RegInit(0.U(MCTBL_IDX_WIDTH.W)) //MODE_CHANGE_IDX_reg //Enabled when when localModeChange=1, but this only ever happens at the same time
  val stblMin = RegInit(0.U(STBL_IDX_WIDTH.W)) //stbl_min_reg
  val stblMaxp1 = RegInit(0.U(STBL_IDX_WIDTH.W)) //stbl_maxp1_reg
  val mode = RegInit(VecInit(Seq.fill(1 << MCTBL_IDX_WIDTH)((new ModeArrayContents).Lit(_.min -> 0.U, _.max -> 0.U)))) //MODE_reg
  val modeIdx = RegInit(0.U(MCTBL_IDX_WIDTH.W)) //MODE_IDX_reg
  val modeChanged = RegInit(false.B) //mode_changed_reg

  //Wires
  val mcCntInt = WireDefault(0.U(2.W)) //mode_change_cnt_int
  val modeMin = WireDefault(stblMin) //MODE_min_next
  val modeMax = WireDefault(stblMaxp1) //MODE_max_next
  val localMcIdx = WireDefault(false.B) //local_mode_change_idx
  val globalMcIdx = WireDefault(false.B) //global_mode_change_idx
  val mcTblAddr = WireDefault(io.config.m.addr(CPKT_ADDR_WIDTH-1, 0) - 2.U) //mc_tbl_addr
  val stblMinNext = WireDefault(0.U(STBL_IDX_WIDTH.W)) //STBL_MIN_next //require an explicit next-signal as we sometimes bypass the stblMin-register
  val stblMaxp1Next = WireDefault(0.U(STBL_IDX_WIDTH.W)) //STBL_MAXP1_next //require an explicit next-signal as we sometimes bypass the stblMin-register

  /* Assignments */
  //Some of these are defaults that will be changed later
  io.config.s.rdData := readReg
  io.config.s.error := error

  error := false.B

  //Register read/write logic
  when(io.config.sel && io.config.m.en) {
    when(!io.config.m.wr) { //Register read
      when(io.config.m.addr(CPKT_ADDR_WIDTH-1, 0) === 0.U) {
        readReg := Cat(readReg(WORD_WIDTH-1, MCTBL_IDX_WIDTH), modeIdx)
      } .otherwise {
        error := true.B
      }
    } .otherwise { //Register write
      when(io.config.m.addr(CPKT_ADDR_WIDTH-1, 0) === 0.U) {
        mcIdx := io.config.m.wrData(MCTBL_IDX_WIDTH-1,0)
        mcCnt := mcCntInt
        localMcIdx := true.B
      } .otherwise {
        error := true.B
      }
      //Write mode change registers
      when(mcTblAddr < (1 << MCTBL_IDX_WIDTH).U) {
        if(GENERATE_MC_TABLE) {
          mode(mcTblAddr).min := io.config.m.wrData(STBL_IDX_WIDTH-1, 0)
          mode(mcTblAddr).max := io.config.m.wrData(STBL_IDX_WIDTH+HALF_WORD_WIDTH-1, HALF_WORD_WIDTH)
        } else {
          modeMin := io.config.m.wrData(STBL_IDX_WIDTH-1, 0)
          modeMax := io.config.m.wrData(STBL_IDX_WIDTH+HALF_WORD_WIDTH-1, HALF_WORD_WIDTH)
        }
        //Apparently, if a mode change register is written, no error occurs
        error := false.B
      }
    }
  }

  //Master/slave run signals
  if(GENERATE_MC_TABLE) {
    if(this.master) {
      io.pktman.mc := mcReg
      io.pktman.mcIdx := mcIdx
      mcCntInt := io.tdm.periodCnt + 2.U
      io.pktman.mcP := mcCnt
      globalMcIdx := false.B
      switch(state) {
        is(sIdle) {
          when(localMcIdx && io.run) {
            state := sWaitMc
          }
        }
        is(sWaitMc) {
          when(io.tdm.periodBoundary) {
            mcReg := true.B
            state := sModeChange
          }
        }
        is(sModeChange) {
          when(io.tdm.periodBoundary) {
            mcReg := false.B
            globalMcIdx := true.B
            state := sIdle
          }
        }
      }
    } else { //!this.master
      io.pktman.mc := false.B
      io.pktman.mcIdx := 0.U
      mcCntInt := io.config.m.wrData(WORD_WIDTH/2+1, WORD_WIDTH/2)
      io.pktman.mcP := 0.U
      globalMcIdx := Mux(modeChanged && mcCnt === io.tdm.periodCnt, true.B, false.B)
      when(localMcIdx) {
        modeChanged := true.B
      } .elsewhen (globalMcIdx) {
        modeChanged := false.B
      }

    }
  } else { //!GENERATE_MC_TABLE
    modeChanged := false.B
    io.pktman.mc := false.B
    io.pktman.mcIdx := 0.U
    mcCntInt := 0.U
    io.pktman.mcP := 0.U
    globalMcIdx := false.B
  }

  //Mode change circuitry
  if(GENERATE_MC_TABLE) {
    stblMinNext := mode(modeIdx).min
    stblMaxp1Next := mode(modeIdx).max
  } else {
    stblMinNext := modeMin
    stblMaxp1Next := modeMax
  }

  //Only whenever globalMcIdx=true should modeIdx update
  modeIdx := Mux(globalMcIdx, mcIdx, modeIdx)

  //schedule table indices should only be updated on period boundaries
  //On period boundaries, forward the next value of stblMin instead of using register value
  io.tdm.stblMin := Mux(io.tdm.periodBoundary, stblMinNext, stblMin)
  stblMin := Mux(io.tdm.periodBoundary, stblMinNext, stblMin)
  stblMaxp1 := Mux(io.tdm.periodBoundary, stblMaxp1Next, stblMaxp1)
  //High index should only change on a period boundary
  //Index points to the table entry after the last entry in the schedule
  io.tdm.stblMaxp1 := stblMaxp1
}
