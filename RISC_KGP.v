`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:37:26 10/26/2022 
// Design Name: 
// Module Name:    RISC_KGP 
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
module RISC_KGP(
		input clk,
		input rst,
		output [31:0] retReg
		);
	wire [31:0] PC_value, write_to_PC;
	wire [31:0] instr;
	wire [1:0] branch;
	wire [1:0] write_into;
	wire mem_read;
	wire mem_write;
	wire [1:0] mem_reg_pc;
	wire [3:0] ALUop;
	wire alu_source;
	wire [3:0] alu_control_signal;
	wire [31:0] alu_out, data_out;
	wire [31:0] write_data;
	wire [31:0] rsout;
	wire [31:0] rtout;
	wire [31:0] branch_address;
	wire [2:0] flags;
	wire [31:0] imm_32bit;
	wire [31:0] alu_in2;
	wire [31:0] pc_ref;
	wire [31:0] shamt;
	
	assign imm_32bit = {{22{instr[22]}}, instr[31:22]};
	assign branch_address = {{17{instr[22]}}, instr[20:6]};
	assign alu_in2 = alu_source ? rsout : imm_32bit;
	assign shamt = imm_32bit;
	
	
	memory_control MCL (
		.mem_reg_pc(mem_reg_pc),
		.mem_in(data_out),
		.reg_in(alu_out),
		.pc_in(PC_value),
		.write_data(write_data)
		);
	control_unit CTU(
    .op(instr[11:6]),
	 .branch(branch),
	 .mem_read(mem_read),
	 .mem_write(mem_write),
	 .alu_source(alu_source),
	 .write_into(write_into),
	 .mem_reg_PC(mem_reg_PC)

);
		
datamem DM (
  .clka(clk), // input clka
  .ena(mem_read), // input ena
  .wea(mem_write), // input [0 : 0] wea
  .addra(alu_out), // input [9 : 0] addra
  .dina(rtout), // input [31 : 0] dina
  .douta(data_out) // output [31 : 0] douta
);

insmem INF (
  .clka(clk), // input clka
  .wea(wea), // input [0 : 0] wea
  .addra(PC_value), // input [9 : 0] addra
  .dina(pc_ref), // input [31 : 0] dina
  .douta(instr) // output [31 : 0] douta
);
	
	program_counter PC(
		.pc_in(write_to_PC),
		.pc_out(PC_value),
		.clk(clk),
		.rst(rst)
	);
	
	
	
	alu ALU (
		.alu_control_signal(alu_control_signal),
		.in1(rsout),
		.in2(rtout),
		.shamt(shamt),
		.ALU_out(ALU_out),
		.flags(flags)
	);
	
	alu_control ACU(
		.ALUop(ALUop),
		.fn_code(instr[5:0]),
		.alu_control_signal(alu_control_signal)
	);
	
	branching_mechanism BM(
		.branch(branch),
		.imm_32bit(imm_32bit),
		.return_addr(rsout),
		.flags(flags),
		.PC_value(PC_value),
		.fn_code(instr[5:0]),
		.rst(rst),
		.clk(clk),
		.write_to_PC(write_to_PC),
		.write_to_reg(write_to_reg)
	);
	
	register REG(
		.reg1in(instr[16:12]),
		.reg2in(instr[21:17]),
		.wrReg(write_into),
		.wrData(write_data),
		.reg1out(rsout),
		.reg2out(rtout),
		.clk(clk),
		.rst(rst),
		.retReg(retReg)
    );
	
		
	
	
	
		
	


endmodule
