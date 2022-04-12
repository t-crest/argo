package argo

import chisel3._
import ArgoBundles._

/**
 * A dual-ported RAM module
 * @param addrWidth Width in bits of the address line
 * @param dataType The type of data stored in the table
 */
class DualPortRam[T<: Data](addrWidth: Int, dataType: T) extends RawModule {
  val io = IO(new Bundle {
    val port1 = new RamPort(addrWidth, dataType)
    val port2 = new RamPort(addrWidth, dataType)
  })

  val mem = withClock(io.port1.clk) {SyncReadMem(math.pow(2,addrWidth).toInt, dataType)}

  when(io.port1.we) {
    mem(io.port1.addr, io.port1.clk) := io.port1.wrData
  }
  io.port1.rdData := mem(io.port1.addr, io.port1.clk)

  when(io.port2.we) {
    mem.write(io.port2.addr, io.port2.wrData, io.port2.clk)
  }
  io.port2.rdData := mem.read(io.port2.addr, true.B, io.port2.clk)
}