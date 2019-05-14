module fsm_Hand(clk,rst,start,ready,result,write1,write2,SVMin,datain);
input clk,rst,start;
input write1;
input write2;
input signed [8:0] SVMin;
input signed [1:0]datain;
output result;
output ready;
reg ready;
reg read1,read2;
reg result;
reg signed[15:0] reg_step1;
reg signed[15:0] step2_last;
reg signed[15:0] last;
reg[6:0]state;
parameter IDLE=7'b0000000,setdata=7'b0000001,setdata2=7'b0000010,step1=7'b0000100,step2=7'b0001000,step3=7'b0010000,finish=7'b0100000,break=7'b1000000;
parameter bias=8'b11111111;
wire signed [8:0] svmOut;
wire signed [1:0] dataOut;
reg[7:0]i;
reg[8:0]j,k,l;//1bit the biggest one of the  number is 1
always@(posedge clk or negedge rst)
	if(!rst)
		begin
			ready<=0;
			result<=0;
			i<=0;
			j<=0;
			k<=0;
			reg_step1<=0;		
			step2_last<=0;
			last<=0;
			state<=IDLE;
			read1<=0;
			read2<=0;
		end
	else
		case(state)
			IDLE:begin
				if(start)
					begin
						state<=setdata;
						ready<=0;
						result<=0;
						i<=0;
						j<=0;
						k<=0;
						reg_step1<=0;		
						step2_last<=0;
						last<=0;
						read1<=0;
						read2<=0;	
					end
				else
					state<=IDLE;
			     end
			setdata:begin
					if(write1)
						begin
							
							if(i==121)
								begin
									i<=i-121;
									state<=setdata2;
									read1<=1;
									//en<=1;
								end
							else
							begin
								i<=i+1;
								state<=setdata;
							end
							
						end// adjust 
					
				end
			setdata2:begin
					if(write2)
						begin
							if(j==11)
								begin
									state<=step1;
									read2<=1;
									j<=j-11;
								end
							else
								begin
									j<=j+1;		
									state<=setdata2;
								end
							
						end
				 end
			step1:begin
				if(j==11)
					begin
						state<=step2;	
						j<=j+k-11;
					end
				else
				   begin
					i<=i+1;//i biaoshi svmmatric de dizhi ; 
					j<=j+1;//j biaoshi testdata de dizhi ;
					reg_step1<=reg_step1+svmOut*dataOut;
					state<=step1;
				   end
			      end
			step2:begin
				if(k==11)
				  begin
					state<=step3;
				  end
				else
				   begin
					k<=k+1;//yong k lai biaoshi xiangying de dizhi zhi 
					step2_last<=step2_last+reg_step1*dataOut;
					reg_step1<=0;
					state<=step1;
					j<=j-k;						
				   end
			      end
			step3:begin
				last<=step2_last+bias;
				state<=finish;
			      end
			finish:begin
				ready<=1;
				if(last>0)
					result<=1;
				else
					result<=0;
				state<=break;
			       end
			break:begin
				result<=2'bx;
				reg_step1<=0;
				step2_last<=0;
				last<=0;
				i<=16'bx;
				j<=16'bx;
				k<=16'bx;
			      end
		endcase

svmstorage  svmdata(.clk(clk),.address(i),.read(read1),.write(write1),.dataIn(SVMin),.dataOut(svmOut));
testDataModule testdata(.clk(clk),.address(j),.read(read2),.write(write2),.dataIn(datain),.dataOut(dataOut));


endmodule
