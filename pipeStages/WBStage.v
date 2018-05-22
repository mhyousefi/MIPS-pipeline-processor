`include "defines.v"

module WBStage (MEM_R_EN, memData, aluRes, WB_res);
  input MEM_R_EN;
  input [`WORD_LEN-1:0] memData, aluRes;
  output [`WORD_LEN-1:0] WB_res;

  assign WB_res = (MEM_R_EN) ? memData : aluRes;
endmodule // WBStage
