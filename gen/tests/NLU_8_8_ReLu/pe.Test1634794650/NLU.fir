;buildInfoPackage: chisel3, version: 3.0.2, scalaVersion: 2.11.11, sbtVersion: 0.13.16, builtAtString: 2018-02-05 23:25:31.873, builtAtMillis: 1517873131873
circuit NLU : 
  module NLU : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip fSel : {reluEnable : UInt<1>}, flip in : SInt<8>, out : SInt<8>}
    
    when UInt<1>("h00") : @[PE.scala 296:48]
      io.out <= io.in @[PE.scala 297:16]
      skip @[PE.scala 296:48]
    else : @[PE.scala 298:57]
      when io.fSel.reluEnable : @[PE.scala 298:57]
        node _T_7 = gt(io.in, asSInt(UInt<1>("h00"))) @[PE.scala 299:26]
        when _T_7 : @[PE.scala 299:33]
          io.out <= io.in @[PE.scala 300:20]
          skip @[PE.scala 299:33]
        else : @[PE.scala 301:22]
          io.out <= asSInt(UInt<1>("h00")) @[PE.scala 302:20]
          skip @[PE.scala 301:22]
        skip @[PE.scala 298:57]
      else : @[PE.scala 304:57]
        when UInt<1>("h00") : @[PE.scala 304:57]
          io.out <= asSInt(UInt<1>("h00")) @[PE.scala 306:16]
          skip @[PE.scala 304:57]
        else : @[PE.scala 307:57]
          when UInt<1>("h00") : @[PE.scala 307:57]
            io.out <= asSInt(UInt<1>("h00")) @[PE.scala 309:16]
            skip @[PE.scala 307:57]
          else : @[PE.scala 310:18]
            io.out <= asSInt(UInt<1>("h00")) @[PE.scala 311:16]
            skip @[PE.scala 310:18]
    
