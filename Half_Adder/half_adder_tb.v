module half_adder_tb (
    );
    reg A, B; // Declare inputs as registers
    wire S, C; // Declare outputs as wires

    // Instantiate the half_Adder module
    half_adder uut (
        .A(A),
        .B(B),
        .S(S),
        .C(C)
    );

    initial begin
        $dumpfile("half_adder.vcd");
        $dumpvars(0, half_adder_tb);
    end

    initial begin
        // Test all combinations of A and B
        A = 0; B = 0; #10; // Wait for 10 time units
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
        
        $finish; // End the simulation
    end

    initial begin
        $monitor("Time=%0t: A=%b, B=%b, S=%b, C=%b",$time, A, B, S, C); // Monitor changes in inputs and outputs
    end

    
endmodule