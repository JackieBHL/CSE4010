`timescale 1ns / 1ps
module mux_5bit 
	#(parameter BITS = 32)(
	output	wire	[4:0]	y,		// Output of Multiplexer
	input		wire	[4:0]	a,		// Input 1 of Multiplexer
										b,		// Input 0 of Multiplexer
	input		wire					sel	// Select Input
   );
   
   assign	y = sel ? a : b;
	
endmodule // mux