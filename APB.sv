/////////////////////////////////////////////////////////////////////
// Design unit: AHB
//            :
// File name  : AHB.sv
//            :
// Description: AHB Bus
//            :
// Limitations:
//            :
// System     : SystemVerilog IEEE 1800-2005
//            :
// Author     : Letian(Brian) Chen
//
// Revision   : Version 0.0 10/2024
/////////////////////////////////////////////////////////////////////
module APB (
    input logic PCLK, PRESETn,

    input logic [31:0] PADDR,
    input logic PSELx, // APB select
    input logic PENABLE,
    input logic PWRITE, // 0: read, 1: write

    input logic [31:0] PWDATA, // bridge to slave

    output logic [31:0] PRDATA // slave to bridge
);
    
endmodule