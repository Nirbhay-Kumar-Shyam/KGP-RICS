`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:56:15 11/09/2022
// Design Name:   alu_control
// Module Name:   /home/nirbhay/Desktop/Ass_7_Grp_20/alu_control_tb.v
// Project Name:  Ass_7_Grp_20
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu_control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_control_tb;

	// Inputs
	reg [3:0] ALU_op;
	reg [5:0] fn_code;

	// Outputs
	wire [4:0] alu_control_signal;

	// Instantiate the Unit Under Test (UUT)
	alu_control uut (
		.ALU_op(ALU_op), 
		.fn_code(fn_code), 
		.alu_control_signal(alu_control_signal)
	);

	initial begin
		// Initialize Inputs
		ALU_op = 0;
		fn_code = 0;

		// Wait 100 ns for global reset to finish
		#100;
		ALU_op = 4'b0001;
		fn_code = 6'b00000;   //add 0
		#10
		 fn_code = 6'b000010;    //comp 1
		 #10
		 fn_code = 6'b000011;    //and 2
		 #10
		 fn_code = 6'b000100;
		 #10
		 ALU_op = 4'b0010;
		 fn_code = 6'b000001;    //addi
		 #10
       fn_code = 6'b000010;    //compi
		
		 
		 
		// Add stimulus here

	end
      
endmodule

