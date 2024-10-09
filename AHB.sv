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

module AHB (
    input logic HCLK,
    input logic HRESETn,
    input logic [11:2] HADDR,
    input logic HTRANS,
    input logic HWRITE,
    input logic [2:0] HSIZE,
    input logic HPROT,
    input logic [31:0] HWDATA,
    input logic HSELVIC,
    input logic HREADYIN,

    output logic [31:0] HRDATA,
    output logic HREADYOUT,
    output logic [1:0] HRESP
);
    


endmodule