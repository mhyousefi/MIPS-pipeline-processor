module IF2ID (clk, rst, flush, PCIn, instructionIn, PC, instruction);
  input clk, rst, flush;
  input [31:0] PCIn, instructionIn;
  output reg [31:0] PC, instruction;

  always @ (posedge clk) begin
    if (rst) begin
      PC <= 32'd0;
      instruction <= 32'd0;
    end
    else begin
      PC <= PCIn;
      if (flush) instruction <= 32'd0;
      else instruction <= instructionIn;
    end
  end
endmodule // IF2ID
