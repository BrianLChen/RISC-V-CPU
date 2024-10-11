module RV_top_tb();
  timeunit 1ns;
  timeprecision 100ps;

  parameter clk_period = 42;

  logic clock, nRst, TX;

  RV_top top_level1(.clock, .nRst, .TX);

  initial
  begin
    #0 clock = 0;
    forever
    begin
      #(clk_period/2) clock = ~clock;
    end
  end

  initial
  begin
    #0 nRst = 0;
    #100 nRst = 1;
  end

endmodule
