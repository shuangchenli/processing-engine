/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : M-2016.12-SP5-4
// Date      : Wed Aug 15 10:21:25 2018
/////////////////////////////////////////////////////////////


module NLU ( clock, reset, io_fSel_reluEnable, io_in, io_out );
  input [7:0] io_in;
  output [7:0] io_out;
  input clock, reset, io_fSel_reluEnable;
  wire   n10, n11;

  INVX1 U18 ( .A(io_in[7]), .Y(n10) );
  AND2X1 U19 ( .A(io_fSel_reluEnable), .B(n10), .Y(n11) );
  AND2X1 U20 ( .A(n11), .B(io_in[0]), .Y(io_out[0]) );
  AND2X1 U21 ( .A(n11), .B(io_in[1]), .Y(io_out[1]) );
  AND2X1 U22 ( .A(n11), .B(io_in[2]), .Y(io_out[2]) );
  AND2X1 U23 ( .A(n11), .B(io_in[3]), .Y(io_out[3]) );
  AND2X1 U24 ( .A(n11), .B(io_in[4]), .Y(io_out[4]) );
  AND2X1 U25 ( .A(n11), .B(io_in[5]), .Y(io_out[5]) );
  AND2X1 U26 ( .A(n11), .B(io_in[6]), .Y(io_out[6]) );
  INVX1 U15 ( .A(1'b1), .Y(io_out[7]) );
endmodule

