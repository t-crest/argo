package argo

import chisel3._
import ArgoTypes._

object ArgoBundles {
  class IrqFifoInput extends Bundle {
    val DataFifoValid = Input(Bool())
    val IrqFifoValid = Input(Bool())
    val DataFifoData = Input(UInt(IRQ_DATA_WIDTH.W))
  }
}
