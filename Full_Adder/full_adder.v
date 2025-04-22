`timescale 1ns / 1ps
module full_adder (
    input wire a, // First input bit
    input wire b, // Second input bit
    input wire cin, // Carry-in bit
    output wire sum, // Sum output bit
    output wire cout // Carry-out bit
);

    // Sum is the XOR of a, b and cin
    assign sum = a ^ b ^ cin;

    // Carry-out is true if at least two of the inputs are true
    assign cout = (a & b) | (cin & (a ^ b));
    
endmodule