module register (clk, rst, writeEn, regIn, regOut);
  parameter integer SIZE = 32;
  input clk, rst, writeEn;
  input [SIZE-1:0] regIn;
  output reg [SIZE-1:0] regOut;

  always @ (posedge clk) begin
    if (rst == 1) regOut <= 0;
    else if (writeEn) regOut <= regIn;
  end
endmodule // register
