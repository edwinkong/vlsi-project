`timescale 10ns/100ps
`define CLK 20
`define CLKH (`CLK / 2)
`include "alu_function.v"

module alu_sra_tb();
    reg [31: 0] rs1, rs2;
    reg clk;
    wire [31: 0] rd;

    alu_sra specimen (.rs1(rs1), .rs2(rs2), .rd(rd));
    initial begin
        $display("--- alu_sra simulation...");
        $display("--- clk = %-d", `CLK);
        rs1 = 0; rs2 = 0; clk = 0;
        #1;
        #(`CLK) rs1 <= 1431655765; rs2 <= 1;
        #(`CLK) rs1 <= 1431655765; rs2 <= 10;
        #(`CLK) rs1 <= 1431655765; rs2 <= 72;
        #(`CLK) rs1 <= 2147483648; rs2 <= 3;
        #(`CLK) rs1 <= 1; rs2 <= 1;
        #(`CLK) $finish;
    end

    always #(`CLKH) clk = ~clk;

    always @(negedge clk)
        $display("time= %d: rs1=%d | rs2=%d | rd=%d", $time, rs1, rs2, rd);
endmodule