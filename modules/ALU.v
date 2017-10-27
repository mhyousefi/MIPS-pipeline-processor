`include "defines.v"

module ALU #(parameter integer SIZE = 32, parameter integer COM_SIZE = 4) (val1, val2, EXE_CMD, aluOut);
  input [SIZE-1:0] val1, val2;
  input [COM_SIZE-1:0] EXE_CMD;
  output reg [SIZE-1:0] aluOut;

  always @ ( * ) begin
    case (EXE_CMD)
      `EXE_ADD: aluOut <= val1 + val2;
      `EXE_SUB: aluOut <= val1 - val2;
      `EXE_AND: aluOut <= val1 & val2;
      `EXE_OR: aluOut <= val1 | val2;
      `EXE_NOR: aluOut <= ~(val1 | val2);
      `EXE_XOR: aluOut <= val1 ^ val2;
      `EXE_SLA: aluOut <= val1 << val2;
      `EXE_SLL: aluOut <= val1 <<< val2;
      `EXE_SRA: aluOut <= val1 >> val2;
      `EXE_SRL: aluOut <= val1 >>> val2;
      default: aluOut <= val1 + val2;
    endcase
  end
endmodule // ALU
