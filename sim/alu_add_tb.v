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
        #(`CLK) rs1 <= -1661027666; rs2 <= 2067214708;
        #(`CLK) rs1 <= -977492231; rs2 <= -471411191;
        #(`CLK) rs1 <= -1210836718; rs2 <= -283874779;
        #(`CLK) rs1 <= 1923685281; rs2 <= 1732048492;
        #(`CLK) rs1 <= 936121195; rs2 <= -378435173;
        #(`CLK) rs1 <= 98890081; rs2 <= -385304560;
        #(`CLK) rs1 <= 2135384113; rs2 <= 2127226325;
        #(`CLK) rs1 <= -731015545; rs2 <= -105499893;
        #(`CLK) rs1 <= 1883713381; rs2 <= -835403521;
        #(`CLK) rs1 <= 430024098; rs2 <= 1777771800;
        #(`CLK) $finish;
    end

    always #(`CLKH) clk = ~clk;

    always @(negedge clk)
        $display("time= %d: rs1=%d | rs2=%d | rd=%d", $time, rs1, rs2, rd);
endmodule