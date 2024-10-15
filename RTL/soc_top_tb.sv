module soc_tb ();
  timeunit 1ns;
  timeprecision 10ps;

  logic clk, nRst;
  logic over, succ;
  logic TX;

  soc_top soc1 (
            .clk,
            .nRst,
            .over,
            .succ,
            .halted_ind(),
            .uart_debug_pin(),
            .uart_tx_pin(TX),
            .uart_rx_pin()
          );

  initial
  begin
    $readmemh("uart_tx.data", soc1.ram1.SRAM_data);
  end

  // clock generation
  initial
  begin
    clk = 0;
    forever
    begin
      #10 clk = ~clk;
    end
  end

  // reset generation
  initial
  begin
    nRst = 0;

    #40 nRst = 1;
  end

  parameter baud_rate_counter_9600 = 50000000/9600 - 1;
  parameter baud_rate_counter_115200 = 50000000/115200 - 1;

  localparam baud_rate = baud_rate_counter_9600;

  logic [7:0] RX_data;
  logic [4:0] data_count;
  logic [32:0] clk_div_count;

  enum {IDLE, RX_read, stop_state} RX_state;

  always_ff @(posedge clk or negedge nRst)
  begin
    if(!nRst)
    begin
      RX_state <= IDLE;
      data_count <= 0;
      clk_div_count <= 0;
      RX_data <= 0;
    end
    else
    begin
      case (RX_state)
        IDLE:
        begin
          if(!TX) // detect start bit
          begin
            data_count <= 0;
            clk_div_count <= 0;
            RX_state <= RX_read;
            RX_data <= 0;
          end
        end
        RX_read:
        begin
          if(data_count == 8)
          begin
            if(clk_div_count == baud_rate)
            begin
              RX_state <= stop_state;
              clk_div_count <= 0;
            end
            else
              clk_div_count <= clk_div_count + 1;
          end
          else
            if(clk_div_count == baud_rate)
            begin
              RX_data <= {TX, RX_data[7:1]};
              data_count <= data_count + 1;
              clk_div_count <= 0;
            end
            else
            begin
              clk_div_count <= clk_div_count + 1;
            end
        end
        stop_state:
        begin
          $display("%c",RX_data);
          RX_state <= IDLE;
        end
      endcase
    end
  end

endmodule
