#include <stdint.h>

#include "../include/uart.h"
#include "../include/letters.h"
#include "../include/clock_control.h"
#include "../include/utils.h"

uint8_t wait;

int main()
{
    wait = 0;
    // uart_init();
    // clock_control_uart_clock_enable();
    CLOCK_CONTROL_REG(CLOCK_CONTROL_CFG) = 0x1;
    UART0_REG(UART0_CFG) = 0x5;

    UART0_REG(UART0_TX_DATA) = ASCII_h;
    UART0_REG(UART0_INSTR) = 0X01;

    while (wait == 0)
    {
    }
    wait = 0;

    UART0_REG(UART0_TX_DATA) = ASCII_e;
    UART0_REG(UART0_INSTR) = 0X01;

    while (wait == 0)
    {
    }
    wait = 0;

    UART0_REG(UART0_TX_DATA) = ASCII_l;
    UART0_REG(UART0_INSTR) = 0X01;

    while (wait == 0)
    {
    }
    wait = 0;

    UART0_REG(UART0_TX_DATA) = ASCII_l;
    UART0_REG(UART0_INSTR) = 0X01;

    while (wait == 0)
    {
    }
    wait = 0;

    UART0_REG(UART0_TX_DATA) = ASCII_o;
    UART0_REG(UART0_INSTR) = 0X01;

    while (wait == 0)
    {
    }
    wait = 0;

    UART0_REG(UART0_TX_DATA) = ASCII_SPACE;
    UART0_REG(UART0_INSTR) = 0X01;

    while (wait == 0)
    {
    }
    wait = 0;

    UART0_REG(UART0_TX_DATA) = ASCII_w;
    UART0_REG(UART0_INSTR) = 0X01;

    while (wait == 0)
    {
    }
    wait = 0;

    UART0_REG(UART0_TX_DATA) = ASCII_o;
    UART0_REG(UART0_INSTR) = 0X01;

    while (wait == 0)
    {
    }
    wait = 0;

    UART0_REG(UART0_TX_DATA) = ASCII_r;
    UART0_REG(UART0_INSTR) = 0X01;

    while (wait == 0)
    {
    }
    wait = 0;

    UART0_REG(UART0_TX_DATA) = ASCII_l;
    UART0_REG(UART0_INSTR) = 0X01;

    while (wait == 0)
    {
    }
    wait = 0;

    UART0_REG(UART0_TX_DATA) = ASCII_d;
    UART0_REG(UART0_INSTR) = 0X01;

    while (1)
    {
    };
}

void uart0_irq_handler()
{
    // uart_int_clear();
    UART0_REG(UART0_INSTR) = 0x02;
    wait = 1;
}
