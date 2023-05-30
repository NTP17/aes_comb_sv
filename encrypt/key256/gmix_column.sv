module gmix_column(
	input logic [7:0] r0, r1, r2, r3,
	output logic [7:0] out_r0, out_r1, out_r2, out_r3
);

   logic [7:0] b0, b1, b2, b3;

	assign b0 = (r0 << 1) ^ (r0[7] == 1 ? 8'h1b : 8'h0); // 2r0
	assign b1 = (r1 << 1) ^ (r1[7] == 1 ? 8'h1b : 8'h0);
	assign b2 = (r2 << 1) ^ (r2[7] == 1 ? 8'h1b : 8'h0);
	assign b3 = (r3 << 1) ^ (r3[7] == 1 ? 8'h1b : 8'h0);

	assign out_r0 = b0 ^ (b1 ^ r1) ^ r2 ^ r3; // 3r0 = 2r0 ^ r0
	assign out_r1 = r0 ^ b1 ^ (b2 ^ r2) ^ r3;
	assign out_r2 = r0 ^ r1 ^ b2 ^ (b3 ^ r3);
	assign out_r3 = (b0 ^ r0) ^ r1 ^ r2 ^ b3;

endmodule
