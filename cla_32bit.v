`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:16:47 11/04/2022 
// Design Name: 
// Module Name:    cla_32bit 
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
module cla_32bit(
	input [31:0] in1,
	input	[31:0] in2,
	input c_in,
	output [31:0] sum,
	output c_out,
	output p,
	output g
    );
	 wire [1:0] P, G, carry;
	CLA_16bit_adder add1(.in1(in1[15:0]), .in2(in2[15:0]), .c_in(c_in), .sum(sum[15:0]), .p(P[0]), .g(G[0]));
	CLA_16bit_adder add2(.in1(in1[31:16]), .in2(in2[31:16]), .c_in(carry[0]), .sum(sum[31:16]), .p(P[1]), .g(G[1]));
	look_ahead_32bit_adder_unit lcu32(.c_in(c_in), .p(P), .g(G), .carry(carry), .p_out(p), .g_out(g));
	assign c_out = carry[1];
	
endmodule
