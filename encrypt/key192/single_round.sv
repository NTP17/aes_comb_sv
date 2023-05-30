module single_round (
	input [127:0] before_round, round_key,
	output [127:0] after_round
);

	wire [127:0] after_sub, after_shift, after_mix;

	sub_bytes sb (
		.before_sub(before_round),
		.after_sub(after_sub)
	);

	shift_rows sr (
		.before_shift(after_sub),
		.after_shift(after_shift)
	);

	mix_columns mc (
		.before_mix(after_shift),
		.after_mix(after_mix)
	);

	add_round_key ark (
		.before_add(after_mix),
		.round_key(round_key),
		.after_add(after_round)
	);

endmodule