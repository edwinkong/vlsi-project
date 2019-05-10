`timescale 1ns/100ps
`define CLK 20
`define CLKH (`CLK / 2)
`include "alu_function.v"


module alu (
    input [31: 0] rs1,
    input [31: 0] rs2,
    input [3: 0] op,
    input reset,
    input clk,
    output [31: 0] rd
    );
    wire [31: 0] add_out, sub_out, sll_out, slt_out, sltu_out,
                 xor_out, srl_out, sra_out, or_out, and_out;
    reg [31: 0] rd;

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
        case (op)
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
        if (reset) rd = 32'b0;
    end
endmodule

module alu_tb();
    reg [31: 0] a, b;
    reg [3: 0] op;
    reg clk, reset;
    wire [31: 0] s;

    alu alu1 (.rs1(a), .rs2(b), .rd(s), .op(op), .clk(clk), .reset(reset));
    initial begin
        $display("--- alu simulation...");
        $dumpfile("alu.dump");
        $dumpvars;
        $display("--- clk = %-d", `CLK);
        a = 0; b = 0; clk = 0; reset = 0;
        #1;
        #(`CLK) a = 71; b = 82; op = 4'b0000;
        #(`CLK) a = 16; b = 3; op = 4'b0001;
        #(`CLK) a = 16; b = 8; op = 4'b0110;
        #(`CLK) a = 24; b = 8; op = 4'b0111;
        #(`CLK) $finish;
    end

    always #(`CLKH) clk = ~clk;

    always @(negedge clk)
        $display("time= %d: rest=%d a=%d b=%d s=%d", $time, reset, a, b, s);
endmodule