package argo

import argo.ArgoBundles._
import argo.ArgoTypes._
import chisel3._
import ocp.OcpBundles.{OcpIOMaster, OcpIOSlave}

/**
 * Argo 2.0 network interface
 *
 * This module contains all submodules necessary for the Argo NoC to communicate between
 * processing nodes
 * @param master
 */
class NetworkInterface(val master: Boolean = false) extends Module {
  val io = IO(new Bundle {
    val run = Input(Bool())
    val masterRun = Output(Bool())
    val supervisor = Input(Bool())
    val ocp = new Bundle {
      val in = Input(new OcpIOMaster)
      val out = Output(new OcpIOSlave)
    }
    val irq = new Bundle {
      val data = Output(Bool())
      val config = Output(Bool())
    }
    val spm = new Bundle {
      val in = Input(new MemoryIfSlave)
      val out = Output(new MemoryIfMaster)
    }
    val pkt = new Bundle {
      val in = Input(UInt(LINK_WIDTH.W))
      val out = Output(UInt(LINK_WIDTH.W))
    }
  })

  override def desiredName: String = if(this.master) {
    "NetworkInterface_m"
  } else {
    "NetworkInterface_s"
  }

  //Components
  val tdm = Module(new TdmController(master))
  val mc = Module(new McController(master))
  val schedTbl = Module(new ScheduleTable)
  val pktman = Module(new PacketManager(master))
  val rxUnit = Module(new RxUnit)
  val irqFifo = Module(new IrqFIFO)
  val config = Module(new ConfigBus)
  val spmBus = Module(new SpmBus)

  //Connections
  tdm.io.config.sel := config.io.sel.tdm
  tdm.io.config.m := config.io.configOut
  tdm.io.mc <> mc.io.tdm
  tdm.io.run := io.run
  tdm.io.stbl <> schedTbl.io.tdm

  mc.io.run := io.run
  mc.io.config.sel := config.io.sel.mc
  mc.io.config.m := config.io.configOut
  mc.io.pktman <> pktman.io.mc

  schedTbl.io.config.sel := config.io.sel.schedTable
  schedTbl.io.config.m := config.io.configOut
  schedTbl.io.pktman <> pktman.io.schedTbl

  pktman.io.config.sel := config.io.sel.pktman
  pktman.io.config.m := config.io.configOut
  pktman.io.spm.in := spmBus.io.txSpmSlv

  rxUnit.io.pkt := io.pkt.in

  irqFifo.io.irqIn := rxUnit.io.irq
  irqFifo.io.config.sel := config.io.sel.irq
  irqFifo.io.config.m := config.io.configOut

  config.io.supervisor := io.supervisor
  config.io.ocp.m := io.ocp.in
  config.io.configIn := rxUnit.io.config
  config.io.slaves.tdm := tdm.io.config.s
  config.io.slaves.pktman := pktman.io.config.s
  config.io.slaves.schedTable := schedTbl.io.config.s
  config.io.slaves.mc := mc.io.config.s
  config.io.slaves.irq := irqFifo.io.config.s

  spmBus.io.spmSlv := io.spm.in
  spmBus.io.txSpm := pktman.io.spm.out
  spmBus.io.rxSpm := rxUnit.io.spm

  io.masterRun := tdm.io.masterRun
  io.ocp.out := config.io.ocp.s
  io.irq.data := irqFifo.io.irqOut.dataSig
  io.irq.config := irqFifo.io.irqOut.irqSig
  io.spm.out := spmBus.io.spm
  io.pkt.out := pktman.io.pktOut
}
