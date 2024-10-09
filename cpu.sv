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
    input logic clock, nRst
  );


  logic [31:0] PC;
  logic [31:0] instruction;

  logic [19:0] immediate_num;

  always_ff @(posedge clock or negedge nRst)
  begin
    if(!nRst)
    begin
      PC = 0; // reset prog counter
    end
    else
    begin
      PC <= PC + 1;
    end
  end

  inst_decoder inst_decoder1(.instruction, .immediate_num);
endmodule
