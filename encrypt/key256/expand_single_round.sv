module expand_single_round(
	input [3:0] round_no,
	input [255:0] before_ex,
	output [255:0] after_ex
);

	wire [31:0] after_rot, after_sub, rcon_out;
	wire [31:0] word7, word6, word5, word4, sub4, word3, word2, word1, word0;

	rotate_word rot (
		.in_data({before_ex[31:24], before_ex[23:16], before_ex[15:8], before_ex[7:0]}),
		.out_data(after_rot)
	);

	sbox byte3 (
		.a(after_rot[31:24]),
		.c(after_sub[31:24])
	);

	sbox byte2 (
		.a(after_rot[23:16]),
		.c(after_sub[23:16])
	);

	sbox byte1 (
		.a(after_rot[15:8]),
		.c(after_sub[15:8])
	);

	sbox byte0 (
		.a(after_rot[7:0]),
		.c(after_sub[7:0])
	);

	rcon r (
		.sel(round_no),
		.outs(rcon_out)
	);

	sbox mid3 (
		.a(word4[31:24]),
		.c(sub4[31:24])
	);

	sbox mid2 (
		.a(word4[23:16]),
		.c(sub4[23:16])
	);

	sbox mid1 (
		.a(word4[15:8]),
		.c(sub4[15:8])
	);

	sbox mid0 (
		.a(word4[7:0]),
		.c(sub4[7:0])
	);

	assign word7 = {before_ex[255:248], before_ex[247:240], before_ex[239:232], before_ex[231:224]} ^ after_sub ^ rcon_out;
	assign word6 = {before_ex[223:216], before_ex[215:208], before_ex[207:200], before_ex[199:192]} ^ word7;
	assign word5 = {before_ex[191:184], before_ex[183:176], before_ex[175:168], before_ex[167:160]} ^ word6;
	assign word4 = {before_ex[159:152], before_ex[151:144], before_ex[143:136], before_ex[135:128]} ^ word5;
	assign word3 = {before_ex[127:120], before_ex[119:112], before_ex[111:104], before_ex[103:96]} ^ sub4;
	assign word2 = {before_ex[95:88], before_ex[87:80], before_ex[79:72], before_ex[71:64]} ^ word3;
	assign word1 = {before_ex[63:56], before_ex[55:48], before_ex[47:40], before_ex[39:32]} ^ word2;
	assign word0 = {before_ex[31:24], before_ex[23:16], before_ex[15:8], before_ex[7:0]} ^ word1;

	assign after_ex = (rcon_out == 32'b0) ? 128'b0 : {word7, word6, word5, word4, word3, word2, word1, word0};

endmodule