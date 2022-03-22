package argo

object ArgoTypes {

  /* General data width constants */
  val WORD_WIDTH = 32
  val DWORD_WIDTH = 2*WORD_WIDTH
  val HALF_WORD_WIDTH = WORD_WIDTH/2
  val QUAD_WORD_WIDTH = WORD_WIDTH/4

  /* Header packet constants */
  val HEADER_ROUTE_WIDTH = 16
  val HEADER_FIELD_WIDTH = 16
  val HEADER_CTRL_WIDTH =  2

  /* Interrupt FIFO constants */
  val IRQ_DATA_WIDTH = HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH

  val MEM_ADDR_WIDTH = HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH

  /* Constants for router/router links */
  val LINK_DATA_WIDTH = WORD_WIDTH
  val LINK_CTRL_WIDTH = 3
  val LINK_WIDTH = LINK_DATA_WIDTH + LINK_CTRL_WIDTH
}
