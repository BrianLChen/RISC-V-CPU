module SRAM_tb();
  timeunit 1ns;
  timeprecision 100ps;

  logic HCLK;
  logic HRESETn;
  logic write_enable;
  logic [31:0] Address;
  logic [31:0] write_data;

  logic HREADYOUT;
  logic [31:0] read_data;

  SRAM SRAM0 (.HCLK, .HRESETn, .write_enable, .Address, .write_data, .HREADYOUT, .read_data);

  initial
  begin
    #0 HCLK = 0;
    forever
    begin
      #21 HCLK = ~HCLK;
    end
  end

  initial
  begin
    #0 HRESETn = 0;

    #10 HRESETn = 1;
  end

endmodule
