;buildInfoPackage: chisel3, version: 3.0.2, scalaVersion: 2.11.11, sbtVersion: 0.13.16, builtAtString: 2018-02-05 23:25:31.873, builtAtMillis: 1517873131873
circuit IPU : 
  module IPUPMult : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip weightVec : SInt<4>[1], flip actvtnVec : SInt<4>[1], pairwiseProd : SInt<4>[1]}
    
    node _T_20 = mul(io.weightVec[0], io.actvtnVec[0]) @[PE.scala 173:82]
    io.pairwiseProd[0] <= _T_20 @[PE.scala 173:25]
    
  module IPUSumTree : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inVec : SInt<4>[1], sum : SInt<4>}
    
    io.sum <= io.inVec[0] @[PE.scala 195:16]
    
  module IPU : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip weightIn : SInt<4>[1], flip actvtnIn : SInt<4>[1], out : {innerProd : SInt<4>}}
    
    inst IPUPMult of IPUPMult @[PE.scala 198:31]
    IPUPMult.clock <= clock
    IPUPMult.reset <= reset
    IPUPMult.io.weightVec[0] <= io.weightIn[0] @[PE.scala 199:24]
    IPUPMult.io.actvtnVec[0] <= io.actvtnIn[0] @[PE.scala 200:24]
    inst IPUSumTree of IPUSumTree @[PE.scala 202:33]
    IPUSumTree.clock <= clock
    IPUSumTree.reset <= reset
    IPUSumTree.io.inVec[0] <= IPUPMult.io.pairwiseProd[0] @[PE.scala 203:22]
    io.out.innerProd <= IPUSumTree.io.sum @[PE.scala 205:22]
    
