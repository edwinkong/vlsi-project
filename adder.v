`timescale 1ns/100ps
module adder (s, a, b, clk, reset);
    output [2: 0] s;
    input [1: 0] a;
    input [1: 0] b;
    input clk;
    input reset;
    reg [2: 0] s;
    always @(posedge clk or posedge reset) begin
        if (reset) s <= 0;
        else s <= a+b;
    end
endmodule
