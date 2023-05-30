module key_expansion (
	input [127:0] user_key,
	output [127:0] round1, round2, round3, round4, round5, round6, round7, round8, round9, round10
);

	wire [127:0] after1, after2, after3, after4, after5, after6, after7, after8, after9;

	expand_single_round r1 (
		.round_no(4'd1),
		.before_ex(user_key),
		.after_ex(after1)
	);

	expand_single_round r2 (
		.round_no(4'd2),
		.before_ex(after1),
		.after_ex(after2)
	);

	expand_single_round r3 (
		.round_no(4'd3),
		.before_ex(after2),
		.after_ex(after3)
	);

	expand_single_round r4 (
		.round_no(4'd4),
		.before_ex(after3),
		.after_ex(after4)
	);

	expand_single_round r5 (
		.round_no(4'd5),
		.before_ex(after4),
		.after_ex(after5)
	);

	expand_single_round r6 (
		.round_no(4'd6),
		.before_ex(after5),
		.after_ex(after6)
	);

	expand_single_round r7 (
		.round_no(4'd7),
		.before_ex(after6),
		.after_ex(after7)
	);

	expand_single_round r8 (
		.round_no(4'd8),
		.before_ex(after7),
		.after_ex(after8)
	);

	expand_single_round r9 (
		.round_no(4'd9),
		.before_ex(after8),
		.after_ex(after9)
	);

	expand_single_round r10 (
		.round_no(4'd10),
		.before_ex(after9),
		.after_ex(round10)
	);

	assign round1 = after1;
	assign round2 = after2;
	assign round3 = after3;
	assign round4 = after4;
	assign round5 = after5;
	assign round6 = after6;
	assign round7 = after7;
	assign round8 = after8;
	assign round9 = after9;

endmodule