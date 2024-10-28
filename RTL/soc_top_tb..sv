// Copyright 2017 Embecosm Limited <www.embecosm.com>
// Copyright 2018 Robert Balas <balasr@student.ethz.ch>
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

// Top level wrapper for a RI5CY testbench
// Contributor: Robert Balas <balasr@student.ethz.ch>
//              Jeremy Bennett <jeremy.bennett@embecosm.com>

module tb_top #(
  parameter INSTR_RDATA_WIDTH = 32,
  parameter RAM_ADDR_WIDTH = 32,
  parameter BOOT_ADDR = 'h180,
  parameter PULP_XPULP = 0,
  parameter PULP_CLUSTER = 0,
  parameter FPU = 0,
  parameter ZFINX = 0,
  parameter NUM_MHPMCOUNTERS = 1,
  parameter DM_HALTADDRESS = 32'h1A110800
);
timeunit 1ns;
timeprecision 100ps;
// comment to record execution trace
//`define TRACE_EXECUTION

const time          CLK_PHASE_HI = 5ns;
const time          CLK_PHASE_LO = 5ns;
const time          CLK_PERIOD = CLK_PHASE_HI + CLK_PHASE_LO;

const time          STIM_APPLICATION_DEL = CLK_PERIOD * 0.1;
const time          RESP_ACQUISITION_DEL = CLK_PERIOD * 0.9;
const time          RESET_DEL = STIM_APPLICATION_DEL;
const int           RESET_WAIT_CYCLES = 4;

// clock and reset for tb
logic               clk = 'b1;
logic               rst_n = 'b0;

// cycle counter
int unsigned        cycle_cnt_q;

// testbench result
logic               tests_passed;
logic               tests_failed;
logic               exit_valid;
logic        [31:0] exit_value;

// signals for ri5cy
logic               fetch_enable;

logic TX;

// make the core start fetching instruction immediately
assign fetch_enable = '1;

// clock generation
initial begin : clock_gen
  forever begin
    #CLK_PHASE_HI clk = 1'b0;
    #CLK_PHASE_LO clk = 1'b1;
  end
end : clock_gen

// reset generation
initial begin : reset_gen
  rst_n = 1'b0;

  // wait a few cycles
  repeat (RESET_WAIT_CYCLES) begin
    @(posedge clk);
  end

  // start running
  #RESET_DEL rst_n = 1'b1;
  if ($test$plusargs("verbose")) $display("reset deasserted", $time);

end : reset_gen

// set timing format
initial begin : timing_format
  $timeformat(-9, 0, "ns", 9);
end : timing_format

// abort after n cycles, if we want to
always_ff @(posedge clk, negedge rst_n) begin
  automatic int maxcycles;
  if ($value$plusargs("maxcycles=%d", maxcycles)) begin
    if (~rst_n) begin
      cycle_cnt_q <= 0;
    end else begin
      cycle_cnt_q <= cycle_cnt_q + 1;
      if (cycle_cnt_q >= maxcycles) begin
        $fatal(2, "Simulation aborted due to maximum cycle limit");
      end
    end
  end
end

// check if we succeded
always_ff @(posedge clk, negedge rst_n) begin
  if (tests_passed) begin
    $display("ALL TESTS PASSED");
    $finish;
  end
  if (tests_failed) begin
    $display("TEST(S) FAILED!");
    $finish;
  end
  if (exit_valid) begin
    if (exit_value == 0) $display("EXIT SUCCESS");
    else $display("EXIT FAILURE: %d", exit_value);
    $finish;
  end
end

// wrapper for riscv, the memory system and stdout peripheral
soc_top #(      
.INSTR_RDATA_WIDTH(INSTR_RDATA_WIDTH),
.RAM_ADDR_WIDTH   (RAM_ADDR_WIDTH),
.BOOT_ADDR        (BOOT_ADDR),
.PULP_XPULP       (PULP_XPULP),
.PULP_CLUSTER     (PULP_CLUSTER),
.FPU              (FPU),
.ZFINX            (ZFINX),
.NUM_MHPMCOUNTERS (NUM_MHPMCOUNTERS),
.DM_HALTADDRESS   (DM_HALTADDRESS)
) wrapper_i (
    .clk         (clk),
    .nRst        (rst_n),
    .fetch_enable_i(fetch_enable),
    .tests_passed_o(tests_passed),
    .tests_failed_o(tests_failed),
    .exit_valid_o  (exit_valid),
    .exit_value_o  (exit_value),

    .TX
);


// RX Display
parameter baud_rate_counter_9600 = 50000000/9600 - 1;
parameter baud_rate_counter_115200 = 50000000/115200 - 1;

localparam baud_rate = baud_rate_counter_9600;

logic [7:0] RX_data;
logic [4:0] data_count;
logic [32:0] clk_div_count;

enum {IDLE, RX_read, stop_state} RX_state;

always_ff @(posedge clk or negedge rst_n)
begin
  if(!rst_n)
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

endmodule  // tb_top