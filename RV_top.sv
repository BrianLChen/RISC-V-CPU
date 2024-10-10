/////////////////////////////////////////////////////////////////////
// Design unit: Top level
//            :
// File name  : RV_top.sv
//            :
// Description: top level of the full chip
//            :
// Limitations:
//            :
// System     : SystemVerilog IEEE 1800-2005
//            :
// Author     : Letian(Brian) Chen
//
// Revision   : Version 0.0 10/2024
/////////////////////////////////////////////////////////////////////
module RV_top(
    input logic clock, nRst,

    output logic TX
  );

  // AHB bus
  wire [31:0] HADDR; // Address
  logic [1:0] HTRANS; // Transfer Type:non-sequential, sequential, IDLE, BUSY
  logic HWRITE; // 1-write, 0-read
  logic [2:0] HSIZE; // 8-bit, 16-bit, 32-bit
  logic [2:0] HBURST; // Burst type
  logic HPROT; // protection
  wire [31:0] HWDATA; // write data
  logic HSELx; // slave select
  logic HREADYIN; // transfer done
  logic [31:0] HRDATA; // read data
  logic HREADYOUT; // transfer done
  logic [1:0] HRESP; // transfer response: OKAY, ERROR, RETRY, SPLIT
  // AHB Arbitration
  logic HBUSREQx; // bus require
  logic HLOCKx; // Locked transfer
  logic [15:0] HSPLITx; // split completion
  logic HGRANTx; // bus grant, master access bus when both HREADY and HGRANT are high
  logic [3:0] HMASTER; // Master Number
  logic HMASTOCK; // current master performing Locked Transfer

  // cpu

  // uart

  // SRAM



  AHB AHB1 (.HCLK(clock), .HRESETn(nRst), .HADDR, .HTRANS, .HWRITE, .HSIZE, .HBURST,
            .HPROT, .HWDATA, .HSELx, .HREADYIN, .HRDATA, .HREADYOUT, .HRESP,
            .HBUSREQx, .HLOCKx, .HSPLITx, .HGRANTx, .HMASTER, .HMASTOCK);


  uart uart1 (.clock, .nRst, .data_in(HWDATA), .data_out(HWDATA));

endmodule
