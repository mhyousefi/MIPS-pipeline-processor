module hazard_detection(src1_ID, src2_ID, dest_EXE, WB_EN_EXE, dest_MEM, WB_EN_MEM, hazard_detected)
  input [4:0] src1_ID, src2_ID;
  input [4:0] dest_EXE, dest_MEM;
  input WB_EN_EXE, WB_EN_MEM, is_imm;
  output reg hazard_detected;

  always @(*) begin
    hazard_detected <= 1'b0;
    if (WB_EN_EXE)
      hazard_detected <= (src1_ID == dest_EXE || (~is_imm && src2_ID == dest_EXE)) ? 1 : 0;
    else if (WB_EN_MEM)
      hazard_detected <= (src1_ID == dest_MEM || (~is_imm && src2_ID == dest_MEM)) ? 1 : 0;
  end
endmodule // hazard_detection
