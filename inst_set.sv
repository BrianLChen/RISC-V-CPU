/////////////////////////////////////////////////////////////////////
// Design unit: Instruction Set
//            :
// File name  : inst_set.sv
//            :
// Description: instruction Set to Binary
//            :
// Limitations:
//            :
// System     : SystemVerilog IEEE 1800-2005
//            :
// Author     : Letian(Brian) Chen
//
// Revision   : Version 0.0 10/2024
/////////////////////////////////////////////////////////////////////

// Immediate Inst
`define lui     0110111
`define auipc   0010111

`define addi  = 0010011
`define slti  = 0010011