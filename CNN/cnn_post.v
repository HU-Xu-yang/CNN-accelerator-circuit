
module ctrl ( pixel_cnt_en, addr_cal_en, pool_en, load, conv_en, read, write, 
        clk, rst, c_p, col, row );
  output [3:0] load;
  input [3:0] col;
  input [3:0] row;
  input clk, rst, c_p;
  output pixel_cnt_en, addr_cal_en, pool_en, conv_en, read, write;
  wire   N10, N11, N12, N13, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n1, n2, n3, n5, n6, n7, n8, n9, n10;
  wire   [3:0] c_s;

  DFFQX0P5MA10TR \c_s_reg[0]  ( .D(N10), .CK(clk), .Q(c_s[0]) );
  DFFQX1MA10TR \c_s_reg[1]  ( .D(N11), .CK(clk), .Q(c_s[1]) );
  DFFQX0P5MA10TR \c_s_reg[3]  ( .D(N13), .CK(clk), .Q(c_s[3]) );
  DFFQX0P5MA10TR \c_s_reg[2]  ( .D(N12), .CK(clk), .Q(c_s[2]) );
  NOR2X1AA10TR U3 ( .A(n13), .B(n15), .Y(load[2]) );
  NOR2X1AA10TR U4 ( .A(n15), .B(n11), .Y(write) );
  NOR3X1MA10TR U5 ( .A(n12), .B(c_s[1]), .C(n7), .Y(load[1]) );
  INVX1MA10TR U6 ( .A(n12), .Y(n2) );
  INVX1MA10TR U7 ( .A(n15), .Y(n5) );
  AND3X1MA10TR U8 ( .A(n5), .B(n11), .C(n14), .Y(pixel_cnt_en) );
  INVX1MA10TR U9 ( .A(n16), .Y(load[0]) );
  NAND2X1BA10TR U10 ( .A(n3), .B(n9), .Y(n12) );
  NOR2X1AA10TR U11 ( .A(n12), .B(n13), .Y(load[3]) );
  OR2X1MA10TR U12 ( .A(read), .B(write), .Y(addr_cal_en) );
  NAND2X1BA10TR U13 ( .A(c_s[1]), .B(c_s[2]), .Y(n11) );
  NAND2X1BA10TR U14 ( .A(c_s[1]), .B(n7), .Y(n13) );
  NAND2X1BA10TR U15 ( .A(c_s[0]), .B(n9), .Y(n15) );
  INVX1MA10TR U16 ( .A(c_p), .Y(n1) );
  NAND3X1AA10TR U17 ( .A(col[0]), .B(n3), .C(row[0]), .Y(n19) );
  INVX1MA10TR U18 ( .A(c_s[2]), .Y(n7) );
  NOR3X1AA10TR U19 ( .A(n1), .B(rst), .C(n16), .Y(N13) );
  INVX1MA10TR U20 ( .A(c_s[3]), .Y(n9) );
  OA21X1MA10TR U21 ( .A0(c_s[1]), .A1(n7), .B0(n13), .Y(n14) );
  AOI31X1MA10TR U22 ( .A0(n17), .A1(n6), .A2(n18), .B0(rst), .Y(N12) );
  INVX1MA10TR U23 ( .A(load[2]), .Y(n6) );
  AOI22X1MA10TR U24 ( .A0(n2), .A1(c_s[2]), .B0(load[0]), .B1(n1), .Y(n18) );
  NAND4BX1MA10TR U25 ( .AN(n19), .B(c_s[3]), .C(n10), .D(n7), .Y(n17) );
  NOR2X1AA10TR U26 ( .A(rst), .B(n20), .Y(N11) );
  AOI221X1MA10TR U27 ( .A0(load[0]), .A1(n1), .B0(n2), .B1(c_s[1]), .C0(n21), 
        .Y(n20) );
  AOI211X1MA10TR U28 ( .A0(c_s[3]), .A1(n19), .B0(c_s[2]), .C0(c_s[1]), .Y(n21) );
  INVX1MA10TR U29 ( .A(c_s[0]), .Y(n3) );
  NAND3X1AA10TR U30 ( .A(c_s[2]), .B(n10), .C(n5), .Y(n16) );
  NOR2X1AA10TR U31 ( .A(n14), .B(c_s[3]), .Y(read) );
  INVX1MA10TR U32 ( .A(c_s[1]), .Y(n10) );
  AND4X0P7MA10TR U33 ( .A(c_s[3]), .B(n14), .C(n11), .D(n3), .Y(pool_en) );
  NOR2X1AA10TR U34 ( .A(n11), .B(n12), .Y(conv_en) );
  NOR2X1AA10TR U35 ( .A(rst), .B(n22), .Y(N10) );
  AOI221X1MA10TR U36 ( .A0(read), .A1(n3), .B0(n8), .B1(n9), .C0(pool_en), .Y(
        n22) );
  INVX1MA10TR U37 ( .A(n11), .Y(n8) );
endmodule


module pixel_cnt ( en, clk, rst, pixel, conv_pool, row_cnt, col_cnt );
  output [6:0] pixel;
  output [3:0] row_cnt;
  output [3:0] col_cnt;
  input en, clk, rst;
  output conv_pool;
  wire   N32, N33, N34, N57, n7, n9, n10, n12, n13, n14, n16, n18, n20, n22,
         n23, n24, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, N43,
         N42, N41, \add_60/carry[6] , \add_60/carry[5] , \add_60/carry[4] ,
         \add_60/A[3] , n1, n2, n3, n4, n5, n6, n8, n11, n15, n17, n19, n21,
         n25, n37, n38, n39;
  assign col_cnt[2] = pixel[2];
  assign col_cnt[1] = pixel[1];
  assign col_cnt[0] = pixel[0];

  DFFNQX1MA10TR \row_cnt_reg[3]  ( .D(n33), .CKN(clk), .Q(row_cnt[3]) );
  DFFNQX1MA10TR conv_pool_reg ( .D(n32), .CKN(clk), .Q(conv_pool) );
  DFFNQX1MA10TR \row_cnt_reg[0]  ( .D(n36), .CKN(clk), .Q(row_cnt[0]) );
  DFFNQX1MA10TR \row_cnt_reg[2]  ( .D(n34), .CKN(clk), .Q(row_cnt[2]) );
  DFFNQX1MA10TR \col_cnt_reg[0]  ( .D(n28), .CKN(clk), .Q(pixel[0]) );
  DFFNQX1MA10TR \row_cnt_reg[1]  ( .D(n35), .CKN(clk), .Q(row_cnt[1]) );
  DFFNQX1MA10TR \col_cnt_reg[2]  ( .D(n30), .CKN(clk), .Q(pixel[2]) );
  DFFNQX1MA10TR \col_cnt_reg[1]  ( .D(n29), .CKN(clk), .Q(pixel[1]) );
  DFFNQX1MA10TR \col_cnt_reg[3]  ( .D(n31), .CKN(clk), .Q(col_cnt[3]) );
  AND2X1MA10TR U3 ( .A(N57), .B(col_cnt[3]), .Y(n1) );
  INVX1MA10TR U4 ( .A(n7), .Y(n21) );
  OAI21X1MA10TR U5 ( .A0(n7), .A1(n13), .B0(n18), .Y(n20) );
  OAI22X1MA10TR U6 ( .A0(n11), .A1(n20), .B0(n18), .B1(n22), .Y(n35) );
  NAND2X1BA10TR U7 ( .A(n13), .B(n11), .Y(n22) );
  OAI22X1MA10TR U8 ( .A0(n14), .A1(n17), .B0(n16), .B1(n15), .Y(n33) );
  NAND2X1BA10TR U9 ( .A(n2), .B(n3), .Y(n39) );
  AND3X1MA10TR U10 ( .A(en), .B(n8), .C(n13), .Y(N57) );
  INVX1MA10TR U11 ( .A(n3), .Y(n5) );
  XNOR2X1MA10TR U12 ( .A(row_cnt[2]), .B(n37), .Y(N42) );
  NAND2BX1MA10TR U13 ( .AN(row_cnt[1]), .B(\add_60/A[3] ), .Y(n37) );
  INVX1MA10TR U14 ( .A(row_cnt[0]), .Y(\add_60/A[3] ) );
  XOR2X1MA10TR U15 ( .A(row_cnt[3]), .B(n25), .Y(N43) );
  AO1B2X1MA10TR U16 ( .B0(row_cnt[0]), .B1(row_cnt[1]), .A0N(n37), .Y(N41) );
  NOR2X1AA10TR U17 ( .A(row_cnt[2]), .B(n37), .Y(n25) );
  NOR2X2AA10TR U18 ( .A(en), .B(rst), .Y(n7) );
  NAND3X1AA10TR U19 ( .A(col_cnt[3]), .B(n21), .C(row_cnt[0]), .Y(n18) );
  NAND3BX1MA10TR U20 ( .AN(n18), .B(n13), .C(row_cnt[1]), .Y(n16) );
  AND2X1MA10TR U21 ( .A(pixel[1]), .B(N57), .Y(n2) );
  AND2X1MA10TR U22 ( .A(pixel[0]), .B(N57), .Y(n3) );
  AND2X1MA10TR U23 ( .A(pixel[2]), .B(N57), .Y(n4) );
  OAI22X1MA10TR U24 ( .A0(n14), .A1(n15), .B0(row_cnt[2]), .B1(n16), .Y(n34)
         );
  OAI21X1MA10TR U25 ( .A0(n7), .A1(n13), .B0(n23), .Y(n36) );
  XOR2X1MA10TR U26 ( .A(n24), .B(row_cnt[0]), .Y(n23) );
  NAND2X1BA10TR U27 ( .A(col_cnt[3]), .B(n21), .Y(n24) );
  OA21X1MA10TR U28 ( .A0(row_cnt[1]), .A1(n6), .B0(n20), .Y(n14) );
  INVX1MA10TR U29 ( .A(n13), .Y(n6) );
  AO22X1MA10TR U30 ( .A0(col_cnt[3]), .A1(n7), .B0(N34), .B1(n21), .Y(n31) );
  XOR2X1MA10TR U31 ( .A(n1), .B(n38), .Y(N34) );
  NOR2BX1MA10TR U32 ( .AN(n4), .B(n39), .Y(n38) );
  AO22X1MA10TR U33 ( .A0(pixel[1]), .A1(n7), .B0(N32), .B1(n21), .Y(n29) );
  XNOR2X1MA10TR U34 ( .A(n2), .B(n5), .Y(N32) );
  AO22X1MA10TR U35 ( .A0(pixel[2]), .A1(n7), .B0(N33), .B1(n21), .Y(n30) );
  XNOR2X1MA10TR U36 ( .A(n4), .B(n39), .Y(N33) );
  AO22X1MA10TR U37 ( .A0(pixel[0]), .A1(n7), .B0(n5), .B1(n21), .Y(n28) );
  NAND2X1BA10TR U38 ( .A(n9), .B(n10), .Y(n32) );
  OAI21X1MA10TR U39 ( .A0(n7), .A1(n13), .B0(conv_pool), .Y(n9) );
  NAND4BX1MA10TR U40 ( .AN(rst), .B(n19), .C(n12), .D(n21), .Y(n10) );
  INVX1MA10TR U41 ( .A(conv_pool), .Y(n19) );
  NOR2X2AA10TR U42 ( .A(rst), .B(n12), .Y(n13) );
  INVX1MA10TR U43 ( .A(row_cnt[1]), .Y(n11) );
  INVX1MA10TR U44 ( .A(row_cnt[2]), .Y(n15) );
  INVX1MA10TR U45 ( .A(col_cnt[3]), .Y(n8) );
  NOR2BX1MA10TR U46 ( .AN(n26), .B(n17), .Y(n12) );
  NAND4BX1MA10TR U47 ( .AN(row_cnt[0]), .B(n27), .C(n11), .D(n15), .Y(n26) );
  OR4X1MA10TR U48 ( .A(pixel[1]), .B(pixel[0]), .C(n8), .D(pixel[2]), .Y(n27)
         );
  INVX1MA10TR U49 ( .A(row_cnt[3]), .Y(n17) );
  XOR2X0P5MA10TR U50 ( .A(N43), .B(\add_60/carry[6] ), .Y(pixel[6]) );
  AND2X0P5MA10TR U51 ( .A(N42), .B(\add_60/carry[5] ), .Y(\add_60/carry[6] )
         );
  XOR2X0P5MA10TR U52 ( .A(N42), .B(\add_60/carry[5] ), .Y(pixel[5]) );
  AND2X0P5MA10TR U53 ( .A(N41), .B(\add_60/carry[4] ), .Y(\add_60/carry[5] )
         );
  XOR2X0P5MA10TR U54 ( .A(N41), .B(\add_60/carry[4] ), .Y(pixel[4]) );
  AND2X0P5MA10TR U55 ( .A(col_cnt[3]), .B(\add_60/A[3] ), .Y(\add_60/carry[4] ) );
  XOR2X0P5MA10TR U56 ( .A(col_cnt[3]), .B(\add_60/A[3] ), .Y(pixel[3]) );
endmodule


module Addr_cal_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1MA10TR U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1MA10TR U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1MA10TR U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1MA10TR U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(SUM[7]), .S(SUM[6]) );
  ADDHX1MA10TR U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1MA10TR U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  INVX1MA10TR U1 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module Addr_cal ( col, row, pixel, c_p, addr, load, write, en );
  input [3:0] col;
  input [3:0] row;
  input [6:0] pixel;
  output [7:0] addr;
  input [3:0] load;
  input c_p, write, en;
  wire   N16, N17, N18, N19, N20, N21, N22, N23, N28, N29, N30, N31, N33, N34,
         N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46, N47, N90,
         N91, N92, N93, N94, N95, N96, N97, N101, N102, N103, N104, N105, N107,
         N108, N109, N110, N111, N112, N113, N130, N131, N132, N133, N134,
         N135, N136, N137, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         N129, N128, N124, N123, N119, N118, N117, N116, N115, N114,
         \add_50/carry[2] , \add_50/carry[3] , \add_50/carry[4] ,
         \add_50/carry[5] , \add_50/carry[6] , \add_48/carry[6] ,
         \add_48/carry[5] , \add_46/carry[2] , \add_46/carry[3] ,
         \add_46/carry[4] , \add_46/carry[5] , \add_46/carry[6] ,
         \add_31/carry[2] , \add_31/carry[3] , \add_31/carry[4] ,
         \add_31/carry[5] , \add_31/carry[6] , \add_29/carry[6] ,
         \add_29/carry[5] , \add_0_root_add_0_root_add_52_2/carry[4] ,
         \add_0_root_add_0_root_add_52_2/carry[5] ,
         \add_0_root_add_0_root_add_52_2/carry[6] ,
         \add_0_root_add_0_root_add_52_2/carry[7] ,
         \add_0_root_add_0_root_add_52_2/carry[3] ,
         \add_0_root_add_0_root_add_52_2/carry[2] ,
         \add_0_root_add_0_root_add_52_2/carry[1] ,
         \sub_2_root_add_0_root_add_52_2/carry[2] ,
         \add_1_root_add_0_root_add_52_2/carry[4] ,
         \add_1_root_add_0_root_add_52_2/carry[3] , n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;
  assign N40 = pixel[0];
  assign N41 = pixel[1];
  assign N42 = pixel[2];
  assign N43 = pixel[3];
  assign N44 = pixel[4];
  assign N45 = pixel[5];
  assign N47 = pixel[6];
  assign N115 = col[1];
  assign N114 = col[0];

  Addr_cal_DW01_inc_0 add_27 ( .A({1'b0, n9, n8, n7, n6, n5, n4, n3}), .SUM({
        N23, N22, N21, N20, N19, N18, N17, N16}) );
  ADDFX1MA10TR \add_0_root_add_0_root_add_52_2/U1_5  ( .A(N128), .B(N119), 
        .CI(\add_0_root_add_0_root_add_52_2/carry[5] ), .CO(
        \add_0_root_add_0_root_add_52_2/carry[6] ), .S(N135) );
  ADDFX1MA10TR \add_0_root_add_0_root_add_52_2/U1_4  ( .A(N128), .B(N118), 
        .CI(\add_0_root_add_0_root_add_52_2/carry[4] ), .CO(
        \add_0_root_add_0_root_add_52_2/carry[5] ), .S(N134) );
  ADDFX1MA10TR \add_0_root_add_0_root_add_52_2/U1_3  ( .A(N128), .B(N117), 
        .CI(\add_0_root_add_0_root_add_52_2/carry[3] ), .CO(
        \add_0_root_add_0_root_add_52_2/carry[4] ), .S(N133) );
  ADDFX1MA10TR \add_0_root_add_0_root_add_52_2/U1_1  ( .A(N123), .B(N115), 
        .CI(\add_0_root_add_0_root_add_52_2/carry[1] ), .CO(
        \add_0_root_add_0_root_add_52_2/carry[2] ), .S(N131) );
  ADDFX1MA10TR \add_0_root_add_0_root_add_52_2/U1_2  ( .A(N124), .B(N116), 
        .CI(\add_0_root_add_0_root_add_52_2/carry[2] ), .CO(
        \add_0_root_add_0_root_add_52_2/carry[3] ), .S(N132) );
  ADDFX1MA10TR \add_1_root_add_0_root_add_52_2/U1_3  ( .A(col[3]), .B(row[2]), 
        .CI(\add_1_root_add_0_root_add_52_2/carry[3] ), .CO(
        \add_1_root_add_0_root_add_52_2/carry[4] ), .S(N117) );
  BUFX1BA10TR U3 ( .A(N41), .Y(n4) );
  BUFX1BA10TR U4 ( .A(N42), .Y(n5) );
  NOR2BX2MA10TR U5 ( .AN(en), .B(c_p), .Y(n56) );
  INVX1MA10TR U6 ( .A(n109), .Y(n18) );
  INVX1MA10TR U7 ( .A(n102), .Y(n20) );
  BUFX1BA10TR U8 ( .A(n17), .Y(n2) );
  AOI22X1MA10TR U9 ( .A0(N95), .A1(n2), .B0(N103), .B1(n1), .Y(n68) );
  AOI22X1MA10TR U10 ( .A0(N21), .A1(n2), .B0(N29), .B1(n16), .Y(n66) );
  AOI22X1MA10TR U11 ( .A0(N36), .A1(n53), .B0(n7), .B1(n20), .Y(n72) );
  AOI22X1MA10TR U12 ( .A0(N37), .A1(n53), .B0(n8), .B1(n20), .Y(n65) );
  INVX1MA10TR U13 ( .A(N129), .Y(N128) );
  NAND4BX1MA10TR U14 ( .AN(load[2]), .B(write), .C(n108), .D(n19), .Y(n109) );
  NOR2X1AA10TR U15 ( .A(write), .B(load[2]), .Y(n106) );
  INVX1MA10TR U16 ( .A(load[3]), .Y(n19) );
  NAND3X1AA10TR U18 ( .A(n106), .B(n108), .C(load[3]), .Y(n102) );
  BUFX1BA10TR U19 ( .A(n16), .Y(n1) );
  BUFX1BA10TR U20 ( .A(n53), .Y(n10) );
  INVX1MA10TR U21 ( .A(n107), .Y(n17) );
  NAND4BX1MA10TR U22 ( .AN(write), .B(load[2]), .C(n108), .D(n19), .Y(n107) );
  AOI22X1MA10TR U23 ( .A0(N22), .A1(n2), .B0(N30), .B1(n16), .Y(n59) );
  AOI22X1MA10TR U24 ( .A0(N94), .A1(n2), .B0(N102), .B1(n16), .Y(n75) );
  AOI22X1MA10TR U25 ( .A0(N113), .A1(n53), .B0(N137), .B1(n18), .Y(n51) );
  AOI22X1MA10TR U26 ( .A0(N110), .A1(n53), .B0(N134), .B1(n18), .Y(n74) );
  AOI22X1MA10TR U27 ( .A0(N111), .A1(n53), .B0(N135), .B1(n18), .Y(n67) );
  AOI22X1MA10TR U28 ( .A0(N38), .A1(n53), .B0(n9), .B1(n20), .Y(n58) );
  AO1B2X1MA10TR U29 ( .B0(n7), .B1(n50), .A0N(n69), .Y(addr[4]) );
  AOI22X1MA10TR U30 ( .A0(n15), .A1(n70), .B0(n56), .B1(n71), .Y(n69) );
  NAND2X1BA10TR U31 ( .A(n72), .B(n73), .Y(n71) );
  NAND2X1BA10TR U32 ( .A(n74), .B(n75), .Y(n70) );
  AO1B2X1MA10TR U33 ( .B0(n8), .B1(n50), .A0N(n62), .Y(addr[5]) );
  AOI22X1MA10TR U34 ( .A0(n15), .A1(n63), .B0(n56), .B1(n64), .Y(n62) );
  NAND2X1BA10TR U35 ( .A(n65), .B(n66), .Y(n64) );
  NAND2X1BA10TR U36 ( .A(n67), .B(n68), .Y(n63) );
  AO1B2X1MA10TR U37 ( .B0(N46), .B1(n50), .A0N(n54), .Y(addr[6]) );
  INVX1MA10TR U38 ( .A(n9), .Y(N46) );
  AOI22X1MA10TR U39 ( .A0(n15), .A1(n55), .B0(n56), .B1(n57), .Y(n54) );
  NAND2X1BA10TR U40 ( .A(n58), .B(n59), .Y(n57) );
  AOI22X1MA10TR U41 ( .A0(N97), .A1(n2), .B0(N105), .B1(n16), .Y(n52) );
  BUFX2MA10TR U42 ( .A(N44), .Y(n7) );
  BUFX2MA10TR U43 ( .A(N45), .Y(n8) );
  NAND2X1BA10TR U44 ( .A(n60), .B(n61), .Y(n55) );
  AOI22X1MA10TR U45 ( .A0(N96), .A1(n2), .B0(N104), .B1(n16), .Y(n61) );
  AOI22X1MA10TR U46 ( .A0(N112), .A1(n53), .B0(N136), .B1(n18), .Y(n60) );
  OAI211X1MA10TR U47 ( .A0(n47), .A1(n14), .B0(n48), .C0(n49), .Y(addr[7]) );
  NAND2X1BA10TR U48 ( .A(n9), .B(n50), .Y(n49) );
  AOI222X1MA10TR U49 ( .A0(N39), .A1(n10), .B0(N23), .B1(n2), .C0(N31), .C1(
        n16), .Y(n47) );
  AO1B2X1MA10TR U50 ( .B0(n51), .B1(n52), .A0N(n15), .Y(n48) );
  OAI22X2MA10TR U51 ( .A0(n109), .A1(n14), .B0(n110), .B1(n102), .Y(n50) );
  INVX1MA10TR U52 ( .A(n110), .Y(n15) );
  AOI22X1MA10TR U53 ( .A0(N20), .A1(n2), .B0(N28), .B1(n16), .Y(n73) );
  AOI22X1MA10TR U54 ( .A0(N108), .A1(n10), .B0(N132), .B1(n18), .Y(n88) );
  AOI22X1MA10TR U55 ( .A0(N34), .A1(n10), .B0(n5), .B1(n20), .Y(n86) );
  AOI22X1MA10TR U56 ( .A0(N92), .A1(n17), .B0(n5), .B1(n1), .Y(n89) );
  AOI22X1MA10TR U57 ( .A0(N93), .A1(n17), .B0(N101), .B1(n1), .Y(n82) );
  INVX1MA10TR U58 ( .A(n6), .Y(N101) );
  AOI22X1MA10TR U59 ( .A0(N107), .A1(n10), .B0(N131), .B1(n18), .Y(n95) );
  AOI22X1MA10TR U60 ( .A0(N33), .A1(n10), .B0(n4), .B1(n20), .Y(n93) );
  AOI22X1MA10TR U61 ( .A0(N91), .A1(n17), .B0(n4), .B1(n1), .Y(n96) );
  AOI22X1MA10TR U62 ( .A0(N109), .A1(n10), .B0(N133), .B1(n18), .Y(n81) );
  AOI22X1MA10TR U63 ( .A0(N35), .A1(n10), .B0(n6), .B1(n20), .Y(n79) );
  AO1B2X1MA10TR U64 ( .B0(n6), .B1(n50), .A0N(n76), .Y(addr[3]) );
  AOI22X1MA10TR U65 ( .A0(n15), .A1(n77), .B0(n56), .B1(n78), .Y(n76) );
  NAND2X1BA10TR U66 ( .A(n79), .B(n80), .Y(n78) );
  NAND2X1BA10TR U67 ( .A(n81), .B(n82), .Y(n77) );
  INVX1MA10TR U68 ( .A(n56), .Y(n14) );
  AOI22X1MA10TR U69 ( .A0(N90), .A1(n10), .B0(n3), .B1(n20), .Y(n100) );
  AOI22X1MA10TR U70 ( .A0(N90), .A1(n17), .B0(n3), .B1(n1), .Y(n104) );
  INVX1MA10TR U71 ( .A(n3), .Y(N90) );
  AOI22X1MA10TR U72 ( .A0(N16), .A1(n17), .B0(n3), .B1(n1), .Y(n101) );
  AOI22X1MA10TR U73 ( .A0(N17), .A1(n17), .B0(n4), .B1(n1), .Y(n94) );
  AOI22X1MA10TR U74 ( .A0(N18), .A1(n17), .B0(n5), .B1(n1), .Y(n87) );
  AOI22X1MA10TR U75 ( .A0(N19), .A1(n17), .B0(N101), .B1(n1), .Y(n80) );
  AO1B2X1MA10TR U76 ( .B0(n3), .B1(n50), .A0N(n97), .Y(addr[0]) );
  AOI22X1MA10TR U77 ( .A0(n15), .A1(n98), .B0(n56), .B1(n99), .Y(n97) );
  NAND2X1BA10TR U78 ( .A(n100), .B(n101), .Y(n99) );
  NAND2X1BA10TR U79 ( .A(n103), .B(n104), .Y(n98) );
  AO1B2X1MA10TR U80 ( .B0(n4), .B1(n50), .A0N(n90), .Y(addr[1]) );
  AOI22X1MA10TR U81 ( .A0(n15), .A1(n91), .B0(n56), .B1(n92), .Y(n90) );
  NAND2X1BA10TR U82 ( .A(n93), .B(n94), .Y(n92) );
  NAND2X1BA10TR U83 ( .A(n95), .B(n96), .Y(n91) );
  AO1B2X1MA10TR U84 ( .B0(n5), .B1(n50), .A0N(n83), .Y(addr[2]) );
  AOI22X1MA10TR U85 ( .A0(n15), .A1(n84), .B0(n56), .B1(n85), .Y(n83) );
  NAND2X1BA10TR U86 ( .A(n86), .B(n87), .Y(n85) );
  NAND2X1BA10TR U87 ( .A(n88), .B(n89), .Y(n84) );
  NOR2X1AA10TR U88 ( .A(load[1]), .B(load[0]), .Y(n108) );
  INVX1MA10TR U89 ( .A(n105), .Y(n16) );
  NAND4BX1MA10TR U90 ( .AN(load[0]), .B(load[1]), .C(n106), .D(n19), .Y(n105)
         );
  AND4X0P7MA10TR U91 ( .A(n21), .B(load[0]), .C(n106), .D(n19), .Y(n53) );
  INVX1MA10TR U92 ( .A(load[1]), .Y(n21) );
  BUFX2MA10TR U93 ( .A(N40), .Y(n3) );
  BUFX2MA10TR U94 ( .A(N43), .Y(n6) );
  INVX1MA10TR U95 ( .A(col[3]), .Y(n13) );
  BUFX2MA10TR U96 ( .A(N47), .Y(n9) );
  INVX1MA10TR U97 ( .A(N115), .Y(n11) );
  INVX1MA10TR U98 ( .A(col[2]), .Y(n12) );
  AOI22X1MA10TR U99 ( .A0(N90), .A1(n10), .B0(N130), .B1(n18), .Y(n103) );
  NAND2X1BA10TR U100 ( .A(en), .B(c_p), .Y(n110) );
  OR2X0P5MA10TR U101 ( .A(n9), .B(\add_48/carry[6] ), .Y(N105) );
  XNOR2X0P5MA10TR U102 ( .A(\add_48/carry[6] ), .B(n9), .Y(N104) );
  AND2X0P5MA10TR U103 ( .A(\add_48/carry[5] ), .B(n8), .Y(\add_48/carry[6] )
         );
  XOR2X0P5MA10TR U104 ( .A(n8), .B(\add_48/carry[5] ), .Y(N103) );
  AND2X0P5MA10TR U105 ( .A(n6), .B(n7), .Y(\add_48/carry[5] ) );
  XOR2X0P5MA10TR U106 ( .A(n7), .B(n6), .Y(N102) );
  OR2X0P5MA10TR U107 ( .A(n9), .B(\add_46/carry[6] ), .Y(N97) );
  XNOR2X0P5MA10TR U108 ( .A(\add_46/carry[6] ), .B(n9), .Y(N96) );
  AND2X0P5MA10TR U109 ( .A(\add_46/carry[5] ), .B(n8), .Y(\add_46/carry[6] )
         );
  XOR2X0P5MA10TR U110 ( .A(n8), .B(\add_46/carry[5] ), .Y(N95) );
  AND2X0P5MA10TR U111 ( .A(\add_46/carry[4] ), .B(n7), .Y(\add_46/carry[5] )
         );
  XOR2X0P5MA10TR U112 ( .A(n7), .B(\add_46/carry[4] ), .Y(N94) );
  AND2X0P5MA10TR U113 ( .A(\add_46/carry[3] ), .B(n6), .Y(\add_46/carry[4] )
         );
  XOR2X0P5MA10TR U114 ( .A(n6), .B(\add_46/carry[3] ), .Y(N93) );
  AND2X0P5MA10TR U115 ( .A(\add_46/carry[2] ), .B(n5), .Y(\add_46/carry[3] )
         );
  XOR2X0P5MA10TR U116 ( .A(n5), .B(\add_46/carry[2] ), .Y(N92) );
  AND2X0P5MA10TR U117 ( .A(n3), .B(n4), .Y(\add_46/carry[2] ) );
  XOR2X0P5MA10TR U118 ( .A(n4), .B(n3), .Y(N91) );
  XOR2X0P5MA10TR U119 ( .A(N129), .B(\add_0_root_add_0_root_add_52_2/carry[7] ), .Y(N137) );
  AND2X0P5MA10TR U120 ( .A(\add_0_root_add_0_root_add_52_2/carry[6] ), .B(N128), .Y(\add_0_root_add_0_root_add_52_2/carry[7] ) );
  XOR2X0P5MA10TR U121 ( .A(N128), .B(\add_0_root_add_0_root_add_52_2/carry[6] ), .Y(N136) );
  AND2X0P5MA10TR U122 ( .A(N115), .B(N114), .Y(
        \add_0_root_add_0_root_add_52_2/carry[1] ) );
  XOR2X0P5MA10TR U123 ( .A(N114), .B(N115), .Y(N130) );
  AND2X0P5MA10TR U124 ( .A(\add_1_root_add_0_root_add_52_2/carry[4] ), .B(
        row[3]), .Y(N119) );
  XOR2X0P5MA10TR U125 ( .A(row[3]), .B(
        \add_1_root_add_0_root_add_52_2/carry[4] ), .Y(N118) );
  AND2X0P5MA10TR U126 ( .A(col[2]), .B(row[1]), .Y(
        \add_1_root_add_0_root_add_52_2/carry[3] ) );
  XOR2X0P5MA10TR U127 ( .A(row[1]), .B(col[2]), .Y(N116) );
  AND2X0P5MA10TR U128 ( .A(\sub_2_root_add_0_root_add_52_2/carry[2] ), .B(n13), 
        .Y(N129) );
  XOR2X0P5MA10TR U129 ( .A(n13), .B(\sub_2_root_add_0_root_add_52_2/carry[2] ), 
        .Y(N124) );
  AND2X0P5MA10TR U130 ( .A(n11), .B(n12), .Y(
        \sub_2_root_add_0_root_add_52_2/carry[2] ) );
  XOR2X0P5MA10TR U131 ( .A(n12), .B(n11), .Y(N123) );
  OR2X0P5MA10TR U132 ( .A(n9), .B(\add_50/carry[6] ), .Y(N113) );
  XNOR2X0P5MA10TR U133 ( .A(\add_50/carry[6] ), .B(n9), .Y(N112) );
  AND2X0P5MA10TR U134 ( .A(\add_50/carry[5] ), .B(n8), .Y(\add_50/carry[6] )
         );
  XOR2X0P5MA10TR U135 ( .A(n8), .B(\add_50/carry[5] ), .Y(N111) );
  AND2X0P5MA10TR U136 ( .A(\add_50/carry[4] ), .B(n7), .Y(\add_50/carry[5] )
         );
  XOR2X0P5MA10TR U137 ( .A(n7), .B(\add_50/carry[4] ), .Y(N110) );
  OR2X0P5MA10TR U138 ( .A(n6), .B(\add_50/carry[3] ), .Y(\add_50/carry[4] ) );
  XNOR2X0P5MA10TR U139 ( .A(\add_50/carry[3] ), .B(n6), .Y(N109) );
  AND2X0P5MA10TR U140 ( .A(\add_50/carry[2] ), .B(n5), .Y(\add_50/carry[3] )
         );
  XOR2X0P5MA10TR U141 ( .A(n5), .B(\add_50/carry[2] ), .Y(N108) );
  AND2X0P5MA10TR U142 ( .A(n3), .B(n4), .Y(\add_50/carry[2] ) );
  XOR2X0P5MA10TR U143 ( .A(n4), .B(n3), .Y(N107) );
  AND2X0P5MA10TR U144 ( .A(\add_29/carry[6] ), .B(n9), .Y(N31) );
  XOR2X0P5MA10TR U145 ( .A(n9), .B(\add_29/carry[6] ), .Y(N30) );
  AND2X0P5MA10TR U146 ( .A(\add_29/carry[5] ), .B(n8), .Y(\add_29/carry[6] )
         );
  XOR2X0P5MA10TR U147 ( .A(n8), .B(\add_29/carry[5] ), .Y(N29) );
  AND2X0P5MA10TR U148 ( .A(n6), .B(n7), .Y(\add_29/carry[5] ) );
  XOR2X0P5MA10TR U149 ( .A(n7), .B(n6), .Y(N28) );
  AND2X0P5MA10TR U150 ( .A(\add_31/carry[6] ), .B(n9), .Y(N39) );
  XOR2X0P5MA10TR U151 ( .A(n9), .B(\add_31/carry[6] ), .Y(N38) );
  AND2X0P5MA10TR U152 ( .A(\add_31/carry[5] ), .B(n8), .Y(\add_31/carry[6] )
         );
  XOR2X0P5MA10TR U153 ( .A(n8), .B(\add_31/carry[5] ), .Y(N37) );
  AND2X0P5MA10TR U154 ( .A(\add_31/carry[4] ), .B(n7), .Y(\add_31/carry[5] )
         );
  XOR2X0P5MA10TR U155 ( .A(n7), .B(\add_31/carry[4] ), .Y(N36) );
  OR2X0P5MA10TR U156 ( .A(n6), .B(\add_31/carry[3] ), .Y(\add_31/carry[4] ) );
  XNOR2X0P5MA10TR U157 ( .A(\add_31/carry[3] ), .B(n6), .Y(N35) );
  AND2X0P5MA10TR U158 ( .A(\add_31/carry[2] ), .B(n5), .Y(\add_31/carry[3] )
         );
  XOR2X0P5MA10TR U159 ( .A(n5), .B(\add_31/carry[2] ), .Y(N34) );
  AND2X0P5MA10TR U160 ( .A(n3), .B(n4), .Y(\add_31/carry[2] ) );
  XOR2X0P5MA10TR U161 ( .A(n4), .B(n3), .Y(N33) );
endmodule


module Data_reg_0 ( dout, din, load, clk, rst );
  output [7:0] dout;
  input [7:0] din;
  input load, clk, rst;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;

  DFFQX0P5MA10TR \dout_reg[7]  ( .D(n10), .CK(clk), .Q(dout[7]) );
  DFFQX1MA10TR \dout_reg[3]  ( .D(n6), .CK(clk), .Q(dout[3]) );
  DFFQX1MA10TR \dout_reg[6]  ( .D(n9), .CK(clk), .Q(dout[6]) );
  DFFQX1MA10TR \dout_reg[5]  ( .D(n8), .CK(clk), .Q(dout[5]) );
  DFFQX1MA10TR \dout_reg[2]  ( .D(n5), .CK(clk), .Q(dout[2]) );
  DFFQX1MA10TR \dout_reg[4]  ( .D(n7), .CK(clk), .Q(dout[4]) );
  DFFQX1MA10TR \dout_reg[1]  ( .D(n4), .CK(clk), .Q(dout[1]) );
  DFFQX0P5MA10TR \dout_reg[0]  ( .D(n3), .CK(clk), .Q(dout[0]) );
  BUFX1BA10TR U2 ( .A(n2), .Y(n11) );
  AO22X1MA10TR U3 ( .A0(dout[4]), .A1(n1), .B0(din[4]), .B1(n11), .Y(n7) );
  AO22X1MA10TR U4 ( .A0(dout[0]), .A1(n1), .B0(din[0]), .B1(n11), .Y(n3) );
  AO22X1MA10TR U5 ( .A0(dout[1]), .A1(n1), .B0(din[1]), .B1(n11), .Y(n4) );
  AO22X1MA10TR U6 ( .A0(dout[2]), .A1(n1), .B0(din[2]), .B1(n11), .Y(n5) );
  AO22X1MA10TR U7 ( .A0(dout[3]), .A1(n1), .B0(din[3]), .B1(n11), .Y(n6) );
  AO22X1MA10TR U8 ( .A0(dout[5]), .A1(n1), .B0(din[5]), .B1(n11), .Y(n8) );
  AO22X1MA10TR U9 ( .A0(dout[6]), .A1(n1), .B0(din[6]), .B1(n11), .Y(n9) );
  AO22X1MA10TR U10 ( .A0(dout[7]), .A1(n1), .B0(din[7]), .B1(n11), .Y(n10) );
  NOR2X2AA10TR U11 ( .A(rst), .B(n11), .Y(n1) );
  NOR2BX1MA10TR U12 ( .AN(load), .B(rst), .Y(n2) );
endmodule


module Data_reg_3 ( dout, din, load, clk, rst );
  output [7:0] dout;
  input [7:0] din;
  input load, clk, rst;
  wire   n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  DFFQX0P5MA10TR \dout_reg[7]  ( .D(n12), .CK(clk), .Q(dout[7]) );
  DFFQX0P5MA10TR \dout_reg[3]  ( .D(n16), .CK(clk), .Q(dout[3]) );
  DFFQX0P5MA10TR \dout_reg[5]  ( .D(n14), .CK(clk), .Q(dout[5]) );
  DFFQX0P5MA10TR \dout_reg[6]  ( .D(n13), .CK(clk), .Q(dout[6]) );
  DFFQX1MA10TR \dout_reg[4]  ( .D(n15), .CK(clk), .Q(dout[4]) );
  DFFQX0P5MA10TR \dout_reg[0]  ( .D(n19), .CK(clk), .Q(dout[0]) );
  DFFQX0P5MA10TR \dout_reg[2]  ( .D(n17), .CK(clk), .Q(dout[2]) );
  DFFQX1MA10TR \dout_reg[1]  ( .D(n18), .CK(clk), .Q(dout[1]) );
  BUFX1BA10TR U2 ( .A(n20), .Y(n11) );
  AO22X1MA10TR U3 ( .A0(dout[0]), .A1(n21), .B0(din[0]), .B1(n11), .Y(n19) );
  AO22X1MA10TR U4 ( .A0(dout[1]), .A1(n21), .B0(din[1]), .B1(n11), .Y(n18) );
  AO22X1MA10TR U5 ( .A0(dout[2]), .A1(n21), .B0(din[2]), .B1(n11), .Y(n17) );
  AO22X1MA10TR U6 ( .A0(dout[3]), .A1(n21), .B0(din[3]), .B1(n11), .Y(n16) );
  AO22X1MA10TR U7 ( .A0(dout[4]), .A1(n21), .B0(din[4]), .B1(n11), .Y(n15) );
  AO22X1MA10TR U8 ( .A0(dout[5]), .A1(n21), .B0(din[5]), .B1(n11), .Y(n14) );
  AO22X1MA10TR U9 ( .A0(dout[6]), .A1(n21), .B0(din[6]), .B1(n11), .Y(n13) );
  AO22X1MA10TR U10 ( .A0(dout[7]), .A1(n21), .B0(din[7]), .B1(n11), .Y(n12) );
  NOR2X2AA10TR U11 ( .A(rst), .B(n11), .Y(n21) );
  NOR2BX1MA10TR U12 ( .AN(load), .B(rst), .Y(n20) );
endmodule


module Data_reg_2 ( dout, din, load, clk, rst );
  output [7:0] dout;
  input [7:0] din;
  input load, clk, rst;
  wire   n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  DFFQX0P5MA10TR \dout_reg[4]  ( .D(n15), .CK(clk), .Q(dout[4]) );
  DFFQX0P5MA10TR \dout_reg[3]  ( .D(n16), .CK(clk), .Q(dout[3]) );
  DFFQX0P5MA10TR \dout_reg[5]  ( .D(n14), .CK(clk), .Q(dout[5]) );
  DFFQX0P5MA10TR \dout_reg[6]  ( .D(n13), .CK(clk), .Q(dout[6]) );
  DFFQX0P5MA10TR \dout_reg[0]  ( .D(n19), .CK(clk), .Q(dout[0]) );
  DFFQX0P5MA10TR \dout_reg[1]  ( .D(n18), .CK(clk), .Q(dout[1]) );
  DFFQX0P5MA10TR \dout_reg[2]  ( .D(n17), .CK(clk), .Q(dout[2]) );
  DFFQX0P5MA10TR \dout_reg[7]  ( .D(n12), .CK(clk), .Q(dout[7]) );
  BUFX1BA10TR U2 ( .A(n20), .Y(n11) );
  AO22X1MA10TR U3 ( .A0(dout[0]), .A1(n21), .B0(din[0]), .B1(n11), .Y(n19) );
  AO22X1MA10TR U4 ( .A0(dout[1]), .A1(n21), .B0(din[1]), .B1(n11), .Y(n18) );
  AO22X1MA10TR U5 ( .A0(dout[2]), .A1(n21), .B0(din[2]), .B1(n11), .Y(n17) );
  AO22X1MA10TR U6 ( .A0(dout[3]), .A1(n21), .B0(din[3]), .B1(n11), .Y(n16) );
  AO22X1MA10TR U7 ( .A0(dout[4]), .A1(n21), .B0(din[4]), .B1(n11), .Y(n15) );
  AO22X1MA10TR U8 ( .A0(dout[5]), .A1(n21), .B0(din[5]), .B1(n11), .Y(n14) );
  AO22X1MA10TR U9 ( .A0(dout[6]), .A1(n21), .B0(din[6]), .B1(n11), .Y(n13) );
  AO22X1MA10TR U10 ( .A0(dout[7]), .A1(n21), .B0(din[7]), .B1(n11), .Y(n12) );
  NOR2X2AA10TR U11 ( .A(rst), .B(n11), .Y(n21) );
  NOR2BX1MA10TR U12 ( .AN(load), .B(rst), .Y(n20) );
endmodule


module Data_reg_1 ( dout, din, load, clk, rst );
  output [7:0] dout;
  input [7:0] din;
  input load, clk, rst;
  wire   n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  DFFQX0P5MA10TR \dout_reg[7]  ( .D(n12), .CK(clk), .Q(dout[7]) );
  DFFQX0P5MA10TR \dout_reg[5]  ( .D(n14), .CK(clk), .Q(dout[5]) );
  DFFQX0P5MA10TR \dout_reg[3]  ( .D(n16), .CK(clk), .Q(dout[3]) );
  DFFQX0P5MA10TR \dout_reg[6]  ( .D(n13), .CK(clk), .Q(dout[6]) );
  DFFQX0P5MA10TR \dout_reg[4]  ( .D(n15), .CK(clk), .Q(dout[4]) );
  DFFQX0P5MA10TR \dout_reg[0]  ( .D(n19), .CK(clk), .Q(dout[0]) );
  DFFQX0P5MA10TR \dout_reg[1]  ( .D(n18), .CK(clk), .Q(dout[1]) );
  DFFQX0P5MA10TR \dout_reg[2]  ( .D(n17), .CK(clk), .Q(dout[2]) );
  BUFX1BA10TR U2 ( .A(n20), .Y(n11) );
  AO22X1MA10TR U3 ( .A0(dout[0]), .A1(n21), .B0(din[0]), .B1(n11), .Y(n19) );
  AO22X1MA10TR U4 ( .A0(dout[1]), .A1(n21), .B0(din[1]), .B1(n11), .Y(n18) );
  AO22X1MA10TR U5 ( .A0(dout[2]), .A1(n21), .B0(din[2]), .B1(n11), .Y(n17) );
  AO22X1MA10TR U6 ( .A0(dout[3]), .A1(n21), .B0(din[3]), .B1(n11), .Y(n16) );
  AO22X1MA10TR U7 ( .A0(dout[4]), .A1(n21), .B0(din[4]), .B1(n11), .Y(n15) );
  AO22X1MA10TR U8 ( .A0(dout[5]), .A1(n21), .B0(din[5]), .B1(n11), .Y(n14) );
  AO22X1MA10TR U9 ( .A0(dout[6]), .A1(n21), .B0(din[6]), .B1(n11), .Y(n13) );
  AO22X1MA10TR U10 ( .A0(dout[7]), .A1(n21), .B0(din[7]), .B1(n11), .Y(n12) );
  NOR2X2AA10TR U11 ( .A(rst), .B(n11), .Y(n21) );
  NOR2BX1MA10TR U12 ( .AN(load), .B(rst), .Y(n20) );
endmodule


module convolution_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [7:1] carry;

  ADDFX1MA10TR U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  ADDFX1MA10TR U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  ADDFX1MA10TR U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  ADDFX1MA10TR U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  ADDFX1MA10TR U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  ADDFX1MA10TR U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1])
         );
  XOR3X1MA10TR U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  AND2X1MA10TR U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1MA10TR U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module convolution ( din1, din2, din3, din4, dout, rst, clk, en );
  input [7:0] din1;
  input [7:0] din2;
  input [7:0] din3;
  input [7:0] din4;
  output [7:0] dout;
  input rst, clk, en;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n2;

  convolution_DW01_add_0 add_19_2 ( .A(din1), .B(din3), .CI(1'b0), .SUM({N10, 
        N9, N8, N7, N6, N5, N4, N3}) );
  DFFQX0P5MA10TR \dout_reg[7]  ( .D(n12), .CK(clk), .Q(dout[7]) );
  DFFQX0P5MA10TR \dout_reg[6]  ( .D(n11), .CK(clk), .Q(dout[6]) );
  DFFQX0P5MA10TR \dout_reg[5]  ( .D(n10), .CK(clk), .Q(dout[5]) );
  DFFQX0P5MA10TR \dout_reg[4]  ( .D(n9), .CK(clk), .Q(dout[4]) );
  DFFQX0P5MA10TR \dout_reg[3]  ( .D(n8), .CK(clk), .Q(dout[3]) );
  DFFQX0P5MA10TR \dout_reg[2]  ( .D(n7), .CK(clk), .Q(dout[2]) );
  DFFQX0P5MA10TR \dout_reg[1]  ( .D(n6), .CK(clk), .Q(dout[1]) );
  DFFQX0P5MA10TR \dout_reg[0]  ( .D(n5), .CK(clk), .Q(dout[0]) );
  NOR2X2AA10TR U2 ( .A(n2), .B(rst), .Y(n4) );
  AO22X1MA10TR U4 ( .A0(dout[7]), .A1(n2), .B0(N10), .B1(n4), .Y(n12) );
  BUFX1BA10TR U5 ( .A(n3), .Y(n2) );
  NOR2X1AA10TR U6 ( .A(en), .B(rst), .Y(n3) );
  AO22X1MA10TR U7 ( .A0(dout[0]), .A1(n2), .B0(N3), .B1(n4), .Y(n5) );
  AO22X1MA10TR U8 ( .A0(dout[1]), .A1(n2), .B0(N4), .B1(n4), .Y(n6) );
  AO22X1MA10TR U9 ( .A0(dout[2]), .A1(n2), .B0(N5), .B1(n4), .Y(n7) );
  AO22X1MA10TR U10 ( .A0(dout[3]), .A1(n2), .B0(N6), .B1(n4), .Y(n8) );
  AO22X1MA10TR U11 ( .A0(dout[4]), .A1(n2), .B0(N7), .B1(n4), .Y(n9) );
  AO22X1MA10TR U12 ( .A0(dout[5]), .A1(n2), .B0(N8), .B1(n4), .Y(n10) );
  AO22X1MA10TR U13 ( .A0(dout[6]), .A1(n2), .B0(N9), .B1(n4), .Y(n11) );
endmodule


module pool ( din1, din2, din3, din4, dout, rst, en, clk );
  input [7:0] din1;
  input [7:0] din2;
  input [7:0] din3;
  input [7:0] din4;
  output [7:0] dout;
  input rst, en, clk;
  wire   n58, n59, n60, n61, n62, n63, n64, n65, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129;

  DFFQX0P5MA10TR \dout_reg[6]  ( .D(n64), .CK(clk), .Q(dout[6]) );
  DFFQX0P5MA10TR \dout_reg[5]  ( .D(n63), .CK(clk), .Q(dout[5]) );
  DFFQX0P5MA10TR \dout_reg[4]  ( .D(n62), .CK(clk), .Q(dout[4]) );
  DFFQX0P5MA10TR \dout_reg[3]  ( .D(n61), .CK(clk), .Q(dout[3]) );
  DFFQX0P5MA10TR \dout_reg[2]  ( .D(n60), .CK(clk), .Q(dout[2]) );
  DFFQX0P5MA10TR \dout_reg[1]  ( .D(n59), .CK(clk), .Q(dout[1]) );
  DFFQX0P5MA10TR \dout_reg[0]  ( .D(n58), .CK(clk), .Q(dout[0]) );
  DFFQX0P5MA10TR \dout_reg[7]  ( .D(n65), .CK(clk), .Q(dout[7]) );
  NOR2X2AA10TR U2 ( .A(n49), .B(n1), .Y(n12) );
  NAND3BX1MA10TR U3 ( .AN(n51), .B(n49), .C(n50), .Y(n16) );
  NAND3X1AA10TR U4 ( .A(n49), .B(n50), .C(n51), .Y(n18) );
  INVX1MA10TR U5 ( .A(n2), .Y(n8) );
  INVX1MA10TR U6 ( .A(n3), .Y(n11) );
  INVX1MA10TR U7 ( .A(din4[4]), .Y(n27) );
  OAI222X1MA10TR U8 ( .A0(n111), .A1(n6), .B0(din2[7]), .B1(n112), .C0(n113), 
        .C1(n7), .Y(n49) );
  NAND2X0P5MA10TR U9 ( .A(din2[4]), .B(n27), .Y(n118) );
  NAND2X0P5MA10TR U10 ( .A(din1[4]), .B(n27), .Y(n78) );
  NAND2X0P5MA10TR U11 ( .A(din3[4]), .B(n27), .Y(n57) );
  BUFX1BA10TR U12 ( .A(n13), .Y(n1) );
  AOI221X1MA10TR U13 ( .A0(n69), .A1(din2[7]), .B0(n70), .B1(din3[7]), .C0(n71), .Y(n13) );
  AO22X0P5MA10TR U14 ( .A0(dout[7]), .A1(n2), .B0(n3), .B1(n4), .Y(n65) );
  NAND4BX0P5MA10TR U15 ( .AN(din2[7]), .B(n5), .C(n6), .D(n7), .Y(n4) );
  OAI22X0P5MA10TR U16 ( .A0(n8), .A1(n9), .B0(n10), .B1(n11), .Y(n64) );
  AOI221X0P5MA10TR U17 ( .A0(n12), .A1(din2[6]), .B0(n1), .B1(din1[6]), .C0(
        n14), .Y(n10) );
  OAI22X0P5MA10TR U18 ( .A0(n15), .A1(n16), .B0(n17), .B1(n18), .Y(n14) );
  INVX0P5BA10TR U19 ( .A(dout[6]), .Y(n9) );
  OAI22X0P5MA10TR U20 ( .A0(n8), .A1(n19), .B0(n20), .B1(n11), .Y(n63) );
  AOI221X0P5MA10TR U21 ( .A0(n12), .A1(din2[5]), .B0(n1), .B1(din1[5]), .C0(
        n21), .Y(n20) );
  OAI22X0P5MA10TR U22 ( .A0(n22), .A1(n16), .B0(n23), .B1(n18), .Y(n21) );
  INVX0P5BA10TR U23 ( .A(dout[5]), .Y(n19) );
  OAI22X0P5MA10TR U24 ( .A0(n8), .A1(n24), .B0(n25), .B1(n11), .Y(n62) );
  AOI221X0P5MA10TR U25 ( .A0(n12), .A1(din2[4]), .B0(n1), .B1(din1[4]), .C0(
        n26), .Y(n25) );
  OAI22X0P5MA10TR U26 ( .A0(n27), .A1(n16), .B0(n28), .B1(n18), .Y(n26) );
  INVX0P5BA10TR U27 ( .A(dout[4]), .Y(n24) );
  OAI22X0P5MA10TR U28 ( .A0(n8), .A1(n29), .B0(n30), .B1(n11), .Y(n61) );
  AOI221X0P5MA10TR U29 ( .A0(n12), .A1(din2[3]), .B0(n1), .B1(din1[3]), .C0(
        n31), .Y(n30) );
  OAI22X0P5MA10TR U30 ( .A0(n32), .A1(n16), .B0(n33), .B1(n18), .Y(n31) );
  INVX0P5BA10TR U31 ( .A(dout[3]), .Y(n29) );
  OAI22X0P5MA10TR U32 ( .A0(n8), .A1(n34), .B0(n35), .B1(n11), .Y(n60) );
  AOI221X0P5MA10TR U33 ( .A0(n12), .A1(din2[2]), .B0(n1), .B1(din1[2]), .C0(
        n36), .Y(n35) );
  OAI22X0P5MA10TR U34 ( .A0(n37), .A1(n16), .B0(n38), .B1(n18), .Y(n36) );
  INVX0P5BA10TR U35 ( .A(dout[2]), .Y(n34) );
  OAI22X0P5MA10TR U36 ( .A0(n8), .A1(n39), .B0(n40), .B1(n11), .Y(n59) );
  AOI221X0P5MA10TR U37 ( .A0(n12), .A1(din2[1]), .B0(din1[1]), .B1(n1), .C0(
        n41), .Y(n40) );
  OAI22X0P5MA10TR U38 ( .A0(n42), .A1(n16), .B0(n43), .B1(n18), .Y(n41) );
  INVX0P5BA10TR U39 ( .A(dout[1]), .Y(n39) );
  OAI22X0P5MA10TR U40 ( .A0(n8), .A1(n44), .B0(n45), .B1(n11), .Y(n58) );
  AOI221X0P5MA10TR U41 ( .A0(n12), .A1(din2[0]), .B0(din1[0]), .B1(n1), .C0(
        n46), .Y(n45) );
  OAI22X0P5MA10TR U42 ( .A0(n47), .A1(n16), .B0(n48), .B1(n18), .Y(n46) );
  INVX0P5BA10TR U43 ( .A(n1), .Y(n50) );
  ADDFX1MA10TR U44 ( .A(din3[7]), .B(n7), .CI(n52), .CO(n51) );
  OA22X0P5MA10TR U45 ( .A0(n53), .A1(n54), .B0(din3[6]), .B1(n15), .Y(n52) );
  AOI32X0P5MA10TR U46 ( .A0(n55), .A1(n56), .A2(n57), .B0(din4[5]), .B1(n23), 
        .Y(n54) );
  OAI221X0P5MA10TR U47 ( .A0(din3[4]), .A1(n27), .B0(din3[3]), .B1(n32), .C0(
        n66), .Y(n56) );
  OAI222X0P5MA10TR U48 ( .A0(din4[3]), .A1(n33), .B0(n67), .B1(n68), .C0(
        din4[2]), .C1(n38), .Y(n66) );
  OAI22X0P5MA10TR U49 ( .A0(din3[1]), .A1(n42), .B0(din3[2]), .B1(n37), .Y(n68) );
  AOI211X0P5MA10TR U50 ( .A0(din3[1]), .A1(n42), .B0(n47), .C0(din3[0]), .Y(
        n67) );
  NAND2X0P5AA10TR U51 ( .A(din3[5]), .B(n22), .Y(n55) );
  NOR2X0P5AA10TR U52 ( .A(din4[6]), .B(n17), .Y(n53) );
  AO22X0P5MA10TR U53 ( .A0(n72), .A1(n5), .B0(din4[7]), .B1(n73), .Y(n71) );
  INVX0P5BA10TR U54 ( .A(din1[7]), .Y(n5) );
  OR6X0P5MA10TR U55 ( .A(n73), .B(n69), .C(n70), .D(din4[7]), .E(din3[7]), .F(
        din2[7]), .Y(n72) );
  OAI22X0P5MA10TR U56 ( .A0(din1[6]), .A1(n15), .B0(n74), .B1(n75), .Y(n73) );
  AOI32X0P5MA10TR U57 ( .A0(n76), .A1(n77), .A2(n78), .B0(din4[5]), .B1(n79), 
        .Y(n75) );
  OAI221X0P5MA10TR U58 ( .A0(din1[4]), .A1(n27), .B0(din1[3]), .B1(n32), .C0(
        n80), .Y(n77) );
  OAI221X0P5MA10TR U59 ( .A0(din4[3]), .A1(n81), .B0(din4[2]), .B1(n82), .C0(
        n83), .Y(n80) );
  OAI222X0P5MA10TR U60 ( .A0(din1[1]), .A1(n42), .B0(din1[2]), .B1(n37), .C0(
        n84), .C1(n47), .Y(n83) );
  AOI21X0P5MA10TR U61 ( .A0(din4[1]), .A1(n85), .B0(n86), .Y(n84) );
  NAND2X0P5AA10TR U62 ( .A(din1[5]), .B(n22), .Y(n76) );
  NOR2X0P5AA10TR U63 ( .A(din4[6]), .B(n87), .Y(n74) );
  OAI22X0P5MA10TR U64 ( .A0(din1[6]), .A1(n17), .B0(n88), .B1(n89), .Y(n70) );
  AOI32X0P5MA10TR U65 ( .A0(n90), .A1(n91), .A2(n92), .B0(din3[5]), .B1(n79), 
        .Y(n89) );
  NAND2X0P5AA10TR U66 ( .A(din1[4]), .B(n28), .Y(n92) );
  OAI221X0P5MA10TR U67 ( .A0(din1[4]), .A1(n28), .B0(din1[3]), .B1(n33), .C0(
        n93), .Y(n91) );
  OAI221X0P5MA10TR U68 ( .A0(din3[3]), .A1(n81), .B0(din3[2]), .B1(n82), .C0(
        n94), .Y(n93) );
  OAI222X0P5MA10TR U69 ( .A0(din1[1]), .A1(n43), .B0(din1[2]), .B1(n38), .C0(
        n95), .C1(n48), .Y(n94) );
  AOI21X0P5MA10TR U70 ( .A0(din3[1]), .A1(n85), .B0(n86), .Y(n95) );
  NAND2X0P5AA10TR U71 ( .A(din1[5]), .B(n23), .Y(n90) );
  NOR2X0P5AA10TR U72 ( .A(din3[6]), .B(n87), .Y(n88) );
  OAI22X0P5MA10TR U73 ( .A0(din1[6]), .A1(n96), .B0(n97), .B1(n98), .Y(n69) );
  AOI32X0P5MA10TR U74 ( .A0(n99), .A1(n100), .A2(n101), .B0(din2[5]), .B1(n79), 
        .Y(n98) );
  INVX0P5BA10TR U75 ( .A(din1[5]), .Y(n79) );
  NAND2X0P5AA10TR U76 ( .A(din1[4]), .B(n102), .Y(n101) );
  OAI221X0P5MA10TR U77 ( .A0(din1[4]), .A1(n102), .B0(din1[3]), .B1(n103), 
        .C0(n104), .Y(n100) );
  OAI221X0P5MA10TR U78 ( .A0(din2[3]), .A1(n81), .B0(din2[2]), .B1(n82), .C0(
        n105), .Y(n104) );
  OAI222X0P5MA10TR U79 ( .A0(din1[1]), .A1(n106), .B0(din1[2]), .B1(n107), 
        .C0(n108), .C1(n109), .Y(n105) );
  INVX0P5BA10TR U80 ( .A(din2[0]), .Y(n109) );
  AOI21X0P5MA10TR U81 ( .A0(din2[1]), .A1(n85), .B0(n86), .Y(n108) );
  NOR2X0P5AA10TR U82 ( .A(din1[0]), .B(din1[1]), .Y(n86) );
  INVX0P5BA10TR U83 ( .A(din1[0]), .Y(n85) );
  INVX0P5BA10TR U84 ( .A(din2[1]), .Y(n106) );
  INVX0P5BA10TR U85 ( .A(din1[2]), .Y(n82) );
  INVX0P5BA10TR U86 ( .A(din1[3]), .Y(n81) );
  INVX0P5BA10TR U87 ( .A(din2[4]), .Y(n102) );
  NAND2X0P5AA10TR U88 ( .A(din1[5]), .B(n110), .Y(n99) );
  NOR2X0P5AA10TR U89 ( .A(din2[6]), .B(n87), .Y(n97) );
  INVX0P5BA10TR U90 ( .A(din1[6]), .Y(n87) );
  AND4X0P5MA10TR U91 ( .A(n113), .B(n111), .C(n6), .D(n7), .Y(n112) );
  INVX0P5BA10TR U92 ( .A(din4[7]), .Y(n7) );
  OA22X0P5MA10TR U93 ( .A0(din2[6]), .A1(n15), .B0(n114), .B1(n115), .Y(n113)
         );
  AOI32X0P5MA10TR U94 ( .A0(n116), .A1(n117), .A2(n118), .B0(din4[5]), .B1(
        n110), .Y(n115) );
  OAI221X0P5MA10TR U95 ( .A0(din2[4]), .A1(n27), .B0(din2[3]), .B1(n32), .C0(
        n119), .Y(n117) );
  OAI222X0P5MA10TR U96 ( .A0(din4[3]), .A1(n103), .B0(n120), .B1(n121), .C0(
        din4[2]), .C1(n107), .Y(n119) );
  OAI22X0P5MA10TR U97 ( .A0(din2[1]), .A1(n42), .B0(din2[2]), .B1(n37), .Y(
        n121) );
  INVX0P5BA10TR U98 ( .A(din4[2]), .Y(n37) );
  AOI211X0P5MA10TR U99 ( .A0(din2[1]), .A1(n42), .B0(n47), .C0(din2[0]), .Y(
        n120) );
  INVX0P5BA10TR U100 ( .A(din4[0]), .Y(n47) );
  INVX0P5BA10TR U101 ( .A(din4[1]), .Y(n42) );
  INVX0P5BA10TR U102 ( .A(din4[3]), .Y(n32) );
  NAND2X0P5AA10TR U103 ( .A(din2[5]), .B(n22), .Y(n116) );
  INVX0P5BA10TR U104 ( .A(din4[5]), .Y(n22) );
  NOR2X0P5AA10TR U105 ( .A(din4[6]), .B(n96), .Y(n114) );
  INVX0P5BA10TR U106 ( .A(din4[6]), .Y(n15) );
  INVX0P5BA10TR U107 ( .A(din3[7]), .Y(n6) );
  OA22X0P5MA10TR U108 ( .A0(din2[6]), .A1(n17), .B0(n122), .B1(n123), .Y(n111)
         );
  AOI32X0P5MA10TR U109 ( .A0(n124), .A1(n125), .A2(n126), .B0(din3[5]), .B1(
        n110), .Y(n123) );
  INVX0P5BA10TR U110 ( .A(din2[5]), .Y(n110) );
  NAND2X0P5AA10TR U111 ( .A(din2[4]), .B(n28), .Y(n126) );
  OAI221X0P5MA10TR U112 ( .A0(din2[4]), .A1(n28), .B0(din2[3]), .B1(n33), .C0(
        n127), .Y(n125) );
  OAI222X0P5MA10TR U113 ( .A0(din3[3]), .A1(n103), .B0(n128), .B1(n129), .C0(
        din3[2]), .C1(n107), .Y(n127) );
  INVX0P5BA10TR U114 ( .A(din2[2]), .Y(n107) );
  OAI22X0P5MA10TR U115 ( .A0(din2[1]), .A1(n43), .B0(din2[2]), .B1(n38), .Y(
        n129) );
  INVX0P5BA10TR U116 ( .A(din3[2]), .Y(n38) );
  AOI211X0P5MA10TR U117 ( .A0(din2[1]), .A1(n43), .B0(n48), .C0(din2[0]), .Y(
        n128) );
  INVX0P5BA10TR U118 ( .A(din3[0]), .Y(n48) );
  INVX0P5BA10TR U119 ( .A(din3[1]), .Y(n43) );
  INVX0P5BA10TR U120 ( .A(din2[3]), .Y(n103) );
  INVX0P5BA10TR U121 ( .A(din3[3]), .Y(n33) );
  INVX0P5BA10TR U122 ( .A(din3[4]), .Y(n28) );
  NAND2X0P5AA10TR U123 ( .A(din2[5]), .B(n23), .Y(n124) );
  INVX0P5BA10TR U124 ( .A(din3[5]), .Y(n23) );
  NOR2X0P5AA10TR U125 ( .A(din3[6]), .B(n96), .Y(n122) );
  INVX0P5BA10TR U126 ( .A(din2[6]), .Y(n96) );
  INVX0P5BA10TR U127 ( .A(din3[6]), .Y(n17) );
  INVX0P5BA10TR U128 ( .A(dout[0]), .Y(n44) );
  NOR2X0P5AA10TR U129 ( .A(n3), .B(rst), .Y(n2) );
  NOR2BX0P5MA10TR U130 ( .AN(en), .B(rst), .Y(n3) );
endmodule


module mux1 ( din1, din2, c_p, dout, row, col );
  input [7:0] din1;
  input [7:0] din2;
  output [7:0] dout;
  input [3:0] row;
  input [3:0] col;
  input c_p;
  wire   n2, n3, n4, n5, n6, n1, n7;

  AND3X1MA10TR U2 ( .A(n7), .B(n3), .C(n4), .Y(n2) );
  INVX1MA10TR U3 ( .A(n1), .Y(n7) );
  NAND3BX1MA10TR U4 ( .AN(row[0]), .B(row[3]), .C(n5), .Y(n4) );
  NAND3BX1MA10TR U5 ( .AN(col[0]), .B(col[3]), .C(n6), .Y(n3) );
  NOR2X1AA10TR U6 ( .A(col[2]), .B(col[1]), .Y(n6) );
  NOR2X1AA10TR U7 ( .A(row[2]), .B(row[1]), .Y(n5) );
  BUFX1BA10TR U8 ( .A(c_p), .Y(n1) );
  AO22X1MA10TR U9 ( .A0(din2[0]), .A1(n1), .B0(din1[0]), .B1(n2), .Y(dout[0])
         );
  AO22X1MA10TR U10 ( .A0(din2[1]), .A1(n1), .B0(din1[1]), .B1(n2), .Y(dout[1])
         );
  AO22X1MA10TR U11 ( .A0(din2[2]), .A1(n1), .B0(din1[2]), .B1(n2), .Y(dout[2])
         );
  AO22X1MA10TR U12 ( .A0(din2[3]), .A1(n1), .B0(din1[3]), .B1(n2), .Y(dout[3])
         );
  AO22X1MA10TR U13 ( .A0(din2[4]), .A1(n1), .B0(din1[4]), .B1(n2), .Y(dout[4])
         );
  AO22X1MA10TR U14 ( .A0(din2[5]), .A1(n1), .B0(din1[5]), .B1(n2), .Y(dout[5])
         );
  AO22X1MA10TR U15 ( .A0(din2[6]), .A1(n1), .B0(din1[6]), .B1(n2), .Y(dout[6])
         );
  AO22X1MA10TR U16 ( .A0(din2[7]), .A1(n1), .B0(din1[7]), .B1(n2), .Y(dout[7])
         );
endmodule


module simple_conv_pool ( clk, rst, read, addr, din, dout, write );
  output [7:0] addr;
  input [7:0] din;
  output [7:0] dout;
  input clk, rst;
  output read, write;
  wire   pc_en, a_en, po_en, c_en, c_p;
  wire   [3:0] load;
  wire   [3:0] col;
  wire   [3:0] row;
  wire   [6:0] pixel;
  wire   [7:0] data1;
  wire   [7:0] data2;
  wire   [7:0] data3;
  wire   [7:0] data4;
  wire   [7:0] temp1;
  wire   [7:0] temp2;

  ctrl ctrl1 ( .pixel_cnt_en(pc_en), .addr_cal_en(a_en), .pool_en(po_en), 
        .load(load), .conv_en(c_en), .read(read), .write(write), .clk(clk), 
        .rst(rst), .c_p(c_p), .col(col), .row(row) );
  pixel_cnt p1 ( .en(pc_en), .clk(clk), .rst(rst), .pixel(pixel), .conv_pool(
        c_p), .row_cnt(row), .col_cnt(col) );
  Addr_cal a1 ( .col(col), .row(row), .pixel(pixel), .c_p(c_p), .addr(addr), 
        .load(load), .write(write), .en(a_en) );
  Data_reg_0 d1 ( .dout(data1), .din(din), .load(load[3]), .clk(clk), .rst(rst) );
  Data_reg_3 d2 ( .dout(data2), .din(din), .load(load[2]), .clk(clk), .rst(rst) );
  Data_reg_2 d3 ( .dout(data3), .din(din), .load(load[1]), .clk(clk), .rst(rst) );
  Data_reg_1 d4 ( .dout(data4), .din(din), .load(load[0]), .clk(clk), .rst(rst) );
  convolution conv1 ( .din1(data1), .din2(data2), .din3(data3), .din4(data4), 
        .dout(temp1), .rst(rst), .clk(clk), .en(c_en) );
  pool pool1 ( .din1(data1), .din2(data2), .din3(data3), .din4(data4), .dout(
        temp2), .rst(rst), .en(po_en), .clk(clk) );
  mux1 mu1 ( .din1(temp1), .din2(temp2), .c_p(c_p), .dout(dout), .row(row), 
        .col(col) );
endmodule

