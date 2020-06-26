module Instruction_Memory
(
	input [63:0] Inst_Address,
	output reg [31:0] Instruction
);

reg [7:0] address[15:0];

	initial
	
	begin
	address[0] = 8'b10000011;
	address[1] = 8'b00110100;
	address[2] = 8'b00000101;
	address[3] = 8'b00001111;
	address[4] = 8'b10110011;
	address[5] = 8'b10000100;
	address[6] = 8'b10011010;
	address[7] = 8'b00000000;
	address[8] = 8'b10010011;
	address[9] = 8'b10000100;
	address[10] = 8'b00010100;
	address[11] = 8'b00000000;
	address[12] = 8'b00100011;
	address[13] = 8'b00111000;
	address[14] = 8'b10010101;
	address[15] = 8'b00001110;
	end
	
	always@(*)
	Instruction = {address[Inst_Address + 3], address[Inst_Address + 2],
				address[Inst_Address + 1], address[Inst_Address]};

endmodule

