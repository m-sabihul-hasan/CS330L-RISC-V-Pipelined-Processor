module ALU_Control
(
	input [1:0] ALUOp,
	input [3:0] Funct,
	output reg [3:0] Operation
);

	always@(*)
	begin
		case(ALUOp)
			2'b00:
				begin
				case(Funct)
				4'b0000:
					Operation = 4'b0010;	//addition
					
				4'b0001:
					Operation = 4'b1111;	//Shift left
				endcase
				end
			2'b01:
				Operation = 4'b0110;
				
			2'b10:
				begin
				case(Funct)
				4'b0000:
					Operation = 4'b0010;	//addition
					
				4'b1000:
					Operation = 4'b0110;	//subtraction
					
				4'b0111:
					Operation = 4'b0000;	//AND
					
				4'b0110:
					Operation = 4'b0001;	//OR
				endcase
				end
		endcase
	end
endmodule

