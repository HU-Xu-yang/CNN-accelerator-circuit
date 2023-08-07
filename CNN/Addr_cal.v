module Addr_cal(col,row,pixel,c_p,addr,load,write,en);
input[3:0]col,row;
input[6:0] pixel;
input c_p; //from pixel_cnt,judge whether convolution or pool

output reg[7:0] addr;

input [3:0]load;
input write;

input en;



always@(*)
begin
	
if(en==0)	addr=0;

else if(c_p==0)
begin     //conv_stage address calculate
	
case({load,write})
		
5'b10000:addr=pixel;
		
5'b01000:addr=pixel+1;
		
5'b00100:addr=pixel+8;
		
5'b00010:addr=pixel+9;
		
5'b00001:addr=pixel+64;  //write address
		
default:addr=0;
	endcase
	
end
	
else begin   //pool_stage address calculate
	
case({load,write})
		
5'b10000:addr=pixel+64;
		
5'b01000:addr=pixel+65;
		
5'b00100:addr=pixel+72;
		
5'b00010:addr=pixel+73;

5'b00001:addr=col+128-col[3:1]+4*row[3:1];	
default:addr=0;
	
endcase
	
end

end


endmodule
