package argo

import argo.ArgoBundles._
import chisel3._
import chisel3.util._
import ocp.OcpBundles._

/**
 * A node in the Argo 2.0 NoC, comprising a network interface and a router
 */
class NoCNode(val master: Boolean = false) extends Module {
  val io = IO(new Bundle {
    val run = Input(Bool())
    val masterRun = Output(Bool())
    val supervisor = Input(Bool())
    val ocp = new Bundle {
      val in = Input(new OcpIOMaster)
      val out = Output(new OcpIOSlave)
    }
    val irq = Output(UInt(2.W))
    val spm = new Bundle {
      val in = Input(new MemoryIfSlave)
      val out = Output(new MemoryIfMaster)
    }
    val channelIn = new Bundle {
      val north = new Channel
      val east = new Channel
      val south = new Channel
      val west = new Channel
    }
    val channelOut = new Bundle {
      val north = Flipped(new Channel)
      val east = Flipped(new Channel)
      val south = Flipped(new Channel)
      val west = Flipped(new Channel)
    }
  })

  override def desiredName: String = if(this.master) {
    "NoCNode_m"
  } else {
    "NoCNode_s"
  }

  val ni = Module(new NetworkInterface(master))
  val router = Module(new Router)

  ni.io.run := io.run
  ni.io.supervisor := io.supervisor
  ni.io.ocp.in := io.ocp.in
  ni.io.spm.in := io.spm.in
  ni.io.pkt.in := router.io.outPort.port(4).data

  router.io.inPort.port(0) <> io.channelIn.south
  router.io.inPort.port(1) <> io.channelIn.west
  router.io.inPort.port(2) <> io.channelIn.north
  router.io.inPort.port(3) <> io.channelIn.east
  router.io.inPort.port(4).data := ni.io.pkt.out
  router.io.inPort.port(4).req := false.B
  router.io.outPort.port(4).ack := false.B

  io.channelOut.south <> router.io.outPort.port(0)
  io.channelOut.west <> router.io.outPort.port(1)
  io.channelOut.north <> router.io.outPort.port(2)
  io.channelOut.east <> router.io.outPort.port(3)

  io.masterRun := ni.io.masterRun
  io.ocp.out := ni.io.ocp.out
  io.spm.out := ni.io.spm.out
  io.irq := Cat(ni.io.irq.config, ni.io.irq.data)
}
