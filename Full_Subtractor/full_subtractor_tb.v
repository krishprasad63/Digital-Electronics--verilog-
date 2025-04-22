module full_subtractor_tb (
    );
    
    reg a, b, bin; // Inputs
    wire d, bout; // Outputs
    
    // Instantiate the full subtractor module
    full_subtractor fs (
        .a(a),
        .b(b),
        .bin(bin),
        .d(d),
        .bout(bout)
    );
    
    initial begin
        // Test all combinations of inputs
        $monitor("a=%b, b=%b, bin=%b | d=%b, bout=%b", a, b, bin, d, bout);
        
        a = 0; b = 0; bin = 0; #10;
        a = 0; b = 0; bin = 1; #10;
        a = 0; b = 1; bin = 0; #10;
        a = 0; b = 1; bin = 1; #10;
        a = 1; b = 0; bin = 0; #10;
        a = 1; b = 0; bin = 1; #10;
        a = 1; b = 1; bin = 0; #10;
        a = 1; b = 1; bin = 1; #10;
        
        $finish;
    end
    
    initial begin
        $dumpfile("full_subtractor_tb.vcd");
        $dumpvars(0, full_subtractor_tb);
    end
endmodule