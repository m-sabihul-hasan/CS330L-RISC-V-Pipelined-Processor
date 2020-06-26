module Data_Memory
(
	input [63:0] Mem_Addr,
	input [63:0] Write_Data,
	input clk,
	input MemWrite, MemRead, //control signals
	output reg[63:0] Read_Data
);

reg [7:0] address [63:0];
	integer i;
	initial
	for (i =0; i < 64; i = i + 1)
	begin
	address[i] = i;
	end
	
	always@(posedge clk)
	begin
		if (MemWrite)
			begin
			address[Mem_Addr] = Write_Data[7:0];
			address[Mem_Addr + 1] = Write_Data[15:8];
			address[Mem_Addr + 2] = Write_Data[23:16];
			address[Mem_Addr + 3] = Write_Data[31:24];
			address[Mem_Addr + 4] = Write_Data[39:32];
			address[Mem_Addr + 5] = Write_Data[47:40];
			address[Mem_Addr + 6] = Write_Data[55:48];
			address[Mem_Addr + 7] = Write_Data[63:56];
			end
	end
	
	always@(*)
	begin	
		if (MemRead)
		Read_Data = {address[Mem_Addr + 7], address[Mem_Addr + 6],
					address[Mem_Addr + 5], address[Mem_Addr + 4],
					address[Mem_Addr + 3], address[Mem_Addr + 2],
					address[Mem_Addr + 1], address[Mem_Addr]};
	end
	
endmodule



