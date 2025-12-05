#include "stm8s.h"
#include "stm8s_i2c.h"
#include "stm8s_gpio.h"
#include "stm8s_clk.h"
#include "lcd_i2c.h"
#include "delay.h"

// Warning: LCD1602 require +5V, you can take it from stlink2 pin +5V
// don't connect it to pin +5V on the dev board!

void clock_config_16MHz()
{
  CLK_DeInit();
  CLK_HSECmd(DISABLE);
  CLK_LSICmd(DISABLE);
  CLK_HSICmd(ENABLE);
  while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE)
    ;
  CLK_ClockSwitchCmd(ENABLE);
  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
  CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI,
                        DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);

  CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
}

void gpio_config()
{
  GPIO_DeInit(GPIOB);
  GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
  GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);

  GPIO_DeInit(GPIOD);
  GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
}

void i2c_config()
{
  int cpu_clock; // Clock speed in MHz

  cpu_clock = CLK_GetClockFreq() / 1000000; // Clock speed in MHz
  I2C_Init(100000, LCD_I2C_Address, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, cpu_clock);
}

void lcd_demo()
{
  lcd_init();
  lcd_clear();
  lcd_bl_on(); // Back light on
  lcd_set_cursor(0, 0);
  lcd_print_string("STM8 1602a TEST");
  lcd_set_cursor(1, 0);
  lcd_print_string("MHz:");
}

int main()
{
  uint32_t count;

  clock_config_16MHz();

  gpio_config();

  i2c_config();

  lcd_demo();

  count = CLK_GetClockFreq() / 1000000;
  lcd_set_cursor(1, 4);
  lcd_print_integer(count, 0);

  count = 0;

  while (1)
  {
    lcd_set_cursor(1, 7);
    lcd_print_integer(count, 0);
    count++;

    GPIO_WriteHigh(GPIOD, GPIO_PIN_3);
    delay_ms(500);
    GPIO_WriteLow(GPIOD, GPIO_PIN_3);
    delay_ms(500);
  }

  // return 0;
}
