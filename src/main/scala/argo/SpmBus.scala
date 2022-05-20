package argo

import argo.ArgoBundles._
import chisel3._
import chisel3.experimental.BundleLiterals._

class SpmBus extends Module {
  val io = IO(new Bundle {
    /** Input from SPM in processor core */
    val spmSlv = Input(new MemoryIfSlave)
    /** Output to SPM in processor core */
    val spm = Output(new MemoryIfMaster)
    /** Output to packet manager */
    val txSpmSlv = Output(new MemoryIfSlave)
    /** Input from packet manager */
    val txSpm = Input(new MemoryIfMaster)
    /** Input from [[RxUnit]] */
    val rxSpm = Input(new MemoryIfMaster)
  })

  //We can buffer one transaction from RxUnit if it arrives while a transaction
  //from the packet manager arrives at the same time
  val rxSpmBuf = RegInit((new MemoryIfMaster).Lit(
    _.wrData -> 0.U, _.addr -> 0.U, _.wr -> false.B, _.en(0) -> false.B, _.en(1) -> false.B)
  )
  rxSpmBuf.en(0) := io.rxSpm.en(0) && io.txSpm.en.reduce(_||_)
  rxSpmBuf.en(1) := io.rxSpm.en(1) && io.txSpm.en.reduce(_||_)
  rxSpmBuf.wr := io.rxSpm.wr
  rxSpmBuf.addr := io.rxSpm.addr
  rxSpmBuf.wrData := io.rxSpm.wrData

  when(io.txSpm.en.reduce(_||_)) {
    io.spm := io.txSpm
  } .elsewhen(rxSpmBuf.en.reduce(_||_)) {
    io.spm := rxSpmBuf
  } .elsewhen(io.rxSpm.en.reduce(_||_)) {
    io.spm := io.rxSpm
  } .otherwise {
    io.spm := io.txSpm
  }

  io.txSpmSlv := io.spmSlv
}
