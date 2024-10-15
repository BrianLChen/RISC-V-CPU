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
module SRAM
  (
    input logic HCLK,
    input logic HRESETn,
    input logic HSEL,
    input logic [31:0] HWDATA,
    input logic [31:0] HADDR,
    input logic HWRITE,

    output logic [31:0] HRDATA
  );

  logic [31:0] addr_int;
  logic [7:0] SRAM_data [4096*2-1:0];

  always_comb addr_int = {HADDR[31:2], 2'b0}; // byte address

  initial // load hex into ram
  begin
    $readmemh("simple_v.hex", SRAM_data);
  end

  always_ff @(posedge HCLK)
  begin
    // if(HSEL) // select SRAM
    // begin
      /* handle writes */
      if (HWRITE)
      begin
        // SRAM_data[HADDR[31:2]] <= HWDATA;
        SRAM_data[addr_int] <= HWDATA[0+:8];
        SRAM_data[addr_int+1] <= HWDATA[8+:8];
        SRAM_data[addr_int+2] <= HWDATA[16+:8];
        SRAM_data[addr_int+3] <= HWDATA[24+:8];
      end
      else
      begin
      end
    // end
    // else
    // begin
    // end
  end

  always_comb
  begin
    if(!HRESETn)
    begin
      HRDATA <= 32'h0;
    end
    // else if(HSEL)
    else
    begin
      // HRDATA <= SRAM_data[HADDR[31:2]];
      HRDATA[7:0]   <= SRAM_data[addr_int];
      HRDATA[15:8]  <= SRAM_data[addr_int+1];
      HRDATA[23:16] <= SRAM_data[addr_int+2];
      HRDATA[31:24] <= SRAM_data[addr_int+3];
    end
    // else
    // begin
    //   HRDATA <= 32'h0;
    // end
  end
endmodule
