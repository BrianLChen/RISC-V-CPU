#include <stdint.h>
#include "../include/clock_control.h"

void clock_control_uart_clock_enable()
{
    CLOCK_CONTROL_REG(CLOCK_CONTROL_CFG) |= (1 << 0);
}