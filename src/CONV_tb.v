	
`timescale 1ns/1ps

module CONV_tb();
  
	reg  signed [15:0] TiData[1:7][1:7];  // pic! input  Data
	reg  signed [15:0] ToData[1:5][1:5];  // cov result! output Data
	reg  signed [15:0] TiDataSingle;  // for transmission
	wire signed [15:0] ToDataSingle;  // for transmission
	reg clk;
	reg reset;
	reg CONV_start;
	wire CONV_finish;
	reg [7:0] i;
	reg [7:0] j;
	
	parameter period = 10;
	parameter hperiod = 5;

CONV CONV_T
(
    .reset(reset),
    .clk(clk),
    .CONV_start(CONV_start),
    .CONV_finish(CONV_finish),
    .CONV_iData(TiDataSingle),
    .CONV_oData(ToDataSingle)
);
             
initial
begin
  
$display("0.Load  Data");
  $readmemb("./src/Data_input.txt", TiData);	//load pic data
  for(i = 1; i < 8; i = i + 1)
    $display("%d %d %d %d %d %d %d", TiData[i][1], TiData[i][2], TiData[i][3], TiData[i][4], TiData[i][5], TiData[i][6], TiData[i][7]);
  
  
  clk = 0;
  CONV_start = 0;  
  reset = 1;      // Reset Chip
  #period  
  reset = 0;      // Chip Working
  #period 
  CONV_start = 1; // CONV start and writing data
  // align test data to the negedge of clk
  
$display("1.Write Data");	//period2-51
  for(i = 1; i < 8; i = i + 1)	//write by line 
  for(j = 1; j < 8; j = j + 1)
  begin
      TiDataSingle = TiData[i][j];
      #period;			//1 data input per period
  end
  CONV_start = 0; // finish writing data
  
  
$display("2.Convolution");	//conv_start=1
  while(!CONV_finish) #period;
  #period;
  
//conv cal cost 240ns  
$display("3.Read Conv Result");
  for(i = 1; i < 6; i = i + 1)
  for(j = 1; j < 6; j = j + 1)  
  begin
      ToData[i][j] = ToDataSingle;
      #period;
  end  
  for(i = 1; i < 6; i = i + 1)
    $display("%d %d %d %d %d", ToData[i][1], ToData[i][2], ToData[i][3], ToData[i][4], ToData[i][5]);  
  
$display("End");

	#period;
	$finish;
end

always #hperiod clk = !clk; 



	//dump fsdb
	initial begin
	$fsdbDumpfile("CONV.fsdb");
	$fsdbDumpvars(0,CONV_T);
	$fsdbDumpon;
	end
	
endmodule
