module add_round_key(
	input [127:0] before_add, round_key,
	output [127:0] after_add
);

	assign after_add = before_add ^ round_key;

endmodule