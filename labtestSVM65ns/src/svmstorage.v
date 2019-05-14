module svmstorage(clk,dataIn,address,read,write,dataOut);
input signed [8:0] dataIn;
output signed[8:0] dataOut;
input clk;
input [7:0]address;
input read;
input write;
reg signed[8:0] memory[0:120];
wire signed[8:0] dataOut;

assign dataOut=read?memory[address]:9'b0;
always@(posedge clk)
	
	begin
	if(write)
		//memory[address]<=dataIn;//zhushe haishi feizhushe
		memory[address]<=dataIn;
	end
endmodule
