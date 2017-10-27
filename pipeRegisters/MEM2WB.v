module MEM2WB (clk, rst, WB_EN_IN, MEM_R_EN_IN, ALUResIn, memReadValIn, destIn,
                         WB_EN,    MEM_R_EN,    ALURes,   memReadVal,   dest);
  input clk, rst;
  // TO BE REGISTERED FOR ID STAGE
  input WB_EN_IN, MEM_R_EN_IN;
  input [4:0] destIn;
  input [31:0] ALUResIn, memReadValIn;
  // REGISTERED VALUES FOR ID STAGE
  output reg WB_EN, MEM_R_EN;
  output reg [4:0] dest;
  output reg [31:0] ALURes, memReadVal;

  always @ (posedge clk) begin
    if (rst) begin
      WB_EN <= 0;
      MEM_R_EN <= 0;
      dest <= 4'd0;
      ALURes <= 32'd0;
      memReadVal <= 32'd0;
    end
    else begin
      WB_EN <= WB_EN_IN;
      MEM_R_EN <= MEM_R_EN_IN;
      dest <= destIn;
      ALURes <= ALUResIn;
      memReadVal <= memReadValIn;
    end
  end
endmodule // MEM2WB
