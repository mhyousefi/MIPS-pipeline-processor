module IF2ID (clk, rst, flush, freeze, PCIn, instructionIn, PC, instruction);
  input clk, rst, flush, freeze;
  input [31:0] PCIn, instructionIn;
  output reg [31:0] PC, instruction;

  always @ (posedge clk) begin
    if (rst) begin
      PC <= 32'd0;
      instruction <= 32'd0;
    end
    else begin
      if (~freeze) begin
        if (flush) begin
          instruction <= 32'd0;
          PC <= 32'd0;
        end
        else begin
          instruction <= instructionIn;
          PC <= PCIn;
        end
      end
    end
  end
endmodule // IF2ID
