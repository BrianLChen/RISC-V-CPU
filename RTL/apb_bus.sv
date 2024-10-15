module apb_bus (
    input logic PCLK,
    input logic PRESETn,

    input logic HSEL, // selection from AHB
    input logic [31:0] HADDR,
    input logic HWRITE,
    input logic [31:0] HWDATA,
    output logic [31:0] HRDATA,

    // input logic HREADY,
    // output logic HREADYOUT,

    output logic PSEL1, // select UART
    // input logic PREADY,
    output logic PWRITE,
    output logic [31:0] PADDR,

    output logic [31:0] PWDATA,
    input logic [31:0] PRDATA
  );

  parameter [19:0] uart_addr = 20'h4000d;

  logic [31:0] PDATA;

  always_ff @(posedge PCLK or negedge PRESETn)
  begin
    if(!PRESETn)
    begin
      PSEL1 <= 0;
      PWRITE <= 'z;
      PWDATA <= 'z;
    end
    else
    begin
      begin
        if(HSEL)
        begin
          PADDR <= HADDR;
        end
        else
        begin
          // HREADYOUT <= 1;
          PADDR <= 'z;
        end
      end
    end
  end

  always_comb
  begin
    PWRITE = HWRITE;
    if(PADDR >= 32'h4000d000)
    begin // uart
      PSEL1 = 1;
      PWDATA = HWDATA;
      HRDATA = PRDATA;
    end
    else
    begin // no peripheral selected
      PSEL1 = 0;
    end
  end

  // -------------------------------------------------------
  // read by RIB bus
  always_comb
  begin
    if(HSEL)
    begin
      case (HADDR[31:12])
        uart_addr:
        begin
          PSEL1 = 0;
          HRDATA = PRDATA;
        end
      endcase
    end
  end
endmodule
