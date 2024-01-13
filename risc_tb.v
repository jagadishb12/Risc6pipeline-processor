`timescale 1ns/1ps
module risc_tb;
reg clk=0;
reg enable,reset;
reg[15:0] reg_file[7:0];
//reg[15:0] pc;
RISC_VI dut (clk,enable,reset);

always #10 clk = ~clk;

always #5 reset = 1;

always #10 enable = 1;

initial begin
dut.pc = 16'b0;
dut.instr_out[0] = {4'b0001,3'b001,3'b010,3'b011,1'b0,2'b00};//ada  rc=ra+rb modifies cz flag
instr_mem[1] <= {4'b0001,3'b100,3'b101,3'b110,1'b0,2'b10};//adc  add if carry is set ,modifies cz flag
instr_mem[2] <= {4'b0001,3'b110,3'b001,3'b010,1'b0,2'b01};//adz  add if zero is set ,modifies cz flag
instr_mem[3] <= {4'b0001,3'b110,3'b100,3'b101,1'b0,2'b11};//awc  rc=ra+rb+carry add with carry ,modifies cz flag
instr_mem[4] <= {4'b0001,3'b111,3'b101,3'b110,1'b1,2'b00};//aca  rc= ra + complement_ra ,modifies cz flag
instr_mem[5] <= {4'b0001,3'b001,3'b110,3'b111,1'b1,2'b10};//acc  rc= ra + complement_rb if C ,modifies cz flag
instr_mem[6] <= {4'b0001,3'b010,3'b111,3'b001,1'b1,2'b01};//acz  rc= ra + complement_rb if Z ,modifies cz flag
instr_mem[7] <= {4'b0001,3'b011,3'b001,3'b010,1'b1,2'b11};//acw  rc= ra + complement_rb + carry ,modifies cz flag
instr_mem[8] <= {4'b0000,3'b100,3'b010,6'b000001}; //adi rb= ra + Imm ,modifies cz flag
instr_mem[9] <= {4'b0010,3'b011,3'b011,3'b011,1'b0,2'b00};//ndu  r3=r1 nand r2 ,modifies z flag
instr_mem[10] <= {4'b0010,3'b100,3'b100,3'b100,1'b0,2'b10};//ndc r3=r1 nand r2 if c=1 ,modifies z flag
instr_mem[11] <= {4'b0010,3'b101,3'b101,3'b101,1'b0,2'b01};//ndz r3=r1 nand r2 if z=1 ,modifies z flag
instr_mem[12] <= {4'b0010,3'b110,3'b110,3'b110,1'b1,2'b00};//ncu r3=r1 nand complement_r2 ,modifies z flag
instr_mem[13] <= {4'b0010,3'b111,3'b111,3'b111,1'b1,2'b10};//ncc r3=r1 nand comp_r2 if c=1 ,modifies z flag
instr_mem[14] <= {4'b0010,3'b001,3'b001,3'b001,1'b1,2'b01};//ncz r3=r1 nand comp_r2 if z=1 ,modifies z flag

dut.reg_file[7] = 16'h0000;
dut.reg_file[6] = 16'h0001;
dut.reg_file[5] = 16'h0002;
dut.reg_file[4] = 16'h0003;
dut.reg_file[3] = 16'h0004;
dut.reg_file[2] = 16'h0005;
dut.reg_file[1] = 16'h0006;
dut.reg_file[0] = 16'h0007;

end

endmodule
