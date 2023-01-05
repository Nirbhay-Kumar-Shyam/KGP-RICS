`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:25:25 11/04/2022 
// Design Name: 
// Module Name:    memory_control 
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
module memory_control(
input [1:0] mem_reg_pc,
input [31:0] mem_in,
input [31:0] reg_in,
input [31:0] pc_in,
output reg [31:0] write_data 
    );
	 always @(*) begin
	 case(mem_reg_pc)
		2'b01:
			write_data <= mem_in;
		2'b10:
			write_data <= pc_in;
		2'b11:
			write_data <= reg_in;
		default:
			begin
				//do nothing
			end
		endcase
	 end


endmodule
