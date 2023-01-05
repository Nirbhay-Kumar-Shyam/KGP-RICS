`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:30:06 11/07/2022 
// Design Name: 
// Module Name:    alu_control 
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
module alu_control (
    input [3:0] ALUop,
    input [5:0] fn_code,
    output reg [4:0] alu_control_signal
);

always@(*)
begin
    case(ALUop)
        4'b0001:
        begin
            case(fn_code)
                6'b000001: alu_control_signal<=5'd0;    //add 0
                6'b000010: alu_control_signal<=5'd1;    //comp 1
                6'b000011: alu_control_signal<=5'd2;    //and 2
                6'b000100: alu_control_signal<=5'd3;    //xor 3
                default:   alu_control_signal<=5'd17;
            endcase
        end
        4'b0010:
        begin
            case(fn_code)
                6'b000001: alu_control_signal<=5'd0;    //addi
                6'b000010: alu_control_signal<=5'd1;    //compi
                default:   alu_control_signal<=5'd17;
            endcase
        end
        4'b0011:
        begin
            case(fn_code)
                6'b000001: alu_control_signal<=5'd6;    //shllv
                6'b000010: alu_control_signal<=5'd7;    //shrlv
                6'b000011: alu_control_signal<=5'd9;    //shrav
                default:   alu_control_signal<=5'd17;
            endcase
        end
        4'b0100:
        begin
            case(fn_code)
                6'b000001: alu_control_signal<=5'd4;    //shll
                6'b000010: alu_control_signal<=5'd5;    //shrl
                6'b000011: alu_control_signal<=5'd8;    //shra
                default:   alu_control_signal<=5'd17;
					 endcase
        end
        4'b0101:
        begin
            case(fn_code)
                6'b000001: alu_control_signal<=5'd0;    //lw
                default:   alu_control_signal<=5'd17;
            endcase
        end
        4'b0110:
        begin
            case(fn_code)
                6'b000001: alu_control_signal<=5'd0;    //sw
                default:   alu_control_signal<=5'd17;
            endcase
        end
        4'b0111:
        begin
            case(fn_code)
                6'b000001: alu_control_signal<=5'd10;    //b
                6'b000010: alu_control_signal<=5'd11;    //bltz
                6'b000011: alu_control_signal<=5'd12;    //bnz
                6'b000100: alu_control_signal<=5'd13;    //bz
                6'b000101: alu_control_signal<=5'd14;    //bcy
                6'b000110: alu_control_signal<=5'd15;    //bncy
                default:   alu_control_signal<=5'd17;
            endcase
        end
        4'b1001:	alu_control_signal<=5'd17;
        4'b1010:
        begin
            case(fn_code)
                6'b000001: alu_control_signal<=5'd16;    //diff
                default:   alu_control_signal<=5'd17;
            endcase
        end
    endcase
end
    
endmodule
