module aes_encrypt_serial_tb;
        logic clk;
        logic rst_n;

        logic start;
        logic [7:0] plain_byte;
        logic plain_valid;
        wire plain_ready;
        logic [7:0] key_byte;
        logic key_valid;
        wire key_ready;
        wire [7:0] cipher_byte;
        wire cipher_valid;
        logic cipher_ready;
        wire busy;
        wire done;

        aes_encrypt_128_serial dut (
                .clk(clk),
                .rst_n(rst_n),
                .start(start),
                .plain_byte(plain_byte),
                .plain_valid(plain_valid),
                .plain_ready(plain_ready),
                .key_byte(key_byte),
                .key_valid(key_valid),
                .key_ready(key_ready),
                .cipher_byte(cipher_byte),
                .cipher_valid(cipher_valid),
                .cipher_ready(cipher_ready),
                .busy(busy),
                .done(done)
        );

        initial begin
                clk = 1'b0;
                forever #5 clk = ~clk;
        end

        byte plain_data [0:15] = '{
                8'h00, 8'h11, 8'h22, 8'h33,
                8'h44, 8'h55, 8'h66, 8'h77,
                8'h88, 8'h99, 8'haa, 8'hbb,
                8'hcc, 8'hdd, 8'hee, 8'hff
        };

        byte key_data [0:15] = '{
                8'h00, 8'h01, 8'h02, 8'h03,
                8'h04, 8'h05, 8'h06, 8'h07,
                8'h08, 8'h09, 8'h0a, 8'h0b,
                8'h0c, 8'h0d, 8'h0e, 8'h0f
        };

        byte cipher_capture [0:15];
        integer capture_index;

        logic [127:0] expected_cipher = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;
        logic [127:0] observed_cipher;

        initial begin
                rst_n = 1'b0;
                start = 1'b0;
                plain_byte = 8'h00;
                plain_valid = 1'b0;
                key_byte = 8'h00;
                key_valid = 1'b0;
                cipher_ready = 1'b1;
                capture_index = 0;

                repeat (2) @(posedge clk);
                rst_n = 1'b1;

                @(posedge clk);
                start = 1'b1;
                @(posedge clk);
                start = 1'b0;

                for (int i = 0; i < 16; i++) begin
                        @(posedge clk);
                        wait (plain_ready);
                        plain_byte = plain_data[i];
                        plain_valid = 1'b1;
                        @(posedge clk);
                        plain_valid = 1'b0;
                end

                for (int j = 0; j < 16; j++) begin
                        @(posedge clk);
                        wait (key_ready);
                        key_byte = key_data[j];
                        key_valid = 1'b1;
                        @(posedge clk);
                        key_valid = 1'b0;
                end

                wait (done);

                observed_cipher = '0;
                for (int k = 0; k < 16; k++) begin
                        observed_cipher = {observed_cipher[119:0], cipher_capture[k]};
                end

                if (observed_cipher !== expected_cipher) begin
                        $error("Cipher mismatch. Expected %032h, got %032h", expected_cipher, observed_cipher);
                end else begin
                        $display("Cipher matches expected value: %032h", observed_cipher);
                end

                $finish;
        end

        always @(posedge clk) begin
                if (cipher_valid && cipher_ready) begin
                        cipher_capture[capture_index] <= cipher_byte;
                        capture_index <= capture_index + 1;
                end
        end

endmodule
