`timescale 1ns / 1ps

module binary_to_grey_code_tb;

    // Testbench signals
    reg [3:0] binary_in;
    wire [3:0] grey_out;

    // Instantiate the Unit Under Test (UUT)
    binary_to_grey_code uut (
        .binary_in(binary_in),
        .grey_out(grey_out)
    );

    // Test sequence
    initial begin
            $dumpfile("waveform.vcd");
        $dumpvars(0, binary_to_grey_code_tb);

        $display("Time\tBinary\tGray");
        $monitor("%0dns\t%b\t%b", $time, binary_in, grey_out);

        // Test all 4-bit binary values
        binary_in = 4'b0000; #10;
        binary_in = 4'b0001; #10;
        binary_in = 4'b0010; #10;
        binary_in = 4'b0011; #10;
        binary_in = 4'b0100; #10;
        binary_in = 4'b0101; #10;
        binary_in = 4'b0110; #10;
        binary_in = 4'b0111; #10;
        binary_in = 4'b1000; #10;
        binary_in = 4'b1001; #10;
        binary_in = 4'b1010; #10;
        binary_in = 4'b1011; #10;
        binary_in = 4'b1100; #10;
        binary_in = 4'b1101; #10;
        binary_in = 4'b1110; #10;
        binary_in = 4'b1111; #10;

        $finish;
    end

endmodule
