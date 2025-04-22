module four_bit_even_parity (
    input [3:0] data_in, // 4-bit input data
    output parity_out // Even parity output
);
    // Calculate even parity by XORing all bits of the input data
    assign parity_out = data_in[0] ^ data_in[1] ^ data_in[2] ^ data_in[3];
    
endmodule