package argo

import chisel3._
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

  //Registers
  val state = RegInit(sIdle)
  val readReg = RegInit(0.U(WORD_WIDTH.W))
  val mcReg = RegInit(false.B)
  val error = RegInit(false.B)
  val mcCnt = RegInit(0.U(2.W))

  val mcIdx = RegInit(0.U(MCTBL_IDX_WIDTH.W))
  val stblMin = RegInit(0.U(STBL_IDX_WIDTH.W))
  val stblMaxp1 = RegInit(0.U(STBL_IDX_WIDTH.W))
  val mode = RegInit(VecInit(Seq.fill(1 << MCTBL_IDX_WIDTH)((new ModeArrayContents).Lit(_.min -> 0.U, _.max -> 0.U))))
  val modeIdx = RegInit(0.U(MCTBL_IDX_WIDTH.W))

  //Wires
  val mcCntInt = WireDefault(0.U(2.W))
  val modeMin = WireDefault(stblMin)
  val modeMax = WireDefault(stblMaxp1)
  val localMcIdx = WireDefault(false.B)
  val mcTblAddr = WireDefault(io.config.m.addr(CPKT_ADDR_WIDTH-1, 0) - 2.U)

  /* Assignments */
  //Some of these are defaults that will be changed later
  io.config.s.rdData := readReg
  io.config.s.error := error

  error := false.B

  //Register read/write logic
  when(io.config.sel && io.config.m.en) {
    when(!io.config.m.wr) { //Register read
      when(io.config.m.addr === 0.U(CPKT_ADDR_WIDTH)) {
        readReg := Cat(readReg(WORD_WIDTH-1, MCTBL_IDX_WIDTH), modeIdx)
      } .otherwise {
        error := true.B
      }
    } .otherwise { //Register write
      when(io.config.m.addr === 0.U(CPKT_ADDR_WIDTH)) {
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
        error := false.B
      }
    }
  }


}
