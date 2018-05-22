`include "defines.v"

module signExtend (in, out);
  input [15:0] in;
  output [`WORD_LEN-1:0] out;

  assign out = (in[15] == 1) ? {16'b1111111111111111, in} : {16'b0000000000000000, in};
endmodule // signExtend
