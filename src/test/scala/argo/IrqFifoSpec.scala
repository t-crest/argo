package argo

import ArgoTypes._
import blackbox.IrqFifoWrapper
import chisel3._
import chiseltest._
import chiseltest.internal.CachingAnnotation
import chiselverify.crv.backends.jacop.{Model, RandObj, RandVar, rand}
import org.scalatest.flatspec.AnyFlatSpec

class IrqFifoSpec extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "IRQ Fifo"

  def compareOutputs(dut: IrqFifoWrapper): Unit = {
    val cio = dut.io.chisel
    val vio = dut.io.verilog

    cio.irq.expect(vio.irq.peek())
    cio.config.expect(vio.config.peek())
  }

  /*
  IRQ fifo test plan
  All tests below, as they encapsulate behaviour of the IRQ fifo very well
  Can create a bundle representing the value of data, datavalid and irqvalid. Can use these to poke information
  Can use a function to parse bundles and generate the expected outputs? Or should we just allow the Verilog to do that
   */

  val irqType: Int = 0
  val dataType: Int = 1

  class IrqFifoPacket(val pktType: Int) extends RandObj {
    require(Seq(0, 1).contains(pktType), s"Packet type must be one of '0' (data) and '1' (irq), was $pktType")
    currentModel = new Model()

    val data: RandVar = rand(0, (1 << IRQ_DATA_WIDTH) - 1)
    val dataValid: RandVar = rand(0, 1)
    val irqValid: RandVar = rand(0, 1)

    lazy val dataV: Boolean = if (dataValid.value() == 1) true else false
    lazy val irqV: Boolean = if (irqValid.value() == 1) true else false

    if (pktType == 0) { //IRQ
      dataValid == 0
      irqValid == 1
    } else { //Data
      dataValid == 1
      irqValid == 0
    }
  }

  /**
   * Poke data onto the IRQ Fifo
   * @param pkt The [[IrqFifoPacket]] to poke
   * @param dut The DUT to poke onto
   * @param randomize Whether to randomize the packet or not
   */
  def pokePacket(pkt: IrqFifoPacket, dut: IrqFifoWrapper, randomize: Boolean = true): Unit = {
    if (randomize && !pkt.randomize) {
      throw new Exception("Unable to randomize")
    }
    timescope {
      dut.io.in.irq.data.poke(pkt.data.value())
      dut.io.in.irq.dataValid.poke(pkt.dataV)
      dut.io.in.irq.irqValid.poke(pkt.irqV)
      dut.clock.step()
    }
  }

  /**
   * Read back the data from the IRQ fifo that was generated due to a given packet
   * @param pkt
   * @param dut
   */
  def readPacketData(pkt: IrqFifoPacket, dut: IrqFifoWrapper): Unit = {
    timescope {
      dut.io.in.sel.poke(true.B)
      dut.io.in.config.en.poke(true.B)
      dut.io.in.config.wr.poke(false.B)
      dut.io.in.config.addr.poke(pkt.pktType.U) //pktType=0 -> read from IRQ. pktType=1 -> read from data

      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.config.rdData.expect(pkt.data.value())
    }
  }

  it should "accept a single data packet" in {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, CachingAnnotation)) { dut =>
      val pkt = new IrqFifoPacket(dataType)
      pokePacket(pkt, dut)
      compareOutputs(dut)
      dut.io.chisel.irq.dataSig.expect(true.B)
      dut.io.chisel.irq.irqSig.expect(false.B)
    }
  }

  it should "accept a single IRQ packet" in {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, CachingAnnotation)) { dut =>
      val pkt = new IrqFifoPacket(irqType)
      pokePacket(pkt, dut)
      compareOutputs(dut)
      dut.io.chisel.irq.irqSig.expect(true.B)
      dut.io.chisel.irq.dataSig.expect(false.B)
    }
  }

  it should "read back irq data" in {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, CachingAnnotation)) {dut =>
      val pkts = Array.fill(4)(new IrqFifoPacket(irqType))

      //Poke all packets, then attempt to read them back
      for (pkt <- pkts) {
        pokePacket(pkt, dut)
      }
      //With no valid inputs, no outputs should change
      for(_ <- 0 until 5) {
        dut.clock.step()
        compareOutputs(dut)
      }
      //Read back each packet
      for (pkt <- pkts) {
        readPacketData(pkt, dut)
      }
      //irqSig should no longer be high, as queue has been emptied
      dut.io.chisel.irq.irqSig.expect(false.B)
      dut.io.chisel.irq.dataSig.expect(false.B)
    }
  }

  it should "read back data" in {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, CachingAnnotation)) {dut =>
      val pkts = Array.fill(4)(new IrqFifoPacket(dataType))

      //Poke all packets, then attempt to read them back
      for (pkt <- pkts) {
        pokePacket(pkt, dut)
      }
      //With no valid inputs, no outputs should change
      for(_ <- 0 until 5) {
        dut.clock.step()
        compareOutputs(dut)
      }
      //Read back each packet
      for (pkt <- pkts) {
        readPacketData(pkt, dut)
      }
      //dataSig should no longer be high, as queue has been emptied
      dut.io.chisel.irq.irqSig.expect(false.B)
      dut.io.chisel.irq.dataSig.expect(false.B)
    }
  }

  it should "write to and read from both queues" in {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, CachingAnnotation)) {dut =>
      //Each of the data, irq queues have half of the IRQ_FIFO_IDX_WIDTH large address space.
      //By generating 2^(IRQ_FIFO_IDX_WIDTH-1) packets, we ensure that none will be lost
      // due to the queue running out of space
      val pkts = Array.fill(1 << (IRQ_FIFO_IDX_WIDTH-1))(new IrqFifoPacket(randFromSeq(Seq(dataType, irqType))))

      //Poke all packets, then attempt to read them back
      for (pkt <- pkts) {
        pokePacket(pkt, dut)
      }
      //With no valid inputs, no outputs should change
      for(_ <- 0 until 5) {
        dut.clock.step()
        compareOutputs(dut)
      }
      //Read back each packet
      for (pkt <- pkts) {
        readPacketData(pkt, dut)
      }
      //dataSig should no longer be high, as queue has been emptied
      dut.io.chisel.irq.irqSig.expect(false.B)
      dut.io.chisel.irq.dataSig.expect(false.B)
    }
  }


  it should "generate an error when writing on config bus" in {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, CachingAnnotation)) {dut =>
      dut.io.in.config.en.poke(true.B)
      dut.io.in.config.wr.poke(true.B)
      dut.io.in.sel.poke(true.B)

      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.config.error.expect(true.B)
    }
  }

  it should "generate an error when reading an address larger than 1" in {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, CachingAnnotation)) {dut =>
      dut.io.in.config.en.poke(true.B)
      dut.io.in.config.wr.poke(false.B)
      dut.io.in.sel.poke(true.B)

      //Must be >1, so we subtract 2 from upper limit and then re-add 2 to result
      val R = scala.util.Random
      dut.io.in.config.addr.poke((R.nextInt((1 << MEM_ADDR_WIDTH) - 2) + 2).U)

      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.config.error.expect(true.B)
    }
  }

  def fillQueueTest(pktType: Int): Unit = {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, CachingAnnotation)) {dut =>
      //Note: "Error" in original implementation which has been preserved here: The fifo has 16 locations, but can only store
      //15 elements at once. This is because irqFull/dataFull goes high before the last position in the fifo has been written
      //For that reason, must poke 15 elements instead of 16 for test to pass, as 16'th element is lost in both cases
      //First data to write in and fetch back out
      //First data to write in and fetch back out
      val pkts1 = Array.fill(math.pow(2,IRQ_FIFO_IDX_WIDTH-1).toInt - 1)(new IrqFifoPacket(pktType))
      //Next data to write in, should cause pointers to reset
      val pkts2 = Array.fill(5)(new IrqFifoPacket(pktType))

      for (pkt <- pkts1) {
        pokePacket(pkt, dut)
      }
      //Read them back
      for (pkt <- pkts1) {
        readPacketData(pkt, dut)
      }

      //Write more data
      for (pkt <- pkts2) {
        pokePacket(pkt, dut)
      }
      //Read more back
      for (pkt <- pkts2) {
        readPacketData(pkt, dut)
      }
    }
  }

  it should "fill the data queue crossing back to the start" in {
    fillQueueTest(dataType)
  }

  it should "fill the IRQ queue crossing back to the start" in {
    fillQueueTest(irqType)
  }

  def readWriteConcurrentlyTest(pktType: Int): Unit = {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, CachingAnnotation)) {dut =>
      val pkts = Array.fill(8)(new IrqFifoPacket(pktType))

      //Poke in the first 4 packets
      for (i <- 0 until 4) {
        pokePacket(pkts(i), dut)
      }

      //Poke in the last 4 packets while reading out the first 4
      fork {
        for (i <- 4 until 8) {
          pokePacket(pkts(i), dut)
        }
      } .fork {
        for(i <- 0 until 4) {
          readPacketData(pkts(i), dut)
        }
      } .join()

      //Read out last 4
      for(i <- 4 until 8) {
        readPacketData(pkts(i), dut)
      }
      dut.io.chisel.irq.dataSig.expect(false.B)
    }
  }

  it should "read and write data at the same time" in {
    readWriteConcurrentlyTest(dataType)
  }

  it should "read and write irq at the same time" in {
    readWriteConcurrentlyTest(irqType)
  }
}
