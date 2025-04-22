module full_adder_using_half_adder (
    input a, b, cin,
    output sum, cout
);
    wire s1, c1, c2;

    // First half adder
    assign s1 = a ^ b; // Sum of first half adder
    assign c1 = a & b; // Carry of first half adder

    // Second half adder
    assign sum = s1 ^ cin; // Final sum
    assign c2 = s1 & cin; // Carry of second half adder

    // Final carry out
    assign cout = c1 | c2; 
    
endmodule