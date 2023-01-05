`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:53:14 11/09/2022
// Design Name:   RISC_KGP
// Module Name:   /home/nirbhay/Desktop/Ass_7_Grp_20/RICS_KGP_tb.v
// Project Name:  Ass_7_Grp_20
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RISC_KGP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RICS_KGP_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] retReg;

	// Instantiate the Unit Under Test (UUT)
	RISC_KGP uut (
		.clk(clk), 
		.rst(rst), 
		.retReg(retReg)
	);
	always #2 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#10;
      
		// Add stimulus here
		rst = 1;  
	end
      
endmodule

