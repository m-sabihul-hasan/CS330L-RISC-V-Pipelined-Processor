module ALU_64_bit
(
	input [63:0]a, [63:0]b, [3:0]ALUOp,
	output reg Zero,
	output reg [63:0]Result
);

always@(a or b or ALUOp)
	begin
		case (ALUOp)
			4'b0000:
			Result = a & b;   // AND
            4'b0001:
			Result = a | b;   // OR
            4'b0010:
			Result = a + b;    // addition
            4'b0110:
			begin
			Result = a - b;    // subtraction
			end
			4'b1100:
			Result = ~(a | b);	// NOR
			4'b1111:
			Result = a << b;	//Shift left
        endcase
		if (Result == 64'd0)
			Zero = 1;
		else
			Zero = 0;
	end

endmodule 