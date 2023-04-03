import argo.ArgoTypes._
import chiselverify.crv.backends.jacop.{Model, RandObj, RandVar, rand}

package object argo {

  /**
   * Gets a random value from a sequence
   * @param a
   * @tparam T
   * @return
   */
  def randFromSeq[T](a: Seq[T]): T = a(scala.util.Random.nextInt(a.length))

}
