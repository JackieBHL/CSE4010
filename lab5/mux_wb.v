module mux_wb(

    output    wire    [4:0]    y,        // Output of Multiplexer
    input        wire    [4:0]    a,        // Input 1 of Multiplexe
                                    b,        // Input 0 of Multiplexer
    input        wire                    sel    // Select Input
   );
   assign    y = sel ? a : b;
endmodule