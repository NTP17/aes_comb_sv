// Sequential wrapper around the combinational AES-128 encryptor that
// reduces the plaintext, key and cipher interfaces to 8-bit transfers.
module aes_encrypt_128_serial (
        input  logic        clk,
        input  logic        rst_n,
        input  logic        start,
        input  logic [7:0]  plain_byte,
        input  logic        plain_valid,
        output logic        plain_ready,
        input  logic [7:0]  key_byte,
        input  logic        key_valid,
        output logic        key_ready,
        output logic [7:0]  cipher_byte,
        output logic        cipher_valid,
        input  logic        cipher_ready,
        output logic        busy,
        output logic        done
);

        typedef enum logic [2:0] {
                S_IDLE,
                S_LOAD_PLAIN,
                S_LOAD_KEY,
                S_COMPUTE,
                S_OUTPUT
        } state_t;

        state_t state, next_state;
        logic [3:0] plain_count;
        logic [3:0] key_count;
        logic [3:0] out_count;

        logic [127:0] plain_block;
        logic [127:0] key_block;
        logic [127:0] cipher_shift;

        wire [127:0] key1_unused, key2_unused, key3_unused, key4_unused,
                     key5_unused, key6_unused, key7_unused, key8_unused,
                     key9_unused, key10_unused;
        wire [127:0] round0_unused, round1_unused, round2_unused, round3_unused,
                     round4_unused, round5_unused, round6_unused, round7_unused,
                     round8_unused, round9_unused;
        wire [127:0] cipher_wire;

        aes_encrypt_128 comb (
                .plain(plain_block),
                .key(key_block),
                .key1(key1_unused),
                .key2(key2_unused),
                .key3(key3_unused),
                .key4(key4_unused),
                .key5(key5_unused),
                .key6(key6_unused),
                .key7(key7_unused),
                .key8(key8_unused),
                .key9(key9_unused),
                .key10(key10_unused),
                .round0(round0_unused),
                .round1(round1_unused),
                .round2(round2_unused),
                .round3(round3_unused),
                .round4(round4_unused),
                .round5(round5_unused),
                .round6(round6_unused),
                .round7(round7_unused),
                .round8(round8_unused),
                .round9(round9_unused),
                .cipher(cipher_wire)
        );

        assign plain_ready  = (state == S_LOAD_PLAIN);
        assign key_ready    = (state == S_LOAD_KEY);
        assign cipher_valid = (state == S_OUTPUT);
        assign cipher_byte  = cipher_shift[127:120];
        assign busy         = (state != S_IDLE);

        always_ff @(posedge clk or negedge rst_n) begin
                if (!rst_n) begin
                        state        <= S_IDLE;
                        plain_count  <= '0;
                        key_count    <= '0;
                        out_count    <= '0;
                        plain_block  <= '0;
                        key_block    <= '0;
                        cipher_shift <= '0;
                        done         <= 1'b0;
                end else begin
                        state <= next_state;
                        done  <= 1'b0;

                        unique case (state)
                                S_IDLE: begin
                                        if (start) begin
                                                plain_block  <= '0;
                                                key_block    <= '0;
                                                cipher_shift <= '0;
                                                plain_count  <= '0;
                                                key_count    <= '0;
                                                out_count    <= '0;
                                        end
                                end

                                S_LOAD_PLAIN: begin
                                        if (plain_valid && plain_ready) begin
                                                plain_block <= {plain_block[119:0], plain_byte};
                                                plain_count <= plain_count + 1'b1;
                                        end
                                end

                                S_LOAD_KEY: begin
                                        if (key_valid && key_ready) begin
                                                key_block <= {key_block[119:0], key_byte};
                                                key_count <= key_count + 1'b1;
                                        end
                                end

                                S_COMPUTE: begin
                                        cipher_shift <= cipher_wire;
                                        out_count    <= '0;
                                end

                                S_OUTPUT: begin
                                        if (cipher_valid && cipher_ready) begin
                                                cipher_shift <= {cipher_shift[119:0], 8'h00};
                                                out_count    <= out_count + 1'b1;
                                                if (out_count == 4'd15) begin
                                                        done <= 1'b1;
                                                end
                                        end
                                end
                        endcase
                end
        end

        always_comb begin
                next_state = state;
                unique case (state)
                        S_IDLE: begin
                                if (start) begin
                                        next_state = S_LOAD_PLAIN;
                                end
                        end

                        S_LOAD_PLAIN: begin
                                if (plain_valid && plain_ready && (plain_count == 4'd15)) begin
                                        next_state = S_LOAD_KEY;
                                end
                        end

                        S_LOAD_KEY: begin
                                if (key_valid && key_ready && (key_count == 4'd15)) begin
                                        next_state = S_COMPUTE;
                                end
                        end

                        S_COMPUTE: begin
                                next_state = S_OUTPUT;
                        end

                        S_OUTPUT: begin
                                if (cipher_valid && cipher_ready && (out_count == 4'd15)) begin
                                        next_state = S_IDLE;
                                end
                        end

                        default: next_state = S_IDLE;
                endcase
        end

endmodule
