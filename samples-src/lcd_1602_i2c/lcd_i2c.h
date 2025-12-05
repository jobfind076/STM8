#include "stm8s.h"

#define LCD_I2C_Address (0x27 << 1)

void lcd_init(void);
void lcd_clear(void);
void lcd_set_cursor(uint8_t row, uint8_t col);
void lcd_print_char(char data);
void lcd_print_string(char *a);
void lcd_print_integer(long a, uint8_t print_lead_zero);
void lcd_bl_on(void);  // Back light on
void lcd_bl_off(void); // Back light off
