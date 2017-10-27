module mux #(parameter SIZE = 32) (in1, in2, sel, out);
  input sel;
  input [SIZE-1:0] in1, in2;
  output [SIZE-1:0] out;

  assign out = (sel == 0) ? in1 : in2;
endmodule // mxu
