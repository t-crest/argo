package argo

import chisel3._

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
  val IRQ_FIFO_IDX_WIDTH = 5
  val IRQ_DATA_FIFO_MIN = math.pow(2,IRQ_FIFO_IDX_WIDTH-1).toInt
  val IRQ_IRQ_FIFO_MAX = math.pow(2,IRQ_FIFO_IDX_WIDTH-1).toInt-1
  val IRQ_DATA_WIDTH = HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH

  /* DMA table constants and types*/
  val DMATBL_COUNT_WIDTH = 14
  val DMATBL_READ_PTR_WIDTH = 14
  val DMATBL_IDX_WIDTH = 6 //2^6=64 entries
  val DMATBL_DATA_WIDTH = HEADER_FIELD_WIDTH + DMATBL_READ_PTR_WIDTH + DMATBL_COUNT_WIDTH + 1

  /* Mode change table constants and types */
  val GENERATE_MC_TABLE = true
  val MCTBL_IDX_WIDTH = 2 //4 mode entries

  /* Schedule table constants and types */
  val STBL_IDX_WIDTH = 8
  val STBL_T2N_WIDTH = 4
  val STBL_PKT_LEN_WIDTH = 4



  val MEM_ADDR_WIDTH = HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH

  /* Configuration packet constants and types */
  val CPKT_BANK_WIDTH = 3
  val CPKT_ADDR_WIDTH = HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH - CPKT_BANK_WIDTH
  /* Constants for router/router links */
  val LINK_DATA_WIDTH = WORD_WIDTH
  val LINK_CTRL_WIDTH = 3
  val LINK_WIDTH = LINK_DATA_WIDTH + LINK_CTRL_WIDTH


  /* General constants */
  val MC_BANK = "b011".U(CPKT_BANK_WIDTH.W)

}
