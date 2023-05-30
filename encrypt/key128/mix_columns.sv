module mix_columns (
	input [127:0] before_mix,
	output [127:0] after_mix
);

	gmix_column col0 (
		.r0(before_mix[127:120]),
		.r1(before_mix[119:112]),
		.r2(before_mix[111:104]),
		.r3(before_mix[103:96]),
		.out_r0(after_mix[127:120]),
		.out_r1(after_mix[119:112]),
		.out_r2(after_mix[111:104]),
		.out_r3(after_mix[103:96])
	);

	gmix_column col1 (
		.r0(before_mix[95:88]),
		.r1(before_mix[87:80]),
		.r2(before_mix[79:72]),
		.r3(before_mix[71:64]),
		.out_r0(after_mix[95:88]),
		.out_r1(after_mix[87:80]),
		.out_r2(after_mix[79:72]),
		.out_r3(after_mix[71:64])
	);

	gmix_column col2 (
		.r0(before_mix[63:56]),
		.r1(before_mix[55:48]),
		.r2(before_mix[47:40]),
		.r3(before_mix[39:32]),
		.out_r0(after_mix[63:56]),
		.out_r1(after_mix[55:48]),
		.out_r2(after_mix[47:40]),
		.out_r3(after_mix[39:32])
	);

	gmix_column col3 (
		.r0(before_mix[31:24]),
		.r1(before_mix[23:16]),
		.r2(before_mix[15:8]),
		.r3(before_mix[7:0]),
		.out_r0(after_mix[31:24]),
		.out_r1(after_mix[23:16]),
		.out_r2(after_mix[15:8]),
		.out_r3(after_mix[7:0])
	);

endmodule