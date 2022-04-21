package argo

import chisel3._
import ArgoTypes._

object ArgoBundles {
  /**
   * Input bundle to the [[IrqFIFO]] from RxUnit
   * Use as Input() in IrqFIFO, use Output() in RxUnit
   */
  class IrqFifoInput extends Bundle {
    val dataValid = Bool()
    val irqValid = Bool()
    val data = UInt(IRQ_DATA_WIDTH.W)
  }

  /**
   * Output bundle from the [[IrqFIFO]] to something else ...
   * Use as Output() in IrqFIFO, use as Input() in others
   */
  class IrqFifoOutput extends Bundle {
    val irqSig = Bool()
    val dataSig = Bool()
  }

  /**
   * Data signal between [[ScheduleTable]] and packet manager
   * Use as-is in Schedule table, use Flipped() in Packet Manager
   */
  class SchedTblPacketManIO extends Bundle {
    val route = Output(UInt(HEADER_ROUTE_WIDTH.W))
    val pktLen = Output(UInt(STBL_PKT_LEN_WIDTH.W))
    val dmaNum = Output(UInt(DMATBL_IDX_WIDTH.W))
    val dmaEn = Output(Bool())
  }

  /**
   * Data signals between [[TdmController]] and [[ScheduleTable]]
   * Use as-is in TDM controller, use Flipped() in Schedule Table
   */
  class TdmControlSchedTblIO extends Bundle {
    val idx = Output(UInt(STBL_IDX_WIDTH.W))
    val en = Output(Bool())
    val t2n = Input(UInt(STBL_T2N_WIDTH.W))
  }

  /**
   * Data signals between the [[TdmController]] and [[McController]].
   * Use as-is in the TDM controller, use Flipped() in Mode Change Controller
   */
  class TdmControlModeChangeIO extends Bundle {
    val periodBoundary = Output(Bool())
    val periodCnt = Output(UInt(2.W))
    val stblMin = Input(UInt(STBL_IDX_WIDTH.W))
    val stblMaxp1 = Input(UInt(STBL_IDX_WIDTH.W))
  }

  /**
   * Data signals between the [[McController]] and [[PacketManager]].
   * Use as-is in Mode Change Controller, use Flipped() in Packet Manager
   */
  class ModeChangePacketManIO extends Bundle {
    val mc = Output(Bool())
    val mcIdx = Output(UInt(MCTBL_IDX_WIDTH.W))
    val mcP = Output(UInt(2.W))
  }

  class ConfigIfSlave extends Bundle {
    val rdData = UInt(WORD_WIDTH.W)
    val error = Bool()
  }

  class ConfigIfMaster extends Bundle {
    val addr  = UInt(MEM_ADDR_WIDTH.W)
    val en = Bool()
    val wr = Bool()
    val wrData = UInt(WORD_WIDTH.W)
  }

  class MemoryIfMaster extends Bundle {
    /** Address to write to */
    val addr = UInt(MEM_ADDR_WIDTH.W)
    /** Word enables for wrData */
    val en = Vec(2, Bool())
    /** Write enable signal */
    val wr = Bool()
    /** Write data */
    val wrData = UInt(DWORD_WIDTH.W)
  }

  class MemoryIfSlave extends Bundle {
    val rdData = UInt(DWORD_WIDTH.W)
    val error = Bool()
  }

  class RamPort[T <: Data](addrWidth: Int, dataType: T) extends Bundle {
    /** Clock signal */
    val clk = Input(Clock())
    /** Write enable */
    val we = Input(Bool())
    /** Read/write access */
    val addr = Input(UInt(addrWidth.W))
    /** Write data */
    val wrData = Input(dataType)
    /** Read data */
    val rdData = Output(dataType)
  }

  class DmaTableData extends Bundle {
    val active = Bool() //45
    val count = UInt(DMATBL_COUNT_WIDTH.W) //44:30
    val readPtr = UInt(DMATBL_READ_PTR_WIDTH.W) //29:16
    val header = UInt(HEADER_FIELD_WIDTH.W) //15:0
  }

  class SchedTableContents extends Bundle {
    val route  = UInt(HEADER_ROUTE_WIDTH.W)
    val dma    = UInt(DMATBL_IDX_WIDTH.W)
    val pktLen = UInt(STBL_PKT_LEN_WIDTH.W)
    val t2n    = UInt(STBL_T2N_WIDTH.W) //t2n = time 2 next
  }

  class ModeArrayContents extends Bundle {
    val min = UInt(STBL_IDX_WIDTH.W)
    val max = UInt(STBL_IDX_WIDTH.W)
  }
}
