module ctrl(pixel_cnt_en,addr_cal_en,pool_en,load,conv_en,read,write,clk,rst,c_p,col,row);   

parameter idle=4'b0000,pixel_cnt=4'b0001,load_d1=4'b0010,load_d2=4'b0011,load_d3=4'b0100,load_d4=4'b0101,conv=4'b0110,write_stage=4'b0111,pool=4'b1000;

output reg pixel_cnt_en,addr_cal_en,conv_en,pool_en,write,read; 
output reg [3:0]load;
input clk,rst;  
input c_p;  //c_p for two different operate stage
input [3:0]col,row;

reg[3:0] n_s,c_s;


always@(posedge clk)
begin
 if(rst) c_s<=idle;
else c_s<=n_s;
end



always@(*)
begin
 
pixel_cnt_en=0;  
addr_cal_en=0;
conv_en=0;
pool_en=0;
load=4'b0;
read=0;
write=0;


case(c_s)
	
idle: n_s=load_d1;   
	
pixel_cnt:
	begin	
		pixel_cnt_en=1;
		n_s=load_d1;
	end 
	
load_d1:
	begin
		addr_cal_en=1;
		read=1;
		load[3]=1;
		n_s=load_d2;
	end
	
load_d2:
        begin
		addr_cal_en=1;
		read=1;
		load[2]=1;
		n_s=load_d3;
	end
	
load_d3:
        begin
		addr_cal_en=1;
		read=1;
		load[1]=1;
		n_s=load_d4;
	end
	
load_d4:
	begin
		addr_cal_en=1;
		read=1;
		load[0]=1;
		case(c_p)
		1'b0:n_s=conv;
		1'b1:n_s=pool;
		endcase
	end

	
conv:
	begin
		conv_en=1;
		n_s=write_stage;
	end
	
write_stage:
	begin
		addr_cal_en=1;
		write=1;
		n_s=pixel_cnt;
	end
	
pool:
	begin
		pool_en=1;
		if(col[0]==1 & row[0]==1) n_s=write_stage;
		else n_s=pixel_cnt;
	end

	
default: n_s=idle;

endcase

end


endmodule




