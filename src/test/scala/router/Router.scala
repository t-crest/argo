package router

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class SingleRouterPort0Test extends AnyFlatSpec with ChiselScalatestTester{
  "DUT" should "pass" in{
    test(new router){dut=>
      for(i <- 1 to 4){
        dut.io.inPort.port(i).data.poke("b11000111111111111111111111111111100".U)
        dut.clock.step(3)
        println("port0: ")
        dut.io.outPort.port(0).data.expect("h63fff3fff".U)

        dut.io.inPort.port(i).data.poke("b10000111111111111111111111111111100".U)
        dut.clock.step(3)
        println("port0:  ")
        dut.io.outPort.port(0).data.expect("h43ffffffc".U)

        dut.io.inPort.port(i).data.poke("b10000111111111111111111111111110000".U)
        dut.clock.step(3)
        println("port0:  ")
        dut.io.outPort.port(0).data.expect("h43ffffff0".U)

        dut.io.inPort.port(i).data.poke("b10000111111111111111111111111000000".U)
        dut.clock.step(3)
        println("port0:  ")
        dut.io.outPort.port(0).data.expect("h43fffffc0".U)

        dut.io.inPort.port(i).data.poke("b10000111111111111111111111100000000".U)
        dut.clock.step(3)
        println("port0:  ")
        dut.io.outPort.port(0).data.expect("h43fffff00".U)

        dut.io.inPort.port(i).data.poke("b10100111111111111111111110000000000".U)
        dut.clock.step(3)
        println("port0:  ")
        dut.io.outPort.port(0).data.expect("h53ffffc00".U)

        dut.io.inPort.port(i).data.poke("b00000000000000000000000000000000000".U)
        dut.clock.step(3)
        println("port0:  ")
        dut.io.outPort.port(0).data.expect("h000000000".U)
      }
      dut.io.inPort.port(0).data.poke("b11000111111111111111111111111111100".U)
      dut.clock.step(3)
      println("port4: ")
      dut.io.outPort.port(4).data.expect("h63fff3fff".U)

      dut.io.inPort.port(0).data.poke("b10000111111111111111111111111111100".U)
      dut.clock.step(3)
      println("port4: ")
      dut.io.outPort.port(4).data.expect("h43ffffffc".U)

      dut.io.inPort.port(0).data.poke("b10000111111111111111111111111110000".U)
      dut.clock.step(3)
      println("port4:  ")
      dut.io.outPort.port(4).data.expect("h43ffffff0".U)

      dut.io.inPort.port(0).data.poke("b10000111111111111111111111111000000".U)
      dut.clock.step(3)
      println("port4:  ")
      dut.io.outPort.port(4).data.expect("h43fffffc0".U)

      dut.io.inPort.port(0).data.poke("b10000111111111111111111111100000000".U)
      dut.clock.step(3)
      println("port4:  ")
      dut.io.outPort.port(4).data.expect("h43fffff00".U)

      dut.io.inPort.port(0).data.poke("b10100111111111111111111110000000000".U)
      dut.clock.step(3)
      println("port4:  ")
      dut.io.outPort.port(4).data.expect("h53ffffc00".U)

      dut.io.inPort.port(0).data.poke("b00000000000000000000000000000000000".U)
      dut.clock.step(3)
      println("port4:  ")
      dut.io.outPort.port(4).data.expect("h000000000".U)

      }
    }
}

class SingleRouterPort1Test extends AnyFlatSpec with ChiselScalatestTester{
  "DUT" should "pass" in{
    test(new router){dut=>
//      for(i <- 2 to 4){
//        dut.io.inPort.port(i).data.poke("b11000111111111111111111111111111101".U)
//        dut.clock.step(3)
//        println("port0: ")
//        dut.io.outPort.port(1).data.expect("h63fff3fff".U)
//
//        dut.io.inPort.port(i).data.poke("b10000111111111111111111111111111101".U)
//        dut.clock.step(3)
//        println("port0:  ")
//        dut.io.outPort.port(1).data.expect("h43ffffffd".U)
//
//        dut.io.inPort.port(i).data.poke("b10000111111111111111111111111110001".U)
//        dut.clock.step(3)
//        println("port0:  ")
//        dut.io.outPort.port(1).data.expect("h43ffffff1".U)
//
//        dut.io.inPort.port(i).data.poke("b10000111111111111111111111111000001".U)
//        dut.clock.step(3)
//        println("port0:  ")
//        dut.io.outPort.port(1).data.expect("h43fffffc1".U)
//
//        dut.io.inPort.port(i).data.poke("b10000111111111111111111111100000001".U)
//        dut.clock.step(3)
//        println("port0:  ")
//        dut.io.outPort.port(1).data.expect("h43fffff01".U)
//
//        dut.io.inPort.port(i).data.poke("b10100111111111111111111110000000001".U)
//        dut.clock.step(3)
//        println("port0:  ")
//        dut.io.outPort.port(1).data.expect("h53ffffc01".U)
//
//        dut.io.inPort.port(i).data.poke("b00000000000000000000000000000000000".U)
//        dut.clock.step(3)
//        println("port0:  ")
//        dut.io.outPort.port(1).data.expect("h000000000".U)
//      }
      dut.io.inPort.port(1).data.poke("b11000111111111111111111111111111101".U)
      dut.clock.step(3)
      println("port4: ")
      dut.io.outPort.port(4).data.expect("h63fff3fff".U)

      dut.io.inPort.port(1).data.poke("b10000111111111111111111111111111101".U)
      dut.clock.step(3)
      println("port4: ")
      dut.io.outPort.port(4).data.expect("h43ffffffd".U)

      dut.io.inPort.port(1).data.poke("b10000111111111111111111111111110001".U(35.W))
      dut.clock.step(3)
      println("port4:  ")
      dut.io.outPort.port(4).data.expect("h43ffffff1".U)

      dut.io.inPort.port(1).data.poke("b10000111111111111111111111111000001".U(35.W))
      dut.clock.step(3)
      println("port4:  ")
      dut.io.outPort.port(4).data.expect("h43fffffc1".U)

      dut.io.inPort.port(1).data.poke("b10000111111111111111111111100000001".U(35.W))
      dut.clock.step(3)
      println("port4:  ")
      dut.io.outPort.port(4).data.expect("h43fffff01".U)

      dut.io.inPort.port(1).data.poke("b10100111111111111111111110000000001".U(35.W))
      dut.clock.step(3)
      println("port4:  ")
      dut.io.outPort.port(4).data.expect("h53ffffc01".U)

      dut.io.inPort.port(1).data.poke("b00000000000000000000000000000000000".U)
      dut.clock.step(3)
      println("port4:  ")
      dut.io.outPort.port(4).data.expect("h000000000".U)

    }
  }
}


class SingleRouterPort2Test extends AnyFlatSpec with ChiselScalatestTester{
  "DUT" should "pass" in{
    test(new router){dut=>
      //      for(i <- 2 to 4){
      //        dut.io.inPort.port(i).data.poke("b11000111111111111111111111111111101".U)
      //        dut.clock.step(3)
      //        println("port0: ")
      //        dut.io.outPort.port(1).data.expect("h63fff3fff".U)
      //
      //        dut.io.inPort.port(i).data.poke("b10000111111111111111111111111111101".U)
      //        dut.clock.step(3)
      //        println("port0:  ")
      //        dut.io.outPort.port(1).data.expect("h43ffffffd".U)
      //
      //        dut.io.inPort.port(i).data.poke("b10000111111111111111111111111110001".U)
      //        dut.clock.step(3)
      //        println("port0:  ")
      //        dut.io.outPort.port(1).data.expect("h43ffffff1".U)
      //
      //        dut.io.inPort.port(i).data.poke("b10000111111111111111111111111000001".U)
      //        dut.clock.step(3)
      //        println("port0:  ")
      //        dut.io.outPort.port(1).data.expect("h43fffffc1".U)
      //
      //        dut.io.inPort.port(i).data.poke("b10000111111111111111111111100000001".U)
      //        dut.clock.step(3)
      //        println("port0:  ")
      //        dut.io.outPort.port(1).data.expect("h43fffff01".U)
      //
      //        dut.io.inPort.port(i).data.poke("b10100111111111111111111110000000001".U)
      //        dut.clock.step(3)
      //        println("port0:  ")
      //        dut.io.outPort.port(1).data.expect("h53ffffc01".U)
      //
      //        dut.io.inPort.port(i).data.poke("b00000000000000000000000000000000000".U)
      //        dut.clock.step(3)
      //        println("port0:  ")
      //        dut.io.outPort.port(1).data.expect("h000000000".U)
      //      }
      dut.io.inPort.port(2).data.poke("b11000111111111111111111111111111110".U)
      dut.clock.step(3)
      println("port4: ")
      dut.io.outPort.port(4).data.expect("h63fff3fff".U)

      dut.io.inPort.port(2).data.poke("b10000111111111111111111111111111110".U)
      dut.clock.step(3)
      println("port4: ")
      dut.io.outPort.port(4).data.expect("h43ffffffe".U)

      dut.io.inPort.port(2).data.poke("b10000111111111111111111111111111110".U)
      dut.clock.step(3)
      println("port4: ")
      dut.io.outPort.port(4).data.expect("h43ffffffe".U)

      dut.io.inPort.port(2).data.poke("b10000111111111111111111111111111110".U)
      dut.clock.step(3)
      println("port4: ")
      dut.io.outPort.port(4).data.expect("h43ffffffe".U)

      dut.io.inPort.port(2).data.poke("b10000111111111111111111111111111110".U)
      dut.clock.step(3)
      println("port4: ")
      dut.io.outPort.port(4).data.expect("h43ffffffe".U)

//      dut.io.inPort.port(2).data.poke("b10011111111111111111111111111110010".U(35.W))
//      dut.clock.step(3)
//      println("port4:  ")
//      dut.io.outPort.port(4).data.expect("h43ffffff2".U)
//
//      dut.io.inPort.port(2).data.poke("b10000111111111111111111111111000010".U(35.W))
//      dut.clock.step(3)
//      println("port4:  ")
//      dut.io.outPort.port(4).data.expect("h43fffffc2".U)
//
//      dut.io.inPort.port(2).data.poke("b10000111111111111111111111100000010".U(35.W))
//      dut.clock.step(3)
//      println("port4:  ")
//      dut.io.outPort.port(4).data.expect("h43fffff02".U)

      dut.io.inPort.port(2).data.poke("b10100111111111111111111110000000010".U(35.W))
      dut.clock.step(3)
      println("port4:  ")
      dut.io.outPort.port(4).data.expect("h53ffffc02".U)

      dut.io.inPort.port(2).data.poke("b00000000000000000000000000000000000".U)
      dut.clock.step(3)
      println("port4:  ")
      dut.io.outPort.port(4).data.expect("h000000000".U)

    }
  }
}

class SingleRouterPort3Test extends AnyFlatSpec with ChiselScalatestTester{
  "DUT" should "pass" in{
    test(new router){dut=>
      //      for(i <- 2 to 4){
      //        dut.io.inPort.port(i).data.poke("b11000111111111111111111111111111101".U)
      //        dut.clock.step(3)
      //        println("port0: ")
      //        dut.io.outPort.port(1).data.expect("h63fff3fff".U)
      //
      //        dut.io.inPort.port(i).data.poke("b10000111111111111111111111111111101".U)
      //        dut.clock.step(3)
      //        println("port0:  ")
      //        dut.io.outPort.port(1).data.expect("h43ffffffd".U)
      //
      //        dut.io.inPort.port(i).data.poke("b10000111111111111111111111111110001".U)
      //        dut.clock.step(3)
      //        println("port0:  ")
      //        dut.io.outPort.port(1).data.expect("h43ffffff1".U)
      //
      //        dut.io.inPort.port(i).data.poke("b10000111111111111111111111111000001".U)
      //        dut.clock.step(3)
      //        println("port0:  ")
      //        dut.io.outPort.port(1).data.expect("h43fffffc1".U)
      //
      //        dut.io.inPort.port(i).data.poke("b10000111111111111111111111100000001".U)
      //        dut.clock.step(3)
      //        println("port0:  ")
      //        dut.io.outPort.port(1).data.expect("h43fffff01".U)
      //
      //        dut.io.inPort.port(i).data.poke("b10100111111111111111111110000000001".U)
      //        dut.clock.step(3)
      //        println("port0:  ")
      //        dut.io.outPort.port(1).data.expect("h53ffffc01".U)
      //
      //        dut.io.inPort.port(i).data.poke("b00000000000000000000000000000000000".U)
      //        dut.clock.step(3)
      //        println("port0:  ")
      //        dut.io.outPort.port(1).data.expect("h000000000".U)
      //      }
      dut.io.inPort.port(3).data.poke("b11000111111111111111111111111111111".U)
      dut.clock.step(3)
      println("port4: ")
      dut.io.outPort.port(4).data.expect("h63fff3fff".U)

      dut.io.inPort.port(3).data.poke("b10000111111111111111111111111111111".U)
      dut.clock.step(3)
      println("port4: ")
      dut.io.outPort.port(4).data.expect("h43fffffff".U)

      dut.io.inPort.port(3).data.poke("b10000111111111111111111111111110011".U(35.W))
      dut.clock.step(3)
      println("port4:  ")
      dut.io.outPort.port(4).data.expect("h43ffffff3".U)

      dut.io.inPort.port(3).data.poke("b10000111111111111111111111111000011".U(35.W))
      dut.clock.step(3)
      println("port4:  ")
      dut.io.outPort.port(4).data.expect("h43fffffc3".U)

      dut.io.inPort.port(3).data.poke("b10000111111111111111111111100000011".U(35.W))
      dut.clock.step(3)
      println("port4:  ")
      dut.io.outPort.port(4).data.expect("h43fffff03".U)

      dut.io.inPort.port(3).data.poke("b10100111111111111111111110000000011".U(35.W))
      dut.clock.step(3)
      println("port4:  ")
      dut.io.outPort.port(4).data.expect("h53ffffc03".U)

      dut.io.inPort.port(3).data.poke("b00000000000000000000000000000000000".U)
      dut.clock.step(3)
      println("port4:  ")
      dut.io.outPort.port(4).data.expect("h000000000".U)

    }
  }
}

class SingleRouterPort4Test extends AnyFlatSpec with ChiselScalatestTester{
  "DUT" should "pass" in{
    test(new router){dut=>
//from 4 to 0
      dut.io.inPort.port(4).data.poke("b11000111111111111111111111111111100".U)
      dut.clock.step(3)
      println("port0: ")
      dut.io.outPort.port(0).data.expect("h63fff3fff".U)

      dut.io.inPort.port(4).data.poke("b10000111111111111111111111111111100".U)
      dut.clock.step(3)
      println("port0: ")
      dut.io.outPort.port(0).data.expect("h43ffffffc".U)

      dut.io.inPort.port(4).data.poke("b10000111111111111111111111111110000".U(35.W))
      dut.clock.step(3)
      println("port0:  ")
      dut.io.outPort.port(0).data.expect("h43ffffff0".U)

      dut.io.inPort.port(4).data.poke("b10000111111111111111111111111000000".U(35.W))
      dut.clock.step(3)
      println("port0:  ")
      dut.io.outPort.port(0).data.expect("h43fffffc0".U)

      dut.io.inPort.port(4).data.poke("b10000111111111111111111111100000000".U(35.W))
      dut.clock.step(3)
      println("port0:  ")
      dut.io.outPort.port(0).data.expect("h43fffff00".U)

      dut.io.inPort.port(4).data.poke("b10100111111111111111111110000000000".U(35.W))
      dut.clock.step(3)
      println("port0:  ")
      dut.io.outPort.port(0).data.expect("h53ffffc00".U)

      dut.io.inPort.port(4).data.poke("b00000000000000000000000000000000000".U)
      dut.clock.step(3)
      println("port0:  ")
      dut.io.outPort.port(0).data.expect("h000000000".U)

//    from 4 to 1
      dut.io.inPort.port(4).data.poke("b11000111111111111111111111111111101".U)
      dut.clock.step(3)
      println("port1: ")
      dut.io.outPort.port(1).data.expect("h63fff3fff".U)

      dut.io.inPort.port(4).data.poke("b10000111111111111111111111111111101".U)
      dut.clock.step(3)
      println("port1: ")
      dut.io.outPort.port(1).data.expect("h43ffffffd".U)

      dut.io.inPort.port(4).data.poke("b10000111111111111111111111111110001".U(35.W))
      dut.clock.step(3)
      println("port1:  ")
      dut.io.outPort.port(1).data.expect("h43ffffff1".U)

      dut.io.inPort.port(4).data.poke("b10000111111111111111111111111000001".U(35.W))
      dut.clock.step(3)
      println("port1:  ")
      dut.io.outPort.port(1).data.expect("h43fffffc1".U)

      dut.io.inPort.port(4).data.poke("b10000111111111111111111111100000001".U(35.W))
      dut.clock.step(3)
      println("port1:  ")
      dut.io.outPort.port(1).data.expect("h43fffff01".U)

      dut.io.inPort.port(4).data.poke("b10100111111111111111111110000000001".U(35.W))
      dut.clock.step(3)
      println("port1:  ")
      dut.io.outPort.port(1).data.expect("h53ffffc01".U)

      dut.io.inPort.port(4).data.poke("b00000000000000000000000000000000000".U)
      dut.clock.step(3)
      println("port1:  ")
      dut.io.outPort.port(1).data.expect("h000000000".U)

    }
  }
}