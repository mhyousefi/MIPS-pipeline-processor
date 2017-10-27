module EXEStage (clk, EXE_CMD, val1, val2, ALUResult);
  input clk;
  input [3:0] EXE_CMD;
  input [31:0] val1, val2;
  output [31:0] ALUResult;

  ALU ALU(.val1(val1), .val2(val2), .EXE_CMD(EXE_CMD), .aluOut(ALUResult));
endmodule // EXEStage
