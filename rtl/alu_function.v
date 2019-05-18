`timescale 10ns/100ps

module alu_add (
    input [31: 0] rs1,
    input [31: 0] rs2,
    output [31: 0] rd
    );

    assign rd = rs1 + rs2;
endmodule

module alu_sub (
    input [31: 0] rs1,
    input [31: 0] rs2,
    output [31: 0] rd
    );

    assign rd = rs1 - rs2;
endmodule

module alu_sll (
    input [31: 0] rs1,
    input [31: 0] rs2,
    output [31: 0] rd
    );

    wire [4: 0] amount;
    assign amount = rs2[4: 0];
    assign rd = rs1 << amount;
endmodule

module alu_slt (
    input [31: 0] rs1,
    input [31: 0] rs2,
    output [31: 0] rd
    );

    assign rd = {31'b0, $signed(rs1) < $signed(rs2)};
endmodule

module alu_sltu (
    input [31: 0] rs1,
    input [31: 0] rs2,
    output [31: 0] rd
    );

    assign rd = {31'b0, rs1 < rs2};
endmodule

module alu_xor (
    input [31: 0] rs1,
    input [31: 0] rs2,
    output [31: 0] rd
    );

    assign rd = rs1 ^ rs2;
endmodule

module alu_srl (
    input [31: 0] rs1,
    input [31: 0] rs2,
    output [31: 0] rd
    );

    wire [4: 0] amount;
    assign amount = rs2[4: 0];
    assign rd = rs1 >> amount;
endmodule

module alu_sra (
    input [31: 0] rs1,
    input [31: 0] rs2,
    output [31: 0] rd
    );

    wire [4: 0] amount;
    assign amount = rs2[4: 0];
    assign rd = $signed(rs1) >>> amount;
endmodule

module alu_or (
    input [31: 0] rs1,
    input [31: 0] rs2,
    output [31: 0] rd
    );

    assign rd = rs1 | rs2;
endmodule

module alu_and (
    input [31: 0] rs1,
    input [31: 0] rs2,
    output [31: 0] rd
    );

    assign rd = rs1 & rs2;
endmodule
