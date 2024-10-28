module ahb_bus #(ADDR_WIDTH=32)(
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
    output logic HREADY_M1, HREADY_M2,
    // output logic [3:0] HMASTER, // Master Number
    // output logic HMASTOCK, // current master performing Locked Transfer

    // 2 slave
    // HSEL1=SRAM, HSEL2=CLK CONTROL, HSEL3=uart
    output logic HSEL1, HSEL2, HSEL3, HSEL4,
    input logic HREADY_S1, HREADY_S2, HREADY_S3,
    output logic [3:0] HBE_S1, HBE_S2, HBE_S3, HBE_S4, // byte selection
    output logic [ADDR_WIDTH-1:0] HADDR_S1, HADDR_S2, HADDR_S3, HADDR_S4,

    output logic HWRITE_S1, HWRITE_S2, HWRITE_S3, HWRITE_S4, // write control to slave
    input logic [31:0] HRDATA_S1, HRDATA_S2, HRDATA_S3, HRDATA_S4, // master <- slave
    output logic [31:0] HWDATA_S1, HWDATA_S2, HWDATA_S3, HWDATA_S4 // master -> slave
  );
  timeunit 1ns;
  timeprecision 100ps;

  enum {IDLE, transfer} ahb_state;

  logic HWRITE; // write control
  logic [3:0] HBE;
  logic [ADDR_WIDTH-1:0] HADDR;
  logic [31:0] HDATA;

  logic [7:0] slave_num, master_num;

  logic HGRANT_M1_pre, HGRANT_M2_pre;
  logic HSEL1_pre, HSEL2_pre, HSEL3_pre;

  always_ff @(posedge HCLK or negedge HRESETn)
  begin
    if(!HRESETn)
    begin
      ahb_state <= IDLE;
      slave_num <= '0;
      master_num <= '0;
    end
    else
    begin
      case (ahb_state)
        IDLE:
        begin
          if(HGRANT_M1)
          begin
            master_num <= 1;
            ahb_state <= transfer;
            case ({HSEL1, HSEL2, HSEL3})
              3'b100:
              begin
                slave_num <= 1;
              end
              3'b010:
              begin
                slave_num <= 2;
              end
              3'b001:
                slave_num <= 3;
            endcase
          end
          else if(HGRANT_M2)
          begin
            master_num <= 2;
            ahb_state <= transfer;
            case ({HSEL1, HSEL2, HSEL3})
              3'b100:
              begin
                slave_num <= 1;
              end
              3'b010:
              begin
                slave_num <= 2;
              end
              3'b001:
                slave_num <= 3;
            endcase
          end
        end
        transfer:
        begin
          if (HREADY_M1 || HREADY_M2)
          begin
            if(HGRANT_M1) // if master 1 req
            begin
              master_num <= 1;
              ahb_state <= transfer;
              case ({HSEL1, HSEL2, HSEL3})
                3'b100:
                begin
                  slave_num <= 1;
                end
                3'b010:
                begin
                  slave_num <= 2;
                end
                3'b001:
                  slave_num <= 3;
              endcase
            end
            else if(HGRANT_M2) // if master 2 req
            begin
              master_num <= 2;
              ahb_state <= transfer;
              case ({HSEL1, HSEL2, HSEL3})
                3'b100:
                begin
                  slave_num <= 1;
                end
                3'b010:
                begin
                  slave_num <= 2;
                end
                3'b001:
                  slave_num <= 3;
              endcase
            end
            else
            begin
              master_num <= 0;
              slave_num <= 0;
              ahb_state <= IDLE;
            end
          end
        end
        default:
        begin
        end
      endcase
    end
  end

  // store if any device uing the bus
  always_ff @(posedge HCLK or negedge HRESETn)
  begin
    if(!HRESETn)
    begin
      HGRANT_M1_pre <= 0;
      HGRANT_M2_pre <= 0;
      HSEL1_pre <= 0;
      HSEL2_pre <= 0;
      HSEL3_pre <= 0;
    end
    else
    begin
      HGRANT_M1_pre <= HGRANT_M1;
      HGRANT_M2_pre <= HGRANT_M2;
      HSEL1_pre <= HSEL1;
      HSEL2_pre <= HSEL2;
      HSEL3_pre <= HSEL3;
    end
  end

  // arbiter to the two master
  // M2 data interface has higher priority
  always_comb
  begin
    if(ahb_state == IDLE)
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
          HGRANT_M1 = 0;
          HGRANT_M2 = 1;
        end
      endcase
    end
    else if(HREADY_M1 | HREADY_M2)
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
          HGRANT_M1 = 0;
          HGRANT_M2 = 1;
        end
      endcase
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

  // slave select
  always_comb
  begin
    HSEL1 = 0;
    HSEL2 = 0;
    HSEL3 = 0;
    if(HGRANT_M1 || HGRANT_M2)
    begin
      if(HADDR >= 0 && HADDR < 32'h40002000 )
      begin // SRAM
        HSEL1 = '1;
      end
      else if(HADDR >= 32'h40002000 && HADDR < 32'h4000d000)
      begin // clock control
        HSEL2 = 1;
      end
      else if(HADDR >= 32'h4000d000)
      begin // uart -- through APB Bridge
        HSEL3 = 1;
      end
      else
      begin // no slave selected
        HSEL1 = 0;
        HSEL2 = 0;
        HSEL3 = 0;
      end
    end
  end

  // Address stage MUX
  always_comb
  begin
    begin
      HADDR_S1 = '0;
      HADDR_S2 = '0;
      HADDR_S3 = '0;

      HBE_S1 = '0;
      HBE_S2 = '0;
      HBE_S3 = '0;

      HWRITE_S1 = '0;
      HWRITE_S2 = '0;
      HWRITE_S3 = '0;

      HWDATA_S1 = '0;
      HWDATA_S2 = '0;
      HWDATA_S3 = '0;

      if(HGRANT_M1) // M1 write
      begin
        case ({HSEL1, HSEL2, HSEL3})
          3'b100: // wirte to SRAM
          begin
            HADDR_S1 = HADDR_M1; // Address
            HWRITE_S1 = HWRITE_M1; // Write enable
            HBE_S1 = HBE_M1; // Byte Select

            HWDATA_S1 = HWDATA_M1; // Write data
          end
          3'b010: // write to clock control
          begin
            HADDR_S2 = HADDR_M1; // Address
            HWRITE_S2 = HWRITE_M1; // Write enable
            HBE_S2 = HBE_M1; // Byte Select

            HWDATA_S2 = HWDATA_M1; // Write data
          end
          3'b101: // write to uarts
          begin
            HADDR_S3 = HADDR_M1; // Address
            HWRITE_S3 = HWRITE_M1; // Write enable
            HBE_S3 = HBE_M1; // Byte Select

            HWDATA_S3 = HWDATA_M1; // Write data
          end
          default:
          begin
            HADDR_S1 = '0;
            HADDR_S2 = '0;
            HADDR_S3 = '0;

            HBE_S1 = '0;
            HBE_S2 = '0;
            HBE_S3 = '0;

            HWRITE_S1 = '0;
            HWRITE_S2 = '0;
            HWRITE_S3 = '0;

            HWDATA_S1 = '0;
            HWDATA_S2 = '0;
            HWDATA_S3 = '0;
          end
        endcase
      end
      else if(HGRANT_M2)
      begin
        case ({HSEL1, HSEL2, HSEL3})
          3'b100: // wirte to SRAM
          begin
            HADDR_S1 = HADDR_M2; // Address
            HWRITE_S1 = HWRITE_M2; // Write enable
            HBE_S1 = HBE_M2; // Byte Select

            HWDATA_S1 = HWDATA_M2; // Write data
          end
          3'b010: // write to clock control
          begin
            HADDR_S2 = HADDR_M2; // Address
            HWRITE_S2 = HWRITE_M2; // Write enable
            HBE_S2 = HBE_M2; // Byte Select

            HWDATA_S2 = HWDATA_M2; // Write data
          end
          3'b001: // write to uarts
          begin
            HADDR_S3 = HADDR_M2; // Address
            HWRITE_S3 = HWRITE_M2; // Write enable
            HBE_S3 = HBE_M2; // Byte Select

            HWDATA_S3 = HWDATA_M2; // Write data
          end
          default:
          begin
            HADDR_S1 = '0;
            HADDR_S2 = '0;
            HADDR_S3 = '0;

            HBE_S1 = '0;
            HBE_S2 = '0;
            HBE_S3 = '0;

            HWRITE_S1 = '0;
            HWRITE_S2 = '0;
            HWRITE_S3 = '0;

            HWDATA_S1 = '0;
            HWDATA_S2 = '0;
            HWDATA_S3 = '0;
          end
        endcase
      end
      else
      begin
        HADDR_S1 = '0;
        HADDR_S2 = '0;
        HADDR_S3 = '0;

        HBE_S1 = '0;
        HBE_S2 = '0;
        HBE_S3 = '0;

        HWRITE_S1 = '0;
        HWRITE_S2 = '0;
        HWRITE_S3 = '0;

        HWDATA_S1 = '0;
        HWDATA_S2 = '0;
        HWDATA_S3 = '0;
      end
    end
  end

  // Data Stage MUX
  always_comb
  begin
    begin
      HREADY_M1 = '0;
      HREADY_M2 = '0;

      HRDATA_M1 = '0;
      HRDATA_M2 = '0;

      if(master_num == 1) // M1 write
      begin
        case (slave_num)
          1: // wirte to SRAM
          begin
            HREADY_M1 = HREADY_S1; // Data HREADY
            HRDATA_M1 = HRDATA_S1; // Read data
          end
          2: // write to clock control
          begin
            HREADY_M1 = HREADY_S2; // Data HREADY
            HRDATA_M1 = HRDATA_S2; // Read data
          end
          3: // write to uarts
          begin
            HREADY_M1 = HREADY_S3; // Data HREADY
            HRDATA_M1 = HRDATA_S3; // Read data
          end
          default:
          begin
            HREADY_M1 = '0;
            HREADY_M2 = '0;

            HRDATA_M1 = '0;
            HRDATA_M2 = '0;
          end
        endcase
      end
      else if(master_num == 2)
      begin
        case (slave_num)
          1: // wirte to SRAM
          begin
            HREADY_M2 = HREADY_S1; // Data HREADY
            HRDATA_M2 = HRDATA_S1; // Read data
          end
          2: // write to clock control
          begin
            HREADY_M2 = HREADY_S2; // Data HREADY
            HRDATA_M2 = HRDATA_S2; // Read data
          end
          3: // write to uarts
          begin
            HREADY_M2 = HREADY_S3; // Data HREADY
            HRDATA_M2 = HRDATA_S3; // Read data
          end
          default:
          begin
            HRDATA_M1 = '0;
            HRDATA_M2 = '0;

            HREADY_M1 = '0;
            HREADY_M2 = '0;
          end
        endcase
      end
      else
      begin
        HRDATA_M1 = '0;
        HRDATA_M2 = '0;

        HREADY_M1 = '0;
        HREADY_M2 = '0;

        HRDATA_M1 = '0;
        HRDATA_M2 = '0;
      end
    end
  end


endmodule
