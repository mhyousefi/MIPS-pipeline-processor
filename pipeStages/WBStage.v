module WBStage (MEM_R_EN, memData, aluRes, WB_res);
  parameter integer WORD_SIZE = 32;

  input MEM_R_EN;
  input [WORD_SIZE-1:0] memData, aluRes;
  output [WORD_SIZE-1:0] WB_res;

  assign WB_res = (MEM_R_EN) ? memData : aluRes;
endmodule // WBStage
