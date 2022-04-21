package ocp

object OcpTypes {
  val OCP_CMD_WIDTH  = 3
  val OCP_ADDR_WIDTH = 32
  val OCP_DATA_WIDTH = 32
  val OCP_BYTE_WIDTH = OCP_DATA_WIDTH/8
  val OCP_RESP_WIDTH = 2

  val OCP_CMD_IDLE = 0x0
  val OCP_CMD_WR   = 0x1
  val OCP_CMD_RD   = 0x2

  val OCP_RESP_NULL = 0
  val OCP_RESP_DVA  = 0x1
  val OCP_RESP_FAIL = 0x2
  val OCP_RESP_ERR  = 0x3


}
