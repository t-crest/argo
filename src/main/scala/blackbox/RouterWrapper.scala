package blackbox

import argo.ArgoBundles.RouterPort
import argo.Router
import chisel3._

class RouterWrapper extends Module {
  val io = IO(new Bundle{
    val in = new RouterPort()
    val chisel = Flipped(new RouterPort())
    val verilog = Flipped(new RouterPort())
  })
  //wide ports are the 5 ports with 1-bit req + 35-bit data
  //narrow ports are the acknowledge ports - not really in use here, but can probably still be connected
  /*
  Directions
  0: south
  1: west
  2: north
  3: east
  4: local

  channel: [req, data]
  router_port: (arity-1) downto 0, so probably local in the MSB
   */

  val v = Module(new router)
  val c = Module(new Router)

  //Assign inputs
  v.io.clk := this.clock.asBool
  v.io.reset := this.reset.asBool
  //(4).data ## (4).req ## (3).data ## (3).req ## ...
  v.io.inPort_f := io.in.port.foldRight(0.U(1.W))((chan, x) => x ## chan.data ## chan.req)(179, 0) //Dropping MSB 0.U(1.W) that was used to initialize fold
  //(4).ack ## (3).ack ## ...
  v.io.outPort_b := io.verilog.port.foldRight(0.U(1.W))((chan, x) => x ## chan.ack)(4,0) //Dropping MSB used to initialize fold

  c.io.inPort <> io.in

  //Assing outputs
  io.verilog.port(0).req :=  v.io.outPort_f(0)
  io.verilog.port(0).data := v.io.outPort_f(35, 1)
  io.verilog.port(1).req :=  v.io.outPort_f(36)
  io.verilog.port(1).data := v.io.outPort_f(71, 37)
  io.verilog.port(2).req :=  v.io.outPort_f(72)
  io.verilog.port(2).data := v.io.outPort_f(107, 73)
  io.verilog.port(3).req :=  v.io.outPort_f(108)
  io.verilog.port(3).data := v.io.outPort_f(143, 109)
  io.verilog.port(4).req :=  v.io.outPort_f(144)
  io.verilog.port(4).data := v.io.outPort_f(179, 145)

  io.chisel <> c.io.outPort
}
