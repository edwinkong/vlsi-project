`timescale 10ns/100ps
`define CLK 20
`define CLKH (`CLK / 2)
`include "alu_function.v"

module alu_add_tb();
    reg [31: 0] rs1, rs2;
    reg clk;
    wire [31: 0] rd;

    alu_add specimen (.rs1(rs1), .rs2(rs2), .rd(rd));
    initial begin
        $display("--- alu_add simulation...");
        $display("--- clk = %-d", `CLK);
        rs1 = 0; rs2 = 0; clk = 0;
        #1;
        #(`CLK) rs1 <= 1; rs2 <= 1;
        #(`CLK) rs1 <= -1; rs2 <= -1;
        #(`CLK) rs1 <= 10; rs2 <= -10;
        #(`CLK) rs1 <= -10; rs2 <= 10;
        #(`CLK) rs1 <= 4294967295; rs2 <= 2;
        #(`CLK) rs1 <= -136484598; rs2 <= 2028051715;
        #(`CLK) rs1 <= 3517265; rs2 <= -1567018407;
        #(`CLK) rs1 <= -1849483469; rs2 <= -2092275714;
        #(`CLK) rs1 <= 1533353160; rs2 <= 935318918;
        #(`CLK) rs1 <= -1952545230; rs2 <= 130273377;
        #(`CLK) rs1 <= -570809067; rs2 <= -587696410;
        #(`CLK) rs1 <= 1052754953; rs2 <= 1020569547;
        #(`CLK) rs1 <= 1543577912; rs2 <= -1222629296;
        #(`CLK) rs1 <= -1475351096; rs2 <= 953748061;
        #(`CLK) rs1 <= -1533408273; rs2 <= 1249155545;
        #(`CLK) $finish;
    end

    always #(`CLKH) clk = ~clk;

    always @(negedge clk)
        $display("time= %d: rs1=%d | rs2=%d | rd=%d", $time, rs1, rs2, rd);
endmodule