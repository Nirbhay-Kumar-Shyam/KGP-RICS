`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:05:05 10/28/2022 
// Design Name: 
// Module Name:    branching_mechanism 
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
module branching_mechanism (
    input [2:0] branch,
    input [31:0] imm_32bit,
    input [31:0] return_addr,
    input [4:0] flags,
    input [31:0] PC_value,
    input [5:0] fn_code,
    input rst,
    input clk,
    output reg [31:0] write_to_PC,
	 output reg [31:0] write_to_reg
);

reg [2:0] old;

always @(posedge clk) begin
		if(rst)
			old <= 3'b000;
		else
			old <= flags;
	end

always @(*) begin
            case(branch)
                3'b001: begin
									case(fn_code)
										 6'b000000: begin
											  write_to_PC<=PC_value+imm_32bit;
										 end
										 6'b000001: begin
											  write_to_PC<=return_addr;
										 end
										 default: begin
											  write_to_PC<=PC_value+32'd1;
										 end
										 
										 endcase
							end
                3'b010: begin
                        if(flags[0]==1'b1)
                            write_to_PC<=PC_value+imm_32bit;
                        else
                            write_to_PC<=PC_value+32'd1;
								end
                3'b011: begin
                        if(flags[1]==1'b1)
                            write_to_PC<=PC_value+imm_32bit;
                        else
                            write_to_PC<=PC_value+32'd1; 
								end
                3'b100: begin
                        if(flags[2]==1'b1)
                            write_to_PC<=PC_value+imm_32bit;
                        else
                            write_to_PC<=PC_value+32'd1;
								end
                3'b101: begin
                        write_to_reg<=PC_value+32'd1;
								end
                3'b110: begin
                        if(flags[3]==1'b1)
                            write_to_PC<=PC_value+imm_32bit;
                        else
                            write_to_PC<=PC_value+32'd1;
								end
                3'b111: begin
                        if(flags[4]==1'b1)
                            write_to_PC<=PC_value+imm_32bit;
                        else
                            write_to_PC<=PC_value+32'd1;
								end
                default: begin
                         write_to_PC<=PC_value+32'd1;
								end
				endcase
				end
    
endmodule
