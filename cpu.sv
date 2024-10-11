/////////////////////////////////////////////////////////////////////
// Design unit: CPU core
//            :
// File name  : cpu.sv
//            :
// Description: RV core
//            :
// Limitations:
//            :
// System     : SystemVerilog IEEE 1800-2005
//            :
// Author     : Letian(Brian) Chen
//
// Revision   : Version 0.0 10/2024
/////////////////////////////////////////////////////////////////////
module cpu (
    input logic clock, nRst,

    // to AHB
    output logic HBUSREQ1,
    output logic HADDR,

    input logic HGRANT1,
    input logic [31:0] HRDATA
  );

  logic [31:0] PC;
  logic [31:0] instruction;

  logic [19:0] immediate_num;

  enum {inst_fetch, inst_exe} cpu_state;

  always_ff @(posedge clock or negedge nRst)
  begin
    if(!nRst) // cpu reset
    begin
      PC <= 0; // reset prog counter
      HBUSREQ1 <= 0;
      HADDR <= 0;
    end
    else
    begin
      // fetch SRAM
      HBUSREQ1 <= 1; // Request the BUS
      HADDR <= PC; // remap the PC to address
      if(HGRANT1) // AHB allow cpu to use
      begin
      instruction <= HRDATA;
      end
    end
  end

  inst_decoder inst_decoder1(.instruction, .immediate_num);
endmodule
