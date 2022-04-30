package argo

import ArgoBundles._
import ArgoTypes._
import chisel3._
import chisel3.util._

/**
 * Argo 2.0 packet manager component of the network interface
 * WIP
 *
 * @param master Whether this packet manager is in the master node or not
 *               Does not modify behavior, but is necessary for proper verilog generation
 * @author Kasper Juul Hesse Rasmussen, s183735@student.dtu.dk
 */
class PacketManager(val master: Boolean) extends Module {
  val io = IO(new Bundle {
    val config = new Bundle {
      val m = Input(new ConfigIfMaster)
      val s = Output(new ConfigIfSlave)
      val sel = Input(Bool())
    }
    val spm = new Bundle {
      val in = Input(new MemoryIfSlave)
      val out = Output(new MemoryIfMaster)
    }
    val schedTbl = Flipped(new SchedTblPacketManIO)
    val mc = Flipped(new ModeChangePacketManIO)
    val pktOut = Output(UInt(LINK_WIDTH.W))
  })

  override def desiredName: String = if(this.master) {
    "PacketManager_m"
  } else {
    "PacketManager_s"
  }

  /*
  DMA Table fields (write-only)
  Bits | Name
  1    | Active
  14   | Count
  14   | Read ptr
  16   | Header field
   */

  val sIdle :: sSend1 :: sSend2 :: sModeChange1 :: sModeChange2 :: Nil = Enum(5)

  /* Registers */

  val state = RegInit(sIdle)

  val pktLen = RegInit(0.U(STBL_PKT_LEN_WIDTH.W))
  val route = RegNext(io.schedTbl.route, 0.U(HEADER_ROUTE_WIDTH.W))
  val payloadData = RegInit(0.U(WORD_WIDTH.W))
  val readPtr = RegInit(0.U(DMATBL_READ_PTR_WIDTH.W))
  val dmaNum = RegNext(io.schedTbl.dmaNum, 0.U(DMATBL_IDX_WIDTH.W))
  val countReg = RegInit(0.U(DMATBL_COUNT_WIDTH.W))
  val error = RegInit(false.B)
  val hiLo = RegInit(false.B)
  val dmaEn = RegNext(io.schedTbl.dmaEn, false.B)

  /* Wires */
  //Data coming out of DMA table
  val dmaTable = Wire(new DmaTableData)
  //Data being used to update DMA table
  val dmaUpdate = Wire(new DmaTableData)

  val dmaPktType = dmaTable.header(HEADER_FIELD_WIDTH-1, HEADER_FIELD_WIDTH-2)
  val pktType = WireDefault(dmaPktType)
  val dmaUpdateEn = WireDefault(false.B)

  //Constants
  /** Valid, start of packet header */
  val VALID_SOP = SOP.U(3.W)
  /** Valid packet header */
  val VALID_PKT = VLD.U(3.W)
  /** Valid, end of packet header */
  val VALID_EOP = EOP.U(3.W)

  /* Modules */
  class CountReadPtrData extends Bundle {
    val active = Bool() //45
    val count = UInt(DMATBL_COUNT_WIDTH.W) //44:30
    val readPtr = UInt(DMATBL_READ_PTR_WIDTH.W) //29:16
  }

  //Using two memories to store DMA data, since we cannot receive all 45 bits in one data word on config bus
  //active, count and readPtr arrive on the first cycle, header value arrives on the next cycle
  //port1 is used for config bus read/write, setting up new dma transfers
  //port2 is used for internal DMA operations
  val countReadPtrTable = Module(new DualPortRam(addrWidth = DMATBL_IDX_WIDTH, dataType = new CountReadPtrData))
  val headerTable = Module(new DualPortRam(addrWidth = DMATBL_IDX_WIDTH, dataType = UInt(HEADER_FIELD_WIDTH.W)))

  val portAdata = Wire(new DmaTableData)
  val portBdata = Wire(new DmaTableData)

  /* Assignments */
  //Some of these are default assignments that will be overwritten later
  io.spm.out.wrData := 0.U
  io.spm.out.wr := false.B
  io.spm.out.addr := dmaTable.readPtr
  io.spm.out.en := VecInit(Seq(false.B, false.B))
  dmaUpdate := dmaTable
  dmaUpdate.active := false.B
  io.pktOut := 0.U
  pktLen := Mux(io.schedTbl.dmaEn, io.schedTbl.pktLen, pktLen)
  payloadData := 0.U
  io.config.s.rdData := 0.U
  error := io.config.sel && io.config.m.addr(CPKT_ADDR_WIDTH-1, DMATBL_IDX_WIDTH+1) =/= 0.U
  io.config.s.error := error


  //Default internal signals
  switch(state) {
    is(sIdle) {
      when(dmaEn) {
        when(io.mc.mc) {
          state := sModeChange1
          when(pktLen >= 1.U) {
            pktType := "b01".U
          }
          io.pktOut := Cat(VALID_SOP, pktType, MC_BANK.U(CPKT_BANK_WIDTH.W), 0.U(CPKT_ADDR_WIDTH), route)

          //We do some subfield assignment here that is easier to handle with a vec of bits
          val ploadData = VecInit(Seq.fill(WORD_WIDTH)(false.B))
          ploadData(WORD_WIDTH/2+1) := io.mc.mcP(1)
          ploadData(WORD_WIDTH/2) := io.mc.mcP(0)
          ploadData(MCTBL_IDX_WIDTH-1) := io.mc.mcIdx(1)
          ploadData(0) := io.mc.mcIdx(0)
          payloadData := ploadData.asUInt
        } .elsewhen(dmaTable.active) {
          state := sSend1
          io.spm.out.en := VecInit(Seq(true.B, true.B))
          io.spm.out.addr := dmaTable.readPtr
          readPtr := dmaTable.readPtr
          dmaUpdateEn := true.B
          countReg := dmaTable.count - 1.U
          when(dmaTable.count > pktLen) {
            when(dmaPktType === "b10".U) {
              pktType := 0.U
            }
            dmaUpdate.active := true.B
          }

          //TODO errors are probably due to something here not being set correctly
          //Updating some bits in header
          //Original VHDL code sets header(header'high-2 downto 0) <= header(header'high-2 downto 0) + pktLen
          //Since header'high returns (HEADER_FIELD_WIDTH-1), so we preserve those two bits from previous value
          val high = dmaTable.header(HEADER_FIELD_WIDTH-1, HEADER_FIELD_WIDTH-2)
          val low = dmaTable.header(HEADER_FIELD_WIDTH-3, 0) + pktLen
          dmaUpdate.header := Cat(high, low)
          dmaUpdate.readPtr := dmaTable.readPtr + pktLen
          dmaUpdate.count := dmaTable.count - pktLen
          when(dmaPktType === "b01".U) {
            //Must ensure bank ID is not incremented if we sent a configuration packet
            //Original VHDL preserves update_header(update_header'high-2 downto update_header'high-5)
            val hi  = dmaTable.header(HEADER_FIELD_WIDTH-1, HEADER_FIELD_WIDTH-2)
            val mid = dmaTable.header(HEADER_FIELD_WIDTH-3, HEADER_FIELD_WIDTH-6)
            val lo = dmaTable.header(HEADER_FIELD_WIDTH-7, 0) + pktLen
            dmaUpdate.header := Cat(hi, mid, lo)
          }
          pktLen := pktLen - 1.U
          io.pktOut := Cat(VALID_SOP, pktType, dmaTable.header(HEADER_FIELD_WIDTH-3, 0), route)
        }
      }
    }

    is(sSend1) {
      payloadData := io.spm.in.rdData(WORD_WIDTH-1,0)
      pktLen := pktLen - 1.U
      countReg := countReg - 1.U
      when(pktLen > 0.U && countReg > 0.U) {
        state := sSend2
        io.pktOut := Cat(VALID_PKT, io.spm.in.rdData(DWORD_WIDTH - 1, WORD_WIDTH))
        readPtr := readPtr + 1.U
      } .otherwise {
        state := sIdle
        io.pktOut := Cat(VALID_EOP, io.spm.in.rdData(DWORD_WIDTH-1, WORD_WIDTH))
      }
    }

    is(sSend2) {
      pktLen := pktLen - 1.U
      countReg := countReg - 1.U
      when(pktLen > 0.U && countReg > 0.U) {
        state := sSend1
        io.pktOut := Cat(VALID_PKT, payloadData)
        io.spm.out.en := VecInit(Seq(true.B, true.B))
        readPtr := readPtr + 1.U
        io.spm.out.addr := readPtr + 1.U
      } .otherwise {
        state := sIdle
        io.pktOut := Cat(VALID_EOP, payloadData)
      }
    }
    is(sModeChange1) {
      state := sModeChange2
      io.pktOut := Cat(VALID_PKT, payloadData)
    }
    is(sModeChange2) {
      state := sIdle
      io.pktOut := Cat(VALID_EOP, payloadData)
    }
  }

  //Assign data going into memories
  portAdata.active := io.config.m.wrData(WORD_WIDTH-1)
  portAdata.count := io.config.m.wrData(DMATBL_COUNT_WIDTH+DMATBL_READ_PTR_WIDTH-1, DMATBL_READ_PTR_WIDTH)
  portAdata.readPtr := io.config.m.wrData(DMATBL_READ_PTR_WIDTH-1, 0)
  portAdata.header := io.config.m.wrData(HEADER_FIELD_WIDTH-1, 0)

  val portAwriteHigh = io.config.m.addr(0) && io.config.m.wr && io.config.sel
  val portAwriteLow = !io.config.m.addr(0) && io.config.m.wr && io.config.sel
  val portAaddr = io.config.m.addr(DMATBL_IDX_WIDTH, 1)

  hiLo := io.config.m.addr(0)
  when(hiLo) {
    //Subfield assignments in VHDL code - we're implementing here by defining fields
    val hi = countReadPtrTable.io.port1.rdData.active //1 bit
    val lo = Cat(countReadPtrTable.io.port1.rdData.count, countReadPtrTable.io.port1.rdData.readPtr) //28 bits
    val mid = 0.U((WORD_WIDTH - ACTIVE_BIT - DMATBL_COUNT_WIDTH - DMATBL_READ_PTR_WIDTH).W) //remaining bits should be blank
    io.config.s.rdData := Cat(hi, mid, lo)
  } .otherwise {
    val hi = 0.U((WORD_WIDTH- HEADER_FIELD_WIDTH).W)
    val lo = headerTable.io.port1.rdData
    io.config.s.rdData := Cat(hi, lo)
  }

  portBdata := dmaUpdate
  val portBwr = Mux(io.schedTbl.dmaEn, false.B, dmaUpdateEn)
  val portBaddr = Mux(io.schedTbl.dmaEn, io.schedTbl.dmaNum, dmaNum)

  countReadPtrTable.io.port1.clk := this.clock
  countReadPtrTable.io.port1.we := portAwriteHigh
  countReadPtrTable.io.port1.addr := portAaddr
  countReadPtrTable.io.port1.wrData.active := portAdata.active
  countReadPtrTable.io.port1.wrData.count := portAdata.count
  countReadPtrTable.io.port1.wrData.readPtr := portAdata.readPtr
  countReadPtrTable.io.port2.clk := this.clock
  countReadPtrTable.io.port2.we := portBwr
  countReadPtrTable.io.port2.addr := portBaddr
  countReadPtrTable.io.port2.wrData.active := portBdata.active
  countReadPtrTable.io.port2.wrData.count := portBdata.count
  countReadPtrTable.io.port2.wrData.readPtr := portBdata.readPtr

  headerTable.io.port1.clk := this.clock
  headerTable.io.port1.we := portAwriteLow
  headerTable.io.port1.addr := portAaddr
  headerTable.io.port1.wrData := portAdata.header
  headerTable.io.port2.clk := this.clock
  headerTable.io.port2.we := portBwr
  headerTable.io.port2.addr := portBaddr
  headerTable.io.port2.wrData := portBdata.header

  dmaTable.active := countReadPtrTable.io.port2.rdData.active
  dmaTable.count := countReadPtrTable.io.port2.rdData.count
  dmaTable.readPtr := countReadPtrTable.io.port2.rdData.readPtr
  dmaTable.header := headerTable.io.port2.rdData

}
