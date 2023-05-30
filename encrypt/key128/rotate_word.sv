module rotate_word #(parameter ROTATION_AMOUNT = 8) (
    input logic [31:0] in_data,
    output logic [31:0] out_data
);

    assign out_data = {in_data[32-ROTATION_AMOUNT-1:0], in_data[31:32-ROTATION_AMOUNT]};
 
endmodule