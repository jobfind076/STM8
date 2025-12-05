#include "lcd_i2c.h"
#include "stm8s_i2c.h"
#include "delay.h"

static uint8_t g_pcf_status; // Current status of all 8 pins of PCF7584

void lcd_PCF7584_write8(u8 iData) // Write all 8 pins of PCF7584
{
  I2C_GenerateSTART(ENABLE);
  while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
    ;

  I2C_Send7bitAddress(LCD_I2C_Address, I2C_DIRECTION_TX);
  while (!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
    ;

  I2C_SendData(iData);
  while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
    ;

  I2C_GenerateSTOP(ENABLE);
  g_pcf_status = iData;
}

void lcd_PCF7584_write(uint8_t pin, uint8_t value) // Write selected pin of PCF7584
{
  if (value == 0)
  {
    g_pcf_status &= ~(1 << pin); // Set the pin value 0 or 1
  }
  else
  {
    g_pcf_status |= (1 << pin); // Set the pin value 0 or 1
  }

  lcd_PCF7584_write8(g_pcf_status);
}

void lcd_set_bit(char data_bit) // Based on the Hex value Set the Bits of the Data Lines
{
  if (data_bit & 1)
    lcd_PCF7584_write(4, 1); // D4 = 1
  else
    lcd_PCF7584_write(4, 0); // D4 = 0

  if (data_bit & 2)
    lcd_PCF7584_write(5, 1); // D5 = 1
  else
    lcd_PCF7584_write(5, 0); // D5 = 0

  if (data_bit & 4)
    lcd_PCF7584_write(6, 1); // D6 = 1
  else
    lcd_PCF7584_write(6, 0); // D6 = 0

  if (data_bit & 8)
    lcd_PCF7584_write(7, 1); // D7 = 1
  else
    lcd_PCF7584_write(7, 0); // D7 = 0
}

void lcd_cmd(char a)
{
  lcd_PCF7584_write(0, 0); // RS = 0
  lcd_set_bit(a);          // Incoming Hex value
  lcd_PCF7584_write(2, 1); // EN  = 1
  delay_ms(2);
  lcd_PCF7584_write(2, 0); // EN  = 0
}

void lcd_init(void)
{
  delay_ms(10);
  lcd_PCF7584_write8(0b00000000);
  lcd_set_bit(0x00);
  delay_ms(1000);
  lcd_cmd(0x03);
  delay_ms(5);
  lcd_cmd(0x03);
  delay_ms(11);
  lcd_cmd(0x03);
  lcd_cmd(0x02); // 02H is used for Return home -> Clears the RAM and initializes the LCD
  lcd_cmd(0x02); // 02H is used for Return home -> Clears the RAM and initializes the LCD
  lcd_cmd(0x08); // Select Row 1
  lcd_cmd(0x00); // Clear Row 1 Display
  lcd_cmd(0x0C); // Select Row 2
  lcd_cmd(0x00); // Clear Row 2 Display
  lcd_cmd(0x06);
}

void lcd_clear(void)
{
  lcd_cmd(0); // Clear the LCD
  lcd_cmd(1); // Move the curser to first position
}

void lcd_set_cursor(uint8_t row, uint8_t col)
{
  char temp, z, y;
  if (row == 0)
  {
    temp = 0x80 + col;     // 80H is used to move the curser
    z = temp >> 4;       // Lower 8-bits
    y = temp & 0x0F;     // Upper 8-bits
    lcd_cmd(z);          // Set Row
    lcd_cmd(y);          // Set Column
  }
  else if (row == 1)
  {
    temp = 0xC0 + col;
    z = temp >> 4;   // Lower 8-bits
    y = temp & 0x0F; // Upper 8-bits
    lcd_cmd(z);      // Set Row
    lcd_cmd(y);      // Set Column
  }
}

void lcd_print_char(char data) // Send 8-bits through 4-bit mode
{
  char lower_nibble, upper_nibble;
  lower_nibble = data & 0x0F;
  upper_nibble = data & 0xF0;
  lcd_PCF7584_write(0, 1); // => RS = 1

  lcd_set_bit(upper_nibble >> 4); // Send upper half by shifting by 4
  lcd_PCF7584_write(2, 1);        // EN = 1
  delay_ms(5);
  lcd_PCF7584_write(2, 0); // EN = 0

  lcd_set_bit(lower_nibble); // Send Lower half
  lcd_PCF7584_write(2, 1);   // EN = 1
  delay_ms(5);
  lcd_PCF7584_write(2, 0); // EN = 0
}

void lcd_print_string(char *a)
{
  uint8_t i = 0;

  while (a[i] != '\0')
  {
    lcd_print_char(a[i++]); // Split the string using pointers and call the Char function
  }
}

void lcd_print_integer(long a, uint8_t print_lead_zero)
{
  uint8_t d;
  long m = 1000000000;

  while (m)
  {
    if (m < 10)
    {
      d = a % 10;
      m = 0;
    }
    else
    {
      d = (a / m) % 10;

      if (d > 0)
        print_lead_zero = 1;
    }

    if (print_lead_zero)
    {
      lcd_print_char(d + 48);
    }
    else if (d > 0)
    {
      lcd_print_char(d + 48);
    }

    m = m / 10;
  }
}

void lcd_bl_on(void) // Back light on
{
  lcd_PCF7584_write(3, 1);
}

void lcd_bl_off(void) // Back light off
{
  lcd_PCF7584_write(3, 0);
}
