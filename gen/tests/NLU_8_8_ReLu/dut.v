module NLU( // @[:NLU.fir@3.2]
  input        clock, // @[:NLU.fir@4.4]
  input        reset, // @[:NLU.fir@5.4]
  input        io_fSel_reluEnable, // @[:NLU.fir@6.4]
  input  [7:0] io_in, // @[:NLU.fir@6.4]
  output [7:0] io_out // @[:NLU.fir@6.4]
);
  wire  _T_7; // @[PE.scala 299:26:NLU.fir@13.8]
  wire [7:0] _GEN_0; // @[PE.scala 299:33:NLU.fir@14.8]
  assign _T_7 = $signed(io_in) > $signed(8'sh0); // @[PE.scala 299:26:NLU.fir@13.8]
  assign _GEN_0 = _T_7 ? $signed(io_in) : $signed(8'sh0); // @[PE.scala 299:33:NLU.fir@14.8]
  assign io_out = io_fSel_reluEnable ? $signed(_GEN_0) : $signed(8'sh0);
endmodule
