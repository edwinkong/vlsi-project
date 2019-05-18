`timescale 10ns/100ps
`define CLK 20
`define CLKH (`CLK / 2)
`include "alu.v"

module alu_sub_tb();
    reg [31: 0] rs1, rs2;
    reg [3: 0] mode;
    reg clk, reset;
    wire [31: 0] rd;

    alu specimen (.rs1(rs1), .rs2(rs2), .rd(rd), .mode(mode), .clk(clk), .reset(reset));
    initial begin
        $display("--- alu simulation...");
        $display("--- clk = %-d", `CLK);
        rs1 = 0; rs2 = 0; clk = 0; reset = 0;
        #1;
        #(`CLK) mode = `ALU_OP_ADD; rs1 = 18; rs2 = 12;
        #(`CLK) mode = `ALU_OP_SUB; rs1 = 18; rs2 = 12;
        #(`CLK) mode = `ALU_OP_SLL; rs1 = 2; rs2 = 1;
        #(`CLK) mode = `ALU_OP_SLT; rs1 = -1; rs2 = 1;
        #(`CLK) mode = `ALU_OP_SLTU; rs1 = -1; rs2 = 1;
        #(`CLK) mode = `ALU_OP_XOR; rs1 = 24; rs2 = 20;
        #(`CLK) mode = `ALU_OP_SRL; rs1 = 2; rs2 = 1;
        #(`CLK) mode = `ALU_OP_SRA; rs1 = -2; rs2 = 1;
        #(`CLK) mode = `ALU_OP_OR; rs1 = 24; rs2 = 20;
        #(`CLK) mode = `ALU_OP_AND; rs1 = 24; rs2 = 20;        
        #(`CLK) $finish;
    end

    always #(`CLKH) clk = ~clk;

    always @(negedge clk)
        $display("time= %d: rs1=%d | rs2=%d | rd=%d", $time, rs1, rs2, rd);
endmodule