/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : M-2016.12-SP5-4
// Date      : Wed Aug 15 10:24:08 2018
/////////////////////////////////////////////////////////////


module ALU ( clock, reset, io_fSel_addEnable, io_fSel_accEnable, 
        io_ipu_innerProd, io_ipu_bpWeight, io_ipu_bpActvtn, io_rf, io_out );
  input [3:0] io_ipu_innerProd;
  input [3:0] io_ipu_bpWeight;
  input [3:0] io_ipu_bpActvtn;
  input [3:0] io_rf;
  output [3:0] io_out;
  input clock, reset, io_fSel_addEnable, io_fSel_accEnable;
  wire   n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62;

  AND2X1 U25 ( .A(n46), .B(n25), .Y(n52) );
  AND2X1 U26 ( .A(n48), .B(n26), .Y(n55) );
  AND2X1 U27 ( .A(n33), .B(n56), .Y(n34) );
  BUFX2 U28 ( .A(n51), .Y(n24) );
  INVX1 U29 ( .A(n45), .Y(n25) );
  AND2X1 U30 ( .A(io_ipu_bpActvtn[1]), .B(io_ipu_bpWeight[1]), .Y(n45) );
  INVX1 U31 ( .A(n47), .Y(n26) );
  AND2X1 U32 ( .A(io_rf[1]), .B(io_ipu_innerProd[1]), .Y(n47) );
  BUFX2 U33 ( .A(n41), .Y(n27) );
  BUFX2 U34 ( .A(n57), .Y(n28) );
  INVX1 U35 ( .A(n55), .Y(n29) );
  INVX1 U36 ( .A(n52), .Y(n30) );
  AND2X1 U37 ( .A(io_ipu_bpWeight[0]), .B(io_ipu_bpActvtn[0]), .Y(n39) );
  INVX1 U38 ( .A(n39), .Y(n31) );
  AND2X1 U39 ( .A(io_fSel_accEnable), .B(n62), .Y(n56) );
  INVX1 U40 ( .A(n56), .Y(n32) );
  AND2X1 U41 ( .A(io_ipu_innerProd[0]), .B(io_rf[0]), .Y(n40) );
  INVX1 U42 ( .A(n40), .Y(n33) );
  OAI21X1 U43 ( .A(io_ipu_bpWeight[0]), .B(io_ipu_bpActvtn[0]), .C(
        io_fSel_addEnable), .Y(n36) );
  INVX1 U44 ( .A(io_fSel_addEnable), .Y(n62) );
  OAI21X1 U45 ( .A(io_ipu_innerProd[0]), .B(io_rf[0]), .C(n34), .Y(n35) );
  OAI21X1 U46 ( .A(n39), .B(n36), .C(n35), .Y(io_out[0]) );
  INVX1 U47 ( .A(io_ipu_bpWeight[1]), .Y(n37) );
  MUX2X1 U48 ( .B(n37), .A(io_ipu_bpWeight[1]), .S(io_ipu_bpActvtn[1]), .Y(n38) );
  MUX2X1 U49 ( .B(n39), .A(n31), .S(n38), .Y(n44) );
  MUX2X1 U50 ( .B(n33), .A(n40), .S(io_ipu_innerProd[1]), .Y(n42) );
  AOI21X1 U51 ( .A(io_rf[1]), .B(n42), .C(n32), .Y(n41) );
  OAI21X1 U52 ( .A(io_rf[1]), .B(n42), .C(n27), .Y(n43) );
  OAI21X1 U53 ( .A(n62), .B(n44), .C(n43), .Y(io_out[1]) );
  OAI21X1 U54 ( .A(io_ipu_bpActvtn[1]), .B(io_ipu_bpWeight[1]), .C(n39), .Y(
        n46) );
  OAI21X1 U55 ( .A(io_rf[1]), .B(io_ipu_innerProd[1]), .C(n40), .Y(n48) );
  AOI22X1 U56 ( .A(io_fSel_addEnable), .B(n50), .C(n56), .D(n49), .Y(n51) );
  INVX1 U57 ( .A(n24), .Y(io_out[2]) );
  FAX1 U58 ( .A(io_ipu_bpActvtn[2]), .B(io_ipu_bpWeight[2]), .C(n30), .YC(n53), 
        .YS(n50) );
  XNOR2X1 U59 ( .A(n53), .B(io_ipu_bpWeight[3]), .Y(n54) );
  HAX1 U60 ( .A(n54), .B(io_ipu_bpActvtn[3]), .YC(), .YS(n61) );
  FAX1 U61 ( .A(io_rf[2]), .B(io_ipu_innerProd[2]), .C(n29), .YC(n59), .YS(n49) );
  HAX1 U62 ( .A(io_rf[3]), .B(io_ipu_innerProd[3]), .YC(), .YS(n58) );
  AOI21X1 U63 ( .A(n59), .B(n58), .C(n32), .Y(n57) );
  OAI21X1 U64 ( .A(n59), .B(n58), .C(n28), .Y(n60) );
  OAI21X1 U65 ( .A(n62), .B(n61), .C(n60), .Y(io_out[3]) );
endmodule

