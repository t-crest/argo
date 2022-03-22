package argo

import chisel3._
import ArgoTypes._

object ArgoBundles {
  /**
   * Input bundle to the [[IrqFIFO]] from RxUnit
   * Use as-is in IrqFIFO, use Flipped() in RxUnit
   */
  class IrqFifoInput extends Bundle {
    val dataValid = Input(Bool())
    val irqValid = Input(Bool())
    val data = Input(UInt(IRQ_DATA_WIDTH.W))
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
}
