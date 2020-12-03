// Class: CSCI 401 Computer Architecture
// Term: SPR11
// Name(s): 
//
// Lab #1: Instruction Fetch Stage

//                              -*- Mode: Verilog -*-
// Filename        : mem.v
// Description     : The instruction memory module
//                   of the IF stage of the pipeline
// Authors         : George M. Georgiou and Scott McWilliams
// Created On      : 2/06/2003
// Modified On     : 4/5/2011
// Modified By     : Jason Fredrick and David Sturgeon

module memory_if (
   output reg [31:0] data,       // Output of Instruction Memory
   input wire [31:0] addr        // Input of Instruction Memory
   );

// Register Declarations
   reg [31:0] MEM[0:127];  // 128 words of 32-bit memory
   integer i;

// Initialize Registers
   initial begin
  /* MEM[0] <= 'h00000000;
   MEM[1] <= 'h002300AA;
   MEM[2] <= 'h10654321;
   MEM[3] <= 'h00100022;
   MEM[4] <= 'h8C123456;
   MEM[5] <= 'h8F123456;
   MEM[6] <= 'hAD654321;
   MEM[7] <= 'h13012345;
   MEM[8] <= 'hAC654321;
   MEM[9] <= 'h12012345;*/
   $readmemb ( "risc.txt",MEM );
    for( i = 0; i< 24; i = i + 1 )
        $display(MEM[i] ) ;
   end
   
   always @ (addr) data <= MEM[addr];
endmodule // memory
