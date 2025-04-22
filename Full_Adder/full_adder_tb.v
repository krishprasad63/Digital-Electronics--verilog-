`timescale 1ns / 1ps

module full_adder_tb;

    // Testbench inputs
    reg a;
    reg b;
    reg cin;

    // Testbench outputs
    wire sum;
    wire cout;

    // Instantiate the full adder module
    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // VCD dump
initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(0, uut); // Dump the instance, not the module name
end
    // Apply test vectors
    initial begin
        a = 0; b = 0; cin = 0;
        #10 a = 0; b = 0; cin = 1;
        #10 a = 0; b = 1; cin = 0;
        #10 a = 0; b = 1; cin = 1;
        #10 a = 1; b = 0; cin = 0;
        #10 a = 1; b = 0; cin = 1;
        #10 a = 1; b = 1; cin = 0;
        #10 a = 1; b = 1; cin = 1;
        #10 $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time=%0t: a=%b b=%b cin=%b | sum=%b cout=%b", $time, a, b, cin, sum, cout);
    end

endmodule
