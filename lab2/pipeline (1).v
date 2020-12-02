// Class: CSE 4010 Computer Architecture
// Name(s): 
module pipeline ();

  wire [31:0] IF_ID_instr, IF_ID_npc;
  reg EX_MEM_PCSrc;
  wire [31:0] EX_MEM_NPC;
  
    
   I_FETCH I_FETCH1(.IF_ID_instr(IF_ID_instr),
                    .IF_ID_npc(IF_ID_npc),
                    .EX_MEM_PCSrc(EX_MEM_PCSrc),
                    .EX_MEM_NPC(EX_MEM_NPC) );
                    
// Here you will add I_DECODE.  You will have to declare wires to make 
    reg	[4:0]		MEM_WB_rd;
	reg				MEM_WB_regwrite;
	reg	[31:0]	WB_mux5_writedata;	
	wire	[1:0]		wb_ctlout;
	wire	[2:0]		m_ctlout;
	wire				regdst, alusrc;
	wire	[1:0]		aluop; 
	wire	[31:0]	npcout, rdata1out, rdata2out, s_extendout;
	wire	[4:0]		instrout_2016, instrout_1511;
	IDECODE IDECODE2	(.IF_ID_instrout(IF_ID_instr),
							.IF_ID_npcout(IF_ID_npc),
							.MEM_WB_rd(MEM_WB_rd),
							.MEM_WB_regwrite(MEM_WB_regwrite),
							.WB_mux5_writedata(WB_mux5_writedata),
							//output
							.wb_ctlout(wb_ctlout),
							.m_ctlout(m_ctlout),
							.regdst(regdst),
							.aluop(aluop),
							.alusrc(alusrc),
							.npcout(npcout),
							.rdata1out(rdata1out),
							.rdata2out(rdata2out),
							.s_extendout(s_extendout),
							.instrout_2016(instrout_2016),
							.instrout_1511(instrout_1511));


initial begin
   EX_MEM_PCSrc <= 0;
   MEM_WB_rd <= 0;
   MEM_WB_regwrite <= 0;
   WB_mux5_writedata <= 0;
   end
endmodule // pipeline





