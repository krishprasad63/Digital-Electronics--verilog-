`timescale 1ns / 1ps

module four_bit_even_parity_tb;

    // Testbench signals
    reg [3:0] data_in;
    wire parity_out;

    // Instantiate the Unit Under Test (UUT)
    four_bit_even_parity uut (
        .data_in(data_in),
        .parity_out(parity_out)
    );

    initial begin
        $dumpfile("parity.vcd");
        $dumpvars(0, four_bit_even_parity_tb);
        $display("Time\tData In\tParity");
        $monitor("%0dns\t%b\t%b", $time, data_in, parity_out);

        // Test all 4-bit input combinations (0 to 15)
        data_in = 4'b0000; #10;
        data_in = 4'b0001; #10;
        data_in = 4'b0010; #10;
        data_in = 4'b0011; #10;
        data_in = 4'b0100; #10;
        data_in = 4'b0101; #10;
        data_in = 4'b0110; #10;
        data_in = 4'b0111; #10;
        data_in = 4'b1000; #10;
        data_in = 4'b1001; #10;
        data_in = 4'b1010; #10;
        data_in = 4'b1011; #10;
        data_in = 4'b1100; #10;
        data_in = 4'b1101; #10;
        data_in = 4'b1110; #10;
        data_in = 4'b1111; #10;

        $finish;
    end

endmodule
