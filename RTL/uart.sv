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

    // Bus
    input logic HSEL, // slave select
    input logic HWRITE,
    input logic [31:0] HWDATA,
    // input logic send_req,

    input logic [31:0] HADDR,
    output logic [31:0] HRDATA,
    output logic interrupt,

    // to outside
    output logic TX
  );
  // calculate counter value for clock divider
  parameter int baud_rate_counter_9600 = sys_clk/9600 - 1;
  parameter int baud_rate_counter_115200 = sys_clk/115200 - 1;

  parameter uart_cfg_offset = 8'h00;
  parameter uart_tx_data_offset = 8'h04;
  parameter uart_inst_offset = 8'h08;
  parameter uart_status_offset = 8'h0c;

  logic send_req;
  logic [31:0] freq_div_counter;
  logic [2:0] data_counter;

  logic [31:0] baud_rate_conter_value; // 0:9600, 1:115200
  logic [2:0] parity; // 0: no parity
  logic [7:0] uart_tx_cache; // 31 8-bit tx_cache


  //registers
  logic [31:0] uart_cfg_reg; // config register 0x00
  // 0:uart enable, 1: 0-9600 1-115200, 2:interrupt enable

  logic [31:0] uart_tx_data_reg; // data register 0x04
  // 7:0 data
  logic [31:0] uart_inst_reg; // instruction register 0x08
  // 0: uart start, 1: clear interrupt
  logic [31:0] uart_status_reg;
  // bit[0]: tx busy

  enum {uart_IDLE, uart_trig, uart_exe, interrupt_write} uart_state;

  enum {transfer_IDLE, start, send, stop} transfer_state;

  //TODO
  // assign tx_cache[0] = data_in[7:0];

  // state machine for UART module
  always_ff @(posedge clock or negedge nRst)
  begin
    if(!nRst)
    begin
      uart_state <= uart_IDLE;
      interrupt <= 0;
    end
    else
    begin
      case (uart_state)
        uart_IDLE:
        begin
          if(HSEL && HWRITE)
          begin
            case ({20'b0, HADDR[11:0]})
              uart_cfg_offset: // write cfg register
              begin
                uart_state <= uart_IDLE;
                uart_cfg_reg <= HWDATA[30:0];
              end
              uart_tx_data_offset: // write tx data
              begin
                uart_state <= uart_IDLE;
                uart_tx_data_reg <= {24'b0, HWDATA[7:0]};
              end
              uart_inst_offset: // uart instruction
              begin
                if(HWDATA[0])
                begin
                  if(uart_cfg_reg[0]) // if uart enable
                  begin
                  uart_state <= uart_trig;
                  uart_tx_cache <= uart_tx_data_reg[7:0];
                  send_req <= 1;
                  end
                end
                if(HWDATA[1])
                begin
                  interrupt <= 0;
                end
              end
              uart_status_offset: // read only no operation
              begin
              end
              default:
              begin
                uart_state <= uart_IDLE;
                send_req <= 0;
              end
            endcase
          end
          else
          begin
            uart_state <= uart_IDLE;
          end
        end
        uart_trig:
        begin
          if(transfer_state == start)
          begin
            send_req <= 0;
            uart_state <= uart_exe;
          end
        end
        uart_exe:
        begin
          // TODO  wsit exe finish and return to interrupt or idle depends on cfg
          if(transfer_state == transfer_IDLE) // if uart finish send 8 bits of data
          begin
            if(uart_cfg_reg[2])
              uart_state <= interrupt_write;
            else
              uart_state <= uart_IDLE;
          end
          else
          begin
            uart_state <= uart_exe;
          end
        end
        interrupt_write:
        begin
          interrupt <= 1;
          uart_state <= uart_IDLE;
        end

      endcase
    end
  end

  always_comb
  begin
    if(uart_cfg_reg[1])
      baud_rate_conter_value = baud_rate_counter_115200;
    else
      baud_rate_conter_value = baud_rate_counter_9600;
  end

  // -------------------------------------------------------
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
          if(freq_div_counter == baud_rate_conter_value)
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
          if(freq_div_counter == baud_rate_conter_value)
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
          if(freq_div_counter == baud_rate_conter_value)
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
        TX = uart_tx_cache[data_counter];
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

  // read register
  always_comb
  begin
    if(!nRst)
    begin
      HRDATA = '0;
    end
    else
    begin
      case (HADDR[7:0])
        uart_cfg_offset:
        begin
          HRDATA = uart_cfg_reg;
        end
        uart_tx_data_offset:
        begin
          HRDATA = uart_tx_data_reg;
        end
        uart_inst_offset:
        begin
          // HRDATA = uart_inst_offset;
          HRDATA = '0; // instruction should not be write
        end
        uart_status_offset:
        begin
          HRDATA = uart_status_reg;
        end
      endcase
    end
  end

  always_comb
  begin
    if(uart_state == uart_IDLE)
    begin
      uart_status_reg = {31'b0, 1'b0};
    end
    else
    begin
      uart_status_reg = {31'b0, 1'b1};
    end
  end
endmodule
