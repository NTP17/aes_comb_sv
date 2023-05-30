module aes_decrypt_128 (
	input [127:0] cipher, key,
	output [127:0] key1, key2, key3, key4, key5, key6, key7, key8, key9, key10,
	output [127:0] round0, round1, round2, round3, round4, round5, round6, round7, round8, round9,
	output [127:0] plain
);

	wire [127:0] rnd0, rnd1, rnd2, rnd3, rnd4, rnd5, rnd6, rnd7, rnd8, rnd9, rndsub, rndshift;
	wire [127:0] exp1, exp2, exp3, exp4, exp5, exp6, exp7, exp8, exp9, exp10;

	key_expansion kexp (
		.user_key(key),
		.round1(exp1),
		.round2(exp2),
		.round3(exp3),
		.round4(exp4),
		.round5(exp5),
		.round6(exp6),
		.round7(exp7),
		.round8(exp8),
		.round9(exp9),
		.round10(exp10)
	);

	add_round_key s0 (
		.before_add(cipher),
		.round_key(exp10),
		.after_add(rnd0)
	);

	single_round s1 (
		.before_round(rnd0),
		.round_key(exp9),
		.after_round(rnd1)
	);

	single_round s2 (
		.before_round(rnd1),
		.round_key(exp8),
		.after_round(rnd2)
	);

	single_round s3 (
		.before_round(rnd2),
		.round_key(exp7),
		.after_round(rnd3)
	);

	single_round s4 (
		.before_round(rnd3),
		.round_key(exp6),
		.after_round(rnd4)
	);

	single_round s5 (
		.before_round(rnd4),
		.round_key(exp5),
		.after_round(rnd5)
	);

	single_round s6 (
		.before_round(rnd5),
		.round_key(exp4),
		.after_round(rnd6)
	);

	single_round s7 (
		.before_round(rnd6),
		.round_key(exp3),
		.after_round(rnd7)
	);

	single_round s8 (
		.before_round(rnd7),
		.round_key(exp2),
		.after_round(rnd8)
	);

	single_round s9 (
		.before_round(rnd8),
		.round_key(exp1),
		.after_round(rnd9)
	);

	inv_shift_rows isr (
		.before_shift(rnd9),
		.after_shift(rndshift)
	);

	inv_sub_bytes isb (
		.before_sub(rndshift),
		.after_sub(rndsub)
	);

	add_round_key s10 (
		.before_add(rndsub),
		.round_key(key),
		.after_add(plain)
	);

	assign key1 = exp1;
	assign key2 = exp2;
	assign key3 = exp3;
	assign key4 = exp4;
	assign key5 = exp5;
	assign key6 = exp6;
	assign key7 = exp7;
	assign key8 = exp8;
	assign key9 = exp9;
	assign key10 = exp10;
	
	assign round0 = rnd0;
	assign round1 = rnd1;
	assign round2 = rnd2;
	assign round3 = rnd3;
	assign round4 = rnd4;
	assign round5 = rnd5;
	assign round6 = rnd6;
	assign round7 = rnd7;
	assign round8 = rnd8;
	assign round9 = rnd9;

endmodule