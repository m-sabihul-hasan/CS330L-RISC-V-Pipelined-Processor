module Adder
(
	input [63:0] a, b,
	output reg[63:0] out
);


	always@(*)
	out  = a + b;
	
endmodule