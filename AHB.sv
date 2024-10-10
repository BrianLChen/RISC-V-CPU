/////////////////////////////////////////////////////////////////////
// Design unit: AHB
//            :
// File name  : AHB.sv
//            :
// Description: AHB Bus
//            :
// Limitations:
//            :
// System     : SystemVerilog IEEE 1800-2005
//            :
// Author     : Letian(Brian) Chen
//
// Revision   : Version 0.0 10/2024
/////////////////////////////////////////////////////////////////////

module AHB (
    // Bus
    input logic HCLK, // Clock
    input logic HRESETn, // nReset
    input logic [31:0] HADDR, // Address
    input logic [1:0] HTRANS, // Transfer Type:0:IDLE, 1:BUSY, 2:non-sequential, 3:sequential
    input logic HWRITE, // 1-write, 0-read
    input logic [2:0] HSIZE, // 8-bit, 16-bit, 32-bit
    input logic [2:0] HBURST, // Burst type
    input logic [3:0] HPROT, // protection
    input logic [31:0] HWDATA, // write data
    input logic HREADYIN, // transfer done
    input logic HREADYOUT, // transfer done

    output logic HSEL1, HSEL2, HSEL3, // slave select: 1:SRAM, 2:UART, 3:interrupt_reg
    output logic [31:0] HRDATA, // read data
    output logic [1:0] HRESP, // transfer response: 0:OKAY, 1:ERROR, 2:RETRY, 3:SPLIT

    // Arbitration
    // 1: cpu core, 2 UART
    input logic HBUSREQ1, HBUSREQ2, // bus require
    input logic HLOCK1, HLOCK2, // Locked transfer
    input logic [15:0] HSPLITx, // split completion

    output logic HGRANT1, HGRANT2, // bus grant, master access bus when both HREADY and HGRANT are high
    output logic [3:0] HMASTER, // Master Number
    output logic HMASTOCK // current master performing Locked Transfer
  );

  wire [31:0] data_bus;

  always_ff @(posedge HCLK or negedge HRESETn)
  begin
    if(!HRESETn)
    begin
      HRDATA <= 0;
    end
  end

  always_comb
  begin
    HSEL1 = 0;
    HSEL2 = 0;
    HSEL3 = 0;
    
    if(HADDR == 32'h4000d000)
    begin
        HSEL2 = 1;
    end
    else if(HADDR == 32'h00000000)
    begin
        HSEL1 = 1;
    end
    else if (HADDR == 32'h40002000)
    begin

    end
    else
    begin
      // no slave selected
        HSEL1 = 0;
        HSEL2 = 0;
        HSEL3 = 0;
    end
  end

endmodule
