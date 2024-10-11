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
module SRAM #(parameter RAM_size = 5120)
  (
    input logic HCLK,
    input logic HRESETn,
    input logic write_enable,
    input logic [31:0] Address,
    input logic [31:0] write_data,

    output logic HREADYOUT,
    output logic [31:0] read_data
  );

  parameter hex_filename = "test.hex";

  // veriable for load hex file
  integer fp;
  logic [7:0] hex_bype;

  logic [31:0] SRAM_data [RAM_size-1:0];

  always_ff @(posedge HCLK or negedge HRESETn)
  begin
    if(!HRESETn)
    begin
      // fp=$fopen(hex_filename,"r");

      // while(1)
      // begin
      //   hex_bype = $fgetc(fp);
      //   if(hex_bype == "\n")
      //   begin

      //   end
      //   else if(hex_bype != ":")
      //   begin

      //   end
      //   else
      //   begin

      //   end
      // end
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
