module soc_top
  #(
     parameter INSTR_RDATA_WIDTH = 32,
     parameter RAM_ADDR_WIDTH = 32,
     parameter BOOT_ADDR = 'h0,
     parameter PULP_XPULP = 0,
     parameter PULP_CLUSTER = 0,
     parameter FPU = 0,  // Floating Point Unit (interfaced via APU interface)
     parameter FPU_ADDMUL_LAT = 0,  // Floating-Point ADDition/MULtiplication computing lane pipeline registers number
     parameter FPU_OTHERS_LAT = 0,  // Floating-Point COMParison/CONVersion computing lanes pipeline registers number
     parameter ZFINX = 0,  // Float-in-General Purpose registers
     parameter NUM_MHPMCOUNTERS = 1,
     parameter DM_HALTADDRESS = 32'h1A110800
   ) (
     input logic clk, nRst,

     input  logic        fetch_enable_i,
     output logic        tests_passed_o,
     output logic        tests_failed_o,
     output logic [31:0] exit_value_o,
     output logic        exit_valid_o,

     output logic TX
   );
  timeunit 1ns;
  timeprecision 100ps;

  localparam ADDR_WIDTH = RAM_ADDR_WIDTH;
  // localparam BOOT_ADDR = 'h180;
  // localparam DM_HALTADDRESS = 32'h1A110800;

  // AHB bus signals
  logic [3:0] HBE_M1, HBE_M2; // Byte enable
  logic [ADDR_WIDTH-1:0] HADDR_M1, HADDR_M2;
  logic [31:0] HWDATA_M1, HWDATA_M2;
  logic [31:0] HRDATA_M1, HRDATA_M2;
  logic HBUSREQ_M1, HBUSREQ_M2;
  logic HWRITE_M1, HWRITE_M2;
  logic HGRANT_M1, HGRANT_M2;
  logic HREADY_M1, HREADY_M2;

  logic HSEL1, HSEL2, HSEL3;
  logic HREADY_S1, HREADY_S2, HREADY_S3;
  logic [ADDR_WIDTH-1:0] HADDR_S1, HADDR_S2, HADDR_S3;
  logic HWRITE_S1, HWRITE_S2, HWRITE_S3;
  logic [3:0] HBE_S1, HBE_S2, HBE_S3; // byte selection
  logic [31:0] HRDATA_S1, HRDATA_S2, HRDATA_S3;
  logic [31:0] HWDATA_S1, HWDATA_S2, HWDATA_S3;

  // APB signal
  logic PSEL1; // select UART
  logic PENABLE_S1;
  logic PREADY_S1;
  logic PWRITE_S1;
  logic [ADDR_WIDTH-1:0] PADDR_S1;
  logic [3:0] PBE_S1;

  logic [31:0] PWDATA_S1;
  logic [31:0] PRDATA_S1;

  // cv32e40p top special signal
  logic instr_rvalid_i, data_rvalid_i;
  logic debug_req_i;
  logic irq_ack;
  logic [4:0] irq_id_out;
  logic irq_software;
  logic irq_timer;
  logic irq_external;
  logic [15:0] irq_fast;

  logic core_sleep_o;

  // clock control signal
  logic control_clk_uart;

  // uart signal
  logic uart_clk;
  logic tx_interrupt;

  assign debug_req_i = 1'b0;
  assign HWRITE_M1 = 1'b0;

  // RV core
  cv32e40p_top #(
                 .COREV_PULP      (PULP_XPULP),
                 .COREV_CLUSTER   (PULP_CLUSTER),
                 .FPU             (FPU),
                 .FPU_ADDMUL_LAT  (FPU_ADDMUL_LAT),
                 .FPU_OTHERS_LAT  (FPU_OTHERS_LAT),
                 .ZFINX           (ZFINX),
                 .NUM_MHPMCOUNTERS(NUM_MHPMCOUNTERS)
               ) core_top (
                 .clk_i(clk), .rst_ni(nRst), .pulp_clock_en_i(1'b1), .scan_cg_en_i(1'b0),
                 .boot_addr_i(BOOT_ADDR), .mtvec_addr_i(32'h0), .dm_halt_addr_i(DM_HALTADDRESS), .hart_id_i(32'h0), .dm_exception_addr_i(32'h0),
                 .instr_req_o(HBUSREQ_M1), .instr_gnt_i(HGRANT_M1), .instr_rvalid_i(HREADY_M1), .instr_addr_o(HADDR_M1), .instr_rdata_i(HRDATA_M1),
                 .data_req_o(HBUSREQ_M2), .data_gnt_i(HGRANT_M2), .data_rvalid_i(HREADY_M2), .data_we_o(HWRITE_M2), .data_be_o(HBE_M2), .data_addr_o(HADDR_M2),
                 .data_wdata_o(HWDATA_M2), .data_rdata_i(HRDATA_M2),
                 .irq_i({tx_interrupt, 31'b0}),
                 .irq_ack_o(irq_ack), .irq_id_o(irq_id_out),
                 .debug_req_i, .debug_havereset_o(), .debug_running_o(), .debug_halted_o(),
                 .fetch_enable_i(fetch_enable_i), .core_sleep_o(core_sleep_o));

  // AHB
  ahb_bus #(.ADDR_WIDTH(ADDR_WIDTH)) ahb_bus1 (
            .HCLK(clk), .HRESETn(nRst),
            .HADDR_M1, .HADDR_M2, .HWDATA_M1, .HWDATA_M2, .HBE_M1(4'b1111), .HBE_M2, .HREADY_M1, .HREADY_M2 , .HRDATA_M1, .HRDATA_M2,
            .HBUSREQ_M1, .HBUSREQ_M2, .HWRITE_M1, .HWRITE_M2, .HGRANT_M1, .HGRANT_M2,
            .HSEL1, .HSEL2, .HSEL3, .HREADY_S1, .HREADY_S2, .HREADY_S3, .HBE_S1, .HBE_S2, .HBE_S3, .HADDR_S1, .HADDR_S2, .HADDR_S3,
            .HWRITE_S1, .HWRITE_S2, .HWRITE_S3, .HRDATA_S1, .HRDATA_S2, .HRDATA_S3,
            .HWDATA_S1, .HWDATA_S2, .HWDATA_S3
          );

  // SRAM
  SRAM #(.RAM_size(32'h400000), .ADDR_WIDTH(ADDR_WIDTH)) sram1 (
         .HCLK(clk), .HRESETn(nRst), .HSEL(HSEL1), .HBE(HBE_S1), .HREADY(HREADY_S1),
         .HWDATA(HWDATA_S1), .HADDR(HADDR_S1), .HWRITE(HWRITE_S1), .HRDATA(HRDATA_S1)
       );

  // Clock & reset control
  clk_control #(.ADDR_WIDTH(ADDR_WIDTH)) clk_control1 (
                .clock(clk), .nRst, .HSEL(HSEL2), .HBE(HBE_S2), .HREADY(HREADY_S2), .HADDR(HADDR_S2),
                .HWRITE(HWRITE_S2), .HRDATA(HRDATA_S2), .HWDATA(HWDATA_S2),
                .control_clk_uart
              );

  apb_bus #(.ADDR_WIDTH(ADDR_WIDTH)) apb (
            .PCLK(clk), .PRESETn(nRst), .HSEL(HSEL3), .HADDR(HADDR_S3), .HWRITE(HWRITE_S3), .HBE(HBE_S3), .HWDATA(HWDATA_S3), .HRDATA(HRDATA_S3),
            .HREADY(HREADY_S3),
            .PSEL1, .PENABLE_S1, .PREADY_S1, .PADDR_S1, .PWRITE_S1, .PBE_S1, .PWDATA_S1, .PRDATA_S1
          );

  // uart
  uart #(.sys_clk(50000000), .ADDR_WIDTH(ADDR_WIDTH)) uart1 (
         .clock(uart_clk), .nRst, .HSEL(PSEL1), .HBE(PBE_S1), .HREADY(PREADY_S1), .HADDR(PADDR_S1), .HWRITE(PWRITE_S1),
         .HRDATA(PRDATA_S1), .HWDATA(PWDATA_S1), .interrupt(tx_interrupt), .TX
       );

  always_comb
  begin
    if(control_clk_uart)
    begin
      uart_clk = clk;
    end
    else
    begin
      uart_clk = 0;
    end
  end
endmodule
