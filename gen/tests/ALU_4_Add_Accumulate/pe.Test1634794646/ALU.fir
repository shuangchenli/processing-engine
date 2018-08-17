;buildInfoPackage: chisel3, version: 3.0.2, scalaVersion: 2.11.11, sbtVersion: 0.13.16, builtAtString: 2018-02-05 23:25:31.873, builtAtMillis: 1517873131873
circuit ALU : 
  module ALU : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip fSel : {addEnable : UInt<1>, accEnable : UInt<1>}, flip ipu : {innerProd : SInt<4>, bpWeight : SInt<4>, bpActvtn : SInt<4>}, flip rf : SInt<4>, out : SInt<4>}
    
    when UInt<1>("h00") : @[PE.scala 249:49]
      io.out <= io.ipu.innerProd @[PE.scala 250:16]
      skip @[PE.scala 249:49]
    else : @[PE.scala 251:56]
      when io.fSel.addEnable : @[PE.scala 251:56]
        node _T_7 = add(io.ipu.bpWeight, io.ipu.bpActvtn) @[PE.scala 252:50]
        node _T_8 = tail(_T_7, 1) @[PE.scala 252:50]
        node _T_9 = asSInt(_T_8) @[PE.scala 252:50]
        io.out <= _T_9 @[PE.scala 252:16]
        skip @[PE.scala 251:56]
      else : @[PE.scala 253:56]
        when UInt<1>("h00") : @[PE.scala 253:56]
          node _T_11 = gt(io.ipu.bpWeight, io.ipu.bpActvtn) @[PE.scala 254:46]
          when _T_11 : @[PE.scala 254:80]
            io.out <= io.ipu.bpWeight @[PE.scala 255:20]
            skip @[PE.scala 254:80]
          else : @[PE.scala 256:22]
            io.out <= io.ipu.bpActvtn @[PE.scala 257:20]
            skip @[PE.scala 256:22]
          skip @[PE.scala 253:56]
        else : @[PE.scala 259:56]
          when io.fSel.accEnable : @[PE.scala 259:56]
            node _T_12 = add(io.ipu.innerProd, io.rf) @[PE.scala 260:36]
            node _T_13 = tail(_T_12, 1) @[PE.scala 260:36]
            node _T_14 = asSInt(_T_13) @[PE.scala 260:36]
            io.out <= _T_14 @[PE.scala 260:16]
            skip @[PE.scala 259:56]
          else : @[PE.scala 261:18]
            io.out <= asSInt(UInt<1>("h00")) @[PE.scala 262:16]
            skip @[PE.scala 261:18]
    
