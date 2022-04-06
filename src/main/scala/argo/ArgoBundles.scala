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

  class RamPort(addrWidth: Int, dataWidth: Int) extends Bundle {
    /** Clock signal */
    val clk = Input(Clock())
    /** Reset signal */
    val reset = Input(Bool())
    /** Write enable */
    val we = Input(Bool())
    /** Read/write access */
    val addr = Input(UInt(addrWidth.W))
    /** Write data */
    val wrData = Input(UInt(dataWidth.W))
    /** Read data */
    val rdData = Output(UInt(dataWidth.W))
  }

  class DmaTableData extends Bundle {
    val active = Bool() //45
    val count = UInt(DMATBL_COUNT_WIDTH.W) //44:30
    val readPtr = UInt(DMATBL_READ_PTR_WIDTH.W) //29:16
    val header = UInt(HEADER_FIELD_WIDTH.W) //15:0
  }
}
