`timescale 1ns/100ps
`define CLK 20
`define CLKH (`CLK / 2)

module add (
    input [31: 0] rs1,
    input [31: 0] rs2,
    input enable,
    output [31: 0] rd
    );
    
    assign rd = rs1 + rs2;
endmodule

module sub (
    input [31: 0] rs1,
    input [31: 0] rs2,
    output [31: 0] rd
    );

    assign rd = rs1 - rs2;
endmodule

module sll (
    input [31: 0] rs1,
    input [31: 0] rs2,
    output [31: 0] rd
    );

    wire [5: 0] amount;
    assign amount = rs2 & 5'h5;
    assign rd = rs1 << amount;
endmodule

module sll_tb();
    reg [31: 0] a, b;
    reg clk, reset;
    wire [31: 0] s;

    sll shift(.rs1(a), .rs2(b), .rd(s));
    initial begin
        $display("--- adder simulation...");
        $dumpfile("sll.dump");
        $dumpvars;
        $display("--- clk = %-d", `CLK);
        a = 32'hfffe;
        b = 32'h1;
        #1;
        #(`CLK) a = 32; b = 1;
        #(`CLK) a = 1; b = 2;
        #(`CLK) a = 2; b = 3;
        #(`CLK) $finish;
    end

    always #(`CLKH) clk = ~clk;

    always @(negedge clk)
        $display("time= %d: a=%d b=%d", $time, a, s);
endmodule




// module alu (
//     input [31: 0] rs1,
//     input [31: 0] rs2,
//     input [3: 0] op,
//     input clk,
//     input reset,

//     output reg [31: 0] rd,
//     );

//     always @(rs1, rs2 or op) begin
//         case(op)
//             4'b0000: adder add(.rs1=);
//         endcase
//     end
// endmodule
