module Logistic_Module(clk,rst,ready1,ready2,ready3,inPredict1,inPredict2,inPredict3,weight1,weight2,
weight3,bias,thred,final_ready,final_predict);
input clk;
input rst;
input signed [1:0] inPredict1;
input signed [1:0] inPredict2;
input signed [1:0] inPredict3;
input signed [9:0] weight1;
input signed [9:0] weight2;
input signed [9:0] weight3;
input signed [9:0] bias;
input signed [9:0] thred;
input ready1;
input ready2;
input ready3;
output final_ready;
output signed [1:0] final_predict;
reg final_ready;
reg signed [1:0] final_predict;
reg signed [10:0] temp1;
reg signed [10:0] temp2;
reg signed [10:0] temp3;
reg signed [10:0] final_temp;
reg signed [10:0] final_result;
reg [3:0] state;
parameter state1=4'b0001,state2=4'b0010,state3=4'b0100,state4=4'b1000,finish=4'b0000;
always@(posedge clk or negedge rst )
begin
if(!rst)
begin
final_ready<=0;
final_predict<=0;
state<=state1;
temp1<=0;
temp2<=0;
temp3<=0;
final_temp<=0;
final_result<=0;
end
else
case(state)
	state1:if(ready1&&ready2&&ready3)
		begin
			temp1<=inPredict1*weight1;
			temp2<=inPredict2*weight2;
			temp3<=inPredict3*weight3;
			state<=state2;
		end
		else
			state<=state1;
	state2:begin
			final_temp<=temp1+temp2+temp3;
			state<=state3;
	       end
	state3:begin
			final_result<=final_temp-bias;
			state<=state4;
		end
	state4:begin
			if(final_result>thred)
				begin
					final_predict<=2'b01;
					final_ready<=1;
					state<=finish;
					
				end
			else
				begin
					final_predict<=2'b11;
					final_ready<=1;
					state<=finish;
				end
		end

	finish:begin
			state<=state1;
			$finish;
		end
endcase
end
endmodule
