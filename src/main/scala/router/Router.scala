package  router

import chisel3._
import chisel3.util._

class Channel extends Bundle {
  val req = Input(Bool())
  val data = Input(UInt(35.W))
  //35bit link width = 32bit word width+3bit ctrl
  val ack = Output(Bool())
}

class RouterPort extends Bundle{
  val port = Vec(5, new Channel())
}

class HPU extends Module{
  val io = IO(new Bundle {
    val sel = Output(Vec(4, Bool()))
    val inLine = new Channel()
    val outLine = Flipped(new Channel())
  })
  val VLD = io.inLine.data(34)
  val SOP = io.inLine.data(33)
  val EOP = io.inLine.data(32)
  val dest = io.inLine.data(1,0)

  val selIntNext = WireDefault(0.U(4.W))
  val selInt = RegInit(0.U(4.W))
  val decodedSel = WireDefault(0.U(4.W))
  val outInt = WireDefault(0.U(35.W))

  io.outLine.req := true.B
  io.inLine.ack := true.B

  switch(dest){
    is(0.U){decodedSel := 1.U}
    is(1.U){decodedSel := 2.U}
    is(2.U){decodedSel := 4.U}
    is(3.U){decodedSel := 8.U}
  }

  when(SOP === 1.U){
    selIntNext := decodedSel
  }.otherwise{
    selIntNext := selInt & Mux((VLD|EOP),1.U,0.U)
  }

  when((EOP === 1.U || VLD === 1.U) && SOP === 0.U){
    io.sel := selInt.asBools
  }.otherwise{
    io.sel := selIntNext.asBools
  }

  when(SOP === 1.U){
    outInt := Cat("b110".U(3.W), io.inLine.data(31,16),0.U(2.W), io.inLine.data(15,2))
  }.otherwise{
    outInt := io.inLine.data
  }

  selInt := selIntNext
  io.outLine.data := outInt
}

class Xbar extends Module {
  val io = IO(new Bundle {
    val func = Input(UInt(20.W))
    val inPort = new RouterPort()
    val outPort = Flipped(new RouterPort())
  })

  for (i <- 0 to 4) {
    io.inPort.port(i).ack := true.B
    io.outPort.port(i).req := true.B
  }

  val sel = Wire(Vec(5, Vec(4, Bool())))
  val linkData = Wire(Vec(5, Vec(4, UInt(35.W))))


  for (i <- 0 to 4) {
    for (j <- 0 to 3) {
      sel(i)(j) := io.func(j + 4 * i)
    }
  }

  for (i <- 0 to 4) {
    for (j <- 0 to 3) {
      linkData(i)(j) := Mux(sel(i)(j), (-1).S(35.W).asUInt, 0.U(35.W))
    }
  }

  io.outPort.port(0).data := (io.inPort.port(1).data & linkData(1)(0)) |
    (io.inPort.port(2).data & linkData(2)(0)) |
    (io.inPort.port(3).data & linkData(3)(0)) |
    (io.inPort.port(4).data & linkData(4)(0))

  io.outPort.port(1).data := (io.inPort.port(0).data & linkData(0)(1)) |
    (io.inPort.port(2).data & linkData(2)(1)) |
    (io.inPort.port(3).data & linkData(3)(1)) |
    (io.inPort.port(4).data & linkData(4)(1))

  io.outPort.port(2).data := (io.inPort.port(0).data & linkData(0)(2)) |
    (io.inPort.port(1).data & linkData(1)(2)) |
    (io.inPort.port(3).data & linkData(3)(2)) |
    (io.inPort.port(4).data & linkData(4)(2))

  io.outPort.port(3).data := (io.inPort.port(0).data & linkData(0)(3)) |
    (io.inPort.port(1).data & linkData(1)(3)) |
    (io.inPort.port(2).data & linkData(2)(3)) |
    (io.inPort.port(4).data & linkData(4)(3))

  io.outPort.port(4).data := (io.inPort.port(0).data & linkData(0)(0)) |
    (io.inPort.port(1).data & linkData(1)(1)) |
    (io.inPort.port(2).data & linkData(2)(2)) |
    (io.inPort.port(3).data & linkData(3)(3))
}

class router extends Module{
  val io=IO(new Bundle{
    val inPort = new RouterPort()
    val outPort = Flipped(new RouterPort())
  })

  val HPUinReg = new RouterPort()
  val HPUin = Reg(Output(HPUinReg))
  val HPUoutReg = Flipped(new RouterPort())
  val HPUout = Reg(Output(HPUoutReg))
  val XbarSel = Reg(Vec(20, Bool()))
  val XbarOutReg = Flipped(new RouterPort())
  val XbarOut = Reg(Output(XbarOutReg))

  val Xbar = Module(new Xbar())
  val HPUs = for(i <- 0 to 4) yield {
    val HPU = Module(new HPU())
    HPU
  }

  HPUin <> io.inPort
  io.outPort <> XbarOut

  for(i <- 0 to 4){
    HPUs(i).io.inLine <> HPUin.port(i)
    HPUout.port(i) <> HPUs(i).io.outLine
    for(j <- 0 to 3) {
      XbarSel(4*i+j) := HPUs(i).io.sel(j)
    }
  }


  Xbar.io.inPort <> HPUout
  Xbar.io.func <> XbarSel.asUInt
  XbarOut <> Xbar.io.outPort

}

/**
 * An object extending App to generate the Verilog code.
 */
object router extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new router())
}

