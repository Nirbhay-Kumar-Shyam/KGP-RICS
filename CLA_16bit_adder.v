`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:14 11/04/2022 
// Design Name: 
// Module Name:    CLA_16bit_adder 
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
module CLA_16bit_adder(
	input [15:0] in1,
	input	[15:0] in2,
	input c_in,
	output [15:0] sum,
	output c_out,
	output p,
	output g
    );
	 
	wire [3:0] carry, P, G;
	CLA_4bit_adder CLA1(.in1(in1[3:0]), .in2(in2[3:0]), .c_in(c_in), .sum(sum[3:0]), .p(P[0]), .g(G[0]));
	CLA_4bit_adder CLA2(.in1(in1[7:4]), .in2(in2[7:4]), .c_in(carry[0]), .sum(sum[7:4]), .p(P[1]), .g(G[1]));
	CLA_4bit_adder CLA3(.in1(in1[11:8]), .in2(in2[11:8]), .c_in(carry[1]), .sum(sum[11:8]), .p(P[2]), .g(G[2]));
	CLA_4bit_adder CLA4(.in1(in1[15:12]), .in2(in2[15:12]), .c_in(carry[2]), .sum(sum[15:12]), .p(P[3]), .g(G[3]));
	look_ahead_adder_unit lcu(.c_in(c_in), .p(P), .g(G), .carry(carry), .p_out(p), .g_out(g));
	assign c_out = carry[3];
endmodule
