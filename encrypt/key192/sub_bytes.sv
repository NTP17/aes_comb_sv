module sub_bytes(
	input  [127:0] before_sub,
	output [127:0] after_sub
);

	sbox byte0 (.a(before_sub[127:120]), .c(after_sub[127:120]));
	sbox byte1 (.a(before_sub[119:112]), .c(after_sub[119:112]));
	sbox byte2 (.a(before_sub[111:104]), .c(after_sub[111:104]));
	sbox byte3 (.a(before_sub[103:96]), .c(after_sub[103:96]));
	sbox byte4 (.a(before_sub[95:88]), .c(after_sub[95:88]));
	sbox byte5 (.a(before_sub[87:80]), .c(after_sub[87:80]));
	sbox byte6 (.a(before_sub[79:72]), .c(after_sub[79:72]));
	sbox byte7 (.a(before_sub[71:64]), .c(after_sub[71:64]));
	sbox byte8 (.a(before_sub[63:56]), .c(after_sub[63:56]));
	sbox byte9 (.a(before_sub[55:48]), .c(after_sub[55:48]));
	sbox byteA (.a(before_sub[47:40]), .c(after_sub[47:40]));
	sbox byteB (.a(before_sub[39:32]), .c(after_sub[39:32]));
	sbox byteC (.a(before_sub[31:24]), .c(after_sub[31:24]));
	sbox byteD (.a(before_sub[23:16]), .c(after_sub[23:16]));
	sbox byteE (.a(before_sub[15:8]), .c(after_sub[15:8]));
	sbox byteF (.a(before_sub[7:0]), .c(after_sub[7:0]));

endmodule