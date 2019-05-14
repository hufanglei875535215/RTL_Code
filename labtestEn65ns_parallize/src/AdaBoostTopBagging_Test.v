
module AdaBoostTopBagging_Test;
reg clk;
reg rst;
reg en;
reg signed [1:0] data1;
reg signed [8:0] weight1M [0:29];
reg signed [8:0] weight1;
reg signed [8:0] bias1;
reg signed [1:0] data2;
reg signed [8:0] weight2M [0:29];
reg signed [8:0] weight2;
reg signed [8:0] bias2;
reg signed [1:0] data3;
reg signed [8:0] weight3M [0:29];
reg signed [8:0] weight3;
reg signed [8:0] bias3;
reg signed [29:0] data;
reg signed [8:0] class_weight1;
reg signed [8:0] class_weight2;
reg signed [8:0] class_weight3;
reg [4:0] i;
reg[4:0] j;
reg[4:0] k;
reg [4:0] ii;
reg[4:0] jj;
reg[4:0] kk;
reg read1;
reg read2;
reg read3;
reg write1;
reg write2;
reg write3;
//the output signal
wire signed [1:0] total_result;
wire total_ready;
wire flag;
initial
begin
	$readmemb("../src/weight.txt",weight1M);
	$readmemb("../src/weight2.txt",weight2M);
	$readmemb("../src/weight3.txt",weight3M);
end
initial 
begin
/*
'010100000001001110110000000010',
 '111111111111111010000011001000',
 '111100010101001010000010000000',
 '111111111101101111111101111110',
 '000010000010000101111110111010',
 '111100010101001010000010000000',
 '000010100000011110111100110010',
 '110110000010110100111110001010',
 '111010011110111011011110111000',
 '111110010001111110111111110010'
*/
//1
//data=30'b010111011111101000010000010000;
//-1
//data=30'b010000000011011100100000001010;
data=30'b001000000001001001111111010110;
end
initial
begin
bias1=9'b101100100;
bias2=9'b100000001;
bias3=9'b100000101;
end

initial
begin
class_weight1=9'd255;
class_weight2=9'd238;
class_weight3=8'd210;
end
//initial the temp data
initial
begin
clk=0;
rst=1;
write1=0;
write2=0;
write3=0;
read1=0;
read2=0;
read3=0;
weight1=9'b110000001;
weight2=9'b101110110;
weight3=9'b101001100;
en=0;
i=0;
j=0;
k=0;
ii=0;
jj=0;
kk=0;
#20 rst=0;
#40 rst=1;
end
/*
initial
begin
#100
weight1=weight1M[0];
weight2=weight2M[0];
weight3=weight3M[0];
data1=data[0];
data2=data[0];
data3=data[0];
end
*/
initial
begin
#200
write1=1;
write2=1;
write3=1;
end

always #500 clk=~clk;

always@(posedge clk or negedge rst)
begin
if(!rst)
en<=0;
else
begin
	if(write1==1) 
	begin
		if(i<30)
		begin
		i<=i+1;
		ii=ii+1;
		weight1<=weight1M[ii];
		//ii<=ii+1;
		
		end
		else
		begin
		read1<=1;
		write1<=0;
		i<=0;
		end
	end
end
end

always@(posedge clk or negedge rst)
begin
if(!rst)
en<=0;
else
begin
	if(write2==1) 
	begin
		if(j<30)
		begin
		j<=j+1;
		jj=jj+1;
		weight2<=weight2M[jj];
		
		end
		else
		begin
		read2<=1;
		write2<=0;
		j<=0;
		end
	end
end
end

always@(posedge clk or negedge rst)
begin
if(!rst)
en<=0;
else
begin
	if(write3==1) 
	begin
		if(k<30)
		begin
		k<=k+1;
		kk=kk+1;
		weight3<=weight3M[kk];
		
		end
		else
		begin
		read3<=1;
		write3<=0;
		k<=0;
		end
	end
end
end

always@(posedge clk)
begin
if(read1&&read2&&read3)
begin
en<=1;
end
else
en<=0;
end

//data1,data2,data3 input
always@(posedge clk or negedge rst)
begin
if(!rst)
begin 
en<=0;
end
else
if(en==1)
begin 
	if(i==29)
				begin
				data1=data[i]; //put the data ready
				 en<=0;
				end
			else
			begin
				data1<=data[i];
				i<=i+1;
			end
end
end
always@(posedge clk or negedge rst)
begin
if(!rst)
begin 
en<=0;
end
else
if(en==1)
begin 
	if(j==29)
				begin
				data2=data[j];
				 en<=0;
				 read1<=0;
				read2<=0;
				read3<=0;
				end
			else
			begin
				data2<=data[j];
				j<=j+1;
			end
end
end

always@(posedge clk or negedge rst)
begin
if(!rst)
begin 
en<=0;
end
else
if(en==1)
begin 
	if(k==29)
				begin
				data3=data[k];
				 en<=0;
				end
			else
			begin
				data3<=data[k];
				k<=k+1;
			end
end
end


AdaBoostTopBagging bagging(
.clk(clk),
.rst(rst),
.en(en),
.read1(read1),
.read2(read2),
.read3(read3),
.write1(write1),
.write2(write2),
.write3(write3),
.data1(data1),
.data2(data2),
.data3(data3),
.weight1(weight1),
.weight2(weight2),
.weight3(weight3),
.class_weight1(class_weight1),
.class_weight2(class_weight2),
.class_weight3(class_weight3),
.bias1(bias1),
.bias2(bias2),
.bias3(bias3),
.address1(i),
.address2(j),
.address3(k),
.total_ready(total_ready),
.total_predict(total_result),
.flag(flag)
);
endmodule
