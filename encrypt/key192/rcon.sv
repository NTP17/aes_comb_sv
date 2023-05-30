module rcon(
	input [3:0] sel,
	output reg [31:0] outs
);

	always_comb
		case (sel)
			4'h1: outs = 32'h01000000;
			4'h2: outs = 32'h02000000;
			4'h3: outs = 32'h04000000;
			4'h4: outs = 32'h08000000;
			4'h5: outs = 32'h10000000;
			4'h6: outs = 32'h20000000;
			4'h7: outs = 32'h40000000;
			4'h8: outs = 32'h80000000;
			4'h9: outs = 32'h1b000000;
			4'ha: outs = 32'h36000000;
			default: outs = 32'b0;
		endcase

endmodule