module register #(SIZE = 32) (clk, rst, regIn, regOut);
  input clk, rst;
  input [SIZE-1:0] regIn;
  output reg [SIZE-1:0] regOut;

  always @ (posedge clk) begin
    if (rst == 1) regOut <= 0;
    else regOut <= regIn;
  end
endmodule // register
