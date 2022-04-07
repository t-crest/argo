package argo

import ArgoTypes._
import blackbox.IrqFifoWrapper
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class IrqFifoSpec extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "IRQ Fifo"

  def compareOutputs(dut: IrqFifoWrapper): Unit = {
    val cio = dut.io.chisel
    val vio = dut.io.verilog

    cio.irq.irqSig.expect(vio.irq.irqSig.peek())
    cio.irq.dataSig.expect(vio.irq.dataSig.peek())

    cio.config.error.expect(vio.config.error.peek())
    cio.config.rdData.expect(vio.config.rdData.peek())
  }

  it should "accept a data packet" in {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      dut.io.in.irq.data.poke(5L)
      dut.io.in.irq.dataValid.poke(true.B)
      dut.io.in.irq.irqValid.poke(false.B)
      dut.clock.step(2)
      compareOutputs(dut)
      dut.io.chisel.irq.dataSig.expect(true.B)
    }
  }

  it should "accept an irq packet" in {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      dut.io.in.irq.data.poke(5L)
      dut.io.in.irq.dataValid.poke(false.B)
      dut.io.in.irq.irqValid.poke(true.B)
      dut.clock.step(2)
      compareOutputs(dut)
      dut.io.chisel.irq.irqSig.expect(true.B)
    }
  }

  it should "read back irq data" in {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) { dut =>
      val R = scala.util.Random
      val data = Array.fill(2)(R.nextInt(math.pow(2, IRQ_DATA_WIDTH).toInt))
      //Write in two words of data, then attempt to read them back
      dut.io.in.irq.dataValid.poke(false.B)

      dut.io.in.irq.data.poke(data(0))
      dut.io.in.irq.irqValid.poke(true.B)
      dut.clock.step()

      dut.io.in.irq.data.poke(data(1))
      dut.clock.step()
      compareOutputs(dut)

      dut.io.in.irq.irqValid.poke(false.B)
      //Should do nothing at this point
      for (_ <- 0 until 3) {
        dut.clock.step()
        compareOutputs(dut)
      }

      //Attempt to read it back
      dut.io.in.sel.poke(true.B)
      dut.io.in.config.en.poke(true.B)
      dut.io.in.config.wr.poke(false.B)
      dut.io.in.config.addr.poke(0.U)

      //Data should be the first value we poked
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.config.rdData.expect(data(0))

      //Data should be the second value we poked
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.config.rdData.expect(data(1))

      //When no data is available, the read value should be 0
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.config.rdData.expect(0.U)
    }
  }


  it should "read back data written" in {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      val R = scala.util.Random
      val data = Array.fill(2)(R.nextInt(math.pow(2,IRQ_DATA_WIDTH).toInt))
      //Write in two words of data, then attempt to read them back
      dut.io.in.irq.irqValid.poke(false.B)

      dut.io.in.irq.data.poke(data(0))
      dut.io.in.irq.dataValid.poke(true.B)
      dut.clock.step()

      dut.io.in.irq.data.poke(data(1))
      dut.io.in.irq.dataValid.poke(true.B)
      dut.clock.step()
      compareOutputs(dut)

      dut.io.in.irq.dataValid.poke(false.B)
      //Should do nothing at this point
      for(i <- 0 until 3) {
        dut.clock.step()
        compareOutputs(dut)
      }

      //Attempt to read it back
      dut.io.in.sel.poke(true.B)
      dut.io.in.config.en.poke(true.B)
      dut.io.in.config.wr.poke(false.B)
      dut.io.in.config.addr.poke(1.U)

      //Data should be the first value we poked
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.config.rdData.expect(data(0))

      //Data should be the second value we poked
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.config.rdData.expect(data(1))

      //When no data is available, the read value should be 0
      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.config.rdData.expect(0.U)
    }
  }

  it should "generate an error when writing on config" in {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      dut.io.in.config.en.poke(true.B)
      dut.io.in.config.wr.poke(true.B)
      dut.io.in.sel.poke(true.B)

      dut.clock.step()
      compareOutputs(dut)
      dut.io.chisel.config.error.expect(true.B)
    }
  }

  it should "generate an error when reading an address larger than 1" in {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)) {dut =>
      dut.io.in.config.en.poke(true.B)
      dut.io.in.config.wr.poke(false.B)
      dut.io.in.sel.poke(true.B)
      dut.io.in.config.addr.poke(2.U)

      dut.clock.step()
      dut.io.chisel.config.error.expect(true.B)
      dut.clock.step()
    }
  }

  it should "fill the data queue crossing back to the start" in {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)) {dut =>
      val R = scala.util.Random
      //First data to write in and fetch back out
      val data1 = Array.fill(math.pow(2,IRQ_FIFO_IDX_WIDTH-1).toInt)(R.nextInt(math.pow(2,IRQ_DATA_WIDTH).toInt))
      //Next data to write in, should cause pointers to reset
      val data2 = Array.fill(5)(R.nextInt(math.pow(2,IRQ_DATA_WIDTH).toInt))

      dut.io.in.irq.irqValid.poke(false.B)

      //Poke in data words
      timescope {
        for(d <- data1) {
          dut.io.in.irq.dataValid.poke(true.B)
          dut.io.in.irq.data.poke(d)
          dut.clock.step()
        }
      }
      dut.clock.step()
      //Read them back
      timescope {
        dut.io.in.config.en.poke(true.B)
        dut.io.in.sel.poke(true.B)
        dut.io.in.config.addr.poke(1.U)
        dut.clock.step()
        for(_ <- data1) {
          compareOutputs(dut)
          dut.clock.step()
        }
      }

      //Write more data
      timescope {
        for(d <- data2) {
          dut.io.in.irq.dataValid.poke(true.B)
          dut.io.in.irq.data.poke(d)
          dut.clock.step()
        }
      }

      //Read more data
      dut.clock.step()
      timescope {
        dut.io.in.config.en.poke(true.B)
        dut.io.in.sel.poke(true.B)
        dut.io.in.config.addr.poke(1.U)
        dut.clock.step()
        for(_ <- data2) {
          compareOutputs(dut)
          dut.clock.step()
        }
      }
    }
  }

  it should "fill the IRQ queue crossing back to the start" in {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      val R = scala.util.Random
      //First data to write in and fetch back out
      val data1 = Array.fill(math.pow(2,IRQ_FIFO_IDX_WIDTH-1).toInt)(R.nextInt(math.pow(2,IRQ_DATA_WIDTH).toInt))
      //Next data to write in, should cause pointers to reset
      val data2 = Array.fill(5)(R.nextInt(math.pow(2,IRQ_DATA_WIDTH).toInt))

      //Poke in data words
      timescope {
        for(d <- data1) {
          dut.io.in.irq.irqValid.poke(true.B)
          dut.io.in.irq.data.poke(d)
          dut.clock.step()
        }
      }
      dut.clock.step()
      //Read them back
      timescope {
        dut.io.in.config.en.poke(true.B)
        dut.io.in.sel.poke(true.B)
        dut.io.in.config.addr.poke(0.U)
        dut.clock.step()
        for(_ <- data1) {
          compareOutputs(dut)
          dut.clock.step()
        }
      }

      //Write more data
      timescope {
        for(d <- data2) {
          dut.io.in.irq.irqValid.poke(true.B)
          dut.io.in.irq.data.poke(d)
          dut.clock.step()
        }
      }

      //Read more data
      dut.clock.step()
      timescope {
        dut.io.in.config.en.poke(true.B)
        dut.io.in.sel.poke(true.B)
        dut.io.in.config.addr.poke(0.U)
        dut.clock.step()
        for(_ <- data2) {
          compareOutputs(dut)
          dut.clock.step()
        }
      }
    }
  }

  it should "read and write data at the same time" in {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      val R = scala.util.Random
      val data = Array.fill(8)(R.nextInt(math.pow(2, IRQ_DATA_WIDTH).toInt))

      //Poke in the first 4 values
      timescope {
        for(i <- 0 until 4) {
          dut.io.in.irq.dataValid.poke(true.B)
          dut.io.in.irq.data.poke(data(i))
          dut.clock.step()
        }
      }
      dut.clock.step()
      //Poke in the last 4 while reading out all values
      timescope {
        for(i <- 4 until 8) {
          dut.io.in.irq.dataValid.poke(true.B)
          dut.io.in.irq.data.poke(data(i))
          dut.io.in.config.en.poke(true.B)
          dut.io.in.config.addr.poke(1.U)
          dut.io.in.sel.poke(true.B)
          dut.clock.step()
          compareOutputs(dut)
          dut.io.chisel.irq.dataSig.expect(true.B)
        }
      }
      dut.clock.step()
      //Read out last 4
      for(i <- 0 until 4) {
        dut.io.in.config.en.poke(true.B)
        dut.io.in.config.addr.poke(1.U)
        dut.io.in.sel.poke(true.B)
        dut.clock.step()
        compareOutputs(dut)
      }
      dut.io.chisel.irq.dataSig.expect(false.B)
    }
  }

  it should "read and write irq at the same time" in {
    test(new IrqFifoWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      val R = scala.util.Random
      val data = Array.fill(8)(R.nextInt(math.pow(2, IRQ_DATA_WIDTH).toInt))

      //Poke in the first 4 values
      timescope {
        for(i <- 0 until 4) {
          dut.io.in.irq.irqValid.poke(true.B)
          dut.io.in.irq.data.poke(data(i))
          dut.clock.step()
        }
      }
      dut.clock.step()
      //Poke in the last 4 while reading out all values
      timescope {
        for(i <- 4 until 8) {
          dut.io.in.irq.irqValid.poke(true.B)
          dut.io.in.irq.data.poke(data(i))
          dut.io.in.config.en.poke(true.B)
          dut.io.in.config.addr.poke(0.U)
          dut.io.in.sel.poke(true.B)
          dut.clock.step()
          compareOutputs(dut)
          dut.io.chisel.irq.irqSig.expect(true.B)
        }
      }
      dut.clock.step()
      //Read out last 4
      for(i <- 0 until 4) {
        dut.io.in.config.en.poke(true.B)
        dut.io.in.config.addr.poke(0.U)
        dut.io.in.sel.poke(true.B)
        dut.clock.step()
        compareOutputs(dut)
      }
      dut.io.chisel.irq.irqSig.expect(false.B)
    }
  }
}
