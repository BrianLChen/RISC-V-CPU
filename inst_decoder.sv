/////////////////////////////////////////////////////////////////////
// Design unit: Instruction decoder
//            :
// File name  : inst_decoder.sv
//            :
// Description: instruction decoder
//            :
// Limitations:
//            :
// System     : SystemVerilog IEEE 1800-2005
//            :
// Author     : Letian(Brian) Chen
//
// Revision   : Version 0.0 10/2024
/////////////////////////////////////////////////////////////////////
module inst_decoder (
    input logic [31:0] instruction,

    output logic [19:0] immediate_num
);
    
logic [6:0] opcode = instruction[6:0];

// always_comb
// begin
//     case (opcode)
//     7'b0110111: // lui

//     7'b0010111: // auipc

//     7'b0010011: // addi
//     7'b0010011: // slti
//     7'b0010011: // sltiu
//     7'b0010011: // xori
//     7'b0010011: ori
//     7'b0010011: andi
//     7'b0010011: slli
//     7'b0010011: srli
//     7'b0010011: srai

//     7'b0110011: add
//     7'b0110011: sub
//     7'b0110011: sll
//     7'b0110011: slt
//     7'b0110011: sltu
//     7'b0110011: xor
//     7'b0110011: srl
//     7'b0110011: sra
//     7'b0110011: or
//     7'b0110011: and

//     7'b0001111: fence
//     7'b0001111: fence.i
    
//     7'b1110011: csrrw
//     7'b1110011: csrrs
//     7'b1110011: csrrc
//     7'b1110011: csrrwi
//     7'b1110011: csrrsi
//     7'b1110011: csrrci
//     7'b1110011: ecall
//     7'b1110011: ebreak
//     7'b1110011: uret
//     7'b1110011: sret
//     7'b1110011: mret
//     7'b1110011: wfi
//     7'b1110011: sfence.vma

//     7'b0000011: lb
//     7'b0000011: lh
//     7'b0000011: lw
//     7'b0000011: lbu
//     7'b0000011: lhu

//     7'b0100011: sb
//     7'b0100011: sh
//     7'b0100011: sw

//     7'b1101111: jal

//     7'b1100111: jalr
    
//     7'b1100011: beq
//     7'b1100011: bne
//     7'b1100011: blt
//     7'b1100011: bge
//     7'b1100011: bltu
//     7'b1100011: bgeu
//     endcase
// end
endmodule