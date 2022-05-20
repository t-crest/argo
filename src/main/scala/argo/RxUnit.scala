package argo

import ArgoTypes._
import ArgoBundles._
import chisel3._
import chisel3.util._

/**
 * Argo 2.0 Pipeline Receive Unit
 * This unit receives data from a connected router, forwarding it to either
 * the interrupt queue, configuration or SPM depending on the header type
 *
 * @author Kasper Hesse, s183735@student.dtu.dk
 */
class RxUnit extends Module {
  val io = IO(new Bundle {
    /** Input packet from router */
    val pkt = Input(UInt(LINK_WIDTH.W))
    /** Outputs to SPM */
    val spm = Output(new MemoryIfMaster)
    /** Outputs to internal MEM bus */
    val config = Output(new ConfigIfMaster)
    /** Signals to IRQ FIFO */
    val irq = Output(new IrqFifoInput)
  })
  /* Registers */
  val sIdle :: sDataWLow :: sDataWHigh :: sConfigWLow :: sConfigWHigh :: sIrqW :: Nil = Enum(6)
  val state = RegInit(sIdle)
  /** Internal address field */
  val intAddr = RegInit(0.U(MEM_ADDR_WIDTH.W))
  /** Address output to SPM */
  val addr = RegInit(0.U(MEM_ADDR_WIDTH.W))
  /** Indicates if a new data packet has arrived and last packet bit is 1 */
  val lastDataPacket = RegInit(false.B)
  /** High word of write data */
  val wrDataHigh = RegInit(0.U(WORD_WIDTH.W))

  /* Wires */
  /** Write data to SPM. Consists of a high (1) and low (0) data word */
  val wrData = WireDefault(VecInit(Seq.fill(2)(0.U(WORD_WIDTH.W))))
  val newPacket = io.pkt(LINK_WIDTH-1) && io.pkt(LINK_WIDTH-2) && !io.pkt(LINK_WIDTH-3)
  val newDataPacket = newPacket && !io.pkt(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 2)
  val newConfigPacket = newPacket && !io.pkt(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 1) && io.pkt(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 2)
  val newIrqPacket = newPacket && io.pkt(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 1) && io.pkt(HEADER_FIELD_WIDTH + HEADER_ROUTE_WIDTH - 2)

  //Start of packet (SOP): uppermost bits are 110
  //Valid packet         : Uppermost bits are 100
  //End of packet   (EOP): Uppermost bits are 101

  //2 uppermost bits of the 32-bit field are used for packet control
  //Data packet  (10/00): bit 30 is 0
  //Config packet(01): bit 31 is 0, bit 30 is 1
  //IRQ packet   (11): bit 31 is 1, bit 30 is 1

  /* Assignment */
  //Default value assignments
  wrData(0) := io.pkt(WORD_WIDTH-1,0)
  wrData(1) := wrDataHigh
  intAddr := intAddr + 1.U

  //Default output assignments
  io.spm.wrData := Cat(wrData(1), wrData(0))
  io.spm.en(0) := false.B
  io.spm.en(1) := false.B
  io.spm.wr := false.B
  io.spm.addr := addr


  io.config.wrData := io.pkt(WORD_WIDTH-1,0)
  io.config.addr := intAddr
  io.config.en := false.B
  io.config.wr := false.B

  io.irq.irqValid := false.B
  io.irq.data := addr
  //IRQ fifo data valid assignment is delayed  to happen with last spm wr/en
  io.irq.dataValid := lastDataPacket && io.pkt(LINK_WIDTH-3)

  //New data packet word
  when(newDataPacket && io.pkt(HEADER_FIELD_WIDTH+HEADER_ROUTE_WIDTH-1)) {
    lastDataPacket := true.B //Set if new data packet and last packet bit is 1, according to rx_unit.vhd
  } .elsewhen(!(newDataPacket && io.pkt(HEADER_FIELD_WIDTH+HEADER_ROUTE_WIDTH-1)) && io.pkt(LINK_WIDTH-3)) {
    lastDataPacket := false.B
  }

  /* Control FSM */
  switch(state) {
    is(sIdle) {
      //Fetch in new address fields, wait for new packet
      intAddr := io.pkt(HEADER_ROUTE_WIDTH+HEADER_FIELD_WIDTH-HEADER_CTRL_WIDTH-1, HEADER_ROUTE_WIDTH)
      addr := io.pkt(HEADER_ROUTE_WIDTH+HEADER_FIELD_WIDTH-HEADER_CTRL_WIDTH-1, HEADER_ROUTE_WIDTH)
      when(newDataPacket) {
        state := sDataWHigh
      } .elsewhen(newConfigPacket) {
        state := sConfigWHigh
      } .elsewhen(newIrqPacket) {
        state := sIrqW
      }
    }

    //Fetch in high data word
    is(sDataWHigh) {
      intAddr := intAddr + 1.U
      when(!io.pkt(LINK_WIDTH-3)) { //Still processing
        wrDataHigh := io.pkt(WORD_WIDTH-1, 0)
        state := sDataWLow
      } .otherwise { //End of processing data word, write to SPM
        io.spm.en(0) := true.B
        io.spm.wr := true.B
        wrData(1) := io.pkt(WORD_WIDTH-1, 0)
        state := sIdle
      }
    }

    //Add on low data word
    is(sDataWLow) {
      io.spm.en := VecInit(Seq.fill(2)(true.B))
      io.spm.wr := true.B
      io.irq.data := intAddr
      addr := intAddr + 1.U
      when(!io.pkt(LINK_WIDTH-3)) { //still processing
        state := sDataWHigh
      } .otherwise { //end of processing
        state := sIdle
      }
    }

    //Fetch in high config word, data assigned above
    is(sConfigWHigh) {
      io.config.en := true.B
      io.config.wr := true.B
      when(!io.pkt(LINK_WIDTH-3)) {
        state := sConfigWLow
      } .otherwise {
        state := sIdle
      }
    }

    //Fetch in low config word, data assigned above
    is(sConfigWLow) {
      io.config.en := true.B
      io.config.wr := true.B
      state := sIdle
    }

    is(sIrqW) {
      io.spm.en(0) := true.B
      io.spm.wr := true.B
      io.irq.irqValid := true.B
      wrData(1) := io.pkt(WORD_WIDTH-1, 0)
      state := sIdle
    }
  }
}
