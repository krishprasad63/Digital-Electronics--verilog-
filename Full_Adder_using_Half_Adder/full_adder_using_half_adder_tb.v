module full_adder_using_half_adder_tb ();
    // Inputs
    reg a;
    reg b;
    reg cin;

    // Outputs
    wire sum;
    wire cout;

    // Instantiate the full adder using half adder module
    full_adder_using_half_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );
    initial begin
        $dumpfile("full_adder_using_half_adder.vcd"); // Specify the VCD file name
        $dumpvars(0, uut); // Dump all variables in this module
    end
    // Test cases
    initial begin
        // Test case 1: 0 + 0 + 0 = 0, cout = 0
        a = 0; b = 0; cin = 0;
        #10; // Wait for 10 time units

        // Test case 2: 0 + 0 + 1 = 1, cout = 0
        a = 0; b = 0; cin = 1;
        #10;

        // Test case 3: 0 + 1 + 0 = 1, cout = 0
        a = 0; b = 1; cin = 0;
        #10;

        // Test case 4: 0 + 1 + 1 = 2, cout = 1
        a = 0; b = 1; cin = 1;
        #10;

        // Test case 5: 1 + 0 + 0 = 1, cout = 0
        a = 1; b = 0; cin = 0;
        #10;

        // Test case 6: 1 + 0 + 1 = 2, cout = 1
        a = 1; b = 0; cin = 1;
        #10;

        // Test case 7: 1 + 1 + 0 = 2, cout = 1
        a = 1; b = 1; cin = 0;
        #10;

        // Test case 8: All inputs are high (1 + 1 + 1)
        a = 1; b = 1; cin = 1;
        #10;

        $finish; // End the simulation
    end

    initial begin
        $monitor("Time=%d | a=%b | b=%b | cin=%b | sum=%b | cout=%b", $time, a, b, cin, sum, cout);
    end

    
endmodule