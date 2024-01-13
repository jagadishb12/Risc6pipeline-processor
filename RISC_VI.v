module RISC_VI(clk,enable,reset,pc);
input clk,enable,reset;
input [15:0] pc;

instruction_mem dut1 (enable,pc,instr_out);
data_mem dut2 ( clk,wr_en,dmem_addr,dmem_data,rd_en,dmem_data_out);

wire instr_out 

data_mem dut ();
reg[15:0] IF_ID_IR, IF_ID_NPC;
reg[15:0] ID_RR_IR, ID_RR_NPC, ID_RR_IMM,write_enable;
reg[15:0] RR_EX_IR, RR_EX_NPC, RR_EX_D1, RR_EX_D2, RR_EX_IMM;
reg[15:0] EX_MEM_IR, EX_MEM_NPC,EX_MEM_ALUOUT,EX_MEM_COND, EX_MEM_D2, EX_MEM_IMM ;
reg[15:0] MEM_WB_IR, MEM_WB_NPC,MEM_WB_ALUOUT, MEM_WB_LMD;

always @(posedge clk) begin

IF_ID_IR <= instr_out;
IF_ID_NPC <= ;

ID_RR_IR  <= IF_ID_IR
ID_RR_NPC <= IF_ID_NPC
ID_RR_IMM <=

RR_EX_IR  <=ID_RR_IR
RR_EX_NPC <=ID_RR_NPC
RR_EX_D1  <= 
RR_EX_D2  <=
RR_EX_IMM <=

EX_MEM_IR     <= RR_EX_IR
EX_MEM_NPC    <= RR_EX_NPC
EX_MEM_ALUOUT <=
EX_MEM_COND   <=
EX_MEM_IMM    <= RR_EX_IMM

MEM_WB_IR     <= EX_MEM_IR 
MEM_WB_NPC    <= EX_MEM_NPC
MEM_WB_ALUOUT <= EX_MEM_ALUOUT
MEM_WB_LMD    <=
end
//----------FETCH-------------



//----------DECODE------------



//------------RR-------------



//-----------EXECUTE---------

always@(posedge clk)
begin
reg carry=0,zero;
reg srca,srcb,srcd;

if (reset) begin
			zero = 1'b0;
			carry = 1'b0;
		end
		
		
case RR_EX_IR[15:12]

"0001": 

//ada
if(RR_EX_IR[2:0] == 000) begin


{carry,EX_MEM_ALUOUT} <= RR_EX_D1 + RR_EX_D2; 

if(EX_MEM_ALUOUT == 16'b0) zero<=1;

//adc
if(RR_EX_IR[2:0] == 010) begin

if(carry ==1) begin
{carry,EX_MEM_ALUOUT} <= RR_EX_D1 + RR_EX_D2; end

if(EX_MEM_ALUOUT == 16'b0) zero<=1;

//adz
if(RR_EX_IR[2:0] == 001) begin

if(zero ==1) begin
{carry,EX_MEM_ALUOUT} <= RR_EX_D1 + RR_EX_D2; end

if(EX_MEM_ALUOUT == 16'b0) zero<=1;

//awc
if(RR_EX_IR[2:0] == 011) begin

{carry,EX_MEM_ALUOUT} <= RR_EX_D1 + RR_EX_D2 +carry;

if(EX_MEM_ALUOUT == 16'b0) zero<=1;
 
//aca
 if(RR_EX_IR[2:0] == 100) begin


{carry,EX_MEM_ALUOUT} <= RR_EX_D1 + (~RR_EX_D1 + 1); 

if(EX_MEM_ALUOUT == 16'b0) zero<=1;


//acc
if(RR_EX_IR[2:0] == 110) begin

if(carry ==1) begin
{carry,EX_MEM_ALUOUT} <= RR_EX_D1 + (~RR_EX_D2 + 1); end

if(EX_MEM_ALUOUT == 16'b0) zero<=1;


//acz
if(RR_EX_IR[2:0] == 101) begin

if(zero ==1) begin
{carry,EX_MEM_ALUOUT} <= RR_EX_D1 + (~RR_EX_D2 + 1); end

if(EX_MEM_ALUOUT == 16'b0) zero<=1;


//acw
if(RR_EX_IR[2:0] == 111) begin


{carry,EX_MEM_ALUOUT} <= RR_EX_D1 + (~RR_EX_D2 + 1) + carry; 

if(EX_MEM_ALUOUT == 16'b0) zero<=1;

end


//-----------MEMORY----------
always @(posedge clk) begin

case RR_EX_IR[15:12]

"0001" : MEM_WB_ALUOUT <= EX_MEM_ALUOUT;
"0000" : MEM_WB_ALUOUT <= EX_MEM_ALUOUT;
"0010" : MEM_WB_ALUOUT <= EX_MEM_ALUOUT;
"0011" : MEM_WB_ALUOUT <= EX_MEM_ALUOUT;

end

//-----------Write Back-------
