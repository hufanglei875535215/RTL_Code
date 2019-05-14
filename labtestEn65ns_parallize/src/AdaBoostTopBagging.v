module AdaBoostTopBagging(
clk,
rst,
en,
read1,
read2,
read3,
write1,
write2,
write3,
data1,
data2,
data3,
weight1,
weight2,
weight3,
bias1,
bias2,
bias3,
class_weight1,
class_weight2,
class_weight3,
address1,
address2,
address3,
total_ready,
total_predict,
flag
);
input clk;
input rst;
input en;
input signed [1:0] data1;
input signed [1:0] data2;
input signed [1:0]data3;
input read1;
input read2;
input read3;
input write1;
input write2;
input write3;
input[4:0]address1;
input[4:0] address2;
input[4:0] address3;
input signed [8:0] weight1;
input signed [8:0] bias1;
input signed [8:0] weight2;
input signed [8:0] bias2;
input signed [8:0] weight3;
input signed [8:0] bias3;
input signed [8:0] class_weight1;
input signed [8:0] class_weight2;
input signed [8:0] class_weight3;
wire signed [8:0] weight1out;
wire signed [8:0] weight2out;
wire signed [8:0] weight3out;
wire finish1;
wire finish2;
wire finish3;
output signed [1:0] total_predict;
output total_ready;
output flag;
wire flag;
wire signed [1:0] result1;
wire ready1;
wire signed [1:0] result2;
wire ready2;
wire signed [1:0] result3;
wire ready3;
reg signed [1:0] total_predict;
reg total_ready;
reg signed [8:0] temp1;
reg signed [8:0] temp2;
reg signed [8:0] temp3;
reg signed [8:0] total;
parameter IDEA1=4'b0001,step11=4'b0010,finish11=4'b0100,finish22=4'b1000;
reg[3:0] state;
always@(posedge clk or negedge rst)
	begin
		if(!rst)
			begin
			total_ready<=0;
			end
		else	
			begin
				if(ready1&&ready2&&ready3)
				total_ready<=1;
				else
				total_ready<=0;
			end
	end

always@(posedge clk or negedge rst)
begin
if(!rst)
begin
state<=IDEA1;
temp1<=0;
temp2<=0;
temp3<=0;
total_predict<=0;
total_ready<=0;
total<=0;
end
else
begin
	case(state)
		IDEA1: if(result1!=0&&result2!=0&&result3!=0)
			begin
				if(result1==2'b11)
					temp1<=temp1-class_weight1;
				else
					temp1<=temp1+class_weight1;
				if(result2==2'b11)
					temp2<=temp2-class_weight2;
				else
					temp2<=temp2+class_weight2;
				if(result3==2'b11)
					temp3<=temp3-class_weight3;
				else
					temp3<=temp3+class_weight3;
				state<=step11;
			end
		      else
				begin
				state<=IDEA1;
				temp1<=0;
				temp2<=0;
				temp3<=0;
				end
				
		step11: begin
				total<=temp1+temp2+temp3;
				state<=finish11;
			end
		finish11: begin
				if(total<0)
					total_predict<=2'b11;
				else
					begin
					if(total>0)
						total_predict<=2'b01;
					else
						total_predict<=2'b00;
					end
				state<=finish22;
				
			  end
		finish22: begin
				state<=IDEA1;
				$finish;
		          end
	endcase
end
end
assign flag=finish1&&finish2&&finish3;

AdaBoostBagging_Weigth_Memory m1(.clk(clk),.datain(weight1),.dataout(weight1out),.address(address1),.read(read1),.write(write1),.finish(finish1));
AdaBoostBagging_Weigth_Memory m2(.clk(clk),.datain(weight2),.dataout(weight2out),.address(address2),.read(read2),.write(write2),.finish(finish2));
AdaBoostBagging_Weigth_Memory m3(.clk(clk),.datain(weight3),.dataout(weight3out),.address(address3),.read(read3),.write(write3),.finish(finish3));

AdaBoostBagging bagging1(.clk(clk),.rst(rst),.en(en),.data(data1),.weight(weight1out),.bias(bias1),.result(result1),.ready(ready1));
AdaBoostBagging bagging2(.clk(clk),.rst(rst),.en(en),.data(data3),.weight(weight3out),.bias(bias3),.result(result3),.ready(ready3));
AdaBoostBagging bagging3(.clk(clk),.rst(rst),.en(en),.data(data2),.weight(weight2out),.bias(bias2),.result(result2),.ready(ready2));

endmodule
