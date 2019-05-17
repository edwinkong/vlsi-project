`timescale 1ns/100ps
`include "alu_function.v"

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
            4'b0000: rd = add_out;
            4'b1000: rd = sub_out;
            4'b0001: rd = sll_out;
            4'b0010: rd = slt_out;
            4'b0011: rd = sltu_out;
            4'b0100: rd = xor_out;
            4'b0101: rd = srl_out;
            4'b1101: rd = sra_out;
            4'b0110: rd = or_out;
            4'b0111: rd = and_out;
            default: rd = 32'b0;
        endcase
    end
endmodule
