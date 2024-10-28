module clk_control #(parameter ADDR_WIDTH=32)(
    input logic clock, nRst,

    input logic HSEL,
    input logic [3:0] HBE,
    output logic HREADY,

    input logic [31:0] HADDR,
    input logic HWRITE,

    output logic [31:0] HRDATA,
    input logic [31:0] HWDATA,
    output logic control_clk_uart
  );

  logic [31:0] cfg_register;
  logic [ADDR_WIDTH-1:0] addr_int;


  assign control_clk_uart = cfg_register[0];

  always_ff @(posedge clock or negedge nRst)
  begin
    if(!nRst)
    begin
      cfg_register <= 0;
    end
    else
    begin
      if(HSEL) // if Master select
      begin
        if(HWRITE)
        begin
          if (HBE[0])
            cfg_register[7:0] <= HWDATA[0+:8];
          if (HBE[1])
            cfg_register[15:8] <= HWDATA[8+:8];
          if (HBE[2])
            cfg_register[23:16] <= HWDATA[16+:8];
          if (HBE[3])
            cfg_register[31:24] <= HWDATA[24+:8];

          HRDATA <= cfg_register[addr_int];
          HREADY <= 1;
        end
        else
        begin
          HRDATA <= cfg_register[addr_int];
          HREADY <= 1;
        end
      end
      else
      begin
        HREADY <= 0;
      end
    end
  end

endmodule
