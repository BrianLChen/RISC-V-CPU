`include "defines.v"
module soc_top (
    input wire clk,
    input wire nRst,

    output logic over,         // 测试是否完成信号
    output logic succ,         // 测试是否成功信号

    output wire halted_ind,  // jtag是否已经halt住CPU信号

    input wire uart_debug_pin, // 串口下载使能引脚

    output wire uart_tx_pin, // UART发送引脚
    input wire uart_rx_pin  // UART接收引脚
  );

  // Mater 0 cpu
  wire[`MemAddrBus] m0_addr;
  wire[`MemBus] m0_hwdata;
  wire[`MemBus] m0_hrdata;
  wire m0_req;
  wire m0_gnt;
  wire m0_we;

  // Mater 1 cpu instruction
  wire[`MemAddrBus] m1_addr;
  wire[`MemBus] m1_hwdata;
  wire[`MemBus] m1_hrdata;
  wire m1_req;
  wire m1_gnt;
  wire m1_we;

  // Slave 0 SRAM
  wire s0_hsel;
  wire [`MemAddrBus] s0_addr;
  wire [`MemBus] s0_hwdata;
  wire [`MemBus] s0_hrdata;
  wire s0_we;
  wire [`INT_BUS] int_flag;

  // Slave 1 clock reset control
  wire s1_hsel;
  wire [`MemAddrBus] s1_addr;
  wire [`MemBus] s1_hwdata;
  wire [`MemBus] s1_hrdata;
  wire s1_we;

  // Slave 2 APB - uart
  wire s2_hsel;
  wire [`MemAddrBus] s2_addr;
  wire [`MemBus] s2_hwdata;
  wire [`MemBus] s2_hrdata;
  wire s2_we;
  wire uart_interrupt;

  wire PSEL1;
  wire PWRITE;
  wire [31:0] PWDATA;
  wire [31:0] PRDATA;

  // AHB - RIB
  logic rib_hold_flag;

  // clock reset control
  logic control_clk_uart;

  // uart clock
  logic uart_clk;

  assign int_flag = {7'b0, uart_interrupt};

  // -------------------------------------------------------
  // program finish flag
  always_ff @ (posedge clk)
  begin
    if (nRst == `RstEnable)
    begin
      over <= 1'b1;
      succ <= 1'b1;
    end
    else
    begin
      over <= tinyriscv_core.u_regs.regs[26];  // when = 1, run over
      succ <= tinyriscv_core.u_regs.regs[27];  // when = 1, run succ, otherwise fail
    end
  end

  // change AHB HGRANT to rib_hold_flag
//   always_comb
//   begin
//     rib_hold_flag = m0_gnt | m1_gnt;
//   end

  // tinyriscv处理器核模块例化
  tinyriscv tinyriscv_core(
              .clk(clk),
              .rst(nRst),
              .rib_ex_addr_o(m0_addr),
              .rib_ex_data_i(m0_hrdata),
              .rib_ex_data_o(m0_hwdata),
              .rib_ex_req_o(m0_req),
              .rib_ex_we_o(m0_we),

              .rib_pc_addr_o(m1_addr),
              .rib_pc_data_i(m1_hrdata),

              .jtag_reg_addr_i(jtag_reg_addr_o),
              .jtag_reg_data_i(jtag_reg_data_o),
              .jtag_reg_we_i(jtag_reg_we_o),
              .jtag_reg_data_o(jtag_reg_data_i),

              .rib_hold_flag_i(rib_hold_flag),
              .jtag_halt_flag_i(jtag_halt_req_o),
              .jtag_reset_flag_i(jtag_reset_req_o),

              .int_i(int_flag)
            );

  AHB AHB1 (
        .clk, .rst(nRst),
        .m0_addr_i(m0_addr),
        .m0_hwdata_i(m0_hwdata),
        .m0_hrdata_o(m0_hrdata),
        .m0_req_i(m0_req),
        .m0_gnt_o(m0_gnt),
        .m0_we_i(m0_we),

        .m1_addr_i(m1_addr),
        .m1_hwdata_i(m1_hwdata),
        .m1_hrdata_o(m1_hrdata),
        .m1_req_i(m1_req),
        .m1_gnt_o(m1_gnt),
        .m1_we_i(m1_we),

        .s0_hsel_o(s0_hsel),
        .s0_addr_o(s0_addr),
        .s0_hwdata_o(s0_hwdata),
        .s0_hrdata_i(s0_hrdata),
        .s0_we_o(s0_we),

        .s1_hsel_o(s1_hsel),
        .s1_addr_o(s1_addr),
        .s1_hwdata_o(s1_hwdata),
        .s1_hrdata_i(s1_hrdata),
        .s1_we_o(s1_we),

        .s2_hsel_o(s2_hsel),
        .s2_addr_o(s2_addr),
        .s2_hwdata_o(s2_hwdata),
        .s2_hrdata_i(s2_hrdata),
        .s2_we_o(s2_we),

        .hold_flag_o(rib_hold_flag)
      );

  SRAM ram1(
         .HCLK(clk),
         .HRESETn(nRst),
         .HSEL(s0_hsel),
         .HWDATA(s0_hwdata),
         .HADDR(s0_addr),
         .HWRITE(s0_we),
         .HRDATA(s0_hrdata)
       );

  clk_control clk_control1(
                .clock(clk),
                .nRst,
                .HSEL(s1_hsel),
                .HADDR(s1_addr),
                .HWRITE(s1_we),
                .HWDATA(s1_hwdata),
                .HRDATA(s1_hrdata),
                .control_clk_uart
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

  uart uart1 (
         .clock(uart_clk),
         .nRst,
         .HSEL(s2_hsel),
         .HWRITE(s2_we),
         .HWDATA(s2_hwdata),
         .HADDR(s2_addr),
         .HRDATA(s2_hrdata),
         .interrupt(uart_interrupt),
         .TX(uart_tx_pin)
       );

endmodule
