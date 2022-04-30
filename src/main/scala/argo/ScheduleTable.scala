package argo

import chisel3._
import chisel3.util._
import ArgoBundles._
import ArgoTypes._

/**
 * Argo 2.0 schedule table
 * The schedule table is programmed through the config bus, and takes inputs
 * from the [[TdmController]] telling it which schedule table slot is currently active.
 * The currently active slot selects which DMA should be used for data transfers.
 * The currently active config address can be used to read/write schedule table contents,
 * and the stblIdx-input is used to select the current entry
 *
 * @author Kasper Juul Hesse Rasmussen, s183735@student.dtu.dk
 */
class ScheduleTable extends Module {
  val io = IO(new Bundle {
    val config = new Bundle {
      val sel = Input(Bool())
      val m = Input(new ConfigIfMaster)
      val s = Output(new ConfigIfSlave)
    }
    val tdm = Flipped(new TdmControlSchedTblIO)
    val pktman = new SchedTblPacketManIO
  })

  /*
  Fields of the schedule table (write and read access)
  The address
  Name         | Bits
  -------------+-------
  Route        | 16
  DMA #        | 8
  Pkt. len     | 3
  Time to next | 5
   */
  //Registers
  val error = RegInit(false.B)
  val stblIdxEn = RegNext(io.tdm.en, false.B)

  //Modules
  val schedTable = Module(new DualPortRam(STBL_IDX_WIDTH, new SchedTableContents))
  val port1 = Wire(new RamPort(STBL_IDX_WIDTH, new SchedTableContents))
  val port2 = Wire(new RamPort(STBL_IDX_WIDTH, new SchedTableContents))

  //Assignments
  port1.clk := this.clock
  port1.we := io.config.m.wr && io.config.sel
  port1.addr := io.config.m.addr(STBL_IDX_WIDTH-1,0)
  port1.wrData.route := io.config.m.wrData(HALF_WORD_WIDTH+HEADER_ROUTE_WIDTH-1, HALF_WORD_WIDTH)
  port1.wrData.dma := io.config.m.wrData(QUAD_WORD_WIDTH+DMATBL_IDX_WIDTH-1, QUAD_WORD_WIDTH)
  port1.wrData.pktLen := io.config.m.wrData(STBL_PKT_LEN_WIDTH+STBL_T2N_WIDTH-1, STBL_T2N_WIDTH)
  port1.wrData.t2n := io.config.m.wrData(STBL_T2N_WIDTH-1, 0)

  port2.clk := this.clock
  port2.we := false.B
  port2.addr := io.tdm.idx
  port2.wrData := DontCare

  schedTable.io.port1 <> port1
  schedTable.io.port2 <> port2

  error := io.config.sel && io.config.m.addr(CPKT_ADDR_WIDTH-1,STBL_IDX_WIDTH) =/= 0.U

  //outputs
  io.pktman.route := port2.rdData.route
  io.pktman.pktLen := port2.rdData.pktLen
  io.pktman.dmaNum := port2.rdData.dma
  io.pktman.dmaEn := Mux(port2.rdData.dma === VecInit(Seq.fill(DMATBL_IDX_WIDTH)(true.B)).asUInt, false.B, stblIdxEn)

  io.tdm.t2n := port2.rdData.t2n

  io.config.s.rdData := Cat(port1.rdData.route, 0.U((QUAD_WORD_WIDTH-DMATBL_IDX_WIDTH).W), port1.rdData.dma, port1.rdData.pktLen, port1.rdData.t2n)
  io.config.s.error := error
}
