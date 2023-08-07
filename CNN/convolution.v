module convolution(din1,din2,din3,din4,dout,rst,clk,en);

input [7:0] din1,din2,din3,din4 ;

output reg [7:0] dout;
input rst,en,clk;


always@(posedge clk)
begin
	
if(rst)begin
		dout<=0;

	end
	
else if(en)begin
		
dout<=din1*1+din2*0+din3*1+din4*0;
	end
	
else begin    
		dout<=dout;	end

end


endmodule

