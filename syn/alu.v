`timescale 1ns/100ps
`include "alu_function.v"
`include "alu_mode.v"

module alu (
    input [31: 0] rs1,
    input [31: 0] rs2,
    input [3: 0] mode,
    input clk,
    input reset,
    output reg [31: 0] rd
    );
    wire [31: 0] add_out, sub_out, sll_out, slt_out, sltu_out,
                 xor_out, srl_out, sra_out, or_out, and_out;

    alu_add iadd (.rs1(rs1), .rs2(rs2), .rd(add_out));
    alu_sub isub (.rs1(rs1), .rs2(rs2), .rd(sub_out));
    alu_sll isll (.rs1(rs1), .rs2(rs2), .rd(sll_out));
    alu_slt islt (.rs1(rs1), .rs2(rs2), .rd(slt_out));
    alu_sltu isltu (.rs1(rs1), .rs2(rs2), .rd(sltu_out));
    alu_xor ixor (.rs1(rs1), .rs2(rs2), .rd(xor_out));
    alu_srl isrl (.rs1(rs1), .rs2(rs2), .rd(srl_out));
    alu_sra isra (.rs1(rs1), .rs2(rs2), .rd(sra_out));
    alu_or ior (.rs1(rs1), .rs2(rs2), .rd(or_out));
    alu_and iand (.rs1(rs1), .rs2(rs2), .rd(and_out));

    always @(posedge clk or posedge reset) begin
        if (reset) 
	        rd = 32'b0;
	    else
   
	    case (mode)
            `ALU_OP_ADD: rd = add_out;
            `ALU_OP_SUB: rd = sub_out;
            `ALU_OP_SLL: rd = sll_out;
            `ALU_OP_SLT: rd = slt_out;
            `ALU_OP_SLTU: rd = sltu_out;
            `ALU_OP_XOR: rd = xor_out;
            `ALU_OP_SRL: rd = srl_out;
            `ALU_OP_SRA: rd = sra_out;
            `ALU_OP_OR: rd = or_out;
            `ALU_OP_AND: rd = and_out;
            default: rd = 32'b0;
        endcase
    end
endmodule
