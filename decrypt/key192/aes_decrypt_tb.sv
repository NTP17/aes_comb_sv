module aes_decrypt_tb;

  // Inputs
  reg [127:0] cipher;
  reg [192:0] key;

  // Outputs
  wire [127:0] key12, round0, key11, round1, key10, round2, key9, round3, key8, round4, key7, round5;
  wire [127:0] key6, round6, key5, round7, key4, round8, key3, round9, key2, round10, key1, round11, key0;
  reg [127:0] plain;

  // Instantiate the module to be tested
  aes_decrypt_192 dut (
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
    .cipher(cipher)
  );

  // Initialize inputs
  initial begin
    cipher = 128'hdda97ca4864cdfe06eaf70a0ec0d7191;
    key = 192'h000102030405060708090a0b0c0d0e0f1011121314151617;
  end

endmodule