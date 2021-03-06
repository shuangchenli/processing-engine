module ALU( // @[:ALU.fir@3.2]
  input        clock, // @[:ALU.fir@4.4]
  input        reset, // @[:ALU.fir@5.4]
  input        io_fSel_addEnable, // @[:ALU.fir@6.4]
  input        io_fSel_accEnable, // @[:ALU.fir@6.4]
  input  [3:0] io_ipu_innerProd, // @[:ALU.fir@6.4]
  input  [3:0] io_ipu_bpWeight, // @[:ALU.fir@6.4]
  input  [3:0] io_ipu_bpActvtn, // @[:ALU.fir@6.4]
  input  [3:0] io_rf, // @[:ALU.fir@6.4]
  output [3:0] io_out // @[:ALU.fir@6.4]
);
  wire [3:0] _T_8; // @[PE.scala 252:50:ALU.fir@14.8]
  wire [3:0] _T_9; // @[PE.scala 252:50:ALU.fir@15.8]
  wire [3:0] _T_13; // @[PE.scala 260:36:ALU.fir@31.12]
  wire [3:0] _T_14; // @[PE.scala 260:36:ALU.fir@32.12]
  wire [3:0] _GEN_1; // @[PE.scala 259:56:ALU.fir@29.10]
  assign _T_8 = $signed(io_ipu_bpWeight) + $signed(io_ipu_bpActvtn); // @[PE.scala 252:50:ALU.fir@14.8]
  assign _T_9 = $signed(_T_8); // @[PE.scala 252:50:ALU.fir@15.8]
  assign _T_13 = $signed(io_ipu_innerProd) + $signed(io_rf); // @[PE.scala 260:36:ALU.fir@31.12]
  assign _T_14 = $signed(_T_13); // @[PE.scala 260:36:ALU.fir@32.12]
  assign _GEN_1 = io_fSel_accEnable ? $signed(_T_14) : $signed(4'sh0); // @[PE.scala 259:56:ALU.fir@29.10]
  assign io_out = io_fSel_addEnable ? $signed(_T_9) : $signed(_GEN_1);
endmodule
