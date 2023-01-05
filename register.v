`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:43:32 11/03/2022 
// Design Name: 
// Module Name:    register 
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
module register(
input [4:0] reg1in,
input [4:0] reg2in,
input [1:0] wrReg,
input [31:0] wrData,
output [31:0] reg1out,
output [31:0] reg2out,
input clk,
input rst,
output [31:0] retReg
    );
	reg [31:0] registers[31:0];
	
	always @(posedge clk) begin
	if(rst) begin
				registers[0] <= 0;
            registers[1] <= 0;
            registers[2] <= 0;
            registers[3] <= 0;
            registers[4] <= 0;
            registers[5] <= 0;
            registers[6] <= 0;
            registers[7] <= 0;
            registers[8] <= 0;
            registers[9] <= 0;
            registers[10] <= 0;
            registers[11] <= 0;
            registers[12] <= 0;
            registers[13] <= 0;
            registers[14] <= 0;
            registers[15] <= 0;
            registers[16] <= 0;
            registers[17] <= 0;
            registers[18] <= 0;
            registers[19] <= 0;
            registers[20] <= 0;
            registers[21] <= 0;
            registers[22] <= 0;
            registers[23] <= 0;
            registers[24] <= 0;
            registers[25] <= 0;
            registers[26] <= 0;
            registers[27] <= 0;
            registers[28] <= 0;
            registers[29] <= 0;
            registers[30] <= 0;
            registers[31] <= 0;
	end else begin
		case(wrReg)
			2'b01:
				registers[reg1in] <= wrData;
			2'b10:
				registers[reg2in] <= wrData;
			2'b11:
				registers[5'b11111] <= wrData;
			default:
			begin
					// not do anything
			end
		endcase
	end
end

assign reg1out = registers[reg1in];
assign reg2out = registers[reg2in];
assign retReg = registers[5'b00001];

endmodule
