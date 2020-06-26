module tb
(
);

	reg Clk;
	reg Reset;

	RISC_V_Processor risc
	(
		.clk(Clk),
		.reset(Reset)
	);
	
	initial
	begin
		Clk = 0;
		Reset = 1;
		
		#10
		Reset = 0;
	end
	
	always
	#5 Clk = ~ Clk;
	
endmodule

