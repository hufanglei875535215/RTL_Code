module AdaBoostBagging_Weigth_Memory(clk,datain,dataout,address,read,write,finish);
input clk;
input signed [8:0] datain;
input [4:0] address;
input read;
input write;
output signed[8:0] dataout;
output finish;
reg finish;
reg signed[8:0] dataout;
reg signed[8:0] memory[0:29];
always@(posedge clk)
begin
if(write==1)
	memory[address]<=datain;
end

always@(posedge clk)
begin
if(address==30)
	finish<=1;
else 
	finish<=0;
end

always@(posedge clk)
begin
if(read==1)
	dataout<=memory[address];
else
	dataout<=0;
end

//assign dataout=read?memory[address]:9'b0;
endmodule

