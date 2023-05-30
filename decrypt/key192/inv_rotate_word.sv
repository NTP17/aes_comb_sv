module inv_rotate_word #(parameter ROTATION_AMOUNT = 8) (
    input [31:0] in_data,
    output [31:0] out_data
);

    assign out_data = {in_data[ROTATION_AMOUNT-1:0], in_data[31:ROTATION_AMOUNT]};

endmodule