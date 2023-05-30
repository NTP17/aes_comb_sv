module aes_decrypt_tb;

  reg [127:0] cipher;

  wire [127:0] key10, round0, key9, round1, key8, round2, key7, round3, key6, round4, key5, round5, key4, round6, key3, round7, key2, round8, key1, round9;
  reg [127:0] key;
  wire [127:0] plain; 

  // Instantiate the module to be tested
  aes_decrypt_128 dut (
    .plain(plain),
    .key(key),
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
    .cipher(cipher)
  );

  // Initialize inputs
  initial begin
    cipher = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;
    key = 128'h000102030405060708090a0b0c0d0e0f;
  end

endmodule