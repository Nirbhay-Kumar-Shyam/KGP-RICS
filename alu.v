`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:27:51 11/07/2022 
// Design Name: 
// Module Name:    alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu (
    input [4:0] alu_control_signal,
    input [31:0] in1,
    input [31:0] in2,
    input [31:0] shamt,
    output reg [31:0] ALU_out,
    output reg [4:0] flags
);

wire buff;
wire cout;
wire add_out;
wire p;
wire g;

cla_32bit adder(.in1(in1),.in2(in2),.c_in(0),.sum(add_out),.c_out(cout),.p(p),.g(g));


reg flags0,flags1,flags2,flags3,flags4;


integer i;
always @(*) begin

if(in1<0)flags[0]=1'b1;
else flags[0]=1'b0;
if(in1==0) flags[1]=1'b1;
else flags[1]=1'b0;
if(in1!=0) flags[2]=1'b1;
else flags[2]=1'b0;
if(cout==0) flags[3]=1'b1;
else flags[3]=1'b0;
if(cout!=0) flags[4]=1'b1;
else flags[4]=1'b0;
case(alu_control_signal)
	
5'b00000: ALU_out=add_out;     //add,lw(address),sw(address),b
5'b00001: ALU_out=~in2+32'b1;  //comp,compi
5'b00010: ALU_out=in1&&in2;    //and
5'b00011: ALU_out=in1^in2;     //xor
5'b00100: ALU_out=in1<<shamt;  //shll
5'b00101: ALU_out=in1>>shamt;  //shrl
5'b00110: ALU_out=in1<<in2;    //shllv
5'b00111: ALU_out=in1>>in2;    //shrl
5'b01000: ALU_out=in1>>>shamt;    //shra
5'b01001: ALU_out=in1>>>in2;    //shrav
5'b01010: ALU_out=in1;
5'b01011: begin					//bltz 11
ALU_out=in1;
flags[0]=flags0;
end
5'b01100: begin					//bnz  12
ALU_out=in1;
flags[2]=flags2;
end
5'b01101: begin					//bz   13
ALU_out=in1;
flags[1]=flags1;
end
5'b01110: begin					//bcy  14
ALU_out=in1;
flags[3]=flags3;
end
5'b01111: begin					//bncy  15
ALU_out=in1;
flags[4]=flags4;
end
5'b10000:begin						//diff   16
for(i=0;i<32;i=i+1)
	begin
		if(in1[i]!=in2[i]) 
			begin 
				ALU_out=i;
				i=32;
			end
	end
end



endcase
end
    
endmodule
