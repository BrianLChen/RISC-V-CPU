module clk_control (
    input logic clock, nRst,

    input logic HSEL,
    input logic [31:0] HADDR,

    input logic HWRITE,
    input logic [31:0] HWDATA,

    output logic [31:0] HRDATA,

    output logic control_clk_uart
  );

  logic [31:0] cfg_register;
  logic [31:0] addr_int;

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
          cfg_register <= HWDATA;
        end
        else
        begin
        end
      end
      else
      begin
      end
    end
  end

  always_comb
  begin
    
  end

endmodule
