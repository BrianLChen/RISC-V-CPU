/////////////////////////////////////////////////////////////////////
// Design unit: UART
//            :
// File name  : uart.sv
//            :
// Description: UART module with TX and TX interrupt
//            :
// Limitations:
//            :
// System     : SystemVerilog IEEE 1800-2005
//            :
// Author     : Letian(Brian) Chen
//
// Revision   : Version 0.0 10/2024
/////////////////////////////////////////////////////////////////////
module uart #(parameter sys_clk = 50000000)
  (
    input logic clock, nRst,

    input logic [31:0] data,
    input logic send_req,

    output logic interrupt,

    // to outside
    output logic TX
  );
  // calculate counter value for clock divider
  parameter int baud_rate_counter_9600 = sys_clk/9600 - 1;
  parameter int baud_rate_counter_115200 = sys_clk/115200 - 1;

  //   logic send_req;
  logic [31:0] freq_div_counter;
  logic [2:0] data_counter;

  logic [2:0] baud_rate; // 0:9600, 1:115200
  logic [2:0] parity; // 0: no parity
  logic [7:0] tx_cache;

  enum {IDLE, start, send, stop} state;

  //TODO
  assign tx_cache = data[7:0];

  // state machine for TX
  always_ff @(posedge clock or negedge nRst)
  begin
    if(!nRst)
    begin
      state <= IDLE;
      freq_div_counter <= 0;
      data_counter <= 0;
    end
    else
    begin
      case (state)
        IDLE: // wait send req nop
        begin
          if(send_req)
          begin
            state <= start;
            freq_div_counter <= 0;
          end
        end
        start: // send start bit
        begin
          if(freq_div_counter == baud_rate_counter_9600)
          begin
            freq_div_counter <= 0;
            data_counter <= 0;
            state <= send;
          end
          else
          begin
            state <= start;
            freq_div_counter <= freq_div_counter + 1;

          end
        end
        send: // send data bits
        begin
          if(freq_div_counter == baud_rate_counter_9600)
          begin
            if(data_counter == 7) // all bits has been send
            begin
              data_counter <= 0;
              freq_div_counter <= 0;
              state <= stop;
            end
            else
            begin
              state <= send;
              data_counter <= data_counter + 1;
              freq_div_counter <= 0;
            end
          end
          else
          begin
            freq_div_counter <= freq_div_counter + 1;
            state <= send;
          end
        end
        stop: // send stop bits
        begin
          if(freq_div_counter == baud_rate_counter_9600)
          begin
            state <= IDLE;
            freq_div_counter <= 0;
          end
          else
          begin
            state <= stop;
            freq_div_counter <= freq_div_counter + 1;
          end
        end
      endcase
    end
  end

  always_comb
  begin
    case (state)
      IDLE:
      begin
        TX = 1;
      end
      start:
      begin
        TX = 0;
      end
      send:
      begin
        TX = tx_cache[data_counter];
      end
      stop:
      begin
        TX = 1;
      end
      default:
      begin
        TX = 1;
      end
    endcase
  end
endmodule
