package argo

import chisel3._
import ArgoBundles._
import blackbox.tdp_ram

/**
 * A dual-ported RAM module
 * @param addrWidth Width in bits of the address line
 * @param dataType The type of data stored in the table
 */
class DualPortRam[T <: Data](addrWidth: Int, dataType: T) extends RawModule {
    override def desiredName: String = s"DualPortRam_${addrWidth}_${dataType.toString}"
    val io = IO(new Bundle {
      val port1 = new RamPort(addrWidth, dataType)
      val port2 = new RamPort(addrWidth, dataType)
    })
  val ram = Module(new tdp_ram(addrWidth = addrWidth, dataWidth = dataType.getWidth))

  ram.io.a_clk := io.port1.clk.asBool
  ram.io.a_din := io.port1.wrData.asUInt
  ram.io.a_we := io.port1.we
  ram.io.a_addr := io.port1.addr
  ram.io.b_clk := io.port2.clk.asBool
  ram.io.b_din := io.port2.wrData.asUInt
  ram.io.b_we := io.port2.we
  ram.io.b_addr := io.port2.addr

  io.port1.rdData := ram.io.a_dout.asTypeOf(dataType)
  io.port2.rdData := ram.io.b_dout.asTypeOf(dataType)
}
