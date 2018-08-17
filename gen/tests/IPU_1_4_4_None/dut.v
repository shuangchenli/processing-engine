module IPUPMult( // @[:IPU.fir@3.2]
  input  [3:0] io_weightVec_0, // @[:IPU.fir@6.4]
  input  [3:0] io_actvtnVec_0, // @[:IPU.fir@6.4]
  output [3:0] io_pairwiseProd_0 // @[:IPU.fir@6.4]
);
  wire [7:0] _T_20; // @[PE.scala 173:82:IPU.fir@8.4]
  wire [3:0] _GEN_0;
  assign _T_20 = $signed(io_weightVec_0) * $signed(io_actvtnVec_0); // @[PE.scala 173:82:IPU.fir@8.4]
  assign _GEN_0 = _T_20[3:0];
  assign io_pairwiseProd_0 = $signed(_GEN_0);
endmodule
module IPUSumTree( // @[:IPU.fir@11.2]
  input  [3:0] io_inVec_0, // @[:IPU.fir@14.4]
  output [3:0] io_sum // @[:IPU.fir@14.4]
);
  assign io_sum = io_inVec_0;
endmodule
module IPU( // @[:IPU.fir@18.2]
  input        clock, // @[:IPU.fir@19.4]
  input        reset, // @[:IPU.fir@20.4]
  input  [3:0] io_weightIn_0, // @[:IPU.fir@21.4]
  input  [3:0] io_actvtnIn_0, // @[:IPU.fir@21.4]
  output [3:0] io_out_innerProd // @[:IPU.fir@21.4]
);
  wire [3:0] IPUPMult_io_weightVec_0; // @[PE.scala 198:31:IPU.fir@23.4]
  wire [3:0] IPUPMult_io_actvtnVec_0; // @[PE.scala 198:31:IPU.fir@23.4]
  wire [3:0] IPUPMult_io_pairwiseProd_0; // @[PE.scala 198:31:IPU.fir@23.4]
  wire [3:0] IPUSumTree_io_inVec_0; // @[PE.scala 202:33:IPU.fir@28.4]
  wire [3:0] IPUSumTree_io_sum; // @[PE.scala 202:33:IPU.fir@28.4]
  IPUPMult IPUPMult ( // @[PE.scala 198:31:IPU.fir@23.4]
    .io_weightVec_0(IPUPMult_io_weightVec_0),
    .io_actvtnVec_0(IPUPMult_io_actvtnVec_0),
    .io_pairwiseProd_0(IPUPMult_io_pairwiseProd_0)
  );
  IPUSumTree IPUSumTree ( // @[PE.scala 202:33:IPU.fir@28.4]
    .io_inVec_0(IPUSumTree_io_inVec_0),
    .io_sum(IPUSumTree_io_sum)
  );
  assign io_out_innerProd = IPUSumTree_io_sum;
  assign IPUPMult_io_weightVec_0 = io_weightIn_0;
  assign IPUPMult_io_actvtnVec_0 = io_actvtnIn_0;
  assign IPUSumTree_io_inVec_0 = IPUPMult_io_pairwiseProd_0;
endmodule
