module aes_decrypt_tb;

  // Inputs
  reg [127:0] cipher;
  reg [255:0] key;

  // Outputs
  wire [127:0] key14, round0, key13, round1, key12, round2, key11, round3, key10, round4, key9, round5, key8, round6;
  wire [127:0] key7, round7, key6, round8, key5, round9, key4, round10, key3, round11, key2, round12, key1, round13, key0;
  reg [127:0] plain;

  // Instantiate the module to be tested
  aes_decrypt_256 dut (
    .plain(plain),
    .key(key),
	 .key0(key0),
    .key1(key1),
    .key2(key2),
    .key3(key3),
    .key4(key4),
    .key5(key5),
    .key6(key6),
    .key7(key7),
    .key8(key8),
    .key9(key9),
    .key10(key10),
	 .key11(key11),
	 .key12(key12),
	 .key13(key13),
	 .key14(key14),
    .round0(round0),
    .round1(round1),
    .round2(round2),
    .round3(round3),
    .round4(round4),
    .round5(round5),
    .round6(round6),
    .round7(round7),
    .round8(round8),
    .round9(round9),
	 .round10(round10),
	 .round11(round11),
	 .round12(round12),
	 .round13(round13),
    .cipher(cipher)
  );

  // Initialize inputs
  initial begin
    cipher = 128'h8ea2b7ca516745bfeafc49904b496089;
    key = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
  end

endmodule