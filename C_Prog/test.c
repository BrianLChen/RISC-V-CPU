#include <stdint.h>
#include <stdio.h>

// ���� UART �Ļ���ַ
#define UART_BASE_ADDR 0x4000d000

// UART �Ĵ���ƫ��
#define UART_TXDATA_OFFSET   0x00
#define UART_TXCTRL_OFFSET   0x08
#define UART_IE_OFFSET       0x10
#define UART_IP_OFFSET       0x14

// UART ���ƼĴ�����λ����
#define UART_TXEN           (1 << 0)  // ���÷���
#define UART_TXIE           (1 << 0)  // �����ж�ʹ��

// ���� UART �Ĵ���
#define UART_TXDATA   (*(volatile uint32_t *)(UART_BASE_ADDR + UART_TXDATA_OFFSET))
#define UART_TXCTRL   (*(volatile uint32_t *)(UART_BASE_ADDR + UART_TXCTRL_OFFSET))
#define UART_IE       (*(volatile uint32_t *)(UART_BASE_ADDR + UART_IE_OFFSET))
#define UART_IP       (*(volatile uint32_t *)(UART_BASE_ADDR + UART_IP_OFFSET))

// �ַ�������
const char message[] = "Hello world";
volatile uint32_t message_index = 0;  // ���͵�����

void uart_init() {
    // ���÷���
    UART_TXCTRL |= UART_TXEN;

    // ���÷����ж�
    UART_IE |= UART_TXIE;
}

void uart_send_char(char c) {
    // �����ַ�
    UART_TXDATA = (uint32_t)c;
}

void uart_isr() {
    // ����Ƿ��Ƿ����ж�
    if (UART_IP & UART_TXIE) {
        // ����жϱ�־
        UART_IP &= ~UART_TXIE;

        // ������һ���ַ�
        if (message[message_index] != '\0') {
            uart_send_char(message[message_index++]);
        } else {
            // ���������һ���ַ��󣬽��÷����ж�
            UART_IE &= ~UART_TXIE;
        }
    }
}

int main() {
    // ��ʼ�� UART
    uart_init();

    // ���͵�һ���ַ������������ж�
    uart_send_char(message[message_index++]);

    // ����ѭ���ȴ�
    while (1) {
        // ����͹���ģʽ��ȴ��ж�
        asm volatile ("wfi"); // �ȴ��ж�ָ��
    }

    return 0;
}
