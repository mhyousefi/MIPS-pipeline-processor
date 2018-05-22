`include "defines.v"

module EXE2MEM (clk, rst, WB_EN_IN, MEM_R_EN_IN, MEM_W_EN_IN, PCIn, ALUResIn, STValIn, destIn,
                          WB_EN,    MEM_R_EN,    MEM_W_EN,    PC,   ALURes,   STVal,   dest);
  input clk, rst;
  // TO BE REGISTERED FOR ID STAGE
  input WB_EN_IN, MEM_R_EN_IN, MEM_W_EN_IN;
  input [`REG_FILE_ADDR_LEN-1:0] destIn;
  input [`WORD_LEN-1:0] PCIn, ALUResIn, STValIn;
  // REGISTERED VALUES FOR ID STAGE
  output reg WB_EN, MEM_R_EN, MEM_W_EN;
  output reg [`REG_FILE_ADDR_LEN-1:0] dest;
  output reg [`WORD_LEN-1:0] PC, ALURes, STVal;

  always @ (posedge clk) begin
    if (rst) begin
      {WB_EN, MEM_R_EN, MEM_W_EN, PC, ALURes, STVal, dest} <= 0;
    end
    else begin
      WB_EN <= WB_EN_IN;
      MEM_R_EN <= MEM_R_EN_IN;
      MEM_W_EN <= MEM_W_EN_IN;
      PC <= PCIn;
      ALURes <= ALUResIn;
      STVal <= STValIn;
      dest <= destIn;
    end
  end
endmodule // EXE2MEM
