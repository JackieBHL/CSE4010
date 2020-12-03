module WRITEBACK(
        input wire MEM_WD_memtoreg,
        input wire [31:0] read_data, mem_alu_result,
        output wire[31:0] WB_mux_writedata
    );

   mux_wb mux_wb3 (.y(WB_mux_writedata), 
             .a(read_data), 
             .b(mem_alu_result), 
             .sel(MEM_WD_memtoreg));

endmodule