module inv_mix_columns (
	input [127:0] before_mix,
	output [127:0] after_mix
);

	imix_single_col col0 (
		.in3(before_mix[127:120]),
		.in2(before_mix[119:112]),
		.in1(before_mix[111:104]),
		.in0(before_mix[103:96]),
		.s3(after_mix[127:120]),
		.s2(after_mix[119:112]),
		.s1(after_mix[111:104]),
		.s0(after_mix[103:96])
	);

	imix_single_col col1 (
		.in3(before_mix[95:88]),
		.in2(before_mix[87:80]),
		.in1(before_mix[79:72]),
		.in0(before_mix[71:64]),
		.s3(after_mix[95:88]),
		.s2(after_mix[87:80]),
		.s1(after_mix[79:72]),
		.s0(after_mix[71:64])
	);

	imix_single_col col2 (
		.in3(before_mix[63:56]),
		.in2(before_mix[55:48]),
		.in1(before_mix[47:40]),
		.in0(before_mix[39:32]),
		.s3(after_mix[63:56]),
		.s2(after_mix[55:48]),
		.s1(after_mix[47:40]),
		.s0(after_mix[39:32])
	);

	imix_single_col col3 (
		.in3(before_mix[31:24]),
		.in2(before_mix[23:16]),
		.in1(before_mix[15:8]),
		.in0(before_mix[7:0]),
		.s3(after_mix[31:24]),
		.s2(after_mix[23:16]),
		.s1(after_mix[15:8]),
		.s0(after_mix[7:0])
	);

endmodule