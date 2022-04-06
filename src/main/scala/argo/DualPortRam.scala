package argo

import chisel3._
import ArgoBundles._

/**
 * A dual-ported RAM module
 * @param addrWidth Width in bits of the address line
 * @param dataWidth Width in bits of data stored in the RAM
 */
class DualPortRam(addrWidth: Int, dataWidth: Int) extends RawModule {
  val io = IO(new Bundle {
    val port1 = new RamPort(addrWidth, dataWidth)
    val port2 = new RamPort(addrWidth, dataWidth)
  })

  val mem = withClockAndReset(io.port1.clk, io.port1.reset) {SyncReadMem(math.pow(2,addrWidth).toInt, UInt(dataWidth.W))}

  withClockAndReset(io.port1.clk, io.port1.reset) {
    when(io.port1.we) {
      mem(io.port1.addr) := io.port1.wrData
    }
    io.port1.rdData := mem(io.port1.addr)
  }

  withClockAndReset(io.port2.clk, io.port2.reset) {
    when(io.port2.we) {
      mem(io.port2.addr) := io.port2.wrData
    }
    io.port2.rdData := mem(io.port2.addr)
  }
}
