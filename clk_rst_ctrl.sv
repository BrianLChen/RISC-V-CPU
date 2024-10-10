module clk_rst_control (
    input logic clock, nRst,

    output logic sys_clk, sys_nRst
);
    
assign sys_clk = clock;
assign sys_nRst = nRst;

endmodule