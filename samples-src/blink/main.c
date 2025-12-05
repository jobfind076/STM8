#include "stm8s.h"
#include "stm8s_gpio.h"
#include "stm8s_clk.h"
#include "delay.h"

// led diode on the pin D3

void clock_config()
{
  // Clock configuration (example for STM8S103F3P6)
  CLK_HSICmd(ENABLE);
  while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET)
    ;
  CLK_SYSCLKConfig(CLK_SOURCE_HSI);
  CLK->CKDIVR = 0x0;
}

int main()
{
  clock_config();

  GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);

  while (1)
  {
    GPIO_WriteHigh(GPIOD, GPIO_PIN_3);
    delay_ms(500);
    GPIO_WriteLow(GPIOD, GPIO_PIN_3);
    delay_ms(500);
  }

  //return 0;
}
