circuit IPU : @[:@2.0]
  module IPUPMult : @[:@3.2]
    input clock : Clock @[:@4.4]
    input reset : UInt<1> @[:@5.4]
    input io_weightVec_0 : SInt<4> @[:@6.4]
    input io_actvtnVec_0 : SInt<4> @[:@6.4]
    output io_pairwiseProd_0 : SInt<4> @[:@6.4]
  
    node _T_20 = mul(io_weightVec_0, io_actvtnVec_0) @[PE.scala 173:82:@8.4]
    io_pairwiseProd_0 <= asSInt(bits(_T_20, 3, 0))

  module IPUSumTree : @[:@11.2]
    input clock : Clock @[:@12.4]
    input reset : UInt<1> @[:@13.4]
    input io_inVec_0 : SInt<4> @[:@14.4]
    output io_sum : SInt<4> @[:@14.4]
  
    io_sum <= io_inVec_0

  module IPU : @[:@18.2]
    input clock : Clock @[:@19.4]
    input reset : UInt<1> @[:@20.4]
    input io_weightIn_0 : SInt<4> @[:@21.4]
    input io_actvtnIn_0 : SInt<4> @[:@21.4]
    output io_out_innerProd : SInt<4> @[:@21.4]
  
    inst IPUPMult of IPUPMult @[PE.scala 198:31:@23.4]
    inst IPUSumTree of IPUSumTree @[PE.scala 202:33:@28.4]
    io_out_innerProd <= IPUSumTree.io_sum
    IPUPMult.clock <= clock
    IPUPMult.reset <= reset
    IPUPMult.io_weightVec_0 <= io_weightIn_0
    IPUPMult.io_actvtnVec_0 <= io_actvtnIn_0
    IPUSumTree.clock <= clock
    IPUSumTree.reset <= reset
    IPUSumTree.io_inVec_0 <= IPUPMult.io_pairwiseProd_0
