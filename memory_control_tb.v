`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:51:09 11/09/2022
// Design Name:   memory_control
// Module Name:   /home/nirbhay/Desktop/Ass_7_Grp_20/memory_control_tb.v
// Project Name:  Ass_7_Grp_20
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory_control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module memory_control_tb;

	// Inputs
	reg [1:0] mem_reg_pc;
	reg [31:0] mem_in;
	reg [31:0] reg_in;
	reg [31:0] pc_in;

	// Outputs
	wire [31:0] write_data;

	// Instantiate the Unit Under Test (UUT)
	memory_control uut (
		.mem_reg_pc(mem_reg_pc), 
		.mem_in(mem_in), 
		.reg_in(reg_in), 
		.pc_in(pc_in), 
		.write_data(write_data)
	);

	initial begin
		// Initialize Inputs
		mem_reg_pc = 0;
		mem_in = 0;
		reg_in = 0;
		pc_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

