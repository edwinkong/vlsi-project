`timescale 10ns/100ps
`define CLK 20
`define CLKH (`CLK / 2)
`include "alu_function.v"

module alu_add_tb();
    reg [31: 0] a, b;
    reg clk, reset;
    wire [31: 0] s;

    alu_add add (.rs1(a), .rs2(b), .rd(s));
    initial begin
        $display("--- adder simulation...");
        $dumpfile("alu_add.dump");
        $dumpvars;
        $display("--- clk = %-d", `CLK);
        a = 0; b = 0; clk = 0;
        #1;
        // test pos - pos
        #(`CLK) a = 71; b = 82;
        // test pos - neg
        #(`CLK) a = 71; b = -82;
        // test neg - pos
        #(`CLK) a = -71; b = 82;
        // test neg - neg 2
        #(`CLK) a = -71; b = -82;
        // test positive inverse
        #(`CLK) a = 71; b = -71;
        // test negative inverse
        #(`CLK) a = -71; b = 71;
        #(`CLK) $finish;
    end

    always #(`CLKH) clk = ~clk;

    always @(negedge clk)
        $display("time= %d: rest=%d a=%d b=%d s=%d", $time, reset, a, b, s);
endmodule

// module alu_sub_tb();
//     reg [31: 0] a, b;
//     reg clk, reset;
//     wire [31: 0] s;

//     alu_sub sub (.rs1(a), .rs2(b), .rd(s));
//     initial begin
//         $display("--- adder simulation...");
//         $dumpfile("adder.dump");
//         $dumpvars;
//         $display("--- clk = %-d", `CLK);
//         a = 0; b = 0; clk = 0;
//         #1;
//         // test pos - pos
//         #(`CLK) a = 71; b = 82;
//         // test pos - neg
//         #(`CLK) a = 71; b = -82;
//         // test neg - pos
//         #(`CLK) a = -71; b = 82;
//         // test neg - neg 2
//         #(`CLK) a = -71; b = -82;
//         // test positive inverse
//         #(`CLK) a = 71; b = -71;
//         // test negative inverse
//         #(`CLK) a = -71; b = 71;
//         // test overflow
//         #(`CLK) a = -1; b = 32'hffff_ffff;
//         // test negative overflow
//         #(`CLK) a = 32'h0; b = -1;
//         #(`CLK) $finish;
//     end

//     always #(`CLKH) clk = ~clk;

//     always @(negedge clk)
//         $display("time= %d: rest=%d a=%d b=%d s=%d", $time, reset, a, b, s);
// endmodule
