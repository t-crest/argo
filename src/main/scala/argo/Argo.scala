package argo

import chisel3.stage.{ChiselStage, ChiselGeneratorAnnotation}

/**
 * The Argo object generates all files necessary to instantiate Argo in a multicore
 * t-crest platform. The generated files are placed into ./argo_build
 */
object Argo extends App {
  println("Generating master NoC node")
  (new ChiselStage).execute(Array("-td", "argo_build", "-X", "verilog", "-e", "verilog"), Seq(ChiselGeneratorAnnotation(() => new NoCNodeWrapper(master=true))))
  println("Generating slave NoC node")
  (new ChiselStage).execute(Array("-td", "argo_build", "-X", "verilog", "-e", "verilog"), Seq(ChiselGeneratorAnnotation(() => new NoCNodeWrapper(master=false))))
  println("Generating communication SPM wrapper")
  (new ChiselStage).execute(Array("-td", "argo_build", "-X", "verilog", "-e", "verilog"), Seq(ChiselGeneratorAnnotation(() => new ComSpmWrapper)))
}
