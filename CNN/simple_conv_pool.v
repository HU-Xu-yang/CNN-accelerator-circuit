module simple_conv_pool(clk,rst,read,addr,din,dout,write);
input clk,rst;
input [7:0]din;
output read,write;
output [7:0]dout,addr;
wire a_en,po_en,pc_en,c_en,c_p;
wire [3:0]load;
wire[6:0] pixel;
wire[7:0] data1,data2,data3,data4;
wire[3:0] row,col;
wire[7:0] temp1,temp2;

ctrl ctrl1(pc_en,a_en,po_en,load,c_en,read,write,clk,rst,c_p,col,row);
//module ctrl(pixel_cnt_en,mem_en,addr_cal_en,pool_en,load,conv_en,read,write,clk,rst,c_p,col,row);

pixel_cnt p1(pc_en,clk,rst,pixel,c_p,row,col);
//module pixel_cnt(en,clk,rst,pixel,conv_pool,row_cnt,col_cnt);

Addr_cal a1(col,row,pixel,c_p,addr,load,write,a_en);
//module Addr_cal(col,row,pixel,c_p,addr,load,write,en);

Data_reg d1(data1,din,load[3],clk,rst);
Data_reg d2(data2,din,load[2],clk,rst);
Data_reg d3(data3,din,load[1],clk,rst);
Data_reg d4(data4,din,load[0],clk,rst);

convolution conv1(data1,data2,data3,data4,temp1,rst,clk,c_en);
//module convolution(din1,din2,din3,din4,dout,rst,clk,en);

pool pool1(data1,data2,data3,data4,temp2,rst,po_en,clk);
//module pool(din1,din2,din3,din4,dout,rst,en,clk);
 
mux1 mu1(temp1,temp2,c_p,dout,row,col);
//module mux1(din,dout,row,col); 
endmodule
