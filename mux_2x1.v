module mux_2x1
(
	input [63:0] a, [63:0] b, 
    input sel,
    output reg [63:0] data_out
);

always @(*)
    case (sel)
        1'b0: data_out = a;
        default: data_out = b;
    endcase

endmodule


