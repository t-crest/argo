package ocp

import chisel3._
import OcpTypes._

object OcpBundles {

  class OcpIOMaster extends Bundle {
    val MCmd = UInt(OCP_CMD_WIDTH.W)
    val MAddr = UInt(OCP_ADDR_WIDTH.W)
    val MData = UInt(OCP_DATA_WIDTH.W)
    val MByteEn = UInt(OCP_BYTE_WIDTH.W)
    val MRespAccept = Bool()
  }

  class OcpIOSlave extends Bundle {
    val SResp = UInt(OCP_RESP_WIDTH.W)
    val SData = UInt(OCP_DATA_WIDTH.W)
    val SCmdAccept = Bool()
  }
}
