package argo

import argo.ArgoTypes.{LINK_DATA_WIDTH, MEM_ADDR_WIDTH}
import blackbox._
import chisel3._
import chiseltest._
import chiseltest.internal.CachingAnnotation
import chiselverify.crv.backends.jacop.{Model, RandObj, RandVar, rand}
import org.scalatest.flatspec.AnyFlatSpec


class RxUnitSpec extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "Rx Unit"

  val VALID_SOP = 0x6L << 32L
  val VALID     = 0x4L << 32L
  val VALID_EOP = 0x5L << 32L

  /**
   * Create an Argo packet targeting a random address with random payload data
   * @param pktType One of "00" (data), "01" (config) or "11" (irq)
   */
  class ArgoPacket(val pktType: Int) extends RandObj {
    require(Seq(0, 1, 3).contains(pktType), s"argo packet type must be one of '00' (data), '01' (config) or '11' (irq), was ${pktType.toBinaryString}")
    currentModel = new Model()
    val len: RandVar = rand(1, 5)
    val addr: RandVar = rand(0, math.pow(2, MEM_ADDR_WIDTH).toInt)


    if (pktType == 1) { //if config packet: Max length is 2
      len < 3
    } else if (pktType == 3) { //if irq, always exactly one word
      len == 1
    }

    //Must use LINK_DATA_WIDTH-2 as it otherwise generates an error (sees upper bound as negative)
    val payload = Array.tabulate(len.max())(_ => rand(0, math.pow(2, LINK_DATA_WIDTH-2).toInt))

    /** Convert the ArgoPacket to a series of pokeable values */
    def toPackets: Seq[Long] = {
      val pkts = Array.ofDim[Long](1+len.value())
      //Header packet
      pkts(0) = VALID_SOP | (addr.value() << 16)
      for(i <- 1 until len.value()) {
        pkts(i) = VALID | (payload(i-1).value().toLong << 2)
      }
      pkts(len.value()) = VALID_EOP | payload(len.value()-1).value()
      pkts.toSeq
    }
  }

  def compareOutputs(dut: RxUnitWrapper): Unit = {
    val cio = dut.io.chisel
    val vio = dut.io.verilog

    cio.irq.expect(vio.irq.peek())
    cio.spm.expect(vio.spm.peek())
    cio.config.expect(vio.config.peek())
  }

  def testCRV(pktType: Int): Unit = {
    test(new RxUnitWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, CachingAnnotation)) { dut =>
      val ap = new ArgoPacket(pktType)
      if (!ap.randomize) {
        throw new UnknownError("Unable to randomize ap")
      }
      println(s"pktType=$pktType, pkt.len=${ap.len.value()}")

      val packets = ap.toPackets
      for (p <- packets) {
        dut.io.in.pkt.poke(p)
        dut.clock.step()
        compareOutputs(dut)
      }
      dut.clock.step()
    }
  }

  it should "forward a data packet, chisel-verify style" in {
    testCRV(0)
  }

  it should "forward a config packet, chisel-verify style" in {
    testCRV(1)
  }

  it should "forward an IRQ packet, chisel-verify style" in {
    testCRV(3)
  }

  it should "forward multiple packets in a row" in {
    test(new RxUnitWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, CachingAnnotation)) {dut =>
      //Will poke 10 packets in a row
      val aps = Array.fill(10)(new ArgoPacket(randFromSeq(Seq(0, 1, 3))))
      for ((ap, i) <- aps.zipWithIndex) {
        if (!ap.randomize) {
          throw new Exception(s"Unable to randomize packet $i ($ap)")
        }
        println(s"Packet $i, type=${ap.pktType}, len=${ap.len.value()}")
        for (p <- ap.toPackets) {
          dut.io.in.pkt.poke(p)
          dut.clock.step()
          compareOutputs(dut)
        }
      }
      dut.clock.step()
    }
  }
}
