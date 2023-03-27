package argo

import chisel3._
import chiseltest._
import chiselverify.crv.backends.jacop.{Model, RandObj, RandVar, rand}
import org.scalatest.flatspec.AnyFlatSpec
import argo.ArgoTypes.{HEADER_FIELD_WIDTH, HEADER_ROUTE_WIDTH}
import blackbox.RouterWrapper
import chiseltest.internal.CachingAnnotation

class RouterSpec extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "Argo router"

  val ROUTE_S = 0
  val ROUTE_E = 1
  val ROUTE_N = 2
  val ROUTE_W = 3

  val VALID_SOP = 0x6L << 32L
  val VALID     = 0x4L << 32L
  val VALID_EOP = 0x5L << 32L

  class ArgoPacket extends RandObj {
    currentModel = new Model()

    val len: RandVar = rand(1, 5)
    val route: RandVar = rand(0, 3)
    val remRoute: RandVar = rand(0, (1 << (HEADER_ROUTE_WIDTH-2)) - 1)
    val memAddr: RandVar = rand(0, (1 << HEADER_FIELD_WIDTH) - 1)

    def toPackets: Seq[Long] = {
      val pkts = Array.ofDim[Long](1 + len.value())
      //Header
      pkts(0) = VALID_SOP | memAddr.value().toLong << HEADER_ROUTE_WIDTH | remRoute.value() << 2 | route.value()
      //Intermediate data packets
      for(i <- 1 until len.value()) {
        pkts(i) = VALID | scala.util.Random.nextInt().abs
      }
      pkts(len.value()) = VALID_EOP | scala.util.Random.nextInt().abs
      pkts.toSeq
    }
  }

  def compareOutputs(dut: RouterWrapper): Unit = {
    val c = dut.io.chisel
    val v = dut.io.verilog

    for(i <- 0 until 5) {
      c.port(i).data.expect(v.port(i).data.peek())
    }
  }

  def compareStep(dut: RouterWrapper): Unit = {
    compareOutputs(dut)
    dut.clock.step()
  }

  /*
Test outline:
Generate a packet. A packet consists of header packet with SOP,
data with VLD and end with EOP
Router parses header packet, then forwards remaining packets in that stream to same destination

For each input port, test that it forwards correctly to all output ports with differing lengths
 */

  /**
   * Poke a single packet onto the DUT
   * @param pkts
   * @param dut
   */
  def pokePacket(pkts: Seq[Long], dut: RouterWrapper, p: Int): Unit = {
    for (d <- pkts) {
      dut.io.in.port(p).req.poke(true.B)
      dut.io.in.port(p).data.poke(d)
      dut.clock.step()
    }
  }

  for(p <- 0 to 4) {
    it should s"forward packets on port $p" in {
      test(new RouterWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, CachingAnnotation)) { dut =>
        //Generate and randomize
        val aps = Seq.fill(50)(new ArgoPacket())
//        if (!aps.forall(_.randomize)) {
//          throw new AssertionError("Unable to randomize argo packet")
//        }
        fork {
          //Poke each packet, then delay +3 to allow for final results to show up on outputs
          for (ap <- aps) {
            if (!ap.randomize) {
              throw new AssertionError("Unable to randomize packet")
            }
            pokePacket(ap.toPackets, dut, p)
          }
          dut.clock.step(3)
        } .fork {
          //Step through and compare for each packet input, and then for +3 to allow for final data to propagate
          for(ap <- aps) {
            for(_ <- 0 to ap.len.value()) {
              compareStep(dut)
            }
          }
          for(_ <- 0 until 3) {
            compareStep(dut)
          }
        }.joinAndStep(dut.clock)
      }
    }
  }
//  it should "forward packets on port 0" in {
//    test(new RouterWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, CachingAnnotation, WriteVcdAnnotation)) { dut =>
//      //Generate and randomize
//      val aps = Seq.fill(3)(new ArgoPacket())
//      if (!aps.forall(_.randomize)) {
//        throw new AssertionError("Unable to randomize argo packet")
//      }
//      fork {
//        //Poke each packet, then delay +3 to allow for final results to show up on outputs
//        for (ap <- aps) {
//          pokePacket(ap.toPackets, dut, 0)
//        }
//        dut.clock.step(3)
//      } .fork {
//        //Step through and compare for each packet input, and then for +3 to allow for final data to propagate
//        for(ap <- aps) {
//          for(_ <- 0 to ap.len.value()) {
//            compareStep(dut)
//          }
//        }
//        for(_ <- 0 until 3) {
//          compareStep(dut)
//        }
//      }.joinAndStep(dut.clock)
//    }
//  }
}

class SingleRouterPort0Test extends AnyFlatSpec with ChiselScalatestTester{
  "DUT" should "pass" in{
    test(new Router) {dut=>
      for(i <- 0 to 4){
        if(i === 0){
          //Incoming packet from port 0 (south) directed to port 4 (home).
          //This is indicated by the direction (2 LSB) also being 0 (south)
          //Packet headers: 110(SOP), 100(VLD), 100(VLD), 100(VLD), 101(EOP), 000(invalid)
          dut.io.inPort.port(i).req.poke(true.B)
          dut.io.inPort.port(i).data.poke("b110_0011_1111_1111_1111_1111_1111_1111_1100".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b100_0011_1111_1111_1111_1111_1111_1111_1100".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10001111111111111111111111111110000".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10011111111111111111111111111000000".U)
          println("port4: ")
          dut.io.outPort.port(4).data.expect("h63fff3fff".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10100111111111111111111110000000000".U)
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h43ffffffc".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b00000000000000000000000000000000000".U)
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h47ffffff0".U)
          dut.clock.step()
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h4ffffffc0".U)
          dut.clock.step()
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h53ffffc00".U)
          dut.clock.step()
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h000000000".U)
          dut.clock.step()
        }else {
          dut.io.inPort.port(i).data.poke("b11000111111111111111111111111111100".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10000111111111111111111111111111100".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10001111111111111111111111111110000".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10011111111111111111111111111000000".U)
          println("port0: ")
          dut.io.outPort.port(0).data.expect("h63fff3fff".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10100111111111111111111110000000000".U)
          println("port0:  ")
          dut.io.outPort.port(0).data.expect("h43ffffffc".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b00000000000000000000000000000000000".U)
          println("port0:  ")
          dut.io.outPort.port(0).data.expect("h47ffffff0".U)
          dut.clock.step()
          println("port0:  ")
          dut.io.outPort.port(0).data.expect("h4ffffffc0".U)
          dut.clock.step()
          println("port0:  ")
          dut.io.outPort.port(0).data.expect("h53ffffc00".U)
          dut.clock.step()
          println("port0:  ")
          dut.io.outPort.port(0).data.expect("h000000000".U)
          dut.clock.step()
        }
      }
    }
  }
}


class SingleRouterPort1Test extends AnyFlatSpec with ChiselScalatestTester{
  "DUT" should "pass" in{
    test(new Router){dut=>
      for(i <- 0 to 4){
        if(i ===1){
          dut.io.inPort.port(i).data.poke("b11000111111111111111111111111111101".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10000111111111111111111111111111101".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10001111111111111111111111111110001".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10011111111111111111111111111000001".U)
          println("port4: ")
          dut.io.outPort.port(4).data.expect("h63fff3fff".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10100111111111111111111110000000001".U)
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h43ffffffd".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b00000000000000000000000000000000000".U)
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h47ffffff1".U)
          dut.clock.step()
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h4ffffffc1".U)
          dut.clock.step()
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h53ffffc01".U)
          dut.clock.step()
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h000000000".U)
          dut.clock.step()
        }else {
          dut.io.inPort.port(i).data.poke("b11000111111111111111111111111111101".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10000111111111111111111111111111101".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10001111111111111111111111111110001".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10011111111111111111111111111000001".U)
          println("port0: ")
          dut.io.outPort.port(1).data.expect("h63fff3fff".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10100111111111111111111110000000001".U)
          println("port0:  ")
          dut.io.outPort.port(1).data.expect("h43ffffffd".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b00000000000000000000000000000000000".U)
          println("port0:  ")
          dut.io.outPort.port(1).data.expect("h47ffffff1".U)
          dut.clock.step()
          println("port0:  ")
          dut.io.outPort.port(1).data.expect("h4ffffffc1".U)
          dut.clock.step()
          println("port0:  ")
          dut.io.outPort.port(1).data.expect("h53ffffc01".U)
          dut.clock.step()
          println("port0:  ")
          dut.io.outPort.port(1).data.expect("h000000000".U)
          dut.clock.step()
        }
      }
    }
  }
}


class SingleRouterPort2Test extends AnyFlatSpec with ChiselScalatestTester{
  "DUT" should "pass" in{
    test(new Router) {dut=>
      for(i <- 0 to 4){
        if(i ===2){
          dut.io.inPort.port(i).data.poke("b11000111111111111111111111111111110".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10000111111111111111111111111111110".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10001111111111111111111111111110010".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10011111111111111111111111111000010".U)
          println("port4: ")
          dut.io.outPort.port(4).data.expect("h63fff3fff".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10100111111111111111111110000000010".U)
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h43ffffffe".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b00000000000000000000000000000000000".U)
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h47ffffff2".U)
          dut.clock.step()
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h4ffffffc2".U)
          dut.clock.step()
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h53ffffc02".U)
          dut.clock.step()
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h000000000".U)
          dut.clock.step()
        }else {
          dut.io.inPort.port(i).data.poke("b11000111111111111111111111111111110".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10000111111111111111111111111111110".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10001111111111111111111111111110010".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10011111111111111111111111111000010".U)
          println("port0: ")
          dut.io.outPort.port(2).data.expect("h63fff3fff".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10100111111111111111111110000000010".U)
          println("port0:  ")
          dut.io.outPort.port(2).data.expect("h43ffffffe".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b00000000000000000000000000000000000".U)
          println("port0:  ")
          dut.io.outPort.port(2).data.expect("h47ffffff2".U)
          dut.clock.step()
          println("port0:  ")
          dut.io.outPort.port(2).data.expect("h4ffffffc2".U)
          dut.clock.step()
          println("port0:  ")
          dut.io.outPort.port(2).data.expect("h53ffffc02".U)
          dut.clock.step()
          println("port0:  ")
          dut.io.outPort.port(2).data.expect("h000000000".U)
          dut.clock.step()
        }
      }
    }
  }
}


class SingleRouterPort3Test extends AnyFlatSpec with ChiselScalatestTester{
  "DUT" should "pass" in{
    test(new Router) {dut=>
      for(i <- 0 to 4){
        if(i ===3){
          dut.io.inPort.port(i).data.poke("b11000111111111111111111111111111111".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10000111111111111111111111111111111".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10001111111111111111111111111110011".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10011111111111111111111111111000011".U)
          println("port4: ")
          dut.io.outPort.port(4).data.expect("h63fff3fff".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10100111111111111111111110000000011".U)
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h43fffffff".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b00000000000000000000000000000000000".U)
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h47ffffff3".U)
          dut.clock.step()
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h4ffffffc3".U)
          dut.clock.step()
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h53ffffc03".U)
          dut.clock.step()
          println("port4:  ")
          dut.io.outPort.port(4).data.expect("h000000000".U)
          dut.clock.step()
        }else {
          dut.io.inPort.port(i).data.poke("b11000111111111111111111111111111111".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10000111111111111111111111111111111".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10001111111111111111111111111110011".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10011111111111111111111111111000011".U)
          println("port0: ")
          dut.io.outPort.port(3).data.expect("h63fff3fff".U)
          dut.clock.step()
          dut.io.inPort.port(i).data.poke("b10100111111111111111111110000000011".U)
          println("port0:  ")
          dut.io.outPort.port(3).data.expect("h43fffffff".U)
          dut.clock.step()
          println("port0:  ")
          dut.io.inPort.port(i).data.poke("b00000000000000000000000000000000000".U)
          dut.io.outPort.port(3).data.expect("h47ffffff3".U)
          dut.clock.step()
          println("port0:  ")
          dut.io.outPort.port(3).data.expect("h4ffffffc3".U)
          dut.clock.step()
          println("port0:  ")
          dut.io.outPort.port(3).data.expect("h53ffffc03".U)
          dut.clock.step()
          println("port0:  ")
          dut.io.outPort.port(3).data.expect("h000000000".U)
          dut.clock.step()
        }
      }
    }
  }
}

class SingleRouterPort4Test extends AnyFlatSpec with ChiselScalatestTester{
  "DUT" should "pass" in{
    test(new Router){dut=>
//from 4 to 0
      dut.io.inPort.port(4).data.poke("b11000111111111111111111111111111100".U)
      dut.clock.step()
      dut.io.inPort.port(4).data.poke("b10000111111111111111111111111111100".U)
      dut.clock.step()
      dut.io.inPort.port(4).data.poke("b10001111111111111111111111111110000".U)
      dut.clock.step()
      dut.io.inPort.port(4).data.poke("b10011111111111111111111111111000000".U)
      println("port0: ")
      dut.io.outPort.port(0).data.expect("h63fff3fff".U)
      dut.clock.step()
      dut.io.inPort.port(4).data.poke("b10100111111111111111111110000000000".U)
      println("port0:  ")
      dut.io.outPort.port(0).data.expect("h43ffffffc".U)
      dut.clock.step()
      dut.io.inPort.port(4).data.poke("b00000000000000000000000000000000000".U)
      println("port0:  ")
      dut.io.outPort.port(0).data.expect("h47ffffff0".U)
      dut.clock.step()
      println("port0:  ")
      dut.io.outPort.port(0).data.expect("h4ffffffc0".U)
      dut.clock.step()
      println("port0:  ")
      dut.io.outPort.port(0).data.expect("h53ffffc00".U)
      dut.clock.step()
      println("port0:  ")
      dut.io.outPort.port(0).data.expect("h000000000".U)
      dut.clock.step()
//from 4 to 1
      dut.io.inPort.port(4).data.poke("b11000111111111111111111111111111101".U)
      dut.clock.step()
      dut.io.inPort.port(4).data.poke("b10000111111111111111111111111111101".U)
      dut.clock.step()
      dut.io.inPort.port(4).data.poke("b10001111111111111111111111111110001".U)
      dut.clock.step()
      dut.io.inPort.port(4).data.poke("b10011111111111111111111111111000001".U)
      println("port0: ")
      dut.io.outPort.port(1).data.expect("h63fff3fff".U)
      dut.clock.step()
      dut.io.inPort.port(4).data.poke("b10100111111111111111111110000000001".U)
      println("port0:  ")
      dut.io.outPort.port(1).data.expect("h43ffffffd".U)
      dut.clock.step()
      dut.io.inPort.port(4).data.poke("b00000000000000000000000000000000000".U)
      println("port0:  ")
      dut.io.outPort.port(1).data.expect("h47ffffff1".U)
      dut.clock.step()
      println("port0:  ")
      dut.io.outPort.port(1).data.expect("h4ffffffc1".U)
      dut.clock.step()
      println("port0:  ")
      dut.io.outPort.port(1).data.expect("h53ffffc01".U)
      dut.clock.step()
      println("port0:  ")
      dut.io.outPort.port(1).data.expect("h000000000".U)
      dut.clock.step()
//from 4 to 2
      dut.io.inPort.port(4).data.poke("b11000111111111111111111111111111110".U)
      dut.clock.step()
      dut.io.inPort.port(4).data.poke("b10000111111111111111111111111111110".U)
      dut.clock.step()
      dut.io.inPort.port(4).data.poke("b10001111111111111111111111111110010".U)
      dut.clock.step()
      dut.io.inPort.port(4).data.poke("b10011111111111111111111111111000010".U)
      println("port0: ")
      dut.io.outPort.port(2).data.expect("h63fff3fff".U)
      dut.clock.step()
      dut.io.inPort.port(4).data.poke("b10100111111111111111111110000000010".U)
      println("port0:  ")
      dut.io.outPort.port(2).data.expect("h43ffffffe".U)
      dut.clock.step()
      dut.io.inPort.port(4).data.poke("b00000000000000000000000000000000000".U)
      println("port0:  ")
      dut.io.outPort.port(2).data.expect("h47ffffff2".U)
      dut.clock.step()
      println("port0:  ")
      dut.io.outPort.port(2).data.expect("h4ffffffc2".U)
      dut.clock.step()
      println("port0:  ")
      dut.io.outPort.port(2).data.expect("h53ffffc02".U)
      dut.clock.step()
      println("port0:  ")
      dut.io.outPort.port(2).data.expect("h000000000".U)
      dut.clock.step()
//from 4 to 3
      dut.io.inPort.port(4).data.poke("b11000111111111111111111111111111111".U)
      dut.clock.step()
      dut.io.inPort.port(4).data.poke("b10000111111111111111111111111111111".U)
      dut.clock.step()
      dut.io.inPort.port(4).data.poke("b10001111111111111111111111111110011".U)
      dut.clock.step()
      dut.io.inPort.port(4).data.poke("b10011111111111111111111111111000011".U)
      println("port0: ")
      dut.io.outPort.port(3).data.expect("h63fff3fff".U)
      dut.clock.step()
      dut.io.inPort.port(4).data.poke("b10100111111111111111111110000000011".U)
      println("port0:  ")
      dut.io.outPort.port(3).data.expect("h43fffffff".U)
      dut.clock.step()
      println("port0:  ")
      dut.io.inPort.port(4).data.poke("b00000000000000000000000000000000000".U)
      dut.io.outPort.port(3).data.expect("h47ffffff3".U)
      dut.clock.step()
      println("port0:  ")
      dut.io.outPort.port(3).data.expect("h4ffffffc3".U)
      dut.clock.step()
      println("port0:  ")
      dut.io.outPort.port(3).data.expect("h53ffffc03".U)
      dut.clock.step()
      println("port0:  ")
      dut.io.outPort.port(3).data.expect("h000000000".U)
      dut.clock.step()
    }
  }
}