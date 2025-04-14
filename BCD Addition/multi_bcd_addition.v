module bcd_adder (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);
    wire [4:0] temp_sum;
    wire [3:0] corrected_sum;
    wire correction_needed;

    assign temp_sum = A + B + Cin;
    assign correction_needed = (temp_sum > 9);
    assign corrected_sum = correction_needed ? (temp_sum + 4'b0110) : temp_sum;
    assign Sum = corrected_sum[3:0];
    assign Cout = correction_needed;

endmodule

module multi_bcd_adder (
    input [7:0] A,
    input [7:0] B,
    input Cin,
    output [7:0] Sum,
    output Cout
);
    wire [3:0] sum_low;
    wire [3:0] sum_high;
    wire carry_low;

    bcd_adder bcd_low (
        .A(A[3:0]),
        .B(B[3:0]),
        .Cin(Cin),
        .Sum(sum_low),
        .Cout(carry_low)
    );

    bcd_adder bcd_high (
        .A(A[7:4]),
        .B(B[7:4]),
        .Cin(carry_low),
        .Sum(sum_high),
        .Cout(Cout)
    );

    assign Sum = {sum_high, sum_low};

endmodule