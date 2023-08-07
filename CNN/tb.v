module tb;
reg clk,rst;
wire read,write;
wire [7:0]dout,din,addr;
parameter half_cycle=15;

simple_conv_pool uut(clk,rst,read,addr,din,dout,write);
//module simple_conv_pool(clk,rst,read,addr,din,dout,write);

mem m1(read,addr,din,dout,write,clk);


initial
begin
clk=0;
forever
clk=#half_cycle ~clk;
end

initial
begin
rst=1;
#(20*half_cycle)
rst=0;
end

initial
$readmemb("/home/IC19211398/ic_hw/image.txt",m1.memory,1,64);

endmodule



