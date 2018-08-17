
/*============================================================================

This Chisel source file is part of a pre-release version of the HardFloat IEEE
Floating-Point Arithmetic Package, by John R. Hauser (with some contributions
from Yunsup Lee and Andrew Waterman, mainly concerning testing).

Copyright 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017 The Regents of the
University of California.  All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright notice,
    this list of conditions, and the following disclaimer.

 2. Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions, and the following disclaimer in the documentation
    and/or other materials provided with the distribution.

 3. Neither the name of the University nor the names of its contributors may
    be used to endorse or promote products derived from this software without
    specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS "AS IS", AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, ARE
DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

=============================================================================*/

package pe

import chisel3._

object Test extends App {
  val testArgs = args.slice(1, args.length)
  args(0) match {
    case "ALU" => 
      assert(args.length >= 3)
      val config = new ALUConfig(args(1).toInt, args(2).toString.split('/').toList)
      //val config = new ALUConfig(args(1).toInt, List("Add"))
      iotesters.Driver.execute(testArgs, () => new ALU(config)) {
        c => new aluTester(c)
      }
    case "IPU" => 
      assert(args.length >= 5)
      val config = new IPUConfig(args(1).toInt, args(2).toInt, args(3).toInt, args(4).toString)
      iotesters.Driver.execute(testArgs, () => new IPU(config)) {
        c => new ipuTester(c)
      }
    case "NLU" =>
      assert(args.length >= 4)
      val config = new NLUConfig(args(1).toInt, args(2).toInt, args(3).toString.split('/').toList)
      iotesters.Driver.execute(testArgs, () => new NLU(config)) {
        c => new nluTester(c)
      }
    case "RF" =>
      assert(args.length >= 7)
      val config = new RFConfig(args(1).toInt, args(2).toInt, args(3).toInt, args(4).toInt, args(5).toInt, args(6).toInt, args(7).toString)
      iotesters.Driver.execute(testArgs, () => new RF(config)) {
        c => new rfTester(c)
      }
  } 
}

