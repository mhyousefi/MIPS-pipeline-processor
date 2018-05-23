#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Rearranging instructions from a source file to a format suitable for the always statement under instructionMem.v
# There is an example source code under this directory
# In drafting your own code, make sure you follow the ISA in this project

DESTINATION_FILE_NAME = "ready_instructions.txt"
INSTR_MEM_ARRAY_NAME = "instMem"

line_count = int(raw_input("Enter the number of instructions to rearrange: "))
source_file_name = raw_input("Enter the source file name: ")

instructions = []

with open(source_file_name, "r") as instr_file:
    for i in range(line_count):
        instructions.append(instr_file.readline()[:-1])

with open(DESTINATION_FILE_NAME, "w") as dest_file:
    for i in range(len(instructions)):
        instr = instructions[i]
        dest_file.write(INSTR_MEM_ARRAY_NAME + "[" + str(i*4)   + "] <= 8'b" + instr[0:8] + "; // ==> " + instr[34:] + "\n")
        dest_file.write(INSTR_MEM_ARRAY_NAME + "[" + str(i*4+1) + "] <= 8'b" + instr[8:16] + ";\n")
        dest_file.write(INSTR_MEM_ARRAY_NAME + "[" + str(i*4+2) + "] <= 8'b" + instr[16:24] + ";\n")
        dest_file.write(INSTR_MEM_ARRAY_NAME + "[" + str(i*4+3) + "] <= 8'b" + instr[24:32] + ";\n\n")


print "💡💡💡 ==> instructions reformatted for instruction memory."
print "To run them, copy and paste the content of ready_instructions.txt under the reset if statement in the instructionMem.v always statement."
