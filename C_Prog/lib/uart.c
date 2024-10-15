#include <stdint.h>

#include "../include/uart.h"

// send one char to uart
void uart_putc(uint8_t c)
{
    while (UART0_REG(UART0_STATUS) & 0x1);
    UART0_REG(UART0_TX_DATA) = c;
}

// Block, get one char from uart.
// uint8_t uart_getc()
// {
//     UART0_REG(UART0_STATUS) &= ~0x2;
//     while (!(UART0_REG(UART0_STATUS) & 0x2));
//     return (UART0_REG(UART0_RXDATA) & 0xff);
// }

// 115200bps, 8 N 1
void uart_init()
{
    // enable tx and rx
    UART0_REG(UART0_CFG) |= (1 << 0);
}

void uart_deinit()
{
    UART0_REG(UART0_CFG) = 0x00000000;
}

void uart_set_baud_level(uint8_t baud_level)
{
    if (baud_level == 1)
    {
        while (UART0_REG(UART0_STATUS) & 0x1);
            UART0_REG(UART0_CFG) |= (1 << 1);
    }
    else
    {
        while (UART0_REG(UART0_STATUS) & 0x1);
        UART0_REG(UART0_CFG) &= ~(1 << 1);
    }
}


void uart_send()
{
    while (UART0_REG(UART0_STATUS) & 0x1);
    UART0_REG(UART0_INSTR) |= (1 << 0);
}

void uart_int_enable()
{
    while (UART0_REG(UART0_STATUS) & 0x1);
    UART0_REG(UART0_CFG) |= (1 << 2);
}

void uart_int_disable()
{
    while (UART0_REG(UART0_STATUS) & 0x1);
    UART0_REG(UART0_CFG) &= ~(1 << 2); 
}

void uart_int_clear()
{
    while (UART0_REG(UART0_STATUS) & 0x1);
    UART0_REG(UART0_INSTR) = 0x2;
}
