module imix_single_col (
	input  [7:0] in3, in2, in1, in0,
	output [7:0] s3, s2, s1, s0
);

	wire [7:0] s3e, s2b, s1d, s09;
	wire [7:0] s39, s2e, s1b, s0d;
	wire [7:0] s3d, s29, s1e, s0b;
	wire [7:0] s3b, s2d, s19, s0e;

	poly_mul p0 (
		.a(8'h0e),
		.b(in3),
		.result(s3e)
	);

	poly_mul p1 (
		.a(8'h0b),
		.b(in2),
		.result(s2b)
	);

	poly_mul p2 (
		.a(8'h0d),
		.b(in1),
		.result(s1d)
	);

	poly_mul p3 (
		.a(8'h09),
		.b(in0),
		.result(s09)
	);

///////////////////

	poly_mul p4 (
		.a(8'h09),
		.b(in3),
		.result(s39)
	);

	poly_mul p5 (
		.a(8'h0e),
		.b(in2),
		.result(s2e)
	);

	poly_mul p6 (
		.a(8'h0b),
		.b(in1),
		.result(s1b)
	);

	poly_mul p7 (
		.a(8'h0d),
		.b(in0),
		.result(s0d)
	);

///////////////////

	poly_mul p8 (
		.a(8'h0d),
		.b(in3),
		.result(s3d)
	);

	poly_mul p9 (
		.a(8'h09),
		.b(in2),
		.result(s29)
	);

	poly_mul pa (
		.a(8'h0e),
		.b(in1),
		.result(s1e)
	);

	poly_mul pb (
		.a(8'h0b),
		.b(in0),
		.result(s0b)
	);

///////////////////

	poly_mul pc (
		.a(8'h0b),
		.b(in3),
		.result(s3b)
	);

	poly_mul pd (
		.a(8'h0d),
		.b(in2),
		.result(s2d)
	);

	poly_mul pe (
		.a(8'h09),
		.b(in1),
		.result(s19)
	);

	poly_mul pf (
		.a(8'h0e),
		.b(in0),
		.result(s0e)
	);

	assign s3 = s3e ^ s2b ^ s1d ^ s09;
	assign s2 = s39 ^ s2e ^ s1b ^ s0d;
	assign s1 = s3d ^ s29 ^ s1e ^ s0b;
	assign s0 = s3b ^ s2d ^ s19 ^ s0e;

endmodule