module ahb_bus #(ADDR_WIDTH=16)(
    // Arbitration
    input logic HCLK, // Clock
    input logic HRESETn, // nReset
    input logic [ADDR_WIDTH-1:0] HADDR_M1, HADDR_M2, // Address
    input logic [31:0] HWDATA_M1, HWDATA_M2,
    input logic [3:0] HBE_M1, HBE_M2, // Byte enable
    output logic [31:0] HRDATA_M1, HRDATA_M2,

    // 1: instruction, 2 data
    input logic HBUSREQ_M1, HBUSREQ_M2, // bus require
    input logic HWRITE_M1, HWRITE_M2,
    // input logic HLOCK1, HLOCK2, // Locked transfer
    //input logic [15:0] HSPLITx, // split completion

    output logic HGRANT_M1, HGRANT_M2, // bus grant, master access bus when both HREADY and HGRANT are high
    // output logic [3:0] HMASTER, // Master Number
    // output logic HMASTOCK, // current master performing Locked Transfer

    // 2 slave
    // HSEL1=SRAM, HSEL2=CLK CONTROL, HSEL3=uart
    output logic HSEL1, HSEL2, HSEL3, HSEL4,
    output logic [3:0] HBE_S1, HBE_S2, HBE_S3, HBE_S4, // byte selection
    output logic [ADDR_WIDTH-1:0] HADDR_S1, HADDR_S2, HADDR_S3, HADDR_S4,

    output logic HWRITE_S1, HWRITE_S2, HWRITE_S3, HWRITE_S4, // write control to slave
    input logic [31:0] HRDATA_S1, HRDATA_S2, HRDATA_S3, HRDATA_S4, // master <- slave
    output logic [31:0] HWDATA_S1, HWDATA_S2, HWDATA_S3, HWDATA_S4 // master -> slave
  );
  timeunit 1ns;
  timeprecision 100ps;

  enum {IDLE, transfer} ahb_state;

  logic rvalid_m1, rvalid_m2;
  logic HWRITE; // write control
  logic [3:0] HBE;
  logic [ADDR_WIDTH-1:0] HADDR;
  logic [31:0] HDATA;

  logic HBUSREQ_M1_pre, HBUSREQ_M2_pre;

  // store if any device uing the bus
  always_ff @(posedge HCLK or negedge HRESETn)
  begin
    if(!HRESETn)
    begin
      HBUSREQ_M1_pre <= 0;
      HBUSREQ_M2_pre <= 0;
    end
    else
    begin
      HBUSREQ_M1_pre <= HGRANT_M1;
      HBUSREQ_M2_pre <= HGRANT_M2;
    end
  end

  // arbiter to the two master
  always_comb
  begin
    case ({HBUSREQ_M1, HBUSREQ_M2})
      2'b00:
      begin
        HGRANT_M1 = 0;
        HGRANT_M2 = 0;
      end
      2'b10:
      begin
        HGRANT_M1 = 1;
        HGRANT_M2 = 0;
      end
      2'b01:
      begin
        HGRANT_M1 = 0;
        HGRANT_M2 = 1;
      end
      2'b11:
      begin
        if(HBUSREQ_M1_pre)
        begin
          HGRANT_M1 = 1;
          HGRANT_M2 = 0;
        end
        else if(HBUSREQ_M2_pre)
        begin
          HGRANT_M1 = 0;
          HGRANT_M2 = 1;
        end
        else
        begin
          HGRANT_M1 = 1;
          HGRANT_M2 = 0;
        end
      end
    endcase
  end

  always_ff @(posedge HCLK or negedge HRESETn)
  begin
    if(!HRESETn)
    begin
      rvalid_m1 <= 0;
      rvalid_m2 <= 0;
    end
    else
    begin
      rvalid_m1 <= HGRANT_M1;
      rvalid_m2 <= HGRANT_M2;
    end
  end
  
  // master signal MUX
  always_comb
  begin
    begin
      if(HGRANT_M1)
      begin
        HWRITE = HWRITE_M1;
        HBE = HBE_M1;
        HADDR = HADDR_M1;
      end
      else if (HGRANT_M2)
      begin
        HWRITE = HWRITE_M2;
        HBE = HBE_M2;
        HADDR = HADDR_M2;
      end
      else
      begin
        HWRITE = '0;
        HBE = '0;
        HADDR = '0;
      end
    end
  end

  // slave select & signal MUX
  always_comb
  begin
    begin
      if(HADDR >= 0 && HADDR < 32'h40002000 )
      begin // SRAM
        HSEL1 = '1;
        HSEL2 = '0;
        HSEL3 = '0;
        HBE_S1 = HBE;
        HBE_S2 = '0;
        HBE_S3 = '0;
        HADDR_S1 = HADDR;
        HADDR_S2 = '0;
        HADDR_S3 = '0;
      end
      else if(HADDR >= 32'h40002000 && HADDR < 32'h4000d000)
      begin // clock control
        HSEL1 = 0;
        HSEL2 = 1;
        HSEL3 = 0;
        HBE_S1 = '0;
        HBE_S2 = HBE;
        HBE_S3 = '0;
        HADDR_S1 = '0;
        HADDR_S2 = HADDR;
        HADDR_S3 = '0;
      end
      else if(HADDR >= 32'h4000d000)
      begin // uart -- through APB Bridge
        HSEL1 = 0;
        HSEL2 = 0;
        HSEL3 = 1;
        HBE_S1 = '0;
        HBE_S2 = '0;
        HBE_S3 = HBE;
        HADDR_S1 = '0;
        HADDR_S2 = '0;
        HADDR_S3 = HADDR;
      end
      else
      begin // no slave selected
        HSEL1 = 0;
        HSEL2 = 0;
        HSEL3 = 0;
        HBE_S1 = '0;
        HBE_S2 = '0;
        HBE_S3 = '0;
        HADDR_S1 = '0;
        HADDR_S2 = '0;
        HADDR_S3 = '0;
      end
    end
  end

  // data MUX
  always_comb
  begin
    begin
      HRDATA_M1 = '0;
      HRDATA_M2 = '0;
      if(HBUSREQ_M1_pre && HWRITE_M1)
      begin
        HRDATA_M1 = '0;
        HRDATA_M2 = '0;
        case ({HSEL1, HSEL2, HSEL3})
          3'b100: // wirte to SRAM
          begin
            HWRITE_S1 = HWRITE_M1;
            HWRITE_S2 = '0;
            HWRITE_S3 = '0;

            HWDATA_S1 = HWDATA_M1;
            HWDATA_S2 = '0;
            HWDATA_S3 = '0;
          end
          3'b010: // write to clock control
          begin
            HWRITE_S1 = '0;
            HWRITE_S2 = HWRITE_M1;
            HWRITE_S3 = '0;

            HWDATA_S1 = '0;
            HWDATA_S2 = HWDATA_M1;
            HWDATA_S3 = '0;
          end
          3'b001: // write to uarts
          begin
            HWRITE_S1 = '0;
            HWRITE_S2 = '0;
            HWRITE_S3 = HWRITE_M1;

            HWDATA_S1 = '0;
            HWDATA_S2 = '0;
            HWDATA_S3 = HWDATA_M1;
          end
          default:
          begin
            HWRITE_S1 = '0;
            HWRITE_S2 = '0;
            HWRITE_S3 = '0;

            HWDATA_S1 = '0;
            HWDATA_S2 = '0;
            HWDATA_S3 = '0;
          end
        endcase
      end
      else if (HBUSREQ_M1_pre && !HWRITE_M1)
      begin
        HWRITE_S1 = '0;
        HWRITE_S2 = '0;
        HWRITE_S3 = '0;
        case ({HSEL1, HSEL2, HSEL3})
          3'b100: // read from SRAM
          begin
            HWRITE_S1 = HWRITE_M1;
            HWRITE_S2 = '0;
            HWRITE_S3 = '0;

            HRDATA_M1 = HRDATA_S1;
          end
          3'b010: // read from clock control ?
          begin
            HWRITE_S1 = '0;
            HWRITE_S2 = HWRITE_M1;
            HWRITE_S3 = '0;

            HRDATA_M1 = HRDATA_S2;
          end
          3'b001: // read from uart ?
          begin
            HWRITE_S1 = '0;
            HWRITE_S2 = HWRITE_M1;
            HWRITE_S3 = '0;

            HRDATA_M1 = HRDATA_S3;
          end
          default
          begin
            HWRITE_S1 = '0;
            HWRITE_S2 = '0;
            HWRITE_S3 = '0;

            HRDATA_M1 = '0;
          end
        endcase
      end
      else if(HBUSREQ_M2_pre && HWRITE_M2)
      begin
        HRDATA_M1 = '0;
        HRDATA_M2 = '0;
        case ({HSEL1, HSEL2, HSEL3})
          3'b100: // wirte to SRAM
          begin
            HWRITE_S1 = HWRITE_M2;
            HWRITE_S2 = '0;
            HWRITE_S3 = '0;

            HWDATA_S1 = HWDATA_M2;
            HWDATA_S2 = '0;
            HWDATA_S3 = '0;
          end
          3'b010: // write to clock control
          begin
            HWRITE_S1 = '0;
            HWRITE_S2 = HWRITE_M2;
            HWRITE_S3 = '0;

            HWDATA_S1 = '0;
            HWDATA_S2 = HWDATA_M2;
            HWDATA_S3 = '0;
          end
          3'b001: // write to uarts
          begin
            HWRITE_S1 = '0;
            HWRITE_S2 = '0;
            HWRITE_S3 = HWRITE_M2;

            HWDATA_S1 = '0;
            HWDATA_S2 = '0;
            HWDATA_S3 = HWDATA_M2;
          end
          default:
          begin
            HWRITE_S1 = '0;
            HWRITE_S2 = '0;
            HWRITE_S3 = '0;

            HWDATA_S1 = '0;
            HWDATA_S2 = '0;
            HWDATA_S3 = '0;
          end
        endcase
      end
      else if(HBUSREQ_M2_pre && !HWRITE_M2)
      begin
        HWRITE_S1 = '0;
        HWRITE_S2 = '0;
        HWRITE_S3 = '0;
        case ({HSEL1, HSEL2, HSEL3})
          3'b100: // read from SRAM
          begin
            HWRITE_S1 = HWRITE_M2;
            HWRITE_S2 = '0;
            HWRITE_S3 = '0;

            HRDATA_M2 = HRDATA_S1;
          end
          3'b010: // read from clock control ?
          begin
            HWRITE_S1 = '0;
            HWRITE_S2 = HWRITE_M2;
            HWRITE_S3 = '0;

            HRDATA_M2 = HRDATA_S2;
          end
          3'b001: // read from uart ?
          begin
            HWRITE_S1 = '0;
            HWRITE_S2 = HWRITE_M2;
            HWRITE_S3 = '0;

            HRDATA_M2 = HRDATA_S3;
          end
          default
          begin
            HWRITE_S1 = '0;
            HWRITE_S2 = '0;
            HWRITE_S3 = '0;

            HRDATA_M2 = '0;
          end
        endcase
      end
      else
      begin
        HRDATA_M1 = '0;
        HRDATA_M2 = '0;
        HWRITE_S1 = '0;
        HWRITE_S2 = '0;
        HWRITE_S3 = '0;
      end
    end

  end

endmodule
