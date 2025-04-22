module half_subtractor (
    
    input wire a, // First input bit
    input wire b, // Second input bit
    output wire diff, // Difference output
    output wire borrow // Borrow output
);
    
    // Difference is A XOR B
    assign diff = a ^ b;
    
    // Borrow is NOT A AND B
    assign borrow = ~a & b;

    
endmodule