// Class: CSCI 401 Computer Architecture
// Term: SPR11
// Name(s): 
//
// Lab #1: Instruction Fetch Stage

//                              -*- Mode: Verilog -*-
// Filename        : pipeline.v
// Description     : The pipeline module which simulates the
//                   function of the IF stage of the pipeline
// Authors         : George M. Georgiou and Scott McWilliams
// Created On      : 2/06/2003
// Modified On     : 4/5/2011
// Modified By     : Jason Fredrick and David Sturgeon

//`include "ifetch.v"

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

// the connections between the I_FETCH and I_DECODE modules

//exicute
    wire	[1:0]		wb_ctlout_pipe;
	wire				branch, memread, memwrite;
	wire				zero;
	wire	[31:0]	alu_result, rdata2out_pipe;
	wire	[4:0]		five_bit_muxout;
    EXECUTE EXECUTE3(
                    .wb_ctl(wb_ctlout),  		
                    .m_ctl(m_ctlout),
                    
                    .regdst(regdst), 
                    .alusrc(alusrc),
                    .aluop(aluop), 
                    .npcout(npcout), 
                    .rdata1(rdata1out), 
                    .rdata2(rdata2out), 
                    .s_extendout(s_extendout),
                    .instrout_2016(instrout_2016), 
                    .instrout_1511(instrout_1511),
                    //outputs
                    .wb_ctlout(wb_ctlout_pipe),	
                    .branch(branch), 
                    .memread(memread), 
                    .memwrite(memwrite),
                    .add_result(EX_MEM_NPC), 	
                    .zero(zero),
                    .alu_result(alu_result), 
                    .rdata2out(rdata2out_pipe),
                    .five_bit_muxout(five_bit_muxout)
                    );  
initial begin
   EX_MEM_PCSrc <= 0;
   //EX_MEM_NPC <= 0;
   MEM_WB_rd <= 0;
   MEM_WB_regwrite <= 0;
   WB_mux5_writedata <= 0;
   end
endmodule // pipeline





