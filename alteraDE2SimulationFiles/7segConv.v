module sevenSegConv (num, out1, out2);
  input [31:0] num;
  output [6:0] out1, out2;

  wire [31:0] numLower = num / 10;
  wire [31:0] numUpper = num % 10;

  assign out1 = (numLower == 32'd0) ? 7'b1000000:
               (numLower == 32'd1) ? 7'b1001111:
               (numLower == 32'd2) ? 7'b0100100:
               (numLower == 32'd3) ? 7'b0110000:
               (numLower == 32'd4) ? 7'b0011001:
               (numLower == 32'd5) ? 7'b0010010:
               (numLower == 32'd6) ? 7'b0000010:
               (numLower == 32'd7) ? 7'b1111000:
               (numLower == 32'd8) ? 7'b0000000:
               (numLower == 32'd9) ? 7'b0010000: 7'b1111111;

 assign out2 = (numUpper == 32'd0) ? 7'b1000000:
              (numUpper == 32'd1) ? 7'b1001111:
              (numUpper == 32'd2) ? 7'b0100100:
              (numUpper == 32'd3) ? 7'b0110000:
              (numUpper == 32'd4) ? 7'b0011001:
              (numUpper == 32'd5) ? 7'b0010010:
              (numUpper == 32'd6) ? 7'b0000010:
              (numUpper == 32'd7) ? 7'b1111000:
              (numUpper == 32'd8) ? 7'b0000000:
              (numUpper == 32'd9) ? 7'b0010000: 7'b1111111;
endmodule // sevenSegConv
