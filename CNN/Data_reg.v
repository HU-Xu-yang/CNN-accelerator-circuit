module Data_reg(
output reg[7:0] dout,
input[7:0] din,
input load,clk,rst);

always@(posedge clk)
if(rst) dout<=0;
else if(load) dout<=din;

endmodule
