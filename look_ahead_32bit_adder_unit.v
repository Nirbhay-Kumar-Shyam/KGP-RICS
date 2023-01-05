`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:36:18 11/04/2022 
// Design Name: 
// Module Name:    look_ahead_32bit_adder_unit 
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
module look_ahead_32bit_adder_unit(
	input [1:0] p,
	input [1:0] g,
	input c_in,
	output [1:0] carry,
	output p_out,
	output g_out
    );
	assign carry[0] = g[0] | (p[0] & c_in);
	assign carry[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c_in);
	
	assign p_out = p[0] & p[1];
	assign g_out = g[1] | (p[1] & g[0]);

	
endmodule
