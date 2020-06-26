module Instruction_Memory
(
	input [63:0] Inst_Address,
	output reg [31:0] Instruction
);

reg [7:0] address[131:0];

	initial
	
	begin
	
	//1
	address[0] = 8'b10010011;  
	address[1] = 8'b00000010;
	address[2] = 8'b00110000;
	address[3] = 8'b00000000;
	
	//2
	address[4] = 8'b00100011;      
	address[5] = 8'b00110010;
	address[6] = 8'b01010000;
	address[7] = 8'b00000000;
	
	//3
	address[8] = 8'b10010011;    
	address[9] = 8'b00000010;
	address[10] = 8'b00100000;
	address[11] = 8'b00000000;
	
	//4
	address[12] = 8'b00100011;    
	address[13] = 8'b00110110;
	address[14] = 8'b01010000;
	address[15] = 8'b00000000;
	
	//5
	address[16] = 8'b10010011;    
	address[17] = 8'b00000010;
	address[18] = 8'b10100000;
	address[19] = 8'b00000000;
	
	//6
	address[20] = 8'b00100011;       
	address[21] = 8'b00111010;
	address[22] = 8'b01010000;
	address[23] = 8'b00000000;
	
	//7
	address[24] = 8'b00010011;       
	address[25] = 8'b00000101;
	address[26] = 8'b01000000;
	address[27] = 8'b00000000;
	
	//8
	address[28] = 8'b10010011;    
	address[29] = 8'b00000101;
	address[30] = 8'b00110000;
	address[31] = 8'b00000000;
	
	//9
	address[32] = 8'b01100011;    
	address[33] = 8'b00010110;
	address[34] = 8'b00000101;
	address[35] = 8'b00000000;
	
	//10
	address[36] = 8'b01100011;        
	address[37] = 8'b10010100;
	address[38] = 8'b00000101;
	address[39] = 8'b00000000;
	
	//11
	address[40] = 8'b01100011;       
	address[41] = 8'b00001100;
	address[42] = 8'b00000000;
	address[43] = 8'b00000100;
	
	//12
	address[44] = 8'b00010011;        
	address[45] = 8'b00001001;
	address[46] = 8'b00000000;
	address[47] = 8'b00000000;
	
	//13
	address[48] = 8'b01100011;       
	address[49] = 8'b00000110;
	address[50] = 8'b10111001;
	address[51] = 8'b00000100;
	
	//14
	address[52] = 8'b10110011;       
	address[53] = 8'b00001001;
	address[54] = 8'b00100000;
	address[55] = 8'b00000001;
	
	//15
	address[56] = 8'b01100011;       
	address[57] = 8'b10001110;
	address[58] = 8'b10111001;
	address[59] = 8'b00000010;
	
	//16
	address[60] = 8'b10010011;          
	address[61] = 8'b00010010;
	address[62] = 8'b00111001;
	address[63] = 8'b00000000;
	
	//17
	address[64] = 8'b00010011;          
	address[65] = 8'b10010011;
	address[66] = 8'b00111001;
	address[67] = 8'b00000000;
	
	//18
	address[68] = 8'b10110011;       
	address[69] = 8'b10000010;
	address[70] = 8'b10100010;
	address[71] = 8'b00000000;
	
	//19
	address[72] = 8'b00110011;
	address[73] = 8'b00000011; 
	address[74] = 8'b10100011; 
	address[75] = 8'b00000000;
	
	//20
	address[76] = 8'b00000011;	   
	address[77] = 8'b10111110; 
	address[78] = 8'b00000010; 
	address[79] = 8'b00000000;

	//21
	address[80] = 8'b10000011;	  
	address[81] = 8'b00111110; 
	address[82] = 8'b00000011; 
	address[83] = 8'b00000000;

	//22
	address[84] = 8'b01100011;
	address[85] = 8'b01011100; 
	address[86] = 8'b11011110; 
	address[87] = 8'b00000001;

	//23
	address[88] = 8'b00110011;
	address[89] = 8'b00001111; 
	address[90] = 8'b11000000; 
	address[91] = 8'b00000001;
	
	//24
	address[92] = 8'b00110011;
	address[93] = 8'b00001110; 
	address[94] = 8'b11010000; 
	address[95] = 8'b00000001;

	//25
	address[96] = 8'b10110011;
	address[97] = 8'b00001110; 
	address[98] = 8'b11100000; 
	address[99] = 8'b00000001;
	
	//26
	address[100] = 8'b00100011;	   
	address[101] = 8'b10110000; 
	address[102] = 8'b11000010; 
	address[103] = 8'b00000001;
	
	//27
	address[104] = 8'b00100011;	   
	address[105] = 8'b00110000; 
	address[106] = 8'b11010011; 
	address[107] = 8'b00000001;

	//28
	address[108] = 8'b10010011;
	address[109] = 8'b10001001; 
	address[110] = 8'b00011001; 
	address[111] = 8'b00000000;

	//29
	address[112] = 8'b11100011;
	address[113] = 8'b00000100; 
	address[114] = 8'b00000000; 
	address[115] = 8'b11111100;

	//30
	address[116] = 8'b00010011;
	address[117] = 8'b00001001; 
	address[118] = 8'b00011001; 
	address[119] = 8'b00000000;

	//31
	address[120] = 8'b11100011;
	address[121] = 8'b00001100; 
	address[122] = 8'b00000000; 
	address[123] = 8'b11111010;

	//32
	address[124] = 8'b01100011;
	address[125] = 8'b00000010; 
	address[126] = 8'b00000000; 
	address[127] = 8'b00000000;

	//33
	address[128] = 8'b00010011;
	address[129] = 8'b00000000; 
	address[130] = 8'b00000000; 
	address[131] = 8'b00000000;
	
	end
	
	always@(*)
	Instruction = {address[Inst_Address + 3], address[Inst_Address + 2],
				address[Inst_Address + 1], address[Inst_Address]};

endmodule

