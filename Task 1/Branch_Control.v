module Branch_Control
(
	input Branch,
	input Zero,
	input Sign,
	input [3:0] Funct,
	output reg sel
);

always @(posedge Branch)
	begin
	case(Funct)
		4'b0000:
		sel = Zero;
		
		4'b0001:
		sel = ~Zero;
		
		4'b0101:
		sel = ~Sign;
	endcase
	end
	
endmodule

