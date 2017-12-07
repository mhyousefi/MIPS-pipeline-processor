module mux #(parameter integer WORD_LENGTH = 32) (in1, in2, sel, out);
  input sel;
  input [WORD_LENGTH-1:0] in1, in2;
  output [WORD_LENGTH-1:0] out;

  assign out = (sel == 0) ? in1 : in2;
endmodule // mxu

module mux_3input (in1, in2, in3, sel, out);
  parameter integer WORD_LENGTH = 32;
  input [WORD_LENGTH-1:0] in1, in2, in3;
  input [1:0] sel;
  output [WORD_LENGTH-1:0] out;

  assign out = (sel == 2'd0) ? in1 :
               (sel == 2'd1) ? in2 : in3;
endmodule // mux
