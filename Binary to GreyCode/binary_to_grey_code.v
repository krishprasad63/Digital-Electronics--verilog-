module binary_to_grey_code (
    
    input [3:0] binary_in, // 4-bit binary input
    output reg [3:0] grey_out // 4-bit grey code output
);

    always @(*) begin
        grey_out[3] = binary_in[3]; // MSB remains the same
        grey_out[2] = binary_in[3] ^ binary_in[2]; // XOR of MSB and next bit
        grey_out[1] = binary_in[2] ^ binary_in[1]; // XOR of next two bits
        grey_out[0] = binary_in[1] ^ binary_in[0]; // XOR of LSB and next bit
    end
    
endmodule