module uart_tb ();
  timeunit 1ns;
  timeprecision 100ps;

  logic clock, nRst;
  logic [31:0] data;
  logic send_req;
  logic interrupt;
  logic TX;

  uart uart1 (.clock, .nRst, .data, .send_req, .interrupt, .TX);

  initial
  begin
    clock = 0;
    forever
    begin
      #21 clock = ~clock;
    end
  end

  initial
  begin
    #0  nRst = 0;
    data = 0;
    send_req = 0;
    #5 nRst = 1;

    #300000

    #42 data = 8'ha;
    send_req = 1;
    
    #42 send_req = 0;
  end

endmodule
