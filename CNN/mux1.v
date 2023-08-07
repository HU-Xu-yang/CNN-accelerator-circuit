module mux1(din1,din2,c_p,dout,row,col);   //add row and cow to sel 0 or conv result
input [3:0] row,col;
input c_p;
input [7:0] din1,din2;
output reg[7:0] dout;

always@(*)
begin
if(!c_p)
begin
if(row==4'b1000||col==4'b1000) 
	dout=0;
else 
	dout=din1;
end
else dout=din2;
end
endmodule
