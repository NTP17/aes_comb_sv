module inv_sub_bytes(
	input  [127:0] before_sub,
	output [127:0] after_sub
);

	inv_sbox byte0 (.sbin(before_sub[127:120]), .sbout(after_sub[127:120]));
	inv_sbox byte1 (.sbin(before_sub[119:112]), .sbout(after_sub[119:112]));
	inv_sbox byte2 (.sbin(before_sub[111:104]), .sbout(after_sub[111:104]));
	inv_sbox byte3 (.sbin(before_sub[103:96]), .sbout(after_sub[103:96]));
	inv_sbox byte4 (.sbin(before_sub[95:88]), .sbout(after_sub[95:88]));
	inv_sbox byte5 (.sbin(before_sub[87:80]), .sbout(after_sub[87:80]));
	inv_sbox byte6 (.sbin(before_sub[79:72]), .sbout(after_sub[79:72]));
	inv_sbox byte7 (.sbin(before_sub[71:64]), .sbout(after_sub[71:64]));
	inv_sbox byte8 (.sbin(before_sub[63:56]), .sbout(after_sub[63:56]));
	inv_sbox byte9 (.sbin(before_sub[55:48]), .sbout(after_sub[55:48]));
	inv_sbox byteA (.sbin(before_sub[47:40]), .sbout(after_sub[47:40]));
	inv_sbox byteB (.sbin(before_sub[39:32]), .sbout(after_sub[39:32]));
	inv_sbox byteC (.sbin(before_sub[31:24]), .sbout(after_sub[31:24]));
	inv_sbox byteD (.sbin(before_sub[23:16]), .sbout(after_sub[23:16]));
	inv_sbox byteE (.sbin(before_sub[15:8]), .sbout(after_sub[15:8]));
	inv_sbox byteF (.sbin(before_sub[7:0]), .sbout(after_sub[7:0]));

endmodule