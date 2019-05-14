module baseClassifier(clk,rst,en,data,weight,bias,result,ready);
input clk;
input rst;
input en;
input signed [1:0] data;
input signed [8:0] weight;
input signed [8:0] bias;
output signed [1:0] result;
output ready;
reg signed [1:0] result;
reg ready;
reg[5:0] i;
reg signed [11:0] temp;
parameter IDEA=4'b0001,step1=4'b0010,step2=4'b0100,finish=4'b1000;
reg [3:0] state;
always@(posedge clk or negedge rst)
if(!rst)
begin
i<=0;
result<=0;
ready<=0;
temp<=0;
state<=IDEA;
end
else
case(state)
	IDEA:if(en)
		begin
		state<=step1;
		result<=0;
		ready<=0;
		temp<=0;
		end
	     else
		state<=IDEA;
	step1:if(i<=29)
		begin
		temp<=temp+data*weight;	
		i<=i+1;
		result<=0;
		ready<=0;
		end
	      else
		state<=step2;
	step2: begin
	       temp<=temp+bias;
	       state<=finish;	
		end
	finish: begin
		if(temp<0)
		begin
			result<=2'b11;
			ready<=1;
			temp<=0;
		end
		else
		begin
			result<=2'b01;
			ready<=1;
			temp<=0;
		end
		state<=IDEA;
		end
endcase

endmodule
