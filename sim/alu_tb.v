`timescale 1ns/100ps
`define CLK 20
`define CLKH (`CLK / 2)
`include "alu.v"


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
