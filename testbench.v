`timescale 1ns/1ns

module testbench ();
  reg clk,rst;
  TopLevel_ModelSim top_module (clk, rst);

  initial begin
    clk=1;
    repeat(5000) #50 clk=~clk ;
  end

  initial begin
    rst = 1;
    #100
    rst = 0;
  end
endmodule // test
