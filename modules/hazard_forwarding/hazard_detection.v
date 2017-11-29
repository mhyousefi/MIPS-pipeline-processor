module hazard_detection(is_imm, ST_or_BNE, src1_ID, src2_ID, dest_EXE, WB_EN_EXE, dest_MEM, WB_EN_MEM, hazard_detected);
  input [4:0] src1_ID, src2_ID;
  input [4:0] dest_EXE, dest_MEM;
  input WB_EN_EXE, WB_EN_MEM, is_imm, ST_or_BNE;
  output hazard_detected;
  wire src2_is_valid, exe_has_hazard, mem_has_hazard;

  assign src2_is_valid =  (~is_imm) || ST_or_BNE;

  assign exe_has_hazard = WB_EN_EXE && (src1_ID == dest_EXE || (src2_is_valid && src2_ID == dest_EXE));
  assign mem_has_hazard = WB_EN_MEM && (src1_ID == dest_MEM || (src2_is_valid && src2_ID == dest_MEM));

  assign hazard_detected = exe_has_hazard || mem_has_hazard;
endmodule // hazard_detection
