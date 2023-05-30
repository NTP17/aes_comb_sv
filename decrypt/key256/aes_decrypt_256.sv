module aes_decrypt_256 (
	input [127:0] cipher,
	input [255:0] key,
	output [127:0] key0, key1, key2, key3, key4, key5, key6, key7, key8, key9, key10, key11, key12, key13, key14,
	output [127:0] round0, round1, round2, round3, round4, round5, round6, round7, round8, round9, round10, round11, round12, round13,
	output [127:0] plain
);

	wire [127:0] rnd0, rnd1, rnd2, rnd3, rnd4, rnd5, rnd6, rnd7, rnd8, rnd9, rnd10, rnd11, rnd12, rnd13, rndsub, rndshift;
	wire [255:0] exp1, exp2, exp3, exp4, exp5, exp6;
	wire [127:0] exp7;
	wire [127:0] rk0, rk1, rk2, rk3, rk4, rk5, rk6, rk7, rk8, rk9, rk10, rk11, rk12, rk13, rk14;

	key_expansion kexp (
		.user_key(key),
		.round1(exp1),
		.round2(exp2),
		.round3(exp3),
		.round4(exp4),
		.round5(exp5),
		.round6(exp6),
		.round7(exp7)
	);

	assign {rk0, rk1, rk2, rk3, rk4, rk5, rk6, rk7, rk8, rk9, rk10, rk11, rk12, rk13, rk14} = {key, exp1, exp2, exp3, exp4, exp5, exp6, exp7};

	add_round_key s0 (
		.before_add(cipher),
		.round_key(rk14),
		.after_add(rnd0)
	);

	single_round s1 (
		.before_round(rnd0),
		.round_key(rk13),
		.after_round(rnd1)
	);

	single_round s2 (
		.before_round(rnd1),
		.round_key(rk12),
		.after_round(rnd2)
	);

	single_round s3 (
		.before_round(rnd2),
		.round_key(rk11),
		.after_round(rnd3)
	);

	single_round s4 (
		.before_round(rnd3),
		.round_key(rk10),
		.after_round(rnd4)
	);

	single_round s5 (
		.before_round(rnd4),
		.round_key(rk9),
		.after_round(rnd5)
	);

	single_round s6 (
		.before_round(rnd5),
		.round_key(rk8),
		.after_round(rnd6)
	);

	single_round s7 (
		.before_round(rnd6),
		.round_key(rk7),
		.after_round(rnd7)
	);

	single_round s8 (
		.before_round(rnd7),
		.round_key(rk6),
		.after_round(rnd8)
	);

	single_round s9 (
		.before_round(rnd8),
		.round_key(rk5),
		.after_round(rnd9)
	);

	single_round s10 (
		.before_round(rnd9),
		.round_key(rk4),
		.after_round(rnd10)
	);

	single_round s11 (
		.before_round(rnd10),
		.round_key(rk3),
		.after_round(rnd11)
	);

	single_round s12 (
		.before_round(rnd11),
		.round_key(rk2),
		.after_round(rnd12)
	);

	single_round s13 (
		.before_round(rnd12),
		.round_key(rk1),
		.after_round(rnd13)
	);

	inv_shift_rows shift(
		.before_shift(rnd13),
		.after_shift(rndshift)
	);

	inv_sub_bytes sub (
		.before_sub(rndshift),
		.after_sub(rndsub)
	);

	add_round_key s14 (
		.before_add(rndsub),
		.round_key(rk0),
		.after_add(plain)
	);

	assign key0 = rk0;
	assign key1 = rk1;
	assign key2 = rk2;
	assign key3 = rk3;
	assign key4 = rk4;
	assign key5 = rk5;
	assign key6 = rk6;
	assign key7 = rk7;
	assign key8 = rk8;
	assign key9 = rk9;
	assign key10 = rk10;
	assign key11 = rk11;
	assign key12 = rk12;
	assign key13 = rk13;
	assign key14 = rk14;
	
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
	assign round10 = rnd10;
	assign round11 = rnd11;
	assign round12 = rnd12;
	assign round13 = rnd13;

endmodule