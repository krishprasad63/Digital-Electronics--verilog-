module full_subtractor (
    input wire a, 
    input wire b, 
    input wire bin, // Borrow in
    output wire d, // Difference
    output wire bout // Borrow out
);
    
    assign d = a ^ b ^ bin; // Difference calculation
    assign bout = (~a & (b | bin)) | (b & bin); // Borrow out calculation
    
endmodule