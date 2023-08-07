module pixel_cnt(en,clk,rst,pixel,conv_pool,row_cnt,col_cnt); 
input en,clk,rst;
output [6:0] pixel;  //current pixel number

output reg[3:0] row_cnt; //count for row 1-8;
output reg[3:0] col_cnt; //count for col 1-8;
output reg conv_pool; //0 for conv,1 for pool


always@(negedge clk)  //en only exist for one cycle,detect negedge
begin
	if(rst) 
	begin
		row_cnt<=4'b0001;
		col_cnt<=4'b0001;
		//done<=0;
		conv_pool<=0; //start at conv stage
	end
	else if(en)begin
		if (row_cnt==8&&col_cnt==8)begin
		col_cnt<=4'b0001;
		row_cnt<=4'b0001;
		conv_pool<=~conv_pool; 
		end
		else
             	if (row_cnt<=8)
	    	begin
	     		if(col_cnt<8) 
             		begin
				col_cnt<=col_cnt+1;
				row_cnt<=row_cnt;
				//done<=0;
				conv_pool<=conv_pool;
	     		end
	     		else 
             		begin
				col_cnt<=4'b0001;
				row_cnt<=row_cnt+1;  //similiar to mod 8 counter	
				//done<=0;
				conv_pool<=conv_pool;
             		end
             	end
	     	else
	     	begin
			col_cnt<=4'b0001;
			row_cnt<=4'b0001;
			//done<=1;
			conv_pool<=~conv_pool;  //conv change to pool
	     	end
	     end
             else
	     begin
	     	col_cnt<=col_cnt;
		row_cnt<=row_cnt;
		//done<=0;
		conv_pool<=conv_pool;
	     end
end

assign pixel=(row_cnt-1)*8+col_cnt;

endmodule
