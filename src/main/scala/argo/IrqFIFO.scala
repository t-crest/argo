package argo

import ArgoBundles._
import ArgoTypes._
import chisel3._
import chisel3.util._

/**
 * Argo 2.0 IRQ FIFO
 * Functionality: TBD
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
  Adresses of readable/writeable registers (word-based addresses inside NI)
  Address | Access | Name
  ------------------------
  0x00    | R      | Top of the IRQ FIFO
  0x01    | R      | Top of the Data FIFO
   */

  /* Modules */
  val dataWidth = HEADER_FIELD_WIDTH - HEADER_CTRL_WIDTH
  val addrWidth = IRQ_FIFO_IDX_WIDTH
  val tdpram = Module(new DualPortRam(addrWidth, dataWidth))

  /* Registers */
  //Write pointers count up
  val irqWrPtr = RegInit(0.U(IRQ_FIFO_IDX_WIDTH.W))
  val irqRdPtr = RegInit(0.U(IRQ_FIFO_IDX_WIDTH.W))
  //Data pointers count down. Initialize to maximum value
  val dataWrPtr = RegInit(((1 << IRQ_FIFO_IDX_WIDTH)-1).U(IRQ_FIFO_IDX_WIDTH.W))
  val dataRdPtr = RegInit(((1 << IRQ_FIFO_IDX_WIDTH)-1).U(IRQ_FIFO_IDX_WIDTH.W))

  /** Error register if invalid operation occurred */
  val error = RegInit(false.B)

  /* Wires and signals */
  val irqRead = WireDefault(false.B)
  val dataRead = WireDefault(false.B)
  val port1 = Wire(new RamPort(addrWidth, dataWidth))
  val port2 = Wire(new RamPort(addrWidth, dataWidth))

  //IRQ and data fifo state
  val irqEmpty = irqWrPtr === irqRdPtr
  val dataEmpty = dataWrPtr === dataRdPtr
  val irqFull = (irqWrPtr === (irqRdPtr-1.U)) || ((irqWrPtr === IRQ_IRQ_FIFO_MAX.U) && (irqRdPtr === 0.U))
  val dataFull = (dataWrPtr === (dataRdPtr+1.U)) || ((dataWrPtr === IRQ_DATA_FIFO_MIN.U) && (dataRdPtr === math.pow(2, IRQ_FIFO_IDX_WIDTH-1).toInt.U))

  /* Assignments */
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
  //Gets auto-expanded up to the correct width, zero
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

  when(io.irqIn.irqValid && !irqFull) {
    when(irqWrPtr === IRQ_IRQ_FIFO_MAX.U) {
      irqWrPtr := 0.U
    } .otherwise {
      irqWrPtr := irqWrPtr + 1.U
    }
  }
  when(irqRead && !irqEmpty) {
    when(irqRdPtr === IRQ_IRQ_FIFO_MAX.U) {
      irqRdPtr := 0.U
    } .otherwise {
      irqRdPtr := irqRdPtr + 1.U
    }
  }
  when(io.irqIn.dataValid && !dataFull) {
    when(dataWrPtr === IRQ_DATA_FIFO_MIN.U) {
      dataWrPtr := (-1).S.asUInt
    } .otherwise {
      dataWrPtr := dataWrPtr - 1.U
    }
  }
  when(dataRead && !dataEmpty) {
    when(dataRdPtr === IRQ_DATA_FIFO_MIN.U) {
      dataRdPtr := (-1).S.asUInt
    } .otherwise {
      dataRdPtr := dataRdPtr - 1.U
    }
  }
}
