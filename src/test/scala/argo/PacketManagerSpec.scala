package argo

import argo.ArgoTypes._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import blackbox.PacketManagerWrapper
import chisel3._

class PacketManagerSpec extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "Packet manager"

  def compareOutputs(dut: PacketManagerWrapper): Unit = {
    val vio = dut.io.verilog
    val cio = dut.io.chisel

    cio.pktOut.expect(vio.pktOut.peek())
    cio.config.expect(vio.config.peek())
    cio.spm.expect(vio.spm.peek())
  }

  def stepCompare(dut: PacketManagerWrapper): Unit = {
    dut.clock.step()
    compareOutputs(dut)
  }

  /**
   * Generates the fields necessary to create a DMA packet that instructs the packet manager to set up a transfer
   * @param count Number of data words to transmit
   * @param readPtr Address in SPM where first data word is stored
   * @param header Header for the packet
   * @param idx Which DMA idx to use
   * @param active Whether this is an active packet or not
   * @return Nested seq. Seq(0) contains the first (addr, packet) pair, and Seq(1) contains the second pair
   */
  def genDmaPacket(count: Int, readPtr: Int, header: Int, idx: Int, active: Boolean = true): Seq[Seq[Long]] = {
    require(idx < (2 << DMATBL_IDX_WIDTH))

    val act: Long = if (active) 1L else 0L

    val addr1 = idx << 1
    val addr2 = (idx << 1) + 1

    val packet1: Long = header
    val packet2: Long = act << 31 | (count << DMATBL_READ_PTR_WIDTH) | readPtr

    Seq(Seq(addr1, packet1), Seq(addr2, packet2))
  }

  /**
   * Takes a DMA setup packet generated with [[genDmaPacket]] and drives it onto the packet manager
   * Leaves all pins with same values poked on when the method terminates
   * @param dut
   * @param packets
   */
  def setupDma(dut: PacketManagerWrapper, packets: Seq[Seq[Long]]): Unit = {
    timescope {
      dut.io.in.config.wr.poke(true.B)
      dut.io.in.sel.poke(true.B)

      for(p <- packets) {
        dut.io.in.config.addr.poke(p(0).U)
        dut.io.in.config.wrData.poke(p(1).U)
        dut.clock.step()
      }
    }
  }

  //Packets are initialized by setting dma_en=1, pkt_len then controls the length of the packet
  //on next cc, it should start transmitting data
  //dma transfers are setup by writing in on the config bus
  //writing to an address ending in 0 writes in the header
  //Writing to an address ending in 1 writes active bit, read ptr and count
  //read ptr goes into spm, count is the number of data words to transmit
  it should "setup a DMA transfer" in {
    test(new PacketManagerWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      val dma = genDmaPacket(2, 4, 8, 16)
      //Write them
      setupDma(dut, dma)

      //Error pops up if we don't wrap this in a timescope clause, don't know why
      timescope {
        //Reading back data should allow us to check if it's really set up right
        dut.io.in.config.addr.poke(dma(0)(0).U)
        stepCompare(dut)
        dut.io.chisel.config.rdData.expect(dma(0)(1).U)
        dut.io.in.config.addr.poke(dma(1)(0).U)
        stepCompare(dut)
        dut.io.chisel.config.rdData.expect(dma(1)(1).U)
      }
    }
  }

  it should "transmit a 1-word packet" in {
    test(new PacketManagerWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      val dma = genDmaPacket(1, 7, 0, 3)
      setupDma(dut, dma)
      timescope {
        dut.io.in.schedTbl.dmaEn.poke(true.B)
        dut.io.in.schedTbl.dmaNum.poke(3.U)
        dut.io.in.schedTbl.route.poke(16.U)
        dut.io.in.schedTbl.pktLen.poke(1.U)
        stepCompare(dut)
        dut.io.chisel.spm.en(0).expect(true.B)
        dut.io.chisel.spm.addr.expect(7.U)
        dut.io.in.schedTbl.dmaEn.poke(false.B)
        dut.io.in.spm.rdData.poke(42L << 32L | 42L)
        dut.clock.step()
        dut.io.chisel.pktOut.expect(EOP.toLong << 32L | 42)
      }
    }
  }

  it should "transmit a 2-word packet" in {
    test(new PacketManagerWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      val dma = genDmaPacket(2, 4, 8, 6)
      val rdData = Array.ofDim[Long](2)
      rdData(0) = VLD.toLong << 32L | 42
      rdData(1) = EOP.toLong << 32L | 84
      setupDma(dut, dma)
      //Now, set dmaEn=true and supply some read data on spm bus
      //We should see that data coming out as packets. Route s also supplied by schedule table
      timescope {
        dut.io.in.schedTbl.dmaEn.poke(true.B)
        dut.io.in.schedTbl.dmaNum.poke(6.U)
        dut.io.in.schedTbl.route.poke(15.U)

        stepCompare(dut)
        dut.io.chisel.spm.en(0).expect(true.B)
        dut.io.chisel.spm.addr.expect(4.U)
        dut.io.in.schedTbl.dmaEn.poke(false.B)
        dut.io.in.spm.rdData.poke(42L << 32L | 84L)
        for(i <- 0 until 2) {
          stepCompare(dut)
          dut.io.chisel.pktOut.expect(rdData(i))
        }
      }
    }
  }

  it should "transmit a 3-word packet" in {
    test(new PacketManagerWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      val dma = genDmaPacket(3, 7, 0, 2)
      setupDma(dut, dma)
      val rdData = Array.ofDim[Long](3)
      rdData(0) = VLD.toLong << 32L | 10
      rdData(1) = VLD.toLong << 32L | 20
      rdData(2) = EOP.toLong << 32L | 30
      timescope {
        dut.io.in.schedTbl.dmaEn.poke(true.B)
        dut.io.in.schedTbl.dmaNum.poke(2.U)
        dut.io.in.schedTbl.route.poke(16.U)
        dut.io.in.schedTbl.pktLen.poke(3.U)
        stepCompare(dut)
        dut.io.chisel.spm.en(0).expect(true.B)
        dut.io.chisel.spm.addr.expect(7.U)
        dut.io.in.schedTbl.dmaEn.poke(false.B)

        dut.io.in.spm.rdData.poke(10L << 32L | 20L)
        dut.clock.step()
        dut.io.chisel.pktOut.expect(rdData(0))
        stepCompare(dut)
        dut.io.chisel.pktOut.expect(rdData(1))
        stepCompare(dut)
        dut.io.in.spm.rdData.poke(30L << 32L)
        dut.io.chisel.pktOut.expect(rdData(2))
      }
    }
  }

  it should "increment the LSB of header when not a configuration packet" in {
    test(new PacketManagerWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>
      //When not a config packet, the header value of dmaUpdate is incremented with pktLen
      val dma = genDmaPacket(4, 8, 8, 0)
      setupDma(dut, dma)
      timescope {
        dut.io.in.schedTbl.dmaEn.poke(true.B)
        dut.io.in.schedTbl.pktLen.poke(2.U)
        stepCompare(dut)
        dut.io.in.schedTbl.dmaEn.poke(false.B)
        dut.clock.step(3)
        stepCompare(dut)
        //Read from the DMA table.
        //We wrote to idx 0, so we don't need to modify config-bus address
        dut.io.chisel.config.rdData.expect(10)
        dut.io.in.config.addr.poke(1.U)
        stepCompare(dut)
        //Should now read active bit=1, count= count-pktLen(2) and readPtr=readPtr+pktLen (10)
        dut.io.chisel.config.rdData.expect((1L << 31L) | (2 << DMATBL_READ_PTR_WIDTH) | 10)
      }
    }
  }

  it should "increment the LSB of header when a configuration packet" in {
    test(new PacketManagerWrapper).withAnnotations(Seq(VerilatorBackendAnnotation)) {dut =>

      //setting header = 1 << (HRW-2) makes this a configuration packet
      //These have special requirements to how they are modified in the init state
      val header = (1 << (HEADER_ROUTE_WIDTH-2)) | (MC_BANK << (HEADER_FIELD_WIDTH-6)) | 5
      //When a config packet, the header value of dmaUpdate should not be manipulated
      val dma = genDmaPacket(4, 8, header, 0)
      setupDma(dut, dma)
      timescope {
        dut.io.in.schedTbl.dmaEn.poke(true.B)
        dut.io.in.schedTbl.pktLen.poke(2.U)
        stepCompare(dut)
        dut.io.in.schedTbl.dmaEn.poke(false.B)
        dut.clock.step(3)
        stepCompare(dut)
        //Read from the DMA table.
        //We wrote to idx 0, so we don't need to modify config-bus address
        dut.io.chisel.config.rdData.expect(header + 2)
        dut.io.in.config.addr.poke(1.U)
        stepCompare(dut)
        //Should now read active bit=1, count= count-pktLen(2) and readPtr=readPtr+pktLen (10)
        dut.io.chisel.config.rdData.expect((1L << 31L) | (2 << DMATBL_READ_PTR_WIDTH) | 10)
      }
    }
  }
}
