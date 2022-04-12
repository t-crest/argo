package argo

import ArgoBundles._
import ArgoTypes._
import chisel3._
import chisel3.util._

/**
 * Argo 2.0 IRQ FIFO
 * Functionality: Stores IRQ packets received from RX Unit until config bus retrieves these
 * Sends out signals [[IrqFifoOutput.irqSig]] and [[IrqFifoOutput.dataSig]] whenever new data/irq packet is available
 *
 * @author Kasper Hesse, s183735@student.dtu.dk
 */
class IrqFIFO extends Module {
  val io = IO(new Bundle {
    val irqIn = Input(new IrqFifoInput)
    val irqOut = Output(new IrqFifoOutput)
    val config = new Bundle {
      val m = Input(new ConfigIfMaster)
      val s = Output(new ConfigIfSlave)
    }
    val sel = Input(Bool())
  })
  /*
  Adresses of readable/writeable registers
  Address | Access | Name
  ------------------------
  0x00    | R      | Top of the IRQ FIFO
  0x01    | R      | Top of the Data FIFO

  When dataSig=true, there is valid data at the head of the data fifo
  When irqSiq=true, there is valid data at the head of the irq fifo
   */

  /* Modules */
  val dataWidth = HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH
  val addrWidth = IRQ_FIFO_IDX_WIDTH
  val tdpram = Module(new DualPortRam(addrWidth, UInt(dataWidth.W)))

  /* Registers */
  //irq write and read both operate on the same RAM block
  //irq is in the lower half of the RAM, data in the upper half
  //Write pointers count up
  val irqWrPtr = RegInit(IRQ_IRQ_FIFO_MIN.U(IRQ_FIFO_IDX_WIDTH.W))
  val irqRdPtr = RegInit(IRQ_IRQ_FIFO_MIN.U(IRQ_FIFO_IDX_WIDTH.W))
  //Data pointers count down. Initialize to maximum value
  val dataWrPtr = RegInit(IRQ_DATA_FIFO_MAX.U(IRQ_FIFO_IDX_WIDTH.W))
  val dataRdPtr = RegInit(IRQ_DATA_FIFO_MAX.U(IRQ_FIFO_IDX_WIDTH.W))

  /** Error register if invalid operation occurred */
  val error = RegInit(false.B)

  /* Wires and signals */
  val irqRead = WireDefault(false.B)
  val dataRead = WireDefault(false.B)
  val port1 = Wire(new RamPort(addrWidth, UInt(dataWidth.W)))
  val port2 = Wire(new RamPort(addrWidth, UInt(dataWidth.W)))

  //IRQ and data fifo state
  val dataFull = (dataWrPtr === (dataRdPtr+1.U)) || ((dataWrPtr === IRQ_DATA_FIFO_MIN.U) && (dataRdPtr === IRQ_DATA_FIFO_MAX.U))
  val dataEmpty = dataWrPtr === dataRdPtr
  val irqFull = (irqWrPtr === (irqRdPtr-1.U)) || ((irqWrPtr === IRQ_IRQ_FIFO_MAX.U) && (irqRdPtr === IRQ_IRQ_FIFO_MIN.U))
  val irqEmpty = irqWrPtr === irqRdPtr

  /* Default assignments */
  error := false.B

  //Port 1 is write only
  port1.clk := this.clock
  port1.we := (io.irqIn.irqValid && !irqFull) || (io.irqIn.dataValid && !dataFull)
  port1.addr := Mux(io.irqIn.dataValid, dataWrPtr, irqWrPtr)
  port1.wrData := io.irqIn.data
  port1 <> tdpram.io.port1

  //Port 2 is read only
  port2.clk := this.clock
  port2.we := false.B
  port2.wrData := 0.U
  port2.addr := dataRdPtr //Default assignment, may be changed below
  port2 <> tdpram.io.port2

  //Outputs
  io.config.s.error := error
  io.config.s.rdData := Cat(0.U((WORD_WIDTH - dataWidth).W), port2.rdData)
  io.irqOut.irqSig := !irqEmpty
  io.irqOut.dataSig := !dataEmpty

  //Address decode logic
  when(io.sel && io.config.m.en) {
    when(!io.config.m.wr) {
      val maddr = io.config.m.addr(CPKT_ADDR_WIDTH-1, 0)
      when(maddr === 0.U) {
        port2.addr := irqRdPtr
        irqRead := true.B
      } .elsewhen(maddr === 1.U) {
        port2.addr := dataRdPtr
        dataRead := true.B
      } .otherwise {
        error := true.B
      }
    } .otherwise { //Write register gives an error
      error := true.B
    }
  }

  //Write into irq
  when(io.irqIn.irqValid && !irqFull) {
    when(irqWrPtr === IRQ_IRQ_FIFO_MAX.U) {
      irqWrPtr := IRQ_IRQ_FIFO_MIN.U
    } .otherwise {
      irqWrPtr := irqWrPtr + 1.U
    }
  }
  when(irqRead && !irqEmpty) {
    when(irqRdPtr === IRQ_IRQ_FIFO_MAX.U) {
      irqRdPtr := IRQ_IRQ_FIFO_MIN.U
    } .otherwise {
      irqRdPtr := irqRdPtr + 1.U
    }
  }
  when(io.irqIn.dataValid && !dataFull) {
    when(dataWrPtr === IRQ_DATA_FIFO_MIN.U) {
      dataWrPtr := IRQ_DATA_FIFO_MAX.U
    } .otherwise {
      dataWrPtr := dataWrPtr - 1.U
    }
  }
  when(dataRead && !dataEmpty) {
    when(dataRdPtr === IRQ_DATA_FIFO_MIN.U) {
      dataRdPtr := IRQ_DATA_FIFO_MAX.U
    } .otherwise {
      dataRdPtr := dataRdPtr - 1.U
    }
  }
}
