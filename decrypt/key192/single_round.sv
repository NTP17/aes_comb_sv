module single_round (
	input [127:0] before_round, round_key,
	output [127:0] after_round
);

	wire [127:0] after_sub, after_shift, after_add;

	inv_shift_rows sr (
		.before_shift(before_round),
		.after_shift(after_shift)
	);

	inv_sub_bytes sb (
		.before_sub(after_shift),
		.after_sub(after_sub)
	);

	add_round_key ark (
		.before_add(after_sub),
		.round_key(round_key),
		.after_add(after_add)
	);

	inv_mix_columns mc (
		.before_mix(after_add),
		.after_mix(after_round)
	);

endmodule