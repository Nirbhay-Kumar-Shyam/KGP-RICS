`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:30:45 11/03/2022 
// Design Name: 
// Module Name:    control_unit 
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

module control_unit (
    input[5:0]op,
    output reg [1:0]branch,
    output reg [3:0]ALUop,
    output reg mem_read,
    output reg mem_write,
    output reg alu_source,
    output reg [1:0]write_into,
    output reg [1:0] mem_reg_PC
);

//alu_source=0 for rt 1 for 32-bit extended imm
// writeinto=01 for rs 10 for rt 11 for 31 and 00 no write
// memregpc = 00 for memory 01 for register write 11 for writing contents in PC into register

always@(*) 
begin
    case(op)
    6'b000001:  begin                       //add,comp,and,xor 000001
				
            branch<=2'b00;
            mem_read<=1'b0;
            mem_write<=1'b0;
            alu_source<=1'b0;
            write_into<=2'b01;
            mem_reg_PC<=2'b01;
            ALUop<=4'b0001;
				end
    6'b000010:	begin                          //addi,compi 000010
            branch<=2'b00;
            mem_read<=1'b0;
            mem_write<=1'b0;
            alu_source<=1'b1;
            write_into<=2'b01;
            mem_reg_PC<=2'b01;
            ALUop<=4'b0010;
				end
    6'b000011: begin                          //shllv,shrlv,shrav 000011
            branch<=2'b00;
            mem_read<=1'b0;
            mem_write<=1'b0;
            alu_source<=1'b0;
            write_into<=2'b01;
            mem_reg_PC<=2'b01;
            ALUop<=4'b0011;
				end
    6'b000100: begin                         //shll,shrl,shra 000100
            branch<=2'b00;
            mem_read<=1'b0;
            mem_write<=1'b0;
            alu_source<=1'b1;
            write_into<=2'b01;
            mem_reg_PC<=2'b01;
            ALUop<=4'b0100;
				end
    6'b000101: begin                          //lw  111110
            branch<=2'b00;
            mem_read<=1'b1;
            mem_write<=1'b0;
            alu_source<=1'b1;
            write_into<=2'b10;
            mem_reg_PC<=2'b01;
            ALUop<=4'b0101;
				end
    6'b000111: begin                          //sw 111111
            branch<=2'b00;
            mem_read<=1'b0;
            mem_write<=1'b1;
            alu_source<=1'b1;
            write_into<=2'b00;
            mem_reg_PC<=2'b00;
            ALUop<=4'b0110;
				end
    6'b001000: begin                          //b,bltz,bnz,bz,bcy,bncy  000101
            branch<=2'b01;
            mem_read<=1'b0;
            mem_write<=1'b0;
            //alu_source<=1'b0;
            //write_into<=2'b01;
            //mem_reg_PC<=2'b01;
            ALUop<=4'b0111;
				end
    6'b001001: begin                          //br 111101
            branch<=2'b10;
            mem_read<=1'b0;
            mem_write<=1'b0;
            //alu_source<=1'b0;
            //write_into<=2'b01;
            //mem_reg_PC<=2'b01;
            //ALUop<=4'b1000;
				end
    6'b001010: begin                         //bl 000110
            branch<=2'b01;
            mem_read<=1'b0;
            mem_write<=1'b0;
            //alu_source<=1'b0;
            write_into<=2'b11;
            mem_reg_PC<=2'b11;
            ALUop<=4'b1001;
				end
    6'b001011: begin	 //diff 000111
            branch<=2'b00;
            mem_read<=1'b0;
            mem_write<=1'b0;
            alu_source<=1'b0;
            write_into<=2'b01;
            mem_reg_PC<=2'b01;
            ALUop<=4'b1010;
				end
				endcase
end
    
endmodule