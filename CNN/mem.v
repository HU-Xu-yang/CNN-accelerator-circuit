module mem(read,addr,dout,din,write,clk); 
input read,write,clk;
output [7:0] dout; //dout for read
input  [7:0] din;  //din for write
input [7:0] addr;
reg[7:0] memory[1:144];  //1-64 for conv input  65-128 for conv output 129-144 for pool output
//read
assign dout=(read)?memory[addr]:8'bz;
//write

always@(posedge clk)
begin
	if(write==1)
	memory[addr]<=din;
end
endmodule
