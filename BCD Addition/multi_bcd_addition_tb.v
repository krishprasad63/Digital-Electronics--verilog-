`timescale 1ns / 1ps

module multi_bcd_adder_tb;

    reg [7:0] A;
    reg [7:0] B;
    reg Cin;
    wire [7:0] Sum;
    wire Cout;

    multi_bcd_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Function to convert 8-bit BCD to decimal
    function integer bcd_to_decimal(input [7:0] bcd);
        bcd_to_decimal = (bcd[7:4] * 10) + bcd[3:0];
    endfunction

    initial begin
        $dumpfile("multi_bcd_adder_tb.vcd");
        $dumpvars(0, multi_bcd_adder_tb);

        $display("=================================================================================================");
        $display("| Time(ns) | A (BCD)  | B (BCD)  | Cin  |   Sum (BCD)   | Cout | A (Dec) | B (Dec) | Sum (Dec) |");
        $display("=================================================================================================");

        // Test Case 1: 05 + 03 = 08
        A = 8'b00000101; B = 8'b00000011; Cin = 1'b0;
        #10;
        $display("| %8d | %b | %b |  %b  |    %b    |  %b   |   %3d   |   %3d   |    %3d    |", 
                 $time, A, B, Cin, Sum, Cout, bcd_to_decimal(A), bcd_to_decimal(B), bcd_to_decimal(Sum));

        // Test Case 2: 09 + 01 = 10
        A = 8'b00001001; B = 8'b00000001; Cin = 1'b0;
        #10;
        $display("| %8d | %b | %b |  %b  |    %b    |  %b   |   %3d   |   %3d   |    %3d    |", 
                 $time, A, B, Cin, Sum, Cout, bcd_to_decimal(A), bcd_to_decimal(B), bcd_to_decimal(Sum));

        // Test Case 3: 16 + 16 = 32
        A = 8'b00010110; B = 8'b00010110; Cin = 1'b0;
        #10;
        $display("| %8d | %b | %b |  %b  |    %b    |  %b   |   %3d   |   %3d   |    %3d    |", 
                 $time, A, B, Cin, Sum, Cout, bcd_to_decimal(A), bcd_to_decimal(B), bcd_to_decimal(Sum));

        // Test Case 4: 24 + 15 + 1 = 40
        A = 8'b00100100; B = 8'b00010101; Cin = 1'b1;
        #10;
        $display("| %8d | %b | %b |  %b  |    %b    |  %b   |   %3d   |   %3d   |    %3d    |", 
                 $time, A, B, Cin, Sum, Cout, bcd_to_decimal(A), bcd_to_decimal(B), bcd_to_decimal(Sum));

        // Test Case 5: 99 + 99 + 1 = 199
        A = 8'b10011001; B = 8'b10011001; Cin = 1'b1;
        #10;
        $display("| %8d | %b | %b |  %b  |    %b    |  %b   |   %3d   |   %3d   |    %3d    |", 
                 $time, A, B, Cin, Sum, Cout, bcd_to_decimal(A), bcd_to_decimal(B), bcd_to_decimal(Sum));

        $display("================================================================================================");
        $display("Testbench Completed.");
        $finish;
    end

endmodule