`timescale 10ns/100ps
`define CLK 20
`define CLKH (`CLK / 2)
`include "alu_function.v"

module alu_sub_tb();
    reg [31: 0] rs1, rs2;
    reg clk;
    wire [31: 0] rd;

    alu_sub specimen (.rs1(rs1), .rs2(rs2), .rd(rd));
    initial begin
        $display("--- alu_sub simulation...");
        $display("--- clk = %-d", `CLK);
        rs1 = 0; rs2 = 0; clk = 0;
        #1;
        #(`CLK) rs1 <= 1; rs2 <= 1;
        #(`CLK) rs1 <= -1; rs2 <= -1;
        #(`CLK) rs1 <= 10; rs2 <= -10;
        #(`CLK) rs1 <= -10; rs2 <= 10;
        #(`CLK) rs1 <= 4294967295; rs2 <= -1;
        #(`CLK) rs1 <= 1140431715; rs2 <= 1960705524;
        #(`CLK) rs1 <= 2132968867; rs2 <= -1113736153;
        #(`CLK) rs1 <= 853720826; rs2 <= -1521547983;
        #(`CLK) rs1 <= 688056626; rs2 <= 383687137;
        #(`CLK) rs1 <= -502723586; rs2 <= -1414261512;
        #(`CLK) rs1 <= -977364385; rs2 <= 376271658;
        #(`CLK) rs1 <= -2057463516; rs2 <= -790035931;
        #(`CLK) rs1 <= 678084075; rs2 <= -934271071;
        #(`CLK) rs1 <= -1335318855; rs2 <= 1699441884;
        #(`CLK) rs1 <= 1220032282; rs2 <= -1411865926;
        #(`CLK) $finish;
    end

    always #(`CLKH) clk = ~clk;

    always @(negedge clk)
        $display("time= %d: rs1=%d | rs2=%d | rd=%d", $time, rs1, rs2, rd);
endmodule