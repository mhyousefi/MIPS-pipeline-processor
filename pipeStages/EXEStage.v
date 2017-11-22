module EXEStage (clk, EXE_CMD, val1, val2, ALUResult);
  localparam  WORD_SIZE = 32;

  input clk;
  input [3:0] EXE_CMD;
  input [WORD_SIZE-1:0] val1, val2;
  output [WORD_SIZE-1:0] ALUResult;

  ALU ALU(.val1(val1), .val2(val2), .EXE_CMD(EXE_CMD), .aluOut(ALUResult));
endmodule // EXEStage
