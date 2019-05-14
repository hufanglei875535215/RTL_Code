module Testbench;
reg clk;
reg rst;
reg start;
reg write1,write2;
wire ready;
wire result;
reg signed [1:0] datamemory[0:219];
reg signed[8:0] memory[0:120];
reg signed [8:0] svmdata;
reg signed [1:0] testdata;
reg[8:0] i;
reg [8:0] j;
initial
	$readmemb("../src/testData.txt",datamemory);

initial
	$readmemb("../src/fixpointSVM.txt",memory);

initial
	begin
	clk=0;
	rst=1;
	write1=0;
	write2=0;
	start=0;
	i=0;
	j=0;
	svmdata<=0;
	testdata<=2'b01;
	#1000 rst=0;
	#1000 rst=1;
	#1000 start=1;
	#1000 write1=1;
	
	end
always #2.5 clk=~clk;
always@(posedge clk)
begin
	if(write1)
		if(i==121)
		begin
		write1<=0;
		write2<=1;
		i<=0;
		end
		else
		begin
		i=i+1;	
		svmdata<=memory[i];
		
		
		
		end	
end
always@(posedge clk)
begin
	if(write2)
	begin
		if(j==11)
		begin
			write2<=0;
			j<=0;
			
		end
		else
		begin
		j=j+1;
		testdata<=datamemory[j];
		
		
		
		
		end		
	end
end


fsm_Hand fsm(.clk(clk),.rst(rst),.start(start),.ready(ready),.result(result),.write1(write1),.write2(write2),.SVMin(svmdata),.datain(testdata));
endmodule
