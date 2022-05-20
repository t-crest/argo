package blackbox

import chisel3._
import chisel3.util.HasBlackBoxResource

/**
 * A blackbox around a quartus-inferable parameterized, true dual port ram
 * @param addrWidth
 * @param dataWidth
 */
class tdp_ram(val addrWidth: Int, val dataWidth: Int) extends BlackBox(Map("DATA_WIDTH" -> dataWidth,
                                                                           "ADDR_WIDTH" -> addrWidth)) with HasBlackBoxResource {
  val io = IO(new Bundle {
    val a_clk = Input(Bool())
    val a_din = Input(UInt(dataWidth.W))
    val a_addr = Input(UInt(addrWidth.W))
    val a_we = Input(Bool())
    val a_dout = Output(UInt(dataWidth.W))
    val b_clk = Input(Bool())
    val b_din = Input(UInt(dataWidth.W))
    val b_addr = Input(UInt(addrWidth.W))
    val b_we = Input(Bool())
    val b_dout = Output(UInt(dataWidth.W))
  })
  addResource("/tdp_ram.v")
}
