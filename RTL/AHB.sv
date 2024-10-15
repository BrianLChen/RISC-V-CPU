`include "defines.v"
module AHB (
    input wire clk,
    input wire rst,

    // master 0 interface cpu
    input wire [`MemAddrBus] m0_addr_i,     // ���豸0����д��ַ
    input wire [`MemBus] m0_hwdata_i,         // ���豸0д����
    output logic [`MemBus] m0_hrdata_o,         // ���豸0��ȡ��������
    input wire m0_req_i,                   // ���豸0���������־
    output logic m0_gnt_o, // Mater 0 get the bus
    input wire m0_we_i,                    // ���豸0д��־

    // master 1 interface cpu instruction
    input wire[`MemAddrBus] m1_addr_i,     // ���豸1����д��ַ
    input wire[`MemBus] m1_hwdata_i,         // ���豸1д����
    output reg[`MemBus] m1_hrdata_o,         // ���豸1��ȡ��������
    input wire m1_req_i,                   // ���豸1���������־
    output logic m1_gnt_o, // Mater 0 get the bus
    input wire m1_we_i,                    // ���豸1д��־

    // slave 0 interface SRAM
    output logic s0_hsel_o,
    output logic [`MemAddrBus] s0_addr_o,     // ���豸0����д��ַ
    output logic [`MemBus] s0_hwdata_o,         // ���豸0д����
    input wire [`MemBus] s0_hrdata_i,         // ���豸0��ȡ��������
    output logic s0_we_o,                    // ���豸0д��־

    // slave 1 interface reset clock control
    output logic s1_hsel_o,
    output logic [`MemAddrBus] s1_addr_o,     // ���豸1����д��ַ
    output logic [`MemBus] s1_hwdata_o,         // ���豸1д����
    input wire [`MemBus] s1_hrdata_i,         // ���豸1��ȡ��������
    output logic s1_we_o,                    // ���豸1д��־

    // slave 2 interface APB BUS
    output logic s2_hsel_o,
    output logic [`MemAddrBus] s2_addr_o,     // ���豸2����д��ַ
    output logic [`MemBus] s2_hwdata_o,         // ���豸2д����
    input wire [`MemBus] s2_hrdata_i,         // ���豸2��ȡ��������
    output logic s2_we_o,                    // ���豸2д��־

    output logic hold_flag_o                 // ��ͣ��ˮ�߱�־
  );

  // address of the slave MSB 20-bit
  parameter [19:0] SRAM_addr = 20'h00000;
  parameter [19:0] clock_control_addr = 20'h40002;
  parameter [19:0] uart_addr = 20'h4000d;

  enum {grant0, grant1, grant2, grant3} grant;

  // arbiter
  always_comb
  begin
    if(m0_req_i)
    begin
      grant = grant0;
      hold_flag_o = `HoldEnable;
    end
    else
    begin
      grant = grant1;
      hold_flag_o = `HoldDisable;
    end
  end

  always_comb
  begin
    m0_hrdata_o = `ZeroWord;
    m0_gnt_o = 0;

    m1_hrdata_o = `INST_NOP;
    m1_gnt_o = 0;

    s0_addr_o = `ZeroWord;
    s1_addr_o = `ZeroWord;
    s2_addr_o = `ZeroWord;

    s0_we_o = `WriteDisable;
    s1_we_o = `WriteDisable;
    s2_we_o = `WriteDisable;

    s0_hsel_o = 0;
    s1_hsel_o = 0;
    s2_hsel_o = 0;

    case (grant)
      grant0:
      begin
        m0_gnt_o = 1;
        if(m0_addr_i < 32'h40002000)
        begin
          s0_hsel_o = 1'b1;
          s0_we_o = m0_we_i;
          s0_addr_o = m0_addr_i;
          s0_hwdata_o = m0_hwdata_i;
          m0_hrdata_o = s0_hrdata_i;
        end
        else if(m0_addr_i >= 32'h40002000 && m0_addr_i < 32'h4000d000)
        begin
          s1_hsel_o = 1'b1;
          s1_we_o = m0_we_i;
          s1_addr_o = m0_addr_i;
          s1_hwdata_o = m0_hwdata_i;
          m0_hrdata_o = s1_hrdata_i;
        end
        else if(m0_addr_i >= 32'h4000d000)
        begin
          s2_hsel_o = 1'b1;
          s2_we_o = m0_we_i;
          s2_addr_o = m0_addr_i;
          s2_hwdata_o = m0_hwdata_i;
          m0_hrdata_o = s2_hrdata_i;
        end
        else
        begin // default connected to high impedance
          s0_we_o = '0;
          s0_addr_o = 'z;
          s0_hwdata_o = 'z;
          m0_hrdata_o = 'z;
          s0_hsel_o = 0;
          s1_hsel_o = 0;
          s2_hsel_o = 0;
        end
      end
      grant1:
      begin
        m1_gnt_o = 1;
        if(m0_addr_i < 32'h40002000)
        begin
          s0_hsel_o = 1'b1;
          s0_we_o = m1_we_i;
          s0_addr_o = m1_addr_i;
          s0_hwdata_o = m1_hwdata_i;
          m1_hrdata_o = s0_hrdata_i;
        end
        else if(m0_addr_i >= 32'h40002000 && m0_addr_i < 32'h4000d000)
        begin
          s1_hsel_o = 1'b1;
          s1_we_o = m1_we_i;
          s1_addr_o = m1_addr_i;
          s1_hwdata_o = m1_hwdata_i;
          m1_hrdata_o = s1_hrdata_i;
        end
        else if(m0_addr_i >= 32'h4000d000)
        begin
          s2_hsel_o = 1'b1;
          s2_we_o = m1_we_i;
          s2_addr_o = m1_addr_i;
          s2_hwdata_o = m1_hwdata_i;
          m1_hrdata_o = s2_hrdata_i;
        end
        else
        begin // default connected to high impedance
          s0_hsel_o = 0;
          s1_hsel_o = 0;
          s2_hsel_o = 0;

          s0_we_o = '0;
          s0_addr_o = 'z;
          s0_hwdata_o = 'z;
          m1_hrdata_o = 'z;
        end
      end
    endcase
  end
endmodule
