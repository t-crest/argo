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
  val IRQ_DATA_FIFO_MAX = (math.pow(2,IRQ_FIFO_IDX_WIDTH)-1).toInt
  val IRQ_DATA_FIFO_MIN = math.pow(2,IRQ_FIFO_IDX_WIDTH-1).toInt
  val IRQ_IRQ_FIFO_MAX = math.pow(2,IRQ_FIFO_IDX_WIDTH-1).toInt-1
  val IRQ_IRQ_FIFO_MIN = 0
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

  //NI banks. CPKT_BANK_WIDTH wide
  val DMA_BANK   = 0x0
  val SCHED_BANK = 0x1
  val TDM_BANK   = 0x2
  val MC_BANK    = 0x3
  val IRQ_BANK   = 0x4
  val PERF_BANK  = 0x7

  /* Constants for router/router links */
  val LINK_DATA_WIDTH = WORD_WIDTH
  val LINK_CTRL_WIDTH = 3
  val LINK_WIDTH = LINK_DATA_WIDTH + LINK_CTRL_WIDTH

  /* TDM Controller constants and types */
  val TDM_S_CNT_WIDTH = 10
  val GENERATE_CLK_COUNTER = false
  val GENERATE_PERIOD_COUNTER = false
  val GENERATE_SLOT_COUNTER = false

}
