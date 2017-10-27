module adder #(parameter SIZE = 32) (in1, in2, out);
  input [SIZE-1:0] in1, in2;
  output [SIZE-1:0] out;

  assign out = in1 + in2;
endmodule // adder
