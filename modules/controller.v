`include "defines.v"

module controller (operation, branchEn, EXE_CMD, Branch_command, Is_Imm, ST_or_BNE, WB_EN, MEM_R_EN, MEM_W_EN);
  input [5:0] operation;
  output reg branchEn;
  output reg [3:0] EXE_CMD;
  output reg [1:0] Branch_command;
  output reg Is_Imm, ST_or_BNE, WB_EN, MEM_R_EN, MEM_W_EN;

  always @ ( * ) begin
    {branchEn, EXE_CMD, Branch_command, Is_Imm, ST_or_BNE, WB_EN, MEM_R_EN, MEM_W_EN} <= 12'd0;
    case (operation)
      // R-type operations
      `OP_ADD: begin EXE_CMD <= `EXE_ADD; WB_EN <= 1; end
      `OP_SUB: begin EXE_CMD <= `EXE_SUB; WB_EN <= 1; end
      `OP_AND: begin EXE_CMD <= `EXE_AND; WB_EN <= 1; end
      `OP_OR:  begin EXE_CMD <= `EXE_OR;  WB_EN <= 1; end
      `OP_NOR: begin EXE_CMD <= `EXE_NOR; WB_EN <= 1; end
      `OP_XOR: begin EXE_CMD <= `EXE_XOR; WB_EN <= 1; end
      `OP_SLA: begin EXE_CMD <= `EXE_SLA; WB_EN <= 1; end
      `OP_SLL: begin EXE_CMD <= `EXE_SLL; WB_EN <= 1; end
      `OP_SRA: begin EXE_CMD <= `EXE_SRA; WB_EN <= 1; end
      `OP_SRL: begin EXE_CMD <= `EXE_SRL; WB_EN <= 1; end
      // I-type operations
      `OP_ADDI: begin EXE_CMD <= `EXE_ADD; WB_EN <= 1; Is_Imm <= 1; end
      `OP_SUBI: begin EXE_CMD <= `EXE_SUB; WB_EN <= 1; Is_Imm <= 1; end
      // memory operations
      `OP_LD: begin EXE_CMD <= `EXE_ADD; WB_EN <= 1; Is_Imm <= 1; ST_or_BNE <= 1; MEM_R_EN <= 1; end
      `OP_ST: begin EXE_CMD <= `EXE_ADD; Is_Imm <= 1; MEM_W_EN <= 1; ST_or_BNE <= 1; end
      // branch operations
      `OP_BEZ: begin EXE_CMD <= `EXE_NO_OPERATION; Is_Imm <= 1; Branch_command <= `COND_BEZ; branchEn <= 1; end
      `OP_BNE: begin EXE_CMD <= `EXE_NO_OPERATION; Is_Imm <= 1; Branch_command <= `COND_BNE; branchEn <= 1; ST_or_BNE <= 1; end
      `OP_JMP: begin EXE_CMD <= `EXE_NO_OPERATION; Is_Imm <= 1; Branch_command <= `COND_JUMP; branchEn <= 1; end

      default: {branchEn, EXE_CMD, Branch_command, Is_Imm, ST_or_BNE, WB_EN, MEM_R_EN, MEM_W_EN} <= 11'd0;
    endcase
  end
endmodule // controller
