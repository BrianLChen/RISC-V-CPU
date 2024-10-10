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

    // AHB
    input logic HSEL2, // slave select
    input logic [31:0] data_in,
    // input logic send_req,

    output logic HBUSREQ2, // UART request bus to write interrupt reg
    output logic [31:0] HADDR,
    output logic [31:0] data_out,
    output logic interrupt,

    // to outside
    output logic TX
  );
  // calculate counter value for clock divider
  parameter int baud_rate_counter_9600 = sys_clk/9600 - 1;
  parameter int baud_rate_counter_115200 = sys_clk/115200 - 1;

  logic send_req;
  logic [31:0] freq_div_counter;
  logic [2:0] data_counter;

  logic [2:0] baud_rate; // 0:9600, 1:115200
  logic [2:0] parity; // 0: no parity
  logic [7:0] tx_cache[31:0]; // 31 8-bit tx_cache

  logic [31:0] uart_cfg_reg;

  enum {uart_IDLE, para_setting, msg_caching, uart_exe, interrupt_write} uart_state;

  enum {transfer_IDLE, start, send, stop} transfer_state;

  //TODO
  // assign tx_cache[0] = data_in[7:0];

  // state machine for UART module
  always_ff @(posedge clock or negedge nRst)
  begin
    if(!nRst)
    begin
      uart_state <= uart_IDLE;
    end
    else
    begin
      case (uart_state)
        uart_IDLE:
        begin
          if(HSEL2)
          begin
            if(data_in == 1) // para_setting
            begin
              uart_state <= uart_IDLE;
              uart_cfg_reg <= data_in[30:0];
            end
            else if(data_in == 2) // msg_caching
            begin
              uart_state <= uart_IDLE;
              tx_cache[0] <= data_in[7:0];
            end
            else if(data_in == 3) // TX send execute
            begin
              uart_state <= uart_exe;
              send_req <= 1;
            end
            else
            begin
              uart_state <= uart_IDLE;
            end
          end
          else
          begin
            uart_state <= uart_IDLE;
          end
        end
        uart_exe:
        begin
          // TODO  wsit exe finish and return to interrupt or idle depends on cfg
        end
        interrupt_write:
        begin
          
        end

      endcase
    end
  end

  // transfer_state machine for TX
  always_ff @(posedge clock or negedge nRst)
  begin
    if(!nRst)
    begin
      transfer_state <= transfer_IDLE;
      freq_div_counter <= 0;
      data_counter <= 0;
    end
    else
    begin
      case (transfer_state)
        transfer_IDLE: // wait send req nop
        begin
          if(send_req)
          begin
            transfer_state <= start;
            freq_div_counter <= 0;
          end
        end
        start: // send start bit
        begin
          if(freq_div_counter == baud_rate_counter_9600)
          begin
            freq_div_counter <= 0;
            data_counter <= 0;
            transfer_state <= send;
          end
          else
          begin
            transfer_state <= start;
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
              transfer_state <= stop;
            end
            else
            begin
              transfer_state <= send;
              data_counter <= data_counter + 1;
              freq_div_counter <= 0;
            end
          end
          else
          begin
            freq_div_counter <= freq_div_counter + 1;
            transfer_state <= send;
          end
        end
        stop: // send stop bits
        begin
          if(freq_div_counter == baud_rate_counter_9600)
          begin
            transfer_state <= transfer_IDLE;
            freq_div_counter <= 0;
          end
          else
          begin
            transfer_state <= stop;
            freq_div_counter <= freq_div_counter + 1;
          end
        end
      endcase
    end
  end

  always_comb
  begin
    case (transfer_state)
      transfer_IDLE:
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
