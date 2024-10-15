#ifndef _UART_H_
#define _UART_H_

#define UART0_BASE      (0x4000d000)
#define UART0_CFG      (UART0_BASE + (0x00))
#define UART0_TX_DATA    (UART0_BASE + (0x04))
#define UART0_INSTR      (UART0_BASE + (0x08))
#define UART0_STATUS    (UART0_BASE + (0x0c))

#define UART0_REG(addr) (*((volatile uint32_t *)addr))

void uart_init(); // cfg config register
void uart_deinit(); // deinit uart
void uart_set_baud_level(uint8_t baud_level); // set baud rate 0-9600 1-115200
void uart_putc(uint8_t c); // put char into tx data reg
void uart_send();
// uint8_t uart_getc();

void uart_int_enable(); // enable interrupt
void uart_int_clear(); // clear interrupt flag

#endif
