module poly_mul (
	input [7:0] a, b,
	output [7:0] result
);

	wire [7:0] b7, b6, b5, b4, b3, b2, b1, b0;

	poly_shift p0 (.bef(a), .amount(3'h0), .aft(b0));
	poly_shift p1 (.bef(a), .amount(3'h1), .aft(b1));
	poly_shift p2 (.bef(a), .amount(3'h2), .aft(b2));
	poly_shift p3 (.bef(a), .amount(3'h3), .aft(b3));
	poly_shift p4 (.bef(a), .amount(3'h4), .aft(b4));
	poly_shift p5 (.bef(a), .amount(3'h5), .aft(b5));
	poly_shift p6 (.bef(a), .amount(3'h6), .aft(b6));
	poly_shift p7 (.bef(a), .amount(3'h7), .aft(b7));
	
	assign result = (b[7] == 1 ? b7 : 8'b0) ^
	                (b[6] == 1 ? b6 : 8'b0) ^
						 (b[5] == 1 ? b5 : 8'b0) ^
						 (b[4] == 1 ? b4 : 8'b0) ^
						 (b[3] == 1 ? b3 : 8'b0) ^
						 (b[2] == 1 ? b2 : 8'b0) ^
						 (b[1] == 1 ? b1 : 8'b0) ^
						 (b[0] == 1 ? b0 : 8'b0);

endmodule