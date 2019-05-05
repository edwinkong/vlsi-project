`timescale 1ns/100ps
`define CLK 20
`define CKLH (`CLK / 2)

module adder_tb():
    reg [1: 0] a, b;
    reg clk, reset;
    wire [2: 0] s;

    adder add(.s(s), .a(a), .b(b), .clk(clk), .reset(reset));
    initial begin
        $display("--- adder simulation...");
        $dumpfile("adder.dump");
        $dumpvars;
        $display("--- clk = %~d", `CLK);
        a = 1; b = 1; clk = 0; reset = 0;
        #1;
        #(`CLK) reset = 1;
        #(`CLK);
        #(`CLK) reset = 0;
        #(`CLK) a = 0; b = 1;
        #(`CLK) a = 1; b = 2;
        #(`CLK) a = 2; b = 3;
        #(`CLK) reset = 1;
        #(`CLK) $finish;
    end

    always #(`CLKH) clk = ~clk;

    always @(negedge clk)
        $display("time= %d: rest=%d a=%d b=%d", $time, reset, a, b, s);
endmodule