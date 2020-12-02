// Class: CSE 4010 Computer Architecture


module pipeline ();

  wire [31:0] IF_ID_instr, IF_ID_npc;
  reg EX_MEM_PCSrc;
  reg [31:0] EX_MEM_NPC;

   I_FETCH I_FETCH1(.IF_ID_instr(IF_ID_instr),
                    .IF_ID_npc(IF_ID_npc),
                    .EX_MEM_PCSrc(EX_MEM_PCSrc),
                    .EX_MEM_NPC(EX_MEM_NPC) );
                    
   initial begin
   EX_MEM_PCSrc <= 0;
   EX_MEM_NPC <= 0;
   end


endmodule // pipeline





