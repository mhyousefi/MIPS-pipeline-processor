# just rearranging instructions from the source file
# to correctly feed them to the instruction memory the


DESTINATION_FILE_NAME = "ready_instructions.txt"

line_count = int(raw_input("Enter the number of instructions to rearrange: "))
source_file_name = raw_input("Enter the source file name: ")

instructions = []

with open(source_file_name, "r") as instr_file:
    for i in range(line_count):
        instructions.append(instr_file.readline()[:-1])

with open(DESTINATION_FILE_NAME, "w") as dest_file:
    for ind in range(len(instructions)):
        instr = instructions[ind]
        dest_file.write("instMem[" + str(ind*4)   + "] <= 8'b" + instr[0:8] + "; " + instr[34:] + "\n")
        dest_file.write("instMem[" + str(ind*4+1) + "] <= 8'b" + instr[8:16] + ";\n")
        dest_file.write("instMem[" + str(ind*4+2) + "] <= 8'b" + instr[16:24] + ";\n")
        dest_file.write("instMem[" + str(ind*4+3) + "] <= 8'b" + instr[24:32] + ";\n\n")


print "#__ instructions reformatted for dataMem. Just copy and paste now."
