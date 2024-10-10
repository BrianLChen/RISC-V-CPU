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
module SRAM #(parameter RAM_size = 1024)
  (
    input logic HCLK,
    input logic HRESETn,
    input logic write_enable,
    input logic [31:0] Address,
    input logic [31:0] write_data,

    output logic HREADYOUT,
    output logic [31:0] read_data
  );

  logic [31:0] SRAM_data [RAM_size-1:0];

  always_ff @(posedge HCLK or negedge HRESETn)
  begin
    if(!HRESETn)
    begin
      $readmemh("prog.hex", SRAM_data);
      HREADYOUT <= 0;
      read_data <= 0;
    end
    else
    begin
      // respond the AHB bus
      HREADYOUT <= 1;
      read_data <= SRAM_data[Address];
    end
  end

endmodule
