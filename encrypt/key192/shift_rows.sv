module shift_rows(
	input [127:0] before_shift,
	output [127:0] after_shift
);

	assign after_shift[127:120] = before_shift[127:120];
	assign after_shift[95:88] = before_shift[95:88];
	assign after_shift[63:56] = before_shift[63:56];
	assign after_shift[31:24] = before_shift[31:24];

	rotate_word row1 (
		.in_data({before_shift[119:112], before_shift[87:80], before_shift[55:48], before_shift[23:16]}),
		.out_data({after_shift[119:112], after_shift [87:80], after_shift [55:48], after_shift [23:16]})
	);

	rotate_word #(16) row2 (
		.in_data({before_shift[111:104], before_shift[79:72], before_shift[47:40], before_shift[15:8]}),
		.out_data({after_shift[111:104], after_shift [79:72], after_shift [47:40], after_shift [15:8]})
	);

	rotate_word #(24) row3 (
		.in_data({before_shift[103:96], before_shift[71:64], before_shift[39:32], before_shift[7:0]}),
		.out_data({after_shift[103:96], after_shift [71:64], after_shift [39:32], after_shift [7:0]})
	);

endmodule