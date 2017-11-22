module ID2EXE (clk, rst, destIn, reg2In, val1In, val2In, PCIn, EXE_CMD_IN, MEM_R_EN_IN, MEM_W_EN_IN, WB_EN_IN, brTaken_in,
                         dest,   ST_value,   val1,   val2,   PC,  EXE_CMD,    MEM_R_EN,    MEM_W_EN,    WB_EN, brTaken_out);
  input clk, rst;
  // TO BE REGISTERED FOR ID STAGE
  input MEM_R_EN_IN, MEM_W_EN_IN, WB_EN_IN, brTaken_in;
  input [3:0] EXE_CMD_IN;
  input [4:0] destIn;
  input [31:0] reg2In, val1In, val2In, PCIn;
  // REGISTERED VALUES FOR ID STAGE
  output reg MEM_R_EN, MEM_W_EN, WB_EN, brTaken_out;
  output reg [3:0] EXE_CMD;
  output reg [4:0] dest;
  output reg [31:0] ST_value, val1, val2, PC;

  always @ (posedge clk) begin
    if (rst) begin
      MEM_R_EN <= 0;
      MEM_W_EN <= 0;
      WB_EN <= 0;
      EXE_CMD <= 4'd0;
      dest <= 5'd0;
      ST_value <= 32'd0;
      val1 <= 32'd0;
      val2 <= 32'd0;
      PC <= 32'd0;
      brTaken_out <= 0;
    end
    else begin
      MEM_R_EN <= MEM_R_EN_IN;
      MEM_W_EN <= MEM_W_EN_IN;
      WB_EN <= WB_EN_IN;
      EXE_CMD <= EXE_CMD_IN;
      dest <= destIn;
      ST_value <= reg2In;
      val1 <= val1In;
      val2 <= val2In;
      PC <= PCIn;
      brTaken_out <= brTaken_in;
    end
  end
endmodule // ID2EXE
