/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : M-2016.12-SP5-4
// Date      : Wed Aug 15 10:20:29 2018
/////////////////////////////////////////////////////////////


module IPUPMult ( io_weightVec_0, io_actvtnVec_0, io_pairwiseProd_0 );
  input [3:0] io_weightVec_0;
  input [3:0] io_actvtnVec_0;
  output [3:0] io_pairwiseProd_0;
  wire   n29, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28;

  OR2X1 U1 ( .A(n6), .B(n7), .Y(n18) );
  BUFX2 U2 ( .A(n29), .Y(io_pairwiseProd_0[1]) );
  INVX1 U3 ( .A(n25), .Y(n2) );
  AND2X1 U4 ( .A(io_weightVec_0[3]), .B(io_actvtnVec_0[0]), .Y(n25) );
  INVX1 U5 ( .A(n21), .Y(n3) );
  AND2X1 U6 ( .A(io_actvtnVec_0[2]), .B(io_weightVec_0[1]), .Y(n21) );
  AND2X1 U7 ( .A(io_weightVec_0[1]), .B(io_actvtnVec_0[1]), .Y(n16) );
  INVX1 U8 ( .A(n16), .Y(n4) );
  BUFX2 U9 ( .A(n19), .Y(n5) );
  INVX1 U10 ( .A(n14), .Y(n6) );
  AND2X1 U11 ( .A(io_weightVec_0[1]), .B(io_actvtnVec_0[0]), .Y(n14) );
  INVX1 U12 ( .A(n13), .Y(n7) );
  AND2X1 U13 ( .A(io_weightVec_0[0]), .B(io_actvtnVec_0[1]), .Y(n13) );
  AND2X1 U14 ( .A(io_weightVec_0[0]), .B(io_actvtnVec_0[2]), .Y(n17) );
  INVX1 U15 ( .A(n17), .Y(n8) );
  AND2X1 U16 ( .A(io_weightVec_0[2]), .B(io_actvtnVec_0[1]), .Y(n24) );
  INVX1 U17 ( .A(n24), .Y(n9) );
  AND2X1 U18 ( .A(io_weightVec_0[0]), .B(io_actvtnVec_0[3]), .Y(n23) );
  INVX1 U19 ( .A(n23), .Y(n10) );
  INVX1 U20 ( .A(n18), .Y(n11) );
  BUFX2 U21 ( .A(n27), .Y(n12) );
  AOI21X1 U22 ( .A(n6), .B(n7), .C(n11), .Y(n29) );
  AND2X1 U23 ( .A(io_weightVec_0[0]), .B(io_actvtnVec_0[0]), .Y(
        io_pairwiseProd_0[0]) );
  AND2X1 U24 ( .A(io_weightVec_0[2]), .B(io_actvtnVec_0[0]), .Y(n20) );
  NAND3X1 U25 ( .A(io_weightVec_0[0]), .B(io_actvtnVec_0[2]), .C(n16), .Y(n27)
         );
  INVX1 U26 ( .A(n12), .Y(n15) );
  AOI21X1 U27 ( .A(n8), .B(n4), .C(n15), .Y(n19) );
  FAX1 U28 ( .A(n20), .B(n5), .C(n11), .YC(n22), .YS(io_pairwiseProd_0[2]) );
  FAX1 U29 ( .A(n10), .B(n22), .C(n3), .YC(), .YS(n28) );
  XNOR2X1 U30 ( .A(n2), .B(n9), .Y(n26) );
  FAX1 U31 ( .A(n28), .B(n12), .C(n26), .YC(), .YS(io_pairwiseProd_0[3]) );
endmodule


module IPUSumTree ( io_inVec_0, io_sum );
  input [3:0] io_inVec_0;
  output [3:0] io_sum;


  BUFX2 U1 ( .A(io_inVec_0[3]), .Y(io_sum[3]) );
  BUFX2 U2 ( .A(io_inVec_0[2]), .Y(io_sum[2]) );
  BUFX2 U3 ( .A(io_inVec_0[1]), .Y(io_sum[1]) );
  BUFX2 U4 ( .A(io_inVec_0[0]), .Y(io_sum[0]) );
endmodule


module IPU ( clock, reset, io_weightIn_0, io_actvtnIn_0, io_out_innerProd );
  input [3:0] io_weightIn_0;
  input [3:0] io_actvtnIn_0;
  output [3:0] io_out_innerProd;
  input clock, reset;

  wire   [3:0] IPUPMult_io_pairwiseProd_0;

  IPUPMult IPUPMult ( .io_weightVec_0(io_weightIn_0), .io_actvtnVec_0(
        io_actvtnIn_0), .io_pairwiseProd_0(IPUPMult_io_pairwiseProd_0) );
  IPUSumTree IPUSumTree ( .io_inVec_0(IPUPMult_io_pairwiseProd_0), .io_sum(
        io_out_innerProd) );
endmodule

