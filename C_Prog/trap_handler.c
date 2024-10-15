#include <stdint.h>


extern void uart0_irq_handler() __attribute__((weak));


void trap_handler(uint32_t mcause, uint32_t mepc)
{
    // we have only timer0 interrupt here
    uart0_irq_handler();
}
