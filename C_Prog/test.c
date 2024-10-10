#include <stdint.h>
#include <stdio.h>

// 假设 UART 的基地址
#define UART_BASE_ADDR 0x4000d000

// UART 寄存器偏移
#define UART_TXDATA_OFFSET   0x00
#define UART_TXCTRL_OFFSET   0x08
#define UART_IE_OFFSET       0x10
#define UART_IP_OFFSET       0x14

// UART 控制寄存器的位定义
#define UART_TXEN           (1 << 0)  // 启用发送
#define UART_TXIE           (1 << 0)  // 发送中断使能

// 定义 UART 寄存器
#define UART_TXDATA   (*(volatile uint32_t *)(UART_BASE_ADDR + UART_TXDATA_OFFSET))
#define UART_TXCTRL   (*(volatile uint32_t *)(UART_BASE_ADDR + UART_TXCTRL_OFFSET))
#define UART_IE       (*(volatile uint32_t *)(UART_BASE_ADDR + UART_IE_OFFSET))
#define UART_IP       (*(volatile uint32_t *)(UART_BASE_ADDR + UART_IP_OFFSET))

// 字符串数据
const char message[] = "Hello world";
volatile uint32_t message_index = 0;  // 发送的索引

void uart_init() {
    // 启用发送
    UART_TXCTRL |= UART_TXEN;

    // 启用发送中断
    UART_IE |= UART_TXIE;
}

void uart_send_char(char c) {
    // 发送字符
    UART_TXDATA = (uint32_t)c;
}

void uart_isr() {
    // 检查是否是发送中断
    if (UART_IP & UART_TXIE) {
        // 清除中断标志
        UART_IP &= ~UART_TXIE;

        // 发送下一个字符
        if (message[message_index] != '\0') {
            uart_send_char(message[message_index++]);
        } else {
            // 发送完最后一个字符后，禁用发送中断
            UART_IE &= ~UART_TXIE;
        }
    }
}

int main() {
    // 初始化 UART
    uart_init();

    // 发送第一个字符来触发发送中断
    uart_send_char(message[message_index++]);

    // 进入循环等待
    while (1) {
        // 进入低功耗模式或等待中断
        asm volatile ("wfi"); // 等待中断指令
    }

    return 0;
}
