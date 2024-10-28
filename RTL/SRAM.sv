/////////////////////////////////////////////////////////////////////
// Design unit: SRAM
//            :
// File name  : SRAM.sv
//            :
// Description: SRAM
//            :
// Limitations:
//            :
// System     : SystemVerilog IEEE 1800-2005
//            :
// Author     : Letian(Brian) Chen
//
// Revision   : Version 0.0 10/2024
/////////////////////////////////////////////////////////////////////
module SRAM #(parameter RAM_size = 5120, parameter ADDR_WIDTH=32)
  (
    input logic HCLK,
    input logic HRESETn,
    input logic HSEL,
    input logic [3:0] HBE,
    output logic HREADY,
    // input logic [1:0] HTRANS,
    // input logic [2:0] HBURST,
    // input logic [2:0] HSIZE,
    input logic [31:0] HWDATA,
    input logic [31:0] HADDR,
    input logic HWRITE,

    output logic [31:0] HRDATA
    // output logic [1:0] HRESP
  );
  timeunit 1ns;
  timeprecision 100ps;
  // parameter hex_filename = "test.hex";

  localparam bytes = 2 ** 20;

  // logic [31:0] SRAM_data [bytes];
  logic [31:0] SRAM_data [0:4096*2-1];

  logic [ADDR_WIDTH-1:0] addr_int;

  always_comb addr_int = {6'b0, HADDR[27:2]}; // btye address

  initial // load hex into ram
  begin
    $readmemh("uart_tx.data", SRAM_data);
  end

  always_ff @(posedge HCLK)
  begin
    if(HSEL) // select SRAM
    begin
      if (HWRITE) // Write
      begin
        if (HBE[0])
          SRAM_data[addr_int][7:0] <= HWDATA[0+:8];
        if (HBE[1])
          SRAM_data[addr_int][15:8] <= HWDATA[8+:8];
        if (HBE[2])
          SRAM_data[addr_int][23:16] <= HWDATA[16+:8];
        if (HBE[3])
          SRAM_data[addr_int][31:24] <= HWDATA[24+:8];

        HRDATA <= SRAM_data[addr_int];
        HREADY <= 1;
      end
      /* handle reads */
      else // Read
      begin
        HRDATA <= SRAM_data[addr_int];
        HREADY <= 1;
      end
    end
    else
      HREADY <= 0;
  end
endmodule
