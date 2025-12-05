#include "stm8s.h"
#include "stm8s_gpio.h"
#include "stm8s_clk.h"
#include "ws2812.h"
#include "delay.h"
#include "random.h"

// connect led strip pin to C6

extern void get_color (uint8_t i_index, RGB* o_color);
extern void set_color (uint8_t i_index, RGB* i_color);

void shift_all_to_left();
void rainbow_hills();
uint8_t get_pixel_number(uint8_t x, uint8_t y);

void clock_config()
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
}

void gpio_config()
{
  GPIO_DeInit(GPIOC);
  GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST); // MOSI
  GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST); // CLK
}

void spi_config()
{
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);

  SPI_DeInit();
  SPI_Init(SPI_FIRSTBIT_MSB,
           SPI_BAUDRATEPRESCALER_2,
           SPI_MODE_MASTER,
           SPI_CLOCKPOLARITY_LOW,
           SPI_CLOCKPHASE_1EDGE,
           SPI_DATADIRECTION_2LINES_FULLDUPLEX,
           SPI_NSS_SOFT, 0);

  SPI_Cmd(ENABLE);
  SPI_BiDirectionalLineConfig(SPI_DIRECTION_TX);
}

void leds_demo()
{
  rainbow_hills();
  WS2812_send_led_rgb_array();
}

void rainbow_hills()
{
  static uint8_t column = 0;
  static uint8_t target_level = 2;
  static uint8_t current_level = 0;
  static RGB color;

  target_level = random(2, HEIGHT - 1);

  if (column == WIDTH)
  {
    // shift everything to the left
    shift_all_to_left();
    column = WIDTH - 1;
  }

  if (current_level < target_level)
  {
    hsv_to_rgb(&color, random(1, 255), 100, 100);
    set_color(get_pixel_number(column, current_level), &color);
    current_level++;
  }
  else
  {
    current_level = 0;
    target_level = random(1, HEIGHT - 1);
    column++;
  }
}

void shift_all_to_left()
{
  static uint8_t idx_d, idx_t;
  volatile static RGB color;

  for (uint8_t y = 0; y < HEIGHT; y++)
  {
    for (uint8_t x = 1; x < WIDTH; x++)
    {
      idx_d = get_pixel_number(x - 1, y);
      idx_t = get_pixel_number(x, y);

      get_color(idx_t, &color);
      set_color(idx_d, &color);

      if ((x + 1) == WIDTH)
      {
        color.b = 0;
        color.r = 0;
        color.g = 0;
        set_color(get_pixel_number(x, y), &color);
      }
    }
  }
}

uint8_t get_pixel_number(uint8_t x, uint8_t y)
{
  return(y * WIDTH + x);
}

int main()
{
  clock_config();
  gpio_config();
  spi_config();
  delay_ms(50);

  init_rand(1077); // todo: read pins ADC

  WS2812_plain_color_fill(40, 40, 40);
  delay_ms(500);

  while (1)
  {
    leds_demo();

    __asm nop __endasm;

    delay_ms(250);
  }

  // return 0;
}
