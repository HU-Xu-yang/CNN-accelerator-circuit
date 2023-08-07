module ctrl (
	pixel_cnt_en, 
	addr_cal_en, 
	pool_en, 
	load, 
	conv_en, 
	read, 
	write, 
	clk, 
	rst, 
	c_p, 
	col, 
	row);
   output pixel_cnt_en;
   output addr_cal_en;
   output pool_en;
   output [3:0] load;
   output conv_en;
   output read;
   output write;
   input clk;
   input rst;
   input c_p;
   input [3:0] col;
   input [3:0] row;

   // Internal wires
   wire N10;
   wire N11;
   wire N12;
   wire N13;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n1;
   wire n2;
   wire n3;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire [3:0] c_s;

   DFFQX0P5MA10TR \c_s_reg[0]  (.Q(c_s[0]), 
	.D(N10), 
	.CK(clk));
   DFFQX0P5MA10TR \c_s_reg[1]  (.Q(c_s[1]), 
	.D(N11), 
	.CK(clk));
   DFFQX0P5MA10TR \c_s_reg[3]  (.Q(c_s[3]), 
	.D(N13), 
	.CK(clk));
   DFFQX0P5MA10TR \c_s_reg[2]  (.Q(c_s[2]), 
	.D(N12), 
	.CK(clk));
   NOR2X1AA10TR U3 (.Y(load[2]), 
	.B(n15), 
	.A(n13));
   NOR2X1AA10TR U4 (.Y(write), 
	.B(n11), 
	.A(n15));
   NOR3X1MA10TR U5 (.Y(load[1]), 
	.C(n7), 
	.B(c_s[1]), 
	.A(n12));
   INVX1MA10TR U6 (.Y(n2), 
	.A(n12));
   INVX1MA10TR U7 (.Y(n5), 
	.A(n15));
   AND3X1MA10TR U8 (.Y(pixel_cnt_en), 
	.C(n14), 
	.B(n11), 
	.A(n5));
   INVX1MA10TR U9 (.Y(load[0]), 
	.A(n16));
   NAND2X1BA10TR U10 (.Y(n12), 
	.B(n9), 
	.A(n3));
   NOR2X1AA10TR U11 (.Y(load[3]), 
	.B(n13), 
	.A(n12));
   OR2X1MA10TR U12 (.Y(addr_cal_en), 
	.B(write), 
	.A(read));
   NAND2X1BA10TR U13 (.Y(n11), 
	.B(c_s[2]), 
	.A(c_s[1]));
   NAND2X1BA10TR U14 (.Y(n13), 
	.B(n7), 
	.A(c_s[1]));
   NAND2X1BA10TR U15 (.Y(n15), 
	.B(n9), 
	.A(c_s[0]));
   INVX1MA10TR U16 (.Y(n1), 
	.A(c_p));
   NAND3X1AA10TR U17 (.Y(n19), 
	.C(row[0]), 
	.B(n3), 
	.A(col[0]));
   INVX1MA10TR U18 (.Y(n7), 
	.A(c_s[2]));
   NOR3X1AA10TR U19 (.Y(N13), 
	.C(n16), 
	.B(rst), 
	.A(n1));
   INVX1MA10TR U20 (.Y(n9), 
	.A(c_s[3]));
   OA21X1MA10TR U21 (.Y(n14), 
	.B0(n13), 
	.A1(n7), 
	.A0(c_s[1]));
   AOI31X1MA10TR U22 (.Y(N12), 
	.B0(rst), 
	.A2(n18), 
	.A1(n6), 
	.A0(n17));
   INVX1MA10TR U23 (.Y(n6), 
	.A(load[2]));
   AOI22X1MA10TR U24 (.Y(n18), 
	.B1(n1), 
	.B0(load[0]), 
	.A1(c_s[2]), 
	.A0(n2));
   NAND4BX1MA10TR U25 (.Y(n17), 
	.D(n7), 
	.C(n10), 
	.B(c_s[3]), 
	.AN(n19));
   NOR2X1AA10TR U26 (.Y(N11), 
	.B(n20), 
	.A(rst));
   AOI221X1MA10TR U27 (.Y(n20), 
	.C0(n21), 
	.B1(c_s[1]), 
	.B0(n2), 
	.A1(n1), 
	.A0(load[0]));
   AOI211X1MA10TR U28 (.Y(n21), 
	.C0(c_s[1]), 
	.B0(c_s[2]), 
	.A1(n19), 
	.A0(c_s[3]));
   INVX1MA10TR U29 (.Y(n3), 
	.A(c_s[0]));
   NAND3X1AA10TR U30 (.Y(n16), 
	.C(n5), 
	.B(n10), 
	.A(c_s[2]));
   NOR2X1AA10TR U31 (.Y(read), 
	.B(c_s[3]), 
	.A(n14));
   INVX1MA10TR U32 (.Y(n10), 
	.A(c_s[1]));
   AND4X0P7MA10TR U33 (.Y(pool_en), 
	.D(n3), 
	.C(n11), 
	.B(n14), 
	.A(c_s[3]));
   NOR2X1AA10TR U34 (.Y(conv_en), 
	.B(n12), 
	.A(n11));
   NOR2X1AA10TR U35 (.Y(N10), 
	.B(n22), 
	.A(rst));
   AOI221X1MA10TR U36 (.Y(n22), 
	.C0(pool_en), 
	.B1(n9), 
	.B0(n8), 
	.A1(n3), 
	.A0(read));
   INVX1MA10TR U37 (.Y(n8), 
	.A(n11));
endmodule

module pixel_cnt (
	en, 
	clk, 
	rst, 
	pixel, 
	conv_pool, 
	row_cnt, 
	col_cnt);
   input en;
   input clk;
   input rst;
   output [6:0] pixel;
   output conv_pool;
   output [3:0] row_cnt;
   output [3:0] col_cnt;

   // Internal wires
   wire N32;
   wire N33;
   wire N34;
   wire N57;
   wire n7;
   wire n9;
   wire n10;
   wire n12;
   wire n13;
   wire n14;
   wire n16;
   wire n18;
   wire n20;
   wire n22;
   wire n23;
   wire n24;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire N43;
   wire N42;
   wire N41;
   wire \add_60/carry[6] ;
   wire \add_60/carry[5] ;
   wire \add_60/carry[4] ;
   wire \add_60/A[3] ;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n8;
   wire n11;
   wire n15;
   wire n17;
   wire n19;
   wire n21;
   wire n25;
   wire n37;
   wire n38;
   wire n39;

   assign col_cnt[2] = pixel[2] ;
   assign col_cnt[1] = pixel[1] ;
   assign col_cnt[0] = pixel[0] ;

   DFFNQX1MA10TR \row_cnt_reg[3]  (.Q(row_cnt[3]), 
	.D(n33), 
	.CKN(clk));
   DFFNQX1MA10TR conv_pool_reg (.Q(conv_pool), 
	.D(n32), 
	.CKN(clk));
   DFFNQX1MA10TR \row_cnt_reg[0]  (.Q(row_cnt[0]), 
	.D(n36), 
	.CKN(clk));
   DFFNQX1MA10TR \row_cnt_reg[2]  (.Q(row_cnt[2]), 
	.D(n34), 
	.CKN(clk));
   DFFNQX1MA10TR \col_cnt_reg[0]  (.Q(pixel[0]), 
	.D(n28), 
	.CKN(clk));
   DFFNQX1MA10TR \row_cnt_reg[1]  (.Q(row_cnt[1]), 
	.D(n35), 
	.CKN(clk));
   DFFNQX1MA10TR \col_cnt_reg[2]  (.Q(pixel[2]), 
	.D(n30), 
	.CKN(clk));
   DFFNQX1MA10TR \col_cnt_reg[1]  (.Q(pixel[1]), 
	.D(n29), 
	.CKN(clk));
   DFFNQX1MA10TR \col_cnt_reg[3]  (.Q(col_cnt[3]), 
	.D(n31), 
	.CKN(clk));
   AND2X1MA10TR U3 (.Y(n1), 
	.B(col_cnt[3]), 
	.A(N57));
   INVX1MA10TR U4 (.Y(n21), 
	.A(n7));
   OAI21X1MA10TR U5 (.Y(n20), 
	.B0(n18), 
	.A1(n13), 
	.A0(n7));
   OAI22X1MA10TR U6 (.Y(n35), 
	.B1(n22), 
	.B0(n18), 
	.A1(n20), 
	.A0(n11));
   NAND2X1BA10TR U7 (.Y(n22), 
	.B(n11), 
	.A(n13));
   OAI22X1MA10TR U8 (.Y(n33), 
	.B1(n15), 
	.B0(n16), 
	.A1(n17), 
	.A0(n14));
   NAND2X1BA10TR U9 (.Y(n39), 
	.B(n3), 
	.A(n2));
   AND3X1MA10TR U10 (.Y(N57), 
	.C(n13), 
	.B(n8), 
	.A(en));
   INVX1MA10TR U11 (.Y(n5), 
	.A(n3));
   XNOR2X1MA10TR U12 (.Y(N42), 
	.B(n37), 
	.A(row_cnt[2]));
   NAND2BX1MA10TR U13 (.Y(n37), 
	.B(\add_60/A[3] ), 
	.AN(row_cnt[1]));
   INVX1MA10TR U14 (.Y(\add_60/A[3] ), 
	.A(row_cnt[0]));
   XOR2X1MA10TR U15 (.Y(N43), 
	.B(n25), 
	.A(row_cnt[3]));
   AO1B2X1MA10TR U16 (.Y(N41), 
	.B1(row_cnt[1]), 
	.B0(row_cnt[0]), 
	.A0N(n37));
   NOR2X1AA10TR U17 (.Y(n25), 
	.B(n37), 
	.A(row_cnt[2]));
   NOR2X1MA10TR U18 (.Y(n7), 
	.B(rst), 
	.A(en));
   NAND3X1AA10TR U19 (.Y(n18), 
	.C(row_cnt[0]), 
	.B(n21), 
	.A(col_cnt[3]));
   NAND3BX1MA10TR U20 (.Y(n16), 
	.C(row_cnt[1]), 
	.B(n13), 
	.AN(n18));
   AND2X1MA10TR U21 (.Y(n2), 
	.B(N57), 
	.A(pixel[1]));
   AND2X1MA10TR U22 (.Y(n3), 
	.B(N57), 
	.A(pixel[0]));
   AND2X1MA10TR U23 (.Y(n4), 
	.B(N57), 
	.A(pixel[2]));
   OAI22X1MA10TR U24 (.Y(n34), 
	.B1(n16), 
	.B0(row_cnt[2]), 
	.A1(n15), 
	.A0(n14));
   OAI21X1MA10TR U25 (.Y(n36), 
	.B0(n23), 
	.A1(n13), 
	.A0(n7));
   XOR2X1MA10TR U26 (.Y(n23), 
	.B(row_cnt[0]), 
	.A(n24));
   NAND2X1BA10TR U27 (.Y(n24), 
	.B(n21), 
	.A(col_cnt[3]));
   OA21X1MA10TR U28 (.Y(n14), 
	.B0(n20), 
	.A1(n6), 
	.A0(row_cnt[1]));
   INVX1MA10TR U29 (.Y(n6), 
	.A(n13));
   AO22X1MA10TR U30 (.Y(n31), 
	.B1(n21), 
	.B0(N34), 
	.A1(n7), 
	.A0(col_cnt[3]));
   XOR2X1MA10TR U31 (.Y(N34), 
	.B(n38), 
	.A(n1));
   NOR2BX1MA10TR U32 (.Y(n38), 
	.B(n39), 
	.AN(n4));
   AO22X1MA10TR U33 (.Y(n29), 
	.B1(n21), 
	.B0(N32), 
	.A1(n7), 
	.A0(pixel[1]));
   XNOR2X1MA10TR U34 (.Y(N32), 
	.B(n5), 
	.A(n2));
   AO22X1MA10TR U35 (.Y(n30), 
	.B1(n21), 
	.B0(N33), 
	.A1(n7), 
	.A0(pixel[2]));
   XNOR2X1MA10TR U36 (.Y(N33), 
	.B(n39), 
	.A(n4));
   AO22X1MA10TR U37 (.Y(n28), 
	.B1(n21), 
	.B0(n5), 
	.A1(n7), 
	.A0(pixel[0]));
   NAND2X1BA10TR U38 (.Y(n32), 
	.B(n10), 
	.A(n9));
   OAI21X1MA10TR U39 (.Y(n9), 
	.B0(conv_pool), 
	.A1(n13), 
	.A0(n7));
   NAND4BX1MA10TR U40 (.Y(n10), 
	.D(n21), 
	.C(n12), 
	.B(n19), 
	.AN(rst));
   INVX1MA10TR U41 (.Y(n19), 
	.A(conv_pool));
   NOR2X1MA10TR U42 (.Y(n13), 
	.B(n12), 
	.A(rst));
   INVX1MA10TR U43 (.Y(n11), 
	.A(row_cnt[1]));
   INVX1MA10TR U44 (.Y(n15), 
	.A(row_cnt[2]));
   INVX1MA10TR U45 (.Y(n8), 
	.A(col_cnt[3]));
   NOR2BX1MA10TR U46 (.Y(n12), 
	.B(n17), 
	.AN(n26));
   NAND4BX1MA10TR U47 (.Y(n26), 
	.D(n15), 
	.C(n11), 
	.B(n27), 
	.AN(row_cnt[0]));
   OR4X1MA10TR U48 (.Y(n27), 
	.D(pixel[2]), 
	.C(n8), 
	.B(pixel[0]), 
	.A(pixel[1]));
   INVX1MA10TR U49 (.Y(n17), 
	.A(row_cnt[3]));
   XOR2X0P5MA10TR U50 (.Y(pixel[6]), 
	.B(\add_60/carry[6] ), 
	.A(N43));
   AND2X0P5MA10TR U51 (.Y(\add_60/carry[6] ), 
	.B(\add_60/carry[5] ), 
	.A(N42));
   XOR2X0P5MA10TR U52 (.Y(pixel[5]), 
	.B(\add_60/carry[5] ), 
	.A(N42));
   AND2X0P5MA10TR U53 (.Y(\add_60/carry[5] ), 
	.B(\add_60/carry[4] ), 
	.A(N41));
   XOR2X0P5MA10TR U54 (.Y(pixel[4]), 
	.B(\add_60/carry[4] ), 
	.A(N41));
   AND2X0P5MA10TR U55 (.Y(\add_60/carry[4] ), 
	.B(\add_60/A[3] ), 
	.A(col_cnt[3]));
   XOR2X0P5MA10TR U56 (.Y(pixel[3]), 
	.B(\add_60/A[3] ), 
	.A(col_cnt[3]));
endmodule

module Addr_cal_DW01_inc_0 (
	A, 
	SUM);
   input [7:0] A;
   output [7:0] SUM;

   // Internal wires
   wire [7:2] carry;

   ADDHX1MA10TR U1_1_2 (.S(SUM[2]), 
	.CO(carry[3]), 
	.B(carry[2]), 
	.A(A[2]));
   ADDHX1MA10TR U1_1_1 (.S(SUM[1]), 
	.CO(carry[2]), 
	.B(A[0]), 
	.A(A[1]));
   ADDHX1MA10TR U1_1_3 (.S(SUM[3]), 
	.CO(carry[4]), 
	.B(carry[3]), 
	.A(A[3]));
   ADDHX1MA10TR U1_1_6 (.S(SUM[6]), 
	.CO(SUM[7]), 
	.B(carry[6]), 
	.A(A[6]));
   ADDHX1MA10TR U1_1_4 (.S(SUM[4]), 
	.CO(carry[5]), 
	.B(carry[4]), 
	.A(A[4]));
   ADDHX1MA10TR U1_1_5 (.S(SUM[5]), 
	.CO(carry[6]), 
	.B(carry[5]), 
	.A(A[5]));
   INVX1MA10TR U1 (.Y(SUM[0]), 
	.A(A[0]));
endmodule

module Addr_cal (
	col, 
	row, 
	pixel, 
	c_p, 
	addr, 
	load, 
	write, 
	en);
   input [3:0] col;
   input [3:0] row;
   input [6:0] pixel;
   input c_p;
   output [7:0] addr;
   input [3:0] load;
   input write;
   input en;

   // Internal wires
   wire N16;
   wire N17;
   wire N18;
   wire N19;
   wire N20;
   wire N21;
   wire N22;
   wire N23;
   wire N30;
   wire N31;
   wire N38;
   wire N39;
   wire N40;
   wire N41;
   wire N42;
   wire N43;
   wire N44;
   wire N45;
   wire N46;
   wire N47;
   wire N91;
   wire N92;
   wire N93;
   wire N94;
   wire N95;
   wire N96;
   wire N97;
   wire N101;
   wire N102;
   wire N103;
   wire N104;
   wire N105;
   wire N109;
   wire N110;
   wire N111;
   wire N112;
   wire N113;
   wire N130;
   wire N131;
   wire N132;
   wire N133;
   wire N134;
   wire N135;
   wire N136;
   wire N137;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n70;
   wire n71;
   wire n72;
   wire n73;
   wire n74;
   wire n75;
   wire n76;
   wire n77;
   wire n78;
   wire n79;
   wire n80;
   wire n81;
   wire n82;
   wire n83;
   wire n84;
   wire n85;
   wire n86;
   wire n87;
   wire n88;
   wire n89;
   wire n90;
   wire n91;
   wire n92;
   wire n93;
   wire n94;
   wire n95;
   wire n96;
   wire n97;
   wire n98;
   wire n99;
   wire n100;
   wire n102;
   wire n103;
   wire n104;
   wire n105;
   wire n106;
   wire n107;
   wire n108;
   wire n109;
   wire n110;
   wire N129;
   wire N128;
   wire N124;
   wire N123;
   wire N119;
   wire N118;
   wire N117;
   wire N116;
   wire N115;
   wire N114;
   wire \add_50/carry[4] ;
   wire \add_50/carry[5] ;
   wire \add_50/carry[6] ;
   wire \add_48/carry[6] ;
   wire \add_48/carry[5] ;
   wire \add_46/carry[2] ;
   wire \add_46/carry[3] ;
   wire \add_46/carry[4] ;
   wire \add_46/carry[5] ;
   wire \add_46/carry[6] ;
   wire \add_0_root_add_0_root_add_52_2/carry[4] ;
   wire \add_0_root_add_0_root_add_52_2/carry[5] ;
   wire \add_0_root_add_0_root_add_52_2/carry[6] ;
   wire \add_0_root_add_0_root_add_52_2/carry[7] ;
   wire \add_0_root_add_0_root_add_52_2/carry[3] ;
   wire \add_0_root_add_0_root_add_52_2/carry[2] ;
   wire \add_0_root_add_0_root_add_52_2/carry[1] ;
   wire \sub_2_root_add_0_root_add_52_2/carry[2] ;
   wire \add_1_root_add_0_root_add_52_2/carry[4] ;
   wire \add_1_root_add_0_root_add_52_2/carry[3] ;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;

   assign N40 = pixel[0] ;
   assign N41 = pixel[1] ;
   assign N42 = pixel[2] ;
   assign N43 = pixel[3] ;
   assign N44 = pixel[4] ;
   assign N45 = pixel[5] ;
   assign N47 = pixel[6] ;
   assign N115 = col[1] ;
   assign N114 = col[0] ;

   Addr_cal_DW01_inc_0 add_27 (.A({ 1'b0,
		n9,
		n8,
		n7,
		n6,
		n5,
		n4,
		n3 }), 
	.SUM({ N23,
		N22,
		N21,
		N20,
		N19,
		N18,
		N17,
		N16 }));
   ADDFX1MA10TR \add_0_root_add_0_root_add_52_2/U1_5  (.S(N135), 
	.CO(\add_0_root_add_0_root_add_52_2/carry[6] ), 
	.CI(\add_0_root_add_0_root_add_52_2/carry[5] ), 
	.B(N119), 
	.A(N128));
   ADDFX1MA10TR \add_0_root_add_0_root_add_52_2/U1_4  (.S(N134), 
	.CO(\add_0_root_add_0_root_add_52_2/carry[5] ), 
	.CI(\add_0_root_add_0_root_add_52_2/carry[4] ), 
	.B(N118), 
	.A(N128));
   ADDFX1MA10TR \add_0_root_add_0_root_add_52_2/U1_3  (.S(N133), 
	.CO(\add_0_root_add_0_root_add_52_2/carry[4] ), 
	.CI(\add_0_root_add_0_root_add_52_2/carry[3] ), 
	.B(N117), 
	.A(N128));
   ADDFX1MA10TR \add_0_root_add_0_root_add_52_2/U1_1  (.S(N131), 
	.CO(\add_0_root_add_0_root_add_52_2/carry[2] ), 
	.CI(\add_0_root_add_0_root_add_52_2/carry[1] ), 
	.B(N115), 
	.A(N123));
   ADDFX1MA10TR \add_0_root_add_0_root_add_52_2/U1_2  (.S(N132), 
	.CO(\add_0_root_add_0_root_add_52_2/carry[3] ), 
	.CI(\add_0_root_add_0_root_add_52_2/carry[2] ), 
	.B(N116), 
	.A(N124));
   ADDFX1MA10TR \add_1_root_add_0_root_add_52_2/U1_3  (.S(N117), 
	.CO(\add_1_root_add_0_root_add_52_2/carry[4] ), 
	.CI(\add_1_root_add_0_root_add_52_2/carry[3] ), 
	.B(row[2]), 
	.A(col[3]));
   BUFX1BA10TR U3 (.Y(n4), 
	.A(N41));
   BUFX1BA10TR U4 (.Y(n5), 
	.A(N42));
   NOR2BX1MA10TR U5 (.Y(n56), 
	.B(c_p), 
	.AN(en));
   INVX1MA10TR U6 (.Y(n18), 
	.A(n109));
   INVX1MA10TR U7 (.Y(n20), 
	.A(n102));
   AOI22X1MA10TR U9 (.Y(n68), 
	.B1(n16), 
	.B0(N103), 
	.A1(n17), 
	.A0(N95));
   AOI22X1MA10TR U10 (.Y(n66), 
	.B1(n16), 
	.B0(N103), 
	.A1(n17), 
	.A0(N21));
   AOI22X1MA10TR U11 (.Y(n72), 
	.B1(n20), 
	.B0(n7), 
	.A1(n53), 
	.A0(N110));
   AOI22X1MA10TR U12 (.Y(n65), 
	.B1(n20), 
	.B0(n8), 
	.A1(n53), 
	.A0(N111));
   INVX1MA10TR U13 (.Y(N128), 
	.A(N129));
   NAND4BX1MA10TR U14 (.Y(n109), 
	.D(n19), 
	.C(n108), 
	.B(write), 
	.AN(load[2]));
   NOR2X1AA10TR U15 (.Y(n106), 
	.B(load[2]), 
	.A(write));
   INVX1MA10TR U16 (.Y(n19), 
	.A(load[3]));
   NAND3X1AA10TR U18 (.Y(n102), 
	.C(load[3]), 
	.B(n108), 
	.A(n106));
   INVX1MA10TR U21 (.Y(n17), 
	.A(n107));
   NAND4BX1MA10TR U22 (.Y(n107), 
	.D(n19), 
	.C(n108), 
	.B(load[2]), 
	.AN(write));
   AOI22X1MA10TR U23 (.Y(n59), 
	.B1(n16), 
	.B0(N30), 
	.A1(n17), 
	.A0(N22));
   AOI22X1MA10TR U24 (.Y(n75), 
	.B1(n16), 
	.B0(N102), 
	.A1(n17), 
	.A0(N94));
   AOI22X1MA10TR U25 (.Y(n51), 
	.B1(n18), 
	.B0(N137), 
	.A1(n53), 
	.A0(N113));
   AOI22X1MA10TR U26 (.Y(n74), 
	.B1(n18), 
	.B0(N134), 
	.A1(n53), 
	.A0(N110));
   AOI22X1MA10TR U27 (.Y(n67), 
	.B1(n18), 
	.B0(N135), 
	.A1(n53), 
	.A0(N111));
   AOI22X1MA10TR U28 (.Y(n58), 
	.B1(n20), 
	.B0(n9), 
	.A1(n53), 
	.A0(N38));
   AO1B2X1MA10TR U29 (.Y(addr[4]), 
	.B1(n50), 
	.B0(n7), 
	.A0N(n69));
   AOI22X1MA10TR U30 (.Y(n69), 
	.B1(n71), 
	.B0(n56), 
	.A1(n70), 
	.A0(n15));
   NAND2X1BA10TR U31 (.Y(n71), 
	.B(n73), 
	.A(n72));
   NAND2X1BA10TR U32 (.Y(n70), 
	.B(n75), 
	.A(n74));
   AO1B2X1MA10TR U33 (.Y(addr[5]), 
	.B1(n50), 
	.B0(n8), 
	.A0N(n62));
   AOI22X1MA10TR U34 (.Y(n62), 
	.B1(n64), 
	.B0(n56), 
	.A1(n63), 
	.A0(n15));
   NAND2X1BA10TR U35 (.Y(n64), 
	.B(n66), 
	.A(n65));
   NAND2X1BA10TR U36 (.Y(n63), 
	.B(n68), 
	.A(n67));
   AO1B2X1MA10TR U37 (.Y(addr[6]), 
	.B1(n50), 
	.B0(N46), 
	.A0N(n54));
   INVX1MA10TR U38 (.Y(N46), 
	.A(n9));
   AOI22X1MA10TR U39 (.Y(n54), 
	.B1(n57), 
	.B0(n56), 
	.A1(n55), 
	.A0(n15));
   NAND2X1BA10TR U40 (.Y(n57), 
	.B(n59), 
	.A(n58));
   AOI22X1MA10TR U41 (.Y(n52), 
	.B1(n16), 
	.B0(N105), 
	.A1(n17), 
	.A0(N97));
   BUFHX1MA10TR U42 (.Y(n7), 
	.A(N44));
   BUFHX1MA10TR U43 (.Y(n8), 
	.A(N45));
   NAND2X1BA10TR U44 (.Y(n55), 
	.B(n61), 
	.A(n60));
   AOI22X1MA10TR U45 (.Y(n61), 
	.B1(n16), 
	.B0(N104), 
	.A1(n17), 
	.A0(N96));
   AOI22X1MA10TR U46 (.Y(n60), 
	.B1(n18), 
	.B0(N136), 
	.A1(n53), 
	.A0(N112));
   OAI211X1MA10TR U47 (.Y(addr[7]), 
	.C0(n49), 
	.B0(n48), 
	.A1(n14), 
	.A0(n47));
   NAND2X1BA10TR U48 (.Y(n49), 
	.B(n50), 
	.A(n9));
   AOI222X1MA10TR U49 (.Y(n47), 
	.C1(n16), 
	.C0(N31), 
	.B1(n17), 
	.B0(N23), 
	.A1(n53), 
	.A0(N39));
   AO1B2X1MA10TR U50 (.Y(n48), 
	.B1(n52), 
	.B0(n51), 
	.A0N(n15));
   OAI22X1MA10TR U51 (.Y(n50), 
	.B1(n102), 
	.B0(n110), 
	.A1(n14), 
	.A0(n109));
   INVX1MA10TR U52 (.Y(n15), 
	.A(n110));
   AOI22X1MA10TR U53 (.Y(n73), 
	.B1(n16), 
	.B0(N102), 
	.A1(n17), 
	.A0(N20));
   AOI22X1MA10TR U54 (.Y(n88), 
	.B1(n18), 
	.B0(N132), 
	.A1(n53), 
	.A0(N92));
   AOI22X1MA10TR U55 (.Y(n86), 
	.B1(n20), 
	.B0(n5), 
	.A1(n53), 
	.A0(N92));
   AOI22X1MA10TR U56 (.Y(n89), 
	.B1(n16), 
	.B0(n5), 
	.A1(n17), 
	.A0(N92));
   AOI22X1MA10TR U57 (.Y(n82), 
	.B1(n16), 
	.B0(N101), 
	.A1(n17), 
	.A0(N93));
   INVX1MA10TR U58 (.Y(N101), 
	.A(n6));
   AOI22X1MA10TR U59 (.Y(n95), 
	.B1(n18), 
	.B0(N131), 
	.A1(n53), 
	.A0(N91));
   AOI22X1MA10TR U60 (.Y(n93), 
	.B1(n20), 
	.B0(n4), 
	.A1(n53), 
	.A0(N91));
   AOI22X1MA10TR U61 (.Y(n96), 
	.B1(n16), 
	.B0(n4), 
	.A1(n17), 
	.A0(N91));
   AOI22X1MA10TR U62 (.Y(n81), 
	.B1(n18), 
	.B0(N133), 
	.A1(n53), 
	.A0(N109));
   AOI22X1MA10TR U63 (.Y(n79), 
	.B1(n20), 
	.B0(n6), 
	.A1(n53), 
	.A0(N109));
   AO1B2X1MA10TR U64 (.Y(addr[3]), 
	.B1(n50), 
	.B0(n6), 
	.A0N(n76));
   AOI22X1MA10TR U65 (.Y(n76), 
	.B1(n78), 
	.B0(n56), 
	.A1(n77), 
	.A0(n15));
   NAND2X1BA10TR U66 (.Y(n78), 
	.B(n80), 
	.A(n79));
   NAND2X1BA10TR U67 (.Y(n77), 
	.B(n82), 
	.A(n81));
   INVX1MA10TR U68 (.Y(n14), 
	.A(n56));
   AOI22X1MA10TR U69 (.Y(n100), 
	.B1(n20), 
	.B0(n3), 
	.A1(n53), 
	.A0(N16));
   AOI22X1MA10TR U70 (.Y(n104), 
	.B1(n16), 
	.B0(n3), 
	.A1(n17), 
	.A0(N16));
   AOI22X1MA10TR U73 (.Y(n94), 
	.B1(n16), 
	.B0(n4), 
	.A1(n17), 
	.A0(N17));
   AOI22X1MA10TR U74 (.Y(n87), 
	.B1(n16), 
	.B0(n5), 
	.A1(n17), 
	.A0(N18));
   AOI22X1MA10TR U75 (.Y(n80), 
	.B1(n16), 
	.B0(N101), 
	.A1(n17), 
	.A0(N19));
   AO1B2X1MA10TR U76 (.Y(addr[0]), 
	.B1(n50), 
	.B0(n3), 
	.A0N(n97));
   AOI22X1MA10TR U77 (.Y(n97), 
	.B1(n99), 
	.B0(n56), 
	.A1(n98), 
	.A0(n15));
   NAND2X1BA10TR U78 (.Y(n99), 
	.B(n104), 
	.A(n100));
   NAND2X1BA10TR U79 (.Y(n98), 
	.B(n104), 
	.A(n103));
   AO1B2X1MA10TR U80 (.Y(addr[1]), 
	.B1(n50), 
	.B0(n4), 
	.A0N(n90));
   AOI22X1MA10TR U81 (.Y(n90), 
	.B1(n92), 
	.B0(n56), 
	.A1(n91), 
	.A0(n15));
   NAND2X1BA10TR U82 (.Y(n92), 
	.B(n94), 
	.A(n93));
   NAND2X1BA10TR U83 (.Y(n91), 
	.B(n96), 
	.A(n95));
   AO1B2X1MA10TR U84 (.Y(addr[2]), 
	.B1(n50), 
	.B0(n5), 
	.A0N(n83));
   AOI22X1MA10TR U85 (.Y(n83), 
	.B1(n85), 
	.B0(n56), 
	.A1(n84), 
	.A0(n15));
   NAND2X1BA10TR U86 (.Y(n85), 
	.B(n87), 
	.A(n86));
   NAND2X1BA10TR U87 (.Y(n84), 
	.B(n89), 
	.A(n88));
   NOR2X1AA10TR U88 (.Y(n108), 
	.B(load[0]), 
	.A(load[1]));
   INVX1MA10TR U89 (.Y(n16), 
	.A(n105));
   NAND4BX1MA10TR U90 (.Y(n105), 
	.D(n19), 
	.C(n106), 
	.B(load[1]), 
	.AN(load[0]));
   AND4X0P7MA10TR U91 (.Y(n53), 
	.D(n19), 
	.C(n106), 
	.B(load[0]), 
	.A(n21));
   INVX1MA10TR U92 (.Y(n21), 
	.A(load[1]));
   BUFHX1MA10TR U93 (.Y(n3), 
	.A(N40));
   BUFHX1MA10TR U94 (.Y(n6), 
	.A(N43));
   INVX1MA10TR U95 (.Y(n13), 
	.A(col[3]));
   BUFHX1MA10TR U96 (.Y(n9), 
	.A(N47));
   INVX1MA10TR U97 (.Y(n11), 
	.A(N115));
   INVX1MA10TR U98 (.Y(n12), 
	.A(col[2]));
   AOI22X1MA10TR U99 (.Y(n103), 
	.B1(n18), 
	.B0(N130), 
	.A1(n53), 
	.A0(N16));
   NAND2X1BA10TR U100 (.Y(n110), 
	.B(c_p), 
	.A(en));
   OR2X0P5MA10TR U101 (.Y(N105), 
	.B(\add_48/carry[6] ), 
	.A(n9));
   XNOR2X0P5MA10TR U102 (.Y(N104), 
	.B(n9), 
	.A(\add_48/carry[6] ));
   AND2X0P5MA10TR U103 (.Y(\add_48/carry[6] ), 
	.B(n8), 
	.A(\add_48/carry[5] ));
   XOR2X0P5MA10TR U104 (.Y(N103), 
	.B(\add_48/carry[5] ), 
	.A(n8));
   AND2X0P5MA10TR U105 (.Y(\add_48/carry[5] ), 
	.B(n7), 
	.A(n6));
   XOR2X0P5MA10TR U106 (.Y(N102), 
	.B(n6), 
	.A(n7));
   OR2X0P5MA10TR U107 (.Y(N97), 
	.B(\add_46/carry[6] ), 
	.A(n9));
   XNOR2X0P5MA10TR U108 (.Y(N96), 
	.B(n9), 
	.A(\add_46/carry[6] ));
   AND2X0P5MA10TR U109 (.Y(\add_46/carry[6] ), 
	.B(n8), 
	.A(\add_46/carry[5] ));
   XOR2X0P5MA10TR U110 (.Y(N95), 
	.B(\add_46/carry[5] ), 
	.A(n8));
   AND2X0P5MA10TR U111 (.Y(\add_46/carry[5] ), 
	.B(n7), 
	.A(\add_46/carry[4] ));
   XOR2X0P5MA10TR U112 (.Y(N94), 
	.B(\add_46/carry[4] ), 
	.A(n7));
   AND2X0P5MA10TR U113 (.Y(\add_46/carry[4] ), 
	.B(n6), 
	.A(\add_46/carry[3] ));
   XOR2X0P5MA10TR U114 (.Y(N93), 
	.B(\add_46/carry[3] ), 
	.A(n6));
   AND2X0P5MA10TR U115 (.Y(\add_46/carry[3] ), 
	.B(n5), 
	.A(\add_46/carry[2] ));
   XOR2X0P5MA10TR U116 (.Y(N92), 
	.B(\add_46/carry[2] ), 
	.A(n5));
   AND2X0P5MA10TR U117 (.Y(\add_46/carry[2] ), 
	.B(n4), 
	.A(n3));
   XOR2X0P5MA10TR U118 (.Y(N91), 
	.B(n3), 
	.A(n4));
   XOR2X0P5MA10TR U119 (.Y(N137), 
	.B(\add_0_root_add_0_root_add_52_2/carry[7] ), 
	.A(N129));
   AND2X0P5MA10TR U120 (.Y(\add_0_root_add_0_root_add_52_2/carry[7] ), 
	.B(N128), 
	.A(\add_0_root_add_0_root_add_52_2/carry[6] ));
   XOR2X0P5MA10TR U121 (.Y(N136), 
	.B(\add_0_root_add_0_root_add_52_2/carry[6] ), 
	.A(N128));
   AND2X0P5MA10TR U122 (.Y(\add_0_root_add_0_root_add_52_2/carry[1] ), 
	.B(N114), 
	.A(N115));
   XOR2X0P5MA10TR U123 (.Y(N130), 
	.B(N115), 
	.A(N114));
   AND2X0P5MA10TR U124 (.Y(N119), 
	.B(row[3]), 
	.A(\add_1_root_add_0_root_add_52_2/carry[4] ));
   XOR2X0P5MA10TR U125 (.Y(N118), 
	.B(\add_1_root_add_0_root_add_52_2/carry[4] ), 
	.A(row[3]));
   AND2X0P5MA10TR U126 (.Y(\add_1_root_add_0_root_add_52_2/carry[3] ), 
	.B(row[1]), 
	.A(col[2]));
   XOR2X0P5MA10TR U127 (.Y(N116), 
	.B(col[2]), 
	.A(row[1]));
   AND2X0P5MA10TR U128 (.Y(N129), 
	.B(n13), 
	.A(\sub_2_root_add_0_root_add_52_2/carry[2] ));
   XOR2X0P5MA10TR U129 (.Y(N124), 
	.B(\sub_2_root_add_0_root_add_52_2/carry[2] ), 
	.A(n13));
   AND2X0P5MA10TR U130 (.Y(\sub_2_root_add_0_root_add_52_2/carry[2] ), 
	.B(n12), 
	.A(n11));
   XOR2X0P5MA10TR U131 (.Y(N123), 
	.B(n11), 
	.A(n12));
   OR2X0P5MA10TR U132 (.Y(N113), 
	.B(\add_50/carry[6] ), 
	.A(n9));
   XNOR2X0P5MA10TR U133 (.Y(N112), 
	.B(n9), 
	.A(\add_50/carry[6] ));
   AND2X0P5MA10TR U134 (.Y(\add_50/carry[6] ), 
	.B(n8), 
	.A(\add_50/carry[5] ));
   XOR2X0P5MA10TR U135 (.Y(N111), 
	.B(\add_50/carry[5] ), 
	.A(n8));
   AND2X0P5MA10TR U136 (.Y(\add_50/carry[5] ), 
	.B(n7), 
	.A(\add_50/carry[4] ));
   XOR2X0P5MA10TR U137 (.Y(N110), 
	.B(\add_50/carry[4] ), 
	.A(n7));
   OR2X0P5MA10TR U138 (.Y(\add_50/carry[4] ), 
	.B(\add_46/carry[3] ), 
	.A(n6));
   XNOR2X0P5MA10TR U139 (.Y(N109), 
	.B(n6), 
	.A(\add_46/carry[3] ));
   AND2X0P5MA10TR U144 (.Y(N31), 
	.B(n9), 
	.A(\add_48/carry[6] ));
   XOR2X0P5MA10TR U145 (.Y(N30), 
	.B(\add_48/carry[6] ), 
	.A(n9));
   AND2X0P5MA10TR U150 (.Y(N39), 
	.B(n9), 
	.A(\add_50/carry[6] ));
   XOR2X0P5MA10TR U151 (.Y(N38), 
	.B(\add_50/carry[6] ), 
	.A(n9));
endmodule

module Data_reg_0 (
	dout, 
	din, 
	load, 
	clk, 
	rst);
   output [7:0] dout;
   input [7:0] din;
   input load;
   input clk;
   input rst;

   // Internal wires
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;

   DFFQX0P5MA10TR \dout_reg[7]  (.Q(dout[7]), 
	.D(n10), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[3]  (.Q(dout[3]), 
	.D(n6), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[6]  (.Q(dout[6]), 
	.D(n9), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[5]  (.Q(dout[5]), 
	.D(n8), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[2]  (.Q(dout[2]), 
	.D(n5), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[4]  (.Q(dout[4]), 
	.D(n7), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[1]  (.Q(dout[1]), 
	.D(n4), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[0]  (.Q(dout[0]), 
	.D(n3), 
	.CK(clk));
   AO22X1MA10TR U3 (.Y(n7), 
	.B1(n2), 
	.B0(din[4]), 
	.A1(n1), 
	.A0(dout[4]));
   AO22X1MA10TR U4 (.Y(n3), 
	.B1(n2), 
	.B0(din[0]), 
	.A1(n1), 
	.A0(dout[0]));
   AO22X1MA10TR U5 (.Y(n4), 
	.B1(n2), 
	.B0(din[1]), 
	.A1(n1), 
	.A0(dout[1]));
   AO22X1MA10TR U6 (.Y(n5), 
	.B1(n2), 
	.B0(din[2]), 
	.A1(n1), 
	.A0(dout[2]));
   AO22X1MA10TR U7 (.Y(n6), 
	.B1(n2), 
	.B0(din[3]), 
	.A1(n1), 
	.A0(dout[3]));
   AO22X1MA10TR U8 (.Y(n8), 
	.B1(n2), 
	.B0(din[5]), 
	.A1(n1), 
	.A0(dout[5]));
   AO22X1MA10TR U9 (.Y(n9), 
	.B1(n2), 
	.B0(din[6]), 
	.A1(n1), 
	.A0(dout[6]));
   AO22X1MA10TR U10 (.Y(n10), 
	.B1(n2), 
	.B0(din[7]), 
	.A1(n1), 
	.A0(dout[7]));
   NOR2X1MA10TR U11 (.Y(n1), 
	.B(n2), 
	.A(rst));
   NOR2BX1MA10TR U12 (.Y(n2), 
	.B(rst), 
	.AN(load));
endmodule

module Data_reg_3 (
	dout, 
	din, 
	load, 
	clk, 
	rst);
   output [7:0] dout;
   input [7:0] din;
   input load;
   input clk;
   input rst;

   // Internal wires
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;

   DFFQX0P5MA10TR \dout_reg[7]  (.Q(dout[7]), 
	.D(n12), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[3]  (.Q(dout[3]), 
	.D(n16), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[5]  (.Q(dout[5]), 
	.D(n14), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[6]  (.Q(dout[6]), 
	.D(n13), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[4]  (.Q(dout[4]), 
	.D(n15), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[0]  (.Q(dout[0]), 
	.D(n19), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[2]  (.Q(dout[2]), 
	.D(n17), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[1]  (.Q(dout[1]), 
	.D(n18), 
	.CK(clk));
   AO22X1MA10TR U3 (.Y(n19), 
	.B1(n20), 
	.B0(din[0]), 
	.A1(n21), 
	.A0(dout[0]));
   AO22X1MA10TR U4 (.Y(n18), 
	.B1(n20), 
	.B0(din[1]), 
	.A1(n21), 
	.A0(dout[1]));
   AO22X1MA10TR U5 (.Y(n17), 
	.B1(n20), 
	.B0(din[2]), 
	.A1(n21), 
	.A0(dout[2]));
   AO22X1MA10TR U6 (.Y(n16), 
	.B1(n20), 
	.B0(din[3]), 
	.A1(n21), 
	.A0(dout[3]));
   AO22X1MA10TR U7 (.Y(n15), 
	.B1(n20), 
	.B0(din[4]), 
	.A1(n21), 
	.A0(dout[4]));
   AO22X1MA10TR U8 (.Y(n14), 
	.B1(n20), 
	.B0(din[5]), 
	.A1(n21), 
	.A0(dout[5]));
   AO22X1MA10TR U9 (.Y(n13), 
	.B1(n20), 
	.B0(din[6]), 
	.A1(n21), 
	.A0(dout[6]));
   AO22X1MA10TR U10 (.Y(n12), 
	.B1(n20), 
	.B0(din[7]), 
	.A1(n21), 
	.A0(dout[7]));
   NOR2X1MA10TR U11 (.Y(n21), 
	.B(n20), 
	.A(rst));
   NOR2BX1MA10TR U12 (.Y(n20), 
	.B(rst), 
	.AN(load));
endmodule

module Data_reg_2 (
	dout, 
	din, 
	load, 
	clk, 
	rst);
   output [7:0] dout;
   input [7:0] din;
   input load;
   input clk;
   input rst;

   // Internal wires
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;

   DFFQX0P5MA10TR \dout_reg[4]  (.Q(dout[4]), 
	.D(n15), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[3]  (.Q(dout[3]), 
	.D(n16), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[5]  (.Q(dout[5]), 
	.D(n14), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[6]  (.Q(dout[6]), 
	.D(n13), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[0]  (.Q(dout[0]), 
	.D(n19), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[1]  (.Q(dout[1]), 
	.D(n18), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[2]  (.Q(dout[2]), 
	.D(n17), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[7]  (.Q(dout[7]), 
	.D(n12), 
	.CK(clk));
   AO22X1MA10TR U3 (.Y(n19), 
	.B1(n20), 
	.B0(din[0]), 
	.A1(n21), 
	.A0(dout[0]));
   AO22X1MA10TR U4 (.Y(n18), 
	.B1(n20), 
	.B0(din[1]), 
	.A1(n21), 
	.A0(dout[1]));
   AO22X1MA10TR U5 (.Y(n17), 
	.B1(n20), 
	.B0(din[2]), 
	.A1(n21), 
	.A0(dout[2]));
   AO22X1MA10TR U6 (.Y(n16), 
	.B1(n20), 
	.B0(din[3]), 
	.A1(n21), 
	.A0(dout[3]));
   AO22X1MA10TR U7 (.Y(n15), 
	.B1(n20), 
	.B0(din[4]), 
	.A1(n21), 
	.A0(dout[4]));
   AO22X1MA10TR U8 (.Y(n14), 
	.B1(n20), 
	.B0(din[5]), 
	.A1(n21), 
	.A0(dout[5]));
   AO22X1MA10TR U9 (.Y(n13), 
	.B1(n20), 
	.B0(din[6]), 
	.A1(n21), 
	.A0(dout[6]));
   AO22X1MA10TR U10 (.Y(n12), 
	.B1(n20), 
	.B0(din[7]), 
	.A1(n21), 
	.A0(dout[7]));
   NOR2X1MA10TR U11 (.Y(n21), 
	.B(n20), 
	.A(rst));
   NOR2BX1MA10TR U12 (.Y(n20), 
	.B(rst), 
	.AN(load));
endmodule

module Data_reg_1 (
	dout, 
	din, 
	load, 
	clk, 
	rst);
   output [7:0] dout;
   input [7:0] din;
   input load;
   input clk;
   input rst;

   // Internal wires
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;

   DFFQX0P5MA10TR \dout_reg[7]  (.Q(dout[7]), 
	.D(n12), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[5]  (.Q(dout[5]), 
	.D(n14), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[3]  (.Q(dout[3]), 
	.D(n16), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[6]  (.Q(dout[6]), 
	.D(n13), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[4]  (.Q(dout[4]), 
	.D(n15), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[0]  (.Q(dout[0]), 
	.D(n19), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[1]  (.Q(dout[1]), 
	.D(n18), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[2]  (.Q(dout[2]), 
	.D(n17), 
	.CK(clk));
   AO22X1MA10TR U3 (.Y(n19), 
	.B1(n20), 
	.B0(din[0]), 
	.A1(n21), 
	.A0(dout[0]));
   AO22X1MA10TR U4 (.Y(n18), 
	.B1(n20), 
	.B0(din[1]), 
	.A1(n21), 
	.A0(dout[1]));
   AO22X1MA10TR U5 (.Y(n17), 
	.B1(n20), 
	.B0(din[2]), 
	.A1(n21), 
	.A0(dout[2]));
   AO22X1MA10TR U6 (.Y(n16), 
	.B1(n20), 
	.B0(din[3]), 
	.A1(n21), 
	.A0(dout[3]));
   AO22X1MA10TR U7 (.Y(n15), 
	.B1(n20), 
	.B0(din[4]), 
	.A1(n21), 
	.A0(dout[4]));
   AO22X1MA10TR U8 (.Y(n14), 
	.B1(n20), 
	.B0(din[5]), 
	.A1(n21), 
	.A0(dout[5]));
   AO22X1MA10TR U9 (.Y(n13), 
	.B1(n20), 
	.B0(din[6]), 
	.A1(n21), 
	.A0(dout[6]));
   AO22X1MA10TR U10 (.Y(n12), 
	.B1(n20), 
	.B0(din[7]), 
	.A1(n21), 
	.A0(dout[7]));
   NOR2X1MA10TR U11 (.Y(n21), 
	.B(n20), 
	.A(rst));
   NOR2BX1MA10TR U12 (.Y(n20), 
	.B(rst), 
	.AN(load));
endmodule

module convolution_DW01_add_0 (
	A, 
	B, 
	CI, 
	SUM, 
	CO);
   input [7:0] A;
   input [7:0] B;
   input CI;
   output [7:0] SUM;
   output CO;

   // Internal wires
   wire n1;
   wire [7:1] carry;

   ADDFX1MA10TR U1_6 (.S(SUM[6]), 
	.CO(carry[7]), 
	.CI(carry[6]), 
	.B(B[6]), 
	.A(A[6]));
   ADDFX1MA10TR U1_5 (.S(SUM[5]), 
	.CO(carry[6]), 
	.CI(carry[5]), 
	.B(B[5]), 
	.A(A[5]));
   ADDFX1MA10TR U1_4 (.S(SUM[4]), 
	.CO(carry[5]), 
	.CI(carry[4]), 
	.B(B[4]), 
	.A(A[4]));
   ADDFX1MA10TR U1_3 (.S(SUM[3]), 
	.CO(carry[4]), 
	.CI(carry[3]), 
	.B(B[3]), 
	.A(A[3]));
   ADDFX1MA10TR U1_2 (.S(SUM[2]), 
	.CO(carry[3]), 
	.CI(carry[2]), 
	.B(B[2]), 
	.A(A[2]));
   ADDFX1MA10TR U1_1 (.S(SUM[1]), 
	.CO(carry[2]), 
	.CI(n1), 
	.B(B[1]), 
	.A(A[1]));
   XOR3X1MA10TR U1_7 (.Y(SUM[7]), 
	.C(carry[7]), 
	.B(B[7]), 
	.A(A[7]));
   AND2X1MA10TR U1 (.Y(n1), 
	.B(A[0]), 
	.A(B[0]));
   XOR2X1MA10TR U2 (.Y(SUM[0]), 
	.B(A[0]), 
	.A(B[0]));
endmodule

module convolution (
	din1, 
	din2, 
	din3, 
	din4, 
	dout, 
	rst, 
	clk, 
	en);
   input [7:0] din1;
   input [7:0] din2;
   input [7:0] din3;
   input [7:0] din4;
   output [7:0] dout;
   input rst;
   input clk;
   input en;

   // Internal wires
   wire N3;
   wire N4;
   wire N5;
   wire N6;
   wire N7;
   wire N8;
   wire N9;
   wire N10;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;

   convolution_DW01_add_0 add_19_2 (.A(din1), 
	.B(din3), 
	.CI(1'b0), 
	.SUM({ N10,
		N9,
		N8,
		N7,
		N6,
		N5,
		N4,
		N3 }));
   DFFQX0P5MA10TR \dout_reg[7]  (.Q(dout[7]), 
	.D(n12), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[6]  (.Q(dout[6]), 
	.D(n11), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[5]  (.Q(dout[5]), 
	.D(n10), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[4]  (.Q(dout[4]), 
	.D(n9), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[3]  (.Q(dout[3]), 
	.D(n8), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[2]  (.Q(dout[2]), 
	.D(n7), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[1]  (.Q(dout[1]), 
	.D(n6), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[0]  (.Q(dout[0]), 
	.D(n5), 
	.CK(clk));
   NOR2X1MA10TR U2 (.Y(n4), 
	.B(rst), 
	.A(n3));
   AO22X1MA10TR U4 (.Y(n12), 
	.B1(n4), 
	.B0(N10), 
	.A1(n3), 
	.A0(dout[7]));
   NOR2X1AA10TR U6 (.Y(n3), 
	.B(rst), 
	.A(en));
   AO22X1MA10TR U7 (.Y(n5), 
	.B1(n4), 
	.B0(N3), 
	.A1(n3), 
	.A0(dout[0]));
   AO22X1MA10TR U8 (.Y(n6), 
	.B1(n4), 
	.B0(N4), 
	.A1(n3), 
	.A0(dout[1]));
   AO22X1MA10TR U9 (.Y(n7), 
	.B1(n4), 
	.B0(N5), 
	.A1(n3), 
	.A0(dout[2]));
   AO22X1MA10TR U10 (.Y(n8), 
	.B1(n4), 
	.B0(N6), 
	.A1(n3), 
	.A0(dout[3]));
   AO22X1MA10TR U11 (.Y(n9), 
	.B1(n4), 
	.B0(N7), 
	.A1(n3), 
	.A0(dout[4]));
   AO22X1MA10TR U12 (.Y(n10), 
	.B1(n4), 
	.B0(N8), 
	.A1(n3), 
	.A0(dout[5]));
   AO22X1MA10TR U13 (.Y(n11), 
	.B1(n4), 
	.B0(N9), 
	.A1(n3), 
	.A0(dout[6]));
endmodule

module pool (
	din1, 
	din2, 
	din3, 
	din4, 
	dout, 
	rst, 
	en, 
	clk);
   input [7:0] din1;
   input [7:0] din2;
   input [7:0] din3;
   input [7:0] din4;
   output [7:0] dout;
   input rst;
   input en;
   input clk;

   // Internal wires
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n70;
   wire n71;
   wire n72;
   wire n73;
   wire n74;
   wire n75;
   wire n76;
   wire n77;
   wire n78;
   wire n79;
   wire n80;
   wire n81;
   wire n82;
   wire n83;
   wire n84;
   wire n85;
   wire n86;
   wire n87;
   wire n88;
   wire n89;
   wire n90;
   wire n91;
   wire n92;
   wire n93;
   wire n94;
   wire n95;
   wire n96;
   wire n97;
   wire n98;
   wire n99;
   wire n100;
   wire n101;
   wire n102;
   wire n103;
   wire n104;
   wire n105;
   wire n106;
   wire n107;
   wire n108;
   wire n109;
   wire n110;
   wire n111;
   wire n112;
   wire n113;
   wire n114;
   wire n115;
   wire n116;
   wire n117;
   wire n118;
   wire n119;
   wire n120;
   wire n121;
   wire n122;
   wire n123;
   wire n124;
   wire n125;
   wire n126;
   wire n127;
   wire n128;
   wire n129;

   DFFQX0P5MA10TR \dout_reg[6]  (.Q(dout[6]), 
	.D(n64), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[5]  (.Q(dout[5]), 
	.D(n63), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[4]  (.Q(dout[4]), 
	.D(n62), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[3]  (.Q(dout[3]), 
	.D(n61), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[2]  (.Q(dout[2]), 
	.D(n60), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[1]  (.Q(dout[1]), 
	.D(n59), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[0]  (.Q(dout[0]), 
	.D(n58), 
	.CK(clk));
   DFFQX0P5MA10TR \dout_reg[7]  (.Q(dout[7]), 
	.D(n65), 
	.CK(clk));
   NOR2X1MA10TR U2 (.Y(n12), 
	.B(n13), 
	.A(n49));
   NAND3BX1MA10TR U3 (.Y(n16), 
	.C(n50), 
	.B(n49), 
	.AN(n51));
   NAND3X1AA10TR U4 (.Y(n18), 
	.C(n51), 
	.B(n50), 
	.A(n49));
   INVX1MA10TR U5 (.Y(n8), 
	.A(n2));
   INVX1MA10TR U6 (.Y(n11), 
	.A(n3));
   INVX1MA10TR U7 (.Y(n27), 
	.A(din4[4]));
   OAI222X1MA10TR U8 (.Y(n49), 
	.C1(n7), 
	.C0(n113), 
	.B1(n112), 
	.B0(din2[7]), 
	.A1(n6), 
	.A0(n111));
   NAND2X0P5MA10TR U9 (.Y(n118), 
	.B(n27), 
	.A(din2[4]));
   NAND2X0P5MA10TR U10 (.Y(n78), 
	.B(n27), 
	.A(din1[4]));
   NAND2X0P5MA10TR U11 (.Y(n57), 
	.B(n27), 
	.A(din3[4]));
   AOI221X1MA10TR U13 (.Y(n13), 
	.C0(n71), 
	.B1(din3[7]), 
	.B0(n70), 
	.A1(din2[7]), 
	.A0(n69));
   AO22X0P5MA10TR U14 (.Y(n65), 
	.B1(n4), 
	.B0(n3), 
	.A1(n2), 
	.A0(dout[7]));
   NAND4BX0P5MA10TR U15 (.Y(n4), 
	.D(n7), 
	.C(n6), 
	.B(n5), 
	.AN(din2[7]));
   OAI22X0P5MA10TR U16 (.Y(n64), 
	.B1(n11), 
	.B0(n10), 
	.A1(n9), 
	.A0(n8));
   AOI221X0P5MA10TR U17 (.Y(n10), 
	.C0(n14), 
	.B1(din1[6]), 
	.B0(n13), 
	.A1(din2[6]), 
	.A0(n12));
   OAI22X0P5MA10TR U18 (.Y(n14), 
	.B1(n18), 
	.B0(n17), 
	.A1(n16), 
	.A0(n15));
   INVX0P5BA10TR U19 (.Y(n9), 
	.A(dout[6]));
   OAI22X0P5MA10TR U20 (.Y(n63), 
	.B1(n11), 
	.B0(n20), 
	.A1(n19), 
	.A0(n8));
   AOI221X0P5MA10TR U21 (.Y(n20), 
	.C0(n21), 
	.B1(din1[5]), 
	.B0(n13), 
	.A1(din2[5]), 
	.A0(n12));
   OAI22X0P5MA10TR U22 (.Y(n21), 
	.B1(n18), 
	.B0(n23), 
	.A1(n16), 
	.A0(n22));
   INVX0P5BA10TR U23 (.Y(n19), 
	.A(dout[5]));
   OAI22X0P5MA10TR U24 (.Y(n62), 
	.B1(n11), 
	.B0(n25), 
	.A1(n24), 
	.A0(n8));
   AOI221X0P5MA10TR U25 (.Y(n25), 
	.C0(n26), 
	.B1(din1[4]), 
	.B0(n13), 
	.A1(din2[4]), 
	.A0(n12));
   OAI22X0P5MA10TR U26 (.Y(n26), 
	.B1(n18), 
	.B0(n28), 
	.A1(n16), 
	.A0(n27));
   INVX0P5BA10TR U27 (.Y(n24), 
	.A(dout[4]));
   OAI22X0P5MA10TR U28 (.Y(n61), 
	.B1(n11), 
	.B0(n30), 
	.A1(n29), 
	.A0(n8));
   AOI221X0P5MA10TR U29 (.Y(n30), 
	.C0(n31), 
	.B1(din1[3]), 
	.B0(n13), 
	.A1(din2[3]), 
	.A0(n12));
   OAI22X0P5MA10TR U30 (.Y(n31), 
	.B1(n18), 
	.B0(n33), 
	.A1(n16), 
	.A0(n32));
   INVX0P5BA10TR U31 (.Y(n29), 
	.A(dout[3]));
   OAI22X0P5MA10TR U32 (.Y(n60), 
	.B1(n11), 
	.B0(n35), 
	.A1(n34), 
	.A0(n8));
   AOI221X0P5MA10TR U33 (.Y(n35), 
	.C0(n36), 
	.B1(din1[2]), 
	.B0(n13), 
	.A1(din2[2]), 
	.A0(n12));
   OAI22X0P5MA10TR U34 (.Y(n36), 
	.B1(n18), 
	.B0(n38), 
	.A1(n16), 
	.A0(n37));
   INVX0P5BA10TR U35 (.Y(n34), 
	.A(dout[2]));
   OAI22X0P5MA10TR U36 (.Y(n59), 
	.B1(n11), 
	.B0(n40), 
	.A1(n39), 
	.A0(n8));
   AOI221X0P5MA10TR U37 (.Y(n40), 
	.C0(n41), 
	.B1(n13), 
	.B0(din1[1]), 
	.A1(din2[1]), 
	.A0(n12));
   OAI22X0P5MA10TR U38 (.Y(n41), 
	.B1(n18), 
	.B0(n43), 
	.A1(n16), 
	.A0(n42));
   INVX0P5BA10TR U39 (.Y(n39), 
	.A(dout[1]));
   OAI22X0P5MA10TR U40 (.Y(n58), 
	.B1(n11), 
	.B0(n45), 
	.A1(n44), 
	.A0(n8));
   AOI221X0P5MA10TR U41 (.Y(n45), 
	.C0(n46), 
	.B1(n13), 
	.B0(din1[0]), 
	.A1(din2[0]), 
	.A0(n12));
   OAI22X0P5MA10TR U42 (.Y(n46), 
	.B1(n18), 
	.B0(n48), 
	.A1(n16), 
	.A0(n47));
   INVX0P5BA10TR U43 (.Y(n50), 
	.A(n13));
   ADDFX1MA10TR U44 (.CO(n51), 
	.CI(n52), 
	.B(n7), 
	.A(din3[7]));
   OA22X0P5MA10TR U45 (.Y(n52), 
	.B1(n15), 
	.B0(din3[6]), 
	.A1(n54), 
	.A0(n53));
   AOI32X0P5MA10TR U46 (.Y(n54), 
	.B1(n23), 
	.B0(din4[5]), 
	.A2(n57), 
	.A1(n56), 
	.A0(n55));
   OAI221X0P5MA10TR U47 (.Y(n56), 
	.C0(n66), 
	.B1(n32), 
	.B0(din3[3]), 
	.A1(n27), 
	.A0(din3[4]));
   OAI222X0P5MA10TR U48 (.Y(n66), 
	.C1(n38), 
	.C0(din4[2]), 
	.B1(n68), 
	.B0(n67), 
	.A1(n33), 
	.A0(din4[3]));
   OAI22X0P5MA10TR U49 (.Y(n68), 
	.B1(n37), 
	.B0(din3[2]), 
	.A1(n42), 
	.A0(din3[1]));
   AOI211X0P5MA10TR U50 (.Y(n67), 
	.C0(din3[0]), 
	.B0(n47), 
	.A1(n42), 
	.A0(din3[1]));
   NAND2X0P5AA10TR U51 (.Y(n55), 
	.B(n22), 
	.A(din3[5]));
   NOR2X0P5AA10TR U52 (.Y(n53), 
	.B(n17), 
	.A(din4[6]));
   AO22X0P5MA10TR U53 (.Y(n71), 
	.B1(n73), 
	.B0(din4[7]), 
	.A1(n5), 
	.A0(n72));
   INVX0P5BA10TR U54 (.Y(n5), 
	.A(din1[7]));
   OR6X0P5MA10TR U55 (.Y(n72), 
	.F(din2[7]), 
	.E(din3[7]), 
	.D(din4[7]), 
	.C(n70), 
	.B(n69), 
	.A(n73));
   OAI22X0P5MA10TR U56 (.Y(n73), 
	.B1(n75), 
	.B0(n74), 
	.A1(n15), 
	.A0(din1[6]));
   AOI32X0P5MA10TR U57 (.Y(n75), 
	.B1(n79), 
	.B0(din4[5]), 
	.A2(n78), 
	.A1(n77), 
	.A0(n76));
   OAI221X0P5MA10TR U58 (.Y(n77), 
	.C0(n80), 
	.B1(n32), 
	.B0(din1[3]), 
	.A1(n27), 
	.A0(din1[4]));
   OAI221X0P5MA10TR U59 (.Y(n80), 
	.C0(n83), 
	.B1(n82), 
	.B0(din4[2]), 
	.A1(n81), 
	.A0(din4[3]));
   OAI222X0P5MA10TR U60 (.Y(n83), 
	.C1(n47), 
	.C0(n84), 
	.B1(n37), 
	.B0(din1[2]), 
	.A1(n42), 
	.A0(din1[1]));
   AOI21X0P5MA10TR U61 (.Y(n84), 
	.B0(n86), 
	.A1(n85), 
	.A0(din4[1]));
   NAND2X0P5AA10TR U62 (.Y(n76), 
	.B(n22), 
	.A(din1[5]));
   NOR2X0P5AA10TR U63 (.Y(n74), 
	.B(n87), 
	.A(din4[6]));
   OAI22X0P5MA10TR U64 (.Y(n70), 
	.B1(n89), 
	.B0(n88), 
	.A1(n17), 
	.A0(din1[6]));
   AOI32X0P5MA10TR U65 (.Y(n89), 
	.B1(n79), 
	.B0(din3[5]), 
	.A2(n92), 
	.A1(n91), 
	.A0(n90));
   NAND2X0P5AA10TR U66 (.Y(n92), 
	.B(n28), 
	.A(din1[4]));
   OAI221X0P5MA10TR U67 (.Y(n91), 
	.C0(n93), 
	.B1(n33), 
	.B0(din1[3]), 
	.A1(n28), 
	.A0(din1[4]));
   OAI221X0P5MA10TR U68 (.Y(n93), 
	.C0(n94), 
	.B1(n82), 
	.B0(din3[2]), 
	.A1(n81), 
	.A0(din3[3]));
   OAI222X0P5MA10TR U69 (.Y(n94), 
	.C1(n48), 
	.C0(n95), 
	.B1(n38), 
	.B0(din1[2]), 
	.A1(n43), 
	.A0(din1[1]));
   AOI21X0P5MA10TR U70 (.Y(n95), 
	.B0(n86), 
	.A1(n85), 
	.A0(din3[1]));
   NAND2X0P5AA10TR U71 (.Y(n90), 
	.B(n23), 
	.A(din1[5]));
   NOR2X0P5AA10TR U72 (.Y(n88), 
	.B(n87), 
	.A(din3[6]));
   OAI22X0P5MA10TR U73 (.Y(n69), 
	.B1(n98), 
	.B0(n97), 
	.A1(n96), 
	.A0(din1[6]));
   AOI32X0P5MA10TR U74 (.Y(n98), 
	.B1(n79), 
	.B0(din2[5]), 
	.A2(n101), 
	.A1(n100), 
	.A0(n99));
   INVX0P5BA10TR U75 (.Y(n79), 
	.A(din1[5]));
   NAND2X0P5AA10TR U76 (.Y(n101), 
	.B(n102), 
	.A(din1[4]));
   OAI221X0P5MA10TR U77 (.Y(n100), 
	.C0(n104), 
	.B1(n103), 
	.B0(din1[3]), 
	.A1(n102), 
	.A0(din1[4]));
   OAI221X0P5MA10TR U78 (.Y(n104), 
	.C0(n105), 
	.B1(n82), 
	.B0(din2[2]), 
	.A1(n81), 
	.A0(din2[3]));
   OAI222X0P5MA10TR U79 (.Y(n105), 
	.C1(n109), 
	.C0(n108), 
	.B1(n107), 
	.B0(din1[2]), 
	.A1(n106), 
	.A0(din1[1]));
   INVX0P5BA10TR U80 (.Y(n109), 
	.A(din2[0]));
   AOI21X0P5MA10TR U81 (.Y(n108), 
	.B0(n86), 
	.A1(n85), 
	.A0(din2[1]));
   NOR2X0P5AA10TR U82 (.Y(n86), 
	.B(din1[1]), 
	.A(din1[0]));
   INVX0P5BA10TR U83 (.Y(n85), 
	.A(din1[0]));
   INVX0P5BA10TR U84 (.Y(n106), 
	.A(din2[1]));
   INVX0P5BA10TR U85 (.Y(n82), 
	.A(din1[2]));
   INVX0P5BA10TR U86 (.Y(n81), 
	.A(din1[3]));
   INVX0P5BA10TR U87 (.Y(n102), 
	.A(din2[4]));
   NAND2X0P5AA10TR U88 (.Y(n99), 
	.B(n110), 
	.A(din1[5]));
   NOR2X0P5AA10TR U89 (.Y(n97), 
	.B(n87), 
	.A(din2[6]));
   INVX0P5BA10TR U90 (.Y(n87), 
	.A(din1[6]));
   AND4X0P5MA10TR U91 (.Y(n112), 
	.D(n7), 
	.C(n6), 
	.B(n111), 
	.A(n113));
   INVX0P5BA10TR U92 (.Y(n7), 
	.A(din4[7]));
   OA22X0P5MA10TR U93 (.Y(n113), 
	.B1(n115), 
	.B0(n114), 
	.A1(n15), 
	.A0(din2[6]));
   AOI32X0P5MA10TR U94 (.Y(n115), 
	.B1(n110), 
	.B0(din4[5]), 
	.A2(n118), 
	.A1(n117), 
	.A0(n116));
   OAI221X0P5MA10TR U95 (.Y(n117), 
	.C0(n119), 
	.B1(n32), 
	.B0(din2[3]), 
	.A1(n27), 
	.A0(din2[4]));
   OAI222X0P5MA10TR U96 (.Y(n119), 
	.C1(n107), 
	.C0(din4[2]), 
	.B1(n121), 
	.B0(n120), 
	.A1(n103), 
	.A0(din4[3]));
   OAI22X0P5MA10TR U97 (.Y(n121), 
	.B1(n37), 
	.B0(din2[2]), 
	.A1(n42), 
	.A0(din2[1]));
   INVX0P5BA10TR U98 (.Y(n37), 
	.A(din4[2]));
   AOI211X0P5MA10TR U99 (.Y(n120), 
	.C0(din2[0]), 
	.B0(n47), 
	.A1(n42), 
	.A0(din2[1]));
   INVX0P5BA10TR U100 (.Y(n47), 
	.A(din4[0]));
   INVX0P5BA10TR U101 (.Y(n42), 
	.A(din4[1]));
   INVX0P5BA10TR U102 (.Y(n32), 
	.A(din4[3]));
   NAND2X0P5AA10TR U103 (.Y(n116), 
	.B(n22), 
	.A(din2[5]));
   INVX0P5BA10TR U104 (.Y(n22), 
	.A(din4[5]));
   NOR2X0P5AA10TR U105 (.Y(n114), 
	.B(n96), 
	.A(din4[6]));
   INVX0P5BA10TR U106 (.Y(n15), 
	.A(din4[6]));
   INVX0P5BA10TR U107 (.Y(n6), 
	.A(din3[7]));
   OA22X0P5MA10TR U108 (.Y(n111), 
	.B1(n123), 
	.B0(n122), 
	.A1(n17), 
	.A0(din2[6]));
   AOI32X0P5MA10TR U109 (.Y(n123), 
	.B1(n110), 
	.B0(din3[5]), 
	.A2(n126), 
	.A1(n125), 
	.A0(n124));
   INVX0P5BA10TR U110 (.Y(n110), 
	.A(din2[5]));
   NAND2X0P5AA10TR U111 (.Y(n126), 
	.B(n28), 
	.A(din2[4]));
   OAI221X0P5MA10TR U112 (.Y(n125), 
	.C0(n127), 
	.B1(n33), 
	.B0(din2[3]), 
	.A1(n28), 
	.A0(din2[4]));
   OAI222X0P5MA10TR U113 (.Y(n127), 
	.C1(n107), 
	.C0(din3[2]), 
	.B1(n129), 
	.B0(n128), 
	.A1(n103), 
	.A0(din3[3]));
   INVX0P5BA10TR U114 (.Y(n107), 
	.A(din2[2]));
   OAI22X0P5MA10TR U115 (.Y(n129), 
	.B1(n38), 
	.B0(din2[2]), 
	.A1(n43), 
	.A0(din2[1]));
   INVX0P5BA10TR U116 (.Y(n38), 
	.A(din3[2]));
   AOI211X0P5MA10TR U117 (.Y(n128), 
	.C0(din2[0]), 
	.B0(n48), 
	.A1(n43), 
	.A0(din2[1]));
   INVX0P5BA10TR U118 (.Y(n48), 
	.A(din3[0]));
   INVX0P5BA10TR U119 (.Y(n43), 
	.A(din3[1]));
   INVX0P5BA10TR U120 (.Y(n103), 
	.A(din2[3]));
   INVX0P5BA10TR U121 (.Y(n33), 
	.A(din3[3]));
   INVX0P5BA10TR U122 (.Y(n28), 
	.A(din3[4]));
   NAND2X0P5AA10TR U123 (.Y(n124), 
	.B(n23), 
	.A(din2[5]));
   INVX0P5BA10TR U124 (.Y(n23), 
	.A(din3[5]));
   NOR2X0P5AA10TR U125 (.Y(n122), 
	.B(n96), 
	.A(din3[6]));
   INVX0P5BA10TR U126 (.Y(n96), 
	.A(din2[6]));
   INVX0P5BA10TR U127 (.Y(n17), 
	.A(din3[6]));
   INVX0P5BA10TR U128 (.Y(n44), 
	.A(dout[0]));
   NOR2X0P5AA10TR U129 (.Y(n2), 
	.B(rst), 
	.A(n3));
   NOR2BX0P5MA10TR U130 (.Y(n3), 
	.B(rst), 
	.AN(en));
endmodule

module mux1 (
	din1, 
	din2, 
	c_p, 
	dout, 
	row, 
	col);
   input [7:0] din1;
   input [7:0] din2;
   input c_p;
   output [7:0] dout;
   input [3:0] row;
   input [3:0] col;

   // Internal wires
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;

   AND3X1MA10TR U2 (.Y(n2), 
	.C(n4), 
	.B(n3), 
	.A(n7));
   INVX1MA10TR U3 (.Y(n7), 
	.A(c_p));
   NAND3BX1MA10TR U4 (.Y(n4), 
	.C(n5), 
	.B(row[3]), 
	.AN(row[0]));
   NAND3BX1MA10TR U5 (.Y(n3), 
	.C(n6), 
	.B(col[3]), 
	.AN(col[0]));
   NOR2X1AA10TR U6 (.Y(n6), 
	.B(col[1]), 
	.A(col[2]));
   NOR2X1AA10TR U7 (.Y(n5), 
	.B(row[1]), 
	.A(row[2]));
   AO22X1MA10TR U9 (.Y(dout[0]), 
	.B1(n2), 
	.B0(din1[0]), 
	.A1(c_p), 
	.A0(din2[0]));
   AO22X1MA10TR U10 (.Y(dout[1]), 
	.B1(n2), 
	.B0(din1[1]), 
	.A1(c_p), 
	.A0(din2[1]));
   AO22X1MA10TR U11 (.Y(dout[2]), 
	.B1(n2), 
	.B0(din1[2]), 
	.A1(c_p), 
	.A0(din2[2]));
   AO22X1MA10TR U12 (.Y(dout[3]), 
	.B1(n2), 
	.B0(din1[3]), 
	.A1(c_p), 
	.A0(din2[3]));
   AO22X1MA10TR U13 (.Y(dout[4]), 
	.B1(n2), 
	.B0(din1[4]), 
	.A1(c_p), 
	.A0(din2[4]));
   AO22X1MA10TR U14 (.Y(dout[5]), 
	.B1(n2), 
	.B0(din1[5]), 
	.A1(c_p), 
	.A0(din2[5]));
   AO22X1MA10TR U15 (.Y(dout[6]), 
	.B1(n2), 
	.B0(din1[6]), 
	.A1(c_p), 
	.A0(din2[6]));
   AO22X1MA10TR U16 (.Y(dout[7]), 
	.B1(n2), 
	.B0(din1[7]), 
	.A1(c_p), 
	.A0(din2[7]));
endmodule

module simple_conv_pool (
	clk, 
	rst, 
	read, 
	addr, 
	din, 
	dout, 
	write);
   input clk;
   input rst;
   output read;
   output [7:0] addr;
   input [7:0] din;
   output [7:0] dout;
   output write;

   // Internal wires
   wire clk__L1_N0;
   wire pc_en;
   wire a_en;
   wire po_en;
   wire c_en;
   wire c_p;
   wire [3:0] load;
   wire [3:0] col;
   wire [3:0] row;
   wire [6:0] pixel;
   wire [7:0] data1;
   wire [7:0] data2;
   wire [7:0] data3;
   wire [7:0] data4;
   wire [7:0] temp1;
   wire [7:0] temp2;

   BUFX16BA10TR clk__L1_I0 (.Y(clk__L1_N0), 
	.A(clk));
   ctrl ctrl1 (.pixel_cnt_en(pc_en), 
	.addr_cal_en(a_en), 
	.pool_en(po_en), 
	.load(load), 
	.conv_en(c_en), 
	.read(read), 
	.write(write), 
	.clk(clk__L1_N0), 
	.rst(rst), 
	.c_p(c_p), 
	.col(col), 
	.row(row));
   pixel_cnt p1 (.en(pc_en), 
	.clk(clk__L1_N0), 
	.rst(rst), 
	.pixel(pixel), 
	.conv_pool(c_p), 
	.row_cnt(row), 
	.col_cnt(col));
   Addr_cal a1 (.col(col), 
	.row(row), 
	.pixel(pixel), 
	.c_p(c_p), 
	.addr(addr), 
	.load(load), 
	.write(write), 
	.en(a_en));
   Data_reg_0 d1 (.dout(data1), 
	.din(din), 
	.load(load[3]), 
	.clk(clk__L1_N0), 
	.rst(rst));
   Data_reg_3 d2 (.dout(data2), 
	.din(din), 
	.load(load[2]), 
	.clk(clk__L1_N0), 
	.rst(rst));
   Data_reg_2 d3 (.dout(data3), 
	.din(din), 
	.load(load[1]), 
	.clk(clk__L1_N0), 
	.rst(rst));
   Data_reg_1 d4 (.dout(data4), 
	.din(din), 
	.load(load[0]), 
	.clk(clk__L1_N0), 
	.rst(rst));
   convolution conv1 (.din1(data1), 
	.din2(data2), 
	.din3(data3), 
	.din4(data4), 
	.dout(temp1), 
	.rst(rst), 
	.clk(clk__L1_N0), 
	.en(c_en));
   pool pool1 (.din1(data1), 
	.din2(data2), 
	.din3(data3), 
	.din4(data4), 
	.dout(temp2), 
	.rst(rst), 
	.en(po_en), 
	.clk(clk__L1_N0));
   mux1 mu1 (.din1(temp1), 
	.din2(temp2), 
	.c_p(c_p), 
	.dout(dout), 
	.row(row), 
	.col(col));
endmodule

