module poly_shift (
	input [7:0] bef,
	input [2:0] amount,
	output reg [7:0] aft
);

	wire [7:0] x02 = (bef << 1) ^ (bef[7] == 1 ? 8'h1b : 8'h0);
	wire [7:0] x04 = (x02 << 1) ^ (x02[7] == 1 ? 8'h1b : 8'h0);
	wire [7:0] x08 = (x04 << 1) ^ (x04[7] == 1 ? 8'h1b : 8'h0);
	wire [7:0] x10 = (x08 << 1) ^ (x08[7] == 1 ? 8'h1b : 8'h0);
	wire [7:0] x20 = (x10 << 1) ^ (x10[7] == 1 ? 8'h1b : 8'h0);
	wire [7:0] x40 = (x20 << 1) ^ (x20[7] == 1 ? 8'h1b : 8'h0);
	wire [7:0] x80 = (x40 << 1) ^ (x40[7] == 1 ? 8'h1b : 8'h0);

	always_comb
	case (amount)
		3'h0: aft = bef;
		3'h1: aft = x02;
		3'h2: aft = x04;
		3'h3: aft = x08;
		3'h4: aft = x10;
		3'h5: aft = x20;
		3'h6: aft = x40;
		3'h7: aft = x80;
	endcase

endmodule