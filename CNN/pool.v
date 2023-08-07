module pool(din1,din2,din3,din4,dout,rst,en,clk);

input [7:0] din1,din2,din3,din4 ;

output reg [7:0] dout;

input rst,en,clk;



always@(posedge clk)
begin
	
if(rst) dout<=0;
	
else if(en)begin
	
if((din1>=din2)&(din1>=din3)&(din1>=din4))   dout<=din1;			
else if((din2>=din3)&(din2>=din4))  dout<=din2;				
else if(din3>=din4)  dout<=din3;
else dout<=din4;
end
end
  			
endmodule
