module EXE2MEM (clk, rst, WB_EN_IN, MEM_R_EN_IN, MEM_W_EN_IN, PCIn, ALUResIn, STValIn, destIn,
                          WB_EN,    MEM_R_EN,    MEM_W_EN,    PC,   ALURes,   STVal,   dest);
  input clk, rst;
  // TO BE REGISTERED FOR ID STAGE
  input WB_EN_IN, MEM_R_EN_IN, MEM_W_EN_IN;
  input [4:0] destIn;
  input [31:0] PCIn, ALUResIn, STValIn;
  // REGISTERED VALUES FOR ID STAGE
  output reg WB_EN, MEM_R_EN, MEM_W_EN;
  output reg [4:0] dest;
  output reg [31:0] PC, ALURes, STVal;

  always @ (posedge clk) begin
    if (rst) begin
      WB_EN <= 0;
      MEM_R_EN <= 0;
      MEM_W_EN <= 0;
      PC <= 32'd0;
      ALURes <= 32'd0;
      STVal <= 32'd0;
      dest <= 32'd0;
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
