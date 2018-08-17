package pe
import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class aluTester(c:ALU) extends PeekPokeTester(c) {
}
class ipuTester(c:IPU) extends PeekPokeTester(c) {
}
class nluTester(c:NLU) extends PeekPokeTester(c) {
}
class rfTester(c:RF) extends PeekPokeTester(c) {
}
