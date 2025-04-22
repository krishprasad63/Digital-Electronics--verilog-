module half_adder (A, B, S, C);
    input A, B; // Inputs A and B
    output S, C; // Output S for sum and C for carry
    assign S = A ^ B; // Sum is the XOR of A and B
    assign C = A & B; // Carry is the AND of A and B
    
endmodule