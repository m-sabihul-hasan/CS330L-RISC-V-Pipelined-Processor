module registerFile
(
	input [63:0] WriteData,
	input [4:0] RS1, RS2, RD,
	input RegWrite, clk, reset,
	output reg [63:0] ReadData1, ReadData2
);
	
	reg [63:0] Array [31:0];
	
	always @(*)
	begin
		if (reset)
		begin
			ReadData1 = 64'd0;
			ReadData2 = 64'd0;
		end
		else
		begin
			ReadData1 = Array[RS1];
			ReadData2 = Array[RS2];
		end
	end
	
	always @(posedge clk)
	begin
		if (RegWrite)
			Array[RD] = WriteData;
	end
	
	initial
	begin
	
		Array[0] = 64'd00;
		Array[1] = 64'd10;
		Array[2] = 64'd20;
		Array[3] = 64'd30;
		Array[4] = 64'd40;
		Array[5] = 64'd50;
		Array[6] = 64'd60;
		Array[7] = 64'd70;
		Array[8] = 64'd80;
		Array[9] = 64'd90;
		Array[10] = 64'd100;
		Array[11] = 64'd110;
		Array[12] = 64'd120;
		Array[13] = 64'd130;
		Array[14] = 64'd140;
		Array[15] = 64'd150;
		Array[16] = 64'd160;
		Array[17] = 64'd170;
		Array[18] = 64'd180;
		Array[19] = 64'd190;
		Array[20] = 64'd200;
		Array[21] = 64'd210;
		Array[22] = 64'd220;
		Array[23] = 64'd230;
		Array[24] = 64'd240;
		Array[25] = 64'd250;
		Array[26] = 64'd260;
		Array[27] = 64'd270;
		Array[28] = 64'd280;
		Array[29] = 64'd290;
		Array[30] = 64'd300;
		Array[31] = 64'd310;
	
	end
	
endmodule