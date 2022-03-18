package argo

import ArgoTypes._
import ArgoBundles._
import chisel3._
import chisel3.util._

class RxUnit extends Module {
  val io = IO(new Bundle {
    /** Input packet from router */
    val pkt = Input(UInt(LINK_WIDTH.W))

    /** Signals to IRQ FIFO */
    val irq = Flipped(new IrqFifoInput)
  })
  /* Registers */
  val sIdle :: sDataWLow :: sDataWHigh :: sConfigWLow :: sConfigWHigh :: sIrqW :: Nil = Enum(6)
  val state = RegInit(sIdle)

  /* Wires */
  val newPacket = io.pkt(LINK_WIDTH-1) && io.pkt(LINK_WIDTH-2) && !io.pkt(LINK_WIDTH-3)
  val newDataPacket = newPacket && !io.pkt(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 2)
  val newConfigPakcet = newPacket && !io.pkt(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 1)&& io.pkt(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 2)
  val newIrqPacket = newPacket && io.pkt(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 1) && io.pkt(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 2)


}
