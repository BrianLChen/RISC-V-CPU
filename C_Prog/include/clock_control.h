#ifndef _CLOCK_CONTROL_H_
#define _CLOCK_CONTROL_H_

#define CLOCK_CONTROL_BASE      (0x40002000)
#define CLOCK_CONTROL_CFG      (CLOCK_CONTROL_BASE + (0x00))

#define CLOCK_CONTROL_REG(addr) (*((volatile uint32_t *)addr))

void clock_control_uart_clock_enable();

#endif
