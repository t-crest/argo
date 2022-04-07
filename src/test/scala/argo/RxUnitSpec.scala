package argo

import blackbox._
import argo.ArgoTypes._
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class RxUnitSpec extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "Rx Unit"

  val VALID_SOP = 0x6L << 32L
  val VALID     = 0x4L << 32L
  val VALID_EOP = 0x5L << 32L

  def compareOutputs(dut: RxUnitWrapper): Unit = {
    val cio = dut.io.chisel
    val vio = dut.io.verilog

    //Simply compare and expect all signals to be the same
    cio.irq.irqValid.expect(vio.irq.irqValid.peek())
    cio.irq.dataValid.expect(vio.irq.dataValid.peek())
    cio.irq.data.expect(vio.irq.data.peek())

    cio.spm.wrData.expect(vio.spm.wrData.peek())
    cio.spm.en.expect(vio.spm.en.peek())
    cio.spm.addr.expect(vio.spm.addr.peek())
    cio.spm.wr.expect(vio.spm.wr.peek())

    cio.config.addr.expect(vio.config.addr.peek())
    cio.config.wrData.expect(vio.config.wrData.peek())
    cio.config.en.expect(vio.config.en.peek())
    cio.config.wr.expect(vio.config.wr.peek())
  }

  def genPacket(data: Array[Int]): Array[Long] = {
    val r = Array.ofDim[Long](data.length)
    r(0) = VALID_SOP | (data(0) & ((1L << 32)-1))
    for(i <- 1 until r.length-1) {
      r(i) = VALID | data(i)
    }
    r(data.length-1) = VALID_EOP | data.last
    r
  }

  /**
   * Generates a data packet bound the for the given address with the given payload data
   * @param addr
   * @param data
   * @return
   */
  def genDataPacket(addr: Int, data: Array[Int]): Array[Long] = {
    require(addr >= 0 && addr < math.pow(2, MEM_ADDR_WIDTH), s"Address must be between 0 and ${math.pow(2,MEM_ADDR_WIDTH).toInt}")
    genPacket(Array.concat(Array(addr << 16), data))
  }

  def genConfigPacket(addr: Int, data: Array[Int]): Array[Long] = {
    require(addr >= 0 && addr < math.pow(2, MEM_ADDR_WIDTH), s"Address must be between 0 and ${math.pow(2,MEM_ADDR_WIDTH).toInt}")
    val route = 1 << 30 | addr << 16
    genPacket(Array.concat(Array(route), data))
  }

  /**
   * Generates a config packet of a given length with random payload data and addr
   * @param length Either 1 or 2
   * @return
   */
  def genConfigPacket(length: Int): Array[Long] = {
    require(length == 1 || length == 2)
    val R = scala.util.Random
    val addr = R.nextInt(math.pow(2,MEM_ADDR_WIDTH).toInt)
    val data = Array.fill(length)(R.nextInt()).map(math.abs)
    genConfigPacket(addr, data)
  }

  def genIrqPacket(): Array[Long] = {
    val R = scala.util.Random
    val addr = 3 << 30 | R.nextInt(math.pow(2,MEM_ADDR_WIDTH).toInt) << 16
    val data = math.abs(R.nextInt())
    genPacket(Array(addr, data))

  }

  it should "forward a 1-word data packet" in {
    val data = Array(5)
    val packet = genDataPacket(42, data)
    test(new RxUnitWrapper).withAnnotations(Seq(WriteVcdAnnotation, VerilatorBackendAnnotation)) {dut =>
      for(p <- packet) {
        dut.io.in.pkt.poke(p)
        dut.clock.step()
        compareOutputs(dut)
      }
      dut.clock.step()
    }
  }

  it should "forward a 2-word data packet" in {
    val R = scala.util.Random
    val data = Array.fill(2)(R.nextInt()).map(math.abs)
    val packet = genDataPacket(R.nextInt(math.pow(2,MEM_ADDR_WIDTH).toInt), data)
    test(new RxUnitWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)) {dut =>
      for(p <- packet) {
        dut.io.in.pkt.poke(p)
        dut.clock.step()
        compareOutputs(dut)
      }
      dut.clock.step()
    }
  }

  it should "forward a 3-word data packet" in {
    val R = scala.util.Random
    val data = Array.fill(3)(R.nextInt()).map(math.abs)
    val packet = genDataPacket(R.nextInt(math.pow(2,MEM_ADDR_WIDTH).toInt), data)
    test(new RxUnitWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      for(p <- packet) {
        dut.io.in.pkt.poke(p)
        dut.clock.step()
        compareOutputs(dut)
      }
      dut.clock.step()
    }
  }

  it should "forward a 1-word config packet" in {
    val packet = genConfigPacket(1)
    test(new RxUnitWrapper).withAnnotations(Seq(WriteVcdAnnotation, VerilatorBackendAnnotation)) {dut =>
      for(p <- packet) {
        dut.io.in.pkt.poke(p)
        dut.clock.step()
        compareOutputs(dut)
      }
      dut.clock.step()
    }
  }

  it should "forward a 2-word config packet" in {
    val packet = genConfigPacket(2)
    test(new RxUnitWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      for(p <- packet) {
        dut.io.in.pkt.poke(p)
        dut.clock.step()
        compareOutputs(dut)
      }
      dut.clock.step()
    }
  }

  it should "forward an IRQ packet" in {
    val packet = genIrqPacket()
    test(new RxUnitWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)) {dut =>
      for(p <- packet) {
        dut.io.in.pkt.poke(p)
        dut.clock.step()
        compareOutputs(dut)
      }
      dut.clock.step()
    }
  }

}
