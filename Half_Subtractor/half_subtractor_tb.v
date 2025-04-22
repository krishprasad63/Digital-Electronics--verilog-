module half_subtractor_tb;

    reg a, b;
    
    wire diff, borrow;

  
    half_subtractor uut (
        .a(a),
        .b(b),
        .diff(diff),
        .borrow(borrow)
    );

  
    initial begin
        $dumpfile("half_subtractor_tb.vcd");
        $dumpvars(0, half_subtractor_tb);

        a = 0; b = 0;
        #10;
        a = 0; b = 1;
        #10; 
        a = 1; b = 0;
        #10; 
        a = 1; b = 1;
        #10; 
        $finish;
    end

    initial begin
        $monitor("Time: %0t | A: %b | B: %b | Diff: %b | Borrow: %b", $time, a, b, diff, borrow);
    end

endmodule