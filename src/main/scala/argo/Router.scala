package argo

import chisel3._
import chisel3.util._
import argo.ArgoBundles._

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

  io.outLine.req := io.inLine.req
  io.inLine.ack := io.outLine.ack

  switch(dest){
    is(0.U){decodedSel := 1.U}
    is(1.U){decodedSel := 2.U}
    is(2.U){decodedSel := 4.U}
    is(3.U){decodedSel := 8.U}
  }

  when(SOP){
    selIntNext := decodedSel
  }.otherwise{
    selIntNext := selInt & Mux((VLD|EOP),(-1).S(4.W).asUInt, 0.U(4.W))
  }

  when((EOP | VLD) && !SOP){
    io.sel := selInt.asBools
  }.otherwise{
    io.sel := selIntNext.asBools
  }

  when(SOP){ //On start of packet, shift destination and keep SOP flag
    outInt := Cat("b110".U(3.W), io.inLine.data(31,16), "b00".U(2.W) , io.inLine.data(15,2))
  }.otherwise{ //On valid and end of packet, keep data untouched
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
    io.inPort.port(i).ack := io.outPort.port(i).ack
    io.outPort.port(i).req := io.inPort.port(i).req
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

class Router extends Module{
  val io = IO(new Bundle{
    val inPort = new RouterPort()
    val outPort = Flipped(new RouterPort())
  })

  //Router consists of 3 stages:
  //Stage 1: Simply reg incoming 5 directions
  //Stage 2: Output of HPU
  //Stage 3: Output of Xbar

//  val linkStage = Reg(new RouterPort)
//  val HPUstage = Reg(new RouterPort)
//  val

  // in reg -> HPU -> reg -> Xbar -> reg

  //Modules
  val xbar = Module(new Xbar())
  val HPUs = for(_ <- 0 to 4) yield {
    val HPU = Module(new HPU())
    HPU
  }

  //Register stages
  val linkStage = Reg(Output(new RouterPort))
  val hpuStage = Reg(Output(new RouterPort()))
  val xbarStage = Reg(Output(new RouterPort()))


  //Forward connections
  val xbarSel = HPUs(4).io.sel.asUInt ## HPUs(3).io.sel.asUInt ## HPUs(2).io.sel.asUInt ## HPUs(1).io.sel.asUInt ## HPUs(0).io.sel.asUInt
//  val xbarSel = HPUs.map(_.io.sel.asUInt).foldLeft(0.U)((a,b) => a ## b)
  xbar.io.func := RegNext(xbarSel)
  for (i <- 0 to 4) {
    //Sample inputs into linkStage
    linkStage.port(i).data := io.inPort.port(i).data
    linkStage.port(i).req := io.inPort.port(i).req

    //Forward data from linkStage to HPU
    HPUs(i).io.inLine.data := linkStage.port(i).data
    HPUs(i).io.inLine.req := linkStage.port(i).req

    //Outputs from HPU to pipeline regs
    hpuStage.port(i).data := HPUs(i).io.outLine.data
    hpuStage.port(i).req := HPUs(i).io.outLine.req

    //HPU pipeline regs to xbar
    xbar.io.inPort.port(i).data := hpuStage.port(i).data
    xbar.io.inPort.port(i).req := hpuStage.port(i).req

    //Xbar to pipeline reg
    xbarStage.port(i).data := xbar.io.outPort.port(i).data
    xbarStage.port(i).req := xbar.io.outPort.port(i).req

    //Pipeline regs to outputs
    io.outPort.port(i).data := xbarStage.port(i).data
    io.outPort.port(i).req := xbarStage.port(i).req
  }

  //reverse connections. Synchronous version of Argo doesn't use the ack signal
  for(_ <- 0 to 4) {
    io.inPort.port.foreach(_.ack := DontCare)
    HPUs.foreach(_.io.outLine.ack := DontCare)
    xbar.io.outPort.port.foreach(_.ack := DontCare)
  }

//
//  val HPUinReg = Wire(Output(new RouterPort()))
//  val HPUin = RegNext(HPUinReg)
//  val HPUoutReg = Wire(Output(new RouterPort()))
//  val HPUout = RegNext(HPUoutReg)
//  val XbarSel = Reg(Vec(20, Bool()))
//  val XbarOutReg = Wire(Output(new RouterPort()))
//  val XbarOut = RegNext(XbarOutReg)

//  val Xbar = Module(new Xbar())
//  val HPUs = for(i <- 0 to 4) yield {
//    val HPU = Module(new HPU())
//    HPU
//  }


  //Xbar connections
//  xbar.io.inPort <> hpuOut
//  xbarOut := xbar.io.outPort
//  val xbarSel = Wire(UInt(20.W))
//  val xbarSel = HPUs.map(_.io.sel.asUInt).foldLeft(0.U)((b,a) => a ## b)


//  for (i <- 0 until 4) {
//    for (j <- 0 to 3) {
//      xbarSel(4*i+j) := HPUs(i).io.sel(j)
//    }
//  }

//  HPUin <> io.inPort
//  io.outPort <> XbarOut
//
//  for(i <- 0 to 4){
//    HPUs(i).io.inLine <> HPUin.port(i)
//    HPUout.port(i) <> HPUs(i).io.outLine
//    for(j <- 0 to 3) {
//      XbarSel(4*i+j) := HPUs(i).io.sel(j)
//    }
//  }
//
//
//  Xbar.io.inPort <> HPUout
//  Xbar.io.func <> XbarSel.asUInt
//  XbarOut <> Xbar.io.outPort
}

/**
 * An object extending App to generate the Verilog code.
 */
object Router extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new Router())
}

