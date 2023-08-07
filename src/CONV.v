//3*3 convolution kernal
//7*7 input data,5*5 output data
//weight=pic=16bit, dout=32bit =>16bit

`timescale 1ns/1ps

module CONV
	(
	input 	wire 	reset,
	input 	wire 	clk,
	input 	wire 	CONV_start,
	output 	reg 	CONV_finish,
	input 	wire 	signed [15:0] CONV_iData,	//iData 7*7-->iArrayData 7*7-->iReCon 3*3-->cal with core
	output 	reg 	signed [15:0] CONV_oData	//after cut
	);
  
	reg signed [15:0]CONV_core[1:9];
  
	reg  [3:0] ii_count;	//count for load input data array
	reg  [3:0] ij_count;
	reg  [3:0] ci_count;	//count for conv calculation
	reg  [3:0] cj_count;
	reg  [3:0] oi_count;	//count for record output result
	reg  [3:0] oj_count;

	reg  signed [15:0] CONV_iArrayData[1:7][1:7];  // input  Data:pic
	reg  signed [31:0] CONV_oArrayData[1:5][1:5];  // output Data:conv result(not cut yet)
	reg  CONV_StartCal;  // Start convolution

	reg  signed [31:0] CONV_oData_rdy;  //For cut

// For ReConstruct
	wire signed [15:0] CONV_iReCon[1:9];  // single conv pic data,total nums=core nums=3*3=9
	wire signed [31:0] CONV_mul[1:9];     //single multiplication in single conv,nums=9,bits=32
	wire signed [31:0] CONV_result;		//result for single conv,=sum 9 CONV_mul

// Calculating Convolution
	//withdraw 9 multiplier from input data array for everytime cov
	assign CONV_iReCon[1] = CONV_iArrayData[ci_count+0][cj_count+0];
	assign CONV_iReCon[2] = CONV_iArrayData[ci_count+0][cj_count+1];
	assign CONV_iReCon[3] = CONV_iArrayData[ci_count+0][cj_count+2];
	assign CONV_iReCon[4] = CONV_iArrayData[ci_count+1][cj_count+0];
	assign CONV_iReCon[5] = CONV_iArrayData[ci_count+1][cj_count+1];
	assign CONV_iReCon[6] = CONV_iArrayData[ci_count+1][cj_count+2];
	assign CONV_iReCon[7] = CONV_iArrayData[ci_count+2][cj_count+0];
	assign CONV_iReCon[8] = CONV_iArrayData[ci_count+2][cj_count+1];
	assign CONV_iReCon[9] = CONV_iArrayData[ci_count+2][cj_count+2];

	//multiplication in single conv
	assign CONV_mul[1] = CONV_core[1]*CONV_iReCon[1];
	assign CONV_mul[2] = CONV_core[2]*CONV_iReCon[2];
	assign CONV_mul[3] = CONV_core[3]*CONV_iReCon[3];
	assign CONV_mul[4] = CONV_core[4]*CONV_iReCon[4];
	assign CONV_mul[5] = CONV_core[5]*CONV_iReCon[5];
	assign CONV_mul[6] = CONV_core[6]*CONV_iReCon[6];
	assign CONV_mul[7] = CONV_core[7]*CONV_iReCon[7];
	assign CONV_mul[8] = CONV_core[8]*CONV_iReCon[8];
	assign CONV_mul[9] = CONV_core[9]*CONV_iReCon[9];

	//add in single conv
	assign CONV_result = CONV_mul[1] + CONV_mul[2] + CONV_mul[3] + CONV_mul[4] + CONV_mul[5] + CONV_mul[6] + CONV_mul[7] + CONV_mul[8] + CONV_mul[9];	
    
                
// Initial Conv Core
	always @(posedge reset)
	begin
	  CONV_core[1] <= 16'b1111110100000001;
	  CONV_core[2] <= 16'b0000000111001101;
	  CONV_core[3] <= 16'b1111111011111100;
	  CONV_core[4] <= 16'b1111111111000100;
	  CONV_core[5] <= 16'b1111111100110000;
	  CONV_core[6] <= 16'b1111110110110100;
	  CONV_core[7] <= 16'b1111111011011101;
	  CONV_core[8] <= 16'b1111111110111100;
	  CONV_core[9] <= 16'b1111110011111101;
	end


// Load input Data
	always @(posedge clk or posedge reset or posedge CONV_finish)
	begin

	  if(reset || CONV_finish)	//reset or conv finished
	  begin
	    ii_count <= 1;
	    ij_count <= 1;  
	    CONV_StartCal <= 0;
	  end

	  else if(CONV_start && (ii_count < 8))		//start conv
	  begin
	    if(ij_count < 7)		//by line
	      ij_count <= ij_count + 1;

	    else  
	    begin
	      if(ii_count < 7)begin ii_count <= ii_count + 1; ij_count <= 1;  end
	      else            begin CONV_StartCal <= 1; end
	    end

	    CONV_iArrayData[ii_count][ij_count] <= CONV_iData;  // Load pic Data to input data array
	  end
	end


// Convolution
	always @(posedge clk or posedge reset)
	begin

	  if(reset)	//reset
	  begin
	    ci_count <= 1;
	    cj_count <= 1;  
	    CONV_finish <= 0;
	  end

	  else if(CONV_StartCal && (ci_count < 6))
	  begin
	    if(cj_count < 5)	//record output by line
              cj_count <= cj_count + 1;

	    else 
	    begin
	      if(ci_count < 5)  begin ci_count <= ci_count + 1; cj_count <= 1;  end
	      else              begin CONV_finish <= 1; end
	    end
	      
	    CONV_oArrayData[ci_count][cj_count] <= CONV_result; // Record the Result
	  end
	end
  
// Output Data
	always @(posedge clk or posedge reset or posedge CONV_start)
	begin

	  if(reset || CONV_start)
	  begin
	    oi_count <= 1;
	    oj_count <= 1;
	  end

	  else if(CONV_finish && (oi_count < 6))
	  begin  
	    if(oj_count < 5)  oj_count <= oj_count + 1;
	    else  
	    begin
	      if(oi_count < 5)begin oi_count <= oi_count + 1; oj_count <= 1;  end
	
	    end
	    //cut: dout = {dout_rdy[31],dout_rdy[26:12]};
	    CONV_oData_rdy <= CONV_oArrayData[oi_count][oj_count];  // Output Data
	    CONV_oData <= {CONV_oData_rdy[31],CONV_oData_rdy[26:12]};
	  end
  
	end
  
  
endmodule
