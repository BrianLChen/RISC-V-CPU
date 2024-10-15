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

  logic [31:0] SRAM_data [0:4096*2-1];

  logic [31:0] addr;

  assign addr = {2'b0, HADDR[31:2]};

  always_ff @(posedge HCLK)
  begin
    if(HSEL) // select SRAM
    begin
      /* handle writes */
      if (HWRITE)
      begin
        // SRAM_data[HADDR[31:2]] <= HWDATA;
        SRAM_data[addr] <= HWDATA;
      end
    end
  end

  always_comb
  begin
    if(!HRESETn)
    begin
      HRDATA <= 32'h0;
    end
    else if(HSEL)
    begin
      // HRDATA <= SRAM_data[HADDR[31:2]];
      HRDATA <= SRAM_data[addr];
    end
    else
    begin
      HRDATA <= 32'h0;
    end
  end
endmodule
