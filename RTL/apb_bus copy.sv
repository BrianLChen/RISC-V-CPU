module apb_bus #(ADDR_WIDTH=32)(
    input logic PCLK,
    input logic PRESETn,

    input logic HSEL, // selection from AHB
    input logic [ADDR_WIDTH-1:0] HADDR,
    input logic HWRITE,
    input logic [3:0] HBE,
    input logic [31:0] HWDATA,
    output logic [31:0] HRDATA,

    output logic HREADY,

    output logic PSEL1, // select UART
    output logic PENABLE_S1,
    input logic PREADY_S1,
    output logic [ADDR_WIDTH-1:0] PADDR_S1,
    output logic PWRITE_S1,
    output logic [3:0] PBE_S1,

    output logic [31:0] PWDATA_S1,
    input logic [31:0] PRDATA_S1
  );

  enum {IDLE, SETUP, ENABLE} apb_state;

  logic PREADY;
  logic [31:0] PDATA;
  logic [ADDR_WIDTH-1:0] PADDR;
  logic PENABLE;
  logic PWRITE;
  logic [3:0] PBE;
  logic [31:0] PWDATA;
  logic [31:0] PRDATA;

  always_ff @(posedge PCLK or negedge PRESETn)
  begin
    if(!PRESETn)
    begin
      apb_state <= IDLE;
      PADDR <= '0;
      PWRITE <= 0;
      PBE <= 0;
      PWDATA <= 0;
    end
    else
    begin
      case (apb_state)
        IDLE:
        begin
          if(HSEL)
          begin
            apb_state <= SETUP;

            PADDR <= HADDR;
            PWRITE <= HWRITE;
            PBE <= HBE;
            PWDATA <= HWDATA;
          end
        end
        SETUP:
        begin
          if(HSEL)
          begin
            PADDR <= HADDR;
            PWRITE <= HWRITE;
            PBE <= HBE;
            PWDATA <= HWDATA;
          end
          else
          begin
            PADDR <= 0;
            PWRITE <= 0;
            PBE <= 0;
            PWDATA <= 0;

            apb_state <= IDLE;
          end
        end
      endcase
    end
  end

  // slave select
  always_comb
  begin
    if(PADDR >= 32'h4000d000)
    begin
      PSEL1 = 1;
    end
    else
      PSEL1 = 0;
  end

  // signal bus
  always_comb
  begin
    PADDR_S1 = 0;
    PWDATA_S1 = 0;
    PWRITE_S1 = 0;
    case (apb_state)
      SETUP:
      begin
        if(PSEL1)
        begin
          PADDR_S1 = PADDR;
          PWDATA_S1 = PWDATA;
          PWRITE_S1 = PWRITE;
          HREADY = PREADY_S1;
        end
      end
      default:
      begin
      HREADY = 0;
      end
    endcase
  end

  always_comb
  begin
    if(apb_state == ENABLE)
      PENABLE = 1;
    else
      PENABLE = 0;
  end

endmodule
